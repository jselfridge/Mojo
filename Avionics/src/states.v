
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
  output [47:0] acc,
  output [47:0] gyr,
  //output [47:0] mag
  output [7:0] debug_imu
  );

  // Assign SPI outputs
  assign imu_mosi = mosi_imu;
  assign imu_sclk = sclk_imu;
  assign imu_ss = !busy_imu;

  // Assign sensor data outputs
  assign acc = acc_q;
  assign gyr = gyr_q;
  //assign mag = mag_q;
  assign debug_imu = debug_imu_q;



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
    IMU_BITS        = 6,
    // Initialize sensor
    IMU_INIT        = 6'd0,  // wait 100ms
    //IMU_RESET_ADDR  = 6'd1,  // 0x6B PWR_MGMT_1
    //IMU_RESET_DATA  = 6'd2,  // 0x80 Restore default settings
    IMU_DELAY       = 6'd3,  // wait 100ms
    //IMU_WAKE_ADDR   = 6'd4,  // 0x6B PWR_MGMT_1
    //IMU_WAKE_DATA   = 6'd5,  // 0x00 Allow defaults to take effect
    // Assign sensor settings
    //IMU_AFSR_ADDR = 6'd11,  // 0x1C ACCEL_CONFIG
    //IMU_AFSR_DATA = 6'd12,  // 000_00_000
    // Begin reading sensor data
    IMU_IDLE    = 6'd30,
    // Accelerometer data
    IMU_ACC_XH  = 6'd31,
    IMU_ACC_XL  = 6'd32,
    IMU_ACC_YH  = 6'd33,
    IMU_ACC_YL  = 6'd34,
    IMU_ACC_ZH  = 6'd35,
    IMU_ACC_ZL  = 6'd36,
    // Rate gyro data
    IMU_GYR_XH  = 6'd41,
    IMU_GYR_XL  = 6'd42,
    IMU_GYR_YH  = 6'd43,
    IMU_GYR_YL  = 6'd44,
    IMU_GYR_ZH  = 6'd45,
    IMU_GYR_ZL  = 6'd46,
    // Magnetometer data
    // ~~~~
    // Read debugging output
    IMU_DEBUG       = 6'd62,
    // Flush out last byte
    IMU_FLUSH       = 6'd63;

  //GYR_FSR  ADDR 0x1B
  //GYR_FSR  DATA XX<<3
  //ACC_FSR  ADDR 0x1C
  //ACC_FSR  DATA XX<<3
  //SETLPF   ADDR 0x1A
  //SETLPF   DATA ????
  //SAMPLE   ADDR 0x19
  //SAMPLE   DATA 00??

  // configure fifo
  //INTEN    ADDR 0x38
  //INTEN    DATA ????

  // look into 'mpu_reset_fifo'
  // find 'init_param' and 'reg_int_cb'
  // setsensors (pwr_mgmt_2 int_pin_cfg)

/*
    IMU_MAG_XH  = 6'dx,
    IMU_MAG_XL  = 6'dx,
    IMU_MAG_YH  = 6'dx,
    IMU_MAG_YL  = 6'dx,
    IMU_MAG_ZH  = 6'dx,
    IMU_MAG_ZL  = 6'dx,
*/

  // Bits for delay counter
  localparam DELAY_BITS = 27;  // REVISE 2^22 = 4.1M cycles = 83ms


  // Declare registers
  reg [IMU_BITS-1:0] state_imu_d, state_imu_q = IMU_INIT;
  reg [7:0] addr_imu_d, addr_imu_q;
  reg start_imu_d, start_imu_q = 1'b0;
  reg finish_imu_d, finish_imu_q = 1'b0;
  reg [7:0] data_imu_d, data_imu_q;
  reg [DELAY_BITS-1:0] delay_d, delay_q = { DELAY_BITS {1'b0} };
  reg [47:0] acc_d, acc_q = 48'h000000000000;
  reg [47:0] gyr_d, gyr_q = 48'h000000000000;
  //reg [47:0] mag_d, mag_q = 48'h000000000000;
  reg [7:0] debug_imu_d, debug_imu_q = 8'h00;

  // Connect 'spi_master' module for IMU
  wire sclk_imu;
  wire busy_imu;
  wire finish_imu;
  wire mosi_imu;
  wire [7:0] data_imu;
  spi_master_11 #(
    .CLK_DIV(8) )
    spi_master_imu (
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
    delay_d       = delay_q;
    acc_d         = acc_q;
    gyr_d         = gyr_q;
    //mag_d         = mag_q;
    debug_imu_d   = debug_imu_q;


        /*  SAMPLE CASE CODE
        if ( !busy_imu ) begin
          addr_imu_d = 8'bX_XXX_XXXX;  // RWXX
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          xxx_d[xx:xx] = data_imu_q;
          state_imu_d = IMU_XXX;
        end
        */


    // Begin 'imu' state machine
    case (state_imu_q)

      // Begin sensor initialization (wait 83ms)
      IMU_INIT : begin
        delay_d = delay_q + 1'b1;
        if ( delay_q == { DELAY_BITS {1'b1} } ) begin
          delay_d = { DELAY_BITS {1'b0} };
          state_imu_d = IMU_DELAY;
        end
      end

/*      // Specify address for 'reset' command
      IMU_RESET_ADDR : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0_110_1011;  // W6B: PWR_MGMT_1
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_RESET_DATA;
        end
      end

      // Send data for 'reset' command
      IMU_RESET_DATA : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'h80;  // Restore default settings
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_DELAY;
        end
      end
*/
      // Wait for sensor reset (wait 83ms)
      IMU_DELAY : begin
        delay_d = delay_q + 1'b1;
        if ( delay_q == { DELAY_BITS {1'b1} } ) begin
          delay_d = { DELAY_BITS {1'b0} };
          state_imu_d = IMU_IDLE;
        end
      end

/*      // Specify address for 'wake' command
      IMU_WAKE_ADDR : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0_110_1011;  // W6B: PWR_MGMT_1
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_WAKE_DATA;
        end
      end
*/
/*      // Send data for 'wake' command
      IMU_WAKE_DATA : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'h00;  // Allow defaults to take effect
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          //state_imu_d = IMU_SAMPLE_ADDR;
          state_imu_d = IMU_IDLE;
        end
      end
*/
/*      // Specify address for 'acc fsr' command
      IMU_AFSR_ADDR : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b0_001_1100;  // W1C
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_AFSR_DATA;
        end
      end

      // Send data for 'acc fsr' command
      IMU_AFSR_DATA : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b000_11_000;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_IDLE;
        end
      end
*/
/*      // Specify address for 'sample' command
      IMU_SAMPLE_ADDR : begin  // Temp debugging value
        if ( !busy_imu ) begin
          addr_imu_d = 8'bX_XXX_XXXX;  // RWXX
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          xxx_d[xx:xx] = data_imu_q;
          state_imu_d = IMU_SAMPLE_DATA;
        end
      end
*/
/*      // Send data for 'sample' command
      IMU_SAMPLE_DATA : begin  // Temp debugging value
        if ( !busy_imu ) begin
          addr_imu_d = 8'bX_XXX_XXXX;  // RWXX
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          xxx_d[xx:xx] = data_imu_q;
          state_imu_d = IMU_IDLE;
        end
      end
*/
      // Begin reading sensor data
      IMU_IDLE : begin
        if ( tmr_1khz ) begin
          state_imu_d = IMU_ACC_XH;
        end
      end

      // Acc X-axis high byte
      IMU_ACC_XH : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b1_011_1011;  // R3B
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_ACC_XL;
        end
      end

      // Acc X-axis low byte
      IMU_ACC_XL : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;  // 8'b1_011_1100;  // R3C
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          acc_d[47:40] = data_imu_q;
          state_imu_d = IMU_ACC_YH;
        end
      end

      // Acc Y-axis high byte
      IMU_ACC_YH : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;  // 8'b1_011_1101;  // R3D
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          acc_d[39:32] = data_imu_q;
          state_imu_d = IMU_ACC_YL;
        end
      end

      // Acc Y-axis low byte
      IMU_ACC_YL : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;  // 8'b1_011_1110;  // R3E
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          acc_d[31:24] = data_imu_q;
          state_imu_d = IMU_ACC_ZH;
        end
      end

      // Acc Z-axis high byte
      IMU_ACC_ZH : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;  // 8'b1_011_1111;  // R3F
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          acc_d[23:16] = data_imu_q;
          state_imu_d = IMU_ACC_ZL;
        end
      end

      // Acc Z-axis low byte
      IMU_ACC_ZL : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;  // 8'b1_100_0000;  // R40
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          acc_d[15:8] = data_imu_q;
          state_imu_d = IMU_GYR_XH;
        end
      end

      // Gyr X-axis high byte
      IMU_GYR_XH : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;  // 8'b1_100_0011;  // R43
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          acc_d[7:0] = data_imu_q;
          state_imu_d = IMU_GYR_XL;
        end
      end

      // Gyr X-axis low byte
      IMU_GYR_XL : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;  // 8'b1_100_0100;  // R44
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          gyr_d[47:40] = data_imu_q;
          state_imu_d = IMU_GYR_YH;
        end
      end

      // Gyr Y-axis high byte
      IMU_GYR_YH : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;  // 8'b1_100_0101;  // R45
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          gyr_d[39:32] = data_imu_q;
          state_imu_d = IMU_GYR_YL;
        end
      end

      // Gyr Y-axis low byte
      IMU_GYR_YL : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;  // 8'b1_100_0110;  // R46
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          gyr_d[31:24] = data_imu_q;
          state_imu_d = IMU_GYR_ZH;
        end
      end

      // Gyr Z-axis high byte
      IMU_GYR_ZH : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;  // 8'b1_100_0111;  // R47
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          gyr_d[23:16] = data_imu_q;
          state_imu_d = IMU_GYR_ZL;
        end
      end

      // Gyr Z-axis low byte
      IMU_GYR_ZL : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;  // 8'b1_100_1000;  // R48
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          gyr_d[15:8] = data_imu_q;
          state_imu_d = IMU_DEBUG;
        end
      end

      // Specify 'debug' command
      IMU_DEBUG : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;  // 8'b1_001_1100;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          gyr_d[7:0] = data_imu_q;
          state_imu_d = IMU_FLUSH;
        end
      end

      // Flush out last byte
      IMU_FLUSH : begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          debug_imu_d[7:0] = data_imu_q;
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
      addr_imu_q  <= 8'hFF;
    end else begin
      addr_imu_q  <= addr_imu_d;
    end

    state_imu_q   <= state_imu_d;
    start_imu_q   <= start_imu_d;
    finish_imu_q  <= finish_imu_d;
    data_imu_q    <= data_imu_d;
    delay_q       <= delay_d;
    acc_q         <= acc_d;
    gyr_q         <= gyr_d;
    //mag_q         <= mag_d;
    debug_imu_q   <= debug_imu_d;

  end

endmodule



