
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// single_to_int_fast_tb.v
// Test bench for the ‘single_to_int_fast’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module single_to_int_fast_tb ();

  // Module inputs
  reg clk;
  reg [31:0] single_input;

  // Module outputs
  wire [31:0] int_output;

  // Connect ‘single_to_int_fast’ module
  single_to_int_fast
    DUT_single_to_int_fast (
    .clk(clk),
    .single_input(single_input),
    .int_output(int_output)
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

  // Assign a variety of 'single_input' values
  initial begin

    //~~~~~~~~~~~~~~~~~~~~~~~ SINGLE ~~~~~~~~ DECIMAL ~~~~~~~~~ INT ~~~~
    #500 single_input = 32'hCF000000;  // -2147483648    0x80000000
    #500 single_input = 32'hC9760000;  //    -1007616    0xFFF0A000
    #500 single_input = 32'hC0000000;  //          -2    0xFFFFFFFE
    #500 single_input = 32'hBF800000;  //          -1    0xFFFFFFFF
    #500 single_input = 32'h00000000;  //           0    0x00000000
    #500 single_input = 32'h3F800000;  //           1    0x00000001
    #500 single_input = 32'h4D000000;  //   134217728    0x08000000
    #500 single_input = 32'h4EFE0000;  //  2130706432    0x7F000000
    #500 single_input = 32'h3F900000;  //       1.125    0x00000001
    #500 single_input = 32'h41196f50;  // 9.589675903    0x00000009
    #500 single_input = 32'h3c4f1d5f;  //  0.01264128    0x00000000
    #500 single_input = 32'h4fb10003;  //  5939136000    0x????????

  end

endmodule



