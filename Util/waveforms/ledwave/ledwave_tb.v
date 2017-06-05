
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// ledwave_tb.v
// Test bench for the 'ledwave' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module ledwave_tb ();

  // Testbench inputs
  reg clk;
  reg rst;

  // Testbench outputs
  wire [7:0] led;

  // PWM signal generator
  ledwave #(
    .CTR(12) )
    DUT_ledwave (
    .clk(clk),
    .rst(rst),
    .led(led) );

  // Initial reset, then run clock forever
  initial begin
    clk = 1'b1;
    rst = 1'b1;
    repeat(10) #10 clk = ~clk;
    rst = 1'b0;
    forever #10 clk = ~clk;
  end

  // Wait for a specified period of time
  initial begin
    #50000000
    $finish;
  end

endmodule



