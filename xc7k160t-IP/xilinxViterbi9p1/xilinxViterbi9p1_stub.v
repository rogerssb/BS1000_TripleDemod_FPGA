// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Thu Oct 26 16:42:37 2023
// Host        : SEMCO_1039B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top xilinxViterbi9p1 -prefix
//               xilinxViterbi9p1_ xilinxViterbi9p1_stub.v
// Design      : xilinxViterbi9p1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "viterbi_v9_1_7,Vivado 2016.4" *)
module xilinxViterbi9p1(aclk, aresetn, s_axis_data_tdata, 
  s_axis_data_tvalid, s_axis_data_tready, m_axis_data_tdata, m_axis_data_tvalid, 
  s_axis_dstat_tdata, s_axis_dstat_tvalid, m_axis_dstat_tdata, m_axis_dstat_tvalid)
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
