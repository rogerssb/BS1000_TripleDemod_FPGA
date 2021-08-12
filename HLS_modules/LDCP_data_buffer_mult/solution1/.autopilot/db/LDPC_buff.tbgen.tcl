set C_TypeInfoList {{ 
"LDPC_buff" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"data_in": [[],"0"] }, {"reset": [[], {"scalar": "bool"}] }, {"raw_dat0": [[], {"array": ["0", [2048]]}] }, {"raw_dat1": [[], {"array": ["0", [2048]]}] }, {"raw_dat2": [[], {"array": ["0", [2048]]}] }, {"raw_dat3": [[], {"array": ["0", [2048]]}] }, {"raw_dat4": [[], {"array": ["0", [1024]]}] }, {"raw_dat5": [[], {"array": ["0", [1024]]}] }, {"raw_dat6": [[], {"array": ["0", [1024]]}] }, {"raw_dat7": [[], {"array": ["0", [1024]]}] }, {"raw_dat8": [[], {"array": ["0", [1024]]}] }, {"raw_dat9": [[], {"array": ["0", [1024]]}] }, {"raw_dat10": [[], {"array": ["0", [1024]]}] }, {"numbits": [[],"1"] }, {"overrun": [[],{ "pointer":  {"scalar": "bool"}}] }, {"full": [[],{ "pointer":  {"scalar": "bool"}}] }, {"write": [[], {"scalar": "bool"}] }, {"deran": [[],"2"] }, {"mux": [[],{ "pointer":  {"scalar": "bool"}}] }, {"decode_done": [[], {"scalar": "bool"}] }, {"decode_start": [[],{ "pointer":  {"scalar": "bool"}}] }, {"decode_ready": [[], {"scalar": "bool"}] }, {"decode_done_b": [[], {"scalar": "bool"}] }, {"decode_start_b": [[],{ "pointer":  {"scalar": "bool"}}] }, {"decode_ready_b": [[], {"scalar": "bool"}] }, {"deran_data": [[],{ "pointer": "0"}] }, {"cur_write_pos": [[],{ "pointer": "1"}] }, {"out_mux": [[], {"scalar": "bool"}] }],[],""], 
"1": [ "tab_int", {"typedef": [[[],"3"],""]}], 
"3": [ "ap_uint<16>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 16}}]],""]}}], 
"2": [ "tab_2_int", {"typedef": [[[],"4"],""]}], 
"4": [ "ap_uint<2>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 2}}]],""]}}], 
"0": [ "int8_t", {"typedef": [[[], {"scalar": "signed char"}],""]}]
}}
set moduleName LDPC_buff
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {LDPC_buff}
set C_modelType { void 0 }
set C_modelArgList {
	{ data_in int 8 regular  }
	{ reset uint 1 regular  }
	{ raw_dat0 int 8 regular {array 2048 { 0 3 } 0 1 }  }
	{ raw_dat1 int 8 regular {array 2048 { 0 3 } 0 1 }  }
	{ raw_dat2 int 8 regular {array 2048 { 0 3 } 0 1 }  }
	{ raw_dat3 int 8 regular {array 2048 { 0 3 } 0 1 }  }
	{ raw_dat4 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ raw_dat5 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ raw_dat6 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ raw_dat7 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ raw_dat8 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ raw_dat9 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ raw_dat10 int 8 regular {array 1024 { 0 3 } 0 1 }  }
	{ numbits_V int 16 regular  }
	{ overrun int 1 regular {pointer 1}  }
	{ full int 1 regular {pointer 1}  }
	{ write_r uint 1 regular  }
	{ deran_V int 2 regular  }
	{ mux int 1 regular {pointer 1}  }
	{ decode_done uint 1 regular  }
	{ decode_start int 1 regular {pointer 1}  }
	{ decode_ready uint 1 regular  }
	{ decode_done_b uint 1 regular  }
	{ decode_start_b int 1 regular {pointer 1}  }
	{ decode_ready_b uint 1 regular  }
	{ deran_data int 8 regular {pointer 1}  }
	{ cur_write_pos_V int 16 regular {pointer 1}  }
	{ out_mux uint 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "data_in", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "data_in","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "reset", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "reset","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "raw_dat0", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "raw_dat0","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}]} , 
 	{ "Name" : "raw_dat1", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "raw_dat1","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}]} , 
 	{ "Name" : "raw_dat2", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "raw_dat2","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}]} , 
 	{ "Name" : "raw_dat3", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "raw_dat3","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}]} , 
 	{ "Name" : "raw_dat4", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "raw_dat4","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}]} , 
 	{ "Name" : "raw_dat5", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "raw_dat5","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}]} , 
 	{ "Name" : "raw_dat6", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "raw_dat6","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}]} , 
 	{ "Name" : "raw_dat7", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "raw_dat7","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}]} , 
 	{ "Name" : "raw_dat8", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "raw_dat8","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}]} , 
 	{ "Name" : "raw_dat9", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "raw_dat9","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}]} , 
 	{ "Name" : "raw_dat10", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "raw_dat10","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}]} , 
 	{ "Name" : "numbits_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "numbits.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "overrun", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "overrun","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "full", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "full","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "write_r", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "write","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "deran_V", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "deran.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mux", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mux","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "decode_done", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "decode_done","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "decode_start", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "decode_start","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "decode_ready", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "decode_ready","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "decode_done_b", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "decode_done_b","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "decode_start_b", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "decode_start_b","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "decode_ready_b", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "decode_ready_b","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "deran_data", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "deran_data","cData": "signed char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "cur_write_pos_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "cur_write_pos.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_mux", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_mux","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 73
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ data_in sc_in sc_lv 8 signal 0 } 
	{ reset sc_in sc_logic 1 signal 1 } 
	{ raw_dat0_address0 sc_out sc_lv 11 signal 2 } 
	{ raw_dat0_ce0 sc_out sc_logic 1 signal 2 } 
	{ raw_dat0_we0 sc_out sc_logic 1 signal 2 } 
	{ raw_dat0_d0 sc_out sc_lv 8 signal 2 } 
	{ raw_dat1_address0 sc_out sc_lv 11 signal 3 } 
	{ raw_dat1_ce0 sc_out sc_logic 1 signal 3 } 
	{ raw_dat1_we0 sc_out sc_logic 1 signal 3 } 
	{ raw_dat1_d0 sc_out sc_lv 8 signal 3 } 
	{ raw_dat2_address0 sc_out sc_lv 11 signal 4 } 
	{ raw_dat2_ce0 sc_out sc_logic 1 signal 4 } 
	{ raw_dat2_we0 sc_out sc_logic 1 signal 4 } 
	{ raw_dat2_d0 sc_out sc_lv 8 signal 4 } 
	{ raw_dat3_address0 sc_out sc_lv 11 signal 5 } 
	{ raw_dat3_ce0 sc_out sc_logic 1 signal 5 } 
	{ raw_dat3_we0 sc_out sc_logic 1 signal 5 } 
	{ raw_dat3_d0 sc_out sc_lv 8 signal 5 } 
	{ raw_dat4_address0 sc_out sc_lv 10 signal 6 } 
	{ raw_dat4_ce0 sc_out sc_logic 1 signal 6 } 
	{ raw_dat4_we0 sc_out sc_logic 1 signal 6 } 
	{ raw_dat4_d0 sc_out sc_lv 8 signal 6 } 
	{ raw_dat5_address0 sc_out sc_lv 10 signal 7 } 
	{ raw_dat5_ce0 sc_out sc_logic 1 signal 7 } 
	{ raw_dat5_we0 sc_out sc_logic 1 signal 7 } 
	{ raw_dat5_d0 sc_out sc_lv 8 signal 7 } 
	{ raw_dat6_address0 sc_out sc_lv 10 signal 8 } 
	{ raw_dat6_ce0 sc_out sc_logic 1 signal 8 } 
	{ raw_dat6_we0 sc_out sc_logic 1 signal 8 } 
	{ raw_dat6_d0 sc_out sc_lv 8 signal 8 } 
	{ raw_dat7_address0 sc_out sc_lv 10 signal 9 } 
	{ raw_dat7_ce0 sc_out sc_logic 1 signal 9 } 
	{ raw_dat7_we0 sc_out sc_logic 1 signal 9 } 
	{ raw_dat7_d0 sc_out sc_lv 8 signal 9 } 
	{ raw_dat8_address0 sc_out sc_lv 10 signal 10 } 
	{ raw_dat8_ce0 sc_out sc_logic 1 signal 10 } 
	{ raw_dat8_we0 sc_out sc_logic 1 signal 10 } 
	{ raw_dat8_d0 sc_out sc_lv 8 signal 10 } 
	{ raw_dat9_address0 sc_out sc_lv 10 signal 11 } 
	{ raw_dat9_ce0 sc_out sc_logic 1 signal 11 } 
	{ raw_dat9_we0 sc_out sc_logic 1 signal 11 } 
	{ raw_dat9_d0 sc_out sc_lv 8 signal 11 } 
	{ raw_dat10_address0 sc_out sc_lv 10 signal 12 } 
	{ raw_dat10_ce0 sc_out sc_logic 1 signal 12 } 
	{ raw_dat10_we0 sc_out sc_logic 1 signal 12 } 
	{ raw_dat10_d0 sc_out sc_lv 8 signal 12 } 
	{ numbits_V sc_in sc_lv 16 signal 13 } 
	{ overrun sc_out sc_logic 1 signal 14 } 
	{ overrun_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ full sc_out sc_logic 1 signal 15 } 
	{ full_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ write_r sc_in sc_logic 1 signal 16 } 
	{ deran_V sc_in sc_lv 2 signal 17 } 
	{ mux sc_out sc_logic 1 signal 18 } 
	{ decode_done sc_in sc_logic 1 signal 19 } 
	{ decode_start sc_out sc_logic 1 signal 20 } 
	{ decode_start_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ decode_ready sc_in sc_logic 1 signal 21 } 
	{ decode_done_b sc_in sc_logic 1 signal 22 } 
	{ decode_start_b sc_out sc_logic 1 signal 23 } 
	{ decode_start_b_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ decode_ready_b sc_in sc_logic 1 signal 24 } 
	{ deran_data sc_out sc_lv 8 signal 25 } 
	{ deran_data_ap_vld sc_out sc_logic 1 outvld 25 } 
	{ cur_write_pos_V sc_out sc_lv 16 signal 26 } 
	{ cur_write_pos_V_ap_vld sc_out sc_logic 1 outvld 26 } 
	{ out_mux sc_in sc_logic 1 signal 27 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "data_in", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "data_in", "role": "default" }} , 
 	{ "name": "reset", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "reset", "role": "default" }} , 
 	{ "name": "raw_dat0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "raw_dat0", "role": "address0" }} , 
 	{ "name": "raw_dat0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat0", "role": "ce0" }} , 
 	{ "name": "raw_dat0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat0", "role": "we0" }} , 
 	{ "name": "raw_dat0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "raw_dat0", "role": "d0" }} , 
 	{ "name": "raw_dat1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "raw_dat1", "role": "address0" }} , 
 	{ "name": "raw_dat1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat1", "role": "ce0" }} , 
 	{ "name": "raw_dat1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat1", "role": "we0" }} , 
 	{ "name": "raw_dat1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "raw_dat1", "role": "d0" }} , 
 	{ "name": "raw_dat2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "raw_dat2", "role": "address0" }} , 
 	{ "name": "raw_dat2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat2", "role": "ce0" }} , 
 	{ "name": "raw_dat2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat2", "role": "we0" }} , 
 	{ "name": "raw_dat2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "raw_dat2", "role": "d0" }} , 
 	{ "name": "raw_dat3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "raw_dat3", "role": "address0" }} , 
 	{ "name": "raw_dat3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat3", "role": "ce0" }} , 
 	{ "name": "raw_dat3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat3", "role": "we0" }} , 
 	{ "name": "raw_dat3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "raw_dat3", "role": "d0" }} , 
 	{ "name": "raw_dat4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "raw_dat4", "role": "address0" }} , 
 	{ "name": "raw_dat4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat4", "role": "ce0" }} , 
 	{ "name": "raw_dat4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat4", "role": "we0" }} , 
 	{ "name": "raw_dat4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "raw_dat4", "role": "d0" }} , 
 	{ "name": "raw_dat5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "raw_dat5", "role": "address0" }} , 
 	{ "name": "raw_dat5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat5", "role": "ce0" }} , 
 	{ "name": "raw_dat5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat5", "role": "we0" }} , 
 	{ "name": "raw_dat5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "raw_dat5", "role": "d0" }} , 
 	{ "name": "raw_dat6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "raw_dat6", "role": "address0" }} , 
 	{ "name": "raw_dat6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat6", "role": "ce0" }} , 
 	{ "name": "raw_dat6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat6", "role": "we0" }} , 
 	{ "name": "raw_dat6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "raw_dat6", "role": "d0" }} , 
 	{ "name": "raw_dat7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "raw_dat7", "role": "address0" }} , 
 	{ "name": "raw_dat7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat7", "role": "ce0" }} , 
 	{ "name": "raw_dat7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat7", "role": "we0" }} , 
 	{ "name": "raw_dat7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "raw_dat7", "role": "d0" }} , 
 	{ "name": "raw_dat8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "raw_dat8", "role": "address0" }} , 
 	{ "name": "raw_dat8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat8", "role": "ce0" }} , 
 	{ "name": "raw_dat8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat8", "role": "we0" }} , 
 	{ "name": "raw_dat8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "raw_dat8", "role": "d0" }} , 
 	{ "name": "raw_dat9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "raw_dat9", "role": "address0" }} , 
 	{ "name": "raw_dat9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat9", "role": "ce0" }} , 
 	{ "name": "raw_dat9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat9", "role": "we0" }} , 
 	{ "name": "raw_dat9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "raw_dat9", "role": "d0" }} , 
 	{ "name": "raw_dat10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "raw_dat10", "role": "address0" }} , 
 	{ "name": "raw_dat10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat10", "role": "ce0" }} , 
 	{ "name": "raw_dat10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "raw_dat10", "role": "we0" }} , 
 	{ "name": "raw_dat10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "raw_dat10", "role": "d0" }} , 
 	{ "name": "numbits_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "numbits_V", "role": "default" }} , 
 	{ "name": "overrun", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "overrun", "role": "default" }} , 
 	{ "name": "overrun_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "overrun", "role": "ap_vld" }} , 
 	{ "name": "full", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "full", "role": "default" }} , 
 	{ "name": "full_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "full", "role": "ap_vld" }} , 
 	{ "name": "write_r", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "write_r", "role": "default" }} , 
 	{ "name": "deran_V", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "deran_V", "role": "default" }} , 
 	{ "name": "mux", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mux", "role": "default" }} , 
 	{ "name": "decode_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "decode_done", "role": "default" }} , 
 	{ "name": "decode_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "decode_start", "role": "default" }} , 
 	{ "name": "decode_start_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "decode_start", "role": "ap_vld" }} , 
 	{ "name": "decode_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "decode_ready", "role": "default" }} , 
 	{ "name": "decode_done_b", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "decode_done_b", "role": "default" }} , 
 	{ "name": "decode_start_b", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "decode_start_b", "role": "default" }} , 
 	{ "name": "decode_start_b_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "decode_start_b", "role": "ap_vld" }} , 
 	{ "name": "decode_ready_b", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "decode_ready_b", "role": "default" }} , 
 	{ "name": "deran_data", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "deran_data", "role": "default" }} , 
 	{ "name": "deran_data_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "deran_data", "role": "ap_vld" }} , 
 	{ "name": "cur_write_pos_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "cur_write_pos_V", "role": "default" }} , 
 	{ "name": "cur_write_pos_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cur_write_pos_V", "role": "ap_vld" }} , 
 	{ "name": "out_mux", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_mux", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "LDPC_buff",
		"VariableLatency" : "0",
		"AlignedPipeline" : "0",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "0",
		"ControlExist" : "1",
		"Port" : [
		{"Name" : "data_in", "Type" : "None", "Direction" : "I"},
		{"Name" : "reset", "Type" : "None", "Direction" : "I"},
		{"Name" : "raw_dat0", "Type" : "Memory", "Direction" : "O",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "r_dat0"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "r_dat0"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "r_dat0"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "r_dat0"}]},
		{"Name" : "raw_dat1", "Type" : "Memory", "Direction" : "O",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "r_dat1"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "r_dat1"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "r_dat1"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "r_dat1"}]},
		{"Name" : "raw_dat2", "Type" : "Memory", "Direction" : "O",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "r_dat2"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "r_dat2"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "r_dat2"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "r_dat2"}]},
		{"Name" : "raw_dat3", "Type" : "Memory", "Direction" : "O",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "r_dat3"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "r_dat3"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "r_dat3"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "r_dat3"}]},
		{"Name" : "raw_dat4", "Type" : "Memory", "Direction" : "O",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "r_dat4"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "r_dat4"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "r_dat4"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "r_dat4"}]},
		{"Name" : "raw_dat5", "Type" : "Memory", "Direction" : "O",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "r_dat5"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "r_dat5"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "r_dat5"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "r_dat5"}]},
		{"Name" : "raw_dat6", "Type" : "Memory", "Direction" : "O",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "r_dat6"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "r_dat6"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "r_dat6"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "r_dat6"}]},
		{"Name" : "raw_dat7", "Type" : "Memory", "Direction" : "O",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "r_dat7"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "r_dat7"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "r_dat7"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "r_dat7"}]},
		{"Name" : "raw_dat8", "Type" : "Memory", "Direction" : "O",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "r_dat8"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "r_dat8"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "r_dat8"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "r_dat8"}]},
		{"Name" : "raw_dat9", "Type" : "Memory", "Direction" : "O",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "r_dat9"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "r_dat9"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "r_dat9"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "r_dat9"}]},
		{"Name" : "raw_dat10", "Type" : "Memory", "Direction" : "O",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "r_dat10"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "r_dat10"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "r_dat10"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "r_dat10"}]},
		{"Name" : "numbits_V", "Type" : "None", "Direction" : "I"},
		{"Name" : "overrun", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "full", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "write_r", "Type" : "None", "Direction" : "I"},
		{"Name" : "deran_V", "Type" : "None", "Direction" : "I"},
		{"Name" : "mux", "Type" : "None", "Direction" : "O"},
		{"Name" : "decode_done", "Type" : "None", "Direction" : "I"},
		{"Name" : "decode_start", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "decode_ready", "Type" : "None", "Direction" : "I"},
		{"Name" : "decode_done_b", "Type" : "None", "Direction" : "I"},
		{"Name" : "decode_start_b", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "decode_ready_b", "Type" : "None", "Direction" : "I"},
		{"Name" : "deran_data", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "cur_write_pos_V", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "out_mux", "Type" : "None", "Direction" : "I"},
		{"Name" : "write_pos", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "ccsds_V", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "mux_pos", "Type" : "OVld", "Direction" : "IO"},
		{"Name" : "pos_r", "Type" : "OVld", "Direction" : "IO",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "pos_r"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "pos_r"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "pos_r"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "pos_r"}]},
		{"Name" : "mem", "Type" : "OVld", "Direction" : "IO",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "mem"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "mem"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "mem"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "mem"}]},
		{"Name" : "trig", "Type" : "OVld", "Direction" : "IO",
			"SubConnect" : [
			{"ID" : "1", "SubInstance" : "StgValue_87_write_raw_data_fu_556", "Port" : "trig"},
			{"ID" : "2", "SubInstance" : "StgValue_117_write_raw_data_fu_589", "Port" : "trig"},
			{"ID" : "3", "SubInstance" : "StgValue_150_write_raw_data_fu_622", "Port" : "trig"},
			{"ID" : "4", "SubInstance" : "StgValue_173_write_raw_data_fu_655", "Port" : "trig"}]},
		{"Name" : "irig", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.StgValue_87_write_raw_data_fu_556", "Parent" : "0",
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
		{"Name" : "trig", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.StgValue_117_write_raw_data_fu_589", "Parent" : "0",
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
		{"Name" : "trig", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.StgValue_150_write_raw_data_fu_622", "Parent" : "0",
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
		{"Name" : "trig", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.StgValue_173_write_raw_data_fu_655", "Parent" : "0",
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
	data_in { ap_none {  { data_in in_data 0 8 } } }
	reset { ap_none {  { reset in_data 0 1 } } }
	raw_dat0 { ap_memory {  { raw_dat0_address0 mem_address 1 11 }  { raw_dat0_ce0 mem_ce 1 1 }  { raw_dat0_we0 mem_we 1 1 }  { raw_dat0_d0 mem_din 1 8 } } }
	raw_dat1 { ap_memory {  { raw_dat1_address0 mem_address 1 11 }  { raw_dat1_ce0 mem_ce 1 1 }  { raw_dat1_we0 mem_we 1 1 }  { raw_dat1_d0 mem_din 1 8 } } }
	raw_dat2 { ap_memory {  { raw_dat2_address0 mem_address 1 11 }  { raw_dat2_ce0 mem_ce 1 1 }  { raw_dat2_we0 mem_we 1 1 }  { raw_dat2_d0 mem_din 1 8 } } }
	raw_dat3 { ap_memory {  { raw_dat3_address0 mem_address 1 11 }  { raw_dat3_ce0 mem_ce 1 1 }  { raw_dat3_we0 mem_we 1 1 }  { raw_dat3_d0 mem_din 1 8 } } }
	raw_dat4 { ap_memory {  { raw_dat4_address0 mem_address 1 10 }  { raw_dat4_ce0 mem_ce 1 1 }  { raw_dat4_we0 mem_we 1 1 }  { raw_dat4_d0 mem_din 1 8 } } }
	raw_dat5 { ap_memory {  { raw_dat5_address0 mem_address 1 10 }  { raw_dat5_ce0 mem_ce 1 1 }  { raw_dat5_we0 mem_we 1 1 }  { raw_dat5_d0 mem_din 1 8 } } }
	raw_dat6 { ap_memory {  { raw_dat6_address0 mem_address 1 10 }  { raw_dat6_ce0 mem_ce 1 1 }  { raw_dat6_we0 mem_we 1 1 }  { raw_dat6_d0 mem_din 1 8 } } }
	raw_dat7 { ap_memory {  { raw_dat7_address0 mem_address 1 10 }  { raw_dat7_ce0 mem_ce 1 1 }  { raw_dat7_we0 mem_we 1 1 }  { raw_dat7_d0 mem_din 1 8 } } }
	raw_dat8 { ap_memory {  { raw_dat8_address0 mem_address 1 10 }  { raw_dat8_ce0 mem_ce 1 1 }  { raw_dat8_we0 mem_we 1 1 }  { raw_dat8_d0 mem_din 1 8 } } }
	raw_dat9 { ap_memory {  { raw_dat9_address0 mem_address 1 10 }  { raw_dat9_ce0 mem_ce 1 1 }  { raw_dat9_we0 mem_we 1 1 }  { raw_dat9_d0 mem_din 1 8 } } }
	raw_dat10 { ap_memory {  { raw_dat10_address0 mem_address 1 10 }  { raw_dat10_ce0 mem_ce 1 1 }  { raw_dat10_we0 mem_we 1 1 }  { raw_dat10_d0 mem_din 1 8 } } }
	numbits_V { ap_none {  { numbits_V in_data 0 16 } } }
	overrun { ap_vld {  { overrun out_data 1 1 }  { overrun_ap_vld out_vld 1 1 } } }
	full { ap_vld {  { full out_data 1 1 }  { full_ap_vld out_vld 1 1 } } }
	write_r { ap_none {  { write_r in_data 0 1 } } }
	deran_V { ap_none {  { deran_V in_data 0 2 } } }
	mux { ap_none {  { mux out_data 1 1 } } }
	decode_done { ap_none {  { decode_done in_data 0 1 } } }
	decode_start { ap_vld {  { decode_start out_data 1 1 }  { decode_start_ap_vld out_vld 1 1 } } }
	decode_ready { ap_none {  { decode_ready in_data 0 1 } } }
	decode_done_b { ap_none {  { decode_done_b in_data 0 1 } } }
	decode_start_b { ap_vld {  { decode_start_b out_data 1 1 }  { decode_start_b_ap_vld out_vld 1 1 } } }
	decode_ready_b { ap_none {  { decode_ready_b in_data 0 1 } } }
	deran_data { ap_vld {  { deran_data out_data 1 8 }  { deran_data_ap_vld out_vld 1 1 } } }
	cur_write_pos_V { ap_vld {  { cur_write_pos_V out_data 1 16 }  { cur_write_pos_V_ap_vld out_vld 1 1 } } }
	out_mux { ap_none {  { out_mux in_data 0 1 } } }
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
