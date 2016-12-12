// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Thu Dec 08 13:35:54 2016
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub C:/modem/vivado/xc7k160t-IP/systemClock/systemClock_stub.v
// Design      : systemClock
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module systemClock(clk_in1, clk_out1, locked)
/* synthesis syn_black_box black_box_pad_pin="clk_in1,clk_out1,locked" */;
  input clk_in1;
  output clk_out1;
  output locked;
endmodule
