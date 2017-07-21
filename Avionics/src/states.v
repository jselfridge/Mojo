
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
  output [47:0] acc
  //output [47:0] gyr,
  //output [47:0] mag
  );

  // Assign SPI outputs
  assign imu_mosi = mosi_imu;
  assign imu_sclk = sclk_imu;
  assign imu_ss = !busy_imu;

  // Assign sensor data outputs
  assign acc = acc_q;
  //assign gyr = gyr_q;
  //assign mag = mag_q;

  // IMU sensor states
  localparam
    IMU_BITS    = 5,
    IMU_IDLE    = 5'd0,
    IMU_ACC_XH  = 5'd1,
    IMU_ACC_XL  = 5'd2,
    IMU_ACC_YH  = 5'd3,
    IMU_ACC_YL  = 5'd4,
    IMU_ACC_ZH  = 5'd5,
    IMU_ACC_ZL  = 5'd6,
/*
    IMU_GYR_XH  = 5'd7,
    IMU_GYR_XL  = 5'd8,
    IMU_GYR_YH  = 5'd9,
    IMU_GYR_YL  = 5'd10,
    IMU_GYR_ZH  = 5'd11,
    IMU_GYR_ZL  = 5'd12,
    IMU_MAG_XH  = 5'd13,
    IMU_MAG_XL  = 5'd14,
    IMU_MAG_YH  = 5'd15,
    IMU_MAG_YL  = 5'd16,
    IMU_MAG_ZH  = 5'd17,
    IMU_MAG_ZL  = 5'd18,
*/
    IMU_FLUSH   = 5'd7;

  // Declare registers
  reg [IMU_BITS-1:0] state_imu_d, state_imu_q = IMU_IDLE;
  reg [7:0] addr_imu_d, addr_imu_q;
  reg start_imu_d, start_imu_q = 1'b0;
  reg finish_imu_d, finish_imu_q = 1'b0;
  reg [7:0] data_imu_d, data_imu_q;
  reg [47:0] acc_d, acc_q = 48'h000000000000;
  //reg [47:0] gyr_d, gyr_q = 48'h000000000000;
  //reg [47:0] mag_d, mag_q = 48'h000000000000;

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
    state_imu_d    = state_imu_q;
    addr_imu_d  = addr_imu_q;
    start_imu_d    = 1'b0;
    finish_imu_d = finish_imu;
    data_imu_d = data_imu;
    acc_d          = acc_q;
    //gyr_d          = gyr_q;
    //mag_d          = mag_q;

    // Begin 'imu' state machine
    case (state_imu_q)

      // Wait for next timer pulse
      IMU_IDLE: begin
        if ( tmr_1khz ) begin
          state_imu_d = IMU_ACC_XH;
        end
      end

      // Acc X-axis high byte
      IMU_ACC_XH: begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b1_011_1011;  // R3B
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          state_imu_d = IMU_ACC_XL;
        end
      end

      // Acc X-axis low byte
      IMU_ACC_XL: begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b1_011_1100;  // R3C
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          acc_d[47:40] = data_imu_q;
          state_imu_d = IMU_ACC_YH;
        end
      end

      // Acc Y-axis high byte
      IMU_ACC_YH: begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b1_011_1101;  // R3D
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          acc_d[39:32] = data_imu_q;
          state_imu_d = IMU_ACC_YL;
        end
      end

      // Acc Y-axis low byte
      IMU_ACC_YL: begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b1_011_1110;  // R3E
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          acc_d[31:24] = data_imu_q;
          state_imu_d = IMU_ACC_ZH;
        end
      end


      // Acc Z-axis high byte
      IMU_ACC_ZH: begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b1_011_1111;  // R3F
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          acc_d[23:16] = data_imu_q;
          state_imu_d = IMU_ACC_ZL;
        end
      end

      // Acc Z-axis low byte
      IMU_ACC_ZL: begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'b1_100_0000;  // R40
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          acc_d[15:8] = data_imu_q;
          state_imu_d = IMU_FLUSH;
        end
      end

      // Flush out last byte with dummy address
      IMU_FLUSH: begin
        if ( !busy_imu ) begin
          addr_imu_d = 8'hFF;
          start_imu_d = 1'b1;
        end
        if ( finish_imu_q ) begin
          acc_d[7:0] = data_imu_q;
          state_imu_d = IMU_IDLE;
        end
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
    acc_q         <= acc_d;

  end

endmodule



