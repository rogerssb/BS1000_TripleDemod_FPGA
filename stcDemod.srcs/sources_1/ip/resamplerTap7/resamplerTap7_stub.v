// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Wed May 29 15:38:07 2019
// Host        : DESKTOP-BUCL8EC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/modem/vivado2017/semcoDemod.srcs/sources_1/ip/resamplerTap7/resamplerTap7_stub.v
// Design      : resamplerTap7
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_11,Vivado 2017.2" *)
module resamplerTap7(a, spo)
/* synthesis syn_black_box black_box_pad_pin="a[4:0],spo[17:0]" */;
  input [4:0]a;
  output [17:0]spo;
endmodule
