
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v
// Demonstrate the 'clock' module on hardware.
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
  input avr_rx_busy

  );

  // Swicth reset button
  wire rst = ~rst_n;

  // Clock signals
  wire clk_1hz;
  wire clk_2hz;
  wire clk_4hz;

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led[7:3] = 5'b0;
  assign led[2] = clk_1hz;
  assign led[1] = clk_2hz;
  assign led[0] = clk_4hz;

  // Clock parameters
  parameter
  CYCLES = 50000000,
  PERIOD_2HZ = CYCLES / 2,
  PERIOD_4HZ = CYCLES / 4;

  // Add 1HZ clock module
  clock
    clock_1hz (
    .clk(clk),
    .rst(rst),
    .sig(clk_1hz) );

  // Add 2HZ clock module
  clock #(
    .PERIOD(PERIOD_2HZ) )
    clock_2hz (
    .clk(clk),
    .rst(rst),
    .sig(clk_2hz) );

  // Add 4HZ clock module
  clock #(
    .PERIOD(PERIOD_4HZ) )
    clock_4hz (
    .clk(clk),
    .rst(rst),
    .sig(clk_4hz) );

endmodule



