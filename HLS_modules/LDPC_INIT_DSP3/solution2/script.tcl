############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LDPC_INIT_DSP3
set_top setupLDPC
add_files LDPC_INIT_DSP3/newtabs4096.h
add_files LDPC_INIT_DSP3/newtabs1024.h
add_files LDPC_INIT_DSP3/LDPC_INIT_DSP3.cpp
add_files -tb LDPC_INIT_DSP3/LDPC_INT_TEST.cpp
open_solution "solution2"
set_part {xc7k160tffv676-2}
create_clock -period 10 -name default
source "./LDPC_INIT_DSP3/solution2/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
