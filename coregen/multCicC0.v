////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.87xd
//  \   \         Application: netgen
//  /   /         Filename: multCicC0.v
// /___/   /\     Timestamp: Thu Apr 09 16:12:54 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/modem/telemetry/coregen/tmp/_cg/multCicC0.ngc C:/modem/telemetry/coregen/tmp/_cg/multCicC0.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/multCicC0.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/multCicC0.v
// # of Modules	: 1
// Design Name	: multCicC0
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

module multCicC0 (
p, a
)/* synthesis syn_black_box syn_noprune=1 */;
  output [29 : 0] p;
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
  wire [0 : 0] NlwRenamedSignal_a;
  assign
    p[4] = NlwRenamedSignal_a[0],
    p[3] = NlwRenamedSig_OI_N0,
    p[2] = NlwRenamedSig_OI_N0,
    p[1] = NlwRenamedSig_OI_N0,
    p[0] = NlwRenamedSig_OI_N0,
    NlwRenamedSignal_a[0] = a[0];
  GND   blk00000001 (
    .G(NlwRenamedSig_OI_N0)
  );
  XORCY   blk00000002 (
    .CI(sig00000096),
    .LI(sig000000a0),
    .O(p[29])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000003 (
    .I0(sig0000006e),
    .I1(a[17]),
    .O(sig000000a0)
  );
  XORCY   blk00000004 (
    .CI(sig00000095),
    .LI(sig0000009f),
    .O(p[28])
  );
  MUXCY   blk00000005 (
    .CI(sig00000095),
    .DI(sig0000001f),
    .S(sig0000009f),
    .O(sig00000096)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000006 (
    .I0(sig0000001f),
    .I1(sig0000008d),
    .O(sig0000009f)
  );
  XORCY   blk00000007 (
    .CI(sig00000094),
    .LI(sig0000009e),
    .O(p[27])
  );
  MUXCY   blk00000008 (
    .CI(sig00000094),
    .DI(sig0000001e),
    .S(sig0000009e),
    .O(sig00000095)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000009 (
    .I0(sig0000001e),
    .I1(sig0000008b),
    .O(sig0000009e)
  );
  XORCY   blk0000000a (
    .CI(sig00000093),
    .LI(sig0000009d),
    .O(p[26])
  );
  MUXCY   blk0000000b (
    .CI(sig00000093),
    .DI(sig0000001d),
    .S(sig0000009d),
    .O(sig00000094)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000000c (
    .I0(sig0000001d),
    .I1(sig0000008d),
    .O(sig0000009d)
  );
  XORCY   blk0000000d (
    .CI(sig00000092),
    .LI(sig0000009c),
    .O(p[25])
  );
  MUXCY   blk0000000e (
    .CI(sig00000092),
    .DI(sig0000001c),
    .S(sig0000009c),
    .O(sig00000093)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000000f (
    .I0(sig0000001c),
    .I1(sig0000008b),
    .O(sig0000009c)
  );
  XORCY   blk00000010 (
    .CI(sig00000091),
    .LI(sig0000009b),
    .O(p[24])
  );
  MUXCY   blk00000011 (
    .CI(sig00000091),
    .DI(sig0000001b),
    .S(sig0000009b),
    .O(sig00000092)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000012 (
    .I0(sig0000001b),
    .I1(sig0000008d),
    .O(sig0000009b)
  );
  XORCY   blk00000013 (
    .CI(sig00000090),
    .LI(sig0000009a),
    .O(p[23])
  );
  MUXCY   blk00000014 (
    .CI(sig00000090),
    .DI(sig0000001a),
    .S(sig0000009a),
    .O(sig00000091)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000015 (
    .I0(sig0000001a),
    .I1(sig0000008c),
    .O(sig0000009a)
  );
  XORCY   blk00000016 (
    .CI(sig0000008f),
    .LI(sig00000099),
    .O(p[22])
  );
  MUXCY   blk00000017 (
    .CI(sig0000008f),
    .DI(sig00000019),
    .S(sig00000099),
    .O(sig00000090)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000018 (
    .I0(sig00000019),
    .I1(sig0000008c),
    .O(sig00000099)
  );
  XORCY   blk00000019 (
    .CI(sig0000008e),
    .LI(sig00000098),
    .O(p[21])
  );
  MUXCY   blk0000001a (
    .CI(sig0000008e),
    .DI(sig00000018),
    .S(sig00000098),
    .O(sig0000008f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000001b (
    .I0(sig00000018),
    .I1(sig0000008b),
    .O(sig00000098)
  );
  XORCY   blk0000001c (
    .CI(NlwRenamedSig_OI_N0),
    .LI(sig00000097),
    .O(p[20])
  );
  MUXCY   blk0000001d (
    .CI(NlwRenamedSig_OI_N0),
    .DI(sig00000017),
    .S(sig00000097),
    .O(sig0000008e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000001e (
    .I0(sig00000017),
    .I1(a[16]),
    .O(sig00000097)
  );
  XORCY   blk0000001f (
    .CI(sig0000006c),
    .LI(sig0000006f),
    .O(sig0000001f)
  );
  MUXCY   blk00000020 (
    .CI(sig0000006c),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig0000006f),
    .O(sig0000006e)
  );
  XORCY   blk00000021 (
    .CI(sig0000006a),
    .LI(sig0000006d),
    .O(sig0000001e)
  );
  MUXCY   blk00000022 (
    .CI(sig0000006a),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig0000006d),
    .O(sig0000006c)
  );
  XORCY   blk00000023 (
    .CI(sig00000068),
    .LI(sig0000006b),
    .O(sig0000001d)
  );
  MUXCY   blk00000024 (
    .CI(sig00000068),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig0000006b),
    .O(sig0000006a)
  );
  XORCY   blk00000025 (
    .CI(sig00000066),
    .LI(sig00000069),
    .O(sig0000001c)
  );
  MUXCY   blk00000026 (
    .CI(sig00000066),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000069),
    .O(sig00000068)
  );
  XORCY   blk00000027 (
    .CI(sig00000064),
    .LI(sig00000067),
    .O(sig0000001b)
  );
  MUXCY   blk00000028 (
    .CI(sig00000064),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000067),
    .O(sig00000066)
  );
  XORCY   blk00000029 (
    .CI(sig00000062),
    .LI(sig00000065),
    .O(sig0000001a)
  );
  MUXCY   blk0000002a (
    .CI(sig00000062),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000065),
    .O(sig00000064)
  );
  XORCY   blk0000002b (
    .CI(sig00000078),
    .LI(sig00000063),
    .O(sig00000019)
  );
  MUXCY   blk0000002c (
    .CI(sig00000078),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000063),
    .O(sig00000062)
  );
  XORCY   blk0000002d (
    .CI(sig00000077),
    .LI(sig00000079),
    .O(sig00000018)
  );
  MUXCY   blk0000002e (
    .CI(sig00000077),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000079),
    .O(sig00000078)
  );
  XORCY   blk0000002f (
    .CI(sig00000076),
    .LI(sig00000082),
    .O(sig00000017)
  );
  MUXCY   blk00000030 (
    .CI(sig00000076),
    .DI(sig0000002a),
    .S(sig00000082),
    .O(sig00000077)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000031 (
    .I0(sig0000002a),
    .I1(sig00000015),
    .O(sig00000082)
  );
  XORCY   blk00000032 (
    .CI(sig00000075),
    .LI(sig00000081),
    .O(p[19])
  );
  MUXCY   blk00000033 (
    .CI(sig00000075),
    .DI(sig00000008),
    .S(sig00000081),
    .O(sig00000076)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000034 (
    .I0(sig00000008),
    .I1(sig00000014),
    .O(sig00000081)
  );
  XORCY   blk00000035 (
    .CI(sig00000074),
    .LI(sig00000080),
    .O(p[18])
  );
  MUXCY   blk00000036 (
    .CI(sig00000074),
    .DI(sig00000007),
    .S(sig00000080),
    .O(sig00000075)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000037 (
    .I0(sig00000007),
    .I1(sig00000013),
    .O(sig00000080)
  );
  XORCY   blk00000038 (
    .CI(sig00000073),
    .LI(sig0000007f),
    .O(p[17])
  );
  MUXCY   blk00000039 (
    .CI(sig00000073),
    .DI(sig00000006),
    .S(sig0000007f),
    .O(sig00000074)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000003a (
    .I0(sig00000006),
    .I1(sig00000012),
    .O(sig0000007f)
  );
  XORCY   blk0000003b (
    .CI(sig00000072),
    .LI(sig0000007e),
    .O(p[16])
  );
  MUXCY   blk0000003c (
    .CI(sig00000072),
    .DI(sig00000005),
    .S(sig0000007e),
    .O(sig00000073)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000003d (
    .I0(sig00000005),
    .I1(sig00000011),
    .O(sig0000007e)
  );
  XORCY   blk0000003e (
    .CI(sig00000071),
    .LI(sig0000007d),
    .O(p[15])
  );
  MUXCY   blk0000003f (
    .CI(sig00000071),
    .DI(sig00000004),
    .S(sig0000007d),
    .O(sig00000072)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000040 (
    .I0(sig00000004),
    .I1(sig00000045),
    .O(sig0000007d)
  );
  XORCY   blk00000041 (
    .CI(sig00000070),
    .LI(sig0000007c),
    .O(p[14])
  );
  MUXCY   blk00000042 (
    .CI(sig00000070),
    .DI(sig00000003),
    .S(sig0000007c),
    .O(sig00000071)
  );
  XORCY   blk00000043 (
    .CI(sig00000061),
    .LI(sig0000007b),
    .O(p[13])
  );
  MUXCY   blk00000044 (
    .CI(sig00000061),
    .DI(sig0000000a),
    .S(sig0000007b),
    .O(sig00000070)
  );
  XORCY   blk00000045 (
    .CI(NlwRenamedSig_OI_N0),
    .LI(sig0000007a),
    .O(p[12])
  );
  MUXCY   blk00000046 (
    .CI(NlwRenamedSig_OI_N0),
    .DI(sig00000009),
    .S(sig0000007a),
    .O(sig00000061)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000047 (
    .I0(sig00000009),
    .I1(a[8]),
    .O(sig0000007a)
  );
  XORCY   blk00000048 (
    .CI(sig00000029),
    .LI(sig0000003c),
    .O(sig00000008)
  );
  MUXCY   blk00000049 (
    .CI(sig00000029),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig0000003c),
    .O(sig0000002a)
  );
  XORCY   blk0000004a (
    .CI(sig00000033),
    .LI(sig00000043),
    .O(sig00000007)
  );
  MUXCY   blk0000004b (
    .CI(sig00000033),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000043),
    .O(sig00000029)
  );
  XORCY   blk0000004c (
    .CI(sig00000032),
    .LI(sig00000042),
    .O(sig00000006)
  );
  MUXCY   blk0000004d (
    .CI(sig00000032),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000042),
    .O(sig00000033)
  );
  XORCY   blk0000004e (
    .CI(sig00000031),
    .LI(sig00000041),
    .O(sig00000005)
  );
  MUXCY   blk0000004f (
    .CI(sig00000031),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000041),
    .O(sig00000032)
  );
  XORCY   blk00000050 (
    .CI(sig00000030),
    .LI(sig0000003b),
    .O(sig00000004)
  );
  MUXCY   blk00000051 (
    .CI(sig00000030),
    .DI(sig00000020),
    .S(sig0000003b),
    .O(sig00000031)
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  blk00000052 (
    .I0(a[2]),
    .I1(sig00000040),
    .I2(a[3]),
    .O(sig0000003b)
  );
  MULT_AND   blk00000053 (
    .I0(a[2]),
    .I1(a[3]),
    .LO(sig00000020)
  );
  XORCY   blk00000054 (
    .CI(sig0000002f),
    .LI(sig0000003a),
    .O(sig00000003)
  );
  MUXCY   blk00000055 (
    .CI(sig0000002f),
    .DI(sig00000027),
    .S(sig0000003a),
    .O(sig00000030)
  );
  XORCY   blk00000056 (
    .CI(sig0000002e),
    .LI(sig00000039),
    .O(sig0000000a)
  );
  MUXCY   blk00000057 (
    .CI(sig0000002e),
    .DI(sig00000026),
    .S(sig00000039),
    .O(sig0000002f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000058 (
    .I0(sig00000026),
    .I1(sig0000003f),
    .O(sig00000039)
  );
  XORCY   blk00000059 (
    .CI(sig0000002d),
    .LI(sig00000038),
    .O(sig00000009)
  );
  MUXCY   blk0000005a (
    .CI(sig0000002d),
    .DI(sig00000025),
    .S(sig00000038),
    .O(sig0000002e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000005b (
    .I0(sig00000025),
    .I1(sig0000003e),
    .O(sig00000038)
  );
  XORCY   blk0000005c (
    .CI(sig0000002c),
    .LI(sig00000037),
    .O(p[11])
  );
  MUXCY   blk0000005d (
    .CI(sig0000002c),
    .DI(sig00000024),
    .S(sig00000037),
    .O(sig0000002d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000005e (
    .I0(sig00000024),
    .I1(sig0000003d),
    .O(sig00000037)
  );
  XORCY   blk0000005f (
    .CI(sig0000002b),
    .LI(sig00000036),
    .O(p[10])
  );
  MUXCY   blk00000060 (
    .CI(sig0000002b),
    .DI(sig00000023),
    .S(sig00000036),
    .O(sig0000002c)
  );
  XORCY   blk00000061 (
    .CI(sig00000028),
    .LI(sig00000035),
    .O(p[9])
  );
  MUXCY   blk00000062 (
    .CI(sig00000028),
    .DI(sig00000022),
    .S(sig00000035),
    .O(sig0000002b)
  );
  XORCY   blk00000063 (
    .CI(NlwRenamedSig_OI_N0),
    .LI(sig00000034),
    .O(p[8])
  );
  MUXCY   blk00000064 (
    .CI(NlwRenamedSig_OI_N0),
    .DI(a[4]),
    .S(sig00000034),
    .O(sig00000028)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000065 (
    .I0(sig00000021),
    .I1(a[4]),
    .O(sig00000034)
  );
  XORCY   blk00000066 (
    .CI(sig0000004e),
    .LI(sig00000083),
    .O(sig00000010)
  );
  MUXCY   blk00000067 (
    .CI(sig0000004e),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000083),
    .O(sig0000004f)
  );
  XORCY   blk00000068 (
    .CI(sig00000058),
    .LI(sig0000008a),
    .O(sig0000000f)
  );
  MUXCY   blk00000069 (
    .CI(sig00000058),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig0000008a),
    .O(sig0000004e)
  );
  XORCY   blk0000006a (
    .CI(sig00000057),
    .LI(sig00000089),
    .O(sig0000000e)
  );
  MUXCY   blk0000006b (
    .CI(sig00000057),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000089),
    .O(sig00000058)
  );
  XORCY   blk0000006c (
    .CI(sig00000056),
    .LI(sig00000088),
    .O(sig0000000d)
  );
  MUXCY   blk0000006d (
    .CI(sig00000056),
    .DI(NlwRenamedSig_OI_N0),
    .S(sig00000088),
    .O(sig00000057)
  );
  XORCY   blk0000006e (
    .CI(sig00000055),
    .LI(sig00000060),
    .O(sig0000000c)
  );
  MUXCY   blk0000006f (
    .CI(sig00000055),
    .DI(sig00000044),
    .S(sig00000060),
    .O(sig00000056)
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  blk00000070 (
    .I0(a[10]),
    .I1(sig00000087),
    .I2(a[11]),
    .O(sig00000060)
  );
  MULT_AND   blk00000071 (
    .I0(a[10]),
    .I1(a[11]),
    .LO(sig00000044)
  );
  XORCY   blk00000072 (
    .CI(sig00000054),
    .LI(sig0000005f),
    .O(sig0000000b)
  );
  MUXCY   blk00000073 (
    .CI(sig00000054),
    .DI(sig0000004c),
    .S(sig0000005f),
    .O(sig00000055)
  );
  XORCY   blk00000074 (
    .CI(sig00000053),
    .LI(sig0000005e),
    .O(sig00000016)
  );
  MUXCY   blk00000075 (
    .CI(sig00000053),
    .DI(sig0000004b),
    .S(sig0000005e),
    .O(sig00000054)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000076 (
    .I0(sig0000004b),
    .I1(sig00000086),
    .O(sig0000005e)
  );
  XORCY   blk00000077 (
    .CI(sig00000052),
    .LI(sig0000005d),
    .O(sig00000015)
  );
  MUXCY   blk00000078 (
    .CI(sig00000052),
    .DI(sig0000004a),
    .S(sig0000005d),
    .O(sig00000053)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000079 (
    .I0(sig0000004a),
    .I1(sig00000085),
    .O(sig0000005d)
  );
  XORCY   blk0000007a (
    .CI(sig00000051),
    .LI(sig0000005c),
    .O(sig00000014)
  );
  MUXCY   blk0000007b (
    .CI(sig00000051),
    .DI(sig00000049),
    .S(sig0000005c),
    .O(sig00000052)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000007c (
    .I0(sig00000049),
    .I1(sig00000084),
    .O(sig0000005c)
  );
  XORCY   blk0000007d (
    .CI(sig00000050),
    .LI(sig0000005b),
    .O(sig00000013)
  );
  MUXCY   blk0000007e (
    .CI(sig00000050),
    .DI(sig00000048),
    .S(sig0000005b),
    .O(sig00000051)
  );
  XORCY   blk0000007f (
    .CI(sig0000004d),
    .LI(sig0000005a),
    .O(sig00000012)
  );
  MUXCY   blk00000080 (
    .CI(sig0000004d),
    .DI(sig00000047),
    .S(sig0000005a),
    .O(sig00000050)
  );
  XORCY   blk00000081 (
    .CI(NlwRenamedSig_OI_N0),
    .LI(sig00000059),
    .O(sig00000011)
  );
  MUXCY   blk00000082 (
    .CI(NlwRenamedSig_OI_N0),
    .DI(a[12]),
    .S(sig00000059),
    .O(sig0000004d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000083 (
    .I0(sig00000046),
    .I1(a[12]),
    .O(sig00000059)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000084 (
    .I0(a[1]),
    .I1(NlwRenamedSignal_a[0]),
    .O(p[5])
  );
  LUT3 #(
    .INIT ( 8'h56 ))
  blk00000085 (
    .I0(a[2]),
    .I1(a[1]),
    .I2(NlwRenamedSignal_a[0]),
    .O(p[6])
  );
  LUT4 #(
    .INIT ( 16'h5556 ))
  blk00000086 (
    .I0(a[3]),
    .I1(NlwRenamedSignal_a[0]),
    .I2(a[1]),
    .I3(a[2]),
    .O(p[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk00000087 (
    .I0(a[16]),
    .I1(a[17]),
    .O(sig0000008d)
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  blk00000088 (
    .I0(a[16]),
    .I1(a[17]),
    .O(sig0000008c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000089 (
    .I0(a[16]),
    .I1(a[17]),
    .O(sig0000008b)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk0000008a (
    .I0(a[14]),
    .I1(a[15]),
    .O(sig00000083)
  );
  LUT3 #(
    .INIT ( 8'h62 ))
  blk0000008b (
    .I0(a[15]),
    .I1(a[14]),
    .I2(a[13]),
    .O(sig0000008a)
  );
  LUT4 #(
    .INIT ( 16'h5556 ))
  blk0000008c (
    .I0(a[11]),
    .I1(a[10]),
    .I2(a[9]),
    .I3(a[8]),
    .O(sig00000045)
  );
  LUT4 #(
    .INIT ( 16'h9E18 ))
  blk0000008d (
    .I0(a[13]),
    .I1(a[15]),
    .I2(a[14]),
    .I3(a[12]),
    .O(sig00000089)
  );
  LUT4 #(
    .INIT ( 16'h4294 ))
  blk0000008e (
    .I0(a[12]),
    .I1(a[13]),
    .I2(a[15]),
    .I3(a[14]),
    .O(sig00000088)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk0000008f (
    .I0(a[6]),
    .I1(a[7]),
    .O(sig0000003c)
  );
  LUT4 #(
    .INIT ( 16'h69C2 ))
  blk00000090 (
    .I0(a[12]),
    .I1(a[13]),
    .I2(a[15]),
    .I3(a[14]),
    .O(sig00000087)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk00000091 (
    .I0(a[13]),
    .I1(a[15]),
    .I2(a[14]),
    .I3(a[12]),
    .O(sig00000086)
  );
  LUT3 #(
    .INIT ( 8'h62 ))
  blk00000092 (
    .I0(a[11]),
    .I1(a[10]),
    .I2(a[9]),
    .O(sig0000004c)
  );
  LUT4 #(
    .INIT ( 16'h9E18 ))
  blk00000093 (
    .I0(a[9]),
    .I1(a[11]),
    .I2(a[10]),
    .I3(a[8]),
    .O(sig0000004b)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk00000094 (
    .I0(a[12]),
    .I1(a[15]),
    .I2(a[14]),
    .I3(a[13]),
    .O(sig00000085)
  );
  LUT4 #(
    .INIT ( 16'h4294 ))
  blk00000095 (
    .I0(a[10]),
    .I1(a[9]),
    .I2(a[11]),
    .I3(a[8]),
    .O(sig0000004a)
  );
  LUT3 #(
    .INIT ( 8'h62 ))
  blk00000096 (
    .I0(a[7]),
    .I1(a[6]),
    .I2(a[5]),
    .O(sig00000043)
  );
  LUT4 #(
    .INIT ( 16'h9E18 ))
  blk00000097 (
    .I0(a[5]),
    .I1(a[7]),
    .I2(a[6]),
    .I3(a[4]),
    .O(sig00000042)
  );
  LUT4 #(
    .INIT ( 16'h4294 ))
  blk00000098 (
    .I0(a[4]),
    .I1(a[7]),
    .I2(a[5]),
    .I3(a[6]),
    .O(sig00000041)
  );
  LUT4 #(
    .INIT ( 16'h5556 ))
  blk00000099 (
    .I0(a[15]),
    .I1(a[13]),
    .I2(a[14]),
    .I3(a[12]),
    .O(sig00000084)
  );
  LUT4 #(
    .INIT ( 16'h69C2 ))
  blk0000009a (
    .I0(a[8]),
    .I1(a[9]),
    .I2(a[11]),
    .I3(a[10]),
    .O(sig00000049)
  );
  LUT4 #(
    .INIT ( 16'h9998 ))
  blk0000009b (
    .I0(a[10]),
    .I1(a[8]),
    .I2(a[11]),
    .I3(a[9]),
    .O(sig00000048)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk0000009c (
    .I0(a[9]),
    .I1(a[10]),
    .I2(a[11]),
    .I3(a[8]),
    .O(sig00000047)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk0000009d (
    .I0(a[8]),
    .I1(a[10]),
    .I2(a[11]),
    .I3(a[9]),
    .O(sig00000046)
  );
  LUT4 #(
    .INIT ( 16'h69C2 ))
  blk0000009e (
    .I0(a[4]),
    .I1(a[5]),
    .I2(a[7]),
    .I3(a[6]),
    .O(sig00000040)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk0000009f (
    .I0(a[5]),
    .I1(a[4]),
    .I2(a[6]),
    .I3(a[7]),
    .O(sig0000003f)
  );
  LUT3 #(
    .INIT ( 8'h62 ))
  blk000000a0 (
    .I0(a[3]),
    .I1(a[2]),
    .I2(a[1]),
    .O(sig00000027)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000a1 (
    .I0(a[4]),
    .I1(a[5]),
    .I2(a[6]),
    .I3(a[7]),
    .O(sig0000003e)
  );
  LUT4 #(
    .INIT ( 16'h9E18 ))
  blk000000a2 (
    .I0(a[1]),
    .I1(a[3]),
    .I2(a[2]),
    .I3(NlwRenamedSignal_a[0]),
    .O(sig00000026)
  );
  LUT4 #(
    .INIT ( 16'h5556 ))
  blk000000a3 (
    .I0(a[7]),
    .I1(a[5]),
    .I2(a[6]),
    .I3(a[4]),
    .O(sig0000003d)
  );
  LUT4 #(
    .INIT ( 16'h4294 ))
  blk000000a4 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(a[3]),
    .I2(a[1]),
    .I3(a[2]),
    .O(sig00000025)
  );
  LUT4 #(
    .INIT ( 16'h69C2 ))
  blk000000a5 (
    .I0(a[2]),
    .I1(a[3]),
    .I2(a[1]),
    .I3(NlwRenamedSignal_a[0]),
    .O(sig00000024)
  );
  LUT4 #(
    .INIT ( 16'h9998 ))
  blk000000a6 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(a[2]),
    .I2(a[1]),
    .I3(a[3]),
    .O(sig00000023)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000a7 (
    .I0(a[1]),
    .I1(NlwRenamedSignal_a[0]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig00000022)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk000000a8 (
    .I0(NlwRenamedSignal_a[0]),
    .I1(a[1]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig00000021)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk000000a9 (
    .I0(sig0000004f),
    .O(sig0000006f)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk000000aa (
    .I0(sig00000010),
    .O(sig0000006d)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk000000ab (
    .I0(sig0000000f),
    .O(sig0000006b)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk000000ac (
    .I0(sig0000000e),
    .O(sig00000069)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk000000ad (
    .I0(sig0000000d),
    .O(sig00000067)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk000000ae (
    .I0(sig0000000c),
    .O(sig00000065)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk000000af (
    .I0(sig0000000b),
    .O(sig00000063)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk000000b0 (
    .I0(sig00000016),
    .O(sig00000079)
  );
  LUT4 #(
    .INIT ( 16'h9996 ))
  blk000000b1 (
    .I0(sig00000003),
    .I1(a[10]),
    .I2(a[8]),
    .I3(a[9]),
    .O(sig0000007c)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk000000b2 (
    .I0(sig0000000a),
    .I1(a[9]),
    .I2(a[8]),
    .O(sig0000007b)
  );
  LUT4 #(
    .INIT ( 16'h9996 ))
  blk000000b3 (
    .I0(sig00000023),
    .I1(a[6]),
    .I2(a[5]),
    .I3(a[4]),
    .O(sig00000036)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk000000b4 (
    .I0(sig00000022),
    .I1(a[4]),
    .I2(a[5]),
    .O(sig00000035)
  );
  LUT4 #(
    .INIT ( 16'h9996 ))
  blk000000b5 (
    .I0(sig00000048),
    .I1(a[14]),
    .I2(a[13]),
    .I3(a[12]),
    .O(sig0000005b)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk000000b6 (
    .I0(sig00000047),
    .I1(a[12]),
    .I2(a[13]),
    .O(sig0000005a)
  );
  LUT4 #(
    .INIT ( 16'h55AB ))
  blk000000b7 (
    .I0(a[4]),
    .I1(a[5]),
    .I2(a[7]),
    .I3(a[6]),
    .O(sig00000001)
  );
  LUT4 #(
    .INIT ( 16'h6399 ))
  blk000000b8 (
    .I0(a[3]),
    .I1(sig00000001),
    .I2(a[1]),
    .I3(a[2]),
    .O(sig0000003a)
  );
  LUT4 #(
    .INIT ( 16'h55AB ))
  blk000000b9 (
    .I0(a[12]),
    .I1(a[13]),
    .I2(a[15]),
    .I3(a[14]),
    .O(sig00000002)
  );
  LUT4 #(
    .INIT ( 16'h6399 ))
  blk000000ba (
    .I0(a[11]),
    .I1(sig00000002),
    .I2(a[9]),
    .I3(a[10]),
    .O(sig0000005f)
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
