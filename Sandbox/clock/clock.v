
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// clock.v
// Generates a pulse at a specified frequency.
// Defaults to a one second period duration.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module clock
  #(
  parameter DUR = 50000000
  )(
  input clk,
  input rst,
  output clkout
  );

  // Determine number of bits needed
  parameter DUR_BITS = $clog2(DUR);

  // Output registers
  reg clkout_d, clkout_q;

  // Internal registers
  reg [DUR_BITS-1:0] ctr_d, ctr_q;

  // Connect output signal
  assign clkout = clkout_q;

  // Combinational logic
  always @(*) begin

    ctr_d = ctr_q + 1'b1;
    clkout_d = clkout_q;

    if (clkout_q)
      clkout_d = 1'b0;

    if ( ctr_q == DUR-1 ) begin
      ctr_d = 1'b0;
      clkout_d = 1'b1;
    end

  end

  // Sequential logic
  always @( posedge clk ) begin

    if (rst) begin
      clkout_q  <= 1'b1;
      ctr_q     <= 1'b0;
    end else begin
      clkout_q  <= clkout_d;
      ctr_q     <= ctr_d;
    end

  end

endmodule



