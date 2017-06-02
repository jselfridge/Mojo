
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// clock.v
// Generates a clock signal with a prescribed period.
// Defaults to a one second period.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module clock
  #(
  parameter PERIOD = 50000000
  )(
  input clk,
  input rst,
  output sig
  );

  // Half period duration and number of bits
  parameter HALF = PERIOD / 2;
  parameter HALF_BITS = $clog2(HALF);

  // Output registers
  reg sig_d, sig_q;

  // Internal registers
  reg [HALF_BITS-1:0] ctr_d, ctr_q;

  // Connect output signal
  assign sig = sig_q;

  // Combinational logic
  always @(*) begin

    ctr_d = ctr_q + 1'b1;
    sig_d = sig_q;

    if ( ctr_q == HALF-1 ) begin
      ctr_d = 1'b0;
      sig_d = ~sig_q;
    end

  end

  // Sequential logic
  always @( posedge clk ) begin

    if (rst) begin
      sig_q  <= 1'b1;
      ctr_q  <= 1'b0;
    end else begin
      sig_q  <= sig_d;
      ctr_q  <= ctr_d;
    end

  end

endmodule



