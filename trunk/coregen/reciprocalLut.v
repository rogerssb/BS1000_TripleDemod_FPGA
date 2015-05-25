////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.31
//  \   \         Application: netgen
//  /   /         Filename: reciprocalLut.v
// /___/   /\     Timestamp: Thu Sep 04 14:49:21 2008
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\modem\telemetry\coregen\tmp\_cg\reciprocalLut.ngc C:\modem\telemetry\coregen\tmp\_cg\reciprocalLut.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/reciprocalLut.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/reciprocalLut.v
// # of Modules	: 1
// Design Name	: reciprocalLut
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

module reciprocalLut (
a, spo
);
  input [4 : 0] a;
  output [17 : 0] spo;
  
  // synthesis translate_off
  
  wire N0;
  wire N1;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000161 ;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000015 ;
  wire \BU2/N76 ;
  wire \BU2/N75 ;
  wire \BU2/N74 ;
  wire \BU2/N73 ;
  wire \BU2/N72 ;
  wire \BU2/N71 ;
  wire \BU2/N70 ;
  wire \BU2/N69 ;
  wire \BU2/N68 ;
  wire \BU2/N67 ;
  wire \BU2/N66 ;
  wire \BU2/N65 ;
  wire \BU2/N64 ;
  wire \BU2/N63 ;
  wire \BU2/N62 ;
  wire \BU2/N61 ;
  wire \BU2/N60 ;
  wire \BU2/N59 ;
  wire \BU2/N58 ;
  wire \BU2/N57 ;
  wire \BU2/N56 ;
  wire \BU2/N55 ;
  wire \BU2/N54 ;
  wire \BU2/N53 ;
  wire \BU2/N52 ;
  wire \BU2/N51 ;
  wire \BU2/N43 ;
  wire \BU2/N42 ;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006_bdd0 ;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_bdd1 ;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000014_bdd0 ;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_bdd1 ;
  wire [4 : 0] a_2;
  wire [17 : 17] NlwRenamedSig_OI_spo;
  wire [16 : 0] spo_3;
  assign
    a_2[4] = a[4],
    a_2[3] = a[3],
    a_2[2] = a[2],
    a_2[1] = a[1],
    a_2[0] = a[0],
    spo[17] = NlwRenamedSig_OI_spo[17],
    spo[16] = spo_3[16],
    spo[15] = spo_3[15],
    spo[14] = spo_3[14],
    spo[13] = spo_3[13],
    spo[12] = spo_3[12],
    spo[11] = spo_3[11],
    spo[10] = spo_3[10],
    spo[9] = spo_3[9],
    spo[8] = spo_3[8],
    spo[7] = spo_3[7],
    spo[6] = spo_3[6],
    spo[5] = spo_3[5],
    spo[4] = spo_3[4],
    spo[3] = spo_3[3],
    spo[2] = spo_3[2],
    spo[1] = spo_3[1],
    spo[0] = spo_3[0];
  VCC   VCC_0 (
    .P(N1)
  );
  GND   GND_1 (
    .G(N0)
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000161_f5  (
    .I0(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000161 ),
    .I1(NlwRenamedSig_OI_spo[17]),
    .S(a_2[4]),
    .O(spo_3[16])
  );
  LUT4 #(
    .INIT ( 16'h0103 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001611  (
    .I0(a_2[1]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[0]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000161 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000015_f5  (
    .I0(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000015 ),
    .I1(NlwRenamedSig_OI_spo[17]),
    .S(a_2[4]),
    .O(spo_3[15])
  );
  LUT4 #(
    .INIT ( 16'h0213 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000151  (
    .I0(a_2[0]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[1]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000015 )
  );
  LUT4 #(
    .INIT ( 16'h3652 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000061118_G  (
    .I0(a_2[1]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .I3(a_2[4]),
    .O(\BU2/N76 )
  );
  LUT4 #(
    .INIT ( 16'hAD29 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000061118_F  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[0]),
    .O(\BU2/N75 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000061118  (
    .I0(\BU2/N75 ),
    .I1(\BU2/N76 ),
    .S(a_2[2]),
    .O(spo_3[6])
  );
  LUT4 #(
    .INIT ( 16'h8939 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000021109_G  (
    .I0(a_2[1]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[4]),
    .O(\BU2/N74 )
  );
  LUT4 #(
    .INIT ( 16'h1809 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000021109_F  (
    .I0(a_2[2]),
    .I1(a_2[1]),
    .I2(a_2[3]),
    .I3(a_2[4]),
    .O(\BU2/N73 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000021109  (
    .I0(\BU2/N73 ),
    .I1(\BU2/N74 ),
    .S(a_2[0]),
    .O(spo_3[2])
  );
  LUT4 #(
    .INIT ( 16'h795F ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_G  (
    .I0(a_2[2]),
    .I1(a_2[3]),
    .I2(a_2[4]),
    .I3(a_2[1]),
    .O(\BU2/N72 )
  );
  LUT4 #(
    .INIT ( 16'h5A49 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_F  (
    .I0(a_2[3]),
    .I1(a_2[1]),
    .I2(a_2[4]),
    .I3(a_2[2]),
    .O(\BU2/N71 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011  (
    .I0(\BU2/N71 ),
    .I1(\BU2/N72 ),
    .S(a_2[0]),
    .O(spo_3[1])
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000131_G  (
    .I0(a_2[4]),
    .I1(a_2[2]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/N70 )
  );
  LUT4 #(
    .INIT ( 16'h1053 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000131_F  (
    .I0(a_2[4]),
    .I1(a_2[2]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/N69 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000131  (
    .I0(\BU2/N69 ),
    .I1(\BU2/N70 ),
    .S(a_2[3]),
    .O(spo_3[13])
  );
  LUT4 #(
    .INIT ( 16'h0437 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000113_G  (
    .I0(a_2[1]),
    .I1(a_2[2]),
    .I2(a_2[3]),
    .I3(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_bdd1 ),
    .O(\BU2/N68 )
  );
  LUT4 #(
    .INIT ( 16'h46C5 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000113_F  (
    .I0(a_2[2]),
    .I1(a_2[0]),
    .I2(a_2[1]),
    .I3(a_2[3]),
    .O(\BU2/N67 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000113  (
    .I0(\BU2/N67 ),
    .I1(\BU2/N68 ),
    .S(a_2[4]),
    .O(spo_3[11])
  );
  LUT4 #(
    .INIT ( 16'h7520 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000051_G  (
    .I0(a_2[2]),
    .I1(a_2[1]),
    .I2(a_2[0]),
    .I3(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000014_bdd0 ),
    .O(\BU2/N66 )
  );
  LUT4 #(
    .INIT ( 16'hAE6B ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000051_F  (
    .I0(a_2[0]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/N65 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000051  (
    .I0(\BU2/N65 ),
    .I1(\BU2/N66 ),
    .S(a_2[4]),
    .O(spo_3[5])
  );
  LUT4 #(
    .INIT ( 16'h643A ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000081_G  (
    .I0(a_2[1]),
    .I1(a_2[0]),
    .I2(a_2[4]),
    .I3(a_2[3]),
    .O(\BU2/N64 )
  );
  LUT4 #(
    .INIT ( 16'h085D ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000081_F  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .I3(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006_bdd0 ),
    .O(\BU2/N63 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000081  (
    .I0(\BU2/N63 ),
    .I1(\BU2/N64 ),
    .S(a_2[2]),
    .O(spo_3[8])
  );
  LUT4 #(
    .INIT ( 16'h76D4 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000091_G  (
    .I0(a_2[2]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .I3(a_2[4]),
    .O(\BU2/N62 )
  );
  LUT4 #(
    .INIT ( 16'h24E5 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000091_F  (
    .I0(a_2[3]),
    .I1(a_2[0]),
    .I2(a_2[2]),
    .I3(a_2[4]),
    .O(\BU2/N61 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000091  (
    .I0(\BU2/N61 ),
    .I1(\BU2/N62 ),
    .S(a_2[1]),
    .O(spo_3[9])
  );
  LUT4 #(
    .INIT ( 16'h2742 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000010_G  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .I3(a_2[2]),
    .O(\BU2/N60 )
  );
  LUT4 #(
    .INIT ( 16'h4A4D ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000010_F  (
    .I0(a_2[4]),
    .I1(a_2[0]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/N59 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000010  (
    .I0(\BU2/N59 ),
    .I1(\BU2/N60 ),
    .S(a_2[1]),
    .O(spo_3[10])
  );
  LUT4 #(
    .INIT ( 16'h1A11 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_G  (
    .I0(a_2[2]),
    .I1(a_2[1]),
    .I2(a_2[3]),
    .I3(a_2[4]),
    .O(\BU2/N58 )
  );
  LUT4 #(
    .INIT ( 16'h9CC9 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_F  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[1]),
    .O(\BU2/N57 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001  (
    .I0(\BU2/N57 ),
    .I1(\BU2/N58 ),
    .S(a_2[0]),
    .O(spo_3[0])
  );
  LUT4 #(
    .INIT ( 16'hD548 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007_G  (
    .I0(a_2[2]),
    .I1(a_2[3]),
    .I2(a_2[4]),
    .I3(a_2[0]),
    .O(\BU2/N56 )
  );
  LUT4 #(
    .INIT ( 16'h8463 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007_F  (
    .I0(a_2[0]),
    .I1(a_2[2]),
    .I2(a_2[3]),
    .I3(a_2[4]),
    .O(\BU2/N55 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007  (
    .I0(\BU2/N55 ),
    .I1(\BU2/N56 ),
    .S(a_2[1]),
    .O(spo_3[7])
  );
  LUT4 #(
    .INIT ( 16'h0B02 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000031_G  (
    .I0(a_2[4]),
    .I1(a_2[0]),
    .I2(a_2[1]),
    .I3(a_2[3]),
    .O(\BU2/N54 )
  );
  LUT4 #(
    .INIT ( 16'h484D ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000031_F  (
    .I0(a_2[4]),
    .I1(a_2[0]),
    .I2(a_2[1]),
    .I3(a_2[3]),
    .O(\BU2/N53 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000031  (
    .I0(\BU2/N53 ),
    .I1(\BU2/N54 ),
    .S(a_2[2]),
    .O(spo_3[3])
  );
  LUT4 #(
    .INIT ( 16'h090C ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004_G  (
    .I0(a_2[3]),
    .I1(a_2[1]),
    .I2(a_2[0]),
    .I3(a_2[4]),
    .O(\BU2/N52 )
  );
  LUT4 #(
    .INIT ( 16'hAEB9 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004_F  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[0]),
    .I3(a_2[3]),
    .O(\BU2/N51 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004  (
    .I0(\BU2/N51 ),
    .I1(\BU2/N52 ),
    .S(a_2[2]),
    .O(spo_3[4])
  );
  LUT4 #(
    .INIT ( 16'hABA8 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000121  (
    .I0(\BU2/N43 ),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .I3(\BU2/N42 ),
    .O(spo_3[12])
  );
  LUT4 #(
    .INIT ( 16'hFF12 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000121_SW3  (
    .I0(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_bdd1 ),
    .I1(a_2[2]),
    .I2(a_2[1]),
    .I3(a_2[4]),
    .O(\BU2/N43 )
  );
  LUT4 #(
    .INIT ( 16'hE9EC ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000121_SW2  (
    .I0(a_2[2]),
    .I1(a_2[1]),
    .I2(a_2[4]),
    .I3(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_bdd1 ),
    .O(\BU2/N42 )
  );
  LUT3 #(
    .INIT ( 8'hBC ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000621  (
    .I0(a_2[0]),
    .I1(a_2[1]),
    .I2(a_2[3]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006_bdd0 )
  );
  LUT4 #(
    .INIT ( 16'h0213 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001411  (
    .I0(a_2[2]),
    .I1(a_2[4]),
    .I2(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_bdd1 ),
    .I3(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000014_bdd0 ),
    .O(spo_3[14])
  );
  LUT3 #(
    .INIT ( 8'hAB ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001151  (
    .I0(a_2[3]),
    .I1(a_2[1]),
    .I2(a_2[0]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_bdd1 )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001421  (
    .I0(a_2[1]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000014_bdd0 )
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000191  (
    .I0(a_2[3]),
    .I1(a_2[0]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_bdd1 )
  );
  GND   \BU2/XST_GND  (
    .G(NlwRenamedSig_OI_spo[17])
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
