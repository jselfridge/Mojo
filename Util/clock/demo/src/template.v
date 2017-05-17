
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// template.v
// Template module to establish new FPGA projects.
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

  // These signals should be disconnected when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_ch = 4'bzzzz;

  // Assign LED values
  assign led[7:3] = 5'b0;

  // Clock parameters
  parameter CYCLES = 50000000 / 2;
  parameter
    STEP_2HZ = CYCLES / 2,
    STEP_5HZ = CYCLES / 5;
  parameter
    LEN_2HZ  = $clog2(STEP_2HZ),
    LEN_5HZ  = $clog2(STEP_2HZ);

  // Add 1HZ clock module
  clock clock_1Hz 
    (
    .clk(clk),
    .rst(rst),
    .clkout(led[0])
    );

  // Add 2HZ clock module
  clock
    #(
	 .STEP(STEP_2HZ),
	 .LEN(LEN_2HZ)
    ) clock_2Hz (
    .clk(clk),
    .rst(rst),
    .clkout(led[1])
    );

  // Add 5HZ clock module
  clock
    #(
	 .STEP(STEP_5HZ),
	 .LEN(LEN_5HZ)
    ) clock_5Hz (
    .clk(clk),
    .rst(rst),
    .clkout(led[2])
    );

endmodule



