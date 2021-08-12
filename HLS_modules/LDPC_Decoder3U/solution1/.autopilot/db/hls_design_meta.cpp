#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("pR_address0", 11, hls_out, 0, "ap_memory", "mem_address", 1),
	Port_Property("pR_ce0", 1, hls_out, 0, "ap_memory", "mem_ce", 1),
	Port_Property("pR_q0", 8, hls_in, 0, "ap_memory", "mem_dout", 1),
	Port_Property("pR1_address0", 11, hls_out, 1, "ap_memory", "mem_address", 1),
	Port_Property("pR1_ce0", 1, hls_out, 1, "ap_memory", "mem_ce", 1),
	Port_Property("pR1_q0", 8, hls_in, 1, "ap_memory", "mem_dout", 1),
	Port_Property("pR2_address0", 11, hls_out, 2, "ap_memory", "mem_address", 1),
	Port_Property("pR2_ce0", 1, hls_out, 2, "ap_memory", "mem_ce", 1),
	Port_Property("pR2_q0", 8, hls_in, 2, "ap_memory", "mem_dout", 1),
	Port_Property("pR3_address0", 11, hls_out, 3, "ap_memory", "mem_address", 1),
	Port_Property("pR3_ce0", 1, hls_out, 3, "ap_memory", "mem_ce", 1),
	Port_Property("pR3_q0", 8, hls_in, 3, "ap_memory", "mem_dout", 1),
	Port_Property("pR4_address0", 10, hls_out, 4, "ap_memory", "mem_address", 1),
	Port_Property("pR4_ce0", 1, hls_out, 4, "ap_memory", "mem_ce", 1),
	Port_Property("pR4_q0", 8, hls_in, 4, "ap_memory", "mem_dout", 1),
	Port_Property("pR5_address0", 10, hls_out, 5, "ap_memory", "mem_address", 1),
	Port_Property("pR5_ce0", 1, hls_out, 5, "ap_memory", "mem_ce", 1),
	Port_Property("pR5_q0", 8, hls_in, 5, "ap_memory", "mem_dout", 1),
	Port_Property("pR6_address0", 10, hls_out, 6, "ap_memory", "mem_address", 1),
	Port_Property("pR6_ce0", 1, hls_out, 6, "ap_memory", "mem_ce", 1),
	Port_Property("pR6_q0", 8, hls_in, 6, "ap_memory", "mem_dout", 1),
	Port_Property("pR7_address0", 10, hls_out, 7, "ap_memory", "mem_address", 1),
	Port_Property("pR7_ce0", 1, hls_out, 7, "ap_memory", "mem_ce", 1),
	Port_Property("pR7_q0", 8, hls_in, 7, "ap_memory", "mem_dout", 1),
	Port_Property("pR8_address0", 10, hls_out, 8, "ap_memory", "mem_address", 1),
	Port_Property("pR8_ce0", 1, hls_out, 8, "ap_memory", "mem_ce", 1),
	Port_Property("pR8_q0", 8, hls_in, 8, "ap_memory", "mem_dout", 1),
	Port_Property("pR9_address0", 10, hls_out, 9, "ap_memory", "mem_address", 1),
	Port_Property("pR9_ce0", 1, hls_out, 9, "ap_memory", "mem_ce", 1),
	Port_Property("pR9_q0", 8, hls_in, 9, "ap_memory", "mem_dout", 1),
	Port_Property("pR10_address0", 10, hls_out, 10, "ap_memory", "mem_address", 1),
	Port_Property("pR10_ce0", 1, hls_out, 10, "ap_memory", "mem_ce", 1),
	Port_Property("pR10_we0", 1, hls_out, 10, "ap_memory", "mem_we", 1),
	Port_Property("pR10_d0", 8, hls_out, 10, "ap_memory", "mem_din", 1),
	Port_Property("pR10_q0", 8, hls_in, 10, "ap_memory", "mem_dout", 1),
	Port_Property("pR10_address1", 10, hls_out, 10, "ap_memory", "mem_address", 1),
	Port_Property("pR10_ce1", 1, hls_out, 10, "ap_memory", "mem_ce", 1),
	Port_Property("pR10_we1", 1, hls_out, 10, "ap_memory", "mem_we", 1),
	Port_Property("pR10_d1", 8, hls_out, 10, "ap_memory", "mem_din", 1),
	Port_Property("pR10_q1", 8, hls_in, 10, "ap_memory", "mem_dout", 1),
	Port_Property("pbhat0_address0", 11, hls_out, 11, "ap_memory", "mem_address", 1),
	Port_Property("pbhat0_ce0", 1, hls_out, 11, "ap_memory", "mem_ce", 1),
	Port_Property("pbhat0_we0", 1, hls_out, 11, "ap_memory", "mem_we", 1),
	Port_Property("pbhat0_d0", 1, hls_out, 11, "ap_memory", "mem_din", 1),
	Port_Property("pbhat1_address0", 11, hls_out, 12, "ap_memory", "mem_address", 1),
	Port_Property("pbhat1_ce0", 1, hls_out, 12, "ap_memory", "mem_ce", 1),
	Port_Property("pbhat1_we0", 1, hls_out, 12, "ap_memory", "mem_we", 1),
	Port_Property("pbhat1_d0", 1, hls_out, 12, "ap_memory", "mem_din", 1),
	Port_Property("pbhat2_address0", 10, hls_out, 13, "ap_memory", "mem_address", 1),
	Port_Property("pbhat2_ce0", 1, hls_out, 13, "ap_memory", "mem_ce", 1),
	Port_Property("pbhat2_we0", 1, hls_out, 13, "ap_memory", "mem_we", 1),
	Port_Property("pbhat2_d0", 1, hls_out, 13, "ap_memory", "mem_din", 1),
	Port_Property("pbhat3_address0", 10, hls_out, 14, "ap_memory", "mem_address", 1),
	Port_Property("pbhat3_ce0", 1, hls_out, 14, "ap_memory", "mem_ce", 1),
	Port_Property("pbhat3_we0", 1, hls_out, 14, "ap_memory", "mem_we", 1),
	Port_Property("pbhat3_d0", 1, hls_out, 14, "ap_memory", "mem_din", 1),
	Port_Property("pbhat4_address0", 10, hls_out, 15, "ap_memory", "mem_address", 1),
	Port_Property("pbhat4_ce0", 1, hls_out, 15, "ap_memory", "mem_ce", 1),
	Port_Property("pbhat4_we0", 1, hls_out, 15, "ap_memory", "mem_we", 1),
	Port_Property("pbhat4_d0", 1, hls_out, 15, "ap_memory", "mem_din", 1),
	Port_Property("pbhat5_address0", 10, hls_out, 16, "ap_memory", "mem_address", 1),
	Port_Property("pbhat5_ce0", 1, hls_out, 16, "ap_memory", "mem_ce", 1),
	Port_Property("pbhat5_we0", 1, hls_out, 16, "ap_memory", "mem_we", 1),
	Port_Property("pbhat5_d0", 1, hls_out, 16, "ap_memory", "mem_din", 1),
	Port_Property("pbhat6_address0", 10, hls_out, 17, "ap_memory", "mem_address", 1),
	Port_Property("pbhat6_ce0", 1, hls_out, 17, "ap_memory", "mem_ce", 1),
	Port_Property("pbhat6_we0", 1, hls_out, 17, "ap_memory", "mem_we", 1),
	Port_Property("pbhat6_d0", 1, hls_out, 17, "ap_memory", "mem_din", 1),
	Port_Property("pbhat7_address0", 10, hls_out, 18, "ap_memory", "mem_address", 1),
	Port_Property("pbhat7_ce0", 1, hls_out, 18, "ap_memory", "mem_ce", 1),
	Port_Property("pbhat7_we0", 1, hls_out, 18, "ap_memory", "mem_we", 1),
	Port_Property("pbhat7_d0", 1, hls_out, 18, "ap_memory", "mem_din", 1),
	Port_Property("cnt", 32, hls_out, 19, "ap_vld", "out_data", 1),
	Port_Property("cnt_ap_vld", 1, hls_out, 19, "ap_vld", "out_vld", 1),
	Port_Property("nR_M", 16, hls_in, 20, "ap_none", "in_data", 1),
	Port_Property("etaIndexM_M", 16, hls_in, 21, "ap_none", "in_data", 1),
	Port_Property("pCodeM", 16, hls_in, 22, "ap_none", "in_data", 1),
	Port_Property("pMaxIterations", 16, hls_in, 23, "ap_none", "in_data", 1),
	Port_Property("itt_num", 8, hls_out, 24, "ap_vld", "out_data", 1),
	Port_Property("itt_num_ap_vld", 1, hls_out, 24, "ap_vld", "out_vld", 1),
	Port_Property("numbits", 16, hls_in, 25, "ap_none", "in_data", 1),
	Port_Property("mux", 1, hls_in, 26, "ap_none", "in_data", 1),
};
const char* HLS_Design_Meta::dut_name = "HLSLdpcLogDecScaledMin";
