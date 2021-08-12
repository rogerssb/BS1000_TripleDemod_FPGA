
log_wave [get_objects -filter {type == in_port || type == out_port || type == inout_port || type == port} /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/*]
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set cur_read_pos_group [add_wave_group cur_read_pos(wire) -into $coutputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/cur_read_pos_V_ap_vld -into $cur_read_pos_group -color #ffff00 -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/cur_read_pos_V -into $cur_read_pos_group -radix hex
set data_out_group [add_wave_group data_out(wire) -into $coutputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/data_out_ap_vld -into $data_out_group -color #ffff00 -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/data_out -into $data_out_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set mem_out7_group [add_wave_group mem_out7(memory) -into $cinputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out7_q0 -into $mem_out7_group -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out7_ce0 -into $mem_out7_group -color #ffff00 -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out7_address0 -into $mem_out7_group -radix hex
set mem_out6_group [add_wave_group mem_out6(memory) -into $cinputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out6_q0 -into $mem_out6_group -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out6_ce0 -into $mem_out6_group -color #ffff00 -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out6_address0 -into $mem_out6_group -radix hex
set mem_out5_group [add_wave_group mem_out5(memory) -into $cinputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out5_q0 -into $mem_out5_group -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out5_ce0 -into $mem_out5_group -color #ffff00 -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out5_address0 -into $mem_out5_group -radix hex
set mem_out4_group [add_wave_group mem_out4(memory) -into $cinputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out4_q0 -into $mem_out4_group -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out4_ce0 -into $mem_out4_group -color #ffff00 -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out4_address0 -into $mem_out4_group -radix hex
set mem_out3_group [add_wave_group mem_out3(memory) -into $cinputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out3_q0 -into $mem_out3_group -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out3_ce0 -into $mem_out3_group -color #ffff00 -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out3_address0 -into $mem_out3_group -radix hex
set mem_out2_group [add_wave_group mem_out2(memory) -into $cinputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out2_q0 -into $mem_out2_group -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out2_ce0 -into $mem_out2_group -color #ffff00 -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out2_address0 -into $mem_out2_group -radix hex
set mem_out1_group [add_wave_group mem_out1(memory) -into $cinputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out1_q0 -into $mem_out1_group -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out1_ce0 -into $mem_out1_group -color #ffff00 -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out1_address0 -into $mem_out1_group -radix hex
set mem_out0_group [add_wave_group mem_out0(memory) -into $cinputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out0_q0 -into $mem_out0_group -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out0_ce0 -into $mem_out0_group -color #ffff00 -radix hex
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/mem_out0_address0 -into $mem_out0_group -radix hex
set rd_mux_group [add_wave_group rd_mux(wire) -into $cinputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/rd_mux -into $rd_mux_group -radix hex
set rd_clk_in_group [add_wave_group rd_clk_in(wire) -into $cinputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/rd_clk_in -into $rd_clk_in_group -radix hex
set block_group [add_wave_group block(wire) -into $cinputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/block_V -into $block_group -radix hex
set reset_group [add_wave_group reset(wire) -into $cinputgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/reset -into $reset_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/ap_start -into $blocksiggroup
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/ap_done -into $blocksiggroup
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/ap_idle -into $blocksiggroup
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/ap_rst -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_LDPC_Out_top/AESL_inst_LDPC_Out/ap_clk -into $clockgroup
save_wave_config LDPC_Out.wcfg
run all
quit

