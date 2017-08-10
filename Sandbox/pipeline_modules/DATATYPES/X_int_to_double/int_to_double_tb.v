
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// insert_name_tb.v
// Test bench for the ‘insert_name’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module insert_name_tb ();

  // Parameters
  localparam SOME_PARAM = 2'd3;

  // Module inputs
  reg clk;
  reg rst;
  reg [2:0] an_input;

  // Module outputs
  wire [7:0] an_output;

  // Connect ‘insert_name’ module
  insert_name #(
    .PARAM(3) ) 
    DUT_name (
    .clk(clk),
    .rst(rst),
    .my_input(an_input),
    .my_output(an_output)
  );

  // Clock signal
  initial begin
    clk = 1’b0;
    forever #10 clk = ~clk;
  end

  // System reset
  initial begin
    rst = 1’b1;
    #50 rst = 1’b0;
  end

  // Sim duration
  initial begin
    #1000000 $finish;
  end

  // Add custom code here
  initial begin

  end

endmodule



