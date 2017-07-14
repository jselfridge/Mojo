
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
  assign led = 8'b0;

  // Connect 'sawtooth' module for ESC command
  parameter SAW_BITS = 10;
  wire [SAW_BITS-1:0] sawtooth_sig;
  sawtooth #(
    .CTR_BITS(31),
    .VAL_BITS(SAW_BITS) )
    sawtooth_esc (
    .clk(clk),
    .rst(rst),
    .val(sawtooth_sig) );

  // Connect 1MHz timer
  wire tmr_1M;
  timer #(
    .PERIOD(50) )
    timer_1MHz (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_1M)
    );

  // Connect 'esc' module
  esc esc_demo (
    .tmr_1Mhz(tmr_1M),
    .rst(rst),
    .val(sawtooth_sig),
    .sig(esc_out) );

endmodule



