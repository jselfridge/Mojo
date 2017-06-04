
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// bcd2ascii.v
// Module converts a Binary Coded Decimal number into ASCII.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module bcd2ascii
  #(
  parameter CHAR_LEN = 3
  )(
  input [(4*CHAR_LEN)-1:0] bcd,
  output reg [(8*CHAR_LEN)-1:0] ascii
  );

  reg [7:0] char;

  integer i;

  always @(bcd) begin

    for ( i=0; i<8*CHAR_LEN; i=i+1 )  ascii[i] = 1'b0;

    for ( i=0; i<CHAR_LEN; i=i+1 ) begin

      char = { {4'b0}, { bcd[ 4*i+3 -: 4 ] } };
      ascii[ 8*i+7 -: 8 ] = char + 8'd48;

    end

  end

endmodule



