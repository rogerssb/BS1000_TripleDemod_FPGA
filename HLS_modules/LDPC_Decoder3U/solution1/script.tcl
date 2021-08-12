############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LDPC_Decoder3U
set_top HLSLdpcLogDecScaledMin
add_files LDPC_Decoder3U/HLSLdpcLogDecScaledMin.cpp
add_files LDPC_Decoder3U/ldpc1024_1_2_1_trichk.h
add_files LDPC_Decoder3U/ldpc1024_1_2_2_trichk.h
add_files LDPC_Decoder3U/ldpc1024_1_2_trichk.h
add_files LDPC_Decoder3U/ldpc1024_2_3_1_trichk.h
add_files LDPC_Decoder3U/ldpc1024_2_3_2_trichk.h
add_files LDPC_Decoder3U/ldpc1024_2_3_3_trichk.h
add_files LDPC_Decoder3U/ldpc1024_2_3_4_trichk.h
add_files LDPC_Decoder3U/ldpc1024_2_3_trichk.h
add_files LDPC_Decoder3U/ldpc1024_4_5_1_trichk.h
add_files LDPC_Decoder3U/ldpc1024_4_5_2_trichk.h
add_files LDPC_Decoder3U/ldpc1024_4_5_3_trichk.h
add_files LDPC_Decoder3U/ldpc1024_4_5_4_trichk.h
add_files LDPC_Decoder3U/ldpc1024_4_5_5_trichk.h
add_files LDPC_Decoder3U/ldpc1024_4_5_6_trichk.h
add_files LDPC_Decoder3U/ldpc1024_4_5_trichk.h
add_files LDPC_Decoder3U/ldpc4096_1_2_1_trichk.h
add_files LDPC_Decoder3U/ldpc4096_1_2_2_trichk.h
add_files LDPC_Decoder3U/ldpc4096_1_2_trichk.h
add_files LDPC_Decoder3U/ldpc4096_2_3_1_trichk.h
add_files LDPC_Decoder3U/ldpc4096_2_3_2_trichk.h
add_files LDPC_Decoder3U/ldpc4096_2_3_3_trichk.h
add_files LDPC_Decoder3U/ldpc4096_2_3_4_trichk.h
add_files LDPC_Decoder3U/ldpc4096_2_3_trichk.h
add_files LDPC_Decoder3U/ldpc4096_4_5_1_trichk.h
add_files LDPC_Decoder3U/ldpc4096_4_5_2_trichk.h
add_files LDPC_Decoder3U/ldpc4096_4_5_3_trichk.h
add_files LDPC_Decoder3U/ldpc4096_4_5_4_trichk.h
add_files LDPC_Decoder3U/ldpc4096_4_5_5_trichk.h
add_files LDPC_Decoder3U/ldpc4096_4_5_6_trichk.h
add_files LDPC_Decoder3U/ldpc4096_4_5_trichk.h
add_files -tb LDPC_Decoder3U/LDPC_Decoder_check.cpp
add_files -tb LDPC_Decoder3U/LDPC_Decoder_parms.h
add_files -tb LDPC_Decoder3U/Txcode_1024_23.h
add_files -tb LDPC_Decoder3U/ldpc1024_23.h
add_files -tb LDPC_Decoder3U/ldpc4096_45_code.h
add_files -tb LDPC_Decoder3U/ldpc4096_45_data.h
add_files -tb LDPC_Decoder3U/ldpc4096_45_info.h
add_files -tb LDPC_Decoder3U/txword.h
open_solution "solution1"
set_part {xc7k160tfbg676-1} -tool vivado
create_clock -period 10 -name default
source "./LDPC_Decoder3U/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
