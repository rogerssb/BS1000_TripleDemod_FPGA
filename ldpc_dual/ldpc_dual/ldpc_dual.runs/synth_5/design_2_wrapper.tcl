# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7k160tfbg676-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/ldpc_dual/ldpc_dual/ldpc_dual.cache/wt [current_project]
set_property parent.project_path C:/ldpc_dual/ldpc_dual/ldpc_dual.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths {
  c:/ldpc_dual/ldpc_dual
  c:/Users/dougo/LDPC_Decoder3U
  c:/Users/dougo/LDPC_DecoderU
  c:/Users/dougo/LDPC_DecoderT
  c:/Users/dougo/LDPC_DecoderP
  c:/Users/dougo/LDPC_DecoderM
  c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs
  {c:/ldpctest/ldpc test}
  c:/Users/dougo/LDPC_CLK_DIV
  c:/Users/dougo/LDCP_data_buffer_mult
  c:/Users/dougo/LDPC_DecoderJ
  c:/Users/dougo/LDPC_DecoderF
  c:/Users/dougo/LDPC_DecoderH
  c:/Users/dougo/LDPC_DecoderE
  c:/Users/dougo/LDPC_DecoderC
  c:/Users/dougo/LDPC_DecoderB
  c:/Users/dougo/LDPC_Out/solution1/impl
  {c:/ldpctest/ldpc test/ldpc test.srcs/sources_1}
  c:/Users/dougo/AppData/Roaming/Xilinx/ip_repo
  c:/Users/dougo/LDPC_Decoder/solution16_K7/impl
  c:/Users/dougo/LDPC_CTRL/solution1/impl
  c:/Users/dougo/LDPC_INIT_DSP3/solution2/impl
  c:/Users/dougo/LDPC_data_buffer/solution1/impl
} [current_project]
set_property ip_output_repo c:/ldpc_dual/ldpc_dual/ldpc_dual.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib C:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/hdl/design_2_wrapper.v
add_files C:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/design_2.bd
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_HLSLdpcLogDecScaledMin_0_0/constraints/HLSLdpcLogDecScaledMin_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_setupLDPC_0_0/constraints/setupLDPC_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_blk_mem_gen_0_3/design_2_blk_mem_gen_0_3_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_0_0/design_2_raw_data_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_blk_mem_gen_0_4/design_2_blk_mem_gen_0_4_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_0_0/design_2_decode_data_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_LDPC_CTRL_0_0/constraints/LDPC_CTRL_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_c_addsub_0_1/design_2_c_addsub_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_c_addsub_0_2/design_2_c_addsub_0_2_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_c_addsub_2_0/design_2_c_addsub_2_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_c_addsub_3_0/design_2_c_addsub_3_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_c_addsub_3_1/design_2_c_addsub_3_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_c_addsub_4_0/design_2_c_addsub_4_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_c_addsub_5_0/design_2_c_addsub_5_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_c_addsub_6_0/design_2_c_addsub_6_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_c_addsub_0_0/design_2_c_addsub_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_c_addsub_8_0/design_2_c_addsub_8_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_c_addsub_8_1/design_2_c_addsub_8_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_mux_lat_0/design_2_mux_lat_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_buff_start_lat_0/design_2_buff_start_lat_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_mux_lat_1/design_2_mux_lat_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_start_lat_0/design_2_decode_start_lat_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_LDPC_Out_0_0/constraints/LDPC_Out_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_mux_lat_2/design_2_mux_lat_2_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_LDPC_buff_0_0/constraints/LDPC_buff_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_a_0/design_2_raw_data_a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_b_0/design_2_raw_data_b_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_a1_0/design_2_raw_data_a1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_b1_0/design_2_raw_data_b1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_a2_0/design_2_raw_data_a2_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_b2_0/design_2_raw_data_b2_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_a3_0/design_2_raw_data_a3_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_b3_0/design_2_raw_data_b3_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_a4_0/design_2_raw_data_a4_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_b4_0/design_2_raw_data_b4_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_a5_0/design_2_raw_data_a5_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_b5_0/design_2_raw_data_b5_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_a6_0/design_2_raw_data_a6_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_b6_0/design_2_raw_data_b6_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_a7_0/design_2_raw_data_a7_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_b7_0/design_2_raw_data_b7_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_a8_0/design_2_raw_data_a8_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_raw_data_b8_0/design_2_raw_data_b8_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_LDPC_Div_0_0/constraints/LDPC_Div_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_a_0_0/design_2_decode_data_a_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_b_0_0/design_2_decode_data_b_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_b_1_0/design_2_decode_data_b_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_a_1_0/design_2_decode_data_a_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_b_2_0/design_2_decode_data_b_2_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_a_2_0/design_2_decode_data_a_2_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_b_3_0/design_2_decode_data_b_3_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_a_3_0/design_2_decode_data_a_3_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_b_4_0/design_2_decode_data_b_4_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_a_4_0/design_2_decode_data_a_4_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_b_5_0/design_2_decode_data_b_5_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_a_5_0/design_2_decode_data_a_5_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_b_6_0/design_2_decode_data_b_6_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_data_a_6_0/design_2_decode_data_a_6_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_HLSLdpcLogDecScaledMin_0_1/constraints/HLSLdpcLogDecScaledMin_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_itt_num_lat_0/design_2_itt_num_lat_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/ip/design_2_decode_start_lat_1/design_2_decode_start_lat_1_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/design_2_ooc.xdc]
set_property is_locked true [get_files C:/ldpc_dual/ldpc_dual/ldpc_dual.srcs/sources_1/bd/design_2/design_2.bd]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top design_2_wrapper -part xc7k160tfbg676-1


write_checkpoint -force -noxdef design_2_wrapper.dcp

catch { report_utilization -file design_2_wrapper_utilization_synth.rpt -pb design_2_wrapper_utilization_synth.pb }
