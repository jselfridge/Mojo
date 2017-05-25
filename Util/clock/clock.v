
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// clock.v
// Generates a pulse at a specified frequency.
// Defaults to a one second period.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module clock
  #(
  parameter STEP = 50000000    // Number of steps in clock period
  )(
  input clk,                   // Master clock signal
  input rst,                   // Reset signal
  output clkout                // Output for new clock signal
  );

  // Determine number of bits needed
  parameter STEP_BITS = $clog2(STEP);

  // Registers
  reg [STEP_BITS-1:0] ctr_d, ctr_q;
  reg clkout_d, clkout_q;

  // Connect output signal
  assign clkout = clkout_q;

  // Combinational logic
  always @(*) begin

    ctr_d = ctr_q + 1'b1;
    clkout_d = clkout_q;

    if (clkout_q)
      clkout_d = 1'b0;

    if ( ctr_q >= STEP-1 ) begin
      ctr_d = 1'b0;
      clkout_d = 1'b1;
    end

  end

  // Sequential logic
  always @( posedge clk ) begin

    if (rst) begin
      ctr_q     <= 1'b0;
      clkout_q  <= 1'b1;
    end else begin
      ctr_q     <= ctr_d;
      clkout_q  <= clkout_d;
    end

  end

endmodule



