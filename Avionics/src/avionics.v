
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// avionics.v
// Top-level module for the avionics board.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module avionics
  (

  // Clocks and hardware
  input  clk,
  input  rst_n,
  input  cclk,
  output [7:0] led,

  // AVR SPI connections
  input  spi_sck,
  input  spi_ss,
  input  spi_mosi,
  output spi_miso,
  output [3:0] spi_ch,

  // AVR serial connections
  input  avr_tx,
  input  avr_rx_busy,
  output avr_rx,

  // Radio input signals
  input  [7:0] radio_sig,

  // ESC output signals
  output [7:0] esc_sig,

  // IMU SPI pins
  input  imu_miso,
  output imu_mosi,
  output imu_sck,
  output imu_ss

  );




  // Assign LED values
  assign led = data_out_imu;
  //assign led = led_q;

  // Assign IMU SPI outputs
  assign imu_mosi = mosi_imu;
  assign imu_sck = sck_imu;
  assign imu_ss = ss_imu_q;




  // Avionics board states
  localparam
    BOARD_BITS      = 2,
    BOARD_IDLE      = 2'd0,
    BOARD_STARTUP   = 2'd1,
    BOARD_RUNNING   = 2'd2,
    BOARD_SHUTDOWN  = 2'd3;

  // IMU sensor states
  localparam
    IMU_BITS      = 2,
    IMU_IDLE      = 2'd0,
    IMU_SEND_AX   = 2'd1,
    IMU_READ_AX   = 2'd2;
  //IMU_SEND_AY   = 2'dX,
  //IMU_READ_AY   = 2'dX,
  //IMU_SEND_AZ   = 2'dX,
  //IMU_READ_AZ   = 2'dX,




  // Registers
  reg [BOARD_BITS-1:0] state_board_d, state_board_q = BOARD_IDLE;
  reg [IMU_BITS-1:0] state_imu_d, state_imu_q = IMU_IDLE;
  reg state_motor_d, state_motor_q = 1'b0;
  reg [7:0] led_d, led_q;
  reg reset_d, reset_q;
  reg reset_prev_d, reset_prev_q;
  reg motor_d, motor_q;
  reg motor_prev_d, motor_prev_q;
  reg [23:0] timestamp_d, timestamp_q;
  reg [7:0] data_in_imu_d, data_in_imu_q = 8'hFF;
  reg start_imu_d, start_imu_q;
  reg ss_imu_d, ss_imu_q;



  // Connections for 'avr_interface' module
  wire [7:0] tx_data;
  wire new_tx_data;
  wire tx_busy;
  wire [7:0] rx_data;
  wire new_rx_data;

  // Disconnected wires for 'avr_interface' module
  (* keep="soft" *) wire new_sample_z;
  (* keep="soft" *) wire [9:0] sample_z;
  (* keep="soft" *) wire [3:0] sample_channel_z;

  // Connect 'avr_interface' module
  avr_interface avr_mod (
    .clk(clk),
    .rst( state_board_q == BOARD_IDLE ),
    .cclk(cclk),
    .spi_sck(spi_sck),
    .spi_ss(spi_ss),
    .spi_mosi(spi_mosi),
    .spi_miso(spi_miso),
    .spi_ch(spi_ch),
    .rx(avr_tx),
    .tx(avr_rx),
    .channel(4'd15),
    .new_sample(new_sample_z),
    .sample(sample_z),
    .sample_channel(sample_channel_z),
    .tx_data(tx_data),
    .new_tx_data(new_tx_data),
    .tx_block(avr_rx_busy),
    .tx_busy(tx_busy),
    .rx_data(rx_data),
    .new_rx_data(new_rx_data) );




  // Connect 'button' module for reset 
  wire rst;
  button button_reset (
    .clk(clk),
    .btn_i(!rst_n),
    .btn_o(rst) );

  // Connect 'timers' module
  timers timers_mod (
    .clk(clk),
    .rst( state_board_q == BOARD_IDLE ),
    .tmr_1Mhz(tmr_1Mhz),
    .tmr_1khz(tmr_1khz),
    .tmr_10hz(tmr_10hz) );




  // Connect 'debugging' module 
  debugging debug_mod (
    .clk(clk),
    .rst( state_board_q == BOARD_IDLE ),
    .tmr(tmr_10hz),
    .timestamp(timestamp_q),
    //.radio_val(radio_val[39:0]),
    .tx_data(tx_data),
    .new_tx_data(new_tx_data),
    .tx_busy(tx_busy),
    .rx_data(rx_data),
    .new_rx_data(new_rx_data) );




  // Connect 'inputs' module
  wire [79:0] radio_val;
  inputs inputs_mod (
    .tmr_1Mhz(tmr_1Mhz),
    .rst( state_board_q == BOARD_IDLE ),
    .radio_sig(radio_sig),
    .radio_val(radio_val) );


  // Connect 'control' module


  // Connect 'outputs' module
  outputs outputs_mod (
    .tmr_1Mhz(tmr_1Mhz),
    .rst( ( state_board_q == BOARD_IDLE ) || (!state_motor_q) ),
    .esc_val(radio_val),  // REVISE!!!
    .esc_sig(esc_sig) );




  // Connect 'flags' module
  wire motor_flag;
  (* keep="soft" *) wire data_flag_z;
  (* keep="soft" *) wire reset_flag_z;
  (* keep="soft" *) wire power_flag_z;
  flags flags_mod (
    .tmr_10hz(tmr_10hz),
    .radio_val(radio_val[39:0]),
    .motor_flag(motor_flag),
    .data_flag(data_flag_z),
    .reset_flag(reset_flag_z),
    .power_flag(power_flag_z) );




  // Connect 'spi_master' module for IMU
  wire sck_imu;
  wire busy_imu;
  wire new_data_imu;
  wire mosi_imu;
  wire [7:0] data_out_imu;
  spi_master_11 #(
    .CLK_DIV(6) )
    spi_master_imu (
    .clk(clk),
    .rst( state_board_q == BOARD_IDLE ),
    .start(start_imu_q),  // Where des this go ???
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
    state_board_d  = state_board_q;
    state_imu_d    = state_imu_q;
    start_imu_d    = 1'b0;
    ss_imu_d       = 1'b1;
    led_d          = led_q;
    reset_d        = rst; // OR RESET_FALG
    reset_prev_d   = reset_q;
    state_motor_d  = state_motor_q;
    motor_d        = motor_flag;
    motor_prev_d   = motor_q;
    timestamp_d    = timestamp_q + 1'b1;
    data_in_imu_d  = 8'hFF;

    // Switch motor state
    if ( !motor_prev_q && motor_q ) begin
      state_motor_d = ~state_motor_q;
    end

    // State machine: avionics board
    case (state_board_q)

      // Wait for user command
      BOARD_IDLE: begin
        led_d = { 8{1'b1} };
        //if ( !reset_prev_q && reset_q ) begin
          state_board_d = BOARD_STARTUP;
        //end
      end

      // Implement start up processes
      BOARD_STARTUP: begin
        // Add conditions here
        //led_d = { 8{1'b1} };
        //if ( !reset_prev_q && reset_q ) begin
          state_board_d = BOARD_RUNNING;
        //end
      end

      // Normal operation until shutdown
      BOARD_RUNNING: begin
        led_d = { 8{1'b0} };
        if ( !reset_prev_q && reset_q ) begin
          state_board_d = BOARD_SHUTDOWN;
        end
      end

      // Implement shutdown processes
      BOARD_SHUTDOWN: begin
        // Add conditions here
        //led_d = { 8{1'b1} };
        //if ( !reset_prev_q && reset_q ) begin
          state_board_d = BOARD_IDLE;
        //end
      end

      // Default to idle
      default: begin
        state_board_d = BOARD_IDLE;
      end

    // End 'board' state machine
    endcase

    // State machine: imu
    case (state_imu_q)

      // Wait for next timer pulse
      IMU_IDLE: begin
        ss_imu_d = 1'b1;
        if ( tmr_10hz ) begin  // CHANGE TO 1kHz !!!
          state_imu_d = IMU_SEND_AX;
          ss_imu_d = 1'b0;
        end
      end

      // Send command for acc x-axis data
      IMU_SEND_AX: begin
        ss_imu_d = 1'b0;
        data_in_imu_d = 8'h3B;
        if ( !busy_imu )
          start_imu_d = 1'b1;
        if ( new_data_imu )
          ss_imu_d = 1'b1;
          state_imu_d = IMU_READ_AX;
      end

      // Send dummy byte and read acc x-axis data
      IMU_READ_AX: begin
        ss_imu_d = 1'b0;
        data_in_imu_d = 8'hFF;
        if ( !busy_imu )
          start_imu_d = 1'b1;
        if ( new_data_imu )
          ss_imu_d = 1'b1;
          state_imu_d = IMU_IDLE;
      end

      // Default to idle
      default: begin
        ss_imu_d = 1'b1;
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

    led_q          <= led_d;
    state_board_q  <= state_board_d;
    state_imu_q    <= state_imu_d;
    start_imu_q    <= start_imu_d;
    ss_imu_q       <= ss_imu_d;
    reset_q        <= reset_d;
    reset_prev_q   <= reset_prev_d;
    state_motor_q  <= state_motor_d;
    motor_q        <= motor_d;
    motor_prev_q   <= motor_prev_d;
  end




  // Synchronous '1khz' logic
  always @( posedge tmr_1khz ) begin
    if ( state_board_q != BOARD_RUNNING ) begin
      timestamp_q <= { 24{1'b0} };
    end else begin
      timestamp_q <= timestamp_d;
    end
  end




endmodule



