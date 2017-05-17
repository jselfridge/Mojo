
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// clock.v
// Generates alternative frequency clock signals.
// Defaults to a one second period.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module clock
  #(
  parameter STEP = 25000000,   // Number of steps in half period
  parameter LEN = 25           // Counter length
  )(
  input clk,                   // Master clock signal
  input rst,                   // Reset signal
  output clkout                // Output for new clock signal
  );

  reg [LEN-1:0] ctr_d, ctr_q;
  reg clkout_d, clkout_q;

  assign clkout = clkout_q;

  always @(*) begin

    ctr_d = ctr_q + 1'b1;
    clkout_d = clkout_q;

    if ( ctr_q >= STEP-1 ) begin
      ctr_d = 1'b0;
      clkout_d = ~clkout_q;
    end

  end

  always @( posedge clk ) begin

    if (rst) begin
      ctr_q <= 1'b0;
      clkout_q <= 1'b1;
    end else begin
      ctr_q <= ctr_d;
      clkout_q <= clkout_d;
    end

  end

endmodule



