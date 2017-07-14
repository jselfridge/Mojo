
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// avionics.v
// Top-level module for the avionics board.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module avionics
  (

  // Clocks and hardware
  input clk,
  input rst_n,
  input cclk,
  output [7:0] led,

  // AVR SPI connections
  input spi_sck,
  input spi_ss,
  input spi_mosi,
  output spi_miso,
  output [3:0] spi_ch,

  // AVR serial connections
  input avr_tx,
  input avr_rx_busy,
  output avr_rx,

  // Radio command input signals
  input ch1_isig,
  input ch2_isig,
  //input ch3_isig,
  //input ch4_isig,
  //input ch5_isig,
  //input ch6_isig,
  //input ch7_isig,
  //input ch8_isig,

  // ESC command output signals
  output ch1_osig,

  // Servo command output signals
  output ch5_osig

  );




  // Assign LED values
  assign led = led_q;




  // Avionics board states
  localparam
    BOARD_BITS      = 2,
    BOARD_IDLE      = 2'd0,
    BOARD_STARTUP   = 2'd1,
    BOARD_RUNNING   = 2'd2,
    BOARD_SHUTDOWN  = 2'd3;




  // Registers
  reg [BOARD_BITS-1:0] state_board_d, state_board_q = BOARD_IDLE;
  reg state_motor_d, state_motor_q = 1'b0;
  reg [7:0] led_d, led_q;
  reg onoff_d, onoff_q;
  reg onoff_prev_d, onoff_prev_q;
  reg motor_d, motor_q;
  reg motor_prev_d, motor_prev_q;
  reg [23:0] timestamp_d, timestamp_q;




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

  // DEBUG: Connect 5hz clock
  wire clk_5hz;
  clock #(
    .PERIOD(10000000) )
    clock_5hz_debug (
    .clk(clk),
    .rst( state_board_q == BOARD_IDLE ),
    .sig(clk_5hz) );




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

  // Connect 'debugging' module 
  debugging debug_mod (
    .clk(clk),
    .rst( state_board_q == BOARD_IDLE ),
    .tmr(tmr_10hz),
    .timestamp(timestamp_q),
    .tx_data(tx_data),
    .new_tx_data(new_tx_data),
    .tx_busy(tx_busy),
    .rx_data(rx_data),
    .new_rx_data(new_rx_data) );

  // Connect 'radio' module for CH1 input
  wire [9:0] ch1_ival;
  radio #(
    .DEFAULT(10'd0) )
    radio_ch1 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst( state_board_q == BOARD_IDLE ),
    .sig(ch1_isig),
    .val(ch1_ival) );

  // Connect 'radio' module for CH2 input
  wire [9:0] ch2_ival;
  radio #(
    .DEFAULT(10'd512) )
    radio_ch2 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst( state_board_q == BOARD_IDLE ),
    .sig(ch2_isig),
    .val(ch2_ival) );

  // Connect 'esc' module for CH1 output
  esc esc_ch1 (
    .tmr_1Mhz(tmr_1Mhz),
    .rst( ( state_board_q == BOARD_IDLE ) || (!state_motor_q) ),
    .val(ch1_ival),
    .sig(ch1_osig) );

  // Connect 'servo' module for CH5 output
  servo servo_ch5 (
    .clk(clk),
    .rst( ( state_board_q == BOARD_IDLE ) || (!state_motor_q) ),
    .val(ch2_ival[9:2]),
    .sig(ch5_osig) );




  // Connect 'flags' module
  wire motor_flag;
  (* keep="soft" *) wire data_flag_z;
  flags flags_mod (
    .tmr_10hz(tmr_10hz),
    .thrl_val_i(ch1_ival),
    .elev_val_i(ch2_ival),
    .motor_flag_o(motor_flag),
    .data_flag_o(data_flag_z)
  );




  // Combinational logic
  always @(*) begin

    // Initial assignments
    state_board_d  = state_board_q;
    led_d          = led_q;
    onoff_d        = rst;
    onoff_prev_d   = onoff_q;
    state_motor_d  = state_motor_q;
    motor_d        = motor_flag;
    motor_prev_d   = motor_q;
    timestamp_d    = timestamp_q + 1'b1;

    // Switch motor state
    if ( !motor_prev_q && motor_q ) begin
      state_motor_d = ~state_motor_q;
    end

    // State machine: avionics board
    case (state_board_q)

      // Wait for user command
      BOARD_IDLE: begin
        led_d = { 8{1'b0} };
        if ( !onoff_prev_q && onoff_q ) begin
          state_board_d = BOARD_STARTUP;
        end
      end

      // Implement start up processes
      BOARD_STARTUP: begin
        // Add conditions here
        led_d = { 8{clk_5hz} };
        if ( !onoff_prev_q && onoff_q ) begin
          state_board_d = BOARD_RUNNING;
        end
      end

      // Normal operation until shutdown
      BOARD_RUNNING: begin
        led_d = timestamp_q[12:5];
        if ( !onoff_prev_q && onoff_q ) begin
          state_board_d = BOARD_SHUTDOWN;
        end
      end

      // Implement shutdown processes
      BOARD_SHUTDOWN: begin
        // Add conditions here
        led_d = { 8{clk_5hz} };
        if ( !onoff_prev_q && onoff_q ) begin
          state_board_d = BOARD_IDLE;
        end
      end

      // Default to idle
      default: begin
        state_board_d = BOARD_IDLE;
      end

    endcase

  end




  // Synchronous 'clk' logic
  always @( posedge clk ) begin
    led_q          <= led_d;
    state_board_q  <= state_board_d;
    onoff_q        <= onoff_d;
    onoff_prev_q   <= onoff_prev_d;
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



