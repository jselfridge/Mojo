
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
// single_to_int_small_tb.v
// Test bench for the ‘single_to_int_small’ module.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

module single_to_int_small_tb ();

  // Module inputs
  reg clk;
  reg rst;
  reg [31:0] single_val;
  reg single_cont;
  reg int_cont;

  // Module outputs
  wire [31:0] int_val;
  wire single_ready;
  wire int_ready;

  // Connect ‘single_to_int_small’ module
  single_to_int_small
    DUT_single_to_int_small (
    .clk(clk),
    .rst(rst),
    .single_val(single_val),
    .single_cont(single_cont),
    .int_cont(int_cont),
    .int_val(int_val),
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
    single_cont = 1'b1;
    int_cont = 1'b1;
    rst = 1'b1;
    #50 rst = 1'b0;
  end

  // Sim duration
  initial begin
    #25000 $finish;
  end

  // Assign a variety of 'single_val' values
  initial begin

    //~~~~~~~~~~~~~~~~~~~~~~ SINGLE ~~~~~~~~ DECIMAL ~~~~~~~~~ INT ~~~~
    #2000 single_val = 32'hCF000000;  // -2147483648    0x80000000
    #2000 single_val = 32'hC9760000;  //    -1007616    0xFFF0A000
    #2000 single_val = 32'hC0000000;  //          -2    0xFFFFFFFE
    #2000 single_val = 32'hBF800000;  //          -1    0xFFFFFFFF
    #2000 single_val = 32'h00000000;  //           0    0x00000000
    #2000 single_val = 32'h3F800000;  //           1    0x00000001
    #2000 single_val = 32'h4D000000;  //   134217728    0x08000000
    #2000 single_val = 32'h4EFE0000;  //  2130706432    0x7F000000
    #2000 single_val = 32'h3F900000;  //       1.125    0x00000001
    #2000 single_val = 32'h41196f50;  // 9.589675903    0x00000009
    #2000 single_val = 32'h3c4f1d5f;  //  0.01264128    0x00000000



/*
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
*/

  end

endmodule



