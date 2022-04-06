// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Wed Mar 30 10:08:07 2022
// Host        : DESKTOP-T5IKR3F running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top fifoFft -prefix
//               fifoFft_ fifoFft_stub.v
// Design      : fifoFft
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_3,Vivado 2016.4" *)
module fifoFft(clk, rst, din, wr_en, rd_en, dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,din[22:0],wr_en,rd_en,dout[22:0],full,empty" */;
  input clk;
  input rst;
  input [22:0]din;
  input wr_en;
  input rd_en;
  output [22:0]dout;
  output full;
  output empty;
endmodule
