
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// states.v
// Converts IMU sample readings into state measurements.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module states
  (
  input  clk,
  input  rst,
  input  tmr_1khz,
  input  imu_miso,
  output imu_mosi,
  output imu_sclk,
  output imu_ss,
  output [7:0] debug_byte
  //output [47:0] acc,
  //output [47:0] gyr
  //output [47:0] mag
  );

  // Assign busy flags
  wire busy;
  assign busy = busy_set || busy_get;  // && busy_read;

  // Assign SPI outputs
  assign imu_mosi = mosi_set || mosi_get;  // || mosi_read;
  assign imu_sclk = sclk_set && sclk_get;  // && sclk_read;
  assign imu_ss = !busy;
  //assign imu_ss = ( !busy_set ) && ( !busy_get );  // && ( !busy_read );

  // Assign sensor data outputs
  assign debug_byte = debug_byte_q;
  //assign acc = acc_q;
  //assign gyr = gyr_q;
  //assign mag = mag_q;




  // The magnetometer is NOT configured.  Here are the future steps:
  // setup_compass
  // setbypass (user_ctrl int_pin_cfg)
  // find compass
  //   akm_addr 0x0C - 0x0F
  //   AKM_REG_WHOAMI 0x00
  //   becomes 'compass_addr'
  // W: AKM_REG_CNTL => AKM_POWER_DOWN
  // W: AKM_REG_CNTL => AKM_FUSE_ROM_ACCESS
  // Sensitivity adjustment
  //   R: AKM_REG_ASAX 3 bytes
  //   Correction applied to 'mag_sens_adj'
  // W: AKM_REG_CNTL => AKM_POWER_DOWN
  // mpu_set_bypass(0)
  // W: i2c_mst 0x40
  // W: s0_addr BIT_I2C_READ | compass_addr
  // W: s0_reg AKM_REG_ST1
  // W: s0_ctrl BIT_SLAVE_EN | 8
  // W: s1_addr compass_addr
  // W: s1_reg AKM_REG_CNTL
  // W: s1_ctrl BIT_SLAVE_EN | 1
  // W: s1_do AKM_SINGLE_MEASUREMENT
  // W: i2c_delay_ctrl 0x03
  // compass sample rate  s4_ctrl 0x????


  // REGISTER SHEET NOTES:
  // X 0x00 - 0x0F SELF_TEST_(X/Y/Z)_(GYRO/ACCEL)
  // X 0x13 - 0x18 (X/Y/Z)G_OFFSET_(H/L)
  // - 0x19 SMPLRT_DIV
  // - 0x1A CONFIG
  // - 0x1B GYRO_CONFIG
  // - 0x1C ACCEL_CONFIG
  // - 0x1D ACCEL_CONFIG_2
  // X 0x1E LP_ACCEL_ODR
  // X 0x1F WOM_THR
  // X 0x23 FIFO_EN
  // X 0x24 - 0x34 I2C_SLV#
  // X 0x37 INT_PIN_CFG
  // - 0x38 INT_ENABLE
  // X 0x63 - 0x66 I2C_SLV#
  // X 0x67 I2C_MST_DELAY_CTRL
  // X 0x68 SIGNAL_PATH_RESET
  // X 0x69 MOT_DETECT_CTRL (Acc Int Ctrl)
  // - 0x6A USER_CTRL (set SPI mode)
  // - 0x6B PWR_MGMT_1
  // - 0x6C PWR_MGMT_2
  // X 0x74 FIFO_R_W
  // X 0x77 - 0x7E (X/Y/Z)A_OFFSET_(H/L)




  // IMU sensor states
  localparam
    IMU_BITS  = 2,
    // Loop commands
    IMU_INIT  = 2'd0,
    IMU_IDLE  = 2'd1;
    //IMU_ACC   = 2'd2,
    //IMU_GYR   = 2'd3;
    //IMU_MAG    = 2'd3;




  // Bits for counters
  localparam WAIT_BITS = 24;  // 24 bits => 336 msec delay
  localparam HOLD_BITS = 10;  // 10 bits =>  20 usec delay


  // Declare registers
  reg [IMU_BITS-1:0] state_imu_d, state_imu_q = IMU_INIT;
  reg [7:0] addr_d, addr_q;
  reg [7:0] set_d, set_q;
  reg [7:0] get_d, get_q;
  reg start_set_d, start_set_q = 1'b0;
  reg start_get_d, start_get_q = 1'b0;
  reg finish_set_d, finish_set_q = 1'b0;
  reg finish_get_d, finish_get_q = 1'b0;
  reg [4:0] loop_ctr_d, loop_ctr_q = 5'b0;
  reg [WAIT_BITS-1:0] wait_d, wait_q = { WAIT_BITS {1'b0} };
  reg [HOLD_BITS-1:0] hold_d, hold_q = { HOLD_BITS {1'b0} };
  reg [7:0] debug_byte_d, debug_byte_q = 8'b0;
  //reg [47:0] acc_d, acc_q = 48'b0;
  //reg [47:0] gyr_d, gyr_q = 48'b0;
  //reg [47:0] mag_d, mag_q = 48'b0;



  // Connect 'spi_mpu_set' module for IMU
  wire sclk_set;
  wire busy_set;
  wire finish_set;
  wire mosi_set;
  spi_mpu_set #(
    .CLK_DIV(4),
    .HOLD_BITS(0) )
    spi_mpu_set (
    .clk(clk),
    .rst(rst),
    .start(start_set_q),
    .miso(imu_miso),
    .addr(addr_q),
    .set(set_q),
    .sclk(sclk_set),
    .busy(busy_set),
    .finish(finish_set),
    .mosi(mosi_set) );

  // Connect 'spi_mpu_get' module for IMU
  wire sclk_get;
  wire busy_get;
  wire finish_get;
  wire mosi_get;
  wire [7:0] get;
  spi_mpu_get #(
    .CLK_DIV(4),
    .HOLD_BITS(0) )
    spi_mpu_get (
    .clk(clk),
    .rst(rst),
    .start(start_get_q),
    .miso(imu_miso),
    .addr(addr_q),
    .sclk(sclk_get),
    .busy(busy_get),
    .finish(finish_get),
    .mosi(mosi_get),
    .get(get) );

/*  // Connect 'spi_mpu_read' module for IMU
  wire sclk_read;
  wire busy_read;
  wire finish_read;
  wire mosi_read;
  wire [47:0] data_read;
  spi_mpu_read #(
    .CLK_DIV(4),
    .HOLD_BITS(16) )
    spi_mpu_read (
    .clk(clk),
    .rst(rst),
    .start(start_read_q),
    .miso(imu_miso),
    .addr(addr_q),
    .sclk(sclk_read),
    .busy(busy_read),
    .finish(finish_read),
    .mosi(mosi_read),
    .data(data_read) );
*/


  // Combinational logic
  always @(*) begin

    // Initial assignments
    state_imu_d   = state_imu_q;
    addr_d        = addr_q;
    set_d         = set_q;
    get_d         = get;
    start_set_d   = 1'b0;
    start_get_d   = 1'b0;
    finish_set_d  = finish_set;
    finish_get_d  = finish_get;
    loop_ctr_d    = loop_ctr_q;
    wait_d        = wait_q;
    hold_d        = hold_q;
    debug_byte_d  = debug_byte_q;
    //acc_d         = acc_q;
    //gyr_d         = gyr_q;
    //mag_d         = mag_q;


    // Begin 'imu' state machine
    case (state_imu_q)

      // Initialize IMU 
      IMU_INIT : begin

        /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        // 00: Wait
        // 01: 0x6B 0x80: "Reset"
        // 02: Wait
        // 03: 0x6B 0x00: "Wake Up"
        // 04: Wait
        // 05: 0x6C 0x00: "Disable"
        // 06: Wait
        // 07: 0x19 0x00: "Sample Rate"
        // 08: Hold
        // 09: 0x1A 0x01: "Low Pass Filter"
        // 10: Hold
        // 11: 0x1B 0x000_??_000: "Rate Gyro"
        // 12: Hold
        // 13: 0x1C 0x000_??_000: "Accelerometer"
        // 14: Hold
        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        // ??: 0x1D 0x??: "XXXX"
        // ??: 0x23 0x00: "FIFO Enable"
        // ??: 0x24 0x0D: "I2C Master Control"
        // ??: 0x38 0x00: "Interrupt Enable"
        // ??: 0x6A 0x??: "User Control"
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

        // 00: Wait
        if ( loop_ctr_q == 5'd0 ) begin
          wait_d = wait_q + 1'b1;
          if ( wait_q == { WAIT_BITS {1'b1} } ) begin
            wait_d = { WAIT_BITS {1'b0} };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 01: 0x6B 0x80: "Reset"
        else if ( loop_ctr_q == 5'd1 ) begin
          if (!busy) begin
            addr_d = 8'h6B;
            set_d = 8'h80;
            start_set_d = 1'b1;
          end
          if ( finish_set_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 02: Wait
        else if ( loop_ctr_q == 5'd2 ) begin
          wait_d = wait_q + 1'b1;
          if ( wait_q == { WAIT_BITS {1'b1} } ) begin
            wait_d = { WAIT_BITS {1'b0} };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 03: 0x6B 0x00: "Wake Up"
        else if ( loop_ctr_q == 5'd3 ) begin
          if (!busy) begin
            addr_d = 8'h6B;
            set_d = 8'h08;  //00;
            start_set_d = 1'b1;
          end
          if ( finish_set_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 04: Wait
        else if ( loop_ctr_q == 5'd4 ) begin
          wait_d = wait_q + 1'b1;
          if ( wait_q == { WAIT_BITS {1'b1} } ) begin
            wait_d = { WAIT_BITS {1'b0} };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 05: 0x6C 0x00: "Disable"
        // [7:6] reserved; [5:3] disable ACC; [2:0] disable GYR
        else if ( loop_ctr_q == 5'd5 ) begin
          if (!busy) begin
            addr_d = 8'h6C;
            set_d = 8'h07; //00;
            start_set_d = 1'b1;
          end
          if ( finish_set_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 06: Hold
        else if ( loop_ctr_q == 5'd6 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 07: 0x19 0x00: "Sample Rate"
        // Rate = 1000 / ( 1 + 8'divider )
        else if ( loop_ctr_q == 5'd7 ) begin
          if (!busy) begin
            addr_d = 8'h19;
            set_d = 8'h55; //00;
            start_set_d = 1'b1;
          end
          if ( finish_set_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 08: Hold
        else if ( loop_ctr_q == 5'd8 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 09: 0x1A 0x01: "Low Pass Filter"
        else if ( loop_ctr_q == 5'd9 ) begin
          if (!busy) begin
            addr_d = 8'h1A;
            set_d = 8'h01;
            start_set_d = 1'b1;
          end
          if ( finish_set_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 10: Hold
        else if ( loop_ctr_q == 5'd10 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 11: 0x1B 0x000_??_000: "Rate Gyro"
        // 00: 250dps; 01: 500dps; 10: 1000dps; 11: 2000dps
        else if ( loop_ctr_q == 5'd11 ) begin
          if (!busy) begin
            addr_d = 8'h1B;
            set_d = 8'b000_10_000;
            start_set_d = 1'b1;
          end
          if ( finish_set_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 12: Hold
        else if ( loop_ctr_q == 5'd12 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 13: 0x1C 0x000_??_000: "Accelerometer"
        // 00: 2g; 01: 4g; 10: 8g; 11: 16g
        else if ( loop_ctr_q == 5'd13 ) begin
          if (!busy) begin
            addr_d = 8'h1C;
            set_d = 8'b000_11_000;
            start_set_d = 1'b1;
          end
          if ( finish_set_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // 14: Hold
        else if ( loop_ctr_q == 5'd14 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Get command
        // 8'h75 | 8'h80;  // WhoAmI
        // 8'h19 | 8'h80;  // Sample
        // 8'h1A | 8'h80;  // LPF
        // 8'h1B | 8'h80;  // GYR
        // 8'h1C | 8'h80;  // ACC
        else if ( loop_ctr_q == 5'd15 ) begin
          if (!busy) begin
            addr_d = 8'h1A | 8'h80;
            start_get_d = 1'b1;
          end
          if ( finish_get_q ) begin
            debug_byte_d = get_q;
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Debug Hold
        else if ( loop_ctr_q == 5'd16 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Final pass: Clean up
        else begin
          state_imu_d = IMU_IDLE;
        end

      end

      // Wait for next timing signal
      IMU_IDLE : begin
        if ( tmr_1khz ) begin
          //state_imu_d = IMU_ACC;
          state_imu_d = IMU_IDLE;
        end
      end

      // Specify default condition
      default : begin
        state_imu_d = IMU_INIT;
      end

    // End 'imu' state machine
    endcase

  end


  // Synchronous 'clk' logic
  always @( posedge clk ) begin

    if (rst) begin
      state_imu_q <= IMU_INIT;
      wait_q      <= { WAIT_BITS {1'b0} };
      hold_q      <= { HOLD_BITS {1'b0} };
    end else begin
      state_imu_q <= state_imu_d;
      wait_q      <= wait_d;
      hold_q      <= hold_d;
    end

    addr_q        <= addr_d;
    set_q         <= set_d;
    get_q         <= get_d;
    start_set_q   <= start_set_d;
    start_get_q   <= start_get_d;
    finish_set_q  <= finish_set_d;
    finish_get_q  <= finish_get_d;
    loop_ctr_q    <= loop_ctr_d;
    debug_byte_q  <= debug_byte_d;
    //acc_q         <= acc_d;
    //gyr_q         <= gyr_d;
    //mag_q         <= mag_d;

  end

endmodule




//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  READ SENSOR DATA

/*      // Read accelerometer data 
      IMU_ACC : begin
        if ( !busy_read ) begin
          addr_d = 8'b1_011_1011;  // R3B
          acc_d = 48'b0;
          start_read_d = 1'b1;
        end
        if ( finish_read_q ) begin
          acc_d = data_read_q;
          state_imu_d = IMU_GYR;
        end
      end
*/
/*      // Read rate gyro data 
      IMU_GYR : begin
        if ( !busy_read ) begin
          addr_d = 8'b1_100_0011;  // R43
          gyr_d = 48'b0;
          start_read_d = 1'b1;
        end
        if ( finish_read_q ) begin
          gyr_d = data_read_q;
          state_imu_d = IMU_IDLE;
        end
      end
*/
/*      // Read accelerometer data 
      IMU_ACC : begin

        // First pass: Send ACC register address
        if ( loop_ctr_q == 5'b0 ) begin
          if (!busy) begin
            addr_d = 8'b1_011_1011;  // R3B
            acc_d = 48'b0;
            hold_d = { HOLD_BITS {1'b0} };
            start_get_d = 1'b1;
          end
          if ( finish_get_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Last pass: Clean up
        else if ( loop_ctr_q == 5'b11111 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = 5'b0;
            state_imu_d = IMU_DEBUG;  // IMU_READ_GYR;
          end
        end

        // Otherwise: Loop through 6 data bytes
        else begin
          if (!busy) begin
            addr_d = 8'hFF;
            start_get_d = 1'b1;
          end
          if ( finish_get_q ) begin
            acc_d = { acc_q[39:0], data_get_q };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

      end
*/
      // Read debugging data 
//      IMU_DEBUG : begin

/*        // First pass: Send register address
        // 8'b1_111_0101;  // R75 WhoAmI
        if ( loop_ctr_q == 5'b0 ) begin
          if (!busy) begin
            addr_d = 8'b1_001_1100;  // 1C  AccelConfig
            debug_byte_d = 8'b0;
            hold_d = { HOLD_BITS {1'b0} };
            start_get_d = 1'b1;
          end
          if ( finish_get_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Last pass: Clean up
        else if ( loop_ctr_q == 5'd2 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = 5'b0;
            state_imu_d = IMU_IDLE;
            //state_imu_d = IMU_READ_GYR;
          end
        end

        // Otherwise: Loop through debug data byte
        else begin
          if (!busy) begin
            addr_d = 8'hFF;
            start_get_d = 1'b1;
          end
          if ( finish_get_q ) begin
            debug_byte_d = data_get_q;
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end
*/
//            state_imu_d = IMU_IDLE;
//      end

/*    // Read rate gyro data 
      IMU_READ_GYR : begin

        // First pass: Send GYR register address
        if ( loop_ctr_q == 5'b0 ) begin
          if (!busy) begin
            addr_d = 8'b1_100_0011;  // 43
            hold_d = { HOLD_BITS {1'b0} };
            gyr_d = 48'b0;
            start_get_d = 1'b1;
          end
          if ( finish_get_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Last pass: Clean up
        else if ( loop_ctr_q == 5'b11111 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = 5'b0;
            state_imu_d = IMU_READ_MAG;
          end
        end

        // Otherwise: Loop through 6 data bytes
        else begin
          if (!busy) begin
            addr_d = 8'hFF;
            start_get_d = 1'b1;
          end
          if ( finish_get_q ) begin
            gyr_d = { gyr_q[39:0], data_get_q };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

      end
*/
/*    // Read magnetometer data 
      IMU_READ_MAG : begin

        // First pass: Send MAG register address
        if ( loop_ctr_q == 5'b0 ) begin
          if (!busy) begin
            addr_d = 8'b1_???_????;
            hold_d = { HOLD_BITS {1'b0} };
            mag_d = 48'b0;
            start_get_d = 1'b1;
          end
          if ( finish_get_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Last pass: Clean up
        else if ( loop_ctr_q == 5'b11111 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = 5'b0;
            state_imu_d = IMU_IDLE;
          end
        end

        // Otherwise: Loop through 6 data bytes
        else begin
          if (!busy) begin
            addr_d = 8'hFF;
            start_get_d = 1'b1;
          end
          if ( finish_get_q ) begin
            mag_d = { mag_q[39:0], data_get_q };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

            state_imu_d = IMU_IDLE;
      end
*/



