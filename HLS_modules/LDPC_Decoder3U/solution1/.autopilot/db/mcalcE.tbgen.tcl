set moduleName mcalcE
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {mcalcE}
set C_modelType { void 0 }
set C_modelArgList {
	{ Lam_tabe_0 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabe_0 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabe_1 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabe_1 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabe_2 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabe_2 int 16 regular {pointer 0} {global 0}  }
	{ Eta_ans_3_0 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_3_1 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_3_2 int 16 regular {pointer 1} {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "Lam_tabe_0", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabe","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabe_0", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabe","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabe_1", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabe","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabe_1", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabe","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabe_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabe","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabe_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabe","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_3_0", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_3","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_3_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_3","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_3_2", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_3","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}], "extern" : 0} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
	{ Lam_tabe_0 sc_in sc_lv 16 signal 0 } 
	{ Peta_tabe_0 sc_in sc_lv 16 signal 1 } 
	{ Lam_tabe_1 sc_in sc_lv 16 signal 2 } 
	{ Peta_tabe_1 sc_in sc_lv 16 signal 3 } 
	{ Lam_tabe_2 sc_in sc_lv 16 signal 4 } 
	{ Peta_tabe_2 sc_in sc_lv 16 signal 5 } 
	{ Eta_ans_3_0 sc_out sc_lv 16 signal 6 } 
	{ Eta_ans_3_0_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ Eta_ans_3_1 sc_out sc_lv 16 signal 7 } 
	{ Eta_ans_3_1_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ Eta_ans_3_2 sc_out sc_lv 16 signal 8 } 
	{ Eta_ans_3_2_ap_vld sc_out sc_logic 1 outvld 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }} , 
 	{ "name": "Lam_tabe_0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabe_0", "role": "default" }} , 
 	{ "name": "Peta_tabe_0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabe_0", "role": "default" }} , 
 	{ "name": "Lam_tabe_1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabe_1", "role": "default" }} , 
 	{ "name": "Peta_tabe_1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabe_1", "role": "default" }} , 
 	{ "name": "Lam_tabe_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabe_2", "role": "default" }} , 
 	{ "name": "Peta_tabe_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabe_2", "role": "default" }} , 
 	{ "name": "Eta_ans_3_0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_3_0", "role": "default" }} , 
 	{ "name": "Eta_ans_3_0_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_3_0", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_3_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_3_1", "role": "default" }} , 
 	{ "name": "Eta_ans_3_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_3_1", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_3_2", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_3_2", "role": "default" }} , 
 	{ "name": "Eta_ans_3_2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_3_2", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "mcalcE",
		"VariableLatency" : "0",
		"AlignedPipeline" : "1",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "0",
		"ControlExist" : "1",
		"Port" : [
		{"Name" : "Lam_tabe_0", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabe_0", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabe_1", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabe_1", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabe_2", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabe_2", "Type" : "None", "Direction" : "I"},
		{"Name" : "Eta_ans_3_0", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_3_1", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_3_2", "Type" : "Vld", "Direction" : "O"}]}]}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set Spec2ImplPortList { 
	Lam_tabe_0 { ap_none {  { Lam_tabe_0 in_data 0 16 } } }
	Peta_tabe_0 { ap_none {  { Peta_tabe_0 in_data 0 16 } } }
	Lam_tabe_1 { ap_none {  { Lam_tabe_1 in_data 0 16 } } }
	Peta_tabe_1 { ap_none {  { Peta_tabe_1 in_data 0 16 } } }
	Lam_tabe_2 { ap_none {  { Lam_tabe_2 in_data 0 16 } } }
	Peta_tabe_2 { ap_none {  { Peta_tabe_2 in_data 0 16 } } }
	Eta_ans_3_0 { ap_vld {  { Eta_ans_3_0 out_data 1 16 }  { Eta_ans_3_0_ap_vld out_vld 1 1 } } }
	Eta_ans_3_1 { ap_vld {  { Eta_ans_3_1 out_data 1 16 }  { Eta_ans_3_1_ap_vld out_vld 1 1 } } }
	Eta_ans_3_2 { ap_vld {  { Eta_ans_3_2 out_data 1 16 }  { Eta_ans_3_2_ap_vld out_vld 1 1 } } }
}
