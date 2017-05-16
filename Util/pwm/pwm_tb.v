
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// pwm_tb.v
// Test bench for the 'pwm' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module pwm_tb ();

  // Testbench inputs
  reg clk, rst;
  reg [7:0] val;

  // Testbench outputs
  wire pwm;

  // PWM signal generator
  pwm
    #(
    .LEN(8)
    ) DUT (
    .clk(clk),
    .rst(rst),
    .val(val),
    .pwm(pwm)
  );

  // Initial reset, then run clock forever
  initial begin

    clk = 1'b0;
    rst = 1'b1;

    repeat(4) #10 clk = ~clk;

    rst = 1'b0;

    forever #10 clk = ~clk;

  end

  // Assign test stimulus at certain points
  initial begin

    val = 8'd0;                   // Initial value
    @( negedge rst );             // Wait for reset

    val = 8'd128;                 // Assign half duty cycle
    repeat(256)                   // Run through full counter
    @( posedge clk );

    val = 8'd30;                  // 11.7% duty cycle
    repeat(256)                   // Run through full counter
    @( posedge clk );

    $finish;                      // Exit test bench

  end

endmodule



