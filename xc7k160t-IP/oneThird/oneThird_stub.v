// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
// Date        : Thu May 28 15:07:30 2015
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub c:/modem/vivado/xc7k160t-IP/oneThird/oneThird_stub.v
// Design      : oneThird
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0,Vivado 2015.1" *)
module oneThird(CLK, A, CE, SCLR, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[11:0],CE,SCLR,P[21:0]" */;
  input CLK;
  input [11:0]A;
  input CE;
  input SCLR;
  output [21:0]P;
endmodule
