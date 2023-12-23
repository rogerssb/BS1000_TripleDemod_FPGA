// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Thu Oct 26 16:41:37 2023
// Host        : SEMCO_1039B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top systemClock -prefix
//               systemClock_ systemClock_stub.v
// Design      : systemClock
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module systemClock(clk1x, clk2x, clkOver2, locked, clkIn)
/* synthesis syn_black_box black_box_pad_pin="clk1x,clk2x,clkOver2,locked,clkIn" */;
  output clk1x;
  output clk2x;
  output clkOver2;
  output locked;
  input clkIn;
endmodule
