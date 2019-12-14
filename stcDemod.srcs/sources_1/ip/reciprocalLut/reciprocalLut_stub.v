// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
// Date        : Fri Dec 13 22:22:51 2019
// Host        : SEMCO_1039B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Semco/Vivado/Demods/stcDemod.srcs/sources_1/ip/reciprocalLut/reciprocalLut_stub.v
// Design      : reciprocalLut
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_11,Vivado 2017.2.1" *)
module reciprocalLut(a, spo)
/* synthesis syn_black_box black_box_pad_pin="a[4:0],spo[17:0]" */;
  input [4:0]a;
  output [17:0]spo;
endmodule
