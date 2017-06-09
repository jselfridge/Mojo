
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// button.v
// Module performs signal conditioning for a button press.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module button (
  input clk,
  input btn_i,
  output btn_o
  );

  // Internal registers
  reg [19:0] ctr_d, ctr_q;
  reg [1:0] sync_d, sync_q;

  // Connect output signal
  assign btn_o = ( ctr_q == { 20 {1'b1} } );

  // Combinational logic
  always @(*) begin

    // Double flip-flop
    sync_d[0] = btn_i;
    sync_d[1] = sync_q[0];

    // Increment counter
    ctr_d = ctr_q + 1'b1;

    // Saturate counter
    if ( ctr_q == { 20 {1'b1} } ) begin
      ctr_d = ctr_q;
    end

    // Reset counter
    if (!sync_q[1])
      ctr_d = 20'd0;

  end

  // Synchronous
  always @( posedge clk ) begin
    ctr_q  <= ctr_d;
    sync_q <= sync_d;
  end

endmodule



