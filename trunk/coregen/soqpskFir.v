////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: L.46
//  \   \         Application: netgen
//  /   /         Filename: soqpskFir.v
// /___/   /\     Timestamp: Mon Aug 31 09:39:02 2009
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
  output [16 : 0] dout;
  input [2 : 0] din;
  
  // synthesis translate_off
  
  wire NlwRenamedSig_OI_rfd;
  wire \blk00000003/sig0000003c ;
  wire \blk00000003/sig0000003b ;
  wire \blk00000003/sig0000003a ;
  wire \blk00000003/sig00000039 ;
  wire \blk00000003/sig00000038 ;
  wire \blk00000003/sig00000037 ;
  wire \blk00000003/sig00000036 ;
  wire \blk00000003/sig00000035 ;
  wire \blk00000003/sig00000034 ;
  wire \blk00000003/sig00000033 ;
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
  wire \blk00000003/blk00000005/sig00000058 ;
  wire \blk00000003/blk00000005/sig00000057 ;
  wire \blk00000003/blk00000005/sig00000056 ;
  wire \blk00000003/blk00000005/sig00000055 ;
  wire NLW_blk00000001_P_UNCONNECTED;
  wire NLW_blk00000002_G_UNCONNECTED;
  wire \NLW_blk00000003/blk00000005/blk000000f3_LO_UNCONNECTED ;
  wire [2 : 0] din_0;
  wire [16 : 0] dout_1;
  assign
    rfd = NlwRenamedSig_OI_rfd,
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
  FDE   \blk00000003/blk00000005/blk00000111  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000145 ),
    .Q(rdy)
  );
  FDE   \blk00000003/blk00000005/blk00000110  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000014c ),
    .Q(dout_1[2])
  );
  FDE   \blk00000003/blk00000005/blk0000010f  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000014a ),
    .Q(dout_1[1])
  );
  FDE   \blk00000003/blk00000005/blk0000010e  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000014b ),
    .Q(dout_1[0])
  );
  FDE   \blk00000003/blk00000005/blk0000010d  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000106 ),
    .Q(\blk00000003/blk00000005/sig0000014c )
  );
  FDE   \blk00000003/blk00000005/blk0000010c  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000014c ),
    .Q(\blk00000003/blk00000005/sig0000014a )
  );
  FDE   \blk00000003/blk00000005/blk0000010b  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000014a ),
    .Q(\blk00000003/blk00000005/sig0000014b )
  );
  FDE   \blk00000003/blk00000005/blk0000010a  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000149 ),
    .Q(\blk00000003/blk00000005/sig000000fd )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000109  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .D(\blk00000003/blk00000005/sig0000005a ),
    .Q(\blk00000003/blk00000005/sig00000149 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk00000108  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000148 ),
    .Q(\blk00000003/blk00000005/sig00000145 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000107  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .D(\blk00000003/blk00000005/sig0000005a ),
    .Q(\blk00000003/blk00000005/sig00000148 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000055 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk00000106  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000147 ),
    .Q(\blk00000003/blk00000005/sig00000146 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000105  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .D(\blk00000003/blk00000005/sig0000005a ),
    .Q(\blk00000003/blk00000005/sig00000147 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000055 ),
    .A1(\blk00000003/blk00000005/sig00000056 ),
    .A2(\blk00000003/blk00000005/sig00000055 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  LUT4 #(
    .INIT ( 16'h5555 ))
  \blk00000003/blk00000005/blk00000104  (
    .I0(\blk00000003/blk00000005/sig00000146 ),
    .I1(\blk00000003/blk00000005/sig00000056 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000ff )
  );
  FDE   \blk00000003/blk00000005/blk00000103  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000013e ),
    .Q(dout_1[16])
  );
  FDE   \blk00000003/blk00000005/blk00000102  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000139 ),
    .Q(dout_1[15])
  );
  FDE   \blk00000003/blk00000005/blk00000101  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000134 ),
    .Q(dout_1[14])
  );
  FDE   \blk00000003/blk00000005/blk00000100  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000012f ),
    .Q(dout_1[13])
  );
  FDE   \blk00000003/blk00000005/blk000000ff  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000012a ),
    .Q(dout_1[12])
  );
  FDE   \blk00000003/blk00000005/blk000000fe  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000125 ),
    .Q(dout_1[11])
  );
  FDE   \blk00000003/blk00000005/blk000000fd  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000120 ),
    .Q(dout_1[10])
  );
  FDE   \blk00000003/blk00000005/blk000000fc  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000011b ),
    .Q(dout_1[9])
  );
  FDE   \blk00000003/blk00000005/blk000000fb  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000116 ),
    .Q(dout_1[8])
  );
  FDE   \blk00000003/blk00000005/blk000000fa  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000111 ),
    .Q(dout_1[7])
  );
  FDE   \blk00000003/blk00000005/blk000000f9  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000010c ),
    .Q(dout_1[6])
  );
  FDE   \blk00000003/blk00000005/blk000000f8  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000107 ),
    .Q(dout_1[5])
  );
  FDE   \blk00000003/blk00000005/blk000000f7  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000101 ),
    .Q(dout_1[4])
  );
  FDE   \blk00000003/blk00000005/blk000000f6  (
    .CE(\blk00000003/blk00000005/sig00000145 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000106 ),
    .Q(dout_1[3])
  );
  FDE   \blk00000003/blk00000005/blk000000f5  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000144 ),
    .Q(\blk00000003/blk00000005/sig0000013e )
  );
  XORCY   \blk00000003/blk00000005/blk000000f4  (
    .CI(\blk00000003/blk00000005/sig00000141 ),
    .LI(\blk00000003/blk00000005/sig00000143 ),
    .O(\blk00000003/blk00000005/sig00000144 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000f3  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig0000013e ),
    .LO(\NLW_blk00000003/blk00000005/blk000000f3_LO_UNCONNECTED )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000f2  (
    .I0(\blk00000003/blk00000005/sig0000013e ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000fc ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig00000143 )
  );
  FDE   \blk00000003/blk00000005/blk000000f1  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000142 ),
    .Q(\blk00000003/blk00000005/sig00000139 )
  );
  XORCY   \blk00000003/blk00000005/blk000000f0  (
    .CI(\blk00000003/blk00000005/sig0000013c ),
    .LI(\blk00000003/blk00000005/sig0000013f ),
    .O(\blk00000003/blk00000005/sig00000142 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000ef  (
    .CI(\blk00000003/blk00000005/sig0000013c ),
    .DI(\blk00000003/blk00000005/sig00000140 ),
    .O(\blk00000003/blk00000005/sig00000141 ),
    .S(\blk00000003/blk00000005/sig0000013f )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000ee  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig0000013e ),
    .LO(\blk00000003/blk00000005/sig00000140 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000ed  (
    .I0(\blk00000003/blk00000005/sig0000013e ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000fc ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig0000013f )
  );
  FDE   \blk00000003/blk00000005/blk000000ec  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000013d ),
    .Q(\blk00000003/blk00000005/sig00000134 )
  );
  XORCY   \blk00000003/blk00000005/blk000000eb  (
    .CI(\blk00000003/blk00000005/sig00000137 ),
    .LI(\blk00000003/blk00000005/sig0000013a ),
    .O(\blk00000003/blk00000005/sig0000013d )
  );
  MUXCY   \blk00000003/blk00000005/blk000000ea  (
    .CI(\blk00000003/blk00000005/sig00000137 ),
    .DI(\blk00000003/blk00000005/sig0000013b ),
    .O(\blk00000003/blk00000005/sig0000013c ),
    .S(\blk00000003/blk00000005/sig0000013a )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000e9  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig00000139 ),
    .LO(\blk00000003/blk00000005/sig0000013b )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000e8  (
    .I0(\blk00000003/blk00000005/sig00000139 ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000f9 ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig0000013a )
  );
  FDE   \blk00000003/blk00000005/blk000000e7  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000138 ),
    .Q(\blk00000003/blk00000005/sig0000012f )
  );
  XORCY   \blk00000003/blk00000005/blk000000e6  (
    .CI(\blk00000003/blk00000005/sig00000132 ),
    .LI(\blk00000003/blk00000005/sig00000135 ),
    .O(\blk00000003/blk00000005/sig00000138 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000e5  (
    .CI(\blk00000003/blk00000005/sig00000132 ),
    .DI(\blk00000003/blk00000005/sig00000136 ),
    .O(\blk00000003/blk00000005/sig00000137 ),
    .S(\blk00000003/blk00000005/sig00000135 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000e4  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig00000134 ),
    .LO(\blk00000003/blk00000005/sig00000136 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000e3  (
    .I0(\blk00000003/blk00000005/sig00000134 ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000f5 ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig00000135 )
  );
  FDE   \blk00000003/blk00000005/blk000000e2  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000133 ),
    .Q(\blk00000003/blk00000005/sig0000012a )
  );
  XORCY   \blk00000003/blk00000005/blk000000e1  (
    .CI(\blk00000003/blk00000005/sig0000012d ),
    .LI(\blk00000003/blk00000005/sig00000130 ),
    .O(\blk00000003/blk00000005/sig00000133 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000e0  (
    .CI(\blk00000003/blk00000005/sig0000012d ),
    .DI(\blk00000003/blk00000005/sig00000131 ),
    .O(\blk00000003/blk00000005/sig00000132 ),
    .S(\blk00000003/blk00000005/sig00000130 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000df  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig0000012f ),
    .LO(\blk00000003/blk00000005/sig00000131 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000de  (
    .I0(\blk00000003/blk00000005/sig0000012f ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000f1 ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig00000130 )
  );
  FDE   \blk00000003/blk00000005/blk000000dd  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000012e ),
    .Q(\blk00000003/blk00000005/sig00000125 )
  );
  XORCY   \blk00000003/blk00000005/blk000000dc  (
    .CI(\blk00000003/blk00000005/sig00000128 ),
    .LI(\blk00000003/blk00000005/sig0000012b ),
    .O(\blk00000003/blk00000005/sig0000012e )
  );
  MUXCY   \blk00000003/blk00000005/blk000000db  (
    .CI(\blk00000003/blk00000005/sig00000128 ),
    .DI(\blk00000003/blk00000005/sig0000012c ),
    .O(\blk00000003/blk00000005/sig0000012d ),
    .S(\blk00000003/blk00000005/sig0000012b )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000da  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig0000012a ),
    .LO(\blk00000003/blk00000005/sig0000012c )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000d9  (
    .I0(\blk00000003/blk00000005/sig0000012a ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000ed ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig0000012b )
  );
  FDE   \blk00000003/blk00000005/blk000000d8  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000129 ),
    .Q(\blk00000003/blk00000005/sig00000120 )
  );
  XORCY   \blk00000003/blk00000005/blk000000d7  (
    .CI(\blk00000003/blk00000005/sig00000123 ),
    .LI(\blk00000003/blk00000005/sig00000126 ),
    .O(\blk00000003/blk00000005/sig00000129 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000d6  (
    .CI(\blk00000003/blk00000005/sig00000123 ),
    .DI(\blk00000003/blk00000005/sig00000127 ),
    .O(\blk00000003/blk00000005/sig00000128 ),
    .S(\blk00000003/blk00000005/sig00000126 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000d5  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig00000125 ),
    .LO(\blk00000003/blk00000005/sig00000127 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000d4  (
    .I0(\blk00000003/blk00000005/sig00000125 ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000e9 ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig00000126 )
  );
  FDE   \blk00000003/blk00000005/blk000000d3  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000124 ),
    .Q(\blk00000003/blk00000005/sig0000011b )
  );
  XORCY   \blk00000003/blk00000005/blk000000d2  (
    .CI(\blk00000003/blk00000005/sig0000011e ),
    .LI(\blk00000003/blk00000005/sig00000121 ),
    .O(\blk00000003/blk00000005/sig00000124 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000d1  (
    .CI(\blk00000003/blk00000005/sig0000011e ),
    .DI(\blk00000003/blk00000005/sig00000122 ),
    .O(\blk00000003/blk00000005/sig00000123 ),
    .S(\blk00000003/blk00000005/sig00000121 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000d0  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig00000120 ),
    .LO(\blk00000003/blk00000005/sig00000122 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000cf  (
    .I0(\blk00000003/blk00000005/sig00000120 ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000e5 ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig00000121 )
  );
  FDE   \blk00000003/blk00000005/blk000000ce  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000011f ),
    .Q(\blk00000003/blk00000005/sig00000116 )
  );
  XORCY   \blk00000003/blk00000005/blk000000cd  (
    .CI(\blk00000003/blk00000005/sig00000119 ),
    .LI(\blk00000003/blk00000005/sig0000011c ),
    .O(\blk00000003/blk00000005/sig0000011f )
  );
  MUXCY   \blk00000003/blk00000005/blk000000cc  (
    .CI(\blk00000003/blk00000005/sig00000119 ),
    .DI(\blk00000003/blk00000005/sig0000011d ),
    .O(\blk00000003/blk00000005/sig0000011e ),
    .S(\blk00000003/blk00000005/sig0000011c )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000cb  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig0000011b ),
    .LO(\blk00000003/blk00000005/sig0000011d )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000ca  (
    .I0(\blk00000003/blk00000005/sig0000011b ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000e1 ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig0000011c )
  );
  FDE   \blk00000003/blk00000005/blk000000c9  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000011a ),
    .Q(\blk00000003/blk00000005/sig00000111 )
  );
  XORCY   \blk00000003/blk00000005/blk000000c8  (
    .CI(\blk00000003/blk00000005/sig00000114 ),
    .LI(\blk00000003/blk00000005/sig00000117 ),
    .O(\blk00000003/blk00000005/sig0000011a )
  );
  MUXCY   \blk00000003/blk00000005/blk000000c7  (
    .CI(\blk00000003/blk00000005/sig00000114 ),
    .DI(\blk00000003/blk00000005/sig00000118 ),
    .O(\blk00000003/blk00000005/sig00000119 ),
    .S(\blk00000003/blk00000005/sig00000117 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000c6  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig00000116 ),
    .LO(\blk00000003/blk00000005/sig00000118 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000c5  (
    .I0(\blk00000003/blk00000005/sig00000116 ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000dd ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig00000117 )
  );
  FDE   \blk00000003/blk00000005/blk000000c4  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000115 ),
    .Q(\blk00000003/blk00000005/sig0000010c )
  );
  XORCY   \blk00000003/blk00000005/blk000000c3  (
    .CI(\blk00000003/blk00000005/sig0000010f ),
    .LI(\blk00000003/blk00000005/sig00000112 ),
    .O(\blk00000003/blk00000005/sig00000115 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000c2  (
    .CI(\blk00000003/blk00000005/sig0000010f ),
    .DI(\blk00000003/blk00000005/sig00000113 ),
    .O(\blk00000003/blk00000005/sig00000114 ),
    .S(\blk00000003/blk00000005/sig00000112 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000c1  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig00000111 ),
    .LO(\blk00000003/blk00000005/sig00000113 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000c0  (
    .I0(\blk00000003/blk00000005/sig00000111 ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000d9 ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig00000112 )
  );
  FDE   \blk00000003/blk00000005/blk000000bf  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000110 ),
    .Q(\blk00000003/blk00000005/sig00000107 )
  );
  XORCY   \blk00000003/blk00000005/blk000000be  (
    .CI(\blk00000003/blk00000005/sig0000010a ),
    .LI(\blk00000003/blk00000005/sig0000010d ),
    .O(\blk00000003/blk00000005/sig00000110 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000bd  (
    .CI(\blk00000003/blk00000005/sig0000010a ),
    .DI(\blk00000003/blk00000005/sig0000010e ),
    .O(\blk00000003/blk00000005/sig0000010f ),
    .S(\blk00000003/blk00000005/sig0000010d )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000bc  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig0000010c ),
    .LO(\blk00000003/blk00000005/sig0000010e )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000bb  (
    .I0(\blk00000003/blk00000005/sig0000010c ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000d5 ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig0000010d )
  );
  FDE   \blk00000003/blk00000005/blk000000ba  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000010b ),
    .Q(\blk00000003/blk00000005/sig00000101 )
  );
  XORCY   \blk00000003/blk00000005/blk000000b9  (
    .CI(\blk00000003/blk00000005/sig00000104 ),
    .LI(\blk00000003/blk00000005/sig00000108 ),
    .O(\blk00000003/blk00000005/sig0000010b )
  );
  MUXCY   \blk00000003/blk00000005/blk000000b8  (
    .CI(\blk00000003/blk00000005/sig00000104 ),
    .DI(\blk00000003/blk00000005/sig00000109 ),
    .O(\blk00000003/blk00000005/sig0000010a ),
    .S(\blk00000003/blk00000005/sig00000108 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000b7  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig00000107 ),
    .LO(\blk00000003/blk00000005/sig00000109 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000b6  (
    .I0(\blk00000003/blk00000005/sig00000107 ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000d1 ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig00000108 )
  );
  FDE   \blk00000003/blk00000005/blk000000b5  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000105 ),
    .Q(\blk00000003/blk00000005/sig00000106 )
  );
  XORCY   \blk00000003/blk00000005/blk000000b4  (
    .CI(\blk00000003/blk00000005/sig00000100 ),
    .LI(\blk00000003/blk00000005/sig00000102 ),
    .O(\blk00000003/blk00000005/sig00000105 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000b3  (
    .CI(\blk00000003/blk00000005/sig00000100 ),
    .DI(\blk00000003/blk00000005/sig00000103 ),
    .O(\blk00000003/blk00000005/sig00000104 ),
    .S(\blk00000003/blk00000005/sig00000102 )
  );
  MULT_AND   \blk00000003/blk00000005/blk000000b2  (
    .I0(\blk00000003/blk00000005/sig000000fe ),
    .I1(\blk00000003/blk00000005/sig00000101 ),
    .LO(\blk00000003/blk00000005/sig00000103 )
  );
  LUT4 #(
    .INIT ( 16'h78b4 ))
  \blk00000003/blk00000005/blk000000b1  (
    .I0(\blk00000003/blk00000005/sig00000101 ),
    .I1(\blk00000003/blk00000005/sig000000fe ),
    .I2(\blk00000003/blk00000005/sig000000cd ),
    .I3(\blk00000003/blk00000005/sig000000ff ),
    .O(\blk00000003/blk00000005/sig00000102 )
  );
  LUT4 #(
    .INIT ( 16'h1111 ))
  \blk00000003/blk00000005/blk000000b0  (
    .I0(\blk00000003/blk00000005/sig000000ff ),
    .I1(\blk00000003/blk00000005/sig000000fd ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig00000100 )
  );
  LUT4 #(
    .INIT ( 16'h5555 ))
  \blk00000003/blk00000005/blk000000af  (
    .I0(\blk00000003/blk00000005/sig000000fd ),
    .I1(\blk00000003/blk00000005/sig00000056 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000fe )
  );
  FDE   \blk00000003/blk00000005/blk000000ae  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000fb ),
    .Q(\blk00000003/blk00000005/sig000000fc )
  );
  XORCY   \blk00000003/blk00000005/blk000000ad  (
    .CI(\blk00000003/blk00000005/sig000000f7 ),
    .LI(\blk00000003/blk00000005/sig000000fa ),
    .O(\blk00000003/blk00000005/sig000000fb )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk000000ac  (
    .I0(\blk00000003/blk00000005/sig000000a2 ),
    .I1(\blk00000003/blk00000005/sig000000c9 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000fa )
  );
  FDE   \blk00000003/blk00000005/blk000000ab  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000f8 ),
    .Q(\blk00000003/blk00000005/sig000000f9 )
  );
  XORCY   \blk00000003/blk00000005/blk000000aa  (
    .CI(\blk00000003/blk00000005/sig000000f3 ),
    .LI(\blk00000003/blk00000005/sig000000f6 ),
    .O(\blk00000003/blk00000005/sig000000f8 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000a9  (
    .CI(\blk00000003/blk00000005/sig000000f3 ),
    .DI(\blk00000003/blk00000005/sig000000a2 ),
    .O(\blk00000003/blk00000005/sig000000f7 ),
    .S(\blk00000003/blk00000005/sig000000f6 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk000000a8  (
    .I0(\blk00000003/blk00000005/sig000000a2 ),
    .I1(\blk00000003/blk00000005/sig000000c9 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000f6 )
  );
  FDE   \blk00000003/blk00000005/blk000000a7  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000f4 ),
    .Q(\blk00000003/blk00000005/sig000000f5 )
  );
  XORCY   \blk00000003/blk00000005/blk000000a6  (
    .CI(\blk00000003/blk00000005/sig000000ef ),
    .LI(\blk00000003/blk00000005/sig000000f2 ),
    .O(\blk00000003/blk00000005/sig000000f4 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000a5  (
    .CI(\blk00000003/blk00000005/sig000000ef ),
    .DI(\blk00000003/blk00000005/sig000000a0 ),
    .O(\blk00000003/blk00000005/sig000000f3 ),
    .S(\blk00000003/blk00000005/sig000000f2 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk000000a4  (
    .I0(\blk00000003/blk00000005/sig000000a0 ),
    .I1(\blk00000003/blk00000005/sig000000c9 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000f2 )
  );
  FDE   \blk00000003/blk00000005/blk000000a3  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000f0 ),
    .Q(\blk00000003/blk00000005/sig000000f1 )
  );
  XORCY   \blk00000003/blk00000005/blk000000a2  (
    .CI(\blk00000003/blk00000005/sig000000eb ),
    .LI(\blk00000003/blk00000005/sig000000ee ),
    .O(\blk00000003/blk00000005/sig000000f0 )
  );
  MUXCY   \blk00000003/blk00000005/blk000000a1  (
    .CI(\blk00000003/blk00000005/sig000000eb ),
    .DI(\blk00000003/blk00000005/sig0000009e ),
    .O(\blk00000003/blk00000005/sig000000ef ),
    .S(\blk00000003/blk00000005/sig000000ee )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk000000a0  (
    .I0(\blk00000003/blk00000005/sig0000009e ),
    .I1(\blk00000003/blk00000005/sig000000c7 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000ee )
  );
  FDE   \blk00000003/blk00000005/blk0000009f  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000ec ),
    .Q(\blk00000003/blk00000005/sig000000ed )
  );
  XORCY   \blk00000003/blk00000005/blk0000009e  (
    .CI(\blk00000003/blk00000005/sig000000e7 ),
    .LI(\blk00000003/blk00000005/sig000000ea ),
    .O(\blk00000003/blk00000005/sig000000ec )
  );
  MUXCY   \blk00000003/blk00000005/blk0000009d  (
    .CI(\blk00000003/blk00000005/sig000000e7 ),
    .DI(\blk00000003/blk00000005/sig0000009c ),
    .O(\blk00000003/blk00000005/sig000000eb ),
    .S(\blk00000003/blk00000005/sig000000ea )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk0000009c  (
    .I0(\blk00000003/blk00000005/sig0000009c ),
    .I1(\blk00000003/blk00000005/sig000000c5 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000ea )
  );
  FDE   \blk00000003/blk00000005/blk0000009b  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000e8 ),
    .Q(\blk00000003/blk00000005/sig000000e9 )
  );
  XORCY   \blk00000003/blk00000005/blk0000009a  (
    .CI(\blk00000003/blk00000005/sig000000e3 ),
    .LI(\blk00000003/blk00000005/sig000000e6 ),
    .O(\blk00000003/blk00000005/sig000000e8 )
  );
  MUXCY   \blk00000003/blk00000005/blk00000099  (
    .CI(\blk00000003/blk00000005/sig000000e3 ),
    .DI(\blk00000003/blk00000005/sig0000009a ),
    .O(\blk00000003/blk00000005/sig000000e7 ),
    .S(\blk00000003/blk00000005/sig000000e6 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk00000098  (
    .I0(\blk00000003/blk00000005/sig0000009a ),
    .I1(\blk00000003/blk00000005/sig000000c3 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000e6 )
  );
  FDE   \blk00000003/blk00000005/blk00000097  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000e4 ),
    .Q(\blk00000003/blk00000005/sig000000e5 )
  );
  XORCY   \blk00000003/blk00000005/blk00000096  (
    .CI(\blk00000003/blk00000005/sig000000df ),
    .LI(\blk00000003/blk00000005/sig000000e2 ),
    .O(\blk00000003/blk00000005/sig000000e4 )
  );
  MUXCY   \blk00000003/blk00000005/blk00000095  (
    .CI(\blk00000003/blk00000005/sig000000df ),
    .DI(\blk00000003/blk00000005/sig00000098 ),
    .O(\blk00000003/blk00000005/sig000000e3 ),
    .S(\blk00000003/blk00000005/sig000000e2 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk00000094  (
    .I0(\blk00000003/blk00000005/sig00000098 ),
    .I1(\blk00000003/blk00000005/sig000000c1 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000e2 )
  );
  FDE   \blk00000003/blk00000005/blk00000093  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000e0 ),
    .Q(\blk00000003/blk00000005/sig000000e1 )
  );
  XORCY   \blk00000003/blk00000005/blk00000092  (
    .CI(\blk00000003/blk00000005/sig000000db ),
    .LI(\blk00000003/blk00000005/sig000000de ),
    .O(\blk00000003/blk00000005/sig000000e0 )
  );
  MUXCY   \blk00000003/blk00000005/blk00000091  (
    .CI(\blk00000003/blk00000005/sig000000db ),
    .DI(\blk00000003/blk00000005/sig00000096 ),
    .O(\blk00000003/blk00000005/sig000000df ),
    .S(\blk00000003/blk00000005/sig000000de )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk00000090  (
    .I0(\blk00000003/blk00000005/sig00000096 ),
    .I1(\blk00000003/blk00000005/sig000000bf ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000de )
  );
  FDE   \blk00000003/blk00000005/blk0000008f  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000dc ),
    .Q(\blk00000003/blk00000005/sig000000dd )
  );
  XORCY   \blk00000003/blk00000005/blk0000008e  (
    .CI(\blk00000003/blk00000005/sig000000d7 ),
    .LI(\blk00000003/blk00000005/sig000000da ),
    .O(\blk00000003/blk00000005/sig000000dc )
  );
  MUXCY   \blk00000003/blk00000005/blk0000008d  (
    .CI(\blk00000003/blk00000005/sig000000d7 ),
    .DI(\blk00000003/blk00000005/sig00000094 ),
    .O(\blk00000003/blk00000005/sig000000db ),
    .S(\blk00000003/blk00000005/sig000000da )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk0000008c  (
    .I0(\blk00000003/blk00000005/sig00000094 ),
    .I1(\blk00000003/blk00000005/sig000000bd ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000da )
  );
  FDE   \blk00000003/blk00000005/blk0000008b  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000d8 ),
    .Q(\blk00000003/blk00000005/sig000000d9 )
  );
  XORCY   \blk00000003/blk00000005/blk0000008a  (
    .CI(\blk00000003/blk00000005/sig000000d3 ),
    .LI(\blk00000003/blk00000005/sig000000d6 ),
    .O(\blk00000003/blk00000005/sig000000d8 )
  );
  MUXCY   \blk00000003/blk00000005/blk00000089  (
    .CI(\blk00000003/blk00000005/sig000000d3 ),
    .DI(\blk00000003/blk00000005/sig00000092 ),
    .O(\blk00000003/blk00000005/sig000000d7 ),
    .S(\blk00000003/blk00000005/sig000000d6 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk00000088  (
    .I0(\blk00000003/blk00000005/sig00000092 ),
    .I1(\blk00000003/blk00000005/sig000000bb ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000d6 )
  );
  FDE   \blk00000003/blk00000005/blk00000087  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000d4 ),
    .Q(\blk00000003/blk00000005/sig000000d5 )
  );
  XORCY   \blk00000003/blk00000005/blk00000086  (
    .CI(\blk00000003/blk00000005/sig000000cf ),
    .LI(\blk00000003/blk00000005/sig000000d2 ),
    .O(\blk00000003/blk00000005/sig000000d4 )
  );
  MUXCY   \blk00000003/blk00000005/blk00000085  (
    .CI(\blk00000003/blk00000005/sig000000cf ),
    .DI(\blk00000003/blk00000005/sig00000090 ),
    .O(\blk00000003/blk00000005/sig000000d3 ),
    .S(\blk00000003/blk00000005/sig000000d2 )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk00000084  (
    .I0(\blk00000003/blk00000005/sig00000090 ),
    .I1(\blk00000003/blk00000005/sig000000b9 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000d2 )
  );
  FDE   \blk00000003/blk00000005/blk00000083  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000d0 ),
    .Q(\blk00000003/blk00000005/sig000000d1 )
  );
  XORCY   \blk00000003/blk00000005/blk00000082  (
    .CI(\blk00000003/blk00000005/sig000000cb ),
    .LI(\blk00000003/blk00000005/sig000000ce ),
    .O(\blk00000003/blk00000005/sig000000d0 )
  );
  MUXCY   \blk00000003/blk00000005/blk00000081  (
    .CI(\blk00000003/blk00000005/sig000000cb ),
    .DI(\blk00000003/blk00000005/sig0000008e ),
    .O(\blk00000003/blk00000005/sig000000cf ),
    .S(\blk00000003/blk00000005/sig000000ce )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk00000080  (
    .I0(\blk00000003/blk00000005/sig0000008e ),
    .I1(\blk00000003/blk00000005/sig000000b7 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000ce )
  );
  FDE   \blk00000003/blk00000005/blk0000007f  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000cc ),
    .Q(\blk00000003/blk00000005/sig000000cd )
  );
  XORCY   \blk00000003/blk00000005/blk0000007e  (
    .CI(\blk00000003/blk00000005/sig00000056 ),
    .LI(\blk00000003/blk00000005/sig000000ca ),
    .O(\blk00000003/blk00000005/sig000000cc )
  );
  MUXCY   \blk00000003/blk00000005/blk0000007d  (
    .CI(\blk00000003/blk00000005/sig00000056 ),
    .DI(\blk00000003/blk00000005/sig0000008c ),
    .O(\blk00000003/blk00000005/sig000000cb ),
    .S(\blk00000003/blk00000005/sig000000ca )
  );
  LUT4 #(
    .INIT ( 16'h6666 ))
  \blk00000003/blk00000005/blk0000007c  (
    .I0(\blk00000003/blk00000005/sig0000008c ),
    .I1(\blk00000003/blk00000005/sig000000b5 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000ca )
  );
  FDE   \blk00000003/blk00000005/blk0000007b  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000c8 ),
    .Q(\blk00000003/blk00000005/sig000000c9 )
  );
  LUT4 #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000007a  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b2 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000c8 )
  );
  FDE   \blk00000003/blk00000005/blk00000079  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000c6 ),
    .Q(\blk00000003/blk00000005/sig000000c7 )
  );
  LUT4 #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000078  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b2 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000c6 )
  );
  FDE   \blk00000003/blk00000005/blk00000077  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000c4 ),
    .Q(\blk00000003/blk00000005/sig000000c5 )
  );
  LUT4 #(
    .INIT ( 16'h000c ))
  \blk00000003/blk00000005/blk00000076  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b2 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000c4 )
  );
  FDE   \blk00000003/blk00000005/blk00000075  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000c2 ),
    .Q(\blk00000003/blk00000005/sig000000c3 )
  );
  LUT4 #(
    .INIT ( 16'h000a ))
  \blk00000003/blk00000005/blk00000074  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b2 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000c2 )
  );
  FDE   \blk00000003/blk00000005/blk00000073  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000c0 ),
    .Q(\blk00000003/blk00000005/sig000000c1 )
  );
  LUT4 #(
    .INIT ( 16'h000a ))
  \blk00000003/blk00000005/blk00000072  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b2 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000c0 )
  );
  FDE   \blk00000003/blk00000005/blk00000071  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000be ),
    .Q(\blk00000003/blk00000005/sig000000bf )
  );
  LUT4 #(
    .INIT ( 16'h000c ))
  \blk00000003/blk00000005/blk00000070  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b2 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000be )
  );
  FDE   \blk00000003/blk00000005/blk0000006f  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000bc ),
    .Q(\blk00000003/blk00000005/sig000000bd )
  );
  LUT4 #(
    .INIT ( 16'h0008 ))
  \blk00000003/blk00000005/blk0000006e  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b2 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000bc )
  );
  FDE   \blk00000003/blk00000005/blk0000006d  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000ba ),
    .Q(\blk00000003/blk00000005/sig000000bb )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \blk00000003/blk00000005/blk0000006c  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b2 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000ba )
  );
  FDE   \blk00000003/blk00000005/blk0000006b  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000b8 ),
    .Q(\blk00000003/blk00000005/sig000000b9 )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \blk00000003/blk00000005/blk0000006a  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b2 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000b8 )
  );
  FDE   \blk00000003/blk00000005/blk00000069  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000b6 ),
    .Q(\blk00000003/blk00000005/sig000000b7 )
  );
  LUT4 #(
    .INIT ( 16'h0006 ))
  \blk00000003/blk00000005/blk00000068  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b2 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000b6 )
  );
  FDE   \blk00000003/blk00000005/blk00000067  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000b4 ),
    .Q(\blk00000003/blk00000005/sig000000b5 )
  );
  LUT4 #(
    .INIT ( 16'h000c ))
  \blk00000003/blk00000005/blk00000066  (
    .I0(\blk00000003/blk00000005/sig000000ae ),
    .I1(\blk00000003/blk00000005/sig000000b2 ),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig000000b4 )
  );
  FDE   \blk00000003/blk00000005/blk00000065  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000b3 ),
    .Q(\blk00000003/blk00000005/sig000000b0 )
  );
  LUT4 #(
    .INIT ( 16'h88e8 ))
  \blk00000003/blk00000005/blk00000064  (
    .I0(\blk00000003/blk00000005/sig000000a8 ),
    .I1(\blk00000003/blk00000005/sig000000aa ),
    .I2(\blk00000003/blk00000005/sig000000b0 ),
    .I3(\blk00000003/blk00000005/sig000000a4 ),
    .O(\blk00000003/blk00000005/sig000000b3 )
  );
  FDE   \blk00000003/blk00000005/blk00000063  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000b1 ),
    .Q(\blk00000003/blk00000005/sig000000b2 )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000003/blk00000005/blk00000062  (
    .I0(\blk00000003/blk00000005/sig000000a8 ),
    .I1(\blk00000003/blk00000005/sig000000aa ),
    .I2(\blk00000003/blk00000005/sig000000b0 ),
    .I3(\blk00000003/blk00000005/sig000000a4 ),
    .O(\blk00000003/blk00000005/sig000000b1 )
  );
  FDE   \blk00000003/blk00000005/blk00000061  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000af ),
    .Q(\blk00000003/blk00000005/sig000000ac )
  );
  LUT4 #(
    .INIT ( 16'h88e8 ))
  \blk00000003/blk00000005/blk00000060  (
    .I0(\blk00000003/blk00000005/sig000000a6 ),
    .I1(\blk00000003/blk00000005/sig00000072 ),
    .I2(\blk00000003/blk00000005/sig000000ac ),
    .I3(\blk00000003/blk00000005/sig000000a4 ),
    .O(\blk00000003/blk00000005/sig000000af )
  );
  FDE   \blk00000003/blk00000005/blk0000005f  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000ad ),
    .Q(\blk00000003/blk00000005/sig000000ae )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000003/blk00000005/blk0000005e  (
    .I0(\blk00000003/blk00000005/sig000000a6 ),
    .I1(\blk00000003/blk00000005/sig00000072 ),
    .I2(\blk00000003/blk00000005/sig000000ac ),
    .I3(\blk00000003/blk00000005/sig000000a4 ),
    .O(\blk00000003/blk00000005/sig000000ad )
  );
  FDE   \blk00000003/blk00000005/blk0000005d  (
    .CE(\blk00000003/blk00000005/sig000000a3 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000ab ),
    .Q(\blk00000003/blk00000005/sig00000072 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000005c  (
    .CE(\blk00000003/blk00000005/sig000000a3 ),
    .D(\blk00000003/blk00000005/sig000000aa ),
    .Q(\blk00000003/blk00000005/sig000000ab ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk0000005b  (
    .CE(\blk00000003/blk00000005/sig000000a3 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000a9 ),
    .Q(\blk00000003/blk00000005/sig000000aa )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000005a  (
    .CE(\blk00000003/blk00000005/sig000000a3 ),
    .D(\blk00000003/blk00000005/sig000000a8 ),
    .Q(\blk00000003/blk00000005/sig000000a9 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk00000059  (
    .CE(\blk00000003/blk00000005/sig000000a3 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000a7 ),
    .Q(\blk00000003/blk00000005/sig000000a8 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000058  (
    .CE(\blk00000003/blk00000005/sig000000a3 ),
    .D(\blk00000003/blk00000005/sig000000a6 ),
    .Q(\blk00000003/blk00000005/sig000000a7 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk00000057  (
    .CE(\blk00000003/blk00000005/sig000000a3 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000a5 ),
    .Q(\blk00000003/blk00000005/sig000000a6 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000056  (
    .CE(\blk00000003/blk00000005/sig000000a3 ),
    .D(\blk00000003/blk00000005/sig00000071 ),
    .Q(\blk00000003/blk00000005/sig000000a5 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk00000055  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000005a ),
    .Q(\blk00000003/blk00000005/sig000000a4 )
  );
  FDE   \blk00000003/blk00000005/blk00000054  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000005b ),
    .Q(\blk00000003/blk00000005/sig000000a3 )
  );
  FDE   \blk00000003/blk00000005/blk00000053  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig000000a1 ),
    .Q(\blk00000003/blk00000005/sig000000a2 )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk00000052  (
    .I0(\blk00000003/blk00000005/sig0000007d ),
    .I1(\blk00000003/blk00000005/sig00000081 ),
    .I2(\blk00000003/blk00000005/sig00000085 ),
    .I3(\blk00000003/blk00000005/sig00000089 ),
    .O(\blk00000003/blk00000005/sig000000a1 )
  );
  FDE   \blk00000003/blk00000005/blk00000051  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000009f ),
    .Q(\blk00000003/blk00000005/sig000000a0 )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk00000050  (
    .I0(\blk00000003/blk00000005/sig0000007d ),
    .I1(\blk00000003/blk00000005/sig00000081 ),
    .I2(\blk00000003/blk00000005/sig00000085 ),
    .I3(\blk00000003/blk00000005/sig00000089 ),
    .O(\blk00000003/blk00000005/sig0000009f )
  );
  FDE   \blk00000003/blk00000005/blk0000004f  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000009d ),
    .Q(\blk00000003/blk00000005/sig0000009e )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk0000004e  (
    .I0(\blk00000003/blk00000005/sig0000007d ),
    .I1(\blk00000003/blk00000005/sig00000081 ),
    .I2(\blk00000003/blk00000005/sig00000085 ),
    .I3(\blk00000003/blk00000005/sig00000089 ),
    .O(\blk00000003/blk00000005/sig0000009d )
  );
  FDE   \blk00000003/blk00000005/blk0000004d  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000009b ),
    .Q(\blk00000003/blk00000005/sig0000009c )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk0000004c  (
    .I0(\blk00000003/blk00000005/sig0000007d ),
    .I1(\blk00000003/blk00000005/sig00000081 ),
    .I2(\blk00000003/blk00000005/sig00000085 ),
    .I3(\blk00000003/blk00000005/sig00000089 ),
    .O(\blk00000003/blk00000005/sig0000009b )
  );
  FDE   \blk00000003/blk00000005/blk0000004b  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000099 ),
    .Q(\blk00000003/blk00000005/sig0000009a )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk0000004a  (
    .I0(\blk00000003/blk00000005/sig0000007d ),
    .I1(\blk00000003/blk00000005/sig00000081 ),
    .I2(\blk00000003/blk00000005/sig00000085 ),
    .I3(\blk00000003/blk00000005/sig00000089 ),
    .O(\blk00000003/blk00000005/sig00000099 )
  );
  FDE   \blk00000003/blk00000005/blk00000049  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000097 ),
    .Q(\blk00000003/blk00000005/sig00000098 )
  );
  LUT4 #(
    .INIT ( 16'h00fe ))
  \blk00000003/blk00000005/blk00000048  (
    .I0(\blk00000003/blk00000005/sig0000007d ),
    .I1(\blk00000003/blk00000005/sig00000081 ),
    .I2(\blk00000003/blk00000005/sig00000085 ),
    .I3(\blk00000003/blk00000005/sig00000089 ),
    .O(\blk00000003/blk00000005/sig00000097 )
  );
  FDE   \blk00000003/blk00000005/blk00000047  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000095 ),
    .Q(\blk00000003/blk00000005/sig00000096 )
  );
  LUT4 #(
    .INIT ( 16'h373e ))
  \blk00000003/blk00000005/blk00000046  (
    .I0(\blk00000003/blk00000005/sig0000007d ),
    .I1(\blk00000003/blk00000005/sig00000081 ),
    .I2(\blk00000003/blk00000005/sig00000085 ),
    .I3(\blk00000003/blk00000005/sig00000089 ),
    .O(\blk00000003/blk00000005/sig00000095 )
  );
  FDE   \blk00000003/blk00000005/blk00000045  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000093 ),
    .Q(\blk00000003/blk00000005/sig00000094 )
  );
  LUT4 #(
    .INIT ( 16'h4bd2 ))
  \blk00000003/blk00000005/blk00000044  (
    .I0(\blk00000003/blk00000005/sig0000007d ),
    .I1(\blk00000003/blk00000005/sig00000081 ),
    .I2(\blk00000003/blk00000005/sig00000085 ),
    .I3(\blk00000003/blk00000005/sig00000089 ),
    .O(\blk00000003/blk00000005/sig00000093 )
  );
  FDE   \blk00000003/blk00000005/blk00000043  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000091 ),
    .Q(\blk00000003/blk00000005/sig00000092 )
  );
  LUT4 #(
    .INIT ( 16'h9966 ))
  \blk00000003/blk00000005/blk00000042  (
    .I0(\blk00000003/blk00000005/sig0000007d ),
    .I1(\blk00000003/blk00000005/sig00000081 ),
    .I2(\blk00000003/blk00000005/sig00000085 ),
    .I3(\blk00000003/blk00000005/sig00000089 ),
    .O(\blk00000003/blk00000005/sig00000091 )
  );
  FDE   \blk00000003/blk00000005/blk00000041  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000008f ),
    .Q(\blk00000003/blk00000005/sig00000090 )
  );
  LUT4 #(
    .INIT ( 16'hff00 ))
  \blk00000003/blk00000005/blk00000040  (
    .I0(\blk00000003/blk00000005/sig0000007d ),
    .I1(\blk00000003/blk00000005/sig00000081 ),
    .I2(\blk00000003/blk00000005/sig00000085 ),
    .I3(\blk00000003/blk00000005/sig00000089 ),
    .O(\blk00000003/blk00000005/sig0000008f )
  );
  FDE   \blk00000003/blk00000005/blk0000003f  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000008d ),
    .Q(\blk00000003/blk00000005/sig0000008e )
  );
  LUT4 #(
    .INIT ( 16'hff00 ))
  \blk00000003/blk00000005/blk0000003e  (
    .I0(\blk00000003/blk00000005/sig0000007d ),
    .I1(\blk00000003/blk00000005/sig00000081 ),
    .I2(\blk00000003/blk00000005/sig00000085 ),
    .I3(\blk00000003/blk00000005/sig00000089 ),
    .O(\blk00000003/blk00000005/sig0000008d )
  );
  FDE   \blk00000003/blk00000005/blk0000003d  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000008b ),
    .Q(\blk00000003/blk00000005/sig0000008c )
  );
  LUT4 #(
    .INIT ( 16'hf0f0 ))
  \blk00000003/blk00000005/blk0000003c  (
    .I0(\blk00000003/blk00000005/sig0000007d ),
    .I1(\blk00000003/blk00000005/sig00000081 ),
    .I2(\blk00000003/blk00000005/sig00000085 ),
    .I3(\blk00000003/blk00000005/sig00000089 ),
    .O(\blk00000003/blk00000005/sig0000008b )
  );
  FDE   \blk00000003/blk00000005/blk0000003b  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000008a ),
    .Q(\blk00000003/blk00000005/sig00000087 )
  );
  LUT4 #(
    .INIT ( 16'h88e8 ))
  \blk00000003/blk00000005/blk0000003a  (
    .I0(\blk00000003/blk00000005/sig00000071 ),
    .I1(\blk00000003/blk00000005/sig00000074 ),
    .I2(\blk00000003/blk00000005/sig00000087 ),
    .I3(\blk00000003/blk00000005/sig0000006b ),
    .O(\blk00000003/blk00000005/sig0000008a )
  );
  FDE   \blk00000003/blk00000005/blk00000039  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000088 ),
    .Q(\blk00000003/blk00000005/sig00000089 )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000003/blk00000005/blk00000038  (
    .I0(\blk00000003/blk00000005/sig00000071 ),
    .I1(\blk00000003/blk00000005/sig00000074 ),
    .I2(\blk00000003/blk00000005/sig00000087 ),
    .I3(\blk00000003/blk00000005/sig0000006b ),
    .O(\blk00000003/blk00000005/sig00000088 )
  );
  FDE   \blk00000003/blk00000005/blk00000037  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000086 ),
    .Q(\blk00000003/blk00000005/sig00000083 )
  );
  LUT4 #(
    .INIT ( 16'h88e8 ))
  \blk00000003/blk00000005/blk00000036  (
    .I0(\blk00000003/blk00000005/sig0000006f ),
    .I1(\blk00000003/blk00000005/sig00000076 ),
    .I2(\blk00000003/blk00000005/sig00000083 ),
    .I3(\blk00000003/blk00000005/sig0000006b ),
    .O(\blk00000003/blk00000005/sig00000086 )
  );
  FDE   \blk00000003/blk00000005/blk00000035  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000084 ),
    .Q(\blk00000003/blk00000005/sig00000085 )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000003/blk00000005/blk00000034  (
    .I0(\blk00000003/blk00000005/sig0000006f ),
    .I1(\blk00000003/blk00000005/sig00000076 ),
    .I2(\blk00000003/blk00000005/sig00000083 ),
    .I3(\blk00000003/blk00000005/sig0000006b ),
    .O(\blk00000003/blk00000005/sig00000084 )
  );
  FDE   \blk00000003/blk00000005/blk00000033  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000082 ),
    .Q(\blk00000003/blk00000005/sig0000007f )
  );
  LUT4 #(
    .INIT ( 16'h88e8 ))
  \blk00000003/blk00000005/blk00000032  (
    .I0(\blk00000003/blk00000005/sig0000006d ),
    .I1(\blk00000003/blk00000005/sig00000078 ),
    .I2(\blk00000003/blk00000005/sig0000007f ),
    .I3(\blk00000003/blk00000005/sig0000006b ),
    .O(\blk00000003/blk00000005/sig00000082 )
  );
  FDE   \blk00000003/blk00000005/blk00000031  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000080 ),
    .Q(\blk00000003/blk00000005/sig00000081 )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000003/blk00000005/blk00000030  (
    .I0(\blk00000003/blk00000005/sig0000006d ),
    .I1(\blk00000003/blk00000005/sig00000078 ),
    .I2(\blk00000003/blk00000005/sig0000007f ),
    .I3(\blk00000003/blk00000005/sig0000006b ),
    .O(\blk00000003/blk00000005/sig00000080 )
  );
  FDE   \blk00000003/blk00000005/blk0000002f  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000007e ),
    .Q(\blk00000003/blk00000005/sig0000007b )
  );
  LUT4 #(
    .INIT ( 16'h88e8 ))
  \blk00000003/blk00000005/blk0000002e  (
    .I0(\blk00000003/blk00000005/sig00000063 ),
    .I1(\blk00000003/blk00000005/sig0000007a ),
    .I2(\blk00000003/blk00000005/sig0000007b ),
    .I3(\blk00000003/blk00000005/sig0000006b ),
    .O(\blk00000003/blk00000005/sig0000007e )
  );
  FDE   \blk00000003/blk00000005/blk0000002d  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000007c ),
    .Q(\blk00000003/blk00000005/sig0000007d )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000003/blk00000005/blk0000002c  (
    .I0(\blk00000003/blk00000005/sig00000063 ),
    .I1(\blk00000003/blk00000005/sig0000007a ),
    .I2(\blk00000003/blk00000005/sig0000007b ),
    .I3(\blk00000003/blk00000005/sig0000006b ),
    .O(\blk00000003/blk00000005/sig0000007c )
  );
  FDE   \blk00000003/blk00000005/blk0000002b  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000079 ),
    .Q(\blk00000003/blk00000005/sig0000007a )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000002a  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .D(\blk00000003/blk00000005/sig00000078 ),
    .Q(\blk00000003/blk00000005/sig00000079 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk00000029  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000077 ),
    .Q(\blk00000003/blk00000005/sig00000078 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000028  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .D(\blk00000003/blk00000005/sig00000076 ),
    .Q(\blk00000003/blk00000005/sig00000077 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk00000027  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000075 ),
    .Q(\blk00000003/blk00000005/sig00000076 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000026  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .D(\blk00000003/blk00000005/sig00000074 ),
    .Q(\blk00000003/blk00000005/sig00000075 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk00000025  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000073 ),
    .Q(\blk00000003/blk00000005/sig00000074 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000024  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .D(\blk00000003/blk00000005/sig00000072 ),
    .Q(\blk00000003/blk00000005/sig00000073 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk00000023  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000070 ),
    .Q(\blk00000003/blk00000005/sig00000071 )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000022  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .D(\blk00000003/blk00000005/sig0000006f ),
    .Q(\blk00000003/blk00000005/sig00000070 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk00000021  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000006e ),
    .Q(\blk00000003/blk00000005/sig0000006f )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000020  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .D(\blk00000003/blk00000005/sig0000006d ),
    .Q(\blk00000003/blk00000005/sig0000006e ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk0000001f  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000006c ),
    .Q(\blk00000003/blk00000005/sig0000006d )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000001e  (
    .CE(\blk00000003/blk00000005/sig0000006a ),
    .D(\blk00000003/blk00000005/sig00000063 ),
    .Q(\blk00000003/blk00000005/sig0000006c ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000055 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk0000001d  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000005a ),
    .Q(\blk00000003/blk00000005/sig0000006b )
  );
  FDE   \blk00000003/blk00000005/blk0000001c  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000005b ),
    .Q(\blk00000003/blk00000005/sig0000006a )
  );
  BUF   \blk00000003/blk00000005/blk0000001b  (
    .I(\blk00000003/blk00000005/sig00000066 ),
    .O(\blk00000003/blk00000005/sig00000062 )
  );
  FDE   \blk00000003/blk00000005/blk0000001a  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000069 ),
    .Q(\blk00000003/blk00000005/sig00000067 )
  );
  LUT4 #(
    .INIT ( 16'hcaca ))
  \blk00000003/blk00000005/blk00000019  (
    .I0(\blk00000003/blk00000005/sig00000067 ),
    .I1(din_0[2]),
    .I2(\blk00000003/blk00000005/sig00000059 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig00000069 )
  );
  FDE   \blk00000003/blk00000005/blk00000018  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000068 ),
    .Q(\blk00000003/blk00000005/sig00000064 )
  );
  LUT4 #(
    .INIT ( 16'hcaca ))
  \blk00000003/blk00000005/blk00000017  (
    .I0(\blk00000003/blk00000005/sig00000067 ),
    .I1(din_0[1]),
    .I2(\blk00000003/blk00000005/sig00000059 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig00000068 )
  );
  FDE   \blk00000003/blk00000005/blk00000016  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000065 ),
    .Q(\blk00000003/blk00000005/sig00000066 )
  );
  LUT4 #(
    .INIT ( 16'hcaca ))
  \blk00000003/blk00000005/blk00000015  (
    .I0(\blk00000003/blk00000005/sig00000064 ),
    .I1(din_0[0]),
    .I2(\blk00000003/blk00000005/sig00000059 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig00000065 )
  );
  FDE   \blk00000003/blk00000005/blk00000014  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000062 ),
    .Q(\blk00000003/blk00000005/sig00000063 )
  );
  FDE   \blk00000003/blk00000005/blk00000013  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000061 ),
    .Q(\blk00000003/blk00000005/sig0000005f )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk00000012  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .D(\blk00000003/blk00000005/sig0000005a ),
    .Q(\blk00000003/blk00000005/sig00000061 ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000056 ),
    .A1(\blk00000003/blk00000005/sig00000056 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDPE   \blk00000003/blk00000005/blk00000011  (
    .PRE(\blk00000003/blk00000005/sig00000056 ),
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000060 ),
    .Q(NlwRenamedSig_OI_rfd)
  );
  LUT4 #(
    .INIT ( 16'h5454 ))
  \blk00000003/blk00000005/blk00000010  (
    .I0(\blk00000003/blk00000005/sig00000059 ),
    .I1(\blk00000003/blk00000005/sig0000005f ),
    .I2(NlwRenamedSig_OI_rfd),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig00000060 )
  );
  FDE   \blk00000003/blk00000005/blk0000000f  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000005e ),
    .Q(\blk00000003/blk00000005/sig0000005c )
  );
  SRL16E #(
    .INIT ( 16'h0000 ))
  \blk00000003/blk00000005/blk0000000e  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .D(\blk00000003/blk00000005/sig0000005a ),
    .Q(\blk00000003/blk00000005/sig0000005e ),
    .CLK(clk),
    .A0(\blk00000003/blk00000005/sig00000055 ),
    .A1(\blk00000003/blk00000005/sig00000056 ),
    .A2(\blk00000003/blk00000005/sig00000056 ),
    .A3(\blk00000003/blk00000005/sig00000056 )
  );
  FDE   \blk00000003/blk00000005/blk0000000d  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig0000005d ),
    .Q(\blk00000003/blk00000005/sig0000005b )
  );
  LUT4 #(
    .INIT ( 16'haeae ))
  \blk00000003/blk00000005/blk0000000c  (
    .I0(\blk00000003/blk00000005/sig00000059 ),
    .I1(\blk00000003/blk00000005/sig0000005b ),
    .I2(\blk00000003/blk00000005/sig0000005c ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig0000005d )
  );
  FDE   \blk00000003/blk00000005/blk0000000b  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000059 ),
    .Q(\blk00000003/blk00000005/sig0000005a )
  );
  LUT4 #(
    .INIT ( 16'h0808 ))
  \blk00000003/blk00000005/blk0000000a  (
    .I0(nd),
    .I1(NlwRenamedSig_OI_rfd),
    .I2(\blk00000003/blk00000005/sig00000058 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig00000059 )
  );
  FDE   \blk00000003/blk00000005/blk00000009  (
    .CE(\blk00000003/blk00000005/sig00000055 ),
    .C(clk),
    .D(\blk00000003/blk00000005/sig00000057 ),
    .Q(\blk00000003/blk00000005/sig00000058 )
  );
  LUT4 #(
    .INIT ( 16'h8888 ))
  \blk00000003/blk00000005/blk00000008  (
    .I0(nd),
    .I1(NlwRenamedSig_OI_rfd),
    .I2(\blk00000003/blk00000005/sig00000056 ),
    .I3(\blk00000003/blk00000005/sig00000056 ),
    .O(\blk00000003/blk00000005/sig00000057 )
  );
  GND   \blk00000003/blk00000005/blk00000007  (
    .G(\blk00000003/blk00000005/sig00000056 )
  );
  VCC   \blk00000003/blk00000005/blk00000006  (
    .P(\blk00000003/blk00000005/sig00000055 )
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
