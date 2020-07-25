// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
// Date        : Mon May 25 17:48:45 2015
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim c:/modem/vivado/xc7k160t-IP/mpy18x18/mpy18x18_funcsim.v
// Design      : mpy18x18
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mpy18x18,mult_gen_v12_0,{}" *) (* core_generation_info = "mpy18x18,mult_gen_v12_0,{x_ipProduct=Vivado 2015.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=7,x_ipLanguage=VERILOG,x_ipSimLanguage=VERILOG,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=0,C_XDEVICEFAMILY=kintex7,C_HAS_CE=0,C_HAS_SCLR=1,C_LATENCY=3,C_A_WIDTH=18,C_A_TYPE=0,C_B_WIDTH=18,C_B_TYPE=0,C_OUT_HIGH=35,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "mult_gen_v12_0,Vivado 2015.1" *) 
(* NotValidForBitStream *)
module mpy18x18
   (CLK,
    A,
    B,
    SCLR,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [35:0]P;

  wire [17:0]A;
  wire [17:0]B;
  wire CLK;
  wire [35:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
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
  mpy18x18_mult_gen_v12_0 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "18" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "18" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "0" *) (* C_OUT_HIGH = "35" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintex7" *) (* ORIG_REF_NAME = "mult_gen_v12_0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mpy18x18_mult_gen_v12_0
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
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
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
  mpy18x18_mult_gen_v12_0_viv i_mult
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
MLDCAfBrXHOz9aaQhgnwYm3G7rOOwmAyASlYsrvFxuZau8wQ0Hf3+Z0Qky2l/fvmLbziGScqPS4Y
WLTlmW2eerpIKfcZ/noGPVWA4oKBVBHnULFQxn34erhZquvPNt36Ixi0BeAAf8C2y1XuqHhTMk39
EcB4wpPB+p6pECAtzLjo7tFTEWjObbO0hJa5KXl1s/KIBxws60wzk4b617zqu5/by4fJoRXe5IAf
eCnpHI3MOpwq1/rz5Az94yCucTHdAI7+NQxYXuqpb3ecZXGOxVuEGbyHKOshdAQOTsJwD0L74oIR
RcoRP+9LL8mNjSSHd2gBPFYDsU05AX+zsUXaUQ==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
L9WYRYvTV+owFw++vKl/RW81wN+3/a6f7Z/R6/wDunYeJfy9U7hHHOzUT1bjWSpNijDcT6QyA+Lx
yaMSVWcHFvAlQz9SPGnd4PQBq1ptj5IW1DfiWjSUL/nahNtK1/3SOrqDasTYvBhbiaL4uEy2z9+0
crXQ1fPGUo4nv6j+euuf5StIroZZoQkXS+p18DVF2PsQLCou9/P2J+YARkr4bTkOy91AABXHkvLJ
B2TtRnHugj5GsccBT1yUxf+2fy4iP3ao2a6b84eYfgU+QbuvBqxJDqucbKdy3xOVKzjedsQTmPNa
OsxKQDi9sUyEtdFspsgYGfGpmQSicylzg2Uw/A==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7632)
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
