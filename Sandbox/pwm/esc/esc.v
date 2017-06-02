
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// esc.v
// Module that generates a PWM signal for ESC applications.
// Runs on a 1MHz clock signal.
// 10-bit 'cmd' input, yields 1024 discrete values.
// 12-bit 'ctr' stores counts for the 2500us range.
// Output 'esc' is a pulse with a 988-2011 us range.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module esc
  (
  input clk_1M,
  input rst,
  input [9:0] cmd,
  output esc
  );

  reg esc_d, esc_q;
  reg [11:0] ctr_d, ctr_q;

  assign esc = esc_q;

  always @(*) begin

    ctr_d = ctr_q + 1'b1;

    if ( ctr_q > 10'd987 + cmd )
      esc_d = 1'b0;
    else
      esc_d = 1'b1;

    if ( ctr_q >= 12'd2499 )
      ctr_d = 1'b0;

  end

  always @( posedge clk_1M ) begin

    if (rst) begin
      ctr_q <= 1'b0;
      esc_q <= 1'b1;
    end else begin
      ctr_q <= ctr_d;
      esc_q <= esc_d;
    end

  end

endmodule



