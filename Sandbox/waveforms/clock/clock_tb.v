
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// clock_tb.v
// Test bench for the ‘clock’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module clock_tb ();

  // Testbench inputs
  reg clk;
  reg rst;

  // Testbench outputs
  wire clk_5M;
  wire clk_1M;
  wire clk_4k;

  // Determine period duration
  parameter
  CYCLES = 50000000,
  PERIOD_5M = CYCLES / 5000000,
  PERIOD_1M = CYCLES / 1000000,
  PERIOD_4k = CYCLES / 4000;

  // 5MHz Clock
  clock #(
    .PERIOD(PERIOD_5M) )
    DUT_5M (
    .clk(clk),
    .rst(rst),
    .sig(clk_5M) );

  // 1MHz Clock
  clock #(
    .PERIOD(PERIOD_1M) )
    DUT_1M (
    .clk(clk),
    .rst(rst),
    .sig(clk_1M) );

  // 4kHz Clock
  clock #(
    .PERIOD(PERIOD_4k) )
    DUT_4k (
    .clk(clk),
    .rst(rst),
    .sig(clk_4k) );

  // Run simulation
  initial begin
    clk = 1'b1;
    rst = 1'b1;
    repeat(1000) #10 clk = ~clk;
    rst = 1'b0;
    repeat(1000000) #10 clk = ~clk;
    $finish;
  end

endmodule



