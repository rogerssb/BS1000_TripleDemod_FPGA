// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
// Date        : Mon Dec  2 18:58:55 2019
// Host        : SEMCO_1039B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top Fifo8k4to1 -prefix
//               Fifo8k4to1_ Fifo8k4to1_stub.v
// Design      : Fifo8k4to1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_4,Vivado 2017.2.1" *)
module Fifo8k4to1(clk, srst, din, wr_en, rd_en, dout, full, empty, 
  wr_data_count, prog_full)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[3:0],wr_en,rd_en,dout[0:0],full,empty,wr_data_count[13:0],prog_full" */;
  input clk;
  input srst;
  input [3:0]din;
  input wr_en;
  input rd_en;
  output [0:0]dout;
  output full;
  output empty;
  output [13:0]wr_data_count;
  output prog_full;
endmodule
