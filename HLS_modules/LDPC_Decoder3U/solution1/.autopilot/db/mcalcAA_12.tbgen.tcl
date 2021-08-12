set moduleName mcalcAA_12
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {mcalcAA_12}
set C_modelType { int 1440 }
set C_modelArgList {
	{ num_nt int 16 regular  }
	{ num_ntA int 16 regular  }
	{ num_ntB int 16 regular  }
	{ numb int 16 regular {pointer 0} {global 0}  }
	{ Lam_buf2 int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_buf8 int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_buf4 int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_buf6 int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_buf4a int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_buf6a int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ SpEtaPrev int 32 regular {array 2048 { 1 3 } 1 1 } {global 0}  }
	{ SpEtaPrevC int 32 regular {array 2048 { 1 3 } 1 1 } {global 0}  }
	{ Lam_bufAa int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufAb int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufA1 int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufAc int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufA3 int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufA2a int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufA4a int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufA6 int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufA4b int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufA6b int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufA4c int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufA6c int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ SpEtaPrevA int 16 regular {array 2048 { 1 3 } 1 1 } {global 0}  }
	{ SpEtaPrevAa int 32 regular {array 2048 { 1 3 } 1 1 } {global 0}  }
	{ SpEtaPrevD int 16 regular {array 2048 { 1 3 } 1 1 } {global 0}  }
	{ SpEtaPrevDa int 32 regular {array 2048 { 1 3 } 1 1 } {global 0}  }
	{ Lam_bufB int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufB6 int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufB1a int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufB7a int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufB1b int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufB7b int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufB3a int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufB9a int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufB3b int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufB9b int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufB4 int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ Lam_bufB10 int 16 regular {array 1024 { 1 1 } 1 1 } {global 0}  }
	{ SpEtaPrevB int 16 regular {array 2048 { 1 3 } 1 1 } {global 0}  }
	{ SpEtaPrevBa int 32 regular {array 2048 { 1 3 } 1 1 } {global 0}  }
	{ SpEtaPrevE int 16 regular {array 2048 { 1 3 } 1 1 } {global 0}  }
	{ SpEtaPrevEa int 32 regular {array 2048 { 1 3 } 1 1 } {global 0}  }
	{ nIterationCounter int 16 regular {pointer 0} {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "num_nt", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "num_ntA", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "num_ntB", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "numb", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "numb","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf2", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf2","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf8", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf8","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf4", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf4","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf6", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf6","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf4a", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf4a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_buf6a", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_buf6a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "SpEtaPrev", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "SpEtaPrevC", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "Lam_bufAa", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufAa","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufAb", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufAb","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA1","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufAc", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufAc","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA3", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA3","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA2a", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA2a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA4a", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA4a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA6", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA6","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA4b", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA4b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA6b", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA6b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA4c", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA4c","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufA6c", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufA6c","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "SpEtaPrevA", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "SpEtaPrevA.one.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":8,"up":15,"cElement": [{"cName": "SpEtaPrevA.two.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "SpEtaPrevAa", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "SpEtaPrevAa.three.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":8,"up":15,"cElement": [{"cName": "SpEtaPrevAa.four.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":16,"up":23,"cElement": [{"cName": "SpEtaPrevAa.five.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":24,"up":31,"cElement": [{"cName": "SpEtaPrevAa.six.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "SpEtaPrevD", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "SpEtaPrevD.one.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":8,"up":15,"cElement": [{"cName": "SpEtaPrevD.two.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "SpEtaPrevDa", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "SpEtaPrevDa.three.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":8,"up":15,"cElement": [{"cName": "SpEtaPrevDa.four.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":16,"up":23,"cElement": [{"cName": "SpEtaPrevDa.five.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":24,"up":31,"cElement": [{"cName": "SpEtaPrevDa.six.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB6", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB6","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB1a", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB1a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB7a", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB7a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB1b", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB1b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB7b", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB7b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB3a", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB3a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB9a", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB9a","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB3b", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB3b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB9b", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB9b","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB4", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB4","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_bufB10", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_bufB10","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 1023,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "SpEtaPrevB", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "SpEtaPrevB.one.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":8,"up":15,"cElement": [{"cName": "SpEtaPrevB.two.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "SpEtaPrevBa", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "SpEtaPrevBa.three.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":8,"up":15,"cElement": [{"cName": "SpEtaPrevBa.four.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":16,"up":23,"cElement": [{"cName": "SpEtaPrevBa.five.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":24,"up":31,"cElement": [{"cName": "SpEtaPrevBa.six.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "SpEtaPrevE", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "SpEtaPrevE.one.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":8,"up":15,"cElement": [{"cName": "SpEtaPrevE.two.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "SpEtaPrevEa", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "SpEtaPrevEa.three.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":8,"up":15,"cElement": [{"cName": "SpEtaPrevEa.four.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":16,"up":23,"cElement": [{"cName": "SpEtaPrevEa.five.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]},{"low":24,"up":31,"cElement": [{"cName": "SpEtaPrevEa.six.V","cData": "int8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 2047,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "nIterationCounter", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "nIterationCounter","cData": "unsigned short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1440} ]}
# RTL Port declarations: 
set portNum 311
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ num_nt sc_in sc_lv 16 signal 0 } 
	{ num_ntA sc_in sc_lv 16 signal 1 } 
	{ num_ntB sc_in sc_lv 16 signal 2 } 
	{ numb sc_in sc_lv 16 signal 3 } 
	{ Lam_buf2_address0 sc_out sc_lv 10 signal 4 } 
	{ Lam_buf2_ce0 sc_out sc_logic 1 signal 4 } 
	{ Lam_buf2_q0 sc_in sc_lv 16 signal 4 } 
	{ Lam_buf2_address1 sc_out sc_lv 10 signal 4 } 
	{ Lam_buf2_ce1 sc_out sc_logic 1 signal 4 } 
	{ Lam_buf2_q1 sc_in sc_lv 16 signal 4 } 
	{ Lam_buf8_address0 sc_out sc_lv 10 signal 5 } 
	{ Lam_buf8_ce0 sc_out sc_logic 1 signal 5 } 
	{ Lam_buf8_q0 sc_in sc_lv 16 signal 5 } 
	{ Lam_buf8_address1 sc_out sc_lv 10 signal 5 } 
	{ Lam_buf8_ce1 sc_out sc_logic 1 signal 5 } 
	{ Lam_buf8_q1 sc_in sc_lv 16 signal 5 } 
	{ Lam_buf4_address0 sc_out sc_lv 10 signal 6 } 
	{ Lam_buf4_ce0 sc_out sc_logic 1 signal 6 } 
	{ Lam_buf4_q0 sc_in sc_lv 16 signal 6 } 
	{ Lam_buf4_address1 sc_out sc_lv 10 signal 6 } 
	{ Lam_buf4_ce1 sc_out sc_logic 1 signal 6 } 
	{ Lam_buf4_q1 sc_in sc_lv 16 signal 6 } 
	{ Lam_buf6_address0 sc_out sc_lv 10 signal 7 } 
	{ Lam_buf6_ce0 sc_out sc_logic 1 signal 7 } 
	{ Lam_buf6_q0 sc_in sc_lv 16 signal 7 } 
	{ Lam_buf6_address1 sc_out sc_lv 10 signal 7 } 
	{ Lam_buf6_ce1 sc_out sc_logic 1 signal 7 } 
	{ Lam_buf6_q1 sc_in sc_lv 16 signal 7 } 
	{ Lam_buf4a_address0 sc_out sc_lv 10 signal 8 } 
	{ Lam_buf4a_ce0 sc_out sc_logic 1 signal 8 } 
	{ Lam_buf4a_q0 sc_in sc_lv 16 signal 8 } 
	{ Lam_buf4a_address1 sc_out sc_lv 10 signal 8 } 
	{ Lam_buf4a_ce1 sc_out sc_logic 1 signal 8 } 
	{ Lam_buf4a_q1 sc_in sc_lv 16 signal 8 } 
	{ Lam_buf6a_address0 sc_out sc_lv 10 signal 9 } 
	{ Lam_buf6a_ce0 sc_out sc_logic 1 signal 9 } 
	{ Lam_buf6a_q0 sc_in sc_lv 16 signal 9 } 
	{ Lam_buf6a_address1 sc_out sc_lv 10 signal 9 } 
	{ Lam_buf6a_ce1 sc_out sc_logic 1 signal 9 } 
	{ Lam_buf6a_q1 sc_in sc_lv 16 signal 9 } 
	{ SpEtaPrev_address0 sc_out sc_lv 11 signal 10 } 
	{ SpEtaPrev_ce0 sc_out sc_logic 1 signal 10 } 
	{ SpEtaPrev_q0 sc_in sc_lv 32 signal 10 } 
	{ SpEtaPrevC_address0 sc_out sc_lv 11 signal 11 } 
	{ SpEtaPrevC_ce0 sc_out sc_logic 1 signal 11 } 
	{ SpEtaPrevC_q0 sc_in sc_lv 32 signal 11 } 
	{ Lam_bufAa_address0 sc_out sc_lv 10 signal 12 } 
	{ Lam_bufAa_ce0 sc_out sc_logic 1 signal 12 } 
	{ Lam_bufAa_q0 sc_in sc_lv 16 signal 12 } 
	{ Lam_bufAa_address1 sc_out sc_lv 10 signal 12 } 
	{ Lam_bufAa_ce1 sc_out sc_logic 1 signal 12 } 
	{ Lam_bufAa_q1 sc_in sc_lv 16 signal 12 } 
	{ Lam_bufAb_address0 sc_out sc_lv 10 signal 13 } 
	{ Lam_bufAb_ce0 sc_out sc_logic 1 signal 13 } 
	{ Lam_bufAb_q0 sc_in sc_lv 16 signal 13 } 
	{ Lam_bufAb_address1 sc_out sc_lv 10 signal 13 } 
	{ Lam_bufAb_ce1 sc_out sc_logic 1 signal 13 } 
	{ Lam_bufAb_q1 sc_in sc_lv 16 signal 13 } 
	{ Lam_bufA1_address0 sc_out sc_lv 10 signal 14 } 
	{ Lam_bufA1_ce0 sc_out sc_logic 1 signal 14 } 
	{ Lam_bufA1_q0 sc_in sc_lv 16 signal 14 } 
	{ Lam_bufA1_address1 sc_out sc_lv 10 signal 14 } 
	{ Lam_bufA1_ce1 sc_out sc_logic 1 signal 14 } 
	{ Lam_bufA1_q1 sc_in sc_lv 16 signal 14 } 
	{ Lam_bufAc_address0 sc_out sc_lv 10 signal 15 } 
	{ Lam_bufAc_ce0 sc_out sc_logic 1 signal 15 } 
	{ Lam_bufAc_q0 sc_in sc_lv 16 signal 15 } 
	{ Lam_bufAc_address1 sc_out sc_lv 10 signal 15 } 
	{ Lam_bufAc_ce1 sc_out sc_logic 1 signal 15 } 
	{ Lam_bufAc_q1 sc_in sc_lv 16 signal 15 } 
	{ Lam_bufA3_address0 sc_out sc_lv 10 signal 16 } 
	{ Lam_bufA3_ce0 sc_out sc_logic 1 signal 16 } 
	{ Lam_bufA3_q0 sc_in sc_lv 16 signal 16 } 
	{ Lam_bufA3_address1 sc_out sc_lv 10 signal 16 } 
	{ Lam_bufA3_ce1 sc_out sc_logic 1 signal 16 } 
	{ Lam_bufA3_q1 sc_in sc_lv 16 signal 16 } 
	{ Lam_bufA2a_address0 sc_out sc_lv 10 signal 17 } 
	{ Lam_bufA2a_ce0 sc_out sc_logic 1 signal 17 } 
	{ Lam_bufA2a_q0 sc_in sc_lv 16 signal 17 } 
	{ Lam_bufA2a_address1 sc_out sc_lv 10 signal 17 } 
	{ Lam_bufA2a_ce1 sc_out sc_logic 1 signal 17 } 
	{ Lam_bufA2a_q1 sc_in sc_lv 16 signal 17 } 
	{ Lam_bufA4a_address0 sc_out sc_lv 10 signal 18 } 
	{ Lam_bufA4a_ce0 sc_out sc_logic 1 signal 18 } 
	{ Lam_bufA4a_q0 sc_in sc_lv 16 signal 18 } 
	{ Lam_bufA4a_address1 sc_out sc_lv 10 signal 18 } 
	{ Lam_bufA4a_ce1 sc_out sc_logic 1 signal 18 } 
	{ Lam_bufA4a_q1 sc_in sc_lv 16 signal 18 } 
	{ Lam_bufA6_address0 sc_out sc_lv 10 signal 19 } 
	{ Lam_bufA6_ce0 sc_out sc_logic 1 signal 19 } 
	{ Lam_bufA6_q0 sc_in sc_lv 16 signal 19 } 
	{ Lam_bufA6_address1 sc_out sc_lv 10 signal 19 } 
	{ Lam_bufA6_ce1 sc_out sc_logic 1 signal 19 } 
	{ Lam_bufA6_q1 sc_in sc_lv 16 signal 19 } 
	{ Lam_bufA4b_address0 sc_out sc_lv 10 signal 20 } 
	{ Lam_bufA4b_ce0 sc_out sc_logic 1 signal 20 } 
	{ Lam_bufA4b_q0 sc_in sc_lv 16 signal 20 } 
	{ Lam_bufA4b_address1 sc_out sc_lv 10 signal 20 } 
	{ Lam_bufA4b_ce1 sc_out sc_logic 1 signal 20 } 
	{ Lam_bufA4b_q1 sc_in sc_lv 16 signal 20 } 
	{ Lam_bufA6b_address0 sc_out sc_lv 10 signal 21 } 
	{ Lam_bufA6b_ce0 sc_out sc_logic 1 signal 21 } 
	{ Lam_bufA6b_q0 sc_in sc_lv 16 signal 21 } 
	{ Lam_bufA6b_address1 sc_out sc_lv 10 signal 21 } 
	{ Lam_bufA6b_ce1 sc_out sc_logic 1 signal 21 } 
	{ Lam_bufA6b_q1 sc_in sc_lv 16 signal 21 } 
	{ Lam_bufA4c_address0 sc_out sc_lv 10 signal 22 } 
	{ Lam_bufA4c_ce0 sc_out sc_logic 1 signal 22 } 
	{ Lam_bufA4c_q0 sc_in sc_lv 16 signal 22 } 
	{ Lam_bufA4c_address1 sc_out sc_lv 10 signal 22 } 
	{ Lam_bufA4c_ce1 sc_out sc_logic 1 signal 22 } 
	{ Lam_bufA4c_q1 sc_in sc_lv 16 signal 22 } 
	{ Lam_bufA6c_address0 sc_out sc_lv 10 signal 23 } 
	{ Lam_bufA6c_ce0 sc_out sc_logic 1 signal 23 } 
	{ Lam_bufA6c_q0 sc_in sc_lv 16 signal 23 } 
	{ Lam_bufA6c_address1 sc_out sc_lv 10 signal 23 } 
	{ Lam_bufA6c_ce1 sc_out sc_logic 1 signal 23 } 
	{ Lam_bufA6c_q1 sc_in sc_lv 16 signal 23 } 
	{ SpEtaPrevA_address0 sc_out sc_lv 11 signal 24 } 
	{ SpEtaPrevA_ce0 sc_out sc_logic 1 signal 24 } 
	{ SpEtaPrevA_q0 sc_in sc_lv 16 signal 24 } 
	{ SpEtaPrevAa_address0 sc_out sc_lv 11 signal 25 } 
	{ SpEtaPrevAa_ce0 sc_out sc_logic 1 signal 25 } 
	{ SpEtaPrevAa_q0 sc_in sc_lv 32 signal 25 } 
	{ SpEtaPrevD_address0 sc_out sc_lv 11 signal 26 } 
	{ SpEtaPrevD_ce0 sc_out sc_logic 1 signal 26 } 
	{ SpEtaPrevD_q0 sc_in sc_lv 16 signal 26 } 
	{ SpEtaPrevDa_address0 sc_out sc_lv 11 signal 27 } 
	{ SpEtaPrevDa_ce0 sc_out sc_logic 1 signal 27 } 
	{ SpEtaPrevDa_q0 sc_in sc_lv 32 signal 27 } 
	{ Lam_bufB_address0 sc_out sc_lv 10 signal 28 } 
	{ Lam_bufB_ce0 sc_out sc_logic 1 signal 28 } 
	{ Lam_bufB_q0 sc_in sc_lv 16 signal 28 } 
	{ Lam_bufB_address1 sc_out sc_lv 10 signal 28 } 
	{ Lam_bufB_ce1 sc_out sc_logic 1 signal 28 } 
	{ Lam_bufB_q1 sc_in sc_lv 16 signal 28 } 
	{ Lam_bufB6_address0 sc_out sc_lv 10 signal 29 } 
	{ Lam_bufB6_ce0 sc_out sc_logic 1 signal 29 } 
	{ Lam_bufB6_q0 sc_in sc_lv 16 signal 29 } 
	{ Lam_bufB6_address1 sc_out sc_lv 10 signal 29 } 
	{ Lam_bufB6_ce1 sc_out sc_logic 1 signal 29 } 
	{ Lam_bufB6_q1 sc_in sc_lv 16 signal 29 } 
	{ Lam_bufB1a_address0 sc_out sc_lv 10 signal 30 } 
	{ Lam_bufB1a_ce0 sc_out sc_logic 1 signal 30 } 
	{ Lam_bufB1a_q0 sc_in sc_lv 16 signal 30 } 
	{ Lam_bufB1a_address1 sc_out sc_lv 10 signal 30 } 
	{ Lam_bufB1a_ce1 sc_out sc_logic 1 signal 30 } 
	{ Lam_bufB1a_q1 sc_in sc_lv 16 signal 30 } 
	{ Lam_bufB7a_address0 sc_out sc_lv 10 signal 31 } 
	{ Lam_bufB7a_ce0 sc_out sc_logic 1 signal 31 } 
	{ Lam_bufB7a_q0 sc_in sc_lv 16 signal 31 } 
	{ Lam_bufB7a_address1 sc_out sc_lv 10 signal 31 } 
	{ Lam_bufB7a_ce1 sc_out sc_logic 1 signal 31 } 
	{ Lam_bufB7a_q1 sc_in sc_lv 16 signal 31 } 
	{ Lam_bufB1b_address0 sc_out sc_lv 10 signal 32 } 
	{ Lam_bufB1b_ce0 sc_out sc_logic 1 signal 32 } 
	{ Lam_bufB1b_q0 sc_in sc_lv 16 signal 32 } 
	{ Lam_bufB1b_address1 sc_out sc_lv 10 signal 32 } 
	{ Lam_bufB1b_ce1 sc_out sc_logic 1 signal 32 } 
	{ Lam_bufB1b_q1 sc_in sc_lv 16 signal 32 } 
	{ Lam_bufB7b_address0 sc_out sc_lv 10 signal 33 } 
	{ Lam_bufB7b_ce0 sc_out sc_logic 1 signal 33 } 
	{ Lam_bufB7b_q0 sc_in sc_lv 16 signal 33 } 
	{ Lam_bufB7b_address1 sc_out sc_lv 10 signal 33 } 
	{ Lam_bufB7b_ce1 sc_out sc_logic 1 signal 33 } 
	{ Lam_bufB7b_q1 sc_in sc_lv 16 signal 33 } 
	{ Lam_bufB3a_address0 sc_out sc_lv 10 signal 34 } 
	{ Lam_bufB3a_ce0 sc_out sc_logic 1 signal 34 } 
	{ Lam_bufB3a_q0 sc_in sc_lv 16 signal 34 } 
	{ Lam_bufB3a_address1 sc_out sc_lv 10 signal 34 } 
	{ Lam_bufB3a_ce1 sc_out sc_logic 1 signal 34 } 
	{ Lam_bufB3a_q1 sc_in sc_lv 16 signal 34 } 
	{ Lam_bufB9a_address0 sc_out sc_lv 10 signal 35 } 
	{ Lam_bufB9a_ce0 sc_out sc_logic 1 signal 35 } 
	{ Lam_bufB9a_q0 sc_in sc_lv 16 signal 35 } 
	{ Lam_bufB9a_address1 sc_out sc_lv 10 signal 35 } 
	{ Lam_bufB9a_ce1 sc_out sc_logic 1 signal 35 } 
	{ Lam_bufB9a_q1 sc_in sc_lv 16 signal 35 } 
	{ Lam_bufB3b_address0 sc_out sc_lv 10 signal 36 } 
	{ Lam_bufB3b_ce0 sc_out sc_logic 1 signal 36 } 
	{ Lam_bufB3b_q0 sc_in sc_lv 16 signal 36 } 
	{ Lam_bufB3b_address1 sc_out sc_lv 10 signal 36 } 
	{ Lam_bufB3b_ce1 sc_out sc_logic 1 signal 36 } 
	{ Lam_bufB3b_q1 sc_in sc_lv 16 signal 36 } 
	{ Lam_bufB9b_address0 sc_out sc_lv 10 signal 37 } 
	{ Lam_bufB9b_ce0 sc_out sc_logic 1 signal 37 } 
	{ Lam_bufB9b_q0 sc_in sc_lv 16 signal 37 } 
	{ Lam_bufB9b_address1 sc_out sc_lv 10 signal 37 } 
	{ Lam_bufB9b_ce1 sc_out sc_logic 1 signal 37 } 
	{ Lam_bufB9b_q1 sc_in sc_lv 16 signal 37 } 
	{ Lam_bufB4_address0 sc_out sc_lv 10 signal 38 } 
	{ Lam_bufB4_ce0 sc_out sc_logic 1 signal 38 } 
	{ Lam_bufB4_q0 sc_in sc_lv 16 signal 38 } 
	{ Lam_bufB4_address1 sc_out sc_lv 10 signal 38 } 
	{ Lam_bufB4_ce1 sc_out sc_logic 1 signal 38 } 
	{ Lam_bufB4_q1 sc_in sc_lv 16 signal 38 } 
	{ Lam_bufB10_address0 sc_out sc_lv 10 signal 39 } 
	{ Lam_bufB10_ce0 sc_out sc_logic 1 signal 39 } 
	{ Lam_bufB10_q0 sc_in sc_lv 16 signal 39 } 
	{ Lam_bufB10_address1 sc_out sc_lv 10 signal 39 } 
	{ Lam_bufB10_ce1 sc_out sc_logic 1 signal 39 } 
	{ Lam_bufB10_q1 sc_in sc_lv 16 signal 39 } 
	{ SpEtaPrevB_address0 sc_out sc_lv 11 signal 40 } 
	{ SpEtaPrevB_ce0 sc_out sc_logic 1 signal 40 } 
	{ SpEtaPrevB_q0 sc_in sc_lv 16 signal 40 } 
	{ SpEtaPrevBa_address0 sc_out sc_lv 11 signal 41 } 
	{ SpEtaPrevBa_ce0 sc_out sc_logic 1 signal 41 } 
	{ SpEtaPrevBa_q0 sc_in sc_lv 32 signal 41 } 
	{ SpEtaPrevE_address0 sc_out sc_lv 11 signal 42 } 
	{ SpEtaPrevE_ce0 sc_out sc_logic 1 signal 42 } 
	{ SpEtaPrevE_q0 sc_in sc_lv 16 signal 42 } 
	{ SpEtaPrevEa_address0 sc_out sc_lv 11 signal 43 } 
	{ SpEtaPrevEa_ce0 sc_out sc_logic 1 signal 43 } 
	{ SpEtaPrevEa_q0 sc_in sc_lv 32 signal 43 } 
	{ nIterationCounter sc_in sc_lv 16 signal 44 } 
	{ ap_return_0 sc_out sc_lv 16 signal -1 } 
	{ ap_return_1 sc_out sc_lv 16 signal -1 } 
	{ ap_return_2 sc_out sc_lv 16 signal -1 } 
	{ ap_return_3 sc_out sc_lv 16 signal -1 } 
	{ ap_return_4 sc_out sc_lv 16 signal -1 } 
	{ ap_return_5 sc_out sc_lv 16 signal -1 } 
	{ ap_return_6 sc_out sc_lv 16 signal -1 } 
	{ ap_return_7 sc_out sc_lv 16 signal -1 } 
	{ ap_return_8 sc_out sc_lv 16 signal -1 } 
	{ ap_return_9 sc_out sc_lv 16 signal -1 } 
	{ ap_return_10 sc_out sc_lv 16 signal -1 } 
	{ ap_return_11 sc_out sc_lv 16 signal -1 } 
	{ ap_return_12 sc_out sc_lv 16 signal -1 } 
	{ ap_return_13 sc_out sc_lv 16 signal -1 } 
	{ ap_return_14 sc_out sc_lv 16 signal -1 } 
	{ ap_return_15 sc_out sc_lv 16 signal -1 } 
	{ ap_return_16 sc_out sc_lv 16 signal -1 } 
	{ ap_return_17 sc_out sc_lv 16 signal -1 } 
	{ ap_return_18 sc_out sc_lv 16 signal -1 } 
	{ ap_return_19 sc_out sc_lv 16 signal -1 } 
	{ ap_return_20 sc_out sc_lv 16 signal -1 } 
	{ ap_return_21 sc_out sc_lv 16 signal -1 } 
	{ ap_return_22 sc_out sc_lv 16 signal -1 } 
	{ ap_return_23 sc_out sc_lv 16 signal -1 } 
	{ ap_return_24 sc_out sc_lv 16 signal -1 } 
	{ ap_return_25 sc_out sc_lv 16 signal -1 } 
	{ ap_return_26 sc_out sc_lv 16 signal -1 } 
	{ ap_return_27 sc_out sc_lv 16 signal -1 } 
	{ ap_return_28 sc_out sc_lv 16 signal -1 } 
	{ ap_return_29 sc_out sc_lv 16 signal -1 } 
	{ ap_return_30 sc_out sc_lv 16 signal -1 } 
	{ ap_return_31 sc_out sc_lv 16 signal -1 } 
	{ ap_return_32 sc_out sc_lv 16 signal -1 } 
	{ ap_return_33 sc_out sc_lv 16 signal -1 } 
	{ ap_return_34 sc_out sc_lv 16 signal -1 } 
	{ ap_return_35 sc_out sc_lv 16 signal -1 } 
	{ ap_return_36 sc_out sc_lv 16 signal -1 } 
	{ ap_return_37 sc_out sc_lv 16 signal -1 } 
	{ ap_return_38 sc_out sc_lv 16 signal -1 } 
	{ ap_return_39 sc_out sc_lv 16 signal -1 } 
	{ ap_return_40 sc_out sc_lv 16 signal -1 } 
	{ ap_return_41 sc_out sc_lv 16 signal -1 } 
	{ ap_return_42 sc_out sc_lv 16 signal -1 } 
	{ ap_return_43 sc_out sc_lv 16 signal -1 } 
	{ ap_return_44 sc_out sc_lv 16 signal -1 } 
	{ ap_return_45 sc_out sc_lv 16 signal -1 } 
	{ ap_return_46 sc_out sc_lv 16 signal -1 } 
	{ ap_return_47 sc_out sc_lv 16 signal -1 } 
	{ ap_return_48 sc_out sc_lv 16 signal -1 } 
	{ ap_return_49 sc_out sc_lv 16 signal -1 } 
	{ ap_return_50 sc_out sc_lv 16 signal -1 } 
	{ ap_return_51 sc_out sc_lv 16 signal -1 } 
	{ ap_return_52 sc_out sc_lv 16 signal -1 } 
	{ ap_return_53 sc_out sc_lv 16 signal -1 } 
	{ ap_return_54 sc_out sc_lv 16 signal -1 } 
	{ ap_return_55 sc_out sc_lv 16 signal -1 } 
	{ ap_return_56 sc_out sc_lv 16 signal -1 } 
	{ ap_return_57 sc_out sc_lv 16 signal -1 } 
	{ ap_return_58 sc_out sc_lv 16 signal -1 } 
	{ ap_return_59 sc_out sc_lv 16 signal -1 } 
	{ ap_return_60 sc_out sc_lv 16 signal -1 } 
	{ ap_return_61 sc_out sc_lv 16 signal -1 } 
	{ ap_return_62 sc_out sc_lv 16 signal -1 } 
	{ ap_return_63 sc_out sc_lv 16 signal -1 } 
	{ ap_return_64 sc_out sc_lv 16 signal -1 } 
	{ ap_return_65 sc_out sc_lv 16 signal -1 } 
	{ ap_return_66 sc_out sc_lv 16 signal -1 } 
	{ ap_return_67 sc_out sc_lv 16 signal -1 } 
	{ ap_return_68 sc_out sc_lv 16 signal -1 } 
	{ ap_return_69 sc_out sc_lv 16 signal -1 } 
	{ ap_return_70 sc_out sc_lv 16 signal -1 } 
	{ ap_return_71 sc_out sc_lv 16 signal -1 } 
	{ ap_return_72 sc_out sc_lv 16 signal -1 } 
	{ ap_return_73 sc_out sc_lv 16 signal -1 } 
	{ ap_return_74 sc_out sc_lv 16 signal -1 } 
	{ ap_return_75 sc_out sc_lv 16 signal -1 } 
	{ ap_return_76 sc_out sc_lv 16 signal -1 } 
	{ ap_return_77 sc_out sc_lv 16 signal -1 } 
	{ ap_return_78 sc_out sc_lv 16 signal -1 } 
	{ ap_return_79 sc_out sc_lv 16 signal -1 } 
	{ ap_return_80 sc_out sc_lv 16 signal -1 } 
	{ ap_return_81 sc_out sc_lv 16 signal -1 } 
	{ ap_return_82 sc_out sc_lv 16 signal -1 } 
	{ ap_return_83 sc_out sc_lv 16 signal -1 } 
	{ ap_return_84 sc_out sc_lv 16 signal -1 } 
	{ ap_return_85 sc_out sc_lv 16 signal -1 } 
	{ ap_return_86 sc_out sc_lv 16 signal -1 } 
	{ ap_return_87 sc_out sc_lv 16 signal -1 } 
	{ ap_return_88 sc_out sc_lv 16 signal -1 } 
	{ ap_return_89 sc_out sc_lv 16 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "num_nt", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "num_nt", "role": "default" }} , 
 	{ "name": "num_ntA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "num_ntA", "role": "default" }} , 
 	{ "name": "num_ntB", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "num_ntB", "role": "default" }} , 
 	{ "name": "numb", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "numb", "role": "default" }} , 
 	{ "name": "Lam_buf2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf2", "role": "address0" }} , 
 	{ "name": "Lam_buf2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf2", "role": "ce0" }} , 
 	{ "name": "Lam_buf2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf2", "role": "q0" }} , 
 	{ "name": "Lam_buf2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf2", "role": "address1" }} , 
 	{ "name": "Lam_buf2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf2", "role": "ce1" }} , 
 	{ "name": "Lam_buf2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf2", "role": "q1" }} , 
 	{ "name": "Lam_buf8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf8", "role": "address0" }} , 
 	{ "name": "Lam_buf8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf8", "role": "ce0" }} , 
 	{ "name": "Lam_buf8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf8", "role": "q0" }} , 
 	{ "name": "Lam_buf8_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf8", "role": "address1" }} , 
 	{ "name": "Lam_buf8_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf8", "role": "ce1" }} , 
 	{ "name": "Lam_buf8_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf8", "role": "q1" }} , 
 	{ "name": "Lam_buf4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf4", "role": "address0" }} , 
 	{ "name": "Lam_buf4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf4", "role": "ce0" }} , 
 	{ "name": "Lam_buf4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf4", "role": "q0" }} , 
 	{ "name": "Lam_buf4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf4", "role": "address1" }} , 
 	{ "name": "Lam_buf4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf4", "role": "ce1" }} , 
 	{ "name": "Lam_buf4_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf4", "role": "q1" }} , 
 	{ "name": "Lam_buf6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf6", "role": "address0" }} , 
 	{ "name": "Lam_buf6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf6", "role": "ce0" }} , 
 	{ "name": "Lam_buf6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf6", "role": "q0" }} , 
 	{ "name": "Lam_buf6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf6", "role": "address1" }} , 
 	{ "name": "Lam_buf6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf6", "role": "ce1" }} , 
 	{ "name": "Lam_buf6_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf6", "role": "q1" }} , 
 	{ "name": "Lam_buf4a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf4a", "role": "address0" }} , 
 	{ "name": "Lam_buf4a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf4a", "role": "ce0" }} , 
 	{ "name": "Lam_buf4a_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf4a", "role": "q0" }} , 
 	{ "name": "Lam_buf4a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf4a", "role": "address1" }} , 
 	{ "name": "Lam_buf4a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf4a", "role": "ce1" }} , 
 	{ "name": "Lam_buf4a_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf4a", "role": "q1" }} , 
 	{ "name": "Lam_buf6a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf6a", "role": "address0" }} , 
 	{ "name": "Lam_buf6a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf6a", "role": "ce0" }} , 
 	{ "name": "Lam_buf6a_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf6a", "role": "q0" }} , 
 	{ "name": "Lam_buf6a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_buf6a", "role": "address1" }} , 
 	{ "name": "Lam_buf6a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_buf6a", "role": "ce1" }} , 
 	{ "name": "Lam_buf6a_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_buf6a", "role": "q1" }} , 
 	{ "name": "SpEtaPrev_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "SpEtaPrev", "role": "address0" }} , 
 	{ "name": "SpEtaPrev_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SpEtaPrev", "role": "ce0" }} , 
 	{ "name": "SpEtaPrev_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SpEtaPrev", "role": "q0" }} , 
 	{ "name": "SpEtaPrevC_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "SpEtaPrevC", "role": "address0" }} , 
 	{ "name": "SpEtaPrevC_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SpEtaPrevC", "role": "ce0" }} , 
 	{ "name": "SpEtaPrevC_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SpEtaPrevC", "role": "q0" }} , 
 	{ "name": "Lam_bufAa_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufAa", "role": "address0" }} , 
 	{ "name": "Lam_bufAa_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufAa", "role": "ce0" }} , 
 	{ "name": "Lam_bufAa_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufAa", "role": "q0" }} , 
 	{ "name": "Lam_bufAa_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufAa", "role": "address1" }} , 
 	{ "name": "Lam_bufAa_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufAa", "role": "ce1" }} , 
 	{ "name": "Lam_bufAa_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufAa", "role": "q1" }} , 
 	{ "name": "Lam_bufAb_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufAb", "role": "address0" }} , 
 	{ "name": "Lam_bufAb_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufAb", "role": "ce0" }} , 
 	{ "name": "Lam_bufAb_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufAb", "role": "q0" }} , 
 	{ "name": "Lam_bufAb_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufAb", "role": "address1" }} , 
 	{ "name": "Lam_bufAb_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufAb", "role": "ce1" }} , 
 	{ "name": "Lam_bufAb_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufAb", "role": "q1" }} , 
 	{ "name": "Lam_bufA1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA1", "role": "address0" }} , 
 	{ "name": "Lam_bufA1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA1", "role": "ce0" }} , 
 	{ "name": "Lam_bufA1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA1", "role": "q0" }} , 
 	{ "name": "Lam_bufA1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA1", "role": "address1" }} , 
 	{ "name": "Lam_bufA1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA1", "role": "ce1" }} , 
 	{ "name": "Lam_bufA1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA1", "role": "q1" }} , 
 	{ "name": "Lam_bufAc_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufAc", "role": "address0" }} , 
 	{ "name": "Lam_bufAc_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufAc", "role": "ce0" }} , 
 	{ "name": "Lam_bufAc_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufAc", "role": "q0" }} , 
 	{ "name": "Lam_bufAc_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufAc", "role": "address1" }} , 
 	{ "name": "Lam_bufAc_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufAc", "role": "ce1" }} , 
 	{ "name": "Lam_bufAc_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufAc", "role": "q1" }} , 
 	{ "name": "Lam_bufA3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA3", "role": "address0" }} , 
 	{ "name": "Lam_bufA3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA3", "role": "ce0" }} , 
 	{ "name": "Lam_bufA3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA3", "role": "q0" }} , 
 	{ "name": "Lam_bufA3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA3", "role": "address1" }} , 
 	{ "name": "Lam_bufA3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA3", "role": "ce1" }} , 
 	{ "name": "Lam_bufA3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA3", "role": "q1" }} , 
 	{ "name": "Lam_bufA2a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA2a", "role": "address0" }} , 
 	{ "name": "Lam_bufA2a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA2a", "role": "ce0" }} , 
 	{ "name": "Lam_bufA2a_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA2a", "role": "q0" }} , 
 	{ "name": "Lam_bufA2a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA2a", "role": "address1" }} , 
 	{ "name": "Lam_bufA2a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA2a", "role": "ce1" }} , 
 	{ "name": "Lam_bufA2a_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA2a", "role": "q1" }} , 
 	{ "name": "Lam_bufA4a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA4a", "role": "address0" }} , 
 	{ "name": "Lam_bufA4a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA4a", "role": "ce0" }} , 
 	{ "name": "Lam_bufA4a_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA4a", "role": "q0" }} , 
 	{ "name": "Lam_bufA4a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA4a", "role": "address1" }} , 
 	{ "name": "Lam_bufA4a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA4a", "role": "ce1" }} , 
 	{ "name": "Lam_bufA4a_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA4a", "role": "q1" }} , 
 	{ "name": "Lam_bufA6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA6", "role": "address0" }} , 
 	{ "name": "Lam_bufA6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA6", "role": "ce0" }} , 
 	{ "name": "Lam_bufA6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA6", "role": "q0" }} , 
 	{ "name": "Lam_bufA6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA6", "role": "address1" }} , 
 	{ "name": "Lam_bufA6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA6", "role": "ce1" }} , 
 	{ "name": "Lam_bufA6_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA6", "role": "q1" }} , 
 	{ "name": "Lam_bufA4b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA4b", "role": "address0" }} , 
 	{ "name": "Lam_bufA4b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA4b", "role": "ce0" }} , 
 	{ "name": "Lam_bufA4b_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA4b", "role": "q0" }} , 
 	{ "name": "Lam_bufA4b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA4b", "role": "address1" }} , 
 	{ "name": "Lam_bufA4b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA4b", "role": "ce1" }} , 
 	{ "name": "Lam_bufA4b_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA4b", "role": "q1" }} , 
 	{ "name": "Lam_bufA6b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA6b", "role": "address0" }} , 
 	{ "name": "Lam_bufA6b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA6b", "role": "ce0" }} , 
 	{ "name": "Lam_bufA6b_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA6b", "role": "q0" }} , 
 	{ "name": "Lam_bufA6b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA6b", "role": "address1" }} , 
 	{ "name": "Lam_bufA6b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA6b", "role": "ce1" }} , 
 	{ "name": "Lam_bufA6b_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA6b", "role": "q1" }} , 
 	{ "name": "Lam_bufA4c_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA4c", "role": "address0" }} , 
 	{ "name": "Lam_bufA4c_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA4c", "role": "ce0" }} , 
 	{ "name": "Lam_bufA4c_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA4c", "role": "q0" }} , 
 	{ "name": "Lam_bufA4c_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA4c", "role": "address1" }} , 
 	{ "name": "Lam_bufA4c_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA4c", "role": "ce1" }} , 
 	{ "name": "Lam_bufA4c_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA4c", "role": "q1" }} , 
 	{ "name": "Lam_bufA6c_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA6c", "role": "address0" }} , 
 	{ "name": "Lam_bufA6c_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA6c", "role": "ce0" }} , 
 	{ "name": "Lam_bufA6c_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA6c", "role": "q0" }} , 
 	{ "name": "Lam_bufA6c_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufA6c", "role": "address1" }} , 
 	{ "name": "Lam_bufA6c_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufA6c", "role": "ce1" }} , 
 	{ "name": "Lam_bufA6c_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufA6c", "role": "q1" }} , 
 	{ "name": "SpEtaPrevA_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "SpEtaPrevA", "role": "address0" }} , 
 	{ "name": "SpEtaPrevA_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SpEtaPrevA", "role": "ce0" }} , 
 	{ "name": "SpEtaPrevA_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "SpEtaPrevA", "role": "q0" }} , 
 	{ "name": "SpEtaPrevAa_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "SpEtaPrevAa", "role": "address0" }} , 
 	{ "name": "SpEtaPrevAa_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SpEtaPrevAa", "role": "ce0" }} , 
 	{ "name": "SpEtaPrevAa_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SpEtaPrevAa", "role": "q0" }} , 
 	{ "name": "SpEtaPrevD_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "SpEtaPrevD", "role": "address0" }} , 
 	{ "name": "SpEtaPrevD_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SpEtaPrevD", "role": "ce0" }} , 
 	{ "name": "SpEtaPrevD_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "SpEtaPrevD", "role": "q0" }} , 
 	{ "name": "SpEtaPrevDa_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "SpEtaPrevDa", "role": "address0" }} , 
 	{ "name": "SpEtaPrevDa_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SpEtaPrevDa", "role": "ce0" }} , 
 	{ "name": "SpEtaPrevDa_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SpEtaPrevDa", "role": "q0" }} , 
 	{ "name": "Lam_bufB_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB", "role": "address0" }} , 
 	{ "name": "Lam_bufB_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB", "role": "ce0" }} , 
 	{ "name": "Lam_bufB_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB", "role": "q0" }} , 
 	{ "name": "Lam_bufB_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB", "role": "address1" }} , 
 	{ "name": "Lam_bufB_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB", "role": "ce1" }} , 
 	{ "name": "Lam_bufB_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB", "role": "q1" }} , 
 	{ "name": "Lam_bufB6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB6", "role": "address0" }} , 
 	{ "name": "Lam_bufB6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB6", "role": "ce0" }} , 
 	{ "name": "Lam_bufB6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB6", "role": "q0" }} , 
 	{ "name": "Lam_bufB6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB6", "role": "address1" }} , 
 	{ "name": "Lam_bufB6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB6", "role": "ce1" }} , 
 	{ "name": "Lam_bufB6_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB6", "role": "q1" }} , 
 	{ "name": "Lam_bufB1a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB1a", "role": "address0" }} , 
 	{ "name": "Lam_bufB1a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB1a", "role": "ce0" }} , 
 	{ "name": "Lam_bufB1a_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB1a", "role": "q0" }} , 
 	{ "name": "Lam_bufB1a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB1a", "role": "address1" }} , 
 	{ "name": "Lam_bufB1a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB1a", "role": "ce1" }} , 
 	{ "name": "Lam_bufB1a_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB1a", "role": "q1" }} , 
 	{ "name": "Lam_bufB7a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB7a", "role": "address0" }} , 
 	{ "name": "Lam_bufB7a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB7a", "role": "ce0" }} , 
 	{ "name": "Lam_bufB7a_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB7a", "role": "q0" }} , 
 	{ "name": "Lam_bufB7a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB7a", "role": "address1" }} , 
 	{ "name": "Lam_bufB7a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB7a", "role": "ce1" }} , 
 	{ "name": "Lam_bufB7a_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB7a", "role": "q1" }} , 
 	{ "name": "Lam_bufB1b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB1b", "role": "address0" }} , 
 	{ "name": "Lam_bufB1b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB1b", "role": "ce0" }} , 
 	{ "name": "Lam_bufB1b_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB1b", "role": "q0" }} , 
 	{ "name": "Lam_bufB1b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB1b", "role": "address1" }} , 
 	{ "name": "Lam_bufB1b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB1b", "role": "ce1" }} , 
 	{ "name": "Lam_bufB1b_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB1b", "role": "q1" }} , 
 	{ "name": "Lam_bufB7b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB7b", "role": "address0" }} , 
 	{ "name": "Lam_bufB7b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB7b", "role": "ce0" }} , 
 	{ "name": "Lam_bufB7b_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB7b", "role": "q0" }} , 
 	{ "name": "Lam_bufB7b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB7b", "role": "address1" }} , 
 	{ "name": "Lam_bufB7b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB7b", "role": "ce1" }} , 
 	{ "name": "Lam_bufB7b_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB7b", "role": "q1" }} , 
 	{ "name": "Lam_bufB3a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB3a", "role": "address0" }} , 
 	{ "name": "Lam_bufB3a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB3a", "role": "ce0" }} , 
 	{ "name": "Lam_bufB3a_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB3a", "role": "q0" }} , 
 	{ "name": "Lam_bufB3a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB3a", "role": "address1" }} , 
 	{ "name": "Lam_bufB3a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB3a", "role": "ce1" }} , 
 	{ "name": "Lam_bufB3a_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB3a", "role": "q1" }} , 
 	{ "name": "Lam_bufB9a_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB9a", "role": "address0" }} , 
 	{ "name": "Lam_bufB9a_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB9a", "role": "ce0" }} , 
 	{ "name": "Lam_bufB9a_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB9a", "role": "q0" }} , 
 	{ "name": "Lam_bufB9a_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB9a", "role": "address1" }} , 
 	{ "name": "Lam_bufB9a_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB9a", "role": "ce1" }} , 
 	{ "name": "Lam_bufB9a_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB9a", "role": "q1" }} , 
 	{ "name": "Lam_bufB3b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB3b", "role": "address0" }} , 
 	{ "name": "Lam_bufB3b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB3b", "role": "ce0" }} , 
 	{ "name": "Lam_bufB3b_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB3b", "role": "q0" }} , 
 	{ "name": "Lam_bufB3b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB3b", "role": "address1" }} , 
 	{ "name": "Lam_bufB3b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB3b", "role": "ce1" }} , 
 	{ "name": "Lam_bufB3b_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB3b", "role": "q1" }} , 
 	{ "name": "Lam_bufB9b_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB9b", "role": "address0" }} , 
 	{ "name": "Lam_bufB9b_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB9b", "role": "ce0" }} , 
 	{ "name": "Lam_bufB9b_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB9b", "role": "q0" }} , 
 	{ "name": "Lam_bufB9b_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB9b", "role": "address1" }} , 
 	{ "name": "Lam_bufB9b_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB9b", "role": "ce1" }} , 
 	{ "name": "Lam_bufB9b_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB9b", "role": "q1" }} , 
 	{ "name": "Lam_bufB4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB4", "role": "address0" }} , 
 	{ "name": "Lam_bufB4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB4", "role": "ce0" }} , 
 	{ "name": "Lam_bufB4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB4", "role": "q0" }} , 
 	{ "name": "Lam_bufB4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB4", "role": "address1" }} , 
 	{ "name": "Lam_bufB4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB4", "role": "ce1" }} , 
 	{ "name": "Lam_bufB4_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB4", "role": "q1" }} , 
 	{ "name": "Lam_bufB10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB10", "role": "address0" }} , 
 	{ "name": "Lam_bufB10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB10", "role": "ce0" }} , 
 	{ "name": "Lam_bufB10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB10", "role": "q0" }} , 
 	{ "name": "Lam_bufB10_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "Lam_bufB10", "role": "address1" }} , 
 	{ "name": "Lam_bufB10_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Lam_bufB10", "role": "ce1" }} , 
 	{ "name": "Lam_bufB10_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_bufB10", "role": "q1" }} , 
 	{ "name": "SpEtaPrevB_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "SpEtaPrevB", "role": "address0" }} , 
 	{ "name": "SpEtaPrevB_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SpEtaPrevB", "role": "ce0" }} , 
 	{ "name": "SpEtaPrevB_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "SpEtaPrevB", "role": "q0" }} , 
 	{ "name": "SpEtaPrevBa_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "SpEtaPrevBa", "role": "address0" }} , 
 	{ "name": "SpEtaPrevBa_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SpEtaPrevBa", "role": "ce0" }} , 
 	{ "name": "SpEtaPrevBa_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SpEtaPrevBa", "role": "q0" }} , 
 	{ "name": "SpEtaPrevE_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "SpEtaPrevE", "role": "address0" }} , 
 	{ "name": "SpEtaPrevE_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SpEtaPrevE", "role": "ce0" }} , 
 	{ "name": "SpEtaPrevE_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "SpEtaPrevE", "role": "q0" }} , 
 	{ "name": "SpEtaPrevEa_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "SpEtaPrevEa", "role": "address0" }} , 
 	{ "name": "SpEtaPrevEa_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SpEtaPrevEa", "role": "ce0" }} , 
 	{ "name": "SpEtaPrevEa_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "SpEtaPrevEa", "role": "q0" }} , 
 	{ "name": "nIterationCounter", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "nIterationCounter", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_return_4", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_4", "role": "default" }} , 
 	{ "name": "ap_return_5", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_5", "role": "default" }} , 
 	{ "name": "ap_return_6", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_6", "role": "default" }} , 
 	{ "name": "ap_return_7", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_7", "role": "default" }} , 
 	{ "name": "ap_return_8", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_8", "role": "default" }} , 
 	{ "name": "ap_return_9", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_9", "role": "default" }} , 
 	{ "name": "ap_return_10", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_10", "role": "default" }} , 
 	{ "name": "ap_return_11", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_11", "role": "default" }} , 
 	{ "name": "ap_return_12", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_12", "role": "default" }} , 
 	{ "name": "ap_return_13", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_13", "role": "default" }} , 
 	{ "name": "ap_return_14", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_14", "role": "default" }} , 
 	{ "name": "ap_return_15", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_15", "role": "default" }} , 
 	{ "name": "ap_return_16", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_16", "role": "default" }} , 
 	{ "name": "ap_return_17", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_17", "role": "default" }} , 
 	{ "name": "ap_return_18", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_18", "role": "default" }} , 
 	{ "name": "ap_return_19", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_19", "role": "default" }} , 
 	{ "name": "ap_return_20", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_20", "role": "default" }} , 
 	{ "name": "ap_return_21", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_21", "role": "default" }} , 
 	{ "name": "ap_return_22", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_22", "role": "default" }} , 
 	{ "name": "ap_return_23", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_23", "role": "default" }} , 
 	{ "name": "ap_return_24", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_24", "role": "default" }} , 
 	{ "name": "ap_return_25", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_25", "role": "default" }} , 
 	{ "name": "ap_return_26", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_26", "role": "default" }} , 
 	{ "name": "ap_return_27", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_27", "role": "default" }} , 
 	{ "name": "ap_return_28", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_28", "role": "default" }} , 
 	{ "name": "ap_return_29", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_29", "role": "default" }} , 
 	{ "name": "ap_return_30", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_30", "role": "default" }} , 
 	{ "name": "ap_return_31", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_31", "role": "default" }} , 
 	{ "name": "ap_return_32", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_32", "role": "default" }} , 
 	{ "name": "ap_return_33", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_33", "role": "default" }} , 
 	{ "name": "ap_return_34", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_34", "role": "default" }} , 
 	{ "name": "ap_return_35", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_35", "role": "default" }} , 
 	{ "name": "ap_return_36", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_36", "role": "default" }} , 
 	{ "name": "ap_return_37", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_37", "role": "default" }} , 
 	{ "name": "ap_return_38", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_38", "role": "default" }} , 
 	{ "name": "ap_return_39", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_39", "role": "default" }} , 
 	{ "name": "ap_return_40", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_40", "role": "default" }} , 
 	{ "name": "ap_return_41", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_41", "role": "default" }} , 
 	{ "name": "ap_return_42", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_42", "role": "default" }} , 
 	{ "name": "ap_return_43", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_43", "role": "default" }} , 
 	{ "name": "ap_return_44", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_44", "role": "default" }} , 
 	{ "name": "ap_return_45", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_45", "role": "default" }} , 
 	{ "name": "ap_return_46", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_46", "role": "default" }} , 
 	{ "name": "ap_return_47", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_47", "role": "default" }} , 
 	{ "name": "ap_return_48", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_48", "role": "default" }} , 
 	{ "name": "ap_return_49", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_49", "role": "default" }} , 
 	{ "name": "ap_return_50", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_50", "role": "default" }} , 
 	{ "name": "ap_return_51", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_51", "role": "default" }} , 
 	{ "name": "ap_return_52", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_52", "role": "default" }} , 
 	{ "name": "ap_return_53", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_53", "role": "default" }} , 
 	{ "name": "ap_return_54", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_54", "role": "default" }} , 
 	{ "name": "ap_return_55", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_55", "role": "default" }} , 
 	{ "name": "ap_return_56", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_56", "role": "default" }} , 
 	{ "name": "ap_return_57", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_57", "role": "default" }} , 
 	{ "name": "ap_return_58", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_58", "role": "default" }} , 
 	{ "name": "ap_return_59", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_59", "role": "default" }} , 
 	{ "name": "ap_return_60", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_60", "role": "default" }} , 
 	{ "name": "ap_return_61", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_61", "role": "default" }} , 
 	{ "name": "ap_return_62", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_62", "role": "default" }} , 
 	{ "name": "ap_return_63", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_63", "role": "default" }} , 
 	{ "name": "ap_return_64", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_64", "role": "default" }} , 
 	{ "name": "ap_return_65", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_65", "role": "default" }} , 
 	{ "name": "ap_return_66", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_66", "role": "default" }} , 
 	{ "name": "ap_return_67", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_67", "role": "default" }} , 
 	{ "name": "ap_return_68", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_68", "role": "default" }} , 
 	{ "name": "ap_return_69", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_69", "role": "default" }} , 
 	{ "name": "ap_return_70", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_70", "role": "default" }} , 
 	{ "name": "ap_return_71", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_71", "role": "default" }} , 
 	{ "name": "ap_return_72", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_72", "role": "default" }} , 
 	{ "name": "ap_return_73", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_73", "role": "default" }} , 
 	{ "name": "ap_return_74", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_74", "role": "default" }} , 
 	{ "name": "ap_return_75", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_75", "role": "default" }} , 
 	{ "name": "ap_return_76", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_76", "role": "default" }} , 
 	{ "name": "ap_return_77", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_77", "role": "default" }} , 
 	{ "name": "ap_return_78", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_78", "role": "default" }} , 
 	{ "name": "ap_return_79", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_79", "role": "default" }} , 
 	{ "name": "ap_return_80", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_80", "role": "default" }} , 
 	{ "name": "ap_return_81", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_81", "role": "default" }} , 
 	{ "name": "ap_return_82", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_82", "role": "default" }} , 
 	{ "name": "ap_return_83", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_83", "role": "default" }} , 
 	{ "name": "ap_return_84", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_84", "role": "default" }} , 
 	{ "name": "ap_return_85", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_85", "role": "default" }} , 
 	{ "name": "ap_return_86", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_86", "role": "default" }} , 
 	{ "name": "ap_return_87", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_87", "role": "default" }} , 
 	{ "name": "ap_return_88", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_88", "role": "default" }} , 
 	{ "name": "ap_return_89", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_89", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
		"CDFG" : "mcalcAA_12",
		"VariableLatency" : "0",
		"AlignedPipeline" : "1",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "0",
		"ControlExist" : "1",
		"Port" : [
		{"Name" : "num_nt", "Type" : "None", "Direction" : "I"},
		{"Name" : "num_ntA", "Type" : "None", "Direction" : "I"},
		{"Name" : "num_ntB", "Type" : "None", "Direction" : "I"},
		{"Name" : "numb", "Type" : "None", "Direction" : "I"},
		{"Name" : "varinx3_1024_12", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "varinx6A_1024_a", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "varinx6A_1024_b", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "varinx6B_1024_a", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "varinx6B_1024_b", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "varinx3_4096_12", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "varinx6A_4096_a", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "varinx6A_4096_b", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "varinx6B_4096_a", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "varinx6B_4096_b", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_buf2", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_buf8", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_buf4", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_buf6", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_buf4a", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_buf6a", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "SpEtaPrev", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "SpEtaPrevC", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufAa", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufAb", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufA1", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufAc", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufA3", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufA2a", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufA4a", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufA6", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufA4b", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufA6b", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufA4c", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufA6c", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "SpEtaPrevA", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "SpEtaPrevAa", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "SpEtaPrevD", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "SpEtaPrevDa", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufB", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufB6", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufB1a", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufB7a", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufB1b", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufB7b", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufB3a", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufB9a", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufB3b", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufB9b", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufB4", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "Lam_bufB10", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "SpEtaPrevB", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "SpEtaPrevBa", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "SpEtaPrevE", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "SpEtaPrevEa", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "nIterationCounter", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.varinx3_1024_12_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.varinx6A_1024_a_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.varinx6A_1024_b_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.varinx6B_1024_a_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.varinx6B_1024_b_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.varinx3_4096_12_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.varinx6A_4096_a_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.varinx6A_4096_b_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.varinx6B_4096_a_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.varinx6B_4096_b_U", "Parent" : "0"}]}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set Spec2ImplPortList { 
	num_nt { ap_none {  { num_nt in_data 0 16 } } }
	num_ntA { ap_none {  { num_ntA in_data 0 16 } } }
	num_ntB { ap_none {  { num_ntB in_data 0 16 } } }
	numb { ap_none {  { numb in_data 0 16 } } }
	Lam_buf2 { ap_memory {  { Lam_buf2_address0 mem_address 1 10 }  { Lam_buf2_ce0 mem_ce 1 1 }  { Lam_buf2_q0 mem_dout 0 16 }  { Lam_buf2_address1 mem_address 1 10 }  { Lam_buf2_ce1 mem_ce 1 1 }  { Lam_buf2_q1 mem_dout 0 16 } } }
	Lam_buf8 { ap_memory {  { Lam_buf8_address0 mem_address 1 10 }  { Lam_buf8_ce0 mem_ce 1 1 }  { Lam_buf8_q0 mem_dout 0 16 }  { Lam_buf8_address1 mem_address 1 10 }  { Lam_buf8_ce1 mem_ce 1 1 }  { Lam_buf8_q1 mem_dout 0 16 } } }
	Lam_buf4 { ap_memory {  { Lam_buf4_address0 mem_address 1 10 }  { Lam_buf4_ce0 mem_ce 1 1 }  { Lam_buf4_q0 mem_dout 0 16 }  { Lam_buf4_address1 mem_address 1 10 }  { Lam_buf4_ce1 mem_ce 1 1 }  { Lam_buf4_q1 mem_dout 0 16 } } }
	Lam_buf6 { ap_memory {  { Lam_buf6_address0 mem_address 1 10 }  { Lam_buf6_ce0 mem_ce 1 1 }  { Lam_buf6_q0 mem_dout 0 16 }  { Lam_buf6_address1 mem_address 1 10 }  { Lam_buf6_ce1 mem_ce 1 1 }  { Lam_buf6_q1 mem_dout 0 16 } } }
	Lam_buf4a { ap_memory {  { Lam_buf4a_address0 mem_address 1 10 }  { Lam_buf4a_ce0 mem_ce 1 1 }  { Lam_buf4a_q0 mem_dout 0 16 }  { Lam_buf4a_address1 mem_address 1 10 }  { Lam_buf4a_ce1 mem_ce 1 1 }  { Lam_buf4a_q1 mem_dout 0 16 } } }
	Lam_buf6a { ap_memory {  { Lam_buf6a_address0 mem_address 1 10 }  { Lam_buf6a_ce0 mem_ce 1 1 }  { Lam_buf6a_q0 mem_dout 0 16 }  { Lam_buf6a_address1 mem_address 1 10 }  { Lam_buf6a_ce1 mem_ce 1 1 }  { Lam_buf6a_q1 mem_dout 0 16 } } }
	SpEtaPrev { ap_memory {  { SpEtaPrev_address0 mem_address 1 11 }  { SpEtaPrev_ce0 mem_ce 1 1 }  { SpEtaPrev_q0 mem_dout 0 32 } } }
	SpEtaPrevC { ap_memory {  { SpEtaPrevC_address0 mem_address 1 11 }  { SpEtaPrevC_ce0 mem_ce 1 1 }  { SpEtaPrevC_q0 mem_dout 0 32 } } }
	Lam_bufAa { ap_memory {  { Lam_bufAa_address0 mem_address 1 10 }  { Lam_bufAa_ce0 mem_ce 1 1 }  { Lam_bufAa_q0 mem_dout 0 16 }  { Lam_bufAa_address1 mem_address 1 10 }  { Lam_bufAa_ce1 mem_ce 1 1 }  { Lam_bufAa_q1 mem_dout 0 16 } } }
	Lam_bufAb { ap_memory {  { Lam_bufAb_address0 mem_address 1 10 }  { Lam_bufAb_ce0 mem_ce 1 1 }  { Lam_bufAb_q0 mem_dout 0 16 }  { Lam_bufAb_address1 mem_address 1 10 }  { Lam_bufAb_ce1 mem_ce 1 1 }  { Lam_bufAb_q1 mem_dout 0 16 } } }
	Lam_bufA1 { ap_memory {  { Lam_bufA1_address0 mem_address 1 10 }  { Lam_bufA1_ce0 mem_ce 1 1 }  { Lam_bufA1_q0 mem_dout 0 16 }  { Lam_bufA1_address1 mem_address 1 10 }  { Lam_bufA1_ce1 mem_ce 1 1 }  { Lam_bufA1_q1 mem_dout 0 16 } } }
	Lam_bufAc { ap_memory {  { Lam_bufAc_address0 mem_address 1 10 }  { Lam_bufAc_ce0 mem_ce 1 1 }  { Lam_bufAc_q0 mem_dout 0 16 }  { Lam_bufAc_address1 mem_address 1 10 }  { Lam_bufAc_ce1 mem_ce 1 1 }  { Lam_bufAc_q1 mem_dout 0 16 } } }
	Lam_bufA3 { ap_memory {  { Lam_bufA3_address0 mem_address 1 10 }  { Lam_bufA3_ce0 mem_ce 1 1 }  { Lam_bufA3_q0 mem_dout 0 16 }  { Lam_bufA3_address1 mem_address 1 10 }  { Lam_bufA3_ce1 mem_ce 1 1 }  { Lam_bufA3_q1 mem_dout 0 16 } } }
	Lam_bufA2a { ap_memory {  { Lam_bufA2a_address0 mem_address 1 10 }  { Lam_bufA2a_ce0 mem_ce 1 1 }  { Lam_bufA2a_q0 mem_dout 0 16 }  { Lam_bufA2a_address1 mem_address 1 10 }  { Lam_bufA2a_ce1 mem_ce 1 1 }  { Lam_bufA2a_q1 mem_dout 0 16 } } }
	Lam_bufA4a { ap_memory {  { Lam_bufA4a_address0 mem_address 1 10 }  { Lam_bufA4a_ce0 mem_ce 1 1 }  { Lam_bufA4a_q0 mem_dout 0 16 }  { Lam_bufA4a_address1 mem_address 1 10 }  { Lam_bufA4a_ce1 mem_ce 1 1 }  { Lam_bufA4a_q1 mem_dout 0 16 } } }
	Lam_bufA6 { ap_memory {  { Lam_bufA6_address0 mem_address 1 10 }  { Lam_bufA6_ce0 mem_ce 1 1 }  { Lam_bufA6_q0 mem_dout 0 16 }  { Lam_bufA6_address1 mem_address 1 10 }  { Lam_bufA6_ce1 mem_ce 1 1 }  { Lam_bufA6_q1 mem_dout 0 16 } } }
	Lam_bufA4b { ap_memory {  { Lam_bufA4b_address0 mem_address 1 10 }  { Lam_bufA4b_ce0 mem_ce 1 1 }  { Lam_bufA4b_q0 mem_dout 0 16 }  { Lam_bufA4b_address1 mem_address 1 10 }  { Lam_bufA4b_ce1 mem_ce 1 1 }  { Lam_bufA4b_q1 mem_dout 0 16 } } }
	Lam_bufA6b { ap_memory {  { Lam_bufA6b_address0 mem_address 1 10 }  { Lam_bufA6b_ce0 mem_ce 1 1 }  { Lam_bufA6b_q0 mem_dout 0 16 }  { Lam_bufA6b_address1 mem_address 1 10 }  { Lam_bufA6b_ce1 mem_ce 1 1 }  { Lam_bufA6b_q1 mem_dout 0 16 } } }
	Lam_bufA4c { ap_memory {  { Lam_bufA4c_address0 mem_address 1 10 }  { Lam_bufA4c_ce0 mem_ce 1 1 }  { Lam_bufA4c_q0 mem_dout 0 16 }  { Lam_bufA4c_address1 mem_address 1 10 }  { Lam_bufA4c_ce1 mem_ce 1 1 }  { Lam_bufA4c_q1 mem_dout 0 16 } } }
	Lam_bufA6c { ap_memory {  { Lam_bufA6c_address0 mem_address 1 10 }  { Lam_bufA6c_ce0 mem_ce 1 1 }  { Lam_bufA6c_q0 mem_dout 0 16 }  { Lam_bufA6c_address1 mem_address 1 10 }  { Lam_bufA6c_ce1 mem_ce 1 1 }  { Lam_bufA6c_q1 mem_dout 0 16 } } }
	SpEtaPrevA { ap_memory {  { SpEtaPrevA_address0 mem_address 1 11 }  { SpEtaPrevA_ce0 mem_ce 1 1 }  { SpEtaPrevA_q0 mem_dout 0 16 } } }
	SpEtaPrevAa { ap_memory {  { SpEtaPrevAa_address0 mem_address 1 11 }  { SpEtaPrevAa_ce0 mem_ce 1 1 }  { SpEtaPrevAa_q0 mem_dout 0 32 } } }
	SpEtaPrevD { ap_memory {  { SpEtaPrevD_address0 mem_address 1 11 }  { SpEtaPrevD_ce0 mem_ce 1 1 }  { SpEtaPrevD_q0 mem_dout 0 16 } } }
	SpEtaPrevDa { ap_memory {  { SpEtaPrevDa_address0 mem_address 1 11 }  { SpEtaPrevDa_ce0 mem_ce 1 1 }  { SpEtaPrevDa_q0 mem_dout 0 32 } } }
	Lam_bufB { ap_memory {  { Lam_bufB_address0 mem_address 1 10 }  { Lam_bufB_ce0 mem_ce 1 1 }  { Lam_bufB_q0 mem_dout 0 16 }  { Lam_bufB_address1 mem_address 1 10 }  { Lam_bufB_ce1 mem_ce 1 1 }  { Lam_bufB_q1 mem_dout 0 16 } } }
	Lam_bufB6 { ap_memory {  { Lam_bufB6_address0 mem_address 1 10 }  { Lam_bufB6_ce0 mem_ce 1 1 }  { Lam_bufB6_q0 mem_dout 0 16 }  { Lam_bufB6_address1 mem_address 1 10 }  { Lam_bufB6_ce1 mem_ce 1 1 }  { Lam_bufB6_q1 mem_dout 0 16 } } }
	Lam_bufB1a { ap_memory {  { Lam_bufB1a_address0 mem_address 1 10 }  { Lam_bufB1a_ce0 mem_ce 1 1 }  { Lam_bufB1a_q0 mem_dout 0 16 }  { Lam_bufB1a_address1 mem_address 1 10 }  { Lam_bufB1a_ce1 mem_ce 1 1 }  { Lam_bufB1a_q1 mem_dout 0 16 } } }
	Lam_bufB7a { ap_memory {  { Lam_bufB7a_address0 mem_address 1 10 }  { Lam_bufB7a_ce0 mem_ce 1 1 }  { Lam_bufB7a_q0 mem_dout 0 16 }  { Lam_bufB7a_address1 mem_address 1 10 }  { Lam_bufB7a_ce1 mem_ce 1 1 }  { Lam_bufB7a_q1 mem_dout 0 16 } } }
	Lam_bufB1b { ap_memory {  { Lam_bufB1b_address0 mem_address 1 10 }  { Lam_bufB1b_ce0 mem_ce 1 1 }  { Lam_bufB1b_q0 mem_dout 0 16 }  { Lam_bufB1b_address1 mem_address 1 10 }  { Lam_bufB1b_ce1 mem_ce 1 1 }  { Lam_bufB1b_q1 mem_dout 0 16 } } }
	Lam_bufB7b { ap_memory {  { Lam_bufB7b_address0 mem_address 1 10 }  { Lam_bufB7b_ce0 mem_ce 1 1 }  { Lam_bufB7b_q0 mem_dout 0 16 }  { Lam_bufB7b_address1 mem_address 1 10 }  { Lam_bufB7b_ce1 mem_ce 1 1 }  { Lam_bufB7b_q1 mem_dout 0 16 } } }
	Lam_bufB3a { ap_memory {  { Lam_bufB3a_address0 mem_address 1 10 }  { Lam_bufB3a_ce0 mem_ce 1 1 }  { Lam_bufB3a_q0 mem_dout 0 16 }  { Lam_bufB3a_address1 mem_address 1 10 }  { Lam_bufB3a_ce1 mem_ce 1 1 }  { Lam_bufB3a_q1 mem_dout 0 16 } } }
	Lam_bufB9a { ap_memory {  { Lam_bufB9a_address0 mem_address 1 10 }  { Lam_bufB9a_ce0 mem_ce 1 1 }  { Lam_bufB9a_q0 mem_dout 0 16 }  { Lam_bufB9a_address1 mem_address 1 10 }  { Lam_bufB9a_ce1 mem_ce 1 1 }  { Lam_bufB9a_q1 mem_dout 0 16 } } }
	Lam_bufB3b { ap_memory {  { Lam_bufB3b_address0 mem_address 1 10 }  { Lam_bufB3b_ce0 mem_ce 1 1 }  { Lam_bufB3b_q0 mem_dout 0 16 }  { Lam_bufB3b_address1 mem_address 1 10 }  { Lam_bufB3b_ce1 mem_ce 1 1 }  { Lam_bufB3b_q1 mem_dout 0 16 } } }
	Lam_bufB9b { ap_memory {  { Lam_bufB9b_address0 mem_address 1 10 }  { Lam_bufB9b_ce0 mem_ce 1 1 }  { Lam_bufB9b_q0 mem_dout 0 16 }  { Lam_bufB9b_address1 mem_address 1 10 }  { Lam_bufB9b_ce1 mem_ce 1 1 }  { Lam_bufB9b_q1 mem_dout 0 16 } } }
	Lam_bufB4 { ap_memory {  { Lam_bufB4_address0 mem_address 1 10 }  { Lam_bufB4_ce0 mem_ce 1 1 }  { Lam_bufB4_q0 mem_dout 0 16 }  { Lam_bufB4_address1 mem_address 1 10 }  { Lam_bufB4_ce1 mem_ce 1 1 }  { Lam_bufB4_q1 mem_dout 0 16 } } }
	Lam_bufB10 { ap_memory {  { Lam_bufB10_address0 mem_address 1 10 }  { Lam_bufB10_ce0 mem_ce 1 1 }  { Lam_bufB10_q0 mem_dout 0 16 }  { Lam_bufB10_address1 mem_address 1 10 }  { Lam_bufB10_ce1 mem_ce 1 1 }  { Lam_bufB10_q1 mem_dout 0 16 } } }
	SpEtaPrevB { ap_memory {  { SpEtaPrevB_address0 mem_address 1 11 }  { SpEtaPrevB_ce0 mem_ce 1 1 }  { SpEtaPrevB_q0 mem_dout 0 16 } } }
	SpEtaPrevBa { ap_memory {  { SpEtaPrevBa_address0 mem_address 1 11 }  { SpEtaPrevBa_ce0 mem_ce 1 1 }  { SpEtaPrevBa_q0 mem_dout 0 32 } } }
	SpEtaPrevE { ap_memory {  { SpEtaPrevE_address0 mem_address 1 11 }  { SpEtaPrevE_ce0 mem_ce 1 1 }  { SpEtaPrevE_q0 mem_dout 0 16 } } }
	SpEtaPrevEa { ap_memory {  { SpEtaPrevEa_address0 mem_address 1 11 }  { SpEtaPrevEa_ce0 mem_ce 1 1 }  { SpEtaPrevEa_q0 mem_dout 0 32 } } }
	nIterationCounter { ap_none {  { nIterationCounter in_data 0 16 } } }
}
