
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// long_to_double_fast_tb.v
// Test bench for the ‘long_to_double_fast’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module long_to_double_fast_tb ();

  // Module inputs
  reg clk;
  reg [63:0] long_input;

  // Module outputs
  wire [63:0] double_output;

  // Connect ‘long_to_double_fast’ module
  long_to_double_fast
    DUT_long_to_double_fast (
    .clk(clk),
    .long_input(long_input),
    .double_output(double_output)
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

  // Assign a variety of 'long_input' values
  initial begin

    //~~~~~~~~~~~~~~~~~~~~~~~~ SIGNED LONG ~~~~~~~~~~~~~~~~~ DECIMAL ~~~~~~~~~~~ FLOAT HEX ~~~~
    #500 long_input = 64'h8000000000000000;  // -9223372036854775808    0xC3E0000000000000
    #500 long_input = 64'hC000000000000000;  // -4611686018427387904    0xC3D0000000000000
    #500 long_input = 64'hF000000000000000;  // -1152921504606846976    0xC3B0000000000000
    #500 long_input = 64'hFFFFF00000000000;  //      -17592186044416    0xC2B0000000000000
    #500 long_input = 64'hFFFFFFFFF0000000;  //           -268435456    0xC1B0000000000000
    #500 long_input = 64'hFFFFFFFFFFFFFFF0;  //                  -16    0xC030000000000000
    #500 long_input = 64'hFFFFFFFFFFFFFFFE;  //                   -2    0xC000000000000000
    #500 long_input = 64'hFFFFFFFFFFFFFFFF;  //                   -1    0xBFF0000000000000
    #500 long_input = 64'h0000000000000000;  //                    0    0x0000000000000000
    #500 long_input = 64'h0000000000000001;  //                    1    0x3FF0000000000000
    #500 long_input = 64'h000000000000000F;  //                   15    0x402E000000000000
    #500 long_input = 64'h0000000000500000;  //              5242880    0x4154000000000000
    #500 long_input = 64'h0000000B00000000;  //          47244640256    0x4226000000000000
    #500 long_input = 64'h0090000000000000;  //    40532396646334464    0x4362000000000000
    #500 long_input = 64'h1000000000000000;  //  1152921504606846976    0x43B0000000000000
    #500 long_input = 64'h4000000000000000;  //  4611686018427387904    0x43D0000000000000
    #500 long_input = 64'h7F00000000000000;  //  9151314442816847872    0x43DFC00000000000
    #500 long_input = 64'h7FFFFFFFFFFFFFFF;  //  9223372036854775807    0x43E0000000000000

  end

endmodule



