// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Sat Oct 29 14:51:14 2016
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub C:/modem/vivado/xc7k160t-IP/mpy18x18WithCe/mpy18x18WithCe_stub.v
// Design      : mpy18x18WithCe
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_10,Vivado 2015.4" *)
module mpy18x18WithCe(CLK, A, B, CE, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[17:0],B[17:0],CE,P[35:0]" */;
  input CLK;
  input [17:0]A;
  input [17:0]B;
  input CE;
  output [35:0]P;
endmodule
