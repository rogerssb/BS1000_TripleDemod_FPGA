////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: L.46
//  \   \         Application: netgen
//  /   /         Filename: soqpskFir.v
// /___/   /\     Timestamp: Wed Aug 26 11:03:59 2009
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog .\tmp\_cg\soqpskFir.ngc .\tmp\_cg\soqpskFir.v 
// Device	: 3sd1800acs484-4
// Input file	: ./tmp/_cg/soqpskFir.ngc
// Output file	: ./tmp/_cg/soqpskFir.v
// # of Modules	: 1
// Design Name	: soqpskFir
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

module soqpskFir (
  rfd, rdy, nd, clk, dout, din
)/* synthesis syn_black_box syn_noprune=1 */;
  output rfd;
  output rdy;
  input nd;
  input clk;
  output [17 : 0] dout;
  input [2 : 0] din;
  
  // synthesis translate_off
  
  wire NlwRenamedSig_OI_rfd;
  wire \blk00000003/sig0000003f ;
  wire \blk00000003/sig0000003e ;
  wire \blk00000003/sig0000003d ;
  wire \blk00000003/sig0000003c ;
  wire \blk00000003/sig0000003b ;
  wire \blk00000003/sig0000003a ;
  wire \blk00000003/sig00000039 ;
  wire \blk00000003/sig00000038 ;
  wire \blk00000003/sig00000037 ;
  wire \blk00000003/sig00000036 ;
  wire \blk00000003/sig00000035 ;
  wire \blk00000003/sig0000001f ;
  wire \blk00000003/sig0000001e ;
  wire \blk00000003/sig0000001d ;
  wire \blk00000003/sig0000001c ;
  wire \blk00000003/sig0000001b ;
  wire \blk00000003/sig0000001a ;
  wire \blk00000003/sig00000019 ;
  wire \blk00000003/sig00000018 ;
  wire \blk00000003/sig00000017 ;
  wire \blk00000003/sig00000016 ;
  wire \blk00000003/sig00000015 ;
  wire \blk00000003/sig00000014 ;
  wire \blk00000003/sig00000013 ;
  wire \blk00000003/sig00000012 ;
  wire \blk00000003/sig00000011 ;
  wire \blk00000003/sig00000010 ;
  wire \blk00000003/sig0000000f ;
  wire \blk00000003/sig0000000e ;
  wire \blk00000003/sig0000000d ;
  wire \blk00000003/sig0000000c ;
  wire \blk00000003/sig0000000b ;
  wire \blk00000003/sig0000000a ;
  wire \blk00000003/sig00000009 ;
  wire \blk00000003/sig00000007 ;
  wire \blk00000003/sig00000005 ;
  wire \blk00000003/sig00000003 ;
  wire \blk00000003/sig00000002 ;
  wire \blk00000003/blk00000005/sig0000015d ;
  wire \blk00000003/blk00000005/sig0000015c ;
  wire \blk00000003/blk00000005/sig0000015b ;
  wire \blk00000003/blk00000005/sig0000015a ;
  wire \blk00000003/blk00000005/sig00000159 ;
  wire \blk00000003/blk00000005/sig00000158 ;
  wire \blk00000003/blk00000005/sig00000157 ;
  wire \blk00000003/blk00000005/sig00000156 ;
  wire \blk00000003/blk00000005/sig00000155 ;
  wire \blk00000003/blk00000005/sig00000154 ;
  wire \blk00000003/blk00000005/sig00000153 ;
  wire \blk00000003/blk00000005/sig00000152 ;
  wire \blk00000003/blk00000005/sig00000151 ;
  wire \blk00000003/blk00000005/sig00000150 ;
  wire \blk00000003/blk00000005/sig0000014f ;
  wire \blk00000003/blk00000005/sig0000014e ;
  wire \blk00000003/blk00000005/sig0000014d ;
  wire \blk00000003/blk00000005/sig0000014c ;
  wire \blk00000003/blk00000005/sig0000014b ;
  wire \blk00000003/blk00000005/sig0000014a ;
  wire \blk00000003/blk00000005/sig00000149 ;
  wire \blk00000003/blk00000005/sig00000148 ;
  wire \blk00000003/blk00000005/sig00000147 ;
  wire \blk00000003/blk00000005/sig00000146 ;
  wire \blk00000003/blk00000005/sig00000145 ;
  wire \blk00000003/blk00000005/sig00000144 ;
  wire \blk00000003/blk00000005/sig00000143 ;
  wire \blk00000003/blk00000005/sig00000142 ;
  wire \blk00000003/blk00000005/sig00000141 ;
  wire \blk00000003/blk00000005/sig00000140 ;
  wire \blk00000003/blk00000005/sig0000013f ;
  wire \blk00000003/blk00000005/sig0000013e ;
  wire \blk00000003/blk00000005/sig0000013d ;
  wire \blk00000003/blk00000005/sig0000013c ;
  wire \blk00000003/blk00000005/sig0000013b ;
  wire \blk00000003/blk00000005/sig0000013a ;
  wire \blk00000003/blk00000005/sig00000139 ;
  wire \blk00000003/blk00000005/sig00000138 ;
  wire \blk00000003/blk00000005/sig00000137 ;
  wire \blk00000003/blk00000005/sig00000136 ;
  wire \blk00000003/blk00000005/sig00000135 ;
  wire \blk00000003/blk00000005/sig00000134 ;
  wire \blk00000003/blk00000005/sig00000133 ;
  wire \blk00000003/blk00000005/sig00000132 ;
  wire \blk00000003/blk00000005/sig00000131 ;
  wire \blk00000003/blk00000005/sig00000130 ;
  wire \blk00000003/blk00000005/sig0000012f ;
  wire \blk00000003/blk00000005/sig0000012e ;
  wire \blk00000003/blk00000005/sig0000012d ;
  wire \blk00000003/blk00000005/sig0000012c ;
  wire \blk00000003/blk00000005/sig0000012b ;
  wire \blk00000003/blk00000005/sig0000012a ;
  wire \blk00000003/blk00000005/sig00000129 ;
  wire \blk00000003/blk00000005/sig00000128 ;
  wire \blk00000003/blk00000005/sig00000127 ;
  wire \blk00000003/blk00000005/sig00000126 ;
  wire \blk00000003/blk00000005/sig00000125 ;
  wire \blk00000003/blk00000005/sig00000124 ;
  wire \blk00000003/blk00000005/sig00000123 ;
  wire \blk00000003/blk00000005/sig00000122 ;
  wire \blk00000003/blk00000005/sig00000121 ;
  wire \blk00000003/blk00000005/sig00000120 ;
  wire \blk00000003/blk00000005/sig0000011f ;
  wire \blk00000003/blk00000005/sig0000011e ;
  wire \blk00000003/blk00000005/sig0000011d ;
  wire \blk00000003/blk00000005/sig0000011c ;
  wire \blk00000003/blk00000005/sig0000011b ;
  wire \blk00000003/blk00000005/sig0000011a ;
  wire \blk00000003/blk00000005/sig00000119 ;
  wire \blk00000003/blk00000005/sig00000118 ;
  wire \blk00000003/blk00000005/sig00000117 ;
  wire \blk00000003/blk00000005/sig00000116 ;
  wire \blk00000003/blk00000005/sig00000115 ;
  wire \blk00000003/blk00000005/sig00000114 ;
  wire \blk00000003/blk00000005/sig00000113 ;
  wire \blk00000003/blk00000005/sig00000112 ;
  wire \blk00000003/blk00000005/sig00000111 ;
  wire \blk00000003/blk00000005/sig00000110 ;
  wire \blk00000003/blk00000005/sig0000010f ;
  wire \blk00000003/blk00000005/sig0000010e ;
  wire \blk00000003/blk00000005/sig0000010d ;
  wire \blk00000003/blk00000005/sig0000010c ;
  wire \blk00000003/blk00000005/sig0000010b ;
  wire \blk00000003/blk00000005/sig0000010a ;
  wire \blk00000003/blk00000005/sig00000109 ;
  wire \blk00000003/blk00000005/sig00000108 ;
  wire \blk00000003/blk00000005/sig00000107 ;
  wire \blk00000003/blk00000005/sig00000106 ;
  wire \blk00000003/blk00000005/sig00000105 ;
  wire \blk00000003/blk00000005/sig00000104 ;
  wire \blk00000003/blk00000005/sig00000103 ;
  wire \blk00000003/blk00000005/sig00000102 ;
  wire \blk00000003/blk00000005/sig00000101 ;
  wire \blk00000003/blk00000005/sig00000100 ;
  wire \blk00000003/blk00000005/sig000000ff ;
  wire \blk00000003/blk00000005/sig000000fe ;
  wire \blk00000003/blk00000005/sig000000fd ;
  wire \blk00000003/blk00000005/sig000000fc ;
  wire \blk00000003/blk00000005/sig000000fb ;
  wire \blk00000003/blk00000005/sig000000fa ;
  wire \blk00000003/blk00000005/sig000000f9 ;
  wire \blk00000003/blk00000005/sig000000f8 ;
  wire \blk00000003/blk00000005/sig000000f7 ;
  wire \blk00000003/blk00000005/sig000000f6 ;
  wire \blk00000003/blk00000005/sig000000f5 ;
  wire \blk00000003/blk00000005/sig000000f4 ;
  wire \blk00000003/blk00000005/sig000000f3 ;
  wire \blk00000003/blk00000005/sig000000f2 ;
  wire \blk00000003/blk00000005/sig000000f1 ;
  wire \blk00000003/blk00000005/sig000000f0 ;
  wire \blk00000003/blk00000005/sig000000ef ;
  wire \blk00000003/blk00000005/sig000000ee ;
  wire \blk00000003/blk00000005/sig000000ed ;
  wire \blk00000003/blk00000005/sig000000ec ;
  wire \blk00000003/blk00000005/sig000000eb ;
  wire \blk00000003/blk00000005/sig000000ea ;
  wire \blk00000003/blk00000005/sig000000e9 ;
  wire \blk00000003/blk00000005/sig000000e8 ;
  wire \blk00000003/blk00000005/sig000000e7 ;
  wire \blk00000003/blk00000005/sig000000e6 ;
  wire \blk00000003/blk00000005/sig000000e5 ;
  wire \blk00000003/blk00000005/sig000000e4 ;
  wire \blk00000003/blk00000005/sig000000e3 ;
  wire \blk00000003/blk00000005/sig000000e2 ;
  wire \blk00000003/blk00000005/sig000000e1 ;
  wire \blk00000003/blk00000005/sig000000e0 ;
  wire \blk00000003/blk00000005/sig000000df ;
  wire \blk00000003/blk00000005/sig000000de ;
  wire \blk00000003/blk00000005/sig000000dd ;
  wire \blk00000003/blk00000005/sig000000dc ;
  wire \blk00000003/blk00000005/sig000000db ;
  wire \blk00000003/blk00000005/sig000000da ;
  wire \blk00000003/blk00000005/sig000000d9 ;
  wire \blk00000003/blk00000005/sig000000d8 ;
  wire \blk00000003/blk00000005/sig000000d7 ;
  wire \blk00000003/blk00000005/sig000000d6 ;
  wire \blk00000003/blk00000005/sig000000d5 ;
  wire \blk00000003/blk00000005/sig000000d4 ;
  wire \blk00000003/blk00000005/sig000000d3 ;
  wire \blk00000003/blk00000005/sig000000d2 ;
  wire \blk00000003/blk00000005/sig000000d1 ;
  wire \blk00000003/blk00000005/sig000000d0 ;
  wire \blk00000003/blk00000005/sig000000cf ;
  wire \blk00000003/blk00000005/sig000000ce ;
  wire \blk00000003/blk00000005/sig000000cd ;
  wire \blk00000003/blk00000005/sig000000cc ;
  wire \blk00000003/blk00000005/sig000000cb ;
  wire \blk00000003/blk00000005/sig000000ca ;
  wire \blk00000003/blk00000005/sig000000c9 ;
  wire \blk00000003/blk00000005/sig000000c8 ;
  wire \blk00000003/blk00000005/sig000000c7 ;
  wire \blk00000003/blk00000005/sig000000c6 ;
  wire \blk00000003/blk00000005/sig000000c5 ;
  wire \blk00000003/blk00000005/sig000000c4 ;
  wire \blk00000003/blk00000005/sig000000c3 ;
  wire \blk00000003/blk00000005/sig000000c2 ;
  wire \blk00000003/blk00000005/sig000000c1 ;
  wire \blk00000003/blk00000005/sig000000c0 ;
  wire \blk00000003/blk00000005/sig000000bf ;
  wire \blk00000003/blk00000005/sig000000be ;
  wire \blk00000003/blk00000005/sig000000bd ;
  wire \blk00000003/blk00000005/sig000000bc ;
  wire \blk00000003/blk00000005/sig000000bb ;
  wire \blk00000003/blk00000005/sig000000ba ;
  wire \blk00000003/blk00000005/sig000000b9 ;
  wire \blk00000003/blk00000005/sig000000b8 ;
  wire \blk00000003/blk00000005/sig000000b7 ;
  wire \blk00000003/blk00000005/sig000000b6 ;
  wire \blk00000003/blk00000005/sig000000b5 ;
  wire \blk00000003/blk00000005/sig000000b4 ;
  wire \blk00000003/blk00000005/sig000000b3 ;
  wire \blk00000003/blk00000005/sig000000b2 ;
  wire \blk00000003/blk00000005/sig000000b1 ;
  wire \blk00000003/blk00000005/sig000000b0 ;
  wire \blk00000003/blk00000005/sig000000af ;
  wire \blk00000003/blk00000005/sig000000ae ;
  wire \blk00000003/blk00000005/sig000000ad ;
  wire \blk00000003/blk00000005/sig000000ac ;
  wire \blk00000003/blk00000005/sig000000ab ;
  wire \blk00000003/blk00000005/sig000000aa ;
  wire \blk00000003/blk00000005/sig000000a9 ;
  wire \blk00000003/blk00000005/sig000000a8 ;
  wire \blk00000003/blk00000005/sig000000a7 ;
  wire \blk00000003/blk00000005/sig000000a6 ;
  wire \blk00000003/blk00000005/sig000000a5 ;
  wire \blk00000003/blk00000005/sig000000a4 ;
  wire \blk00000003/blk00000005/sig000000a3 ;
  wire \blk00000003/blk00000005/sig000000a2 ;
  wire \blk00000003/blk00000005/sig000000a1 ;
  wire \blk00000003/blk00000005/sig000000a0 ;
  wire \blk00000003/blk00000005/sig0000009f ;
  wire \blk00000003/blk00000005/sig0000009e ;
  wire \blk00000003/blk00000005/sig0000009d ;
  wire \blk00000003/blk00000005/sig0000009c ;
  wire \blk00000003/blk00000005/sig0000009b ;
  wire \blk00000003/blk00000005/sig0000009a ;
  wire \blk00000003/blk00000005/sig00000099 ;
  wire \blk00000003/blk00000005/sig00000098 ;
  wire \blk00000003/blk00000005/sig00000097 ;
  wire \blk00000003/blk00000005/sig00000096 ;
  wire \blk00000003/blk00000005/sig00000095 ;
  wire \blk00000003/blk00000005/sig00000094 ;
  wire \blk00000003/blk00000005/sig00000093 ;
  wire \blk00000003/blk00000005/sig00000092 ;
  wire \blk00000003/blk00000005/sig00000091 ;
  wire \blk00000003/blk00000005/sig00000090 ;
  wire \blk00000003/blk00000005/sig0000008f ;
  wire \blk00000003/blk00000005/sig0000008e ;
  wire \blk00000003/blk00000005/sig0000008d ;
  wire \blk00000003/blk00000005/sig0000008c ;
  wire \blk00000003/blk00000005/sig0000008b ;
  wire \blk00000003/blk00000005/sig0000008a ;
  wire \blk00000003/blk00000005/sig00000089 ;
  wire \blk00000003/blk00000005/sig00000088 ;
  wire \blk00000003/blk00000005/sig00000087 ;
  wire \blk00000003/blk00000005/sig00000086 ;
  wire \blk00000003/blk00000005/sig00000085 ;
  wire \blk00000003/blk00000005/sig00000084 ;
  wire \blk00000003/blk00000005/sig00000083 ;
  wire \blk00000003/blk00000005/sig00000082 ;
  wire \blk00000003/blk00000005/sig00000081 ;
  wire \blk00000003/blk00000005/sig00000080 ;
  wire \blk00000003/blk00000005/sig0000007f ;
  wire \blk00000003/blk00000005/sig0000007e ;
  wire \blk00000003/blk00000005/sig0000007d ;
  wire \blk00000003/blk00000005/sig0000007c ;
  wire \blk00000003/blk00000005/sig0000007b ;
  wire \blk00000003/blk00000005/sig0000007a ;
  wire \blk00000003/blk00000005/sig00000079 ;
  wire \blk00000003/blk00000005/sig00000078 ;
  wire \blk00000003/blk00000005/sig00000077 ;
  wire \blk00000003/blk00000005/sig00000076 ;
  wire \blk00000003/blk00000005/sig00000075 ;
  wire \blk00000003/blk00000005/sig00000074 ;
  wire \blk00000003/blk00000005/sig00000073 ;
  wire \blk00000003/blk00000005/sig00000072 ;
  wire \blk00000003/blk00000005/sig00000071 ;
  wire \blk00000003/blk00000005/sig00000070 ;
  wire \blk00000003/blk00000005/sig0000006f ;
  wire \blk00000003/blk00000005/sig0000006e ;
  wire \blk00000003/blk00000005/sig0000006d ;
  wire \blk00000003/blk00000005/sig0000006c ;
  wire \blk00000003/blk00000005/sig0000006b ;
  wire \blk00000003/blk00000005/sig0000006a ;
  wire \blk00000003/blk00000005/sig00000069 ;
  wire \blk00000003/blk00000005/sig00000068 ;
  wire \blk00000003/blk00000005/sig00000067 ;
  wire \blk00000003/blk00000005/sig00000066 ;
  wire \blk00000003/blk00000005/sig00000065 ;
  wire \blk00000003/blk00000005/sig00000064 ;
  wire \blk00000003/blk00000005/sig00000063 ;
  wire \blk00000003/blk00000005/sig00000062 ;
  wire \blk00000003/blk00000005/sig00000061 ;
  wire \blk00000003/blk00000005/sig00000060 ;
  wire \blk00000003/blk00000005/sig0000005f ;
  wire \blk00000003/blk00000005/sig0000005e ;
  wire \blk00000003/blk00000005/sig0000005d ;
  wire \blk00000003/blk00000005/sig0000005c ;
  wire \blk00000003/blk00000005/sig0000005b ;
  wire \blk00000003/blk00000005/sig0000005a ;
  wire \blk00000003/blk00000005/sig00000059 ;
  wire NLW_blk00000001_P_UNCONNECTED;
  wire NLW_blk00000002_G_UNCONNECTED;
  wire \NLW_blk00000003/blk00000005/blk00000100_LO_UNCONNECTED ;
  wire [2 : 0] din_0;
  wire [17 : 0] dout_1;
  assign
    rfd = NlwRenamedSig_OI_rfd,
    dout[17] = dout_1[17],
    dout[16] = dout_1[16],
    dout[15] = dout_1[15],
    dout[14] = dout_1[14],
    dout[13] = dout_1[13],
    dout[12] = dout_1[12],
    dout[11] = dout_1[11],
    dout[10] = dout_1[10],
    dout[9] = dout_1[9],
    dout[8] = dout_1[8],
    dout[7] = dout_1[7],
    dout[6] = dout_1[6],
    dout[5] = dout_1[5],
    dout[4] = dout_1[4],
    dout[3] = dout_1[3],
    dout[2] = dout_1[2],
    dout[1] = dout_1[1],
    dout[0] = dout_1[0],
    din_0[2] = din[2],
    din_0[1] = din[1],
    din_0[0] = din[0];
  VCC   blk00000001 (
    .P(NLW_blk00000001_P_UNCONNECTED)
  );
  GND   blk00000002 (
    .G(NLW_blk00000002_G_UNCONNECTED)
  );
  GND   \blk00000003/blk00000004  (
    .G(\blk00000003/sig00000003 )
  );
  FDE   \blk00000003/blk00000005/blk0000011f  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000156 ),
    .Q(rdy)
  );
  FDE   \blk00000003/blk00000005/blk0000011e  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000015d ),
    .Q(dout_1[2])
  );
  FDE   \blk00000003/blk00000005/blk0000011d  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000015b ),
    .Q(dout_1[1])
  );
  FDE   \blk00000003/blk00000005/blk0000011c  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000015c ),
    .Q(dout_1[0])
  );
  FDE   \blk00000003/blk00000005/blk0000011b  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000112 ),
    .Q(\blk00000003/blk00000005/sig0000015d )
  );
  FDE   \blk00000003/blk00000005/blk0000011a  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000015d ),
    .Q(\blk00000003/blk00000005/sig0000015b )
  );
  FDE   \blk00000003/blk00000005/blk00000119  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000015b ),
    .Q(\blk00000003/blk00000005/sig0000015c )
  );
  FDE   \blk00000003/blk00000005/blk00000118  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000015a ),
    .Q(\blk00000003/blk00000005/sig00000109 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000117  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .D(\blk00000003/blk00000005/sig0000005e ),
    .Q(\blk00000003/blk00000005/sig0000015a ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk00000116  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000159 ),
    .Q(\blk00000003/blk00000005/sig00000156 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000115  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .D(\blk00000003/blk00000005/sig0000005e ),
    .Q(\blk00000003/blk00000005/sig00000159 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig00000059 ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk00000114  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000158 ),
    .Q(\blk00000003/blk00000005/sig00000157 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000113  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .D(\blk00000003/blk00000005/sig0000005e ),
    .Q(\blk00000003/blk00000005/sig00000158 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000059 ),
    .A1(\blk00000003/blk00000005/sig0000005a ),
    .A2(\blk00000003/blk00000005/sig00000059 ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  LUT4 #(
    .INIT ( 16'h5555 ))
  \blk00000003/blk00000005/blk00000112  (
    .I0(\blk00000003/blk00000005/sig00000157 ),
    .I1(\blk00000003/blk00000005/sig0000005a ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig0000010b )
  );
  FDE   \blk00000003/blk00000005/blk00000111  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000014f ),
    .Q(dout_1[17])
  );
  FDE   \blk00000003/blk00000005/blk00000110  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000014a ),
    .Q(dout_1[16])
  );
  FDE   \blk00000003/blk00000005/blk0000010f  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000145 ),
    .Q(dout_1[15])
  );
  FDE   \blk00000003/blk00000005/blk0000010e  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000140 ),
    .Q(dout_1[14])
  );
  FDE   \blk00000003/blk00000005/blk0000010d  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000013b ),
    .Q(dout_1[13])
  );
  FDE   \blk00000003/blk00000005/blk0000010c  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000136 ),
    .Q(dout_1[12])
  );
  FDE   \blk00000003/blk00000005/blk0000010b  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000131 ),
    .Q(dout_1[11])
  );
  FDE   \blk00000003/blk00000005/blk0000010a  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000012c ),
    .Q(dout_1[10])
  );
  FDE   \blk00000003/blk00000005/blk00000109  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000127 ),
    .Q(dout_1[9])
  );
  FDE   \blk00000003/blk00000005/blk00000108  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000122 ),
    .Q(dout_1[8])
  );
  FDE   \blk00000003/blk00000005/blk00000107  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000011d ),
    .Q(dout_1[7])
  );
  FDE   \blk00000003/blk00000005/blk00000106  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000118 ),
    .Q(dout_1[6])
  );
  FDE   \blk00000003/blk00000005/blk00000105  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000113 ),
    .Q(dout_1[5])
  );
  FDE   \blk00000003/blk00000005/blk00000104  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000010d ),
    .Q(dout_1[4])
  );
  FDE   \blk00000003/blk00000005/blk00000103  (
    .CE(\blk00000003/blk00000005/sig00000156 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000112 ),
    .Q(dout_1[3])
  );
  FDE   \blk00000003/blk00000005/blk00000102  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000155 ),
    .Q(\blk00000003/blk00000005/sig0000014f )
  );
  XORCY   \blk00000003/blk00000005/blk00000101  (
    .CI(\blk00000003/blk00000005/sig00000152 ),
    .LI(\blk00000003/blk00000005/sig00000154 ),
    .O(\blk00000003/blk00000005/sig00000155 )
  );
  MULT_AND   \blk00000003/blk00000005/blk00000100  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig0000014f ),
    .LO(\NLW_blk00000003/blk00000005/blk00000100_LO_UNCONNECTED )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000ff  (
    .I0(\blk00000003/blk00000005/sig0000014f ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig00000108 ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig00000154 )
  );
  FDE   \blk00000003/blk00000005/blk000000fe  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000153 ),
    .Q(\blk00000003/blk00000005/sig0000014a )
  );
  XORCY   \blk00000003/blk00000005/blk000000fd  (
    .CI(\blk00000003/blk00000005/sig0000014d ),
    .LI(\blk00000003/blk00000005/sig00000150 ),
    .O(\blk00000003/blk00000005/sig00000153 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000fc  (
    .CI(\blk00000003/blk00000005/sig0000014d ),
    .DI(\blk00000003/blk00000005/sig00000151 ),
    .O(\blk00000003/blk00000005/sig00000152 ),
    .S(\blk00000003/blk00000005/sig00000150 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000fb  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig0000014f ),
    .LO(\blk00000003/blk00000005/sig00000151 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000fa  (
    .I0(\blk00000003/blk00000005/sig0000014f ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig00000108 ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig00000150 )
  );
  FDE   \blk00000003/blk00000005/blk000000f9  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000014e ),
    .Q(\blk00000003/blk00000005/sig00000145 )
  );
  XORCY   \blk00000003/blk00000005/blk000000f8  (
    .CI(\blk00000003/blk00000005/sig00000148 ),
    .LI(\blk00000003/blk00000005/sig0000014b ),
    .O(\blk00000003/blk00000005/sig0000014e )
  );
  MUXCY   \blk00000003/blk00000005/blk000000f7  (
    .CI(\blk00000003/blk00000005/sig00000148 ),
    .DI(\blk00000003/blk00000005/sig0000014c ),
    .O(\blk00000003/blk00000005/sig0000014d ),
    .S(\blk00000003/blk00000005/sig0000014b )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000f6  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig0000014a ),
    .LO(\blk00000003/blk00000005/sig0000014c )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000f5  (
    .I0(\blk00000003/blk00000005/sig0000014a ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig00000105 ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig0000014b )
  );
  FDE   \blk00000003/blk00000005/blk000000f4  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000149 ),
    .Q(\blk00000003/blk00000005/sig00000140 )
  );
  XORCY   \blk00000003/blk00000005/blk000000f3  (
    .CI(\blk00000003/blk00000005/sig00000143 ),
    .LI(\blk00000003/blk00000005/sig00000146 ),
    .O(\blk00000003/blk00000005/sig00000149 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000f2  (
    .CI(\blk00000003/blk00000005/sig00000143 ),
    .DI(\blk00000003/blk00000005/sig00000147 ),
    .O(\blk00000003/blk00000005/sig00000148 ),
    .S(\blk00000003/blk00000005/sig00000146 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000f1  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig00000145 ),
    .LO(\blk00000003/blk00000005/sig00000147 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000f0  (
    .I0(\blk00000003/blk00000005/sig00000145 ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig00000101 ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig00000146 )
  );
  FDE   \blk00000003/blk00000005/blk000000ef  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000144 ),
    .Q(\blk00000003/blk00000005/sig0000013b )
  );
  XORCY   \blk00000003/blk00000005/blk000000ee  (
    .CI(\blk00000003/blk00000005/sig0000013e ),
    .LI(\blk00000003/blk00000005/sig00000141 ),
    .O(\blk00000003/blk00000005/sig00000144 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000ed  (
    .CI(\blk00000003/blk00000005/sig0000013e ),
    .DI(\blk00000003/blk00000005/sig00000142 ),
    .O(\blk00000003/blk00000005/sig00000143 ),
    .S(\blk00000003/blk00000005/sig00000141 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000ec  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig00000140 ),
    .LO(\blk00000003/blk00000005/sig00000142 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000eb  (
    .I0(\blk00000003/blk00000005/sig00000140 ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig000000fd ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig00000141 )
  );
  FDE   \blk00000003/blk00000005/blk000000ea  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000013f ),
    .Q(\blk00000003/blk00000005/sig00000136 )
  );
  XORCY   \blk00000003/blk00000005/blk000000e9  (
    .CI(\blk00000003/blk00000005/sig00000139 ),
    .LI(\blk00000003/blk00000005/sig0000013c ),
    .O(\blk00000003/blk00000005/sig0000013f )
  );
  MUXCY   \blk00000003/blk00000005/blk000000e8  (
    .CI(\blk00000003/blk00000005/sig00000139 ),
    .DI(\blk00000003/blk00000005/sig0000013d ),
    .O(\blk00000003/blk00000005/sig0000013e ),
    .S(\blk00000003/blk00000005/sig0000013c )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000e7  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig0000013b ),
    .LO(\blk00000003/blk00000005/sig0000013d )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000e6  (
    .I0(\blk00000003/blk00000005/sig0000013b ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig000000f9 ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig0000013c )
  );
  FDE   \blk00000003/blk00000005/blk000000e5  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000013a ),
    .Q(\blk00000003/blk00000005/sig00000131 )
  );
  XORCY   \blk00000003/blk00000005/blk000000e4  (
    .CI(\blk00000003/blk00000005/sig00000134 ),
    .LI(\blk00000003/blk00000005/sig00000137 ),
    .O(\blk00000003/blk00000005/sig0000013a )
  );
  MUXCY   \blk00000003/blk00000005/blk000000e3  (
    .CI(\blk00000003/blk00000005/sig00000134 ),
    .DI(\blk00000003/blk00000005/sig00000138 ),
    .O(\blk00000003/blk00000005/sig00000139 ),
    .S(\blk00000003/blk00000005/sig00000137 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000e2  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig00000136 ),
    .LO(\blk00000003/blk00000005/sig00000138 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000e1  (
    .I0(\blk00000003/blk00000005/sig00000136 ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig000000f5 ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig00000137 )
  );
  FDE   \blk00000003/blk00000005/blk000000e0  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000135 ),
    .Q(\blk00000003/blk00000005/sig0000012c )
  );
  XORCY   \blk00000003/blk00000005/blk000000df  (
    .CI(\blk00000003/blk00000005/sig0000012f ),
    .LI(\blk00000003/blk00000005/sig00000132 ),
    .O(\blk00000003/blk00000005/sig00000135 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000de  (
    .CI(\blk00000003/blk00000005/sig0000012f ),
    .DI(\blk00000003/blk00000005/sig00000133 ),
    .O(\blk00000003/blk00000005/sig00000134 ),
    .S(\blk00000003/blk00000005/sig00000132 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000dd  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig00000131 ),
    .LO(\blk00000003/blk00000005/sig00000133 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000dc  (
    .I0(\blk00000003/blk00000005/sig00000131 ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig000000f1 ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig00000132 )
  );
  FDE   \blk00000003/blk00000005/blk000000db  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000130 ),
    .Q(\blk00000003/blk00000005/sig00000127 )
  );
  XORCY   \blk00000003/blk00000005/blk000000da  (
    .CI(\blk00000003/blk00000005/sig0000012a ),
    .LI(\blk00000003/blk00000005/sig0000012d ),
    .O(\blk00000003/blk00000005/sig00000130 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000d9  (
    .CI(\blk00000003/blk00000005/sig0000012a ),
    .DI(\blk00000003/blk00000005/sig0000012e ),
    .O(\blk00000003/blk00000005/sig0000012f ),
    .S(\blk00000003/blk00000005/sig0000012d )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000d8  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig0000012c ),
    .LO(\blk00000003/blk00000005/sig0000012e )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000d7  (
    .I0(\blk00000003/blk00000005/sig0000012c ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig000000ed ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig0000012d )
  );
  FDE   \blk00000003/blk00000005/blk000000d6  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000012b ),
    .Q(\blk00000003/blk00000005/sig00000122 )
  );
  XORCY   \blk00000003/blk00000005/blk000000d5  (
    .CI(\blk00000003/blk00000005/sig00000125 ),
    .LI(\blk00000003/blk00000005/sig00000128 ),
    .O(\blk00000003/blk00000005/sig0000012b )
  );
  MUXCY   \blk00000003/blk00000005/blk000000d4  (
    .CI(\blk00000003/blk00000005/sig00000125 ),
    .DI(\blk00000003/blk00000005/sig00000129 ),
    .O(\blk00000003/blk00000005/sig0000012a ),
    .S(\blk00000003/blk00000005/sig00000128 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000d3  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig00000127 ),
    .LO(\blk00000003/blk00000005/sig00000129 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000d2  (
    .I0(\blk00000003/blk00000005/sig00000127 ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig000000e9 ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig00000128 )
  );
  FDE   \blk00000003/blk00000005/blk000000d1  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000126 ),
    .Q(\blk00000003/blk00000005/sig0000011d )
  );
  XORCY   \blk00000003/blk00000005/blk000000d0  (
    .CI(\blk00000003/blk00000005/sig00000120 ),
    .LI(\blk00000003/blk00000005/sig00000123 ),
    .O(\blk00000003/blk00000005/sig00000126 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000cf  (
    .CI(\blk00000003/blk00000005/sig00000120 ),
    .DI(\blk00000003/blk00000005/sig00000124 ),
    .O(\blk00000003/blk00000005/sig00000125 ),
    .S(\blk00000003/blk00000005/sig00000123 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000ce  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig00000122 ),
    .LO(\blk00000003/blk00000005/sig00000124 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000cd  (
    .I0(\blk00000003/blk00000005/sig00000122 ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig000000e5 ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig00000123 )
  );
  FDE   \blk00000003/blk00000005/blk000000cc  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000121 ),
    .Q(\blk00000003/blk00000005/sig00000118 )
  );
  XORCY   \blk00000003/blk00000005/blk000000cb  (
    .CI(\blk00000003/blk00000005/sig0000011b ),
    .LI(\blk00000003/blk00000005/sig0000011e ),
    .O(\blk00000003/blk00000005/sig00000121 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000ca  (
    .CI(\blk00000003/blk00000005/sig0000011b ),
    .DI(\blk00000003/blk00000005/sig0000011f ),
    .O(\blk00000003/blk00000005/sig00000120 ),
    .S(\blk00000003/blk00000005/sig0000011e )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000c9  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig0000011d ),
    .LO(\blk00000003/blk00000005/sig0000011f )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000c8  (
    .I0(\blk00000003/blk00000005/sig0000011d ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig000000e1 ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig0000011e )
  );
  FDE   \blk00000003/blk00000005/blk000000c7  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000011c ),
    .Q(\blk00000003/blk00000005/sig00000113 )
  );
  XORCY   \blk00000003/blk00000005/blk000000c6  (
    .CI(\blk00000003/blk00000005/sig00000116 ),
    .LI(\blk00000003/blk00000005/sig00000119 ),
    .O(\blk00000003/blk00000005/sig0000011c )
  );
  MUXCY   \blk00000003/blk00000005/blk000000c5  (
    .CI(\blk00000003/blk00000005/sig00000116 ),
    .DI(\blk00000003/blk00000005/sig0000011a ),
    .O(\blk00000003/blk00000005/sig0000011b ),
    .S(\blk00000003/blk00000005/sig00000119 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000c4  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig00000118 ),
    .LO(\blk00000003/blk00000005/sig0000011a )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000c3  (
    .I0(\blk00000003/blk00000005/sig00000118 ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig000000dd ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig00000119 )
  );
  FDE   \blk00000003/blk00000005/blk000000c2  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000117 ),
    .Q(\blk00000003/blk00000005/sig0000010d )
  );
  XORCY   \blk00000003/blk00000005/blk000000c1  (
    .CI(\blk00000003/blk00000005/sig00000110 ),
    .LI(\blk00000003/blk00000005/sig00000114 ),
    .O(\blk00000003/blk00000005/sig00000117 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000c0  (
    .CI(\blk00000003/blk00000005/sig00000110 ),
    .DI(\blk00000003/blk00000005/sig00000115 ),
    .O(\blk00000003/blk00000005/sig00000116 ),
    .S(\blk00000003/blk00000005/sig00000114 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000bf  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig00000113 ),
    .LO(\blk00000003/blk00000005/sig00000115 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000be  (
    .I0(\blk00000003/blk00000005/sig00000113 ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig000000d9 ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig00000114 )
  );
  FDE   \blk00000003/blk00000005/blk000000bd  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000111 ),
    .Q(\blk00000003/blk00000005/sig00000112 )
  );
  XORCY   \blk00000003/blk00000005/blk000000bc  (
    .CI(\blk00000003/blk00000005/sig0000010c ),
    .LI(\blk00000003/blk00000005/sig0000010e ),
    .O(\blk00000003/blk00000005/sig00000111 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000bb  (
    .CI(\blk00000003/blk00000005/sig0000010c ),
    .DI(\blk00000003/blk00000005/sig0000010f ),
    .O(\blk00000003/blk00000005/sig00000110 ),
    .S(\blk00000003/blk00000005/sig0000010e )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000ba  (
    .I0(\blk00000003/blk00000005/sig0000010a ),
    .I1(\blk00000003/blk00000005/sig0000010d ),
    .LO(\blk00000003/blk00000005/sig0000010f )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000b9  (
    .I0(\blk00000003/blk00000005/sig0000010d ),
    .I1(\blk00000003/blk00000005/sig0000010a ),
    .I2(\blk00000003/blk00000005/sig000000d5 ),
    .I3(\blk00000003/blk00000005/sig0000010b ),
    .O(\blk00000003/blk00000005/sig0000010e )
  );
  LUT4 #(
    .INIT ( 16'h1111 ))
  \blk00000003/blk00000005/blk000000b8  (
    .I0(\blk00000003/blk00000005/sig0000010b ),
    .I1(\blk00000003/blk00000005/sig00000109 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig0000010c )
  );
  LUT4 #(
    .INIT ( 16'h5555 ))
  \blk00000003/blk00000005/blk000000b7  (
    .I0(\blk00000003/blk00000005/sig00000109 ),
    .I1(\blk00000003/blk00000005/sig0000005a ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig0000010a )
  );
  FDE   \blk00000003/blk00000005/blk000000b6  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000107 ),
    .Q(\blk00000003/blk00000005/sig00000108 )
  );
  XORCY   \blk00000003/blk00000005/blk000000b5  (
    .CI(\blk00000003/blk00000005/sig00000103 ),
    .LI(\blk00000003/blk00000005/sig00000106 ),
    .O(\blk00000003/blk00000005/sig00000107 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk000000b4  (
    .I0(\blk00000003/blk00000005/sig000000a8 ),
    .I1(\blk00000003/blk00000005/sig000000d1 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig00000106 )
  );
  FDE   \blk00000003/blk00000005/blk000000b3  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000104 ),
    .Q(\blk00000003/blk00000005/sig00000105 )
  );
  XORCY   \blk00000003/blk00000005/blk000000b2  (
    .CI(\blk00000003/blk00000005/sig000000ff ),
    .LI(\blk00000003/blk00000005/sig00000102 ),
    .O(\blk00000003/blk00000005/sig00000104 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000b1  (
    .CI(\blk00000003/blk00000005/sig000000ff ),
    .DI(\blk00000003/blk00000005/sig000000a8 ),
    .O(\blk00000003/blk00000005/sig00000103 ),
    .S(\blk00000003/blk00000005/sig00000102 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk000000b0  (
    .I0(\blk00000003/blk00000005/sig000000a8 ),
    .I1(\blk00000003/blk00000005/sig000000d1 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig00000102 )
  );
  FDE   \blk00000003/blk00000005/blk000000af  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000100 ),
    .Q(\blk00000003/blk00000005/sig00000101 )
  );
  XORCY   \blk00000003/blk00000005/blk000000ae  (
    .CI(\blk00000003/blk00000005/sig000000fb ),
    .LI(\blk00000003/blk00000005/sig000000fe ),
    .O(\blk00000003/blk00000005/sig00000100 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000ad  (
    .CI(\blk00000003/blk00000005/sig000000fb ),
    .DI(\blk00000003/blk00000005/sig000000a6 ),
    .O(\blk00000003/blk00000005/sig000000ff ),
    .S(\blk00000003/blk00000005/sig000000fe )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk000000ac  (
    .I0(\blk00000003/blk00000005/sig000000a6 ),
    .I1(\blk00000003/blk00000005/sig000000d1 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000fe )
  );
  FDE   \blk00000003/blk00000005/blk000000ab  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000fc ),
    .Q(\blk00000003/blk00000005/sig000000fd )
  );
  XORCY   \blk00000003/blk00000005/blk000000aa  (
    .CI(\blk00000003/blk00000005/sig000000f7 ),
    .LI(\blk00000003/blk00000005/sig000000fa ),
    .O(\blk00000003/blk00000005/sig000000fc )
  );
  MUXCY   \blk00000003/blk00000005/blk000000a9  (
    .CI(\blk00000003/blk00000005/sig000000f7 ),
    .DI(\blk00000003/blk00000005/sig000000a4 ),
    .O(\blk00000003/blk00000005/sig000000fb ),
    .S(\blk00000003/blk00000005/sig000000fa )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk000000a8  (
    .I0(\blk00000003/blk00000005/sig000000a4 ),
    .I1(\blk00000003/blk00000005/sig000000cf ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000fa )
  );
  FDE   \blk00000003/blk00000005/blk000000a7  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000f8 ),
    .Q(\blk00000003/blk00000005/sig000000f9 )
  );
  XORCY   \blk00000003/blk00000005/blk000000a6  (
    .CI(\blk00000003/blk00000005/sig000000f3 ),
    .LI(\blk00000003/blk00000005/sig000000f6 ),
    .O(\blk00000003/blk00000005/sig000000f8 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000a5  (
    .CI(\blk00000003/blk00000005/sig000000f3 ),
    .DI(\blk00000003/blk00000005/sig000000a2 ),
    .O(\blk00000003/blk00000005/sig000000f7 ),
    .S(\blk00000003/blk00000005/sig000000f6 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk000000a4  (
    .I0(\blk00000003/blk00000005/sig000000a2 ),
    .I1(\blk00000003/blk00000005/sig000000cd ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000f6 )
  );
  FDE   \blk00000003/blk00000005/blk000000a3  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000f4 ),
    .Q(\blk00000003/blk00000005/sig000000f5 )
  );
  XORCY   \blk00000003/blk00000005/blk000000a2  (
    .CI(\blk00000003/blk00000005/sig000000ef ),
    .LI(\blk00000003/blk00000005/sig000000f2 ),
    .O(\blk00000003/blk00000005/sig000000f4 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000a1  (
    .CI(\blk00000003/blk00000005/sig000000ef ),
    .DI(\blk00000003/blk00000005/sig000000a0 ),
    .O(\blk00000003/blk00000005/sig000000f3 ),
    .S(\blk00000003/blk00000005/sig000000f2 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk000000a0  (
    .I0(\blk00000003/blk00000005/sig000000a0 ),
    .I1(\blk00000003/blk00000005/sig000000cb ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000f2 )
  );
  FDE   \blk00000003/blk00000005/blk0000009f  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000f0 ),
    .Q(\blk00000003/blk00000005/sig000000f1 )
  );
  XORCY   \blk00000003/blk00000005/blk0000009e  (
    .CI(\blk00000003/blk00000005/sig000000eb ),
    .LI(\blk00000003/blk00000005/sig000000ee ),
    .O(\blk00000003/blk00000005/sig000000f0 )
  );
  MUXCY   \blk00000003/blk00000005/blk0000009d  (
    .CI(\blk00000003/blk00000005/sig000000eb ),
    .DI(\blk00000003/blk00000005/sig0000009e ),
    .O(\blk00000003/blk00000005/sig000000ef ),
    .S(\blk00000003/blk00000005/sig000000ee )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk0000009c  (
    .I0(\blk00000003/blk00000005/sig0000009e ),
    .I1(\blk00000003/blk00000005/sig000000c9 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000ee )
  );
  FDE   \blk00000003/blk00000005/blk0000009b  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000ec ),
    .Q(\blk00000003/blk00000005/sig000000ed )
  );
  XORCY   \blk00000003/blk00000005/blk0000009a  (
    .CI(\blk00000003/blk00000005/sig000000e7 ),
    .LI(\blk00000003/blk00000005/sig000000ea ),
    .O(\blk00000003/blk00000005/sig000000ec )
  );
  MUXCY   \blk00000003/blk00000005/blk00000099  (
    .CI(\blk00000003/blk00000005/sig000000e7 ),
    .DI(\blk00000003/blk00000005/sig0000009c ),
    .O(\blk00000003/blk00000005/sig000000eb ),
    .S(\blk00000003/blk00000005/sig000000ea )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk00000098  (
    .I0(\blk00000003/blk00000005/sig0000009c ),
    .I1(\blk00000003/blk00000005/sig000000c7 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000ea )
  );
  FDE   \blk00000003/blk00000005/blk00000097  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000e8 ),
    .Q(\blk00000003/blk00000005/sig000000e9 )
  );
  XORCY   \blk00000003/blk00000005/blk00000096  (
    .CI(\blk00000003/blk00000005/sig000000e3 ),
    .LI(\blk00000003/blk00000005/sig000000e6 ),
    .O(\blk00000003/blk00000005/sig000000e8 )
  );
  MUXCY   \blk00000003/blk00000005/blk00000095  (
    .CI(\blk00000003/blk00000005/sig000000e3 ),
    .DI(\blk00000003/blk00000005/sig0000009a ),
    .O(\blk00000003/blk00000005/sig000000e7 ),
    .S(\blk00000003/blk00000005/sig000000e6 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk00000094  (
    .I0(\blk00000003/blk00000005/sig0000009a ),
    .I1(\blk00000003/blk00000005/sig000000c5 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000e6 )
  );
  FDE   \blk00000003/blk00000005/blk00000093  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000e4 ),
    .Q(\blk00000003/blk00000005/sig000000e5 )
  );
  XORCY   \blk00000003/blk00000005/blk00000092  (
    .CI(\blk00000003/blk00000005/sig000000df ),
    .LI(\blk00000003/blk00000005/sig000000e2 ),
    .O(\blk00000003/blk00000005/sig000000e4 )
  );
  MUXCY   \blk00000003/blk00000005/blk00000091  (
    .CI(\blk00000003/blk00000005/sig000000df ),
    .DI(\blk00000003/blk00000005/sig00000098 ),
    .O(\blk00000003/blk00000005/sig000000e3 ),
    .S(\blk00000003/blk00000005/sig000000e2 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk00000090  (
    .I0(\blk00000003/blk00000005/sig00000098 ),
    .I1(\blk00000003/blk00000005/sig000000c3 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000e2 )
  );
  FDE   \blk00000003/blk00000005/blk0000008f  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000e0 ),
    .Q(\blk00000003/blk00000005/sig000000e1 )
  );
  XORCY   \blk00000003/blk00000005/blk0000008e  (
    .CI(\blk00000003/blk00000005/sig000000db ),
    .LI(\blk00000003/blk00000005/sig000000de ),
    .O(\blk00000003/blk00000005/sig000000e0 )
  );
  MUXCY   \blk00000003/blk00000005/blk0000008d  (
    .CI(\blk00000003/blk00000005/sig000000db ),
    .DI(\blk00000003/blk00000005/sig00000096 ),
    .O(\blk00000003/blk00000005/sig000000df ),
    .S(\blk00000003/blk00000005/sig000000de )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk0000008c  (
    .I0(\blk00000003/blk00000005/sig00000096 ),
    .I1(\blk00000003/blk00000005/sig000000c1 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000de )
  );
  FDE   \blk00000003/blk00000005/blk0000008b  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000dc ),
    .Q(\blk00000003/blk00000005/sig000000dd )
  );
  XORCY   \blk00000003/blk00000005/blk0000008a  (
    .CI(\blk00000003/blk00000005/sig000000d7 ),
    .LI(\blk00000003/blk00000005/sig000000da ),
    .O(\blk00000003/blk00000005/sig000000dc )
  );
  MUXCY   \blk00000003/blk00000005/blk00000089  (
    .CI(\blk00000003/blk00000005/sig000000d7 ),
    .DI(\blk00000003/blk00000005/sig00000094 ),
    .O(\blk00000003/blk00000005/sig000000db ),
    .S(\blk00000003/blk00000005/sig000000da )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk00000088  (
    .I0(\blk00000003/blk00000005/sig00000094 ),
    .I1(\blk00000003/blk00000005/sig000000bf ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000da )
  );
  FDE   \blk00000003/blk00000005/blk00000087  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000d8 ),
    .Q(\blk00000003/blk00000005/sig000000d9 )
  );
  XORCY   \blk00000003/blk00000005/blk00000086  (
    .CI(\blk00000003/blk00000005/sig000000d3 ),
    .LI(\blk00000003/blk00000005/sig000000d6 ),
    .O(\blk00000003/blk00000005/sig000000d8 )
  );
  MUXCY   \blk00000003/blk00000005/blk00000085  (
    .CI(\blk00000003/blk00000005/sig000000d3 ),
    .DI(\blk00000003/blk00000005/sig00000092 ),
    .O(\blk00000003/blk00000005/sig000000d7 ),
    .S(\blk00000003/blk00000005/sig000000d6 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk00000084  (
    .I0(\blk00000003/blk00000005/sig00000092 ),
    .I1(\blk00000003/blk00000005/sig000000bd ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000d6 )
  );
  FDE   \blk00000003/blk00000005/blk00000083  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000d4 ),
    .Q(\blk00000003/blk00000005/sig000000d5 )
  );
  XORCY   \blk00000003/blk00000005/blk00000082  (
    .CI(\blk00000003/blk00000005/sig0000005a ),
    .LI(\blk00000003/blk00000005/sig000000d2 ),
    .O(\blk00000003/blk00000005/sig000000d4 )
  );
  MUXCY   \blk00000003/blk00000005/blk00000081  (
    .CI(\blk00000003/blk00000005/sig0000005a ),
    .DI(\blk00000003/blk00000005/sig00000090 ),
    .O(\blk00000003/blk00000005/sig000000d3 ),
    .S(\blk00000003/blk00000005/sig000000d2 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk00000080  (
    .I0(\blk00000003/blk00000005/sig00000090 ),
    .I1(\blk00000003/blk00000005/sig000000bb ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000d2 )
  );
  FDE   \blk00000003/blk00000005/blk0000007f  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000d0 ),
    .Q(\blk00000003/blk00000005/sig000000d1 )
  );
  LUT4 #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000007e  (
    .I0(\blk00000003/blk00000005/sig000000b4 ),
    .I1(\blk00000003/blk00000005/sig000000b8 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000d0 )
  );
  FDE   \blk00000003/blk00000005/blk0000007d  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000ce ),
    .Q(\blk00000003/blk00000005/sig000000cf )
  );
  LUT4 #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000007c  (
    .I0(\blk00000003/blk00000005/sig000000b4 ),
    .I1(\blk00000003/blk00000005/sig000000b8 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000ce )
  );
  FDE   \blk00000003/blk00000005/blk0000007b  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000cc ),
    .Q(\blk00000003/blk00000005/sig000000cd )
  );
  LUT4 #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000007a  (
    .I0(\blk00000003/blk00000005/sig000000b4 ),
    .I1(\blk00000003/blk00000005/sig000000b8 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000cc )
  );
  FDE   \blk00000003/blk00000005/blk00000079  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000ca ),
    .Q(\blk00000003/blk00000005/sig000000cb )
  );
  LUT4 #(
    .INIT ( 16'h000c ))
  \blk00000003/blk00000005/blk00000078  (
    .I0(\blk00000003/blk00000005/sig000000b4 ),
    .I1(\blk00000003/blk00000005/sig000000b8 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000ca )
  );
  FDE   \blk00000003/blk00000005/blk00000077  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000c8 ),
    .Q(\blk00000003/blk00000005/sig000000c9 )
  );
  LUT4 #(
    .INIT ( 16'h000a ))
  \blk00000003/blk00000005/blk00000076  (
    .I0(\blk00000003/blk00000005/sig000000b4 ),
    .I1(\blk00000003/blk00000005/sig000000b8 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000c8 )
  );
  FDE   \blk00000003/blk00000005/blk00000075  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000c6 ),
    .Q(\blk00000003/blk00000005/sig000000c7 )
  );
  LUT4 #(
    .INIT ( 16'h000a ))
  \blk00000003/blk00000005/blk00000074  (
    .I0(\blk00000003/blk00000005/sig000000b4 ),
    .I1(\blk00000003/blk00000005/sig000000b8 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000c6 )
  );
  FDE   \blk00000003/blk00000005/blk00000073  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000c4 ),
    .Q(\blk00000003/blk00000005/sig000000c5 )
  );
  LUT4 #(
    .INIT ( 16'h000c ))
  \blk00000003/blk00000005/blk00000072  (
    .I0(\blk00000003/blk00000005/sig000000b4 ),
    .I1(\blk00000003/blk00000005/sig000000b8 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000c4 )
  );
  FDE   \blk00000003/blk00000005/blk00000071  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000c2 ),
    .Q(\blk00000003/blk00000005/sig000000c3 )
  );
  LUT4 #(
    .INIT ( 16'h0008 ))
  \blk00000003/blk00000005/blk00000070  (
    .I0(\blk00000003/blk00000005/sig000000b4 ),
    .I1(\blk00000003/blk00000005/sig000000b8 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000c2 )
  );
  FDE   \blk00000003/blk00000005/blk0000006f  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000c0 ),
    .Q(\blk00000003/blk00000005/sig000000c1 )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \blk00000003/blk00000005/blk0000006e  (
    .I0(\blk00000003/blk00000005/sig000000b4 ),
    .I1(\blk00000003/blk00000005/sig000000b8 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000c0 )
  );
  FDE   \blk00000003/blk00000005/blk0000006d  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000be ),
    .Q(\blk00000003/blk00000005/sig000000bf )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \blk00000003/blk00000005/blk0000006c  (
    .I0(\blk00000003/blk00000005/sig000000b4 ),
    .I1(\blk00000003/blk00000005/sig000000b8 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000be )
  );
  FDE   \blk00000003/blk00000005/blk0000006b  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000bc ),
    .Q(\blk00000003/blk00000005/sig000000bd )
  );
  LUT4 #(
    .INIT ( 16'h0006 ))
  \blk00000003/blk00000005/blk0000006a  (
    .I0(\blk00000003/blk00000005/sig000000b4 ),
    .I1(\blk00000003/blk00000005/sig000000b8 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000bc )
  );
  FDE   \blk00000003/blk00000005/blk00000069  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000ba ),
    .Q(\blk00000003/blk00000005/sig000000bb )
  );
  LUT4 #(
    .INIT ( 16'h000c ))
  \blk00000003/blk00000005/blk00000068  (
    .I0(\blk00000003/blk00000005/sig000000b4 ),
    .I1(\blk00000003/blk00000005/sig000000b8 ),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig000000ba )
  );
  FDE   \blk00000003/blk00000005/blk00000067  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000b9 ),
    .Q(\blk00000003/blk00000005/sig000000b6 )
  );
  LUT4 #(
    .INIT ( 16'h88e8 ))
  \blk00000003/blk00000005/blk00000066  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b0 ),
    .I2(\blk00000003/blk00000005/sig000000b6 ),
    .I3(\blk00000003/blk00000005/sig000000aa ),
    .O(\blk00000003/blk00000005/sig000000b9 )
  );
  FDE   \blk00000003/blk00000005/blk00000065  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000b7 ),
    .Q(\blk00000003/blk00000005/sig000000b8 )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000003/blk00000005/blk00000064  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b0 ),
    .I2(\blk00000003/blk00000005/sig000000b6 ),
    .I3(\blk00000003/blk00000005/sig000000aa ),
    .O(\blk00000003/blk00000005/sig000000b7 )
  );
  FDE   \blk00000003/blk00000005/blk00000063  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000b5 ),
    .Q(\blk00000003/blk00000005/sig000000b2 )
  );
  LUT4 #(
    .INIT ( 16'h88e8 ))
  \blk00000003/blk00000005/blk00000062  (
    .I0(\blk00000003/blk00000005/sig000000ac ),
    .I1(\blk00000003/blk00000005/sig00000076 ),
    .I2(\blk00000003/blk00000005/sig000000b2 ),
    .I3(\blk00000003/blk00000005/sig000000aa ),
    .O(\blk00000003/blk00000005/sig000000b5 )
  );
  FDE   \blk00000003/blk00000005/blk00000061  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000b3 ),
    .Q(\blk00000003/blk00000005/sig000000b4 )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000003/blk00000005/blk00000060  (
    .I0(\blk00000003/blk00000005/sig000000ac ),
    .I1(\blk00000003/blk00000005/sig00000076 ),
    .I2(\blk00000003/blk00000005/sig000000b2 ),
    .I3(\blk00000003/blk00000005/sig000000aa ),
    .O(\blk00000003/blk00000005/sig000000b3 )
  );
  FDE   \blk00000003/blk00000005/blk0000005f  (
    .CE(\blk00000003/blk00000005/sig000000a9 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000b1 ),
    .Q(\blk00000003/blk00000005/sig00000076 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000005e  (
    .CE(\blk00000003/blk00000005/sig000000a9 ),
    .D(\blk00000003/blk00000005/sig000000b0 ),
    .Q(\blk00000003/blk00000005/sig000000b1 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk0000005d  (
    .CE(\blk00000003/blk00000005/sig000000a9 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000af ),
    .Q(\blk00000003/blk00000005/sig000000b0 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000005c  (
    .CE(\blk00000003/blk00000005/sig000000a9 ),
    .D(\blk00000003/blk00000005/sig000000ae ),
    .Q(\blk00000003/blk00000005/sig000000af ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk0000005b  (
    .CE(\blk00000003/blk00000005/sig000000a9 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000ad ),
    .Q(\blk00000003/blk00000005/sig000000ae )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000005a  (
    .CE(\blk00000003/blk00000005/sig000000a9 ),
    .D(\blk00000003/blk00000005/sig000000ac ),
    .Q(\blk00000003/blk00000005/sig000000ad ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk00000059  (
    .CE(\blk00000003/blk00000005/sig000000a9 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000ab ),
    .Q(\blk00000003/blk00000005/sig000000ac )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000058  (
    .CE(\blk00000003/blk00000005/sig000000a9 ),
    .D(\blk00000003/blk00000005/sig00000075 ),
    .Q(\blk00000003/blk00000005/sig000000ab ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk00000057  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000005e ),
    .Q(\blk00000003/blk00000005/sig000000aa )
  );
  FDE   \blk00000003/blk00000005/blk00000056  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000005f ),
    .Q(\blk00000003/blk00000005/sig000000a9 )
  );
  FDE   \blk00000003/blk00000005/blk00000055  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000a7 ),
    .Q(\blk00000003/blk00000005/sig000000a8 )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk00000054  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig000000a7 )
  );
  FDE   \blk00000003/blk00000005/blk00000053  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000a5 ),
    .Q(\blk00000003/blk00000005/sig000000a6 )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk00000052  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig000000a5 )
  );
  FDE   \blk00000003/blk00000005/blk00000051  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000a3 ),
    .Q(\blk00000003/blk00000005/sig000000a4 )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk00000050  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig000000a3 )
  );
  FDE   \blk00000003/blk00000005/blk0000004f  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000a1 ),
    .Q(\blk00000003/blk00000005/sig000000a2 )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk0000004e  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig000000a1 )
  );
  FDE   \blk00000003/blk00000005/blk0000004d  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000009f ),
    .Q(\blk00000003/blk00000005/sig000000a0 )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk0000004c  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig0000009f )
  );
  FDE   \blk00000003/blk00000005/blk0000004b  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000009d ),
    .Q(\blk00000003/blk00000005/sig0000009e )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk0000004a  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig0000009d )
  );
  FDE   \blk00000003/blk00000005/blk00000049  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000009b ),
    .Q(\blk00000003/blk00000005/sig0000009c )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk00000048  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig0000009b )
  );
  FDE   \blk00000003/blk00000005/blk00000047  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000099 ),
    .Q(\blk00000003/blk00000005/sig0000009a )
  );
  LUT4 #(
    .INIT ( 16'h373e ))
  \blk00000003/blk00000005/blk00000046  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig00000099 )
  );
  FDE   \blk00000003/blk00000005/blk00000045  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000097 ),
    .Q(\blk00000003/blk00000005/sig00000098 )
  );
  LUT4 #(
    .INIT ( 16'h4bd2 ))
  \blk00000003/blk00000005/blk00000044  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig00000097 )
  );
  FDE   \blk00000003/blk00000005/blk00000043  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000095 ),
    .Q(\blk00000003/blk00000005/sig00000096 )
  );
  LUT4 #(
    .INIT ( 16'h9966 ))
  \blk00000003/blk00000005/blk00000042  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig00000095 )
  );
  FDE   \blk00000003/blk00000005/blk00000041  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000093 ),
    .Q(\blk00000003/blk00000005/sig00000094 )
  );
  LUT4 #(
    .INIT ( 16'hff00 ))
  \blk00000003/blk00000005/blk00000040  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig00000093 )
  );
  FDE   \blk00000003/blk00000005/blk0000003f  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000091 ),
    .Q(\blk00000003/blk00000005/sig00000092 )
  );
  LUT4 #(
    .INIT ( 16'hff00 ))
  \blk00000003/blk00000005/blk0000003e  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig00000091 )
  );
  FDE   \blk00000003/blk00000005/blk0000003d  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000008f ),
    .Q(\blk00000003/blk00000005/sig00000090 )
  );
  LUT4 #(
    .INIT ( 16'hf0f0 ))
  \blk00000003/blk00000005/blk0000003c  (
    .I0(\blk00000003/blk00000005/sig00000081 ),
    .I1(\blk00000003/blk00000005/sig00000085 ),
    .I2(\blk00000003/blk00000005/sig00000089 ),
    .I3(\blk00000003/blk00000005/sig0000008d ),
    .O(\blk00000003/blk00000005/sig0000008f )
  );
  FDE   \blk00000003/blk00000005/blk0000003b  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000008e ),
    .Q(\blk00000003/blk00000005/sig0000008b )
  );
  LUT4 #(
    .INIT ( 16'h88e8 ))
  \blk00000003/blk00000005/blk0000003a  (
    .I0(\blk00000003/blk00000005/sig00000075 ),
    .I1(\blk00000003/blk00000005/sig00000078 ),
    .I2(\blk00000003/blk00000005/sig0000008b ),
    .I3(\blk00000003/blk00000005/sig0000006f ),
    .O(\blk00000003/blk00000005/sig0000008e )
  );
  FDE   \blk00000003/blk00000005/blk00000039  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000008c ),
    .Q(\blk00000003/blk00000005/sig0000008d )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000003/blk00000005/blk00000038  (
    .I0(\blk00000003/blk00000005/sig00000075 ),
    .I1(\blk00000003/blk00000005/sig00000078 ),
    .I2(\blk00000003/blk00000005/sig0000008b ),
    .I3(\blk00000003/blk00000005/sig0000006f ),
    .O(\blk00000003/blk00000005/sig0000008c )
  );
  FDE   \blk00000003/blk00000005/blk00000037  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000008a ),
    .Q(\blk00000003/blk00000005/sig00000087 )
  );
  LUT4 #(
    .INIT ( 16'h88e8 ))
  \blk00000003/blk00000005/blk00000036  (
    .I0(\blk00000003/blk00000005/sig00000073 ),
    .I1(\blk00000003/blk00000005/sig0000007a ),
    .I2(\blk00000003/blk00000005/sig00000087 ),
    .I3(\blk00000003/blk00000005/sig0000006f ),
    .O(\blk00000003/blk00000005/sig0000008a )
  );
  FDE   \blk00000003/blk00000005/blk00000035  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000088 ),
    .Q(\blk00000003/blk00000005/sig00000089 )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000003/blk00000005/blk00000034  (
    .I0(\blk00000003/blk00000005/sig00000073 ),
    .I1(\blk00000003/blk00000005/sig0000007a ),
    .I2(\blk00000003/blk00000005/sig00000087 ),
    .I3(\blk00000003/blk00000005/sig0000006f ),
    .O(\blk00000003/blk00000005/sig00000088 )
  );
  FDE   \blk00000003/blk00000005/blk00000033  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000086 ),
    .Q(\blk00000003/blk00000005/sig00000083 )
  );
  LUT4 #(
    .INIT ( 16'h88e8 ))
  \blk00000003/blk00000005/blk00000032  (
    .I0(\blk00000003/blk00000005/sig00000071 ),
    .I1(\blk00000003/blk00000005/sig0000007c ),
    .I2(\blk00000003/blk00000005/sig00000083 ),
    .I3(\blk00000003/blk00000005/sig0000006f ),
    .O(\blk00000003/blk00000005/sig00000086 )
  );
  FDE   \blk00000003/blk00000005/blk00000031  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000084 ),
    .Q(\blk00000003/blk00000005/sig00000085 )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000003/blk00000005/blk00000030  (
    .I0(\blk00000003/blk00000005/sig00000071 ),
    .I1(\blk00000003/blk00000005/sig0000007c ),
    .I2(\blk00000003/blk00000005/sig00000083 ),
    .I3(\blk00000003/blk00000005/sig0000006f ),
    .O(\blk00000003/blk00000005/sig00000084 )
  );
  FDE   \blk00000003/blk00000005/blk0000002f  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000082 ),
    .Q(\blk00000003/blk00000005/sig0000007f )
  );
  LUT4 #(
    .INIT ( 16'h88e8 ))
  \blk00000003/blk00000005/blk0000002e  (
    .I0(\blk00000003/blk00000005/sig00000067 ),
    .I1(\blk00000003/blk00000005/sig0000007e ),
    .I2(\blk00000003/blk00000005/sig0000007f ),
    .I3(\blk00000003/blk00000005/sig0000006f ),
    .O(\blk00000003/blk00000005/sig00000082 )
  );
  FDE   \blk00000003/blk00000005/blk0000002d  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000080 ),
    .Q(\blk00000003/blk00000005/sig00000081 )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000003/blk00000005/blk0000002c  (
    .I0(\blk00000003/blk00000005/sig00000067 ),
    .I1(\blk00000003/blk00000005/sig0000007e ),
    .I2(\blk00000003/blk00000005/sig0000007f ),
    .I3(\blk00000003/blk00000005/sig0000006f ),
    .O(\blk00000003/blk00000005/sig00000080 )
  );
  FDE   \blk00000003/blk00000005/blk0000002b  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000007d ),
    .Q(\blk00000003/blk00000005/sig0000007e )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000002a  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .D(\blk00000003/blk00000005/sig0000007c ),
    .Q(\blk00000003/blk00000005/sig0000007d ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk00000029  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000007b ),
    .Q(\blk00000003/blk00000005/sig0000007c )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000028  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .D(\blk00000003/blk00000005/sig0000007a ),
    .Q(\blk00000003/blk00000005/sig0000007b ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk00000027  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000079 ),
    .Q(\blk00000003/blk00000005/sig0000007a )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000026  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .D(\blk00000003/blk00000005/sig00000078 ),
    .Q(\blk00000003/blk00000005/sig00000079 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk00000025  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000077 ),
    .Q(\blk00000003/blk00000005/sig00000078 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000024  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .D(\blk00000003/blk00000005/sig00000076 ),
    .Q(\blk00000003/blk00000005/sig00000077 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk00000023  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000074 ),
    .Q(\blk00000003/blk00000005/sig00000075 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000022  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .D(\blk00000003/blk00000005/sig00000073 ),
    .Q(\blk00000003/blk00000005/sig00000074 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk00000021  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000072 ),
    .Q(\blk00000003/blk00000005/sig00000073 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000020  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .D(\blk00000003/blk00000005/sig00000071 ),
    .Q(\blk00000003/blk00000005/sig00000072 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk0000001f  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000070 ),
    .Q(\blk00000003/blk00000005/sig00000071 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000001e  (
    .CE(\blk00000003/blk00000005/sig0000006e ),
    .D(\blk00000003/blk00000005/sig00000067 ),
    .Q(\blk00000003/blk00000005/sig00000070 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig00000059 ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk0000001d  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000005e ),
    .Q(\blk00000003/blk00000005/sig0000006f )
  );
  FDE   \blk00000003/blk00000005/blk0000001c  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000005f ),
    .Q(\blk00000003/blk00000005/sig0000006e )
  );
  BUF   \blk00000003/blk00000005/blk0000001b  (
    .I(\blk00000003/blk00000005/sig0000006a ),
    .O(\blk00000003/blk00000005/sig00000066 )
  );
  FDE   \blk00000003/blk00000005/blk0000001a  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000006d ),
    .Q(\blk00000003/blk00000005/sig0000006b )
  );
  LUT4 #(
    .INIT ( 16'hcaca ))
  \blk00000003/blk00000005/blk00000019  (
    .I0(\blk00000003/blk00000005/sig0000006b ),
    .I1(din_0[2]),
    .I2(\blk00000003/blk00000005/sig0000005d ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig0000006d )
  );
  FDE   \blk00000003/blk00000005/blk00000018  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000006c ),
    .Q(\blk00000003/blk00000005/sig00000068 )
  );
  LUT4 #(
    .INIT ( 16'hcaca ))
  \blk00000003/blk00000005/blk00000017  (
    .I0(\blk00000003/blk00000005/sig0000006b ),
    .I1(din_0[1]),
    .I2(\blk00000003/blk00000005/sig0000005d ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig0000006c )
  );
  FDE   \blk00000003/blk00000005/blk00000016  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000069 ),
    .Q(\blk00000003/blk00000005/sig0000006a )
  );
  LUT4 #(
    .INIT ( 16'hcaca ))
  \blk00000003/blk00000005/blk00000015  (
    .I0(\blk00000003/blk00000005/sig00000068 ),
    .I1(din_0[0]),
    .I2(\blk00000003/blk00000005/sig0000005d ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig00000069 )
  );
  FDE   \blk00000003/blk00000005/blk00000014  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000066 ),
    .Q(\blk00000003/blk00000005/sig00000067 )
  );
  FDE   \blk00000003/blk00000005/blk00000013  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000065 ),
    .Q(\blk00000003/blk00000005/sig00000063 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000012  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .D(\blk00000003/blk00000005/sig0000005e ),
    .Q(\blk00000003/blk00000005/sig00000065 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig0000005a ),
    .A1(\blk00000003/blk00000005/sig0000005a ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDPE   \blk00000003/blk00000005/blk00000011  (
    .PRE(\blk00000003/blk00000005/sig0000005a ),
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000064 ),
    .Q(NlwRenamedSig_OI_rfd)
  );
  LUT4 #(
    .INIT ( 16'h5454 ))
  \blk00000003/blk00000005/blk00000010  (
    .I0(\blk00000003/blk00000005/sig0000005d ),
    .I1(\blk00000003/blk00000005/sig00000063 ),
    .I2(NlwRenamedSig_OI_rfd),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig00000064 )
  );
  FDE   \blk00000003/blk00000005/blk0000000f  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000062 ),
    .Q(\blk00000003/blk00000005/sig00000060 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000000e  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .D(\blk00000003/blk00000005/sig0000005e ),
    .Q(\blk00000003/blk00000005/sig00000062 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000059 ),
    .A1(\blk00000003/blk00000005/sig0000005a ),
    .A2(\blk00000003/blk00000005/sig0000005a ),
    .A3(\blk00000003/blk00000005/sig0000005a )
  );
  FDE   \blk00000003/blk00000005/blk0000000d  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000061 ),
    .Q(\blk00000003/blk00000005/sig0000005f )
  );
  LUT4 #(
    .INIT ( 16'haeae ))
  \blk00000003/blk00000005/blk0000000c  (
    .I0(\blk00000003/blk00000005/sig0000005d ),
    .I1(\blk00000003/blk00000005/sig0000005f ),
    .I2(\blk00000003/blk00000005/sig00000060 ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig00000061 )
  );
  FDE   \blk00000003/blk00000005/blk0000000b  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000005d ),
    .Q(\blk00000003/blk00000005/sig0000005e )
  );
  LUT4 #(
    .INIT ( 16'h0808 ))
  \blk00000003/blk00000005/blk0000000a  (
    .I0(nd),
    .I1(NlwRenamedSig_OI_rfd),
    .I2(\blk00000003/blk00000005/sig0000005c ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig0000005d )
  );
  FDE   \blk00000003/blk00000005/blk00000009  (
    .CE(\blk00000003/blk00000005/sig00000059 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000005b ),
    .Q(\blk00000003/blk00000005/sig0000005c )
  );
  LUT4 #(
    .INIT ( 16'h8888 ))
  \blk00000003/blk00000005/blk00000008  (
    .I0(nd),
    .I1(NlwRenamedSig_OI_rfd),
    .I2(\blk00000003/blk00000005/sig0000005a ),
    .I3(\blk00000003/blk00000005/sig0000005a ),
    .O(\blk00000003/blk00000005/sig0000005b )
  );
  GND   \blk00000003/blk00000005/blk00000007  (
    .G(\blk00000003/blk00000005/sig0000005a )
  );
  VCC   \blk00000003/blk00000005/blk00000006  (
    .P(\blk00000003/blk00000005/sig00000059 )
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
