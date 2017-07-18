
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// spi_master_tb.v
// Test bench for the 'spi_master' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module spi_master_tb ();

  // Test bench inputs
  reg clk;
  reg rst;
  reg start;
  reg miso;
  reg [7:0] data_in;

  // Test bench outputs
  wire sck;
  wire busy;
  wire new_data;
  wire mosi;
  wire [7:0] data_out;

  // Device Under Test
  spi_master
    #(
    .CLK_DIV(3)
    ) spi_master_DUT (
    .clk(clk),
    .rst(rst),
    .start(start),
    .miso(miso),
    .data_in(data_in),
    .sck(sck),
    .busy(busy),
    .new_data(new_data),
    .mosi(mosi),
    .data_out(data_out)
  );

  // Toggle reset, then clock forever
  initial begin
    clk = 1'b1;
    rst = 1'b1;
    repeat(10) #10 clk = ~clk;
    rst = 1'b0;
    forever #10 clk = ~clk;
  end

  // Manipulate input lines
  initial begin

    // Initial values
    start = 1'b0;
    miso = 1'b1;
    data_in = 8'b0;
    #1000;

    // Assign new data
    data_in = 8'b10110111;
    #100;

    // Toggle start flag
    start = 1'b1;
    #50;
    start = 1'b0;
    #2000;

    // Assign new data
    data_in = 8'b11101101;
    #100;

    // Toggle start flag
    start = 1'b1;
    #50;
    start = 1'b0;
    #2000;

    #1000;
    $finish;

  end

endmodule



