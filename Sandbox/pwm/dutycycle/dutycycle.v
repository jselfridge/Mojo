
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// dutycycle.v
// Generates a PWM duty cycle signal.
// Frequency is determinded by: 50,000,000 / 2^CTR
// Duty cycle is determined by: val / ctr
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module dutycycle
  #(
  parameter CTR = 8
  )(
  input clk,
  input rst,
  input [CTR-1:0] val,
  output sig
  );

  // Output register
  reg sig_d, sig_q;

  // Internal register
  reg [CTR-1:0] ctr_d, ctr_q;

  // Connect output
  assign sig = sig_q;

  // Combinational logic
  always @(*) begin

    // Increment counter
    ctr_d = ctr_q + 1'b1;

    // Determine output status
    if ( val > ctr_q )
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



