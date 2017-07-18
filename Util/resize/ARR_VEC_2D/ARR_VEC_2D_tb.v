
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// ARR_VEC_2D_tb.v
// Test bench for the 'ARR_VEC_2D' macro.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
`include "ARR_VEC_2D.v"

module ARR_VEC_2D_tb ();

  // Test bench input
  reg [7:0] arr [3:0];

  // Test bench output
  wire [31:0] vec;

  // Connect 'ARR_VEC_2D' macro
  `ARR_VEC_2D( arr, 4, 8, vec )

  // Apply stimulus
  initial begin
    arr[3] = 8'h48;  // H
    arr[2] = 8'h45;  // E
    arr[1] = 8'h41;  // A
    arr[0] = 8'h52;  // R
    #100;
    arr[3] = 8'h54;  // T
    arr[2] = 8'h48;  // H
    arr[1] = 8'h49;  // I
    arr[0] = 8'h53;  // S
    #100;
    $finish;
  end

endmodule



