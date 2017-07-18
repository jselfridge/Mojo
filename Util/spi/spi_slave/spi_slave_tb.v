
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// spi_slave_tb.v
// Test bench for the 'spi_slave' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module spi_slave_tb ();

  // Test bench inputs
  reg clk;
  reg rst;
  reg sck;
  reg ss;
  reg mosi;
  reg [7:0] din;

  // Test bench outputs
  wire miso;
  wire done;
  wire [7:0] dout;

  // Device Under Test
  spi_slave
    spi_slave_DUT
    (
    .clk(clk),
    .rst(rst),
    .sck(sck),
    .ss(ss),
    .mosi(mosi),
    .din(din),
    .miso(miso),
    .done(done),
    .dout(dout)
    );

  // Toggle reset, then clock forever
  initial begin
    clk = 1'b1;
    rst = 1'b1;
    repeat(10) #10 clk = ~clk;
    rst = 1'b0;
    forever #10 clk = ~clk;
  end

  // Slave select and serial clock
  initial begin

    // Initial values
    ss = 1'b1;
    sck = 1'b0;
    #1000;

    // First transmission
    ss = 1'b0;
    repeat(16) #50 sck = ~sck;
    #50;
    ss = 1'b1;
    #1000;

    // Second transmission
    ss = 1'b0;
    repeat(16) #50 sck = ~sck;
    #50;
    ss = 1'b1;

  end

  // Manipulate MOSI serial line
  initial begin

    // Set initial values
    mosi = 1'b1;
    din = 8'b0;
    #1000;

    // Send first byte
    mosi = 1'b1;  #100;
    mosi = 1'b1;  #100;
    mosi = 1'b1;  #100;
    mosi = 1'b0;  #100;
    mosi = 1'b1;  #100;
    mosi = 1'b1;  #100;
    mosi = 1'b0;  #100;
    mosi = 1'b1;  #100;

    // Reset the line
    mosi = 1'b1;
    #1050;

    // Send second byte
    mosi = 1'b1;  #100;
    mosi = 1'b0;  #100;
    mosi = 1'b1;  #100;
    mosi = 1'b1;  #100;
    mosi = 1'b0;  #100;
    mosi = 1'b1;  #100;
    mosi = 1'b1;  #100;
    mosi = 1'b1;  #100;

    // Reset the line
    mosi = 1'b1;
    #1000;
    $finish;

  end

endmodule



