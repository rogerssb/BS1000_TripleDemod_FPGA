// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Fri Jul  5 13:04:33 2019
// Host        : SEMCO1039 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top jitterFifo -prefix
//               jitterFifo_ jitterFifo_stub.v
// Design      : jitterFifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_4,Vivado 2017.2" *)
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
