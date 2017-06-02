
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// radio_tb.v
// Test bench for the 'radio' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module radio_tb ();

  // Test bench inputs
  reg clk_1M;
  reg rst;
  reg sig;

  // Test bench outputs
  wire [9:0] val;

  // Steps within period
  parameter PERIOD = 3000;

  // Radio module
  radio DUT_radio (
    .clk_1M(clk_1M),
    .rst(rst),
    .sig(sig),
    .val(val) );

  // Initial toggle, then clock forever
  initial begin
    clk_1M = 1'b1;
    rst = 1'b1;
    repeat(10) #500 clk_1M = ~clk_1M;
    rst = 1'b0;
    forever #500 clk_1M = ~clk_1M;
  end

  // Assign test stimulus at certain points
  initial begin

    sig = 1'b0;
    @(negedge rst);

    // Out of range low => 0 command
    sig = 1'b1;
    repeat(978) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-978) @( posedge clk_1M );
    sig = 1'b1;
    repeat(978) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-978) @( posedge clk_1M );
    sig = 1'b1;
    repeat(978) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-978) @( posedge clk_1M );

    // 988 ms => 0 command
    sig = 1'b1;
    repeat(988) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-988) @( posedge clk_1M );
    sig = 1'b1;
    repeat(988) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-988) @( posedge clk_1M );
    sig = 1'b1;
    repeat(988) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-988) @( posedge clk_1M );

    // 1000 ms => 12 command
    sig = 1'b1;
    repeat(1000) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-1000) @( posedge clk_1M );
    sig = 1'b1;
    repeat(1000) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-1000) @( posedge clk_1M );
    sig = 1'b1;
    repeat(1000) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-1000) @( posedge clk_1M );

    // 1500 ms => 512 command
    sig = 1'b1;
    repeat(1500) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-1500) @( posedge clk_1M );
    sig = 1'b1;
    repeat(1500) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-1500) @( posedge clk_1M );
    sig = 1'b1;
    repeat(1500) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-1500) @( posedge clk_1M );

    // 2000 ms => 1012 command
    sig = 1'b1;
    repeat(2000) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-2000) @( posedge clk_1M );
    sig = 1'b1;
    repeat(2000) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-2000) @( posedge clk_1M );
    sig = 1'b1;
    repeat(2000) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-2000) @( posedge clk_1M );

    // 2011 ms => 1023 command
    sig = 1'b1;
    repeat(2011) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-2011) @( posedge clk_1M );
    sig = 1'b1;
    repeat(2011) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-2011) @( posedge clk_1M );
    sig = 1'b1;
    repeat(2011) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-2011) @( posedge clk_1M );

    // Out of range high => 1023 command
    sig = 1'b1;
    repeat(2021) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-2021) @( posedge clk_1M );
    sig = 1'b1;
    repeat(2021) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-2021) @( posedge clk_1M );
    sig = 1'b1;
    repeat(2021) @( posedge clk_1M );
    sig = 1'b0;
    repeat(PERIOD-2021) @( posedge clk_1M );

    // Terminate test bench
    sig = 1'b0;
    repeat(2*PERIOD) @( posedge clk_1M );
    $finish;

  end

endmodule



