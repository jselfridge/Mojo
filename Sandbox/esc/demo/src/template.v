
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v (esc demo)
// Demonstrate the 'esc' module implemented on hardware.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module template
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

  // ESC output
  output esc_out

  );

  // Swicth reset button
  wire rst = ~rst_n;

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led = 8'b11000011;

  // Sawtooth signal generates ESC command
  parameter SAW_BITS = 10;
  wire [SAW_BITS-1:0] sawtooth_sig;
  sawtooth
    #(
    .CTR_BITS(31),
    .VAL_BITS(SAW_BITS)
    )
    sawtooth_esc
    (
    .clk(clk),
    .rst(rst),
    .val(sawtooth_sig)
    );

  // Establish 1MHz clock
  wire clk_1M;
  clock
    #(
    .STEP(25),
    .LEN(5)
    )
    clock_1MHz
    (
    .clk(clk),
    .rst(rst),
    .clkout(clk_1M)
    );

  // Connect ESC module
  esc
    esc_demo
    (
    .clk_1M(clk_1M),
    .rst(rst),
    .cmd(sawtooth_sig),
    .esc(esc_out)
    );

endmodule



