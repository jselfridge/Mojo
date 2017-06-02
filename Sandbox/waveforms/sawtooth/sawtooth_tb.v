
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// sawtooth_tb.v
// Test bench for the ‘sawtooth’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module sawtooth_tb ();

  // Testbench inputs
  reg clk;
  reg rst;

  // Testbench outputs
  wire [4:0] val;

  // Sawtooth counter
  sawtooth #(
    .CTR_BITS(8),
    .VAL_BITS(5) )
    sawtooth_DUT (
    .clk(clk),
    .rst(rst),
    .val(val) );

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



