
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// servo_tb.v
// Test bench for the 'servo' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module servo_tb ();

  // Test bench inputs
  reg clk, rst;
  reg [7:0] val;

  // Test bench outputs
  wire servo;

  // Servo module
  servo DUT
    (
    .clk(clk),
    .rst(rst),
    .val(val),
    .servo(servo)
    );

  // Initial reset, then run clock forever
  initial begin
    clk = 1'b0;
    rst = 1'b1;
    repeat(4) #10 clk = ~clk;
    rst = 1'b0;
    forever #10 clk = ~clk;
  end

  // Assign test stimulus
  initial begin

    val = 8'd0;
    @( negedge rst )

    val = 8'd255;
    repeat(5000000)
    @( posedge clk );

//    val = 8'd200;
//    repeat(5000000)
//    @( posedge clk );
//
//    val = 8'd150;
//    repeat(5000000)
//    @( posedge clk );

    val = 8'd127;
    repeat(5000000)
    @( posedge clk );

//    val = 8'd50;
//    repeat(5000000)
//    @( posedge clk );
//
    val = 8'd0;
    repeat(5000000)
    @( posedge clk );

    $finish;

  end

endmodule



