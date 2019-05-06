// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Tue Dec 13 11:17:55 2016
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               C:/modem/telemetry/stcDemod/xc7k160t-IP-Vivado2015p1/mpy18x18/mpy18x18_sim_netlist.v
// Design      : mpy18x18
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k160tfbg676-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mpy18x18,mult_gen_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_12,Vivado 2016.3" *) 
(* NotValidForBitStream *)
module mpy18x18
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [35:0]P;

  wire [17:0]A;
  wire [17:0]B;
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
  (* C_HAS_CE = "0" *) 
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
  mpy18x18_mult_gen_v12_0_12 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "18" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "18" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "0" *) (* C_OUT_HIGH = "35" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintex7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_12" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mpy18x18_mult_gen_v12_0_12
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

  wire \<const0> ;
  wire [17:0]A;
  wire [17:0]B;
  wire CLK;
  wire [35:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
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
  mpy18x18_mult_gen_v12_0_12_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
ptQ11ybvPhWFWTGrQo+7aGiIrH8JSyStYCUMOokDd+PPciOFrFMMChXZiWtXJpOf7mbM0kEZiv4j
8DmUfBzUqA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
h7OV9pYIwlKexYbVHsWdzIEKTz/iMtv4WoHaiiFghx8qJgOhdd3wDRYkR/B3E7hVYy2COcm5APup
qDYlt3IyeqL2N2RRoMmBVxAFJV6hCj9YEbUb0otyQAVPBaiI1FPjO5xFS/hWO1jK5vhJcsLkQea9
6DEIF8FtNNea1Mq/r2g=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
yy9Y6935bfig13W64uvBPEigKN5XmZP8d556jHobEKImEuxxAt50ZM5SYJfQ1cgV5QpGyGKq18LA
Ie4kVwsXuT7UsN6x8vh4jEf9eSPrjCkgrPb99+DcdRsMyS00rDCx+sglhqDRhi5OxUEkR5awg1YX
vN35O9p+48WxNYR2UC8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LZ+Jei6Dhl0h8Ft9kcSvaV7R4LftS48PATOUDxiNHixlA4BISf+lTaHLokYqG/GSOnLHxh8j6OxI
CW5SQEIloeTqRLfWEkpRzf9BKkCQOnwQZDJUvuYvW7WYQ6oQjERuGCZQVnkgpor3EtMfWSZ8YsAx
azYt49bgzZfdUTCKUgeEVEMKVshHGMBIhvTs9KkcKPz8JGeMDL5oeYdFzdkVYjPP4aev0U6zPMBs
JZ9E/7nvtBBV2vKhLY7U3X7iTZ1ePFeESc78t32tjGtG0yeSiNZq81Tw6u3srMRLOBkZoVVnCxhr
9QuVk5MuIbODepMZeZdBdNAQI/tre1Gq0gszrw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ngLIkvfW2Uts9POUsqaNJVpzIpWiCvRaKpZydG/SMwUuE3+JnTqAnNfvtZqO6SfqEzFsZu81jGwf
i3H8ALoDKBU2C9TYxmcx8GPDKo7Yp6Kvwm6+7rgm/u3Kwz3nqXCsy9/XYu++7beiX7e7DQVq3SpR
9U6+c/Hvxf1pFrCZZ5syxFGQMW6m7t5l1IO0A29eP4lBomyF+TQfc+IF8gSheDIJBglOjgfGNB6w
5Y8qVfUIS1UEnBiw/87uMLVmf6BpaHABhPRyfJCdqk8lnmkNqRYgn+04VHoeSBQK3RrLON/eSu0R
m8/U44v2OuxzhQtGethkZXEmkn07ZADBgPU1fA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
T8B0w4NG7VzeSrv6OfcmA/Seybv/XseY7U8GEUORMIAwScQx2Z03UxA5e8Bhk/8hBThPu3c4qGXU
eoaU8I28PfmXT+H374KJfpPGeml3gk2eoTP/G4knHDpHTMJM8WdxRt8HBkMNrVGCTjNNJJiNL4x4
5MLjx5MIEs4FN84QBEtV7OaK2Db/KUAZVg9taAs96bhLMwoWhqovfFQMq44lVcgN45iFCZSvOMe9
YRTMUjxireq4/GqruP/WKQ3+VOBTyqfeHyw1WEd0W5Ihmbf/LsRlgkVDHAeb1ngltDXSSiOQpOC8
ZwXOYiOCNlJqGiE2Ffd8kQMyoibJpcoCKTzd6w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
ajfOuRSkzN0ubP32COsXY8/6PIu27mVYvi/5KonUgmITYupAUKBWVkpQZrdtqKhkhV73jSF/CkBT
WLsFlyf9pS6cV4lR3oG2xzbp9WZGINF+esZL7+KfKu+sUhKIMnE3fT9qvzDWEOowruo3IxFgiV3t
rpOg/j2K7AoQL+EAUMz2zvi1RutEIhASx0gbL/3AWNhiaEIsQLZcSMEVcfWD5SLhtLm1AranlPDz
2POY/1qrMBagtx5u+TpvHzm32/KP7DSHroi734OhWzI+wZN8EQIbdRZbZJrt8lL+CLwbXsG9r50K
umUvMql3Mehn/SLJm/myO5rVsFYdIEDEL/QqFw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
O+aWLSERvTqr4qz+jNZA0xtHYxTONNT53Zzo2pNA5Lq00UHg7OROTaJGYrr8FHrQGBsFVe4PycnX
jq0G6xje14qVJIGzPoLf7MYYbtEdFTS8JHfGxDdXXgAhWUtX9RfIyTTJ9Q/qW/JxClc2Y+DBUICl
s4jUbKqh+lp5oRfl1VU9dp09vbz+ldCTP0uXnc6EJUXGTAG71IzOs7I5nk7b+NmusrWE6/hoH1WW
9kG0l2nMmuNs2myfOcp/pzLEBeQiVnNKioqpXLnaUUAqN9NxPGkn2pknxYfkeAwm72TzTbH/Tp3S
AoYGlfRoxSoSG3D5Z8N1qBadwq7ozy8NZEm84A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7536)
`pragma protect data_block
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
TzILFtzi3PefAKK+
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
