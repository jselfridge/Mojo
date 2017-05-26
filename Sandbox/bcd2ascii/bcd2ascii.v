
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// bcd2ascii.v
// Module converts a binary coded decimal number to ASCII.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module bcd2ascii
  #(
  parameter CHAR_LEN = 3
  )(
  input [(4*CHAR_LEN)-1:0] bcd,
  output [(8*CHAR_LEN)-1:0] ascii
  );

  reg [7:0] char;
  integer i;

  always @(bcd) begin

    for ( i=0; i<CHAR_LEN; i=i+1 ) begin

      char = {{4'b0},{bcd[4*i+3:4*i]}};
      ascii[8*i+7:8*i] = char + 6'd48;

    end

  end

endmodule



