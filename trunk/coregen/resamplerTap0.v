////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.31
//  \   \         Application: netgen
//  /   /         Filename: resamplerTap0.v
// /___/   /\     Timestamp: Tue Aug 12 16:21:27 2008
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\modem\telemetry\coregen\tmp\_cg\resamplerTap0.ngc C:\modem\telemetry\coregen\tmp\_cg\resamplerTap0.v 
// Device	: 3sd3400afg676-4
// Input file	: C:/modem/telemetry/coregen/tmp/_cg/resamplerTap0.ngc
// Output file	: C:/modem/telemetry/coregen/tmp/_cg/resamplerTap0.v
// # of Modules	: 1
// Design Name	: resamplerTap0
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

module resamplerTap0 (
a, spo
);
  input [4 : 0] a;
  output [17 : 0] spo;
  
  // synthesis translate_off
  
  wire N0;
  wire N1;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005 ;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006 ;
  wire \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007 ;
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
  wire [4 : 4] NlwRenamedSignal_a;
  wire [3 : 0] a_2;
  wire [8 : 0] spo_3;
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
    spo[11] = NlwRenamedSignal_a[4],
    spo[10] = NlwRenamedSignal_a[4],
    spo[9] = NlwRenamedSignal_a[4],
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
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005_f5  (
    .I0(\BU2/qdpo [0]),
    .I1(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005 ),
    .S(NlwRenamedSignal_a[4]),
    .O(spo_3[5])
  );
  LUT4 #(
    .INIT ( 16'h29E7 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000051  (
    .I0(a_2[3]),
    .I1(a_2[2]),
    .I2(a_2[1]),
    .I3(a_2[0]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00005 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006_f5  (
    .I0(\BU2/qdpo [0]),
    .I1(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006 ),
    .S(NlwRenamedSignal_a[4]),
    .O(spo_3[6])
  );
  LUT4 #(
    .INIT ( 16'h632B ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000061  (
    .I0(a_2[1]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[0]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00006 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007_f5  (
    .I0(\BU2/qdpo [0]),
    .I1(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007 ),
    .S(NlwRenamedSignal_a[4]),
    .O(spo_3[7])
  );
  LUT4 #(
    .INIT ( 16'h1B5B ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000071  (
    .I0(a_2[1]),
    .I1(a_2[3]),
    .I2(a_2[2]),
    .I3(a_2[0]),
    .O(\BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00007 )
  );
  LUT4 #(
    .INIT ( 16'hDCB5 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_G  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[0]),
    .O(\BU2/N63 )
  );
  LUT4 #(
    .INIT ( 16'h369C ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001_F  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/N62 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00001  (
    .I0(\BU2/N62 ),
    .I1(\BU2/N63 ),
    .S(a_2[2]),
    .O(spo_3[0])
  );
  LUT4 #(
    .INIT ( 16'h9CB1 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_G  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[3]),
    .I2(a_2[0]),
    .I3(a_2[1]),
    .O(\BU2/N61 )
  );
  LUT4 #(
    .INIT ( 16'h389E ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011_F  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[1]),
    .I2(a_2[0]),
    .I3(a_2[3]),
    .O(\BU2/N60 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000011  (
    .I0(\BU2/N60 ),
    .I1(\BU2/N61 ),
    .S(a_2[2]),
    .O(spo_3[1])
  );
  LUT4 #(
    .INIT ( 16'h18B8 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002_G  (
    .I0(a_2[3]),
    .I1(a_2[1]),
    .I2(a_2[0]),
    .I3(NlwRenamedSignal_a[4]),
    .O(\BU2/N59 )
  );
  LUT4 #(
    .INIT ( 16'hFF98 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002_F  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[0]),
    .I2(a_2[1]),
    .I3(a_2[3]),
    .O(\BU2/N58 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00002  (
    .I0(\BU2/N58 ),
    .I1(\BU2/N59 ),
    .S(a_2[2]),
    .O(spo_3[2])
  );
  LUT4 #(
    .INIT ( 16'h27FF ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004_G  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[0]),
    .I2(a_2[1]),
    .I3(a_2[3]),
    .O(\BU2/N57 )
  );
  LUT4 #(
    .INIT ( 16'h93EA ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004_F  (
    .I0(a_2[3]),
    .I1(a_2[0]),
    .I2(a_2[1]),
    .I3(NlwRenamedSignal_a[4]),
    .O(\BU2/N56 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00004  (
    .I0(\BU2/N56 ),
    .I1(\BU2/N57 ),
    .S(a_2[2]),
    .O(spo_3[4])
  );
  LUT4 #(
    .INIT ( 16'hE363 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003_G  (
    .I0(a_2[3]),
    .I1(a_2[2]),
    .I2(a_2[1]),
    .I3(NlwRenamedSignal_a[4]),
    .O(\BU2/N55 )
  );
  LUT4 #(
    .INIT ( 16'h7477 ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003_F  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[3]),
    .I2(a_2[1]),
    .I3(a_2[2]),
    .O(\BU2/N54 )
  );
  MUXF5   \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom00003  (
    .I0(\BU2/N54 ),
    .I1(\BU2/N55 ),
    .S(a_2[0]),
    .O(spo_3[3])
  );
  LUT4 #(
    .INIT ( 16'h02AA ))
  \BU2/U0/gen_rom.rom_inst/Mrom_spo_int_rom000081  (
    .I0(NlwRenamedSignal_a[4]),
    .I1(a_2[2]),
    .I2(a_2[1]),
    .I3(a_2[3]),
    .O(spo_3[8])
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
