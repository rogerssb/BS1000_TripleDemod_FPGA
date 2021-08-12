set C_TypeInfoList {{ 
"LDPC_Div" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"reset": [[], {"scalar": "bool"}] }, {"rd_clk_out": [[],{ "pointer":  {"scalar": "bool"}}] }, {"clk_div": [[], {"scalar": "short"}] }, {"block": [[],"0"] }],[],""], 
"0": [ "tab_2_int", {"typedef": [[[],"1"],""]}], 
"1": [ "ap_uint<2>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 2}}]],""]}}]
}}
set moduleName LDPC_Div
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {LDPC_Div}
set C_modelType { void 0 }
set C_modelArgList {
	{ reset uint 1 regular  }
	{ rd_clk_out int 1 regular {pointer 1}  }
	{ clk_div int 16 regular  }
	{ block_V int 2 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "reset", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "reset","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "rd_clk_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "rd_clk_out","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "clk_div", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "clk_div","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "block_V", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "block.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 11
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ reset sc_in sc_logic 1 signal 0 } 
	{ rd_clk_out sc_out sc_logic 1 signal 1 } 
	{ rd_clk_out_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ clk_div sc_in sc_lv 16 signal 2 } 
	{ block_V sc_in sc_lv 2 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "reset", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "reset", "role": "default" }} , 
 	{ "name": "rd_clk_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rd_clk_out", "role": "default" }} , 
 	{ "name": "rd_clk_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rd_clk_out", "role": "ap_vld" }} , 
 	{ "name": "clk_div", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "clk_div", "role": "default" }} , 
 	{ "name": "block_V", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "block_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "LDPC_Div",
		"VariableLatency" : "0",
		"AlignedPipeline" : "0",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "0",
		"ControlExist" : "1",
		"Port" : [
		{"Name" : "reset", "Type" : "None", "Direction" : "I"},
		{"Name" : "rd_clk_out", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "clk_div", "Type" : "None", "Direction" : "I"},
		{"Name" : "block_V", "Type" : "None", "Direction" : "I"},
		{"Name" : "out_count", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "count", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "max", "Type" : "OVld", "Direction" : "IO"}]}]}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set Spec2ImplPortList { 
	reset { ap_none {  { reset in_data 0 1 } } }
	rd_clk_out { ap_vld {  { rd_clk_out out_data 1 1 }  { rd_clk_out_ap_vld out_vld 1 1 } } }
	clk_div { ap_none {  { clk_div in_data 0 16 } } }
	block_V { ap_none {  { block_V in_data 0 2 } } }
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
