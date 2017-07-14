
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// esc_tb.v
// Test bench for the 'esc' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module esc_tb ();

  // Test bench inputs
  reg tmr_1Mhz;
  reg rst;
  reg [9:0] val;

  // Test bench outputs
  wire sig;

  // Connect 'esc' module
  esc DUT_esc (
    .tmr_1Mhz(tmr_1Mhz),
    .rst(rst),
    .val(val),
    .sig(sig) );

  // Initial reset, then run clock forever
  initial begin
    tmr_1Mhz = 1'b1;
    rst = 1'b1;
    repeat(10) #500 tmr_1Mhz = ~tmr_1Mhz;
    rst = 1'b0;
    forever #500 tmr_1Mhz = ~tmr_1Mhz;
  end

  // Assign test stimulus
  initial begin

    val = 8'd0;
    @( negedge rst )

    val = 10'd1023;
    repeat(10000)
    @( posedge tmr_1Mhz );

    val = 10'd1012;
    repeat(10000)
    @( posedge tmr_1Mhz );

    val = 10'd512;
    repeat(10000)
    @( posedge tmr_1Mhz );

    val = 10'd12;
    repeat(10000)
    @( posedge tmr_1Mhz );

    val = 10'd0;
    repeat(10000)
    @( posedge tmr_1Mhz );

    $finish;

  end

endmodule



