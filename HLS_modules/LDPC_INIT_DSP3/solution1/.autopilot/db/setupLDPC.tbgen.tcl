set C_TypeInfoList {{ 
"setupLDPC" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"size": [[],"0"] }, {"rate": [[],"0"] }, {"nR_M": [[],{ "pointer": "1"}] }, {"etaIndexM_M": [[],{ "pointer": "1"}] }, {"etaIndexN_M": [[],{ "pointer": "1"}] }, {"pCodeM": [[],{ "pointer": "1"}] }, {"pMaxIterations": [[],{ "pointer": "1"}] }, {"etaIndexM": [[], {"array": ["1", [36864]]}] }, {"etaIndexN": [[], {"array": ["1", [40960]]}] }, {"lambdaIndexM": [[], {"array": ["1", [36864]]}] }],["2","3","4","5"],""],
 "2": [ "clk", [[], {"scalar": "bool"}],""],
 "3": [ "cs", [[], {"scalar": "bool"}],""],
 "4": [ "dout", [[], {"scalar": "bool"}],""],
 "5": [ "din", [[], {"scalar": "bool"}],""], 
"0": [ "int_2b", {"typedef": [[[],"6"],""]}], 
"6": [ "ap_uint<2>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 2}}]],""]}}], 
"1": [ "tab_int", {"typedef": [[[],"7"],""]}], 
"7": [ "ap_uint<16>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 16}}]],""]}}]
}}
set moduleName setupLDPC
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {setupLDPC}
set C_modelType { void 0 }
set C_modelArgList { 
	{ size_V int 2 regular  }
	{ rate_V int 2 regular  }
	{ nR_M_V int 16 regular {pointer 1}  }
	{ etaIndexM_M_V int 16 regular {pointer 1}  }
	{ etaIndexN_M_V int 16 regular {pointer 1}  }
	{ pCodeM_V int 16 regular {pointer 1}  }
	{ pMaxIterations_V int 16 regular {pointer 1}  }
	{ etaIndexM_V int 16 regular {array 36864 { 0 3 } 0 1 }  }
	{ etaIndexN_V int 16 regular {array 40960 { 0 3 } 0 1 }  }
	{ lambdaIndexM_V int 16 regular {array 36864 { 0 3 } 0 1 }  }
	{ dout int 1 regular {pointer 1} {global 1}  }
	{ din int 1 regular {pointer 0} {global 0}  }
	{ cs int 1 regular {pointer 1} {global 1}  }
	{ clk int 1 regular {pointer 1} {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "size_V", "interface" : "wire", "bitwidth" : 2 ,"direction" : "READONLY" ,"bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "size.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "rate_V", "interface" : "wire", "bitwidth" : 2 ,"direction" : "READONLY" ,"bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "rate.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "nR_M_V", "interface" : "wire", "bitwidth" : 16 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "nR_M.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "etaIndexM_M_V", "interface" : "wire", "bitwidth" : 16 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "etaIndexM_M.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "etaIndexN_M_V", "interface" : "wire", "bitwidth" : 16 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "etaIndexN_M.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "pCodeM_V", "interface" : "wire", "bitwidth" : 16 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pCodeM.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "pMaxIterations_V", "interface" : "wire", "bitwidth" : 16 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pMaxIterations.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "etaIndexM_V", "interface" : "memory", "bitwidth" : 16 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "etaIndexM.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 36863,"step" : 1}]}]}]} , 
 	{ "Name" : "etaIndexN_V", "interface" : "memory", "bitwidth" : 16 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "etaIndexN.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 40959,"step" : 1}]}]}]} , 
 	{ "Name" : "lambdaIndexM_V", "interface" : "memory", "bitwidth" : 16 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "lambdaIndexM.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 36863,"step" : 1}]}]}]} , 
 	{ "Name" : "dout", "interface" : "wire", "bitwidth" : 1 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "dout","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}],"extern" : 1} , 
 	{ "Name" : "din", "interface" : "wire", "bitwidth" : 1 ,"direction" : "READONLY" ,"bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "din","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}],"extern" : 1} , 
 	{ "Name" : "cs", "interface" : "wire", "bitwidth" : 1 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "cs","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}],"extern" : 1} , 
 	{ "Name" : "clk", "interface" : "wire", "bitwidth" : 1 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "clk","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}],"extern" : 1} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
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
	{ etaIndexN_M_V sc_out sc_lv 16 signal 4 } 
	{ etaIndexN_M_V_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ pCodeM_V sc_out sc_lv 16 signal 5 } 
	{ pCodeM_V_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ pMaxIterations_V sc_out sc_lv 16 signal 6 } 
	{ pMaxIterations_V_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ etaIndexM_V_address0 sc_out sc_lv 16 signal 7 } 
	{ etaIndexM_V_ce0 sc_out sc_logic 1 signal 7 } 
	{ etaIndexM_V_we0 sc_out sc_logic 1 signal 7 } 
	{ etaIndexM_V_d0 sc_out sc_lv 16 signal 7 } 
	{ etaIndexN_V_address0 sc_out sc_lv 16 signal 8 } 
	{ etaIndexN_V_ce0 sc_out sc_logic 1 signal 8 } 
	{ etaIndexN_V_we0 sc_out sc_logic 1 signal 8 } 
	{ etaIndexN_V_d0 sc_out sc_lv 16 signal 8 } 
	{ lambdaIndexM_V_address0 sc_out sc_lv 16 signal 9 } 
	{ lambdaIndexM_V_ce0 sc_out sc_logic 1 signal 9 } 
	{ lambdaIndexM_V_we0 sc_out sc_logic 1 signal 9 } 
	{ lambdaIndexM_V_d0 sc_out sc_lv 16 signal 9 } 
	{ dout sc_out sc_lv 1 signal 10 } 
	{ dout_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ din sc_in sc_lv 1 signal 11 } 
	{ cs sc_out sc_lv 1 signal 12 } 
	{ cs_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ clk sc_out sc_lv 1 signal 13 } 
	{ clk_ap_vld sc_out sc_logic 1 outvld 13 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
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
 	{ "name": "etaIndexN_M_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "etaIndexN_M_V", "role": "default" }} , 
 	{ "name": "etaIndexN_M_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "etaIndexN_M_V", "role": "ap_vld" }} , 
 	{ "name": "pCodeM_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pCodeM_V", "role": "default" }} , 
 	{ "name": "pCodeM_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pCodeM_V", "role": "ap_vld" }} , 
 	{ "name": "pMaxIterations_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pMaxIterations_V", "role": "default" }} , 
 	{ "name": "pMaxIterations_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pMaxIterations_V", "role": "ap_vld" }} , 
 	{ "name": "etaIndexM_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "etaIndexM_V", "role": "address0" }} , 
 	{ "name": "etaIndexM_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "etaIndexM_V", "role": "ce0" }} , 
 	{ "name": "etaIndexM_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "etaIndexM_V", "role": "we0" }} , 
 	{ "name": "etaIndexM_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "etaIndexM_V", "role": "d0" }} , 
 	{ "name": "etaIndexN_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "etaIndexN_V", "role": "address0" }} , 
 	{ "name": "etaIndexN_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "etaIndexN_V", "role": "ce0" }} , 
 	{ "name": "etaIndexN_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "etaIndexN_V", "role": "we0" }} , 
 	{ "name": "etaIndexN_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "etaIndexN_V", "role": "d0" }} , 
 	{ "name": "lambdaIndexM_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "lambdaIndexM_V", "role": "address0" }} , 
 	{ "name": "lambdaIndexM_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lambdaIndexM_V", "role": "ce0" }} , 
 	{ "name": "lambdaIndexM_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lambdaIndexM_V", "role": "we0" }} , 
 	{ "name": "lambdaIndexM_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "lambdaIndexM_V", "role": "d0" }} , 
 	{ "name": "dout", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dout", "role": "default" }} , 
 	{ "name": "dout_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dout", "role": "ap_vld" }} , 
 	{ "name": "din", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "din", "role": "default" }} , 
 	{ "name": "cs", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cs", "role": "default" }} , 
 	{ "name": "cs_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cs", "role": "ap_vld" }} , 
 	{ "name": "clk", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "clk", "role": "default" }} , 
 	{ "name": "clk_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "clk", "role": "ap_vld" }}  ]}
set Spec2ImplPortList { 
	size_V { ap_none {  { size_V in_data 0 2 } } }
	rate_V { ap_none {  { rate_V in_data 0 2 } } }
	nR_M_V { ap_ovld {  { nR_M_V out_data 1 16 }  { nR_M_V_ap_vld out_vld 1 1 } } }
	etaIndexM_M_V { ap_vld {  { etaIndexM_M_V out_data 1 16 }  { etaIndexM_M_V_ap_vld out_vld 1 1 } } }
	etaIndexN_M_V { ap_vld {  { etaIndexN_M_V out_data 1 16 }  { etaIndexN_M_V_ap_vld out_vld 1 1 } } }
	pCodeM_V { ap_vld {  { pCodeM_V out_data 1 16 }  { pCodeM_V_ap_vld out_vld 1 1 } } }
	pMaxIterations_V { ap_vld {  { pMaxIterations_V out_data 1 16 }  { pMaxIterations_V_ap_vld out_vld 1 1 } } }
	etaIndexM_V { ap_memory {  { etaIndexM_V_address0 mem_address 1 16 }  { etaIndexM_V_ce0 mem_ce 1 1 }  { etaIndexM_V_we0 mem_we 1 1 }  { etaIndexM_V_d0 mem_din 1 16 } } }
	etaIndexN_V { ap_memory {  { etaIndexN_V_address0 mem_address 1 16 }  { etaIndexN_V_ce0 mem_ce 1 1 }  { etaIndexN_V_we0 mem_we 1 1 }  { etaIndexN_V_d0 mem_din 1 16 } } }
	lambdaIndexM_V { ap_memory {  { lambdaIndexM_V_address0 mem_address 1 16 }  { lambdaIndexM_V_ce0 mem_ce 1 1 }  { lambdaIndexM_V_we0 mem_we 1 1 }  { lambdaIndexM_V_d0 mem_din 1 16 } } }
	dout { ap_vld {  { dout out_data 1 1 }  { dout_ap_vld out_vld 1 1 } } }
	din { ap_none {  { din in_data 0 1 } } }
	cs { ap_vld {  { cs out_data 1 1 }  { cs_ap_vld out_vld 1 1 } } }
	clk { ap_vld {  { clk out_data 1 1 }  { clk_ap_vld out_vld 1 1 } } }
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
