
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// radio.v
// Reads a PWM signal from an RC transmitter.
// Uses a 1MHz clock input.
// 10-bit 'cmd' provides 1024 discrete points.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module radio
  (
  input clk_1M,
  input rst,
  input radio,
  output [9:0] cmd
  );

  reg [10:0] ctr_d, ctr_q;
  reg [9:0] cmd_d, cmd_q;

  assign cmd = 10'b0;  //assign cmd = cmd_q;

  always @(*) begin
    if (radio) begin
      ctr_d = ctr_q + 1'b1;
    end else begin
		ctr_d = 1'b0;
    end
	 cmd_d = cmd_q;
  end

  always @( posedge radio ) begin
    ctr_q <= 1'b0;
	 cmd_q <= cmd_d;
  end

  always @( negedge radio ) begin
    if ( ctr_q < 988 ) begin
      cmd_q <= 0;
	 end else if ( ctr_q > 2011 ) begin
      cmd_q <= 1023;
	 end else begin
      cmd_q <= ctr_q - 988;
    end
  end

  always @( posedge clk_1M ) begin

    if (rst) begin
      ctr_q <= 1'b0;
      cmd_q <= 10'd100;
    end else begin
      ctr_q <= ctr_d;
      cmd_q <= cmd_d;
    end

  end

endmodule



