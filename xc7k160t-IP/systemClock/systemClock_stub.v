// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Sat Mar  9 17:44:17 2019
// Host        : SEMCO1039 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Semco/Vivado/BS1000_Demod_vivado2017/xc7k160t-IP/systemClock/systemClock_stub.v
// Design      : systemClock
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module systemClock(clk93, clk31, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk93,clk31,reset,locked,clk_in1" */;
  output clk93;
  output clk31;
  input reset;
  output locked;
  input clk_in1;
endmodule
