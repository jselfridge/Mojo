
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
  output [7:0] imu_out,
  output [47:0] acc
  //output [47:0] gyr,
  //output [47:0] mag
  );

  // Assign SPI outputs
  assign imu_mosi = mosi_imu;
  assign imu_sclk = sclk_imu;
  assign imu_ss = !busy_imu;

  // Assign sensor data outputs
  assign imu_out = imu_out_q;
  assign acc = acc_q;
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
    IMU_BITS        = 2,
    // Loop commands
    IMU_INIT        = 2'd0;
    //IMU_IDLE        = 2'd1,
    //IMU_READ_ACC    = 2'd2,
    //IMU_DEBUG       = 2'd3;

    //IMU_READ_GYR    = 2'd2,
    //IMU_READ_MAG    = 2'd3;




  // Bits for counters
  localparam INIT_BITS = 26;
  localparam LOAD_BITS = 16;
  localparam HOLD_BITS = 8;


  // Declare registers
  reg [IMU_BITS-1:0] state_imu_d, state_imu_q = IMU_INIT;
  reg [7:0] addr_imu_d, addr_imu_q;
  reg start_imu_d, start_imu_q = 1'b0;
  reg finish_imu_d, finish_imu_q = 1'b0;
  reg [2:0] loop_ctr_d, loop_ctr_q = 3'b0;
  reg [7:0] data_imu_d, data_imu_q;
  reg [INIT_BITS-1:0] init_d, init_q = { INIT_BITS {1'b0} };
  reg [LOAD_BITS-1:0] load_d, load_q = { LOAD_BITS {1'b0} };
  reg [HOLD_BITS-1:0] hold_d, hold_q = { HOLD_BITS {1'b0} };
  reg [7:0] imu_out_d, imu_out_q;
  reg [47:0] acc_d, acc_q = 48'b0;
  //reg [47:0] gyr_d, gyr_q = 48'b0;
  //reg [47:0] mag_d, mag_q = 48'b0;


  // Connect 'spi_master' module for IMU
  wire sclk_imu;
  wire busy_imu;
  wire finish_imu;
  wire mosi_imu;
  wire [7:0] data_imu;
  spi_mpu_get #(
    .CLK_DIV(4),  // 3
    .HOLD_BITS(8) )  // 3
    spi_mpu_get (
    .clk(clk),
    .rst(rst),
    .start(start_imu_q),
    .miso(imu_miso),
    .addr(addr_imu_q),
    .sclk(sclk_imu),
    .busy(busy_imu),
    .finish(finish_imu),
    .mosi(mosi_imu),
    .data(data_imu) );

  // Combinational logic
  always @(*) begin

    // Initial assignments
    state_imu_d   = state_imu_q;
    addr_imu_d    = addr_imu_q;
    start_imu_d   = 1'b0;
    finish_imu_d  = finish_imu;
    data_imu_d    = data_imu;
    loop_ctr_d    = loop_ctr_q;
    init_d        = init_q;
    load_d        = load_q;
    hold_d        = hold_q;
    imu_out_d     = imu_out_q;
    acc_d         = acc_q;
    //gyr_d         = gyr_q;
    //mag_d         = mag_q;


    // Begin 'imu' state machine
    case (state_imu_q)

      // Initialize IMU 
      IMU_INIT : begin

        // Warm up device
        if ( loop_ctr_q == 3'd0 ) begin
          init_d = init_q + 1'b1;
          if ( init_q == { INIT_BITS {1'b1} } ) begin
            init_d = { INIT_BITS {1'b0} };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Send register read address
        // 8'b0_001_1100;  // 1C  AccelConfig
        else if ( loop_ctr_q == 3'd1 ) begin
          if ( !busy_imu ) begin
            addr_imu_d = 8'b1_111_0101;  // R75 WhoAmI
            imu_out_d = 8'b0;
            start_imu_d = 1'b1;
          end
          if ( finish_imu_q ) begin
            imu_out_d = data_imu_q;
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end
 
/*        // Third pass: Send configuration data byte
        else if ( loop_ctr_q == 3'd2 ) begin
          if ( !busy_imu ) begin
            addr_imu_d = 8'b000_00_000;
            start_imu_d = 1'b1;
          end
          if ( finish_imu_q ) begin
            imu_out_d = data_imu_q;
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Fourth pass: Allow time to load parameter
        else if ( loop_ctr_q == 3'd3 ) begin
          load_d = load_q + 1'b1;
          if ( load_q == { LOAD_BITS {1'b1} } ) begin
            load_d = { LOAD_BITS {1'b0} };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Fifth pass: Send register read address
        // 8'b1_111_0101;  // R75 WhoAmI
        else if ( loop_ctr_q == 3'd4 ) begin
          if ( !busy_imu ) begin
            addr_imu_d = 8'b1_001_1100;  // 1C  AccelConfig
            imu_out_d = 8'b0;
            hold_d = { HOLD_BITS {1'b0} };
            start_imu_d = 1'b1;
          end
          if ( finish_imu_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Sixth pass: Get data byte
        else if ( loop_ctr_q == 3'd5 ) begin
          if ( !busy_imu ) begin
            addr_imu_d = 8'hFF;
            start_imu_d = 1'b1;
          end
          if ( finish_imu_q ) begin
            imu_out_d = data_imu_q;
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Final pass: Clean up
        else begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = 3'b0;
            //state_imu_d = IMU_IDLE;
          end
        end
*/
      end

/*      // Wait for next timing signal
      IMU_IDLE : begin
        if ( tmr_1khz ) begin
          loop_ctr_d = 3'b0;
          state_imu_d = IMU_READ_ACC;
        end
      end
*/
/*      // Read accelerometer data 
      IMU_READ_ACC : begin

        // First pass: Send ACC register address
        if ( loop_ctr_q == 3'b0 ) begin
          if ( !busy_imu ) begin
            addr_imu_d = 8'b1_011_1011;  // R3B
            acc_d = 48'b0;
            hold_d = { HOLD_BITS {1'b0} };
            start_imu_d = 1'b1;
          end
          if ( finish_imu_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Last pass: Clean up
        else if ( loop_ctr_q == 3'b111 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = 3'b0;
            state_imu_d = IMU_DEBUG;  // IMU_READ_GYR;
          end
        end

        // Otherwise: Loop through 6 data bytes
        else begin
          if ( !busy_imu ) begin
            addr_imu_d = 8'hFF;
            start_imu_d = 1'b1;
          end
          if ( finish_imu_q ) begin
            acc_d = { acc_q[39:0], data_imu_q };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

      end
*/
      // Read debugging data 
//      IMU_DEBUG : begin

/*        // First pass: Send register address
        // 8'b1_111_0101;  // R75 WhoAmI
        if ( loop_ctr_q == 3'b0 ) begin
          if ( !busy_imu ) begin
            addr_imu_d = 8'b1_001_1100;  // 1C  AccelConfig
            imu_out_d = 8'b0;
            hold_d = { HOLD_BITS {1'b0} };
            start_imu_d = 1'b1;
          end
          if ( finish_imu_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Last pass: Clean up
        else if ( loop_ctr_q == 3'd2 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = 3'b0;
            state_imu_d = IMU_IDLE;
            //state_imu_d = IMU_READ_GYR;
          end
        end

        // Otherwise: Loop through debug data byte
        else begin
          if ( !busy_imu ) begin
            addr_imu_d = 8'hFF;
            start_imu_d = 1'b1;
          end
          if ( finish_imu_q ) begin
            imu_out_d = data_imu_q;
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end
*/
//            state_imu_d = IMU_IDLE;
//      end

/*    // Read rate gyro data 
      IMU_READ_GYR : begin

        // First pass: Send GYR register address
        if ( loop_ctr_q == 3'b0 ) begin
          if ( !busy_imu ) begin
            addr_imu_d = 8'b1_100_0011;  // 43
            hold_d = { HOLD_BITS {1'b0} };
            gyr_d = 48'b0;
            start_imu_d = 1'b1;
          end
          if ( finish_imu_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Last pass: Clean up
        else if ( loop_ctr_q == 3'b111 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = 3'b0;
            state_imu_d = IMU_READ_MAG;
          end
        end

        // Otherwise: Loop through 6 data bytes
        else begin
          if ( !busy_imu ) begin
            addr_imu_d = 8'hFF;
            start_imu_d = 1'b1;
          end
          if ( finish_imu_q ) begin
            gyr_d = { gyr_q[39:0], data_imu_q };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

      end
*/
/*    // Read magnetometer data 
      IMU_READ_MAG : begin

        // First pass: Send MAG register address
        if ( loop_ctr_q == 3'b0 ) begin
          if ( !busy_imu ) begin
            addr_imu_d = 8'b1_???_????;
            hold_d = { HOLD_BITS {1'b0} };
            mag_d = 48'b0;
            start_imu_d = 1'b1;
          end
          if ( finish_imu_q ) begin
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

        // Last pass: Clean up
        else if ( loop_ctr_q == 3'b111 ) begin
          hold_d = hold_q + 1'b1;
          if ( hold_q == { HOLD_BITS {1'b1} } ) begin
            hold_d = { HOLD_BITS {1'b0} };
            loop_ctr_d = 3'b0;
            state_imu_d = IMU_IDLE;
          end
        end

        // Otherwise: Loop through 6 data bytes
        else begin
          if ( !busy_imu ) begin
            addr_imu_d = 8'hFF;
            start_imu_d = 1'b1;
          end
          if ( finish_imu_q ) begin
            mag_d = { mag_q[39:0], data_imu_q };
            loop_ctr_d = loop_ctr_q + 1'b1;
          end
        end

            state_imu_d = IMU_IDLE;
      end
*/

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
      addr_imu_q  <= 8'hFF;
      init_q      <= { INIT_BITS {1'b0} };
      load_q      <= { LOAD_BITS {1'b0} };
      hold_q      <= { HOLD_BITS {1'b0} };
    end else begin
      state_imu_q <= state_imu_d;
      addr_imu_q  <= addr_imu_d;
      init_q      <= init_d;
      load_q      <= load_d;
      hold_q      <= hold_d;
    end

    start_imu_q   <= start_imu_d;
    finish_imu_q  <= finish_imu_d;
    data_imu_q    <= data_imu_d;
    loop_ctr_q    <= loop_ctr_d;
    imu_out_q     <= imu_out_d;
    acc_q         <= acc_d;
    //gyr_q         <= gyr_d;
    //mag_q         <= mag_d;

  end

endmodule








//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  CONFIGURATION CODE


/*
    IMU_INIT        = 6'd0,

    // Issue "Reset" command: 0x6B 0x80
    IMU_RESET_ADDR  = 6'd1,
    IMU_RESET_DATA  = 6'd2,
    IMU_RESET_WAIT  = 6'd3,

    // Issue "Wake" command: 0x6B 0x00
    IMU_WAKE_ADDR   = 6'd4,
    IMU_WAKE_DATA   = 6'd5,
    IMU_WAKE_WAIT   = 6'd6,

    // Issue "Disable" command: 0x6C 0x00
    IMU_DIS_ADDR    = 6'd7,
    IMU_DIS_DATA    = 6'd8,
    IMU_DIS_WAIT    = 6'd9,

    // Issue "Sample Rate" command: 0x19 0x00
    IMU_SMPL_ADDR   = 6'd10,
    IMU_SMPL_DATA   = 6'd11,
    IMU_SMPL_WAIT   = 6'd12,

    // Issue "Low Pass Filter" command: 0x1A 0x01
    IMU_LPF_ADDR    = 6'd13,
    IMU_LPF_DATA    = 6'd14,
    IMU_LPF_WAIT    = 6'd15,

    // Issue "Rate Gyro" command: 0x1B 0x000_00_000
    IMU_GYR_ADDR    = 6'd16,
    IMU_GYR_DATA    = 6'd17,
    IMU_GYR_WAIT    = 6'd18,

    // Issue "Accelerometer" command: 0x1C 0x000_00_000
    IMU_ACC_ADDR    = 6'd19,
    IMU_ACC_DATA    = 6'd20,
    IMU_ACC_WAIT    = 6'd21,

    // Issue "XXXX" command: 0x1D 0x??
  //IMU_XXXX_ADDR   = 6'd22,
  //IMU_XXXX_DATA   = 6'd23,
  //IMU_XXXX_WAIT   = 6'd24,

    // Issue "FIFO Enable" command: 0x23 0x00
  //IMU_FIFO_ADDR   = 6'd25,
  //IMU_FIFO_DATA   = 6'd26,
  //IMU_FIFO_WAIT   = 6'd27,

    // Issue "I2C Master Control" command: 0x24 0x0x0D
  //IMU_I2C_ADDR    = 6'd28,
  //IMU_I2C_DATA    = 6'd29,
  //IMU_I2C_WAIT    = 6'd30,

    // Issue "Interrupt Enable" command: 0x38 0x00
  //IMU_INT_ADDR    = 6'd31,
  //IMU_INT_DATA    = 6'd32,
  //IMU_INT_WAIT    = 6'd33,

    // Issue "User Control" command: 0x6A 0x??
  //IMU_USER_ADDR   = 6'd34,
  //IMU_USER_DATA   = 6'd35,
  //IMU_USER_WAIT   = 6'd36,
*/


/*      // Begin the IMU configuration process
      IMU_INIT : begin
        wait_d = wait_q + 1'b1;
        if ( wait_q == { WAIT_BITS {1'b1} } ) begin
          wait_d = { WAIT_BITS {1'b0} };
          state_imu_d = IMU_IDLE;
          //state_imu_d = IMU_RESET_ADDR;
        end
      end

      // Assign "Reset" address
      IMU_RESET_ADDR : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0_110_1011;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_RESET_DATA;
        end
      end

      // Send "Reset" data
      IMU_RESET_DATA : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b1000_0000;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_RESET_WAIT;
        end
      end

      // Wait after "Reset" parameter
      IMU_RESET_WAIT : begin
        hold_d = hold_q + 1'b1;
        if ( hold_q == { HOLD_BITS {1'b1} } ) begin
          hold_d = { HOLD_BITS {1'b0} };
          state_imu_d = IMU_WAKE_ADDR;
        end
      end

      // Assign "Wake" address
      IMU_WAKE_ADDR : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0_110_1011;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_WAKE_DATA;
        end
      end

      // Send "Wake" data
      IMU_WAKE_DATA : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0000_0000;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_WAKE_WAIT;
        end
      end

      // Wait after "Wake" parameter
      IMU_WAKE_WAIT : begin
        hold_d = hold_q + 1'b1;
        if ( hold_q == { HOLD_BITS {1'b1} } ) begin
          hold_d = { HOLD_BITS {1'b0} };
          state_imu_d = IMU_DIS_ADDR;
        end
      end

      // Assign "Disable" address
      IMU_DIS_ADDR : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0_110_1100;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_DIS_DATA;
        end
      end

      // Send "Disable" data
      IMU_DIS_DATA : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0000_0000;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_DIS_WAIT;
        end
      end

      // Wait after "Disable" parameter
      IMU_DIS_WAIT : begin
        hold_d = hold_q + 1'b1;
        if ( hold_q == { HOLD_BITS {1'b1} } ) begin
          hold_d = { HOLD_BITS {1'b0} };
          state_imu_d = IMU_SMPL_ADDR;
        end
      end

      // Assign "Sample Rate" address
      IMU_SMPL_ADDR : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0_001_1001;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_SMPL_DATA;
        end
      end

      // Send "Sample Rate" data
      IMU_SMPL_DATA : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0000_0000;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_SMPL_WAIT;
        end
      end

      // Wait after "Sample Rate" parameter
      IMU_SMPL_WAIT : begin
        hold_d = hold_q + 1'b1;
        if ( hold_q == { HOLD_BITS {1'b1} } ) begin
          hold_d = { HOLD_BITS {1'b0} };
          state_imu_d = IMU_LPF_ADDR;
        end
      end

      // Assign "Low Pass Filter" address
      IMU_LPF_ADDR : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0_001_1010;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_LPF_DATA;
        end
      end

      // Send "Low Pass Filter" data
      IMU_LPF_DATA : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0000_0001;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_LPF_WAIT;
        end
      end

      // Wait after "Low Pass Filter" parameter
      IMU_LPF_WAIT : begin
        hold_d = hold_q + 1'b1;
        if ( hold_q == { HOLD_BITS {1'b1} } ) begin
          hold_d = { HOLD_BITS {1'b0} };
          state_imu_d = IMU_GYR_ADDR;
        end
      end

      // Assign "Rate Gyro" address
      IMU_GYR_ADDR : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0_001_1011;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_GYR_DATA;
        end
      end

      // Send "Rate Gyro" data
      IMU_GYR_DATA : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b000_10_000;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_GYR_WAIT;
        end
      end

      // Wait after "Rate Gyro" parameter
      IMU_GYR_WAIT : begin
        hold_d = hold_q + 1'b1;
        if ( hold_q == { HOLD_BITS {1'b1} } ) begin
          hold_d = { HOLD_BITS {1'b0} };
          state_imu_d = IMU_ACC_ADDR;
        end
      end

      // Assign "Accelerometer" address
      IMU_ACC_ADDR : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0_001_1100;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_ACC_DATA;
        end
      end

      // Send "Accelerometer" data
      IMU_ACC_DATA : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b000_01_000;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_ACC_WAIT;
        end
      end

      // Wait after "Accelerometer" parameter
      IMU_ACC_WAIT : begin
        hold_d = hold_q + 1'b1;
        if ( hold_q == { HOLD_BITS {1'b1} } ) begin
          hold_d = { HOLD_BITS {1'b0} };
          state_imu_d = IMU_IDLE;
        end
      end
*/
/*      // Assign "xxxx" address
      IMU_XXXX_ADDR : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0_???_????;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_XXXX_DATA;
        end
      end

      // Send "xxxx" data
      IMU_XXXX_DATA : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b????_????;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_XXXX_WAIT;
        end
      end

      // Wait after "xxxx" parameter
      IMU_XXXX_WAIT : begin
        hold_d = hold_q + 1'b1;
        if ( hold_q == { HOLD_BITS {1'b1} } ) begin
          hold_d = { HOLD_BITS {1'b0} };
          state_imu_d = IMU_XXXX_ADDR;
        end
      end
*/


