
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// timer_tb.v
// Test bench for the ‘timer’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module timer_tb ();

  // Testbench inputs
  reg clk;
  reg rst;

  // Testbench outputs
  wire tmr_5M;
  wire tmr_1M;
  wire tmr_4k;

  // Determine period duration
  parameter
  CYCLES = 50000000,
  PERIOD_5M = CYCLES / 5000000,
  PERIOD_1M = CYCLES / 1000000,
  PERIOD_4k = CYCLES / 4000;

  // 5MHz Timer
  timer #(
    .PERIOD(PERIOD_5M) )
    DUT_5M (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_5M) );

  // 1MHz Timer
  timer #(
    .PERIOD(PERIOD_1M) )
    DUT_1M (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_1M) );

  // 4kHz Timer
  timer #(
    .PERIOD(PERIOD_4k) )
    DUT_4k (
    .clk(clk),
    .rst(rst),
    .tmr(tmr_4k) );

  // Run simulation
  initial begin
    clk = 1'b1;
    rst = 1'b1;
    repeat(10) #10 clk = ~clk;
    rst = 1'b0;
    repeat(1000000) #10 clk = ~clk;
    $finish;
  end

endmodule



