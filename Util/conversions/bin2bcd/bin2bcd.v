
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// bin2bcd.v
// Module converts a binary number into binary coded decimal.
// Param BITS specifies number of bits in the binary number.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module bin2bcd
  #(
  parameter BITS = 18
  )(
  input [BITS-1:0] bin,
  output reg [ BITS + (BITS-4) /3 : 0 ] bcd
  );

  integer i, j;

  always @(bin) begin

    for ( i=0; i<= BITS + (BITS-4) /3; i=i+1 )  bcd[i] = 1'b0;

    bcd[BITS-1:0] = bin;

    for ( i=0; i<=BITS-4; i=i+1 )

      for ( j=0; j<=i/3; j=j+1 )

        if ( bcd[ BITS-i+4*j -: 4 ] > 4 )

          bcd[ BITS-i+4*j -: 4 ] = bcd[ BITS-i+4*j -: 4 ] + 4'd3;

  end

endmodule



