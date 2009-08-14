////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: mult12x8.v
// /___/   /\     Timestamp: Sat Aug 08 13:05:05 2009
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\modem\telemetry\coregen\tmp\_cg\mult12x8.ngc C:\modem\telemetry\coregen\tmp\_cg\mult12x8.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/mult12x8.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/mult12x8.v
// # of Modules	: 1
// Design Name	: mult12x8
// Xilinx        : C:\Xilinx\10.1\ISE
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module mult12x8 (
  sclr, ce, clk, a, b, p
);
  input sclr;
  input ce;
  input clk;
  input [11 : 0] a;
  input [7 : 0] b;
  output [12 : 0] p;
  
  // synthesis translate_off
  
  wire \BU2/U0/gLUT.iLUT/s3_add_out<0>[0] ;
  wire \BU2/U0/gLUT.iLUT/s3_add_out<0>[1] ;
  wire \BU2/U0/gLUT.iLUT/s3_add_out<0>[2] ;
  wire \BU2/U0/gLUT.iLUT/s3_add_out<0>[3] ;
  wire \BU2/U0/gLUT.iLUT/s3_add_out<0>[4] ;
  wire \BU2/U0/gLUT.iLUT/s3_add_out<0>[5] ;
  wire \BU2/U0/gLUT.iLUT/s3_add_out<0>[6] ;
  wire \BU2/U0/gLUT.iLUT/s3_add_out<0>[20] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[4] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[5] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[6] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[7] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[8] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[9] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[10] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[11] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[12] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[13] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[14] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[15] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[16] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[17] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[18] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[19] ;
  wire \BU2/U0/gLUT.iLUT/sum0<0>[21] ;
  wire \BU2/U0/gLUT.iLUT/ma_sig ;
  wire \BU2/U0/gLUT.iLUT/lut_sig ;
  wire \BU2/U0/gLUT.iLUT/ma_sig0 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig0 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig1 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig1_243 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig2 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig2 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig3 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig3 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig4 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig4 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig5 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig5 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig6 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig6 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig7 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig7 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig8 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig8 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig9 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig9 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig10 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig10 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig11 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig111_203 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig11 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig12 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig13 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig13 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig14 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig14 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig15 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig15 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig16 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig16 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig17 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig17 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig18 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig18 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig19 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig19 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig20 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig20 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig21 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig21 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig22 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig22 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig23 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig23 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig24 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig24 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig251_149 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig25 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig25 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig27 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig26 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig28 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig27 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig29 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig28 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig30 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig29 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig31 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig30 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig32 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig31 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig33 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig32 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig34 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig33 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig35 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig34 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig36 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig35 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig37 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig36 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig38 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig37 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig391_95 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig39 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig38 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig41 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig39 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig42 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig40 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig43 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig41 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig44 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig42 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig45 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig43 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig46 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig44 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig47 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig45 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig48 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig46 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig49 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig47 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig50 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig48 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig51 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig49 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig52 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig50 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig531_41 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig53 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire [11 : 0] a_2;
  wire [7 : 0] b_3;
  wire [12 : 0] p_4;
  wire [13 : 0] \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut ;
  wire [12 : 0] \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy ;
  wire [15 : 0] \BU2/U0/gLUT.iLUT/s1_add_out<0> ;
  wire [13 : 0] \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut ;
  wire [12 : 0] \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy ;
  wire [16 : 0] \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut ;
  wire [15 : 0] \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy ;
  wire [15 : 0] \BU2/U0/gLUT.iLUT/s1_add_out<1> ;
  wire [12 : 0] \BU2/U0/gLUT.iLUT/pp_cout<0> ;
  wire [13 : 2] \BU2/U0/gLUT.iLUT/pp_out<0> ;
  wire [13 : 0] \BU2/U0/gLUT.iLUT/pp_out<1> ;
  wire [12 : 0] \BU2/U0/gLUT.iLUT/pp_cout<1> ;
  wire [12 : 0] \BU2/U0/gLUT.iLUT/pp_cout<2> ;
  wire [13 : 2] \BU2/U0/gLUT.iLUT/pp_out<2> ;
  wire [13 : 0] \BU2/U0/gLUT.iLUT/pp_out<3> ;
  wire [12 : 0] \BU2/U0/gLUT.iLUT/pp_cout<3> ;
  wire [0 : 0] \BU2/zero_detect ;
  assign
    a_2[11] = a[11],
    a_2[10] = a[10],
    a_2[9] = a[9],
    a_2[8] = a[8],
    a_2[7] = a[7],
    a_2[6] = a[6],
    a_2[5] = a[5],
    a_2[4] = a[4],
    a_2[3] = a[3],
    a_2[2] = a[2],
    a_2[1] = a[1],
    a_2[0] = a[0],
    b_3[7] = b[7],
    b_3[6] = b[6],
    b_3[5] = b[5],
    b_3[4] = b[4],
    b_3[3] = b[3],
    b_3[2] = b[2],
    b_3[1] = b[1],
    b_3[0] = b[0],
    p[12] = p_4[12],
    p[11] = p_4[11],
    p[10] = p_4[10],
    p[9] = p_4[9],
    p[8] = p_4[8],
    p[7] = p_4[7],
    p[6] = p_4[6],
    p[5] = p_4[5],
    p[4] = p_4[4],
    p[3] = p_4[3],
    p[2] = p_4[2],
    p[1] = p_4[1],
    p[0] = p_4[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig1111  (
    .I0(a_2[11]),
    .I1(b_3[0]),
    .I2(b_3[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig111_203 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig2511  (
    .I0(a_2[11]),
    .I1(b_3[2]),
    .I2(b_3[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig251_149 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig3911  (
    .I0(a_2[11]),
    .I1(b_3[4]),
    .I2(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig391_95 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig5311  (
    .I0(a_2[11]),
    .I1(b_3[6]),
    .I2(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig531_41 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/gLUT.iLUT/lut_sig1  (
    .I0(a_2[0]),
    .I1(b_3[0]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig0_Result1  (
    .I0(b_3[0]),
    .I1(b_3[1]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig0 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig1_Result1  (
    .I0(b_3[0]),
    .I1(b_3[1]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig1_243 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/gLUT.iLUT/lut_sig131  (
    .I0(a_2[0]),
    .I1(b_3[2]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig13 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig2_Result1  (
    .I0(b_3[0]),
    .I1(b_3[1]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig2 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig14_Result1  (
    .I0(b_3[2]),
    .I1(b_3[3]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig14 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig3_Result1  (
    .I0(b_3[0]),
    .I1(b_3[1]),
    .I2(a_2[3]),
    .I3(a_2[4]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig3 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/gLUT.iLUT/lut_sig271  (
    .I0(a_2[0]),
    .I1(b_3[4]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig27 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig15_Result1  (
    .I0(b_3[2]),
    .I1(b_3[3]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig15 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig4_Result1  (
    .I0(b_3[0]),
    .I1(b_3[1]),
    .I2(a_2[4]),
    .I3(a_2[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig4 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig16_Result1  (
    .I0(b_3[2]),
    .I1(b_3[3]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig16 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig28_Result1  (
    .I0(b_3[4]),
    .I1(b_3[5]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig28 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig5_Result1  (
    .I0(b_3[0]),
    .I1(b_3[1]),
    .I2(a_2[5]),
    .I3(a_2[6]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig5 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig29_Result1  (
    .I0(b_3[4]),
    .I1(b_3[5]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig29 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig17_Result1  (
    .I0(b_3[2]),
    .I1(b_3[3]),
    .I2(a_2[3]),
    .I3(a_2[4]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig17 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig6_Result1  (
    .I0(b_3[0]),
    .I1(b_3[1]),
    .I2(a_2[6]),
    .I3(a_2[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig6 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/gLUT.iLUT/lut_sig411  (
    .I0(a_2[0]),
    .I1(b_3[6]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig41 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig18_Result1  (
    .I0(b_3[2]),
    .I1(b_3[3]),
    .I2(a_2[4]),
    .I3(a_2[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig18 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig30_Result1  (
    .I0(b_3[4]),
    .I1(b_3[5]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig30 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig7_Result1  (
    .I0(b_3[0]),
    .I1(b_3[1]),
    .I2(a_2[7]),
    .I3(a_2[8]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig7 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig42_Result1  (
    .I0(b_3[6]),
    .I1(b_3[7]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig42 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig31_Result1  (
    .I0(b_3[4]),
    .I1(b_3[5]),
    .I2(a_2[3]),
    .I3(a_2[4]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig31 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig19_Result1  (
    .I0(b_3[2]),
    .I1(b_3[3]),
    .I2(a_2[5]),
    .I3(a_2[6]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig19 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig8_Result1  (
    .I0(b_3[0]),
    .I1(b_3[1]),
    .I2(a_2[8]),
    .I3(a_2[9]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig8 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig43_Result1  (
    .I0(b_3[6]),
    .I1(b_3[7]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig43 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig20_Result1  (
    .I0(b_3[2]),
    .I1(b_3[3]),
    .I2(a_2[6]),
    .I3(a_2[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig20 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig32_Result1  (
    .I0(a_2[4]),
    .I1(b_3[4]),
    .I2(a_2[5]),
    .I3(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig32 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig9_Result1  (
    .I0(a_2[10]),
    .I1(b_3[1]),
    .I2(a_2[9]),
    .I3(b_3[0]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig9 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig44_Result1  (
    .I0(a_2[2]),
    .I1(b_3[6]),
    .I2(a_2[3]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig44 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig33_Result1  (
    .I0(a_2[5]),
    .I1(b_3[4]),
    .I2(a_2[6]),
    .I3(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig33 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig21_Result1  (
    .I0(a_2[7]),
    .I1(b_3[2]),
    .I2(a_2[8]),
    .I3(b_3[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig21 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig10_Result1  (
    .I0(a_2[10]),
    .I1(b_3[0]),
    .I2(a_2[11]),
    .I3(b_3[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig10 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig45_Result1  (
    .I0(a_2[3]),
    .I1(b_3[6]),
    .I2(a_2[4]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig45 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig22_Result1  (
    .I0(a_2[8]),
    .I1(b_3[2]),
    .I2(a_2[9]),
    .I3(b_3[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig22 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig34_Result1  (
    .I0(a_2[6]),
    .I1(b_3[4]),
    .I2(a_2[7]),
    .I3(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig34 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig111  (
    .I0(a_2[11]),
    .I1(b_3[0]),
    .I2(b_3[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig11 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig46_Result1  (
    .I0(a_2[4]),
    .I1(b_3[6]),
    .I2(a_2[5]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig46 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig35_Result1  (
    .I0(a_2[7]),
    .I1(b_3[4]),
    .I2(a_2[8]),
    .I3(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig35 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig23_Result1  (
    .I0(a_2[10]),
    .I1(b_3[3]),
    .I2(a_2[9]),
    .I3(b_3[2]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig23 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig47_Result1  (
    .I0(a_2[5]),
    .I1(b_3[6]),
    .I2(a_2[6]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig47 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig24_Result1  (
    .I0(a_2[10]),
    .I1(b_3[2]),
    .I2(a_2[11]),
    .I3(b_3[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig24 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig36_Result1  (
    .I0(a_2[8]),
    .I1(b_3[4]),
    .I2(a_2[9]),
    .I3(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig36 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig48_Result1  (
    .I0(a_2[6]),
    .I1(b_3[6]),
    .I2(a_2[7]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig48 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig37_Result1  (
    .I0(a_2[10]),
    .I1(b_3[5]),
    .I2(a_2[9]),
    .I3(b_3[4]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig37 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig49_Result1  (
    .I0(a_2[7]),
    .I1(b_3[6]),
    .I2(a_2[8]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig49 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig38_Result1  (
    .I0(a_2[10]),
    .I1(b_3[4]),
    .I2(a_2[11]),
    .I3(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig38 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig50_Result1  (
    .I0(a_2[8]),
    .I1(b_3[6]),
    .I2(a_2[9]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig50 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig391  (
    .I0(a_2[11]),
    .I1(b_3[4]),
    .I2(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig39 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig51_Result1  (
    .I0(a_2[10]),
    .I1(b_3[7]),
    .I2(a_2[9]),
    .I3(b_3[6]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig51 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig52_Result1  (
    .I0(a_2[10]),
    .I1(b_3[6]),
    .I2(a_2[11]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig52 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig251  (
    .I0(a_2[11]),
    .I1(b_3[2]),
    .I2(b_3[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig25 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig531  (
    .I0(a_2[11]),
    .I1(b_3[6]),
    .I2(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig53 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/s1_add_out<0> [0]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s3_add_out<0>[0] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/s1_add_out<0> [1]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s3_add_out<0>[1] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/s1_add_out<0> [2]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s3_add_out<0>[2] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/s1_add_out<0> [3]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s3_add_out<0>[3] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[4] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s3_add_out<0>[4] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[5] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s3_add_out<0>[5] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[6] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s3_add_out<0>[6] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[7] ),
    .R(sclr),
    .Q(p_4[0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[8] ),
    .R(sclr),
    .Q(p_4[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[9] ),
    .R(sclr),
    .Q(p_4[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[10] ),
    .R(sclr),
    .Q(p_4[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[11] ),
    .R(sclr),
    .Q(p_4[4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[12] ),
    .R(sclr),
    .Q(p_4[5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[13] ),
    .R(sclr),
    .Q(p_4[6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[14] ),
    .R(sclr),
    .Q(p_4[7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[15] ),
    .R(sclr),
    .Q(p_4[8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_16  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[16] ),
    .R(sclr),
    .Q(p_4[9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_17  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[17] ),
    .R(sclr),
    .Q(p_4[10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_18  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[18] ),
    .R(sclr),
    .Q(p_4[11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_19  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[19] ),
    .R(sclr),
    .Q(p_4[12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_20  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0>[21] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s3_add_out<0>[20] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<0>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [2]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [0]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [0])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<0>  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [2]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [0]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<0>  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [0]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<1>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [3]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [1]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [1])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<1>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [0]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [3]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [1]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<1>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [0]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [1]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<2>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [4]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [2]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [2])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<2>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [1]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [4]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [2]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<2>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [1]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [2]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<3>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [5]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [3]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [3])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<3>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [2]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [5]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [3]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<3>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [2]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [3]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<4>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [6]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [4]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [4])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<4>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [3]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [6]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [4]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<4>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [3]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [4]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<5>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [7]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [5]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [5])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<5>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [4]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [7]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [5]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<5>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [4]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [5]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<6>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [8]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [6]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [6])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<6>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [5]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [8]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [6]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<6>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [5]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [6]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<7>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [9]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [7]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [7])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<7>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [6]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [9]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [7]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<7>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [6]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [7]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<8>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [10]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [8]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [8])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<8>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [7]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [10]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [8]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<8>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [7]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [8]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<9>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [11]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [9]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [9])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<9>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [8]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [11]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [9]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<9>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [8]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [9]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<10>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [12]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [10]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [10])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<10>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [9]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [12]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [10]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<10>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [9]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [10]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<11>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [13]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [11]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [11])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<11>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [10]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [13]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [11]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [11])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<11>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [10]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [11]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<12>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [13]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [12]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [12])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<12>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [11]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<2> [13]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [12]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [12])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<12>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [11]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [12]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<13>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<2> [13]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<3> [13]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [13])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<13>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [12]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [13]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<0>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [2]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [0]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [0])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<0>  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [2]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [0]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<0>  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [0]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<1>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [3]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [1]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [1])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<1>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [0]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [3]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [1]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<1>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [0]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [1]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<2>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [4]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [2]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [2])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<2>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [1]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [4]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [2]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<2>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [1]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [2]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<3>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [5]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [3]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [3])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<3>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [2]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [5]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [3]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<3>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [2]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [3]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<4>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [6]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [4]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [4])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<4>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [3]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [6]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [4]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<4>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [3]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [4]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<5>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [7]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [5]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [5])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<5>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [4]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [7]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [5]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<5>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [4]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [5]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<6>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [8]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [6]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [6])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<6>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [5]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [8]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [6]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<6>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [5]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [6]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<7>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [9]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [7]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [7])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<7>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [6]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [9]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [7]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<7>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [6]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [7]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<8>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [10]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [8]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [8])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<8>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [7]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [10]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [8]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<8>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [7]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [8]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<9>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [11]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [9]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [9])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<9>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [8]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [11]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [9]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<9>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [8]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [9]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<10>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [12]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [10]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [10])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<10>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [9]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [12]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [10]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<10>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [9]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [10]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<11>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [13]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [11]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [11])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<11>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [10]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [13]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [11]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [11])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<11>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [10]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [11]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<12>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [13]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [12]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [12])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<12>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [11]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out<0> [13]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [12]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [12])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<12>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [11]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [12]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<13>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out<0> [13]),
    .I1(\BU2/U0/gLUT.iLUT/pp_out<1> [13]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [13])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<13>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [12]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [13]),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<0>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [4]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [0]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [0])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<0>  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [4]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [0]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<0>  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [0]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[4] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<1>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [5]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [1]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [1])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<1>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [0]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [5]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [1]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<1>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [0]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [1]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[5] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<2>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [6]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [2]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [2])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<2>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [1]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [6]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [2]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<2>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [1]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [2]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[6] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<3>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [7]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [3]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [3])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<3>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [2]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [7]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [3]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<3>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [2]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [3]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[7] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<4>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [8]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [4]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [4])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<4>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [3]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [8]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [4]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<4>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [3]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [4]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[8] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<5>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [9]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [5]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [5])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<5>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [4]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [9]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [5]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<5>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [4]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [5]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[9] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<6>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [10]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [6]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [6])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<6>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [5]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [10]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [6]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<6>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [5]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [6]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[10] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<7>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [11]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [7]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [7])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<7>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [6]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [11]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [7]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<7>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [6]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [7]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[11] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<8>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [12]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [8]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [8])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<8>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [7]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [12]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [8]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<8>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [7]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [8]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[12] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<9>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [13]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [9]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [9])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<9>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [8]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [13]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [9]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<9>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [8]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [9]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[13] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<10>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [14]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [10]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [10])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<10>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [9]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [14]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [10]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<10>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [9]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [10]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[14] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<11>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [15]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [11]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [11])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<11>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [10]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [15]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [11]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [11])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<11>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [10]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [11]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[15] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<12>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [15]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [12]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [12])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<12>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [11]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [15]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [12]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [12])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<12>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [11]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [12]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[16] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<13>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [15]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [13]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [13])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<13>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [12]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [15]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [13]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [13])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<13>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [12]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [13]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[17] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<14>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [15]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [14]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [14])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<14>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [13]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [15]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [14]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [14])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<14>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [13]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [14]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[18] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<15>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [15]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [15]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [15])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<15>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [14]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out<0> [15]),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [15]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [15])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<15>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [14]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [15]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[19] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<16>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out<0> [15]),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out<1> [15]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [16])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<16>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [15]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [16]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0>[21] )
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.ma0  (
    .I0(b_3[0]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.muxcy00  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.xorcy0  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig ),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [0])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig0 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig0 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig0 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig0 ),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<0> [1])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[1]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig1 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [1]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig1 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig1_243 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [1]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig1_243 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [2])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[2]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig2 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [2]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig2 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig2 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [2]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig2 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [3])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[3]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig3 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [3]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig3 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig3 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [3]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig3 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [4])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[4]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig4 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [4]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig4 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig4 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [4]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig4 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [5])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[5]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig5 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [5]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig5 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig5 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [5]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig5 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [6])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[6]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig6 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [6]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig6 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig6 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [6]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig6 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [7])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[7]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig7 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [7]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig7 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig7 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [7]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig7 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [8])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[9].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[8]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig8 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[9].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [8]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig8 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig8 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[9].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [8]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig8 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [9])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[10].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[9]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig9 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[10].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [9]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig9 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig9 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[10].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [9]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig9 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [10])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[11].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[10]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig10 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[11].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [10]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig10 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig10 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [11])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[11].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [10]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig10 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [11])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[12].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[11]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig11 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[12].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [11]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig11 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig111_203 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [12])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[12].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [11]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig111_203 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [12])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[13].ppadd.b_is_even.stageMSB.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [12]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig11 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [13])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.ma0  (
    .I0(b_3[2]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig12 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.muxcy00  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig12 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig13 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.xorcy0  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig13 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [0])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig13 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig13 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig14 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig14 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [1])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[1]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig14 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [1]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig14 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig15 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [1]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig15 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [2])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[2]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig15 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [2]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig15 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig16 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [2]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig16 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [3])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[3]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig16 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [3]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig16 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig17 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [3]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig17 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [4])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[4]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig17 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [4]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig17 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig18 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [4]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig18 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [5])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[5]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig18 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [5]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig18 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig19 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [5]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig19 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [6])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[6]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig19 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [6]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig19 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig20 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [6]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig20 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [7])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[7]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig20 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [7]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig20 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig21 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [7]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig21 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [8])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[9].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[8]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig21 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[9].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [8]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig21 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig22 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[9].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [8]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig22 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [9])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[10].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[9]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig22 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[10].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [9]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig22 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig23 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[10].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [9]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig23 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [10])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[11].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[10]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig23 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[11].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [10]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig23 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig24 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [11])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[11].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [10]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig24 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [11])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[12].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[11]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig24 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[12].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [11]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig24 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig251_149 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [12])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[12].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [11]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig251_149 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [12])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[13].ppadd.b_is_even.stageMSB.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [12]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig25 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [13])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.ma0  (
    .I0(b_3[4]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig25 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.muxcy00  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig25 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig27 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.xorcy0  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig27 ),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [0])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig26 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig26 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig28 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig28 ),
    .O(\BU2/U0/gLUT.iLUT/s1_add_out<1> [1])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[1]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig27 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [1]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig27 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig29 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [1]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig29 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [2])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[2]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig28 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [2]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig28 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig30 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [2]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig30 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [3])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[3]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig29 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [3]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig29 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig31 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [3]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig31 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [4])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[4]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig30 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [4]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig30 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig32 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [4]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig32 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [5])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[5]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig31 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [5]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig31 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig33 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [5]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig33 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [6])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[6]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig32 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [6]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig32 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig34 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [6]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig34 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [7])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[7]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig33 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [7]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig33 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig35 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [7]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig35 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [8])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[9].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[8]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig34 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[9].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [8]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig34 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig36 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[9].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [8]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig36 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [9])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[10].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[9]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig35 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[10].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [9]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig35 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig37 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[10].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [9]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig37 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [10])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[11].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[10]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig36 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[11].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [10]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig36 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig38 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [11])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[11].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [10]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig38 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [11])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[12].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[11]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig37 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[12].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [11]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig37 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig391_95 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [12])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[12].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [11]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig391_95 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [12])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[13].ppadd.b_is_even.stageMSB.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [12]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig39 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [13])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.ma0  (
    .I0(b_3[6]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig38 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.muxcy00  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig38 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig41 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.xorcy0  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig41 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [0])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig39 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig39 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig42 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig42 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [1])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[1]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig40 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [1]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig40 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig43 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [1]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig43 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [2])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[2]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig41 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [2]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig41 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig44 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [2]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig44 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [3])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[3]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig42 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [3]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig42 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig45 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [3]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig45 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [4])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[4]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig43 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [4]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig43 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig46 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [4]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig46 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [5])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[5]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig44 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [5]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig44 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig47 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [5]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig47 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [6])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[6]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig45 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [6]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig45 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig48 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [6]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig48 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [7])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[7]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig46 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [7]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig46 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig49 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [7]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig49 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [8])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[9].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[8]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig47 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[9].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [8]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig47 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig50 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[9].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [8]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig50 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [9])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[10].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[9]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig48 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[10].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [9]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig48 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig51 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[10].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [9]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig51 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [10])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[11].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[10]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig49 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[11].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [10]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig49 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig52 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [11])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[11].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [10]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig52 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [11])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[12].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[11]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig50 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[12].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [11]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig50 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig531_41 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [12])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[12].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [11]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig531_41 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [12])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[13].ppadd.b_is_even.stageMSB.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [12]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig53 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [13])
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/zero_detect [0])
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

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

// synthesis translate_on
