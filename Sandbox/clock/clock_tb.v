
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// clock_tb.v
// Test bench for the ‘clock’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module clock_tb ();

  // Testbench inputs
  reg clk;
  reg rst;

  // Testbench outputs
  wire clkout_5M;
  wire clkout_1M;
  wire clkout_4k;

  // Common timing factor
  parameter
  CYCLES = 50000000;

  // Determine period suration
  parameter
  DUR_5M  = CYCLES / 5000000,
  DUR_1M  = CYCLES / 1000000,
  DUR_4k  = CYCLES / 4000;

  // 5MHz Clock
  clock
    #(
    .DUR(DUR_5M)
    ) DUT_5M (
    .clk(clk),
    .rst(rst),
    .clkout(clkout_5M)
    );

  // 1MHz Clock
  clock
    #(
    .DUR(DUR_1M)
    ) DUT_1M (
    .clk(clk),
    .rst(rst),
    .clkout(clkout_1M)
    );

  // 4kHz Clock
  clock
    #(
    .DUR(DUR_4k)
    ) DUT_4k (
    .clk(clk),
    .rst(rst),
    .clkout(clkout_4k)
    );

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



