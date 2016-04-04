// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
// Date        : Thu May 28 15:00:40 2015
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim c:/modem/vivado/xc7k160t-IP/mpy18x18WithCe/mpy18x18WithCe_funcsim.v
// Design      : mpy18x18WithCe
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mpy18x18WithCe,mult_gen_v12_0,{}" *) (* core_generation_info = "mpy18x18WithCe,mult_gen_v12_0,{x_ipProduct=Vivado 2015.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=7,x_ipLanguage=VERILOG,x_ipSimLanguage=VERILOG,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=0,C_XDEVICEFAMILY=kintex7,C_HAS_CE=1,C_HAS_SCLR=0,C_LATENCY=1,C_A_WIDTH=18,C_A_TYPE=0,C_B_WIDTH=18,C_B_TYPE=0,C_OUT_HIGH=35,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "mult_gen_v12_0,Vivado 2015.1" *) 
(* NotValidForBitStream *)
module mpy18x18WithCe
   (CLK,
    A,
    B,
    CE,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [35:0]P;

  wire [17:0]A;
  wire [17:0]B;
  wire CE;
  wire CLK;
  wire [35:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "0" *) 
  (* C_OUT_HIGH = "35" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* DONT_TOUCH *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mpy18x18WithCe_mult_gen_v12_0 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "18" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "18" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "0" *) (* C_OUT_HIGH = "35" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintex7" *) (* ORIG_REF_NAME = "mult_gen_v12_0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mpy18x18WithCe_mult_gen_v12_0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [17:0]A;
  input [17:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [35:0]P;
  output [47:0]PCASC;

  wire [17:0]A;
  wire [17:0]B;
  wire CE;
  wire CLK;
  wire [35:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "0" *) 
  (* C_OUT_HIGH = "35" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mpy18x18WithCe_mult_gen_v12_0_viv i_mult
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
JuNE9lBO7or6SzzIWXZYFtNezzLHPXli+xqg1kPOLl6P7fTTxx0NZB0DkRdfzb13+FFj+DLQPt5M
x4/STEKZy1uihC7BTvKLWYhoFGlW/vk1wwQtXlumF0CLRX2tdVE8JAZPkB3x08j45garaM3KRVdc
xoLlW8XLxIugGR1Sx0NVqbTcsPC92z5PQyE5qPcI9QOz3MKdapWtHGF2oK+WIzlDwt8WFkD8DnuD
wZUDITu8pCfBRZtmAn3/3glKeUu3gbKkVUYT3mg/z8QJNHtKkiW1dYB7+5j6Gj+iSBhSdDDwZJk2
tEcxutpFzfO45hDcz5u0I9GJp+320ekiUnZrAg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
S3nUNRYOrt6l3KpJlt3kodpwyWHBi72a5yqRcxvrLrzOo769MdIBjDHpQOSK9nzuV+4SRmDNCJSH
mfAnlhyCjcprSSGvyKG1eBiv0ORpl2SiWQO9MeoiVMMklwwSM3VyUogxLMhbqXBu8BID1jyZLk3B
bF+rgnuhV4GlxiEjcH5bIvgdeCeggfBUlfTAn/rLzAuSkQaHEi/ooS8tTwSfpR4tUNAbLKRkJHrX
MTjCnnA1rXWmw7klz7jpKO7mYLKUmgqudrvrqi2Eago339E2Wx4NeIE4vDksOjMW2lHecr2nqkia
kVivoxsF0Jok60tlJBOJgXMHUlewRRaOS8Nylw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7616)
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
