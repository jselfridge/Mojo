
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// int_to_single_small_tb.v
// Test bench for the ‘int_to_single_small’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module int_to_single_small_tb ();

  // Module inputs
  reg clk;
  reg rst;
  reg [31:0] int_val;
  reg int_cont;
  reg single_cont;

  // Module outputs
  wire [31:0] single_val;
  wire int_ready;
  wire single_ready;

  // Connect ‘int_to_single_small’ module
  int_to_single_small
    DUT_int_to_single_small (
    .clk(clk),
    .rst(rst),
    .int_val(int_val),
    .int_cont(int_cont),
    .single_cont(single_cont),
    .single_val(single_val),
    .single_ready(single_ready),
    .int_ready(int_ready)
  );

  // Clock signal
  initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
  end

  // Reset signal
  initial begin
    int_cont = 1'b1;
    single_cont = 1'b1;
    rst = 1'b1;
    #50 rst = 1'b0;
  end

  // Sim duration
  initial begin
    #50000 $finish;
  end

  // Assign a variety of 'int_input' values
  initial begin

    //~~~~~~~~~~~~~~~ SIGNED INT ~~~~~~~~ DECIMAL ~~~ FLOAT HEX ~~~~
    #2000 int_val = 32'h80000000;  // -2147483648    0xCF000000
    #2000 int_val = 32'hC0000000;  // -1073741824    0xCE800000
    #2000 int_val = 32'hF9000000;  //  -117440512    0xCCE00000
    #2000 int_val = 32'hFFF0A000;  //    -1007616    0xC9760000
    #2000 int_val = 32'hFFFFF020;  //       -4064    0xC57E0000
    #2000 int_val = 32'hFFFFFFF0;  //         -16    0xC1800000
    #2000 int_val = 32'hFFFFFFFE;  //          -2    0xC0000000
    #2000 int_val = 32'hFFFFFFFF;  //          -1    0xBF800000
    #2000 int_val = 32'h00000000;  //           0    0x00000000
    #2000 int_val = 32'h00000001;  //           1    0x3F800000
    #2000 int_val = 32'h0000000F;  //          15    0x41700000
    #2000 int_val = 32'h00000400;  //        1024    0x44800000
    #2000 int_val = 32'h0000D000;  //       53248    0x47500000
    #2000 int_val = 32'h00090000;  //      589824    0x49100000
    #2000 int_val = 32'h00A00000;  //    10485760    0x4B200000
    #2000 int_val = 32'h08000000;  //   134217728    0x4D000000
    #2000 int_val = 32'h10000000;  //   268435456    0x4D800000
    #2000 int_val = 32'h40000000;  //  1073741824    0x4E800000
    #2000 int_val = 32'h7F000000;  //  2130706432    0x4EFE0000
    #2000 int_val = 32'h7FFFFFFF;  //  2147483647    0x4F000000

  end

endmodule



