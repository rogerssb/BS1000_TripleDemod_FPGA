////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.87xd
//  \   \         Application: netgen
//  /   /         Filename: mult10L.v
// /___/   /\     Timestamp: Sat Oct 20 10:08:45 2012
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog E:/work/semco/r6060/fpga/demod_repos/cma_fpga1/coregen/tmp/_cg/mult10L.ngc E:/work/semco/r6060/fpga/demod_repos/cma_fpga1/coregen/tmp/_cg/mult10L.v 
// Device	: 3sd3400acs484-5
// Input file	: E:/work/semco/r6060/fpga/demod_repos/cma_fpga1/coregen/tmp/_cg/mult10L.ngc
// Output file	: E:/work/semco/r6060/fpga/demod_repos/cma_fpga1/coregen/tmp/_cg/mult10L.v
// # of Modules	: 1
// Design Name	: mult10L
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

module mult10L (
p, a, b
)/* synthesis syn_black_box syn_noprune=1 */;
  output [19 : 0] p;
  input [9 : 0] a;
  input [9 : 0] b;
  
  // synthesis translate_off
  
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
  wire sig000000f7;
  wire sig000000f8;
  wire sig000000f9;
  wire sig000000fa;
  wire sig000000fb;
  wire sig000000fc;
  wire sig000000fd;
  wire sig000000fe;
  wire sig000000ff;
  wire sig00000100;
  wire sig00000101;
  wire sig00000102;
  wire sig00000103;
  wire sig00000104;
  wire sig00000105;
  wire sig00000106;
  wire sig00000107;
  wire sig00000108;
  wire sig00000109;
  wire sig0000010a;
  wire sig0000010b;
  wire sig0000010c;
  wire sig0000010d;
  wire sig0000010e;
  wire sig0000010f;
  wire sig00000110;
  wire sig00000111;
  wire sig00000112;
  wire sig00000113;
  wire sig00000114;
  wire sig00000115;
  wire sig00000116;
  wire sig00000117;
  wire sig00000118;
  wire sig00000119;
  wire sig0000011a;
  wire sig0000011b;
  wire sig0000011c;
  wire sig0000011d;
  wire sig0000011e;
  wire sig0000011f;
  wire sig00000120;
  wire sig00000121;
  wire sig00000122;
  wire sig00000123;
  wire sig00000124;
  wire sig00000125;
  wire sig00000126;
  wire sig00000127;
  wire sig00000128;
  wire sig00000129;
  wire sig0000012a;
  wire sig0000012b;
  wire sig0000012c;
  wire sig0000012d;
  wire sig0000012e;
  wire sig0000012f;
  wire sig00000130;
  wire sig00000131;
  wire sig00000132;
  wire sig00000133;
  wire sig00000134;
  wire sig00000135;
  wire sig00000136;
  wire sig00000137;
  wire sig00000138;
  wire sig00000139;
  wire sig0000013a;
  wire sig0000013b;
  wire sig0000013c;
  wire sig0000013d;
  wire sig0000013e;
  wire sig0000013f;
  wire sig00000140;
  wire sig00000141;
  wire sig00000142;
  wire sig00000143;
  wire sig00000144;
  wire sig00000145;
  wire sig00000146;
  wire sig00000147;
  wire sig00000148;
  wire sig00000149;
  wire sig0000014a;
  wire sig0000014b;
  wire sig0000014c;
  wire sig0000014d;
  wire sig0000014e;
  wire sig0000014f;
  wire sig00000150;
  wire sig00000151;
  wire sig00000152;
  wire sig00000153;
  wire sig00000154;
  wire sig00000155;
  wire sig00000156;
  wire sig00000157;
  wire sig00000158;
  wire sig00000159;
  wire sig0000015a;
  wire sig0000015b;
  wire sig0000015c;
  wire sig0000015d;
  wire sig0000015e;
  wire sig0000015f;
  wire sig00000160;
  wire sig00000161;
  wire sig00000162;
  wire sig00000163;
  wire sig00000164;
  wire sig00000165;
  wire sig00000166;
  wire sig00000167;
  wire sig00000168;
  wire sig00000169;
  GND   blk00000001 (
    .G(sig00000001)
  );
  VCC   blk00000002 (
    .P(sig00000002)
  );
  XORCY   blk00000003 (
    .CI(sig00000105),
    .LI(sig0000009c),
    .O(sig0000013f)
  );
  XORCY   blk00000004 (
    .CI(sig0000010e),
    .LI(sig0000009d),
    .O(sig0000013e)
  );
  MUXCY   blk00000005 (
    .CI(sig0000010e),
    .DI(sig000000d3),
    .S(sig0000009d),
    .O(sig00000105)
  );
  MULT_AND   blk00000006 (
    .I0(b[8]),
    .I1(a[9]),
    .LO(sig000000d3)
  );
  XORCY   blk00000007 (
    .CI(sig0000010d),
    .LI(sig0000009b),
    .O(sig00000148)
  );
  MUXCY   blk00000008 (
    .CI(sig0000010d),
    .DI(sig000000d2),
    .S(sig0000009b),
    .O(sig0000010e)
  );
  MULT_AND   blk00000009 (
    .I0(b[8]),
    .I1(a[9]),
    .LO(sig000000d2)
  );
  XORCY   blk0000000a (
    .CI(sig0000010c),
    .LI(sig0000009a),
    .O(sig00000147)
  );
  MUXCY   blk0000000b (
    .CI(sig0000010c),
    .DI(sig000000d1),
    .S(sig0000009a),
    .O(sig0000010d)
  );
  MULT_AND   blk0000000c (
    .I0(b[8]),
    .I1(a[8]),
    .LO(sig000000d1)
  );
  XORCY   blk0000000d (
    .CI(sig0000010b),
    .LI(sig00000099),
    .O(sig00000146)
  );
  MUXCY   blk0000000e (
    .CI(sig0000010b),
    .DI(sig000000d0),
    .S(sig00000099),
    .O(sig0000010c)
  );
  MULT_AND   blk0000000f (
    .I0(b[8]),
    .I1(a[7]),
    .LO(sig000000d0)
  );
  XORCY   blk00000010 (
    .CI(sig0000010a),
    .LI(sig00000098),
    .O(sig00000145)
  );
  MUXCY   blk00000011 (
    .CI(sig0000010a),
    .DI(sig000000ce),
    .S(sig00000098),
    .O(sig0000010b)
  );
  MULT_AND   blk00000012 (
    .I0(b[8]),
    .I1(a[6]),
    .LO(sig000000ce)
  );
  XORCY   blk00000013 (
    .CI(sig00000109),
    .LI(sig00000097),
    .O(sig00000144)
  );
  MUXCY   blk00000014 (
    .CI(sig00000109),
    .DI(sig000000cd),
    .S(sig00000097),
    .O(sig0000010a)
  );
  MULT_AND   blk00000015 (
    .I0(b[8]),
    .I1(a[5]),
    .LO(sig000000cd)
  );
  XORCY   blk00000016 (
    .CI(sig00000108),
    .LI(sig00000096),
    .O(sig00000143)
  );
  MUXCY   blk00000017 (
    .CI(sig00000108),
    .DI(sig000000cc),
    .S(sig00000096),
    .O(sig00000109)
  );
  MULT_AND   blk00000018 (
    .I0(b[8]),
    .I1(a[4]),
    .LO(sig000000cc)
  );
  XORCY   blk00000019 (
    .CI(sig00000107),
    .LI(sig00000095),
    .O(sig00000142)
  );
  MUXCY   blk0000001a (
    .CI(sig00000107),
    .DI(sig000000cb),
    .S(sig00000095),
    .O(sig00000108)
  );
  MULT_AND   blk0000001b (
    .I0(b[8]),
    .I1(a[3]),
    .LO(sig000000cb)
  );
  XORCY   blk0000001c (
    .CI(sig00000106),
    .LI(sig00000093),
    .O(sig00000141)
  );
  MUXCY   blk0000001d (
    .CI(sig00000106),
    .DI(sig000000ca),
    .S(sig00000093),
    .O(sig00000107)
  );
  MULT_AND   blk0000001e (
    .I0(b[8]),
    .I1(a[2]),
    .LO(sig000000ca)
  );
  XORCY   blk0000001f (
    .CI(sig00000104),
    .LI(sig00000092),
    .O(sig00000140)
  );
  MUXCY   blk00000020 (
    .CI(sig00000104),
    .DI(sig000000c9),
    .S(sig00000092),
    .O(sig00000106)
  );
  MULT_AND   blk00000021 (
    .I0(b[8]),
    .I1(a[1]),
    .LO(sig000000c9)
  );
  XORCY   blk00000022 (
    .CI(sig00000002),
    .LI(sig00000091),
    .O(sig0000013d)
  );
  MUXCY   blk00000023 (
    .CI(sig00000002),
    .DI(sig000000c8),
    .S(sig00000091),
    .O(sig00000104)
  );
  MULT_AND   blk00000024 (
    .I0(b[8]),
    .I1(a[0]),
    .LO(sig000000c8)
  );
  XORCY   blk00000025 (
    .CI(sig000000fa),
    .LI(sig0000008f),
    .O(sig00000133)
  );
  XORCY   blk00000026 (
    .CI(sig00000103),
    .LI(sig00000090),
    .O(sig00000132)
  );
  MUXCY   blk00000027 (
    .CI(sig00000103),
    .DI(sig000000c7),
    .S(sig00000090),
    .O(sig000000fa)
  );
  MULT_AND   blk00000028 (
    .I0(b[7]),
    .I1(a[9]),
    .LO(sig000000c7)
  );
  XORCY   blk00000029 (
    .CI(sig00000102),
    .LI(sig0000008e),
    .O(sig0000013c)
  );
  MUXCY   blk0000002a (
    .CI(sig00000102),
    .DI(sig000000c6),
    .S(sig0000008e),
    .O(sig00000103)
  );
  MULT_AND   blk0000002b (
    .I0(b[7]),
    .I1(a[8]),
    .LO(sig000000c6)
  );
  XORCY   blk0000002c (
    .CI(sig00000101),
    .LI(sig0000008d),
    .O(sig0000013b)
  );
  MUXCY   blk0000002d (
    .CI(sig00000101),
    .DI(sig000000c5),
    .S(sig0000008d),
    .O(sig00000102)
  );
  MULT_AND   blk0000002e (
    .I0(b[7]),
    .I1(a[7]),
    .LO(sig000000c5)
  );
  XORCY   blk0000002f (
    .CI(sig00000100),
    .LI(sig0000008c),
    .O(sig0000013a)
  );
  MUXCY   blk00000030 (
    .CI(sig00000100),
    .DI(sig000000c3),
    .S(sig0000008c),
    .O(sig00000101)
  );
  MULT_AND   blk00000031 (
    .I0(b[7]),
    .I1(a[6]),
    .LO(sig000000c3)
  );
  XORCY   blk00000032 (
    .CI(sig000000ff),
    .LI(sig0000008b),
    .O(sig00000139)
  );
  MUXCY   blk00000033 (
    .CI(sig000000ff),
    .DI(sig000000c2),
    .S(sig0000008b),
    .O(sig00000100)
  );
  MULT_AND   blk00000034 (
    .I0(b[7]),
    .I1(a[5]),
    .LO(sig000000c2)
  );
  XORCY   blk00000035 (
    .CI(sig000000fe),
    .LI(sig0000008a),
    .O(sig00000138)
  );
  MUXCY   blk00000036 (
    .CI(sig000000fe),
    .DI(sig000000c1),
    .S(sig0000008a),
    .O(sig000000ff)
  );
  MULT_AND   blk00000037 (
    .I0(b[7]),
    .I1(a[4]),
    .LO(sig000000c1)
  );
  XORCY   blk00000038 (
    .CI(sig000000fd),
    .LI(sig00000088),
    .O(sig00000137)
  );
  MUXCY   blk00000039 (
    .CI(sig000000fd),
    .DI(sig000000c0),
    .S(sig00000088),
    .O(sig000000fe)
  );
  MULT_AND   blk0000003a (
    .I0(b[7]),
    .I1(a[3]),
    .LO(sig000000c0)
  );
  XORCY   blk0000003b (
    .CI(sig000000fc),
    .LI(sig00000087),
    .O(sig00000136)
  );
  MUXCY   blk0000003c (
    .CI(sig000000fc),
    .DI(sig000000bf),
    .S(sig00000087),
    .O(sig000000fd)
  );
  MULT_AND   blk0000003d (
    .I0(b[7]),
    .I1(a[2]),
    .LO(sig000000bf)
  );
  XORCY   blk0000003e (
    .CI(sig000000fb),
    .LI(sig00000086),
    .O(sig00000135)
  );
  MUXCY   blk0000003f (
    .CI(sig000000fb),
    .DI(sig000000be),
    .S(sig00000086),
    .O(sig000000fc)
  );
  MULT_AND   blk00000040 (
    .I0(b[7]),
    .I1(a[1]),
    .LO(sig000000be)
  );
  XORCY   blk00000041 (
    .CI(sig000000f9),
    .LI(sig00000085),
    .O(sig00000134)
  );
  MUXCY   blk00000042 (
    .CI(sig000000f9),
    .DI(sig000000bd),
    .S(sig00000085),
    .O(sig000000fb)
  );
  MULT_AND   blk00000043 (
    .I0(b[7]),
    .I1(a[0]),
    .LO(sig000000bd)
  );
  XORCY   blk00000044 (
    .CI(sig00000001),
    .LI(sig00000084),
    .O(sig00000131)
  );
  MUXCY   blk00000045 (
    .CI(sig00000001),
    .DI(sig000000bc),
    .S(sig00000084),
    .O(sig000000f9)
  );
  MULT_AND   blk00000046 (
    .I0(b[6]),
    .I1(a[0]),
    .LO(sig000000bc)
  );
  XORCY   blk00000047 (
    .CI(sig000000ef),
    .LI(sig00000082),
    .O(sig00000127)
  );
  XORCY   blk00000048 (
    .CI(sig000000f8),
    .LI(sig00000083),
    .O(sig00000126)
  );
  MUXCY   blk00000049 (
    .CI(sig000000f8),
    .DI(sig000000bb),
    .S(sig00000083),
    .O(sig000000ef)
  );
  MULT_AND   blk0000004a (
    .I0(b[5]),
    .I1(a[9]),
    .LO(sig000000bb)
  );
  XORCY   blk0000004b (
    .CI(sig000000f7),
    .LI(sig00000081),
    .O(sig00000130)
  );
  MUXCY   blk0000004c (
    .CI(sig000000f7),
    .DI(sig000000ba),
    .S(sig00000081),
    .O(sig000000f8)
  );
  MULT_AND   blk0000004d (
    .I0(b[5]),
    .I1(a[8]),
    .LO(sig000000ba)
  );
  XORCY   blk0000004e (
    .CI(sig000000f6),
    .LI(sig00000080),
    .O(sig0000012f)
  );
  MUXCY   blk0000004f (
    .CI(sig000000f6),
    .DI(sig000000b8),
    .S(sig00000080),
    .O(sig000000f7)
  );
  MULT_AND   blk00000050 (
    .I0(b[5]),
    .I1(a[7]),
    .LO(sig000000b8)
  );
  XORCY   blk00000051 (
    .CI(sig000000f5),
    .LI(sig0000007f),
    .O(sig0000012e)
  );
  MUXCY   blk00000052 (
    .CI(sig000000f5),
    .DI(sig000000b7),
    .S(sig0000007f),
    .O(sig000000f6)
  );
  MULT_AND   blk00000053 (
    .I0(b[5]),
    .I1(a[6]),
    .LO(sig000000b7)
  );
  XORCY   blk00000054 (
    .CI(sig000000f4),
    .LI(sig0000007d),
    .O(sig0000012d)
  );
  MUXCY   blk00000055 (
    .CI(sig000000f4),
    .DI(sig000000b6),
    .S(sig0000007d),
    .O(sig000000f5)
  );
  MULT_AND   blk00000056 (
    .I0(b[5]),
    .I1(a[5]),
    .LO(sig000000b6)
  );
  XORCY   blk00000057 (
    .CI(sig000000f3),
    .LI(sig0000007c),
    .O(sig0000012c)
  );
  MUXCY   blk00000058 (
    .CI(sig000000f3),
    .DI(sig000000b5),
    .S(sig0000007c),
    .O(sig000000f4)
  );
  MULT_AND   blk00000059 (
    .I0(b[5]),
    .I1(a[4]),
    .LO(sig000000b5)
  );
  XORCY   blk0000005a (
    .CI(sig000000f2),
    .LI(sig0000007b),
    .O(sig0000012b)
  );
  MUXCY   blk0000005b (
    .CI(sig000000f2),
    .DI(sig000000b4),
    .S(sig0000007b),
    .O(sig000000f3)
  );
  MULT_AND   blk0000005c (
    .I0(b[5]),
    .I1(a[3]),
    .LO(sig000000b4)
  );
  XORCY   blk0000005d (
    .CI(sig000000f1),
    .LI(sig0000007a),
    .O(sig0000012a)
  );
  MUXCY   blk0000005e (
    .CI(sig000000f1),
    .DI(sig000000b3),
    .S(sig0000007a),
    .O(sig000000f2)
  );
  MULT_AND   blk0000005f (
    .I0(b[5]),
    .I1(a[2]),
    .LO(sig000000b3)
  );
  XORCY   blk00000060 (
    .CI(sig000000f0),
    .LI(sig00000079),
    .O(sig00000129)
  );
  MUXCY   blk00000061 (
    .CI(sig000000f0),
    .DI(sig000000b2),
    .S(sig00000079),
    .O(sig000000f1)
  );
  MULT_AND   blk00000062 (
    .I0(b[5]),
    .I1(a[1]),
    .LO(sig000000b2)
  );
  XORCY   blk00000063 (
    .CI(sig000000ee),
    .LI(sig00000078),
    .O(sig00000128)
  );
  MUXCY   blk00000064 (
    .CI(sig000000ee),
    .DI(sig000000b1),
    .S(sig00000078),
    .O(sig000000f0)
  );
  MULT_AND   blk00000065 (
    .I0(b[5]),
    .I1(a[0]),
    .LO(sig000000b1)
  );
  XORCY   blk00000066 (
    .CI(sig00000001),
    .LI(sig00000077),
    .O(sig00000125)
  );
  MUXCY   blk00000067 (
    .CI(sig00000001),
    .DI(sig000000b0),
    .S(sig00000077),
    .O(sig000000ee)
  );
  MULT_AND   blk00000068 (
    .I0(b[4]),
    .I1(a[0]),
    .LO(sig000000b0)
  );
  XORCY   blk00000069 (
    .CI(sig000000e4),
    .LI(sig00000075),
    .O(sig0000011b)
  );
  XORCY   blk0000006a (
    .CI(sig000000ed),
    .LI(sig00000076),
    .O(sig0000011a)
  );
  MUXCY   blk0000006b (
    .CI(sig000000ed),
    .DI(sig000000af),
    .S(sig00000076),
    .O(sig000000e4)
  );
  MULT_AND   blk0000006c (
    .I0(b[3]),
    .I1(a[9]),
    .LO(sig000000af)
  );
  XORCY   blk0000006d (
    .CI(sig000000ec),
    .LI(sig00000074),
    .O(sig00000124)
  );
  MUXCY   blk0000006e (
    .CI(sig000000ec),
    .DI(sig000000ad),
    .S(sig00000074),
    .O(sig000000ed)
  );
  MULT_AND   blk0000006f (
    .I0(b[3]),
    .I1(a[8]),
    .LO(sig000000ad)
  );
  XORCY   blk00000070 (
    .CI(sig000000eb),
    .LI(sig00000072),
    .O(sig00000123)
  );
  MUXCY   blk00000071 (
    .CI(sig000000eb),
    .DI(sig000000ac),
    .S(sig00000072),
    .O(sig000000ec)
  );
  MULT_AND   blk00000072 (
    .I0(b[3]),
    .I1(a[7]),
    .LO(sig000000ac)
  );
  XORCY   blk00000073 (
    .CI(sig000000ea),
    .LI(sig00000071),
    .O(sig00000122)
  );
  MUXCY   blk00000074 (
    .CI(sig000000ea),
    .DI(sig000000ab),
    .S(sig00000071),
    .O(sig000000eb)
  );
  MULT_AND   blk00000075 (
    .I0(b[3]),
    .I1(a[6]),
    .LO(sig000000ab)
  );
  XORCY   blk00000076 (
    .CI(sig000000e9),
    .LI(sig00000070),
    .O(sig00000121)
  );
  MUXCY   blk00000077 (
    .CI(sig000000e9),
    .DI(sig000000aa),
    .S(sig00000070),
    .O(sig000000ea)
  );
  MULT_AND   blk00000078 (
    .I0(b[3]),
    .I1(a[5]),
    .LO(sig000000aa)
  );
  XORCY   blk00000079 (
    .CI(sig000000e8),
    .LI(sig0000006f),
    .O(sig00000120)
  );
  MUXCY   blk0000007a (
    .CI(sig000000e8),
    .DI(sig000000a9),
    .S(sig0000006f),
    .O(sig000000e9)
  );
  MULT_AND   blk0000007b (
    .I0(b[3]),
    .I1(a[4]),
    .LO(sig000000a9)
  );
  XORCY   blk0000007c (
    .CI(sig000000e7),
    .LI(sig0000006e),
    .O(sig0000011f)
  );
  MUXCY   blk0000007d (
    .CI(sig000000e7),
    .DI(sig000000a8),
    .S(sig0000006e),
    .O(sig000000e8)
  );
  MULT_AND   blk0000007e (
    .I0(b[3]),
    .I1(a[3]),
    .LO(sig000000a8)
  );
  XORCY   blk0000007f (
    .CI(sig000000e6),
    .LI(sig0000006d),
    .O(sig0000011e)
  );
  MUXCY   blk00000080 (
    .CI(sig000000e6),
    .DI(sig000000a7),
    .S(sig0000006d),
    .O(sig000000e7)
  );
  MULT_AND   blk00000081 (
    .I0(b[3]),
    .I1(a[2]),
    .LO(sig000000a7)
  );
  XORCY   blk00000082 (
    .CI(sig000000e5),
    .LI(sig0000006c),
    .O(sig0000011d)
  );
  MUXCY   blk00000083 (
    .CI(sig000000e5),
    .DI(sig000000a6),
    .S(sig0000006c),
    .O(sig000000e6)
  );
  MULT_AND   blk00000084 (
    .I0(b[3]),
    .I1(a[1]),
    .LO(sig000000a6)
  );
  XORCY   blk00000085 (
    .CI(sig000000e3),
    .LI(sig0000006b),
    .O(sig0000011c)
  );
  MUXCY   blk00000086 (
    .CI(sig000000e3),
    .DI(sig000000a5),
    .S(sig0000006b),
    .O(sig000000e5)
  );
  MULT_AND   blk00000087 (
    .I0(b[3]),
    .I1(a[0]),
    .LO(sig000000a5)
  );
  XORCY   blk00000088 (
    .CI(sig00000001),
    .LI(sig0000006a),
    .O(sig00000119)
  );
  MUXCY   blk00000089 (
    .CI(sig00000001),
    .DI(sig000000a4),
    .S(sig0000006a),
    .O(sig000000e3)
  );
  MULT_AND   blk0000008a (
    .I0(b[2]),
    .I1(a[0]),
    .LO(sig000000a4)
  );
  XORCY   blk0000008b (
    .CI(sig000000d9),
    .LI(sig00000068),
    .O(sig00000110)
  );
  XORCY   blk0000008c (
    .CI(sig000000e2),
    .LI(sig00000069),
    .O(sig0000010f)
  );
  MUXCY   blk0000008d (
    .CI(sig000000e2),
    .DI(sig000000d7),
    .S(sig00000069),
    .O(sig000000d9)
  );
  MULT_AND   blk0000008e (
    .I0(b[1]),
    .I1(a[9]),
    .LO(sig000000d7)
  );
  XORCY   blk0000008f (
    .CI(sig000000e1),
    .LI(sig000000a0),
    .O(sig00000118)
  );
  MUXCY   blk00000090 (
    .CI(sig000000e1),
    .DI(sig000000d6),
    .S(sig000000a0),
    .O(sig000000e2)
  );
  MULT_AND   blk00000091 (
    .I0(b[1]),
    .I1(a[8]),
    .LO(sig000000d6)
  );
  XORCY   blk00000092 (
    .CI(sig000000e0),
    .LI(sig0000009f),
    .O(sig00000117)
  );
  MUXCY   blk00000093 (
    .CI(sig000000e0),
    .DI(sig000000d5),
    .S(sig0000009f),
    .O(sig000000e1)
  );
  MULT_AND   blk00000094 (
    .I0(b[1]),
    .I1(a[7]),
    .LO(sig000000d5)
  );
  XORCY   blk00000095 (
    .CI(sig000000df),
    .LI(sig0000009e),
    .O(sig00000116)
  );
  MUXCY   blk00000096 (
    .CI(sig000000df),
    .DI(sig000000d4),
    .S(sig0000009e),
    .O(sig000000e0)
  );
  MULT_AND   blk00000097 (
    .I0(b[1]),
    .I1(a[6]),
    .LO(sig000000d4)
  );
  XORCY   blk00000098 (
    .CI(sig000000de),
    .LI(sig00000094),
    .O(sig00000115)
  );
  MUXCY   blk00000099 (
    .CI(sig000000de),
    .DI(sig000000cf),
    .S(sig00000094),
    .O(sig000000df)
  );
  MULT_AND   blk0000009a (
    .I0(b[1]),
    .I1(a[5]),
    .LO(sig000000cf)
  );
  XORCY   blk0000009b (
    .CI(sig000000dd),
    .LI(sig00000089),
    .O(sig00000114)
  );
  MUXCY   blk0000009c (
    .CI(sig000000dd),
    .DI(sig000000c4),
    .S(sig00000089),
    .O(sig000000de)
  );
  MULT_AND   blk0000009d (
    .I0(b[1]),
    .I1(a[4]),
    .LO(sig000000c4)
  );
  XORCY   blk0000009e (
    .CI(sig000000dc),
    .LI(sig0000007e),
    .O(sig00000113)
  );
  MUXCY   blk0000009f (
    .CI(sig000000dc),
    .DI(sig000000b9),
    .S(sig0000007e),
    .O(sig000000dd)
  );
  MULT_AND   blk000000a0 (
    .I0(b[1]),
    .I1(a[3]),
    .LO(sig000000b9)
  );
  XORCY   blk000000a1 (
    .CI(sig000000db),
    .LI(sig00000073),
    .O(sig00000112)
  );
  MUXCY   blk000000a2 (
    .CI(sig000000db),
    .DI(sig000000ae),
    .S(sig00000073),
    .O(sig000000dc)
  );
  MULT_AND   blk000000a3 (
    .I0(b[1]),
    .I1(a[2]),
    .LO(sig000000ae)
  );
  XORCY   blk000000a4 (
    .CI(sig000000da),
    .LI(sig00000067),
    .O(sig00000111)
  );
  MUXCY   blk000000a5 (
    .CI(sig000000da),
    .DI(sig000000a3),
    .S(sig00000067),
    .O(sig000000db)
  );
  MULT_AND   blk000000a6 (
    .I0(b[1]),
    .I1(a[1]),
    .LO(sig000000a3)
  );
  XORCY   blk000000a7 (
    .CI(sig000000d8),
    .LI(sig00000066),
    .O(p[1])
  );
  MUXCY   blk000000a8 (
    .CI(sig000000d8),
    .DI(sig000000a2),
    .S(sig00000066),
    .O(sig000000da)
  );
  MULT_AND   blk000000a9 (
    .I0(b[1]),
    .I1(a[0]),
    .LO(sig000000a2)
  );
  XORCY   blk000000aa (
    .CI(sig00000001),
    .LI(sig00000065),
    .O(p[0])
  );
  MUXCY   blk000000ab (
    .CI(sig00000001),
    .DI(sig000000a1),
    .S(sig00000065),
    .O(sig000000d8)
  );
  MULT_AND   blk000000ac (
    .I0(b[0]),
    .I1(a[0]),
    .LO(sig000000a1)
  );
  XORCY   blk000000ad (
    .CI(sig00000021),
    .LI(sig0000002d),
    .O(p[19])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ae (
    .I0(sig00000151),
    .I1(sig0000013f),
    .O(sig0000002d)
  );
  XORCY   blk000000af (
    .CI(sig0000002a),
    .LI(sig0000002c),
    .O(p[18])
  );
  MUXCY   blk000000b0 (
    .CI(sig0000002a),
    .DI(sig00000151),
    .S(sig0000002c),
    .O(sig00000021)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b1 (
    .I0(sig00000151),
    .I1(sig0000013e),
    .O(sig0000002c)
  );
  XORCY   blk000000b2 (
    .CI(sig00000029),
    .LI(sig00000036),
    .O(p[17])
  );
  MUXCY   blk000000b3 (
    .CI(sig00000029),
    .DI(sig00000150),
    .S(sig00000036),
    .O(sig0000002a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b4 (
    .I0(sig00000150),
    .I1(sig00000148),
    .O(sig00000036)
  );
  XORCY   blk000000b5 (
    .CI(sig00000028),
    .LI(sig00000035),
    .O(p[16])
  );
  MUXCY   blk000000b6 (
    .CI(sig00000028),
    .DI(sig0000014f),
    .S(sig00000035),
    .O(sig00000029)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b7 (
    .I0(sig0000014f),
    .I1(sig00000147),
    .O(sig00000035)
  );
  XORCY   blk000000b8 (
    .CI(sig00000027),
    .LI(sig00000034),
    .O(p[15])
  );
  MUXCY   blk000000b9 (
    .CI(sig00000027),
    .DI(sig0000014e),
    .S(sig00000034),
    .O(sig00000028)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ba (
    .I0(sig0000014e),
    .I1(sig00000146),
    .O(sig00000034)
  );
  XORCY   blk000000bb (
    .CI(sig00000026),
    .LI(sig00000033),
    .O(p[14])
  );
  MUXCY   blk000000bc (
    .CI(sig00000026),
    .DI(sig0000014d),
    .S(sig00000033),
    .O(sig00000027)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000bd (
    .I0(sig0000014d),
    .I1(sig00000145),
    .O(sig00000033)
  );
  XORCY   blk000000be (
    .CI(sig00000025),
    .LI(sig00000032),
    .O(p[13])
  );
  MUXCY   blk000000bf (
    .CI(sig00000025),
    .DI(sig0000014c),
    .S(sig00000032),
    .O(sig00000026)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c0 (
    .I0(sig0000014c),
    .I1(sig00000144),
    .O(sig00000032)
  );
  XORCY   blk000000c1 (
    .CI(sig00000024),
    .LI(sig00000031),
    .O(p[12])
  );
  MUXCY   blk000000c2 (
    .CI(sig00000024),
    .DI(sig0000014b),
    .S(sig00000031),
    .O(sig00000025)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c3 (
    .I0(sig0000014b),
    .I1(sig00000143),
    .O(sig00000031)
  );
  XORCY   blk000000c4 (
    .CI(sig00000023),
    .LI(sig00000030),
    .O(p[11])
  );
  MUXCY   blk000000c5 (
    .CI(sig00000023),
    .DI(sig0000014a),
    .S(sig00000030),
    .O(sig00000024)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c6 (
    .I0(sig0000014a),
    .I1(sig00000142),
    .O(sig00000030)
  );
  XORCY   blk000000c7 (
    .CI(sig00000022),
    .LI(sig0000002f),
    .O(p[10])
  );
  MUXCY   blk000000c8 (
    .CI(sig00000022),
    .DI(sig00000149),
    .S(sig0000002f),
    .O(sig00000023)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c9 (
    .I0(sig00000149),
    .I1(sig00000141),
    .O(sig0000002f)
  );
  XORCY   blk000000ca (
    .CI(sig00000020),
    .LI(sig0000002e),
    .O(p[9])
  );
  MUXCY   blk000000cb (
    .CI(sig00000020),
    .DI(sig00000153),
    .S(sig0000002e),
    .O(sig00000022)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000cc (
    .I0(sig00000153),
    .I1(sig00000140),
    .O(sig0000002e)
  );
  XORCY   blk000000cd (
    .CI(sig00000001),
    .LI(sig0000002b),
    .O(p[8])
  );
  MUXCY   blk000000ce (
    .CI(sig00000001),
    .DI(sig00000152),
    .S(sig0000002b),
    .O(sig00000020)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000cf (
    .I0(sig00000152),
    .I1(sig0000013d),
    .O(sig0000002b)
  );
  XORCY   blk000000d0 (
    .CI(sig00000007),
    .LI(sig00000016),
    .O(sig00000151)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000d1 (
    .I0(sig00000157),
    .I1(sig00000161),
    .O(sig00000016)
  );
  XORCY   blk000000d2 (
    .CI(sig00000006),
    .LI(sig00000015),
    .O(sig00000150)
  );
  MUXCY   blk000000d3 (
    .CI(sig00000006),
    .DI(sig00000157),
    .S(sig00000015),
    .O(sig00000007)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000d4 (
    .I0(sig00000157),
    .I1(sig00000161),
    .O(sig00000015)
  );
  XORCY   blk000000d5 (
    .CI(sig00000005),
    .LI(sig00000014),
    .O(sig0000014f)
  );
  MUXCY   blk000000d6 (
    .CI(sig00000005),
    .DI(sig00000157),
    .S(sig00000014),
    .O(sig00000006)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000d7 (
    .I0(sig00000157),
    .I1(sig00000160),
    .O(sig00000014)
  );
  XORCY   blk000000d8 (
    .CI(sig00000004),
    .LI(sig00000013),
    .O(sig0000014e)
  );
  MUXCY   blk000000d9 (
    .CI(sig00000004),
    .DI(sig00000157),
    .S(sig00000013),
    .O(sig00000005)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000da (
    .I0(sig00000157),
    .I1(sig0000015f),
    .O(sig00000013)
  );
  XORCY   blk000000db (
    .CI(sig00000010),
    .LI(sig00000012),
    .O(sig0000014d)
  );
  MUXCY   blk000000dc (
    .CI(sig00000010),
    .DI(sig00000157),
    .S(sig00000012),
    .O(sig00000004)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000dd (
    .I0(sig00000157),
    .I1(sig0000015e),
    .O(sig00000012)
  );
  XORCY   blk000000de (
    .CI(sig0000000f),
    .LI(sig0000001f),
    .O(sig0000014c)
  );
  MUXCY   blk000000df (
    .CI(sig0000000f),
    .DI(sig00000157),
    .S(sig0000001f),
    .O(sig00000010)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e0 (
    .I0(sig00000157),
    .I1(sig00000169),
    .O(sig0000001f)
  );
  XORCY   blk000000e1 (
    .CI(sig0000000e),
    .LI(sig0000001e),
    .O(sig0000014b)
  );
  MUXCY   blk000000e2 (
    .CI(sig0000000e),
    .DI(sig00000156),
    .S(sig0000001e),
    .O(sig0000000f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e3 (
    .I0(sig00000156),
    .I1(sig00000168),
    .O(sig0000001e)
  );
  XORCY   blk000000e4 (
    .CI(sig0000000d),
    .LI(sig0000001d),
    .O(sig0000014a)
  );
  MUXCY   blk000000e5 (
    .CI(sig0000000d),
    .DI(sig00000155),
    .S(sig0000001d),
    .O(sig0000000e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e6 (
    .I0(sig00000155),
    .I1(sig00000167),
    .O(sig0000001d)
  );
  XORCY   blk000000e7 (
    .CI(sig0000000c),
    .LI(sig0000001c),
    .O(sig00000149)
  );
  MUXCY   blk000000e8 (
    .CI(sig0000000c),
    .DI(sig00000154),
    .S(sig0000001c),
    .O(sig0000000d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e9 (
    .I0(sig00000154),
    .I1(sig00000166),
    .O(sig0000001c)
  );
  XORCY   blk000000ea (
    .CI(sig0000000b),
    .LI(sig0000001b),
    .O(sig00000153)
  );
  MUXCY   blk000000eb (
    .CI(sig0000000b),
    .DI(sig0000015d),
    .S(sig0000001b),
    .O(sig0000000c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ec (
    .I0(sig0000015d),
    .I1(sig00000165),
    .O(sig0000001b)
  );
  XORCY   blk000000ed (
    .CI(sig0000000a),
    .LI(sig0000001a),
    .O(sig00000152)
  );
  MUXCY   blk000000ee (
    .CI(sig0000000a),
    .DI(sig0000015c),
    .S(sig0000001a),
    .O(sig0000000b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ef (
    .I0(sig0000015c),
    .I1(sig00000164),
    .O(sig0000001a)
  );
  XORCY   blk000000f0 (
    .CI(sig00000009),
    .LI(sig00000019),
    .O(p[7])
  );
  MUXCY   blk000000f1 (
    .CI(sig00000009),
    .DI(sig0000015b),
    .S(sig00000019),
    .O(sig0000000a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f2 (
    .I0(sig0000015b),
    .I1(sig00000163),
    .O(sig00000019)
  );
  XORCY   blk000000f3 (
    .CI(sig00000008),
    .LI(sig00000018),
    .O(p[6])
  );
  MUXCY   blk000000f4 (
    .CI(sig00000008),
    .DI(sig0000015a),
    .S(sig00000018),
    .O(sig00000009)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f5 (
    .I0(sig0000015a),
    .I1(sig00000162),
    .O(sig00000018)
  );
  XORCY   blk000000f6 (
    .CI(sig00000003),
    .LI(sig00000017),
    .O(p[5])
  );
  MUXCY   blk000000f7 (
    .CI(sig00000003),
    .DI(sig00000159),
    .S(sig00000017),
    .O(sig00000008)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000f8 (
    .I0(sig00000159),
    .I1(sig00000128),
    .O(sig00000017)
  );
  XORCY   blk000000f9 (
    .CI(sig00000001),
    .LI(sig00000011),
    .O(p[4])
  );
  MUXCY   blk000000fa (
    .CI(sig00000001),
    .DI(sig00000158),
    .S(sig00000011),
    .O(sig00000003)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000fb (
    .I0(sig00000158),
    .I1(sig00000125),
    .O(sig00000011)
  );
  XORCY   blk000000fc (
    .CI(sig0000004f),
    .LI(sig0000005b),
    .O(sig00000161)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000fd (
    .I0(sig00000127),
    .I1(sig00000133),
    .O(sig0000005b)
  );
  XORCY   blk000000fe (
    .CI(sig00000058),
    .LI(sig0000005a),
    .O(sig00000160)
  );
  MUXCY   blk000000ff (
    .CI(sig00000058),
    .DI(sig00000127),
    .S(sig0000005a),
    .O(sig0000004f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000100 (
    .I0(sig00000127),
    .I1(sig00000132),
    .O(sig0000005a)
  );
  XORCY   blk00000101 (
    .CI(sig00000057),
    .LI(sig00000064),
    .O(sig0000015f)
  );
  MUXCY   blk00000102 (
    .CI(sig00000057),
    .DI(sig00000127),
    .S(sig00000064),
    .O(sig00000058)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000103 (
    .I0(sig00000127),
    .I1(sig0000013c),
    .O(sig00000064)
  );
  XORCY   blk00000104 (
    .CI(sig00000056),
    .LI(sig00000063),
    .O(sig0000015e)
  );
  MUXCY   blk00000105 (
    .CI(sig00000056),
    .DI(sig00000126),
    .S(sig00000063),
    .O(sig00000057)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000106 (
    .I0(sig00000126),
    .I1(sig0000013b),
    .O(sig00000063)
  );
  XORCY   blk00000107 (
    .CI(sig00000055),
    .LI(sig00000062),
    .O(sig00000169)
  );
  MUXCY   blk00000108 (
    .CI(sig00000055),
    .DI(sig00000130),
    .S(sig00000062),
    .O(sig00000056)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000109 (
    .I0(sig00000130),
    .I1(sig0000013a),
    .O(sig00000062)
  );
  XORCY   blk0000010a (
    .CI(sig00000054),
    .LI(sig00000061),
    .O(sig00000168)
  );
  MUXCY   blk0000010b (
    .CI(sig00000054),
    .DI(sig0000012f),
    .S(sig00000061),
    .O(sig00000055)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000010c (
    .I0(sig0000012f),
    .I1(sig00000139),
    .O(sig00000061)
  );
  XORCY   blk0000010d (
    .CI(sig00000053),
    .LI(sig00000060),
    .O(sig00000167)
  );
  MUXCY   blk0000010e (
    .CI(sig00000053),
    .DI(sig0000012e),
    .S(sig00000060),
    .O(sig00000054)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000010f (
    .I0(sig0000012e),
    .I1(sig00000138),
    .O(sig00000060)
  );
  XORCY   blk00000110 (
    .CI(sig00000052),
    .LI(sig0000005f),
    .O(sig00000166)
  );
  MUXCY   blk00000111 (
    .CI(sig00000052),
    .DI(sig0000012d),
    .S(sig0000005f),
    .O(sig00000053)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000112 (
    .I0(sig0000012d),
    .I1(sig00000137),
    .O(sig0000005f)
  );
  XORCY   blk00000113 (
    .CI(sig00000051),
    .LI(sig0000005e),
    .O(sig00000165)
  );
  MUXCY   blk00000114 (
    .CI(sig00000051),
    .DI(sig0000012c),
    .S(sig0000005e),
    .O(sig00000052)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000115 (
    .I0(sig0000012c),
    .I1(sig00000136),
    .O(sig0000005e)
  );
  XORCY   blk00000116 (
    .CI(sig00000050),
    .LI(sig0000005d),
    .O(sig00000164)
  );
  MUXCY   blk00000117 (
    .CI(sig00000050),
    .DI(sig0000012b),
    .S(sig0000005d),
    .O(sig00000051)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000118 (
    .I0(sig0000012b),
    .I1(sig00000135),
    .O(sig0000005d)
  );
  XORCY   blk00000119 (
    .CI(sig0000004e),
    .LI(sig0000005c),
    .O(sig00000163)
  );
  MUXCY   blk0000011a (
    .CI(sig0000004e),
    .DI(sig0000012a),
    .S(sig0000005c),
    .O(sig00000050)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000011b (
    .I0(sig0000012a),
    .I1(sig00000134),
    .O(sig0000005c)
  );
  XORCY   blk0000011c (
    .CI(sig00000001),
    .LI(sig00000059),
    .O(sig00000162)
  );
  MUXCY   blk0000011d (
    .CI(sig00000001),
    .DI(sig00000129),
    .S(sig00000059),
    .O(sig0000004e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000011e (
    .I0(sig00000129),
    .I1(sig00000131),
    .O(sig00000059)
  );
  XORCY   blk0000011f (
    .CI(sig00000038),
    .LI(sig00000044),
    .O(sig00000157)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000120 (
    .I0(sig00000110),
    .I1(sig0000011b),
    .O(sig00000044)
  );
  XORCY   blk00000121 (
    .CI(sig00000041),
    .LI(sig00000043),
    .O(sig00000156)
  );
  MUXCY   blk00000122 (
    .CI(sig00000041),
    .DI(sig00000110),
    .S(sig00000043),
    .O(sig00000038)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000123 (
    .I0(sig00000110),
    .I1(sig0000011a),
    .O(sig00000043)
  );
  XORCY   blk00000124 (
    .CI(sig00000040),
    .LI(sig0000004d),
    .O(sig00000155)
  );
  MUXCY   blk00000125 (
    .CI(sig00000040),
    .DI(sig00000110),
    .S(sig0000004d),
    .O(sig00000041)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000126 (
    .I0(sig00000110),
    .I1(sig00000124),
    .O(sig0000004d)
  );
  XORCY   blk00000127 (
    .CI(sig0000003f),
    .LI(sig0000004c),
    .O(sig00000154)
  );
  MUXCY   blk00000128 (
    .CI(sig0000003f),
    .DI(sig0000010f),
    .S(sig0000004c),
    .O(sig00000040)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000129 (
    .I0(sig0000010f),
    .I1(sig00000123),
    .O(sig0000004c)
  );
  XORCY   blk0000012a (
    .CI(sig0000003e),
    .LI(sig0000004b),
    .O(sig0000015d)
  );
  MUXCY   blk0000012b (
    .CI(sig0000003e),
    .DI(sig00000118),
    .S(sig0000004b),
    .O(sig0000003f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000012c (
    .I0(sig00000118),
    .I1(sig00000122),
    .O(sig0000004b)
  );
  XORCY   blk0000012d (
    .CI(sig0000003d),
    .LI(sig0000004a),
    .O(sig0000015c)
  );
  MUXCY   blk0000012e (
    .CI(sig0000003d),
    .DI(sig00000117),
    .S(sig0000004a),
    .O(sig0000003e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000012f (
    .I0(sig00000117),
    .I1(sig00000121),
    .O(sig0000004a)
  );
  XORCY   blk00000130 (
    .CI(sig0000003c),
    .LI(sig00000049),
    .O(sig0000015b)
  );
  MUXCY   blk00000131 (
    .CI(sig0000003c),
    .DI(sig00000116),
    .S(sig00000049),
    .O(sig0000003d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000132 (
    .I0(sig00000116),
    .I1(sig00000120),
    .O(sig00000049)
  );
  XORCY   blk00000133 (
    .CI(sig0000003b),
    .LI(sig00000048),
    .O(sig0000015a)
  );
  MUXCY   blk00000134 (
    .CI(sig0000003b),
    .DI(sig00000115),
    .S(sig00000048),
    .O(sig0000003c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000135 (
    .I0(sig00000115),
    .I1(sig0000011f),
    .O(sig00000048)
  );
  XORCY   blk00000136 (
    .CI(sig0000003a),
    .LI(sig00000047),
    .O(sig00000159)
  );
  MUXCY   blk00000137 (
    .CI(sig0000003a),
    .DI(sig00000114),
    .S(sig00000047),
    .O(sig0000003b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000138 (
    .I0(sig00000114),
    .I1(sig0000011e),
    .O(sig00000047)
  );
  XORCY   blk00000139 (
    .CI(sig00000039),
    .LI(sig00000046),
    .O(sig00000158)
  );
  MUXCY   blk0000013a (
    .CI(sig00000039),
    .DI(sig00000113),
    .S(sig00000046),
    .O(sig0000003a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000013b (
    .I0(sig00000113),
    .I1(sig0000011d),
    .O(sig00000046)
  );
  XORCY   blk0000013c (
    .CI(sig00000037),
    .LI(sig00000045),
    .O(p[3])
  );
  MUXCY   blk0000013d (
    .CI(sig00000037),
    .DI(sig00000112),
    .S(sig00000045),
    .O(sig00000039)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000013e (
    .I0(sig00000112),
    .I1(sig0000011c),
    .O(sig00000045)
  );
  XORCY   blk0000013f (
    .CI(sig00000001),
    .LI(sig00000042),
    .O(p[2])
  );
  MUXCY   blk00000140 (
    .CI(sig00000001),
    .DI(sig00000111),
    .S(sig00000042),
    .O(sig00000037)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000141 (
    .I0(sig00000111),
    .I1(sig00000119),
    .O(sig00000042)
  );
  LUT3 #(
    .INIT ( 8'h9F ))
  blk00000142 (
    .I0(b[9]),
    .I1(b[8]),
    .I2(a[9]),
    .O(sig0000009c)
  );
  LUT4 #(
    .INIT ( 16'h953F ))
  blk00000143 (
    .I0(a[9]),
    .I1(a[8]),
    .I2(b[9]),
    .I3(b[8]),
    .O(sig0000009b)
  );
  LUT4 #(
    .INIT ( 16'h953F ))
  blk00000144 (
    .I0(a[8]),
    .I1(a[7]),
    .I2(b[9]),
    .I3(b[8]),
    .O(sig0000009a)
  );
  LUT4 #(
    .INIT ( 16'h953F ))
  blk00000145 (
    .I0(a[7]),
    .I1(a[6]),
    .I2(b[9]),
    .I3(b[8]),
    .O(sig00000099)
  );
  LUT4 #(
    .INIT ( 16'h953F ))
  blk00000146 (
    .I0(a[6]),
    .I1(a[5]),
    .I2(b[9]),
    .I3(b[8]),
    .O(sig00000098)
  );
  LUT4 #(
    .INIT ( 16'h953F ))
  blk00000147 (
    .I0(a[5]),
    .I1(a[4]),
    .I2(b[9]),
    .I3(b[8]),
    .O(sig00000097)
  );
  LUT4 #(
    .INIT ( 16'h953F ))
  blk00000148 (
    .I0(a[4]),
    .I1(a[3]),
    .I2(b[9]),
    .I3(b[8]),
    .O(sig00000096)
  );
  LUT4 #(
    .INIT ( 16'h953F ))
  blk00000149 (
    .I0(a[3]),
    .I1(a[2]),
    .I2(b[9]),
    .I3(b[8]),
    .O(sig00000095)
  );
  LUT4 #(
    .INIT ( 16'h953F ))
  blk0000014a (
    .I0(a[2]),
    .I1(a[1]),
    .I2(b[9]),
    .I3(b[8]),
    .O(sig00000093)
  );
  LUT4 #(
    .INIT ( 16'h953F ))
  blk0000014b (
    .I0(a[1]),
    .I1(a[0]),
    .I2(b[9]),
    .I3(b[8]),
    .O(sig00000092)
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  blk0000014c (
    .I0(a[0]),
    .I1(b[8]),
    .O(sig00000091)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  blk0000014d (
    .I0(a[9]),
    .I1(b[6]),
    .I2(b[7]),
    .O(sig0000008f)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  blk0000014e (
    .I0(a[9]),
    .I1(b[2]),
    .I2(b[3]),
    .O(sig00000075)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk0000014f (
    .I0(a[8]),
    .I1(b[6]),
    .I2(a[9]),
    .I3(b[7]),
    .O(sig0000008e)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000150 (
    .I0(a[7]),
    .I1(b[6]),
    .I2(a[8]),
    .I3(b[7]),
    .O(sig0000008d)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  blk00000151 (
    .I0(a[9]),
    .I1(b[4]),
    .I2(b[5]),
    .O(sig00000082)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000152 (
    .I0(a[6]),
    .I1(b[6]),
    .I2(a[7]),
    .I3(b[7]),
    .O(sig0000008c)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000153 (
    .I0(a[8]),
    .I1(b[4]),
    .I2(a[9]),
    .I3(b[5]),
    .O(sig00000081)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000154 (
    .I0(a[5]),
    .I1(b[6]),
    .I2(a[6]),
    .I3(b[7]),
    .O(sig0000008b)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000155 (
    .I0(a[7]),
    .I1(b[4]),
    .I2(a[8]),
    .I3(b[5]),
    .O(sig00000080)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000156 (
    .I0(a[4]),
    .I1(b[6]),
    .I2(a[5]),
    .I3(b[7]),
    .O(sig0000008a)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000157 (
    .I0(a[6]),
    .I1(b[4]),
    .I2(a[7]),
    .I3(b[5]),
    .O(sig0000007f)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000158 (
    .I0(a[8]),
    .I1(b[2]),
    .I2(a[9]),
    .I3(b[3]),
    .O(sig00000074)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000159 (
    .I0(a[3]),
    .I1(b[6]),
    .I2(a[4]),
    .I3(b[7]),
    .O(sig00000088)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk0000015a (
    .I0(a[5]),
    .I1(b[4]),
    .I2(a[6]),
    .I3(b[5]),
    .O(sig0000007d)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk0000015b (
    .I0(a[7]),
    .I1(b[2]),
    .I2(a[8]),
    .I3(b[3]),
    .O(sig00000072)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk0000015c (
    .I0(a[2]),
    .I1(b[6]),
    .I2(a[3]),
    .I3(b[7]),
    .O(sig00000087)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  blk0000015d (
    .I0(a[9]),
    .I1(b[0]),
    .I2(b[1]),
    .O(sig00000068)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk0000015e (
    .I0(b[4]),
    .I1(b[5]),
    .I2(a[4]),
    .I3(a[5]),
    .O(sig0000007c)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk0000015f (
    .I0(b[2]),
    .I1(b[3]),
    .I2(a[6]),
    .I3(a[7]),
    .O(sig00000071)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000160 (
    .I0(b[6]),
    .I1(b[7]),
    .I2(a[1]),
    .I3(a[2]),
    .O(sig00000086)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000161 (
    .I0(b[0]),
    .I1(b[1]),
    .I2(a[8]),
    .I3(a[9]),
    .O(sig000000a0)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000162 (
    .I0(b[4]),
    .I1(b[5]),
    .I2(a[3]),
    .I3(a[4]),
    .O(sig0000007b)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000163 (
    .I0(b[2]),
    .I1(b[3]),
    .I2(a[5]),
    .I3(a[6]),
    .O(sig00000070)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000164 (
    .I0(b[6]),
    .I1(b[7]),
    .I2(a[0]),
    .I3(a[1]),
    .O(sig00000085)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000165 (
    .I0(b[0]),
    .I1(b[1]),
    .I2(a[7]),
    .I3(a[8]),
    .O(sig0000009f)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000166 (
    .I0(b[4]),
    .I1(b[5]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig0000007a)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000167 (
    .I0(b[2]),
    .I1(b[3]),
    .I2(a[4]),
    .I3(a[5]),
    .O(sig0000006f)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk00000168 (
    .I0(a[0]),
    .I1(b[6]),
    .O(sig00000084)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000169 (
    .I0(b[0]),
    .I1(b[1]),
    .I2(a[6]),
    .I3(a[7]),
    .O(sig0000009e)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk0000016a (
    .I0(b[4]),
    .I1(b[5]),
    .I2(a[1]),
    .I3(a[2]),
    .O(sig00000079)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk0000016b (
    .I0(b[2]),
    .I1(b[3]),
    .I2(a[3]),
    .I3(a[4]),
    .O(sig0000006e)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk0000016c (
    .I0(b[0]),
    .I1(b[1]),
    .I2(a[5]),
    .I3(a[6]),
    .O(sig00000094)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk0000016d (
    .I0(b[4]),
    .I1(b[5]),
    .I2(a[0]),
    .I3(a[1]),
    .O(sig00000078)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk0000016e (
    .I0(b[2]),
    .I1(b[3]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig0000006d)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk0000016f (
    .I0(b[0]),
    .I1(b[1]),
    .I2(a[4]),
    .I3(a[5]),
    .O(sig00000089)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk00000170 (
    .I0(a[0]),
    .I1(b[4]),
    .O(sig00000077)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000171 (
    .I0(b[2]),
    .I1(b[3]),
    .I2(a[1]),
    .I3(a[2]),
    .O(sig0000006c)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000172 (
    .I0(b[0]),
    .I1(b[1]),
    .I2(a[3]),
    .I3(a[4]),
    .O(sig0000007e)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000173 (
    .I0(b[2]),
    .I1(b[3]),
    .I2(a[0]),
    .I3(a[1]),
    .O(sig0000006b)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000174 (
    .I0(b[0]),
    .I1(b[1]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig00000073)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk00000175 (
    .I0(a[0]),
    .I1(b[2]),
    .O(sig0000006a)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000176 (
    .I0(b[0]),
    .I1(b[1]),
    .I2(a[1]),
    .I3(a[2]),
    .O(sig00000067)
  );
  LUT4 #(
    .INIT ( 16'h6AC0 ))
  blk00000177 (
    .I0(b[0]),
    .I1(b[1]),
    .I2(a[0]),
    .I3(a[1]),
    .O(sig00000066)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk00000178 (
    .I0(a[0]),
    .I1(b[0]),
    .O(sig00000065)
  );
  LUT3 #(
    .INIT ( 8'h9F ))
  blk00000179 (
    .I0(b[9]),
    .I1(b[8]),
    .I2(a[9]),
    .O(sig0000009d)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  blk0000017a (
    .I0(a[9]),
    .I1(b[6]),
    .I2(b[7]),
    .O(sig00000090)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  blk0000017b (
    .I0(a[9]),
    .I1(b[4]),
    .I2(b[5]),
    .O(sig00000083)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  blk0000017c (
    .I0(a[9]),
    .I1(b[2]),
    .I2(b[3]),
    .O(sig00000076)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  blk0000017d (
    .I0(a[9]),
    .I1(b[0]),
    .I2(b[1]),
    .O(sig00000069)
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
