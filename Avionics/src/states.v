
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
  output [7:0] debug_byte,
  output [47:0] acc,
  output [47:0] gyr,
  output [47:0] mag
  );

  // Assign busy flags
  wire busy;
  assign busy = busy_set || busy_get || busy_read;

  // Assign SPI outputs
  assign imu_mosi = mosi_set || mosi_get || mosi_read;
  assign imu_sclk = sclk_set && sclk_get && sclk_read;
  assign imu_ss = !busy;

  // Assign sensor data outputs
  assign debug_byte = debug_byte_q;
  assign acc = acc_q;
  assign gyr = gyr_q;
  assign mag = mag_q;




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




  /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // 0x6B 0x80: "Reset"
  // 0x6B 0x00: "Wake Up"
  // 0x6C 0x00: "Disable"
  // 0x38 0x00: "Interrupt Enable"
  // 0x19 0x00: "Sample Rate"
  // 0x1A 0x01: "Low Pass Filter"
  // 0x1B 0x000_??_000: "Rate Gyro"
  // 0x1C 0x000_??_000: "Accelerometer"
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // ??: 0x1D 0x??: "XXXX" (Accelerometer2)
  // ??: 0x23 0x00: "FIFO Enable" (maybe 0x79)
  // ??: 0x24 0x0D: "I2C Master Control" (adjusts I2C clock rate)
  // ??: 0x6A 0x??: "User Control"
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

  // IMU sensor states
  localparam
    IMU_BITS = 6,
    IMU_INIT        = 6'd0,
    IMU_SEND_RESET  = 6'd1,   IMU_WAIT_RESET  = 6'd2,
    IMU_SEND_WAKE   = 6'd3,   IMU_WAIT_WAKE   = 6'd4,
    IMU_SEND_DISA   = 6'd8,   IMU_HOLD_DISA   = 6'd9,
    IMU_SEND_INTEN  = 6'd10,  IMU_HOLD_INTEN  = 6'd11,
    IMU_SEND_SMPL   = 6'd12,  IMU_HOLD_SMPL   = 6'd13,
    IMU_SEND_LPF    = 6'd14,  IMU_HOLD_LPF    = 6'd15,
    IMU_SEND_GYR    = 6'd16,  IMU_HOLD_GYR    = 6'd17,
    IMU_SEND_ACC    = 6'd18,  IMU_HOLD_ACC    = 6'd19,
    IMU_SEND_DEBUG  = 6'd20,  IMU_HOLD_DEBUG  = 6'd21,
    IMU_IDLE        = 6'd32,
    IMU_READ_ACC    = 6'd33,  IMU_DONE_ACC    = 6'd34,
    IMU_READ_GYR    = 6'd35,  IMU_DONE_GYR    = 6'd36,
    IMU_READ_MAG    = 6'd37,  IMU_DONE_MAG    = 6'd38;




  // Bits for counters
  localparam WAIT_BITS = 24;  // 24 bits =>  336 msec delay
  localparam HOLD_BITS = 16;  // 16 bits => 1310 usec delay
  localparam DONE_BITS = 10;  // 10 bits =>   20 usec delay


  // Declare registers
  reg [IMU_BITS-1:0] state_imu_d, state_imu_q = IMU_INIT;
  reg [7:0] addr_d, addr_q;
  reg [7:0] set_d, set_q;
  reg [7:0] get_d, get_q;
  reg [47:0] read_d, read_q;
  reg start_set_d, start_set_q = 1'b0;
  reg start_get_d, start_get_q = 1'b0;
  reg start_read_d, start_read_q = 1'b0;
  reg finish_set_d, finish_set_q = 1'b0;
  reg finish_get_d, finish_get_q = 1'b0;
  reg finish_read_d, finish_read_q = 1'b0;
  reg [WAIT_BITS-1:0] wait_d, wait_q = { WAIT_BITS {1'b0} };
  reg [HOLD_BITS-1:0] hold_d, hold_q = { HOLD_BITS {1'b0} };
  reg [DONE_BITS-1:0] done_d, done_q = { DONE_BITS {1'b0} };
  reg [7:0] debug_byte_d, debug_byte_q = 8'b0;
  reg [47:0] acc_d, acc_q = 48'b0;
  reg [47:0] gyr_d, gyr_q = 48'b0;
  reg [47:0] mag_d, mag_q = 48'b0;




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


  // Connect 'spi_mpu_read' module for IMU
  wire sclk_read;
  wire busy_read;
  wire finish_read;
  wire mosi_read;
  wire [47:0] read;
  spi_mpu_read #(
    .CLK_DIV(4),
    .HOLD_BITS(0) )
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
    .read(read) );




  // Combinational logic
  always @(*) begin

    // Initial assignments
    state_imu_d   = state_imu_q;
    addr_d        = addr_q;
    set_d         = set_q;
    get_d         = get;
    read_d        = read;
    start_set_d   = 1'b0;
    start_get_d   = 1'b0;
    start_read_d  = 1'b0;
    finish_set_d  = finish_set;
    finish_get_d  = finish_get;
    finish_read_d = finish_read;
    wait_d        = wait_q;
    hold_d        = hold_q;
    done_d        = done_q;
    debug_byte_d  = debug_byte_q;
    acc_d         = acc_q;
    gyr_d         = gyr_q;
    mag_d         = mag_q;


    // Begin 'imu' state machine
    case (state_imu_q)

      // Initialize IMU 
      IMU_INIT : begin
        wait_d = wait_q + 1'b1;
        if (&wait_q)  state_imu_d = IMU_SEND_RESET;
      end

      // 0x6B 0x80: "Reset"
      IMU_SEND_RESET : begin
        if (!busy) begin
          addr_d = 8'h6B;
          set_d = 8'h80;
          start_set_d = 1'b1;
        end
        if (finish_set_q)  state_imu_d = IMU_WAIT_RESET;
      end

      // Wait: "Reset"
      IMU_WAIT_RESET : begin
        wait_d = wait_q + 1'b1;
        if (&wait_q)  state_imu_d = IMU_SEND_WAKE;
      end

      // 0x6B 0x00: "Wake Up"
      IMU_SEND_WAKE : begin
        if (!busy) begin
          addr_d = 8'h6B;
          set_d = 8'h00;
          start_set_d = 1'b1;
        end
        if (finish_set_q)  state_imu_d = IMU_WAIT_WAKE;
      end

      // Wait: "Wake Up"
      IMU_WAIT_WAKE : begin
        wait_d = wait_q + 1'b1;
        if (&wait_q)  state_imu_d = IMU_SEND_DISA;
      end

      // 0x6C 0x00: "Disable"
      // [7:6] reserved; [5:3] disable ACC; [2:0] disable GYR
      IMU_SEND_DISA : begin
        if (!busy) begin
          addr_d = 8'h6C;
          set_d = 8'h00;
          start_set_d = 1'b1;
        end
        if (finish_set_q)  state_imu_d = IMU_HOLD_DISA;
      end

      // Hold: "Disable"
      IMU_HOLD_DISA : begin
        hold_d = hold_q + 1'b1;
        if (&hold_q)  state_imu_d = IMU_SEND_INTEN;
      end

      // 0x38 0x00: "Interrupt Enable"
      IMU_SEND_INTEN : begin
        if (!busy) begin
          addr_d = 8'h38;
          set_d = 8'h00;
          start_set_d = 1'b1;
        end
        if (finish_set_q)  state_imu_d = IMU_HOLD_INTEN;
      end

      // Hold: "Interrupt Enable"
      IMU_HOLD_INTEN : begin
        hold_d = hold_q + 1'b1;
        if (&hold_q)  state_imu_d = IMU_SEND_SMPL;
      end

      // 0x19 0x00: "Sample Rate"
      // Rate = 1000 / ( 1 + 8'divider )
      IMU_SEND_SMPL : begin
        if (!busy) begin
          addr_d = 8'h19;
          set_d = 8'h00;
          start_set_d = 1'b1;
        end
        if (finish_set_q)  state_imu_d = IMU_HOLD_SMPL;
      end

      // Hold: "Sample Rate"
      IMU_HOLD_SMPL : begin
        hold_d = hold_q + 1'b1;
        if (&hold_q)  state_imu_d = IMU_SEND_LPF;
      end

      // 0x1A 0x01: "Low Pass Filter"
      IMU_SEND_LPF : begin
        if (!busy) begin
          addr_d = 8'h1A;
          set_d = 8'h01;
          start_set_d = 1'b1;
        end
        if (finish_set_q)  state_imu_d = IMU_HOLD_LPF;
      end

      // Hold: "Low Pass Filter"
      IMU_HOLD_LPF : begin
        hold_d = hold_q + 1'b1;
        if (&hold_q)  state_imu_d = IMU_SEND_GYR;
      end

      // 0x1B 0x000_??_000: "Rate Gyro"
      // 00: 250dps; 01: 500dps; 10: 1000dps; 11: 2000dps
      IMU_SEND_GYR : begin
        if (!busy) begin
          addr_d = 8'h1B;
          set_d = 8'b000_00_000;
          start_set_d = 1'b1;
        end
        if (finish_set_q)  state_imu_d = IMU_HOLD_GYR;
      end

      // Hold: "Rate Gyro"
      IMU_HOLD_GYR : begin
        hold_d = hold_q + 1'b1;
        if (&hold_q)  state_imu_d = IMU_SEND_ACC;
      end

      // 0x1C 0x000_??_000: "Accelerometer"
      // 00: 2g; 01: 4g; 10: 8g; 11: 16g
      IMU_SEND_ACC : begin
        if (!busy) begin
          addr_d = 8'h1C;
          set_d = 8'b000_00_000;
          start_set_d = 1'b1;
        end
        if (finish_set_q)  state_imu_d = IMU_HOLD_ACC;
      end

      // Hold: "Accelerometer"
      IMU_HOLD_ACC : begin
        hold_d = hold_q + 1'b1;
        if (&hold_q)  state_imu_d = IMU_SEND_DEBUG;
      end

      // Get command for "Debug"
      // 8'h75 | 8'h80;  // WhoAmI
      // 8'h19 | 8'h80;  // Sample
      // 8'h1A | 8'h80;  // LPF
      // 8'h1B | 8'h80;  // GYR
      // 8'h1C | 8'h80;  // ACC
      IMU_SEND_DEBUG : begin
        if (!busy) begin
          addr_d = 8'h38 | 8'h80;
          start_get_d = 1'b1;
        end
        if (finish_get_q) begin
          debug_byte_d = get_q;
          state_imu_d = IMU_HOLD_DEBUG;
        end
      end

      // Hold: "Debug"
      IMU_HOLD_DEBUG : begin
        hold_d = hold_q + 1'b1;
        if (&hold_q)  state_imu_d = IMU_IDLE;
      end

      // Wait for next timing signal
      IMU_IDLE : begin
        if (tmr_1khz)  state_imu_d = IMU_READ_ACC;
      end

      // Read accelerometer data
      IMU_READ_ACC : begin
        if (!busy) begin
          addr_d = 8'h3B | 8'h80;
          start_read_d = 1'b1;
        end
        if (finish_read_q) begin
          acc_d = read_q;
          state_imu_d = IMU_DONE_ACC;
        end
      end

      // Done with accelerometer
      IMU_DONE_ACC : begin
        done_d = done_q + 1'b1;
        if (&done_q)  state_imu_d = IMU_READ_GYR;
      end

      // Read rate gyro data
      IMU_READ_GYR : begin
        if (!busy) begin
          addr_d = 8'h43 | 8'h80;
          start_read_d = 1'b1;
        end
        if (finish_read_q) begin
          gyr_d = read_q;
          state_imu_d = IMU_DONE_GYR;
        end
      end

      // Done with rate gyro 
      IMU_DONE_GYR : begin
        done_d = done_q + 1'b1;
        if (&done_q)  state_imu_d = IMU_READ_MAG;
      end

      // Read magnetometer data
      IMU_READ_MAG : begin
        state_imu_d = IMU_DONE_MAG;
      end

      // Done with magnetometer
      IMU_DONE_MAG : begin
        state_imu_d = IMU_IDLE;
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
      done_q      <= { DONE_BITS {1'b0} };
    end else begin
      state_imu_q <= state_imu_d;
      wait_q      <= wait_d;
      hold_q      <= hold_d;
      done_q      <= done_d;
    end

    addr_q        <= addr_d;
    set_q         <= set_d;
    get_q         <= get_d;
    read_q        <= read_d;
    start_set_q   <= start_set_d;
    start_get_q   <= start_get_d;
    start_read_q  <= start_read_d;
    finish_set_q  <= finish_set_d;
    finish_get_q  <= finish_get_d;
    finish_read_q <= finish_read_d;
    debug_byte_q  <= debug_byte_d;
    acc_q         <= acc_d;
    gyr_q         <= gyr_d;
    mag_q         <= mag_d;

  end

endmodule



