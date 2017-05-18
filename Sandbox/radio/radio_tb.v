
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// radio_tb.v
// Test bench for the 'radio' module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module radio_tb ();

  // Testbench inputs
  reg clk_1M, rst, radio;

  // Testbench outputs
  wire [9:0] cmd;

  // Radio module
  radio
    DUT
    (
    .clk_1M(clk_1M),
    .rst(rst),
    .radio(radio),
    .cmd(cmd)
    );

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

    radio = 1'b0;
    @(negedge rst);

    // Out of range low
    radio = 1'b1;
    repeat(978) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-978) @( posedge clk_1M );
    radio = 1'b1;
    repeat(978) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-978) @( posedge clk_1M );
    radio = 1'b1;
    repeat(978) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-978) @( posedge clk_1M );

    // 0 command
    radio = 1'b1;
    repeat(988+0) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-0) @( posedge clk_1M );
    radio = 1'b1;
    repeat(988+0) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-0) @( posedge clk_1M );
    radio = 1'b1;
    repeat(988+0) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-0) @( posedge clk_1M );

    // 12 command
    radio = 1'b1;
    repeat(988+12) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-12) @( posedge clk_1M );
    radio = 1'b1;
    repeat(988+12) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-12) @( posedge clk_1M );
    radio = 1'b1;
    repeat(988+12) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-12) @( posedge clk_1M );

    // 512 command
    radio = 1'b1;
    repeat(988+512) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-512) @( posedge clk_1M );
    radio = 1'b1;
    repeat(988+512) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-512) @( posedge clk_1M );
    radio = 1'b1;
    repeat(988+512) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-512) @( posedge clk_1M );

    // 1012 command
    radio = 1'b1;
    repeat(988+1012) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-1012) @( posedge clk_1M );
    radio = 1'b1;
    repeat(988+1012) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-1012) @( posedge clk_1M );
    radio = 1'b1;
    repeat(988+1012) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-1012) @( posedge clk_1M );

    // 1023 command
    radio = 1'b1;
    repeat(988+1023) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-1023) @( posedge clk_1M );
    radio = 1'b1;
    repeat(988+1023) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-1023) @( posedge clk_1M );
    radio = 1'b1;
    repeat(988+1023) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-988-1023) @( posedge clk_1M );

    // Out of range high
    radio = 1'b1;
    repeat(2021) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-2021) @( posedge clk_1M );
    radio = 1'b1;
    repeat(2021) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-2021) @( posedge clk_1M );
    radio = 1'b1;
    repeat(2021) @( posedge clk_1M );
    radio = 1'b0;
    repeat(3000-2021) @( posedge clk_1M );

    #50000
    $finish;

  end

endmodule



