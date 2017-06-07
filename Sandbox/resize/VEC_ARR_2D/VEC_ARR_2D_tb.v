
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// VEC_ARR_2D_tb.v
// Test bench for the 'VEC_ARR_2D' macro.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
`include "VEC_ARR_2D.v"

module VEC_ARR_2D_tb ();

  // Test bench input
  reg [23:0] vec;

  // Test bench output
  wire [7:0] arr [2:0];

  // Connect 'VEC_ARR_2D' macro
  `VEC_ARR_2D( vec, 3, 8, arr )

  // Apply stimulus
  initial begin
    //        Y: 121   O: 111   U: 117
    vec = 24'b01111001_01101111_01110101;
    #100;
    //        A: 097   R: 114   E: 101
    vec = 24'b01100001_01110010_01100101;
    #100;
    $finish;
  end

endmodule



