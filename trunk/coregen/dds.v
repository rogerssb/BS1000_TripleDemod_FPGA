////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: dds.v
// /___/   /\     Timestamp: Thu Jun 11 16:14:27 2009
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\modem\telemetry\coregen\tmp\_cg\dds.ngc C:\modem\telemetry\coregen\tmp\_cg\dds.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/dds.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/dds.v
// # of Modules	: 1
// Design Name	: dds
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

module dds (
  sclr, ce, clk, we, data, sine, cosine
);
  input sclr;
  input ce;
  input clk;
  input we;
  input [31 : 0] data;
  output [17 : 0] sine;
  output [17 : 0] cosine;
  
  // synthesis translate_off
  
  wire \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<0>_rt_1362 ;
  wire \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<1>_rt_1344 ;
  wire \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<2>_rt_1342 ;
  wire \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<3>_rt_1340 ;
  wire \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<4>_rt_1338 ;
  wire \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<5>_rt_1336 ;
  wire \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<6>_rt_1334 ;
  wire \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<7>_rt_1332 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<1>_rt_1328 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<2>_rt_1326 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<3>_rt_1324 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<4>_rt_1322 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<5>_rt_1320 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<6>_rt_1318 ;
  wire \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<7>_rt_1316 ;
  wire \BU2/U0/i_dither.i_dither/lfsr_9_not0001 ;
  wire \BU2/U0/i_dither.i_dither/lfsr_8_not0001 ;
  wire \BU2/U0/i_dither.i_dither/lfsr_7_not0001 ;
  wire \BU2/U0/i_dither.i_dither/lfsr_6_not0001 ;
  wire \BU2/U0/i_dither.i_dither/lfsr_4_not0001 ;
  wire \BU2/U0/i_dither.i_dither/lfsr_3_not0001 ;
  wire \BU2/U0/i_dither.i_dither/lfsr_5_not0001 ;
  wire \BU2/U0/i_dither.i_dither/lfsr_2_not0001 ;
  wire \BU2/U0/i_dither.i_dither/lfsr_1_not0001 ;
  wire \BU2/U0/i_dither.i_dither/lfsr_10_not0001 ;
  wire \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/Mshreg_Q_1_657 ;
  wire \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/Mshreg_Q_0_656 ;
  wire \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/N1 ;
  wire \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/N0 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPB<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPB<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPB<0>_UNCONNECTED ;
  wire [31 : 0] data_2;
  wire [17 : 0] cosine_3;
  wire [17 : 0] sine_4;
  wire [13 : 0] \BU2/U0/i_rom/mod_sin_addr ;
  wire [13 : 0] \BU2/U0/i_rom/asyn_mod_sin_addr ;
  wire [13 : 0] \BU2/U0/i_rom/mod_cos_addr ;
  wire [13 : 0] \BU2/U0/i_rom/asyn_mod_cos_addr ;
  wire [8 : 0] \BU2/U0/i_rom/asyn_cos_ls1_pre ;
  wire [0 : 0] \BU2/U0/i_rom/Madd_asyn_cos_ls1_lut ;
  wire [8 : 0] \BU2/U0/i_rom/Madd_asyn_cos_ls1_cy ;
  wire [8 : 1] \BU2/U0/i_rom/asyn_sin_ls1_pre ;
  wire [8 : 0] \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy ;
  wire [0 : 0] \BU2/U0/i_rom/Madd_asyn_cos_ms2_lut ;
  wire [7 : 0] \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy ;
  wire [0 : 0] \BU2/U0/i_rom/Madd_asyn_sin_ms2_lut ;
  wire [7 : 0] \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy ;
  wire [0 : 0] \BU2/U0/i_rom/quadrant_bypass_b ;
  wire [16 : 0] \BU2/U0/i_rom/asyn_cos_RAM_op ;
  wire [16 : 0] \BU2/U0/i_rom/cos_RAM_op ;
  wire [16 : 0] \BU2/U0/i_rom/asyn_sin_RAM_op ;
  wire [16 : 0] \BU2/U0/i_rom/sin_RAM_op ;
  wire [8 : 0] \BU2/U0/i_rom/asyn_cos_ms2 ;
  wire [8 : 0] \BU2/U0/i_rom/asyn_sin_ms2 ;
  wire [8 : 0] \BU2/U0/i_rom/asyn_cos_ms1 ;
  wire [8 : 0] \BU2/U0/i_rom/cos_ms1 ;
  wire [8 : 0] \BU2/U0/i_rom/asyn_sin_ms1 ;
  wire [8 : 0] \BU2/U0/i_rom/sin_ms1 ;
  wire [8 : 0] \BU2/U0/i_rom/asyn_cos_ls1 ;
  wire [9 : 0] \BU2/U0/i_rom/cos_ls1 ;
  wire [8 : 0] \BU2/U0/i_rom/asyn_sin_ls1 ;
  wire [9 : 0] \BU2/U0/i_rom/sin_ls1 ;
  wire [48 : 31] \BU2/U0/final_sin ;
  wire [48 : 31] \BU2/U0/final_cos ;
  wire [32 : 0] \BU2/U0/acc_phase ;
  wire [32 : 0] \BU2/U0/acc_phase_shaped ;
  wire [31 : 16] \BU2/U0/acc_phase_shaped_pre ;
  wire [31 : 7] \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut ;
  wire [30 : 7] \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy ;
  wire [9 : 0] \BU2/U0/dither_i ;
  wire [31 : 0] \BU2/U0/i_accum/acc_phase_b ;
  wire [31 : 0] \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut ;
  wire [31 : 0] \BU2/U0/i_accum/phase_inc ;
  wire [30 : 0] \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy ;
  wire [0 : 0] \BU2/channel ;
  wire [18 : 11] \BU2/U0/i_dither.i_dither/lfsr ;
  wire [1 : 0] \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q ;
  assign
    data_2[31] = data[31],
    data_2[30] = data[30],
    data_2[29] = data[29],
    data_2[28] = data[28],
    data_2[27] = data[27],
    data_2[26] = data[26],
    data_2[25] = data[25],
    data_2[24] = data[24],
    data_2[23] = data[23],
    data_2[22] = data[22],
    data_2[21] = data[21],
    data_2[20] = data[20],
    data_2[19] = data[19],
    data_2[18] = data[18],
    data_2[17] = data[17],
    data_2[16] = data[16],
    data_2[15] = data[15],
    data_2[14] = data[14],
    data_2[13] = data[13],
    data_2[12] = data[12],
    data_2[11] = data[11],
    data_2[10] = data[10],
    data_2[9] = data[9],
    data_2[8] = data[8],
    data_2[7] = data[7],
    data_2[6] = data[6],
    data_2[5] = data[5],
    data_2[4] = data[4],
    data_2[3] = data[3],
    data_2[2] = data[2],
    data_2[1] = data[1],
    data_2[0] = data[0],
    sine[17] = sine_4[17],
    sine[16] = sine_4[16],
    sine[15] = sine_4[15],
    sine[14] = sine_4[14],
    sine[13] = sine_4[13],
    sine[12] = sine_4[12],
    sine[11] = sine_4[11],
    sine[10] = sine_4[10],
    sine[9] = sine_4[9],
    sine[8] = sine_4[8],
    sine[7] = sine_4[7],
    sine[6] = sine_4[6],
    sine[5] = sine_4[5],
    sine[4] = sine_4[4],
    sine[3] = sine_4[3],
    sine[2] = sine_4[2],
    sine[1] = sine_4[1],
    sine[0] = sine_4[0],
    cosine[17] = cosine_3[17],
    cosine[16] = cosine_3[16],
    cosine[15] = cosine_3[15],
    cosine[14] = cosine_3[14],
    cosine[13] = cosine_3[13],
    cosine[12] = cosine_3[12],
    cosine[11] = cosine_3[11],
    cosine[10] = cosine_3[10],
    cosine[9] = cosine_3[9],
    cosine[8] = cosine_3[8],
    cosine[7] = cosine_3[7],
    cosine[6] = cosine_3[6],
    cosine[5] = cosine_3[5],
    cosine[4] = cosine_3[4],
    cosine[3] = cosine_3[3],
    cosine[2] = cosine_3[2],
    cosine[1] = cosine_3[1],
    cosine[0] = cosine_3[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'h3264CD9B3264C99B3664C993366CD993264CD9B3664C993366CD9B3264C99B36 ),
    .INIT_01 ( 256'h99933664CD99B3266CC99B3266CC99B3664CD993266CC99B3664C99B3264CD9B ),
    .INIT_02 ( 256'h666CCCD9993332666CCC999B336664CC999B33666CCD99B33666CC99933666CC ),
    .INIT_03 ( 256'h9999999999933333333326666666CCCCCCD99999B3333666664CCCD999933336 ),
    .INIT_04 ( 256'h333199998CCCCCE6666663333333331999999999999999999999999999999999 ),
    .INIT_05 ( 256'h63398CE673198CC673399CCE6733198CCE66333998CCC6663331999CCCC66663 ),
    .INIT_06 ( 256'h738C739CE318C739CE739CE739CE739CE6318C67398C63398C67398CE63398CE ),
    .INIT_07 ( 256'h1C71C71C71C71C71C71C718E38E31C71CE38C71CE39C738C718E718E318E718E ),
    .INIT_08 ( 256'hF0F0E1E1C3C7870F1E3C78F0E3C78F1E3870E3C70E3871C38E1C71C38E38F1C7 ),
    .INIT_09 ( 256'hF83E0F83E0F83E0F83C1F0783C1E0F0783C3E1E0F0F0F8787878787878787878 ),
    .INIT_0A ( 256'h07FC03FE01FE01FC03F807F01FC07F03F81FC0FC07E07E07E0FC0F81F83F07C0 ),
    .INIT_0B ( 256'h0FFFFFFFF000000FFFFF00003FFFC0007FFE000FFF800FFF001FF801FF801FF0 ),
    .INIT_0C ( 256'h1FFFE00007FFFF000000FFFFFFFC00000000000000000FFE0000000000000000 ),
    .INIT_0D ( 256'h3F03F01F80FC07F01FC07F80FF00FF007F803FF007FE007FF001FFE000FFF800 ),
    .INIT_0E ( 256'h0F1E1C3C3C78787878783C3C3E1E0F0783C1F0F83E0F83E0F83E07C0F81F83F0 ),
    .INIT_0F ( 256'hE318E738C718E71CE38C71C638E38E38E38E38E1C71C38E1C78E1C78F1E3C787 ),
    .INIT_10 ( 256'h9999999999999999CCCCCE666333199CCE673398CC67318CE6318CE739CE739C ),
    .INIT_11 ( 256'h6C926D926D936C9B24D9366C9B264D9B366CD993266CCD99B3366664CCCC9999 ),
    .INIT_12 ( 256'h94B5A5A5AD2D2D25A5A5B4B696D25B492DA496DB492496DB6DB6DB6DB24924DB ),
    .INIT_13 ( 256'h554AA955AA954AA552AD5AA54A952A54AD4A95A94AD4A56B5AD6A5AD6B5A5296 ),
    .INIT_14 ( 256'hAAAD5555AAAAAAD555555555555555555555555555AAAAAA955552AAAD554AAA ),
    .INIT_15 ( 256'h4B5A5294A5294AD6B52B52B52B52A54A952A55AA55AA552AB552AA554AAA5556 ),
    .INIT_16 ( 256'h926C926DB24936DB6DB6DB6DB6D2496DB496DA4B696D2DA5A5A5A5A5A5A52D69 ),
    .INIT_17 ( 256'hC66733399998CCCCCCCCCCCCCCC99999333666CCD9B3264C99366C9B26C9B26D ),
    .INIT_18 ( 256'h3C3870E1C78E3C71C78E38E38C71C738E71CE318E738C6319CE7318CE633198C ),
    .INIT_19 ( 256'hFF003FE00FF00FE01FC0FE07E07E07E0FC1F07C1F0F83C1E1F0F0F0F0F0F0E1E ),
    .INIT_1A ( 256'h800FFF8001FFFF000001FFFFFFFFFFFFFFFFFFFFFFFE000003FFFE0003FFE003 ),
    .INIT_1B ( 256'hC3870F1E1E1E1E1E1F0F87C3E0F07C0F83F07E07E07F03F80FF01FF00FF801FF ),
    .INIT_1C ( 256'hCE6666333199CCE63398CE7398C631CE718E718E31C71CE38E3C71C70E3870E1 ),
    .INIT_1D ( 256'hDB6DA49249B6DB64936C936C9B26C9B264D9B3664CD9933366666CCCCCCCCCCC ),
    .INIT_1E ( 256'h2A954AB54AB56AD4A95A95A94AD6B5AD6B4A5AD2D696969696D2DA5B496DA496 ),
    .INIT_1F ( 256'h52A955AAB555AAAB55556AAAAAAA955555555552AAAAAAAD5554AAA9554AAB55 ),
    .INIT_20 ( 256'hB6DB6DA492DA496D2DA5B4B4B4B4A5A52D6B4A5294AD6A56B56A56AD5AA55AA5 ),
    .INIT_21 ( 256'h3198CCE666733333333333326666CCD993366CD9B264D93649B24DB64936DB6D ),
    .INIT_22 ( 256'hF0783C1E1E1E1E1E1C3C78F1C38F1C71C38E71C71CE39C639CE718CE7398CE63 ),
    .INIT_23 ( 256'h7FFFFFFFFFFFFFF0000007FFFC000FFF003FF007F807F01FC0FE07E0FC1F07C1 ),
    .INIT_24 ( 256'hE1E1E1E1E0F0783C1F07C0F81F81F81FC07F00FF007FE007FF8003FFFE000000 ),
    .INIT_25 ( 256'hCCCCCCCCCE666733198CC67318CE739CE318E71CE38E71C71C38E3871E3C78F0 ),
    .INIT_26 ( 256'hA5A5A5B4B496D25B6924B6DB6DB6DB249B6C9364D9364D9B264CD993326666CC ),
    .INIT_27 ( 256'hAAAAAAAAAAAAAAAD5555AAAB554AA954AA55AA54A952B56B52B5AD6B5AD694B4 ),
    .INIT_28 ( 256'h5B4B4B4B4B4A5AD294A5294AD6A56AD4A952AD52A955AA9554AAAD5555AAAAAA ),
    .INIT_29 ( 256'hCC6666666366666664CCD993366CD9B26C9B26D926DB24924DB492492DB496D2 ),
    .INIT_2A ( 256'hF07C1E0F07878787870F1E3C78E3C71C71C71C738E718E739CE7398CE633198C ),
    .INIT_2B ( 256'h7FFF000007FFFFFFFFFFFFFFFFE00000FFFE001FFC00FF00FF01FC07E07E0FC1 ),
    .INIT_2C ( 256'h39C71C38E3871E3C7870F0F0F0F0787C1F0FC1F03F07F03F80FF00FF803FF800 ),
    .INIT_2D ( 256'h926C9364C9B366CD99B33666664CCCCCE6666733198CC67318C6318C739C738E ),
    .INIT_2E ( 256'hAD54AB55AB56AD5A95A94A56B5A529694B4B4B4B696D25B692496DB6DB24926D ),
    .INIT_2F ( 256'h294AD4AD5A956AD52A955AAB554AAAB555555AAAAAAAAAAAAD555556AAAD556A ),
    .INIT_30 ( 256'hC999933664C99366C9B64DB24DB6C92492496DB492DA4B4B69696B4B5A52D6B5 ),
    .INIT_31 ( 256'h1E1E1E1E3C3871E3871C71C71C738E718E739CE7318CC67331998CCCCCCCCCCC ),
    .INIT_32 ( 256'hFFFF80000000000000000FFFFF8001FFE007FC01FE03F80FC0FC1F83E0F87C3E ),
    .INIT_33 ( 256'h71C71C71C78E1C7870F1E1E1E0F0F83C1F03E07C0FE07F01FE00FF801FFE0007 ),
    .INIT_34 ( 256'h4926D926C9B26CD93266CC999B3333333333331998CCE63398CE739CE31CE39C ),
    .INIT_35 ( 256'h5555AAAD54AAD52AD52A54AD4AD6A5294A5AD29696969692DA4B692496DB6DB6 ),
    .INIT_36 ( 256'h4B4A5AD294A52B5A95A952A54AB55AA955AAAD5552AAAAAB5555555552AAAAAA ),
    .INIT_37 ( 256'h31999CCCCCCCCCCD999B3266CD9B264D936C936D924924924925B692DA5B4B4B ),
    .INIT_38 ( 256'hFC0FC0F81F07C3E0F0F8787870F1E3C70E3871C71C638E718E739CE7318CE673 ),
    .INIT_39 ( 256'h7E03FC03FE00FFE000FFFF00000003FFFFFF00000003FFFE001FFC00FF00FF01 ),
    .INIT_3A ( 256'h199CCE6339CE739CE31CE39C71C71C70E3C70E1E3C3C3C3C3E1F07C1F07E07E0 ),
    .INIT_3B ( 256'h5A5A5A5B4B692DB492492C924926D926D9364D9B366CC9993333666666663333 ),
    .INIT_3C ( 256'h6AAA9555554AAAAAAAAAB555555AAAA555AAB55AAD52A54A95A94AD6B5AD6B4B ),
    .INIT_3D ( 256'h6D926DB6DB6DB6DB492DA4B496969694B4A5294A5295A95AB56AD52A954AAD55 ),
    .INIT_3E ( 256'h1C38E38E31C738C739CE7398CE6331998CCCCCE664CCCCC99933664C9B364DB2 ),
    .INIT_3F ( 256'h00000007FFFFC000FFF003FF00FF01FC0FC0FC1F03C1F0F87C3C3C3878F1E3C7 ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut1  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [0]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [0]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut1_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'hC3870E1C3C78F1E3C7870E1C3870E1E3C78F1E3C7870E1C3870E1C3C78F1E3C7 ),
    .INIT_01 ( 256'h1E1C3878F1E1C3C78F0E1C3C78F0E1C3878F1E1C3870F1E3C7870E1C3C78F1E3 ),
    .INIT_02 ( 256'h7870F0E1E1C3C3878F0F1E1C3C7878F0E1E3C3878F0E1E3C3878F0E1E3C7870F ),
    .INIT_03 ( 256'h1E1E1E1E1E1C3C3C3C3C38787878F0F0F0E1E1E1C3C3C787878F0F1E1E1C3C38 ),
    .INIT_04 ( 256'hC3C1E1E1F0F0F0F878787C3C3C3C3C1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E ),
    .INIT_05 ( 256'h83C1F0F87C1E0F0783C1E0F0783C1E0F0F87C3C1E0F0F8783C3E1E1F0F078783 ),
    .INIT_06 ( 256'h83F07C1F03E0F83E0F83E0F83E0F83E0F83E0F87C1F07C3E0F87C1F0F83C1F0F ),
    .INIT_07 ( 256'h1F81F81F81F81F81F81F81F03F03E07E0FC0F81F03E07C0F81F07E0FC1F07E0F ),
    .INIT_08 ( 256'hFF00FE01FC07F80FE03F80FF03F80FE03F80FC07F03F81FC0FE07E03F03F01F8 ),
    .INIT_09 ( 256'h003FF003FF003FF003FE007FC01FF007FC03FE00FF00FF807F807F807F807F80 ),
    .INIT_0A ( 256'h07FFFC0001FFFE0003FFF8001FFF8003FFE000FFF8007FF800FFF001FFC007FF ),
    .INIT_0B ( 256'hF00000000000000FFFFFFFFFC00000007FFFFFF000000FFFFFE00001FFFFE000 ),
    .INIT_0C ( 256'h00001FFFFFFFFF00000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_0D ( 256'hFF000FFF8003FFF0003FFF8000FFFF00007FFFF00001FFFFF000001FFFFFF800 ),
    .INIT_0E ( 256'hFF01FC03FC07F807F807FC03FE01FF007FC00FF801FF801FF801FFC007FF800F ),
    .INIT_0F ( 256'h1F07E0F83F07E0FC1F83F03E07E07E07E07E07E03F03F81FC07E03F80FE03F80 ),
    .INIT_10 ( 256'h78787878787878783C3C3E1E1F0F0783C1E0F0783C1F0F83E1F07C1F07C1F07C ),
    .INIT_11 ( 256'hE38E1C71E38F1C78E3C70E1C78E1C3870E1C3870E1E3C3878F0E1E1C3C3C7878 ),
    .INIT_12 ( 256'h738C639C631CE31C639C738E71CE38C71C638E38C71C71C71C71C71C71C71C38 ),
    .INIT_13 ( 256'h333998CC6673399CCE63399CC67319CC63398C6739CC6318C6319C6318C6318E ),
    .INIT_14 ( 256'h999B33336666664CCCCCCCCCCCCCCCCCCCCCCCCCCC666666733331999CCCC666 ),
    .INIT_15 ( 256'hD936C9B26C9B264D9366C99366C993264C993366CC9933666CC999332666CCCD ),
    .INIT_16 ( 256'h4925B6DB6924924924924924924924DB6DB24926DB249B6C936C936C936C9B24 ),
    .INIT_17 ( 256'h52D29694B4B5A5A5A5A5A5A5A5A4B4B49692D25A4B696D25B492DA496DA496DB ),
    .INIT_18 ( 256'h956AD5AB52A56AD4AD5A95A95AD4AD6A52B5A94A5295AD6B4A5294A5AD694B5A ),
    .INIT_19 ( 256'h55556AAAA5555AAAB555AAAD552AAD55AAB552AB55AA954AB55AA55AA55AA54A ),
    .INIT_1A ( 256'h2AAAAAD5555555AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA955555556AAAAA9 ),
    .INIT_1B ( 256'h6AD5AA54AB54AB54AA552A954AA556AAD55AAB554AAA5552AAA5555AAAAD5555 ),
    .INIT_1C ( 256'h94B4B4A5A52D694B5AD294A52D6B5A94A52B5AD4A56A56B52B56A56A54AD5AB5 ),
    .INIT_1D ( 256'h6DB6C92492DB6DB6DA4925B6D24B6D24B692DA4B696D25A5B4B4B69696969696 ),
    .INIT_1E ( 256'hB3266CD993264C99326CD9326C9B26C9B26C93649B24DB24DB64936D924936DB ),
    .INIT_1F ( 256'h633199CCC666333399998CCCCCCCE66666666664CCCCCCC999993332666CCD99 ),
    .INIT_20 ( 256'hC71C71C71CE38E71CE39C738C738C639CE738C6318CE7398C67398CE63399CC6 ),
    .INIT_21 ( 256'h3E1F0F078783C3C3C3C3C3C387870F1E1C3870E1C3871E3871C38E3871C71C71 ),
    .INIT_22 ( 256'hFF803FE01FE01FE01FC07F01FC0FE07E03F07E07E0FC1F83E0F81F0F83E0F07C ),
    .INIT_23 ( 256'hFFFFFFFFFFFFFFFFFFFFF80000000FFFFFC00007FFF8001FFF0007FF001FF801 ),
    .INIT_24 ( 256'h1FE01FE01FF007FC00FFC007FF8007FFC000FFFF00001FFFFF80000001FFFFFF ),
    .INIT_25 ( 256'h3C3C3C3C3E1E1F0F0783C1F0F83E0F83E0F81F03E07E0FC0FC07E07F01FC07F0 ),
    .INIT_26 ( 256'h639C638C738E31C718E38E38E38E38E3871C70E3C70E3C78E1C3C78F0E1E1E3C ),
    .INIT_27 ( 256'h666666666666666333339998CCC6673399CC663398CE7318CE739CE739CE738C ),
    .INIT_28 ( 256'h36D926D926D93649B26C9B264D93264D9B3664C99B33664CCD999B3333666666 ),
    .INIT_29 ( 256'hA52D2D2D292D2D2D2DA5B4B692DA4B6925B6924B6DB69249249249249B6DB249 ),
    .INIT_2A ( 256'hAAD54AA552AD52AD52A54A952A56AD4AD4AD4AD6A52B5AD6B5AD6B5A5296B4A5 ),
    .INIT_2B ( 256'hAAAA5555555555555555555555555555AAAAAAB55555AAAA5554AAAD552AA554 ),
    .INIT_2C ( 256'h5295A952B52A54A952A55AA55AA552A955AA955AAA555AAAD555AAAAD55552AA ),
    .INIT_2D ( 256'hDB4925B692DA4B692D25A4B4B4969696B4B4B5A5AD296B5A5294A5295AD6A52B ),
    .INIT_2E ( 256'hC9993266CD9B366CD9326C9B26C9B24D926D926DB249B6DB24924924924924B6 ),
    .INIT_2F ( 256'hCE7318CE63198CE633199CCC6673333999999CCCCCCCCCCCC999999B3336664C ),
    .INIT_30 ( 256'h0E1E1C3878F1E3870E3871C38E38F1C71C718E38E31C738C718E738C639CE739 ),
    .INIT_31 ( 256'hE01FE01FC03F81FC07E07E07E07C0F81F07C1F07C1F0F87C3E1E0F0F0F0F0F0F ),
    .INIT_32 ( 256'h00007FFFFFFFFFFFFFFFF000000001FFFFF80001FFFC000FFF001FFC00FF803F ),
    .INIT_33 ( 256'h0FC0FC0FC07E03F80FF01FE01FF007FC00FFE003FFE000FFFE00007FFFFE0000 ),
    .INIT_34 ( 256'h38E1C71E3871E3C70E1E3C7878F0F0F0F0F0F0F8783C1E0F87C1F07C1F03E07C ),
    .INIT_35 ( 256'h3333999CCC663319CCE6339CC6319CE739C6318E718E718E39C718E38E38E38E ),
    .INIT_36 ( 256'h26D93649B26C99364C9B366CD9933664CC999B3336666666CCCCCCCCCE666666 ),
    .INIT_37 ( 256'h94B4B5A5A5A5A5A4B4B696D25B496D24B6DA4924B6DB6DB6DB6C9249B6C926D9 ),
    .INIT_38 ( 256'hAAA555AAB552A955AA552AD52A54A952A56AD4AD4AD6A52B5AD6B5AD6B5A52D6 ),
    .INIT_39 ( 256'hAB5556AAAB55554AAAAAAA5555555555555555555556AAAAAAB55555AAAA5554 ),
    .INIT_3A ( 256'h52D694B5AD6B5AD6B5A94AD6A56A56A54A95AB54A956A956AB55AA955AAB554A ),
    .INIT_3B ( 256'h936C936D924DB6D924924924924B6DB4925B692DA4B692D25A5A4B4B4B4B5A5A ),
    .INIT_3C ( 256'h8CCCE6666673333333332666666CCCC99933266CC99B366CD9326C9B26C9B26D ),
    .INIT_3D ( 256'h71E38E38E38E38E38E31C738E718E718C739CE739CE6319CC67319CCE6733199 ),
    .INIT_3E ( 256'hE03F03F03E07C0F83E0F83E0F07C3E1E0F0F0F07870F0F0E1E3C7870E3C78E3C ),
    .INIT_3F ( 256'hFFFFFFF800000000FFFFFC0000FFFE000FFF001FFC01FF007FC03FC07F01FC07 ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut2  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [1]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [1]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut2_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'h56AD5AB56AD5AB56AD52A54A952A54A952A54A952AD5AB56AD5AB56AD5AB56AD ),
    .INIT_01 ( 256'h4AB56AD5AB54A952A55AB56AD5AA54A952A54AB56AD5AB56AD52A54A952A54A9 ),
    .INIT_02 ( 256'hD52A55AB54A956AD5AA54AB56AD52A55AB56A952A55AB56A952A55AB56AD52A5 ),
    .INIT_03 ( 256'h4AB54AB54AB56A956A956AD52AD5AA55AA54AB54A956AD52AD5AA54AB54A956A ),
    .INIT_04 ( 256'hA954AB54AA55AA552AD52A956A956AB54AB54AB54AB54AB54AB54AB54AB54AB5 ),
    .INIT_05 ( 256'h56AB55AAD54AA552A954AA552A954AA55AAD56AB55AA552A956AB54AA552AD56 ),
    .INIT_06 ( 256'h56AAD54AA955AA955AA955AA955AA955AA955AAD54AAD56AA552AB55AA954AA5 ),
    .INIT_07 ( 256'hB554AAB554AAB554AAB554AA9556AAD55AAA554AA9552AA554AAD55AAB552AA5 ),
    .INIT_08 ( 256'hAAAA5554AAAD555AAA9555AAA9555AAA9555AAAD556AAB555AAAD556AA9554AA ),
    .INIT_09 ( 256'h556AAAA955556AAAA955552AAAB55552AAA95555AAAA55552AAAD5552AAAD555 ),
    .INIT_0A ( 256'h52AAAAAAAB55555556AAAAAAB5555556AAAAAA5555552AAAAA555554AAAAAD55 ),
    .INIT_0B ( 256'h555555555555555AAAAAAAAAAAAAAAAAD555555555555AAAAAAAAAAB55555555 ),
    .INIT_0C ( 256'hAAAAAAAAAAAAAA55555555555555555555555555555555555555555555555555 ),
    .INIT_0D ( 256'hAA5555552AAAAAA55555552AAAAAAA555555555AAAAAAAAAA5555555555552AA ),
    .INIT_0E ( 256'hAA5556AAA95552AAAD5556AAAB5555AAAA955552AAAAD55552AAAA9555552AAA ),
    .INIT_0F ( 256'h55AAB552AA554AA9552AA554AAB554AAB554AAB555AAAD556AAB5552AAB5552A ),
    .INIT_10 ( 256'hAD52AD52AD52AD52A956AB54AA55AAD56AB55AAD56AA552AB55AA955AA955AA9 ),
    .INIT_11 ( 256'h4AD4A95AB52A56AD4A95AB56AD4A952A54A952A54AB56AD52A54AB56A956AD52 ),
    .INIT_12 ( 256'hA5294AD6B5A94A56B5295AD4A56B5295A94AD4AD6A56A56A56A56A56A56A56AD ),
    .INIT_13 ( 256'hA5AD2D694B5A52D694B5AD296B5A5296B5AD294A5296B5AD6B5AD6B5AD6B5AD4 ),
    .INIT_14 ( 256'hD2D25A5A4B4B4B69696969696969696969696969694B4B4B5A5A5AD2D69694B4 ),
    .INIT_15 ( 256'h6DA492DB492DB496DA4B6D25B492DA4B692DA5B496D25A4B496D2DA5B4B49696 ),
    .INIT_16 ( 256'h924924924DB6DB6DB6DB6DB6DB6DB6924924924B6DB6D24925B6DA4925B6D249 ),
    .INIT_17 ( 256'h9B64DB26D926C936C936C936C936D926DB249B6C924DB64926DB6C924936DB6D ),
    .INIT_18 ( 256'h264C993264C9B366C99326CD9366C9B364D9326C9B26C9B26C9B26C9364D926C ),
    .INIT_19 ( 256'h66664CCCC99993332666CCC999B33666CCD99B3266CCD993266CC993366CC993 ),
    .INIT_1A ( 256'h33333319999999CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCD9999999B333332 ),
    .INIT_1B ( 256'h7319CC673398CC673399CCE6733998CCE66333998CCC66633339999CCCCE6666 ),
    .INIT_1C ( 256'hE738C739C6318E739CE318C6318C6318C6339CE7398C6739CC67398C67319CC6 ),
    .INIT_1D ( 256'h71C70E38E31C71C71C71C638E38C71C738E31C738E71C639C738C718E718E718 ),
    .INIT_1E ( 256'hC3C78F1E1C3870E1C38F1E3C70E3C70E3C70E3871C38E3C71C78E38E1C71C71C ),
    .INIT_1F ( 256'h83C1E1F0F8783C3C1E1E0F0F0F0F0787878787870F0F0F0E1E1E3C3C7870F1E1 ),
    .INIT_20 ( 256'h07E07E07E0FC0F81F03E07C0F83F07C1F07C0F83E0F07C1F0783E0F07C3E1F07 ),
    .INIT_21 ( 256'h3FE00FF807FC03FC03FC03FC07F80FE01FC07F01FC07E03F81FC0FC07E07E07E ),
    .INIT_22 ( 256'h00003FFFE0001FFFE0007FFE000FFF8003FF8007FF001FFC00FFE00FFC00FF80 ),
    .INIT_23 ( 256'h00000000000000000000000000000FFFFFFFFFF80000001FFFFFF800001FFFFE ),
    .INIT_24 ( 256'hFFE0001FFFF00003FFFFC000007FFFFFC0000000FFFFFFFFFF80000000000000 ),
    .INIT_25 ( 256'h03FC03FC01FE00FF007FC00FF801FF801FF800FFE001FFC003FFE000FFFC000F ),
    .INIT_26 ( 256'hE07C1F83F07E0FC0F81F81F81F81F81F80FC0FE03F01FC07E03FC07F01FE01FC ),
    .INIT_27 ( 256'h1E1E1E1E1E1E1E1F0F0F8787C3C1E0F0783C1E0F87C1F0F83E0F83E0F83E0F83 ),
    .INIT_28 ( 256'hF1C71E38E1C70E3871E3871E3C70E1C3870E1C3878F0E1C3C387870F0F1E1E1E ),
    .INIT_29 ( 256'h631CE31CE71CE31CE39C738E71C638E71C718E38E38E71C71C71C71C78E38E38 ),
    .INIT_2A ( 256'h99CCC663319CCE63319CC67319CE6339CC6339CE6318C6318C6318C6318E739C ),
    .INIT_2B ( 256'h999933333333333333333333333333339999998CCCCC66663333999CCCE66333 ),
    .INIT_2C ( 256'h364C9B366C993264C993366CC9933664CC99B33666CCC999B33366664CCCC999 ),
    .INIT_2D ( 256'h4924936DB64926DB64936D926DB24DB26D926C93649B26C9364D9364C9B26C99 ),
    .INIT_2E ( 256'hA4B496D25B496D25B496DA496DA496DB4924B6DB692492496DB6DB6DB6DB6D92 ),
    .INIT_2F ( 256'h5AD6B5A5294B5A5296B4B5A52D29696B4B4B4A5A5A5A5A5A5B4B4B49696D2D25 ),
    .INIT_30 ( 256'hA54AB56AD5AB56AD5A952B56A56A54AD4AD4A56A56B5295AD4A5295AD6B5AD6B ),
    .INIT_31 ( 256'hAAB5554AAA9554AAAD552AAD552AA554AAD54AAD54AA552A954AA55AA55AA55A ),
    .INIT_32 ( 256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB5555555554AAAAAAA555554AAAAA55556A ),
    .INIT_33 ( 256'h556AA9556AAB5552AAA5554AAAA55556AAAAB555554AAAAAAB5555555554AAAA ),
    .INIT_34 ( 256'h52B56A54AD5AB56A54AB56AD52A55AA55AA55AAD52A954AAD56AA556AA554AA9 ),
    .INIT_35 ( 256'hA5A52D29694B5A5296B4A5296B5AD6B5AD6B5AD4A52B5AD4AD6A52B52B52B52B ),
    .INIT_36 ( 256'hB4925B6D24B6D25B692DA4B692DA5B49692D2DA5A4B4B4B49696969694B4B4B4 ),
    .INIT_37 ( 256'hD926D936C936C936D924DB64926DB64924936DB6DB6DB6DB6DB6DB6D24924B6D ),
    .INIT_38 ( 256'h333666CCD99B3266CC99B3664C993264C9B366C99364C9B26C9B26C9B26C9B64 ),
    .INIT_39 ( 256'h339998CCCC666673333333999999999999999999999B333333266666CCCC9999 ),
    .INIT_3A ( 256'h9CE718C6318C6318C6318CE7398C67398CE63398CE673198CC6633199CCC6673 ),
    .INIT_3B ( 256'hE38F1C71E38E38E1C71C71C71C738E38E39C71CE38C71CE39C638C738C739C63 ),
    .INIT_3C ( 256'h0F0F07878783C3C3C3C3C787878F0F0E1E3C3870F1E3C78F1E3C70E3C70E3C71 ),
    .INIT_3D ( 256'h7E03F03F03F03F03F03E07C0F81F07E0F83E0F83E0F83E1F0783E1F0F87C3E1E ),
    .INIT_3E ( 256'hFFC003FFC007FF003FF003FF007FC01FF00FF007F80FF00FE03F807F03F80FC0 ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFF0000000000FFFFFFF000001FFFFE00007FFFC0007FFE0007 ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut3  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [2]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [2]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut3_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'hCE63398CE63398CE63319CC67319CC67319CC67319CC67319CC67319CC67319C ),
    .INIT_01 ( 256'hC67319CC673398CE63398CE63399CC67319CC67319CC67319CCE63398CE63398 ),
    .INIT_02 ( 256'h3319CC673398CE63399CC67319CCE63398CE67319CC673198CE63398CE63319C ),
    .INIT_03 ( 256'hC673398CC673198CE67319CCE63399CC663398CC67319CCE63399CC673398CE6 ),
    .INIT_04 ( 256'h673398CC663399CCE633198CE673198CC673398CC673398CC673398CC673398C ),
    .INIT_05 ( 256'hCE673399CCC6633198CC6633198CC663399CCE673399CCE673198CC663319CCE ),
    .INIT_06 ( 256'h3199CCC66733998CC66733998CC66733998CC6633399CCE6633198CC6673399C ),
    .INIT_07 ( 256'h8CCC667333998CCC667333998CCE66333999CCC66733199CCC66333998CCE663 ),
    .INIT_08 ( 256'h66663333999CCCC66673339998CCC6667333999CCCE667333999CCCE66733399 ),
    .INIT_09 ( 256'h33199998CCCCE66667333319998CCCCE666733339999CCCCE66633331999CCCC ),
    .INIT_0A ( 256'hCE66666667333333319999998CCCCCCE666666333333199999CCCCCC66666333 ),
    .INIT_0B ( 256'hCCCCCCCCCCCCCCC66666666666666666333333333333399999999998CCCCCCCC ),
    .INIT_0C ( 256'h66666666666666CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC ),
    .INIT_0D ( 256'h66CCCCCC9999999333333366666666CCCCCCCCC9999999999333333333333666 ),
    .INIT_0E ( 256'h9933326664CCC9999B33326666CCCC9999B3333666664CCCC99999B333336666 ),
    .INIT_0F ( 256'hCC99933666CCD99B33666CCD999332666CCD9993336664CCD9993336666CCC99 ),
    .INIT_10 ( 256'h64C99B3664C99B3664CD993266CC99B3266CC99B3266CC99933664CC99B33664 ),
    .INIT_11 ( 256'h264D9B366C993264D9B366CD9B264C993264C993266CD9B366CD993264CD9B36 ),
    .INIT_12 ( 256'h9364D9B26C9B26CD9364C9B26CD9364C9B264D9B26CD9326CD9326CD9326CD9B ),
    .INIT_13 ( 256'h6C9B64DB26C9364DB26C9B64D936C9B26C9B64D9364D9364D9364D9364D9364D ),
    .INIT_14 ( 256'h49B6C936D926D924DB24DB24DB24DB24DB24DB24DB26D926C936C9B64DB24D92 ),
    .INIT_15 ( 256'h249249B6DB64924DB6D924936DB64926DB64936DB24936D924DB64936D924DB2 ),
    .INIT_16 ( 256'h4924924924924924924924924924924924924926DB6DB6DB6C924924936DB6DB ),
    .INIT_17 ( 256'hB6D2496DB4925B6DA4925B6DA4924B6DB6924925B6DB6D24924925B6DB6DB6DB ),
    .INIT_18 ( 256'h92DA4B692DA496D25B496DA4B6D25B692DB496DA496DA496DA496DA492DB4925 ),
    .INIT_19 ( 256'hD2D2DA5A5B4B49696D2DA5A4B49692D25A4B49692DA5B4B692DA5B496D25A4B6 ),
    .INIT_1A ( 256'h969696B4B4B4B4A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A4B4B4B4B6969696 ),
    .INIT_1B ( 256'hD6B4A52D694A5AD296B4A5AD296B4A5A52D696B4A5A52D29696B4B4A5A5AD2D2 ),
    .INIT_1C ( 256'h5295AD6B5294A5294A56B5AD6B5AD6B5AD694A5294A52D6B5AD294A52D6B4A52 ),
    .INIT_1D ( 256'h2B52A56A56B52B52B52B5295A95AD4AD6A56B5295AD4AD6B5295AD4A52B5AD4A ),
    .INIT_1E ( 256'h56AD5AB54A952A54A95AB56AD5A952A56AD5A952B56A56AD4AD5A95AB52B52B5 ),
    .INIT_1F ( 256'h56AB54AA552A956AB54AA55AA55AAD52AD52AD52A55AA55AB54A956AD52A54AB ),
    .INIT_20 ( 256'hAD552AAD55AAA554AA9552AA556AAD54AAD55AA955AAD54AAD56AA552A954AAD ),
    .INIT_21 ( 256'h95555AAAAD5556AAA95556AAAD555AAAB5552AAB5552AA9554AAA5552AAD552A ),
    .INIT_22 ( 256'hAAAA955555554AAAAAAAD555555AAAAAA9555552AAAAB55555AAAAA55555AAAA ),
    .INIT_23 ( 256'h55555555555555555555555555555AAAAAAAAAAAAAAAAAB555555555554AAAAA ),
    .INIT_24 ( 256'hAAB55555555AAAAAAAAA9555555555556AAAAAAAAAAAAAAAAAD5555555555555 ),
    .INIT_25 ( 256'hAAA95556AAAB5555AAAA955552AAAAD55552AAAAB555556AAAAAB5555556AAAA ),
    .INIT_26 ( 256'h4AA9552AA554AA9552AAD552AAD552AAD556AAB555AAA9554AAA9555AAAB5556 ),
    .INIT_27 ( 256'h54AB54AB54AB54AA55AAD52A956AB55AAD56AB552A955AAD54AAD54AAD54AAD5 ),
    .INIT_28 ( 256'hA56A54AD4A95AB52A54AD5AB56A54A952A54A952AD5AB56A952AD5AA55AB54AB ),
    .INIT_29 ( 256'h4A56B5A94A56B5A94AD6A52B5A94AD4A56A52B52B52B5A95A95A95A952B52B52 ),
    .INIT_2A ( 256'h2D696B4A5AD694B5A5296B5A5294B5AD694A5294B5AD6B5AD6B5AD6B5AD4A529 ),
    .INIT_2B ( 256'h2D2DA5A5A5A5A5A5A5A5A5A5A5A5A5A52D2D2D2969694B4B5A5AD2D696B4B5A5 ),
    .INIT_2C ( 256'h5B692DA4B6D25B496D25A4B692DA5B49692D25A4B49692D2DA5A4B4B69696D2D ),
    .INIT_2D ( 256'h6DB6DA4924924B6DB6DA4924B6DB6924B6DB4925B6D24B6DA496DA496D24B6D2 ),
    .INIT_2E ( 256'hC926DB64926DB64926DB6C924936DB6D924924924DB6DB6DB6DB6DB6DB6DB6DB ),
    .INIT_2F ( 256'h6C9B26C9B26D9364DB26D93649B24DB26D926C936C936C936D926D924DB649B6 ),
    .INIT_30 ( 256'hC993264C993264C993264D9B364C99366C99364C9B264D9366C9B26C9B26C9B2 ),
    .INIT_31 ( 256'hCCD99993332666CCC999B336664CC99933666CC99933664CD993366CC993366C ),
    .INIT_32 ( 256'h3333333333333333333333333333326666666666CCCCCCC9999993333366664C ),
    .INIT_33 ( 256'h667331998CCC66633339998CCCC6666733333999998CCCCCCC66666666673333 ),
    .INIT_34 ( 256'h63398C67319CC67398CC67319CC663399CC663319CCE6733198CC66733998CCE ),
    .INIT_35 ( 256'h39C631CE718C639CE738C6318C6318C6318C6318C6339CE7318C6339CC6339CC ),
    .INIT_36 ( 256'hC71C638E38C71C638E31C738E31C638E71CE31C638C738C718E718E718C738C7 ),
    .INIT_37 ( 256'h1E38E1C70E38F1C71E38E3871C71C78E38E38E38E38E38E38E38E38E38E38C71 ),
    .INIT_38 ( 256'h3C3878F0E1E3C3870F1E3C7870E1C3870E3C78F1E3870E3C70E3C70E3C70E387 ),
    .INIT_39 ( 256'h3C1E1F0F0F878783C3C3C3E1E1E1E1E1E1E1E1E1E1E3C3C3C3C787870F0F1E1E ),
    .INIT_3A ( 256'h1F07E0F83E0F83E0F83E0F07C1F0783E0F07C3E0F0783E1F0F87C3E1E0F0787C ),
    .INIT_3B ( 256'h03F01F81FC0FC0FE07E07E07E07C0FC0FC1F81F03F07E0FC1F83F07C0F83E07C ),
    .INIT_3C ( 256'hF00FF807F803FC03FC03F807F80FF00FE03FC07F01FC07F01FC07F03F80FC07E ),
    .INIT_3D ( 256'h7FFC003FFC003FFC003FF800FFE007FF003FF003FF003FE007FC01FF007FC01F ),
    .INIT_3E ( 256'h000003FFFFF800003FFFFC00007FFFE0000FFFF8000FFFF0003FFF8003FFF000 ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000001FFFFFFFFF800000007FFFFFF8 ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut4  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [3]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [3]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut4_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'h6B4A52D6B4A52D6B4A5AD694A5AD694A5AD694A5AD694A5AD694A5AD694A5AD6 ),
    .INIT_01 ( 256'h94A5AD694A5AD294B5AD294B5AD296B5A5296B5A5296B5A5296B4A52D6B4A52D ),
    .INIT_02 ( 256'h5A5296B5A52D6B4A52D694A5AD694B5AD294B5A5296B5A52D6B4A52D6B4A5AD6 ),
    .INIT_03 ( 256'h6B5A52D694A5AD294B5A5296B4A52D694B5AD296B5A5296B4A52D694A5AD294B ),
    .INIT_04 ( 256'h4A5AD296B4A52D694B5A52D6B4A5AD296B5A52D694A5AD296B5A52D694A5AD29 ),
    .INIT_05 ( 256'h94B5A52D696B4A5AD296B4A5AD296B4A52D694B5A52D694B5A52D694B5A5296B ),
    .INIT_06 ( 256'h5AD29694B5A52D296B4A5AD2D694B5A52D296B4A5AD296B4B5A52D694B5A52D6 ),
    .INIT_07 ( 256'hD696B4A5A52D29694B5A5AD2D694B4A5AD2D696B4A5A52D696B4A5AD2D694B4A ),
    .INIT_08 ( 256'h4B4B5A5AD2D69694B4A5A52D2D696B4B5A5AD2D696B4B5A5AD2D696B4B5A5AD2 ),
    .INIT_09 ( 256'h5A52D2D29696B4B4B5A5A5AD2D29696B4B4A5A5AD2D29696B4B4A5A5AD2D6969 ),
    .INIT_0A ( 256'h6B4B4B4B4A5A5A5A5AD2D2D2D6969694B4B4B4A5A5A5AD2D2D6969694B4B4A5A ),
    .INIT_0B ( 256'h9696969696969694B4B4B4B4B4B4B4B4A5A5A5A5A5A5AD2D2D2D2D2D69696969 ),
    .INIT_0C ( 256'hB4B4B4B4B4B4B496969696969696969696969696969696969696969696969696 ),
    .INIT_0D ( 256'hB4969696D2D2D2DA5A5A5A4B4B4B4B696969696D2D2D2D2D25A5A5A5A5A5A4B4 ),
    .INIT_0E ( 256'hD25A5B4B49696D2D2DA5A4B4B49696D2D2DA5A5B4B4B69696D2D2D25A5A5B4B4 ),
    .INIT_0F ( 256'h692D25A4B49692D25A4B49692D25A4B4B696D2DA5A4B49696D2DA5A4B4B696D2 ),
    .INIT_10 ( 256'hB692D25B496D2DA4B696D25B4B692D25B4B692D25B4B692D25A4B696D2DA5B49 ),
    .INIT_11 ( 256'h4B692DA4B6D25B496D25B496D24B692DA4B692DA4B496D25B496D25B49692DA4 ),
    .INIT_12 ( 256'h25B692DB492DB496DA496D24B6925B692DB496D24B6925B496DA4B6925B496D2 ),
    .INIT_13 ( 256'hB6D2496DB4925B6924B6D2496DA492DB492DB6925B6925B6925B6925B6925B69 ),
    .INIT_14 ( 256'h92DB6DA4924B6DB692496DB692496DB692496DB6924B6DB4925B6D2496DB6924 ),
    .INIT_15 ( 256'hB6DB6D2492492496DB6DB6DA4924924B6DB6DA4924925B6DB6924925B6DB6924 ),
    .INIT_16 ( 256'h6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB4924924924924924925B6DB6D ),
    .INIT_17 ( 256'h249B6DB6D924924936DB6DB6C924924924DB6DB6DB6DB6492492492492492492 ),
    .INIT_18 ( 256'h24936DB24936DB64926DB6C9249B6DB24926DB6C924936DB6C924936DB6D9249 ),
    .INIT_19 ( 256'h9B64936C926D924DB64936C926DB249B6C926DB24936D924DB6C926DB64936DB ),
    .INIT_1A ( 256'hDB24DB26D926D936C936C936C936C936C936C936C936C936C926D926DB24DB24 ),
    .INIT_1B ( 256'h64D93649B26C9364DB26C9364DB26C93649B24D936C9B64DB24D926C936C9B64 ),
    .INIT_1C ( 256'h64D9364D9B26C9B26C9B26C9B26C9B26C9B26C9B26C9B64D9364D93649B26C9B ),
    .INIT_1D ( 256'hB264C9B364D9B264D9B264D9326C99364C9B264D9366C9B264D9366C9B26C993 ),
    .INIT_1E ( 256'h64C993266CD9B366CD93264C993264C9B366CD9B264C9B366C99326CD9B264D9 ),
    .INIT_1F ( 256'h64CD9933664CD9B3266CC993366CC99B3664C99B366CC993266CD9B3664C9932 ),
    .INIT_20 ( 256'h36664CC999333666CCD99B33664CC99933666CCD9933666CC99B33664CD99336 ),
    .INIT_21 ( 256'hD9999333366664CCCD999B3336666CCCD999B3326664CCD9993336664CC999B3 ),
    .INIT_22 ( 256'h3333266666666CCCCCCC99999993333332666664CCCCD999993333366666CCCC ),
    .INIT_23 ( 256'h66666666666666666666666666666CCCCCCCCCCCCCCCCCD99999999999933333 ),
    .INIT_24 ( 256'hCCC666666663333333331999999999998CCCCCCCCCCCCCCCCCE6666666666666 ),
    .INIT_25 ( 256'hCCCE666733339999CCCCE66663333319999CCCCCC6666673333339999998CCCC ),
    .INIT_26 ( 256'h8CCE66333998CCE66333199CCCE663331998CCC6663331998CCCE66633339998 ),
    .INIT_27 ( 256'h98CC673398CC673399CCE633198CC6633198CC6633199CCE6733198CCE673319 ),
    .INIT_28 ( 256'h398C67318CE6339CC67319CC67398CE63398CE63319CC67319CCE63399CC6733 ),
    .INIT_29 ( 256'h7398C6318C6739CE7318C6339CE7318C6739CC6339CC6319CE6319CE6339CC63 ),
    .INIT_2A ( 256'hCE718C739CE718C639CE739C6318C6318E739CE739CE739CE739CE739CE739CE ),
    .INIT_2B ( 256'h31CE39C639C639C639C639C639C639C631CE31CE718E738C639CE318E738C639 ),
    .INIT_2C ( 256'h9C71CE38C71C638E71C638C71CE39C718E31C638C718E31CE39C738C718E71CE ),
    .INIT_2D ( 256'h8E38E38E38E38C71C71C71C738E38E38C71C71C638E38C71C718E38E71C738E3 ),
    .INIT_2E ( 256'h0E38E3871C71C78E38E38F1C71C71C71E38E38E38E38E38E38E38E38E38E38E3 ),
    .INIT_2F ( 256'h70E3C70E3C71E3871C38E1C78E3C71C38E1C70E38F1C70E38E1C71E38E3871C7 ),
    .INIT_30 ( 256'h0E1C3870E1C3870E1C3871E3C78F1E3870E1C78F1C3871E3870E3C70E3C70E3C ),
    .INIT_31 ( 256'h0F1E1E1C3C3878F0F1E1C3C7878F0E1E3C7870F1E1C3878F1E1C3870F1E3C78F ),
    .INIT_32 ( 256'h3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C7878787878F0F0F0F1E1E1E3C3C387878F ),
    .INIT_33 ( 256'h8783C1E1F0F0787C3C3E1E0F0F078787C3C3C1E1E1F0F0F0F078787878783C3C ),
    .INIT_34 ( 256'h83C1F0783E1F0783E0F0783E1F0783C1E0F87C3E1F0F87C3E1F0F8783C1E0F0F ),
    .INIT_35 ( 256'h3E07C1F07E0F83E0F83F07C1F07C1F07C1F07C1F07C3E0F83E0F83C1F07C3E0F ),
    .INIT_36 ( 256'h07E07C0FC0F81F83F03E07C0FC1F83F07E0FC1F83F07C0F81F07E0F81F07C0F8 ),
    .INIT_37 ( 256'h1FC0FE07F03F01F81FC0FC07E07E07F03F03F03F03F03F03F03F03F03F03F07E ),
    .INIT_38 ( 256'hC03F80FF01FC03F80FE03F807F01FC07F03F80FE03F80FC07F03F80FC07F03F8 ),
    .INIT_39 ( 256'hC01FE00FF007F803FC03FC01FE01FE01FE01FE01FE03FC03FC07F807F00FE01F ),
    .INIT_3A ( 256'h1FF800FFC00FFC00FFC00FF801FF803FF007FC00FF803FE00FF803FE00FF807F ),
    .INIT_3B ( 256'h03FFE001FFF000FFF8007FF8007FF000FFE001FFC007FF001FFC007FF003FF80 ),
    .INIT_3C ( 256'hFFF00007FFFC0003FFFC0007FFF0000FFFC0007FFE0007FFE0007FFC000FFF80 ),
    .INIT_3D ( 256'h7FFFFFC000003FFFFFC00000FFFFF800003FFFFC00003FFFF80001FFFF80001F ),
    .INIT_3E ( 256'hFFFFFC00000000003FFFFFFFFF800000000FFFFFFFF00000003FFFFFFC000000 ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE000000000000000007FFFFFFF ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut5  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [4]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [4]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut5_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'h738C6318C739CE738C6318E739CE718C6318E739CE718C6318E739CE718C6318 ),
    .INIT_01 ( 256'h18C6318E739CE318C631CE739CE318C639CE739C6318C639CE738C6318C739CE ),
    .INIT_02 ( 256'h9C6318C639CE738C6318E739CE718C631CE739C6318C639CE738C6318C739CE7 ),
    .INIT_03 ( 256'h8C639CE718C631CE739C6318C739CE718C631CE739C6318C739CE718C631CE73 ),
    .INIT_04 ( 256'h8C631CE738C6318E739C6318C739CE318C639CE718C631CE739C6318E739CE31 ),
    .INIT_05 ( 256'h18C639CE718C739CE318C739CE318C739CE718C639CE718C639CE718C639CE73 ),
    .INIT_06 ( 256'h631CE718C639CE318C739CE318E739C631CE738C631CE738C639CE718C639CE7 ),
    .INIT_07 ( 256'h18E738C639CE318E739C631CE718C739CE318E738C639CE718C739CE318E738C ),
    .INIT_08 ( 256'h8C739C631CE718E738C639CE318E738C639CE318E738C639CE318E738C639CE3 ),
    .INIT_09 ( 256'h9C631CE318E738C739C639CE31CE718C738C639CE31CE718C738C639CE318E71 ),
    .INIT_0A ( 256'h738C738C739C639C631CE31CE718E718C738C739C639CE31CE718E718C738C63 ),
    .INIT_0B ( 256'h18E718E718E718E738C738C738C738C739C639C639C631CE31CE31CE718E718E ),
    .INIT_0C ( 256'h38C738C738C738E718E718E718E718E718E718E718E718E718E718E718E718E7 ),
    .INIT_0D ( 256'hC718E718E31CE31C639C638C738C738E718E718E31CE31CE39C639C639C638C7 ),
    .INIT_0E ( 256'hE39C638C718E71CE31C638C738E718E31CE39C638C738E718E31CE39C639C738 ),
    .INIT_0F ( 256'h8E31C638C718E31C638C718E31C638C738E71CE39C738E718E31C638C738E71C ),
    .INIT_10 ( 256'hC71CE39C718E31C738E71C638C71CE39C738E31C638C71CE39C738E71CE39C71 ),
    .INIT_11 ( 256'h8C71CE38C71C638E71C638E71C738E31C738E31C738E71C638E71C638E71CE38 ),
    .INIT_12 ( 256'hC638E31C71CE38E71C718E38C71C638E31C718E38C71C638E71C738E39C718E3 ),
    .INIT_13 ( 256'h38E38E71C71C638E38C71C718E38E31C71CE38E39C71C638E39C71C638E39C71 ),
    .INIT_14 ( 256'h1CE38E38E38C71C71C718E38E38E71C71C718E38E38C71C71C638E38E71C71C7 ),
    .INIT_15 ( 256'hC71C71C71C71C718E38E38E38E38E38C71C71C71C71C638E38E38E39C71C71C7 ),
    .INIT_16 ( 256'h8E38E38E38E38E38E38E38E38E38E38E38E38E38E38E38E38E38E38E39C71C71 ),
    .INIT_17 ( 256'hC71C71C71E38E38E38E38E38F1C71C71C71C71C71C71C78E38E38E38E38E38E3 ),
    .INIT_18 ( 256'h38E38E3C71C71C78E38E38F1C71C71C38E38E38F1C71C71C70E38E38E38E1C71 ),
    .INIT_19 ( 256'hE3871C70E38E1C71C78E38F1C71C38E38F1C71C38E38E1C71C70E38E3871C71C ),
    .INIT_1A ( 256'hE3C71C38E1C71E38F1C70E38F1C70E38F1C70E38F1C70E38F1C71E38E3C71C38 ),
    .INIT_1B ( 256'h78E1C78E3C70E3871C38F1C78E3C70E3871C38E1C70E3871C38E1C70E38F1C78 ),
    .INIT_1C ( 256'h871E3871E3C70E3C70E3C70E3C70E3C70E3C70E3C70E3871E3871E3871C38F1C ),
    .INIT_1D ( 256'h3C78F1C3871E3C78E1C3871E3C70E1C78F1C3871E3870E3C78E1C78F1C38F1E3 ),
    .INIT_1E ( 256'h78F1E3C78F1E3C78F1E3C78F1E3C78F1C3870E1C3870E3C78F1E3C70E1C3871E ),
    .INIT_1F ( 256'h78F1E1C3878F1E3C3870F1E3C78F0E1C3878F1E3C78F0E1C3870E1C3878F1E3C ),
    .INIT_20 ( 256'h387870F1E1C3C7870F1E1C3C7870F1E1C3878F0E1E3C7870F1E3C3878F1E1C38 ),
    .INIT_21 ( 256'h1E1E1C3C387878F0F1E1E3C3C7878F0F1E1E3C3C7878F0E1E1C3C7878F0E1E3C ),
    .INIT_22 ( 256'hC3C3C78787878F0F0F0F1E1E1E1C3C3C3C787878F0F0E1E1E1C3C3C787870F0F ),
    .INIT_23 ( 256'h787878787878787878787878787870F0F0F0F0F0F0F0F0E1E1E1E1E1E1E3C3C3 ),
    .INIT_24 ( 256'h0F0787878783C3C3C3C3E1E1E1E1E1E1F0F0F0F0F0F0F0F0F0F8787878787878 ),
    .INIT_25 ( 256'hF0F078783C3C1E1E0F0F078783C3C3E1E1E0F0F0F878787C3C3C3E1E1E1F0F0F ),
    .INIT_26 ( 256'h0F0F87C3C1E0F0F87C3C1E1F0F0783C3E1E0F0F8783C3E1E0F0F0787C3C3E1E0 ),
    .INIT_27 ( 256'hE0F0783C1F0F87C3E1F0F83C1E0F0783C1E0F0783C1E1F0F87C3E1F0F0783C1E ),
    .INIT_28 ( 256'h3E0F87C1F0F83C1F0783E1F0783E0F07C3E0F07C3E1F0783E1F0F83C1E0F87C3 ),
    .INIT_29 ( 256'h83E0F83E0F87C1F07C1F07C3E0F83E0F87C1F07C3E0F83E1F07C1E0F83C1F07C ),
    .INIT_2A ( 256'hF07E0F83E0F81F07C1F07C1F83E0F83E0F83E0F83E0F83E0F83E0F83E0F83E0F ),
    .INIT_2B ( 256'h3E0FC1F83E07C1F83E07C1F83E07C1F83E0FC1F07E0F83F07C1F03E0F83F07C1 ),
    .INIT_2C ( 256'h1F81F03F07E07C0F81F83F07E0FC1F81F03E07C0F81F03E0FC1F83F07E0F81F0 ),
    .INIT_2D ( 256'h0FC0FC0FC0FC0F81F81F81F83F03F03F07E07E07C0FC0F81F81F03F07E07C0FC ),
    .INIT_2E ( 256'h0FC0FC07E07E07F03F03F01F81F81F81FC0FC0FC0FC0FC0FC0FC0FC0FC0FC0FC ),
    .INIT_2F ( 256'h7F03F80FC07E03F81FC0FE07F03F81FC0FE07F03F01F80FC0FE07E03F03F81F8 ),
    .INIT_30 ( 256'hF01FC07F01FC07F01FC07E03F80FE03F80FE07F01FC07E03F80FC07F03F80FC0 ),
    .INIT_31 ( 256'h0FE01FE03FC07F00FE01FC07F80FF01FC07F80FE01FC07F01FE03F80FE03F80F ),
    .INIT_32 ( 256'hC03FC03FC03FC03FC03FC03FC03FC07F807F807F00FF00FE01FE03FC03F807F0 ),
    .INIT_33 ( 256'hF803FE01FF007F803FC01FF00FF807F803FC01FE01FF00FF007F807F807FC03F ),
    .INIT_34 ( 256'hFC01FF803FE007FC00FF803FE007FC01FF007FC01FF007FC01FF007FC01FF00F ),
    .INIT_35 ( 256'hC007FE007FF003FF003FF801FF801FF801FF801FF803FF003FF003FE007FC00F ),
    .INIT_36 ( 256'h07FF800FFF001FFC003FF800FFE003FF800FFE003FF800FFE007FF001FF800FF ),
    .INIT_37 ( 256'hE000FFF8003FFE001FFF0007FF8007FFC003FFC003FFC003FFC003FFC003FF80 ),
    .INIT_38 ( 256'hFFC000FFFE0003FFF0003FFF8001FFF8003FFF0003FFF0007FFC000FFF8003FF ),
    .INIT_39 ( 256'hFFE0000FFFF80003FFFC0001FFFE0001FFFE0001FFFC0003FFF80007FFF0001F ),
    .INIT_3A ( 256'hE00000FFFFF00000FFFFF00001FFFFC00007FFFF00003FFFF00003FFFF00007F ),
    .INIT_3B ( 256'h03FFFFFE000000FFFFFF8000007FFFFF000001FFFFF800001FFFFF800003FFFF ),
    .INIT_3C ( 256'h00000007FFFFFFFC00000007FFFFFFF00000007FFFFFF80000007FFFFFF00000 ),
    .INIT_3D ( 256'h8000000000003FFFFFFFFFFF00000000003FFFFFFFFFC000000001FFFFFFFFE0 ),
    .INIT_3E ( 256'h00000000000000003FFFFFFFFFFFFFFFFFF0000000000000003FFFFFFFFFFFFF ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80000000 ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut6  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [5]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [5]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut6_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'h7C0F83E0F83E0F83F07C1F07C1F07E0F83E0F83E0F81F07C1F07C1F07E0F83E0 ),
    .INIT_01 ( 256'h1F07C1F07C1F03E0F83E0F83E0FC1F07C1F07C1F83E0F83E0F83F07C1F07C1F0 ),
    .INIT_02 ( 256'h1F83E0F83E0F83F07C1F07C1F07E0F83E0F83E07C1F07C1F07C0F83E0F83E0F8 ),
    .INIT_03 ( 256'h0F83E0F81F07C1F07C1F83E0F83E0F81F07C1F07C1F83E0F83E0F81F07C1F07C ),
    .INIT_04 ( 256'h0F83E0F83F07C1F07C1F83E0F83E0FC1F07C1F07E0F83E0F83E07C1F07C1F03E ),
    .INIT_05 ( 256'h1F07C1F07E0F83E0FC1F07C1F03E0F83E0F81F07C1F07E0F83E0F81F07C1F07C ),
    .INIT_06 ( 256'h7C1F07E0F83E0FC1F07C1F03E0F83E07C1F07C0F83E0F83F07C1F07E0F83E0F8 ),
    .INIT_07 ( 256'hE0F83F07C1F03E0F83E07C1F07E0F83E0FC1F07C0F83E0F81F07C1F03E0F83F0 ),
    .INIT_08 ( 256'h0F83E07C1F07E0F83F07C1F03E0F83F07C1F03E0F83F07C1F03E0F83F07C1F03 ),
    .INIT_09 ( 256'hE07C1F03E0F83F07C1F83E0FC1F07E0F83F07C1F03E0F81F07C0F83E0FC1F07E ),
    .INIT_0A ( 256'h7C0F83F07C1F83E07C1F03E0F81F07E0F83F07C1F83E0FC1F07E0F81F07C0F83 ),
    .INIT_0B ( 256'h1F07E0F81F07E0F83F07C0F83F07C0F83E07C1F83E07C1F03E0FC1F07E0F81F0 ),
    .INIT_0C ( 256'h3F07C0F83F07C0F81F07E0F81F07E0F81F07E0F81F07E0F81F07E0F81F07E0F8 ),
    .INIT_0D ( 256'hF81F07E0FC1F03E07C1F83F07C0F83F07E0F81F03E0FC1F03E07C1F83E07C0F8 ),
    .INIT_0E ( 256'h03E07C0F81F07E0FC1F83F07C0F81F03E0FC1F83F07C0F81F03E0FC1F83E07C0 ),
    .INIT_0F ( 256'hF03E07C0F81F03E07C0F81F03E07C0F83F07E0FC1F83F07E0FC1F83F07C0F81F ),
    .INIT_10 ( 256'hF81F03E07E0FC1F83F07E07C0F81F03E07C0FC1F83F07E0FC1F83F07E0FC1F81 ),
    .INIT_11 ( 256'hF07E0FC0F81F83F07E07C0F81F83F03E07C0FC1F83F07E07C0F81F83F07E0FC0 ),
    .INIT_12 ( 256'h07C0FC1F81F03F07E07E0FC0F81F83F03E07E0FC0F81F83F07E07C0FC1F81F03 ),
    .INIT_13 ( 256'hC0FC0F81F81F83F03F07E07E0FC0FC1F81F03F03E07E07C0FC1F81F83F03E07E ),
    .INIT_14 ( 256'hE0FC0FC0FC0F81F81F81F03F03F07E07E07E0FC0FC0F81F81F83F03F07E07E07 ),
    .INIT_15 ( 256'h07E07E07E07E07E0FC0FC0FC0FC0FC0F81F81F81F81F83F03F03F03E07E07E07 ),
    .INIT_16 ( 256'hF03F03F03F03F03F03F03F03F03F03F03F03F03F03F03F03F03F03F03E07E07E ),
    .INIT_17 ( 256'hF81F81F81FC0FC0FC0FC0FC0FE07E07E07E07E07E07E07F03F03F03F03F03F03 ),
    .INIT_18 ( 256'hC0FC0FC07E07E07F03F03F01F81F81FC0FC0FC0FE07E07E07F03F03F03F01F81 ),
    .INIT_19 ( 256'hFC07E07F03F01F81F80FC0FE07E03F03F01F81FC0FC0FE07E07F03F03F81F81F ),
    .INIT_1A ( 256'hFC07E03F01F81FC0FE07F03F01F80FC0FE07F03F01F80FC0FE07E03F03F81FC0 ),
    .INIT_1B ( 256'h80FE07F03F80FC07E03F01F80FC07F03F81FC0FE07F03F81FC0FE07F03F01F80 ),
    .INIT_1C ( 256'hF81FC07E03F80FC07F03F80FC07F03F80FC07F03F80FC07E03F81FC07E03F01F ),
    .INIT_1D ( 256'hC07F01FC07E03F80FE03F81FC07F01F80FE03F81FC07F03F80FE07F01FC0FE03 ),
    .INIT_1E ( 256'h7F01FC07F01FC07F01FC07F01FC07F01FC07F01FC07F03F80FE03F80FE03F81F ),
    .INIT_1F ( 256'h7F01FE03F80FE03FC07F01FC07F00FE03F80FE03F80FF01FC07F01FC07F01FC0 ),
    .INIT_20 ( 256'hC07F80FE01FC07F80FE01FC07F80FE01FC07F00FE03F807F01FC03F80FE01FC0 ),
    .INIT_21 ( 256'hE01FE03FC07F80FF01FE03FC07F80FF01FE03FC07F80FF01FE03F807F00FE03F ),
    .INIT_22 ( 256'h03FC07F807F80FF00FF01FE01FE03FC03F807F80FF00FE01FE03FC07F807F00F ),
    .INIT_23 ( 256'h807F807F807F807F807F807F807F80FF00FF00FF00FF00FE01FE01FE01FC03FC ),
    .INIT_24 ( 256'h0FF807F807FC03FC03FC01FE01FE01FE00FF00FF00FF00FF00FF807F807F807F ),
    .INIT_25 ( 256'h00FF807FC03FE01FF00FF807FC03FC01FE00FF00FF807F803FC03FE01FE00FF0 ),
    .INIT_26 ( 256'h0FF007FC01FF00FF803FE01FF007FC03FE00FF007FC03FE00FF007F803FC01FF ),
    .INIT_27 ( 256'h00FF803FE00FF803FE00FFC01FF007FC01FF007FC01FE00FF803FE00FF803FE0 ),
    .INIT_28 ( 256'h3FF007FE00FFC01FF803FE007FC00FF803FF007FC01FF803FE00FFC01FF007FC ),
    .INIT_29 ( 256'h03FF003FF007FE007FE007FC00FFC00FF801FF803FF003FE007FE00FFC01FF80 ),
    .INIT_2A ( 256'hFF800FFC00FFE007FE007FE003FF003FF003FF003FF003FF003FF003FF003FF0 ),
    .INIT_2B ( 256'h3FF001FFC007FE003FF801FFC007FE003FF001FF800FFC007FE003FF003FF801 ),
    .INIT_2C ( 256'hE001FFC007FF800FFE003FF800FFE001FFC007FF001FFC00FFE003FF800FFE00 ),
    .INIT_2D ( 256'hF000FFF000FFF001FFE001FFC003FFC007FF8007FF000FFE001FFC007FF800FF ),
    .INIT_2E ( 256'h0FFF0007FF8007FFC003FFE001FFE001FFF000FFF000FFF000FFF000FFF000FF ),
    .INIT_2F ( 256'h7FFC000FFF8003FFE000FFF8003FFE000FFF8003FFE000FFF0007FFC003FFE00 ),
    .INIT_30 ( 256'h001FFF8001FFF8001FFF8003FFF0003FFF0007FFE0007FFC000FFF8003FFF000 ),
    .INIT_31 ( 256'h0FFFE0003FFF8000FFFE0007FFF0001FFF8000FFFE0007FFE0003FFF0003FFF0 ),
    .INIT_32 ( 256'h003FFFC0003FFFC0003FFFC0003FFF80007FFF8000FFFF0001FFFC0003FFF800 ),
    .INIT_33 ( 256'hFFFC0001FFFF80003FFFE0000FFFF80003FFFE0001FFFF00007FFF80007FFFC0 ),
    .INIT_34 ( 256'hFFFE00003FFFF80000FFFFC00007FFFE00007FFFE00007FFFE00007FFFE0000F ),
    .INIT_35 ( 256'h0007FFFF800003FFFFC00001FFFFE00001FFFFE00003FFFFC00003FFFF80000F ),
    .INIT_36 ( 256'h07FFFFF000001FFFFFC00000FFFFFC00000FFFFFC00000FFFFF800001FFFFF00 ),
    .INIT_37 ( 256'h0000FFFFFFC000001FFFFFF8000007FFFFFC000003FFFFFC000003FFFFFC0000 ),
    .INIT_38 ( 256'hFFFFFF00000003FFFFFFC0000001FFFFFFC0000003FFFFFF8000000FFFFFFC00 ),
    .INIT_39 ( 256'hFFFFFFF000000003FFFFFFFE00000001FFFFFFFE00000003FFFFFFF80000001F ),
    .INIT_3A ( 256'h000000FFFFFFFFFF0000000001FFFFFFFFF8000000003FFFFFFFFC000000007F ),
    .INIT_3B ( 256'h03FFFFFFFFFFFF0000000000007FFFFFFFFFFE00000000001FFFFFFFFFFC0000 ),
    .INIT_3C ( 256'h00000007FFFFFFFFFFFFFFF8000000000000007FFFFFFFFFFFFF800000000000 ),
    .INIT_3D ( 256'hFFFFFFFFFFFFC0000000000000000000003FFFFFFFFFFFFFFFFFFE0000000000 ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFFFC0000000000000000000000000000000003FFFFFFFFFFFFF ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut7  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [6]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [6]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut7_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'h800FFC00FFC00FFC007FE007FE007FF003FF003FF001FF801FF801FF800FFC00 ),
    .INIT_01 ( 256'h1FF801FF801FFC00FFC00FFC00FFE007FE007FE003FF003FF003FF801FF801FF ),
    .INIT_02 ( 256'hE003FF003FF003FF801FF801FF800FFC00FFC007FE007FE007FF003FF003FF00 ),
    .INIT_03 ( 256'h0FFC00FFE007FE007FE003FF003FF001FF801FF801FFC00FFC00FFE007FE007F ),
    .INIT_04 ( 256'hF003FF003FF801FF801FFC00FFC00FFE007FE007FF003FF003FF801FF801FFC0 ),
    .INIT_05 ( 256'h1FF801FF800FFC00FFE007FE003FF003FF001FF801FF800FFC00FFE007FE007F ),
    .INIT_06 ( 256'h801FF800FFC00FFE007FE003FF003FF801FF800FFC00FFC007FE007FF003FF00 ),
    .INIT_07 ( 256'hFF003FF801FFC00FFC007FE007FF003FF001FF800FFC00FFE007FE003FF003FF ),
    .INIT_08 ( 256'h0FFC007FE007FF003FF801FFC00FFC007FE003FF003FF801FFC00FFC007FE003 ),
    .INIT_09 ( 256'h007FE003FF003FF801FFC00FFE007FF003FF801FFC00FFE007FF003FF001FF80 ),
    .INIT_0A ( 256'h800FFC007FE003FF801FFC00FFE007FF003FF801FFC00FFE007FF001FF800FFC ),
    .INIT_0B ( 256'hE007FF001FF800FFC007FF003FF800FFC007FE003FF801FFC00FFE007FF001FF ),
    .INIT_0C ( 256'hC007FF003FF800FFE007FF001FF800FFE007FF001FF800FFE007FF001FF800FF ),
    .INIT_0D ( 256'h001FF800FFE003FF801FFC007FF003FF800FFE003FF001FFC007FE003FF800FF ),
    .INIT_0E ( 256'h03FF800FFE007FF001FFC007FF001FFC00FFE003FF800FFE003FF001FFC007FF ),
    .INIT_0F ( 256'hFFC007FF001FFC007FF001FFC007FF003FF800FFE003FF800FFE003FF800FFE0 ),
    .INIT_10 ( 256'h001FFC007FF001FFC007FF800FFE003FF800FFE003FF800FFE003FF800FFE001 ),
    .INIT_11 ( 256'hFF800FFF001FFC007FF800FFE003FFC007FF001FFC007FF800FFE003FF800FFF ),
    .INIT_12 ( 256'h07FF001FFE003FF8007FF000FFE003FFC007FF000FFE003FF8007FF001FFE003 ),
    .INIT_13 ( 256'h00FFF001FFE003FFC007FF800FFF001FFE003FFC007FF800FFE001FFC003FF80 ),
    .INIT_14 ( 256'h00FFF000FFF001FFE001FFC003FF8007FF800FFF000FFE001FFC003FF8007FF8 ),
    .INIT_15 ( 256'h07FF8007FF8007FF000FFF000FFF000FFE001FFE001FFC003FFC003FF8007FF8 ),
    .INIT_16 ( 256'hFFC003FFC003FFC003FFC003FFC003FFC003FFC003FFC003FFC003FFC007FF80 ),
    .INIT_17 ( 256'h001FFE001FFF000FFF000FFF0007FF8007FF8007FF8007FFC003FFC003FFC003 ),
    .INIT_18 ( 256'hFF000FFF8007FF8003FFC001FFE001FFF000FFF0007FF8007FFC003FFC001FFE ),
    .INIT_19 ( 256'hFFF8007FFC001FFE000FFF0007FFC003FFE001FFF000FFF8007FFC003FFE001F ),
    .INIT_1A ( 256'hFFF8003FFE001FFF0007FFC001FFF000FFF8003FFE000FFF0007FFC003FFE000 ),
    .INIT_1B ( 256'hFF0007FFC000FFF8003FFE000FFF8003FFE000FFF8003FFE000FFF8003FFE000 ),
    .INIT_1C ( 256'h001FFF8003FFF0007FFC000FFF8003FFF0007FFC000FFF8003FFE0007FFC001F ),
    .INIT_1D ( 256'hFF8001FFF8003FFF0003FFE0007FFE000FFFC001FFF8003FFF0007FFE000FFFC ),
    .INIT_1E ( 256'h7FFE0007FFE0007FFE0007FFE0007FFE0007FFE0007FFC000FFFC000FFFC001F ),
    .INIT_1F ( 256'h7FFE0003FFF0003FFF8001FFF8000FFFC000FFFC000FFFE0007FFE0007FFE000 ),
    .INIT_20 ( 256'hFF8000FFFE0007FFF0001FFF8000FFFE0007FFF0003FFF8001FFFC000FFFE000 ),
    .INIT_21 ( 256'h001FFFC0007FFF0001FFFC0007FFF0001FFFC0007FFF0001FFFC0007FFF0003F ),
    .INIT_22 ( 256'hFC0007FFF8000FFFF0001FFFE0003FFFC0007FFF0000FFFE0003FFF80007FFF0 ),
    .INIT_23 ( 256'hFF80007FFF80007FFF80007FFF8000FFFF0000FFFF0000FFFE0001FFFE0003FF ),
    .INIT_24 ( 256'hF00007FFF80003FFFC0001FFFE0001FFFF0000FFFF0000FFFF00007FFF80007F ),
    .INIT_25 ( 256'h00FFFF80003FFFE0000FFFF80003FFFE0000FFFF00007FFFC0003FFFE0000FFF ),
    .INIT_26 ( 256'hF00007FFFE0000FFFFC0001FFFF80003FFFF00007FFFC0000FFFF80003FFFE00 ),
    .INIT_27 ( 256'hFF00003FFFF00003FFFF00001FFFF80001FFFF80001FFFF00003FFFF00003FFF ),
    .INIT_28 ( 256'hC00007FFFF00001FFFFC00007FFFF00003FFFF80001FFFFC0000FFFFE00007FF ),
    .INIT_29 ( 256'h03FFFFC00007FFFF800007FFFF00000FFFFE00003FFFFC00007FFFF00001FFFF ),
    .INIT_2A ( 256'h00000FFFFF000007FFFF800003FFFFC00003FFFFC00003FFFFC00003FFFFC000 ),
    .INIT_2B ( 256'hC00001FFFFF800003FFFFE000007FFFFC00001FFFFF000007FFFFC00003FFFFE ),
    .INIT_2C ( 256'h0001FFFFF800000FFFFFC00000FFFFFE000007FFFFE00000FFFFFC00000FFFFF ),
    .INIT_2D ( 256'hFFFF000000FFFFFE000001FFFFFC000007FFFFF800000FFFFFE000007FFFFF00 ),
    .INIT_2E ( 256'h0FFFFFF8000007FFFFFC000001FFFFFE000000FFFFFF000000FFFFFF000000FF ),
    .INIT_2F ( 256'h7FFFFFF0000003FFFFFF0000003FFFFFF0000003FFFFFF0000007FFFFFC00000 ),
    .INIT_30 ( 256'hFFE0000001FFFFFFE0000003FFFFFFC0000007FFFFFF8000000FFFFFFC000000 ),
    .INIT_31 ( 256'h0FFFFFFFC0000000FFFFFFF80000001FFFFFFF00000007FFFFFFC0000003FFFF ),
    .INIT_32 ( 256'h003FFFFFFFC00000003FFFFFFFC00000007FFFFFFF00000001FFFFFFFC000000 ),
    .INIT_33 ( 256'hFFFFFFFE000000003FFFFFFFF000000003FFFFFFFE000000007FFFFFFF800000 ),
    .INIT_34 ( 256'h000000003FFFFFFFFF0000000007FFFFFFFF8000000007FFFFFFFF800000000F ),
    .INIT_35 ( 256'hFFF80000000003FFFFFFFFFE0000000001FFFFFFFFFC0000000003FFFFFFFFF0 ),
    .INIT_36 ( 256'hF800000000001FFFFFFFFFFF00000000000FFFFFFFFFFF00000000001FFFFFFF ),
    .INIT_37 ( 256'h0000FFFFFFFFFFFFE0000000000007FFFFFFFFFFFC000000000003FFFFFFFFFF ),
    .INIT_38 ( 256'h00000000000003FFFFFFFFFFFFFE00000000000003FFFFFFFFFFFFF000000000 ),
    .INIT_39 ( 256'h0000000000000003FFFFFFFFFFFFFFFE0000000000000003FFFFFFFFFFFFFFE0 ),
    .INIT_3A ( 256'h000000FFFFFFFFFFFFFFFFFFFE0000000000000000003FFFFFFFFFFFFFFFFF80 ),
    .INIT_3B ( 256'hFC0000000000000000000000007FFFFFFFFFFFFFFFFFFFFFE000000000000000 ),
    .INIT_3C ( 256'hFFFFFFF80000000000000000000000000000007FFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3D ( 256'h00000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0000000000000 ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut8  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [7]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [7]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut8_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'h000FFFFF00000FFFFF800007FFFF800003FFFFC00001FFFFE00001FFFFF00000 ),
    .INIT_01 ( 256'hE00001FFFFE00000FFFFF00000FFFFF800007FFFFC00003FFFFC00001FFFFE00 ),
    .INIT_02 ( 256'hFFFC00003FFFFC00001FFFFE00000FFFFF000007FFFF800007FFFFC00003FFFF ),
    .INIT_03 ( 256'h0FFFFF000007FFFF800003FFFFC00001FFFFE00001FFFFF00000FFFFF800007F ),
    .INIT_04 ( 256'h0003FFFFC00001FFFFE00000FFFFF000007FFFF800003FFFFC00001FFFFE0000 ),
    .INIT_05 ( 256'hE00001FFFFF00000FFFFF800003FFFFC00001FFFFE00000FFFFF000007FFFF80 ),
    .INIT_06 ( 256'hFFE00000FFFFF000007FFFFC00003FFFFE00000FFFFF000007FFFF800003FFFF ),
    .INIT_07 ( 256'hFFFFC00001FFFFF000007FFFF800003FFFFE00000FFFFF000007FFFFC00003FF ),
    .INIT_08 ( 256'h0FFFFF800007FFFFC00001FFFFF000007FFFFC00003FFFFE00000FFFFF800003 ),
    .INIT_09 ( 256'h007FFFFC00003FFFFE00000FFFFF800003FFFFE00000FFFFF800003FFFFE0000 ),
    .INIT_0A ( 256'h000FFFFF800003FFFFE00000FFFFF800003FFFFE00000FFFFF800001FFFFF000 ),
    .INIT_0B ( 256'h0007FFFFE00000FFFFF800003FFFFF000007FFFFC00001FFFFF000007FFFFE00 ),
    .INIT_0C ( 256'h0007FFFFC00000FFFFF800001FFFFF000007FFFFE00000FFFFF800001FFFFF00 ),
    .INIT_0D ( 256'h001FFFFF000003FFFFE000007FFFFC00000FFFFFC00001FFFFF800003FFFFF00 ),
    .INIT_0E ( 256'h03FFFFF000007FFFFE000007FFFFE00000FFFFFC00000FFFFFC00001FFFFF800 ),
    .INIT_0F ( 256'hFFFFF800001FFFFF800001FFFFF800003FFFFF000003FFFFF000003FFFFF0000 ),
    .INIT_10 ( 256'hFFE000007FFFFE000007FFFFF000003FFFFF000003FFFFF000003FFFFF000001 ),
    .INIT_11 ( 256'h00000FFFFFE000007FFFFF000003FFFFF800001FFFFF800000FFFFFC00000FFF ),
    .INIT_12 ( 256'h07FFFFE000003FFFFF800000FFFFFC000007FFFFF000003FFFFF800001FFFFFC ),
    .INIT_13 ( 256'hFF000001FFFFFC000007FFFFF000001FFFFFC000007FFFFF000001FFFFFC0000 ),
    .INIT_14 ( 256'h00FFFFFF000001FFFFFE000003FFFFF800000FFFFFF000001FFFFFC000007FFF ),
    .INIT_15 ( 256'hF8000007FFFFF800000FFFFFF000000FFFFFE000001FFFFFC000003FFFFF8000 ),
    .INIT_16 ( 256'hFFFFFC000003FFFFFC000003FFFFFC000003FFFFFC000003FFFFFC000007FFFF ),
    .INIT_17 ( 256'h001FFFFFE000000FFFFFF0000007FFFFF8000007FFFFF8000003FFFFFC000003 ),
    .INIT_18 ( 256'h00000FFFFFF8000003FFFFFE000001FFFFFF0000007FFFFF8000003FFFFFE000 ),
    .INIT_19 ( 256'h0000007FFFFFE000000FFFFFF8000003FFFFFE000000FFFFFF8000003FFFFFE0 ),
    .INIT_1A ( 256'h0000003FFFFFE0000007FFFFFE000000FFFFFFC000000FFFFFF8000003FFFFFF ),
    .INIT_1B ( 256'h000007FFFFFF0000003FFFFFF0000003FFFFFF0000003FFFFFF0000003FFFFFF ),
    .INIT_1C ( 256'h001FFFFFFC0000007FFFFFF0000003FFFFFF8000000FFFFFFC0000007FFFFFE0 ),
    .INIT_1D ( 256'hFFFFFE0000003FFFFFFC0000007FFFFFF0000001FFFFFFC0000007FFFFFF0000 ),
    .INIT_1E ( 256'h80000007FFFFFF80000007FFFFFF80000007FFFFFF8000000FFFFFFF0000001F ),
    .INIT_1F ( 256'h7FFFFFFC0000003FFFFFFE0000000FFFFFFF0000000FFFFFFF80000007FFFFFF ),
    .INIT_20 ( 256'h000000FFFFFFF80000001FFFFFFF00000007FFFFFFC0000001FFFFFFF0000000 ),
    .INIT_21 ( 256'hFFE00000007FFFFFFE00000007FFFFFFE00000007FFFFFFE00000007FFFFFFC0 ),
    .INIT_22 ( 256'hFFFFF80000000FFFFFFFE00000003FFFFFFF80000000FFFFFFFC00000007FFFF ),
    .INIT_23 ( 256'hFFFFFF800000007FFFFFFF80000000FFFFFFFF00000000FFFFFFFE00000003FF ),
    .INIT_24 ( 256'hFFFFF800000003FFFFFFFE00000001FFFFFFFF00000000FFFFFFFF800000007F ),
    .INIT_25 ( 256'hFF000000003FFFFFFFF000000003FFFFFFFF000000007FFFFFFFC00000000FFF ),
    .INIT_26 ( 256'h000007FFFFFFFF000000001FFFFFFFFC000000007FFFFFFFF000000003FFFFFF ),
    .INIT_27 ( 256'hFFFFFFC000000003FFFFFFFFE000000001FFFFFFFFE000000003FFFFFFFFC000 ),
    .INIT_28 ( 256'h000007FFFFFFFFE0000000007FFFFFFFFC000000001FFFFFFFFF0000000007FF ),
    .INIT_29 ( 256'hFC0000000007FFFFFFFFF8000000000FFFFFFFFFC0000000007FFFFFFFFE0000 ),
    .INIT_2A ( 256'hFFFFF00000000007FFFFFFFFFC0000000003FFFFFFFFFC0000000003FFFFFFFF ),
    .INIT_2B ( 256'hFFFFFE00000000003FFFFFFFFFF80000000001FFFFFFFFFF80000000003FFFFF ),
    .INIT_2C ( 256'hFFFE00000000000FFFFFFFFFFF000000000007FFFFFFFFFF00000000000FFFFF ),
    .INIT_2D ( 256'h0000000000FFFFFFFFFFFE000000000007FFFFFFFFFFF000000000007FFFFFFF ),
    .INIT_2E ( 256'h0FFFFFFFFFFFF8000000000001FFFFFFFFFFFF000000000000FFFFFFFFFFFF00 ),
    .INIT_2F ( 256'h80000000000003FFFFFFFFFFFFC0000000000003FFFFFFFFFFFF800000000000 ),
    .INIT_30 ( 256'hFFFFFFFFFE00000000000003FFFFFFFFFFFFF80000000000000FFFFFFFFFFFFF ),
    .INIT_31 ( 256'h0FFFFFFFFFFFFFFF000000000000001FFFFFFFFFFFFFF800000000000003FFFF ),
    .INIT_32 ( 256'h003FFFFFFFFFFFFFFFC0000000000000007FFFFFFFFFFFFFFE00000000000000 ),
    .INIT_33 ( 256'hFFFFFFFFFFFFFFFFC00000000000000003FFFFFFFFFFFFFFFF80000000000000 ),
    .INIT_34 ( 256'hFFFFFFFFC0000000000000000007FFFFFFFFFFFFFFFFF800000000000000000F ),
    .INIT_35 ( 256'h00000000000003FFFFFFFFFFFFFFFFFFFE00000000000000000003FFFFFFFFFF ),
    .INIT_36 ( 256'hFFFFFFFFFFFFE0000000000000000000000FFFFFFFFFFFFFFFFFFFFFE0000000 ),
    .INIT_37 ( 256'h0000FFFFFFFFFFFFFFFFFFFFFFFFF8000000000000000000000003FFFFFFFFFF ),
    .INIT_38 ( 256'h00000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFC0000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0000000000000000 ),
    .INIT_3A ( 256'h000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0000000000000000000 ),
    .INIT_3B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFF80000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h000000000000000000000000000000000000007FFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00000000000000000000000000000 ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut9  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [8]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [8]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut9_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'h000FFFFFFFFFF00000000007FFFFFFFFFC0000000001FFFFFFFFFE0000000000 ),
    .INIT_01 ( 256'h000001FFFFFFFFFF0000000000FFFFFFFFFF80000000003FFFFFFFFFE0000000 ),
    .INIT_02 ( 256'h000000003FFFFFFFFFE0000000000FFFFFFFFFF80000000007FFFFFFFFFC0000 ),
    .INIT_03 ( 256'hF00000000007FFFFFFFFFC0000000001FFFFFFFFFE0000000000FFFFFFFFFF80 ),
    .INIT_04 ( 256'hFFFC0000000001FFFFFFFFFF00000000007FFFFFFFFFC0000000001FFFFFFFFF ),
    .INIT_05 ( 256'hFFFFFE0000000000FFFFFFFFFFC0000000001FFFFFFFFFF00000000007FFFFFF ),
    .INIT_06 ( 256'hFFFFFFFF00000000007FFFFFFFFFC0000000000FFFFFFFFFF80000000003FFFF ),
    .INIT_07 ( 256'hFFFFFFFFFE00000000007FFFFFFFFFC0000000000FFFFFFFFFF80000000003FF ),
    .INIT_08 ( 256'h0FFFFFFFFFF80000000001FFFFFFFFFF80000000003FFFFFFFFFF00000000003 ),
    .INIT_09 ( 256'h007FFFFFFFFFC0000000000FFFFFFFFFFC0000000000FFFFFFFFFFC000000000 ),
    .INIT_0A ( 256'h000FFFFFFFFFFC0000000000FFFFFFFFFFC0000000000FFFFFFFFFFE00000000 ),
    .INIT_0B ( 256'h0007FFFFFFFFFF00000000003FFFFFFFFFF80000000001FFFFFFFFFF80000000 ),
    .INIT_0C ( 256'h0007FFFFFFFFFF00000000001FFFFFFFFFF80000000000FFFFFFFFFFE0000000 ),
    .INIT_0D ( 256'h001FFFFFFFFFFC00000000007FFFFFFFFFF00000000001FFFFFFFFFFC0000000 ),
    .INIT_0E ( 256'h03FFFFFFFFFF800000000007FFFFFFFFFF00000000000FFFFFFFFFFE00000000 ),
    .INIT_0F ( 256'hFFFFFFFFFFE00000000001FFFFFFFFFFC00000000003FFFFFFFFFFC000000000 ),
    .INIT_10 ( 256'hFFFFFFFF800000000007FFFFFFFFFFC00000000003FFFFFFFFFFC00000000001 ),
    .INIT_11 ( 256'hFFFFF000000000007FFFFFFFFFFC00000000001FFFFFFFFFFF00000000000FFF ),
    .INIT_12 ( 256'hF800000000003FFFFFFFFFFF000000000007FFFFFFFFFFC00000000001FFFFFF ),
    .INIT_13 ( 256'h00000001FFFFFFFFFFF800000000001FFFFFFFFFFF800000000001FFFFFFFFFF ),
    .INIT_14 ( 256'h00FFFFFFFFFFFE000000000003FFFFFFFFFFF000000000001FFFFFFFFFFF8000 ),
    .INIT_15 ( 256'hFFFFFFF800000000000FFFFFFFFFFFF000000000001FFFFFFFFFFFC000000000 ),
    .INIT_16 ( 256'h000000000003FFFFFFFFFFFC000000000003FFFFFFFFFFFC000000000007FFFF ),
    .INIT_17 ( 256'h001FFFFFFFFFFFF0000000000007FFFFFFFFFFF8000000000003FFFFFFFFFFFC ),
    .INIT_18 ( 256'hFFFFF0000000000003FFFFFFFFFFFE0000000000007FFFFFFFFFFFC000000000 ),
    .INIT_19 ( 256'h0000007FFFFFFFFFFFF0000000000003FFFFFFFFFFFF0000000000003FFFFFFF ),
    .INIT_1A ( 256'hFFFFFFC0000000000007FFFFFFFFFFFF0000000000000FFFFFFFFFFFFC000000 ),
    .INIT_1B ( 256'h000007FFFFFFFFFFFFC0000000000003FFFFFFFFFFFFC0000000000003FFFFFF ),
    .INIT_1C ( 256'hFFE00000000000007FFFFFFFFFFFFC0000000000000FFFFFFFFFFFFF80000000 ),
    .INIT_1D ( 256'hFFFFFFFFFFFFC00000000000007FFFFFFFFFFFFE00000000000007FFFFFFFFFF ),
    .INIT_1E ( 256'h00000007FFFFFFFFFFFFF800000000000007FFFFFFFFFFFFF00000000000001F ),
    .INIT_1F ( 256'h800000000000003FFFFFFFFFFFFFF00000000000000FFFFFFFFFFFFFF8000000 ),
    .INIT_20 ( 256'hFFFFFF000000000000001FFFFFFFFFFFFFF800000000000001FFFFFFFFFFFFFF ),
    .INIT_21 ( 256'hFFFFFFFFFF8000000000000007FFFFFFFFFFFFFF8000000000000007FFFFFFFF ),
    .INIT_22 ( 256'hFFFFFFFFFFFFF0000000000000003FFFFFFFFFFFFFFF0000000000000007FFFF ),
    .INIT_23 ( 256'hFFFFFFFFFFFFFF8000000000000000FFFFFFFFFFFFFFFF0000000000000003FF ),
    .INIT_24 ( 256'hFFFFFFFFFFFFFC0000000000000001FFFFFFFFFFFFFFFF00000000000000007F ),
    .INIT_25 ( 256'hFFFFFFFFFFC00000000000000003FFFFFFFFFFFFFFFF80000000000000000FFF ),
    .INIT_26 ( 256'hFFFFF800000000000000001FFFFFFFFFFFFFFFFF800000000000000003FFFFFF ),
    .INIT_27 ( 256'h0000000000000003FFFFFFFFFFFFFFFFFE000000000000000003FFFFFFFFFFFF ),
    .INIT_28 ( 256'h000007FFFFFFFFFFFFFFFFFF8000000000000000001FFFFFFFFFFFFFFFFFF800 ),
    .INIT_29 ( 256'hFFFFFFFFFFF80000000000000000000FFFFFFFFFFFFFFFFFFF80000000000000 ),
    .INIT_2A ( 256'h0000000000000007FFFFFFFFFFFFFFFFFFFC00000000000000000003FFFFFFFF ),
    .INIT_2B ( 256'hFFFFFFFFFFFFFFFFC000000000000000000001FFFFFFFFFFFFFFFFFFFFC00000 ),
    .INIT_2C ( 256'h000000000000000FFFFFFFFFFFFFFFFFFFFFF8000000000000000000000FFFFF ),
    .INIT_2D ( 256'hFFFFFFFFFF000000000000000000000007FFFFFFFFFFFFFFFFFFFFFF80000000 ),
    .INIT_2E ( 256'h0FFFFFFFFFFFFFFFFFFFFFFFFE000000000000000000000000FFFFFFFFFFFFFF ),
    .INIT_2F ( 256'h00000000000003FFFFFFFFFFFFFFFFFFFFFFFFFC000000000000000000000000 ),
    .INIT_30 ( 256'h000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000 ),
    .INIT_31 ( 256'hF000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFC0000 ),
    .INIT_32 ( 256'hFFC00000000000000000000000000000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_33 ( 256'h0000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_34 ( 256'h0000000000000000000000000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0 ),
    .INIT_35 ( 256'h00000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0000000000 ),
    .INIT_36 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000 ),
    .INIT_37 ( 256'hFFFF00000000000000000000000000000000000000000000000003FFFFFFFFFF ),
    .INIT_38 ( 256'h00000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_39 ( 256'hFFFFFFFFFFFFFFFC000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80000000000000000000000000 ),
    .INIT_3D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut10  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [9]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [9]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut10_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'hFFF000000000000000000007FFFFFFFFFFFFFFFFFFFE00000000000000000000 ),
    .INIT_01 ( 256'h000001FFFFFFFFFFFFFFFFFFFF000000000000000000003FFFFFFFFFFFFFFFFF ),
    .INIT_02 ( 256'hFFFFFFFFC00000000000000000000FFFFFFFFFFFFFFFFFFFF800000000000000 ),
    .INIT_03 ( 256'h000000000007FFFFFFFFFFFFFFFFFFFE00000000000000000000FFFFFFFFFFFF ),
    .INIT_04 ( 256'hFFFFFFFFFFFFFE000000000000000000007FFFFFFFFFFFFFFFFFFFE000000000 ),
    .INIT_05 ( 256'h0000000000000000FFFFFFFFFFFFFFFFFFFFE000000000000000000007FFFFFF ),
    .INIT_06 ( 256'hFFFFFFFFFFFFFFFFFF800000000000000000000FFFFFFFFFFFFFFFFFFFFC0000 ),
    .INIT_07 ( 256'h000000000000000000007FFFFFFFFFFFFFFFFFFFF000000000000000000003FF ),
    .INIT_08 ( 256'h0FFFFFFFFFFFFFFFFFFFFE000000000000000000003FFFFFFFFFFFFFFFFFFFFC ),
    .INIT_09 ( 256'hFF800000000000000000000FFFFFFFFFFFFFFFFFFFFF00000000000000000000 ),
    .INIT_0A ( 256'h000FFFFFFFFFFFFFFFFFFFFF000000000000000000000FFFFFFFFFFFFFFFFFFF ),
    .INIT_0B ( 256'hFFF8000000000000000000003FFFFFFFFFFFFFFFFFFFFE000000000000000000 ),
    .INIT_0C ( 256'h0007FFFFFFFFFFFFFFFFFFFFE000000000000000000000FFFFFFFFFFFFFFFFFF ),
    .INIT_0D ( 256'hFFE0000000000000000000007FFFFFFFFFFFFFFFFFFFFE000000000000000000 ),
    .INIT_0E ( 256'h03FFFFFFFFFFFFFFFFFFFFF8000000000000000000000FFFFFFFFFFFFFFFFFFF ),
    .INIT_0F ( 256'h0000000000000000000001FFFFFFFFFFFFFFFFFFFFFC00000000000000000000 ),
    .INIT_10 ( 256'hFFFFFFFFFFFFFFFFFFF80000000000000000000003FFFFFFFFFFFFFFFFFFFFFE ),
    .INIT_11 ( 256'h00000000000000007FFFFFFFFFFFFFFFFFFFFFE0000000000000000000000FFF ),
    .INIT_12 ( 256'hFFFFFFFFFFFFC00000000000000000000007FFFFFFFFFFFFFFFFFFFFFE000000 ),
    .INIT_13 ( 256'h00000001FFFFFFFFFFFFFFFFFFFFFFE00000000000000000000001FFFFFFFFFF ),
    .INIT_14 ( 256'hFF000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFE000000000000000 ),
    .INIT_15 ( 256'hFFFFFFFFFFFFFFFFFFF000000000000000000000001FFFFFFFFFFFFFFFFFFFFF ),
    .INIT_16 ( 256'h000000000003FFFFFFFFFFFFFFFFFFFFFFFC000000000000000000000007FFFF ),
    .INIT_17 ( 256'hFFE0000000000000000000000007FFFFFFFFFFFFFFFFFFFFFFFC000000000000 ),
    .INIT_18 ( 256'hFFFFFFFFFFFFFFFFFC0000000000000000000000007FFFFFFFFFFFFFFFFFFFFF ),
    .INIT_19 ( 256'h0000007FFFFFFFFFFFFFFFFFFFFFFFFC0000000000000000000000003FFFFFFF ),
    .INIT_1A ( 256'h00000000000000000007FFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000 ),
    .INIT_1B ( 256'hFFFFF800000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFC000000 ),
    .INIT_1C ( 256'hFFFFFFFFFFFFFFFF800000000000000000000000000FFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFF8000000000000000000000000007FFFFFFFFFF ),
    .INIT_1E ( 256'h00000007FFFFFFFFFFFFFFFFFFFFFFFFFFF8000000000000000000000000001F ),
    .INIT_1F ( 256'h000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000 ),
    .INIT_20 ( 256'h000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFE00000000000000 ),
    .INIT_21 ( 256'h00000000000000000000000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000000 ),
    .INIT_22 ( 256'h00000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80000 ),
    .INIT_23 ( 256'h000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00 ),
    .INIT_24 ( 256'h000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80 ),
    .INIT_25 ( 256'h0000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000 ),
    .INIT_26 ( 256'h00000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC000000 ),
    .INIT_27 ( 256'h0000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC000000000000 ),
    .INIT_28 ( 256'h000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE000000000000000000000 ),
    .INIT_29 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000 ),
    .INIT_2A ( 256'hFFFFFFFFFFFFFFF80000000000000000000000000000000000000003FFFFFFFF ),
    .INIT_2B ( 256'h00000000000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2C ( 256'h000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000 ),
    .INIT_2D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000000000000000000000000000000 ),
    .INIT_2E ( 256'hF0000000000000000000000000000000000000000000000000FFFFFFFFFFFFFF ),
    .INIT_2F ( 256'h00000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_30 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFC0000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_32 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_34 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFF8000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h00000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0000000000 ),
    .INIT_38 ( 256'h00000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'hFFFFFF0000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut11  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [10]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [10]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut11_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'hFFFFFFFFFFFFFFFFFFFFFFF80000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'hFFFFFE00000000000000000000000000000000000000003FFFFFFFFFFFFFFFFF ),
    .INIT_02 ( 256'h00000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_03 ( 256'h000000000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000 ),
    .INIT_04 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000000000000000000000000000 ),
    .INIT_05 ( 256'hFFFFFFFFFFFFFFFF000000000000000000000000000000000000000007FFFFFF ),
    .INIT_06 ( 256'h000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_07 ( 256'h000000000000000000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00 ),
    .INIT_08 ( 256'h0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC000000000000000000000 ),
    .INIT_09 ( 256'hFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'hFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFF ),
    .INIT_0B ( 256'h0000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_0C ( 256'h0007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000 ),
    .INIT_0D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFF8000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'hFC0000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFF ),
    .INIT_0F ( 256'h0000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_10 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0000000000000000000000 ),
    .INIT_11 ( 256'hFFFFFFFFFFFFFFFF800000000000000000000000000000000000000000000FFF ),
    .INIT_12 ( 256'h000000000000000000000000000000000007FFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_13 ( 256'h00000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0000000000 ),
    .INIT_14 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFC00000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFF ),
    .INIT_16 ( 256'h000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80000 ),
    .INIT_17 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFF8000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000007FFFFFFFFFFFFFFFFFFFFF ),
    .INIT_19 ( 256'h0000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0000000 ),
    .INIT_1A ( 256'hFFFFFFFFFFFFFFFFFFF800000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h00000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000 ),
    .INIT_1D ( 256'h000000000000000000000000000000000000000000000000000007FFFFFFFFFF ),
    .INIT_1E ( 256'h00000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0 ),
    .INIT_1F ( 256'hFFFFFFFFFFFFFFC0000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_21 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFF800000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h00000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_23 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000 ),
    .INIT_24 ( 256'h000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_25 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFC000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h00000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_27 ( 256'hFFFFFFFFFFFFFFFC000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00000000 ),
    .INIT_2B ( 256'h00000000000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2C ( 256'hFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2E ( 256'h00000000000000000000000000000000000000000000000000FFFFFFFFFFFFFF ),
    .INIT_2F ( 256'hFFFFFFFFFFFFFC00000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_31 ( 256'h0000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC000000000000000000000000000000 ),
    .INIT_34 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_35 ( 256'h00000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'hFFFFFFFFFFFFFC00000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut12  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [11]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [11]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut12_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00000000000000000 ),
    .INIT_02 ( 256'h00000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_03 ( 256'hFFFFFFFFFFF80000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000007FFFFFF ),
    .INIT_06 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000 ),
    .INIT_07 ( 256'h000000000000000000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_08 ( 256'hF000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_0A ( 256'h000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFF ),
    .INIT_0B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFC000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000 ),
    .INIT_12 ( 256'h000000000000000000000000000000000007FFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_13 ( 256'hFFFFFFFE00000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFF ),
    .INIT_16 ( 256'hFFFFFFFFFFFC0000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000007FFFFFFFFFFFFFFFFFFFFF ),
    .INIT_19 ( 256'hFFFFFF8000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1B ( 256'h00000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80000000000 ),
    .INIT_1E ( 256'h00000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'hFFFFFFFFFFFFFFFFFFFFE0000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_22 ( 256'h00000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0000000000000000000000000000000000 ),
    .INIT_25 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_26 ( 256'h00000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'hFFFFF80000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2B ( 256'h00000000000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000 ),
    .INIT_2F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_30 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_31 ( 256'h0000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'hFFFFFFFFFFFFFC00000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_37 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_38 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_39 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut13  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [12]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [12]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut13_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000 ),
    .INIT_03 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_04 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000007FFFFFF ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'hFFFFFFFFFFFFFFFFFFFF80000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_09 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_0A ( 256'h000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFF ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'hFFF8000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_0E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_0F ( 256'h0000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80000000000000000000000000000 ),
    .INIT_13 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_14 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFF ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000000000000000000000 ),
    .INIT_19 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1B ( 256'h00000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'hFFFFFFF800000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_20 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_21 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_22 ( 256'h00000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'hFFFFFFFFFFFFFFFFFFFFFFE00000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_28 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_29 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2B ( 256'h00000000000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE000000000000000000000000000000000 ),
    .INIT_32 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_33 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_34 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_35 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_36 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_37 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_38 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_39 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut14  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [13]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [13]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut14_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000000 ),
    .INIT_06 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_07 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_08 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_09 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_0A ( 256'h000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFF ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'hFFFFFFFFFFFFFFFFFFFFFE000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_11 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_12 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_13 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_14 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFF ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00000000000000000000000000000000 ),
    .INIT_1C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_20 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_21 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_22 ( 256'h00000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE00000000000000000000000000 ),
    .INIT_2C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_30 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_31 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_32 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_33 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_34 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_35 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_36 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_37 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_38 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_39 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut15  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [14]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [14]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut15_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
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
    .INIT_0A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000 ),
    .INIT_0B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_0C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_0D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_0E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_0F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_10 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_11 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_12 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_13 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_14 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFF ),
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
    .INIT_22 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00000000000000000000000000000000000 ),
    .INIT_23 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_24 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_25 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_26 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_27 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_28 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_29 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_30 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_31 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_32 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_33 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_34 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_35 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_36 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_37 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_38 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_39 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut16  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [15]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [15]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut16_DOPB<0>_UNCONNECTED })
  );
  RAMB16BWER #(
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SRVAL_A ( 36'h000000000 ),
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
    .INIT_15 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE000000000000000000000 ),
    .INIT_16 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_17 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_18 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_19 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_1F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_20 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_21 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_22 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_23 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_24 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_25 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_26 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_27 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_28 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_29 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_2F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_30 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_31 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_32 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_33 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_34 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_35 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_36 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_37 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_38 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_39 ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3A ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3B ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3C ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3D ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_3F ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DATA_WIDTH_A ( 1 ),
    .DATA_WIDTH_B ( 1 ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .RSTTYPE ( "SYNC" ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_B ( 36'h000000000 ))
  \BU2/U0/i_rom/Mram_sin_cos_lut17  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(ce),
    .ENB(ce),
    .RSTA(\BU2/channel [0]),
    .RSTB(\BU2/channel [0]),
    .REGCEA(ce),
    .REGCEB(ce),
    .ADDRA({\BU2/U0/i_rom/mod_sin_addr [13], \BU2/U0/i_rom/mod_sin_addr [12], \BU2/U0/i_rom/mod_sin_addr [11], \BU2/U0/i_rom/mod_sin_addr [10], 
\BU2/U0/i_rom/mod_sin_addr [9], \BU2/U0/i_rom/mod_sin_addr [8], \BU2/U0/i_rom/mod_sin_addr [7], \BU2/U0/i_rom/mod_sin_addr [6], 
\BU2/U0/i_rom/mod_sin_addr [5], \BU2/U0/i_rom/mod_sin_addr [4], \BU2/U0/i_rom/mod_sin_addr [3], \BU2/U0/i_rom/mod_sin_addr [2], 
\BU2/U0/i_rom/mod_sin_addr [1], \BU2/U0/i_rom/mod_sin_addr [0]}),
    .ADDRB({\BU2/U0/i_rom/mod_cos_addr [13], \BU2/U0/i_rom/mod_cos_addr [12], \BU2/U0/i_rom/mod_cos_addr [11], \BU2/U0/i_rom/mod_cos_addr [10], 
\BU2/U0/i_rom/mod_cos_addr [9], \BU2/U0/i_rom/mod_cos_addr [8], \BU2/U0/i_rom/mod_cos_addr [7], \BU2/U0/i_rom/mod_cos_addr [6], 
\BU2/U0/i_rom/mod_cos_addr [5], \BU2/U0/i_rom/mod_cos_addr [4], \BU2/U0/i_rom/mod_cos_addr [3], \BU2/U0/i_rom/mod_cos_addr [2], 
\BU2/U0/i_rom/mod_cos_addr [1], \BU2/U0/i_rom/mod_cos_addr [0]}),
    .DIA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIA<1>_UNCONNECTED , \BU2/channel [0]}),
    .DIB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIB<0>_UNCONNECTED }),
    .DIPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPA<0>_UNCONNECTED }),
    .DIPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DIPB<0>_UNCONNECTED }),
    .WEA({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .WEB({\BU2/channel [0], \BU2/channel [0], \BU2/channel [0], \BU2/channel [0]}),
    .DOA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOA<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_sin_RAM_op [16]}),
    .DOB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<31>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<30>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<29>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<28>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<27>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<26>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<25>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<24>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<23>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<22>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<21>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<20>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<19>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<18>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<17>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<16>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<15>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<14>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<13>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<12>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<11>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<10>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<9>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<8>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<7>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<6>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<5>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<4>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOB<1>_UNCONNECTED , \BU2/U0/i_rom/asyn_cos_RAM_op [16]}),
    .DOPA({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPA<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPA<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPA<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPA<0>_UNCONNECTED }),
    .DOPB({\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPB<3>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPB<2>_UNCONNECTED , 
\NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPB<1>_UNCONNECTED , \NLW_BU2/U0/i_rom/Mram_sin_cos_lut17_DOPB<0>_UNCONNECTED })
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<0>_rt  (
    .I0(\BU2/U0/i_rom/sin_RAM_op [0]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<0>_rt_1362 )
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ms1<0>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [9]),
    .O(\BU2/U0/i_rom/asyn_cos_ms1 [0])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ms1<1>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [10]),
    .O(\BU2/U0/i_rom/asyn_cos_ms1 [1])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ms1<2>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [11]),
    .O(\BU2/U0/i_rom/asyn_cos_ms1 [2])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ms1<3>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [12]),
    .O(\BU2/U0/i_rom/asyn_cos_ms1 [3])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ms1<4>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [13]),
    .O(\BU2/U0/i_rom/asyn_cos_ms1 [4])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ms1<5>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [14]),
    .O(\BU2/U0/i_rom/asyn_cos_ms1 [5])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ms1<6>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [15]),
    .O(\BU2/U0/i_rom/asyn_cos_ms1 [6])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ms1<7>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [16]),
    .O(\BU2/U0/i_rom/asyn_cos_ms1 [7])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<0>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [16]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [0])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<10>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [26]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [10])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<11>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [27]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [11])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<12>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [28]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [12])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<13>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [29]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [13])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<1>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [17]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [1])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<2>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [18]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [2])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<3>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [19]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [3])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<4>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [20]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<5>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [21]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [5])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<6>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [22]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [6])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<7>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [23]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [7])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<8>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [24]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [8])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_rom/asyn_mod_cos_addr<9>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [25]),
    .O(\BU2/U0/i_rom/asyn_mod_cos_addr [9])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ls1_pre<8>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [8]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1_pre [8])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ls1_pre<7>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [7]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1_pre [7])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ls1_pre<6>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [6]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1_pre [6])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ls1_pre<5>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [5]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1_pre [5])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ls1_pre<4>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [4]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1_pre [4])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ls1_pre<3>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [3]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1_pre [3])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ls1_pre<2>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [2]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1_pre [2])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ls1_pre<1>1  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I2(\BU2/U0/i_rom/cos_RAM_op [1]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1_pre [1])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \BU2/U0/i_rom/asyn_cos_ls1_pre<0>1  (
    .I0(\BU2/U0/i_rom/cos_RAM_op [0]),
    .I1(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I2(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1_pre [0])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<1>_rt  (
    .I0(\BU2/U0/i_rom/cos_ms1 [1]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<1>_rt_1344 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<2>_rt  (
    .I0(\BU2/U0/i_rom/cos_ms1 [2]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<2>_rt_1342 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<3>_rt  (
    .I0(\BU2/U0/i_rom/cos_ms1 [3]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<3>_rt_1340 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<4>_rt  (
    .I0(\BU2/U0/i_rom/cos_ms1 [4]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<4>_rt_1338 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<5>_rt  (
    .I0(\BU2/U0/i_rom/cos_ms1 [5]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<5>_rt_1336 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<6>_rt  (
    .I0(\BU2/U0/i_rom/cos_ms1 [6]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<6>_rt_1334 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<7>_rt  (
    .I0(\BU2/U0/i_rom/cos_ms1 [7]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<7>_rt_1332 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<1>_rt  (
    .I0(\BU2/U0/i_rom/sin_ms1 [1]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<1>_rt_1328 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<2>_rt  (
    .I0(\BU2/U0/i_rom/sin_ms1 [2]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<2>_rt_1326 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<3>_rt  (
    .I0(\BU2/U0/i_rom/sin_ms1 [3]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<3>_rt_1324 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<4>_rt  (
    .I0(\BU2/U0/i_rom/sin_ms1 [4]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<4>_rt_1322 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<5>_rt  (
    .I0(\BU2/U0/i_rom/sin_ms1 [5]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<5>_rt_1320 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<6>_rt  (
    .I0(\BU2/U0/i_rom/sin_ms1 [6]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<6>_rt_1318 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<7>_rt  (
    .I0(\BU2/U0/i_rom/sin_ms1 [7]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<7>_rt_1316 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/invert_cos_or00001  (
    .I0(\BU2/U0/i_rom/quadrant_bypass_b [0]),
    .I1(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .O(\BU2/U0/i_rom/asyn_cos_ms1 [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ls1_pre<1>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [1]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1_pre [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ls1_pre<2>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [2]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1_pre [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ls1_pre<3>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [3]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1_pre [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ls1_pre<4>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [4]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1_pre [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ls1_pre<5>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [5]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1_pre [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ls1_pre<6>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [6]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1_pre [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ls1_pre<7>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [7]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1_pre [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<0>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [16]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<10>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [26]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<11>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [27]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<12>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [28]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<13>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [29]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<1>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [17]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<2>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [18]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<3>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [19]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<4>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [20]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<5>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [21]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<6>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [22]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<7>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [23]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<8>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [24]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_mod_sin_addr<9>1  (
    .I0(\BU2/U0/acc_phase_shaped [30]),
    .I1(\BU2/U0/acc_phase_shaped [25]),
    .O(\BU2/U0/i_rom/asyn_mod_sin_addr [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ls1_pre<8>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [8]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1_pre [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<0>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [9]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<1>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [10]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<2>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [11]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<3>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [12]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<4>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [13]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<5>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [14]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<6>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [15]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/asyn_sin_ms1<7>1  (
    .I0(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .I1(\BU2/U0/i_rom/sin_RAM_op [16]),
    .O(\BU2/U0/i_rom/asyn_sin_ms1 [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [0]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [1]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [2]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [3]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [4]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [5]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [6]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [7]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [8]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [9]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [10]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [10])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [11]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [11])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [12]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [12])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_sin_addr_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_sin_addr [13]),
    .Q(\BU2/U0/i_rom/mod_sin_addr [13])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [0]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [1]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [2]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [3]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [4]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [5]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [6]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [7]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [8]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [9]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [10]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [10])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [11]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [11])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [12]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [12])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/mod_cos_addr_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_mod_cos_addr [13]),
    .Q(\BU2/U0/i_rom/mod_cos_addr [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/Madd_asyn_cos_ls1_lut<0>  (
    .I0(\BU2/U0/i_rom/asyn_cos_ls1_pre [0]),
    .I1(\BU2/U0/i_rom/asyn_cos_ms1 [8]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ls1_lut [0])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_cy<0>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/i_rom/asyn_cos_ls1_pre [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_cos_ls1_lut [0]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [0])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_xor<0>  (
    .CI(\BU2/channel [0]),
    .LI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_lut [0]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1 [0])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_cy<1>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [0]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_cos_ls1_pre [1]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [1])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_xor<1>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [0]),
    .LI(\BU2/U0/i_rom/asyn_cos_ls1_pre [1]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1 [1])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_cy<2>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [1]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_cos_ls1_pre [2]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [2])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_xor<2>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [1]),
    .LI(\BU2/U0/i_rom/asyn_cos_ls1_pre [2]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1 [2])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_cy<3>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [2]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_cos_ls1_pre [3]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [3])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_xor<3>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [2]),
    .LI(\BU2/U0/i_rom/asyn_cos_ls1_pre [3]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1 [3])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_cy<4>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [3]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_cos_ls1_pre [4]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [4])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_xor<4>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [3]),
    .LI(\BU2/U0/i_rom/asyn_cos_ls1_pre [4]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1 [4])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_cy<5>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [4]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_cos_ls1_pre [5]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [5])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_xor<5>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [4]),
    .LI(\BU2/U0/i_rom/asyn_cos_ls1_pre [5]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1 [5])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_cy<6>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [5]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_cos_ls1_pre [6]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [6])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_xor<6>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [5]),
    .LI(\BU2/U0/i_rom/asyn_cos_ls1_pre [6]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1 [6])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_cy<7>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [6]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_cos_ls1_pre [7]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [7])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_xor<7>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [6]),
    .LI(\BU2/U0/i_rom/asyn_cos_ls1_pre [7]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1 [7])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_cy<8>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [7]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_cos_ls1_pre [8]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [8])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ls1_xor<8>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [7]),
    .LI(\BU2/U0/i_rom/asyn_cos_ls1_pre [8]),
    .O(\BU2/U0/i_rom/asyn_cos_ls1 [8])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<0>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .S(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<0>_rt_1362 ),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [0])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<0>  (
    .CI(\BU2/channel [0]),
    .LI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<0>_rt_1362 ),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [0])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<1>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [0]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_sin_ls1_pre [1]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [1])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<1>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [0]),
    .LI(\BU2/U0/i_rom/asyn_sin_ls1_pre [1]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [1])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<2>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [1]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_sin_ls1_pre [2]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [2])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<2>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [1]),
    .LI(\BU2/U0/i_rom/asyn_sin_ls1_pre [2]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [2])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<3>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [2]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_sin_ls1_pre [3]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [3])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<3>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [2]),
    .LI(\BU2/U0/i_rom/asyn_sin_ls1_pre [3]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [3])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<4>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [3]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_sin_ls1_pre [4]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [4])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<4>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [3]),
    .LI(\BU2/U0/i_rom/asyn_sin_ls1_pre [4]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [4])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<5>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [4]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_sin_ls1_pre [5]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [5])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<5>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [4]),
    .LI(\BU2/U0/i_rom/asyn_sin_ls1_pre [5]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [5])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<6>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [5]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_sin_ls1_pre [6]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [6])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<6>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [5]),
    .LI(\BU2/U0/i_rom/asyn_sin_ls1_pre [6]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [6])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<7>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [6]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_sin_ls1_pre [7]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [7])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<7>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [6]),
    .LI(\BU2/U0/i_rom/asyn_sin_ls1_pre [7]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [7])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_cy<8>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [7]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/asyn_sin_ls1_pre [8]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [8])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ls1_xor<8>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [7]),
    .LI(\BU2/U0/i_rom/asyn_sin_ls1_pre [8]),
    .O(\BU2/U0/i_rom/asyn_sin_ls1 [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/Madd_asyn_cos_ms2_lut<0>  (
    .I0(\BU2/U0/i_rom/cos_ms1 [0]),
    .I1(\BU2/U0/i_rom/cos_ls1 [9]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_lut [0])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<0>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/i_rom/cos_ms1 [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_cos_ms2_lut [0]),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [0])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_xor<0>  (
    .CI(\BU2/channel [0]),
    .LI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_lut [0]),
    .O(\BU2/U0/i_rom/asyn_cos_ms2 [0])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<1>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [0]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<1>_rt_1344 ),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [1])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_xor<1>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [0]),
    .LI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<1>_rt_1344 ),
    .O(\BU2/U0/i_rom/asyn_cos_ms2 [1])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<2>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [1]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<2>_rt_1342 ),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [2])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_xor<2>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [1]),
    .LI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<2>_rt_1342 ),
    .O(\BU2/U0/i_rom/asyn_cos_ms2 [2])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<3>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [2]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<3>_rt_1340 ),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [3])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_xor<3>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [2]),
    .LI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<3>_rt_1340 ),
    .O(\BU2/U0/i_rom/asyn_cos_ms2 [3])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<4>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [3]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<4>_rt_1338 ),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [4])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_xor<4>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [3]),
    .LI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<4>_rt_1338 ),
    .O(\BU2/U0/i_rom/asyn_cos_ms2 [4])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<5>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [4]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<5>_rt_1336 ),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [5])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_xor<5>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [4]),
    .LI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<5>_rt_1336 ),
    .O(\BU2/U0/i_rom/asyn_cos_ms2 [5])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<6>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [5]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<6>_rt_1334 ),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [6])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_xor<6>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [5]),
    .LI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<6>_rt_1334 ),
    .O(\BU2/U0/i_rom/asyn_cos_ms2 [6])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<7>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [6]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<7>_rt_1332 ),
    .O(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [7])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_xor<7>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [6]),
    .LI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy<7>_rt_1332 ),
    .O(\BU2/U0/i_rom/asyn_cos_ms2 [7])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_cos_ms2_xor<8>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_cos_ms2_cy [7]),
    .LI(\BU2/U0/i_rom/cos_ms1 [8]),
    .O(\BU2/U0/i_rom/asyn_cos_ms2 [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_rom/Madd_asyn_sin_ms2_lut<0>  (
    .I0(\BU2/U0/i_rom/sin_ms1 [0]),
    .I1(\BU2/U0/i_rom/sin_ls1 [9]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_lut [0])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<0>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/i_rom/sin_ms1 [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_sin_ms2_lut [0]),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [0])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<0>  (
    .CI(\BU2/channel [0]),
    .LI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_lut [0]),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [0])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<1>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [0]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<1>_rt_1328 ),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [1])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<1>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [0]),
    .LI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<1>_rt_1328 ),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [1])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<2>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [1]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<2>_rt_1326 ),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [2])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<2>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [1]),
    .LI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<2>_rt_1326 ),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [2])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<3>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [2]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<3>_rt_1324 ),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [3])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<3>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [2]),
    .LI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<3>_rt_1324 ),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [3])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<4>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [3]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<4>_rt_1322 ),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [4])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<4>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [3]),
    .LI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<4>_rt_1322 ),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [4])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<5>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [4]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<5>_rt_1320 ),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [5])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<5>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [4]),
    .LI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<5>_rt_1320 ),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [5])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<6>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [5]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<6>_rt_1318 ),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [6])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<6>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [5]),
    .LI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<6>_rt_1318 ),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [6])
  );
  MUXCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<7>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [6]),
    .DI(\BU2/channel [0]),
    .S(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<7>_rt_1316 ),
    .O(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [7])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<7>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [6]),
    .LI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy<7>_rt_1316 ),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [7])
  );
  XORCY   \BU2/U0/i_rom/Madd_asyn_sin_ms2_xor<8>  (
    .CI(\BU2/U0/i_rom/Madd_asyn_sin_ms2_cy [7]),
    .LI(\BU2/U0/i_rom/sin_ms1 [8]),
    .O(\BU2/U0/i_rom/asyn_sin_ms2 [8])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<31>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [30]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [31]),
    .O(\BU2/U0/acc_phase_shaped_pre [31])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<31>  (
    .I0(\BU2/U0/acc_phase [31]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [31])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<30>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [29]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [30]),
    .O(\BU2/U0/acc_phase_shaped_pre [30])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<30>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [29]),
    .DI(\BU2/U0/acc_phase [30]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [30]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [30])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<30>  (
    .I0(\BU2/U0/acc_phase [30]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [30])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<29>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [28]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [29]),
    .O(\BU2/U0/acc_phase_shaped_pre [29])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<29>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [28]),
    .DI(\BU2/U0/acc_phase [29]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [29]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [29])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<29>  (
    .I0(\BU2/U0/acc_phase [29]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [29])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<28>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [27]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [28]),
    .O(\BU2/U0/acc_phase_shaped_pre [28])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<28>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [27]),
    .DI(\BU2/U0/acc_phase [28]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [28]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [28])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<28>  (
    .I0(\BU2/U0/acc_phase [28]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [28])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<27>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [26]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [27]),
    .O(\BU2/U0/acc_phase_shaped_pre [27])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<27>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [26]),
    .DI(\BU2/U0/acc_phase [27]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [27]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [27])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<27>  (
    .I0(\BU2/U0/acc_phase [27]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [27])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<26>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [25]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [26]),
    .O(\BU2/U0/acc_phase_shaped_pre [26])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<26>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [25]),
    .DI(\BU2/U0/acc_phase [26]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [26]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [26])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<26>  (
    .I0(\BU2/U0/acc_phase [26]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [26])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<25>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [24]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [25]),
    .O(\BU2/U0/acc_phase_shaped_pre [25])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<25>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [24]),
    .DI(\BU2/U0/acc_phase [25]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [25]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [25])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<25>  (
    .I0(\BU2/U0/acc_phase [25]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [25])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<24>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [23]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [24]),
    .O(\BU2/U0/acc_phase_shaped_pre [24])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<24>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [23]),
    .DI(\BU2/U0/acc_phase [24]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [24]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [24])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<24>  (
    .I0(\BU2/U0/acc_phase [24]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [24])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<23>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [22]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [23]),
    .O(\BU2/U0/acc_phase_shaped_pre [23])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<23>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [22]),
    .DI(\BU2/U0/acc_phase [23]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [23]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [23])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<23>  (
    .I0(\BU2/U0/acc_phase [23]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [23])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<22>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [21]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [22]),
    .O(\BU2/U0/acc_phase_shaped_pre [22])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<22>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [21]),
    .DI(\BU2/U0/acc_phase [22]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [22]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [22])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<22>  (
    .I0(\BU2/U0/acc_phase [22]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [22])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<21>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [20]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [21]),
    .O(\BU2/U0/acc_phase_shaped_pre [21])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<21>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [20]),
    .DI(\BU2/U0/acc_phase [21]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [21]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [21])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<21>  (
    .I0(\BU2/U0/acc_phase [21]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [21])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<20>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [19]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [20]),
    .O(\BU2/U0/acc_phase_shaped_pre [20])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<20>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [19]),
    .DI(\BU2/U0/acc_phase [20]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [20]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [20])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<20>  (
    .I0(\BU2/U0/acc_phase [20]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [20])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<19>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [18]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [19]),
    .O(\BU2/U0/acc_phase_shaped_pre [19])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<19>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [18]),
    .DI(\BU2/U0/acc_phase [19]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [19]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [19])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<19>  (
    .I0(\BU2/U0/acc_phase [19]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [19])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<18>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [17]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [18]),
    .O(\BU2/U0/acc_phase_shaped_pre [18])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<18>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [17]),
    .DI(\BU2/U0/acc_phase [18]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [18]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [18])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<18>  (
    .I0(\BU2/U0/acc_phase [18]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [18])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<17>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [16]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [17]),
    .O(\BU2/U0/acc_phase_shaped_pre [17])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<17>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [16]),
    .DI(\BU2/U0/acc_phase [17]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [17]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [17])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<17>  (
    .I0(\BU2/U0/acc_phase [17]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [17])
  );
  XORCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_xor<16>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [15]),
    .LI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [16]),
    .O(\BU2/U0/acc_phase_shaped_pre [16])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<16>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [15]),
    .DI(\BU2/U0/acc_phase [16]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [16]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<16>  (
    .I0(\BU2/U0/acc_phase [16]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [16])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<15>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [14]),
    .DI(\BU2/U0/acc_phase [15]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [15]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<15>  (
    .I0(\BU2/U0/acc_phase [15]),
    .I1(\BU2/U0/dither_i [8]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [15])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<14>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [13]),
    .DI(\BU2/U0/acc_phase [14]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [14]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<14>  (
    .I0(\BU2/U0/acc_phase [14]),
    .I1(\BU2/U0/dither_i [7]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [14])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<13>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [12]),
    .DI(\BU2/U0/acc_phase [13]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [13]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<13>  (
    .I0(\BU2/U0/acc_phase [13]),
    .I1(\BU2/U0/dither_i [6]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [13])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<12>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [11]),
    .DI(\BU2/U0/acc_phase [12]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [12]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<12>  (
    .I0(\BU2/U0/acc_phase [12]),
    .I1(\BU2/U0/dither_i [5]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [12])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<11>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [10]),
    .DI(\BU2/U0/acc_phase [11]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [11]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<11>  (
    .I0(\BU2/U0/acc_phase [11]),
    .I1(\BU2/U0/dither_i [4]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [11])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<10>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [9]),
    .DI(\BU2/U0/acc_phase [10]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [10]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<10>  (
    .I0(\BU2/U0/acc_phase [10]),
    .I1(\BU2/U0/dither_i [3]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [10])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<9>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [8]),
    .DI(\BU2/U0/acc_phase [9]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [9]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<9>  (
    .I0(\BU2/U0/acc_phase [9]),
    .I1(\BU2/U0/dither_i [2]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [9])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<8>  (
    .CI(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [7]),
    .DI(\BU2/U0/acc_phase [8]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [8]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<8>  (
    .I0(\BU2/U0/acc_phase [8]),
    .I1(\BU2/U0/dither_i [1]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [8])
  );
  MUXCY   \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy<7>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/acc_phase [7]),
    .S(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [7]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_cy [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut<7>  (
    .I0(\BU2/U0/acc_phase [7]),
    .I1(\BU2/U0/dither_i [0]),
    .O(\BU2/U0/i_fabric.i_dither_add.i_dither_add/Madd_temp_lut [7])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<31>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [30]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [31]),
    .O(\BU2/U0/i_accum/acc_phase_b [31])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<31>  (
    .I0(\BU2/U0/acc_phase [31]),
    .I1(\BU2/U0/i_accum/phase_inc [31]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [31])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<30>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [29]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [30]),
    .O(\BU2/U0/i_accum/acc_phase_b [30])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<30>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [29]),
    .DI(\BU2/U0/acc_phase [30]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [30]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [30])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<30>  (
    .I0(\BU2/U0/acc_phase [30]),
    .I1(\BU2/U0/i_accum/phase_inc [30]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [30])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<29>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [28]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [29]),
    .O(\BU2/U0/i_accum/acc_phase_b [29])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<29>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [28]),
    .DI(\BU2/U0/acc_phase [29]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [29]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [29])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<29>  (
    .I0(\BU2/U0/acc_phase [29]),
    .I1(\BU2/U0/i_accum/phase_inc [29]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [29])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<28>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [27]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [28]),
    .O(\BU2/U0/i_accum/acc_phase_b [28])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<28>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [27]),
    .DI(\BU2/U0/acc_phase [28]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [28]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [28])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<28>  (
    .I0(\BU2/U0/acc_phase [28]),
    .I1(\BU2/U0/i_accum/phase_inc [28]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [28])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<27>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [26]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [27]),
    .O(\BU2/U0/i_accum/acc_phase_b [27])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<27>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [26]),
    .DI(\BU2/U0/acc_phase [27]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [27]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [27])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<27>  (
    .I0(\BU2/U0/acc_phase [27]),
    .I1(\BU2/U0/i_accum/phase_inc [27]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [27])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<26>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [25]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [26]),
    .O(\BU2/U0/i_accum/acc_phase_b [26])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<26>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [25]),
    .DI(\BU2/U0/acc_phase [26]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [26]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [26])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<26>  (
    .I0(\BU2/U0/acc_phase [26]),
    .I1(\BU2/U0/i_accum/phase_inc [26]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [26])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<25>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [24]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [25]),
    .O(\BU2/U0/i_accum/acc_phase_b [25])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<25>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [24]),
    .DI(\BU2/U0/acc_phase [25]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [25]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [25])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<25>  (
    .I0(\BU2/U0/acc_phase [25]),
    .I1(\BU2/U0/i_accum/phase_inc [25]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [25])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<24>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [23]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [24]),
    .O(\BU2/U0/i_accum/acc_phase_b [24])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<24>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [23]),
    .DI(\BU2/U0/acc_phase [24]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [24]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [24])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<24>  (
    .I0(\BU2/U0/acc_phase [24]),
    .I1(\BU2/U0/i_accum/phase_inc [24]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [24])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<23>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [22]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [23]),
    .O(\BU2/U0/i_accum/acc_phase_b [23])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<23>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [22]),
    .DI(\BU2/U0/acc_phase [23]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [23]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [23])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<23>  (
    .I0(\BU2/U0/acc_phase [23]),
    .I1(\BU2/U0/i_accum/phase_inc [23]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [23])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<22>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [21]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [22]),
    .O(\BU2/U0/i_accum/acc_phase_b [22])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<22>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [21]),
    .DI(\BU2/U0/acc_phase [22]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [22]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [22])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<22>  (
    .I0(\BU2/U0/acc_phase [22]),
    .I1(\BU2/U0/i_accum/phase_inc [22]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [22])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<21>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [20]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [21]),
    .O(\BU2/U0/i_accum/acc_phase_b [21])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<21>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [20]),
    .DI(\BU2/U0/acc_phase [21]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [21]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [21])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<21>  (
    .I0(\BU2/U0/acc_phase [21]),
    .I1(\BU2/U0/i_accum/phase_inc [21]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [21])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<20>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [19]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [20]),
    .O(\BU2/U0/i_accum/acc_phase_b [20])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<20>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [19]),
    .DI(\BU2/U0/acc_phase [20]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [20]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [20])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<20>  (
    .I0(\BU2/U0/acc_phase [20]),
    .I1(\BU2/U0/i_accum/phase_inc [20]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [20])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<19>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [18]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [19]),
    .O(\BU2/U0/i_accum/acc_phase_b [19])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<19>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [18]),
    .DI(\BU2/U0/acc_phase [19]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [19]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [19])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<19>  (
    .I0(\BU2/U0/acc_phase [19]),
    .I1(\BU2/U0/i_accum/phase_inc [19]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [19])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<18>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [17]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [18]),
    .O(\BU2/U0/i_accum/acc_phase_b [18])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<18>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [17]),
    .DI(\BU2/U0/acc_phase [18]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [18]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [18])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<18>  (
    .I0(\BU2/U0/acc_phase [18]),
    .I1(\BU2/U0/i_accum/phase_inc [18]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [18])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<17>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [16]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [17]),
    .O(\BU2/U0/i_accum/acc_phase_b [17])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<17>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [16]),
    .DI(\BU2/U0/acc_phase [17]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [17]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [17])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<17>  (
    .I0(\BU2/U0/acc_phase [17]),
    .I1(\BU2/U0/i_accum/phase_inc [17]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [17])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<16>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [15]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [16]),
    .O(\BU2/U0/i_accum/acc_phase_b [16])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<16>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [15]),
    .DI(\BU2/U0/acc_phase [16]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [16]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<16>  (
    .I0(\BU2/U0/acc_phase [16]),
    .I1(\BU2/U0/i_accum/phase_inc [16]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [16])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<15>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [14]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [15]),
    .O(\BU2/U0/i_accum/acc_phase_b [15])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<15>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [14]),
    .DI(\BU2/U0/acc_phase [15]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [15]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<15>  (
    .I0(\BU2/U0/acc_phase [15]),
    .I1(\BU2/U0/i_accum/phase_inc [15]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [15])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<14>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [13]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [14]),
    .O(\BU2/U0/i_accum/acc_phase_b [14])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<14>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [13]),
    .DI(\BU2/U0/acc_phase [14]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [14]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<14>  (
    .I0(\BU2/U0/acc_phase [14]),
    .I1(\BU2/U0/i_accum/phase_inc [14]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [14])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<13>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [12]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [13]),
    .O(\BU2/U0/i_accum/acc_phase_b [13])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<13>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [12]),
    .DI(\BU2/U0/acc_phase [13]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [13]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<13>  (
    .I0(\BU2/U0/acc_phase [13]),
    .I1(\BU2/U0/i_accum/phase_inc [13]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [13])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<12>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [11]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [12]),
    .O(\BU2/U0/i_accum/acc_phase_b [12])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<12>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [11]),
    .DI(\BU2/U0/acc_phase [12]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [12]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<12>  (
    .I0(\BU2/U0/i_accum/phase_inc [12]),
    .I1(\BU2/U0/acc_phase [12]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [12])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<11>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [10]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [11]),
    .O(\BU2/U0/i_accum/acc_phase_b [11])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<11>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [10]),
    .DI(\BU2/U0/acc_phase [11]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [11]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<11>  (
    .I0(\BU2/U0/i_accum/phase_inc [11]),
    .I1(\BU2/U0/acc_phase [11]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [11])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<10>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [9]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [10]),
    .O(\BU2/U0/i_accum/acc_phase_b [10])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<10>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [9]),
    .DI(\BU2/U0/acc_phase [10]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [10]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<10>  (
    .I0(\BU2/U0/i_accum/phase_inc [10]),
    .I1(\BU2/U0/acc_phase [10]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [10])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<9>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [8]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [9]),
    .O(\BU2/U0/i_accum/acc_phase_b [9])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<9>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [8]),
    .DI(\BU2/U0/acc_phase [9]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [9]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<9>  (
    .I0(\BU2/U0/i_accum/phase_inc [9]),
    .I1(\BU2/U0/acc_phase [9]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [9])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<8>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [7]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [8]),
    .O(\BU2/U0/i_accum/acc_phase_b [8])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<8>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [7]),
    .DI(\BU2/U0/acc_phase [8]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [8]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<8>  (
    .I0(\BU2/U0/i_accum/phase_inc [8]),
    .I1(\BU2/U0/acc_phase [8]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [8])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<7>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [6]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [7]),
    .O(\BU2/U0/i_accum/acc_phase_b [7])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<7>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [6]),
    .DI(\BU2/U0/acc_phase [7]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [7]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<7>  (
    .I0(\BU2/U0/i_accum/phase_inc [7]),
    .I1(\BU2/U0/acc_phase [7]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [7])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<6>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [5]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [6]),
    .O(\BU2/U0/i_accum/acc_phase_b [6])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<6>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [5]),
    .DI(\BU2/U0/acc_phase [6]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [6]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<6>  (
    .I0(\BU2/U0/acc_phase [6]),
    .I1(\BU2/U0/i_accum/phase_inc [6]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [6])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<5>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [4]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [5]),
    .O(\BU2/U0/i_accum/acc_phase_b [5])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<5>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [4]),
    .DI(\BU2/U0/acc_phase [5]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [5]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<5>  (
    .I0(\BU2/U0/acc_phase [5]),
    .I1(\BU2/U0/i_accum/phase_inc [5]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [5])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<4>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [3]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [4]),
    .O(\BU2/U0/i_accum/acc_phase_b [4])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<4>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [3]),
    .DI(\BU2/U0/acc_phase [4]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [4]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<4>  (
    .I0(\BU2/U0/acc_phase [4]),
    .I1(\BU2/U0/i_accum/phase_inc [4]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [4])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<3>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [2]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [3]),
    .O(\BU2/U0/i_accum/acc_phase_b [3])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<3>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [2]),
    .DI(\BU2/U0/acc_phase [3]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [3]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<3>  (
    .I0(\BU2/U0/acc_phase [3]),
    .I1(\BU2/U0/i_accum/phase_inc [3]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [3])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<2>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [1]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [2]),
    .O(\BU2/U0/i_accum/acc_phase_b [2])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<2>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [1]),
    .DI(\BU2/U0/acc_phase [2]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [2]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<2>  (
    .I0(\BU2/U0/acc_phase [2]),
    .I1(\BU2/U0/i_accum/phase_inc [2]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [2])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<1>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [0]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [1]),
    .O(\BU2/U0/i_accum/acc_phase_b [1])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<1>  (
    .CI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [0]),
    .DI(\BU2/U0/acc_phase [1]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [1]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<1>  (
    .I0(\BU2/U0/acc_phase [1]),
    .I1(\BU2/U0/i_accum/phase_inc [1]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [1])
  );
  XORCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_xor<0>  (
    .CI(\BU2/channel [0]),
    .LI(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [0]),
    .O(\BU2/U0/i_accum/acc_phase_b [0])
  );
  MUXCY   \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy<0>  (
    .CI(\BU2/channel [0]),
    .DI(\BU2/U0/acc_phase [0]),
    .S(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [0]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_cy [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut<0>  (
    .I0(\BU2/U0/acc_phase [0]),
    .I1(\BU2/U0/i_accum/phase_inc [0]),
    .O(\BU2/U0/i_accum/i_fabric.i_one_channel.i_accum/Madd_temp_lut [0])
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/channel [0])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_dither.i_dither/lfsr_10_not00011  (
    .I0(\BU2/U0/i_dither.i_dither/lfsr [11]),
    .I1(\BU2/U0/i_dither.i_dither/lfsr [18]),
    .O(\BU2/U0/i_dither.i_dither/lfsr_10_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_dither.i_dither/lfsr_1_not00011  (
    .I0(\BU2/U0/dither_i [1]),
    .I1(\BU2/U0/dither_i [8]),
    .O(\BU2/U0/i_dither.i_dither/lfsr_1_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_dither.i_dither/lfsr_2_not00011  (
    .I0(\BU2/U0/dither_i [2]),
    .I1(\BU2/U0/dither_i [9]),
    .O(\BU2/U0/i_dither.i_dither/lfsr_2_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_dither.i_dither/lfsr_3_not00011  (
    .I0(\BU2/U0/dither_i [3]),
    .I1(\BU2/U0/i_dither.i_dither/lfsr [11]),
    .O(\BU2/U0/i_dither.i_dither/lfsr_3_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_dither.i_dither/lfsr_4_not00011  (
    .I0(\BU2/U0/dither_i [4]),
    .I1(\BU2/U0/i_dither.i_dither/lfsr [12]),
    .O(\BU2/U0/i_dither.i_dither/lfsr_4_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_dither.i_dither/lfsr_5_not00011  (
    .I0(\BU2/U0/dither_i [5]),
    .I1(\BU2/U0/i_dither.i_dither/lfsr [13]),
    .O(\BU2/U0/i_dither.i_dither/lfsr_5_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_dither.i_dither/lfsr_6_not00011  (
    .I0(\BU2/U0/dither_i [6]),
    .I1(\BU2/U0/i_dither.i_dither/lfsr [14]),
    .O(\BU2/U0/i_dither.i_dither/lfsr_6_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_dither.i_dither/lfsr_7_not00011  (
    .I0(\BU2/U0/dither_i [7]),
    .I1(\BU2/U0/i_dither.i_dither/lfsr [15]),
    .O(\BU2/U0/i_dither.i_dither/lfsr_7_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_dither.i_dither/lfsr_8_not00011  (
    .I0(\BU2/U0/dither_i [8]),
    .I1(\BU2/U0/i_dither.i_dither/lfsr [16]),
    .O(\BU2/U0/i_dither.i_dither/lfsr_8_not0001 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/i_dither.i_dither/lfsr_9_not00011  (
    .I0(\BU2/U0/dither_i [9]),
    .I1(\BU2/U0/i_dither.i_dither/lfsr [17]),
    .O(\BU2/U0/i_dither.i_dither/lfsr_9_not0001 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_18  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/dither_i [7]),
    .R(sclr),
    .Q(\BU2/U0/i_dither.i_dither/lfsr [18])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_17  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/dither_i [6]),
    .R(sclr),
    .Q(\BU2/U0/i_dither.i_dither/lfsr [17])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/dither_i [4]),
    .R(sclr),
    .Q(\BU2/U0/i_dither.i_dither/lfsr [15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/dither_i [3]),
    .R(sclr),
    .Q(\BU2/U0/i_dither.i_dither/lfsr [14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_16  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/dither_i [5]),
    .R(sclr),
    .Q(\BU2/U0/i_dither.i_dither/lfsr [16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/dither_i [2]),
    .R(sclr),
    .Q(\BU2/U0/i_dither.i_dither/lfsr [13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/dither_i [1]),
    .R(sclr),
    .Q(\BU2/U0/i_dither.i_dither/lfsr [12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/dither_i [0]),
    .R(sclr),
    .Q(\BU2/U0/i_dither.i_dither/lfsr [11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_dither.i_dither/lfsr_9_not0001 ),
    .R(sclr),
    .Q(\BU2/U0/dither_i [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_dither.i_dither/lfsr_8_not0001 ),
    .R(sclr),
    .Q(\BU2/U0/dither_i [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_dither.i_dither/lfsr_7_not0001 ),
    .R(sclr),
    .Q(\BU2/U0/dither_i [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_dither.i_dither/lfsr_6_not0001 ),
    .R(sclr),
    .Q(\BU2/U0/dither_i [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_dither.i_dither/lfsr_4_not0001 ),
    .R(sclr),
    .Q(\BU2/U0/dither_i [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_dither.i_dither/lfsr_3_not0001 ),
    .R(sclr),
    .Q(\BU2/U0/dither_i [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_dither.i_dither/lfsr_5_not0001 ),
    .R(sclr),
    .Q(\BU2/U0/dither_i [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_dither.i_dither/lfsr_2_not0001 ),
    .R(sclr),
    .Q(\BU2/U0/dither_i [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_dither.i_dither/lfsr_1_not0001 ),
    .R(sclr),
    .Q(\BU2/U0/dither_i [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_dither.i_dither/lfsr_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_dither.i_dither/lfsr_10_not0001 ),
    .R(sclr),
    .Q(\BU2/U0/dither_i [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_32  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [31]),
    .Q(\BU2/U0/acc_phase_shaped [31])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_31  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [30]),
    .Q(\BU2/U0/acc_phase_shaped [30])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_30  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [29]),
    .Q(\BU2/U0/acc_phase_shaped [29])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_29  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [28]),
    .Q(\BU2/U0/acc_phase_shaped [28])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_28  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [27]),
    .Q(\BU2/U0/acc_phase_shaped [27])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_27  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [26]),
    .Q(\BU2/U0/acc_phase_shaped [26])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_26  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [25]),
    .Q(\BU2/U0/acc_phase_shaped [25])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_25  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [24]),
    .Q(\BU2/U0/acc_phase_shaped [24])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_24  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [23]),
    .Q(\BU2/U0/acc_phase_shaped [23])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_23  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [22]),
    .Q(\BU2/U0/acc_phase_shaped [22])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_22  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [21]),
    .Q(\BU2/U0/acc_phase_shaped [21])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_21  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [20]),
    .Q(\BU2/U0/acc_phase_shaped [20])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_20  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [19]),
    .Q(\BU2/U0/acc_phase_shaped [19])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_19  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [18]),
    .Q(\BU2/U0/acc_phase_shaped [18])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_18  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [17]),
    .Q(\BU2/U0/acc_phase_shaped [17])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_fabric.i_dither_pipe/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped_pre [16]),
    .Q(\BU2/U0/acc_phase_shaped [16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_18  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [48]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[17])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [47]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [46]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [45]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [44]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [43]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [42]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [41]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [40]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [39]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [38]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [37]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [36]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [35]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [34]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [33]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [32]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_cosine.i_cos_op/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_cos [31]),
    .R(\BU2/channel [0]),
    .Q(cosine_3[0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_18  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [48]),
    .R(\BU2/channel [0]),
    .Q(sine_4[17])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [47]),
    .R(\BU2/channel [0]),
    .Q(sine_4[16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [46]),
    .R(\BU2/channel [0]),
    .Q(sine_4[15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [45]),
    .R(\BU2/channel [0]),
    .Q(sine_4[14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [44]),
    .R(\BU2/channel [0]),
    .Q(sine_4[13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [43]),
    .R(\BU2/channel [0]),
    .Q(sine_4[12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [42]),
    .R(\BU2/channel [0]),
    .Q(sine_4[11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [41]),
    .R(\BU2/channel [0]),
    .Q(sine_4[10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [40]),
    .R(\BU2/channel [0]),
    .Q(sine_4[9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [39]),
    .R(\BU2/channel [0]),
    .Q(sine_4[8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [38]),
    .R(\BU2/channel [0]),
    .Q(sine_4[7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [37]),
    .R(\BU2/channel [0]),
    .Q(sine_4[6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [36]),
    .R(\BU2/channel [0]),
    .Q(sine_4[5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [35]),
    .R(\BU2/channel [0]),
    .Q(sine_4[4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [34]),
    .R(\BU2/channel [0]),
    .Q(sine_4[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [33]),
    .R(\BU2/channel [0]),
    .Q(sine_4[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [32]),
    .R(\BU2/channel [0]),
    .Q(sine_4[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_has_sine.i_sin_op/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/final_sin [31]),
    .R(\BU2/channel [0]),
    .Q(sine_4[0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_32  (
    .C(clk),
    .CE(we),
    .D(data_2[31]),
    .Q(\BU2/U0/i_accum/phase_inc [31])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_31  (
    .C(clk),
    .CE(we),
    .D(data_2[30]),
    .Q(\BU2/U0/i_accum/phase_inc [30])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_30  (
    .C(clk),
    .CE(we),
    .D(data_2[29]),
    .Q(\BU2/U0/i_accum/phase_inc [29])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_29  (
    .C(clk),
    .CE(we),
    .D(data_2[28]),
    .Q(\BU2/U0/i_accum/phase_inc [28])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_28  (
    .C(clk),
    .CE(we),
    .D(data_2[27]),
    .Q(\BU2/U0/i_accum/phase_inc [27])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_27  (
    .C(clk),
    .CE(we),
    .D(data_2[26]),
    .Q(\BU2/U0/i_accum/phase_inc [26])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_26  (
    .C(clk),
    .CE(we),
    .D(data_2[25]),
    .Q(\BU2/U0/i_accum/phase_inc [25])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_25  (
    .C(clk),
    .CE(we),
    .D(data_2[24]),
    .Q(\BU2/U0/i_accum/phase_inc [24])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_24  (
    .C(clk),
    .CE(we),
    .D(data_2[23]),
    .Q(\BU2/U0/i_accum/phase_inc [23])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_23  (
    .C(clk),
    .CE(we),
    .D(data_2[22]),
    .Q(\BU2/U0/i_accum/phase_inc [22])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_22  (
    .C(clk),
    .CE(we),
    .D(data_2[21]),
    .Q(\BU2/U0/i_accum/phase_inc [21])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_21  (
    .C(clk),
    .CE(we),
    .D(data_2[20]),
    .Q(\BU2/U0/i_accum/phase_inc [20])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_20  (
    .C(clk),
    .CE(we),
    .D(data_2[19]),
    .Q(\BU2/U0/i_accum/phase_inc [19])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_19  (
    .C(clk),
    .CE(we),
    .D(data_2[18]),
    .Q(\BU2/U0/i_accum/phase_inc [18])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_18  (
    .C(clk),
    .CE(we),
    .D(data_2[17]),
    .Q(\BU2/U0/i_accum/phase_inc [17])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .CE(we),
    .D(data_2[16]),
    .Q(\BU2/U0/i_accum/phase_inc [16])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .CE(we),
    .D(data_2[15]),
    .Q(\BU2/U0/i_accum/phase_inc [15])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .CE(we),
    .D(data_2[14]),
    .Q(\BU2/U0/i_accum/phase_inc [14])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .CE(we),
    .D(data_2[13]),
    .Q(\BU2/U0/i_accum/phase_inc [13])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .CE(we),
    .D(data_2[12]),
    .Q(\BU2/U0/i_accum/phase_inc [12])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .CE(we),
    .D(data_2[11]),
    .Q(\BU2/U0/i_accum/phase_inc [11])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .CE(we),
    .D(data_2[10]),
    .Q(\BU2/U0/i_accum/phase_inc [10])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .CE(we),
    .D(data_2[9]),
    .Q(\BU2/U0/i_accum/phase_inc [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(we),
    .D(data_2[8]),
    .Q(\BU2/U0/i_accum/phase_inc [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(we),
    .D(data_2[7]),
    .Q(\BU2/U0/i_accum/phase_inc [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(we),
    .D(data_2[6]),
    .Q(\BU2/U0/i_accum/phase_inc [6])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(we),
    .D(data_2[5]),
    .Q(\BU2/U0/i_accum/phase_inc [5])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(we),
    .D(data_2[4]),
    .Q(\BU2/U0/i_accum/phase_inc [4])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(we),
    .D(data_2[3]),
    .Q(\BU2/U0/i_accum/phase_inc [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(we),
    .D(data_2[2]),
    .Q(\BU2/U0/i_accum/phase_inc [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(we),
    .D(data_2[1]),
    .Q(\BU2/U0/i_accum/phase_inc [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_common.i_phase_inc_solo.i_prog_freq.i_prog_freq/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(we),
    .D(data_2[0]),
    .Q(\BU2/U0/i_accum/phase_inc [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_32  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [31]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [31])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_31  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [30]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [30])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_30  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [29]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [29])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_29  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [28]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [28])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_28  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [27]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [27])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_27  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [26]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [26])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_26  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [25]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [25])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_25  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [24]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [24])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_24  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [23]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [23])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_23  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [22]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [22])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_22  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [21]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [21])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_21  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [20]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [20])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_20  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [19]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [19])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_19  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [18]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [18])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_18  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [17]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [17])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [16]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [15]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [14]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [13]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [12]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [11]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [10]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [9]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [8]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [7]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [6]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [5]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [4]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [3]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [2]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [1]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_accum/i_fabric.i_common.i_phase_acc/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_accum/acc_phase_b [0]),
    .R(sclr),
    .Q(\BU2/U0/acc_phase [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/Madd_asyn_sin_ls1_cy [8]),
    .Q(\BU2/U0/i_rom/sin_ls1 [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [8]),
    .Q(\BU2/U0/i_rom/sin_ls1 [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [7]),
    .Q(\BU2/U0/i_rom/sin_ls1 [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [6]),
    .Q(\BU2/U0/i_rom/sin_ls1 [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [5]),
    .Q(\BU2/U0/i_rom/sin_ls1 [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [4]),
    .Q(\BU2/U0/i_rom/sin_ls1 [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [3]),
    .Q(\BU2/U0/i_rom/sin_ls1 [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [2]),
    .Q(\BU2/U0/i_rom/sin_ls1 [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [1]),
    .Q(\BU2/U0/i_rom/sin_ls1 [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ls/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ls1 [0]),
    .Q(\BU2/U0/i_rom/sin_ls1 [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ls/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/Madd_asyn_cos_ls1_cy [8]),
    .Q(\BU2/U0/i_rom/cos_ls1 [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ls/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ls1 [8]),
    .Q(\BU2/U0/i_rom/cos_ls1 [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ls/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ls1 [7]),
    .Q(\BU2/U0/i_rom/cos_ls1 [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ls/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ls1 [6]),
    .Q(\BU2/U0/i_rom/cos_ls1 [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ls/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ls1 [5]),
    .Q(\BU2/U0/i_rom/cos_ls1 [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ls/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ls1 [4]),
    .Q(\BU2/U0/i_rom/cos_ls1 [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ls/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ls1 [3]),
    .Q(\BU2/U0/i_rom/cos_ls1 [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ls/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ls1 [2]),
    .Q(\BU2/U0/i_rom/cos_ls1 [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ls/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ls1 [1]),
    .Q(\BU2/U0/i_rom/cos_ls1 [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ls/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ls1 [0]),
    .Q(\BU2/U0/i_rom/cos_ls1 [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [8]),
    .Q(\BU2/U0/i_rom/sin_ms1 [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [7]),
    .Q(\BU2/U0/i_rom/sin_ms1 [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [6]),
    .Q(\BU2/U0/i_rom/sin_ms1 [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [5]),
    .Q(\BU2/U0/i_rom/sin_ms1 [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [4]),
    .Q(\BU2/U0/i_rom/sin_ms1 [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [3]),
    .Q(\BU2/U0/i_rom/sin_ms1 [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [2]),
    .Q(\BU2/U0/i_rom/sin_ms1 [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [1]),
    .Q(\BU2/U0/i_rom/sin_ms1 [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_sin_ms/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms1 [0]),
    .Q(\BU2/U0/i_rom/sin_ms1 [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ms/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms1 [8]),
    .Q(\BU2/U0/i_rom/cos_ms1 [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ms/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms1 [7]),
    .Q(\BU2/U0/i_rom/cos_ms1 [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ms/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms1 [6]),
    .Q(\BU2/U0/i_rom/cos_ms1 [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ms/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms1 [5]),
    .Q(\BU2/U0/i_rom/cos_ms1 [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ms/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms1 [4]),
    .Q(\BU2/U0/i_rom/cos_ms1 [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ms/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms1 [3]),
    .Q(\BU2/U0/i_rom/cos_ms1 [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ms/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms1 [2]),
    .Q(\BU2/U0/i_rom/cos_ms1 [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ms/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms1 [1]),
    .Q(\BU2/U0/i_rom/cos_ms1 [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_original_cos_ms/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms1 [0]),
    .Q(\BU2/U0/i_rom/cos_ms1 [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [8]),
    .Q(\BU2/U0/final_sin [48])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [7]),
    .Q(\BU2/U0/final_sin [47])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [6]),
    .Q(\BU2/U0/final_sin [46])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [5]),
    .Q(\BU2/U0/final_sin [45])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [4]),
    .Q(\BU2/U0/final_sin [44])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [3]),
    .Q(\BU2/U0/final_sin [43])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [2]),
    .Q(\BU2/U0/final_sin [42])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [1]),
    .Q(\BU2/U0/final_sin [41])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_ms2 [0]),
    .Q(\BU2/U0/final_sin [40])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/sin_ls1 [8]),
    .Q(\BU2/U0/final_sin [39])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/sin_ls1 [7]),
    .Q(\BU2/U0/final_sin [38])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/sin_ls1 [6]),
    .Q(\BU2/U0/final_sin [37])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/sin_ls1 [5]),
    .Q(\BU2/U0/final_sin [36])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/sin_ls1 [4]),
    .Q(\BU2/U0/final_sin [35])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/sin_ls1 [3]),
    .Q(\BU2/U0/final_sin [34])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/sin_ls1 [2]),
    .Q(\BU2/U0/final_sin [33])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/sin_ls1 [1]),
    .Q(\BU2/U0/final_sin [32])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/sin_ls1 [0]),
    .Q(\BU2/U0/final_sin [31])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms2 [8]),
    .Q(\BU2/U0/final_cos [48])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms2 [7]),
    .Q(\BU2/U0/final_cos [47])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms2 [6]),
    .Q(\BU2/U0/final_cos [46])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms2 [5]),
    .Q(\BU2/U0/final_cos [45])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms2 [4]),
    .Q(\BU2/U0/final_cos [44])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms2 [3]),
    .Q(\BU2/U0/final_cos [43])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms2 [2]),
    .Q(\BU2/U0/final_cos [42])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms2 [1]),
    .Q(\BU2/U0/final_cos [41])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_ms2 [0]),
    .Q(\BU2/U0/final_cos [40])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/cos_ls1 [8]),
    .Q(\BU2/U0/final_cos [39])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/cos_ls1 [7]),
    .Q(\BU2/U0/final_cos [38])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/cos_ls1 [6]),
    .Q(\BU2/U0/final_cos [37])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/cos_ls1 [5]),
    .Q(\BU2/U0/final_cos [36])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/cos_ls1 [4]),
    .Q(\BU2/U0/final_cos [35])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/cos_ls1 [3]),
    .Q(\BU2/U0/final_cos [34])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/cos_ls1 [2]),
    .Q(\BU2/U0/final_cos [33])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/cos_ls1 [1]),
    .Q(\BU2/U0/final_cos [32])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/cos_ls1 [0]),
    .Q(\BU2/U0/final_cos [31])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [16]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [16])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [15]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [15])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [14]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [14])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [13]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [13])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [12]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [12])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [11]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [11])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [10]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [10])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [9]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [8]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [7]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [6]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [5]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [4]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [3]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [2]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [1]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_a/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_sin_RAM_op [0]),
    .Q(\BU2/U0/i_rom/sin_RAM_op [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_17  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [16]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [16])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_16  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [15]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [15])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [14]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [14])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [13]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [13])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [12]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [12])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [11]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [11])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [10]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [10])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [9]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [8]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [7]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [6]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [5]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [4]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [3]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [2]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [1]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_rom_reg_b/opt_has_reg.i_reg/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/asyn_cos_RAM_op [0]),
    .Q(\BU2/U0/i_rom/cos_RAM_op [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/Q_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/Mshreg_Q_1_657 ),
    .Q(\BU2/U0/i_rom/asyn_sin_ms1 [8])
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/Mshreg_Q_1  (
    .A0(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/N1 ),
    .A1(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/N0 ),
    .A2(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/N0 ),
    .A3(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/N0 ),
    .CE(ce),
    .CLK(clk),
    .D(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q [1]),
    .Q(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/Mshreg_Q_1_657 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/Q_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/Mshreg_Q_0_656 ),
    .Q(\BU2/U0/i_rom/quadrant_bypass_b [0])
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/Mshreg_Q_0  (
    .A0(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/N1 ),
    .A1(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/N0 ),
    .A2(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/N0 ),
    .A3(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/N0 ),
    .CE(ce),
    .CLK(clk),
    .D(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q [0]),
    .Q(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/Mshreg_Q_0_656 )
  );
  VCC   \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/XST_VCC  (
    .P(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/N1 )
  );
  GND   \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/XST_GND  (
    .G(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/N0 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped [31]),
    .Q(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/acc_phase_shaped [30]),
    .Q(\BU2/U0/i_rom/i_rtl.i_quarter_table.i_addr_reg_c/first_q [0])
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
