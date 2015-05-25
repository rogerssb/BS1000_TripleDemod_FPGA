////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.31
//  \   \         Application: netgen
//  /   /         Filename: resamplerTap1.v
// /___/   /\     Timestamp: Tue Aug 12 16:22:14 2008
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\modem\telemetry\coregen\tmp\_cg\resamplerTap1.ngc C:\modem\telemetry\coregen\tmp\_cg\resamplerTap1.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/resamplerTap1.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/resamplerTap1.v
// # of Modules	: 1
// Design Name	: resamplerTap1
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

module resamplerTap1 (
a, spo
);
  input [4 : 0] a;
  output [17 : 0] spo;
  
  // synthesis translate_off
  
  wire N0;
  wire N1;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000091_39 ;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009 ;
  wire \BU2/N91 ;
  wire \BU2/N90 ;
  wire \BU2/N89 ;
  wire \BU2/N88 ;
  wire \BU2/N87 ;
  wire \BU2/N86 ;
  wire \BU2/N85 ;
  wire \BU2/N84 ;
  wire \BU2/N83 ;
  wire \BU2/N82 ;
  wire \BU2/N81 ;
  wire \BU2/N80 ;
  wire \BU2/N79 ;
  wire \BU2/N78 ;
  wire \BU2/N77 ;
  wire \BU2/N76 ;
  wire \BU2/N75 ;
  wire \BU2/N74 ;
  wire \BU2/N40 ;
  wire [4 : 0] a_2;
  wire [12 : 12] NlwRenamedSignal_spo;
  wire [11 : 0] spo_3;
  wire [0 : 0] \BU2/qdpo ;
  assign
    a_2[4] = a[4],
    a_2[3] = a[3],
    a_2[2] = a[2],
    a_2[1] = a[1],
    a_2[0] = a[0],
    spo[17] = NlwRenamedSignal_spo[12],
    spo[16] = NlwRenamedSignal_spo[12],
    spo[15] = NlwRenamedSignal_spo[12],
    spo[14] = NlwRenamedSignal_spo[12],
    spo[13] = NlwRenamedSignal_spo[12],
    spo[12] = NlwRenamedSignal_spo[12],
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
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009_f5  (
    .I0(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000091_39 ),
    .I1(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009 ),
    .S(a_2[4]),
    .O(spo_3[9])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000092  (
    .I0(a_2[3]),
    .I1(a_2[2]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000091_39 )
  );
  LUT4 #(
    .INIT ( 16'hA998 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000091  (
    .I0(a_2[1]),
    .I1(a_2[0]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009 )
  );
  INV   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000121_INV_0  (
    .I(a_2[4]),
    .O(NlwRenamedSignal_spo[12])
  );
  LUT4 #(
    .INIT ( 16'hE54F ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00008_G  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[3]),
    .I3(a_2[0]),
    .O(\BU2/N91 )
  );
  LUT4 #(
    .INIT ( 16'h9EFF ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00008_F  (
    .I0(a_2[1]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .I3(a_2[4]),
    .O(\BU2/N90 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00008  (
    .I0(\BU2/N90 ),
    .I1(\BU2/N91 ),
    .S(a_2[2]),
    .O(spo_3[8])
  );
  LUT4 #(
    .INIT ( 16'hCDFB ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_G  (
    .I0(a_2[2]),
    .I1(a_2[1]),
    .I2(a_2[4]),
    .I3(a_2[3]),
    .O(\BU2/N89 )
  );
  LUT4 #(
    .INIT ( 16'h7CD6 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_F  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/N88 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001  (
    .I0(\BU2/N88 ),
    .I1(\BU2/N89 ),
    .S(a_2[0]),
    .O(spo_3[0])
  );
  LUT4 #(
    .INIT ( 16'hD91C ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_G  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[0]),
    .I3(a_2[3]),
    .O(\BU2/N87 )
  );
  LUT4 #(
    .INIT ( 16'hA831 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_F  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/N86 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011  (
    .I0(\BU2/N86 ),
    .I1(\BU2/N87 ),
    .S(a_2[2]),
    .O(spo_3[1])
  );
  LUT4 #(
    .INIT ( 16'h4EFD ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004_G  (
    .I0(a_2[3]),
    .I1(a_2[1]),
    .I2(a_2[2]),
    .I3(a_2[4]),
    .O(\BU2/N85 )
  );
  LUT4 #(
    .INIT ( 16'hAE46 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004_F  (
    .I0(a_2[4]),
    .I1(a_2[1]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/N84 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004  (
    .I0(\BU2/N84 ),
    .I1(\BU2/N85 ),
    .S(a_2[0]),
    .O(spo_3[4])
  );
  LUT4 #(
    .INIT ( 16'h656F ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003_G  (
    .I0(a_2[3]),
    .I1(a_2[0]),
    .I2(a_2[2]),
    .I3(a_2[4]),
    .O(\BU2/N83 )
  );
  LUT4 #(
    .INIT ( 16'h1518 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003_F  (
    .I0(a_2[4]),
    .I1(a_2[2]),
    .I2(a_2[0]),
    .I3(a_2[3]),
    .O(\BU2/N82 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003  (
    .I0(\BU2/N82 ),
    .I1(\BU2/N83 ),
    .S(a_2[1]),
    .O(spo_3[3])
  );
  LUT4 #(
    .INIT ( 16'hCC49 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005_G  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/N81 )
  );
  LUT4 #(
    .INIT ( 16'h7435 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005_F  (
    .I0(a_2[4]),
    .I1(a_2[0]),
    .I2(a_2[3]),
    .I3(a_2[1]),
    .O(\BU2/N80 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005  (
    .I0(\BU2/N80 ),
    .I1(\BU2/N81 ),
    .S(a_2[2]),
    .O(spo_3[5])
  );
  LUT4 #(
    .INIT ( 16'h1598 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006_G  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[1]),
    .O(\BU2/N79 )
  );
  LUT4 #(
    .INIT ( 16'h2567 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006_F  (
    .I0(a_2[4]),
    .I1(a_2[2]),
    .I2(a_2[1]),
    .I3(a_2[3]),
    .O(\BU2/N78 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006  (
    .I0(\BU2/N78 ),
    .I1(\BU2/N79 ),
    .S(a_2[0]),
    .O(spo_3[6])
  );
  LUT4 #(
    .INIT ( 16'h1BF1 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007_G  (
    .I0(a_2[0]),
    .I1(a_2[2]),
    .I2(a_2[4]),
    .I3(a_2[3]),
    .O(\BU2/N77 )
  );
  LUT4 #(
    .INIT ( 16'h6D29 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007_F  (
    .I0(a_2[4]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[0]),
    .O(\BU2/N76 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007  (
    .I0(\BU2/N76 ),
    .I1(\BU2/N77 ),
    .S(a_2[1]),
    .O(spo_3[7])
  );
  LUT4 #(
    .INIT ( 16'h8919 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002_G  (
    .I0(a_2[1]),
    .I1(a_2[4]),
    .I2(a_2[0]),
    .I3(a_2[3]),
    .O(\BU2/N75 )
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002_F  (
    .I0(a_2[1]),
    .I1(a_2[0]),
    .I2(a_2[3]),
    .O(\BU2/N74 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002  (
    .I0(\BU2/N74 ),
    .I1(\BU2/N75 ),
    .S(a_2[2]),
    .O(spo_3[2])
  );
  LUT4 #(
    .INIT ( 16'hE2FF ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000010  (
    .I0(a_2[3]),
    .I1(\BU2/N40 ),
    .I2(a_2[2]),
    .I3(a_2[4]),
    .O(spo_3[10])
  );
  LUT4 #(
    .INIT ( 16'hAF8F ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000111  (
    .I0(a_2[3]),
    .I1(a_2[2]),
    .I2(a_2[4]),
    .I3(\BU2/N40 ),
    .O(spo_3[11])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000111_SW0  (
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
