// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Wed May 29 15:33:08 2019
// Host        : DESKTOP-BUCL8EC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/modem/vivado2017/semcoDemod.srcs/sources_1/ip/dds6p0/dds6p0_stub.v
// Design      : dds6p0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dds_compiler_v6_0_13,Vivado 2017.2" *)
module dds6p0(aclk, aclken, aresetn, s_axis_phase_tvalid, 
  s_axis_phase_tdata, m_axis_data_tvalid, m_axis_data_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,aclken,aresetn,s_axis_phase_tvalid,s_axis_phase_tdata[31:0],m_axis_data_tvalid,m_axis_data_tdata[47:0]" */;
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_phase_tvalid;
  input [31:0]s_axis_phase_tdata;
  output m_axis_data_tvalid;
  output [47:0]m_axis_data_tdata;
endmodule
