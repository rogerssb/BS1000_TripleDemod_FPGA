////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: dataFifo.v
// /___/   /\     Timestamp: Tue Sep 29 08:56:44 2009
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\modem\telemetry\coregen\tmp\_cg\dataFifo.ngc C:\modem\telemetry\coregen\tmp\_cg\dataFifo.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/dataFifo.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/dataFifo.v
// # of Modules	: 1
// Design Name	: dataFifo
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

module dataFifo (
  srst, rd_en, wr_en, full, empty, clk, dout, din
);
  input srst;
  input rd_en;
  input wr_en;
  output full;
  output empty;
  input clk;
  output [15 : 0] dout;
  input [15 : 0] din;
  
  // synthesis translate_off
  
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux000033_165 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000026_164 ;
  wire \BU2/N39 ;
  wire \BU2/N41 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/comp0123_161 ;
  wire \BU2/N37 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/comp026_159 ;
  wire \BU2/N42 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux00006_157 ;
  wire \BU2/N35 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000183_155 ;
  wire \BU2/N33 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000131_153 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000104_152 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux000085_151 ;
  wire \BU2/U0/grf.rf/ram_rd_en ;
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux000060_149 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/comp093_148 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/comp053_147 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000124_146 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000097_145 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000078_144 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000053_143 ;
  wire \BU2/U0/grf.rf/ram_wr_en ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/SRST_inv ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count1 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count2 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count3 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count4 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count5 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count6 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count7 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/SRST_inv ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count1 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count2 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count3 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count4 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count5 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count6 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count7 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i_43 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_41 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000 ;
  wire \BU2/N1 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_REGCEA_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_REGCEB_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPB<0>_UNCONNECTED ;
  wire [15 : 0] din_2;
  wire [15 : 0] dout_3;
  wire [7 : 0] \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 ;
  wire [7 : 0] \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 ;
  wire [7 : 0] \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut ;
  wire [6 : 0] \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy ;
  wire [7 : 0] \BU2/U0/grf.rf/gl0.wr/wpntr/count ;
  wire [7 : 0] \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 ;
  wire [7 : 0] \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 ;
  wire [7 : 0] \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut ;
  wire [6 : 0] \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy ;
  wire [7 : 0] \BU2/U0/grf.rf/gl0.rd/rpntr/count ;
  wire [0 : 0] \BU2/rd_data_count ;
  assign
    dout[15] = dout_3[15],
    dout[14] = dout_3[14],
    dout[13] = dout_3[13],
    dout[12] = dout_3[12],
    dout[11] = dout_3[11],
    dout[10] = dout_3[10],
    dout[9] = dout_3[9],
    dout[8] = dout_3[8],
    dout[7] = dout_3[7],
    dout[6] = dout_3[6],
    dout[5] = dout_3[5],
    dout[4] = dout_3[4],
    dout[3] = dout_3[3],
    dout[2] = dout_3[2],
    dout[1] = dout_3[1],
    dout[0] = dout_3[0],
    din_2[15] = din[15],
    din_2[14] = din[14],
    din_2[13] = din[13],
    din_2[12] = din[12],
    din_2[11] = din[11],
    din_2[10] = din[10],
    din_2[9] = din[9],
    din_2[8] = din[8],
    din_2[7] = din[7],
    din_2[6] = din[6],
    din_2[5] = din[5],
    din_2[4] = din[4],
    din_2[3] = din[3],
    din_2[2] = din[2],
    din_2[1] = din[1],
    din_2[0] = din[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  LUT4_L #(
    .INIT ( 16'hAA2A ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux00006  (
    .I0(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i_43 ),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp053_147 ),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp093_148 ),
    .I3(\BU2/N39 ),
    .LO(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux00006_157 )
  );
  LUT4_L #(
    .INIT ( 16'hAA2A ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000183  (
    .I0(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_41 ),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp053_147 ),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp093_148 ),
    .I3(\BU2/N37 ),
    .LO(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000183_155 )
  );
  LUT4_L #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux000033  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [4]),
    .I3(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [4]),
    .LO(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux000033_165 )
  );
  LUT4_D #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/comp0123  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [5]),
    .I3(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [5]),
    .LO(\BU2/N42 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp0123_161 )
  );
  LUT4_D #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/comp026  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [6]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [6]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2]),
    .LO(\BU2/N41 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp026_159 )
  );
  LUT4_L #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000026  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [4]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [4]),
    .LO(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000026_164 )
  );
  LUT2_L #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1  (
    .I0(rd_en),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_41 ),
    .LO(\BU2/U0/grf.rf/ram_rd_en )
  );
  RAMB16BWER #(
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .DATA_WIDTH_B ( 36 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SIM_COLLISION_CHECK ( "NONE" ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 36 ),
    .SRVAL_A ( 36'h000000000 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(\BU2/N1 ),
    .ENB(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .RSTA(\BU2/rd_data_count [0]),
    .RSTB(srst),
    .REGCEA
(\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_REGCEA_UNCONNECTED ),
    .REGCEB
(\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_REGCEB_UNCONNECTED ),
    .ADDRA({\BU2/rd_data_count [0], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [7], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [6], 
\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [5], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [4], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3], 
\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0], 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRA<4>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRA<3>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRA<2>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRA<1>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRA<0>_UNCONNECTED }),
    .ADDRB({\BU2/rd_data_count [0], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [7], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [6], 
\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [5], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [4], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3], 
\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0], 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRB<4>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRB<3>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRB<2>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRB<1>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_ADDRB<0>_UNCONNECTED }),
    .DIA({\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], din_2[15], din_2[14], din_2[13], din_2[12], 
\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], din_2[11], din_2[10], din_2[9], din_2[8], 
\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], din_2[7], din_2[6], din_2[5], din_2[4], 
\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], din_2[3], din_2[2], din_2[1], din_2[0]}),
    .DIB({\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], 
\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], 
\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], 
\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], 
\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], 
\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0]}),
    .DIPA({\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0]}),
    .DIPB({\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0]}),
    .WEA({\BU2/U0/grf.rf/ram_wr_en , \BU2/U0/grf.rf/ram_wr_en , \BU2/U0/grf.rf/ram_wr_en , \BU2/U0/grf.rf/ram_wr_en }),
    .WEB({\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0]}),
    .DOA({\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<31>_UNCONNECTED 
, \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<29>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<27>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<25>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<23>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<21>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<19>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<17>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<15>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<13>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<11>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<9>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<7>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<5>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<3>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<1>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOA<0>_UNCONNECTED }),
    .DOB({\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<31>_UNCONNECTED 
, \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<29>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<28>_UNCONNECTED , 
dout_3[15], dout_3[14], dout_3[13], dout_3[12], 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<23>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<21>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<20>_UNCONNECTED , 
dout_3[11], dout_3[10], dout_3[9], dout_3[8], 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<15>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<13>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<12>_UNCONNECTED , 
dout_3[7], dout_3[6], dout_3[5], dout_3[4], 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<7>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<5>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOB<4>_UNCONNECTED , dout_3[3]
, dout_3[2], dout_3[1], dout_3[0]}),
    .DOPA({
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPA<3>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPA<1>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPA<0>_UNCONNECTED }),
    .DOPB({
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPB<3>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPB<1>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp36x36.ram_DOPB<0>_UNCONNECTED })
  );
  INV   \BU2/U0/grf.rf/gl0.rd/rpntr/SRST_inv1_INV_0  (
    .I(srst),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/SRST_inv )
  );
  INV   \BU2/U0/grf.rf/gl0.wr/wpntr/SRST_inv1_INV_0  (
    .I(srst),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/SRST_inv )
  );
  LUT3 #(
    .INIT ( 8'hAE ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_not00011  (
    .I0(srst),
    .I1(wr_en),
    .I2(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i_43 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 )
  );
  LUT3 #(
    .INIT ( 8'hAE ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_not00011  (
    .I0(srst),
    .I1(rd_en),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_41 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 )
  );
  LUT4 #(
    .INIT ( 16'h7FFF ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000162_SW0  (
    .I0(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux000033_165 ),
    .I1(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux000060_149 ),
    .I2(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000131_153 ),
    .I3(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000104_152 ),
    .O(\BU2/N35 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000155_SW0  (
    .I0(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000026_164 ),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000053_143 ),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000124_146 ),
    .I3(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000097_145 ),
    .O(\BU2/N33 )
  );
  LUT4 #(
    .INIT ( 16'hDFFF ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux00006_SW0  (
    .I0(rd_en),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_41 ),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp0123_161 ),
    .I3(\BU2/N41 ),
    .O(\BU2/N39 )
  );
  LUT4 #(
    .INIT ( 16'hDFFF ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000183_SW0  (
    .I0(wr_en),
    .I1(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i_43 ),
    .I2(\BU2/N42 ),
    .I3(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp026_159 ),
    .O(\BU2/N37 )
  );
  LUT4 #(
    .INIT ( 16'h5504 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000188  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux000085_151 ),
    .I2(\BU2/N35 ),
    .I3(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux00006_157 ),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000185  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000078_144 ),
    .I2(\BU2/N33 ),
    .I3(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000183_155 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000131  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [6]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [6]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2]),
    .I3(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000131_153 )
  );
  LUT4 #(
    .INIT ( 16'h9909 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000104  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [5]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count [5]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000104_152 )
  );
  LUT4 #(
    .INIT ( 16'h008A ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux000085  (
    .I0(wr_en),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [5]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [5]),
    .I3(\BU2/U0/grf.rf/ram_rd_en ),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux000085_151 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux000060  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [3]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [7]),
    .I3(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [7]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux000060_149 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/comp093  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [4]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [4]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [7]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [7]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp093_148 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/comp053  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp053_147 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000124  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [6]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [6]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000124_146 )
  );
  LUT4 #(
    .INIT ( 16'h9909 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000097  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [5]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [5]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000097_145 )
  );
  LUT4 #(
    .INIT ( 16'h008A ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000078  (
    .I0(rd_en),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [5]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [5]),
    .I3(\BU2/U0/grf.rf/ram_wr_en ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000078_144 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000053  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [3]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [7]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [7]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux000053_143 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.wr/ram_wr_en_i1  (
    .I0(wr_en),
    .I1(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i_43 ),
    .O(\BU2/U0/grf.rf/ram_wr_en )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000<0>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [7]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000<1>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [6]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [1])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000<2>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [5]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [2])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000<3>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [4]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [3])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000<4>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [3]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [4])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000<5>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [5])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000<6>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [6])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000<7>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [7])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000<0>1  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [7]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000<1>1  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [6]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [1])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000<2>1  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [5]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [2])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000<3>1  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [4]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [3])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000<4>1  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [3]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [4])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000<5>1  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [5])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000<6>1  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [6])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000<7>1  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0]),
    .I1(srst),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [7])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_0  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [7]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_1  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [6]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_2  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [5]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_3  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [4]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_4  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [3]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [4])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_5  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [2]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [5])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_6  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [1]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [6])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_7  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_mux0000 [0]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut<0>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0]),
    .I2(\BU2/N1 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [0])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<0>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/SRST_inv ),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [0])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<0>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/SRST_inv ),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut<1>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [1])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<1>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [0]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [1]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [1])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<1>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [0]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [1]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count1 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut<2>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [2])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<2>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [1]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [2]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [2])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<2>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [1]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [2]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count2 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut<3>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count [3]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [3])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<3>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [2]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [3]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [3])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<3>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [2]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [3]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count3 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut<4>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count [4]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [4])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<4>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [3]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [4]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [4])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<4>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [3]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [4]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count4 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut<5>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count [5]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [5])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<5>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [4]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [5]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [5])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<5>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [4]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [5]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count5 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut<6>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count [6]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [6])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<6>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [5]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [6]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [6])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<6>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [5]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [6]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count6 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut<7>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count [7]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [7])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<7>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [6]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_lut [7]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count7 )
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_0  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count ),
    .PRE(\BU2/rd_data_count [0]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_1  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count1 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_2  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count2 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_3  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count3 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [3])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_4  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count4 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [4])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_5  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count5 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [5])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_6  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count6 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [6])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_7  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/wpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count7 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [7])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_0  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [7]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_1  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [6]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_2  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [5]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_3  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [4]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_4  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [3]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [4])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_5  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [2]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [5])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_6  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [1]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [6])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_7  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_mux0000 [0]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut<0>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0]),
    .I2(\BU2/N1 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [0])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<0>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/SRST_inv ),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [0])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<0>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/SRST_inv ),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut<1>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [1])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<1>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [0]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [1]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [1])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<1>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [0]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [1]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count1 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut<2>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [2])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<2>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [1]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [2])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<2>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [1]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count2 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut<3>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [3]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [3])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<3>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [2]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [3]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [3])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<3>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [2]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [3]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count3 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut<4>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [4]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [4])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<4>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [3]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [4]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [4])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<4>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [3]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [4]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count4 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut<5>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [5]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [5])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<5>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [4]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [5]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [5])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<5>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [4]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [5]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count5 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut<6>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [6]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [6])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<6>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [5]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [6]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [6])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<6>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [5]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [6]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count6 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut<7>  (
    .I0(srst),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count [7]),
    .I2(\BU2/rd_data_count [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [7])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<7>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [6]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_lut [7]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count7 )
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_0  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count ),
    .PRE(\BU2/rd_data_count [0]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_1  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count1 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_2  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count2 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_3  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count3 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [3])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_4  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count4 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [4])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_5  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count5 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [5])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_6  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count6 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [6])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_7  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/rpntr/count_not0001 ),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count7 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [7])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i  (
    .C(clk),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i_43 )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i  (
    .C(clk),
    .CLR(\BU2/rd_data_count [0]),
    .D(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i_mux0000 ),
    .Q(full)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_i  (
    .C(clk),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000 ),
    .PRE(\BU2/rd_data_count [0]),
    .Q(empty)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i  (
    .C(clk),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000 ),
    .PRE(\BU2/rd_data_count [0]),
    .Q(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_41 )
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
