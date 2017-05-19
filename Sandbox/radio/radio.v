
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
  output reg [9:0] cmd
  );

  reg [10:0] ctr_d, ctr_q;

  always @(*) begin

    if (radio) begin
      ctr_d = ctr_q + 1'b1;
    end else begin
      ctr_d = 1'b0;
    end

  end

  always @( posedge radio ) begin

    ctr_q <= 1'b0;

  end

  always @( negedge radio ) begin

    if ( ctr_q < 987 ) begin
      cmd <= 10'd0;
    end else if ( ctr_q > 2010 ) begin
      cmd <= 10'd1023;
    end else begin
      cmd <= ctr_q - 10'd987;
    end

  end

  always @( posedge clk_1M ) begin

    if (rst) begin
      ctr_q <= 1'b0;
      cmd <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end

  end

endmodule



