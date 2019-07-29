// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Thu Jun  6 15:11:51 2019
// Host        : SEMCO1039 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top systemClock -prefix
//               systemClock_ systemClock_stub.v
// Design      : systemClock
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module systemClock(clk93, clk186, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk93,clk186,locked,clk_in1" */;
  output clk93;
  output clk186;
  output locked;
  input clk_in1;
endmodule
