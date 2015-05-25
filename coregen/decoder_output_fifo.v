////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: L.70
//  \   \         Application: netgen
//  /   /         Filename: decoder_output_fifo.v
// /___/   /\     Timestamp: Fri Nov 18 13:09:09 2011
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\modem\telemetry\coregen\tmp\_cg\decoder_output_fifo.ngc C:\modem\telemetry\coregen\tmp\_cg\decoder_output_fifo.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/decoder_output_fifo.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/decoder_output_fifo.v
// # of Modules	: 1
// Design Name	: decoder_output_fifo
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

module decoder_output_fifo (
  rd_en, prog_full, wr_en, full, empty, wr_clk, rst, rd_clk, dout, din
)/* synthesis syn_black_box syn_noprune=1 */;
  input rd_en;
  output prog_full;
  input wr_en;
  output full;
  output empty;
  input wr_clk;
  input rst;
  input rd_clk;
  output [1 : 0] dout;
  input [1 : 0] din;
  
  // synthesis translate_off
  
  wire \BU2/N22 ;
  wire \BU2/N20 ;
  wire \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or0000118_127 ;
  wire \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or000093_126 ;
  wire \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or000053_125 ;
  wire \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or000026_124 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or0000118_123 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or000093_122 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or000053_121 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or000026_120 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count1 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count2 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count3 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/prog_full_i_mux0003 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/prog_full_i_not0001 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/wr_rst_d1_108 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count1 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count2 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count3 ;
  wire \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_xor0002 ;
  wire \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_xor0001 ;
  wire \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_xor0000 ;
  wire \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_xor0002 ;
  wire \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_xor0001 ;
  wire \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_xor0000 ;
  wire \BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_xor0002 ;
  wire \BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_xor0001 ;
  wire \BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_xor0000 ;
  wire \BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_xor0002 ;
  wire \BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_xor0001 ;
  wire \BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_xor0000 ;
  wire \BU2/U0/grf.rf/rstblk/wr_rst_comb ;
  wire \BU2/U0/grf.rf/rstblk/rd_rst_comb ;
  wire \BU2/U0/grf.rf/rstblk/wr_rst_asreg_38 ;
  wire \BU2/U0/grf.rf/rstblk/rd_rst_asreg_37 ;
  wire \BU2/U0/grf.rf/rstblk/wr_rst_asreg_d2_36 ;
  wire \BU2/U0/grf.rf/rstblk/wr_rst_asreg_d1_35 ;
  wire \BU2/U0/grf.rf/rstblk/rd_rst_asreg_d2_34 ;
  wire \BU2/U0/grf.rf/rstblk/rd_rst_asreg_d1_33 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_fb_i_23 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or0000 ;
  wire \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_20 ;
  wire \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or0000 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ;
  wire \BU2/N1 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/grf.rf/mem/gdm.dm/Mram_RAM1_SPO_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gdm.dm/Mram_RAM2_SPO_UNCONNECTED ;
  wire [1 : 0] din_2;
  wire [1 : 0] dout_3;
  wire [3 : 0] \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 ;
  wire [3 : 0] \BU2/U0/grf.rf/gl0.wr/wpntr/count ;
  wire [4 : 4] \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/diff_pntr_pad ;
  wire [4 : 1] \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut ;
  wire [3 : 0] \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy ;
  wire [4 : 4] \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/diff_pntr_pad_add0000 ;
  wire [3 : 0] \BU2/U0/grf.rf/gl0.rd/rpntr/count ;
  wire [3 : 0] \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc ;
  wire [3 : 0] \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc ;
  wire [3 : 0] \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 ;
  wire [3 : 0] \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg ;
  wire [3 : 0] \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 ;
  wire [3 : 0] \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg ;
  wire [3 : 0] \BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin ;
  wire [3 : 0] \BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin ;
  wire [1 : 0] \BU2/U0/grf.rf/rstblk/wr_rst_reg ;
  wire [2 : 0] \BU2/U0/grf.rf/rstblk/rd_rst_reg ;
  wire [3 : 0] \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 ;
  wire [3 : 0] \BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 ;
  wire [1 : 0] \BU2/U0/grf.rf/mem/gdm.dm/_varindex0000 ;
  wire [0 : 0] \BU2/rd_data_count ;
  assign
    dout[1] = dout_3[1],
    dout[0] = dout_3[0],
    din_2[1] = din[1],
    din_2[0] = din[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  LUT4_L #(
    .INIT ( 16'h0041 ))
  \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or0000118  (
    .I0(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_20 ),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [3]),
    .I2(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin [3]),
    .I3(\BU2/N22 ),
    .LO(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or0000118_127 )
  );
  LUT4_L #(
    .INIT ( 16'h0041 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or0000118  (
    .I0(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_fb_i_23 ),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count [3]),
    .I2(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [3]),
    .I3(\BU2/N20 ),
    .LO(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or0000118_123 )
  );
  INV   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<0>11_INV_0  (
    .I(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count )
  );
  INV   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<0>11_INV_0  (
    .I(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count )
  );
  LUT4 #(
    .INIT ( 16'h6996 ))
  \BU2/U0/grf.rf/gcx.clkx/Mxor_rd_pntr_bin_xor0002_Result1  (
    .I0(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [2]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [3]),
    .I2(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [1]),
    .I3(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [0]),
    .O(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_xor0002 )
  );
  LUT4 #(
    .INIT ( 16'h6996 ))
  \BU2/U0/grf.rf/gcx.clkx/Mxor_wr_pntr_bin_xor0002_Result1  (
    .I0(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [2]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [3]),
    .I2(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [1]),
    .I3(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [0]),
    .O(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_xor0002 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut<4>  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [3]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [4])
  );
  LUT3 #(
    .INIT ( 8'h7D ))
  \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or0000118_SW0  (
    .I0(rd_en),
    .I1(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin [0]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0]),
    .O(\BU2/N22 )
  );
  LUT3 #(
    .INIT ( 8'h7D ))
  \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or0000118_SW0  (
    .I0(wr_en),
    .I1(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [0]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0]),
    .O(\BU2/N20 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/grf.rf/gcx.clkx/Mxor_rd_pntr_bin_xor0001_Result1  (
    .I0(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [2]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [3]),
    .I2(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [1]),
    .O(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_xor0001 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/grf.rf/gcx.clkx/Mxor_wr_pntr_bin_xor0001_Result1  (
    .I0(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [2]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [3]),
    .I2(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [1]),
    .O(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_xor0001 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut<3>  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [2]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [3])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut<2>  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [1]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [2])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut<1>  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [1])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.wr/ram_wr_en_i1  (
    .I0(wr_en),
    .I1(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_fb_i_23 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or0000141  (
    .I0(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or000026_124 ),
    .I1(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or000053_125 ),
    .I2(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or000093_126 ),
    .I3(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or0000118_127 ),
    .O(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or0000 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or000093  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin [1]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2]),
    .I3(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or000093_126 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or000053  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin [3]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2]),
    .I3(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or000053_125 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or000026  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin [1]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0]),
    .I3(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or000026_124 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or0000141  (
    .I0(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or000026_120 ),
    .I1(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or000053_121 ),
    .I2(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or000093_122 ),
    .I3(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or0000118_123 ),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or0000 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or000093  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [1]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2]),
    .I3(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [2]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or000093_122 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or000053  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [3]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2]),
    .I3(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [2]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or000053_121 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or000026  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [1]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0]),
    .I3(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or000026_120 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/grf.rf/gcx.clkx/Mxor_rd_pntr_bin_xor0000_Result1  (
    .I0(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [2]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [3]),
    .O(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_xor0000 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/grf.rf/gcx.clkx/Mxor_wr_pntr_bin_xor0000_Result1  (
    .I0(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [2]),
    .I1(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [3]),
    .O(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_xor0000 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/mem/gdm.dm/dout_i_not00011  (
    .I0(rd_en),
    .I1(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_20 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 )
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<3>11  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [3]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1]),
    .I3(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count3 )
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<3>11  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [3]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count3 )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<2>11  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count2 )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<2>11  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/grf.rf/gcx.clkx/Mxor_rd_pntr_gc_xor0000_Result1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2]),
    .O(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_xor0000 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/grf.rf/gcx.clkx/Mxor_rd_pntr_gc_xor0001_Result1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1]),
    .O(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_xor0001 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/grf.rf/gcx.clkx/Mxor_rd_pntr_gc_xor0002_Result1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0]),
    .O(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_xor0002 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/grf.rf/gcx.clkx/Mxor_wr_pntr_gc_xor0000_Result1  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [3]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [2]),
    .O(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_xor0000 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/grf.rf/gcx.clkx/Mxor_wr_pntr_gc_xor0001_Result1  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [2]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [1]),
    .O(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_xor0001 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/grf.rf/gcx.clkx/Mxor_wr_pntr_gc_xor0002_Result1  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [1]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [0]),
    .O(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_xor0002 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<1>11  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count1 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<1>11  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count1 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/prog_full_i_mux00031  (
    .I0(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/diff_pntr_pad [4]),
    .I1(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/wr_rst_d1_108 ),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/prog_full_i_mux0003 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/prog_full_i_not00011  (
    .I0(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/wr_rst_d1_108 ),
    .I1(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_fb_i_23 ),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/prog_full_i_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/rstblk/rd_rst_comb1  (
    .I0(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_37 ),
    .I1(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_d2_34 ),
    .O(\BU2/U0/grf.rf/rstblk/rd_rst_comb )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/rstblk/wr_rst_comb1  (
    .I0(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_38 ),
    .I1(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_d2_36 ),
    .O(\BU2/U0/grf.rf/rstblk/wr_rst_comb )
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d2_0  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d2_1  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d2_2  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d2_3  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [3])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_3  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [3]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_2  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_1  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_0  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0]),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_0  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_1  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count1 ),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_2  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count2 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_3  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count3 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [3])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/prog_full_i  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/prog_full_i_not0001 ),
    .D(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/prog_full_i_mux0003 ),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .Q(prog_full)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/wr_rst_d1  (
    .C(wr_clk),
    .D(\BU2/rd_data_count [0]),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .Q(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/wr_rst_d1_108 )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/diff_pntr_pad_4  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/diff_pntr_pad_add0000 [4]),
    .Q(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/diff_pntr_pad [4])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy<0>  (
    .CI(\BU2/N1 ),
    .DI(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .S(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy [0])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy<1>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy [0]),
    .DI(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [1]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy [1])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy<2>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy [1]),
    .DI(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1]),
    .S(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [2]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy [2])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy<3>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy [2]),
    .DI(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2]),
    .S(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [3]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy [3])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_xor<4>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_cy [3]),
    .LI(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/Madd_diff_pntr_pad_add0000_lut [4]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwas.gpf.wrpf/diff_pntr_pad_add0000 [4])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_0  (
    .C(rd_clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [2]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_1  (
    .C(rd_clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [2]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_2  (
    .C(rd_clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [2]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_3  (
    .C(rd_clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [2]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [3]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_0  (
    .C(rd_clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count ),
    .PRE(\BU2/U0/grf.rf/rstblk/rd_rst_reg [2]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_1  (
    .C(rd_clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [2]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count1 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_2  (
    .C(rd_clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [2]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count2 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_3  (
    .C(rd_clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [2]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count3 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [3])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_0  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_xor0002 ),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc [0])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_1  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_xor0001 ),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc [1])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_2  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_xor0000 ),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc [2])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_3  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [3]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc [3])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_0  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_xor0002 ),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc [0])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_1  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_xor0001 ),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc [1])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_2  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_xor0000 ),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc [2])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_3  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc [3])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_0  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc [0]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg [0])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_1  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc [1]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg [1])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_2  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc [2]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg [2])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_3  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc [3]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg [3])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_0  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc [0]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg [0])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_1  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc [1]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg [1])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_2  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc [2]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg [2])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_3  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc [3]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg [3])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1_0  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg [0]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [0])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1_1  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg [1]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [1])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1_2  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg [2]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [2])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1_3  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg [3]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [3])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1_0  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg [0]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [0])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1_1  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg [1]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [1])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1_2  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg [2]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [2])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1_3  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg [3]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [3])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_0  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_xor0002 ),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin [0])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_1  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_xor0001 ),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin [1])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_2  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_xor0000 ),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin [2])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin_3  (
    .C(rd_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_gc_asreg_d1 [3]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/wr_pntr_bin [3])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_0  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_xor0002 ),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [0])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_1  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_xor0001 ),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [1])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_2  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_xor0000 ),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [2])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin_3  (
    .C(wr_clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0]),
    .D(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_gc_asreg_d1 [3]),
    .Q(\BU2/U0/grf.rf/gcx.clkx/rd_pntr_bin [3])
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/rstblk/wr_rst_reg_0  (
    .C(wr_clk),
    .D(\BU2/rd_data_count [0]),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_comb ),
    .Q(\BU2/U0/grf.rf/rstblk/wr_rst_reg [0])
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/rstblk/wr_rst_reg_1  (
    .C(wr_clk),
    .D(\BU2/rd_data_count [0]),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_comb ),
    .Q(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1])
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/rstblk/rd_rst_reg_0  (
    .C(rd_clk),
    .D(\BU2/rd_data_count [0]),
    .PRE(\BU2/U0/grf.rf/rstblk/rd_rst_comb ),
    .Q(\BU2/U0/grf.rf/rstblk/rd_rst_reg [0])
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/rstblk/rd_rst_reg_1  (
    .C(rd_clk),
    .D(\BU2/rd_data_count [0]),
    .PRE(\BU2/U0/grf.rf/rstblk/rd_rst_comb ),
    .Q(\BU2/U0/grf.rf/rstblk/rd_rst_reg [1])
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/rstblk/rd_rst_reg_2  (
    .C(rd_clk),
    .D(\BU2/rd_data_count [0]),
    .PRE(\BU2/U0/grf.rf/rstblk/rd_rst_comb ),
    .Q(\BU2/U0/grf.rf/rstblk/rd_rst_reg [2])
  );
  FDPE   \BU2/U0/grf.rf/rstblk/rd_rst_asreg  (
    .C(rd_clk),
    .CE(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_d1_33 ),
    .D(\BU2/rd_data_count [0]),
    .PRE(rst),
    .Q(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_37 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/wr_rst_asreg_d1  (
    .C(wr_clk),
    .D(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_38 ),
    .Q(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_d1_35 )
  );
  FDPE   \BU2/U0/grf.rf/rstblk/wr_rst_asreg  (
    .C(wr_clk),
    .CE(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_d1_35 ),
    .D(\BU2/rd_data_count [0]),
    .PRE(rst),
    .Q(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_38 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/rd_rst_asreg_d1  (
    .C(rd_clk),
    .D(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_37 ),
    .Q(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_d1_33 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/wr_rst_asreg_d2  (
    .C(wr_clk),
    .D(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_d1_35 ),
    .Q(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_d2_36 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/rd_rst_asreg_d2  (
    .C(rd_clk),
    .D(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_d1_33 ),
    .Q(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_d2_34 )
  );
  RAM16X1D   \BU2/U0/grf.rf/mem/gdm.dm/Mram_RAM1  (
    .A0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [0]),
    .A1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [1]),
    .A2(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [2]),
    .A3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [3]),
    .D(din_2[0]),
    .DPRA0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0]),
    .DPRA1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1]),
    .DPRA2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2]),
    .DPRA3(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3]),
    .WCLK(wr_clk),
    .WE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .SPO(\NLW_BU2/U0/grf.rf/mem/gdm.dm/Mram_RAM1_SPO_UNCONNECTED ),
    .DPO(\BU2/U0/grf.rf/mem/gdm.dm/_varindex0000 [0])
  );
  RAM16X1D   \BU2/U0/grf.rf/mem/gdm.dm/Mram_RAM2  (
    .A0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [0]),
    .A1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [1]),
    .A2(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [2]),
    .A3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d2 [3]),
    .D(din_2[1]),
    .DPRA0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0]),
    .DPRA1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1]),
    .DPRA2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2]),
    .DPRA3(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3]),
    .WCLK(wr_clk),
    .WE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .SPO(\NLW_BU2/U0/grf.rf/mem/gdm.dm/Mram_RAM2_SPO_UNCONNECTED ),
    .DPO(\BU2/U0/grf.rf/mem/gdm.dm/_varindex0000 [1])
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_fb_i  (
    .C(wr_clk),
    .D(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or0000 ),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .Q(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_fb_i_23 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i  (
    .C(wr_clk),
    .D(\BU2/U0/grf.rf/gl0.wr/gwas.wsts/ram_full_i_or0000 ),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .Q(full)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_i  (
    .C(rd_clk),
    .D(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or0000 ),
    .PRE(\BU2/U0/grf.rf/rstblk/rd_rst_reg [2]),
    .Q(empty)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i  (
    .C(rd_clk),
    .D(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_or0000 ),
    .PRE(\BU2/U0/grf.rf/rstblk/rd_rst_reg [2]),
    .Q(\BU2/U0/grf.rf/gl0.rd/gras.rsts/ram_empty_fb_i_20 )
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/mem/gdm.dm/dout_i_1  (
    .C(rd_clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [0]),
    .D(\BU2/U0/grf.rf/mem/gdm.dm/_varindex0000 [1]),
    .Q(dout_3[1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/mem/gdm.dm/dout_i_0  (
    .C(rd_clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg [0]),
    .D(\BU2/U0/grf.rf/mem/gdm.dm/_varindex0000 [0]),
    .Q(dout_3[0])
  );
  VCC   \BU2/XST_VCC  (
    .P(\BU2/N1 )
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/rd_data_count [0])
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
