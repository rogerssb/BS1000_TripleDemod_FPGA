############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LDPC_CTRL
set_top LDPC_CTRL
add_files LDPC_CTRL/LDPC_CTRL.cpp
add_files -tb LDPC_CTRL/LDPC_CTRL_TEST.cpp
open_solution "solution1"
set_part {xc7k160tffv676-2}
create_clock -period 10 -name default
#source "./LDPC_CTRL/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
