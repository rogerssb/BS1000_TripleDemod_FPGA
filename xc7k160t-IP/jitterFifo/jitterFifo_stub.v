// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Mon Aug 21 17:39:27 2023
// Host        : DESKTOP-6PPS5M0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub C:/modem/vivado/xc7k160t-IP/jitterFifo/jitterFifo_stub.v
// Design      : jitterFifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_3,Vivado 2016.4" *)
module jitterFifo(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  empty, prog_full)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[2:0],wr_en,rd_en,dout[2:0],full,empty,prog_full" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [2:0]din;
  input wr_en;
  input rd_en;
  output [2:0]dout;
  output full;
  output empty;
  output prog_full;
endmodule
