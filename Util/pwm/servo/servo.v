
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// servo.v
// Generates a PWM signal for servo applications.
// Runs off the 50MHz clock.
// 8-bit 'val' yields 256 discrete positions.
// 20-bit 'ctr' prodcues 50,000,000 / 2^20 = 47.7 Hz frequency.
// 9'd167 is the offset for minimum PWM value.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module servo
  (
  input clk,
  input rst,
  input [7:0] val,
  output sig
  );

  // Output register
  reg sig_d, sig_q;

  // Internal register
  reg [19:0] ctr_d, ctr_q;

  // Connect output signal
  assign sig = sig_q;

  // Combinational logic
  always @(*) begin

    // Increment counter
    ctr_d = ctr_q + 1'b1;

    // Determine output status
    if ( val + 9'd167 > ctr_q[19:8] )
      sig_d = 1'b1;
    else
      sig_d = 1'b0;

  end

  // Synchronous logic
  always @( posedge clk ) begin

    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end

    sig_q <= sig_d;

  end

endmodule



