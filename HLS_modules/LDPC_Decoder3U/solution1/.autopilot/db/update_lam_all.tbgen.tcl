set moduleName update_lam_all
set isCombinational 1
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {update_lam_all}
set C_modelType { void 0 }
set C_modelArgList {
	{ pos_r int 13 regular  }
	{ pest0 int 16 regular {pointer 0} {global 0}  }
	{ Lam_bufAa int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufAb int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufAc int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_bufa int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_bufb int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_bufa int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_bufb int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ pest1 int 16 regular {pointer 0} {global 0}  }
	{ Lam_bufA1 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB1a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB1b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB1c int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf1 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf1a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf1b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf1 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf1 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf1a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf1b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf1 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ pest2 int 16 regular {pointer 0} {global 0}  }
	{ Lam_buf2 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufA2a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufA2b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufA2c int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB2 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam_buf2 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf2 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf2 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf2a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf2b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2_buf2 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf2 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf2 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf2a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf2b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ pest3 int 16 regular {pointer 0} {global 0}  }
	{ Lam_bufA3 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB3a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB3b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB3c int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf3 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf3a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf3b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf3 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf3 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf3a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf3b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf3 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ pest4 int 16 regular {pointer 0} {global 0}  }
	{ Lam_buf4 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufA4a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufA4b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufA4c int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB4 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf4 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf4 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf4a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf4b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf4 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf4 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf4a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf4b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ pest5 int 16 regular {pointer 0} {global 0}  }
	{ Lam_bufA5 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB5a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB5b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB5c int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf5 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf5a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf5b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf5 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf5 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf5a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf5b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf5 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ pest6 int 16 regular {pointer 0} {global 0}  }
	{ Lam_buf6 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_buf6a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufA6 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufA6b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufA6c int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB6 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf6 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf6 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf6 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf6 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ pest7 int 16 regular {pointer 0} {global 0}  }
	{ Lam_bufA7 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB7a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB7b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf7 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf7a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf7 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf7 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf7a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf7 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ pest8 int 16 regular {pointer 0} {global 0}  }
	{ Lam_buf8 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ pest9 int 16 regular {pointer 0} {global 0}  }
	{ Lam_bufA9 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB9a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB9b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf9 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf9a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf9 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf9 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf9a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf9 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ pest10 int 16 regular {pointer 0} {global 0}  }
	{ Lam_buf10 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_buf10a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufA10a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufA10b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufA10c int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ Lam_bufB10 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam_buf4 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam_buf4a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamB_buf10 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf10 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf10a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLamC_buf10b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2_buf4 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2_buf4a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2B_buf10 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf10 int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf10a int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ prLam2C_buf10b int 16 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "pos_r", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "pest0", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pest0","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufAa", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufAa","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufAb", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufAb","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufAc", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufAc","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_bufa", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_bufa","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_bufb", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_bufb","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_bufa", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_bufa","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_bufb", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_bufb","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "pest1", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pest1","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA1", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA1","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB1a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB1a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB1b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB1b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB1c", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB1c","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf1", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf1","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf1a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf1a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf1b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf1b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf1", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf1","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf1", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf1","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf1a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf1a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf1b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf1b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf1", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf1","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "pest2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pest2","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf2", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf2","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA2a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA2a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA2b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA2b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA2c", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA2c","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB2", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB2","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam_buf2", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam_buf2","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf2", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf2","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf2", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf2","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf2a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf2a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf2b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf2b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2_buf2", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2_buf2","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf2", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf2","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf2", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf2","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf2a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf2a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf2b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf2b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "pest3", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pest3","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA3", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA3","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB3a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB3a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB3b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB3b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB3c", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB3c","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf3", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf3","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf3a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf3a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf3b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf3b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf3", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf3","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf3", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf3","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf3a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf3a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf3b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf3b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf3", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf3","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "pest4", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pest4","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf4", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf4","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA4a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA4a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA4b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA4b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA4c", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA4c","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB4", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB4","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf4", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf4","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf4", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf4","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf4a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf4a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf4b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf4b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf4", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf4","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf4", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf4","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf4a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf4a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf4b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf4b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "pest5", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pest5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA5", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB5a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB5a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB5b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB5b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB5c", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB5c","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf5", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf5a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf5a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf5b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf5b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf5", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf5", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf5a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf5a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf5b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf5b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf5", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "pest6", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pest6","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf6", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf6","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf6a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf6a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA6", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA6","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA6b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA6b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA6c", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA6c","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB6", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB6","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf6", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf6","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf6", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf6","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf6", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf6","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf6", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf6","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "pest7", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pest7","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA7", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA7","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB7a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB7a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB7b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB7b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf7", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf7","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf7a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf7a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf7", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf7","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf7", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf7","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf7a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf7a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf7", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf7","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "pest8", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pest8","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf8", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf8","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "pest9", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pest9","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA9", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA9","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB9a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB9a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB9b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB9b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf9", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf9","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf9a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf9a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf9", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf9","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf9", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf9","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf9a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf9a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf9", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf9","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "pest10", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "pest10","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf10", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf10","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf10a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf10a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA10a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA10a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA10b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA10b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA10c", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA10c","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB10", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB10","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam_buf4", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam_buf4","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam_buf4a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam_buf4a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamB_buf10", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamB_buf10","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf10", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf10","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf10a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf10a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLamC_buf10b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLamC_buf10b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2_buf4", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2_buf4","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2_buf4a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2_buf4a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2B_buf10", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2B_buf10","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf10", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf10","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf10a", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf10a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "prLam2C_buf10b", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "prLam2C_buf10b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} ]}
# RTL Port declarations: 
set portNum 504
set portList { 
	{ pos_r sc_in sc_lv 13 signal 0 } 
	{ pest0 sc_in sc_lv 16 signal 1 } 
	{ Lam_bufAa_address0 sc_out sc_lv 10 signal 2 } 
	{ Lam_bufAa_ce0 sc_out sc_logic 1 signal 2 } 
	{ Lam_bufAa_we0 sc_out sc_logic 1 signal 2 } 
	{ Lam_bufAa_d0 sc_out sc_lv 16 signal 2 } 
	{ Lam_bufAb_address0 sc_out sc_lv 10 signal 3 } 
	{ Lam_bufAb_ce0 sc_out sc_logic 1 signal 3 } 
	{ Lam_bufAb_we0 sc_out sc_logic 1 signal 3 } 
	{ Lam_bufAb_d0 sc_out sc_lv 16 signal 3 } 
	{ Lam_bufAc_address0 sc_out sc_lv 10 signal 4 } 
	{ Lam_bufAc_ce0 sc_out sc_logic 1 signal 4 } 
	{ Lam_bufAc_we0 sc_out sc_logic 1 signal 4 } 
	{ Lam_bufAc_d0 sc_out sc_lv 16 signal 4 } 
	{ Lam_bufB_address0 sc_out sc_lv 10 signal 5 } 
	{ Lam_bufB_ce0 sc_out sc_logic 1 signal 5 } 
	{ Lam_bufB_we0 sc_out sc_logic 1 signal 5 } 
	{ Lam_bufB_d0 sc_out sc_lv 16 signal 5 } 
	{ prLamB_buf_address0 sc_out sc_lv 10 signal 6 } 
	{ prLamB_buf_ce0 sc_out sc_logic 1 signal 6 } 
	{ prLamB_buf_we0 sc_out sc_logic 1 signal 6 } 
	{ prLamB_buf_d0 sc_out sc_lv 16 signal 6 } 
	{ prLamC_buf_address0 sc_out sc_lv 10 signal 7 } 
	{ prLamC_buf_ce0 sc_out sc_logic 1 signal 7 } 
	{ prLamC_buf_we0 sc_out sc_logic 1 signal 7 } 
	{ prLamC_buf_d0 sc_out sc_lv 16 signal 7 } 
	{ prLamC_bufa_address0 sc_out sc_lv 10 signal 8 } 
	{ prLamC_bufa_ce0 sc_out sc_logic 1 signal 8 } 
	{ prLamC_bufa_we0 sc_out sc_logic 1 signal 8 } 
	{ prLamC_bufa_d0 sc_out sc_lv 16 signal 8 } 
	{ prLamC_bufb_address0 sc_out sc_lv 10 signal 9 } 
	{ prLamC_bufb_ce0 sc_out sc_logic 1 signal 9 } 
	{ prLamC_bufb_we0 sc_out sc_logic 1 signal 9 } 
	{ prLamC_bufb_d0 sc_out sc_lv 16 signal 9 } 
	{ prLam2B_buf_address0 sc_out sc_lv 10 signal 10 } 
	{ prLam2B_buf_ce0 sc_out sc_logic 1 signal 10 } 
	{ prLam2B_buf_we0 sc_out sc_logic 1 signal 10 } 
	{ prLam2B_buf_d0 sc_out sc_lv 16 signal 10 } 
	{ prLam2C_buf_address0 sc_out sc_lv 10 signal 11 } 
	{ prLam2C_buf_ce0 sc_out sc_logic 1 signal 11 } 
	{ prLam2C_buf_we0 sc_out sc_logic 1 signal 11 } 
	{ prLam2C_buf_d0 sc_out sc_lv 16 signal 11 } 
	{ prLam2C_bufa_address0 sc_out sc_lv 10 signal 12 } 
	{ prLam2C_bufa_ce0 sc_out sc_logic 1 signal 12 } 
	{ prLam2C_bufa_we0 sc_out sc_logic 1 signal 12 } 
	{ prLam2C_bufa_d0 sc_out sc_lv 16 signal 12 } 
	{ prLam2C_bufb_address0 sc_out sc_lv 10 signal 13 } 
	{ prLam2C_bufb_ce0 sc_out sc_logic 1 signal 13 } 
	{ prLam2C_bufb_we0 sc_out sc_logic 1 signal 13 } 
	{ prLam2C_bufb_d0 sc_out sc_lv 16 signal 13 } 
	{ pest1 sc_in sc_lv 16 signal 14 } 
	{ Lam_bufA1_address0 sc_out sc_lv 10 signal 15 } 
	{ Lam_bufA1_ce0 sc_out sc_logic 1 signal 15 } 
	{ Lam_bufA1_we0 sc_out sc_logic 1 signal 15 } 
	{ Lam_bufA1_d0 sc_out sc_lv 16 signal 15 } 
	{ Lam_bufB1a_address0 sc_out sc_lv 10 signal 16 } 
	{ Lam_bufB1a_ce0 sc_out sc_logic 1 signal 16 } 
	{ Lam_bufB1a_we0 sc_out sc_logic 1 signal 16 } 
	{ Lam_bufB1a_d0 sc_out sc_lv 16 signal 16 } 
	{ Lam_bufB1b_address0 sc_out sc_lv 10 signal 17 } 
	{ Lam_bufB1b_ce0 sc_out sc_logic 1 signal 17 } 
	{ Lam_bufB1b_we0 sc_out sc_logic 1 signal 17 } 
	{ Lam_bufB1b_d0 sc_out sc_lv 16 signal 17 } 
	{ Lam_bufB1c_address0 sc_out sc_lv 10 signal 18 } 
	{ Lam_bufB1c_ce0 sc_out sc_logic 1 signal 18 } 
	{ Lam_bufB1c_we0 sc_out sc_logic 1 signal 18 } 
	{ Lam_bufB1c_d0 sc_out sc_lv 16 signal 18 } 
	{ prLamB_buf1_address0 sc_out sc_lv 10 signal 19 } 
	{ prLamB_buf1_ce0 sc_out sc_logic 1 signal 19 } 
	{ prLamB_buf1_we0 sc_out sc_logic 1 signal 19 } 
	{ prLamB_buf1_d0 sc_out sc_lv 16 signal 19 } 
	{ prLamB_buf1a_address0 sc_out sc_lv 10 signal 20 } 
	{ prLamB_buf1a_ce0 sc_out sc_logic 1 signal 20 } 
	{ prLamB_buf1a_we0 sc_out sc_logic 1 signal 20 } 
	{ prLamB_buf1a_d0 sc_out sc_lv 16 signal 20 } 
	{ prLamB_buf1b_address0 sc_out sc_lv 10 signal 21 } 
	{ prLamB_buf1b_ce0 sc_out sc_logic 1 signal 21 } 
	{ prLamB_buf1b_we0 sc_out sc_logic 1 signal 21 } 
	{ prLamB_buf1b_d0 sc_out sc_lv 16 signal 21 } 
	{ prLamC_buf1_address0 sc_out sc_lv 10 signal 22 } 
	{ prLamC_buf1_ce0 sc_out sc_logic 1 signal 22 } 
	{ prLamC_buf1_we0 sc_out sc_logic 1 signal 22 } 
	{ prLamC_buf1_d0 sc_out sc_lv 16 signal 22 } 
	{ prLam2B_buf1_address0 sc_out sc_lv 10 signal 23 } 
	{ prLam2B_buf1_ce0 sc_out sc_logic 1 signal 23 } 
	{ prLam2B_buf1_we0 sc_out sc_logic 1 signal 23 } 
	{ prLam2B_buf1_d0 sc_out sc_lv 16 signal 23 } 
	{ prLam2B_buf1a_address0 sc_out sc_lv 10 signal 24 } 
	{ prLam2B_buf1a_ce0 sc_out sc_logic 1 signal 24 } 
	{ prLam2B_buf1a_we0 sc_out sc_logic 1 signal 24 } 
	{ prLam2B_buf1a_d0 sc_out sc_lv 16 signal 24 } 
	{ prLam2B_buf1b_address0 sc_out sc_lv 10 signal 25 } 
	{ prLam2B_buf1b_ce0 sc_out sc_logic 1 signal 25 } 
	{ prLam2B_buf1b_we0 sc_out sc_logic 1 signal 25 } 
	{ prLam2B_buf1b_d0 sc_out sc_lv 16 signal 25 } 
	{ prLam2C_buf1_address0 sc_out sc_lv 10 signal 26 } 
	{ prLam2C_buf1_ce0 sc_out sc_logic 1 signal 26 } 
	{ prLam2C_buf1_we0 sc_out sc_logic 1 signal 26 } 
	{ prLam2C_buf1_d0 sc_out sc_lv 16 signal 26 } 
	{ pest2 sc_in sc_lv 16 signal 27 } 
	{ Lam_buf2_address0 sc_out sc_lv 10 signal 28 } 
	{ Lam_buf2_ce0 sc_out sc_logic 1 signal 28 } 
	{ Lam_buf2_we0 sc_out sc_logic 1 signal 28 } 
	{ Lam_buf2_d0 sc_out sc_lv 16 signal 28 } 
	{ Lam_bufA2a_address0 sc_out sc_lv 10 signal 29 } 
	{ Lam_bufA2a_ce0 sc_out sc_logic 1 signal 29 } 
	{ Lam_bufA2a_we0 sc_out sc_logic 1 signal 29 } 
	{ Lam_bufA2a_d0 sc_out sc_lv 16 signal 29 } 
	{ Lam_bufA2b_address0 sc_out sc_lv 10 signal 30 } 
	{ Lam_bufA2b_ce0 sc_out sc_logic 1 signal 30 } 
	{ Lam_bufA2b_we0 sc_out sc_logic 1 signal 30 } 
	{ Lam_bufA2b_d0 sc_out sc_lv 16 signal 30 } 
	{ Lam_bufA2c_address0 sc_out sc_lv 10 signal 31 } 
	{ Lam_bufA2c_ce0 sc_out sc_logic 1 signal 31 } 
	{ Lam_bufA2c_we0 sc_out sc_logic 1 signal 31 } 
	{ Lam_bufA2c_d0 sc_out sc_lv 16 signal 31 } 
	{ Lam_bufB2_address0 sc_out sc_lv 10 signal 32 } 
	{ Lam_bufB2_ce0 sc_out sc_logic 1 signal 32 } 
	{ Lam_bufB2_we0 sc_out sc_logic 1 signal 32 } 
	{ Lam_bufB2_d0 sc_out sc_lv 16 signal 32 } 
	{ prLam_buf2_address0 sc_out sc_lv 10 signal 33 } 
	{ prLam_buf2_ce0 sc_out sc_logic 1 signal 33 } 
	{ prLam_buf2_we0 sc_out sc_logic 1 signal 33 } 
	{ prLam_buf2_d0 sc_out sc_lv 16 signal 33 } 
	{ prLamB_buf2_address0 sc_out sc_lv 10 signal 34 } 
	{ prLamB_buf2_ce0 sc_out sc_logic 1 signal 34 } 
	{ prLamB_buf2_we0 sc_out sc_logic 1 signal 34 } 
	{ prLamB_buf2_d0 sc_out sc_lv 16 signal 34 } 
	{ prLamC_buf2_address0 sc_out sc_lv 10 signal 35 } 
	{ prLamC_buf2_ce0 sc_out sc_logic 1 signal 35 } 
	{ prLamC_buf2_we0 sc_out sc_logic 1 signal 35 } 
	{ prLamC_buf2_d0 sc_out sc_lv 16 signal 35 } 
	{ prLamC_buf2a_address0 sc_out sc_lv 10 signal 36 } 
	{ prLamC_buf2a_ce0 sc_out sc_logic 1 signal 36 } 
	{ prLamC_buf2a_we0 sc_out sc_logic 1 signal 36 } 
	{ prLamC_buf2a_d0 sc_out sc_lv 16 signal 36 } 
	{ prLamC_buf2b_address0 sc_out sc_lv 10 signal 37 } 
	{ prLamC_buf2b_ce0 sc_out sc_logic 1 signal 37 } 
	{ prLamC_buf2b_we0 sc_out sc_logic 1 signal 37 } 
	{ prLamC_buf2b_d0 sc_out sc_lv 16 signal 37 } 
	{ prLam2_buf2_address0 sc_out sc_lv 10 signal 38 } 
	{ prLam2_buf2_ce0 sc_out sc_logic 1 signal 38 } 
	{ prLam2_buf2_we0 sc_out sc_logic 1 signal 38 } 
	{ prLam2_buf2_d0 sc_out sc_lv 16 signal 38 } 
	{ prLam2B_buf2_address0 sc_out sc_lv 10 signal 39 } 
	{ prLam2B_buf2_ce0 sc_out sc_logic 1 signal 39 } 
	{ prLam2B_buf2_we0 sc_out sc_logic 1 signal 39 } 
	{ prLam2B_buf2_d0 sc_out sc_lv 16 signal 39 } 
	{ prLam2C_buf2_address0 sc_out sc_lv 10 signal 40 } 
	{ prLam2C_buf2_ce0 sc_out sc_logic 1 signal 40 } 
	{ prLam2C_buf2_we0 sc_out sc_logic 1 signal 40 } 
	{ prLam2C_buf2_d0 sc_out sc_lv 16 signal 40 } 
	{ prLam2C_buf2a_address0 sc_out sc_lv 10 signal 41 } 
	{ prLam2C_buf2a_ce0 sc_out sc_logic 1 signal 41 } 
	{ prLam2C_buf2a_we0 sc_out sc_logic 1 signal 41 } 
	{ prLam2C_buf2a_d0 sc_out sc_lv 16 signal 41 } 
	{ prLam2C_buf2b_address0 sc_out sc_lv 10 signal 42 } 
	{ prLam2C_buf2b_ce0 sc_out sc_logic 1 signal 42 } 
	{ prLam2C_buf2b_we0 sc_out sc_logic 1 signal 42 } 
	{ prLam2C_buf2b_d0 sc_out sc_lv 16 signal 42 } 
	{ pest3 sc_in sc_lv 16 signal 43 } 
	{ Lam_bufA3_address0 sc_out sc_lv 10 signal 44 } 
	{ Lam_bufA3_ce0 sc_out sc_logic 1 signal 44 } 
	{ Lam_bufA3_we0 sc_out sc_logic 1 signal 44 } 
	{ Lam_bufA3_d0 sc_out sc_lv 16 signal 44 } 
	{ Lam_bufB3a_address0 sc_out sc_lv 10 signal 45 } 
	{ Lam_bufB3a_ce0 sc_out sc_logic 1 signal 45 } 
	{ Lam_bufB3a_we0 sc_out sc_logic 1 signal 45 } 
	{ Lam_bufB3a_d0 sc_out sc_lv 16 signal 45 } 
	{ Lam_bufB3b_address0 sc_out sc_lv 10 signal 46 } 
	{ Lam_bufB3b_ce0 sc_out sc_logic 1 signal 46 } 
	{ Lam_bufB3b_we0 sc_out sc_logic 1 signal 46 } 
	{ Lam_bufB3b_d0 sc_out sc_lv 16 signal 46 } 
	{ Lam_bufB3c_address0 sc_out sc_lv 10 signal 47 } 
	{ Lam_bufB3c_ce0 sc_out sc_logic 1 signal 47 } 
	{ Lam_bufB3c_we0 sc_out sc_logic 1 signal 47 } 
	{ Lam_bufB3c_d0 sc_out sc_lv 16 signal 47 } 
	{ prLamB_buf3_address0 sc_out sc_lv 10 signal 48 } 
	{ prLamB_buf3_ce0 sc_out sc_logic 1 signal 48 } 
	{ prLamB_buf3_we0 sc_out sc_logic 1 signal 48 } 
	{ prLamB_buf3_d0 sc_out sc_lv 16 signal 48 } 
	{ prLamB_buf3a_address0 sc_out sc_lv 10 signal 49 } 
	{ prLamB_buf3a_ce0 sc_out sc_logic 1 signal 49 } 
	{ prLamB_buf3a_we0 sc_out sc_logic 1 signal 49 } 
	{ prLamB_buf3a_d0 sc_out sc_lv 16 signal 49 } 
	{ prLamB_buf3b_address0 sc_out sc_lv 10 signal 50 } 
	{ prLamB_buf3b_ce0 sc_out sc_logic 1 signal 50 } 
	{ prLamB_buf3b_we0 sc_out sc_logic 1 signal 50 } 
	{ prLamB_buf3b_d0 sc_out sc_lv 16 signal 50 } 
	{ prLamC_buf3_address0 sc_out sc_lv 10 signal 51 } 
	{ prLamC_buf3_ce0 sc_out sc_logic 1 signal 51 } 
	{ prLamC_buf3_we0 sc_out sc_logic 1 signal 51 } 
	{ prLamC_buf3_d0 sc_out sc_lv 16 signal 51 } 
	{ prLam2B_buf3_address0 sc_out sc_lv 10 signal 52 } 
	{ prLam2B_buf3_ce0 sc_out sc_logic 1 signal 52 } 
	{ prLam2B_buf3_we0 sc_out sc_logic 1 signal 52 } 
	{ prLam2B_buf3_d0 sc_out sc_lv 16 signal 52 } 
	{ prLam2B_buf3a_address0 sc_out sc_lv 10 signal 53 } 
	{ prLam2B_buf3a_ce0 sc_out sc_logic 1 signal 53 } 
	{ prLam2B_buf3a_we0 sc_out sc_logic 1 signal 53 } 
	{ prLam2B_buf3a_d0 sc_out sc_lv 16 signal 53 } 
	{ prLam2B_buf3b_address0 sc_out sc_lv 10 signal 54 } 
	{ prLam2B_buf3b_ce0 sc_out sc_logic 1 signal 54 } 
	{ prLam2B_buf3b_we0 sc_out sc_logic 1 signal 54 } 
	{ prLam2B_buf3b_d0 sc_out sc_lv 16 signal 54 } 
	{ prLam2C_buf3_address0 sc_out sc_lv 10 signal 55 } 
	{ prLam2C_buf3_ce0 sc_out sc_logic 1 signal 55 } 
	{ prLam2C_buf3_we0 sc_out sc_logic 1 signal 55 } 
	{ prLam2C_buf3_d0 sc_out sc_lv 16 signal 55 } 
	{ pest4 sc_in sc_lv 16 signal 56 } 
	{ Lam_buf4_address0 sc_out sc_lv 10 signal 57 } 
	{ Lam_buf4_ce0 sc_out sc_logic 1 signal 57 } 
	{ Lam_buf4_we0 sc_out sc_logic 1 signal 57 } 
	{ Lam_buf4_d0 sc_out sc_lv 16 signal 57 } 
	{ Lam_bufA4a_address0 sc_out sc_lv 10 signal 58 } 
	{ Lam_bufA4a_ce0 sc_out sc_logic 1 signal 58 } 
	{ Lam_bufA4a_we0 sc_out sc_logic 1 signal 58 } 
	{ Lam_bufA4a_d0 sc_out sc_lv 16 signal 58 } 
	{ Lam_bufA4b_address0 sc_out sc_lv 10 signal 59 } 
	{ Lam_bufA4b_ce0 sc_out sc_logic 1 signal 59 } 
	{ Lam_bufA4b_we0 sc_out sc_logic 1 signal 59 } 
	{ Lam_bufA4b_d0 sc_out sc_lv 16 signal 59 } 
	{ Lam_bufA4c_address0 sc_out sc_lv 10 signal 60 } 
	{ Lam_bufA4c_ce0 sc_out sc_logic 1 signal 60 } 
	{ Lam_bufA4c_we0 sc_out sc_logic 1 signal 60 } 
	{ Lam_bufA4c_d0 sc_out sc_lv 16 signal 60 } 
	{ Lam_bufB4_address0 sc_out sc_lv 10 signal 61 } 
	{ Lam_bufB4_ce0 sc_out sc_logic 1 signal 61 } 
	{ Lam_bufB4_we0 sc_out sc_logic 1 signal 61 } 
	{ Lam_bufB4_d0 sc_out sc_lv 16 signal 61 } 
	{ prLamB_buf4_address0 sc_out sc_lv 10 signal 62 } 
	{ prLamB_buf4_ce0 sc_out sc_logic 1 signal 62 } 
	{ prLamB_buf4_we0 sc_out sc_logic 1 signal 62 } 
	{ prLamB_buf4_d0 sc_out sc_lv 16 signal 62 } 
	{ prLamC_buf4_address0 sc_out sc_lv 10 signal 63 } 
	{ prLamC_buf4_ce0 sc_out sc_logic 1 signal 63 } 
	{ prLamC_buf4_we0 sc_out sc_logic 1 signal 63 } 
	{ prLamC_buf4_d0 sc_out sc_lv 16 signal 63 } 
	{ prLamC_buf4a_address0 sc_out sc_lv 10 signal 64 } 
	{ prLamC_buf4a_ce0 sc_out sc_logic 1 signal 64 } 
	{ prLamC_buf4a_we0 sc_out sc_logic 1 signal 64 } 
	{ prLamC_buf4a_d0 sc_out sc_lv 16 signal 64 } 
	{ prLamC_buf4b_address0 sc_out sc_lv 10 signal 65 } 
	{ prLamC_buf4b_ce0 sc_out sc_logic 1 signal 65 } 
	{ prLamC_buf4b_we0 sc_out sc_logic 1 signal 65 } 
	{ prLamC_buf4b_d0 sc_out sc_lv 16 signal 65 } 
	{ prLam2B_buf4_address0 sc_out sc_lv 10 signal 66 } 
	{ prLam2B_buf4_ce0 sc_out sc_logic 1 signal 66 } 
	{ prLam2B_buf4_we0 sc_out sc_logic 1 signal 66 } 
	{ prLam2B_buf4_d0 sc_out sc_lv 16 signal 66 } 
	{ prLam2C_buf4_address0 sc_out sc_lv 10 signal 67 } 
	{ prLam2C_buf4_ce0 sc_out sc_logic 1 signal 67 } 
	{ prLam2C_buf4_we0 sc_out sc_logic 1 signal 67 } 
	{ prLam2C_buf4_d0 sc_out sc_lv 16 signal 67 } 
	{ prLam2C_buf4a_address0 sc_out sc_lv 10 signal 68 } 
	{ prLam2C_buf4a_ce0 sc_out sc_logic 1 signal 68 } 
	{ prLam2C_buf4a_we0 sc_out sc_logic 1 signal 68 } 
	{ prLam2C_buf4a_d0 sc_out sc_lv 16 signal 68 } 
	{ prLam2C_buf4b_address0 sc_out sc_lv 10 signal 69 } 
	{ prLam2C_buf4b_ce0 sc_out sc_logic 1 signal 69 } 
	{ prLam2C_buf4b_we0 sc_out sc_logic 1 signal 69 } 
	{ prLam2C_buf4b_d0 sc_out sc_lv 16 signal 69 } 
	{ pest5 sc_in sc_lv 16 signal 70 } 
	{ Lam_bufA5_address0 sc_out sc_lv 10 signal 71 } 
	{ Lam_bufA5_ce0 sc_out sc_logic 1 signal 71 } 
	{ Lam_bufA5_we0 sc_out sc_logic 1 signal 71 } 
	{ Lam_bufA5_d0 sc_out sc_lv 16 signal 71 } 
	{ Lam_bufB5a_address0 sc_out sc_lv 10 signal 72 } 
	{ Lam_bufB5a_ce0 sc_out sc_logic 1 signal 72 } 
	{ Lam_bufB5a_we0 sc_out sc_logic 1 signal 72 } 
	{ Lam_bufB5a_d0 sc_out sc_lv 16 signal 72 } 
	{ Lam_bufB5b_address0 sc_out sc_lv 10 signal 73 } 
	{ Lam_bufB5b_ce0 sc_out sc_logic 1 signal 73 } 
	{ Lam_bufB5b_we0 sc_out sc_logic 1 signal 73 } 
	{ Lam_bufB5b_d0 sc_out sc_lv 16 signal 73 } 
	{ Lam_bufB5c_address0 sc_out sc_lv 10 signal 74 } 
	{ Lam_bufB5c_ce0 sc_out sc_logic 1 signal 74 } 
	{ Lam_bufB5c_we0 sc_out sc_logic 1 signal 74 } 
	{ Lam_bufB5c_d0 sc_out sc_lv 16 signal 74 } 
	{ prLamB_buf5_address0 sc_out sc_lv 10 signal 75 } 
	{ prLamB_buf5_ce0 sc_out sc_logic 1 signal 75 } 
	{ prLamB_buf5_we0 sc_out sc_logic 1 signal 75 } 
	{ prLamB_buf5_d0 sc_out sc_lv 16 signal 75 } 
	{ prLamB_buf5a_address0 sc_out sc_lv 10 signal 76 } 
	{ prLamB_buf5a_ce0 sc_out sc_logic 1 signal 76 } 
	{ prLamB_buf5a_we0 sc_out sc_logic 1 signal 76 } 
	{ prLamB_buf5a_d0 sc_out sc_lv 16 signal 76 } 
	{ prLamB_buf5b_address0 sc_out sc_lv 10 signal 77 } 
	{ prLamB_buf5b_ce0 sc_out sc_logic 1 signal 77 } 
	{ prLamB_buf5b_we0 sc_out sc_logic 1 signal 77 } 
	{ prLamB_buf5b_d0 sc_out sc_lv 16 signal 77 } 
	{ prLamC_buf5_address0 sc_out sc_lv 10 signal 78 } 
	{ prLamC_buf5_ce0 sc_out sc_logic 1 signal 78 } 
	{ prLamC_buf5_we0 sc_out sc_logic 1 signal 78 } 
	{ prLamC_buf5_d0 sc_out sc_lv 16 signal 78 } 
	{ prLam2B_buf5_address0 sc_out sc_lv 10 signal 79 } 
	{ prLam2B_buf5_ce0 sc_out sc_logic 1 signal 79 } 
	{ prLam2B_buf5_we0 sc_out sc_logic 1 signal 79 } 
	{ prLam2B_buf5_d0 sc_out sc_lv 16 signal 79 } 
	{ prLam2B_buf5a_address0 sc_out sc_lv 10 signal 80 } 
	{ prLam2B_buf5a_ce0 sc_out sc_logic 1 signal 80 } 
	{ prLam2B_buf5a_we0 sc_out sc_logic 1 signal 80 } 
	{ prLam2B_buf5a_d0 sc_out sc_lv 16 signal 80 } 
	{ prLam2B_buf5b_address0 sc_out sc_lv 10 signal 81 } 
	{ prLam2B_buf5b_ce0 sc_out sc_logic 1 signal 81 } 
	{ prLam2B_buf5b_we0 sc_out sc_logic 1 signal 81 } 
	{ prLam2B_buf5b_d0 sc_out sc_lv 16 signal 81 } 
	{ prLam2C_buf5_address0 sc_out sc_lv 10 signal 82 } 
	{ prLam2C_buf5_ce0 sc_out sc_logic 1 signal 82 } 
	{ prLam2C_buf5_we0 sc_out sc_logic 1 signal 82 } 
	{ prLam2C_buf5_d0 sc_out sc_lv 16 signal 82 } 
	{ pest6 sc_in sc_lv 16 signal 83 } 
	{ Lam_buf6_address0 sc_out sc_lv 10 signal 84 } 
	{ Lam_buf6_ce0 sc_out sc_logic 1 signal 84 } 
	{ Lam_buf6_we0 sc_out sc_logic 1 signal 84 } 
	{ Lam_buf6_d0 sc_out sc_lv 16 signal 84 } 
	{ Lam_buf6a_address0 sc_out sc_lv 10 signal 85 } 
	{ Lam_buf6a_ce0 sc_out sc_logic 1 signal 85 } 
	{ Lam_buf6a_we0 sc_out sc_logic 1 signal 85 } 
	{ Lam_buf6a_d0 sc_out sc_lv 16 signal 85 } 
	{ Lam_bufA6_address0 sc_out sc_lv 10 signal 86 } 
	{ Lam_bufA6_ce0 sc_out sc_logic 1 signal 86 } 
	{ Lam_bufA6_we0 sc_out sc_logic 1 signal 86 } 
	{ Lam_bufA6_d0 sc_out sc_lv 16 signal 86 } 
	{ Lam_bufA6b_address0 sc_out sc_lv 10 signal 87 } 
	{ Lam_bufA6b_ce0 sc_out sc_logic 1 signal 87 } 
	{ Lam_bufA6b_we0 sc_out sc_logic 1 signal 87 } 
	{ Lam_bufA6b_d0 sc_out sc_lv 16 signal 87 } 
	{ Lam_bufA6c_address0 sc_out sc_lv 10 signal 88 } 
	{ Lam_bufA6c_ce0 sc_out sc_logic 1 signal 88 } 
	{ Lam_bufA6c_we0 sc_out sc_logic 1 signal 88 } 
	{ Lam_bufA6c_d0 sc_out sc_lv 16 signal 88 } 
	{ Lam_bufB6_address0 sc_out sc_lv 10 signal 89 } 
	{ Lam_bufB6_ce0 sc_out sc_logic 1 signal 89 } 
	{ Lam_bufB6_we0 sc_out sc_logic 1 signal 89 } 
	{ Lam_bufB6_d0 sc_out sc_lv 16 signal 89 } 
	{ prLamB_buf6_address0 sc_out sc_lv 10 signal 90 } 
	{ prLamB_buf6_ce0 sc_out sc_logic 1 signal 90 } 
	{ prLamB_buf6_we0 sc_out sc_logic 1 signal 90 } 
	{ prLamB_buf6_d0 sc_out sc_lv 16 signal 90 } 
	{ prLamC_buf6_address0 sc_out sc_lv 10 signal 91 } 
	{ prLamC_buf6_ce0 sc_out sc_logic 1 signal 91 } 
	{ prLamC_buf6_we0 sc_out sc_logic 1 signal 91 } 
	{ prLamC_buf6_d0 sc_out sc_lv 16 signal 91 } 
	{ prLam2B_buf6_address0 sc_out sc_lv 10 signal 92 } 
	{ prLam2B_buf6_ce0 sc_out sc_logic 1 signal 92 } 
	{ prLam2B_buf6_we0 sc_out sc_logic 1 signal 92 } 
	{ prLam2B_buf6_d0 sc_out sc_lv 16 signal 92 } 
	{ prLam2C_buf6_address0 sc_out sc_lv 10 signal 93 } 
	{ prLam2C_buf6_ce0 sc_out sc_logic 1 signal 93 } 
	{ prLam2C_buf6_we0 sc_out sc_logic 1 signal 93 } 
	{ prLam2C_buf6_d0 sc_out sc_lv 16 signal 93 } 
	{ pest7 sc_in sc_lv 16 signal 94 } 
	{ Lam_bufA7_address0 sc_out sc_lv 10 signal 95 } 
	{ Lam_bufA7_ce0 sc_out sc_logic 1 signal 95 } 
	{ Lam_bufA7_we0 sc_out sc_logic 1 signal 95 } 
	{ Lam_bufA7_d0 sc_out sc_lv 16 signal 95 } 
	{ Lam_bufB7a_address0 sc_out sc_lv 10 signal 96 } 
	{ Lam_bufB7a_ce0 sc_out sc_logic 1 signal 96 } 
	{ Lam_bufB7a_we0 sc_out sc_logic 1 signal 96 } 
	{ Lam_bufB7a_d0 sc_out sc_lv 16 signal 96 } 
	{ Lam_bufB7b_address0 sc_out sc_lv 10 signal 97 } 
	{ Lam_bufB7b_ce0 sc_out sc_logic 1 signal 97 } 
	{ Lam_bufB7b_we0 sc_out sc_logic 1 signal 97 } 
	{ Lam_bufB7b_d0 sc_out sc_lv 16 signal 97 } 
	{ prLamB_buf7_address0 sc_out sc_lv 10 signal 98 } 
	{ prLamB_buf7_ce0 sc_out sc_logic 1 signal 98 } 
	{ prLamB_buf7_we0 sc_out sc_logic 1 signal 98 } 
	{ prLamB_buf7_d0 sc_out sc_lv 16 signal 98 } 
	{ prLamB_buf7a_address0 sc_out sc_lv 10 signal 99 } 
	{ prLamB_buf7a_ce0 sc_out sc_logic 1 signal 99 } 
	{ prLamB_buf7a_we0 sc_out sc_logic 1 signal 99 } 
	{ prLamB_buf7a_d0 sc_out sc_lv 16 signal 99 } 
	{ prLamC_buf7_address0 sc_out sc_lv 10 signal 100 } 
	{ prLamC_buf7_ce0 sc_out sc_logic 1 signal 100 } 
	{ prLamC_buf7_we0 sc_out sc_logic 1 signal 100 } 
	{ prLamC_buf7_d0 sc_out sc_lv 16 signal 100 } 
	{ prLam2B_buf7_address0 sc_out sc_lv 10 signal 101 } 
	{ prLam2B_buf7_ce0 sc_out sc_logic 1 signal 101 } 
	{ prLam2B_buf7_we0 sc_out sc_logic 1 signal 101 } 
	{ prLam2B_buf7_d0 sc_out sc_lv 16 signal 101 } 
	{ prLam2B_buf7a_address0 sc_out sc_lv 10 signal 102 } 
	{ prLam2B_buf7a_ce0 sc_out sc_logic 1 signal 102 } 
	{ prLam2B_buf7a_we0 sc_out sc_logic 1 signal 102 } 
	{ prLam2B_buf7a_d0 sc_out sc_lv 16 signal 102 } 
	{ prLam2C_buf7_address0 sc_out sc_lv 10 signal 103 } 
	{ prLam2C_buf7_ce0 sc_out sc_logic 1 signal 103 } 
	{ prLam2C_buf7_we0 sc_out sc_logic 1 signal 103 } 
	{ prLam2C_buf7_d0 sc_out sc_lv 16 signal 103 } 
	{ pest8 sc_in sc_lv 16 signal 104 } 
	{ Lam_buf8_address0 sc_out sc_lv 10 signal 105 } 
	{ Lam_buf8_ce0 sc_out sc_logic 1 signal 105 } 
	{ Lam_buf8_we0 sc_out sc_logic 1 signal 105 } 
	{ Lam_buf8_d0 sc_out sc_lv 16 signal 105 } 
	{ pest9 sc_in sc_lv 16 signal 106 } 
	{ Lam_bufA9_address0 sc_out sc_lv 10 signal 107 } 
	{ Lam_bufA9_ce0 sc_out sc_logic 1 signal 107 } 
	{ Lam_bufA9_we0 sc_out sc_logic 1 signal 107 } 
	{ Lam_bufA9_d0 sc_out sc_lv 16 signal 107 } 
	{ Lam_bufB9a_address0 sc_out sc_lv 10 signal 108 } 
	{ Lam_bufB9a_ce0 sc_out sc_logic 1 signal 108 } 
	{ Lam_bufB9a_we0 sc_out sc_logic 1 signal 108 } 
	{ Lam_bufB9a_d0 sc_out sc_lv 16 signal 108 } 
	{ Lam_bufB9b_address0 sc_out sc_lv 10 signal 109 } 
	{ Lam_bufB9b_ce0 sc_out sc_logic 1 signal 109 } 
	{ Lam_bufB9b_we0 sc_out sc_logic 1 signal 109 } 
	{ Lam_bufB9b_d0 sc_out sc_lv 16 signal 109 } 
	{ prLamB_buf9_address0 sc_out sc_lv 10 signal 110 } 
	{ prLamB_buf9_ce0 sc_out sc_logic 1 signal 110 } 
	{ prLamB_buf9_we0 sc_out sc_logic 1 signal 110 } 
	{ prLamB_buf9_d0 sc_out sc_lv 16 signal 110 } 
	{ prLamB_buf9a_address0 sc_out sc_lv 10 signal 111 } 
	{ prLamB_buf9a_ce0 sc_out sc_logic 1 signal 111 } 
	{ prLamB_buf9a_we0 sc_out sc_logic 1 signal 111 } 
	{ prLamB_buf9a_d0 sc_out sc_lv 16 signal 111 } 
	{ prLamC_buf9_address0 sc_out sc_lv 10 signal 112 } 
	{ prLamC_buf9_ce0 sc_out sc_logic 1 signal 112 } 
	{ prLamC_buf9_we0 sc_out sc_logic 1 signal 112 } 
	{ prLamC_buf9_d0 sc_out sc_lv 16 signal 112 } 
	{ prLam2B_buf9_address0 sc_out sc_lv 10 signal 113 } 
	{ prLam2B_buf9_ce0 sc_out sc_logic 1 signal 113 } 
	{ prLam2B_buf9_we0 sc_out sc_logic 1 signal 113 } 
	{ prLam2B_buf9_d0 sc_out sc_lv 16 signal 113 } 
	{ prLam2B_buf9a_address0 sc_out sc_lv 10 signal 114 } 
	{ prLam2B_buf9a_ce0 sc_out sc_logic 1 signal 114 } 
	{ prLam2B_buf9a_we0 sc_out sc_logic 1 signal 114 } 
	{ prLam2B_buf9a_d0 sc_out sc_lv 16 signal 114 } 
	{ prLam2C_buf9_address0 sc_out sc_lv 10 signal 115 } 
	{ prLam2C_buf9_ce0 sc_out sc_logic 1 signal 115 } 
	{ prLam2C_buf9_we0 sc_out sc_logic 1 signal 115 } 
	{ prLam2C_buf9_d0 sc_out sc_lv 16 signal 115 } 
	{ pest10 sc_in sc_lv 16 signal 116 } 
	{ Lam_buf10_address0 sc_out sc_lv 10 signal 117 } 
	{ Lam_buf10_ce0 sc_out sc_logic 1 signal 117 } 
	{ Lam_buf10_we0 sc_out sc_logic 1 signal 117 } 
	{ Lam_buf10_d0 sc_out sc_lv 16 signal 117 } 
	{ Lam_buf10a_address0 sc_out sc_lv 10 signal 118 } 
	{ Lam_buf10a_ce0 sc_out sc_logic 1 signal 118 } 
	{ Lam_buf10a_we0 sc_out sc_logic 1 signal 118 } 
	{ Lam_buf10a_d0 sc_out sc_lv 16 signal 118 } 
	{ Lam_bufA10a_address0 sc_out sc_lv 10 signal 119 } 
	{ Lam_bufA10a_ce0 sc_out sc_logic 1 signal 119 } 
	{ Lam_bufA10a_we0 sc_out sc_logic 1 signal 119 } 
	{ Lam_bufA10a_d0 sc_out sc_lv 16 signal 119 } 
	{ Lam_bufA10b_address0 sc_out sc_lv 10 signal 120 } 
	{ Lam_bufA10b_ce0 sc_out sc_logic 1 signal 120 } 
	{ Lam_bufA10b_we0 sc_out sc_logic 1 signal 120 } 
	{ Lam_bufA10b_d0 sc_out sc_lv 16 signal 120 } 
	{ Lam_bufA10c_address0 sc_out sc_lv 10 signal 121 } 
	{ Lam_bufA10c_ce0 sc_out sc_logic 1 signal 121 } 
	{ Lam_bufA10c_we0 sc_out sc_logic 1 signal 121 } 
	{ Lam_bufA10c_d0 sc_out sc_lv 16 signal 121 } 
	{ Lam_bufB10_address0 sc_out sc_lv 10 signal 122 } 
	{ Lam_bufB10_ce0 sc_out sc_logic 1 signal 122 } 
	{ Lam_bufB10_we0 sc_out sc_logic 1 signal 122 } 
	{ Lam_bufB10_d0 sc_out sc_lv 16 signal 122 } 
	{ prLam_buf4_address0 sc_out sc_lv 10 signal 123 } 
	{ prLam_buf4_ce0 sc_out sc_logic 1 signal 123 } 
	{ prLam_buf4_we0 sc_out sc_logic 1 signal 123 } 
	{ prLam_buf4_d0 sc_out sc_lv 16 signal 123 } 
	{ prLam_buf4a_address0 sc_out sc_lv 10 signal 124 } 
	{ prLam_buf4a_ce0 sc_out sc_logic 1 signal 124 } 
	{ prLam_buf4a_we0 sc_out sc_logic 1 signal 124 } 
	{ prLam_buf4a_d0 sc_out sc_lv 16 signal 124 } 
	{ prLamB_buf10_address0 sc_out sc_lv 10 signal 125 } 
	{ prLamB_buf10_ce0 sc_out sc_logic 1 signal 125 } 
	{ prLamB_buf10_we0 sc_out sc_logic 1 signal 125 } 
	{ prLamB_buf10_d0 sc_out sc_lv 16 signal 125 } 
	{ prLamC_buf10_address0 sc_out sc_lv 10 signal 126 } 
	{ prLamC_buf10_ce0 sc_out sc_logic 1 signal 126 } 
	{ prLamC_buf10_we0 sc_out sc_logic 1 signal 126 } 
	{ prLamC_buf10_d0 sc_out sc_lv 16 signal 126 } 
	{ prLamC_buf10a_address0 sc_out sc_lv 10 signal 127 } 
	{ prLamC_buf10a_ce0 sc_out sc_logic 1 signal 127 } 
	{ prLamC_buf10a_we0 sc_out sc_logic 1 signal 127 } 
	{ prLamC_buf10a_d0 sc_out sc_lv 16 signal 127 } 
	{ prLamC_buf10b_address0 sc_out sc_lv 10 signal 128 } 
	{ prLamC_buf10b_ce0 sc_out sc_logic 1 signal 128 } 
	{ prLamC_buf10b_we0 sc_out sc_logic 1 signal 128 } 
	{ prLamC_buf10b_d0 sc_out sc_lv 16 signal 128 } 
	{ prLam2_buf4_address0 sc_out sc_lv 10 signal 129 } 
	{ prLam2_buf4_ce0 sc_out sc_logic 1 signal 129 } 
	{ prLam2_buf4_we0 sc_out sc_logic 1 signal 129 } 
	{ prLam2_buf4_d0 sc_out sc_lv 16 signal 129 } 
	{ prLam2_buf4a_address0 sc_out sc_lv 10 signal 130 } 
	{ prLam2_buf4a_ce0 sc_out sc_logic 1 signal 130 } 
	{ prLam2_buf4a_we0 sc_out sc_logic 1 signal 130 } 
	{ prLam2_buf4a_d0 sc_out sc_lv 16 signal 130 } 
	{ prLam2B_buf10_address0 sc_out sc_lv 10 signal 131 } 
	{ prLam2B_buf10_ce0 sc_out sc_logic 1 signal 131 } 
	{ prLam2B_buf10_we0 sc_out sc_logic 1 signal 131 } 
	{ prLam2B_buf10_d0 sc_out sc_lv 16 signal 131 } 
	{ prLam2C_buf10_address0 sc_out sc_lv 10 signal 132 } 
	{ prLam2C_buf10_ce0 sc_out sc_logic 1 signal 132 } 
	{ prLam2C_buf10_we0 sc_out sc_logic 1 signal 132 } 
	{ prLam2C_buf10_d0 sc_out sc_lv 16 signal 132 } 
	{ prLam2C_buf10a_address0 sc_out sc_lv 10 signal 133 } 
	{ prLam2C_buf10a_ce0 sc_out sc_logic 1 signal 133 } 
	{ prLam2C_buf10a_we0 sc_out sc_logic 1 signal 133 } 
	{ prLam2C_buf10a_d0 sc_out sc_lv 16 signal 133 } 
	{ prLam2C_buf10b_address0 sc_out sc_lv 10 signal 134 } 
	{ prLam2C_buf10b_ce0 sc_out sc_logic 1 signal 134 } 
	{ prLam2C_buf10b_we0 sc_out sc_logic 1 signal 134 } 
	{ prLam2C_buf10b_d0 sc_out sc_lv 16 signal 134 } 
}
set NewPortList {[ 
	{ "name": "pos_r", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "pos_r", "role": "default" }} , 
 	{ "name": "pest0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pest0", "role": "default" }} , 
 	{ "name": "Lam_bufAa_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufAa", "role": "address0" }} , 
 	{ "name": "Lam_bufAa_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufAa", "role": "ce0" }} , 
 	{ "name": "Lam_bufAa_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufAa", "role": "we0" }} , 
 	{ "name": "Lam_bufAa_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufAa", "role": "d0" }} , 
 	{ "name": "Lam_bufAb_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufAb", "role": "address0" }} , 
 	{ "name": "Lam_bufAb_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufAb", "role": "ce0" }} , 
 	{ "name": "Lam_bufAb_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufAb", "role": "we0" }} , 
 	{ "name": "Lam_bufAb_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufAb", "role": "d0" }} , 
 	{ "name": "Lam_bufAc_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufAc", "role": "address0" }} , 
 	{ "name": "Lam_bufAc_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufAc", "role": "ce0" }} , 
 	{ "name": "Lam_bufAc_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufAc", "role": "we0" }} , 
 	{ "name": "Lam_bufAc_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufAc", "role": "d0" }} , 
 	{ "name": "Lam_bufB_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB", "role": "address0" }} , 
 	{ "name": "Lam_bufB_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB", "role": "ce0" }} , 
 	{ "name": "Lam_bufB_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB", "role": "we0" }} , 
 	{ "name": "Lam_bufB_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB", "role": "d0" }} , 
 	{ "name": "prLamB_buf_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf", "role": "address0" }} , 
 	{ "name": "prLamB_buf_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf", "role": "ce0" }} , 
 	{ "name": "prLamB_buf_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf", "role": "we0" }} , 
 	{ "name": "prLamB_buf_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf", "role": "d0" }} , 
 	{ "name": "prLamC_buf_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf", "role": "address0" }} , 
 	{ "name": "prLamC_buf_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf", "role": "ce0" }} , 
 	{ "name": "prLamC_buf_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf", "role": "we0" }} , 
 	{ "name": "prLamC_buf_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf", "role": "d0" }} , 
 	{ "name": "prLamC_bufa_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_bufa", "role": "address0" }} , 
 	{ "name": "prLamC_bufa_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_bufa", "role": "ce0" }} , 
 	{ "name": "prLamC_bufa_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_bufa", "role": "we0" }} , 
 	{ "name": "prLamC_bufa_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_bufa", "role": "d0" }} , 
 	{ "name": "prLamC_bufb_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_bufb", "role": "address0" }} , 
 	{ "name": "prLamC_bufb_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_bufb", "role": "ce0" }} , 
 	{ "name": "prLamC_bufb_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_bufb", "role": "we0" }} , 
 	{ "name": "prLamC_bufb_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_bufb", "role": "d0" }} , 
 	{ "name": "prLam2B_buf_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf", "role": "address0" }} , 
 	{ "name": "prLam2B_buf_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf", "role": "we0" }} , 
 	{ "name": "prLam2B_buf_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf", "role": "d0" }} , 
 	{ "name": "prLam2C_buf_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf", "role": "address0" }} , 
 	{ "name": "prLam2C_buf_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf", "role": "we0" }} , 
 	{ "name": "prLam2C_buf_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf", "role": "d0" }} , 
 	{ "name": "prLam2C_bufa_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_bufa", "role": "address0" }} , 
 	{ "name": "prLam2C_bufa_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_bufa", "role": "ce0" }} , 
 	{ "name": "prLam2C_bufa_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_bufa", "role": "we0" }} , 
 	{ "name": "prLam2C_bufa_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_bufa", "role": "d0" }} , 
 	{ "name": "prLam2C_bufb_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_bufb", "role": "address0" }} , 
 	{ "name": "prLam2C_bufb_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_bufb", "role": "ce0" }} , 
 	{ "name": "prLam2C_bufb_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_bufb", "role": "we0" }} , 
 	{ "name": "prLam2C_bufb_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_bufb", "role": "d0" }} , 
 	{ "name": "pest1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pest1", "role": "default" }} , 
 	{ "name": "Lam_bufA1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA1", "role": "address0" }} , 
 	{ "name": "Lam_bufA1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA1", "role": "ce0" }} , 
 	{ "name": "Lam_bufA1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA1", "role": "we0" }} , 
 	{ "name": "Lam_bufA1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA1", "role": "d0" }} , 
 	{ "name": "Lam_bufB1a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB1a", "role": "address0" }} , 
 	{ "name": "Lam_bufB1a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB1a", "role": "ce0" }} , 
 	{ "name": "Lam_bufB1a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB1a", "role": "we0" }} , 
 	{ "name": "Lam_bufB1a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB1a", "role": "d0" }} , 
 	{ "name": "Lam_bufB1b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB1b", "role": "address0" }} , 
 	{ "name": "Lam_bufB1b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB1b", "role": "ce0" }} , 
 	{ "name": "Lam_bufB1b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB1b", "role": "we0" }} , 
 	{ "name": "Lam_bufB1b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB1b", "role": "d0" }} , 
 	{ "name": "Lam_bufB1c_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB1c", "role": "address0" }} , 
 	{ "name": "Lam_bufB1c_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB1c", "role": "ce0" }} , 
 	{ "name": "Lam_bufB1c_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB1c", "role": "we0" }} , 
 	{ "name": "Lam_bufB1c_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB1c", "role": "d0" }} , 
 	{ "name": "prLamB_buf1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf1", "role": "address0" }} , 
 	{ "name": "prLamB_buf1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf1", "role": "ce0" }} , 
 	{ "name": "prLamB_buf1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf1", "role": "we0" }} , 
 	{ "name": "prLamB_buf1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf1", "role": "d0" }} , 
 	{ "name": "prLamB_buf1a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf1a", "role": "address0" }} , 
 	{ "name": "prLamB_buf1a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf1a", "role": "ce0" }} , 
 	{ "name": "prLamB_buf1a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf1a", "role": "we0" }} , 
 	{ "name": "prLamB_buf1a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf1a", "role": "d0" }} , 
 	{ "name": "prLamB_buf1b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf1b", "role": "address0" }} , 
 	{ "name": "prLamB_buf1b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf1b", "role": "ce0" }} , 
 	{ "name": "prLamB_buf1b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf1b", "role": "we0" }} , 
 	{ "name": "prLamB_buf1b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf1b", "role": "d0" }} , 
 	{ "name": "prLamC_buf1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf1", "role": "address0" }} , 
 	{ "name": "prLamC_buf1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf1", "role": "ce0" }} , 
 	{ "name": "prLamC_buf1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf1", "role": "we0" }} , 
 	{ "name": "prLamC_buf1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf1", "role": "d0" }} , 
 	{ "name": "prLam2B_buf1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf1", "role": "address0" }} , 
 	{ "name": "prLam2B_buf1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf1", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf1", "role": "we0" }} , 
 	{ "name": "prLam2B_buf1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf1", "role": "d0" }} , 
 	{ "name": "prLam2B_buf1a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf1a", "role": "address0" }} , 
 	{ "name": "prLam2B_buf1a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf1a", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf1a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf1a", "role": "we0" }} , 
 	{ "name": "prLam2B_buf1a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf1a", "role": "d0" }} , 
 	{ "name": "prLam2B_buf1b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf1b", "role": "address0" }} , 
 	{ "name": "prLam2B_buf1b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf1b", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf1b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf1b", "role": "we0" }} , 
 	{ "name": "prLam2B_buf1b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf1b", "role": "d0" }} , 
 	{ "name": "prLam2C_buf1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf1", "role": "address0" }} , 
 	{ "name": "prLam2C_buf1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf1", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf1", "role": "we0" }} , 
 	{ "name": "prLam2C_buf1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf1", "role": "d0" }} , 
 	{ "name": "pest2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pest2", "role": "default" }} , 
 	{ "name": "Lam_buf2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf2", "role": "address0" }} , 
 	{ "name": "Lam_buf2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf2", "role": "ce0" }} , 
 	{ "name": "Lam_buf2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf2", "role": "we0" }} , 
 	{ "name": "Lam_buf2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf2", "role": "d0" }} , 
 	{ "name": "Lam_bufA2a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA2a", "role": "address0" }} , 
 	{ "name": "Lam_bufA2a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA2a", "role": "ce0" }} , 
 	{ "name": "Lam_bufA2a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA2a", "role": "we0" }} , 
 	{ "name": "Lam_bufA2a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA2a", "role": "d0" }} , 
 	{ "name": "Lam_bufA2b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA2b", "role": "address0" }} , 
 	{ "name": "Lam_bufA2b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA2b", "role": "ce0" }} , 
 	{ "name": "Lam_bufA2b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA2b", "role": "we0" }} , 
 	{ "name": "Lam_bufA2b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA2b", "role": "d0" }} , 
 	{ "name": "Lam_bufA2c_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA2c", "role": "address0" }} , 
 	{ "name": "Lam_bufA2c_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA2c", "role": "ce0" }} , 
 	{ "name": "Lam_bufA2c_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA2c", "role": "we0" }} , 
 	{ "name": "Lam_bufA2c_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA2c", "role": "d0" }} , 
 	{ "name": "Lam_bufB2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB2", "role": "address0" }} , 
 	{ "name": "Lam_bufB2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB2", "role": "ce0" }} , 
 	{ "name": "Lam_bufB2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB2", "role": "we0" }} , 
 	{ "name": "Lam_bufB2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB2", "role": "d0" }} , 
 	{ "name": "prLam_buf2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam_buf2", "role": "address0" }} , 
 	{ "name": "prLam_buf2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam_buf2", "role": "ce0" }} , 
 	{ "name": "prLam_buf2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam_buf2", "role": "we0" }} , 
 	{ "name": "prLam_buf2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam_buf2", "role": "d0" }} , 
 	{ "name": "prLamB_buf2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf2", "role": "address0" }} , 
 	{ "name": "prLamB_buf2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf2", "role": "ce0" }} , 
 	{ "name": "prLamB_buf2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf2", "role": "we0" }} , 
 	{ "name": "prLamB_buf2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf2", "role": "d0" }} , 
 	{ "name": "prLamC_buf2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf2", "role": "address0" }} , 
 	{ "name": "prLamC_buf2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf2", "role": "ce0" }} , 
 	{ "name": "prLamC_buf2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf2", "role": "we0" }} , 
 	{ "name": "prLamC_buf2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf2", "role": "d0" }} , 
 	{ "name": "prLamC_buf2a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf2a", "role": "address0" }} , 
 	{ "name": "prLamC_buf2a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf2a", "role": "ce0" }} , 
 	{ "name": "prLamC_buf2a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf2a", "role": "we0" }} , 
 	{ "name": "prLamC_buf2a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf2a", "role": "d0" }} , 
 	{ "name": "prLamC_buf2b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf2b", "role": "address0" }} , 
 	{ "name": "prLamC_buf2b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf2b", "role": "ce0" }} , 
 	{ "name": "prLamC_buf2b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf2b", "role": "we0" }} , 
 	{ "name": "prLamC_buf2b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf2b", "role": "d0" }} , 
 	{ "name": "prLam2_buf2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2_buf2", "role": "address0" }} , 
 	{ "name": "prLam2_buf2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2_buf2", "role": "ce0" }} , 
 	{ "name": "prLam2_buf2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2_buf2", "role": "we0" }} , 
 	{ "name": "prLam2_buf2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2_buf2", "role": "d0" }} , 
 	{ "name": "prLam2B_buf2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf2", "role": "address0" }} , 
 	{ "name": "prLam2B_buf2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf2", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf2", "role": "we0" }} , 
 	{ "name": "prLam2B_buf2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf2", "role": "d0" }} , 
 	{ "name": "prLam2C_buf2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf2", "role": "address0" }} , 
 	{ "name": "prLam2C_buf2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf2", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf2", "role": "we0" }} , 
 	{ "name": "prLam2C_buf2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf2", "role": "d0" }} , 
 	{ "name": "prLam2C_buf2a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf2a", "role": "address0" }} , 
 	{ "name": "prLam2C_buf2a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf2a", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf2a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf2a", "role": "we0" }} , 
 	{ "name": "prLam2C_buf2a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf2a", "role": "d0" }} , 
 	{ "name": "prLam2C_buf2b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf2b", "role": "address0" }} , 
 	{ "name": "prLam2C_buf2b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf2b", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf2b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf2b", "role": "we0" }} , 
 	{ "name": "prLam2C_buf2b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf2b", "role": "d0" }} , 
 	{ "name": "pest3", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pest3", "role": "default" }} , 
 	{ "name": "Lam_bufA3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA3", "role": "address0" }} , 
 	{ "name": "Lam_bufA3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA3", "role": "ce0" }} , 
 	{ "name": "Lam_bufA3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA3", "role": "we0" }} , 
 	{ "name": "Lam_bufA3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA3", "role": "d0" }} , 
 	{ "name": "Lam_bufB3a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB3a", "role": "address0" }} , 
 	{ "name": "Lam_bufB3a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB3a", "role": "ce0" }} , 
 	{ "name": "Lam_bufB3a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB3a", "role": "we0" }} , 
 	{ "name": "Lam_bufB3a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB3a", "role": "d0" }} , 
 	{ "name": "Lam_bufB3b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB3b", "role": "address0" }} , 
 	{ "name": "Lam_bufB3b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB3b", "role": "ce0" }} , 
 	{ "name": "Lam_bufB3b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB3b", "role": "we0" }} , 
 	{ "name": "Lam_bufB3b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB3b", "role": "d0" }} , 
 	{ "name": "Lam_bufB3c_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB3c", "role": "address0" }} , 
 	{ "name": "Lam_bufB3c_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB3c", "role": "ce0" }} , 
 	{ "name": "Lam_bufB3c_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB3c", "role": "we0" }} , 
 	{ "name": "Lam_bufB3c_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB3c", "role": "d0" }} , 
 	{ "name": "prLamB_buf3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf3", "role": "address0" }} , 
 	{ "name": "prLamB_buf3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf3", "role": "ce0" }} , 
 	{ "name": "prLamB_buf3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf3", "role": "we0" }} , 
 	{ "name": "prLamB_buf3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf3", "role": "d0" }} , 
 	{ "name": "prLamB_buf3a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf3a", "role": "address0" }} , 
 	{ "name": "prLamB_buf3a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf3a", "role": "ce0" }} , 
 	{ "name": "prLamB_buf3a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf3a", "role": "we0" }} , 
 	{ "name": "prLamB_buf3a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf3a", "role": "d0" }} , 
 	{ "name": "prLamB_buf3b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf3b", "role": "address0" }} , 
 	{ "name": "prLamB_buf3b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf3b", "role": "ce0" }} , 
 	{ "name": "prLamB_buf3b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf3b", "role": "we0" }} , 
 	{ "name": "prLamB_buf3b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf3b", "role": "d0" }} , 
 	{ "name": "prLamC_buf3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf3", "role": "address0" }} , 
 	{ "name": "prLamC_buf3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf3", "role": "ce0" }} , 
 	{ "name": "prLamC_buf3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf3", "role": "we0" }} , 
 	{ "name": "prLamC_buf3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf3", "role": "d0" }} , 
 	{ "name": "prLam2B_buf3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf3", "role": "address0" }} , 
 	{ "name": "prLam2B_buf3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf3", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf3", "role": "we0" }} , 
 	{ "name": "prLam2B_buf3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf3", "role": "d0" }} , 
 	{ "name": "prLam2B_buf3a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf3a", "role": "address0" }} , 
 	{ "name": "prLam2B_buf3a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf3a", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf3a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf3a", "role": "we0" }} , 
 	{ "name": "prLam2B_buf3a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf3a", "role": "d0" }} , 
 	{ "name": "prLam2B_buf3b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf3b", "role": "address0" }} , 
 	{ "name": "prLam2B_buf3b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf3b", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf3b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf3b", "role": "we0" }} , 
 	{ "name": "prLam2B_buf3b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf3b", "role": "d0" }} , 
 	{ "name": "prLam2C_buf3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf3", "role": "address0" }} , 
 	{ "name": "prLam2C_buf3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf3", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf3", "role": "we0" }} , 
 	{ "name": "prLam2C_buf3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf3", "role": "d0" }} , 
 	{ "name": "pest4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pest4", "role": "default" }} , 
 	{ "name": "Lam_buf4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf4", "role": "address0" }} , 
 	{ "name": "Lam_buf4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf4", "role": "ce0" }} , 
 	{ "name": "Lam_buf4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf4", "role": "we0" }} , 
 	{ "name": "Lam_buf4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf4", "role": "d0" }} , 
 	{ "name": "Lam_bufA4a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA4a", "role": "address0" }} , 
 	{ "name": "Lam_bufA4a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA4a", "role": "ce0" }} , 
 	{ "name": "Lam_bufA4a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA4a", "role": "we0" }} , 
 	{ "name": "Lam_bufA4a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA4a", "role": "d0" }} , 
 	{ "name": "Lam_bufA4b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA4b", "role": "address0" }} , 
 	{ "name": "Lam_bufA4b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA4b", "role": "ce0" }} , 
 	{ "name": "Lam_bufA4b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA4b", "role": "we0" }} , 
 	{ "name": "Lam_bufA4b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA4b", "role": "d0" }} , 
 	{ "name": "Lam_bufA4c_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA4c", "role": "address0" }} , 
 	{ "name": "Lam_bufA4c_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA4c", "role": "ce0" }} , 
 	{ "name": "Lam_bufA4c_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA4c", "role": "we0" }} , 
 	{ "name": "Lam_bufA4c_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA4c", "role": "d0" }} , 
 	{ "name": "Lam_bufB4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB4", "role": "address0" }} , 
 	{ "name": "Lam_bufB4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB4", "role": "ce0" }} , 
 	{ "name": "Lam_bufB4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB4", "role": "we0" }} , 
 	{ "name": "Lam_bufB4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB4", "role": "d0" }} , 
 	{ "name": "prLamB_buf4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf4", "role": "address0" }} , 
 	{ "name": "prLamB_buf4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf4", "role": "ce0" }} , 
 	{ "name": "prLamB_buf4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf4", "role": "we0" }} , 
 	{ "name": "prLamB_buf4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf4", "role": "d0" }} , 
 	{ "name": "prLamC_buf4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf4", "role": "address0" }} , 
 	{ "name": "prLamC_buf4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf4", "role": "ce0" }} , 
 	{ "name": "prLamC_buf4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf4", "role": "we0" }} , 
 	{ "name": "prLamC_buf4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf4", "role": "d0" }} , 
 	{ "name": "prLamC_buf4a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf4a", "role": "address0" }} , 
 	{ "name": "prLamC_buf4a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf4a", "role": "ce0" }} , 
 	{ "name": "prLamC_buf4a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf4a", "role": "we0" }} , 
 	{ "name": "prLamC_buf4a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf4a", "role": "d0" }} , 
 	{ "name": "prLamC_buf4b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf4b", "role": "address0" }} , 
 	{ "name": "prLamC_buf4b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf4b", "role": "ce0" }} , 
 	{ "name": "prLamC_buf4b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf4b", "role": "we0" }} , 
 	{ "name": "prLamC_buf4b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf4b", "role": "d0" }} , 
 	{ "name": "prLam2B_buf4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf4", "role": "address0" }} , 
 	{ "name": "prLam2B_buf4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf4", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf4", "role": "we0" }} , 
 	{ "name": "prLam2B_buf4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf4", "role": "d0" }} , 
 	{ "name": "prLam2C_buf4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf4", "role": "address0" }} , 
 	{ "name": "prLam2C_buf4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf4", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf4", "role": "we0" }} , 
 	{ "name": "prLam2C_buf4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf4", "role": "d0" }} , 
 	{ "name": "prLam2C_buf4a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf4a", "role": "address0" }} , 
 	{ "name": "prLam2C_buf4a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf4a", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf4a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf4a", "role": "we0" }} , 
 	{ "name": "prLam2C_buf4a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf4a", "role": "d0" }} , 
 	{ "name": "prLam2C_buf4b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf4b", "role": "address0" }} , 
 	{ "name": "prLam2C_buf4b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf4b", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf4b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf4b", "role": "we0" }} , 
 	{ "name": "prLam2C_buf4b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf4b", "role": "d0" }} , 
 	{ "name": "pest5", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pest5", "role": "default" }} , 
 	{ "name": "Lam_bufA5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA5", "role": "address0" }} , 
 	{ "name": "Lam_bufA5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA5", "role": "ce0" }} , 
 	{ "name": "Lam_bufA5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA5", "role": "we0" }} , 
 	{ "name": "Lam_bufA5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA5", "role": "d0" }} , 
 	{ "name": "Lam_bufB5a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB5a", "role": "address0" }} , 
 	{ "name": "Lam_bufB5a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB5a", "role": "ce0" }} , 
 	{ "name": "Lam_bufB5a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB5a", "role": "we0" }} , 
 	{ "name": "Lam_bufB5a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB5a", "role": "d0" }} , 
 	{ "name": "Lam_bufB5b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB5b", "role": "address0" }} , 
 	{ "name": "Lam_bufB5b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB5b", "role": "ce0" }} , 
 	{ "name": "Lam_bufB5b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB5b", "role": "we0" }} , 
 	{ "name": "Lam_bufB5b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB5b", "role": "d0" }} , 
 	{ "name": "Lam_bufB5c_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB5c", "role": "address0" }} , 
 	{ "name": "Lam_bufB5c_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB5c", "role": "ce0" }} , 
 	{ "name": "Lam_bufB5c_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB5c", "role": "we0" }} , 
 	{ "name": "Lam_bufB5c_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB5c", "role": "d0" }} , 
 	{ "name": "prLamB_buf5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf5", "role": "address0" }} , 
 	{ "name": "prLamB_buf5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf5", "role": "ce0" }} , 
 	{ "name": "prLamB_buf5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf5", "role": "we0" }} , 
 	{ "name": "prLamB_buf5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf5", "role": "d0" }} , 
 	{ "name": "prLamB_buf5a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf5a", "role": "address0" }} , 
 	{ "name": "prLamB_buf5a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf5a", "role": "ce0" }} , 
 	{ "name": "prLamB_buf5a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf5a", "role": "we0" }} , 
 	{ "name": "prLamB_buf5a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf5a", "role": "d0" }} , 
 	{ "name": "prLamB_buf5b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf5b", "role": "address0" }} , 
 	{ "name": "prLamB_buf5b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf5b", "role": "ce0" }} , 
 	{ "name": "prLamB_buf5b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf5b", "role": "we0" }} , 
 	{ "name": "prLamB_buf5b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf5b", "role": "d0" }} , 
 	{ "name": "prLamC_buf5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf5", "role": "address0" }} , 
 	{ "name": "prLamC_buf5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf5", "role": "ce0" }} , 
 	{ "name": "prLamC_buf5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf5", "role": "we0" }} , 
 	{ "name": "prLamC_buf5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf5", "role": "d0" }} , 
 	{ "name": "prLam2B_buf5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf5", "role": "address0" }} , 
 	{ "name": "prLam2B_buf5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf5", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf5", "role": "we0" }} , 
 	{ "name": "prLam2B_buf5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf5", "role": "d0" }} , 
 	{ "name": "prLam2B_buf5a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf5a", "role": "address0" }} , 
 	{ "name": "prLam2B_buf5a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf5a", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf5a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf5a", "role": "we0" }} , 
 	{ "name": "prLam2B_buf5a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf5a", "role": "d0" }} , 
 	{ "name": "prLam2B_buf5b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf5b", "role": "address0" }} , 
 	{ "name": "prLam2B_buf5b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf5b", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf5b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf5b", "role": "we0" }} , 
 	{ "name": "prLam2B_buf5b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf5b", "role": "d0" }} , 
 	{ "name": "prLam2C_buf5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf5", "role": "address0" }} , 
 	{ "name": "prLam2C_buf5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf5", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf5", "role": "we0" }} , 
 	{ "name": "prLam2C_buf5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf5", "role": "d0" }} , 
 	{ "name": "pest6", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pest6", "role": "default" }} , 
 	{ "name": "Lam_buf6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf6", "role": "address0" }} , 
 	{ "name": "Lam_buf6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf6", "role": "ce0" }} , 
 	{ "name": "Lam_buf6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf6", "role": "we0" }} , 
 	{ "name": "Lam_buf6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf6", "role": "d0" }} , 
 	{ "name": "Lam_buf6a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf6a", "role": "address0" }} , 
 	{ "name": "Lam_buf6a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf6a", "role": "ce0" }} , 
 	{ "name": "Lam_buf6a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf6a", "role": "we0" }} , 
 	{ "name": "Lam_buf6a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf6a", "role": "d0" }} , 
 	{ "name": "Lam_bufA6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA6", "role": "address0" }} , 
 	{ "name": "Lam_bufA6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA6", "role": "ce0" }} , 
 	{ "name": "Lam_bufA6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA6", "role": "we0" }} , 
 	{ "name": "Lam_bufA6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA6", "role": "d0" }} , 
 	{ "name": "Lam_bufA6b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA6b", "role": "address0" }} , 
 	{ "name": "Lam_bufA6b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA6b", "role": "ce0" }} , 
 	{ "name": "Lam_bufA6b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA6b", "role": "we0" }} , 
 	{ "name": "Lam_bufA6b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA6b", "role": "d0" }} , 
 	{ "name": "Lam_bufA6c_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA6c", "role": "address0" }} , 
 	{ "name": "Lam_bufA6c_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA6c", "role": "ce0" }} , 
 	{ "name": "Lam_bufA6c_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA6c", "role": "we0" }} , 
 	{ "name": "Lam_bufA6c_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA6c", "role": "d0" }} , 
 	{ "name": "Lam_bufB6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB6", "role": "address0" }} , 
 	{ "name": "Lam_bufB6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB6", "role": "ce0" }} , 
 	{ "name": "Lam_bufB6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB6", "role": "we0" }} , 
 	{ "name": "Lam_bufB6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB6", "role": "d0" }} , 
 	{ "name": "prLamB_buf6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf6", "role": "address0" }} , 
 	{ "name": "prLamB_buf6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf6", "role": "ce0" }} , 
 	{ "name": "prLamB_buf6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf6", "role": "we0" }} , 
 	{ "name": "prLamB_buf6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf6", "role": "d0" }} , 
 	{ "name": "prLamC_buf6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf6", "role": "address0" }} , 
 	{ "name": "prLamC_buf6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf6", "role": "ce0" }} , 
 	{ "name": "prLamC_buf6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf6", "role": "we0" }} , 
 	{ "name": "prLamC_buf6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf6", "role": "d0" }} , 
 	{ "name": "prLam2B_buf6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf6", "role": "address0" }} , 
 	{ "name": "prLam2B_buf6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf6", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf6", "role": "we0" }} , 
 	{ "name": "prLam2B_buf6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf6", "role": "d0" }} , 
 	{ "name": "prLam2C_buf6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf6", "role": "address0" }} , 
 	{ "name": "prLam2C_buf6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf6", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf6", "role": "we0" }} , 
 	{ "name": "prLam2C_buf6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf6", "role": "d0" }} , 
 	{ "name": "pest7", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pest7", "role": "default" }} , 
 	{ "name": "Lam_bufA7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA7", "role": "address0" }} , 
 	{ "name": "Lam_bufA7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA7", "role": "ce0" }} , 
 	{ "name": "Lam_bufA7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA7", "role": "we0" }} , 
 	{ "name": "Lam_bufA7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA7", "role": "d0" }} , 
 	{ "name": "Lam_bufB7a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB7a", "role": "address0" }} , 
 	{ "name": "Lam_bufB7a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB7a", "role": "ce0" }} , 
 	{ "name": "Lam_bufB7a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB7a", "role": "we0" }} , 
 	{ "name": "Lam_bufB7a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB7a", "role": "d0" }} , 
 	{ "name": "Lam_bufB7b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB7b", "role": "address0" }} , 
 	{ "name": "Lam_bufB7b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB7b", "role": "ce0" }} , 
 	{ "name": "Lam_bufB7b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB7b", "role": "we0" }} , 
 	{ "name": "Lam_bufB7b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB7b", "role": "d0" }} , 
 	{ "name": "prLamB_buf7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf7", "role": "address0" }} , 
 	{ "name": "prLamB_buf7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf7", "role": "ce0" }} , 
 	{ "name": "prLamB_buf7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf7", "role": "we0" }} , 
 	{ "name": "prLamB_buf7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf7", "role": "d0" }} , 
 	{ "name": "prLamB_buf7a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf7a", "role": "address0" }} , 
 	{ "name": "prLamB_buf7a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf7a", "role": "ce0" }} , 
 	{ "name": "prLamB_buf7a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf7a", "role": "we0" }} , 
 	{ "name": "prLamB_buf7a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf7a", "role": "d0" }} , 
 	{ "name": "prLamC_buf7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf7", "role": "address0" }} , 
 	{ "name": "prLamC_buf7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf7", "role": "ce0" }} , 
 	{ "name": "prLamC_buf7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf7", "role": "we0" }} , 
 	{ "name": "prLamC_buf7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf7", "role": "d0" }} , 
 	{ "name": "prLam2B_buf7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf7", "role": "address0" }} , 
 	{ "name": "prLam2B_buf7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf7", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf7", "role": "we0" }} , 
 	{ "name": "prLam2B_buf7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf7", "role": "d0" }} , 
 	{ "name": "prLam2B_buf7a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf7a", "role": "address0" }} , 
 	{ "name": "prLam2B_buf7a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf7a", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf7a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf7a", "role": "we0" }} , 
 	{ "name": "prLam2B_buf7a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf7a", "role": "d0" }} , 
 	{ "name": "prLam2C_buf7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf7", "role": "address0" }} , 
 	{ "name": "prLam2C_buf7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf7", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf7", "role": "we0" }} , 
 	{ "name": "prLam2C_buf7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf7", "role": "d0" }} , 
 	{ "name": "pest8", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pest8", "role": "default" }} , 
 	{ "name": "Lam_buf8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf8", "role": "address0" }} , 
 	{ "name": "Lam_buf8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf8", "role": "ce0" }} , 
 	{ "name": "Lam_buf8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf8", "role": "we0" }} , 
 	{ "name": "Lam_buf8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf8", "role": "d0" }} , 
 	{ "name": "pest9", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pest9", "role": "default" }} , 
 	{ "name": "Lam_bufA9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA9", "role": "address0" }} , 
 	{ "name": "Lam_bufA9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA9", "role": "ce0" }} , 
 	{ "name": "Lam_bufA9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA9", "role": "we0" }} , 
 	{ "name": "Lam_bufA9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA9", "role": "d0" }} , 
 	{ "name": "Lam_bufB9a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB9a", "role": "address0" }} , 
 	{ "name": "Lam_bufB9a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB9a", "role": "ce0" }} , 
 	{ "name": "Lam_bufB9a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB9a", "role": "we0" }} , 
 	{ "name": "Lam_bufB9a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB9a", "role": "d0" }} , 
 	{ "name": "Lam_bufB9b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB9b", "role": "address0" }} , 
 	{ "name": "Lam_bufB9b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB9b", "role": "ce0" }} , 
 	{ "name": "Lam_bufB9b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB9b", "role": "we0" }} , 
 	{ "name": "Lam_bufB9b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB9b", "role": "d0" }} , 
 	{ "name": "prLamB_buf9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf9", "role": "address0" }} , 
 	{ "name": "prLamB_buf9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf9", "role": "ce0" }} , 
 	{ "name": "prLamB_buf9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf9", "role": "we0" }} , 
 	{ "name": "prLamB_buf9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf9", "role": "d0" }} , 
 	{ "name": "prLamB_buf9a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf9a", "role": "address0" }} , 
 	{ "name": "prLamB_buf9a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf9a", "role": "ce0" }} , 
 	{ "name": "prLamB_buf9a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf9a", "role": "we0" }} , 
 	{ "name": "prLamB_buf9a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf9a", "role": "d0" }} , 
 	{ "name": "prLamC_buf9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf9", "role": "address0" }} , 
 	{ "name": "prLamC_buf9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf9", "role": "ce0" }} , 
 	{ "name": "prLamC_buf9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf9", "role": "we0" }} , 
 	{ "name": "prLamC_buf9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf9", "role": "d0" }} , 
 	{ "name": "prLam2B_buf9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf9", "role": "address0" }} , 
 	{ "name": "prLam2B_buf9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf9", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf9", "role": "we0" }} , 
 	{ "name": "prLam2B_buf9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf9", "role": "d0" }} , 
 	{ "name": "prLam2B_buf9a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf9a", "role": "address0" }} , 
 	{ "name": "prLam2B_buf9a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf9a", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf9a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf9a", "role": "we0" }} , 
 	{ "name": "prLam2B_buf9a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf9a", "role": "d0" }} , 
 	{ "name": "prLam2C_buf9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf9", "role": "address0" }} , 
 	{ "name": "prLam2C_buf9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf9", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf9", "role": "we0" }} , 
 	{ "name": "prLam2C_buf9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf9", "role": "d0" }} , 
 	{ "name": "pest10", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pest10", "role": "default" }} , 
 	{ "name": "Lam_buf10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf10", "role": "address0" }} , 
 	{ "name": "Lam_buf10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf10", "role": "ce0" }} , 
 	{ "name": "Lam_buf10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf10", "role": "we0" }} , 
 	{ "name": "Lam_buf10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf10", "role": "d0" }} , 
 	{ "name": "Lam_buf10a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf10a", "role": "address0" }} , 
 	{ "name": "Lam_buf10a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf10a", "role": "ce0" }} , 
 	{ "name": "Lam_buf10a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf10a", "role": "we0" }} , 
 	{ "name": "Lam_buf10a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf10a", "role": "d0" }} , 
 	{ "name": "Lam_bufA10a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA10a", "role": "address0" }} , 
 	{ "name": "Lam_bufA10a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA10a", "role": "ce0" }} , 
 	{ "name": "Lam_bufA10a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA10a", "role": "we0" }} , 
 	{ "name": "Lam_bufA10a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA10a", "role": "d0" }} , 
 	{ "name": "Lam_bufA10b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA10b", "role": "address0" }} , 
 	{ "name": "Lam_bufA10b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA10b", "role": "ce0" }} , 
 	{ "name": "Lam_bufA10b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA10b", "role": "we0" }} , 
 	{ "name": "Lam_bufA10b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA10b", "role": "d0" }} , 
 	{ "name": "Lam_bufA10c_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA10c", "role": "address0" }} , 
 	{ "name": "Lam_bufA10c_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA10c", "role": "ce0" }} , 
 	{ "name": "Lam_bufA10c_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA10c", "role": "we0" }} , 
 	{ "name": "Lam_bufA10c_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA10c", "role": "d0" }} , 
 	{ "name": "Lam_bufB10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB10", "role": "address0" }} , 
 	{ "name": "Lam_bufB10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB10", "role": "ce0" }} , 
 	{ "name": "Lam_bufB10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB10", "role": "we0" }} , 
 	{ "name": "Lam_bufB10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB10", "role": "d0" }} , 
 	{ "name": "prLam_buf4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam_buf4", "role": "address0" }} , 
 	{ "name": "prLam_buf4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam_buf4", "role": "ce0" }} , 
 	{ "name": "prLam_buf4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam_buf4", "role": "we0" }} , 
 	{ "name": "prLam_buf4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam_buf4", "role": "d0" }} , 
 	{ "name": "prLam_buf4a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam_buf4a", "role": "address0" }} , 
 	{ "name": "prLam_buf4a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam_buf4a", "role": "ce0" }} , 
 	{ "name": "prLam_buf4a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam_buf4a", "role": "we0" }} , 
 	{ "name": "prLam_buf4a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam_buf4a", "role": "d0" }} , 
 	{ "name": "prLamB_buf10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamB_buf10", "role": "address0" }} , 
 	{ "name": "prLamB_buf10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf10", "role": "ce0" }} , 
 	{ "name": "prLamB_buf10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamB_buf10", "role": "we0" }} , 
 	{ "name": "prLamB_buf10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamB_buf10", "role": "d0" }} , 
 	{ "name": "prLamC_buf10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf10", "role": "address0" }} , 
 	{ "name": "prLamC_buf10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf10", "role": "ce0" }} , 
 	{ "name": "prLamC_buf10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf10", "role": "we0" }} , 
 	{ "name": "prLamC_buf10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf10", "role": "d0" }} , 
 	{ "name": "prLamC_buf10a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf10a", "role": "address0" }} , 
 	{ "name": "prLamC_buf10a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf10a", "role": "ce0" }} , 
 	{ "name": "prLamC_buf10a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf10a", "role": "we0" }} , 
 	{ "name": "prLamC_buf10a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf10a", "role": "d0" }} , 
 	{ "name": "prLamC_buf10b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLamC_buf10b", "role": "address0" }} , 
 	{ "name": "prLamC_buf10b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf10b", "role": "ce0" }} , 
 	{ "name": "prLamC_buf10b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLamC_buf10b", "role": "we0" }} , 
 	{ "name": "prLamC_buf10b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLamC_buf10b", "role": "d0" }} , 
 	{ "name": "prLam2_buf4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2_buf4", "role": "address0" }} , 
 	{ "name": "prLam2_buf4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2_buf4", "role": "ce0" }} , 
 	{ "name": "prLam2_buf4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2_buf4", "role": "we0" }} , 
 	{ "name": "prLam2_buf4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2_buf4", "role": "d0" }} , 
 	{ "name": "prLam2_buf4a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2_buf4a", "role": "address0" }} , 
 	{ "name": "prLam2_buf4a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2_buf4a", "role": "ce0" }} , 
 	{ "name": "prLam2_buf4a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2_buf4a", "role": "we0" }} , 
 	{ "name": "prLam2_buf4a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2_buf4a", "role": "d0" }} , 
 	{ "name": "prLam2B_buf10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2B_buf10", "role": "address0" }} , 
 	{ "name": "prLam2B_buf10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf10", "role": "ce0" }} , 
 	{ "name": "prLam2B_buf10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2B_buf10", "role": "we0" }} , 
 	{ "name": "prLam2B_buf10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2B_buf10", "role": "d0" }} , 
 	{ "name": "prLam2C_buf10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf10", "role": "address0" }} , 
 	{ "name": "prLam2C_buf10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf10", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf10", "role": "we0" }} , 
 	{ "name": "prLam2C_buf10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf10", "role": "d0" }} , 
 	{ "name": "prLam2C_buf10a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf10a", "role": "address0" }} , 
 	{ "name": "prLam2C_buf10a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf10a", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf10a_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf10a", "role": "we0" }} , 
 	{ "name": "prLam2C_buf10a_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf10a", "role": "d0" }} , 
 	{ "name": "prLam2C_buf10b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prLam2C_buf10b", "role": "address0" }} , 
 	{ "name": "prLam2C_buf10b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf10b", "role": "ce0" }} , 
 	{ "name": "prLam2C_buf10b_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prLam2C_buf10b", "role": "we0" }} , 
 	{ "name": "prLam2C_buf10b_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "prLam2C_buf10b", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "update_lam_all",
		"VariableLatency" : "0",
		"AlignedPipeline" : "0",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "1",
		"ControlExist" : "0",
		"Port" : [
		{"Name" : "pos_r", "Type" : "None", "Direction" : "I"},
		{"Name" : "pest0", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_bufAa", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufAb", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufAc", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_bufa", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_bufb", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_bufa", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_bufb", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "pest1", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_bufA1", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB1a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB1b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB1c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf1", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf1a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf1b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf1", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf1", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf1a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf1b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf1", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "pest2", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_buf2", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufA2a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufA2b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufA2c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB2", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam_buf2", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf2", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf2", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf2a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf2b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2_buf2", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf2", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf2", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf2a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf2b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "pest3", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_bufA3", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB3a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB3b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB3c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf3", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf3a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf3b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf3", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf3", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf3a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf3b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf3", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "pest4", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_buf4", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufA4a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufA4b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufA4c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB4", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf4", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf4", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf4a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf4b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf4", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf4", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf4a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf4b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "pest5", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_bufA5", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB5a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB5b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB5c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf5", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf5a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf5b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf5", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf5", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf5a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf5b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf5", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "pest6", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_buf6", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_buf6a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufA6", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufA6b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufA6c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB6", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf6", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf6", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf6", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf6", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "pest7", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_bufA7", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB7a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB7b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf7", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf7a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf7", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf7", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf7a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf7", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "pest8", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_buf8", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "pest9", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_bufA9", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB9a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB9b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf9", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf9a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf9", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf9", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf9a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf9", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "pest10", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_buf10", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_buf10a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufA10a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufA10b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufA10c", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "Lam_bufB10", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam_buf4", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam_buf4a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamB_buf10", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf10", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf10a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLamC_buf10b", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2_buf4", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2_buf4a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2B_buf10", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf10", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf10a", "Type" : "Memory", "Direction" : "O"},
		{"Name" : "prLam2C_buf10b", "Type" : "Memory", "Direction" : "O"}]}]}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set Spec2ImplPortList { 
	pos_r { ap_none {  { pos_r in_data 0 13 } } }
	pest0 { ap_none {  { pest0 in_data 0 16 } } }
	Lam_bufAa { ap_memory {  { Lam_bufAa_address0 mem_address 1 10 }  { Lam_bufAa_ce0 mem_ce 1 1 }  { Lam_bufAa_we0 mem_we 1 1 }  { Lam_bufAa_d0 mem_din 1 16 } } }
	Lam_bufAb { ap_memory {  { Lam_bufAb_address0 mem_address 1 10 }  { Lam_bufAb_ce0 mem_ce 1 1 }  { Lam_bufAb_we0 mem_we 1 1 }  { Lam_bufAb_d0 mem_din 1 16 } } }
	Lam_bufAc { ap_memory {  { Lam_bufAc_address0 mem_address 1 10 }  { Lam_bufAc_ce0 mem_ce 1 1 }  { Lam_bufAc_we0 mem_we 1 1 }  { Lam_bufAc_d0 mem_din 1 16 } } }
	Lam_bufB { ap_memory {  { Lam_bufB_address0 mem_address 1 10 }  { Lam_bufB_ce0 mem_ce 1 1 }  { Lam_bufB_we0 mem_we 1 1 }  { Lam_bufB_d0 mem_din 1 16 } } }
	prLamB_buf { ap_memory {  { prLamB_buf_address0 mem_address 1 10 }  { prLamB_buf_ce0 mem_ce 1 1 }  { prLamB_buf_we0 mem_we 1 1 }  { prLamB_buf_d0 mem_din 1 16 } } }
	prLamC_buf { ap_memory {  { prLamC_buf_address0 mem_address 1 10 }  { prLamC_buf_ce0 mem_ce 1 1 }  { prLamC_buf_we0 mem_we 1 1 }  { prLamC_buf_d0 mem_din 1 16 } } }
	prLamC_bufa { ap_memory {  { prLamC_bufa_address0 mem_address 1 10 }  { prLamC_bufa_ce0 mem_ce 1 1 }  { prLamC_bufa_we0 mem_we 1 1 }  { prLamC_bufa_d0 mem_din 1 16 } } }
	prLamC_bufb { ap_memory {  { prLamC_bufb_address0 mem_address 1 10 }  { prLamC_bufb_ce0 mem_ce 1 1 }  { prLamC_bufb_we0 mem_we 1 1 }  { prLamC_bufb_d0 mem_din 1 16 } } }
	prLam2B_buf { ap_memory {  { prLam2B_buf_address0 mem_address 1 10 }  { prLam2B_buf_ce0 mem_ce 1 1 }  { prLam2B_buf_we0 mem_we 1 1 }  { prLam2B_buf_d0 mem_din 1 16 } } }
	prLam2C_buf { ap_memory {  { prLam2C_buf_address0 mem_address 1 10 }  { prLam2C_buf_ce0 mem_ce 1 1 }  { prLam2C_buf_we0 mem_we 1 1 }  { prLam2C_buf_d0 mem_din 1 16 } } }
	prLam2C_bufa { ap_memory {  { prLam2C_bufa_address0 mem_address 1 10 }  { prLam2C_bufa_ce0 mem_ce 1 1 }  { prLam2C_bufa_we0 mem_we 1 1 }  { prLam2C_bufa_d0 mem_din 1 16 } } }
	prLam2C_bufb { ap_memory {  { prLam2C_bufb_address0 mem_address 1 10 }  { prLam2C_bufb_ce0 mem_ce 1 1 }  { prLam2C_bufb_we0 mem_we 1 1 }  { prLam2C_bufb_d0 mem_din 1 16 } } }
	pest1 { ap_none {  { pest1 in_data 0 16 } } }
	Lam_bufA1 { ap_memory {  { Lam_bufA1_address0 mem_address 1 10 }  { Lam_bufA1_ce0 mem_ce 1 1 }  { Lam_bufA1_we0 mem_we 1 1 }  { Lam_bufA1_d0 mem_din 1 16 } } }
	Lam_bufB1a { ap_memory {  { Lam_bufB1a_address0 mem_address 1 10 }  { Lam_bufB1a_ce0 mem_ce 1 1 }  { Lam_bufB1a_we0 mem_we 1 1 }  { Lam_bufB1a_d0 mem_din 1 16 } } }
	Lam_bufB1b { ap_memory {  { Lam_bufB1b_address0 mem_address 1 10 }  { Lam_bufB1b_ce0 mem_ce 1 1 }  { Lam_bufB1b_we0 mem_we 1 1 }  { Lam_bufB1b_d0 mem_din 1 16 } } }
	Lam_bufB1c { ap_memory {  { Lam_bufB1c_address0 mem_address 1 10 }  { Lam_bufB1c_ce0 mem_ce 1 1 }  { Lam_bufB1c_we0 mem_we 1 1 }  { Lam_bufB1c_d0 mem_din 1 16 } } }
	prLamB_buf1 { ap_memory {  { prLamB_buf1_address0 mem_address 1 10 }  { prLamB_buf1_ce0 mem_ce 1 1 }  { prLamB_buf1_we0 mem_we 1 1 }  { prLamB_buf1_d0 mem_din 1 16 } } }
	prLamB_buf1a { ap_memory {  { prLamB_buf1a_address0 mem_address 1 10 }  { prLamB_buf1a_ce0 mem_ce 1 1 }  { prLamB_buf1a_we0 mem_we 1 1 }  { prLamB_buf1a_d0 mem_din 1 16 } } }
	prLamB_buf1b { ap_memory {  { prLamB_buf1b_address0 mem_address 1 10 }  { prLamB_buf1b_ce0 mem_ce 1 1 }  { prLamB_buf1b_we0 mem_we 1 1 }  { prLamB_buf1b_d0 mem_din 1 16 } } }
	prLamC_buf1 { ap_memory {  { prLamC_buf1_address0 mem_address 1 10 }  { prLamC_buf1_ce0 mem_ce 1 1 }  { prLamC_buf1_we0 mem_we 1 1 }  { prLamC_buf1_d0 mem_din 1 16 } } }
	prLam2B_buf1 { ap_memory {  { prLam2B_buf1_address0 mem_address 1 10 }  { prLam2B_buf1_ce0 mem_ce 1 1 }  { prLam2B_buf1_we0 mem_we 1 1 }  { prLam2B_buf1_d0 mem_din 1 16 } } }
	prLam2B_buf1a { ap_memory {  { prLam2B_buf1a_address0 mem_address 1 10 }  { prLam2B_buf1a_ce0 mem_ce 1 1 }  { prLam2B_buf1a_we0 mem_we 1 1 }  { prLam2B_buf1a_d0 mem_din 1 16 } } }
	prLam2B_buf1b { ap_memory {  { prLam2B_buf1b_address0 mem_address 1 10 }  { prLam2B_buf1b_ce0 mem_ce 1 1 }  { prLam2B_buf1b_we0 mem_we 1 1 }  { prLam2B_buf1b_d0 mem_din 1 16 } } }
	prLam2C_buf1 { ap_memory {  { prLam2C_buf1_address0 mem_address 1 10 }  { prLam2C_buf1_ce0 mem_ce 1 1 }  { prLam2C_buf1_we0 mem_we 1 1 }  { prLam2C_buf1_d0 mem_din 1 16 } } }
	pest2 { ap_none {  { pest2 in_data 0 16 } } }
	Lam_buf2 { ap_memory {  { Lam_buf2_address0 mem_address 1 10 }  { Lam_buf2_ce0 mem_ce 1 1 }  { Lam_buf2_we0 mem_we 1 1 }  { Lam_buf2_d0 mem_din 1 16 } } }
	Lam_bufA2a { ap_memory {  { Lam_bufA2a_address0 mem_address 1 10 }  { Lam_bufA2a_ce0 mem_ce 1 1 }  { Lam_bufA2a_we0 mem_we 1 1 }  { Lam_bufA2a_d0 mem_din 1 16 } } }
	Lam_bufA2b { ap_memory {  { Lam_bufA2b_address0 mem_address 1 10 }  { Lam_bufA2b_ce0 mem_ce 1 1 }  { Lam_bufA2b_we0 mem_we 1 1 }  { Lam_bufA2b_d0 mem_din 1 16 } } }
	Lam_bufA2c { ap_memory {  { Lam_bufA2c_address0 mem_address 1 10 }  { Lam_bufA2c_ce0 mem_ce 1 1 }  { Lam_bufA2c_we0 mem_we 1 1 }  { Lam_bufA2c_d0 mem_din 1 16 } } }
	Lam_bufB2 { ap_memory {  { Lam_bufB2_address0 mem_address 1 10 }  { Lam_bufB2_ce0 mem_ce 1 1 }  { Lam_bufB2_we0 mem_we 1 1 }  { Lam_bufB2_d0 mem_din 1 16 } } }
	prLam_buf2 { ap_memory {  { prLam_buf2_address0 mem_address 1 10 }  { prLam_buf2_ce0 mem_ce 1 1 }  { prLam_buf2_we0 mem_we 1 1 }  { prLam_buf2_d0 mem_din 1 16 } } }
	prLamB_buf2 { ap_memory {  { prLamB_buf2_address0 mem_address 1 10 }  { prLamB_buf2_ce0 mem_ce 1 1 }  { prLamB_buf2_we0 mem_we 1 1 }  { prLamB_buf2_d0 mem_din 1 16 } } }
	prLamC_buf2 { ap_memory {  { prLamC_buf2_address0 mem_address 1 10 }  { prLamC_buf2_ce0 mem_ce 1 1 }  { prLamC_buf2_we0 mem_we 1 1 }  { prLamC_buf2_d0 mem_din 1 16 } } }
	prLamC_buf2a { ap_memory {  { prLamC_buf2a_address0 mem_address 1 10 }  { prLamC_buf2a_ce0 mem_ce 1 1 }  { prLamC_buf2a_we0 mem_we 1 1 }  { prLamC_buf2a_d0 mem_din 1 16 } } }
	prLamC_buf2b { ap_memory {  { prLamC_buf2b_address0 mem_address 1 10 }  { prLamC_buf2b_ce0 mem_ce 1 1 }  { prLamC_buf2b_we0 mem_we 1 1 }  { prLamC_buf2b_d0 mem_din 1 16 } } }
	prLam2_buf2 { ap_memory {  { prLam2_buf2_address0 mem_address 1 10 }  { prLam2_buf2_ce0 mem_ce 1 1 }  { prLam2_buf2_we0 mem_we 1 1 }  { prLam2_buf2_d0 mem_din 1 16 } } }
	prLam2B_buf2 { ap_memory {  { prLam2B_buf2_address0 mem_address 1 10 }  { prLam2B_buf2_ce0 mem_ce 1 1 }  { prLam2B_buf2_we0 mem_we 1 1 }  { prLam2B_buf2_d0 mem_din 1 16 } } }
	prLam2C_buf2 { ap_memory {  { prLam2C_buf2_address0 mem_address 1 10 }  { prLam2C_buf2_ce0 mem_ce 1 1 }  { prLam2C_buf2_we0 mem_we 1 1 }  { prLam2C_buf2_d0 mem_din 1 16 } } }
	prLam2C_buf2a { ap_memory {  { prLam2C_buf2a_address0 mem_address 1 10 }  { prLam2C_buf2a_ce0 mem_ce 1 1 }  { prLam2C_buf2a_we0 mem_we 1 1 }  { prLam2C_buf2a_d0 mem_din 1 16 } } }
	prLam2C_buf2b { ap_memory {  { prLam2C_buf2b_address0 mem_address 1 10 }  { prLam2C_buf2b_ce0 mem_ce 1 1 }  { prLam2C_buf2b_we0 mem_we 1 1 }  { prLam2C_buf2b_d0 mem_din 1 16 } } }
	pest3 { ap_none {  { pest3 in_data 0 16 } } }
	Lam_bufA3 { ap_memory {  { Lam_bufA3_address0 mem_address 1 10 }  { Lam_bufA3_ce0 mem_ce 1 1 }  { Lam_bufA3_we0 mem_we 1 1 }  { Lam_bufA3_d0 mem_din 1 16 } } }
	Lam_bufB3a { ap_memory {  { Lam_bufB3a_address0 mem_address 1 10 }  { Lam_bufB3a_ce0 mem_ce 1 1 }  { Lam_bufB3a_we0 mem_we 1 1 }  { Lam_bufB3a_d0 mem_din 1 16 } } }
	Lam_bufB3b { ap_memory {  { Lam_bufB3b_address0 mem_address 1 10 }  { Lam_bufB3b_ce0 mem_ce 1 1 }  { Lam_bufB3b_we0 mem_we 1 1 }  { Lam_bufB3b_d0 mem_din 1 16 } } }
	Lam_bufB3c { ap_memory {  { Lam_bufB3c_address0 mem_address 1 10 }  { Lam_bufB3c_ce0 mem_ce 1 1 }  { Lam_bufB3c_we0 mem_we 1 1 }  { Lam_bufB3c_d0 mem_din 1 16 } } }
	prLamB_buf3 { ap_memory {  { prLamB_buf3_address0 mem_address 1 10 }  { prLamB_buf3_ce0 mem_ce 1 1 }  { prLamB_buf3_we0 mem_we 1 1 }  { prLamB_buf3_d0 mem_din 1 16 } } }
	prLamB_buf3a { ap_memory {  { prLamB_buf3a_address0 mem_address 1 10 }  { prLamB_buf3a_ce0 mem_ce 1 1 }  { prLamB_buf3a_we0 mem_we 1 1 }  { prLamB_buf3a_d0 mem_din 1 16 } } }
	prLamB_buf3b { ap_memory {  { prLamB_buf3b_address0 mem_address 1 10 }  { prLamB_buf3b_ce0 mem_ce 1 1 }  { prLamB_buf3b_we0 mem_we 1 1 }  { prLamB_buf3b_d0 mem_din 1 16 } } }
	prLamC_buf3 { ap_memory {  { prLamC_buf3_address0 mem_address 1 10 }  { prLamC_buf3_ce0 mem_ce 1 1 }  { prLamC_buf3_we0 mem_we 1 1 }  { prLamC_buf3_d0 mem_din 1 16 } } }
	prLam2B_buf3 { ap_memory {  { prLam2B_buf3_address0 mem_address 1 10 }  { prLam2B_buf3_ce0 mem_ce 1 1 }  { prLam2B_buf3_we0 mem_we 1 1 }  { prLam2B_buf3_d0 mem_din 1 16 } } }
	prLam2B_buf3a { ap_memory {  { prLam2B_buf3a_address0 mem_address 1 10 }  { prLam2B_buf3a_ce0 mem_ce 1 1 }  { prLam2B_buf3a_we0 mem_we 1 1 }  { prLam2B_buf3a_d0 mem_din 1 16 } } }
	prLam2B_buf3b { ap_memory {  { prLam2B_buf3b_address0 mem_address 1 10 }  { prLam2B_buf3b_ce0 mem_ce 1 1 }  { prLam2B_buf3b_we0 mem_we 1 1 }  { prLam2B_buf3b_d0 mem_din 1 16 } } }
	prLam2C_buf3 { ap_memory {  { prLam2C_buf3_address0 mem_address 1 10 }  { prLam2C_buf3_ce0 mem_ce 1 1 }  { prLam2C_buf3_we0 mem_we 1 1 }  { prLam2C_buf3_d0 mem_din 1 16 } } }
	pest4 { ap_none {  { pest4 in_data 0 16 } } }
	Lam_buf4 { ap_memory {  { Lam_buf4_address0 mem_address 1 10 }  { Lam_buf4_ce0 mem_ce 1 1 }  { Lam_buf4_we0 mem_we 1 1 }  { Lam_buf4_d0 mem_din 1 16 } } }
	Lam_bufA4a { ap_memory {  { Lam_bufA4a_address0 mem_address 1 10 }  { Lam_bufA4a_ce0 mem_ce 1 1 }  { Lam_bufA4a_we0 mem_we 1 1 }  { Lam_bufA4a_d0 mem_din 1 16 } } }
	Lam_bufA4b { ap_memory {  { Lam_bufA4b_address0 mem_address 1 10 }  { Lam_bufA4b_ce0 mem_ce 1 1 }  { Lam_bufA4b_we0 mem_we 1 1 }  { Lam_bufA4b_d0 mem_din 1 16 } } }
	Lam_bufA4c { ap_memory {  { Lam_bufA4c_address0 mem_address 1 10 }  { Lam_bufA4c_ce0 mem_ce 1 1 }  { Lam_bufA4c_we0 mem_we 1 1 }  { Lam_bufA4c_d0 mem_din 1 16 } } }
	Lam_bufB4 { ap_memory {  { Lam_bufB4_address0 mem_address 1 10 }  { Lam_bufB4_ce0 mem_ce 1 1 }  { Lam_bufB4_we0 mem_we 1 1 }  { Lam_bufB4_d0 mem_din 1 16 } } }
	prLamB_buf4 { ap_memory {  { prLamB_buf4_address0 mem_address 1 10 }  { prLamB_buf4_ce0 mem_ce 1 1 }  { prLamB_buf4_we0 mem_we 1 1 }  { prLamB_buf4_d0 mem_din 1 16 } } }
	prLamC_buf4 { ap_memory {  { prLamC_buf4_address0 mem_address 1 10 }  { prLamC_buf4_ce0 mem_ce 1 1 }  { prLamC_buf4_we0 mem_we 1 1 }  { prLamC_buf4_d0 mem_din 1 16 } } }
	prLamC_buf4a { ap_memory {  { prLamC_buf4a_address0 mem_address 1 10 }  { prLamC_buf4a_ce0 mem_ce 1 1 }  { prLamC_buf4a_we0 mem_we 1 1 }  { prLamC_buf4a_d0 mem_din 1 16 } } }
	prLamC_buf4b { ap_memory {  { prLamC_buf4b_address0 mem_address 1 10 }  { prLamC_buf4b_ce0 mem_ce 1 1 }  { prLamC_buf4b_we0 mem_we 1 1 }  { prLamC_buf4b_d0 mem_din 1 16 } } }
	prLam2B_buf4 { ap_memory {  { prLam2B_buf4_address0 mem_address 1 10 }  { prLam2B_buf4_ce0 mem_ce 1 1 }  { prLam2B_buf4_we0 mem_we 1 1 }  { prLam2B_buf4_d0 mem_din 1 16 } } }
	prLam2C_buf4 { ap_memory {  { prLam2C_buf4_address0 mem_address 1 10 }  { prLam2C_buf4_ce0 mem_ce 1 1 }  { prLam2C_buf4_we0 mem_we 1 1 }  { prLam2C_buf4_d0 mem_din 1 16 } } }
	prLam2C_buf4a { ap_memory {  { prLam2C_buf4a_address0 mem_address 1 10 }  { prLam2C_buf4a_ce0 mem_ce 1 1 }  { prLam2C_buf4a_we0 mem_we 1 1 }  { prLam2C_buf4a_d0 mem_din 1 16 } } }
	prLam2C_buf4b { ap_memory {  { prLam2C_buf4b_address0 mem_address 1 10 }  { prLam2C_buf4b_ce0 mem_ce 1 1 }  { prLam2C_buf4b_we0 mem_we 1 1 }  { prLam2C_buf4b_d0 mem_din 1 16 } } }
	pest5 { ap_none {  { pest5 in_data 0 16 } } }
	Lam_bufA5 { ap_memory {  { Lam_bufA5_address0 mem_address 1 10 }  { Lam_bufA5_ce0 mem_ce 1 1 }  { Lam_bufA5_we0 mem_we 1 1 }  { Lam_bufA5_d0 mem_din 1 16 } } }
	Lam_bufB5a { ap_memory {  { Lam_bufB5a_address0 mem_address 1 10 }  { Lam_bufB5a_ce0 mem_ce 1 1 }  { Lam_bufB5a_we0 mem_we 1 1 }  { Lam_bufB5a_d0 mem_din 1 16 } } }
	Lam_bufB5b { ap_memory {  { Lam_bufB5b_address0 mem_address 1 10 }  { Lam_bufB5b_ce0 mem_ce 1 1 }  { Lam_bufB5b_we0 mem_we 1 1 }  { Lam_bufB5b_d0 mem_din 1 16 } } }
	Lam_bufB5c { ap_memory {  { Lam_bufB5c_address0 mem_address 1 10 }  { Lam_bufB5c_ce0 mem_ce 1 1 }  { Lam_bufB5c_we0 mem_we 1 1 }  { Lam_bufB5c_d0 mem_din 1 16 } } }
	prLamB_buf5 { ap_memory {  { prLamB_buf5_address0 mem_address 1 10 }  { prLamB_buf5_ce0 mem_ce 1 1 }  { prLamB_buf5_we0 mem_we 1 1 }  { prLamB_buf5_d0 mem_din 1 16 } } }
	prLamB_buf5a { ap_memory {  { prLamB_buf5a_address0 mem_address 1 10 }  { prLamB_buf5a_ce0 mem_ce 1 1 }  { prLamB_buf5a_we0 mem_we 1 1 }  { prLamB_buf5a_d0 mem_din 1 16 } } }
	prLamB_buf5b { ap_memory {  { prLamB_buf5b_address0 mem_address 1 10 }  { prLamB_buf5b_ce0 mem_ce 1 1 }  { prLamB_buf5b_we0 mem_we 1 1 }  { prLamB_buf5b_d0 mem_din 1 16 } } }
	prLamC_buf5 { ap_memory {  { prLamC_buf5_address0 mem_address 1 10 }  { prLamC_buf5_ce0 mem_ce 1 1 }  { prLamC_buf5_we0 mem_we 1 1 }  { prLamC_buf5_d0 mem_din 1 16 } } }
	prLam2B_buf5 { ap_memory {  { prLam2B_buf5_address0 mem_address 1 10 }  { prLam2B_buf5_ce0 mem_ce 1 1 }  { prLam2B_buf5_we0 mem_we 1 1 }  { prLam2B_buf5_d0 mem_din 1 16 } } }
	prLam2B_buf5a { ap_memory {  { prLam2B_buf5a_address0 mem_address 1 10 }  { prLam2B_buf5a_ce0 mem_ce 1 1 }  { prLam2B_buf5a_we0 mem_we 1 1 }  { prLam2B_buf5a_d0 mem_din 1 16 } } }
	prLam2B_buf5b { ap_memory {  { prLam2B_buf5b_address0 mem_address 1 10 }  { prLam2B_buf5b_ce0 mem_ce 1 1 }  { prLam2B_buf5b_we0 mem_we 1 1 }  { prLam2B_buf5b_d0 mem_din 1 16 } } }
	prLam2C_buf5 { ap_memory {  { prLam2C_buf5_address0 mem_address 1 10 }  { prLam2C_buf5_ce0 mem_ce 1 1 }  { prLam2C_buf5_we0 mem_we 1 1 }  { prLam2C_buf5_d0 mem_din 1 16 } } }
	pest6 { ap_none {  { pest6 in_data 0 16 } } }
	Lam_buf6 { ap_memory {  { Lam_buf6_address0 mem_address 1 10 }  { Lam_buf6_ce0 mem_ce 1 1 }  { Lam_buf6_we0 mem_we 1 1 }  { Lam_buf6_d0 mem_din 1 16 } } }
	Lam_buf6a { ap_memory {  { Lam_buf6a_address0 mem_address 1 10 }  { Lam_buf6a_ce0 mem_ce 1 1 }  { Lam_buf6a_we0 mem_we 1 1 }  { Lam_buf6a_d0 mem_din 1 16 } } }
	Lam_bufA6 { ap_memory {  { Lam_bufA6_address0 mem_address 1 10 }  { Lam_bufA6_ce0 mem_ce 1 1 }  { Lam_bufA6_we0 mem_we 1 1 }  { Lam_bufA6_d0 mem_din 1 16 } } }
	Lam_bufA6b { ap_memory {  { Lam_bufA6b_address0 mem_address 1 10 }  { Lam_bufA6b_ce0 mem_ce 1 1 }  { Lam_bufA6b_we0 mem_we 1 1 }  { Lam_bufA6b_d0 mem_din 1 16 } } }
	Lam_bufA6c { ap_memory {  { Lam_bufA6c_address0 mem_address 1 10 }  { Lam_bufA6c_ce0 mem_ce 1 1 }  { Lam_bufA6c_we0 mem_we 1 1 }  { Lam_bufA6c_d0 mem_din 1 16 } } }
	Lam_bufB6 { ap_memory {  { Lam_bufB6_address0 mem_address 1 10 }  { Lam_bufB6_ce0 mem_ce 1 1 }  { Lam_bufB6_we0 mem_we 1 1 }  { Lam_bufB6_d0 mem_din 1 16 } } }
	prLamB_buf6 { ap_memory {  { prLamB_buf6_address0 mem_address 1 10 }  { prLamB_buf6_ce0 mem_ce 1 1 }  { prLamB_buf6_we0 mem_we 1 1 }  { prLamB_buf6_d0 mem_din 1 16 } } }
	prLamC_buf6 { ap_memory {  { prLamC_buf6_address0 mem_address 1 10 }  { prLamC_buf6_ce0 mem_ce 1 1 }  { prLamC_buf6_we0 mem_we 1 1 }  { prLamC_buf6_d0 mem_din 1 16 } } }
	prLam2B_buf6 { ap_memory {  { prLam2B_buf6_address0 mem_address 1 10 }  { prLam2B_buf6_ce0 mem_ce 1 1 }  { prLam2B_buf6_we0 mem_we 1 1 }  { prLam2B_buf6_d0 mem_din 1 16 } } }
	prLam2C_buf6 { ap_memory {  { prLam2C_buf6_address0 mem_address 1 10 }  { prLam2C_buf6_ce0 mem_ce 1 1 }  { prLam2C_buf6_we0 mem_we 1 1 }  { prLam2C_buf6_d0 mem_din 1 16 } } }
	pest7 { ap_none {  { pest7 in_data 0 16 } } }
	Lam_bufA7 { ap_memory {  { Lam_bufA7_address0 mem_address 1 10 }  { Lam_bufA7_ce0 mem_ce 1 1 }  { Lam_bufA7_we0 mem_we 1 1 }  { Lam_bufA7_d0 mem_din 1 16 } } }
	Lam_bufB7a { ap_memory {  { Lam_bufB7a_address0 mem_address 1 10 }  { Lam_bufB7a_ce0 mem_ce 1 1 }  { Lam_bufB7a_we0 mem_we 1 1 }  { Lam_bufB7a_d0 mem_din 1 16 } } }
	Lam_bufB7b { ap_memory {  { Lam_bufB7b_address0 mem_address 1 10 }  { Lam_bufB7b_ce0 mem_ce 1 1 }  { Lam_bufB7b_we0 mem_we 1 1 }  { Lam_bufB7b_d0 mem_din 1 16 } } }
	prLamB_buf7 { ap_memory {  { prLamB_buf7_address0 mem_address 1 10 }  { prLamB_buf7_ce0 mem_ce 1 1 }  { prLamB_buf7_we0 mem_we 1 1 }  { prLamB_buf7_d0 mem_din 1 16 } } }
	prLamB_buf7a { ap_memory {  { prLamB_buf7a_address0 mem_address 1 10 }  { prLamB_buf7a_ce0 mem_ce 1 1 }  { prLamB_buf7a_we0 mem_we 1 1 }  { prLamB_buf7a_d0 mem_din 1 16 } } }
	prLamC_buf7 { ap_memory {  { prLamC_buf7_address0 mem_address 1 10 }  { prLamC_buf7_ce0 mem_ce 1 1 }  { prLamC_buf7_we0 mem_we 1 1 }  { prLamC_buf7_d0 mem_din 1 16 } } }
	prLam2B_buf7 { ap_memory {  { prLam2B_buf7_address0 mem_address 1 10 }  { prLam2B_buf7_ce0 mem_ce 1 1 }  { prLam2B_buf7_we0 mem_we 1 1 }  { prLam2B_buf7_d0 mem_din 1 16 } } }
	prLam2B_buf7a { ap_memory {  { prLam2B_buf7a_address0 mem_address 1 10 }  { prLam2B_buf7a_ce0 mem_ce 1 1 }  { prLam2B_buf7a_we0 mem_we 1 1 }  { prLam2B_buf7a_d0 mem_din 1 16 } } }
	prLam2C_buf7 { ap_memory {  { prLam2C_buf7_address0 mem_address 1 10 }  { prLam2C_buf7_ce0 mem_ce 1 1 }  { prLam2C_buf7_we0 mem_we 1 1 }  { prLam2C_buf7_d0 mem_din 1 16 } } }
	pest8 { ap_none {  { pest8 in_data 0 16 } } }
	Lam_buf8 { ap_memory {  { Lam_buf8_address0 mem_address 1 10 }  { Lam_buf8_ce0 mem_ce 1 1 }  { Lam_buf8_we0 mem_we 1 1 }  { Lam_buf8_d0 mem_din 1 16 } } }
	pest9 { ap_none {  { pest9 in_data 0 16 } } }
	Lam_bufA9 { ap_memory {  { Lam_bufA9_address0 mem_address 1 10 }  { Lam_bufA9_ce0 mem_ce 1 1 }  { Lam_bufA9_we0 mem_we 1 1 }  { Lam_bufA9_d0 mem_din 1 16 } } }
	Lam_bufB9a { ap_memory {  { Lam_bufB9a_address0 mem_address 1 10 }  { Lam_bufB9a_ce0 mem_ce 1 1 }  { Lam_bufB9a_we0 mem_we 1 1 }  { Lam_bufB9a_d0 mem_din 1 16 } } }
	Lam_bufB9b { ap_memory {  { Lam_bufB9b_address0 mem_address 1 10 }  { Lam_bufB9b_ce0 mem_ce 1 1 }  { Lam_bufB9b_we0 mem_we 1 1 }  { Lam_bufB9b_d0 mem_din 1 16 } } }
	prLamB_buf9 { ap_memory {  { prLamB_buf9_address0 mem_address 1 10 }  { prLamB_buf9_ce0 mem_ce 1 1 }  { prLamB_buf9_we0 mem_we 1 1 }  { prLamB_buf9_d0 mem_din 1 16 } } }
	prLamB_buf9a { ap_memory {  { prLamB_buf9a_address0 mem_address 1 10 }  { prLamB_buf9a_ce0 mem_ce 1 1 }  { prLamB_buf9a_we0 mem_we 1 1 }  { prLamB_buf9a_d0 mem_din 1 16 } } }
	prLamC_buf9 { ap_memory {  { prLamC_buf9_address0 mem_address 1 10 }  { prLamC_buf9_ce0 mem_ce 1 1 }  { prLamC_buf9_we0 mem_we 1 1 }  { prLamC_buf9_d0 mem_din 1 16 } } }
	prLam2B_buf9 { ap_memory {  { prLam2B_buf9_address0 mem_address 1 10 }  { prLam2B_buf9_ce0 mem_ce 1 1 }  { prLam2B_buf9_we0 mem_we 1 1 }  { prLam2B_buf9_d0 mem_din 1 16 } } }
	prLam2B_buf9a { ap_memory {  { prLam2B_buf9a_address0 mem_address 1 10 }  { prLam2B_buf9a_ce0 mem_ce 1 1 }  { prLam2B_buf9a_we0 mem_we 1 1 }  { prLam2B_buf9a_d0 mem_din 1 16 } } }
	prLam2C_buf9 { ap_memory {  { prLam2C_buf9_address0 mem_address 1 10 }  { prLam2C_buf9_ce0 mem_ce 1 1 }  { prLam2C_buf9_we0 mem_we 1 1 }  { prLam2C_buf9_d0 mem_din 1 16 } } }
	pest10 { ap_none {  { pest10 in_data 0 16 } } }
	Lam_buf10 { ap_memory {  { Lam_buf10_address0 mem_address 1 10 }  { Lam_buf10_ce0 mem_ce 1 1 }  { Lam_buf10_we0 mem_we 1 1 }  { Lam_buf10_d0 mem_din 1 16 } } }
	Lam_buf10a { ap_memory {  { Lam_buf10a_address0 mem_address 1 10 }  { Lam_buf10a_ce0 mem_ce 1 1 }  { Lam_buf10a_we0 mem_we 1 1 }  { Lam_buf10a_d0 mem_din 1 16 } } }
	Lam_bufA10a { ap_memory {  { Lam_bufA10a_address0 mem_address 1 10 }  { Lam_bufA10a_ce0 mem_ce 1 1 }  { Lam_bufA10a_we0 mem_we 1 1 }  { Lam_bufA10a_d0 mem_din 1 16 } } }
	Lam_bufA10b { ap_memory {  { Lam_bufA10b_address0 mem_address 1 10 }  { Lam_bufA10b_ce0 mem_ce 1 1 }  { Lam_bufA10b_we0 mem_we 1 1 }  { Lam_bufA10b_d0 mem_din 1 16 } } }
	Lam_bufA10c { ap_memory {  { Lam_bufA10c_address0 mem_address 1 10 }  { Lam_bufA10c_ce0 mem_ce 1 1 }  { Lam_bufA10c_we0 mem_we 1 1 }  { Lam_bufA10c_d0 mem_din 1 16 } } }
	Lam_bufB10 { ap_memory {  { Lam_bufB10_address0 mem_address 1 10 }  { Lam_bufB10_ce0 mem_ce 1 1 }  { Lam_bufB10_we0 mem_we 1 1 }  { Lam_bufB10_d0 mem_din 1 16 } } }
	prLam_buf4 { ap_memory {  { prLam_buf4_address0 mem_address 1 10 }  { prLam_buf4_ce0 mem_ce 1 1 }  { prLam_buf4_we0 mem_we 1 1 }  { prLam_buf4_d0 mem_din 1 16 } } }
	prLam_buf4a { ap_memory {  { prLam_buf4a_address0 mem_address 1 10 }  { prLam_buf4a_ce0 mem_ce 1 1 }  { prLam_buf4a_we0 mem_we 1 1 }  { prLam_buf4a_d0 mem_din 1 16 } } }
	prLamB_buf10 { ap_memory {  { prLamB_buf10_address0 mem_address 1 10 }  { prLamB_buf10_ce0 mem_ce 1 1 }  { prLamB_buf10_we0 mem_we 1 1 }  { prLamB_buf10_d0 mem_din 1 16 } } }
	prLamC_buf10 { ap_memory {  { prLamC_buf10_address0 mem_address 1 10 }  { prLamC_buf10_ce0 mem_ce 1 1 }  { prLamC_buf10_we0 mem_we 1 1 }  { prLamC_buf10_d0 mem_din 1 16 } } }
	prLamC_buf10a { ap_memory {  { prLamC_buf10a_address0 mem_address 1 10 }  { prLamC_buf10a_ce0 mem_ce 1 1 }  { prLamC_buf10a_we0 mem_we 1 1 }  { prLamC_buf10a_d0 mem_din 1 16 } } }
	prLamC_buf10b { ap_memory {  { prLamC_buf10b_address0 mem_address 1 10 }  { prLamC_buf10b_ce0 mem_ce 1 1 }  { prLamC_buf10b_we0 mem_we 1 1 }  { prLamC_buf10b_d0 mem_din 1 16 } } }
	prLam2_buf4 { ap_memory {  { prLam2_buf4_address0 mem_address 1 10 }  { prLam2_buf4_ce0 mem_ce 1 1 }  { prLam2_buf4_we0 mem_we 1 1 }  { prLam2_buf4_d0 mem_din 1 16 } } }
	prLam2_buf4a { ap_memory {  { prLam2_buf4a_address0 mem_address 1 10 }  { prLam2_buf4a_ce0 mem_ce 1 1 }  { prLam2_buf4a_we0 mem_we 1 1 }  { prLam2_buf4a_d0 mem_din 1 16 } } }
	prLam2B_buf10 { ap_memory {  { prLam2B_buf10_address0 mem_address 1 10 }  { prLam2B_buf10_ce0 mem_ce 1 1 }  { prLam2B_buf10_we0 mem_we 1 1 }  { prLam2B_buf10_d0 mem_din 1 16 } } }
	prLam2C_buf10 { ap_memory {  { prLam2C_buf10_address0 mem_address 1 10 }  { prLam2C_buf10_ce0 mem_ce 1 1 }  { prLam2C_buf10_we0 mem_we 1 1 }  { prLam2C_buf10_d0 mem_din 1 16 } } }
	prLam2C_buf10a { ap_memory {  { prLam2C_buf10a_address0 mem_address 1 10 }  { prLam2C_buf10a_ce0 mem_ce 1 1 }  { prLam2C_buf10a_we0 mem_we 1 1 }  { prLam2C_buf10a_d0 mem_din 1 16 } } }
	prLam2C_buf10b { ap_memory {  { prLam2C_buf10b_address0 mem_address 1 10 }  { prLam2C_buf10b_ce0 mem_ce 1 1 }  { prLam2C_buf10b_we0 mem_we 1 1 }  { prLam2C_buf10b_d0 mem_din 1 16 } } }
}
