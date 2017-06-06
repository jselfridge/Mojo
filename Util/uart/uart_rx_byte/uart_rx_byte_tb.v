
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// uart_rx_byte_tb.v
// Test bench for the 'uart_rx_byte' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module uart_rx_byte_tb ();

  // Test bench inputs
  reg clk;
  reg rst;
  reg rx;

  // Test bench outputs
  wire [7:0] data;
  wire new_data;

  // Connect 'uart_rx_byte' module
  uart_rx_byte #(
    .CLK_PER_BIT(434) )
    DUT_uart_rx_byte (
    .clk(clk),
    .rst(rst),
    .rx(rx),
    .data(data),
    .new_data(new_data) );

  // Initial reset, then clock forever
  initial begin
    clk = 1'b1;
    rst = 1'b1;
    repeat(10) #10 clk = ~clk;
    rst = 1'b0;
    forever #10 clk = ~clk;
  end

  // Assign test stimulus
  initial begin

    // Initial wait
    rx = 1'b1;  #20000;

    // Send first byte
    rx = 1'b0; #8680;  // Start bit
    rx = 1'b1; #8680;  // LSB
    rx = 1'b0; #8680;
    rx = 1'b0; #8680;
    rx = 1'b0; #8680;
    rx = 1'b1; #8680;
    rx = 1'b0; #8680;
    rx = 1'b0; #8680;
    rx = 1'b0; #8680;  // MSB
    rx = 1'b1; #8680;  // Stop bit

    // Wait a little
    #20000;

    // Send second byte
    rx = 1'b0; #8680;  // Start bit
    rx = 1'b1; #8680;  // LSB
    rx = 1'b0; #8680;
    rx = 1'b1; #8680;
    rx = 1'b0; #8680;
    rx = 1'b1; #8680;
    rx = 1'b0; #8680;
    rx = 1'b1; #8680;
    rx = 1'b0; #8680;  // MSB
    rx = 1'b1; #8680;  // Stop bit

    // End the simulation
    #20000;
    $finish;

  end

endmodule



