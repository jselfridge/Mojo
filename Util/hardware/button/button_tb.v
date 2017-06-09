
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// button_tb.v
// Test bench for the 'button' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
module button_tb ();

  // Test bench input
  reg clk;
  reg btn_i;

  // Test bench output
  wire btn_o;

  // Connect 'button' module
  button DUT_button (
    .clk(clk),
    .btn_i(btn_i),
    .btn_o(btn_o) );

  // Run forever
  initial begin
    clk = 1'b1;
    forever #10 clk = ~clk;
  end

  // Apply stimulus
  initial begin

    // Initial hold
    btn_i = 1'b0;  #10000000;

    // Too short duration
    btn_i = 1'b1;  #20000000;
    btn_i = 1'b0;  #10000000;

    // Interruption
    btn_i = 1'b1;  #5000000;
    btn_i = 1'b0;  #100;
    btn_i = 1'b1;  #5000000;
    btn_i = 1'b0;  #100;
    btn_i = 1'b1;  #5000000;
    btn_i = 1'b0;  #100;
    btn_i = 1'b1;  #5000000;
    btn_i = 1'b0;  #10000000;

    // Initial debouncing
    btn_i = 1'b1;  #1000;
    btn_i = 1'b0;  #1000;
    btn_i = 1'b1;  #1000;
    btn_i = 1'b0;  #1000;
    btn_i = 1'b1;  #1000;
    btn_i = 1'b0;  #1000;
    btn_i = 1'b1;  #25000000;
    btn_i = 1'b0;  #10000000;

    // Successful button press
    btn_i = 1'b1;  #40000000;
    btn_i = 1'b0;  #10000000;

    $finish;

  end

endmodule



