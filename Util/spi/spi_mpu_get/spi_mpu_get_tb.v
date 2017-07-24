
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// spi_mpu_get_tb.v
// Test bench for the 'spi_mpu_get' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module spi_mpu_get_tb ();

  // Test bench inputs
  reg clk;
  reg rst;
  reg start;
  reg miso;
  reg [7:0] addr;

  // Test bench outputs
  wire sclk;
  wire busy;
  wire finish;
  wire mosi;
  wire [7:0] data;

  // Device Under Test
  spi_master_11
    #(
    .CLK_DIV(4)
    ) spi_master_DUT (
    .clk(clk),
    .rst(rst),
    .start(start),
    .miso(miso),
    .addr(addr),
    .sclk(sclk),
    .busy(busy),
    .finish(finish),
    .mosi(mosi),
    .data(data)
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
    addr = 8'b0;
    #1000;

    // Assign new data
    addr = 8'b10110111;
    #100;

    // Toggle start flag
    start = 1'b1;
    #50;
    start = 1'b0;
    #4000;

    // Assign new data
    addr = 8'b11101101;
    #100;

    // Toggle start flag
    start = 1'b1;
    #50;
    start = 1'b0;
    #4000;

    #1000;
    $finish;

  end

endmodule



