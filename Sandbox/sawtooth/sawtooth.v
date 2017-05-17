
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// counter.v
// Generates a saw-tooth counter.
// Param LEN determines the bits within the counter.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module counter
  #(
  parameter LEN = 27
  )(
  input clk,
  input rst,
  output reg [7:0] value
  );

  reg [LEN-1:0] ctr_d, ctr_q;

  always @(ctr_q) begin

    ctr_d = ctr_q + 1’b1;

    if ( ctr_q[LEN-1] )
      value = ~ctr_q[LEN-2:LEN-9];
    else
      value = ctr_q[LEN-2:LEN-9];

  end

  always @(posedge clk) begin

    if (rst) begin
      ctr_q <= 1’b0;
    end else begin
      ctr_q <= ctr_d;
    end

  end

endmodule



