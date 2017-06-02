
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// spi_tb.v
// Test bench for the 'spi' communication modules.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module spi_tb ();

  // Test bench inputs
  reg clk;
  reg rst;
  reg start;
  reg miso;
  reg [7:0] data_start;

  // Test bench outputs
  wire sck;
  wire busy;
  wire new_data;
  wire mosi;
  wire [7:0] data_end;
  wire [7:0] data_slave;

  // Device Under Test: Master
  spi_master
    #(
    .CLK_DIV(1)
    ) spi_master_DUT (
    .clk(clk),
    .rst(rst),
    .start(start),
    .miso(miso),
    .data_in(data_start),
    .sck(sck),
    .busy(busy),
    .new_data(new_data),
    .mosi(mosi),
    .data_out(data_out)
  );

  // Device Under Test: Slave
  spi_slave
    spi_slave_DUT (
    .clk(clk),
    .rst(rst),
    .sck(sck),
    .ss(~busy),
    .mosi(mosi),
    .din(8'b0),
    .miso(miso),
    .done(done),
    .dout(data_end)
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
    //ss = 1'b1;
    miso = 1'b1;
    data_start = 8'b0;
    #1000;

    // Specify which slave
    //ss = 1'b0;
    //#100;

    // Assign new data
    data_start = 8'b10110111;
    #100;

    // Toggle start flag
    start = 1'b1;
    #50;
    start = 1'b0;
    #2000;

    // Assign new data
    //data_start = 8'b10101011;
    //#100;

    // Toggle start flag
    //start = 1'b1;
    //#50;
    //start = 1'b0;
    //#2000;

    #3000;
    $finish;

  end

endmodule



