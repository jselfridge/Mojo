
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// serial_debug_tb.v
// Test bench for the 'serial_debug' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module serial_debug_tb ();

  // Test bench inputs
  reg clk;
  reg rst;
  reg block;
  reg send;
  reg [31:0] data;

  // Test bench outputs
  wire busy;
  wire tx;

  // Connect 'serial_debug' module
  serial_debug
    #(
    .CLK_PER_BIT(434),
    .MSG_LEN(4)
    )
    DUT
    (
    .clk(clk),
    .rst(rst),
    .block(block),
    .send(send),
    .data(data),
    .busy(busy),
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

    // Starting conditions
    block = 1'b1;
    send = 1'b0;
    data = 32'b_01111111_00011111_00000111_00000001;
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
    data = 32'b_00001111_00010111_00110011_01110001;
    #1000;

    // Send the data
    send = 1'b1;
    #20;
    send = 1'b0;
    #500000

    $finish;

  end

endmodule



