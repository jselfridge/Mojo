
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// serial_tx_msg_tb.v
// Test bench for the 'serial_tx_msg' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module serial_tx_msg_tb ();

  // Test bench inputs
  reg clk;
  reg rst;
  reg block;
  reg send;
  reg [31:0] msg;

  // Test bench outputs
  wire tx;

  // Connect 'serial_tx_msg' module
  serial_tx_msg
    #(
    .MSG_LEN(4),
    .MSG_BITS(2)
    )
    DUT
    (
    .clk(clk),
    .rst(rst),
    .block(block),
    .send(send),
    .msg(msg),
    .tx(tx)
    );

  // Initial reset, then clock forever
  initial begin
    clk = 1'b1;
    rst = 1'b1;
    repeat(10) #10 clk = ~clk;
    rst = 1'b0;
    forever #10 clk = ~clk;
  end

  // Assign test stimulus at certain points
  initial begin

    // Define the message
    //msg = 32'b_10000001_11110000_11001100_10101010;

    // Starting conditions
    block = 1'b1;
    send = 1'b0;
    #1000;

    // Release blocking condition
    block = 1'b0;
    #1000;

    // Send the data
    send = 1'b1;
    #20;
    send = 1'b0;
    #500000;

    $finish;

  end

endmodule



