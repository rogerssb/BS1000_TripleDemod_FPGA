############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LDPC_Out
set_top LDPC_Out
add_files LDPC_Out/LDPC_Out.cpp
add_files -tb LDPC_Out/Out_bench.cpp
open_solution "solution2"
set_part {xc7k160tfbg676-1}
create_clock -period 10 -name default
source "./LDPC_Out/solution2/directives.tcl"
csim_design -clean
csynth_design
cosim_design -trace_level port
export_design -rtl verilog -format ip_catalog
