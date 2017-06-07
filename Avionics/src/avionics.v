
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

  // Assign LED values
  assign led = 8'b01100110;

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
    .tx_data(tx_data),
    .new_tx_data(new_tx_data),
    .tx_busy(tx_busy),
    .rx_data(rx_data),
    .new_rx_data(new_rx_data) );

  // Connect 'timers' module
  timers timers_mod (
    .clk(clk),
    .rst(rst),
    .tmr_1khz(tmr_1khz),
    .tmr_10hz(tmr_10hz) );

/*  // Timestamp: Define parameters
  localparam TIMESTAMP_BIN_BITS = 24;
  localparam TIMESTAMP_BCD_BITS = 31;
  localparam TIMESTAMP_CHAR_LEN = 8;
  localparam TIMESTAMP_ASCII_BITS = 64;
*/
  // Timestamp: Define registers
  //reg [ TIMESTAMP_BIN_BITS-1 : 0 ] timestamp_bin_d, timestamp_bin_q;

/*  // Timestamp: Convert binary to bcd
  wire [ TIMESTAMP_BCD_BITS-1 : 0 ] timestamp_bcd;
  bin2bcd #(
    .BITS(TIMESTAMP_BIN_BITS) )
    bin2bcd_timestamp (
    .bin(timestamp_bin_q),
    .bcd(timestamp_bcd) );
*/
/*  // Timestamp: Convert bcd to ascii
  wire [ TIMESTAMP_ASCII_BITS-1 : 0 ] timestamp_ascii;
  bcd2ascii #(
    .CHAR_LEN(TIMESTAMP_CHAR_LEN) )
    bcd2ascii_timestamp (
    .bcd({1'b0,timestamp_bcd}),
    .ascii(timestamp_ascii) );
*/
/*  // Combinational logic
  always @(*) begin
    timestamp_bin_d = timestamp_bin_q + 1'b1;
  end
*/
/*  // Refresh timestamp register
  always @( posedge tmr_1khz ) begin
    if (rst) begin
      timestamp_bin_q <= { TIMESTAMP_BIN_BITS {1'b0} };
    end else begin
      timestamp_bin_q <= timestamp_bin_d;
    end
  end
*/
endmodule




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




