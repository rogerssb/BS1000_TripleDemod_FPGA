// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
// Date        : Thu Aug 18 17:10:54 2022
// Host        : SEMCO_1039B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Semco/Vivado/Demods2016/xc7k160t-IP/systemClock/systemClock_stub.v
// Design      : systemClock
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module systemClock(clk_out1, clk2x, clkOver2, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk2x,clkOver2,locked,clk_in1" */;
  output clk_out1;
  output clk2x;
  output clkOver2;
  output locked;
  input clk_in1;
endmodule
