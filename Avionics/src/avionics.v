
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

  // Serial connections
  input avr_tx,
  output avr_rx,
  input avr_rx_busy,

  // Serial debugging pin
  output debug_tx

  );

  // Swicth reset button
  wire rst = ~rst_n;

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led = 8'b0;

  // Registers
  reg [13:0] debug_ctr_d, debug_ctr_q;
  reg [(10*8)-1:0] debug_msg_d, debug_msg_q;

  // Serial debug clock
  wire clk_debug;
  clock #(
    .STEP(5000000)
    ) clock_debug (
    .clk(clk),
    .rst(rst),
    .clkout(clk_debug) );

  // Time stamp: binary to bcd
  wire [(14*4)-1:0] debug_bcd;
  bin2bcd
    #(
    .LEN(14)
    ) timestamp_bin2bcd (
    .bin(debug_ctr_q),
    .bcd(debug_bcd)
  );

  // Time stamp: bcd to ascii
  wire [(5*8)-1:0] debug_ascii;
  bcd2ascii
    #(
    .CHAR_LEN(5)
    ) timestamp_bcd2ascii (
    .bcd(debug_bcd),
    .ascii(debug_ascii)
    );

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

  always @( posedge clk_debug) begin

    if (rst) begin
      debug_ctr_q <= 1'b0;
      debug_msg_q <= "         \r";
    end else begin
      debug_ctr_q <= debug_ctr_d;
      debug_msg_q <= debug_msg_d;
    end


  end

endmodule



