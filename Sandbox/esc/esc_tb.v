
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// esc_tb.v
// Test bench for the 'esc' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module esc_tb ();

  // Test bench inputs
  reg clk_1M, rst;
  reg [9:0] cmd;

  // Test bench outputs
  wire esc;

  // Servo module
  esc
    DUT
    (
    .clk_1M(clk_1M),
    .rst(rst),
    .cmd(cmd),
    .esc(esc)
    );

  // Initial reset, then run clock forever
  initial begin
    clk_1M = 1'b1;
    rst = 1'b1;
    repeat(10) #500 clk_1M = ~clk_1M;
    rst = 1'b0;
    forever #500 clk_1M = ~clk_1M;
  end

  // Assign test stimulus
  initial begin

    cmd = 8'd0;
    @( negedge rst )

    cmd = 10'd1023;
    repeat(10000)
    @( posedge clk_1M );

    cmd = 10'd1012;
    repeat(10000)
    @( posedge clk_1M );

    cmd = 10'd512;
    repeat(10000)
    @( posedge clk_1M );

    cmd = 10'd12;
    repeat(10000)
    @( posedge clk_1M );

    cmd = 10'd0;
    repeat(10000)
    @( posedge clk_1M );

    $finish;

  end

endmodule



