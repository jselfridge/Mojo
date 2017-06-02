
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v (timer demo)
// Demonstrate the 'timer' module on hardware.
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

  // Timer signals
  wire tmr_1hz;
  wire tmr_2hz;
  wire tmr_4hz;

  // LED output registers
  reg reg_1hz;
  reg reg_2hz;
  reg reg_4hz;

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led[7] = reg_1hz;
  assign led[6] = reg_2hz;
  assign led[5] = reg_4hz;
  assign led[4:0] = 5'b0;

  // Period durations
  parameter
  CYCLES = 50000000,
  PERIOD_2HZ = CYCLES / 2,
  PERIOD_4HZ = CYCLES / 4;

  // Add 1HZ timer module
  timer timer_1hz (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_1hz) );

  // Add 2HZ timer module
  timer #(
    .PERIOD(PERIOD_2HZ) )
    timer_2hz (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_2hz) );

  // Add 4HZ timer module
  timer #(
    .PERIOD(PERIOD_4HZ) )
    timer_4hz (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_4hz) );

  // Update 1hz register
  always @( posedge tmr_1hz ) begin
    reg_1hz = ~reg_1hz;
  end

  // Update 2hz register
  always @( posedge tmr_2hz ) begin
    reg_2hz = ~reg_2hz;
  end

  // Update 4hz register
  always @( posedge tmr_4hz ) begin
    reg_4hz = ~reg_4hz;
  end

endmodule



