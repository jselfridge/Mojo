
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// bin2bcd_tb.v
// Test bench for the 'bin2bcd' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module bin2bcd_tb ();

  // Number of bits in binary representation
  localparam BIT_LEN = 9;

  // Test bench inputs
  reg [BIT_LEN-1:0] bin;

  // Test bench outputs
  wire [ BIT_LEN + (BIT_LEN-4) /3 : 0 ] bcd;

  // Connect 'bin2bdc' module
  bin2bcd #(
    .BITS(BIT_LEN) )
    DUT_bin2bdc (
    .bin(bin),
    .bcd(bcd) );

  // Assign test stimulus at certain points
  initial begin
    bin = 9'b0;
    repeat(512) #10 bin = bin + 1'b1;
    #10;
    bin = 8'b0;
    #20;
    $finish;
  end

endmodule



