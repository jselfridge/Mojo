
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
  wire clkout_1hz;
  wire clkout_2hz;
  wire clkout_5hz;

  // LED output registers
  reg reg_1hz;
  reg reg_2hz;
  reg reg_5hz;

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led[0] = reg_1hz;
  assign led[1] = reg_2hz;
  assign led[2] = reg_5hz;
  assign led[7:3] = 5'b0;

  // Clock parameters
  parameter
  CYCLES = 50000000,
  DUR_2HZ = CYCLES / 2,
  DUR_5HZ = CYCLES / 5;

  // Add 1HZ clock module
  clock
    clock_1hz (
    .clk(clk),
    .rst(rst),
    .clkout(clkout_1hz) );

  // Add 2HZ clock module
  clock #(
    .DUR(DUR_2HZ) )
    clock_2hz (
    .clk(clk),
    .rst(rst),
    .clkout(clkout_2hz) );

  // Add 5HZ clock module
  clock #(
    .DUR(DUR_5HZ) )
    clock_5hz (
    .clk(clk),
    .rst(rst),
    .clkout(clkout_5hz) );

  always @( posedge clkout_1hz ) begin
    reg_1hz = ~reg_1hz;
  end

  always @( posedge clkout_2hz ) begin
    reg_2hz = ~reg_2hz;
  end

  always @( posedge clkout_5hz ) begin
    reg_5hz = ~reg_5hz;
  end

endmodule



