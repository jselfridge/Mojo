
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// example.v
// Defines macros for packing/unpacking multi-dimension vectors.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

`include "pack.v"

module example
  (
  input  [23:0] vec_in,
  output [15:0] vec_out
  );

  // Convert to array
  wire [7:0] arr_in [2:0];
  `VEC2ARR(vec_in,3,8,arr_in)

  // Demux input values
  wire [7:0] arr0;  assign arr0 = arr_in[0];
  wire [7:0] arr1;  assign arr1 = arr_in[1];
  wire [7:0] arr2;  assign arr2 = arr_in[2];

  // Define alternate array
  wire [7:0] arr_out [1:0];

  // Assign new addresses
  assign arr_out[1] = arr1;
  assign arr_out[0] = arr2;

  // Convert to vector
  `ARR2VEC(arr_out,2,8,vec_out)

endmodule



