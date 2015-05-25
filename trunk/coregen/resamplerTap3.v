////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.31
//  \   \         Application: netgen
//  /   /         Filename: resamplerTap3.v
// /___/   /\     Timestamp: Tue Aug 12 16:23:26 2008
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\modem\telemetry\coregen\tmp\_cg\resamplerTap3.ngc C:\modem\telemetry\coregen\tmp\_cg\resamplerTap3.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/resamplerTap3.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/resamplerTap3.v
// # of Modules	: 1
// Design Name	: resamplerTap3
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

module resamplerTap3 (
a, spo
);
  input [4 : 0] a;
  output [17 : 0] spo;
  
  // synthesis translate_off
  
  wire N0;
  wire N1;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000014 ;
  wire \BU2/N118 ;
  wire \BU2/N117 ;
  wire \BU2/N116 ;
  wire \BU2/N115 ;
  wire \BU2/N114 ;
  wire \BU2/N113 ;
  wire \BU2/N112 ;
  wire \BU2/N111 ;
  wire \BU2/N110 ;
  wire \BU2/N109 ;
  wire \BU2/N108 ;
  wire \BU2/N107 ;
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
  wire [4 : 0] a_2;
  wire [17 : 0] spo_3;
  wire [0 : 0] \BU2/qdpo ;
  assign
    a_2[4] = a[4],
    a_2[3] = a[3],
    a_2[2] = a[2],
    a_2[1] = a[1],
    a_2[0] = a[0],
    spo[17] = spo_3[17],
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
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000014_f5  (
    .I0(a_2[3]),
    .I1(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000014 ),
    .S(a_2[4]),
    .O(spo_3[14])
  );
  LUT4 #(
    .INIT ( 16'h6A2A ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000141  (
    .I0(a_2[2]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[0]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000014 )
  );
  INV   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000171_INV_0  (
    .I(a_2[4]),
    .O(spo_3[17])
  );
  LUT4 #(
    .INIT ( 16'h6664 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000010_G  (
    .I0(a_2[3]),
    .I1(a_2[0]),
    .I2(a_2[4]),
    .I3(a_2[2]),
    .O(\BU2/N118 )
  );
  LUT4 #(
    .INIT ( 16'h8BCA ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000010_F  (
    .I0(a_2[4]),
    .I1(a_2[0]),
    .I2(a_2[3]),
    .I3(a_2[2]),
    .O(\BU2/N117 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000010  (
    .I0(\BU2/N117 ),
    .I1(\BU2/N118 ),
    .S(a_2[1]),
    .O(spo_3[10])
  );
  LUT4 #(
    .INIT ( 16'hAE21 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009_G  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[0]),
    .O(\BU2/N116 )
  );
  LUT4 #(
    .INIT ( 16'h986B ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009_F  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[0]),
    .O(\BU2/N115 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009  (
    .I0(\BU2/N115 ),
    .I1(\BU2/N116 ),
    .S(a_2[2]),
    .O(spo_3[9])
  );
  LUT4 #(
    .INIT ( 16'hBDCE ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000111_G  (
    .I0(a_2[0]),
    .I1(a_2[1]),
    .I2(a_2[4]),
    .I3(a_2[3]),
    .O(\BU2/N114 )
  );
  LUT4 #(
    .INIT ( 16'h01C5 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000111_F  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[3]),
    .I3(a_2[0]),
    .O(\BU2/N113 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000111  (
    .I0(\BU2/N113 ),
    .I1(\BU2/N114 ),
    .S(a_2[2]),
    .O(spo_3[11])
  );
  LUT4 #(
    .INIT ( 16'h2BBE ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004_G  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[0]),
    .O(\BU2/N112 )
  );
  LUT4 #(
    .INIT ( 16'h41AB ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004_F  (
    .I0(a_2[3]),
    .I1(a_2[0]),
    .I2(a_2[2]),
    .I3(a_2[4]),
    .O(\BU2/N111 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004  (
    .I0(\BU2/N111 ),
    .I1(\BU2/N112 ),
    .S(a_2[1]),
    .O(spo_3[4])
  );
  LUT4 #(
    .INIT ( 16'h64D2 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002_G  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/N110 )
  );
  LUT4 #(
    .INIT ( 16'h14D4 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002_F  (
    .I0(a_2[2]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[4]),
    .O(\BU2/N109 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002  (
    .I0(\BU2/N109 ),
    .I1(\BU2/N110 ),
    .S(a_2[0]),
    .O(spo_3[2])
  );
  LUT4 #(
    .INIT ( 16'h5664 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00008_G  (
    .I0(a_2[4]),
    .I1(a_2[2]),
    .I2(a_2[1]),
    .I3(a_2[0]),
    .O(\BU2/N108 )
  );
  LUT4 #(
    .INIT ( 16'h2579 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00008_F  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[2]),
    .I3(a_2[0]),
    .O(\BU2/N107 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00008  (
    .I0(\BU2/N107 ),
    .I1(\BU2/N108 ),
    .S(a_2[3]),
    .O(spo_3[8])
  );
  LUT4 #(
    .INIT ( 16'h9ED5 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006_G  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/N106 )
  );
  LUT4 #(
    .INIT ( 16'h6F21 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006_F  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/N105 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006  (
    .I0(\BU2/N105 ),
    .I1(\BU2/N106 ),
    .S(a_2[0]),
    .O(spo_3[6])
  );
  LUT4 #(
    .INIT ( 16'hEA6E ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_G  (
    .I0(a_2[4]),
    .I1(a_2[0]),
    .I2(a_2[3]),
    .I3(a_2[1]),
    .O(\BU2/N104 )
  );
  LUT4 #(
    .INIT ( 16'h745E ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_F  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[3]),
    .I3(a_2[0]),
    .O(\BU2/N103 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011  (
    .I0(\BU2/N103 ),
    .I1(\BU2/N104 ),
    .S(a_2[2]),
    .O(spo_3[1])
  );
  LUT4 #(
    .INIT ( 16'h7F99 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000012_G  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[0]),
    .O(\BU2/N102 )
  );
  LUT4 #(
    .INIT ( 16'hA763 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000012_F  (
    .I0(a_2[0]),
    .I1(a_2[3]),
    .I2(a_2[4]),
    .I3(a_2[2]),
    .O(\BU2/N101 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000012  (
    .I0(\BU2/N101 ),
    .I1(\BU2/N102 ),
    .S(a_2[1]),
    .O(spo_3[12])
  );
  LUT4 #(
    .INIT ( 16'h80D5 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003_G  (
    .I0(a_2[0]),
    .I1(a_2[2]),
    .I2(a_2[3]),
    .I3(a_2[4]),
    .O(\BU2/N100 )
  );
  LUT4 #(
    .INIT ( 16'h15A9 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003_F  (
    .I0(a_2[3]),
    .I1(a_2[0]),
    .I2(a_2[2]),
    .I3(a_2[4]),
    .O(\BU2/N99 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003  (
    .I0(\BU2/N99 ),
    .I1(\BU2/N100 ),
    .S(a_2[1]),
    .O(spo_3[3])
  );
  LUT4 #(
    .INIT ( 16'h2BA2 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007_G  (
    .I0(a_2[3]),
    .I1(a_2[0]),
    .I2(a_2[4]),
    .I3(a_2[1]),
    .O(\BU2/N98 )
  );
  LUT4 #(
    .INIT ( 16'hC6FB ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007_F  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/N97 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007  (
    .I0(\BU2/N97 ),
    .I1(\BU2/N98 ),
    .S(a_2[2]),
    .O(spo_3[7])
  );
  LUT4 #(
    .INIT ( 16'hE355 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_G  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[1]),
    .O(\BU2/N96 )
  );
  LUT4 #(
    .INIT ( 16'hCE62 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_F  (
    .I0(a_2[4]),
    .I1(a_2[2]),
    .I2(a_2[3]),
    .I3(a_2[1]),
    .O(\BU2/N95 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001  (
    .I0(\BU2/N95 ),
    .I1(\BU2/N96 ),
    .S(a_2[0]),
    .O(spo_3[0])
  );
  LUT4 #(
    .INIT ( 16'hF57D ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000013_G  (
    .I0(a_2[3]),
    .I1(a_2[4]),
    .I2(a_2[2]),
    .I3(a_2[0]),
    .O(\BU2/N94 )
  );
  LUT4 #(
    .INIT ( 16'hE855 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000013_F  (
    .I0(a_2[4]),
    .I1(a_2[0]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/N93 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000013  (
    .I0(\BU2/N93 ),
    .I1(\BU2/N94 ),
    .S(a_2[1]),
    .O(spo_3[13])
  );
  LUT4 #(
    .INIT ( 16'hAEBA ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005_G  (
    .I0(a_2[1]),
    .I1(a_2[4]),
    .I2(a_2[3]),
    .I3(a_2[0]),
    .O(\BU2/N92 )
  );
  LUT4 #(
    .INIT ( 16'h11A9 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005_F  (
    .I0(a_2[4]),
    .I1(a_2[0]),
    .I2(a_2[3]),
    .I3(a_2[1]),
    .O(\BU2/N91 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005  (
    .I0(\BU2/N91 ),
    .I1(\BU2/N92 ),
    .S(a_2[2]),
    .O(spo_3[5])
  );
  LUT4 #(
    .INIT ( 16'h2AFF ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000151  (
    .I0(a_2[3]),
    .I1(a_2[2]),
    .I2(a_2[1]),
    .I3(a_2[4]),
    .O(spo_3[15])
  );
  LUT4 #(
    .INIT ( 16'hD555 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000161  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[3]),
    .I3(a_2[2]),
    .O(spo_3[16])
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
