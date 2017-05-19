
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// serial_tx_byte_tb.v
// Test bench for the 'serial_tx_byte' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module serial_tx_byte_tb ();

  // Test bench inputs
  reg clk;
  reg rst;
  reg block;
  reg new_data;
  reg [7:0] data;

  // Test bench outputs
  wire busy;
  wire tx;

  // Connect 'serial_tx_byte' module
  serial_tx_byte
    #(
    .CLK_PER_BIT(434)
    )
    DUT
    (
    .clk(clk),
    .rst(rst),
    .block(block),
    .new_data(new_data),
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
    new_data = 1'b0;
    data = 8'b01001111;
    #1000;

    // Release blocking condition
    block = 1'b0;
    #1000;

    // Send the data
    new_data = 1'b1;
    #20;
    new_data = 1'b0;
    #100000;

    $finish;

  end

endmodule



