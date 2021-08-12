############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LDCP_data_buffer_mult
set_top LDPC_buff
add_files LDCP_data_buffer_mult/LDPC_buff.cpp
add_files -tb LDCP_data_buffer_mult/buff_bench.cpp
open_solution "solution1"
set_part {xc7k160tfbg676-1} -tool vivado
create_clock -period 10 -name default
source "./LDCP_data_buffer_mult/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
