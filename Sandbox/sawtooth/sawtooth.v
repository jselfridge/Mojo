
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// sawtooth.v
// Generates a sawtooth counter.
// Param 'CTR_BITS' determines the bits within the counter.
// Param 'VAL_BITS' determines the discrete steps in val.
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

  reg [CTR_BITS-1:0] ctr_d, ctr_q;

  always @(*) begin

    ctr_d = ctr_q + 1'b1;

    if ( ctr_q[CTR_BITS-1] )
      val = ~ctr_q[CTR_BITS-2:CTR_BITS-VAL_BITS-1];  //~ctr_q[CTR_BITS-2:CTR_BITS-9];
    else
      val = ctr_q[CTR_BITS-2:CTR_BITS-VAL_BITS-1];  //ctr_q[CTR_BITS-2:CTR_BITS-9];

  end

  always @( posedge clk ) begin

    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end

  end

endmodule



