
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// clock_demo.v
// Stand alone demo for the ‘clock’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module clock_demo (

  // Primary signals
  input  clk,                  // Master clock (50MHz)
  input  rst_n,                // Reset signal (active low)
  input  cclk,                 // AVR indicator flag
  output [7:0] led,            // LEDs

  // AVR SPI connections
  input  spi_sck,              // Source clock
  input  spi_ss,               // Slave select
  input  spi_mosi,             // Master-output, Slave-input
  output spi_miso,             // Master-input, Slave-output
  output [3:0] spi_channel,    // AVR ADC channel select

  // Serial connections
  input  avr_tx,               // AVR Tx => FPGA Rx
  output avr_rx,               // AVR Rx => FPGA Tx
  input  avr_rx_busy,          // AVR Rx buffer is full

  );

  // Make reset active high
  wire rst = ~rst_n;

  // Disconnect when not in use
  assign spi_miso     = 1’bz;
  assign avr_rx       = 1’bz;
  assign spi_channel  = 4’bzzzz;

  // Common timing factor
  CYCLES = 50000000 / 2;

  // Determine number of steps
  parameter
    STEP_1M  = CYCLES / 1000000,
    STEP_4k  = CYCLES / 4000,
    STEP_1k  = CYCLES / 1000,
    STEP_100 = CYCLES / 100,
    STEP_10  = CYCLES / 10;

  // Determine counter lengths
  parameter
    LEN_1M  = $clog2(STEP_1M),
    LEN_4k  = $clog2(STEP_4k),
    LEN_1k  = $clog2(STEP_1k),
    LEN_100 = $clog2(STEP_100),
    LEN_10  = $clog2(STEP_10);

  // Setup clock registers
  reg
    clk_1M,
    clk_4k,
    clk_1k,
    clk_100,
    clk_10,
    clk_1;

  // Connect LED to some clocks
  assign led[0] = clk_1;
  assign led[1] = clk_10;
  assign led[2] = clk_100;

  // 1MHz Clock
  clock
    #(
    .LEN(LEN_1M),
    .STEP(STEP_1M)
    ) clk_1M (
    .clk(clk),
    .rst(rst),
    .clkout(clk_1M)
    );

  // 4kHz Clock
  clock
    #(
    .LEN(LEN_4k),
    .STEP(STEP_4k)
    ) clk_4k (
    .clk(clk),
    .rst(rst),
    .clkout(clk_4k)
    );

  // 1kHz Clock
  clock
    #(
    .LEN(LEN_1k),
    .STEP(STEP_1k)
    ) clk_1k (
    .clk(clk),
    .rst(rst),
    .clkout(clk_1k)
    );

  // 100Hz Clock
  clock
    #(
    .LEN(LEN_100),
    .STEP(STEP_100)
    ) clk_100 (
    .clk(clk),
    .rst(rst),
    .clkout(clk_100)
    );

  // 10Hz Clock
  clock
    #(
    .LEN(LEN_10),
    .STEP(STEP_10)
    ) clk_10 (
    .clk(clk),
    .rst(rst),
    .clkout(clk_10)
    );

  // 1Hz Clock
  clock clk_1
    (
    .clk(clk),
    .rst(rst),
    .clkout(clk_1)
    );

endmodule



