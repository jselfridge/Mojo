
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// radio.v
// Reads a PWM signal from an RC transmitter.
// Uses a 1MHz clock input.
// 10-bit 'cmd' provides 1024 discrete points.
// An offset centers the signal at 1500us.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module radio
  #(
  parameter RST_VAL = 10'd512
  )(
  input clk_1M,
  input rst,
  input radio_in,
  output [9:0] cmd_out
  );

  reg [10:0] ctr_d, ctr_q;
  reg [9:0] cmd_d, cmd_q;

  assign cmd_out = cmd_q;

  always @(*) begin

    if (radio_in)
      ctr_d = ctr_q + 1'b1;
    else
      ctr_d = 1'b0;

    if ( ctr_q < 987 )
      cmd_d = 10'd0;
    else if ( ctr_q > 2010 )
      cmd_d = 10'd1023;
    else
      cmd_d = ctr_q - 10'd987;

  end

  always @( negedge radio_in ) begin

    if (rst)
      cmd_q <= RST_VAL;
    else
      cmd_q <= cmd_d;

  end

  always @( posedge clk_1M ) begin

    if (rst)
      ctr_q <= 1'b0;
    else
      ctr_q <= ctr_d;

  end

endmodule



