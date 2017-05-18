
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// servo.v
// Generates a PWM signal for servo applications.
// 8-bit 'val' yields 256 discrete positions.
// 20-bit 'ctr' prodcues 50,000,000 / 2^20 = 47.7 Hz frequency.
// 9'd167 is the offset for minimum PWM value.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module servo
  (
  input clk,
  input rst,
  input [7:0] val,
  output servo
  );

  reg servo_d, servo_q;
  reg [19:0] ctr_d, ctr_q;

  assign servo = servo_q;

  always @(*) begin

    ctr_d = ctr_q + 1'b1;

    if ( val + 9'd167 > ctr_q[19:8] )
      servo_d = 1'b1;
    else
      servo_d = 1'b0;

  end

  always @( posedge clk ) begin

    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end

    servo_q <= servo_d;

  end

endmodule



