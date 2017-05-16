
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// pwm_tb.v
// Test bench for the ‘pwm’ module.
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
    .CTR_LEN(8)
    ) DUT (
    .clk(clk),
    .rst(rst),
    .val(val),
    .pwm(pwm)
  );

  // Initial toggle, then clock forever
  initial begin

    clk = 1'b0;
    rst = 1'b1;
    repeat(4) #10 clk = ~clk;
    rst = 1'b0;
    forever #10 clk = ~clk;

  end

  // Assign test stimulus at certain points
  initial begin

    val = 8'd0;                   // initial value
    @(negedge rst);               // wait for reset

    val = 8'd128;                 // assign half duty cycle
    repeat(256)                   // run through full counter
    @(posedge clk);   

    val = 8'd30;                  // 11.7% duty cycle
    repeat(256)                   // run through full counter
    @(posedge clk);

    $finish;                      // exit test bench

  end

endmodule



