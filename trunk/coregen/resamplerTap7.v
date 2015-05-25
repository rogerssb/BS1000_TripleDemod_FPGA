////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.31
//  \   \         Application: netgen
//  /   /         Filename: resamplerTap7.v
// /___/   /\     Timestamp: Tue Aug 12 16:27:38 2008
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\modem\telemetry\coregen\tmp\_cg\resamplerTap7.ngc C:\modem\telemetry\coregen\tmp\_cg\resamplerTap7.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/resamplerTap7.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/resamplerTap7.v
// # of Modules	: 1
// Design Name	: resamplerTap7
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

module resamplerTap7 (
a, spo
);
  input [4 : 0] a;
  output [17 : 0] spo;
  
  // synthesis translate_off
  
  wire N0;
  wire N1;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000091_38 ;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009 ;
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
  wire \BU2/N73 ;
  wire \BU2/N72 ;
  wire \BU2/N71 ;
  wire \BU2/N70 ;
  wire \BU2/N69 ;
  wire \BU2/N68 ;
  wire \BU2/N34 ;
  wire [4 : 4] NlwRenamedSignal_a;
  wire [3 : 0] a_2;
  wire [11 : 0] spo_3;
  wire [0 : 0] \BU2/qdpo ;
  assign
    NlwRenamedSignal_a[4] = a[4],
    a_2[3] = a[3],
    a_2[2] = a[2],
    a_2[1] = a[1],
    a_2[0] = a[0],
    spo[17] = NlwRenamedSignal_a[4],
    spo[16] = NlwRenamedSignal_a[4],
    spo[15] = NlwRenamedSignal_a[4],
    spo[14] = NlwRenamedSignal_a[4],
    spo[13] = NlwRenamedSignal_a[4],
    spo[12] = NlwRenamedSignal_a[4],
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
    .I0(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000091_38 ),
    .I1(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009 ),
    .S(NlwRenamedSignal_a[4]),
    .O(spo_3[9])
  );
  LUT4 #(
    .INIT ( 16'h4933 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000092  (
    .I0(a_2[2]),
    .I1(a_2[1]),
    .I2(a_2[3]),
    .I3(a_2[0]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000091_38 )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000091  (
    .I0(a_2[2]),
    .I1(a_2[3]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00009 )
  );
  LUT4 #(
    .INIT ( 16'hFF6D ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00008_G  (
    .I0(a_2[3]),
    .I1(a_2[0]),
    .I2(a_2[1]),
    .I3(NlwRenamedSignal_a[4]),
    .O(\BU2/N85 )
  );
  LUT4 #(
    .INIT ( 16'hA9F9 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00008_F  (
    .I0(a_2[3]),
    .I1(a_2[0]),
    .I2(NlwRenamedSignal_a[4]),
    .I3(a_2[1]),
    .O(\BU2/N84 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00008  (
    .I0(\BU2/N84 ),
    .I1(\BU2/N85 ),
    .S(a_2[2]),
    .O(spo_3[8])
  );
  LUT4 #(
    .INIT ( 16'h4EB7 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_G  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/N83 )
  );
  LUT4 #(
    .INIT ( 16'hBFE3 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_F  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[1]),
    .I2(a_2[0]),
    .I3(a_2[3]),
    .O(\BU2/N82 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001  (
    .I0(\BU2/N82 ),
    .I1(\BU2/N83 ),
    .S(a_2[2]),
    .O(spo_3[0])
  );
  LUT4 #(
    .INIT ( 16'h8139 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_G  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[1]),
    .I2(a_2[3]),
    .I3(a_2[2]),
    .O(\BU2/N81 )
  );
  LUT4 #(
    .INIT ( 16'hC5A3 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_F  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/N80 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011  (
    .I0(\BU2/N80 ),
    .I1(\BU2/N81 ),
    .S(a_2[0]),
    .O(spo_3[1])
  );
  LUT4 #(
    .INIT ( 16'h4A56 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004_G  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[2]),
    .I2(a_2[0]),
    .I3(a_2[3]),
    .O(\BU2/N79 )
  );
  LUT4 #(
    .INIT ( 16'hBFB6 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004_F  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[0]),
    .I2(a_2[3]),
    .I3(a_2[2]),
    .O(\BU2/N78 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004  (
    .I0(\BU2/N78 ),
    .I1(\BU2/N79 ),
    .S(a_2[1]),
    .O(spo_3[4])
  );
  LUT4 #(
    .INIT ( 16'h72F2 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003_G  (
    .I0(a_2[3]),
    .I1(a_2[1]),
    .I2(NlwRenamedSignal_a[4]),
    .I3(a_2[0]),
    .O(\BU2/N77 )
  );
  LUT4 #(
    .INIT ( 16'h5292 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003_F  (
    .I0(a_2[3]),
    .I1(a_2[1]),
    .I2(a_2[0]),
    .I3(NlwRenamedSignal_a[4]),
    .O(\BU2/N76 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003  (
    .I0(\BU2/N76 ),
    .I1(\BU2/N77 ),
    .S(a_2[2]),
    .O(spo_3[3])
  );
  LUT4 #(
    .INIT ( 16'hB393 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005_G  (
    .I0(a_2[1]),
    .I1(a_2[3]),
    .I2(NlwRenamedSignal_a[4]),
    .I3(a_2[2]),
    .O(\BU2/N75 )
  );
  LUT4 #(
    .INIT ( 16'h882B ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005_F  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[2]),
    .I2(a_2[1]),
    .I3(a_2[3]),
    .O(\BU2/N74 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005  (
    .I0(\BU2/N74 ),
    .I1(\BU2/N75 ),
    .S(a_2[0]),
    .O(spo_3[5])
  );
  LUT4 #(
    .INIT ( 16'hEA64 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006_G  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[2]),
    .I2(a_2[3]),
    .I3(a_2[1]),
    .O(\BU2/N73 )
  );
  LUT4 #(
    .INIT ( 16'h2A64 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006_F  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[1]),
    .I2(a_2[2]),
    .I3(a_2[3]),
    .O(\BU2/N72 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006  (
    .I0(\BU2/N72 ),
    .I1(\BU2/N73 ),
    .S(a_2[0]),
    .O(spo_3[6])
  );
  LUT4 #(
    .INIT ( 16'h7464 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002_G  (
    .I0(a_2[3]),
    .I1(a_2[2]),
    .I2(NlwRenamedSignal_a[4]),
    .I3(a_2[0]),
    .O(\BU2/N71 )
  );
  LUT4 #(
    .INIT ( 16'h46CF ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002_F  (
    .I0(a_2[0]),
    .I1(a_2[2]),
    .I2(NlwRenamedSignal_a[4]),
    .I3(a_2[3]),
    .O(\BU2/N70 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002  (
    .I0(\BU2/N70 ),
    .I1(\BU2/N71 ),
    .S(a_2[1]),
    .O(spo_3[2])
  );
  LUT4 #(
    .INIT ( 16'hE57E ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007_G  (
    .I0(a_2[1]),
    .I1(a_2[0]),
    .I2(NlwRenamedSignal_a[4]),
    .I3(a_2[3]),
    .O(\BU2/N69 )
  );
  LUT3 #(
    .INIT ( 8'h46 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007_F  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .O(\BU2/N68 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007  (
    .I0(\BU2/N68 ),
    .I1(\BU2/N69 ),
    .S(a_2[2]),
    .O(spo_3[7])
  );
  LUT4 #(
    .INIT ( 16'hFF1D ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000010  (
    .I0(a_2[2]),
    .I1(\BU2/N34 ),
    .I2(a_2[3]),
    .I3(NlwRenamedSignal_a[4]),
    .O(spo_3[10])
  );
  LUT4 #(
    .INIT ( 16'hFF15 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000111  (
    .I0(a_2[3]),
    .I1(a_2[2]),
    .I2(\BU2/N34 ),
    .I3(NlwRenamedSignal_a[4]),
    .O(spo_3[11])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom0000111_SW0  (
    .I0(a_2[1]),
    .I1(a_2[0]),
    .O(\BU2/N34 )
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
