
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// sawtooth.v
// Generates a saw-tooth counter.
// Param LEN determines the bits within the counter.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module sawtooth
  #(
  parameter LEN = 27
  )(
  input clk,
  input rst,
  output reg [7:0] val
  );

  reg [LEN-1:0] ctr_d, ctr_q;

  always @(*) begin

    ctr_d = ctr_q + 1'b1;

    if ( ctr_q[LEN-1] )
      val = ~ctr_q[LEN-2:LEN-9];
    else
      val = ctr_q[LEN-2:LEN-9];

  end

  always @( posedge clk ) begin

    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end

  end

endmodule



