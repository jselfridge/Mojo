
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// pack_tb.v
// Test bench for the 'pack' macros.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//


module pack_tb ();

  // Test bench input
  reg [23:0] vec_in;

  // Test bench output
  wire [15:0] vec_out;

  // Connect 'example' module
  example DUT_example (
    .vec_in(vec_in),
    .vec_out(vec_out) );

  initial begin
    //           Y: 121   O: 111   U: 117
    vec_in = 24'b01111001_01101111_01110101;
    #100;
    //           A: 097   R: 114   E: 101
    vec_in = 24'b01100001_01110010_01100101;
    #100;
    $finish;
  end

endmodule



