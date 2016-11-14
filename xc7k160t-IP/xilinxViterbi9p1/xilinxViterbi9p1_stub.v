// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Mon Nov 14 12:40:59 2016
// Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub C:/modem/vivado/xc7k160t-IP/xilinxViterbi9p1/xilinxViterbi9p1_stub.v
// Design      : xilinxViterbi9p1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "viterbi_v9_1_5,Vivado 2015.4" *)
module xilinxViterbi9p1(aclk, aresetn, s_axis_data_tdata, s_axis_data_tvalid, s_axis_data_tready, m_axis_data_tdata, m_axis_data_tvalid, s_axis_dstat_tdata, s_axis_dstat_tvalid, m_axis_dstat_tdata, m_axis_dstat_tvalid)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_data_tdata[15:0],s_axis_data_tvalid,s_axis_data_tready,m_axis_data_tdata[7:0],m_axis_data_tvalid,s_axis_dstat_tdata[15:0],s_axis_dstat_tvalid,m_axis_dstat_tdata[15:0],m_axis_dstat_tvalid" */;
  input aclk;
  input aresetn;
  input [15:0]s_axis_data_tdata;
  input s_axis_data_tvalid;
  output s_axis_data_tready;
  output [7:0]m_axis_data_tdata;
  output m_axis_data_tvalid;
  input [15:0]s_axis_dstat_tdata;
  input s_axis_dstat_tvalid;
  output [15:0]m_axis_dstat_tdata;
  output m_axis_dstat_tvalid;
endmodule