set C_TypeInfoList {{ 
"LDPC_Out" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"data_out": [[],{ "pointer":  {"scalar": "bool"}}] }, {"reset": [[], {"scalar": "bool"}] }, {"cur_read_pos": [[],{ "pointer": "0"}] }, {"block": [[],"1"] }, {"rd_clk_in": [[], {"scalar": "bool"}] }, {"rd_mux": [[],{ "pointer":  {"scalar": "bool"}}] }, {"mem_out0": [[], {"array": [ {"scalar": "bool"}, [512]]}] }, {"mem_out1": [[], {"array": [ {"scalar": "bool"}, [512]]}] }, {"mem_out2": [[], {"array": [ {"scalar": "bool"}, [512]]}] }, {"mem_out3": [[], {"array": [ {"scalar": "bool"}, [512]]}] }, {"mem_out4": [[], {"array": [ {"scalar": "bool"}, [512]]}] }, {"mem_out5": [[], {"array": [ {"scalar": "bool"}, [512]]}] }, {"mem_out6": [[], {"array": [ {"scalar": "bool"}, [512]]}] }, {"mem_out7": [[], {"array": [ {"scalar": "bool"}, [512]]}] }],[],""], 
"0": [ "tab_int", {"typedef": [[[],"2"],""]}], 
"2": [ "ap_uint<16>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 16}}]],""]}}], 
"1": [ "tab_2_int", {"typedef": [[[],"3"],""]}], 
"3": [ "ap_uint<2>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 2}}]],""]}}]
}}
set moduleName LDPC_Out
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {LDPC_Out}
set C_modelType { void 0 }
set C_modelArgList {
	{ data_out int 1 regular {pointer 1}  }
	{ reset uint 1 regular  }
	{ cur_read_pos_V int 16 regular {pointer 1}  }
	{ block_V int 2 regular  }
	{ rd_clk_in uint 1 regular  }
	{ rd_mux int 1 unused {pointer 0}  }
	{ mem_out0 int 1 regular {array 512 { 1 3 } 1 1 }  }
	{ mem_out1 int 1 regular {array 512 { 1 3 } 1 1 }  }
	{ mem_out2 int 1 regular {array 512 { 1 3 } 1 1 }  }
	{ mem_out3 int 1 regular {array 512 { 1 3 } 1 1 }  }
	{ mem_out4 int 1 regular {array 512 { 1 3 } 1 1 }  }
	{ mem_out5 int 1 regular {array 512 { 1 3 } 1 1 }  }
	{ mem_out6 int 1 regular {array 512 { 1 3 } 1 1 }  }
	{ mem_out7 int 1 regular {array 512 { 1 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "data_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "data_out","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "reset", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "reset","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "cur_read_pos_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "cur_read_pos.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "block_V", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "block.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "rd_clk_in", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "rd_clk_in","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "rd_mux", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "rd_mux","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "mem_out0", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mem_out0","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 511,"step" : 1}]}]}]} , 
 	{ "Name" : "mem_out1", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mem_out1","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 511,"step" : 1}]}]}]} , 
 	{ "Name" : "mem_out2", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mem_out2","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 511,"step" : 1}]}]}]} , 
 	{ "Name" : "mem_out3", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mem_out3","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 511,"step" : 1}]}]}]} , 
 	{ "Name" : "mem_out4", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mem_out4","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 511,"step" : 1}]}]}]} , 
 	{ "Name" : "mem_out5", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mem_out5","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 511,"step" : 1}]}]}]} , 
 	{ "Name" : "mem_out6", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mem_out6","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 511,"step" : 1}]}]}]} , 
 	{ "Name" : "mem_out7", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mem_out7","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 511,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ data_out sc_out sc_logic 1 signal 0 } 
	{ data_out_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ reset sc_in sc_logic 1 signal 1 } 
	{ cur_read_pos_V sc_out sc_lv 16 signal 2 } 
	{ cur_read_pos_V_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ block_V sc_in sc_lv 2 signal 3 } 
	{ rd_clk_in sc_in sc_logic 1 signal 4 } 
	{ rd_mux sc_in sc_logic 1 signal 5 } 
	{ mem_out0_address0 sc_out sc_lv 9 signal 6 } 
	{ mem_out0_ce0 sc_out sc_logic 1 signal 6 } 
	{ mem_out0_q0 sc_in sc_lv 1 signal 6 } 
	{ mem_out1_address0 sc_out sc_lv 9 signal 7 } 
	{ mem_out1_ce0 sc_out sc_logic 1 signal 7 } 
	{ mem_out1_q0 sc_in sc_lv 1 signal 7 } 
	{ mem_out2_address0 sc_out sc_lv 9 signal 8 } 
	{ mem_out2_ce0 sc_out sc_logic 1 signal 8 } 
	{ mem_out2_q0 sc_in sc_lv 1 signal 8 } 
	{ mem_out3_address0 sc_out sc_lv 9 signal 9 } 
	{ mem_out3_ce0 sc_out sc_logic 1 signal 9 } 
	{ mem_out3_q0 sc_in sc_lv 1 signal 9 } 
	{ mem_out4_address0 sc_out sc_lv 9 signal 10 } 
	{ mem_out4_ce0 sc_out sc_logic 1 signal 10 } 
	{ mem_out4_q0 sc_in sc_lv 1 signal 10 } 
	{ mem_out5_address0 sc_out sc_lv 9 signal 11 } 
	{ mem_out5_ce0 sc_out sc_logic 1 signal 11 } 
	{ mem_out5_q0 sc_in sc_lv 1 signal 11 } 
	{ mem_out6_address0 sc_out sc_lv 9 signal 12 } 
	{ mem_out6_ce0 sc_out sc_logic 1 signal 12 } 
	{ mem_out6_q0 sc_in sc_lv 1 signal 12 } 
	{ mem_out7_address0 sc_out sc_lv 9 signal 13 } 
	{ mem_out7_ce0 sc_out sc_logic 1 signal 13 } 
	{ mem_out7_q0 sc_in sc_lv 1 signal 13 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "data_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "data_out", "role": "default" }} , 
 	{ "name": "data_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "data_out", "role": "ap_vld" }} , 
 	{ "name": "reset", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "reset", "role": "default" }} , 
 	{ "name": "cur_read_pos_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "cur_read_pos_V", "role": "default" }} , 
 	{ "name": "cur_read_pos_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cur_read_pos_V", "role": "ap_vld" }} , 
 	{ "name": "block_V", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "block_V", "role": "default" }} , 
 	{ "name": "rd_clk_in", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rd_clk_in", "role": "default" }} , 
 	{ "name": "rd_mux", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rd_mux", "role": "default" }} , 
 	{ "name": "mem_out0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "mem_out0", "role": "address0" }} , 
 	{ "name": "mem_out0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out0", "role": "ce0" }} , 
 	{ "name": "mem_out0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out0", "role": "q0" }} , 
 	{ "name": "mem_out1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "mem_out1", "role": "address0" }} , 
 	{ "name": "mem_out1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out1", "role": "ce0" }} , 
 	{ "name": "mem_out1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out1", "role": "q0" }} , 
 	{ "name": "mem_out2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "mem_out2", "role": "address0" }} , 
 	{ "name": "mem_out2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out2", "role": "ce0" }} , 
 	{ "name": "mem_out2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out2", "role": "q0" }} , 
 	{ "name": "mem_out3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "mem_out3", "role": "address0" }} , 
 	{ "name": "mem_out3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out3", "role": "ce0" }} , 
 	{ "name": "mem_out3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out3", "role": "q0" }} , 
 	{ "name": "mem_out4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "mem_out4", "role": "address0" }} , 
 	{ "name": "mem_out4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out4", "role": "ce0" }} , 
 	{ "name": "mem_out4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out4", "role": "q0" }} , 
 	{ "name": "mem_out5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "mem_out5", "role": "address0" }} , 
 	{ "name": "mem_out5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out5", "role": "ce0" }} , 
 	{ "name": "mem_out5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out5", "role": "q0" }} , 
 	{ "name": "mem_out6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "mem_out6", "role": "address0" }} , 
 	{ "name": "mem_out6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out6", "role": "ce0" }} , 
 	{ "name": "mem_out6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out6", "role": "q0" }} , 
 	{ "name": "mem_out7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "mem_out7", "role": "address0" }} , 
 	{ "name": "mem_out7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out7", "role": "ce0" }} , 
 	{ "name": "mem_out7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem_out7", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "LDPC_Out",
		"VariableLatency" : "0",
		"AlignedPipeline" : "1",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "0",
		"ControlExist" : "1",
		"Port" : [
		{"Name" : "data_out", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "reset", "Type" : "None", "Direction" : "I"},
		{"Name" : "cur_read_pos_V", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "block_V", "Type" : "None", "Direction" : "I"},
		{"Name" : "rd_clk_in", "Type" : "None", "Direction" : "I"},
		{"Name" : "rd_mux", "Type" : "None", "Direction" : "I"},
		{"Name" : "mem_out0", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "mem_out1", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "mem_out2", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "mem_out3", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "mem_out4", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "mem_out5", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "mem_out6", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "mem_out7", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "zero", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "max", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "read_cnt", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "pos_r", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "trig", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "mem", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "mux", "Type" : "OVld", "Direction" : "IO"}]}]}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set Spec2ImplPortList { 
	data_out { ap_vld {  { data_out out_data 1 1 }  { data_out_ap_vld out_vld 1 1 } } }
	reset { ap_none {  { reset in_data 0 1 } } }
	cur_read_pos_V { ap_vld {  { cur_read_pos_V out_data 1 16 }  { cur_read_pos_V_ap_vld out_vld 1 1 } } }
	block_V { ap_none {  { block_V in_data 0 2 } } }
	rd_clk_in { ap_none {  { rd_clk_in in_data 0 1 } } }
	rd_mux { ap_none {  { rd_mux in_data 0 1 } } }
	mem_out0 { ap_memory {  { mem_out0_address0 mem_address 1 9 }  { mem_out0_ce0 mem_ce 1 1 }  { mem_out0_q0 mem_dout 0 1 } } }
	mem_out1 { ap_memory {  { mem_out1_address0 mem_address 1 9 }  { mem_out1_ce0 mem_ce 1 1 }  { mem_out1_q0 mem_dout 0 1 } } }
	mem_out2 { ap_memory {  { mem_out2_address0 mem_address 1 9 }  { mem_out2_ce0 mem_ce 1 1 }  { mem_out2_q0 mem_dout 0 1 } } }
	mem_out3 { ap_memory {  { mem_out3_address0 mem_address 1 9 }  { mem_out3_ce0 mem_ce 1 1 }  { mem_out3_q0 mem_dout 0 1 } } }
	mem_out4 { ap_memory {  { mem_out4_address0 mem_address 1 9 }  { mem_out4_ce0 mem_ce 1 1 }  { mem_out4_q0 mem_dout 0 1 } } }
	mem_out5 { ap_memory {  { mem_out5_address0 mem_address 1 9 }  { mem_out5_ce0 mem_ce 1 1 }  { mem_out5_q0 mem_dout 0 1 } } }
	mem_out6 { ap_memory {  { mem_out6_address0 mem_address 1 9 }  { mem_out6_ce0 mem_ce 1 1 }  { mem_out6_q0 mem_dout 0 1 } } }
	mem_out7 { ap_memory {  { mem_out7_address0 mem_address 1 9 }  { mem_out7_ce0 mem_ce 1 1 }  { mem_out7_q0 mem_dout 0 1 } } }
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
