
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// sawtooth_tb.v
// Test bench for the ‘sawtooth’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module sawtooth_tb ();

  // Testbench inputs
  reg clk, rst;

  // Testbench outputs
  wire [6:0] val;

  // Sawtooth counter
  sawtooth
    #(
    .CTR_BITS(20),
    .VAL_BITS(7)
    ) DUT (
    .clk(clk),
    .rst(rst),
    .val(val)
    );

  // Begin simulation
  initial begin
    clk = 1'b1;
    rst = 1'b1;
    repeat(10) #10 clk = ~clk;
    rst = 1'b0;
    forever #10 clk = ~clk;
  end

  // Add testing stimulus
  initial begin
    #100000000
    $finish;
  end

endmodule



