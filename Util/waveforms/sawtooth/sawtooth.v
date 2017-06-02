
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// sawtooth.v
// Generates a sawtooth counter.
// Param 'CTR_BITS' specifies the bits within the counter.
// Param 'VAL_BITS' dictates the discrete steps in val.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module sawtooth
  #(
  parameter CTR_BITS = 27,
  parameter VAL_BITS = 8
  )(
  input clk,
  input rst,
  output reg [VAL_BITS-1:0] val
  );

  // Internal register
  reg [CTR_BITS-1:0] ctr_d, ctr_q;

  // Combinational logic
  always @(*) begin

    // Increment counter
    ctr_d = ctr_q + 1'b1;

    // Count down with high MSB
    if ( ctr_q[CTR_BITS-1] )
      val = ~ctr_q[ CTR_BITS-2 : CTR_BITS-VAL_BITS-1 ];

    // Count up o/w
    else
      val = ctr_q[ CTR_BITS-2 : CTR_BITS-VAL_BITS-1 ];

  end

  // Synchronous logic
  always @( posedge clk ) begin

    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end

  end

endmodule



