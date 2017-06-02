////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: sawtooth_translate.v
// /___/   /\     Timestamp: Fri Jun  2 10:44:17 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/translate -ofmt verilog -sim sawtooth.ngd sawtooth_translate.v 
// Device	: 6slx9csg324-2
// Input file	: sawtooth.ngd
// Output file	: /home/justin/Documents/FPGA/Util/waveforms/sawtooth/test/netgen/translate/sawtooth_translate.v
// # of Modules	: 1
// Design Name	: sawtooth
// Xilinx        : /opt/Xilinx/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module sawtooth (
  clk, rst, val
);
  input clk;
  input rst;
  output [7 : 0] val;
  wire clk_BUFGP;
  wire rst_IBUF_4;
  wire val_7_OBUF_14;
  wire val_6_OBUF_15;
  wire val_5_OBUF_16;
  wire val_4_OBUF_17;
  wire val_3_OBUF_18;
  wire val_2_OBUF_19;
  wire val_1_OBUF_20;
  wire val_0_OBUF_21;
  wire N0;
  wire N1;
  wire \Mcount_ctr_q_cy<1>_rt_106 ;
  wire \Mcount_ctr_q_cy<2>_rt_107 ;
  wire \Mcount_ctr_q_cy<3>_rt_108 ;
  wire \Mcount_ctr_q_cy<4>_rt_109 ;
  wire \Mcount_ctr_q_cy<5>_rt_110 ;
  wire \Mcount_ctr_q_cy<6>_rt_111 ;
  wire \Mcount_ctr_q_cy<7>_rt_112 ;
  wire \Mcount_ctr_q_cy<8>_rt_113 ;
  wire \Mcount_ctr_q_cy<9>_rt_114 ;
  wire \Mcount_ctr_q_cy<10>_rt_115 ;
  wire \Mcount_ctr_q_cy<11>_rt_116 ;
  wire \Mcount_ctr_q_cy<12>_rt_117 ;
  wire \Mcount_ctr_q_cy<13>_rt_118 ;
  wire \Mcount_ctr_q_cy<14>_rt_119 ;
  wire \Mcount_ctr_q_cy<15>_rt_120 ;
  wire \Mcount_ctr_q_cy<16>_rt_121 ;
  wire \Mcount_ctr_q_cy<17>_rt_122 ;
  wire \Mcount_ctr_q_cy<18>_rt_123 ;
  wire \Mcount_ctr_q_cy<19>_rt_124 ;
  wire \Mcount_ctr_q_cy<20>_rt_125 ;
  wire \Mcount_ctr_q_cy<21>_rt_126 ;
  wire \Mcount_ctr_q_cy<22>_rt_127 ;
  wire \Mcount_ctr_q_cy<23>_rt_128 ;
  wire \Mcount_ctr_q_cy<24>_rt_129 ;
  wire \Mcount_ctr_q_cy<25>_rt_130 ;
  wire \Mcount_ctr_q_xor<26>_rt_131 ;
  wire \clk_BUFGP/IBUFG_2 ;
  wire VCC;
  wire GND;
  wire [26 : 0] ctr_q;
  wire [26 : 0] Result;
  wire [0 : 0] Mcount_ctr_q_lut;
  wire [25 : 0] Mcount_ctr_q_cy;
  X_ONE   XST_VCC (
    .O(N0)
  );
  X_ZERO   XST_GND (
    .O(N1)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_0 (
    .CLK(clk_BUFGP),
    .I(Result[0]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[0]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_1 (
    .CLK(clk_BUFGP),
    .I(Result[1]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[1]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_2 (
    .CLK(clk_BUFGP),
    .I(Result[2]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[2]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_3 (
    .CLK(clk_BUFGP),
    .I(Result[3]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[3]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_4 (
    .CLK(clk_BUFGP),
    .I(Result[4]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[4]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_5 (
    .CLK(clk_BUFGP),
    .I(Result[5]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[5]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_6 (
    .CLK(clk_BUFGP),
    .I(Result[6]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[6]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_7 (
    .CLK(clk_BUFGP),
    .I(Result[7]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[7]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_8 (
    .CLK(clk_BUFGP),
    .I(Result[8]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[8]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_9 (
    .CLK(clk_BUFGP),
    .I(Result[9]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[9]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_10 (
    .CLK(clk_BUFGP),
    .I(Result[10]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[10]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_11 (
    .CLK(clk_BUFGP),
    .I(Result[11]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[11]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_12 (
    .CLK(clk_BUFGP),
    .I(Result[12]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[12]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_13 (
    .CLK(clk_BUFGP),
    .I(Result[13]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[13]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_14 (
    .CLK(clk_BUFGP),
    .I(Result[14]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[14]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_15 (
    .CLK(clk_BUFGP),
    .I(Result[15]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[15]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_16 (
    .CLK(clk_BUFGP),
    .I(Result[16]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[16]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_17 (
    .CLK(clk_BUFGP),
    .I(Result[17]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[17]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_18 (
    .CLK(clk_BUFGP),
    .I(Result[18]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[18]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_19 (
    .CLK(clk_BUFGP),
    .I(Result[19]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[19]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_20 (
    .CLK(clk_BUFGP),
    .I(Result[20]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[20]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_21 (
    .CLK(clk_BUFGP),
    .I(Result[21]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[21]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_22 (
    .CLK(clk_BUFGP),
    .I(Result[22]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[22]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_23 (
    .CLK(clk_BUFGP),
    .I(Result[23]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[23]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_24 (
    .CLK(clk_BUFGP),
    .I(Result[24]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[24]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_25 (
    .CLK(clk_BUFGP),
    .I(Result[25]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[25]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  ctr_q_26 (
    .CLK(clk_BUFGP),
    .I(Result[26]),
    .SRST(rst_IBUF_4),
    .O(ctr_q[26]),
    .CE(VCC),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_MUX2   \Mcount_ctr_q_cy<0>  (
    .IB(N1),
    .IA(N0),
    .SEL(Mcount_ctr_q_lut[0]),
    .O(Mcount_ctr_q_cy[0])
  );
  X_XOR2   \Mcount_ctr_q_xor<0>  (
    .I0(N1),
    .I1(Mcount_ctr_q_lut[0]),
    .O(Result[0])
  );
  X_MUX2   \Mcount_ctr_q_cy<1>  (
    .IB(Mcount_ctr_q_cy[0]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<1>_rt_106 ),
    .O(Mcount_ctr_q_cy[1])
  );
  X_XOR2   \Mcount_ctr_q_xor<1>  (
    .I0(Mcount_ctr_q_cy[0]),
    .I1(\Mcount_ctr_q_cy<1>_rt_106 ),
    .O(Result[1])
  );
  X_MUX2   \Mcount_ctr_q_cy<2>  (
    .IB(Mcount_ctr_q_cy[1]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<2>_rt_107 ),
    .O(Mcount_ctr_q_cy[2])
  );
  X_XOR2   \Mcount_ctr_q_xor<2>  (
    .I0(Mcount_ctr_q_cy[1]),
    .I1(\Mcount_ctr_q_cy<2>_rt_107 ),
    .O(Result[2])
  );
  X_MUX2   \Mcount_ctr_q_cy<3>  (
    .IB(Mcount_ctr_q_cy[2]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<3>_rt_108 ),
    .O(Mcount_ctr_q_cy[3])
  );
  X_XOR2   \Mcount_ctr_q_xor<3>  (
    .I0(Mcount_ctr_q_cy[2]),
    .I1(\Mcount_ctr_q_cy<3>_rt_108 ),
    .O(Result[3])
  );
  X_MUX2   \Mcount_ctr_q_cy<4>  (
    .IB(Mcount_ctr_q_cy[3]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<4>_rt_109 ),
    .O(Mcount_ctr_q_cy[4])
  );
  X_XOR2   \Mcount_ctr_q_xor<4>  (
    .I0(Mcount_ctr_q_cy[3]),
    .I1(\Mcount_ctr_q_cy<4>_rt_109 ),
    .O(Result[4])
  );
  X_MUX2   \Mcount_ctr_q_cy<5>  (
    .IB(Mcount_ctr_q_cy[4]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<5>_rt_110 ),
    .O(Mcount_ctr_q_cy[5])
  );
  X_XOR2   \Mcount_ctr_q_xor<5>  (
    .I0(Mcount_ctr_q_cy[4]),
    .I1(\Mcount_ctr_q_cy<5>_rt_110 ),
    .O(Result[5])
  );
  X_MUX2   \Mcount_ctr_q_cy<6>  (
    .IB(Mcount_ctr_q_cy[5]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<6>_rt_111 ),
    .O(Mcount_ctr_q_cy[6])
  );
  X_XOR2   \Mcount_ctr_q_xor<6>  (
    .I0(Mcount_ctr_q_cy[5]),
    .I1(\Mcount_ctr_q_cy<6>_rt_111 ),
    .O(Result[6])
  );
  X_MUX2   \Mcount_ctr_q_cy<7>  (
    .IB(Mcount_ctr_q_cy[6]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<7>_rt_112 ),
    .O(Mcount_ctr_q_cy[7])
  );
  X_XOR2   \Mcount_ctr_q_xor<7>  (
    .I0(Mcount_ctr_q_cy[6]),
    .I1(\Mcount_ctr_q_cy<7>_rt_112 ),
    .O(Result[7])
  );
  X_MUX2   \Mcount_ctr_q_cy<8>  (
    .IB(Mcount_ctr_q_cy[7]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<8>_rt_113 ),
    .O(Mcount_ctr_q_cy[8])
  );
  X_XOR2   \Mcount_ctr_q_xor<8>  (
    .I0(Mcount_ctr_q_cy[7]),
    .I1(\Mcount_ctr_q_cy<8>_rt_113 ),
    .O(Result[8])
  );
  X_MUX2   \Mcount_ctr_q_cy<9>  (
    .IB(Mcount_ctr_q_cy[8]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<9>_rt_114 ),
    .O(Mcount_ctr_q_cy[9])
  );
  X_XOR2   \Mcount_ctr_q_xor<9>  (
    .I0(Mcount_ctr_q_cy[8]),
    .I1(\Mcount_ctr_q_cy<9>_rt_114 ),
    .O(Result[9])
  );
  X_MUX2   \Mcount_ctr_q_cy<10>  (
    .IB(Mcount_ctr_q_cy[9]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<10>_rt_115 ),
    .O(Mcount_ctr_q_cy[10])
  );
  X_XOR2   \Mcount_ctr_q_xor<10>  (
    .I0(Mcount_ctr_q_cy[9]),
    .I1(\Mcount_ctr_q_cy<10>_rt_115 ),
    .O(Result[10])
  );
  X_MUX2   \Mcount_ctr_q_cy<11>  (
    .IB(Mcount_ctr_q_cy[10]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<11>_rt_116 ),
    .O(Mcount_ctr_q_cy[11])
  );
  X_XOR2   \Mcount_ctr_q_xor<11>  (
    .I0(Mcount_ctr_q_cy[10]),
    .I1(\Mcount_ctr_q_cy<11>_rt_116 ),
    .O(Result[11])
  );
  X_MUX2   \Mcount_ctr_q_cy<12>  (
    .IB(Mcount_ctr_q_cy[11]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<12>_rt_117 ),
    .O(Mcount_ctr_q_cy[12])
  );
  X_XOR2   \Mcount_ctr_q_xor<12>  (
    .I0(Mcount_ctr_q_cy[11]),
    .I1(\Mcount_ctr_q_cy<12>_rt_117 ),
    .O(Result[12])
  );
  X_MUX2   \Mcount_ctr_q_cy<13>  (
    .IB(Mcount_ctr_q_cy[12]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<13>_rt_118 ),
    .O(Mcount_ctr_q_cy[13])
  );
  X_XOR2   \Mcount_ctr_q_xor<13>  (
    .I0(Mcount_ctr_q_cy[12]),
    .I1(\Mcount_ctr_q_cy<13>_rt_118 ),
    .O(Result[13])
  );
  X_MUX2   \Mcount_ctr_q_cy<14>  (
    .IB(Mcount_ctr_q_cy[13]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<14>_rt_119 ),
    .O(Mcount_ctr_q_cy[14])
  );
  X_XOR2   \Mcount_ctr_q_xor<14>  (
    .I0(Mcount_ctr_q_cy[13]),
    .I1(\Mcount_ctr_q_cy<14>_rt_119 ),
    .O(Result[14])
  );
  X_MUX2   \Mcount_ctr_q_cy<15>  (
    .IB(Mcount_ctr_q_cy[14]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<15>_rt_120 ),
    .O(Mcount_ctr_q_cy[15])
  );
  X_XOR2   \Mcount_ctr_q_xor<15>  (
    .I0(Mcount_ctr_q_cy[14]),
    .I1(\Mcount_ctr_q_cy<15>_rt_120 ),
    .O(Result[15])
  );
  X_MUX2   \Mcount_ctr_q_cy<16>  (
    .IB(Mcount_ctr_q_cy[15]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<16>_rt_121 ),
    .O(Mcount_ctr_q_cy[16])
  );
  X_XOR2   \Mcount_ctr_q_xor<16>  (
    .I0(Mcount_ctr_q_cy[15]),
    .I1(\Mcount_ctr_q_cy<16>_rt_121 ),
    .O(Result[16])
  );
  X_MUX2   \Mcount_ctr_q_cy<17>  (
    .IB(Mcount_ctr_q_cy[16]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<17>_rt_122 ),
    .O(Mcount_ctr_q_cy[17])
  );
  X_XOR2   \Mcount_ctr_q_xor<17>  (
    .I0(Mcount_ctr_q_cy[16]),
    .I1(\Mcount_ctr_q_cy<17>_rt_122 ),
    .O(Result[17])
  );
  X_MUX2   \Mcount_ctr_q_cy<18>  (
    .IB(Mcount_ctr_q_cy[17]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<18>_rt_123 ),
    .O(Mcount_ctr_q_cy[18])
  );
  X_XOR2   \Mcount_ctr_q_xor<18>  (
    .I0(Mcount_ctr_q_cy[17]),
    .I1(\Mcount_ctr_q_cy<18>_rt_123 ),
    .O(Result[18])
  );
  X_MUX2   \Mcount_ctr_q_cy<19>  (
    .IB(Mcount_ctr_q_cy[18]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<19>_rt_124 ),
    .O(Mcount_ctr_q_cy[19])
  );
  X_XOR2   \Mcount_ctr_q_xor<19>  (
    .I0(Mcount_ctr_q_cy[18]),
    .I1(\Mcount_ctr_q_cy<19>_rt_124 ),
    .O(Result[19])
  );
  X_MUX2   \Mcount_ctr_q_cy<20>  (
    .IB(Mcount_ctr_q_cy[19]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<20>_rt_125 ),
    .O(Mcount_ctr_q_cy[20])
  );
  X_XOR2   \Mcount_ctr_q_xor<20>  (
    .I0(Mcount_ctr_q_cy[19]),
    .I1(\Mcount_ctr_q_cy<20>_rt_125 ),
    .O(Result[20])
  );
  X_MUX2   \Mcount_ctr_q_cy<21>  (
    .IB(Mcount_ctr_q_cy[20]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<21>_rt_126 ),
    .O(Mcount_ctr_q_cy[21])
  );
  X_XOR2   \Mcount_ctr_q_xor<21>  (
    .I0(Mcount_ctr_q_cy[20]),
    .I1(\Mcount_ctr_q_cy<21>_rt_126 ),
    .O(Result[21])
  );
  X_MUX2   \Mcount_ctr_q_cy<22>  (
    .IB(Mcount_ctr_q_cy[21]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<22>_rt_127 ),
    .O(Mcount_ctr_q_cy[22])
  );
  X_XOR2   \Mcount_ctr_q_xor<22>  (
    .I0(Mcount_ctr_q_cy[21]),
    .I1(\Mcount_ctr_q_cy<22>_rt_127 ),
    .O(Result[22])
  );
  X_MUX2   \Mcount_ctr_q_cy<23>  (
    .IB(Mcount_ctr_q_cy[22]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<23>_rt_128 ),
    .O(Mcount_ctr_q_cy[23])
  );
  X_XOR2   \Mcount_ctr_q_xor<23>  (
    .I0(Mcount_ctr_q_cy[22]),
    .I1(\Mcount_ctr_q_cy<23>_rt_128 ),
    .O(Result[23])
  );
  X_MUX2   \Mcount_ctr_q_cy<24>  (
    .IB(Mcount_ctr_q_cy[23]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<24>_rt_129 ),
    .O(Mcount_ctr_q_cy[24])
  );
  X_XOR2   \Mcount_ctr_q_xor<24>  (
    .I0(Mcount_ctr_q_cy[23]),
    .I1(\Mcount_ctr_q_cy<24>_rt_129 ),
    .O(Result[24])
  );
  X_MUX2   \Mcount_ctr_q_cy<25>  (
    .IB(Mcount_ctr_q_cy[24]),
    .IA(N1),
    .SEL(\Mcount_ctr_q_cy<25>_rt_130 ),
    .O(Mcount_ctr_q_cy[25])
  );
  X_XOR2   \Mcount_ctr_q_xor<25>  (
    .I0(Mcount_ctr_q_cy[24]),
    .I1(\Mcount_ctr_q_cy<25>_rt_130 ),
    .O(Result[25])
  );
  X_XOR2   \Mcount_ctr_q_xor<26>  (
    .I0(Mcount_ctr_q_cy[25]),
    .I1(\Mcount_ctr_q_xor<26>_rt_131 ),
    .O(Result[26])
  );
  X_LUT2 #(
    .INIT ( 4'h6 ))
  Mmux_val81 (
    .ADR0(ctr_q[25]),
    .ADR1(ctr_q[26]),
    .O(val_7_OBUF_14)
  );
  X_LUT2 #(
    .INIT ( 4'h6 ))
  Mmux_val71 (
    .ADR0(ctr_q[24]),
    .ADR1(ctr_q[26]),
    .O(val_6_OBUF_15)
  );
  X_LUT2 #(
    .INIT ( 4'h6 ))
  Mmux_val61 (
    .ADR0(ctr_q[23]),
    .ADR1(ctr_q[26]),
    .O(val_5_OBUF_16)
  );
  X_LUT2 #(
    .INIT ( 4'h6 ))
  Mmux_val51 (
    .ADR0(ctr_q[22]),
    .ADR1(ctr_q[26]),
    .O(val_4_OBUF_17)
  );
  X_LUT2 #(
    .INIT ( 4'h6 ))
  Mmux_val41 (
    .ADR0(ctr_q[21]),
    .ADR1(ctr_q[26]),
    .O(val_3_OBUF_18)
  );
  X_LUT2 #(
    .INIT ( 4'h6 ))
  Mmux_val31 (
    .ADR0(ctr_q[20]),
    .ADR1(ctr_q[26]),
    .O(val_2_OBUF_19)
  );
  X_LUT2 #(
    .INIT ( 4'h6 ))
  Mmux_val21 (
    .ADR0(ctr_q[19]),
    .ADR1(ctr_q[26]),
    .O(val_1_OBUF_20)
  );
  X_LUT2 #(
    .INIT ( 4'h6 ))
  Mmux_val11 (
    .ADR0(ctr_q[18]),
    .ADR1(ctr_q[26]),
    .O(val_0_OBUF_21)
  );
  X_BUF   rst_IBUF (
    .I(rst),
    .O(rst_IBUF_4)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<1>_rt  (
    .ADR0(ctr_q[1]),
    .O(\Mcount_ctr_q_cy<1>_rt_106 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<2>_rt  (
    .ADR0(ctr_q[2]),
    .O(\Mcount_ctr_q_cy<2>_rt_107 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<3>_rt  (
    .ADR0(ctr_q[3]),
    .O(\Mcount_ctr_q_cy<3>_rt_108 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<4>_rt  (
    .ADR0(ctr_q[4]),
    .O(\Mcount_ctr_q_cy<4>_rt_109 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<5>_rt  (
    .ADR0(ctr_q[5]),
    .O(\Mcount_ctr_q_cy<5>_rt_110 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<6>_rt  (
    .ADR0(ctr_q[6]),
    .O(\Mcount_ctr_q_cy<6>_rt_111 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<7>_rt  (
    .ADR0(ctr_q[7]),
    .O(\Mcount_ctr_q_cy<7>_rt_112 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<8>_rt  (
    .ADR0(ctr_q[8]),
    .O(\Mcount_ctr_q_cy<8>_rt_113 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<9>_rt  (
    .ADR0(ctr_q[9]),
    .O(\Mcount_ctr_q_cy<9>_rt_114 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<10>_rt  (
    .ADR0(ctr_q[10]),
    .O(\Mcount_ctr_q_cy<10>_rt_115 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<11>_rt  (
    .ADR0(ctr_q[11]),
    .O(\Mcount_ctr_q_cy<11>_rt_116 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<12>_rt  (
    .ADR0(ctr_q[12]),
    .O(\Mcount_ctr_q_cy<12>_rt_117 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<13>_rt  (
    .ADR0(ctr_q[13]),
    .O(\Mcount_ctr_q_cy<13>_rt_118 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<14>_rt  (
    .ADR0(ctr_q[14]),
    .O(\Mcount_ctr_q_cy<14>_rt_119 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<15>_rt  (
    .ADR0(ctr_q[15]),
    .O(\Mcount_ctr_q_cy<15>_rt_120 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<16>_rt  (
    .ADR0(ctr_q[16]),
    .O(\Mcount_ctr_q_cy<16>_rt_121 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<17>_rt  (
    .ADR0(ctr_q[17]),
    .O(\Mcount_ctr_q_cy<17>_rt_122 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<18>_rt  (
    .ADR0(ctr_q[18]),
    .O(\Mcount_ctr_q_cy<18>_rt_123 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<19>_rt  (
    .ADR0(ctr_q[19]),
    .O(\Mcount_ctr_q_cy<19>_rt_124 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<20>_rt  (
    .ADR0(ctr_q[20]),
    .O(\Mcount_ctr_q_cy<20>_rt_125 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<21>_rt  (
    .ADR0(ctr_q[21]),
    .O(\Mcount_ctr_q_cy<21>_rt_126 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<22>_rt  (
    .ADR0(ctr_q[22]),
    .O(\Mcount_ctr_q_cy<22>_rt_127 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<23>_rt  (
    .ADR0(ctr_q[23]),
    .O(\Mcount_ctr_q_cy<23>_rt_128 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<24>_rt  (
    .ADR0(ctr_q[24]),
    .O(\Mcount_ctr_q_cy<24>_rt_129 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_cy<25>_rt  (
    .ADR0(ctr_q[25]),
    .O(\Mcount_ctr_q_cy<25>_rt_130 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_ctr_q_xor<26>_rt  (
    .ADR0(ctr_q[26]),
    .O(\Mcount_ctr_q_xor<26>_rt_131 ),
    .ADR1(GND)
  );
  X_INV   \Mcount_ctr_q_lut<0>_INV_0  (
    .I(ctr_q[0]),
    .O(Mcount_ctr_q_lut[0])
  );
  X_IPAD   clk_130 (
    .PAD(clk)
  );
  X_IPAD   rst_131 (
    .PAD(rst)
  );
  X_OPAD   \val<7>  (
    .PAD(val[7])
  );
  X_OPAD   \val<6>  (
    .PAD(val[6])
  );
  X_OPAD   \val<5>  (
    .PAD(val[5])
  );
  X_OPAD   \val<4>  (
    .PAD(val[4])
  );
  X_OPAD   \val<3>  (
    .PAD(val[3])
  );
  X_OPAD   \val<2>  (
    .PAD(val[2])
  );
  X_OPAD   \val<1>  (
    .PAD(val[1])
  );
  X_OPAD   \val<0>  (
    .PAD(val[0])
  );
  X_CKBUF   \clk_BUFGP/BUFG  (
    .I(\clk_BUFGP/IBUFG_2 ),
    .O(clk_BUFGP)
  );
  X_CKBUF   \clk_BUFGP/IBUFG  (
    .I(clk),
    .O(\clk_BUFGP/IBUFG_2 )
  );
  X_OBUF   val_7_OBUF (
    .I(val_7_OBUF_14),
    .O(val[7])
  );
  X_OBUF   val_6_OBUF (
    .I(val_6_OBUF_15),
    .O(val[6])
  );
  X_OBUF   val_5_OBUF (
    .I(val_5_OBUF_16),
    .O(val[5])
  );
  X_OBUF   val_4_OBUF (
    .I(val_4_OBUF_17),
    .O(val[4])
  );
  X_OBUF   val_3_OBUF (
    .I(val_3_OBUF_18),
    .O(val[3])
  );
  X_OBUF   val_2_OBUF (
    .I(val_2_OBUF_19),
    .O(val[2])
  );
  X_OBUF   val_1_OBUF (
    .I(val_1_OBUF_20),
    .O(val[1])
  );
  X_OBUF   val_0_OBUF (
    .I(val_0_OBUF_21),
    .O(val[0])
  );
  X_ONE   NlwBlock_sawtooth_VCC (
    .O(VCC)
  );
  X_ZERO   NlwBlock_sawtooth_GND (
    .O(GND)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

