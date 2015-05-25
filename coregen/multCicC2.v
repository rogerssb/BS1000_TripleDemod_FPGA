////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.87xd
//  \   \         Application: netgen
//  /   /         Filename: multCicC2.v
// /___/   /\     Timestamp: Thu Apr 09 16:16:03 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/modem/telemetry/coregen/tmp/_cg/multCicC2.ngc C:/modem/telemetry/coregen/tmp/_cg/multCicC2.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/multCicC2.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/multCicC2.v
// # of Modules	: 1
// Design Name	: multCicC2
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

module multCicC2 (
p, a
)/* synthesis syn_black_box syn_noprune=1 */;
  output [34 : 0] p;
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
  wire sig000000e6;
  wire sig000000e7;
  wire sig000000e8;
  wire sig000000e9;
  wire sig000000ea;
  wire sig000000eb;
  wire sig000000ec;
  wire sig000000ed;
  wire sig000000ee;
  wire sig000000ef;
  wire sig000000f0;
  wire sig000000f1;
  wire sig000000f2;
  wire sig000000f3;
  wire sig000000f4;
  wire sig000000f5;
  wire sig000000f6;
  wire [0 : 0] NlwRenamedSignal_a;
  assign
    p[3] = NlwRenamedSignal_a[0],
    p[2] = NlwRenamedSig_OI_N0,
    p[1] = NlwRenamedSig_OI_N0,
    p[0] = NlwRenamedSig_OI_N0,
    NlwRenamedSignal_a[0] = a[0];
  GND   blk00000001 (
    .G(NlwRenamedSig_OI_N0)
  );
  XORCY   blk00000002 (
    .CI(sig000000dd),
    .LI(sig000000ed),
    .O(p[34])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000003 (
    .I0(sig000000af),
    .I1(a[17]),
    .O(sig000000ed)
  );
  XORCY   blk00000004 (
    .CI(sig000000dc),
    .LI(sig000000ec),
    .O(p[33])
  );
  MUXCY   blk00000005 (
    .CI(sig000000dc),
    .DI(sig0000002f),
    .S(sig000000ec),
    .O(sig000000dd)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000006 (
    .I0(sig0000002f),
    .I1(sig000000d7),
    .O(sig000000ec)
  );
  XORCY   blk00000007 (
    .CI(sig000000db),
    .LI(sig000000eb),
    .O(p[32])
  );
  MUXCY   blk00000008 (
    .CI(sig000000db),
    .DI(sig0000002e),
    .S(sig000000eb),
    .O(sig000000dc)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000009 (
    .I0(sig0000002e),
    .I1(sig000000d5),
    .O(sig000000eb)
  );
  XORCY   blk0000000a (
    .CI(sig000000da),
    .LI(sig000000ea),
    .O(p[31])
  );
  MUXCY   blk0000000b (
    .CI(sig000000da),
    .DI(sig0000002d),
    .S(sig000000ea),
    .O(sig000000db)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000000c (
    .I0(sig0000002d),
    .I1(a[17]),
    .O(sig000000ea)
  );
  XORCY   blk0000000d (
    .CI(sig000000d9),
    .LI(sig000000e9),
    .O(p[30])
  );
  MUXCY   blk0000000e (
    .CI(sig000000d9),
    .DI(sig0000002c),
    .S(sig000000e9),
    .O(sig000000da)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000000f (
    .I0(sig0000002c),
    .I1(a[17]),
    .O(sig000000e9)
  );
  XORCY   blk00000010 (
    .CI(sig000000e6),
    .LI(sig000000e8),
    .O(p[29])
  );
  MUXCY   blk00000011 (
    .CI(sig000000e6),
    .DI(sig0000002b),
    .S(sig000000e8),
    .O(sig000000d9)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000012 (
    .I0(sig0000002b),
    .I1(sig000000d7),
    .O(sig000000e8)
  );
  XORCY   blk00000013 (
    .CI(sig000000e5),
    .LI(sig000000f6),
    .O(p[28])
  );
  MUXCY   blk00000014 (
    .CI(sig000000e5),
    .DI(sig0000002a),
    .S(sig000000f6),
    .O(sig000000e6)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000015 (
    .I0(sig0000002a),
    .I1(sig000000d5),
    .O(sig000000f6)
  );
  XORCY   blk00000016 (
    .CI(sig000000e4),
    .LI(sig000000f5),
    .O(p[27])
  );
  MUXCY   blk00000017 (
    .CI(sig000000e4),
    .DI(sig00000029),
    .S(sig000000f5),
    .O(sig000000e5)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000018 (
    .I0(sig00000029),
    .I1(sig000000d7),
    .O(sig000000f5)
  );
  XORCY   blk00000019 (
    .CI(sig000000e3),
    .LI(sig000000f4),
    .O(p[26])
  );
  MUXCY   blk0000001a (
    .CI(sig000000e3),
    .DI(sig00000028),
    .S(sig000000f4),
    .O(sig000000e4)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000001b (
    .I0(sig00000028),
    .I1(sig000000d6),
    .O(sig000000f4)
  );
  XORCY   blk0000001c (
    .CI(sig000000e2),
    .LI(sig000000f3),
    .O(p[25])
  );
  MUXCY   blk0000001d (
    .CI(sig000000e2),
    .DI(sig00000027),
    .S(sig000000f3),
    .O(sig000000e3)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000001e (
    .I0(sig00000027),
    .I1(sig000000d6),
    .O(sig000000f3)
  );
  XORCY   blk0000001f (
    .CI(sig000000e1),
    .LI(sig000000f2),
    .O(p[24])
  );
  MUXCY   blk00000020 (
    .CI(sig000000e1),
    .DI(sig00000026),
    .S(sig000000f2),
    .O(sig000000e2)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000021 (
    .I0(sig00000026),
    .I1(sig000000d5),
    .O(sig000000f2)
  );
  XORCY   blk00000022 (
    .CI(sig000000e0),
    .LI(sig000000f1),
    .O(p[23])
  );
  MUXCY   blk00000023 (
    .CI(sig000000e0),
    .DI(sig00000025),
    .S(sig000000f1),
    .O(sig000000e1)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000024 (
    .I0(sig00000025),
    .I1(sig000000d7),
    .O(sig000000f1)
  );
  XORCY   blk00000025 (
    .CI(sig000000df),
    .LI(sig000000f0),
    .O(p[22])
  );
  MUXCY   blk00000026 (
    .CI(sig000000df),
    .DI(sig00000024),
    .S(sig000000f0),
    .O(sig000000e0)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000027 (
    .I0(sig00000024),
    .I1(sig000000d6),
    .O(sig000000f0)
  );
  XORCY   blk00000028 (
    .CI(sig000000de),
    .LI(sig000000ef),
    .O(p[21])
  );
  MUXCY   blk00000029 (
    .CI(sig000000de),
    .DI(sig00000023),
    .S(sig000000ef),
    .O(sig000000df)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000002a (
    .I0(sig00000023),
    .I1(sig000000d6),
    .O(sig000000ef)
  );
  XORCY   blk0000002b (
    .CI(sig000000d8),
    .LI(sig000000ee),
    .O(p[20])
  );
  MUXCY   blk0000002c (
    .CI(sig000000d8),
    .DI(sig00000022),
    .S(sig000000ee),
    .O(sig000000de)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000002d (
    .I0(sig00000022),
    .I1(sig000000d5),
    .O(sig000000ee)
  );
  XORCY   blk0000002e (
    .CI(NlwRenamedSig_OI_N0),
    .LI(sig000000e7),
    .O(p[19])
  );
  MUXCY   blk0000002f (
    .CI(NlwRenamedSig_OI_N0),
    .DI(sig00000021),
    .S(sig000000e7),
    .O(sig000000d8)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000030 (
    .I0(sig00000021),
    .I1(a[16]),
    .O(sig000000e7)
  );
  XORCY   blk00000031 (
    .CI(sig000000ad),
    .LI(sig000000b0),
    .O(sig0000002f)
  );
  MUXCY   blk00000032 (
    .CI(sig000000ad),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig000000b0),
    .O(sig000000af)
  );
  XORCY   blk00000033 (
    .CI(sig000000ab),
    .LI(sig000000ae),
    .O(sig0000002e)
  );
  MUXCY   blk00000034 (
    .CI(sig000000ab),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig000000ae),
    .O(sig000000ad)
  );
  XORCY   blk00000035 (
    .CI(sig000000a8),
    .LI(sig000000ac),
    .O(sig0000002d)
  );
  MUXCY   blk00000036 (
    .CI(sig000000a8),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig000000ac),
    .O(sig000000ab)
  );
  XORCY   blk00000037 (
    .CI(sig000000a6),
    .LI(sig000000a9),
    .O(sig0000002c)
  );
  MUXCY   blk00000038 (
    .CI(sig000000a6),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig000000a9),
    .O(sig000000a8)
  );
  XORCY   blk00000039 (
    .CI(sig000000a4),
    .LI(sig000000a7),
    .O(sig0000002b)
  );
  MUXCY   blk0000003a (
    .CI(sig000000a4),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig000000a7),
    .O(sig000000a6)
  );
  XORCY   blk0000003b (
    .CI(sig000000a2),
    .LI(sig000000a5),
    .O(sig0000002a)
  );
  MUXCY   blk0000003c (
    .CI(sig000000a2),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig000000a5),
    .O(sig000000a4)
  );
  XORCY   blk0000003d (
    .CI(sig000000a0),
    .LI(sig000000a3),
    .O(sig00000029)
  );
  MUXCY   blk0000003e (
    .CI(sig000000a0),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig000000a3),
    .O(sig000000a2)
  );
  XORCY   blk0000003f (
    .CI(sig0000009f),
    .LI(sig000000a1),
    .O(sig00000028)
  );
  MUXCY   blk00000040 (
    .CI(sig0000009f),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig000000a1),
    .O(sig000000a0)
  );
  XORCY   blk00000041 (
    .CI(sig0000009e),
    .LI(sig000000be),
    .O(sig00000027)
  );
  MUXCY   blk00000042 (
    .CI(sig0000009e),
    .DI(sig00000046),
    .S(sig000000be),
    .O(sig0000009f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000043 (
    .I0(sig00000046),
    .I1(sig00000013),
    .O(sig000000be)
  );
  XORCY   blk00000044 (
    .CI(sig0000009d),
    .LI(sig000000bd),
    .O(sig00000026)
  );
  MUXCY   blk00000045 (
    .CI(sig0000009d),
    .DI(sig0000000c),
    .S(sig000000bd),
    .O(sig0000009e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000046 (
    .I0(sig0000000c),
    .I1(sig00000012),
    .O(sig000000bd)
  );
  XORCY   blk00000047 (
    .CI(sig0000009c),
    .LI(sig000000bc),
    .O(sig00000025)
  );
  MUXCY   blk00000048 (
    .CI(sig0000009c),
    .DI(sig0000000b),
    .S(sig000000bc),
    .O(sig0000009d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000049 (
    .I0(sig0000000b),
    .I1(sig00000011),
    .O(sig000000bc)
  );
  XORCY   blk0000004a (
    .CI(sig0000009b),
    .LI(sig000000bb),
    .O(sig00000024)
  );
  MUXCY   blk0000004b (
    .CI(sig0000009b),
    .DI(sig0000000a),
    .S(sig000000bb),
    .O(sig0000009c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000004c (
    .I0(sig0000000a),
    .I1(sig00000010),
    .O(sig000000bb)
  );
  XORCY   blk0000004d (
    .CI(sig000000b8),
    .LI(sig000000ba),
    .O(sig00000023)
  );
  MUXCY   blk0000004e (
    .CI(sig000000b8),
    .DI(sig00000009),
    .S(sig000000ba),
    .O(sig0000009b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000004f (
    .I0(sig00000009),
    .I1(sig0000000f),
    .O(sig000000ba)
  );
  XORCY   blk00000050 (
    .CI(sig000000b7),
    .LI(sig000000c7),
    .O(sig00000022)
  );
  MUXCY   blk00000051 (
    .CI(sig000000b7),
    .DI(sig00000008),
    .S(sig000000c7),
    .O(sig000000b8)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000052 (
    .I0(sig00000008),
    .I1(sig00000020),
    .O(sig000000c7)
  );
  XORCY   blk00000053 (
    .CI(sig000000b6),
    .LI(sig000000c6),
    .O(sig00000021)
  );
  MUXCY   blk00000054 (
    .CI(sig000000b6),
    .DI(sig00000007),
    .S(sig000000c6),
    .O(sig000000b7)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000055 (
    .I0(sig00000007),
    .I1(sig0000001f),
    .O(sig000000c6)
  );
  XORCY   blk00000056 (
    .CI(sig000000b5),
    .LI(sig000000c5),
    .O(p[18])
  );
  MUXCY   blk00000057 (
    .CI(sig000000b5),
    .DI(sig00000006),
    .S(sig000000c5),
    .O(sig000000b6)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000058 (
    .I0(sig00000006),
    .I1(sig0000001e),
    .O(sig000000c5)
  );
  XORCY   blk00000059 (
    .CI(sig000000b4),
    .LI(sig000000c4),
    .O(p[17])
  );
  MUXCY   blk0000005a (
    .CI(sig000000b4),
    .DI(sig00000005),
    .S(sig000000c4),
    .O(sig000000b5)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000005b (
    .I0(sig00000005),
    .I1(sig0000001d),
    .O(sig000000c4)
  );
  XORCY   blk0000005c (
    .CI(sig000000b3),
    .LI(sig000000c3),
    .O(p[16])
  );
  MUXCY   blk0000005d (
    .CI(sig000000b3),
    .DI(sig00000004),
    .S(sig000000c3),
    .O(sig000000b4)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000005e (
    .I0(sig00000004),
    .I1(sig0000001c),
    .O(sig000000c3)
  );
  XORCY   blk0000005f (
    .CI(sig000000b2),
    .LI(sig000000c2),
    .O(p[15])
  );
  MUXCY   blk00000060 (
    .CI(sig000000b2),
    .DI(sig00000003),
    .S(sig000000c2),
    .O(sig000000b3)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000061 (
    .I0(sig00000003),
    .I1(sig0000001b),
    .O(sig000000c2)
  );
  XORCY   blk00000062 (
    .CI(sig000000b1),
    .LI(sig000000c1),
    .O(p[14])
  );
  MUXCY   blk00000063 (
    .CI(sig000000b1),
    .DI(sig00000002),
    .S(sig000000c1),
    .O(sig000000b2)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000064 (
    .I0(sig00000002),
    .I1(sig00000074),
    .O(sig000000c1)
  );
  XORCY   blk00000065 (
    .CI(sig000000aa),
    .LI(sig000000c0),
    .O(p[13])
  );
  MUXCY   blk00000066 (
    .CI(sig000000aa),
    .DI(sig00000001),
    .S(sig000000c0),
    .O(sig000000b1)
  );
  XORCY   blk00000067 (
    .CI(sig0000009a),
    .LI(sig000000bf),
    .O(p[12])
  );
  MUXCY   blk00000068 (
    .CI(sig0000009a),
    .DI(sig0000000e),
    .S(sig000000bf),
    .O(sig000000aa)
  );
  XORCY   blk00000069 (
    .CI(NlwRenamedSig_OI_N0),
    .LI(sig000000b9),
    .O(p[11])
  );
  MUXCY   blk0000006a (
    .CI(NlwRenamedSig_OI_N0),
    .DI(sig0000000d),
    .S(sig000000b9),
    .O(sig0000009a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000006b (
    .I0(sig0000000d),
    .I1(a[8]),
    .O(sig000000b9)
  );
  XORCY   blk0000006c (
    .CI(sig00000045),
    .LI(sig00000064),
    .O(sig0000000c)
  );
  MUXCY   blk0000006d (
    .CI(sig00000045),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000064),
    .O(sig00000046)
  );
  XORCY   blk0000006e (
    .CI(sig00000044),
    .LI(sig00000063),
    .O(sig0000000b)
  );
  MUXCY   blk0000006f (
    .CI(sig00000044),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000063),
    .O(sig00000045)
  );
  XORCY   blk00000070 (
    .CI(sig00000043),
    .LI(sig00000062),
    .O(sig0000000a)
  );
  MUXCY   blk00000071 (
    .CI(sig00000043),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000062),
    .O(sig00000044)
  );
  XORCY   blk00000072 (
    .CI(sig00000042),
    .LI(sig00000061),
    .O(sig00000009)
  );
  MUXCY   blk00000073 (
    .CI(sig00000042),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000061),
    .O(sig00000043)
  );
  XORCY   blk00000074 (
    .CI(sig00000041),
    .LI(sig00000054),
    .O(sig00000008)
  );
  MUXCY   blk00000075 (
    .CI(sig00000041),
    .DI(sig00000038),
    .S(sig00000054),
    .O(sig00000042)
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  blk00000076 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(sig00000060),
    .I2(sig00000037),
    .O(sig00000054)
  );
  MULT_AND   blk00000077 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(sig00000037),
    .LO(sig00000038)
  );
  XORCY   blk00000078 (
    .CI(sig00000040),
    .LI(sig00000053),
    .O(sig00000007)
  );
  MUXCY   blk00000079 (
    .CI(sig00000040),
    .DI(sig00000036),
    .S(sig00000053),
    .O(sig00000041)
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  blk0000007a (
    .I0(a[3]),
    .I1(sig0000005f),
    .I2(sig00000035),
    .O(sig00000053)
  );
  MULT_AND   blk0000007b (
    .I0(a[3]),
    .I1(sig00000035),
    .LO(sig00000036)
  );
  XORCY   blk0000007c (
    .CI(sig0000003f),
    .LI(sig00000052),
    .O(sig00000006)
  );
  MUXCY   blk0000007d (
    .CI(sig0000003f),
    .DI(sig00000034),
    .S(sig00000052),
    .O(sig00000040)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000007e (
    .I0(sig00000034),
    .I1(sig0000005e),
    .O(sig00000052)
  );
  XORCY   blk0000007f (
    .CI(sig0000004f),
    .LI(sig00000051),
    .O(sig00000005)
  );
  MUXCY   blk00000080 (
    .CI(sig0000004f),
    .DI(sig00000033),
    .S(sig00000051),
    .O(sig0000003f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000081 (
    .I0(sig00000033),
    .I1(sig0000006a),
    .O(sig00000051)
  );
  XORCY   blk00000082 (
    .CI(sig0000004e),
    .LI(sig0000005d),
    .O(sig00000004)
  );
  MUXCY   blk00000083 (
    .CI(sig0000004e),
    .DI(sig00000032),
    .S(sig0000005d),
    .O(sig0000004f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000084 (
    .I0(sig00000032),
    .I1(sig00000067),
    .O(sig0000005d)
  );
  XORCY   blk00000085 (
    .CI(sig0000004d),
    .LI(sig0000005c),
    .O(sig00000003)
  );
  MUXCY   blk00000086 (
    .CI(sig0000004d),
    .DI(sig00000031),
    .S(sig0000005c),
    .O(sig0000004e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000087 (
    .I0(sig00000031),
    .I1(sig00000066),
    .O(sig0000005c)
  );
  XORCY   blk00000088 (
    .CI(sig0000004c),
    .LI(sig0000005b),
    .O(sig00000002)
  );
  MUXCY   blk00000089 (
    .CI(sig0000004c),
    .DI(sig00000030),
    .S(sig0000005b),
    .O(sig0000004d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000008a (
    .I0(sig00000030),
    .I1(sig00000069),
    .O(sig0000005b)
  );
  XORCY   blk0000008b (
    .CI(sig0000004b),
    .LI(sig0000005a),
    .O(sig00000001)
  );
  MUXCY   blk0000008c (
    .CI(sig0000004b),
    .DI(sig0000003d),
    .S(sig0000005a),
    .O(sig0000004c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000008d (
    .I0(sig0000003d),
    .I1(sig00000068),
    .O(sig0000005a)
  );
  XORCY   blk0000008e (
    .CI(sig0000004a),
    .LI(sig00000059),
    .O(sig0000000e)
  );
  MUXCY   blk0000008f (
    .CI(sig0000004a),
    .DI(sig0000003a),
    .S(sig00000059),
    .O(sig0000004b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000090 (
    .I0(sig0000003a),
    .I1(sig00000067),
    .O(sig00000059)
  );
  XORCY   blk00000091 (
    .CI(sig00000049),
    .LI(sig00000058),
    .O(sig0000000d)
  );
  MUXCY   blk00000092 (
    .CI(sig00000049),
    .DI(sig00000039),
    .S(sig00000058),
    .O(sig0000004a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000093 (
    .I0(sig00000039),
    .I1(sig00000066),
    .O(sig00000058)
  );
  XORCY   blk00000094 (
    .CI(sig00000048),
    .LI(sig00000057),
    .O(p[10])
  );
  MUXCY   blk00000095 (
    .CI(sig00000048),
    .DI(sig0000003c),
    .S(sig00000057),
    .O(sig00000049)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000096 (
    .I0(sig0000003c),
    .I1(sig00000065),
    .O(sig00000057)
  );
  XORCY   blk00000097 (
    .CI(sig00000047),
    .LI(sig00000056),
    .O(p[9])
  );
  MUXCY   blk00000098 (
    .CI(sig00000047),
    .DI(sig0000003b),
    .S(sig00000056),
    .O(sig00000048)
  );
  XORCY   blk00000099 (
    .CI(sig0000003e),
    .LI(sig00000055),
    .O(p[8])
  );
  MUXCY   blk0000009a (
    .CI(sig0000003e),
    .DI(sig0000003a),
    .S(sig00000055),
    .O(sig00000047)
  );
  XORCY   blk0000009b (
    .CI(NlwRenamedSig_OI_N0),
    .LI(sig00000050),
    .O(p[7])
  );
  MUXCY   blk0000009c (
    .CI(NlwRenamedSig_OI_N0),
    .DI(a[4]),
    .S(sig00000050),
    .O(sig0000003e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000009d (
    .I0(sig00000039),
    .I1(a[4]),
    .O(sig00000050)
  );
  XORCY   blk0000009e (
    .CI(sig00000081),
    .LI(sig000000ce),
    .O(sig0000001a)
  );
  MUXCY   blk0000009f (
    .CI(sig00000081),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig000000ce),
    .O(sig00000082)
  );
  XORCY   blk000000a0 (
    .CI(sig00000080),
    .LI(sig000000cd),
    .O(sig00000019)
  );
  MUXCY   blk000000a1 (
    .CI(sig00000080),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig000000cd),
    .O(sig00000081)
  );
  XORCY   blk000000a2 (
    .CI(sig0000007f),
    .LI(sig000000cc),
    .O(sig00000018)
  );
  MUXCY   blk000000a3 (
    .CI(sig0000007f),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig000000cc),
    .O(sig00000080)
  );
  XORCY   blk000000a4 (
    .CI(sig0000007e),
    .LI(sig000000cb),
    .O(sig00000017)
  );
  MUXCY   blk000000a5 (
    .CI(sig0000007e),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig000000cb),
    .O(sig0000007f)
  );
  XORCY   blk000000a6 (
    .CI(sig0000007d),
    .LI(sig00000090),
    .O(sig00000016)
  );
  MUXCY   blk000000a7 (
    .CI(sig0000007d),
    .DI(sig00000073),
    .S(sig00000090),
    .O(sig0000007e)
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  blk000000a8 (
    .I0(a[8]),
    .I1(sig000000ca),
    .I2(sig00000072),
    .O(sig00000090)
  );
  MULT_AND   blk000000a9 (
    .I0(a[8]),
    .I1(sig00000072),
    .LO(sig00000073)
  );
  XORCY   blk000000aa (
    .CI(sig0000007c),
    .LI(sig0000008f),
    .O(sig00000015)
  );
  MUXCY   blk000000ab (
    .CI(sig0000007c),
    .DI(sig00000071),
    .S(sig0000008f),
    .O(sig0000007d)
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  blk000000ac (
    .I0(a[11]),
    .I1(sig000000c9),
    .I2(sig00000070),
    .O(sig0000008f)
  );
  MULT_AND   blk000000ad (
    .I0(a[11]),
    .I1(sig00000070),
    .LO(sig00000071)
  );
  XORCY   blk000000ae (
    .CI(sig0000007b),
    .LI(sig0000008e),
    .O(sig00000014)
  );
  MUXCY   blk000000af (
    .CI(sig0000007b),
    .DI(sig0000006f),
    .S(sig0000008e),
    .O(sig0000007c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b0 (
    .I0(sig0000006f),
    .I1(sig000000c8),
    .O(sig0000008e)
  );
  XORCY   blk000000b1 (
    .CI(sig0000008b),
    .LI(sig0000008d),
    .O(sig00000013)
  );
  MUXCY   blk000000b2 (
    .CI(sig0000008b),
    .DI(sig0000006e),
    .S(sig0000008d),
    .O(sig0000007b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b3 (
    .I0(sig0000006e),
    .I1(sig000000d4),
    .O(sig0000008d)
  );
  XORCY   blk000000b4 (
    .CI(sig0000008a),
    .LI(sig00000099),
    .O(sig00000012)
  );
  MUXCY   blk000000b5 (
    .CI(sig0000008a),
    .DI(sig0000006d),
    .S(sig00000099),
    .O(sig0000008b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b6 (
    .I0(sig0000006d),
    .I1(sig000000d1),
    .O(sig00000099)
  );
  XORCY   blk000000b7 (
    .CI(sig00000089),
    .LI(sig00000098),
    .O(sig00000011)
  );
  MUXCY   blk000000b8 (
    .CI(sig00000089),
    .DI(sig0000006c),
    .S(sig00000098),
    .O(sig0000008a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b9 (
    .I0(sig0000006c),
    .I1(sig000000d0),
    .O(sig00000098)
  );
  XORCY   blk000000ba (
    .CI(sig00000088),
    .LI(sig00000097),
    .O(sig00000010)
  );
  MUXCY   blk000000bb (
    .CI(sig00000088),
    .DI(sig0000006b),
    .S(sig00000097),
    .O(sig00000089)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000bc (
    .I0(sig0000006b),
    .I1(sig000000d3),
    .O(sig00000097)
  );
  XORCY   blk000000bd (
    .CI(sig00000087),
    .LI(sig00000096),
    .O(sig0000000f)
  );
  MUXCY   blk000000be (
    .CI(sig00000087),
    .DI(sig00000079),
    .S(sig00000096),
    .O(sig00000088)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000bf (
    .I0(sig00000079),
    .I1(sig000000d2),
    .O(sig00000096)
  );
  XORCY   blk000000c0 (
    .CI(sig00000086),
    .LI(sig00000095),
    .O(sig00000020)
  );
  MUXCY   blk000000c1 (
    .CI(sig00000086),
    .DI(sig00000076),
    .S(sig00000095),
    .O(sig00000087)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c2 (
    .I0(sig00000076),
    .I1(sig000000d1),
    .O(sig00000095)
  );
  XORCY   blk000000c3 (
    .CI(sig00000085),
    .LI(sig00000094),
    .O(sig0000001f)
  );
  MUXCY   blk000000c4 (
    .CI(sig00000085),
    .DI(sig00000075),
    .S(sig00000094),
    .O(sig00000086)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c5 (
    .I0(sig00000075),
    .I1(sig000000d0),
    .O(sig00000094)
  );
  XORCY   blk000000c6 (
    .CI(sig00000084),
    .LI(sig00000093),
    .O(sig0000001e)
  );
  MUXCY   blk000000c7 (
    .CI(sig00000084),
    .DI(sig00000078),
    .S(sig00000093),
    .O(sig00000085)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c8 (
    .I0(sig00000078),
    .I1(sig000000cf),
    .O(sig00000093)
  );
  XORCY   blk000000c9 (
    .CI(sig00000083),
    .LI(sig00000092),
    .O(sig0000001d)
  );
  MUXCY   blk000000ca (
    .CI(sig00000083),
    .DI(sig00000077),
    .S(sig00000092),
    .O(sig00000084)
  );
  XORCY   blk000000cb (
    .CI(sig0000007a),
    .LI(sig00000091),
    .O(sig0000001c)
  );
  MUXCY   blk000000cc (
    .CI(sig0000007a),
    .DI(sig00000076),
    .S(sig00000091),
    .O(sig00000083)
  );
  XORCY   blk000000cd (
    .CI(NlwRenamedSig_OI_N0),
    .LI(sig0000008c),
    .O(sig0000001b)
  );
  MUXCY   blk000000ce (
    .CI(NlwRenamedSig_OI_N0),
    .DI(a[12]),
    .S(sig0000008c),
    .O(sig0000007a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000cf (
    .I0(sig00000075),
    .I1(a[12]),
    .O(sig0000008c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000d0 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(a[1]),
    .O(p[4])
  );
  LUT3 #(
    .INIT ( 8'h56 ))
  blk000000d1 (
    .I0(a[2]),
    .I1(a[1]),
    .I2(NlwRenamedSignal_a[0]),
    .O(p[5])
  );
  LUT4 #(
    .INIT ( 16'h5556 ))
  blk000000d2 (
    .I0(a[3]),
    .I1(NlwRenamedSignal_a[0]),
    .I2(a[1]),
    .I3(a[2]),
    .O(p[6])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk000000d3 (
    .I0(a[16]),
    .I1(a[17]),
    .O(sig000000d7)
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  blk000000d4 (
    .I0(a[16]),
    .I1(a[17]),
    .O(sig000000d6)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000d5 (
    .I0(a[16]),
    .I1(a[17]),
    .O(sig000000d5)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000d6 (
    .I0(a[12]),
    .I1(a[14]),
    .I2(a[15]),
    .I3(a[13]),
    .O(sig000000ce)
  );
  LUT4 #(
    .INIT ( 16'h2AAA ))
  blk000000d7 (
    .I0(a[15]),
    .I1(a[14]),
    .I2(a[13]),
    .I3(a[12]),
    .O(sig000000cd)
  );
  LUT4 #(
    .INIT ( 16'h6CCC ))
  blk000000d8 (
    .I0(a[13]),
    .I1(a[14]),
    .I2(a[12]),
    .I3(a[15]),
    .O(sig000000cc)
  );
  LUT4 #(
    .INIT ( 16'h6A2A ))
  blk000000d9 (
    .I0(a[13]),
    .I1(a[12]),
    .I2(a[15]),
    .I3(a[14]),
    .O(sig000000cb)
  );
  LUT4 #(
    .INIT ( 16'h5556 ))
  blk000000da (
    .I0(a[11]),
    .I1(a[10]),
    .I2(a[9]),
    .I3(a[8]),
    .O(sig00000074)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000db (
    .I0(a[4]),
    .I1(a[6]),
    .I2(a[7]),
    .I3(a[5]),
    .O(sig00000064)
  );
  LUT4 #(
    .INIT ( 16'h646C ))
  blk000000dc (
    .I0(a[15]),
    .I1(a[12]),
    .I2(a[14]),
    .I3(a[13]),
    .O(sig000000ca)
  );
  LUT4 #(
    .INIT ( 16'h4622 ))
  blk000000dd (
    .I0(a[15]),
    .I1(a[14]),
    .I2(a[12]),
    .I3(a[13]),
    .O(sig000000c9)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  blk000000de (
    .I0(a[9]),
    .I1(a[11]),
    .I2(a[10]),
    .O(sig00000072)
  );
  LUT4 #(
    .INIT ( 16'h9698 ))
  blk000000df (
    .I0(a[13]),
    .I1(a[15]),
    .I2(a[14]),
    .I3(a[12]),
    .O(sig000000c8)
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  blk000000e0 (
    .I0(a[10]),
    .I1(a[9]),
    .I2(a[8]),
    .O(sig00000070)
  );
  LUT4 #(
    .INIT ( 16'h6CCC ))
  blk000000e1 (
    .I0(a[11]),
    .I1(a[10]),
    .I2(a[9]),
    .I3(a[8]),
    .O(sig0000006f)
  );
  LUT4 #(
    .INIT ( 16'h9998 ))
  blk000000e2 (
    .I0(a[12]),
    .I1(a[14]),
    .I2(a[13]),
    .I3(a[15]),
    .O(sig000000d4)
  );
  LUT4 #(
    .INIT ( 16'h6A2A ))
  blk000000e3 (
    .I0(a[9]),
    .I1(a[11]),
    .I2(a[8]),
    .I3(a[10]),
    .O(sig0000006e)
  );
  LUT4 #(
    .INIT ( 16'h2AAA ))
  blk000000e4 (
    .I0(a[7]),
    .I1(a[6]),
    .I2(a[5]),
    .I3(a[4]),
    .O(sig00000063)
  );
  LUT4 #(
    .INIT ( 16'h6CCC ))
  blk000000e5 (
    .I0(a[5]),
    .I1(a[6]),
    .I2(a[4]),
    .I3(a[7]),
    .O(sig00000062)
  );
  LUT4 #(
    .INIT ( 16'h6A2A ))
  blk000000e6 (
    .I0(a[5]),
    .I1(a[4]),
    .I2(a[7]),
    .I3(a[6]),
    .O(sig00000061)
  );
  LUT4 #(
    .INIT ( 16'h646C ))
  blk000000e7 (
    .I0(a[11]),
    .I1(a[8]),
    .I2(a[10]),
    .I3(a[9]),
    .O(sig0000006d)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000e8 (
    .I0(a[15]),
    .I1(a[14]),
    .I2(a[13]),
    .I3(a[12]),
    .O(sig000000d3)
  );
  LUT4 #(
    .INIT ( 16'h4622 ))
  blk000000e9 (
    .I0(a[11]),
    .I1(a[10]),
    .I2(a[8]),
    .I3(a[9]),
    .O(sig0000006c)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000ea (
    .I0(a[14]),
    .I1(a[15]),
    .I2(a[13]),
    .I3(a[12]),
    .O(sig000000d2)
  );
  LUT4 #(
    .INIT ( 16'h9698 ))
  blk000000eb (
    .I0(a[9]),
    .I1(a[11]),
    .I2(a[10]),
    .I3(a[8]),
    .O(sig0000006b)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000ec (
    .I0(a[13]),
    .I1(a[15]),
    .I2(a[14]),
    .I3(a[12]),
    .O(sig000000d1)
  );
  LUT4 #(
    .INIT ( 16'h9998 ))
  blk000000ed (
    .I0(a[10]),
    .I1(a[8]),
    .I2(a[11]),
    .I3(a[9]),
    .O(sig00000079)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000ee (
    .I0(a[12]),
    .I1(a[13]),
    .I2(a[14]),
    .I3(a[15]),
    .O(sig000000d0)
  );
  LUT4 #(
    .INIT ( 16'h646C ))
  blk000000ef (
    .I0(a[7]),
    .I1(a[4]),
    .I2(a[6]),
    .I3(a[5]),
    .O(sig00000060)
  );
  LUT4 #(
    .INIT ( 16'h5556 ))
  blk000000f0 (
    .I0(a[15]),
    .I1(a[13]),
    .I2(a[14]),
    .I3(a[12]),
    .O(sig000000cf)
  );
  LUT4 #(
    .INIT ( 16'h4622 ))
  blk000000f1 (
    .I0(a[7]),
    .I1(a[6]),
    .I2(a[4]),
    .I3(a[5]),
    .O(sig0000005f)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  blk000000f2 (
    .I0(a[1]),
    .I1(a[2]),
    .I2(a[3]),
    .O(sig00000037)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000f3 (
    .I0(a[11]),
    .I1(a[10]),
    .I2(a[8]),
    .I3(a[9]),
    .O(sig00000078)
  );
  LUT4 #(
    .INIT ( 16'h9698 ))
  blk000000f4 (
    .I0(a[7]),
    .I1(a[5]),
    .I2(a[6]),
    .I3(a[4]),
    .O(sig0000005e)
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  blk000000f5 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(a[1]),
    .I2(a[2]),
    .O(sig00000035)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000f6 (
    .I0(a[10]),
    .I1(a[11]),
    .I2(a[8]),
    .I3(a[9]),
    .O(sig00000077)
  );
  LUT4 #(
    .INIT ( 16'h9998 ))
  blk000000f7 (
    .I0(a[4]),
    .I1(a[6]),
    .I2(a[5]),
    .I3(a[7]),
    .O(sig0000006a)
  );
  LUT4 #(
    .INIT ( 16'h6CCC ))
  blk000000f8 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(a[2]),
    .I2(a[1]),
    .I3(a[3]),
    .O(sig00000034)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000f9 (
    .I0(a[9]),
    .I1(a[10]),
    .I2(a[11]),
    .I3(a[8]),
    .O(sig00000076)
  );
  LUT4 #(
    .INIT ( 16'h6A2A ))
  blk000000fa (
    .I0(a[1]),
    .I1(NlwRenamedSignal_a[0]),
    .I2(a[3]),
    .I3(a[2]),
    .O(sig00000033)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000fb (
    .I0(a[8]),
    .I1(a[10]),
    .I2(a[11]),
    .I3(a[9]),
    .O(sig00000075)
  );
  LUT4 #(
    .INIT ( 16'h646C ))
  blk000000fc (
    .I0(a[3]),
    .I1(NlwRenamedSignal_a[0]),
    .I2(a[2]),
    .I3(a[1]),
    .O(sig00000032)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000fd (
    .I0(a[7]),
    .I1(a[4]),
    .I2(a[5]),
    .I3(a[6]),
    .O(sig00000069)
  );
  LUT4 #(
    .INIT ( 16'h4622 ))
  blk000000fe (
    .I0(a[3]),
    .I1(a[2]),
    .I2(NlwRenamedSignal_a[0]),
    .I3(a[1]),
    .O(sig00000031)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000ff (
    .I0(a[6]),
    .I1(a[4]),
    .I2(a[5]),
    .I3(a[7]),
    .O(sig00000068)
  );
  LUT4 #(
    .INIT ( 16'h9698 ))
  blk00000100 (
    .I0(a[3]),
    .I1(a[1]),
    .I2(a[2]),
    .I3(NlwRenamedSignal_a[0]),
    .O(sig00000030)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk00000101 (
    .I0(a[5]),
    .I1(a[4]),
    .I2(a[6]),
    .I3(a[7]),
    .O(sig00000067)
  );
  LUT4 #(
    .INIT ( 16'h9998 ))
  blk00000102 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(a[2]),
    .I2(a[1]),
    .I3(a[3]),
    .O(sig0000003d)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk00000103 (
    .I0(a[4]),
    .I1(a[5]),
    .I2(a[6]),
    .I3(a[7]),
    .O(sig00000066)
  );
  LUT4 #(
    .INIT ( 16'h5556 ))
  blk00000104 (
    .I0(a[7]),
    .I1(a[5]),
    .I2(a[6]),
    .I3(a[4]),
    .O(sig00000065)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk00000105 (
    .I0(a[3]),
    .I1(NlwRenamedSignal_a[0]),
    .I2(a[1]),
    .I3(a[2]),
    .O(sig0000003c)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk00000106 (
    .I0(a[2]),
    .I1(NlwRenamedSignal_a[0]),
    .I2(a[1]),
    .I3(a[3]),
    .O(sig0000003b)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk00000107 (
    .I0(a[1]),
    .I1(NlwRenamedSignal_a[0]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig0000003a)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk00000108 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(a[1]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig00000039)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000109 (
    .I0(sig00000082),
    .O(sig000000b0)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000010a (
    .I0(sig0000001a),
    .O(sig000000ae)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000010b (
    .I0(sig00000019),
    .O(sig000000ac)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000010c (
    .I0(sig00000018),
    .O(sig000000a9)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000010d (
    .I0(sig00000017),
    .O(sig000000a7)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000010e (
    .I0(sig00000016),
    .O(sig000000a5)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000010f (
    .I0(sig00000015),
    .O(sig000000a3)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000110 (
    .I0(sig00000014),
    .O(sig000000a1)
  );
  LUT4 #(
    .INIT ( 16'h9996 ))
  blk00000111 (
    .I0(sig00000001),
    .I1(a[10]),
    .I2(a[8]),
    .I3(a[9]),
    .O(sig000000c0)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000112 (
    .I0(sig0000000e),
    .I1(a[8]),
    .I2(a[9]),
    .O(sig000000bf)
  );
  LUT4 #(
    .INIT ( 16'h9996 ))
  blk00000113 (
    .I0(sig0000003b),
    .I1(a[6]),
    .I2(a[5]),
    .I3(a[4]),
    .O(sig00000056)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000114 (
    .I0(sig0000003a),
    .I1(a[4]),
    .I2(a[5]),
    .O(sig00000055)
  );
  LUT4 #(
    .INIT ( 16'h9996 ))
  blk00000115 (
    .I0(sig00000077),
    .I1(a[14]),
    .I2(a[13]),
    .I3(a[12]),
    .O(sig00000092)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000116 (
    .I0(sig00000076),
    .I1(a[12]),
    .I2(a[13]),
    .O(sig00000091)
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
