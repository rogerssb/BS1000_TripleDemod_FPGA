////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.87xd
//  \   \         Application: netgen
//  /   /         Filename: bepLut0to7.v
// /___/   /\     Timestamp: Tue Dec 15 12:50:16 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/modem/telemetry/coregen/tmp/_cg/bepLut0to7.ngc C:/modem/telemetry/coregen/tmp/_cg/bepLut0to7.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/bepLut0to7.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/bepLut0to7.v
// # of Modules	: 1
// Design Name	: bepLut0to7
// Xilinx        : C:\Xilinx\13.4\ISE_DS\ISE\
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

module bepLut0to7 (
  clk, qdpo_clk, qdpo_ce, we, qspo, qdpo, a, d, dpra
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input qdpo_clk;
  input qdpo_ce;
  input we;
  output [7 : 0] qspo;
  output [7 : 0] qdpo;
  input [4 : 0] a;
  input [7 : 0] d;
  input [4 : 0] dpra;
  
  // synthesis translate_off
  
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N10 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N111 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N12 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N13 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N14 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N15 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N16 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N17 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N18 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N19 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N2 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N20 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N21 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N22 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N23 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N24 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N25 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N26 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N27 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N28 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N29 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N3 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N30 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N31 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N32 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N33 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N4 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N5 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N6 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N7 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N8 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N9 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl_48 ;
  wire \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl1_49 ;
  wire [7 : 0] \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int ;
  wire [7 : 0] \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int ;
  wire [7 : 0] \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int ;
  wire [7 : 0] \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int ;
  assign
    qspo[7] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [7],
    qspo[6] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [6],
    qspo[5] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [5],
    qspo[4] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [4],
    qspo[3] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [3],
    qspo[2] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [2],
    qspo[1] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [1],
    qspo[0] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [0],
    qdpo[7] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [7],
    qdpo[6] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [6],
    qdpo[5] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [5],
    qdpo[4] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [4],
    qdpo[3] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [3],
    qdpo[2] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [2],
    qdpo[1] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [1],
    qdpo[0] = \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [0];
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX11  (
    .I0(a[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N2 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N4 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX1111  (
    .I0(a[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N6 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N8 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX211  (
    .I0(a[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N10 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N12 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [2])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX311  (
    .I0(a[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N14 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N16 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX411  (
    .I0(a[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N18 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N20 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX511  (
    .I0(a[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N22 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N24 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX611  (
    .I0(a[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N26 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N28 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX711  (
    .I0(a[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N30 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N32 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX1011  (
    .I0(dpra[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N111 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N13 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [2])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX11111  (
    .I0(dpra[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N15 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N17 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX1211  (
    .I0(dpra[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N19 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N21 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX1311  (
    .I0(dpra[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N23 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N25 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX1411  (
    .I0(dpra[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N27 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N29 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX1511  (
    .I0(dpra[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N31 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N33 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX811  (
    .I0(dpra[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N3 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N5 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_inst_LPM_MUX911  (
    .I0(dpra[4]),
    .I1(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N7 ),
    .I2(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N9 ),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [1])
  );
  RAM16X1D #(
    .INIT ( 16'h0018 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram16  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[7]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl1_49 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N32 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N33 )
  );
  RAM16X1D #(
    .INIT ( 16'hD741 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram15  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[7]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl_48 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N30 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N31 )
  );
  RAM16X1D #(
    .INIT ( 16'h0096 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram14  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[6]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl1_49 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N28 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N29 )
  );
  RAM16X1D #(
    .INIT ( 16'h2107 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram13  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[6]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl_48 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N26 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N27 )
  );
  RAM16X1D #(
    .INIT ( 16'h01AF ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram12  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[5]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl1_49 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N24 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N25 )
  );
  RAM16X1D #(
    .INIT ( 16'hE2E9 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram11  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[5]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl_48 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N22 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N23 )
  );
  RAM16X1D #(
    .INIT ( 16'h03B2 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram10  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[4]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl1_49 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N20 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N21 )
  );
  RAM16X1D #(
    .INIT ( 16'hA5AB ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram9  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[4]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl_48 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N18 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N19 )
  );
  RAM16X1D #(
    .INIT ( 16'h061F ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram8  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[3]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl1_49 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N16 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N17 )
  );
  RAM16X1D #(
    .INIT ( 16'hD5C9 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram7  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[3]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl_48 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N14 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N15 )
  );
  RAM16X1D #(
    .INIT ( 16'h09A6 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram6  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[2]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl1_49 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N12 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N13 )
  );
  RAM16X1D #(
    .INIT ( 16'h2671 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram5  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[2]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl_48 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N10 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N111 )
  );
  RAM16X1D #(
    .INIT ( 16'h1411 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram4  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[1]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl1_49 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N8 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N9 )
  );
  RAM16X1D #(
    .INIT ( 16'h3E83 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram3  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[1]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl_48 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N6 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N7 )
  );
  RAM16X1D #(
    .INIT ( 16'h8E43 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram1  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[0]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl_48 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N2 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N3 )
  );
  RAM16X1D #(
    .INIT ( 16'h2DEF ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_Mram_ram2  (
    .A0(a[0]),
    .A1(a[1]),
    .A2(a[2]),
    .A3(a[3]),
    .D(d[0]),
    .DPRA0(dpra[0]),
    .DPRA1(dpra[1]),
    .DPRA2(dpra[2]),
    .DPRA3(dpra[3]),
    .WCLK(clk),
    .WE(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl1_49 ),
    .SPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N4 ),
    .DPO(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_N5 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl1  (
    .I0(a[4]),
    .I1(we),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl1_49 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qspo_int_7  (
    .C(clk),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [7]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qspo_int_6  (
    .C(clk),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [6]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qspo_int_5  (
    .C(clk),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [5]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qspo_int_4  (
    .C(clk),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [4]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qspo_int_3  (
    .C(clk),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [3]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qspo_int_2  (
    .C(clk),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [2]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qspo_int_1  (
    .C(clk),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [1]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qspo_int_0  (
    .C(clk),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_spo_int [0]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qspo_int [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qdpo_int_7  (
    .C(qdpo_clk),
    .CE(qdpo_ce),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [7]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qdpo_int_6  (
    .C(qdpo_clk),
    .CE(qdpo_ce),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [6]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qdpo_int_5  (
    .C(qdpo_clk),
    .CE(qdpo_ce),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [5]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qdpo_int_4  (
    .C(qdpo_clk),
    .CE(qdpo_ce),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [4]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qdpo_int_3  (
    .C(qdpo_clk),
    .CE(qdpo_ce),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [3]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qdpo_int_2  (
    .C(qdpo_clk),
    .CE(qdpo_ce),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [2]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qdpo_int_1  (
    .C(qdpo_clk),
    .CE(qdpo_ce),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [1]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_qdpo_int_0  (
    .C(qdpo_clk),
    .CE(qdpo_ce),
    .D(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_dpo_int [0]),
    .Q(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/qdpo_int [0])
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl  (
    .I0(a[4]),
    .I1(we),
    .O(\U0/xst_options.dist_mem_inst/gen_dp_ram.dpram_inst/PipeRAM_1_write_ctrl_48 )
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

// synthesis translate_on
