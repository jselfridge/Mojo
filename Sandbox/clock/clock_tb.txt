
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// clock_tb.v
// Test bench for the ‘clock’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module clock_tb ();

  // Testbench inputs
  reg clk, rst;

  // Testbench outputs
  wire clkout_1M;
  wire clkout_4k;
  wire clkout_1k;
  wire clkout_100;
  wire clkout_10;
  wire clkout_1;

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

  // 1MHz Clock
  clock
    #(
    .LEN(LEN_1M),
    .STEP(STEP_1M)
    ) DUT_1M (
    .clk(clk),
    .rst(rst),
    .clkout(clkout_1M)
    );

  // 4kHz Clock
  clock
    #(
    .LEN(LEN_4k),
    .STEP(STEP_4k)
    ) DUT_4k (
    .clk(clk),
    .rst(rst),
    .clkout(clkout_4k)
    );

  // 1kHz Clock
  clock
    #(
    .LEN(LEN_1k),
    .STEP(STEP_1k)
    ) DUT_1k (
    .clk(clk),
    .rst(rst),
    .clkout(clkout_1k)
    );

  // 100Hz Clock
  clock
    #(
    .LEN(LEN_100),
    .STEP(STEP_100)
    ) DUT_100 (
    .clk(clk),
    .rst(rst),
    .clkout(clkout_100)
    );

  // 10Hz Clock
  clock
    #(
    .LEN(LEN_10),
    .STEP(STEP_10)
    ) DUT_10 (
    .clk(clk),
    .rst(rst),
    .clkout(clkout_10)
    );

  // 1Hz Clock
  clock DUT_1
    (
    .clk(clk),
    .rst(rst),
    .clkout(clkout_1)
    );

  // Begin simulation
  initial begin

    clk = 1'b0;
    rst = 1'b1;

    repeat(5000000)
    #1 clk = ~clk;

    rst = 1'b0;

    repeat(100000000)
    #1 clk = ~clk;

    $finish;

  end

endmodule



