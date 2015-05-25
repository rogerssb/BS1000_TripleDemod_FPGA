////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.31
//  \   \         Application: netgen
//  /   /         Filename: resamplerTap6.v
// /___/   /\     Timestamp: Tue Aug 12 16:27:05 2008
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\modem\telemetry\coregen\tmp\_cg\resamplerTap6.ngc C:\modem\telemetry\coregen\tmp\_cg\resamplerTap6.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/resamplerTap6.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/resamplerTap6.v
// # of Modules	: 1
// Design Name	: resamplerTap6
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

module resamplerTap6 (
a, spo
);
  input [4 : 0] a;
  output [17 : 0] spo;
  
  // synthesis translate_off
  
  wire N0;
  wire N1;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000101_48 ;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000010 ;
  wire \BU2/N106 ;
  wire \BU2/N105 ;
  wire \BU2/N104 ;
  wire \BU2/N103 ;
  wire \BU2/N102 ;
  wire \BU2/N101 ;
  wire \BU2/N100 ;
  wire \BU2/N99 ;
  wire \BU2/N98 ;
  wire \BU2/N97 ;
  wire \BU2/N96 ;
  wire \BU2/N95 ;
  wire \BU2/N94 ;
  wire \BU2/N93 ;
  wire \BU2/N92 ;
  wire \BU2/N91 ;
  wire \BU2/N90 ;
  wire \BU2/N89 ;
  wire \BU2/N88 ;
  wire \BU2/N87 ;
  wire \BU2/N86 ;
  wire \BU2/N85 ;
  wire \BU2/N84 ;
  wire \BU2/N83 ;
  wire \BU2/N40 ;
  wire [4 : 0] a_2;
  wire [15 : 15] NlwRenamedSignal_spo;
  wire [14 : 0] spo_3;
  wire [0 : 0] \BU2/qdpo ;
  assign
    a_2[4] = a[4],
    a_2[3] = a[3],
    a_2[2] = a[2],
    a_2[1] = a[1],
    a_2[0] = a[0],
    spo[17] = NlwRenamedSignal_spo[15],
    spo[16] = NlwRenamedSignal_spo[15],
    spo[15] = NlwRenamedSignal_spo[15],
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
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000010_f5  (
    .I0(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000101_48 ),
    .I1(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000010 ),
    .S(a_2[4]),
    .O(spo_3[10])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000102  (
    .I0(a_2[3]),
    .I1(a_2[0]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000101_48 )
  );
  LUT4 #(
    .INIT ( 16'hD414 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000101  (
    .I0(a_2[3]),
    .I1(a_2[0]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000010 )
  );
  INV   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000151_INV_0  (
    .I(a_2[4]),
    .O(NlwRenamedSignal_spo[15])
  );
  LUT4 #(
    .INIT ( 16'hDC5E ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009_G  (
    .I0(a_2[4]),
    .I1(a_2[2]),
    .I2(a_2[3]),
    .I3(a_2[0]),
    .O(\BU2/N106 )
  );
  LUT4 #(
    .INIT ( 16'h454D ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009_F  (
    .I0(a_2[4]),
    .I1(a_2[2]),
    .I2(a_2[3]),
    .I3(a_2[0]),
    .O(\BU2/N105 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009  (
    .I0(\BU2/N105 ),
    .I1(\BU2/N106 ),
    .S(a_2[1]),
    .O(spo_3[9])
  );
  LUT4 #(
    .INIT ( 16'h80AA ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000111_G  (
    .I0(a_2[1]),
    .I1(a_2[2]),
    .I2(a_2[0]),
    .I3(a_2[4]),
    .O(\BU2/N104 )
  );
  LUT4 #(
    .INIT ( 16'hF989 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000111_F  (
    .I0(a_2[1]),
    .I1(a_2[0]),
    .I2(a_2[4]),
    .I3(a_2[2]),
    .O(\BU2/N103 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000111  (
    .I0(\BU2/N103 ),
    .I1(\BU2/N104 ),
    .S(a_2[3]),
    .O(spo_3[11])
  );
  LUT4 #(
    .INIT ( 16'h95D6 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002_G  (
    .I0(a_2[4]),
    .I1(a_2[0]),
    .I2(a_2[1]),
    .I3(a_2[3]),
    .O(\BU2/N102 )
  );
  LUT4 #(
    .INIT ( 16'h0D96 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002_F  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[0]),
    .I3(a_2[3]),
    .O(\BU2/N101 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002  (
    .I0(\BU2/N101 ),
    .I1(\BU2/N102 ),
    .S(a_2[2]),
    .O(spo_3[2])
  );
  LUT4 #(
    .INIT ( 16'hC54D ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004_G  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[3]),
    .I3(a_2[0]),
    .O(\BU2/N100 )
  );
  LUT4 #(
    .INIT ( 16'h0A96 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004_F  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[0]),
    .O(\BU2/N99 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004  (
    .I0(\BU2/N99 ),
    .I1(\BU2/N100 ),
    .S(a_2[2]),
    .O(spo_3[4])
  );
  LUT4 #(
    .INIT ( 16'h285A ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003_G  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[0]),
    .O(\BU2/N98 )
  );
  LUT4 #(
    .INIT ( 16'h94AA ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003_F  (
    .I0(a_2[4]),
    .I1(a_2[2]),
    .I2(a_2[0]),
    .I3(a_2[3]),
    .O(\BU2/N97 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003  (
    .I0(\BU2/N97 ),
    .I1(\BU2/N98 ),
    .S(a_2[1]),
    .O(spo_3[3])
  );
  LUT4 #(
    .INIT ( 16'hB8D9 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005_G  (
    .I0(a_2[4]),
    .I1(a_2[0]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/N96 )
  );
  LUT4 #(
    .INIT ( 16'hE424 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005_F  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[0]),
    .O(\BU2/N95 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005  (
    .I0(\BU2/N95 ),
    .I1(\BU2/N96 ),
    .S(a_2[1]),
    .O(spo_3[5])
  );
  LUT4 #(
    .INIT ( 16'h8DE8 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006_G  (
    .I0(a_2[1]),
    .I1(a_2[0]),
    .I2(a_2[4]),
    .I3(a_2[3]),
    .O(\BU2/N94 )
  );
  LUT4 #(
    .INIT ( 16'h1C29 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006_F  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[0]),
    .O(\BU2/N93 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006  (
    .I0(\BU2/N93 ),
    .I1(\BU2/N94 ),
    .S(a_2[2]),
    .O(spo_3[6])
  );
  LUT4 #(
    .INIT ( 16'hB5EE ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007_G  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[0]),
    .O(\BU2/N92 )
  );
  LUT4 #(
    .INIT ( 16'hD9BD ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007_F  (
    .I0(a_2[0]),
    .I1(a_2[1]),
    .I2(a_2[4]),
    .I3(a_2[3]),
    .O(\BU2/N91 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007  (
    .I0(\BU2/N91 ),
    .I1(\BU2/N92 ),
    .S(a_2[2]),
    .O(spo_3[7])
  );
  LUT4 #(
    .INIT ( 16'h9995 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_G  (
    .I0(a_2[1]),
    .I1(a_2[0]),
    .I2(a_2[3]),
    .I3(a_2[4]),
    .O(\BU2/N90 )
  );
  LUT4 #(
    .INIT ( 16'h8644 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_F  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[0]),
    .I3(a_2[3]),
    .O(\BU2/N89 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001  (
    .I0(\BU2/N89 ),
    .I1(\BU2/N90 ),
    .S(a_2[2]),
    .O(spo_3[0])
  );
  LUT4 #(
    .INIT ( 16'h4941 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_G  (
    .I0(a_2[3]),
    .I1(a_2[1]),
    .I2(a_2[2]),
    .I3(a_2[4]),
    .O(\BU2/N88 )
  );
  LUT4 #(
    .INIT ( 16'hAA24 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_F  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[3]),
    .I3(a_2[2]),
    .O(\BU2/N87 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011  (
    .I0(\BU2/N87 ),
    .I1(\BU2/N88 ),
    .S(a_2[0]),
    .O(spo_3[1])
  );
  LUT4 #(
    .INIT ( 16'hA2E6 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00008_G  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[0]),
    .I3(a_2[3]),
    .O(\BU2/N86 )
  );
  LUT4 #(
    .INIT ( 16'hE6D4 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00008_F  (
    .I0(a_2[3]),
    .I1(a_2[1]),
    .I2(a_2[4]),
    .I3(a_2[0]),
    .O(\BU2/N85 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00008  (
    .I0(\BU2/N85 ),
    .I1(\BU2/N86 ),
    .S(a_2[2]),
    .O(spo_3[8])
  );
  LUT4 #(
    .INIT ( 16'h2FAE ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000012_G  (
    .I0(a_2[3]),
    .I1(a_2[1]),
    .I2(a_2[4]),
    .I3(a_2[0]),
    .O(\BU2/N84 )
  );
  LUT4 #(
    .INIT ( 16'h8889 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000012_F  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[0]),
    .O(\BU2/N83 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000012  (
    .I0(\BU2/N83 ),
    .I1(\BU2/N84 ),
    .S(a_2[2]),
    .O(spo_3[12])
  );
  LUT4 #(
    .INIT ( 16'h5501 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000013  (
    .I0(a_2[4]),
    .I1(a_2[2]),
    .I2(\BU2/N40 ),
    .I3(a_2[3]),
    .O(spo_3[13])
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000014  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(\BU2/N40 ),
    .O(spo_3[14])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000014_SW0  (
    .I0(a_2[1]),
    .I1(a_2[0]),
    .O(\BU2/N40 )
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/qdpo [0])
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
