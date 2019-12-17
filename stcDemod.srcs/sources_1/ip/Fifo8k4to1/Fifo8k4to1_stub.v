// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
// Date        : Sun Dec 15 10:09:28 2019
// Host        : SEMCO_1039B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Semco/Vivado/Demods/stcDemod.srcs/sources_1/ip/Fifo8k4to1/Fifo8k4to1_stub.v
// Design      : Fifo8k4to1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_4,Vivado 2017.2.1" *)
module Fifo8k4to1(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  empty, wr_data_count, prog_full)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[3:0],wr_en,rd_en,dout[0:0],full,empty,wr_data_count[12:0],prog_full" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [3:0]din;
  input wr_en;
  input rd_en;
  output [0:0]dout;
  output full;
  output empty;
  output [12:0]wr_data_count;
  output prog_full;
endmodule
