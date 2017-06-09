
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
  output avr_rx

  );

  // Swicth reset button
  wire rst = ~rst_n;

  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led = led_q;


  // Avionics board states
  localparam
    STATE_BOARD_BITS = 2,
    BOARD_IDLE      = 2'd0,
    BOARD_STARTUP   = 2'd1,
    BOARD_RUNNING   = 2'd2,
    BOARD_SHUTDOWN  = 2'd3;

  // Registers
  reg [STATE_BOARD_BITS-1:0] state_board_d, state_board_q = BOARD_IDLE;
  reg [7:0] led_d, led_q;


  // Combinational logic
  always @(*) begin

    state_board_d = state_board_q;
    led_d = led_q;

    // State machine: avionics board
    case (state_board_q)

      // Wait for user command
      BOARD_IDLE: begin
        led_d = {8{1'b0}};
        if (rst) begin
          state_board_d = BOARD_STARTUP;
        end
      end

      // Implement start up processes
      BOARD_STARTUP: begin
        // Add conditions here
        state_board_d = BOARD_RUNNING;
      end

      // Normal operation until shutdown
      BOARD_RUNNING: begin
        led_d = {8{1'b1}};
        if (rst) begin
          state_board_d = BOARD_SHUTDOWN;
        end
      end

      // Implement shutdown processes
      BOARD_SHUTDOWN: begin
        // Add conditions here
        state_board_d = BOARD_IDLE;
      end

      // Default to idle
      default: begin
        state_board_d = BOARD_IDLE;
      end

    endcase

  end

  // Synchronous clk logic
  always @( posedge clk ) begin
    //if (rst) begin
      //state_board_q <= BOARD_IDLE;
    //end else begin
      //state_board_q <= state_board_d;
    //end

    state_board_q <= state_board_d;
    led_q <= led_d;

  end


endmodule





/*
  // Timestamp: Define parameters
  localparam TIMESTAMP_BIN_BITS = 24;
  localparam TIMESTAMP_BCD_BITS = 31;
  localparam TIMESTAMP_CHAR_LEN = 8;
  localparam TIMESTAMP_ASCII_BITS = 64;
*/
/*
  // Timestamp: Define registers
  wire [23:0] timestamp;
  assign timestamp = timestamp_q;
  reg [23:0] timestamp_d, timestamp_q;
*/
/*
  // Connect 'timers' module
  timers timers_mod (
    .clk(clk),
    .rst(rst),
    .tmr_1khz(tmr_1khz),
    .tmr_10hz(tmr_10hz) );
*/
/*
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
    .rst(rst),
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
    .rst(rst),
    .tmr(tmr_10hz),
    .timestamp(timestamp),
    .tx_data(tx_data),
    .new_tx_data(new_tx_data),
    .tx_busy(tx_busy),
    .rx_data(rx_data),
    .new_rx_data(new_rx_data) );
*/


  // Combinational logic
  //always @(*) begin
  //  timestamp_d = timestamp_q + 1'b1;
  //end
/*
  // Synchronous 1khz logic
  always @( posedge tmr_1khz ) begin
    if (rst) begin
      timestamp_q <= { 24 {1'b0} };
    end else begin
      timestamp_q <= timestamp_d;
    end
  end
*/


//~~~~~~~~~~~~~~~~~~~~~~
/*
  // Serial debug module
  wire debug_busy;
  serial_debug
    #(
    .CLK_PER_BIT(434),
    .MSG_LEN(128)
    ) serial_debug (
    .clk(clk),
    .rst(rst),
    .block(1'b0),
    .send(clk_debug),
    .data(debug_msg_q),
    .busy(debug_busy),
    .tx(debug_tx)
    );

  always @(*) begin

    debug_ctr_d = debug_ctr_q + 1'b1;

    // Debugging message
    debug_msg_d <=
      {
      {debug_ascii[39:8]},
      {"."},
      {debug_ascii[7:0]},
      {" \r"}
      };

  end

*/




