
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// bin2bcd.v
// Module converts a binary number into binary coded decimal.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module bin2bcd
  #(
  parameter LEN = 18
  )(
  input [LEN-1:0] bin,
  output reg [LEN+(LEN-4)/3:0] bcd
  );

  integer i, j;

  always @(bin) begin

    for ( i=0; i<= LEN+(LEN-4)/3; i=i+1 )  bcd[i] = 1'b0;

    bcd[LEN-1:0] = bin;

    for ( i=0; i<=LEN-4; i=i+1 )

      for ( j=0; j<=i/3; j=j+1 )

        if ( bcd[ LEN-i+4*j -: 4 ] > 4 )

          bcd[ LEN-i+4*j -: 4 ] = bcd[ LEN-i+4*j -: 4 ] + 4'd3;

  end

endmodule



