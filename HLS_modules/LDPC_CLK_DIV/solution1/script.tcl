############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LDPC_CLK_DIV
set_top LDPC_Div
add_files LDPC_CLK_DIV/LDPC_Div.cpp
add_files -tb LDPC_CLK_DIV/out_bench.cpp
open_solution "solution1"
set_part {xc7k160tfbg676-1} -tool vivado
create_clock -period 10 -name default
#source "./LDPC_CLK_DIV/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
