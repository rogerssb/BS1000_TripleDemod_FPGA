// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
// Date        : Mon Feb 17 20:24:23 2020
// Host        : SEMCO_1039B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Semco/Vivado/Demods/Latest/stcDemod.srcs/sources_1/ip/halfbandEven/halfbandEven_stub.v
// Design      : halfbandEven
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fir_compiler_v7_2_8,Vivado 2017.2.1" *)
module halfbandEven(aresetn, aclk, aclken, s_axis_data_tvalid, 
  s_axis_data_tready, s_axis_data_tdata, m_axis_data_tvalid, m_axis_data_tuser, 
  m_axis_data_tdata)
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