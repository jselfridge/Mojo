
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v (radio demo)
// Demonstrate 'radio' module implemented on hardware.
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

  // Radio input
  input radio_in

  );

  // Swicth reset button
  wire rst = ~rst_n;

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led = radio_val[9:2];

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

  // Connect radio module
  wire [9:0] radio_val;
  radio
    radio_demo
    (
    .clk_1M(clk_1M),
    .rst(rst),
    .radio_in(radio_in),
    .cmd(radio_val)
  );

endmodule



