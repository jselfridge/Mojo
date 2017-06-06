
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// uart_tx_msg_tb.v
// Test bench for the 'uart_tx_msg' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module uart_tx_msg_tb ();

  localparam MSG_LEN = 16;

  // Test bench inputs
  reg clk;
  reg rst;
  reg block;
  reg send;
  reg [(8*MSG_LEN)-1:0] msg;

  // Test bench outputs
  wire busy;
  wire tx;
  
  // Testing values
  reg [9:0] run_time_1 = 10'd1000;
  reg [9:0] run_time_2 = -10'd0123;

  // Connect 'uart_tx_msg' module
  uart_tx_msg #(
    .CLK_PER_BIT(434),
    .MSG_LEN(MSG_LEN) )
    DUT_uart_tx_msg (
    .clk(clk),
    .rst(rst),
    .block(block),
    .send(send),
    .msg(msg),
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
    $sformat( msg, "Time: %d \n", run_time_1 );
    $display( "%s", msg );
    #1000;

    // Release blocking condition
    block = 1'b0;
    #1000;

    // Send the data
    send = 1'b1;
    #20;
    send = 1'b0;
    #500000

    // Change serial message
    $sformat( msg, "Time: %04d \n", run_time_2 );
    $display( "%s", msg );
    #1000;

    // Send the data
    send = 1'b1;
    #20;
    send = 1'b0;
    #500000;

    $finish;

  end

endmodule



