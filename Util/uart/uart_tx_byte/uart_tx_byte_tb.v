
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// uart_tx_byte_tb.v
// Test bench for the 'uart_tx_byte' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module uart_tx_byte_tb ();

  // Test bench inputs
  reg clk;
  reg rst;
  reg block;
  reg send;
  reg [7:0] data;

  // Test bench outputs
  wire busy;
  wire tx;

  // Connect 'uart_tx_byte' module
  uart_tx_byte #(
    .CLK_PER_BIT(434) )
    DUT_uart_tx_byte (
    .clk(clk),
    .rst(rst),
    .block(block),
    .send(send),
    .data(data),
    .busy(busy),
    .tx(tx) );

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

    // Starting conditions
    block = 1'b1;
    send = 1'b0;
    data = 8'b01001111;
    #1000;

    // Release blocking condition
    block = 1'b0;
    #1000;

    // Send the data
    send = 1'b1;
    #20;
    send = 1'b0;
    #100000;

    $finish;

  end

endmodule



