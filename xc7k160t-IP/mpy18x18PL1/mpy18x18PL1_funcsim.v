// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
// Date        : Mon May 25 17:50:20 2015
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim c:/modem/vivado/xc7k160t-IP/mpy18x18PL1/mpy18x18PL1_funcsim.v
// Design      : mpy18x18PL1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mpy18x18PL1,mult_gen_v12_0,{}" *) (* core_generation_info = "mpy18x18PL1,mult_gen_v12_0,{x_ipProduct=Vivado 2015.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=7,x_ipLanguage=VERILOG,x_ipSimLanguage=VERILOG,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=0,C_XDEVICEFAMILY=kintex7,C_HAS_CE=0,C_HAS_SCLR=1,C_LATENCY=1,C_A_WIDTH=18,C_A_TYPE=0,C_B_WIDTH=18,C_B_TYPE=0,C_OUT_HIGH=35,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "mult_gen_v12_0,Vivado 2015.1" *) 
(* NotValidForBitStream *)
module mpy18x18PL1
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
  mpy18x18PL1_mult_gen_v12_0 U0
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
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "0" *) (* C_OUT_HIGH = "35" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintex7" *) (* ORIG_REF_NAME = "mult_gen_v12_0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mpy18x18PL1_mult_gen_v12_0
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
  mpy18x18PL1_mult_gen_v12_0_viv i_mult
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
opyblmSwd6/Hyk561a7I686YoMt6LJVIe2wgaPGC1MiFJd00kXarNYPDOdXckfkd8EveTnuq7IsQ
JPSIu9BTXMyqd8ehrWj8qow85KmWHXwohioRHYPTFgZzVtpPqpJZg0WpYR2XGlssWX2qF8tNAOcs
5FRIM3iegnhM4EUbq94sNHF8+AqVAqdml2IWRgffJihwUo3OPbx/Gi2p4yuru5+tF3TDy4Vu/IYV
ihMEEw20a2F70VnqAKT8TAsApwwngPeOgjkp4km4yYx+aeRBfcZPegnRpgyXx1mYcV6OMMoLk9Qs
RQ+Rdh5Xt6PmG/XOCL9CLvlGkFBub58eDIUwKg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
eWaIBdEVg+FQUWUYI4vmeV0YfwzIPN72aUJps/I1/E67LbEUaY9NDrRgvRRr72ykDG4XR6WqA26K
omtvHklertri2/tnh3piHNLUw9PImO9AFRMnJ/HNYXVcwI60MWYl0vG6MSPgJTpSpA+VBcNXn9iu
qwaQSTipjY8VEYxAC21ybn1e76MMwg3rdFh3vgzihujYvtvN4rreFHzTQjPKB9dvmRITxreE7tUV
EmaGRuaDq4LtRzFqULnSwvLv+MnIaucgaDF5vN7McIIDutm8+TXkgIbhS4LDWDU9BEUBFNgZd/Qb
bIA0tOufsPbPGtyi9J7mtHJOOMT7pjpcwvjdtw==


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
