
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// serial_debug_tb.v
// Test bench for the 'serial_debug' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module serial_debug_tb ();

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

  // Connect 'serial_debug' module
  serial_debug
    #(
    .CLK_PER_BIT(434),
    .MSG_LEN(MSG_LEN)
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
    $sformat( msg, "Time: %d \n", run_time_1 );
    $display( "%s", msg );
    //msg = 32'b_01111111_00011111_00000111_00000001;
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
    //msg = 32'b_00001111_00010111_00110011_01110001;
    #1000;

    // Send the data
    send = 1'b1;
    #20;
    send = 1'b0;
    #500000

    $finish;

  end

endmodule



