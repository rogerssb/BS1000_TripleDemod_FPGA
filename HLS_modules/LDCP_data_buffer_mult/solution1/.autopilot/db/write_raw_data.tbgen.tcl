set moduleName write_raw_data
set isCombinational 1
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {write_raw_data}
set C_modelType { void 0 }
set C_modelArgList {
	{ dat int 8 regular  }
	{ r_dat0 int 8 regular {array 2048 { 0 3 } 0 1 }  }
	{ r_dat1 int 8 regular {array 2048 { 0 3 } 0 1 }  }
	{ r_dat2 int 8 regular {array 2048 { 0 3 } 0 1 }  }
	{ r_dat3 int 8 regular {array 2048 { 0 3 } 0 1 }  }
	{ r_dat4 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ r_dat5 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ r_dat6 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ r_dat7 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ r_dat8 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ r_dat9 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ r_dat10 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ mem int 16 regular {pointer 2} {global 2}  }
	{ pos_r int 16 regular {pointer 2} {global 2}  }
	{ trig int 12 regular {pointer 0} {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "dat", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "r_dat0", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r_dat1", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r_dat2", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r_dat3", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r_dat4", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r_dat5", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r_dat6", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r_dat7", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r_dat8", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r_dat9", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "r_dat10", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mem", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "pos_r", "interface" : "wire", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "trig", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 52
set portList { 
	{ dat sc_in sc_lv 8 signal 0 } 
	{ r_dat0_address0 sc_out sc_lv 11 signal 1 } 
	{ r_dat0_ce0 sc_out sc_logic 1 signal 1 } 
	{ r_dat0_we0 sc_out sc_logic 1 signal 1 } 
	{ r_dat0_d0 sc_out sc_lv 8 signal 1 } 
	{ r_dat1_address0 sc_out sc_lv 11 signal 2 } 
	{ r_dat1_ce0 sc_out sc_logic 1 signal 2 } 
	{ r_dat1_we0 sc_out sc_logic 1 signal 2 } 
	{ r_dat1_d0 sc_out sc_lv 8 signal 2 } 
	{ r_dat2_address0 sc_out sc_lv 11 signal 3 } 
	{ r_dat2_ce0 sc_out sc_logic 1 signal 3 } 
	{ r_dat2_we0 sc_out sc_logic 1 signal 3 } 
	{ r_dat2_d0 sc_out sc_lv 8 signal 3 } 
	{ r_dat3_address0 sc_out sc_lv 11 signal 4 } 
	{ r_dat3_ce0 sc_out sc_logic 1 signal 4 } 
	{ r_dat3_we0 sc_out sc_logic 1 signal 4 } 
	{ r_dat3_d0 sc_out sc_lv 8 signal 4 } 
	{ r_dat4_address0 sc_out sc_lv 10 signal 5 } 
	{ r_dat4_ce0 sc_out sc_logic 1 signal 5 } 
	{ r_dat4_we0 sc_out sc_logic 1 signal 5 } 
	{ r_dat4_d0 sc_out sc_lv 8 signal 5 } 
	{ r_dat5_address0 sc_out sc_lv 10 signal 6 } 
	{ r_dat5_ce0 sc_out sc_logic 1 signal 6 } 
	{ r_dat5_we0 sc_out sc_logic 1 signal 6 } 
	{ r_dat5_d0 sc_out sc_lv 8 signal 6 } 
	{ r_dat6_address0 sc_out sc_lv 10 signal 7 } 
	{ r_dat6_ce0 sc_out sc_logic 1 signal 7 } 
	{ r_dat6_we0 sc_out sc_logic 1 signal 7 } 
	{ r_dat6_d0 sc_out sc_lv 8 signal 7 } 
	{ r_dat7_address0 sc_out sc_lv 10 signal 8 } 
	{ r_dat7_ce0 sc_out sc_logic 1 signal 8 } 
	{ r_dat7_we0 sc_out sc_logic 1 signal 8 } 
	{ r_dat7_d0 sc_out sc_lv 8 signal 8 } 
	{ r_dat8_address0 sc_out sc_lv 10 signal 9 } 
	{ r_dat8_ce0 sc_out sc_logic 1 signal 9 } 
	{ r_dat8_we0 sc_out sc_logic 1 signal 9 } 
	{ r_dat8_d0 sc_out sc_lv 8 signal 9 } 
	{ r_dat9_address0 sc_out sc_lv 10 signal 10 } 
	{ r_dat9_ce0 sc_out sc_logic 1 signal 10 } 
	{ r_dat9_we0 sc_out sc_logic 1 signal 10 } 
	{ r_dat9_d0 sc_out sc_lv 8 signal 10 } 
	{ r_dat10_address0 sc_out sc_lv 10 signal 11 } 
	{ r_dat10_ce0 sc_out sc_logic 1 signal 11 } 
	{ r_dat10_we0 sc_out sc_logic 1 signal 11 } 
	{ r_dat10_d0 sc_out sc_lv 8 signal 11 } 
	{ mem_i sc_in sc_lv 16 signal 12 } 
	{ mem_o sc_out sc_lv 16 signal 12 } 
	{ mem_o_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ pos_r_i sc_in sc_lv 16 signal 13 } 
	{ pos_r_o sc_out sc_lv 16 signal 13 } 
	{ pos_r_o_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ trig sc_in sc_lv 12 signal 14 } 
}
set NewPortList {[ 
	{ "name": "dat", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dat", "role": "default" }} , 
 	{ "name": "r_dat0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "r_dat0", "role": "address0" }} , 
 	{ "name": "r_dat0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat0", "role": "ce0" }} , 
 	{ "name": "r_dat0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat0", "role": "we0" }} , 
 	{ "name": "r_dat0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "r_dat0", "role": "d0" }} , 
 	{ "name": "r_dat1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "r_dat1", "role": "address0" }} , 
 	{ "name": "r_dat1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat1", "role": "ce0" }} , 
 	{ "name": "r_dat1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat1", "role": "we0" }} , 
 	{ "name": "r_dat1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "r_dat1", "role": "d0" }} , 
 	{ "name": "r_dat2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "r_dat2", "role": "address0" }} , 
 	{ "name": "r_dat2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat2", "role": "ce0" }} , 
 	{ "name": "r_dat2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat2", "role": "we0" }} , 
 	{ "name": "r_dat2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "r_dat2", "role": "d0" }} , 
 	{ "name": "r_dat3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "r_dat3", "role": "address0" }} , 
 	{ "name": "r_dat3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat3", "role": "ce0" }} , 
 	{ "name": "r_dat3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat3", "role": "we0" }} , 
 	{ "name": "r_dat3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "r_dat3", "role": "d0" }} , 
 	{ "name": "r_dat4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "r_dat4", "role": "address0" }} , 
 	{ "name": "r_dat4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat4", "role": "ce0" }} , 
 	{ "name": "r_dat4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat4", "role": "we0" }} , 
 	{ "name": "r_dat4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "r_dat4", "role": "d0" }} , 
 	{ "name": "r_dat5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "r_dat5", "role": "address0" }} , 
 	{ "name": "r_dat5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat5", "role": "ce0" }} , 
 	{ "name": "r_dat5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat5", "role": "we0" }} , 
 	{ "name": "r_dat5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "r_dat5", "role": "d0" }} , 
 	{ "name": "r_dat6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "r_dat6", "role": "address0" }} , 
 	{ "name": "r_dat6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat6", "role": "ce0" }} , 
 	{ "name": "r_dat6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat6", "role": "we0" }} , 
 	{ "name": "r_dat6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "r_dat6", "role": "d0" }} , 
 	{ "name": "r_dat7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "r_dat7", "role": "address0" }} , 
 	{ "name": "r_dat7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat7", "role": "ce0" }} , 
 	{ "name": "r_dat7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat7", "role": "we0" }} , 
 	{ "name": "r_dat7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "r_dat7", "role": "d0" }} , 
 	{ "name": "r_dat8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "r_dat8", "role": "address0" }} , 
 	{ "name": "r_dat8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat8", "role": "ce0" }} , 
 	{ "name": "r_dat8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat8", "role": "we0" }} , 
 	{ "name": "r_dat8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "r_dat8", "role": "d0" }} , 
 	{ "name": "r_dat9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "r_dat9", "role": "address0" }} , 
 	{ "name": "r_dat9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat9", "role": "ce0" }} , 
 	{ "name": "r_dat9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat9", "role": "we0" }} , 
 	{ "name": "r_dat9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "r_dat9", "role": "d0" }} , 
 	{ "name": "r_dat10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "r_dat10", "role": "address0" }} , 
 	{ "name": "r_dat10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat10", "role": "ce0" }} , 
 	{ "name": "r_dat10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "r_dat10", "role": "we0" }} , 
 	{ "name": "r_dat10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "r_dat10", "role": "d0" }} , 
 	{ "name": "mem_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mem", "role": "i" }} , 
 	{ "name": "mem_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mem", "role": "o" }} , 
 	{ "name": "mem_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mem", "role": "o_ap_vld" }} , 
 	{ "name": "pos_r_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pos_r", "role": "i" }} , 
 	{ "name": "pos_r_o", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pos_r", "role": "o" }} , 
 	{ "name": "pos_r_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pos_r", "role": "o_ap_vld" }} , 
 	{ "name": "trig", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "trig", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "write_raw_data",
		"VariableLatency" : "0",
		"AlignedPipeline" : "0",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "1",
		"ControlExist" : "0",
		"Port" : [
		{"Name" : "dat", "Type" : "None", "Direction" : "I"},
		{"Name" : "r_dat0", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "r_dat1", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "r_dat2", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "r_dat3", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "r_dat4", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "r_dat5", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "r_dat6", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "r_dat7", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "r_dat8", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "r_dat9", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "r_dat10", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "mem", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "pos_r", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "trig", "Type" : "None", "Direction" : "I"}]}]}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set Spec2ImplPortList { 
	dat { ap_none {  { dat in_data 0 8 } } }
	r_dat0 { ap_memory {  { r_dat0_address0 mem_address 1 11 }  { r_dat0_ce0 mem_ce 1 1 }  { r_dat0_we0 mem_we 1 1 }  { r_dat0_d0 mem_din 1 8 } } }
	r_dat1 { ap_memory {  { r_dat1_address0 mem_address 1 11 }  { r_dat1_ce0 mem_ce 1 1 }  { r_dat1_we0 mem_we 1 1 }  { r_dat1_d0 mem_din 1 8 } } }
	r_dat2 { ap_memory {  { r_dat2_address0 mem_address 1 11 }  { r_dat2_ce0 mem_ce 1 1 }  { r_dat2_we0 mem_we 1 1 }  { r_dat2_d0 mem_din 1 8 } } }
	r_dat3 { ap_memory {  { r_dat3_address0 mem_address 1 11 }  { r_dat3_ce0 mem_ce 1 1 }  { r_dat3_we0 mem_we 1 1 }  { r_dat3_d0 mem_din 1 8 } } }
	r_dat4 { ap_memory {  { r_dat4_address0 mem_address 1 10 }  { r_dat4_ce0 mem_ce 1 1 }  { r_dat4_we0 mem_we 1 1 }  { r_dat4_d0 mem_din 1 8 } } }
	r_dat5 { ap_memory {  { r_dat5_address0 mem_address 1 10 }  { r_dat5_ce0 mem_ce 1 1 }  { r_dat5_we0 mem_we 1 1 }  { r_dat5_d0 mem_din 1 8 } } }
	r_dat6 { ap_memory {  { r_dat6_address0 mem_address 1 10 }  { r_dat6_ce0 mem_ce 1 1 }  { r_dat6_we0 mem_we 1 1 }  { r_dat6_d0 mem_din 1 8 } } }
	r_dat7 { ap_memory {  { r_dat7_address0 mem_address 1 10 }  { r_dat7_ce0 mem_ce 1 1 }  { r_dat7_we0 mem_we 1 1 }  { r_dat7_d0 mem_din 1 8 } } }
	r_dat8 { ap_memory {  { r_dat8_address0 mem_address 1 10 }  { r_dat8_ce0 mem_ce 1 1 }  { r_dat8_we0 mem_we 1 1 }  { r_dat8_d0 mem_din 1 8 } } }
	r_dat9 { ap_memory {  { r_dat9_address0 mem_address 1 10 }  { r_dat9_ce0 mem_ce 1 1 }  { r_dat9_we0 mem_we 1 1 }  { r_dat9_d0 mem_din 1 8 } } }
	r_dat10 { ap_memory {  { r_dat10_address0 mem_address 1 10 }  { r_dat10_ce0 mem_ce 1 1 }  { r_dat10_we0 mem_we 1 1 }  { r_dat10_d0 mem_din 1 8 } } }
	mem { ap_ovld {  { mem_i in_data 0 16 }  { mem_o out_data 1 16 }  { mem_o_ap_vld out_vld 1 1 } } }
	pos_r { ap_ovld {  { pos_r_i in_data 0 16 }  { pos_r_o out_data 1 16 }  { pos_r_o_ap_vld out_vld 1 1 } } }
	trig { ap_none {  { trig in_data 0 12 } } }
}
