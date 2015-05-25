////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.31
//  \   \         Application: netgen
//  /   /         Filename: mpy18x18.v
// /___/   /\     Timestamp: Fri Aug 08 15:20:34 2008
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\modem\telemetry\coregen\tmp\_cg\mpy18x18.ngc C:\modem\telemetry\coregen\tmp\_cg\mpy18x18.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/mpy18x18.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/mpy18x18.v
// # of Modules	: 1
// Design Name	: mpy18x18
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

module mpy18x18 (
  sclr, clk, a, b, p
);
  input sclr;
  input clk;
  input [17 : 0] a;
  input [17 : 0] b;
  output [35 : 0] p;
  
  // synthesis translate_off
  
  wire \BU2/N1 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_CARRYOUT_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<47>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<46>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<45>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<44>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<43>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<42>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<41>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<40>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<39>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<38>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<37>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<36>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<35>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<34>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<33>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<32>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<47>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<46>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<45>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<44>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<43>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<42>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<41>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<40>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<39>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<38>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<37>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<36>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<47>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<46>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<45>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<44>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<43>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<42>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<41>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<40>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<39>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<38>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<37>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<36>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<35>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<34>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<33>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<32>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<47>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<46>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<45>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<44>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<43>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<42>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<41>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<40>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<39>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<38>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<37>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<36>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<35>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<34>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<33>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<32>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<0>_UNCONNECTED ;
  wire [17 : 0] a_2;
  wire [17 : 0] b_3;
  wire [35 : 0] \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out ;
  wire [0 : 0] \BU2/zero_detect ;
  assign
    a_2[17] = a[17],
    a_2[16] = a[16],
    a_2[15] = a[15],
    a_2[14] = a[14],
    a_2[13] = a[13],
    a_2[12] = a[12],
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
    b_3[17] = b[17],
    b_3[16] = b[16],
    b_3[15] = b[15],
    b_3[14] = b[14],
    b_3[13] = b[13],
    b_3[12] = b[12],
    b_3[11] = b[11],
    b_3[10] = b[10],
    b_3[9] = b[9],
    b_3[8] = b[8],
    b_3[7] = b[7],
    b_3[6] = b[6],
    b_3[5] = b[5],
    b_3[4] = b[4],
    b_3[3] = b[3],
    b_3[2] = b[2],
    b_3[1] = b[1],
    b_3[0] = b[0],
    p[35] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [35],
    p[34] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [34],
    p[33] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [33],
    p[32] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [32],
    p[31] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [31],
    p[30] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [30],
    p[29] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [29],
    p[28] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [28],
    p[27] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [27],
    p[26] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [26],
    p[25] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [25],
    p[24] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [24],
    p[23] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [23],
    p[22] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [22],
    p[21] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [21],
    p[20] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [20],
    p[19] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [19],
    p[18] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [18],
    p[17] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [17],
    p[16] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [16],
    p[15] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [15],
    p[14] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [14],
    p[13] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [13],
    p[12] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [12],
    p[11] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [11],
    p[10] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [10],
    p[9] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [9],
    p[8] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [8],
    p[7] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [7],
    p[6] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [6],
    p[5] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [5],
    p[4] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [4],
    p[3] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [3],
    p[2] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [2],
    p[1] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [1],
    p[0] = \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  DSP48A #(
    .CARRYINSEL ( "OPMODE5" ),
    .A0REG ( 1 ),
    .A1REG ( 0 ),
    .B0REG ( 1 ),
    .B1REG ( 0 ),
    .DREG ( 0 ),
    .CREG ( 0 ),
    .MREG ( 1 ),
    .PREG ( 1 ),
    .CARRYINREG ( 0 ),
    .OPMODEREG ( 0 ),
    .RSTTYPE ( "SYNC" ))
  \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000  (
    .CARRYIN(\BU2/zero_detect [0]),
    .CARRYOUT(\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_CARRYOUT_UNCONNECTED ),
    .CLK(clk),
    .RSTA(sclr),
    .RSTB(sclr),
    .RSTM(sclr),
    .RSTP(sclr),
    .RSTC(\BU2/zero_detect [0]),
    .RSTD(\BU2/zero_detect [0]),
    .RSTCARRYIN(\BU2/zero_detect [0]),
    .RSTOPMODE(\BU2/zero_detect [0]),
    .CEA(\BU2/N1 ),
    .CEB(\BU2/N1 ),
    .CEM(\BU2/N1 ),
    .CEP(\BU2/N1 ),
    .CEC(\BU2/zero_detect [0]),
    .CED(\BU2/zero_detect [0]),
    .CECARRYIN(\BU2/zero_detect [0]),
    .CEOPMODE(\BU2/zero_detect [0]),
    .A({b_3[17], b_3[16], b_3[15], b_3[14], b_3[13], b_3[12], b_3[11], b_3[10], b_3[9], b_3[8], b_3[7], b_3[6], b_3[5], b_3[4], b_3[3], b_3[2], b_3[1]
, b_3[0]}),
    .B({a_2[17], a_2[16], a_2[15], a_2[14], a_2[13], a_2[12], a_2[11], a_2[10], a_2[9], a_2[8], a_2[7], a_2[6], a_2[5], a_2[4], a_2[3], a_2[2], a_2[1]
, a_2[0]}),
    .D({\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<17>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<16>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<15>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<14>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<13>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<12>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<11>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<10>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<9>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<8>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<7>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<6>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<5>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<4>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<3>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<2>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<1>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_D<0>_UNCONNECTED }),
    .C({\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<47>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<46>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<45>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<44>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<43>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<42>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<41>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<40>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<39>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<38>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<37>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<36>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<35>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<34>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<33>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<32>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<31>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<30>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<29>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<28>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<27>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<26>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<25>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<24>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<23>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<22>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<21>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<20>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<19>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<18>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<17>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<16>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<15>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<14>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<13>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<12>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<11>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<10>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<9>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<8>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<7>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<6>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<5>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<4>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<3>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<2>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<1>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_C<0>_UNCONNECTED }),
    .P({\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<47>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<46>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<45>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<44>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<43>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<42>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<41>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<40>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<39>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<38>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<37>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_P<36>_UNCONNECTED , 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [35], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [34], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [33], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [32], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [31], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [30], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [29], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [28], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [27], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [26], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [25], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [24], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [23], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [22], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [21], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [20], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [19], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [18], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [17], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [16], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [15], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [14], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [13], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [12], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [11], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [10], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [9], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [8], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [7], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [6], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [5], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [4], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [3], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [2], 
\BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [1], \BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/block_mult_out [0]}),
    .OPMODE({\BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], \BU2/zero_detect [0], 
\BU2/zero_detect [0], \BU2/N1 }),
    .PCIN({\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<47>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<46>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<45>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<44>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<43>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<42>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<41>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<40>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<39>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<38>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<37>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<36>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<35>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<34>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<33>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<32>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<31>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<30>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<29>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<28>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<27>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<26>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<25>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<24>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<23>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<22>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<21>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<20>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<19>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<18>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<17>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<16>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<15>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<14>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<13>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<12>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<11>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<10>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<9>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<8>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<7>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<6>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<5>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<4>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<3>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<2>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<1>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCIN<0>_UNCONNECTED }),
    .PCOUT({\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<47>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<46>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<45>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<44>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<43>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<42>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<41>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<40>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<39>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<38>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<37>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<36>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<35>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<34>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<33>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<32>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<31>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<30>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<29>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<28>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<27>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<26>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<25>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<24>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<23>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<22>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<21>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<20>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<19>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<18>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<17>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<16>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<15>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<14>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<13>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<12>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<11>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<10>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<9>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<8>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<7>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<6>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<5>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<4>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<3>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<2>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<1>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_PCOUT<0>_UNCONNECTED }),
    .BCOUT({\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<17>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<16>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<15>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<14>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<13>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<12>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<11>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<10>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<9>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<8>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<7>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<6>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<5>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<4>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<3>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<2>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<1>_UNCONNECTED , 
\NLW_BU2/U0/gEMBEDDED_MULT.gHYBRID.iHYBRID/single_mult.dsp_based.iDSP/Mmult__mult0000_BCOUT<0>_UNCONNECTED })
  );
  VCC   \BU2/XST_VCC  (
    .P(\BU2/N1 )
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
