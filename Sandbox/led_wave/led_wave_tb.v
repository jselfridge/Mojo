
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// led_wave_tb.v
// Test bench for the 'led_wave' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module led_wave_tb ();

  // Testbench inputs
  reg clk, rst;

  // Testbench outputs
  wire [7:0] led;

  // PWM signal generator
  led_wave
    #(
    .LEN(25)
    ) DUT (
    .clk(clk),
    .rst(rst),
    .led(led)
  );

  // Initial reset, then run clock forever
  initial begin
    clk = 1'b0;
    rst = 1'b1;
    repeat(10) #10 clk = ~clk;
    rst = 1'b0;
    forever #10 clk = ~clk;
  end

  // Wait for a specified period of time
  initial begin
    #500000000
    $finish;
  end

endmodule



