////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: L.46
//  \   \         Application: netgen
//  /   /         Filename: mult10x8.v
// /___/   /\     Timestamp: Mon Nov 23 10:27:46 2009
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog .\tmp\_cg\mult10x8.ngc .\tmp\_cg\mult10x8.v 
// Device	: 3sd1800acs484-4
// Input file	: ./tmp/_cg/mult10x8.ngc
// Output file	: ./tmp/_cg/mult10x8.v
// # of Modules	: 1
// Design Name	: mult10x8
// Xilinx        : C:\Xilinx\11.1\ISE
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

module mult10x8 (
  sclr, ce, clk, a, b, p
)/* synthesis syn_black_box syn_noprune=1 */;
  input sclr;
  input ce;
  input clk;
  input [9 : 0] a;
  input [7 : 0] b;
  output [17 : 0] p;
  
  // synthesis translate_off
  
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_2_0_410 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_2_1_409 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_0_0_408 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_0_1_407 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_0_406 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_1_405 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_2_404 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_3_403 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_3_0_402 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_2_2_401 ;
  wire \BU2/U0/gLUT.iLUT/sum<1>[2] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_3_1_398 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_2_3_397 ;
  wire \BU2/U0/gLUT.iLUT/sum<1>[3] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_3_2_393 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_2_4_392 ;
  wire \BU2/U0/gLUT.iLUT/sum<1>[4] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_3_3_388 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_2_5_387 ;
  wire \BU2/U0/gLUT.iLUT/sum<1>[5] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_3_4_383 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_2_6_382 ;
  wire \BU2/U0/gLUT.iLUT/sum<1>[6] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_3_5_378 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_2_7_377 ;
  wire \BU2/U0/gLUT.iLUT/sum<1>[7] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_3_6_373 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_2_8_372 ;
  wire \BU2/U0/gLUT.iLUT/sum<1>[8] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_3_7_368 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_2_9_367 ;
  wire \BU2/U0/gLUT.iLUT/sum<1>[9] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_3_8_363 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_2_10_362 ;
  wire \BU2/U0/gLUT.iLUT/sum<1>[10] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_3_9_358 ;
  wire \BU2/U0/gLUT.iLUT/sum<1>[11] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_3_10_354 ;
  wire \BU2/U0/gLUT.iLUT/sum<1>[12] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_3_11_350 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_2_11_349 ;
  wire \BU2/U0/gLUT.iLUT/sum<1>[14] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_1_0_345 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_0_2_344 ;
  wire \BU2/U0/gLUT.iLUT/sum<0>[2] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_1_1_341 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_0_3_340 ;
  wire \BU2/U0/gLUT.iLUT/sum<0>[3] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_1_2_336 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_0_4_335 ;
  wire \BU2/U0/gLUT.iLUT/sum<0>[4] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_1_3_331 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_0_5_330 ;
  wire \BU2/U0/gLUT.iLUT/sum<0>[5] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_1_4_326 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_0_6_325 ;
  wire \BU2/U0/gLUT.iLUT/sum<0>[6] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_1_5_321 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_0_7_320 ;
  wire \BU2/U0/gLUT.iLUT/sum<0>[7] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_1_6_316 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_0_8_315 ;
  wire \BU2/U0/gLUT.iLUT/sum<0>[8] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_1_7_311 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_0_9_310 ;
  wire \BU2/U0/gLUT.iLUT/sum<0>[9] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_1_8_306 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_0_10_305 ;
  wire \BU2/U0/gLUT.iLUT/sum<0>[10] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_1_9_301 ;
  wire \BU2/U0/gLUT.iLUT/sum<0>[11] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_1_10_297 ;
  wire \BU2/U0/gLUT.iLUT/sum<0>[12] ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_1_11_293 ;
  wire \BU2/U0/gLUT.iLUT/pp_out_reg_0_11_292 ;
  wire \BU2/U0/gLUT.iLUT/sum<0>[14] ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_0_288 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_4_287 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_1_284 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_5_283 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_2_279 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_6_278 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_3_274 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_7_273 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_4_269 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_8_268 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_5_264 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_9_263 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_6_259 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_10_258 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_7_254 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_11_253 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_8_249 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_12_248 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_9_244 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_10_240 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_11_236 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_12_232 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_1_13_228 ;
  wire \BU2/U0/gLUT.iLUT/s1_add_out_0_13_227 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig ;
  wire \BU2/U0/gLUT.iLUT/lut_sig ;
  wire \BU2/U0/gLUT.iLUT/ma_sig0 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig0 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig1 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig1_214 ;
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
  wire \BU2/U0/gLUT.iLUT/lut_sig101_182 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig10 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig10 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig11 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig11 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig12 ;
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
  wire \BU2/U0/gLUT.iLUT/lut_sig211_136 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig21 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig21 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig23 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig22 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig24 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig23 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig25 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig24 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig26 ;
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
  wire \BU2/U0/gLUT.iLUT/lut_sig331_90 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig33 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig32 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig35 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig33 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig36 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig34 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig37 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig35 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig38 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig36 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig39 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig37 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig40 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig38 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig41 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig39 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig42 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig40 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig43 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig41 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig44 ;
  wire \BU2/U0/gLUT.iLUT/ma_sig42 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig451_44 ;
  wire \BU2/U0/gLUT.iLUT/lut_sig45 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire [9 : 0] a_2;
  wire [7 : 0] b_3;
  wire [17 : 0] p_4;
  wire [11 : 0] \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut ;
  wire [10 : 0] \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy ;
  wire [11 : 0] \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut ;
  wire [10 : 0] \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy ;
  wire [17 : 4] \BU2/U0/gLUT.iLUT/sum0<0> ;
  wire [13 : 0] \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut ;
  wire [12 : 0] \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy ;
  wire [11 : 0] \BU2/U0/gLUT.iLUT/pp_out<0> ;
  wire [10 : 0] \BU2/U0/gLUT.iLUT/pp_cout<0> ;
  wire [11 : 0] \BU2/U0/gLUT.iLUT/pp_out<1> ;
  wire [10 : 0] \BU2/U0/gLUT.iLUT/pp_cout<1> ;
  wire [11 : 0] \BU2/U0/gLUT.iLUT/pp_out<2> ;
  wire [10 : 0] \BU2/U0/gLUT.iLUT/pp_cout<2> ;
  wire [11 : 0] \BU2/U0/gLUT.iLUT/pp_out<3> ;
  wire [10 : 0] \BU2/U0/gLUT.iLUT/pp_cout<3> ;
  wire [0 : 0] \BU2/zero_detect ;
  assign
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
    p[17] = p_4[17],
    p[16] = p_4[16],
    p[15] = p_4[15],
    p[14] = p_4[14],
    p[13] = p_4[13],
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
  \BU2/U0/gLUT.iLUT/lut_sig1011  (
    .I0(a_2[9]),
    .I1(b_3[0]),
    .I2(b_3[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig101_182 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig2111  (
    .I0(a_2[9]),
    .I1(b_3[2]),
    .I2(b_3[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig211_136 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig3311  (
    .I0(a_2[9]),
    .I1(b_3[4]),
    .I2(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig331_90 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig4511  (
    .I0(a_2[9]),
    .I1(b_3[6]),
    .I2(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig451_44 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/gLUT.iLUT/lut_sig1  (
    .I0(a_2[0]),
    .I1(b_3[0]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/gLUT.iLUT/lut_sig111  (
    .I0(a_2[0]),
    .I1(b_3[2]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig11 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/gLUT.iLUT/lut_sig231  (
    .I0(a_2[0]),
    .I1(b_3[4]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig23 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/gLUT.iLUT/lut_sig351  (
    .I0(a_2[0]),
    .I1(b_3[6]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig35 )
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
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig12_Result1  (
    .I0(b_3[2]),
    .I1(b_3[3]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig12 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig24_Result1  (
    .I0(b_3[4]),
    .I1(b_3[5]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig24 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig36_Result1  (
    .I0(b_3[6]),
    .I1(b_3[7]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig36 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig13_Result1  (
    .I0(b_3[2]),
    .I1(b_3[3]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig13 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig1_Result1  (
    .I0(b_3[0]),
    .I1(b_3[1]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig1_214 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig25_Result1  (
    .I0(b_3[4]),
    .I1(b_3[5]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig25 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig37_Result1  (
    .I0(b_3[6]),
    .I1(b_3[7]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig37 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig14_Result1  (
    .I0(b_3[2]),
    .I1(b_3[3]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig14 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig26_Result1  (
    .I0(b_3[4]),
    .I1(b_3[5]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig26 )
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
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig38_Result1  (
    .I0(b_3[6]),
    .I1(b_3[7]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig38 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig15_Result1  (
    .I0(b_3[2]),
    .I1(b_3[3]),
    .I2(a_2[3]),
    .I3(a_2[4]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig15 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig27_Result1  (
    .I0(b_3[4]),
    .I1(b_3[5]),
    .I2(a_2[3]),
    .I3(a_2[4]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig27 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig39_Result1  (
    .I0(b_3[6]),
    .I1(b_3[7]),
    .I2(a_2[3]),
    .I3(a_2[4]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig39 )
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
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig16_Result1  (
    .I0(b_3[2]),
    .I1(b_3[3]),
    .I2(a_2[4]),
    .I3(a_2[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig16 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig28_Result1  (
    .I0(b_3[4]),
    .I1(b_3[5]),
    .I2(a_2[4]),
    .I3(a_2[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig28 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig40_Result1  (
    .I0(a_2[4]),
    .I1(b_3[6]),
    .I2(a_2[5]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig40 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig4_Result1  (
    .I0(a_2[4]),
    .I1(b_3[0]),
    .I2(a_2[5]),
    .I3(b_3[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig4 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig17_Result1  (
    .I0(a_2[5]),
    .I1(b_3[2]),
    .I2(a_2[6]),
    .I3(b_3[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig17 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig29_Result1  (
    .I0(a_2[5]),
    .I1(b_3[4]),
    .I2(a_2[6]),
    .I3(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig29 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig41_Result1  (
    .I0(a_2[5]),
    .I1(b_3[6]),
    .I2(a_2[6]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig41 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig5_Result1  (
    .I0(a_2[5]),
    .I1(b_3[0]),
    .I2(a_2[6]),
    .I3(b_3[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig5 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig18_Result1  (
    .I0(a_2[6]),
    .I1(b_3[2]),
    .I2(a_2[7]),
    .I3(b_3[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig18 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig30_Result1  (
    .I0(a_2[6]),
    .I1(b_3[4]),
    .I2(a_2[7]),
    .I3(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig30 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig42_Result1  (
    .I0(a_2[6]),
    .I1(b_3[6]),
    .I2(a_2[7]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig42 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig6_Result1  (
    .I0(a_2[6]),
    .I1(b_3[0]),
    .I2(a_2[7]),
    .I3(b_3[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig6 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig19_Result1  (
    .I0(a_2[7]),
    .I1(b_3[2]),
    .I2(a_2[8]),
    .I3(b_3[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig19 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig31_Result1  (
    .I0(a_2[7]),
    .I1(b_3[4]),
    .I2(a_2[8]),
    .I3(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig31 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig43_Result1  (
    .I0(a_2[7]),
    .I1(b_3[6]),
    .I2(a_2[8]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig43 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig7_Result1  (
    .I0(a_2[7]),
    .I1(b_3[0]),
    .I2(a_2[8]),
    .I3(b_3[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig7 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig20_Result1  (
    .I0(a_2[8]),
    .I1(b_3[2]),
    .I2(a_2[9]),
    .I3(b_3[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig20 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig32_Result1  (
    .I0(a_2[8]),
    .I1(b_3[4]),
    .I2(a_2[9]),
    .I3(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig32 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig44_Result1  (
    .I0(a_2[8]),
    .I1(b_3[6]),
    .I2(a_2[9]),
    .I3(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig44 )
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  \BU2/U0/gLUT.iLUT/Mxor_lut_sig8_Result1  (
    .I0(a_2[8]),
    .I1(b_3[0]),
    .I2(a_2[9]),
    .I3(b_3[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig8 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig101  (
    .I0(a_2[9]),
    .I1(b_3[0]),
    .I2(b_3[1]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig10 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig211  (
    .I0(a_2[9]),
    .I1(b_3[2]),
    .I2(b_3[3]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig21 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig331  (
    .I0(a_2[9]),
    .I1(b_3[4]),
    .I2(b_3[5]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig33 )
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  \BU2/U0/gLUT.iLUT/lut_sig451  (
    .I0(a_2[9]),
    .I1(b_3[6]),
    .I2(b_3[7]),
    .O(\BU2/U0/gLUT.iLUT/lut_sig45 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_3_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<3> [0]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_3_0_402 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_3_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<3> [1]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_3_1_398 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_3_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<3> [2]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_3_2_393 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_3_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<3> [3]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_3_3_388 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_3_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<3> [4]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_3_4_383 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_3_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<3> [5]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_3_5_378 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_3_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<3> [6]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_3_6_373 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_3_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<3> [7]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_3_7_368 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_3_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<3> [8]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_3_8_363 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_3_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<3> [9]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_3_9_358 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_3_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<3> [10]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_3_10_354 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_3_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<3> [11]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_3_11_350 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_2_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<2> [0]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_2_0_410 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_2_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<2> [1]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_2_1_409 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_2_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<2> [2]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_2_2_401 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_2_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<2> [3]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_2_3_397 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_2_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<2> [4]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_2_4_392 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_2_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<2> [5]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_2_5_387 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_2_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<2> [6]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_2_6_382 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_2_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<2> [7]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_2_7_377 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_2_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<2> [8]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_2_8_372 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_2_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<2> [9]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_2_9_367 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_2_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<2> [10]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_2_10_362 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_2_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<2> [11]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_2_11_349 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_0_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<0> [0]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_0_0_408 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_0_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<0> [1]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_0_1_407 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_0_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<0> [2]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_0_2_344 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_0_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<0> [3]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_0_3_340 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_0_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<0> [4]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_0_4_335 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_0_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<0> [5]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_0_5_330 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_0_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<0> [6]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_0_6_325 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_0_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<0> [7]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_0_7_320 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_0_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<0> [8]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_0_8_315 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_0_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<0> [9]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_0_9_310 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_0_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<0> [10]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_0_10_305 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_0_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<0> [11]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_0_11_292 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_1_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<1> [0]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_1_0_345 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_1_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<1> [1]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_1_1_341 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_1_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<1> [2]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_1_2_336 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_1_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<1> [3]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_1_3_331 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_1_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<1> [4]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_1_4_326 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_1_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<1> [5]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_1_5_321 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_1_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<1> [6]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_1_6_316 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_1_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<1> [7]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_1_7_311 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_1_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<1> [8]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_1_8_306 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_1_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<1> [9]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_1_9_301 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_1_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<1> [10]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_1_10_297 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/pp_out_reg_1_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out<1> [11]),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/pp_out_reg_1_11_293 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out_reg_2_0_410 ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_0_288 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out_reg_2_1_409 ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_1_284 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<1>[2] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_2_279 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<1>[3] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_3_274 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<1>[4] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_4_269 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<1>[5] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_5_264 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<1>[6] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_6_259 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<1>[7] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_7_254 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<1>[8] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_8_249 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<1>[9] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_9_244 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<1>[10] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_10_240 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<1>[11] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_11_236 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<1>[12] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_12_232 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_1_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<1>[14] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_1_13_228 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out_reg_0_0_408 ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_0_406 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/pp_out_reg_0_1_407 ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_1_405 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<0>[2] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_2_404 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<0>[3] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_3_403 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<0>[4] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_4_287 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<0>[5] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_5_283 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<0>[6] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_6_278 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<0>[7] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_7_273 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<0>[8] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_8_268 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<0>[9] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_9_263 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<0>[10] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_10_258 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<0>[11] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_11_253 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<0>[12] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_12_248 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s1_add_out_0_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum<0>[14] ),
    .R(sclr),
    .Q(\BU2/U0/gLUT.iLUT/s1_add_out_0_13_227 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/s1_add_out_0_0_406 ),
    .R(sclr),
    .Q(p_4[0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/s1_add_out_0_1_405 ),
    .R(sclr),
    .Q(p_4[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/s1_add_out_0_2_404 ),
    .R(sclr),
    .Q(p_4[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/s1_add_out_0_3_403 ),
    .R(sclr),
    .Q(p_4[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [4]),
    .R(sclr),
    .Q(p_4[4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [5]),
    .R(sclr),
    .Q(p_4[5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [6]),
    .R(sclr),
    .Q(p_4[6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [7]),
    .R(sclr),
    .Q(p_4[7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [8]),
    .R(sclr),
    .Q(p_4[8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [9]),
    .R(sclr),
    .Q(p_4[9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [10]),
    .R(sclr),
    .Q(p_4[10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [11]),
    .R(sclr),
    .Q(p_4[11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [12]),
    .R(sclr),
    .Q(p_4[12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [13]),
    .R(sclr),
    .Q(p_4[13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [14]),
    .R(sclr),
    .Q(p_4[14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [15]),
    .R(sclr),
    .Q(p_4[15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_16  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [16]),
    .R(sclr),
    .Q(p_4[16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gLUT.iLUT/s2_add_out_0_17  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gLUT.iLUT/sum0<0> [17]),
    .R(sclr),
    .Q(p_4[17])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<0>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_2_2_401 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_3_0_402 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [0])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<0>  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_2_2_401 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [0]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<0>  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [0]),
    .O(\BU2/U0/gLUT.iLUT/sum<1>[2] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<1>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_2_3_397 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_3_1_398 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [1])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<1>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [0]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_2_3_397 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [1]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<1>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [0]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [1]),
    .O(\BU2/U0/gLUT.iLUT/sum<1>[3] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<2>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_2_4_392 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_3_2_393 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [2])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<2>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [1]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_2_4_392 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [2]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<2>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [1]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [2]),
    .O(\BU2/U0/gLUT.iLUT/sum<1>[4] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<3>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_2_5_387 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_3_3_388 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [3])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<3>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [2]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_2_5_387 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [3]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<3>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [2]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [3]),
    .O(\BU2/U0/gLUT.iLUT/sum<1>[5] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<4>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_2_6_382 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_3_4_383 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [4])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<4>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [3]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_2_6_382 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [4]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<4>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [3]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [4]),
    .O(\BU2/U0/gLUT.iLUT/sum<1>[6] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<5>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_2_7_377 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_3_5_378 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [5])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<5>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [4]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_2_7_377 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [5]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<5>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [4]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [5]),
    .O(\BU2/U0/gLUT.iLUT/sum<1>[7] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<6>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_2_8_372 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_3_6_373 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [6])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<6>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [5]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_2_8_372 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [6]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<6>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [5]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [6]),
    .O(\BU2/U0/gLUT.iLUT/sum<1>[8] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<7>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_2_9_367 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_3_7_368 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [7])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<7>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [6]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_2_9_367 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [7]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<7>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [6]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [7]),
    .O(\BU2/U0/gLUT.iLUT/sum<1>[9] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<8>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_2_10_362 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_3_8_363 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [8])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<8>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [7]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_2_10_362 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [8]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<8>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [7]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [8]),
    .O(\BU2/U0/gLUT.iLUT/sum<1>[10] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<9>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_3_9_358 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_2_11_349 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [9])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<9>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [8]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_2_11_349 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [9]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<9>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [8]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [9]),
    .O(\BU2/U0/gLUT.iLUT/sum<1>[11] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<10>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_3_10_354 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_2_11_349 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [10])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy<10>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [9]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_2_11_349 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [10]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<10>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [9]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [10]),
    .O(\BU2/U0/gLUT.iLUT/sum<1>[12] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut<11>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_2_11_349 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_3_11_350 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [11])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_xor<11>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_cy [10]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_1_add0000_lut [11]),
    .O(\BU2/U0/gLUT.iLUT/sum<1>[14] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<0>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_0_2_344 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_1_0_345 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [0])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<0>  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_0_2_344 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [0]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<0>  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [0]),
    .O(\BU2/U0/gLUT.iLUT/sum<0>[2] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<1>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_0_3_340 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_1_1_341 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [1])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<1>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [0]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_0_3_340 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [1]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<1>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [0]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [1]),
    .O(\BU2/U0/gLUT.iLUT/sum<0>[3] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<2>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_0_4_335 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_1_2_336 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [2])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<2>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [1]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_0_4_335 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [2]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<2>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [1]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [2]),
    .O(\BU2/U0/gLUT.iLUT/sum<0>[4] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<3>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_0_5_330 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_1_3_331 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [3])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<3>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [2]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_0_5_330 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [3]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<3>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [2]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [3]),
    .O(\BU2/U0/gLUT.iLUT/sum<0>[5] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<4>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_0_6_325 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_1_4_326 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [4])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<4>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [3]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_0_6_325 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [4]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<4>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [3]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [4]),
    .O(\BU2/U0/gLUT.iLUT/sum<0>[6] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<5>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_0_7_320 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_1_5_321 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [5])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<5>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [4]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_0_7_320 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [5]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<5>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [4]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [5]),
    .O(\BU2/U0/gLUT.iLUT/sum<0>[7] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<6>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_0_8_315 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_1_6_316 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [6])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<6>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [5]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_0_8_315 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [6]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<6>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [5]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [6]),
    .O(\BU2/U0/gLUT.iLUT/sum<0>[8] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<7>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_0_9_310 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_1_7_311 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [7])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<7>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [6]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_0_9_310 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [7]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<7>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [6]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [7]),
    .O(\BU2/U0/gLUT.iLUT/sum<0>[9] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<8>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_0_10_305 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_1_8_306 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [8])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<8>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [7]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_0_10_305 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [8]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<8>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [7]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [8]),
    .O(\BU2/U0/gLUT.iLUT/sum<0>[10] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<9>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_1_9_301 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_0_11_292 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [9])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<9>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [8]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_0_11_292 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [9]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<9>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [8]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [9]),
    .O(\BU2/U0/gLUT.iLUT/sum<0>[11] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<10>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_1_10_297 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_0_11_292 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [10])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy<10>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [9]),
    .DI(\BU2/U0/gLUT.iLUT/pp_out_reg_0_11_292 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [10]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<10>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [9]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [10]),
    .O(\BU2/U0/gLUT.iLUT/sum<0>[12] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut<11>  (
    .I0(\BU2/U0/gLUT.iLUT/pp_out_reg_0_11_292 ),
    .I1(\BU2/U0/gLUT.iLUT/pp_out_reg_1_11_293 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [11])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_xor<11>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_cy [10]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum_0_add0000_lut [11]),
    .O(\BU2/U0/gLUT.iLUT/sum<0>[14] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<0>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_0_4_287 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_1_0_288 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [0])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<0>  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_4_287 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [0]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<0>  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [0]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<1>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_0_5_283 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_1_1_284 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [1])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<1>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [0]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_5_283 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [1]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<1>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [0]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [1]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<2>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_0_6_278 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_1_2_279 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [2])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<2>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [1]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_6_278 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [2]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<2>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [1]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [2]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<3>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_0_7_273 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_1_3_274 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [3])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<3>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [2]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_7_273 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [3]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<3>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [2]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [3]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<4>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_0_8_268 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_1_4_269 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [4])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<4>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [3]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_8_268 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [4]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<4>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [3]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [4]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<5>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_0_9_263 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_1_5_264 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [5])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<5>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [4]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_9_263 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [5]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<5>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [4]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [5]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<6>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_0_10_258 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_1_6_259 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [6])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<6>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [5]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_10_258 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [6]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<6>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [5]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [6]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<7>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_0_11_253 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_1_7_254 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [7])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<7>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [6]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_11_253 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [7]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<7>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [6]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [7]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<8>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_0_12_248 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_1_8_249 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [8])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<8>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [7]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_12_248 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [8]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<8>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [7]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [8]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<9>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_1_9_244 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_0_13_227 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [9])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<9>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [8]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_13_227 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [9]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<9>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [8]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [9]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<10>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_1_10_240 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_0_13_227 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [10])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<10>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [9]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_13_227 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [10]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<10>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [9]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [10]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<11>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_1_11_236 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_0_13_227 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [11])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<11>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [10]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_13_227 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [11]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [11])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<11>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [10]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [11]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<12>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_1_12_232 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_0_13_227 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [12])
  );
  MUXCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy<12>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [11]),
    .DI(\BU2/U0/gLUT.iLUT/s1_add_out_0_13_227 ),
    .S(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [12]),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [12])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<12>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [11]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [12]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut<13>  (
    .I0(\BU2/U0/gLUT.iLUT/s1_add_out_0_13_227 ),
    .I1(\BU2/U0/gLUT.iLUT/s1_add_out_1_13_228 ),
    .O(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [13])
  );
  XORCY   \BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_xor<13>  (
    .CI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_cy [12]),
    .LI(\BU2/U0/gLUT.iLUT/Madd_sum0_0_add0000_lut [13]),
    .O(\BU2/U0/gLUT.iLUT/sum0<0> [17])
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
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [0])
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
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [1])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[1]),
    .I1(a_2[1]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig1 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [1]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig1 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig1_214 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [1]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig1_214 ),
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
    .S(\BU2/U0/gLUT.iLUT/lut_sig101_182 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<0> [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[10].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [9]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig101_182 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[0].carrychain[11].ppadd.b_is_even.stageMSB.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<0> [10]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig10 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<0> [11])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.ma0  (
    .I0(b_3[2]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig10 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.muxcy00  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig10 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig11 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.xorcy0  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig11 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [0])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig11 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig11 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig12 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig12 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [1])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[1]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig12 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [1]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig12 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig13 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [1]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig13 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [2])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[2]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig13 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [2]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig13 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig14 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [2]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig14 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [3])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[3]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig14 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [3]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig14 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig15 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [3]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig15 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [4])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[4]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig15 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [4]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig15 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig16 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [4]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig16 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [5])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[5]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig16 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [5]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig16 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig17 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [5]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig17 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [6])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[6]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig17 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [6]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig17 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig18 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [6]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig18 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [7])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[7]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig18 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [7]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig18 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig19 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [7]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig19 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [8])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[9].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[8]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig19 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[9].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [8]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig19 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig20 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[9].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [8]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig20 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [9])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[10].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[3]),
    .I1(a_2[9]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig20 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[10].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [9]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig20 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig211_136 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<1> [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[10].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [9]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig211_136 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[1].carrychain[11].ppadd.b_is_even.stageMSB.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<1> [10]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig21 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<1> [11])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.ma0  (
    .I0(b_3[4]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig21 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.muxcy00  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig21 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig23 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.xorcy0  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig23 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [0])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig22 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig22 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig24 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig24 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [1])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[1]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig23 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [1]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig23 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig25 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [1]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig25 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [2])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[2]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig24 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [2]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig24 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig26 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [2]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig26 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [3])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[3]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig25 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [3]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig25 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig27 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [3]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig27 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [4])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[4]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig26 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [4]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig26 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig28 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [4]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig28 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [5])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[5]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig27 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [5]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig27 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig29 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [5]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig29 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [6])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[6]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig28 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [6]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig28 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig30 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [6]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig30 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [7])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[7]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig29 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [7]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig29 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig31 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [7]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig31 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [8])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[9].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[8]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig30 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[9].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [8]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig30 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig32 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[9].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [8]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig32 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [9])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[10].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[5]),
    .I1(a_2[9]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig31 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[10].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [9]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig31 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig331_90 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<2> [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[10].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [9]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig331_90 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[2].carrychain[11].ppadd.b_is_even.stageMSB.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<2> [10]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig33 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<2> [11])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.ma0  (
    .I0(b_3[6]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig32 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.muxcy00  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig32 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig35 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [0])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.xorcy0  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig35 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [0])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[0]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig33 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [0]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig33 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig36 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [1])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [0]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig36 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [1])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[1]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig34 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [1]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig34 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig37 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [2])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [1]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig37 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [2])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[2]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig35 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [2]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig35 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig38 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [3])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [2]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig38 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [3])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[3]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig36 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [3]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig36 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig39 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [4])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [3]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig39 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [4])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[4]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig37 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [4]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig37 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig40 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [5])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [4]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig40 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [5])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[5]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig38 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [5]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig38 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig41 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [6])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [5]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig41 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [6])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[6]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig39 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [6]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig39 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig42 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [7])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [6]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig42 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [7])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[7]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig40 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [7]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig40 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig43 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [8])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [7]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig43 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [8])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[9].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[8]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig41 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[9].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [8]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig41 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig44 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [9])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[9].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [8]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig44 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [9])
  );
  MULT_AND   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[10].ppadd.b_is_even.stageN.ma0  (
    .I0(b_3[7]),
    .I1(a_2[9]),
    .LO(\BU2/U0/gLUT.iLUT/ma_sig42 )
  );
  MUXCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[10].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [9]),
    .DI(\BU2/U0/gLUT.iLUT/ma_sig42 ),
    .S(\BU2/U0/gLUT.iLUT/lut_sig451_44 ),
    .O(\BU2/U0/gLUT.iLUT/pp_cout<3> [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[10].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [9]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig451_44 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [10])
  );
  XORCY   \BU2/U0/gLUT.iLUT/NxM_mult.ppgen[3].carrychain[11].ppadd.b_is_even.stageMSB.xorcy0  (
    .CI(\BU2/U0/gLUT.iLUT/pp_cout<3> [10]),
    .LI(\BU2/U0/gLUT.iLUT/lut_sig45 ),
    .O(\BU2/U0/gLUT.iLUT/pp_out<3> [11])
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/zero_detect [0])
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

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

// synthesis translate_on
