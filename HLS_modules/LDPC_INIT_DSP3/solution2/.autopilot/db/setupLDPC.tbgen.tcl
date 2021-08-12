set C_TypeInfoList {{ 
"setupLDPC" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"size": [[],"0"] }, {"rate": [[],"0"] }, {"nR_M": [[],{ "pointer": "1"}] }, {"etaIndexM_M": [[],{ "pointer": "1"}] }, {"pCodeM": [[],{ "pointer": "1"}] }, {"pMaxIterations": [[],{ "pointer": "1"}] }, {"numbits": [[],{ "pointer": "1"}] }, {"split": [[],{ "pointer": "1"}] }],[],""], 
"0": [ "int_2b", {"typedef": [[[],"2"],""]}], 
"2": [ "ap_uint<2>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 2}}]],""]}}], 
"1": [ "tab_int", {"typedef": [[[],"3"],""]}], 
"3": [ "ap_uint<16>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 16}}]],""]}}]
}}
set moduleName setupLDPC
set isCombinational 1
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {setupLDPC}
set C_modelType { void 0 }
set C_modelArgList {
	{ size_V int 2 regular  }
	{ rate_V int 2 regular  }
	{ nR_M_V int 16 regular {pointer 1}  }
	{ etaIndexM_M_V int 16 regular {pointer 1}  }
	{ pCodeM_V int 16 regular {pointer 1}  }
	{ pMaxIterations_V int 16 regular {pointer 1}  }
	{ numbits_V int 16 regular {pointer 1}  }
	{ split_V int 16 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "size_V", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "size.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "rate_V", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "rate.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "nR_M_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "nR_M.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "etaIndexM_M_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "etaIndexM_M.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "pCodeM_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pCodeM.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "pMaxIterations_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pMaxIterations.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "numbits_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "numbits.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "split_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "split.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ size_V sc_in sc_lv 2 signal 0 } 
	{ rate_V sc_in sc_lv 2 signal 1 } 
	{ nR_M_V sc_out sc_lv 16 signal 2 } 
	{ nR_M_V_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ etaIndexM_M_V sc_out sc_lv 16 signal 3 } 
	{ etaIndexM_M_V_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ pCodeM_V sc_out sc_lv 16 signal 4 } 
	{ pCodeM_V_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ pMaxIterations_V sc_out sc_lv 16 signal 5 } 
	{ pMaxIterations_V_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ numbits_V sc_out sc_lv 16 signal 6 } 
	{ numbits_V_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ split_V sc_out sc_lv 16 signal 7 } 
	{ split_V_ap_vld sc_out sc_logic 1 outvld 7 } 
}
set NewPortList {[ 
	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "size_V", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "size_V", "role": "default" }} , 
 	{ "name": "rate_V", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rate_V", "role": "default" }} , 
 	{ "name": "nR_M_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "nR_M_V", "role": "default" }} , 
 	{ "name": "nR_M_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "nR_M_V", "role": "ap_vld" }} , 
 	{ "name": "etaIndexM_M_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "etaIndexM_M_V", "role": "default" }} , 
 	{ "name": "etaIndexM_M_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "etaIndexM_M_V", "role": "ap_vld" }} , 
 	{ "name": "pCodeM_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pCodeM_V", "role": "default" }} , 
 	{ "name": "pCodeM_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pCodeM_V", "role": "ap_vld" }} , 
 	{ "name": "pMaxIterations_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pMaxIterations_V", "role": "default" }} , 
 	{ "name": "pMaxIterations_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pMaxIterations_V", "role": "ap_vld" }} , 
 	{ "name": "numbits_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "numbits_V", "role": "default" }} , 
 	{ "name": "numbits_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "numbits_V", "role": "ap_vld" }} , 
 	{ "name": "split_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "split_V", "role": "default" }} , 
 	{ "name": "split_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "split_V", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "setupLDPC",
		"VariableLatency" : "0",
		"AlignedPipeline" : "0",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "1",
		"ControlExist" : "1",
		"Port" : [
		{"Name" : "size_V", "Type" : "None", "Direction" : "I"},
		{"Name" : "rate_V", "Type" : "None", "Direction" : "I"},
		{"Name" : "nR_M_V", "Type" : "OVld", "Direction" : "O"},
		{"Name" : "etaIndexM_M_V", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "pCodeM_V", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "pMaxIterations_V", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "numbits_V", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "split_V", "Type" : "Vld", "Direction" : "O"}]}]}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set Spec2ImplPortList { 
	size_V { ap_none {  { size_V in_data 0 2 } } }
	rate_V { ap_none {  { rate_V in_data 0 2 } } }
	nR_M_V { ap_ovld {  { nR_M_V out_data 1 16 }  { nR_M_V_ap_vld out_vld 1 1 } } }
	etaIndexM_M_V { ap_vld {  { etaIndexM_M_V out_data 1 16 }  { etaIndexM_M_V_ap_vld out_vld 1 1 } } }
	pCodeM_V { ap_vld {  { pCodeM_V out_data 1 16 }  { pCodeM_V_ap_vld out_vld 1 1 } } }
	pMaxIterations_V { ap_vld {  { pMaxIterations_V out_data 1 16 }  { pMaxIterations_V_ap_vld out_vld 1 1 } } }
	numbits_V { ap_vld {  { numbits_V out_data 1 16 }  { numbits_V_ap_vld out_vld 1 1 } } }
	split_V { ap_vld {  { split_V out_data 1 16 }  { split_V_ap_vld out_vld 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
