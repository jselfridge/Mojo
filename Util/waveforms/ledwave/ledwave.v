
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// ledwave.v
// Module implements a wave pattern across the onboard LEDs.
// Param 'CTR' sets the frequency of the wave.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module ledwave
  #(
  parameter CTR = 25
  )(
  input wire clk,
  input wire rst,
  output reg [7:0] led
  );

  // Internal registers
  reg [CTR-1:0] ctr_d, ctr_q = { CTR{1'b0} };
  reg [3:0] i;
  reg [7:0] acmp;
  reg [8:0] shift;

  // Combinational logic
  always @(ctr_q) begin

    // Increment counter
    ctr_d = ctr_q + 1'b1;

    // Loop through each LED
    for ( i=0; i<8; i=i+1 ) begin

      // Apply shift to each LED
      shift = ctr_q[CTR-1:CTR-9] + i * 8'd64;

      // Reverse counter direction if needed
      if (shift[8])
        acmp = ~shift[7:0];
      else
        acmp = shift[7:0];

      // Assign LED output
      led[i] = acmp > ctr_q[7:0];

    end

  end

  // Synchronous logic
  always @( posedge clk ) begin

    if (rst) begin
      ctr_q <= { CTR{1'b0} };
    end else begin
      ctr_q <= ctr_d;
    end

  end

endmodule



