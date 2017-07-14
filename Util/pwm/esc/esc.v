
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// esc.v
// Module that generates a PWM signal for ESC applications.
// Runs on a 1MHz clock signal.
// Yields a 400Hz output frequency.
// 10-bit 'val' input, yields 1024 discrete values.
// 12-bit 'ctr' stores counts for the 2500us range.
// Output 'sig' is a pulse with a 988-2011 us range.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module esc
  (
  input tmr_1Mhz,
  input rst,
  input [9:0] val,
  output sig
  );

  // Output register
  reg sig_d, sig_q;

  // Internal register
  reg [11:0] ctr_d, ctr_q;

  // Connect output signal
  assign sig = sig_q;

  // Combinational logic
  always @(*) begin

    // Increment counter
    ctr_d = ctr_q + 1'b1;

    // Assign command value
    if ( ctr_q > 10'd987 + val )
      sig_d = 1'b0;
    else
      sig_d = 1'b1;

    // Reset the counter
    if ( ctr_q >= 12'd2499 )
      ctr_d = 1'b0;

  end

  // Synchronous logic
  always @( posedge tmr_1Mhz ) begin

    if (rst) begin
      sig_q <= 1'b0;
      ctr_q <= 1'b0;
    end else begin
      sig_q <= sig_d;
      ctr_q <= ctr_d;
    end

  end

endmodule



