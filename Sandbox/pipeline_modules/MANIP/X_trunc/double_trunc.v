//This file was automatically generated by the python 'pipeliner' script
//This module has a latency of 0 clocks
module dq (clk, q, d);
  input  clk;
  input  [width-1:0] d;
  output [width-1:0] q;
  parameter width=8;
  parameter depth=2;
  integer i;
  reg [width-1:0] delay_line [depth-1:0];
  always @(posedge clk) begin
    delay_line[0] <= d;
    for(i=1; i<depth; i=i+1) begin
      delay_line[i] <= delay_line[i-1];
    end
  end
  assign q = delay_line[depth-1];
endmodule

module double_trunc(clk, double_trunc_a, double_trunc_z);
  input clk;
  input [63:0] double_trunc_a;
  output [63:0] double_trunc_z;
  wire [63:0] s_0;
  wire [63:0] s_1;
  wire [0:0] s_2;
  wire [63:0] s_3;
  wire [62:0] s_4;
  wire [63:0] s_5;
  wire [63:0] s_6;
  wire [62:0] s_7;
  wire [63:0] s_8;
  wire [63:0] s_9;
  wire [62:0] s_10;
  wire [63:0] s_11;
  wire [63:0] s_12;
  wire [11:0] s_13;
  wire [10:0] s_14;
  wire [51:0] s_15;
  wire [52:0] s_16;
  wire [52:0] s_17;
  wire [52:0] s_18;
  wire [52:0] s_19;
  wire [0:0] s_20;
  wire [0:0] s_21;
  wire [0:0] s_22;
  wire [0:0] s_23;
  wire [10:0] s_24;
  wire [10:0] s_25;
  wire [9:0] s_26;
  wire [10:0] s_27;
  wire [51:0] s_28;
  wire [52:0] s_29;
  wire [52:0] s_30;
  wire [10:0] s_31;
  wire [10:0] s_32;
  wire [10:0] s_33;
  wire [10:0] s_34;
  wire [10:0] s_35;
  wire [10:0] s_36;
  wire [0:0] s_37;
  wire [10:0] s_38;
  wire [0:0] s_39;
  wire [10:0] s_40;
  wire [63:0] s_41;
  wire [11:0] s_42;
  wire [10:0] s_43;
  wire [9:0] s_44;
  wire [51:0] s_45;
  wire [0:0] s_46;
  wire [0:0] s_47;
  wire [10:0] s_48;
  wire [0:0] s_49;
  wire [0:0] s_50;
  wire [0:0] s_51;
  wire [52:0] s_52;
  wire [0:0] s_53;
  wire [0:0] s_54;
  wire [10:0] s_55;
  wire [0:0] s_56;
  wire [51:0] s_57;
  wire [0:0] s_58;
  wire [0:0] s_59;
  wire [10:0] s_60;
  wire [0:0] s_61;
  wire [51:0] s_62;

  assign s_0 = s_58?s_1:s_5;
  assign s_1 = {s_2,s_4};
  assign s_2 = s_3[63];
  assign s_3 = double_trunc_a;
  assign s_4 = 63'd9221120237041090560;
  assign s_5 = s_53?s_6:s_8;
  assign s_6 = {s_2,s_7};
  assign s_7 = 63'd9218868437227405312;
  assign s_8 = s_51?s_9:s_11;
  assign s_9 = {s_2,s_10};
  assign s_10 = 63'd0;
  assign s_11 = s_46?s_12:s_41;
  assign s_12 = {s_13,s_15};
  assign s_13 = {s_2,s_14};
  assign s_14 = 11'd0;
  assign s_15 = s_16[51:0];
  assign s_16 = s_39?s_17:s_18;
  assign s_17 = 53'd0;
  assign s_18 = s_19 & s_29;
  assign s_19 = {s_20,s_28};
  assign s_20 = s_23?s_21:s_22;
  assign s_21 = 1'd0;
  assign s_22 = 1'd1;
  assign s_23 = s_24 == s_27;
  assign s_24 = s_25 - s_26;
  assign s_25 = s_3[62:52];
  assign s_26 = 10'd1023;
  assign s_27 = -11'd1023;
  assign s_28 = s_3[51:0];
  assign s_29 = s_30 << s_31;
  assign s_30 = -53'd1;
  assign s_31 = s_37?s_32:s_33;
  assign s_32 = 11'd0;
  assign s_33 = s_34 - s_35;
  assign s_34 = 11'd52;
  assign s_35 = s_23?s_36:s_24;
  assign s_36 = -11'd1022;
  assign s_37 = $signed(s_35) >= $signed(s_38);
  assign s_38 = 11'd53;
  assign s_39 = $signed(s_35) < $signed(s_40);
  assign s_40 = 11'd0;
  assign s_41 = {s_42,s_45};
  assign s_42 = {s_2,s_43};
  assign s_43 = s_35 + s_44;
  assign s_44 = 10'd1023;
  assign s_45 = s_16[51:0];
  assign s_46 = s_47 & s_49;
  assign s_47 = s_35 == s_48;
  assign s_48 = -11'd1022;
  assign s_49 = ~s_50;
  assign s_50 = s_16[52];
  assign s_51 = s_16 == s_52;
  assign s_52 = 53'd0;
  assign s_53 = s_54 & s_56;
  assign s_54 = s_24 == s_55;
  assign s_55 = 11'd1024;
  assign s_56 = s_28 == s_57;
  assign s_57 = 52'd0;
  assign s_58 = s_59 & s_61;
  assign s_59 = s_24 == s_60;
  assign s_60 = 11'd1024;
  assign s_61 = s_28 != s_62;
  assign s_62 = 52'd0;
  assign double_trunc_z = s_0;
endmodule
