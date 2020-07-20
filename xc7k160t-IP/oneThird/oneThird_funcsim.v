// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
// Date        : Thu May 28 15:07:30 2015
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim c:/modem/vivado/xc7k160t-IP/oneThird/oneThird_funcsim.v
// Design      : oneThird
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "oneThird,mult_gen_v12_0,{}" *) (* core_generation_info = "oneThird,mult_gen_v12_0,{x_ipProduct=Vivado 2015.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=7,x_ipLanguage=VERILOG,x_ipSimLanguage=VERILOG,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=kintex7,C_HAS_CE=1,C_HAS_SCLR=1,C_LATENCY=1,C_A_WIDTH=12,C_A_TYPE=0,C_B_WIDTH=10,C_B_TYPE=1,C_OUT_HIGH=21,C_OUT_LOW=0,C_MULT_TYPE=2,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=1010101011,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "mult_gen_v12_0,Vivado 2015.1" *) 
(* NotValidForBitStream *)
module oneThird
   (CLK,
    A,
    CE,
    SCLR,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [11:0]A;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [21:0]P;

  wire [11:0]A;
  wire CE;
  wire CLK;
  wire [21:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "12" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "1010101011" *) 
  (* C_B_WIDTH = "10" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "2" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "21" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* DONT_TOUCH *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  oneThird_mult_gen_v12_0 U0
       (.A(A),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "12" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "1010101011" *) (* C_B_WIDTH = "10" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "2" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "21" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintex7" *) (* ORIG_REF_NAME = "mult_gen_v12_0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module oneThird_mult_gen_v12_0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [11:0]A;
  input [9:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [21:0]P;
  output [47:0]PCASC;

  wire [11:0]A;
  wire [9:0]B;
  wire CE;
  wire CLK;
  wire [21:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "12" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "1010101011" *) 
  (* C_B_WIDTH = "10" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "2" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "21" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  oneThird_mult_gen_v12_0_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
FE74Lr97VmP2+Ez4rVovbpvB4Vynb7rIpzp8VfQztGnoDYQhPydTGw7yfEWSM5wxHTELmoJ2e0kg
nyVOAJOzGQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
UnafVlLwmVqAgDqs5BDZxTsO5Qw7Nz7T9DxPoDF0yCGyYUDPhiDs1mqI3Qg4QkYIJp5yYFsGIAAO
pUYs/IY/A44uoTsDTNaGtZoBJ1v68kJEgigV/osFZXpEcDoqag3/4JvCEpkiquflbTFnocW307r8
0cE640p4GyvyHA08QzM=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
rfFLFKH82qRgMOK8+SSf05H2LmUnOQNDMOMMTrDokVNnoH3TrlXrFkRE/tLuqVI87gD38MoU0OsY
2vyjubJ+yK3fH69lUPsWYfAvtU2GYCn9lQxnDlilq3K9JTZOQlARVDCUJs7zKijxylKCQ9T4aeOy
qWSJQf7IY72ND0QmI4tbkWjY9UVdTMA0mNgfU1R3/x2b+5MxrvnivC5O40ApLlsTZJdrxk3CKVg9
w6j++2bBkF8pDTv4uJYJhQDDIIu6T25xOKZAldxd+F/YHif5qz+3kDBbZJwHloxlDIRuvoJ/Q10X
fAIvL1Bfmd7z81oSb2W1AQyE68hf98QRc+yt6g==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
K3+UOwlCwx3t7FyQuvXVOuOLSf79w8H29kYesB4t4ENU7w/cJ+3jINJp3g7+Mw/l3pow2eggqoBf
iR2wVOlrGRDgOMdP5om5gBbx5l7eLztB5Wu7TXxa4iclWrFOSPWLp1OuF5oKGeVz6IS+D0PiG82m
GJDW36qBP5Bj/b1u1ME=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
EXT8uDkmRcpwbfGuT5uQLCxfBwgkoXSHlzuXgPMCFUCzus9PnTSCzAm+w4+DWFCWCKofiwIYxjX+
VhvGm4jvvVmlHHmdFjkFfHf9tcT47/Qv+MNlvS1uDLyBUnKJFHfof6DVosv9docWZkjQVvvv54/h
+XjrqvpRF6uRIWJessijQgbJ5Riby6fuu5/Gao0iUQ2fUgTF8lCA3xgAXbv5+Cl5eccDmIQV/Bf+
5e2BleBP1Ac9mgOEQoT10lCrnCOifjRNdLGfLyIA4INjmFyVhYX2slSsAPtjU7fa3zGD5KNICn/M
bA66q2PSTKNLTr4xOU/9HIDRXVIaPzR1uLrkDg==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
gGZS9YzqlL+K2GN7YyMBiKcXtMUd4WzcV3aY5AczKZw7alqEiOj6x88gw854xgJZ9sbE5tQ62HT2
N2+sZmFjvyVd6FH3EVpkdhKaABItfFKdMGENTJTfz8us1UYRGnbXitVCmq7c5N3lJmeXqs8drD9Z
DejNaGnn6DoabN2HprorR6Ch9S8aeOedeeoBVlECN9/GU/TCsVjnDl/s74zIiRkztB63mmfD4YF0
3WwGJV+fHfJ8D2suELMUXi3I11vB2ikTwoYXOifhvJ8ntJYcm/KB1N3qr/h67NMcaLpEw2PJSJoW
SXB0Y59bsNV3a0kw3c9xKx8vjHnweyS9ud4bjA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
p12qQ+B01yVbviPkLocJDHS7+s2eJoqGRFgDU4lPZLda2G6Lw7XhgpUR/xbYuFTNPS5WNiIfYZfm
WPgpHQSsdXOywFaaDZBccjECp6yTMmQfmngfsnkOwz1NFU9IGrzMeXY+mh6SC7nYMtRKGtfad5iJ
7ExKOEIIdwDKVfC9lScyFnI8RJx4VZqhqza2oTDfa+mGz/hi/QEOeUU0lDd9cB93GNGqAroO2VyS
+Hr0Je6WFuS9zx9kADzlsZmGZ6XL3WncD/bHluzOfrbekiDCjqk925fzU3yCaFywfq6A9K6oy9Rk
FzJZ8z+YEo0UWuJVKvPbKwXZLvZ2Ras2fPWQTg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 16736)
`pragma protect data_block
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
`pragma protect end_protected
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
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
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
