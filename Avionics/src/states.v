
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
  output imu_sck,
  output imu_ss,
  output [15:0] testout
  );

  // Assign outputs
  assign imu_mosi = mosi_imu;
  assign imu_sck = sck_imu;
  assign imu_ss = !busy_imu;

  //assign testout = data_out_imu_q;
  assign testout = testout_q;

  // IMU sensor states
  localparam
    IMU_BITS    = 3,
    // Initialize sensor 
    //IMU_START   = X'dxx,
    //I2C_IF_DIS (Section 6.3)
    //IMU_RESET   = X'dxx,  // 0x80
    //IMU_PAUSE   = X'dxx,
    //IMU_WAKE    = X'dxx,  // 0x00
    //IMU_GFSR    = X'dxx,
    //IMU_AFSR    = X'dxx,
    //IMU_LPF     = X'dxx,
    //IMU_RATE    = X'dxx,
    //IMU_FIFO    = X'dxx,
    // Repetitive cycle
    IMU_IDLE    = 3'd0,
    // Accelerometer data
    IMU_ACC_XH_SEND  = 3'd1,
    IMU_ACC_XH_READ  = 3'd2,
    IMU_ACC_XL_SEND  = 3'd3,
    IMU_ACC_XL_READ  = 3'd4;
    //IMU_ACC_YH  = X'dxx,
    //IMU_ACC_YL  = X'dxx,
    //IMU_ACC_ZH  = X'dxx,
    //IMU_ACC_ZL  = X'dxx,
    // Rate gyro data
    //IMU_GYR_XH  = X'dxx,
    //IMU_GYR_XL  = X'dxx,
    //IMU_GYR_YH  = X'dxx,
    //IMU_GYR_YL  = X'dxx,
    //IMU_GYR_ZH  = X'dxx,
    //IMU_GYR_ZL  = X'dxx,
    // Magnetometer data
    //IMU_MAG_XH  = X'dxx,
    //IMU_MAG_XL  = X'dxx,
    //IMU_MAG_YH  = X'dxx,
    //IMU_MAG_YL  = X'dxx,
    //IMU_MAG_ZH  = X'dxx,
    //IMU_MAG_ZL  = X'dxx,
    // Flush last bit
    //IMU_FLUSH   = 2'd3;

  reg [IMU_BITS-1:0] state_imu_d, state_imu_q = IMU_IDLE;
  reg [7:0] data_in_imu_d, data_in_imu_q;
  reg start_imu_d, start_imu_q = 1'b0;
  reg [7:0] data_out_imu_d, data_out_imu_q;
  reg [15:0] testout_d, testout_q = 16'h0000;
  //reg new_data_imu_d, new_data_imu_q = 1'b0;

  // Connect 'spi_master' module for IMU
  wire sck_imu;
  wire busy_imu;
  wire new_data_imu;
  wire mosi_imu;
  wire [7:0] data_out_imu;
  spi_master_11 #(
    .CLK_DIV(8) )
    spi_master_imu (
    .clk(clk),
    .rst(rst),
    .start(start_imu_q),
    .miso(imu_miso),
    .data_in(data_in_imu_q),
    .sck(sck_imu),
    .busy(busy_imu),
    .new_data(new_data_imu),
    .mosi(mosi_imu),
    .data_out(data_out_imu) );

  // Combinational logic
  always @(*) begin

    // Initial assignments
    state_imu_d    = state_imu_q;
    data_in_imu_d  = data_in_imu_q;
    start_imu_d    = 1'b0;
    data_out_imu_d = data_out_imu;
    testout_d      = testout_q;
    //new_data_imu_d = new_data_imu;

    // Begin 'imu' state machine
    case (state_imu_q)
/*
//~~~~ CASCADE ~~~~//

      // Wait for next timer pulse
      IMU_IDLE: begin
        if ( tmr_1khz ) begin
          state_imu_d = IMU_ACC_XH;
        end
      end

      // Accelerometer x-axis high byte
      IMU_ACC_XH: begin
        if ( !busy_imu ) begin
          data_in_imu_d = 8'b1_011_1011;  // R3B
          start_imu_d = 1'b1;
        end
        if ( new_data_imu ) begin
          testout_d[15:8] = data_out_imu_q[7:0];
          state_imu_d = IMU_ACC_XL;
        end
      end

      // Accelerometer x-axis low byte
      IMU_ACC_XL: begin
        if ( !busy_imu ) begin
          data_in_imu_d = 8'b1_011_1100;  // R3C
          start_imu_d = 1'b1;
        end
        if ( new_data_imu ) begin
          testout_d[7:0] = 8'b10101010;  //data_out_imu_q[7:0];
          state_imu_d = IMU_FLUSH;
        end
      end

      // Send dummy byte to flush last bit
      IMU_FLUSH: begin
        if ( !busy_imu ) begin
          data_in_imu_d = 8'hFF;
          start_imu_d = 1'b1;
        end
        if ( new_data_imu ) begin
          state_imu_d = IMU_IDLE;
        end
      end
*/


//~~~~ SEND/READ ~~~~//

      IMU_IDLE: begin
        if ( tmr_1khz ) begin
          state_imu_d = IMU_ACC_XH_SEND;
        end
      end

      IMU_ACC_XH_SEND: begin  // X MSB ???
        if ( !busy_imu ) begin
          data_in_imu_d = 8'b1_011_1011;  // R3B
          start_imu_d = 1'b1;
        end
        if ( new_data_imu ) begin
          testout_d[15:8] = data_out_imu_q[7:0];
          state_imu_d = IMU_ACC_XL_SEND;
        end
      end

      //IMU_ACC_XH_READ: begin
      //  if ( !busy_imu ) begin
      //    //data_in_imu_d = 8'hFF;
      //    start_imu_d = 1'b1;
      //  end
      //  if ( new_data_imu ) begin
      //    testout_d[15:8] = data_out_imu_q[7:0];
      //    state_imu_d = IMU_ACC_XL_SEND;
      //  end
      //end

      IMU_ACC_XL_SEND: begin
        if ( !busy_imu ) begin
          data_in_imu_d = 8'b1_011_1100;  // R3C
          start_imu_d = 1'b1;
        end
        if ( new_data_imu ) begin
          testout_d[7:0] = data_out_imu_q[7:0];
          state_imu_d = IMU_IDLE;  //IMU_ACC_XL_READ;
        end
      end

      //IMU_ACC_XL_READ: begin
      //  if ( !busy_imu ) begin
      //    data_in_imu_d = 8'hFF;
      //    start_imu_d = 1'b1;
      //  end
      //  if ( new_data_imu ) begin
      //    testout_d[7:0] = data_out_imu_q[7:0];
      //    state_imu_d = IMU_IDLE;
      //  end
      //end

      // Default to idle
      default: begin
        state_imu_d = IMU_IDLE;
      end

    // End 'imu' state machine
    endcase

  end

  // Synchronous 'clk' logic
  always @( posedge clk ) begin

    if (rst) begin
      data_in_imu_q  <= 8'hFF;
    end else begin
      data_in_imu_q  <= data_in_imu_d;
    end

    state_imu_q    <= state_imu_d;
    start_imu_q    <= start_imu_d;
    data_out_imu_q <= data_out_imu_d;
    testout_q      <= testout_d;
    //new_data_imu_q <= new_data_imu_d;

  end

endmodule



