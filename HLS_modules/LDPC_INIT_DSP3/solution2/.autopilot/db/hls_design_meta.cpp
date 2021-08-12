#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("size_V", 2, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("rate_V", 2, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("nR_M_V", 16, hls_out, 2, "ap_ovld", "out_data", 1),
	Port_Property("nR_M_V_ap_vld", 1, hls_out, 2, "ap_ovld", "out_vld", 1),
	Port_Property("etaIndexM_M_V", 16, hls_out, 3, "ap_vld", "out_data", 1),
	Port_Property("etaIndexM_M_V_ap_vld", 1, hls_out, 3, "ap_vld", "out_vld", 1),
	Port_Property("pCodeM_V", 16, hls_out, 4, "ap_vld", "out_data", 1),
	Port_Property("pCodeM_V_ap_vld", 1, hls_out, 4, "ap_vld", "out_vld", 1),
	Port_Property("pMaxIterations_V", 16, hls_out, 5, "ap_vld", "out_data", 1),
	Port_Property("pMaxIterations_V_ap_vld", 1, hls_out, 5, "ap_vld", "out_vld", 1),
	Port_Property("numbits_V", 16, hls_out, 6, "ap_vld", "out_data", 1),
	Port_Property("numbits_V_ap_vld", 1, hls_out, 6, "ap_vld", "out_vld", 1),
	Port_Property("split_V", 16, hls_out, 7, "ap_vld", "out_data", 1),
	Port_Property("split_V_ap_vld", 1, hls_out, 7, "ap_vld", "out_vld", 1),
};
const char* HLS_Design_Meta::dut_name = "setupLDPC";
