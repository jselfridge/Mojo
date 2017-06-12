
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// esc.v
// Module that generates a PWM signal for ESC applications.
// Runs on a 1MHz clock signal.
// Yields a 400Hz output frequency.
// 10-bit 'cmd' input, yields 1024 discrete values.
// 12-bit 'ctr' stores counts for the 2500us range.
// Output 'esc' is a pulse with a 988-2011 us range.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module esc
  (
  input tmr_1Mhz,
  input rst,
  input [9:0] cmd,
  output esc
  );

  // Output register
  reg esc_d, esc_q;

  // Internal register
  reg [11:0] ctr_d, ctr_q;

  // Connect output signal
  assign esc = esc_q;

  // Combinational logic
  always @(*) begin

    // Increment counter
    ctr_d = ctr_q + 1'b1;

    // Assign command value
    if ( ctr_q > 10'd987 + cmd )
      esc_d = 1'b0;
    else
      esc_d = 1'b1;

    // Reset the counter
    if ( ctr_q >= 12'd2499 )
      ctr_d = 1'b0;

  end

  // Synchronous logic
  always @( posedge tmr_1Mhz ) begin

    if (rst) begin
      esc_q <= 1'b0;
      ctr_q <= 1'b0;
    end else begin
      esc_q <= esc_d;
      ctr_q <= ctr_d;
    end

  end

endmodule



