////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: oneThird.v
// /___/   /\     Timestamp: Tue Oct 27 13:38:56 2009
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\modem\telemetry\coregen\tmp\_cg\oneThird.ngc C:\modem\telemetry\coregen\tmp\_cg\oneThird.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/oneThird.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/oneThird.v
// # of Modules	: 1
// Design Name	: oneThird
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

module oneThird (
  sclr, ce, clk, a, p
);
  input sclr;
  input ce;
  input clk;
  input [11 : 0] a;
  output [21 : 0] p;
  
  // synthesis translate_off
  
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00003 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carryxortop_rt_207 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[11].carrymux_rt_175 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[12].carrymux_rt_172 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[13].carrymux_rt_168 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000011 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000012 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000013 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000101_134 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000011 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000012 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000013 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00001 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00002 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00003 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000011 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000012 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[0] ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[13] ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00003 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00002 ;
  wire \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00001 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carryxortop_O_UNCONNECTED ;
  wire [13 : 0] \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple ;
  wire [10 : 0] \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum ;
  wire [13 : 0] \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple ;
  wire [9 : 0] \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum ;
  wire [18 : 4] \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> ;
  wire [13 : 0] \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple ;
  wire [14 : 1] \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output ;
  wire [7 : 0] \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i ;
  wire [0 : 0] \BU2/zero_detect ;
  assign
    \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[13]  = a[11],
    \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[0]  = a[8],
    p[21] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [14]
,
    p[20] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [13]
,
    p[19] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [12]
,
    p[18] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [11]
,
    p[17] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [10]
,
    p[16] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [9]
,
    p[15] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [8]
,
    p[14] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [7]
,
    p[13] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [6]
,
    p[12] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [5]
,
    p[11] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [4]
,
    p[10] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [3]
,
    p[9] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [2]
,
    p[8] = 
\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [1]
,
    p[7] = \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [7],
    p[6] = \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [6],
    p[5] = \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [5],
    p[4] = \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [4],
    p[3] = \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [3],
    p[2] = \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [2],
    p[1] = \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [1],
    p[0] = \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  LUT4 #(
    .INIT ( 16'h96D2 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<8>1  (
    .I0(a[3]),
    .I1(a[2]),
    .I2(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .I3(a[1]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [8])

  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<9>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 ),
    .I1(a[2]),
    .I2(a[3]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [9])

  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<1>1  (
    .I0(a[4]),
    .I1(a[5]),
    .I2(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [1])

  );
  LUT4 #(
    .INIT ( 16'h639C ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<2>1  (
    .I0(a[4]),
    .I1(a[6]),
    .I2(a[5]),
    .I3(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [2])

  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carryxortop_rt  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[13] ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carryxortop_rt_207 )

  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[11].carrymux_rt  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000011 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[11].carrymux_rt_175 )

  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[12].carrymux_rt  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000012 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[12].carrymux_rt_172 )

  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[13].carrymux_rt  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[13] ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[13].carrymux_rt_168 )

  );
  LUT4 #(
    .INIT ( 16'h4294 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00001011  (
    .I0(a[6]),
    .I1(a[5]),
    .I2(a[7]),
    .I3(a[4]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000101_134 )
  );
  LUT4 #(
    .INIT ( 16'h4294 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000101  (
    .I0(a[2]),
    .I1(a[1]),
    .I2(a[3]),
    .I3(a[0]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<0>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .I1(a[4]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [0])

  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<0>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[0] ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [8]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<10>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [18]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<1>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00001 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [9]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<2>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00002 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [10]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<3>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00003 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [11]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<4>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [12]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<5>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00003 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [13]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<6>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [14]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<7>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00003 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [15]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<8>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [16]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<9>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00003 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [17]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [9])
  );
  LUT4 #(
    .INIT ( 16'h4294 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000051  (
    .I0(a[1]),
    .I1(a[0]),
    .I2(a[2]),
    .I3(a[3]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 )
  );
  LUT4 #(
    .INIT ( 16'h699A ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000031  (
    .I0(a[7]),
    .I1(a[5]),
    .I2(a[4]),
    .I3(a[6]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00003 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<3>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00003 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [3])

  );
  LUT4 #(
    .INIT ( 16'h4294 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000101  (
    .I0(a[6]),
    .I1(a[5]),
    .I2(a[7]),
    .I3(a[4]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<4>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [4])

  );
  LUT4 #(
    .INIT ( 16'h4294 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000051  (
    .I0(a[5]),
    .I1(a[6]),
    .I2(a[4]),
    .I3(a[7]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<5>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [5])

  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<6>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [6])

  );
  LUT4 #(
    .INIT ( 16'hD44A ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00001111  (
    .I0(a[2]),
    .I1(a[0]),
    .I2(a[1]),
    .I3(a[3]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000011 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<7>1  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 ),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000011 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [7])

  );
  LUT3 #(
    .INIT ( 8'h64 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000121  (
    .I0(a[2]),
    .I1(a[3]),
    .I2(a[1]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000012 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000131  (
    .I0(a[2]),
    .I1(a[3]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000013 )
  );
  LUT4 #(
    .INIT ( 16'hD44A ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00001111  (
    .I0(a[6]),
    .I1(a[4]),
    .I2(a[5]),
    .I3(a[7]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000011 )
  );
  LUT3 #(
    .INIT ( 8'h64 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000121  (
    .I0(a[6]),
    .I1(a[7]),
    .I2(a[5]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000012 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000131  (
    .I0(a[6]),
    .I1(a[7]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000013 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000111  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[0] ),
    .I1(a[9]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00001 )
  );
  LUT3 #(
    .INIT ( 8'h9C ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000021  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[0] ),
    .I1(a[10]),
    .I2(a[9]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00002 )
  );
  LUT4 #(
    .INIT ( 16'h699A ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000031  (
    .I0(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[13] ),
    .I1(a[9]),
    .I2(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[0] ),
    .I3(a[10]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00003 )
  );
  LUT4 #(
    .INIT ( 16'hD44A ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000101  (
    .I0(a[9]),
    .I1(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[13] ),
    .I2(a[10]),
    .I3(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[0] ),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 )
  );
  LUT4 #(
    .INIT ( 16'h96D2 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00001111  (
    .I0(a[10]),
    .I1(a[9]),
    .I2(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[13] ),
    .I3(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[0] ),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000011 )
  );
  LUT4 #(
    .INIT ( 16'hE8C8 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000121  (
    .I0(a[9]),
    .I1(a[10]),
    .I2(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[13] ),
    .I3(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b_delay_out[0] ),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[2].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000012 )
  );
  LUT4 #(
    .INIT ( 16'h699A ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000031  (
    .I0(a[3]),
    .I1(a[1]),
    .I2(a[2]),
    .I3(a[0]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00003 )
  );
  LUT3 #(
    .INIT ( 8'h9C ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000021  (
    .I0(a[0]),
    .I1(a[2]),
    .I2(a[1]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00002 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000112  (
    .I0(a[0]),
    .I1(a[1]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00001 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [0]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [1])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [1]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [2])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [2]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [3])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [3]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [4])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [4]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [5])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [5]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [6])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [6]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [7])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [7]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [8])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [8]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [9])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_10  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [9]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [10])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_11  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [10]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [11])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_12  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [11]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [12])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_13  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [12]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [13])

  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_14  (
    .C(clk),
    .CE(ce),
    .D
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [13]),
    .R(sclr),
    .Q
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output [14])

  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_need_mux.carrymux0  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [8]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [0]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [0])
  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.carryxor0  (
    .CI(\BU2/zero_detect [0]),
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [0]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [0])
  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carryxortop  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [13])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carryxortop_rt_207 )
,
    .O
(\NLW_BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carryxortop_O_UNCONNECTED )

  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[1].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [0])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [9]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [1]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [1])
  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[1].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [0])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [1]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [1])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[2].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [1])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [10]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [2]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [2])
  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[2].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [1])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [2]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [2])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[3].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [2])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [11]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [3]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [3])
  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[3].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [2])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [3]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [3])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[4].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [3])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [12]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [4]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [4])
  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[4].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [3])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [4]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [4])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[5].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [4])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [13]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [5]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [5])
  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[5].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [4])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [5]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [5])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[6].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [5])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [14]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [6]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [6])
  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[6].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [5])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [6]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [6])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[7].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [6])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [15]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [7]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [7])
  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[7].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [6])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [7]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [7])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[8].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [7])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [16]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [8]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [8])
  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[8].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [7])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [8]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [8])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[9].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [8])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [17]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [9]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [9])
  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[9].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [8])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [9]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [9])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[10].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [9])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [18]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [10]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [10])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[10].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [9])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [10]),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [10])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[11].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [10])
,
    .DI(\BU2/zero_detect [0]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[11].carrymux_rt_175 )
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [11])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[11].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [10])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[11].carrymux_rt_175 )
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [11])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[12].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [11])
,
    .DI(\BU2/zero_detect [0]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[12].carrymux_rt_172 )
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [12])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[12].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [11])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[12].carrymux_rt_172 )
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [12])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[13].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [12])
,
    .DI(\BU2/zero_detect [0]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[13].carrymux_rt_168 )
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [13])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[13].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [12])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[13].carrymux_rt_168 )
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [13])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_need_mux.carrymux0  (
    .CI(\BU2/zero_detect [0]),
    .DI(a[4]),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [0])
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [0])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.carryxor0  (
    .CI(\BU2/zero_detect [0]),
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [0])
,
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [4])
  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carryxortop  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [13])
,
    .LI(\BU2/zero_detect [0]),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [18])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[1].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [0])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 ),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [1])
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [1])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[1].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [0])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [1])
,
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [5])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[2].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [1])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [2])
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [2])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[2].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [1])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [2])
,
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [6])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[3].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [2])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 ),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [3])
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [3])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[3].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [2])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [3])
,
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [7])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[4].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [3])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [4])
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [4])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[4].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [3])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [4])
,
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [8])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[5].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [4])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00005 ),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [5])
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [5])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[5].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [4])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [5])
,
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [9])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[6].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [5])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000010 ),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [6])
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [6])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[6].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [5])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [6])
,
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [10])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[7].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [6])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000011 ),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [7])
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [7])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[7].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [6])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [7])
,
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [11])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[8].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [7])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000012 ),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [8])
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [8])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[8].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [7])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [8])
,
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [12])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[9].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [8])
,
    .DI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000013 ),
    .S
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [9])
,
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [9])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[9].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [8])
,
    .LI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [9])
,
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [13])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[10].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [9])
,
    .DI(\BU2/zero_detect [0]),
    .S(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000101_134 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [10])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[10].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [9])
,
    .LI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom0000101_134 ),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [14])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[11].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [10])
,
    .DI(\BU2/zero_detect [0]),
    .S(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000011 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [11])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[11].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [10])
,
    .LI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000011 ),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [15])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[12].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [11])
,
    .DI(\BU2/zero_detect [0]),
    .S(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000012 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [12])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[12].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [11])
,
    .LI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000012 ),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [16])
  );
  MUXCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[13].carrymux  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [12])
,
    .DI(\BU2/zero_detect [0]),
    .S(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000013 ),
    .O
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [13])

  );
  XORCY 
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[13].carryxor  (
    .CI
(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_adders.a1g[1].a2g.sa1/a1g[1].add1/add1/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [12])
,
    .LI(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[1].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom000013 ),
    .O(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [17])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [7]),
    .R(sclr),
    .Q(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [6]),
    .R(sclr),
    .Q(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [5]),
    .R(sclr),
    .Q(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/add_out_o<0> [4]),
    .R(sclr),
    .Q(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00003 ),
    .R(sclr),
    .Q(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00002 ),
    .R(sclr),
    .Q(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.bg[0].use_dist_ram.dg1.dmem/sp_mem.dist_mem.m0/Mrom_o_i_rom00001 ),
    .R(sclr),
    .Q(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i_0  (
    .C(clk),
    .CE(ce),
    .D(a[0]),
    .R(sclr),
    .Q(\BU2/U0/gCCM.iCCM/use_ccm_core.ccm_core/c1/b0g2.b1g4.exg1.exg[0].sa2/rwg1.rwg2[1].r3g.ffs/q_i [0])
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
