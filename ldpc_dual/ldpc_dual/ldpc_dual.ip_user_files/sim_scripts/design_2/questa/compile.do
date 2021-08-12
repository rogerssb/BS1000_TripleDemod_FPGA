vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/blk_mem_gen_v8_3_4
vlib msim/xbip_utils_v3_0_7
vlib msim/c_reg_fd_v12_0_3
vlib msim/xbip_dsp48_wrapper_v3_0_4
vlib msim/xbip_pipe_v3_0_3
vlib msim/xbip_dsp48_addsub_v3_0_3
vlib msim/xbip_addsub_v3_0_3
vlib msim/c_addsub_v12_0_10
vlib msim/util_vector_logic_v2_0

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap blk_mem_gen_v8_3_4 msim/blk_mem_gen_v8_3_4
vmap xbip_utils_v3_0_7 msim/xbip_utils_v3_0_7
vmap c_reg_fd_v12_0_3 msim/c_reg_fd_v12_0_3
vmap xbip_dsp48_wrapper_v3_0_4 msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_3 msim/xbip_pipe_v3_0_3
vmap xbip_dsp48_addsub_v3_0_3 msim/xbip_dsp48_addsub_v3_0_3
vmap xbip_addsub_v3_0_3 msim/xbip_addsub_v3_0_3
vmap c_addsub_v12_0_10 msim/c_addsub_v12_0_10
vmap util_vector_logic_v2_0 msim/util_vector_logic_v2_0

vlog -work xil_defaultlib -64 -sv \
"C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/calc_ma.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/calc_n.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/calc_n_12.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/calc_n_23.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/HLSLdpcLogDecScal3i2.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/HLSLdpcLogDecScal8jQ.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/HLSLdpcLogDecScalbvn.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/HLSLdpcLogDecScalcGz.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/HLSLdpcLogDecScaldAI.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/HLSLdpcLogDecScaldeE.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/HLSLdpcLogDecScaldiF.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/HLSLdpcLogDecScaldjF.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/HLSLdpcLogDecScaledMin.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/load_pest_12_bot.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/load_pest_12_top.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/load_pest_all.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/load_pest_all_23.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_12.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_12_varinxbkb.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_12_varinxcud.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_12_varinxdEe.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_12_varinxeOg.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_12_varinxfYi.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_12_varinxg8j.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_12_varinxhbi.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_12_varinxibs.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_12_varinxjbC.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_12_varinxkbM.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxAem.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxBew.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxCeG.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxlbW.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxmb6.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxncg.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxocq.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxpcA.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxqcK.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxrcU.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxsc4.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxtde.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxudo.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxvdy.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxwdI.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxxdS.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxyd2.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_23_varinxzec.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18AEe0.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18AFfa.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18AGfk.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18AHfu.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18AIfE.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18AJfO.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18ARg6.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18AShg.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18AThq.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18AUhA.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18AVhK.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18AWhU.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18B0iy.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18B1iI.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18B2iS.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18BKfY.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18BLf8.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18BMgi.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18BNgs.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18BOgC.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18BPgM.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18BXh4.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18BYie.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx18BZio.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx3_1DeQ.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcAA_varinx3_4QgW.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcB.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcC.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcD.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcE.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcF.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/mcalcG.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/setup_calc.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/setup_calc_12.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/setup_calc_23.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/update_hat_all.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/update_lam_all.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/update_lam_all_12.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/update_lam_all_23.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/write_result.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/write_result_12.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/32b0/hdl/verilog/write_result_23.v" \
"../../../bd/design_2/ip/design_2_HLSLdpcLogDecScaledMin_0_0/sim/design_2_HLSLdpcLogDecScaledMin_0_0.v" \
"../../../../ldpc_dual.srcs/sources_1/ipshared/ecf4/hdl/verilog/setupLDPC.v" \
"../../../bd/design_2/ip/design_2_setupLDPC_0_0/sim/design_2_setupLDPC_0_0.v" \

vlog -work blk_mem_gen_v8_3_4 -64 \
"../../../../ldpc_dual.srcs/sources_1/bd/design_2/ipshared/59b0/simulation/blk_mem_gen_v8_3.v" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_blk_mem_gen_0_3/sim/design_2_blk_mem_gen_0_3.v" \
"../../../bd/design_2/ip/design_2_raw_data_0_0/sim/design_2_raw_data_0_0.v" \
"../../../bd/design_2/ip/design_2_blk_mem_gen_0_4/sim/design_2_blk_mem_gen_0_4.v" \
"../../../bd/design_2/ip/design_2_decode_data_0_0/sim/design_2_decode_data_0_0.v" \

vcom -work xbip_utils_v3_0_7 -64 -93 \
"../../../../ldpc_dual.srcs/sources_1/bd/design_2/ipshared/6fc3/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_3 -64 -93 \
"../../../../ldpc_dual.srcs/sources_1/bd/design_2/ipshared/e1e2/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 -93 \
"../../../../ldpc_dual.srcs/sources_1/bd/design_2/ipshared/1e87/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_3 -64 -93 \
"../../../../ldpc_dual.srcs/sources_1/bd/design_2/ipshared/7db8/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_3 -64 -93 \
"../../../../ldpc_dual.srcs/sources_1/bd/design_2/ipshared/c9c4/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_3 -64 -93 \
"../../../../ldpc_dual.srcs/sources_1/bd/design_2/ipshared/2957/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_10 -64 -93 \
"../../../../ldpc_dual.srcs/sources_1/bd/design_2/ipshared/a394/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_data_mux_0/sim/design_2_data_mux_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../../ldpc_dual.srcs/sources_1/ipshared/0673/hdl/verilog/LDPC_CTRL.v" \
"../../../bd/design_2/ip/design_2_LDPC_CTRL_0_0/sim/design_2_LDPC_CTRL_0_0.v" \
"../../../bd/design_2/ipshared/e147/xlconstant.v" \
"../../../bd/design_2/ip/design_2_xlconstant_0_0/sim/design_2_xlconstant_0_0.v" \

vcom -work util_vector_logic_v2_0 -64 -93 \
"../../../bd/design_2/ipshared/1d19/hdl/util_vector_logic.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_util_vector_logic_0_0/sim/design_2_util_vector_logic_0_0.vhd" \
"../../../bd/design_2/ip/design_2_data_ce_mux_0/sim/design_2_data_ce_mux_0.vhd" \
"../../../bd/design_2/ip/design_2_data_ce_mux_1/sim/design_2_data_ce_mux_1.vhd" \
"../../../bd/design_2/ip/design_2_data_ce_mux_2/sim/design_2_data_ce_mux_2.vhd" \
"../../../bd/design_2/ip/design_2_raw_ce_mux2_0/sim/design_2_raw_ce_mux2_0.vhd" \
"../../../bd/design_2/ip/design_2_util_vector_logic_0_1/sim/design_2_util_vector_logic_0_1.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_xlconstant_1_0/sim/design_2_xlconstant_1_0.v" \
"../../../bd/design_2/hdl/design_2.v" \
"../../../bd/design_2/ip/design_2_xlconstant_2_0/sim/design_2_xlconstant_2_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_c_addsub_0_1/sim/design_2_c_addsub_0_1.vhd" \
"../../../bd/design_2/ip/design_2_c_addsub_0_2/sim/design_2_c_addsub_0_2.vhd" \
"../../../bd/design_2/ip/design_2_c_addsub_2_0/sim/design_2_c_addsub_2_0.vhd" \
"../../../bd/design_2/ip/design_2_c_addsub_3_0/sim/design_2_c_addsub_3_0.vhd" \
"../../../bd/design_2/ip/design_2_c_addsub_3_1/sim/design_2_c_addsub_3_1.vhd" \
"../../../bd/design_2/ip/design_2_c_addsub_4_0/sim/design_2_c_addsub_4_0.vhd" \
"../../../bd/design_2/ip/design_2_c_addsub_5_0/sim/design_2_c_addsub_5_0.vhd" \
"../../../bd/design_2/ip/design_2_c_addsub_6_0/sim/design_2_c_addsub_6_0.vhd" \
"../../../bd/design_2/ip/design_2_c_addsub_0_0/sim/design_2_c_addsub_0_0.vhd" \
"../../../bd/design_2/ip/design_2_c_addsub_8_0/sim/design_2_c_addsub_8_0.vhd" \
"../../../bd/design_2/ip/design_2_c_addsub_8_1/sim/design_2_c_addsub_8_1.vhd" \
"../../../bd/design_2/ip/design_2_mux_lat_0/sim/design_2_mux_lat_0.vhd" \
"../../../bd/design_2/ip/design_2_buff_start_lat_0/sim/design_2_buff_start_lat_0.vhd" \
"../../../bd/design_2/ip/design_2_mux_lat_1/sim/design_2_mux_lat_1.vhd" \
"../../../bd/design_2/ip/design_2_decode_start_lat_0/sim/design_2_decode_start_lat_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../../ldpc_dual.srcs/sources_1/bd/design_2/ipshared/a227/hdl/verilog/LDPC_Out.v" \
"../../../bd/design_2/ip/design_2_LDPC_Out_0_0/sim/design_2_LDPC_Out_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_mux_lat_2/sim/design_2_mux_lat_2.vhd" \

vlog -work xil_defaultlib -64 \
"../../../../ldpc_dual.srcs/sources_1/bd/design_2/ipshared/0a8b/hdl/verilog/LDPC_buff.v" \
"../../../../ldpc_dual.srcs/sources_1/bd/design_2/ipshared/0a8b/hdl/verilog/write_raw_data.v" \
"../../../bd/design_2/ip/design_2_LDPC_buff_0_0/sim/design_2_LDPC_buff_0_0.v" \
"../../../bd/design_2/ip/design_2_raw_data_a_0/sim/design_2_raw_data_a_0.v" \
"../../../bd/design_2/ip/design_2_raw_data_b_0/sim/design_2_raw_data_b_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_raw_ce_mux_aa_1/sim/design_2_raw_ce_mux_aa_1.vhd" \
"../../../bd/design_2/ip/design_2_raw_ce_mux_ba_1/sim/design_2_raw_ce_mux_ba_1.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_raw_data_a1_0/sim/design_2_raw_data_a1_0.v" \
"../../../bd/design_2/ip/design_2_raw_data_b1_0/sim/design_2_raw_data_b1_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_raw_ce_mux_aa1_0/sim/design_2_raw_ce_mux_aa1_0.vhd" \
"../../../bd/design_2/ip/design_2_raw_ce_mux_ba1_0/sim/design_2_raw_ce_mux_ba1_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_raw_data_a2_0/sim/design_2_raw_data_a2_0.v" \
"../../../bd/design_2/ip/design_2_raw_data_b2_0/sim/design_2_raw_data_b2_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_raw_ce_mux_aa2_0/sim/design_2_raw_ce_mux_aa2_0.vhd" \
"../../../bd/design_2/ip/design_2_raw_ce_mux_ba2_0/sim/design_2_raw_ce_mux_ba2_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_raw_data_a3_0/sim/design_2_raw_data_a3_0.v" \
"../../../bd/design_2/ip/design_2_raw_data_b3_0/sim/design_2_raw_data_b3_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_raw_ce_mux_aa3_0/sim/design_2_raw_ce_mux_aa3_0.vhd" \
"../../../bd/design_2/ip/design_2_raw_ce_mux_ba3_0/sim/design_2_raw_ce_mux_ba3_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_raw_data_a4_0/sim/design_2_raw_data_a4_0.v" \
"../../../bd/design_2/ip/design_2_raw_data_b4_0/sim/design_2_raw_data_b4_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_raw_ce_mux_aa4_0/sim/design_2_raw_ce_mux_aa4_0.vhd" \
"../../../bd/design_2/ip/design_2_raw_ce_mux_ba4_0/sim/design_2_raw_ce_mux_ba4_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_raw_data_a5_0/sim/design_2_raw_data_a5_0.v" \
"../../../bd/design_2/ip/design_2_raw_data_b5_0/sim/design_2_raw_data_b5_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_raw_ce_mux_aa5_0/sim/design_2_raw_ce_mux_aa5_0.vhd" \
"../../../bd/design_2/ip/design_2_raw_ce_mux_ba5_0/sim/design_2_raw_ce_mux_ba5_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_raw_data_a6_0/sim/design_2_raw_data_a6_0.v" \
"../../../bd/design_2/ip/design_2_raw_data_b6_0/sim/design_2_raw_data_b6_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_raw_ce_mux_aa6_0/sim/design_2_raw_ce_mux_aa6_0.vhd" \
"../../../bd/design_2/ip/design_2_raw_ce_mux_ba6_0/sim/design_2_raw_ce_mux_ba6_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_raw_data_a7_0/sim/design_2_raw_data_a7_0.v" \
"../../../bd/design_2/ip/design_2_raw_data_b7_0/sim/design_2_raw_data_b7_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_raw_ce_mux_aa7_0/sim/design_2_raw_ce_mux_aa7_0.vhd" \
"../../../bd/design_2/ip/design_2_raw_ce_mux_ba7_0/sim/design_2_raw_ce_mux_ba7_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_raw_data_a8_0/sim/design_2_raw_data_a8_0.v" \
"../../../bd/design_2/ip/design_2_raw_data_b8_0/sim/design_2_raw_data_b8_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_raw_ce_mux_aa8_0/sim/design_2_raw_ce_mux_aa8_0.vhd" \
"../../../bd/design_2/ip/design_2_raw_ce_mux_ba8_0/sim/design_2_raw_ce_mux_ba8_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_xlconstant_0_1/sim/design_2_xlconstant_0_1.v" \
"../../../../ldpc_dual.srcs/sources_1/bd/design_2/ipshared/4430/hdl/verilog/LDPC_Div.v" \
"../../../bd/design_2/ip/design_2_LDPC_Div_0_0/sim/design_2_LDPC_Div_0_0.v" \
"../../../bd/design_2/ip/design_2_decode_data_a_0_0/sim/design_2_decode_data_a_0_0.v" \
"../../../bd/design_2/ip/design_2_decode_data_b_0_0/sim/design_2_decode_data_b_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_data_ce_mux_3/sim/design_2_data_ce_mux_3.vhd" \
"../../../bd/design_2/ip/design_2_data_ce_mux1_0/sim/design_2_data_ce_mux1_0.vhd" \
"../../../bd/design_2/ip/design_2_data_mux1_0/sim/design_2_data_mux1_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_decode_data_b_1_0/sim/design_2_decode_data_b_1_0.v" \
"../../../bd/design_2/ip/design_2_decode_data_a_1_0/sim/design_2_decode_data_a_1_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_data_ce_mux_bb_1_0/sim/design_2_data_ce_mux_bb_1_0.vhd" \
"../../../bd/design_2/ip/design_2_data_ce_mux_ab_1_0/sim/design_2_data_ce_mux_ab_1_0.vhd" \
"../../../bd/design_2/ip/design_2_data_mux11_0/sim/design_2_data_mux11_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_decode_data_b_2_0/sim/design_2_decode_data_b_2_0.v" \
"../../../bd/design_2/ip/design_2_decode_data_a_2_0/sim/design_2_decode_data_a_2_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_data_ce_mux_bb_2_0/sim/design_2_data_ce_mux_bb_2_0.vhd" \
"../../../bd/design_2/ip/design_2_data_ce_mux_ab_2_0/sim/design_2_data_ce_mux_ab_2_0.vhd" \
"../../../bd/design_2/ip/design_2_data_mux12_0/sim/design_2_data_mux12_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_decode_data_b_3_0/sim/design_2_decode_data_b_3_0.v" \
"../../../bd/design_2/ip/design_2_decode_data_a_3_0/sim/design_2_decode_data_a_3_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_data_ce_mux_bb_3_0/sim/design_2_data_ce_mux_bb_3_0.vhd" \
"../../../bd/design_2/ip/design_2_data_ce_mux_ab_3_0/sim/design_2_data_ce_mux_ab_3_0.vhd" \
"../../../bd/design_2/ip/design_2_data_mux13_0/sim/design_2_data_mux13_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_decode_data_b_4_0/sim/design_2_decode_data_b_4_0.v" \
"../../../bd/design_2/ip/design_2_decode_data_a_4_0/sim/design_2_decode_data_a_4_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_data_mux14_0/sim/design_2_data_mux14_0.vhd" \
"../../../bd/design_2/ip/design_2_data_ce_mux_bb_4_0/sim/design_2_data_ce_mux_bb_4_0.vhd" \
"../../../bd/design_2/ip/design_2_data_ce_mux_ab_4_0/sim/design_2_data_ce_mux_ab_4_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_decode_data_b_5_0/sim/design_2_decode_data_b_5_0.v" \
"../../../bd/design_2/ip/design_2_decode_data_a_5_0/sim/design_2_decode_data_a_5_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_data_ce_mux_bb_5_0/sim/design_2_data_ce_mux_bb_5_0.vhd" \
"../../../bd/design_2/ip/design_2_data_ce_mux_ab_5_0/sim/design_2_data_ce_mux_ab_5_0.vhd" \
"../../../bd/design_2/ip/design_2_data_mux15_0/sim/design_2_data_mux15_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_decode_data_b_6_0/sim/design_2_decode_data_b_6_0.v" \
"../../../bd/design_2/ip/design_2_decode_data_a_6_0/sim/design_2_decode_data_a_6_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_data_mux16_0/sim/design_2_data_mux16_0.vhd" \
"../../../bd/design_2/ip/design_2_data_ce_mux_bb_6_0/sim/design_2_data_ce_mux_bb_6_0.vhd" \
"../../../bd/design_2/ip/design_2_data_ce_mux_ab_6_0/sim/design_2_data_ce_mux_ab_6_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/design_2/ip/design_2_HLSLdpcLogDecScaledMin_0_1/sim/design_2_HLSLdpcLogDecScaledMin_0_1.v" \
"../../../bd/design_2/ip/design_2_xlconstant_3_0/sim/design_2_xlconstant_3_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_2/ip/design_2_itt_num_lat_0/sim/design_2_itt_num_lat_0.vhd" \
"../../../bd/design_2/ip/design_2_decode_start_lat_1/sim/design_2_decode_start_lat_1.vhd" \

vlog -work xil_defaultlib "glbl.v"

