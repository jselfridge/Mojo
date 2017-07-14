
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// timer.v
// Generates a single pulse at a specified period.
// Defaults to a one second period duration.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module timer
  #(
  parameter PERIOD = 50000000
  )(
  input clk,
  input rst,
  output tmr
  );

  // Determine number of bits needed
  parameter PERIOD_BITS = $clog2(PERIOD);

  // Output registers
  reg tmr_d, tmr_q;

  // Internal registers
  reg [PERIOD_BITS-1:0] ctr_d, ctr_q;

  // Connect output signal
  assign tmr = tmr_q;

  // Combinational logic
  always @(*) begin

    // Increment counter
    ctr_d = ctr_q + 1'b1;

    // Preliminary assignments
    tmr_d = tmr_q;

    // If high, set it to low
    if (tmr_q)
      tmr_d = 1'b0;

    // Reset counter and flip output
    if ( ctr_q == PERIOD-1 ) begin
      ctr_d = 1'b0;
      tmr_d = 1'b1;
    end

  end

  // Synchronous logic
  always @( posedge clk ) begin

    if (rst) begin
      tmr_q  <= 1'b0;
      ctr_q  <= 1'b0;
    end else begin
      tmr_q  <= tmr_d;
      ctr_q  <= ctr_d;
    end

  end

endmodule



