set moduleName update_hat_all
set isCombinational 1
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {update_hat_all}
set C_modelType { void 0 }
set C_modelArgList {
	{ pos_r int 13 regular  }
	{ bpest0 int 1 regular {pointer 0} {global 0}  }
	{ prHat_buf int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufAa int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufAb int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufAc int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ bpest1 int 1 regular {pointer 0} {global 0}  }
	{ prHat_buf1 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA1 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB1 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB1a int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB1b int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB1c int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ bpest2 int 1 regular {pointer 0} {global 0}  }
	{ prHat_buf2 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA2 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA2a int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA2b int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA2c int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB2 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ bpest3 int 1 regular {pointer 0} {global 0}  }
	{ prHat_buf3 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA3 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB3 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB3a int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB3b int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB3c int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ bpest4 int 1 regular {pointer 0} {global 0}  }
	{ prHat_buf4 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_buf4a int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA4 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA4a int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA4b int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB4 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ bpest5 int 1 regular {pointer 0} {global 0}  }
	{ prHat_bufA5 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB5 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB5a int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB5b int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB5c int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ bpest6 int 1 regular {pointer 0} {global 0}  }
	{ prHat_buf6 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_buf6a int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA6 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA6a int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA6b int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA6c int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB6 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ bpest7 int 1 regular {pointer 0} {global 0}  }
	{ prHat_bufA7 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB7 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB7a int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ bpest8 int 1 regular {pointer 0} {global 0}  }
	{ prHat_buf8 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ bpest9 int 1 regular {pointer 0} {global 0}  }
	{ prHat_bufA9 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB9 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB9a int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ bpest10 int 1 regular {pointer 0} {global 0}  }
	{ prHat_buf10 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_buf10a int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA10 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA10a int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA10b int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufA10c int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_buf10b int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
	{ prHat_bufB10 int 1 regular {array 2048 { 3 0 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "pos_r", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "bpest0", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "bpest0","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_buf", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_buf","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufAa", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufAa","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufAb", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufAb","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufAc", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufAc","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "bpest1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "bpest1","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_buf1", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_buf1","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA1", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA1","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB1", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB1","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB1a", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB1a","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB1b", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB1b","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB1c", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB1c","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "bpest2", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "bpest2","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_buf2", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_buf2","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA2", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA2","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA2a", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA2a","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA2b", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA2b","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA2c", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA2c","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB2", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB2","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "bpest3", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "bpest3","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_buf3", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_buf3","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA3", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA3","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB3", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB3","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB3a", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB3a","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB3b", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB3b","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB3c", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB3c","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "bpest4", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "bpest4","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_buf4", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_buf4","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_buf4a", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_buf4a","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA4", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA4","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA4a", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA4a","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA4b", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA4b","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB4", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB4","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "bpest5", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "bpest5","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA5", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA5","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB5", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB5","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB5a", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB5a","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB5b", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB5b","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB5c", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB5c","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "bpest6", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "bpest6","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_buf6", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_buf6","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_buf6a", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_buf6a","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA6", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA6","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA6a", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA6a","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA6b", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA6b","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA6c", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA6c","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB6", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB6","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "bpest7", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "bpest7","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA7", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA7","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB7", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB7","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB7a", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB7a","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "bpest8", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "bpest8","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_buf8", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_buf8","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "bpest9", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "bpest9","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA9", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA9","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB9", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB9","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB9a", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB9a","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "bpest10", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "bpest10","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_buf10", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_buf10","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_buf10a", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_buf10a","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA10", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA10","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA10a", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA10a","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA10b", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA10b","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufA10c", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufA10c","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_buf10b", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_buf10b","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prHat_bufB10", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "prHat_bufB10","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} ]}
# RTL Port declarations: 
set portNum 240
set portList { 
	{ pos_r sc_in sc_lv 13 signal 0 } 
	{ bpest0 sc_in sc_lv 1 signal 1 } 
	{ prHat_buf_address1 sc_out sc_lv 11 signal 2 } 
	{ prHat_buf_ce1 sc_out sc_logic 1 signal 2 } 
	{ prHat_buf_we1 sc_out sc_logic 1 signal 2 } 
	{ prHat_buf_d1 sc_out sc_lv 1 signal 2 } 
	{ prHat_bufA_address1 sc_out sc_lv 11 signal 3 } 
	{ prHat_bufA_ce1 sc_out sc_logic 1 signal 3 } 
	{ prHat_bufA_we1 sc_out sc_logic 1 signal 3 } 
	{ prHat_bufA_d1 sc_out sc_lv 1 signal 3 } 
	{ prHat_bufAa_address1 sc_out sc_lv 11 signal 4 } 
	{ prHat_bufAa_ce1 sc_out sc_logic 1 signal 4 } 
	{ prHat_bufAa_we1 sc_out sc_logic 1 signal 4 } 
	{ prHat_bufAa_d1 sc_out sc_lv 1 signal 4 } 
	{ prHat_bufAb_address1 sc_out sc_lv 11 signal 5 } 
	{ prHat_bufAb_ce1 sc_out sc_logic 1 signal 5 } 
	{ prHat_bufAb_we1 sc_out sc_logic 1 signal 5 } 
	{ prHat_bufAb_d1 sc_out sc_lv 1 signal 5 } 
	{ prHat_bufAc_address1 sc_out sc_lv 11 signal 6 } 
	{ prHat_bufAc_ce1 sc_out sc_logic 1 signal 6 } 
	{ prHat_bufAc_we1 sc_out sc_logic 1 signal 6 } 
	{ prHat_bufAc_d1 sc_out sc_lv 1 signal 6 } 
	{ prHat_bufB_address1 sc_out sc_lv 11 signal 7 } 
	{ prHat_bufB_ce1 sc_out sc_logic 1 signal 7 } 
	{ prHat_bufB_we1 sc_out sc_logic 1 signal 7 } 
	{ prHat_bufB_d1 sc_out sc_lv 1 signal 7 } 
	{ bpest1 sc_in sc_lv 1 signal 8 } 
	{ prHat_buf1_address1 sc_out sc_lv 11 signal 9 } 
	{ prHat_buf1_ce1 sc_out sc_logic 1 signal 9 } 
	{ prHat_buf1_we1 sc_out sc_logic 1 signal 9 } 
	{ prHat_buf1_d1 sc_out sc_lv 1 signal 9 } 
	{ prHat_bufA1_address1 sc_out sc_lv 11 signal 10 } 
	{ prHat_bufA1_ce1 sc_out sc_logic 1 signal 10 } 
	{ prHat_bufA1_we1 sc_out sc_logic 1 signal 10 } 
	{ prHat_bufA1_d1 sc_out sc_lv 1 signal 10 } 
	{ prHat_bufB1_address1 sc_out sc_lv 11 signal 11 } 
	{ prHat_bufB1_ce1 sc_out sc_logic 1 signal 11 } 
	{ prHat_bufB1_we1 sc_out sc_logic 1 signal 11 } 
	{ prHat_bufB1_d1 sc_out sc_lv 1 signal 11 } 
	{ prHat_bufB1a_address1 sc_out sc_lv 11 signal 12 } 
	{ prHat_bufB1a_ce1 sc_out sc_logic 1 signal 12 } 
	{ prHat_bufB1a_we1 sc_out sc_logic 1 signal 12 } 
	{ prHat_bufB1a_d1 sc_out sc_lv 1 signal 12 } 
	{ prHat_bufB1b_address1 sc_out sc_lv 11 signal 13 } 
	{ prHat_bufB1b_ce1 sc_out sc_logic 1 signal 13 } 
	{ prHat_bufB1b_we1 sc_out sc_logic 1 signal 13 } 
	{ prHat_bufB1b_d1 sc_out sc_lv 1 signal 13 } 
	{ prHat_bufB1c_address1 sc_out sc_lv 11 signal 14 } 
	{ prHat_bufB1c_ce1 sc_out sc_logic 1 signal 14 } 
	{ prHat_bufB1c_we1 sc_out sc_logic 1 signal 14 } 
	{ prHat_bufB1c_d1 sc_out sc_lv 1 signal 14 } 
	{ bpest2 sc_in sc_lv 1 signal 15 } 
	{ prHat_buf2_address1 sc_out sc_lv 11 signal 16 } 
	{ prHat_buf2_ce1 sc_out sc_logic 1 signal 16 } 
	{ prHat_buf2_we1 sc_out sc_logic 1 signal 16 } 
	{ prHat_buf2_d1 sc_out sc_lv 1 signal 16 } 
	{ prHat_bufA2_address1 sc_out sc_lv 11 signal 17 } 
	{ prHat_bufA2_ce1 sc_out sc_logic 1 signal 17 } 
	{ prHat_bufA2_we1 sc_out sc_logic 1 signal 17 } 
	{ prHat_bufA2_d1 sc_out sc_lv 1 signal 17 } 
	{ prHat_bufA2a_address1 sc_out sc_lv 11 signal 18 } 
	{ prHat_bufA2a_ce1 sc_out sc_logic 1 signal 18 } 
	{ prHat_bufA2a_we1 sc_out sc_logic 1 signal 18 } 
	{ prHat_bufA2a_d1 sc_out sc_lv 1 signal 18 } 
	{ prHat_bufA2b_address1 sc_out sc_lv 11 signal 19 } 
	{ prHat_bufA2b_ce1 sc_out sc_logic 1 signal 19 } 
	{ prHat_bufA2b_we1 sc_out sc_logic 1 signal 19 } 
	{ prHat_bufA2b_d1 sc_out sc_lv 1 signal 19 } 
	{ prHat_bufA2c_address1 sc_out sc_lv 11 signal 20 } 
	{ prHat_bufA2c_ce1 sc_out sc_logic 1 signal 20 } 
	{ prHat_bufA2c_we1 sc_out sc_logic 1 signal 20 } 
	{ prHat_bufA2c_d1 sc_out sc_lv 1 signal 20 } 
	{ prHat_bufB2_address1 sc_out sc_lv 11 signal 21 } 
	{ prHat_bufB2_ce1 sc_out sc_logic 1 signal 21 } 
	{ prHat_bufB2_we1 sc_out sc_logic 1 signal 21 } 
	{ prHat_bufB2_d1 sc_out sc_lv 1 signal 21 } 
	{ bpest3 sc_in sc_lv 1 signal 22 } 
	{ prHat_buf3_address1 sc_out sc_lv 11 signal 23 } 
	{ prHat_buf3_ce1 sc_out sc_logic 1 signal 23 } 
	{ prHat_buf3_we1 sc_out sc_logic 1 signal 23 } 
	{ prHat_buf3_d1 sc_out sc_lv 1 signal 23 } 
	{ prHat_bufA3_address1 sc_out sc_lv 11 signal 24 } 
	{ prHat_bufA3_ce1 sc_out sc_logic 1 signal 24 } 
	{ prHat_bufA3_we1 sc_out sc_logic 1 signal 24 } 
	{ prHat_bufA3_d1 sc_out sc_lv 1 signal 24 } 
	{ prHat_bufB3_address1 sc_out sc_lv 11 signal 25 } 
	{ prHat_bufB3_ce1 sc_out sc_logic 1 signal 25 } 
	{ prHat_bufB3_we1 sc_out sc_logic 1 signal 25 } 
	{ prHat_bufB3_d1 sc_out sc_lv 1 signal 25 } 
	{ prHat_bufB3a_address1 sc_out sc_lv 11 signal 26 } 
	{ prHat_bufB3a_ce1 sc_out sc_logic 1 signal 26 } 
	{ prHat_bufB3a_we1 sc_out sc_logic 1 signal 26 } 
	{ prHat_bufB3a_d1 sc_out sc_lv 1 signal 26 } 
	{ prHat_bufB3b_address1 sc_out sc_lv 11 signal 27 } 
	{ prHat_bufB3b_ce1 sc_out sc_logic 1 signal 27 } 
	{ prHat_bufB3b_we1 sc_out sc_logic 1 signal 27 } 
	{ prHat_bufB3b_d1 sc_out sc_lv 1 signal 27 } 
	{ prHat_bufB3c_address1 sc_out sc_lv 11 signal 28 } 
	{ prHat_bufB3c_ce1 sc_out sc_logic 1 signal 28 } 
	{ prHat_bufB3c_we1 sc_out sc_logic 1 signal 28 } 
	{ prHat_bufB3c_d1 sc_out sc_lv 1 signal 28 } 
	{ bpest4 sc_in sc_lv 1 signal 29 } 
	{ prHat_buf4_address1 sc_out sc_lv 11 signal 30 } 
	{ prHat_buf4_ce1 sc_out sc_logic 1 signal 30 } 
	{ prHat_buf4_we1 sc_out sc_logic 1 signal 30 } 
	{ prHat_buf4_d1 sc_out sc_lv 1 signal 30 } 
	{ prHat_buf4a_address1 sc_out sc_lv 11 signal 31 } 
	{ prHat_buf4a_ce1 sc_out sc_logic 1 signal 31 } 
	{ prHat_buf4a_we1 sc_out sc_logic 1 signal 31 } 
	{ prHat_buf4a_d1 sc_out sc_lv 1 signal 31 } 
	{ prHat_bufA4_address1 sc_out sc_lv 11 signal 32 } 
	{ prHat_bufA4_ce1 sc_out sc_logic 1 signal 32 } 
	{ prHat_bufA4_we1 sc_out sc_logic 1 signal 32 } 
	{ prHat_bufA4_d1 sc_out sc_lv 1 signal 32 } 
	{ prHat_bufA4a_address1 sc_out sc_lv 11 signal 33 } 
	{ prHat_bufA4a_ce1 sc_out sc_logic 1 signal 33 } 
	{ prHat_bufA4a_we1 sc_out sc_logic 1 signal 33 } 
	{ prHat_bufA4a_d1 sc_out sc_lv 1 signal 33 } 
	{ prHat_bufA4b_address1 sc_out sc_lv 11 signal 34 } 
	{ prHat_bufA4b_ce1 sc_out sc_logic 1 signal 34 } 
	{ prHat_bufA4b_we1 sc_out sc_logic 1 signal 34 } 
	{ prHat_bufA4b_d1 sc_out sc_lv 1 signal 34 } 
	{ prHat_bufB4_address1 sc_out sc_lv 11 signal 35 } 
	{ prHat_bufB4_ce1 sc_out sc_logic 1 signal 35 } 
	{ prHat_bufB4_we1 sc_out sc_logic 1 signal 35 } 
	{ prHat_bufB4_d1 sc_out sc_lv 1 signal 35 } 
	{ bpest5 sc_in sc_lv 1 signal 36 } 
	{ prHat_bufA5_address1 sc_out sc_lv 11 signal 37 } 
	{ prHat_bufA5_ce1 sc_out sc_logic 1 signal 37 } 
	{ prHat_bufA5_we1 sc_out sc_logic 1 signal 37 } 
	{ prHat_bufA5_d1 sc_out sc_lv 1 signal 37 } 
	{ prHat_bufB5_address1 sc_out sc_lv 11 signal 38 } 
	{ prHat_bufB5_ce1 sc_out sc_logic 1 signal 38 } 
	{ prHat_bufB5_we1 sc_out sc_logic 1 signal 38 } 
	{ prHat_bufB5_d1 sc_out sc_lv 1 signal 38 } 
	{ prHat_bufB5a_address1 sc_out sc_lv 11 signal 39 } 
	{ prHat_bufB5a_ce1 sc_out sc_logic 1 signal 39 } 
	{ prHat_bufB5a_we1 sc_out sc_logic 1 signal 39 } 
	{ prHat_bufB5a_d1 sc_out sc_lv 1 signal 39 } 
	{ prHat_bufB5b_address1 sc_out sc_lv 11 signal 40 } 
	{ prHat_bufB5b_ce1 sc_out sc_logic 1 signal 40 } 
	{ prHat_bufB5b_we1 sc_out sc_logic 1 signal 40 } 
	{ prHat_bufB5b_d1 sc_out sc_lv 1 signal 40 } 
	{ prHat_bufB5c_address1 sc_out sc_lv 11 signal 41 } 
	{ prHat_bufB5c_ce1 sc_out sc_logic 1 signal 41 } 
	{ prHat_bufB5c_we1 sc_out sc_logic 1 signal 41 } 
	{ prHat_bufB5c_d1 sc_out sc_lv 1 signal 41 } 
	{ bpest6 sc_in sc_lv 1 signal 42 } 
	{ prHat_buf6_address1 sc_out sc_lv 11 signal 43 } 
	{ prHat_buf6_ce1 sc_out sc_logic 1 signal 43 } 
	{ prHat_buf6_we1 sc_out sc_logic 1 signal 43 } 
	{ prHat_buf6_d1 sc_out sc_lv 1 signal 43 } 
	{ prHat_buf6a_address1 sc_out sc_lv 11 signal 44 } 
	{ prHat_buf6a_ce1 sc_out sc_logic 1 signal 44 } 
	{ prHat_buf6a_we1 sc_out sc_logic 1 signal 44 } 
	{ prHat_buf6a_d1 sc_out sc_lv 1 signal 44 } 
	{ prHat_bufA6_address1 sc_out sc_lv 11 signal 45 } 
	{ prHat_bufA6_ce1 sc_out sc_logic 1 signal 45 } 
	{ prHat_bufA6_we1 sc_out sc_logic 1 signal 45 } 
	{ prHat_bufA6_d1 sc_out sc_lv 1 signal 45 } 
	{ prHat_bufA6a_address1 sc_out sc_lv 11 signal 46 } 
	{ prHat_bufA6a_ce1 sc_out sc_logic 1 signal 46 } 
	{ prHat_bufA6a_we1 sc_out sc_logic 1 signal 46 } 
	{ prHat_bufA6a_d1 sc_out sc_lv 1 signal 46 } 
	{ prHat_bufA6b_address1 sc_out sc_lv 11 signal 47 } 
	{ prHat_bufA6b_ce1 sc_out sc_logic 1 signal 47 } 
	{ prHat_bufA6b_we1 sc_out sc_logic 1 signal 47 } 
	{ prHat_bufA6b_d1 sc_out sc_lv 1 signal 47 } 
	{ prHat_bufA6c_address1 sc_out sc_lv 11 signal 48 } 
	{ prHat_bufA6c_ce1 sc_out sc_logic 1 signal 48 } 
	{ prHat_bufA6c_we1 sc_out sc_logic 1 signal 48 } 
	{ prHat_bufA6c_d1 sc_out sc_lv 1 signal 48 } 
	{ prHat_bufB6_address1 sc_out sc_lv 11 signal 49 } 
	{ prHat_bufB6_ce1 sc_out sc_logic 1 signal 49 } 
	{ prHat_bufB6_we1 sc_out sc_logic 1 signal 49 } 
	{ prHat_bufB6_d1 sc_out sc_lv 1 signal 49 } 
	{ bpest7 sc_in sc_lv 1 signal 50 } 
	{ prHat_bufA7_address1 sc_out sc_lv 11 signal 51 } 
	{ prHat_bufA7_ce1 sc_out sc_logic 1 signal 51 } 
	{ prHat_bufA7_we1 sc_out sc_logic 1 signal 51 } 
	{ prHat_bufA7_d1 sc_out sc_lv 1 signal 51 } 
	{ prHat_bufB7_address1 sc_out sc_lv 11 signal 52 } 
	{ prHat_bufB7_ce1 sc_out sc_logic 1 signal 52 } 
	{ prHat_bufB7_we1 sc_out sc_logic 1 signal 52 } 
	{ prHat_bufB7_d1 sc_out sc_lv 1 signal 52 } 
	{ prHat_bufB7a_address1 sc_out sc_lv 11 signal 53 } 
	{ prHat_bufB7a_ce1 sc_out sc_logic 1 signal 53 } 
	{ prHat_bufB7a_we1 sc_out sc_logic 1 signal 53 } 
	{ prHat_bufB7a_d1 sc_out sc_lv 1 signal 53 } 
	{ bpest8 sc_in sc_lv 1 signal 54 } 
	{ prHat_buf8_address1 sc_out sc_lv 11 signal 55 } 
	{ prHat_buf8_ce1 sc_out sc_logic 1 signal 55 } 
	{ prHat_buf8_we1 sc_out sc_logic 1 signal 55 } 
	{ prHat_buf8_d1 sc_out sc_lv 1 signal 55 } 
	{ bpest9 sc_in sc_lv 1 signal 56 } 
	{ prHat_bufA9_address1 sc_out sc_lv 11 signal 57 } 
	{ prHat_bufA9_ce1 sc_out sc_logic 1 signal 57 } 
	{ prHat_bufA9_we1 sc_out sc_logic 1 signal 57 } 
	{ prHat_bufA9_d1 sc_out sc_lv 1 signal 57 } 
	{ prHat_bufB9_address1 sc_out sc_lv 11 signal 58 } 
	{ prHat_bufB9_ce1 sc_out sc_logic 1 signal 58 } 
	{ prHat_bufB9_we1 sc_out sc_logic 1 signal 58 } 
	{ prHat_bufB9_d1 sc_out sc_lv 1 signal 58 } 
	{ prHat_bufB9a_address1 sc_out sc_lv 11 signal 59 } 
	{ prHat_bufB9a_ce1 sc_out sc_logic 1 signal 59 } 
	{ prHat_bufB9a_we1 sc_out sc_logic 1 signal 59 } 
	{ prHat_bufB9a_d1 sc_out sc_lv 1 signal 59 } 
	{ bpest10 sc_in sc_lv 1 signal 60 } 
	{ prHat_buf10_address1 sc_out sc_lv 11 signal 61 } 
	{ prHat_buf10_ce1 sc_out sc_logic 1 signal 61 } 
	{ prHat_buf10_we1 sc_out sc_logic 1 signal 61 } 
	{ prHat_buf10_d1 sc_out sc_lv 1 signal 61 } 
	{ prHat_buf10a_address1 sc_out sc_lv 11 signal 62 } 
	{ prHat_buf10a_ce1 sc_out sc_logic 1 signal 62 } 
	{ prHat_buf10a_we1 sc_out sc_logic 1 signal 62 } 
	{ prHat_buf10a_d1 sc_out sc_lv 1 signal 62 } 
	{ prHat_bufA10_address1 sc_out sc_lv 11 signal 63 } 
	{ prHat_bufA10_ce1 sc_out sc_logic 1 signal 63 } 
	{ prHat_bufA10_we1 sc_out sc_logic 1 signal 63 } 
	{ prHat_bufA10_d1 sc_out sc_lv 1 signal 63 } 
	{ prHat_bufA10a_address1 sc_out sc_lv 11 signal 64 } 
	{ prHat_bufA10a_ce1 sc_out sc_logic 1 signal 64 } 
	{ prHat_bufA10a_we1 sc_out sc_logic 1 signal 64 } 
	{ prHat_bufA10a_d1 sc_out sc_lv 1 signal 64 } 
	{ prHat_bufA10b_address1 sc_out sc_lv 11 signal 65 } 
	{ prHat_bufA10b_ce1 sc_out sc_logic 1 signal 65 } 
	{ prHat_bufA10b_we1 sc_out sc_logic 1 signal 65 } 
	{ prHat_bufA10b_d1 sc_out sc_lv 1 signal 65 } 
	{ prHat_bufA10c_address1 sc_out sc_lv 11 signal 66 } 
	{ prHat_bufA10c_ce1 sc_out sc_logic 1 signal 66 } 
	{ prHat_bufA10c_we1 sc_out sc_logic 1 signal 66 } 
	{ prHat_bufA10c_d1 sc_out sc_lv 1 signal 66 } 
	{ prHat_buf10b_address1 sc_out sc_lv 11 signal 67 } 
	{ prHat_buf10b_ce1 sc_out sc_logic 1 signal 67 } 
	{ prHat_buf10b_we1 sc_out sc_logic 1 signal 67 } 
	{ prHat_buf10b_d1 sc_out sc_lv 1 signal 67 } 
	{ prHat_bufB10_address1 sc_out sc_lv 11 signal 68 } 
	{ prHat_bufB10_ce1 sc_out sc_logic 1 signal 68 } 
	{ prHat_bufB10_we1 sc_out sc_logic 1 signal 68 } 
	{ prHat_bufB10_d1 sc_out sc_lv 1 signal 68 } 
}
set NewPortList {[ 
	{ "name": "pos_r", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "pos_r", "role": "default" }} , 
 	{ "name": "bpest0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bpest0", "role": "default" }} , 
 	{ "name": "prHat_buf_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_buf", "role": "address1" }} , 
 	{ "name": "prHat_buf_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf", "role": "ce1" }} , 
 	{ "name": "prHat_buf_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf", "role": "we1" }} , 
 	{ "name": "prHat_buf_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf", "role": "d1" }} , 
 	{ "name": "prHat_bufA_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA", "role": "address1" }} , 
 	{ "name": "prHat_bufA_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA", "role": "ce1" }} , 
 	{ "name": "prHat_bufA_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA", "role": "we1" }} , 
 	{ "name": "prHat_bufA_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA", "role": "d1" }} , 
 	{ "name": "prHat_bufAa_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufAa", "role": "address1" }} , 
 	{ "name": "prHat_bufAa_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufAa", "role": "ce1" }} , 
 	{ "name": "prHat_bufAa_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufAa", "role": "we1" }} , 
 	{ "name": "prHat_bufAa_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufAa", "role": "d1" }} , 
 	{ "name": "prHat_bufAb_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufAb", "role": "address1" }} , 
 	{ "name": "prHat_bufAb_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufAb", "role": "ce1" }} , 
 	{ "name": "prHat_bufAb_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufAb", "role": "we1" }} , 
 	{ "name": "prHat_bufAb_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufAb", "role": "d1" }} , 
 	{ "name": "prHat_bufAc_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufAc", "role": "address1" }} , 
 	{ "name": "prHat_bufAc_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufAc", "role": "ce1" }} , 
 	{ "name": "prHat_bufAc_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufAc", "role": "we1" }} , 
 	{ "name": "prHat_bufAc_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufAc", "role": "d1" }} , 
 	{ "name": "prHat_bufB_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB", "role": "address1" }} , 
 	{ "name": "prHat_bufB_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB", "role": "ce1" }} , 
 	{ "name": "prHat_bufB_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB", "role": "we1" }} , 
 	{ "name": "prHat_bufB_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB", "role": "d1" }} , 
 	{ "name": "bpest1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bpest1", "role": "default" }} , 
 	{ "name": "prHat_buf1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_buf1", "role": "address1" }} , 
 	{ "name": "prHat_buf1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf1", "role": "ce1" }} , 
 	{ "name": "prHat_buf1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf1", "role": "we1" }} , 
 	{ "name": "prHat_buf1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf1", "role": "d1" }} , 
 	{ "name": "prHat_bufA1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA1", "role": "address1" }} , 
 	{ "name": "prHat_bufA1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA1", "role": "ce1" }} , 
 	{ "name": "prHat_bufA1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA1", "role": "we1" }} , 
 	{ "name": "prHat_bufA1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA1", "role": "d1" }} , 
 	{ "name": "prHat_bufB1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB1", "role": "address1" }} , 
 	{ "name": "prHat_bufB1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB1", "role": "ce1" }} , 
 	{ "name": "prHat_bufB1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB1", "role": "we1" }} , 
 	{ "name": "prHat_bufB1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB1", "role": "d1" }} , 
 	{ "name": "prHat_bufB1a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB1a", "role": "address1" }} , 
 	{ "name": "prHat_bufB1a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB1a", "role": "ce1" }} , 
 	{ "name": "prHat_bufB1a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB1a", "role": "we1" }} , 
 	{ "name": "prHat_bufB1a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB1a", "role": "d1" }} , 
 	{ "name": "prHat_bufB1b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB1b", "role": "address1" }} , 
 	{ "name": "prHat_bufB1b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB1b", "role": "ce1" }} , 
 	{ "name": "prHat_bufB1b_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB1b", "role": "we1" }} , 
 	{ "name": "prHat_bufB1b_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB1b", "role": "d1" }} , 
 	{ "name": "prHat_bufB1c_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB1c", "role": "address1" }} , 
 	{ "name": "prHat_bufB1c_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB1c", "role": "ce1" }} , 
 	{ "name": "prHat_bufB1c_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB1c", "role": "we1" }} , 
 	{ "name": "prHat_bufB1c_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB1c", "role": "d1" }} , 
 	{ "name": "bpest2", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bpest2", "role": "default" }} , 
 	{ "name": "prHat_buf2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_buf2", "role": "address1" }} , 
 	{ "name": "prHat_buf2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf2", "role": "ce1" }} , 
 	{ "name": "prHat_buf2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf2", "role": "we1" }} , 
 	{ "name": "prHat_buf2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf2", "role": "d1" }} , 
 	{ "name": "prHat_bufA2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA2", "role": "address1" }} , 
 	{ "name": "prHat_bufA2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA2", "role": "ce1" }} , 
 	{ "name": "prHat_bufA2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA2", "role": "we1" }} , 
 	{ "name": "prHat_bufA2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA2", "role": "d1" }} , 
 	{ "name": "prHat_bufA2a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA2a", "role": "address1" }} , 
 	{ "name": "prHat_bufA2a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA2a", "role": "ce1" }} , 
 	{ "name": "prHat_bufA2a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA2a", "role": "we1" }} , 
 	{ "name": "prHat_bufA2a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA2a", "role": "d1" }} , 
 	{ "name": "prHat_bufA2b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA2b", "role": "address1" }} , 
 	{ "name": "prHat_bufA2b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA2b", "role": "ce1" }} , 
 	{ "name": "prHat_bufA2b_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA2b", "role": "we1" }} , 
 	{ "name": "prHat_bufA2b_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA2b", "role": "d1" }} , 
 	{ "name": "prHat_bufA2c_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA2c", "role": "address1" }} , 
 	{ "name": "prHat_bufA2c_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA2c", "role": "ce1" }} , 
 	{ "name": "prHat_bufA2c_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA2c", "role": "we1" }} , 
 	{ "name": "prHat_bufA2c_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA2c", "role": "d1" }} , 
 	{ "name": "prHat_bufB2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB2", "role": "address1" }} , 
 	{ "name": "prHat_bufB2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB2", "role": "ce1" }} , 
 	{ "name": "prHat_bufB2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB2", "role": "we1" }} , 
 	{ "name": "prHat_bufB2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB2", "role": "d1" }} , 
 	{ "name": "bpest3", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bpest3", "role": "default" }} , 
 	{ "name": "prHat_buf3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_buf3", "role": "address1" }} , 
 	{ "name": "prHat_buf3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf3", "role": "ce1" }} , 
 	{ "name": "prHat_buf3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf3", "role": "we1" }} , 
 	{ "name": "prHat_buf3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf3", "role": "d1" }} , 
 	{ "name": "prHat_bufA3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA3", "role": "address1" }} , 
 	{ "name": "prHat_bufA3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA3", "role": "ce1" }} , 
 	{ "name": "prHat_bufA3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA3", "role": "we1" }} , 
 	{ "name": "prHat_bufA3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA3", "role": "d1" }} , 
 	{ "name": "prHat_bufB3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB3", "role": "address1" }} , 
 	{ "name": "prHat_bufB3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB3", "role": "ce1" }} , 
 	{ "name": "prHat_bufB3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB3", "role": "we1" }} , 
 	{ "name": "prHat_bufB3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB3", "role": "d1" }} , 
 	{ "name": "prHat_bufB3a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB3a", "role": "address1" }} , 
 	{ "name": "prHat_bufB3a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB3a", "role": "ce1" }} , 
 	{ "name": "prHat_bufB3a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB3a", "role": "we1" }} , 
 	{ "name": "prHat_bufB3a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB3a", "role": "d1" }} , 
 	{ "name": "prHat_bufB3b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB3b", "role": "address1" }} , 
 	{ "name": "prHat_bufB3b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB3b", "role": "ce1" }} , 
 	{ "name": "prHat_bufB3b_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB3b", "role": "we1" }} , 
 	{ "name": "prHat_bufB3b_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB3b", "role": "d1" }} , 
 	{ "name": "prHat_bufB3c_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB3c", "role": "address1" }} , 
 	{ "name": "prHat_bufB3c_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB3c", "role": "ce1" }} , 
 	{ "name": "prHat_bufB3c_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB3c", "role": "we1" }} , 
 	{ "name": "prHat_bufB3c_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB3c", "role": "d1" }} , 
 	{ "name": "bpest4", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bpest4", "role": "default" }} , 
 	{ "name": "prHat_buf4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_buf4", "role": "address1" }} , 
 	{ "name": "prHat_buf4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf4", "role": "ce1" }} , 
 	{ "name": "prHat_buf4_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf4", "role": "we1" }} , 
 	{ "name": "prHat_buf4_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf4", "role": "d1" }} , 
 	{ "name": "prHat_buf4a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_buf4a", "role": "address1" }} , 
 	{ "name": "prHat_buf4a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf4a", "role": "ce1" }} , 
 	{ "name": "prHat_buf4a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf4a", "role": "we1" }} , 
 	{ "name": "prHat_buf4a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf4a", "role": "d1" }} , 
 	{ "name": "prHat_bufA4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA4", "role": "address1" }} , 
 	{ "name": "prHat_bufA4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA4", "role": "ce1" }} , 
 	{ "name": "prHat_bufA4_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA4", "role": "we1" }} , 
 	{ "name": "prHat_bufA4_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA4", "role": "d1" }} , 
 	{ "name": "prHat_bufA4a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA4a", "role": "address1" }} , 
 	{ "name": "prHat_bufA4a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA4a", "role": "ce1" }} , 
 	{ "name": "prHat_bufA4a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA4a", "role": "we1" }} , 
 	{ "name": "prHat_bufA4a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA4a", "role": "d1" }} , 
 	{ "name": "prHat_bufA4b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA4b", "role": "address1" }} , 
 	{ "name": "prHat_bufA4b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA4b", "role": "ce1" }} , 
 	{ "name": "prHat_bufA4b_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA4b", "role": "we1" }} , 
 	{ "name": "prHat_bufA4b_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA4b", "role": "d1" }} , 
 	{ "name": "prHat_bufB4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB4", "role": "address1" }} , 
 	{ "name": "prHat_bufB4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB4", "role": "ce1" }} , 
 	{ "name": "prHat_bufB4_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB4", "role": "we1" }} , 
 	{ "name": "prHat_bufB4_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB4", "role": "d1" }} , 
 	{ "name": "bpest5", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bpest5", "role": "default" }} , 
 	{ "name": "prHat_bufA5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA5", "role": "address1" }} , 
 	{ "name": "prHat_bufA5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA5", "role": "ce1" }} , 
 	{ "name": "prHat_bufA5_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA5", "role": "we1" }} , 
 	{ "name": "prHat_bufA5_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA5", "role": "d1" }} , 
 	{ "name": "prHat_bufB5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB5", "role": "address1" }} , 
 	{ "name": "prHat_bufB5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB5", "role": "ce1" }} , 
 	{ "name": "prHat_bufB5_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB5", "role": "we1" }} , 
 	{ "name": "prHat_bufB5_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB5", "role": "d1" }} , 
 	{ "name": "prHat_bufB5a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB5a", "role": "address1" }} , 
 	{ "name": "prHat_bufB5a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB5a", "role": "ce1" }} , 
 	{ "name": "prHat_bufB5a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB5a", "role": "we1" }} , 
 	{ "name": "prHat_bufB5a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB5a", "role": "d1" }} , 
 	{ "name": "prHat_bufB5b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB5b", "role": "address1" }} , 
 	{ "name": "prHat_bufB5b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB5b", "role": "ce1" }} , 
 	{ "name": "prHat_bufB5b_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB5b", "role": "we1" }} , 
 	{ "name": "prHat_bufB5b_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB5b", "role": "d1" }} , 
 	{ "name": "prHat_bufB5c_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB5c", "role": "address1" }} , 
 	{ "name": "prHat_bufB5c_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB5c", "role": "ce1" }} , 
 	{ "name": "prHat_bufB5c_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB5c", "role": "we1" }} , 
 	{ "name": "prHat_bufB5c_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB5c", "role": "d1" }} , 
 	{ "name": "bpest6", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bpest6", "role": "default" }} , 
 	{ "name": "prHat_buf6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_buf6", "role": "address1" }} , 
 	{ "name": "prHat_buf6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf6", "role": "ce1" }} , 
 	{ "name": "prHat_buf6_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf6", "role": "we1" }} , 
 	{ "name": "prHat_buf6_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf6", "role": "d1" }} , 
 	{ "name": "prHat_buf6a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_buf6a", "role": "address1" }} , 
 	{ "name": "prHat_buf6a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf6a", "role": "ce1" }} , 
 	{ "name": "prHat_buf6a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf6a", "role": "we1" }} , 
 	{ "name": "prHat_buf6a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf6a", "role": "d1" }} , 
 	{ "name": "prHat_bufA6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA6", "role": "address1" }} , 
 	{ "name": "prHat_bufA6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA6", "role": "ce1" }} , 
 	{ "name": "prHat_bufA6_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA6", "role": "we1" }} , 
 	{ "name": "prHat_bufA6_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA6", "role": "d1" }} , 
 	{ "name": "prHat_bufA6a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA6a", "role": "address1" }} , 
 	{ "name": "prHat_bufA6a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA6a", "role": "ce1" }} , 
 	{ "name": "prHat_bufA6a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA6a", "role": "we1" }} , 
 	{ "name": "prHat_bufA6a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA6a", "role": "d1" }} , 
 	{ "name": "prHat_bufA6b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA6b", "role": "address1" }} , 
 	{ "name": "prHat_bufA6b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA6b", "role": "ce1" }} , 
 	{ "name": "prHat_bufA6b_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA6b", "role": "we1" }} , 
 	{ "name": "prHat_bufA6b_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA6b", "role": "d1" }} , 
 	{ "name": "prHat_bufA6c_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA6c", "role": "address1" }} , 
 	{ "name": "prHat_bufA6c_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA6c", "role": "ce1" }} , 
 	{ "name": "prHat_bufA6c_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA6c", "role": "we1" }} , 
 	{ "name": "prHat_bufA6c_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA6c", "role": "d1" }} , 
 	{ "name": "prHat_bufB6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB6", "role": "address1" }} , 
 	{ "name": "prHat_bufB6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB6", "role": "ce1" }} , 
 	{ "name": "prHat_bufB6_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB6", "role": "we1" }} , 
 	{ "name": "prHat_bufB6_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB6", "role": "d1" }} , 
 	{ "name": "bpest7", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bpest7", "role": "default" }} , 
 	{ "name": "prHat_bufA7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA7", "role": "address1" }} , 
 	{ "name": "prHat_bufA7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA7", "role": "ce1" }} , 
 	{ "name": "prHat_bufA7_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA7", "role": "we1" }} , 
 	{ "name": "prHat_bufA7_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA7", "role": "d1" }} , 
 	{ "name": "prHat_bufB7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB7", "role": "address1" }} , 
 	{ "name": "prHat_bufB7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB7", "role": "ce1" }} , 
 	{ "name": "prHat_bufB7_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB7", "role": "we1" }} , 
 	{ "name": "prHat_bufB7_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB7", "role": "d1" }} , 
 	{ "name": "prHat_bufB7a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB7a", "role": "address1" }} , 
 	{ "name": "prHat_bufB7a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB7a", "role": "ce1" }} , 
 	{ "name": "prHat_bufB7a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB7a", "role": "we1" }} , 
 	{ "name": "prHat_bufB7a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB7a", "role": "d1" }} , 
 	{ "name": "bpest8", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bpest8", "role": "default" }} , 
 	{ "name": "prHat_buf8_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_buf8", "role": "address1" }} , 
 	{ "name": "prHat_buf8_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf8", "role": "ce1" }} , 
 	{ "name": "prHat_buf8_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf8", "role": "we1" }} , 
 	{ "name": "prHat_buf8_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf8", "role": "d1" }} , 
 	{ "name": "bpest9", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bpest9", "role": "default" }} , 
 	{ "name": "prHat_bufA9_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA9", "role": "address1" }} , 
 	{ "name": "prHat_bufA9_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA9", "role": "ce1" }} , 
 	{ "name": "prHat_bufA9_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA9", "role": "we1" }} , 
 	{ "name": "prHat_bufA9_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA9", "role": "d1" }} , 
 	{ "name": "prHat_bufB9_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB9", "role": "address1" }} , 
 	{ "name": "prHat_bufB9_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB9", "role": "ce1" }} , 
 	{ "name": "prHat_bufB9_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB9", "role": "we1" }} , 
 	{ "name": "prHat_bufB9_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB9", "role": "d1" }} , 
 	{ "name": "prHat_bufB9a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB9a", "role": "address1" }} , 
 	{ "name": "prHat_bufB9a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB9a", "role": "ce1" }} , 
 	{ "name": "prHat_bufB9a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB9a", "role": "we1" }} , 
 	{ "name": "prHat_bufB9a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB9a", "role": "d1" }} , 
 	{ "name": "bpest10", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bpest10", "role": "default" }} , 
 	{ "name": "prHat_buf10_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_buf10", "role": "address1" }} , 
 	{ "name": "prHat_buf10_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf10", "role": "ce1" }} , 
 	{ "name": "prHat_buf10_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf10", "role": "we1" }} , 
 	{ "name": "prHat_buf10_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf10", "role": "d1" }} , 
 	{ "name": "prHat_buf10a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_buf10a", "role": "address1" }} , 
 	{ "name": "prHat_buf10a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf10a", "role": "ce1" }} , 
 	{ "name": "prHat_buf10a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf10a", "role": "we1" }} , 
 	{ "name": "prHat_buf10a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf10a", "role": "d1" }} , 
 	{ "name": "prHat_bufA10_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA10", "role": "address1" }} , 
 	{ "name": "prHat_bufA10_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA10", "role": "ce1" }} , 
 	{ "name": "prHat_bufA10_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA10", "role": "we1" }} , 
 	{ "name": "prHat_bufA10_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA10", "role": "d1" }} , 
 	{ "name": "prHat_bufA10a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA10a", "role": "address1" }} , 
 	{ "name": "prHat_bufA10a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA10a", "role": "ce1" }} , 
 	{ "name": "prHat_bufA10a_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA10a", "role": "we1" }} , 
 	{ "name": "prHat_bufA10a_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA10a", "role": "d1" }} , 
 	{ "name": "prHat_bufA10b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA10b", "role": "address1" }} , 
 	{ "name": "prHat_bufA10b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA10b", "role": "ce1" }} , 
 	{ "name": "prHat_bufA10b_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA10b", "role": "we1" }} , 
 	{ "name": "prHat_bufA10b_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA10b", "role": "d1" }} , 
 	{ "name": "prHat_bufA10c_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufA10c", "role": "address1" }} , 
 	{ "name": "prHat_bufA10c_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA10c", "role": "ce1" }} , 
 	{ "name": "prHat_bufA10c_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA10c", "role": "we1" }} , 
 	{ "name": "prHat_bufA10c_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufA10c", "role": "d1" }} , 
 	{ "name": "prHat_buf10b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_buf10b", "role": "address1" }} , 
 	{ "name": "prHat_buf10b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf10b", "role": "ce1" }} , 
 	{ "name": "prHat_buf10b_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf10b", "role": "we1" }} , 
 	{ "name": "prHat_buf10b_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_buf10b", "role": "d1" }} , 
 	{ "name": "prHat_bufB10_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "prHat_bufB10", "role": "address1" }} , 
 	{ "name": "prHat_bufB10_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB10", "role": "ce1" }} , 
 	{ "name": "prHat_bufB10_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB10", "role": "we1" }} , 
 	{ "name": "prHat_bufB10_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "prHat_bufB10", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "update_hat_all",
		"VariableLatency" : "0",
		"AlignedPipeline" : "0",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "1",
		"ControlExist" : "0",
		"Port" : [
		{"Name" : "pos_r", "Type" : "None", "Direction" : "I"},
		{"Name" : "bpest0", "Type" : "None", "Direction" : "I"},
		{"Name" : "prHat_buf", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufAa", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufAb", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufAc", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "bpest1", "Type" : "None", "Direction" : "I"},
		{"Name" : "prHat_buf1", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA1", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB1", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB1a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB1b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB1c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "bpest2", "Type" : "None", "Direction" : "I"},
		{"Name" : "prHat_buf2", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA2", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA2a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA2b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA2c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB2", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "bpest3", "Type" : "None", "Direction" : "I"},
		{"Name" : "prHat_buf3", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA3", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB3", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB3a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB3b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB3c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "bpest4", "Type" : "None", "Direction" : "I"},
		{"Name" : "prHat_buf4", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_buf4a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA4", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA4a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA4b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB4", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "bpest5", "Type" : "None", "Direction" : "I"},
		{"Name" : "prHat_bufA5", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB5", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB5a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB5b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB5c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "bpest6", "Type" : "None", "Direction" : "I"},
		{"Name" : "prHat_buf6", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_buf6a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA6", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA6a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA6b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA6c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB6", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "bpest7", "Type" : "None", "Direction" : "I"},
		{"Name" : "prHat_bufA7", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB7", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB7a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "bpest8", "Type" : "None", "Direction" : "I"},
		{"Name" : "prHat_buf8", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "bpest9", "Type" : "None", "Direction" : "I"},
		{"Name" : "prHat_bufA9", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB9", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB9a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "bpest10", "Type" : "None", "Direction" : "I"},
		{"Name" : "prHat_buf10", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_buf10a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA10", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA10a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA10b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufA10c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_buf10b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prHat_bufB10", "Type" : "Memory", "Direction" : "O"}]}]}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set Spec2ImplPortList { 
	pos_r { ap_none {  { pos_r in_data 0 13 } } }
	bpest0 { ap_none {  { bpest0 in_data 0 1 } } }
	prHat_buf { ap_memory {  { prHat_buf_address1 mem_address 1 11 }  { prHat_buf_ce1 mem_ce 1 1 }  { prHat_buf_we1 mem_we 1 1 }  { prHat_buf_d1 mem_din 1 1 } } }
	prHat_bufA { ap_memory {  { prHat_bufA_address1 mem_address 1 11 }  { prHat_bufA_ce1 mem_ce 1 1 }  { prHat_bufA_we1 mem_we 1 1 }  { prHat_bufA_d1 mem_din 1 1 } } }
	prHat_bufAa { ap_memory {  { prHat_bufAa_address1 mem_address 1 11 }  { prHat_bufAa_ce1 mem_ce 1 1 }  { prHat_bufAa_we1 mem_we 1 1 }  { prHat_bufAa_d1 mem_din 1 1 } } }
	prHat_bufAb { ap_memory {  { prHat_bufAb_address1 mem_address 1 11 }  { prHat_bufAb_ce1 mem_ce 1 1 }  { prHat_bufAb_we1 mem_we 1 1 }  { prHat_bufAb_d1 mem_din 1 1 } } }
	prHat_bufAc { ap_memory {  { prHat_bufAc_address1 mem_address 1 11 }  { prHat_bufAc_ce1 mem_ce 1 1 }  { prHat_bufAc_we1 mem_we 1 1 }  { prHat_bufAc_d1 mem_din 1 1 } } }
	prHat_bufB { ap_memory {  { prHat_bufB_address1 mem_address 1 11 }  { prHat_bufB_ce1 mem_ce 1 1 }  { prHat_bufB_we1 mem_we 1 1 }  { prHat_bufB_d1 mem_din 1 1 } } }
	bpest1 { ap_none {  { bpest1 in_data 0 1 } } }
	prHat_buf1 { ap_memory {  { prHat_buf1_address1 mem_address 1 11 }  { prHat_buf1_ce1 mem_ce 1 1 }  { prHat_buf1_we1 mem_we 1 1 }  { prHat_buf1_d1 mem_din 1 1 } } }
	prHat_bufA1 { ap_memory {  { prHat_bufA1_address1 mem_address 1 11 }  { prHat_bufA1_ce1 mem_ce 1 1 }  { prHat_bufA1_we1 mem_we 1 1 }  { prHat_bufA1_d1 mem_din 1 1 } } }
	prHat_bufB1 { ap_memory {  { prHat_bufB1_address1 mem_address 1 11 }  { prHat_bufB1_ce1 mem_ce 1 1 }  { prHat_bufB1_we1 mem_we 1 1 }  { prHat_bufB1_d1 mem_din 1 1 } } }
	prHat_bufB1a { ap_memory {  { prHat_bufB1a_address1 mem_address 1 11 }  { prHat_bufB1a_ce1 mem_ce 1 1 }  { prHat_bufB1a_we1 mem_we 1 1 }  { prHat_bufB1a_d1 mem_din 1 1 } } }
	prHat_bufB1b { ap_memory {  { prHat_bufB1b_address1 mem_address 1 11 }  { prHat_bufB1b_ce1 mem_ce 1 1 }  { prHat_bufB1b_we1 mem_we 1 1 }  { prHat_bufB1b_d1 mem_din 1 1 } } }
	prHat_bufB1c { ap_memory {  { prHat_bufB1c_address1 mem_address 1 11 }  { prHat_bufB1c_ce1 mem_ce 1 1 }  { prHat_bufB1c_we1 mem_we 1 1 }  { prHat_bufB1c_d1 mem_din 1 1 } } }
	bpest2 { ap_none {  { bpest2 in_data 0 1 } } }
	prHat_buf2 { ap_memory {  { prHat_buf2_address1 mem_address 1 11 }  { prHat_buf2_ce1 mem_ce 1 1 }  { prHat_buf2_we1 mem_we 1 1 }  { prHat_buf2_d1 mem_din 1 1 } } }
	prHat_bufA2 { ap_memory {  { prHat_bufA2_address1 mem_address 1 11 }  { prHat_bufA2_ce1 mem_ce 1 1 }  { prHat_bufA2_we1 mem_we 1 1 }  { prHat_bufA2_d1 mem_din 1 1 } } }
	prHat_bufA2a { ap_memory {  { prHat_bufA2a_address1 mem_address 1 11 }  { prHat_bufA2a_ce1 mem_ce 1 1 }  { prHat_bufA2a_we1 mem_we 1 1 }  { prHat_bufA2a_d1 mem_din 1 1 } } }
	prHat_bufA2b { ap_memory {  { prHat_bufA2b_address1 mem_address 1 11 }  { prHat_bufA2b_ce1 mem_ce 1 1 }  { prHat_bufA2b_we1 mem_we 1 1 }  { prHat_bufA2b_d1 mem_din 1 1 } } }
	prHat_bufA2c { ap_memory {  { prHat_bufA2c_address1 mem_address 1 11 }  { prHat_bufA2c_ce1 mem_ce 1 1 }  { prHat_bufA2c_we1 mem_we 1 1 }  { prHat_bufA2c_d1 mem_din 1 1 } } }
	prHat_bufB2 { ap_memory {  { prHat_bufB2_address1 mem_address 1 11 }  { prHat_bufB2_ce1 mem_ce 1 1 }  { prHat_bufB2_we1 mem_we 1 1 }  { prHat_bufB2_d1 mem_din 1 1 } } }
	bpest3 { ap_none {  { bpest3 in_data 0 1 } } }
	prHat_buf3 { ap_memory {  { prHat_buf3_address1 mem_address 1 11 }  { prHat_buf3_ce1 mem_ce 1 1 }  { prHat_buf3_we1 mem_we 1 1 }  { prHat_buf3_d1 mem_din 1 1 } } }
	prHat_bufA3 { ap_memory {  { prHat_bufA3_address1 mem_address 1 11 }  { prHat_bufA3_ce1 mem_ce 1 1 }  { prHat_bufA3_we1 mem_we 1 1 }  { prHat_bufA3_d1 mem_din 1 1 } } }
	prHat_bufB3 { ap_memory {  { prHat_bufB3_address1 mem_address 1 11 }  { prHat_bufB3_ce1 mem_ce 1 1 }  { prHat_bufB3_we1 mem_we 1 1 }  { prHat_bufB3_d1 mem_din 1 1 } } }
	prHat_bufB3a { ap_memory {  { prHat_bufB3a_address1 mem_address 1 11 }  { prHat_bufB3a_ce1 mem_ce 1 1 }  { prHat_bufB3a_we1 mem_we 1 1 }  { prHat_bufB3a_d1 mem_din 1 1 } } }
	prHat_bufB3b { ap_memory {  { prHat_bufB3b_address1 mem_address 1 11 }  { prHat_bufB3b_ce1 mem_ce 1 1 }  { prHat_bufB3b_we1 mem_we 1 1 }  { prHat_bufB3b_d1 mem_din 1 1 } } }
	prHat_bufB3c { ap_memory {  { prHat_bufB3c_address1 mem_address 1 11 }  { prHat_bufB3c_ce1 mem_ce 1 1 }  { prHat_bufB3c_we1 mem_we 1 1 }  { prHat_bufB3c_d1 mem_din 1 1 } } }
	bpest4 { ap_none {  { bpest4 in_data 0 1 } } }
	prHat_buf4 { ap_memory {  { prHat_buf4_address1 mem_address 1 11 }  { prHat_buf4_ce1 mem_ce 1 1 }  { prHat_buf4_we1 mem_we 1 1 }  { prHat_buf4_d1 mem_din 1 1 } } }
	prHat_buf4a { ap_memory {  { prHat_buf4a_address1 mem_address 1 11 }  { prHat_buf4a_ce1 mem_ce 1 1 }  { prHat_buf4a_we1 mem_we 1 1 }  { prHat_buf4a_d1 mem_din 1 1 } } }
	prHat_bufA4 { ap_memory {  { prHat_bufA4_address1 mem_address 1 11 }  { prHat_bufA4_ce1 mem_ce 1 1 }  { prHat_bufA4_we1 mem_we 1 1 }  { prHat_bufA4_d1 mem_din 1 1 } } }
	prHat_bufA4a { ap_memory {  { prHat_bufA4a_address1 mem_address 1 11 }  { prHat_bufA4a_ce1 mem_ce 1 1 }  { prHat_bufA4a_we1 mem_we 1 1 }  { prHat_bufA4a_d1 mem_din 1 1 } } }
	prHat_bufA4b { ap_memory {  { prHat_bufA4b_address1 mem_address 1 11 }  { prHat_bufA4b_ce1 mem_ce 1 1 }  { prHat_bufA4b_we1 mem_we 1 1 }  { prHat_bufA4b_d1 mem_din 1 1 } } }
	prHat_bufB4 { ap_memory {  { prHat_bufB4_address1 mem_address 1 11 }  { prHat_bufB4_ce1 mem_ce 1 1 }  { prHat_bufB4_we1 mem_we 1 1 }  { prHat_bufB4_d1 mem_din 1 1 } } }
	bpest5 { ap_none {  { bpest5 in_data 0 1 } } }
	prHat_bufA5 { ap_memory {  { prHat_bufA5_address1 mem_address 1 11 }  { prHat_bufA5_ce1 mem_ce 1 1 }  { prHat_bufA5_we1 mem_we 1 1 }  { prHat_bufA5_d1 mem_din 1 1 } } }
	prHat_bufB5 { ap_memory {  { prHat_bufB5_address1 mem_address 1 11 }  { prHat_bufB5_ce1 mem_ce 1 1 }  { prHat_bufB5_we1 mem_we 1 1 }  { prHat_bufB5_d1 mem_din 1 1 } } }
	prHat_bufB5a { ap_memory {  { prHat_bufB5a_address1 mem_address 1 11 }  { prHat_bufB5a_ce1 mem_ce 1 1 }  { prHat_bufB5a_we1 mem_we 1 1 }  { prHat_bufB5a_d1 mem_din 1 1 } } }
	prHat_bufB5b { ap_memory {  { prHat_bufB5b_address1 mem_address 1 11 }  { prHat_bufB5b_ce1 mem_ce 1 1 }  { prHat_bufB5b_we1 mem_we 1 1 }  { prHat_bufB5b_d1 mem_din 1 1 } } }
	prHat_bufB5c { ap_memory {  { prHat_bufB5c_address1 mem_address 1 11 }  { prHat_bufB5c_ce1 mem_ce 1 1 }  { prHat_bufB5c_we1 mem_we 1 1 }  { prHat_bufB5c_d1 mem_din 1 1 } } }
	bpest6 { ap_none {  { bpest6 in_data 0 1 } } }
	prHat_buf6 { ap_memory {  { prHat_buf6_address1 mem_address 1 11 }  { prHat_buf6_ce1 mem_ce 1 1 }  { prHat_buf6_we1 mem_we 1 1 }  { prHat_buf6_d1 mem_din 1 1 } } }
	prHat_buf6a { ap_memory {  { prHat_buf6a_address1 mem_address 1 11 }  { prHat_buf6a_ce1 mem_ce 1 1 }  { prHat_buf6a_we1 mem_we 1 1 }  { prHat_buf6a_d1 mem_din 1 1 } } }
	prHat_bufA6 { ap_memory {  { prHat_bufA6_address1 mem_address 1 11 }  { prHat_bufA6_ce1 mem_ce 1 1 }  { prHat_bufA6_we1 mem_we 1 1 }  { prHat_bufA6_d1 mem_din 1 1 } } }
	prHat_bufA6a { ap_memory {  { prHat_bufA6a_address1 mem_address 1 11 }  { prHat_bufA6a_ce1 mem_ce 1 1 }  { prHat_bufA6a_we1 mem_we 1 1 }  { prHat_bufA6a_d1 mem_din 1 1 } } }
	prHat_bufA6b { ap_memory {  { prHat_bufA6b_address1 mem_address 1 11 }  { prHat_bufA6b_ce1 mem_ce 1 1 }  { prHat_bufA6b_we1 mem_we 1 1 }  { prHat_bufA6b_d1 mem_din 1 1 } } }
	prHat_bufA6c { ap_memory {  { prHat_bufA6c_address1 mem_address 1 11 }  { prHat_bufA6c_ce1 mem_ce 1 1 }  { prHat_bufA6c_we1 mem_we 1 1 }  { prHat_bufA6c_d1 mem_din 1 1 } } }
	prHat_bufB6 { ap_memory {  { prHat_bufB6_address1 mem_address 1 11 }  { prHat_bufB6_ce1 mem_ce 1 1 }  { prHat_bufB6_we1 mem_we 1 1 }  { prHat_bufB6_d1 mem_din 1 1 } } }
	bpest7 { ap_none {  { bpest7 in_data 0 1 } } }
	prHat_bufA7 { ap_memory {  { prHat_bufA7_address1 mem_address 1 11 }  { prHat_bufA7_ce1 mem_ce 1 1 }  { prHat_bufA7_we1 mem_we 1 1 }  { prHat_bufA7_d1 mem_din 1 1 } } }
	prHat_bufB7 { ap_memory {  { prHat_bufB7_address1 mem_address 1 11 }  { prHat_bufB7_ce1 mem_ce 1 1 }  { prHat_bufB7_we1 mem_we 1 1 }  { prHat_bufB7_d1 mem_din 1 1 } } }
	prHat_bufB7a { ap_memory {  { prHat_bufB7a_address1 mem_address 1 11 }  { prHat_bufB7a_ce1 mem_ce 1 1 }  { prHat_bufB7a_we1 mem_we 1 1 }  { prHat_bufB7a_d1 mem_din 1 1 } } }
	bpest8 { ap_none {  { bpest8 in_data 0 1 } } }
	prHat_buf8 { ap_memory {  { prHat_buf8_address1 mem_address 1 11 }  { prHat_buf8_ce1 mem_ce 1 1 }  { prHat_buf8_we1 mem_we 1 1 }  { prHat_buf8_d1 mem_din 1 1 } } }
	bpest9 { ap_none {  { bpest9 in_data 0 1 } } }
	prHat_bufA9 { ap_memory {  { prHat_bufA9_address1 mem_address 1 11 }  { prHat_bufA9_ce1 mem_ce 1 1 }  { prHat_bufA9_we1 mem_we 1 1 }  { prHat_bufA9_d1 mem_din 1 1 } } }
	prHat_bufB9 { ap_memory {  { prHat_bufB9_address1 mem_address 1 11 }  { prHat_bufB9_ce1 mem_ce 1 1 }  { prHat_bufB9_we1 mem_we 1 1 }  { prHat_bufB9_d1 mem_din 1 1 } } }
	prHat_bufB9a { ap_memory {  { prHat_bufB9a_address1 mem_address 1 11 }  { prHat_bufB9a_ce1 mem_ce 1 1 }  { prHat_bufB9a_we1 mem_we 1 1 }  { prHat_bufB9a_d1 mem_din 1 1 } } }
	bpest10 { ap_none {  { bpest10 in_data 0 1 } } }
	prHat_buf10 { ap_memory {  { prHat_buf10_address1 mem_address 1 11 }  { prHat_buf10_ce1 mem_ce 1 1 }  { prHat_buf10_we1 mem_we 1 1 }  { prHat_buf10_d1 mem_din 1 1 } } }
	prHat_buf10a { ap_memory {  { prHat_buf10a_address1 mem_address 1 11 }  { prHat_buf10a_ce1 mem_ce 1 1 }  { prHat_buf10a_we1 mem_we 1 1 }  { prHat_buf10a_d1 mem_din 1 1 } } }
	prHat_bufA10 { ap_memory {  { prHat_bufA10_address1 mem_address 1 11 }  { prHat_bufA10_ce1 mem_ce 1 1 }  { prHat_bufA10_we1 mem_we 1 1 }  { prHat_bufA10_d1 mem_din 1 1 } } }
	prHat_bufA10a { ap_memory {  { prHat_bufA10a_address1 mem_address 1 11 }  { prHat_bufA10a_ce1 mem_ce 1 1 }  { prHat_bufA10a_we1 mem_we 1 1 }  { prHat_bufA10a_d1 mem_din 1 1 } } }
	prHat_bufA10b { ap_memory {  { prHat_bufA10b_address1 mem_address 1 11 }  { prHat_bufA10b_ce1 mem_ce 1 1 }  { prHat_bufA10b_we1 mem_we 1 1 }  { prHat_bufA10b_d1 mem_din 1 1 } } }
	prHat_bufA10c { ap_memory {  { prHat_bufA10c_address1 mem_address 1 11 }  { prHat_bufA10c_ce1 mem_ce 1 1 }  { prHat_bufA10c_we1 mem_we 1 1 }  { prHat_bufA10c_d1 mem_din 1 1 } } }
	prHat_buf10b { ap_memory {  { prHat_buf10b_address1 mem_address 1 11 }  { prHat_buf10b_ce1 mem_ce 1 1 }  { prHat_buf10b_we1 mem_we 1 1 }  { prHat_buf10b_d1 mem_din 1 1 } } }
	prHat_bufB10 { ap_memory {  { prHat_bufB10_address1 mem_address 1 11 }  { prHat_bufB10_ce1 mem_ce 1 1 }  { prHat_bufB10_we1 mem_we 1 1 }  { prHat_bufB10_d1 mem_din 1 1 } } }
}
