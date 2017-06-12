
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// radio.v
// Reads a PWM signal from an RC transmitter.
// Parameter assigns a default value during reset condition.
// Uses a 1MHz clock input.
// 10-bit 'val' provides 1024 discrete points.
// An offset centers the signal at 1500us.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module radio
  #(
  parameter DEFAULT = 10'd512
  )(
  input tmr_1Mhz,
  input rst,
  input sig,
  output [9:0] val
  );

  // Output register
  reg [9:0] val_d, val_q;

  // Internal register
  reg [10:0] ctr_d, ctr_q;

  // Connect output signal
  assign val = val_q;

  // Combinational logic
  always @(*) begin

    // Increment counter if there is a signal
    if (sig)
      ctr_d = ctr_q + 1'b1;

    // Reset counter o/w
    else
      ctr_d = 1'b0;

    // Assign output value within proper boundaries
    if ( ctr_q < 987 )
      val_d = 10'd0;
    else if ( ctr_q > 2010 )
      val_d = 10'd1023;
    else
      val_d = ctr_q - 10'd987;

  end

  // Synchronous logic
  always @( negedge sig ) begin

    if (rst)
      val_q <= DEFAULT;
    else
      val_q <= val_d;

  end

  // Synchronous logic: Reset counter
  always @( posedge tmr_1Mhz ) begin

    if (rst)
      ctr_q <= 1'b0;
    else
      ctr_q <= ctr_d;

  end

endmodule



