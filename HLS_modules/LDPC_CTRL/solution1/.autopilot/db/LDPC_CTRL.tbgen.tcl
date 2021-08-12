set C_TypeInfoList {{ 
"LDPC_CTRL" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"block": [[],"0"] }, {"code": [[],"0"] }, {"run": [[], {"scalar": "bool"}] }, {"init_start": [[],{ "pointer":  {"scalar": "bool"}}] }, {"init_done": [[], {"scalar": "bool"}] }, {"init_ready": [[], {"scalar": "bool"}] }, {"buff_start": [[],{ "pointer":  {"scalar": "bool"}}] }, {"status": [[],{ "pointer": "0"}] }, {"err_code": [[],{ "pointer":  {"scalar": "short"}}] }, {"size": [[],{ "pointer": "0"}] }, {"rate": [[],{ "pointer": "0"}] }, {"buff_reset": [[],{ "pointer":  {"scalar": "bool"}}] }],[],""], 
"0": [ "tab_2_int", {"typedef": [[[],"1"],""]}], 
"1": [ "ap_uint<2>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 2}}]],""]}}]
}}
set moduleName LDPC_CTRL
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {LDPC_CTRL}
set C_modelType { void 0 }
set C_modelArgList {
	{ block_V int 2 regular  }
	{ code_V int 2 regular  }
	{ run uint 1 regular  }
	{ init_start int 1 regular {pointer 1}  }
	{ init_done uint 1 regular  }
	{ init_ready uint 1 regular  }
	{ buff_start int 1 regular {pointer 1}  }
	{ status_V int 2 regular {pointer 1}  }
	{ err_code int 16 regular {pointer 1}  }
	{ size_V int 2 regular {pointer 1}  }
	{ rate_V int 2 regular {pointer 1}  }
	{ buff_reset int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "block_V", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "block.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "code_V", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "code.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "run", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "run","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "init_start", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "init_start","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "init_done", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "init_done","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "init_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "init_ready","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "buff_start", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "buff_start","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "status_V", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "status.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "err_code", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "err_code","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "size_V", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "size.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "rate_V", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "rate.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "buff_reset", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "buff_reset","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ block_V sc_in sc_lv 2 signal 0 } 
	{ code_V sc_in sc_lv 2 signal 1 } 
	{ run sc_in sc_logic 1 signal 2 } 
	{ init_start sc_out sc_logic 1 signal 3 } 
	{ init_start_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ init_done sc_in sc_logic 1 signal 4 } 
	{ init_ready sc_in sc_logic 1 signal 5 } 
	{ buff_start sc_out sc_logic 1 signal 6 } 
	{ buff_start_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ status_V sc_out sc_lv 2 signal 7 } 
	{ status_V_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ err_code sc_out sc_lv 16 signal 8 } 
	{ err_code_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ size_V sc_out sc_lv 2 signal 9 } 
	{ size_V_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ rate_V sc_out sc_lv 2 signal 10 } 
	{ rate_V_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ buff_reset sc_out sc_logic 1 signal 11 } 
	{ buff_reset_ap_vld sc_out sc_logic 1 outvld 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "block_V", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "block_V", "role": "default" }} , 
 	{ "name": "code_V", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "code_V", "role": "default" }} , 
 	{ "name": "run", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "run", "role": "default" }} , 
 	{ "name": "init_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "init_start", "role": "default" }} , 
 	{ "name": "init_start_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "init_start", "role": "ap_vld" }} , 
 	{ "name": "init_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "init_done", "role": "default" }} , 
 	{ "name": "init_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "init_ready", "role": "default" }} , 
 	{ "name": "buff_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buff_start", "role": "default" }} , 
 	{ "name": "buff_start_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buff_start", "role": "ap_vld" }} , 
 	{ "name": "status_V", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "status_V", "role": "default" }} , 
 	{ "name": "status_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "status_V", "role": "ap_vld" }} , 
 	{ "name": "err_code", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "err_code", "role": "default" }} , 
 	{ "name": "err_code_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "err_code", "role": "ap_vld" }} , 
 	{ "name": "size_V", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "size_V", "role": "default" }} , 
 	{ "name": "size_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "size_V", "role": "ap_vld" }} , 
 	{ "name": "rate_V", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rate_V", "role": "default" }} , 
 	{ "name": "rate_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rate_V", "role": "ap_vld" }} , 
 	{ "name": "buff_reset", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buff_reset", "role": "default" }} , 
 	{ "name": "buff_reset_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "buff_reset", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "LDPC_CTRL",
		"VariableLatency" : "0",
		"AlignedPipeline" : "0",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "0",
		"ControlExist" : "1",
		"Port" : [
		{"Name" : "block_V", "Type" : "None", "Direction" : "I"},
		{"Name" : "code_V", "Type" : "None", "Direction" : "I"},
		{"Name" : "run", "Type" : "None", "Direction" : "I"},
		{"Name" : "init_start", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "init_done", "Type" : "None", "Direction" : "I"},
		{"Name" : "init_ready", "Type" : "None", "Direction" : "I"},
		{"Name" : "buff_start", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "status_V", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "err_code", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "size_V", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "rate_V", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "buff_reset", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "state", "Type" : "OVld", "Direction" : "IO"}]}]}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set Spec2ImplPortList { 
	block_V { ap_none {  { block_V in_data 0 2 } } }
	code_V { ap_none {  { code_V in_data 0 2 } } }
	run { ap_none {  { run in_data 0 1 } } }
	init_start { ap_vld {  { init_start out_data 1 1 }  { init_start_ap_vld out_vld 1 1 } } }
	init_done { ap_none {  { init_done in_data 0 1 } } }
	init_ready { ap_none {  { init_ready in_data 0 1 } } }
	buff_start { ap_vld {  { buff_start out_data 1 1 }  { buff_start_ap_vld out_vld 1 1 } } }
	status_V { ap_vld {  { status_V out_data 1 2 }  { status_V_ap_vld out_vld 1 1 } } }
	err_code { ap_vld {  { err_code out_data 1 16 }  { err_code_ap_vld out_vld 1 1 } } }
	size_V { ap_vld {  { size_V out_data 1 2 }  { size_V_ap_vld out_vld 1 1 } } }
	rate_V { ap_vld {  { rate_V out_data 1 2 }  { rate_V_ap_vld out_vld 1 1 } } }
	buff_reset { ap_vld {  { buff_reset out_data 1 1 }  { buff_reset_ap_vld out_vld 1 1 } } }
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
