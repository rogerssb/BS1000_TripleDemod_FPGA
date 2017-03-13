// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Mon Mar 13 11:23:23 2017
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub C:/modem/vivado/xc7k160t-IP/halfbandEven/halfbandEven_stub.v
// Design      : halfbandEven
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fir_compiler_v7_2_5,Vivado 2015.4" *)
module halfbandEven(aresetn, aclk, aclken, s_axis_data_tvalid, s_axis_data_tready, s_axis_data_tdata, m_axis_data_tvalid, m_axis_data_tuser, m_axis_data_tdata)
/* synthesis syn_black_box black_box_pad_pin="aresetn,aclk,aclken,s_axis_data_tvalid,s_axis_data_tready,s_axis_data_tdata[23:0],m_axis_data_tvalid,m_axis_data_tuser[0:0],m_axis_data_tdata[31:0]" */;
  input aresetn;
  input aclk;
  input aclken;
  input s_axis_data_tvalid;
  output s_axis_data_tready;
  input [23:0]s_axis_data_tdata;
  output m_axis_data_tvalid;
  output [0:0]m_axis_data_tuser;
  output [31:0]m_axis_data_tdata;
endmodule
