
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// int_to_single_fast_tb.v
// Test bench for the ‘int_to_single_fast’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module int_to_single_fast_tb ();

  // Module inputs
  reg clk;
  reg [31:0] int_input;

  // Module outputs
  wire [31:0] single_output;

  // Connect ‘int_to_single_fast’ module
  int_to_single_fast
    DUT_int_to_single_fast (
    .clk(clk),
    .int_input(int_input),
    .single_output(single_output)
  );

  // Clock signal
  initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
  end

  // Sim duration
  initial begin
    #11000 $finish;
  end

  // Assign a variety of 'int_input' values
  initial begin

    //~~~~~~~~~~~~~~~~ SIGNED INT ~~~~~~~~ DECIMAL ~~~ FLOAT HEX ~~~~
    #500 int_input = 32'h80000000;  // -2147483648    0xCF000000
    #500 int_input = 32'hC0000000;  // -1073741824    0xCE800000
    #500 int_input = 32'hF9000000;  //  -117440512    0xCCE00000
    #500 int_input = 32'hFFF0A000;  //    -1007616    0xC9760000
    #500 int_input = 32'hFFFFF020;  //       -4064    0xC57E0000
    #500 int_input = 32'hFFFFFFF0;  //         -16    0xC1800000
    #500 int_input = 32'hFFFFFFFE;  //          -2    0xC0000000
    #500 int_input = 32'hFFFFFFFF;  //          -1    0xBF800000
    #500 int_input = 32'h00000000;  //           0    0x00000000
    #500 int_input = 32'h00000001;  //           1    0x3F800000
    #500 int_input = 32'h0000000F;  //          15    0x41700000
    #500 int_input = 32'h00000400;  //        1024    0x44800000
    #500 int_input = 32'h0000D000;  //       53248    0x47500000
    #500 int_input = 32'h00090000;  //      589824    0x49100000
    #500 int_input = 32'h00A00000;  //    10485760    0x4B200000
    #500 int_input = 32'h08000000;  //   134217728    0x4D000000
    #500 int_input = 32'h10000000;  //   268435456    0x4D800000
    #500 int_input = 32'h40000000;  //  1073741824    0x4E800000
    #500 int_input = 32'h7F000000;  //  2130706432    0x4EFE0000
    #500 int_input = 32'h7FFFFFFF;  //  2147483647    0x4F000000

  end

endmodule



