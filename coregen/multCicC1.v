////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.87xd
//  \   \         Application: netgen
//  /   /         Filename: multCicC1.v
// /___/   /\     Timestamp: Thu Apr 09 16:14:08 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/modem/telemetry/coregen/tmp/_cg/multCicC1.ngc C:/modem/telemetry/coregen/tmp/_cg/multCicC1.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/multCicC1.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/multCicC1.v
// # of Modules	: 1
// Design Name	: multCicC1
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

module multCicC1 (
p, a
)/* synthesis syn_black_box syn_noprune=1 */;
  output [32 : 0] p;
  input [17 : 0] a;
  
  // synthesis translate_off
  
  wire NlwRenamedSig_OI_N0;
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire sig0000003d;
  wire sig0000003e;
  wire sig0000003f;
  wire sig00000040;
  wire sig00000041;
  wire sig00000042;
  wire sig00000043;
  wire sig00000044;
  wire sig00000045;
  wire sig00000046;
  wire sig00000047;
  wire sig00000048;
  wire sig00000049;
  wire sig0000004a;
  wire sig0000004b;
  wire sig0000004c;
  wire sig0000004d;
  wire sig0000004e;
  wire sig0000004f;
  wire sig00000050;
  wire sig00000051;
  wire sig00000052;
  wire sig00000053;
  wire sig00000054;
  wire sig00000055;
  wire sig00000056;
  wire sig00000057;
  wire sig00000058;
  wire sig00000059;
  wire sig0000005a;
  wire sig0000005b;
  wire sig0000005c;
  wire sig0000005d;
  wire sig0000005e;
  wire sig0000005f;
  wire sig00000060;
  wire sig00000061;
  wire sig00000062;
  wire sig00000063;
  wire sig00000064;
  wire sig00000065;
  wire sig00000066;
  wire sig00000067;
  wire sig00000068;
  wire sig00000069;
  wire sig0000006a;
  wire sig0000006b;
  wire sig0000006c;
  wire sig0000006d;
  wire sig0000006e;
  wire sig0000006f;
  wire sig00000070;
  wire sig00000071;
  wire sig00000072;
  wire sig00000073;
  wire sig00000074;
  wire sig00000075;
  wire sig00000076;
  wire sig00000077;
  wire sig00000078;
  wire sig00000079;
  wire sig0000007a;
  wire sig0000007b;
  wire sig0000007c;
  wire sig0000007d;
  wire sig0000007e;
  wire sig0000007f;
  wire sig00000080;
  wire sig00000081;
  wire sig00000082;
  wire sig00000083;
  wire sig00000084;
  wire sig00000085;
  wire sig00000086;
  wire sig00000087;
  wire sig00000088;
  wire sig00000089;
  wire sig0000008a;
  wire sig0000008b;
  wire sig0000008c;
  wire sig0000008d;
  wire sig0000008e;
  wire sig0000008f;
  wire sig00000090;
  wire sig00000091;
  wire sig00000092;
  wire sig00000093;
  wire sig00000094;
  wire sig00000095;
  wire sig00000096;
  wire sig00000097;
  wire sig00000098;
  wire sig00000099;
  wire sig0000009a;
  wire sig0000009b;
  wire sig0000009c;
  wire sig0000009d;
  wire sig0000009e;
  wire sig0000009f;
  wire sig000000a0;
  wire sig000000a1;
  wire sig000000a2;
  wire sig000000a3;
  wire sig000000a4;
  wire sig000000a5;
  wire sig000000a6;
  wire sig000000a7;
  wire sig000000a8;
  wire sig000000a9;
  wire sig000000aa;
  wire sig000000ab;
  wire sig000000ac;
  wire sig000000ad;
  wire sig000000ae;
  wire sig000000af;
  wire sig000000b0;
  wire sig000000b1;
  wire sig000000b2;
  wire sig000000b3;
  wire sig000000b4;
  wire sig000000b5;
  wire sig000000b6;
  wire sig000000b7;
  wire sig000000b8;
  wire sig000000b9;
  wire sig000000ba;
  wire sig000000bb;
  wire sig000000bc;
  wire sig000000bd;
  wire sig000000be;
  wire sig000000bf;
  wire sig000000c0;
  wire sig000000c1;
  wire sig000000c2;
  wire sig000000c3;
  wire sig000000c4;
  wire sig000000c5;
  wire sig000000c6;
  wire sig000000c7;
  wire sig000000c8;
  wire sig000000c9;
  wire sig000000ca;
  wire sig000000cb;
  wire sig000000cc;
  wire sig000000cd;
  wire sig000000ce;
  wire sig000000cf;
  wire sig000000d0;
  wire sig000000d1;
  wire sig000000d2;
  wire sig000000d3;
  wire sig000000d4;
  wire sig000000d5;
  wire sig000000d6;
  wire sig000000d7;
  wire sig000000d8;
  wire sig000000d9;
  wire sig000000da;
  wire sig000000db;
  wire sig000000dc;
  wire sig000000dd;
  wire sig000000de;
  wire sig000000df;
  wire sig000000e0;
  wire sig000000e1;
  wire sig000000e2;
  wire sig000000e3;
  wire sig000000e4;
  wire sig000000e5;
  wire [0 : 0] NlwRenamedSignal_a;
  wire [31 : 31] NlwRenamedSignal_p;
  assign
    p[32] = NlwRenamedSignal_p[31],
    p[31] = NlwRenamedSignal_p[31],
    p[3] = NlwRenamedSignal_a[0],
    p[2] = NlwRenamedSig_OI_N0,
    p[1] = NlwRenamedSig_OI_N0,
    p[0] = NlwRenamedSig_OI_N0,
    NlwRenamedSignal_a[0] = a[0];
  GND   blk00000001 (
    .G(NlwRenamedSig_OI_N0)
  );
  XORCY   blk00000002 (
    .CI(sig000000cf),
    .LI(sig000000dc),
    .O(NlwRenamedSignal_p[31])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000003 (
    .I0(sig0000002b),
    .I1(sig000000cc),
    .O(sig000000dc)
  );
  XORCY   blk00000004 (
    .CI(sig000000ce),
    .LI(sig000000db),
    .O(p[30])
  );
  MUXCY   blk00000005 (
    .CI(sig000000ce),
    .DI(sig0000002a),
    .S(sig000000db),
    .O(sig000000cf)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000006 (
    .I0(sig0000002a),
    .I1(sig000000ca),
    .O(sig000000db)
  );
  XORCY   blk00000007 (
    .CI(sig000000d8),
    .LI(sig000000da),
    .O(p[29])
  );
  MUXCY   blk00000008 (
    .CI(sig000000d8),
    .DI(sig00000029),
    .S(sig000000da),
    .O(sig000000ce)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000009 (
    .I0(sig00000029),
    .I1(sig000000cb),
    .O(sig000000da)
  );
  XORCY   blk0000000a (
    .CI(sig000000d7),
    .LI(sig000000e5),
    .O(p[28])
  );
  MUXCY   blk0000000b (
    .CI(sig000000d7),
    .DI(sig00000028),
    .S(sig000000e5),
    .O(sig000000d8)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000000c (
    .I0(sig00000028),
    .I1(sig000000cc),
    .O(sig000000e5)
  );
  XORCY   blk0000000d (
    .CI(sig000000d6),
    .LI(sig000000e4),
    .O(p[27])
  );
  MUXCY   blk0000000e (
    .CI(sig000000d6),
    .DI(sig00000027),
    .S(sig000000e4),
    .O(sig000000d7)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000000f (
    .I0(sig00000027),
    .I1(sig000000cc),
    .O(sig000000e4)
  );
  XORCY   blk00000010 (
    .CI(sig000000d5),
    .LI(sig000000e3),
    .O(p[26])
  );
  MUXCY   blk00000011 (
    .CI(sig000000d5),
    .DI(sig00000026),
    .S(sig000000e3),
    .O(sig000000d6)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000012 (
    .I0(sig00000026),
    .I1(sig000000ca),
    .O(sig000000e3)
  );
  XORCY   blk00000013 (
    .CI(sig000000d4),
    .LI(sig000000e2),
    .O(p[25])
  );
  MUXCY   blk00000014 (
    .CI(sig000000d4),
    .DI(sig00000025),
    .S(sig000000e2),
    .O(sig000000d5)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000015 (
    .I0(sig00000025),
    .I1(sig000000cb),
    .O(sig000000e2)
  );
  XORCY   blk00000016 (
    .CI(sig000000d3),
    .LI(sig000000e1),
    .O(p[24])
  );
  MUXCY   blk00000017 (
    .CI(sig000000d3),
    .DI(sig00000024),
    .S(sig000000e1),
    .O(sig000000d4)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000018 (
    .I0(sig00000024),
    .I1(sig000000cc),
    .O(sig000000e1)
  );
  XORCY   blk00000019 (
    .CI(sig000000d2),
    .LI(sig000000e0),
    .O(p[23])
  );
  MUXCY   blk0000001a (
    .CI(sig000000d2),
    .DI(sig00000023),
    .S(sig000000e0),
    .O(sig000000d3)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000001b (
    .I0(sig00000023),
    .I1(sig000000ca),
    .O(sig000000e0)
  );
  XORCY   blk0000001c (
    .CI(sig000000d1),
    .LI(sig000000df),
    .O(p[22])
  );
  MUXCY   blk0000001d (
    .CI(sig000000d1),
    .DI(sig00000022),
    .S(sig000000df),
    .O(sig000000d2)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000001e (
    .I0(sig00000022),
    .I1(a[17]),
    .O(sig000000df)
  );
  XORCY   blk0000001f (
    .CI(sig000000d0),
    .LI(sig000000de),
    .O(p[21])
  );
  MUXCY   blk00000020 (
    .CI(sig000000d0),
    .DI(sig00000021),
    .S(sig000000de),
    .O(sig000000d1)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000021 (
    .I0(sig00000021),
    .I1(sig000000cb),
    .O(sig000000de)
  );
  XORCY   blk00000022 (
    .CI(sig000000cd),
    .LI(sig000000dd),
    .O(p[20])
  );
  MUXCY   blk00000023 (
    .CI(sig000000cd),
    .DI(sig00000020),
    .S(sig000000dd),
    .O(sig000000d0)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000024 (
    .I0(sig00000020),
    .I1(sig000000ca),
    .O(sig000000dd)
  );
  XORCY   blk00000025 (
    .CI(NlwRenamedSig_OI_N0),
    .LI(sig000000d9),
    .O(p[19])
  );
  MUXCY   blk00000026 (
    .CI(NlwRenamedSig_OI_N0),
    .DI(sig0000001f),
    .S(sig000000d9),
    .O(sig000000cd)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000027 (
    .I0(sig0000001f),
    .I1(a[16]),
    .O(sig000000d9)
  );
  XORCY   blk00000028 (
    .CI(sig0000009e),
    .LI(sig000000b4),
    .O(sig0000002b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000029 (
    .I0(sig0000000b),
    .I1(sig00000018),
    .O(sig000000b4)
  );
  XORCY   blk0000002a (
    .CI(sig0000009d),
    .LI(sig000000b2),
    .O(sig0000002a)
  );
  MUXCY   blk0000002b (
    .CI(sig0000009d),
    .DI(sig0000000b),
    .S(sig000000b2),
    .O(sig0000009e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000002c (
    .I0(sig0000000b),
    .I1(sig00000017),
    .O(sig000000b2)
  );
  XORCY   blk0000002d (
    .CI(sig0000009c),
    .LI(sig000000b1),
    .O(sig00000029)
  );
  MUXCY   blk0000002e (
    .CI(sig0000009c),
    .DI(sig0000000b),
    .S(sig000000b1),
    .O(sig0000009d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000002f (
    .I0(sig0000000b),
    .I1(sig00000016),
    .O(sig000000b1)
  );
  XORCY   blk00000030 (
    .CI(sig0000009b),
    .LI(sig000000b0),
    .O(sig00000028)
  );
  MUXCY   blk00000031 (
    .CI(sig0000009b),
    .DI(sig0000000b),
    .S(sig000000b0),
    .O(sig0000009c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000032 (
    .I0(sig0000000b),
    .I1(sig00000015),
    .O(sig000000b0)
  );
  XORCY   blk00000033 (
    .CI(sig0000009a),
    .LI(sig000000af),
    .O(sig00000027)
  );
  MUXCY   blk00000034 (
    .CI(sig0000009a),
    .DI(sig0000000b),
    .S(sig000000af),
    .O(sig0000009b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000035 (
    .I0(sig0000000b),
    .I1(sig00000014),
    .O(sig000000af)
  );
  XORCY   blk00000036 (
    .CI(sig00000099),
    .LI(sig000000ae),
    .O(sig00000026)
  );
  MUXCY   blk00000037 (
    .CI(sig00000099),
    .DI(sig0000000b),
    .S(sig000000ae),
    .O(sig0000009a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000038 (
    .I0(sig0000000b),
    .I1(sig00000013),
    .O(sig000000ae)
  );
  XORCY   blk00000039 (
    .CI(sig00000098),
    .LI(sig000000ad),
    .O(sig00000025)
  );
  MUXCY   blk0000003a (
    .CI(sig00000098),
    .DI(sig0000000b),
    .S(sig000000ad),
    .O(sig00000099)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000003b (
    .I0(sig0000000b),
    .I1(sig00000012),
    .O(sig000000ad)
  );
  XORCY   blk0000003c (
    .CI(sig00000097),
    .LI(sig000000ac),
    .O(sig00000024)
  );
  MUXCY   blk0000003d (
    .CI(sig00000097),
    .DI(sig0000000b),
    .S(sig000000ac),
    .O(sig00000098)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000003e (
    .I0(sig0000000b),
    .I1(sig00000011),
    .O(sig000000ac)
  );
  XORCY   blk0000003f (
    .CI(sig00000096),
    .LI(sig000000ab),
    .O(sig00000023)
  );
  MUXCY   blk00000040 (
    .CI(sig00000096),
    .DI(sig0000000b),
    .S(sig000000ab),
    .O(sig00000097)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000041 (
    .I0(sig0000000b),
    .I1(sig00000010),
    .O(sig000000ab)
  );
  XORCY   blk00000042 (
    .CI(sig00000095),
    .LI(sig000000aa),
    .O(sig00000022)
  );
  MUXCY   blk00000043 (
    .CI(sig00000095),
    .DI(sig0000000a),
    .S(sig000000aa),
    .O(sig00000096)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000044 (
    .I0(sig0000000a),
    .I1(sig0000000f),
    .O(sig000000aa)
  );
  XORCY   blk00000045 (
    .CI(sig000000a7),
    .LI(sig000000a9),
    .O(sig00000021)
  );
  MUXCY   blk00000046 (
    .CI(sig000000a7),
    .DI(sig00000009),
    .S(sig000000a9),
    .O(sig00000095)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000047 (
    .I0(sig00000009),
    .I1(sig0000000e),
    .O(sig000000a9)
  );
  XORCY   blk00000048 (
    .CI(sig000000a6),
    .LI(sig000000bc),
    .O(sig00000020)
  );
  MUXCY   blk00000049 (
    .CI(sig000000a6),
    .DI(sig00000008),
    .S(sig000000bc),
    .O(sig000000a7)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000004a (
    .I0(sig00000008),
    .I1(sig0000001e),
    .O(sig000000bc)
  );
  XORCY   blk0000004b (
    .CI(sig000000a5),
    .LI(sig000000bb),
    .O(sig0000001f)
  );
  MUXCY   blk0000004c (
    .CI(sig000000a5),
    .DI(sig00000007),
    .S(sig000000bb),
    .O(sig000000a6)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000004d (
    .I0(sig00000007),
    .I1(sig0000001d),
    .O(sig000000bb)
  );
  XORCY   blk0000004e (
    .CI(sig000000a4),
    .LI(sig000000ba),
    .O(p[18])
  );
  MUXCY   blk0000004f (
    .CI(sig000000a4),
    .DI(sig00000006),
    .S(sig000000ba),
    .O(sig000000a5)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000050 (
    .I0(sig00000006),
    .I1(sig0000001c),
    .O(sig000000ba)
  );
  XORCY   blk00000051 (
    .CI(sig000000a3),
    .LI(sig000000b9),
    .O(p[17])
  );
  MUXCY   blk00000052 (
    .CI(sig000000a3),
    .DI(sig00000005),
    .S(sig000000b9),
    .O(sig000000a4)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000053 (
    .I0(sig00000005),
    .I1(sig0000001b),
    .O(sig000000b9)
  );
  XORCY   blk00000054 (
    .CI(sig000000a2),
    .LI(sig000000b8),
    .O(p[16])
  );
  MUXCY   blk00000055 (
    .CI(sig000000a2),
    .DI(sig00000004),
    .S(sig000000b8),
    .O(sig000000a3)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000056 (
    .I0(sig00000004),
    .I1(sig0000001a),
    .O(sig000000b8)
  );
  XORCY   blk00000057 (
    .CI(sig000000a1),
    .LI(sig000000b7),
    .O(p[15])
  );
  MUXCY   blk00000058 (
    .CI(sig000000a1),
    .DI(sig00000003),
    .S(sig000000b7),
    .O(sig000000a2)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000059 (
    .I0(sig00000003),
    .I1(sig00000019),
    .O(sig000000b7)
  );
  XORCY   blk0000005a (
    .CI(sig000000a0),
    .LI(sig000000b6),
    .O(p[14])
  );
  MUXCY   blk0000005b (
    .CI(sig000000a0),
    .DI(sig00000002),
    .S(sig000000b6),
    .O(sig000000a1)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000005c (
    .I0(sig00000002),
    .I1(sig0000006b),
    .O(sig000000b6)
  );
  XORCY   blk0000005d (
    .CI(sig0000009f),
    .LI(sig000000b5),
    .O(p[13])
  );
  MUXCY   blk0000005e (
    .CI(sig0000009f),
    .DI(sig00000001),
    .S(sig000000b5),
    .O(sig000000a0)
  );
  XORCY   blk0000005f (
    .CI(sig00000094),
    .LI(sig000000b3),
    .O(p[12])
  );
  MUXCY   blk00000060 (
    .CI(sig00000094),
    .DI(sig0000000d),
    .S(sig000000b3),
    .O(sig0000009f)
  );
  XORCY   blk00000061 (
    .CI(NlwRenamedSig_OI_N0),
    .LI(sig000000a8),
    .O(p[11])
  );
  MUXCY   blk00000062 (
    .CI(NlwRenamedSig_OI_N0),
    .DI(sig0000000c),
    .S(sig000000a8),
    .O(sig00000094)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000063 (
    .I0(sig0000000c),
    .I1(a[8]),
    .O(sig000000a8)
  );
  XORCY   blk00000064 (
    .CI(sig0000003e),
    .LI(sig0000004f),
    .O(sig0000000b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000065 (
    .I0(sig00000030),
    .I1(sig0000005d),
    .O(sig0000004f)
  );
  XORCY   blk00000066 (
    .CI(sig0000003d),
    .LI(sig0000004e),
    .O(sig0000000a)
  );
  MUXCY   blk00000067 (
    .CI(sig0000003d),
    .DI(sig00000030),
    .S(sig0000004e),
    .O(sig0000003e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000068 (
    .I0(sig00000030),
    .I1(sig0000005d),
    .O(sig0000004e)
  );
  XORCY   blk00000069 (
    .CI(sig0000003c),
    .LI(sig0000004d),
    .O(sig00000009)
  );
  MUXCY   blk0000006a (
    .CI(sig0000003c),
    .DI(sig00000030),
    .S(sig0000004d),
    .O(sig0000003d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000006b (
    .I0(sig00000030),
    .I1(sig0000005c),
    .O(sig0000004d)
  );
  XORCY   blk0000006c (
    .CI(sig0000003b),
    .LI(sig0000004c),
    .O(sig00000008)
  );
  MUXCY   blk0000006d (
    .CI(sig0000003b),
    .DI(sig00000030),
    .S(sig0000004c),
    .O(sig0000003c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000006e (
    .I0(sig00000030),
    .I1(sig0000005b),
    .O(sig0000004c)
  );
  XORCY   blk0000006f (
    .CI(sig0000003a),
    .LI(sig0000004b),
    .O(sig00000007)
  );
  MUXCY   blk00000070 (
    .CI(sig0000003a),
    .DI(sig00000030),
    .S(sig0000004b),
    .O(sig0000003b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000071 (
    .I0(sig00000030),
    .I1(sig0000005a),
    .O(sig0000004b)
  );
  XORCY   blk00000072 (
    .CI(sig00000039),
    .LI(sig0000004a),
    .O(sig00000006)
  );
  MUXCY   blk00000073 (
    .CI(sig00000039),
    .DI(sig00000030),
    .S(sig0000004a),
    .O(sig0000003a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000074 (
    .I0(sig00000030),
    .I1(sig00000059),
    .O(sig0000004a)
  );
  XORCY   blk00000075 (
    .CI(sig00000047),
    .LI(sig00000049),
    .O(sig00000005)
  );
  MUXCY   blk00000076 (
    .CI(sig00000047),
    .DI(sig0000002f),
    .S(sig00000049),
    .O(sig00000039)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000077 (
    .I0(sig0000002f),
    .I1(sig00000065),
    .O(sig00000049)
  );
  XORCY   blk00000078 (
    .CI(sig00000046),
    .LI(sig00000058),
    .O(sig00000004)
  );
  MUXCY   blk00000079 (
    .CI(sig00000046),
    .DI(sig0000002e),
    .S(sig00000058),
    .O(sig00000047)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000007a (
    .I0(sig0000002e),
    .I1(sig00000064),
    .O(sig00000058)
  );
  XORCY   blk0000007b (
    .CI(sig00000045),
    .LI(sig00000057),
    .O(sig00000003)
  );
  MUXCY   blk0000007c (
    .CI(sig00000045),
    .DI(sig0000002d),
    .S(sig00000057),
    .O(sig00000046)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000007d (
    .I0(sig0000002d),
    .I1(sig00000063),
    .O(sig00000057)
  );
  XORCY   blk0000007e (
    .CI(sig00000044),
    .LI(sig00000056),
    .O(sig00000002)
  );
  MUXCY   blk0000007f (
    .CI(sig00000044),
    .DI(sig0000002c),
    .S(sig00000056),
    .O(sig00000045)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000080 (
    .I0(sig0000002c),
    .I1(sig00000062),
    .O(sig00000056)
  );
  XORCY   blk00000081 (
    .CI(sig00000043),
    .LI(sig00000055),
    .O(sig00000001)
  );
  MUXCY   blk00000082 (
    .CI(sig00000043),
    .DI(sig00000037),
    .S(sig00000055),
    .O(sig00000044)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000083 (
    .I0(sig00000037),
    .I1(sig00000061),
    .O(sig00000055)
  );
  XORCY   blk00000084 (
    .CI(sig00000042),
    .LI(sig00000054),
    .O(sig0000000d)
  );
  MUXCY   blk00000085 (
    .CI(sig00000042),
    .DI(sig00000036),
    .S(sig00000054),
    .O(sig00000043)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000086 (
    .I0(sig00000036),
    .I1(sig00000060),
    .O(sig00000054)
  );
  XORCY   blk00000087 (
    .CI(sig00000041),
    .LI(sig00000053),
    .O(sig0000000c)
  );
  MUXCY   blk00000088 (
    .CI(sig00000041),
    .DI(sig00000035),
    .S(sig00000053),
    .O(sig00000042)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000089 (
    .I0(sig00000035),
    .I1(sig0000005f),
    .O(sig00000053)
  );
  XORCY   blk0000008a (
    .CI(sig00000040),
    .LI(sig00000052),
    .O(p[10])
  );
  MUXCY   blk0000008b (
    .CI(sig00000040),
    .DI(sig00000034),
    .S(sig00000052),
    .O(sig00000041)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000008c (
    .I0(sig00000034),
    .I1(sig0000005e),
    .O(sig00000052)
  );
  XORCY   blk0000008d (
    .CI(sig0000003f),
    .LI(sig00000051),
    .O(p[9])
  );
  MUXCY   blk0000008e (
    .CI(sig0000003f),
    .DI(sig00000033),
    .S(sig00000051),
    .O(sig00000040)
  );
  XORCY   blk0000008f (
    .CI(sig00000038),
    .LI(sig00000050),
    .O(p[8])
  );
  MUXCY   blk00000090 (
    .CI(sig00000038),
    .DI(sig00000032),
    .S(sig00000050),
    .O(sig0000003f)
  );
  XORCY   blk00000091 (
    .CI(NlwRenamedSig_OI_N0),
    .LI(sig00000048),
    .O(p[7])
  );
  MUXCY   blk00000092 (
    .CI(NlwRenamedSig_OI_N0),
    .DI(a[4]),
    .S(sig00000048),
    .O(sig00000038)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000093 (
    .I0(sig00000031),
    .I1(a[4]),
    .O(sig00000048)
  );
  XORCY   blk00000094 (
    .CI(sig00000079),
    .LI(sig0000008a),
    .O(sig00000018)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000095 (
    .I0(sig0000006a),
    .I1(sig000000c1),
    .O(sig0000008a)
  );
  XORCY   blk00000096 (
    .CI(sig00000078),
    .LI(sig00000089),
    .O(sig00000017)
  );
  MUXCY   blk00000097 (
    .CI(sig00000078),
    .DI(sig0000006a),
    .S(sig00000089),
    .O(sig00000079)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000098 (
    .I0(sig0000006a),
    .I1(sig000000c1),
    .O(sig00000089)
  );
  XORCY   blk00000099 (
    .CI(sig00000077),
    .LI(sig00000088),
    .O(sig00000016)
  );
  MUXCY   blk0000009a (
    .CI(sig00000077),
    .DI(sig0000006a),
    .S(sig00000088),
    .O(sig00000078)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000009b (
    .I0(sig0000006a),
    .I1(sig000000c0),
    .O(sig00000088)
  );
  XORCY   blk0000009c (
    .CI(sig00000076),
    .LI(sig00000087),
    .O(sig00000015)
  );
  MUXCY   blk0000009d (
    .CI(sig00000076),
    .DI(sig0000006a),
    .S(sig00000087),
    .O(sig00000077)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000009e (
    .I0(sig0000006a),
    .I1(sig000000bf),
    .O(sig00000087)
  );
  XORCY   blk0000009f (
    .CI(sig00000075),
    .LI(sig00000086),
    .O(sig00000014)
  );
  MUXCY   blk000000a0 (
    .CI(sig00000075),
    .DI(sig0000006a),
    .S(sig00000086),
    .O(sig00000076)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000a1 (
    .I0(sig0000006a),
    .I1(sig000000be),
    .O(sig00000086)
  );
  XORCY   blk000000a2 (
    .CI(sig00000074),
    .LI(sig00000085),
    .O(sig00000013)
  );
  MUXCY   blk000000a3 (
    .CI(sig00000074),
    .DI(sig0000006a),
    .S(sig00000085),
    .O(sig00000075)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000a4 (
    .I0(sig0000006a),
    .I1(sig000000bd),
    .O(sig00000085)
  );
  XORCY   blk000000a5 (
    .CI(sig00000082),
    .LI(sig00000084),
    .O(sig00000012)
  );
  MUXCY   blk000000a6 (
    .CI(sig00000082),
    .DI(sig00000069),
    .S(sig00000084),
    .O(sig00000074)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000a7 (
    .I0(sig00000069),
    .I1(sig000000c9),
    .O(sig00000084)
  );
  XORCY   blk000000a8 (
    .CI(sig00000081),
    .LI(sig00000093),
    .O(sig00000011)
  );
  MUXCY   blk000000a9 (
    .CI(sig00000081),
    .DI(sig00000068),
    .S(sig00000093),
    .O(sig00000082)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000aa (
    .I0(sig00000068),
    .I1(sig000000c8),
    .O(sig00000093)
  );
  XORCY   blk000000ab (
    .CI(sig00000080),
    .LI(sig00000092),
    .O(sig00000010)
  );
  MUXCY   blk000000ac (
    .CI(sig00000080),
    .DI(sig00000067),
    .S(sig00000092),
    .O(sig00000081)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ad (
    .I0(sig00000067),
    .I1(sig000000c7),
    .O(sig00000092)
  );
  XORCY   blk000000ae (
    .CI(sig0000007f),
    .LI(sig00000091),
    .O(sig0000000f)
  );
  MUXCY   blk000000af (
    .CI(sig0000007f),
    .DI(sig00000066),
    .S(sig00000091),
    .O(sig00000080)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b0 (
    .I0(sig00000066),
    .I1(sig000000c6),
    .O(sig00000091)
  );
  XORCY   blk000000b1 (
    .CI(sig0000007e),
    .LI(sig00000090),
    .O(sig0000000e)
  );
  MUXCY   blk000000b2 (
    .CI(sig0000007e),
    .DI(sig00000072),
    .S(sig00000090),
    .O(sig0000007f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b3 (
    .I0(sig00000072),
    .I1(sig000000c5),
    .O(sig00000090)
  );
  XORCY   blk000000b4 (
    .CI(sig0000007d),
    .LI(sig0000008f),
    .O(sig0000001e)
  );
  MUXCY   blk000000b5 (
    .CI(sig0000007d),
    .DI(sig00000071),
    .S(sig0000008f),
    .O(sig0000007e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b6 (
    .I0(sig00000071),
    .I1(sig000000c4),
    .O(sig0000008f)
  );
  XORCY   blk000000b7 (
    .CI(sig0000007c),
    .LI(sig0000008e),
    .O(sig0000001d)
  );
  MUXCY   blk000000b8 (
    .CI(sig0000007c),
    .DI(sig00000070),
    .S(sig0000008e),
    .O(sig0000007d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b9 (
    .I0(sig00000070),
    .I1(sig000000c3),
    .O(sig0000008e)
  );
  XORCY   blk000000ba (
    .CI(sig0000007b),
    .LI(sig0000008d),
    .O(sig0000001c)
  );
  MUXCY   blk000000bb (
    .CI(sig0000007b),
    .DI(sig0000006f),
    .S(sig0000008d),
    .O(sig0000007c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000bc (
    .I0(sig0000006f),
    .I1(sig000000c2),
    .O(sig0000008d)
  );
  XORCY   blk000000bd (
    .CI(sig0000007a),
    .LI(sig0000008c),
    .O(sig0000001b)
  );
  MUXCY   blk000000be (
    .CI(sig0000007a),
    .DI(sig0000006e),
    .S(sig0000008c),
    .O(sig0000007b)
  );
  XORCY   blk000000bf (
    .CI(sig00000073),
    .LI(sig0000008b),
    .O(sig0000001a)
  );
  MUXCY   blk000000c0 (
    .CI(sig00000073),
    .DI(sig0000006d),
    .S(sig0000008b),
    .O(sig0000007a)
  );
  XORCY   blk000000c1 (
    .CI(NlwRenamedSig_OI_N0),
    .LI(sig00000083),
    .O(sig00000019)
  );
  MUXCY   blk000000c2 (
    .CI(NlwRenamedSig_OI_N0),
    .DI(a[12]),
    .S(sig00000083),
    .O(sig00000073)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c3 (
    .I0(sig0000006c),
    .I1(a[12]),
    .O(sig00000083)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c4 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(a[1]),
    .O(p[4])
  );
  LUT3 #(
    .INIT ( 8'h9A ))
  blk000000c5 (
    .I0(a[2]),
    .I1(NlwRenamedSignal_a[0]),
    .I2(a[1]),
    .O(p[5])
  );
  LUT4 #(
    .INIT ( 16'h9A66 ))
  blk000000c6 (
    .I0(a[3]),
    .I1(a[2]),
    .I2(NlwRenamedSignal_a[0]),
    .I3(a[1]),
    .O(p[6])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  blk000000c7 (
    .I0(a[16]),
    .I1(a[17]),
    .O(sig000000cc)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk000000c8 (
    .I0(a[16]),
    .I1(a[17]),
    .O(sig000000cb)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c9 (
    .I0(a[16]),
    .I1(a[17]),
    .O(sig000000ca)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  blk000000ca (
    .I0(a[14]),
    .I1(a[12]),
    .I2(a[13]),
    .I3(a[15]),
    .O(sig000000c1)
  );
  LUT4 #(
    .INIT ( 16'h9A66 ))
  blk000000cb (
    .I0(a[11]),
    .I1(a[10]),
    .I2(a[8]),
    .I3(a[9]),
    .O(sig0000006b)
  );
  LUT4 #(
    .INIT ( 16'h7FFE ))
  blk000000cc (
    .I0(a[15]),
    .I1(a[14]),
    .I2(a[13]),
    .I3(a[12]),
    .O(sig000000c0)
  );
  LUT4 #(
    .INIT ( 16'hB332 ))
  blk000000cd (
    .I0(a[13]),
    .I1(a[15]),
    .I2(a[12]),
    .I3(a[14]),
    .O(sig000000bf)
  );
  LUT4 #(
    .INIT ( 16'hB332 ))
  blk000000ce (
    .I0(a[13]),
    .I1(a[14]),
    .I2(a[12]),
    .I3(a[15]),
    .O(sig000000be)
  );
  LUT4 #(
    .INIT ( 16'hB332 ))
  blk000000cf (
    .I0(a[14]),
    .I1(a[13]),
    .I2(a[12]),
    .I3(a[15]),
    .O(sig000000bd)
  );
  LUT4 #(
    .INIT ( 16'h9332 ))
  blk000000d0 (
    .I0(a[13]),
    .I1(a[12]),
    .I2(a[15]),
    .I3(a[14]),
    .O(sig000000c9)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  blk000000d1 (
    .I0(a[11]),
    .I1(a[10]),
    .I2(a[9]),
    .I3(a[8]),
    .O(sig0000006a)
  );
  LUT4 #(
    .INIT ( 16'h9D54 ))
  blk000000d2 (
    .I0(a[15]),
    .I1(a[13]),
    .I2(a[12]),
    .I3(a[14]),
    .O(sig000000c8)
  );
  LUT4 #(
    .INIT ( 16'h7FFE ))
  blk000000d3 (
    .I0(a[11]),
    .I1(a[9]),
    .I2(a[8]),
    .I3(a[10]),
    .O(sig00000069)
  );
  LUT4 #(
    .INIT ( 16'h9B92 ))
  blk000000d4 (
    .I0(a[13]),
    .I1(a[14]),
    .I2(a[15]),
    .I3(a[12]),
    .O(sig000000c7)
  );
  LUT4 #(
    .INIT ( 16'hB332 ))
  blk000000d5 (
    .I0(a[8]),
    .I1(a[11]),
    .I2(a[10]),
    .I3(a[9]),
    .O(sig00000068)
  );
  LUT4 #(
    .INIT ( 16'h6C16 ))
  blk000000d6 (
    .I0(a[12]),
    .I1(a[15]),
    .I2(a[14]),
    .I3(a[13]),
    .O(sig000000c6)
  );
  LUT4 #(
    .INIT ( 16'hB332 ))
  blk000000d7 (
    .I0(a[8]),
    .I1(a[10]),
    .I2(a[11]),
    .I3(a[9]),
    .O(sig00000067)
  );
  LUT4 #(
    .INIT ( 16'hAD6A ))
  blk000000d8 (
    .I0(a[14]),
    .I1(a[15]),
    .I2(a[12]),
    .I3(a[13]),
    .O(sig000000c5)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  blk000000d9 (
    .I0(a[6]),
    .I1(a[4]),
    .I2(a[5]),
    .I3(a[7]),
    .O(sig0000005d)
  );
  LUT4 #(
    .INIT ( 16'hB332 ))
  blk000000da (
    .I0(a[11]),
    .I1(a[9]),
    .I2(a[10]),
    .I3(a[8]),
    .O(sig00000066)
  );
  LUT4 #(
    .INIT ( 16'hAD6A ))
  blk000000db (
    .I0(a[13]),
    .I1(a[14]),
    .I2(a[15]),
    .I3(a[12]),
    .O(sig000000c4)
  );
  LUT4 #(
    .INIT ( 16'h7FFE ))
  blk000000dc (
    .I0(a[7]),
    .I1(a[6]),
    .I2(a[5]),
    .I3(a[4]),
    .O(sig0000005c)
  );
  LUT4 #(
    .INIT ( 16'h9332 ))
  blk000000dd (
    .I0(a[10]),
    .I1(a[8]),
    .I2(a[9]),
    .I3(a[11]),
    .O(sig00000072)
  );
  LUT4 #(
    .INIT ( 16'hAD6A ))
  blk000000de (
    .I0(a[12]),
    .I1(a[13]),
    .I2(a[14]),
    .I3(a[15]),
    .O(sig000000c3)
  );
  LUT4 #(
    .INIT ( 16'hB332 ))
  blk000000df (
    .I0(a[5]),
    .I1(a[7]),
    .I2(a[4]),
    .I3(a[6]),
    .O(sig0000005b)
  );
  LUT4 #(
    .INIT ( 16'h9D54 ))
  blk000000e0 (
    .I0(a[11]),
    .I1(a[10]),
    .I2(a[8]),
    .I3(a[9]),
    .O(sig00000071)
  );
  LUT4 #(
    .INIT ( 16'h9A66 ))
  blk000000e1 (
    .I0(a[15]),
    .I1(a[14]),
    .I2(a[12]),
    .I3(a[13]),
    .O(sig000000c2)
  );
  LUT4 #(
    .INIT ( 16'hB332 ))
  blk000000e2 (
    .I0(a[5]),
    .I1(a[6]),
    .I2(a[7]),
    .I3(a[4]),
    .O(sig0000005a)
  );
  LUT4 #(
    .INIT ( 16'h9B92 ))
  blk000000e3 (
    .I0(a[9]),
    .I1(a[10]),
    .I2(a[11]),
    .I3(a[8]),
    .O(sig00000070)
  );
  LUT4 #(
    .INIT ( 16'hB332 ))
  blk000000e4 (
    .I0(a[6]),
    .I1(a[5]),
    .I2(a[7]),
    .I3(a[4]),
    .O(sig00000059)
  );
  LUT4 #(
    .INIT ( 16'h6C16 ))
  blk000000e5 (
    .I0(a[10]),
    .I1(a[11]),
    .I2(a[8]),
    .I3(a[9]),
    .O(sig0000006f)
  );
  LUT4 #(
    .INIT ( 16'h9332 ))
  blk000000e6 (
    .I0(a[5]),
    .I1(a[4]),
    .I2(a[6]),
    .I3(a[7]),
    .O(sig00000065)
  );
  LUT4 #(
    .INIT ( 16'hAD6A ))
  blk000000e7 (
    .I0(a[10]),
    .I1(a[11]),
    .I2(a[8]),
    .I3(a[9]),
    .O(sig0000006e)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  blk000000e8 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(a[2]),
    .I2(a[3]),
    .I3(a[1]),
    .O(sig00000030)
  );
  LUT4 #(
    .INIT ( 16'h9D54 ))
  blk000000e9 (
    .I0(a[7]),
    .I1(a[5]),
    .I2(a[4]),
    .I3(a[6]),
    .O(sig00000064)
  );
  LUT4 #(
    .INIT ( 16'hAD6A ))
  blk000000ea (
    .I0(a[9]),
    .I1(a[10]),
    .I2(a[11]),
    .I3(a[8]),
    .O(sig0000006d)
  );
  LUT4 #(
    .INIT ( 16'h7FFE ))
  blk000000eb (
    .I0(a[3]),
    .I1(NlwRenamedSignal_a[0]),
    .I2(a[1]),
    .I3(a[2]),
    .O(sig0000002f)
  );
  LUT4 #(
    .INIT ( 16'h9B92 ))
  blk000000ec (
    .I0(a[5]),
    .I1(a[6]),
    .I2(a[7]),
    .I3(a[4]),
    .O(sig00000063)
  );
  LUT4 #(
    .INIT ( 16'hAD6A ))
  blk000000ed (
    .I0(a[8]),
    .I1(a[9]),
    .I2(a[10]),
    .I3(a[11]),
    .O(sig0000006c)
  );
  LUT4 #(
    .INIT ( 16'hB332 ))
  blk000000ee (
    .I0(a[1]),
    .I1(a[3]),
    .I2(a[2]),
    .I3(NlwRenamedSignal_a[0]),
    .O(sig0000002e)
  );
  LUT4 #(
    .INIT ( 16'h6C16 ))
  blk000000ef (
    .I0(a[4]),
    .I1(a[7]),
    .I2(a[6]),
    .I3(a[5]),
    .O(sig00000062)
  );
  LUT4 #(
    .INIT ( 16'hB332 ))
  blk000000f0 (
    .I0(a[1]),
    .I1(a[2]),
    .I2(a[3]),
    .I3(NlwRenamedSignal_a[0]),
    .O(sig0000002d)
  );
  LUT4 #(
    .INIT ( 16'hAD6A ))
  blk000000f1 (
    .I0(a[6]),
    .I1(a[7]),
    .I2(a[4]),
    .I3(a[5]),
    .O(sig00000061)
  );
  LUT4 #(
    .INIT ( 16'hB332 ))
  blk000000f2 (
    .I0(a[2]),
    .I1(a[1]),
    .I2(a[3]),
    .I3(NlwRenamedSignal_a[0]),
    .O(sig0000002c)
  );
  LUT4 #(
    .INIT ( 16'hAD6A ))
  blk000000f3 (
    .I0(a[5]),
    .I1(a[6]),
    .I2(a[7]),
    .I3(a[4]),
    .O(sig00000060)
  );
  LUT4 #(
    .INIT ( 16'h9332 ))
  blk000000f4 (
    .I0(a[1]),
    .I1(NlwRenamedSignal_a[0]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig00000037)
  );
  LUT4 #(
    .INIT ( 16'hAD6A ))
  blk000000f5 (
    .I0(a[4]),
    .I1(a[5]),
    .I2(a[6]),
    .I3(a[7]),
    .O(sig0000005f)
  );
  LUT4 #(
    .INIT ( 16'h9D54 ))
  blk000000f6 (
    .I0(a[3]),
    .I1(a[1]),
    .I2(NlwRenamedSignal_a[0]),
    .I3(a[2]),
    .O(sig00000036)
  );
  LUT4 #(
    .INIT ( 16'h9A66 ))
  blk000000f7 (
    .I0(a[7]),
    .I1(a[6]),
    .I2(a[4]),
    .I3(a[5]),
    .O(sig0000005e)
  );
  LUT4 #(
    .INIT ( 16'h9B92 ))
  blk000000f8 (
    .I0(a[1]),
    .I1(a[2]),
    .I2(a[3]),
    .I3(NlwRenamedSignal_a[0]),
    .O(sig00000035)
  );
  LUT4 #(
    .INIT ( 16'h6C16 ))
  blk000000f9 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(a[3]),
    .I2(a[2]),
    .I3(a[1]),
    .O(sig00000034)
  );
  LUT4 #(
    .INIT ( 16'hAD6A ))
  blk000000fa (
    .I0(a[2]),
    .I1(a[3]),
    .I2(NlwRenamedSignal_a[0]),
    .I3(a[1]),
    .O(sig00000033)
  );
  LUT4 #(
    .INIT ( 16'hAD6A ))
  blk000000fb (
    .I0(a[1]),
    .I1(a[2]),
    .I2(a[3]),
    .I3(NlwRenamedSignal_a[0]),
    .O(sig00000032)
  );
  LUT4 #(
    .INIT ( 16'hAD6A ))
  blk000000fc (
    .I0(NlwRenamedSignal_a[0]),
    .I1(a[1]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig00000031)
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  blk000000fd (
    .I0(sig00000001),
    .I1(a[10]),
    .I2(a[9]),
    .I3(a[8]),
    .O(sig000000b5)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk000000fe (
    .I0(sig0000000d),
    .I1(a[8]),
    .I2(a[9]),
    .O(sig000000b3)
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  blk000000ff (
    .I0(sig00000033),
    .I1(a[6]),
    .I2(a[5]),
    .I3(a[4]),
    .O(sig00000051)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000100 (
    .I0(sig00000032),
    .I1(a[4]),
    .I2(a[5]),
    .O(sig00000050)
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  blk00000101 (
    .I0(sig0000006e),
    .I1(a[14]),
    .I2(a[13]),
    .I3(a[12]),
    .O(sig0000008c)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000102 (
    .I0(sig0000006d),
    .I1(a[12]),
    .I2(a[13]),
    .O(sig0000008b)
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
