
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// spi_mpu_set_tb.v
// Test bench for the 'spi_mpu_set' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module spi_mpu_set_tb ();

  // Test bench inputs
  reg clk;
  reg rst;
  reg start;
  reg miso;
  reg [7:0] addr;
  reg [7:0] set;

  // Test bench outputs
  wire sclk;
  wire busy;
  wire finish;
  wire mosi;

  // Device Under Test
  spi_mpu_set
    #(
    .CLK_DIV(3),
    .HOLD_BITS(0)
    ) spi_mpu_set_DUT (
    .clk(clk),
    .rst(rst),
    .start(start),
    .miso(miso),
    .addr(addr),
    .set(set),
    .sclk(sclk),
    .busy(busy),
    .finish(finish),
    .mosi(mosi)
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
    set = 8'b0;
    #1000;

    // Set new data value
    addr = 8'b10110111;
    set = 8'b01010101;
    #100;

    // Toggle start flag
    start = 1'b1;
    #50;
    start = 1'b0;
    #4000;

/*    // Set new data value
    addr = 8'b11101101;
    set = 8'b00110011;
    #100;

    // Toggle start flag
    start = 1'b1;
    #50;
    start = 1'b0;
    #4000;
*/
    #1000;
    $finish;

  end

endmodule



