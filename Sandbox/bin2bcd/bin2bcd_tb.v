
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// bin2bcd_tb.v
// Test bench for the 'bin2bcd' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module bin2bcd_tb ();

  // Test bench inputs
  reg ???;

  // Test bench outputs
  wire ???;
  

  // Initial reset, then clock forever
  initial begin
    clk = 1'b1;
    rst = 1'b1;
    repeat(10) #10 clk = ~clk;
    rst = 1'b0;
    forever #10 clk = ~clk;
  end

  // Assign test stimulus at certain points
  //initial begin

  //end

endmodule



