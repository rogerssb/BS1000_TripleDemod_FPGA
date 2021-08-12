set moduleName setupLDPC_load_etaIndexM
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {setupLDPC_load_etaIndexM}
set C_modelType { void 0 }
set C_modelArgList { 
	{ num int 17 regular  }
	{ etaIndexM_V int 16 regular {array 36864 { 0 3 } 0 1 }  }
	{ dout int 1 regular {pointer 1} {global 1}  }
	{ din int 1 regular {pointer 0} {global 0}  }
	{ cs int 1 regular {pointer 1} {global 1}  }
	{ clk int 1 regular {pointer 1} {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "num", "interface" : "wire", "bitwidth" : 17 ,"direction" : "READONLY" } , 
 	{ "Name" : "etaIndexM_V", "interface" : "memory", "bitwidth" : 16 ,"direction" : "WRITEONLY" } , 
 	{ "Name" : "dout", "interface" : "wire", "bitwidth" : 1 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "dout","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}],"extern" : 1} , 
 	{ "Name" : "din", "interface" : "wire", "bitwidth" : 1 ,"direction" : "READONLY" ,"bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "din","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}],"extern" : 1} , 
 	{ "Name" : "cs", "interface" : "wire", "bitwidth" : 1 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "cs","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}],"extern" : 1} , 
 	{ "Name" : "clk", "interface" : "wire", "bitwidth" : 1 ,"direction" : "WRITEONLY" ,"bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "clk","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}],"extern" : 1} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ num sc_in sc_lv 17 signal 0 } 
	{ etaIndexM_V_address0 sc_out sc_lv 16 signal 1 } 
	{ etaIndexM_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ etaIndexM_V_we0 sc_out sc_logic 1 signal 1 } 
	{ etaIndexM_V_d0 sc_out sc_lv 16 signal 1 } 
	{ dout sc_out sc_lv 1 signal 2 } 
	{ dout_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ din sc_in sc_lv 1 signal 3 } 
	{ cs sc_out sc_lv 1 signal 4 } 
	{ cs_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ clk sc_out sc_lv 1 signal 5 } 
	{ clk_ap_vld sc_out sc_logic 1 outvld 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "num", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "num", "role": "default" }} , 
 	{ "name": "etaIndexM_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "etaIndexM_V", "role": "address0" }} , 
 	{ "name": "etaIndexM_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "etaIndexM_V", "role": "ce0" }} , 
 	{ "name": "etaIndexM_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "etaIndexM_V", "role": "we0" }} , 
 	{ "name": "etaIndexM_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "etaIndexM_V", "role": "d0" }} , 
 	{ "name": "dout", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "dout", "role": "default" }} , 
 	{ "name": "dout_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dout", "role": "ap_vld" }} , 
 	{ "name": "din", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "din", "role": "default" }} , 
 	{ "name": "cs", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cs", "role": "default" }} , 
 	{ "name": "cs_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "cs", "role": "ap_vld" }} , 
 	{ "name": "clk", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "clk", "role": "default" }} , 
 	{ "name": "clk_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "clk", "role": "ap_vld" }}  ]}
set Spec2ImplPortList { 
	num { ap_none {  { num in_data 0 17 } } }
	etaIndexM_V { ap_memory {  { etaIndexM_V_address0 mem_address 1 16 }  { etaIndexM_V_ce0 mem_ce 1 1 }  { etaIndexM_V_we0 mem_we 1 1 }  { etaIndexM_V_d0 mem_din 1 16 } } }
	dout { ap_vld {  { dout out_data 1 1 }  { dout_ap_vld out_vld 1 1 } } }
	din { ap_none {  { din in_data 0 1 } } }
	cs { ap_vld {  { cs out_data 1 1 }  { cs_ap_vld out_vld 1 1 } } }
	clk { ap_vld {  { clk out_data 1 1 }  { clk_ap_vld out_vld 1 1 } } }
}
