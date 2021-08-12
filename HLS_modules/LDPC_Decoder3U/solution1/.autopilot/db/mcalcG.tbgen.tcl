set moduleName mcalcG
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {mcalcG}
set C_modelType { void 0 }
set C_modelArgList {
	{ Lam_tabg_0 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_0 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_1 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_1 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_2 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_2 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_3 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_3 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_4 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_4 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_5 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_5 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_6 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_6 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_7 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_7 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_8 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_8 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_9 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_9 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_10 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_10 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_11 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_11 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_12 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_12 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_13 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_13 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_14 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_14 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_15 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_15 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_16 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_16 int 16 regular {pointer 0} {global 0}  }
	{ Lam_tabg_17 int 16 regular {pointer 0} {global 0}  }
	{ Peta_tabg_17 int 16 regular {pointer 0} {global 0}  }
	{ Eta_ans_5_0 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_1 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_2 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_3 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_4 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_5 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_6 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_7 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_8 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_9 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_10 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_11 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_12 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_13 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_14 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_15 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_16 int 16 regular {pointer 1} {global 1}  }
	{ Eta_ans_5_17 int 16 regular {pointer 1} {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "Lam_tabg_0", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_0", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_1", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_1", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_3", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_3", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_4", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_4", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_5", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_5", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_6", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 6,"up" : 6,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_6", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 6,"up" : 6,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_7", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 7,"up" : 7,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_7", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 7,"up" : 7,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_8", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 8,"up" : 8,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_8", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 8,"up" : 8,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_9", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 9,"up" : 9,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_9", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 9,"up" : 9,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_10", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 10,"up" : 10,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_10", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 10,"up" : 10,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_11", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 11,"up" : 11,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_11", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 11,"up" : 11,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_12", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 12,"up" : 12,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_12", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 12,"up" : 12,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_13", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 13,"up" : 13,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_13", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 13,"up" : 13,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_14", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 14,"up" : 14,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_14", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 14,"up" : 14,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_15", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 15,"up" : 15,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_15", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 15,"up" : 15,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_16", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 16,"up" : 16,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_16", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 16,"up" : 16,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Lam_tabg_17", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Lam_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 17,"up" : 17,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Peta_tabg_17", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Peta_tabg","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 17,"up" : 17,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_0", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_2", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_3", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_4", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 4,"up" : 4,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_5", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 5,"up" : 5,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_6", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 6,"up" : 6,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_7", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 7,"up" : 7,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_8", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 8,"up" : 8,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_9", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 9,"up" : 9,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_10", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 10,"up" : 10,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_11", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 11,"up" : 11,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_12", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 12,"up" : 12,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_13", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 13,"up" : 13,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_14", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 14,"up" : 14,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_15", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 15,"up" : 15,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_16", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 16,"up" : 16,"step" : 2}]}]}], "extern" : 0} , 
 	{ "Name" : "Eta_ans_5_17", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "Eta_ans_5","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 17,"up" : 17,"step" : 2}]}]}], "extern" : 0} ]}
# RTL Port declarations: 
set portNum 79
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
	{ Lam_tabg_0 sc_in sc_lv 16 signal 0 } 
	{ Peta_tabg_0 sc_in sc_lv 16 signal 1 } 
	{ Lam_tabg_1 sc_in sc_lv 16 signal 2 } 
	{ Peta_tabg_1 sc_in sc_lv 16 signal 3 } 
	{ Lam_tabg_2 sc_in sc_lv 16 signal 4 } 
	{ Peta_tabg_2 sc_in sc_lv 16 signal 5 } 
	{ Lam_tabg_3 sc_in sc_lv 16 signal 6 } 
	{ Peta_tabg_3 sc_in sc_lv 16 signal 7 } 
	{ Lam_tabg_4 sc_in sc_lv 16 signal 8 } 
	{ Peta_tabg_4 sc_in sc_lv 16 signal 9 } 
	{ Lam_tabg_5 sc_in sc_lv 16 signal 10 } 
	{ Peta_tabg_5 sc_in sc_lv 16 signal 11 } 
	{ Lam_tabg_6 sc_in sc_lv 16 signal 12 } 
	{ Peta_tabg_6 sc_in sc_lv 16 signal 13 } 
	{ Lam_tabg_7 sc_in sc_lv 16 signal 14 } 
	{ Peta_tabg_7 sc_in sc_lv 16 signal 15 } 
	{ Lam_tabg_8 sc_in sc_lv 16 signal 16 } 
	{ Peta_tabg_8 sc_in sc_lv 16 signal 17 } 
	{ Lam_tabg_9 sc_in sc_lv 16 signal 18 } 
	{ Peta_tabg_9 sc_in sc_lv 16 signal 19 } 
	{ Lam_tabg_10 sc_in sc_lv 16 signal 20 } 
	{ Peta_tabg_10 sc_in sc_lv 16 signal 21 } 
	{ Lam_tabg_11 sc_in sc_lv 16 signal 22 } 
	{ Peta_tabg_11 sc_in sc_lv 16 signal 23 } 
	{ Lam_tabg_12 sc_in sc_lv 16 signal 24 } 
	{ Peta_tabg_12 sc_in sc_lv 16 signal 25 } 
	{ Lam_tabg_13 sc_in sc_lv 16 signal 26 } 
	{ Peta_tabg_13 sc_in sc_lv 16 signal 27 } 
	{ Lam_tabg_14 sc_in sc_lv 16 signal 28 } 
	{ Peta_tabg_14 sc_in sc_lv 16 signal 29 } 
	{ Lam_tabg_15 sc_in sc_lv 16 signal 30 } 
	{ Peta_tabg_15 sc_in sc_lv 16 signal 31 } 
	{ Lam_tabg_16 sc_in sc_lv 16 signal 32 } 
	{ Peta_tabg_16 sc_in sc_lv 16 signal 33 } 
	{ Lam_tabg_17 sc_in sc_lv 16 signal 34 } 
	{ Peta_tabg_17 sc_in sc_lv 16 signal 35 } 
	{ Eta_ans_5_0 sc_out sc_lv 16 signal 36 } 
	{ Eta_ans_5_0_ap_vld sc_out sc_logic 1 outvld 36 } 
	{ Eta_ans_5_1 sc_out sc_lv 16 signal 37 } 
	{ Eta_ans_5_1_ap_vld sc_out sc_logic 1 outvld 37 } 
	{ Eta_ans_5_2 sc_out sc_lv 16 signal 38 } 
	{ Eta_ans_5_2_ap_vld sc_out sc_logic 1 outvld 38 } 
	{ Eta_ans_5_3 sc_out sc_lv 16 signal 39 } 
	{ Eta_ans_5_3_ap_vld sc_out sc_logic 1 outvld 39 } 
	{ Eta_ans_5_4 sc_out sc_lv 16 signal 40 } 
	{ Eta_ans_5_4_ap_vld sc_out sc_logic 1 outvld 40 } 
	{ Eta_ans_5_5 sc_out sc_lv 16 signal 41 } 
	{ Eta_ans_5_5_ap_vld sc_out sc_logic 1 outvld 41 } 
	{ Eta_ans_5_6 sc_out sc_lv 16 signal 42 } 
	{ Eta_ans_5_6_ap_vld sc_out sc_logic 1 outvld 42 } 
	{ Eta_ans_5_7 sc_out sc_lv 16 signal 43 } 
	{ Eta_ans_5_7_ap_vld sc_out sc_logic 1 outvld 43 } 
	{ Eta_ans_5_8 sc_out sc_lv 16 signal 44 } 
	{ Eta_ans_5_8_ap_vld sc_out sc_logic 1 outvld 44 } 
	{ Eta_ans_5_9 sc_out sc_lv 16 signal 45 } 
	{ Eta_ans_5_9_ap_vld sc_out sc_logic 1 outvld 45 } 
	{ Eta_ans_5_10 sc_out sc_lv 16 signal 46 } 
	{ Eta_ans_5_10_ap_vld sc_out sc_logic 1 outvld 46 } 
	{ Eta_ans_5_11 sc_out sc_lv 16 signal 47 } 
	{ Eta_ans_5_11_ap_vld sc_out sc_logic 1 outvld 47 } 
	{ Eta_ans_5_12 sc_out sc_lv 16 signal 48 } 
	{ Eta_ans_5_12_ap_vld sc_out sc_logic 1 outvld 48 } 
	{ Eta_ans_5_13 sc_out sc_lv 16 signal 49 } 
	{ Eta_ans_5_13_ap_vld sc_out sc_logic 1 outvld 49 } 
	{ Eta_ans_5_14 sc_out sc_lv 16 signal 50 } 
	{ Eta_ans_5_14_ap_vld sc_out sc_logic 1 outvld 50 } 
	{ Eta_ans_5_15 sc_out sc_lv 16 signal 51 } 
	{ Eta_ans_5_15_ap_vld sc_out sc_logic 1 outvld 51 } 
	{ Eta_ans_5_16 sc_out sc_lv 16 signal 52 } 
	{ Eta_ans_5_16_ap_vld sc_out sc_logic 1 outvld 52 } 
	{ Eta_ans_5_17 sc_out sc_lv 16 signal 53 } 
	{ Eta_ans_5_17_ap_vld sc_out sc_logic 1 outvld 53 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }} , 
 	{ "name": "Lam_tabg_0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_0", "role": "default" }} , 
 	{ "name": "Peta_tabg_0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_0", "role": "default" }} , 
 	{ "name": "Lam_tabg_1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_1", "role": "default" }} , 
 	{ "name": "Peta_tabg_1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_1", "role": "default" }} , 
 	{ "name": "Lam_tabg_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_2", "role": "default" }} , 
 	{ "name": "Peta_tabg_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_2", "role": "default" }} , 
 	{ "name": "Lam_tabg_3", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_3", "role": "default" }} , 
 	{ "name": "Peta_tabg_3", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_3", "role": "default" }} , 
 	{ "name": "Lam_tabg_4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_4", "role": "default" }} , 
 	{ "name": "Peta_tabg_4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_4", "role": "default" }} , 
 	{ "name": "Lam_tabg_5", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_5", "role": "default" }} , 
 	{ "name": "Peta_tabg_5", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_5", "role": "default" }} , 
 	{ "name": "Lam_tabg_6", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_6", "role": "default" }} , 
 	{ "name": "Peta_tabg_6", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_6", "role": "default" }} , 
 	{ "name": "Lam_tabg_7", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_7", "role": "default" }} , 
 	{ "name": "Peta_tabg_7", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_7", "role": "default" }} , 
 	{ "name": "Lam_tabg_8", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_8", "role": "default" }} , 
 	{ "name": "Peta_tabg_8", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_8", "role": "default" }} , 
 	{ "name": "Lam_tabg_9", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_9", "role": "default" }} , 
 	{ "name": "Peta_tabg_9", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_9", "role": "default" }} , 
 	{ "name": "Lam_tabg_10", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_10", "role": "default" }} , 
 	{ "name": "Peta_tabg_10", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_10", "role": "default" }} , 
 	{ "name": "Lam_tabg_11", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_11", "role": "default" }} , 
 	{ "name": "Peta_tabg_11", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_11", "role": "default" }} , 
 	{ "name": "Lam_tabg_12", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_12", "role": "default" }} , 
 	{ "name": "Peta_tabg_12", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_12", "role": "default" }} , 
 	{ "name": "Lam_tabg_13", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_13", "role": "default" }} , 
 	{ "name": "Peta_tabg_13", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_13", "role": "default" }} , 
 	{ "name": "Lam_tabg_14", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_14", "role": "default" }} , 
 	{ "name": "Peta_tabg_14", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_14", "role": "default" }} , 
 	{ "name": "Lam_tabg_15", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_15", "role": "default" }} , 
 	{ "name": "Peta_tabg_15", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_15", "role": "default" }} , 
 	{ "name": "Lam_tabg_16", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_16", "role": "default" }} , 
 	{ "name": "Peta_tabg_16", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_16", "role": "default" }} , 
 	{ "name": "Lam_tabg_17", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Lam_tabg_17", "role": "default" }} , 
 	{ "name": "Peta_tabg_17", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Peta_tabg_17", "role": "default" }} , 
 	{ "name": "Eta_ans_5_0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_0", "role": "default" }} , 
 	{ "name": "Eta_ans_5_0_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_0", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_1", "role": "default" }} , 
 	{ "name": "Eta_ans_5_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_1", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_2", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_2", "role": "default" }} , 
 	{ "name": "Eta_ans_5_2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_2", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_3", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_3", "role": "default" }} , 
 	{ "name": "Eta_ans_5_3_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_3", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_4", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_4", "role": "default" }} , 
 	{ "name": "Eta_ans_5_4_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_4", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_5", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_5", "role": "default" }} , 
 	{ "name": "Eta_ans_5_5_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_5", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_6", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_6", "role": "default" }} , 
 	{ "name": "Eta_ans_5_6_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_6", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_7", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_7", "role": "default" }} , 
 	{ "name": "Eta_ans_5_7_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_7", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_8", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_8", "role": "default" }} , 
 	{ "name": "Eta_ans_5_8_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_8", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_9", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_9", "role": "default" }} , 
 	{ "name": "Eta_ans_5_9_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_9", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_10", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_10", "role": "default" }} , 
 	{ "name": "Eta_ans_5_10_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_10", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_11", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_11", "role": "default" }} , 
 	{ "name": "Eta_ans_5_11_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_11", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_12", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_12", "role": "default" }} , 
 	{ "name": "Eta_ans_5_12_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_12", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_13", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_13", "role": "default" }} , 
 	{ "name": "Eta_ans_5_13_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_13", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_14", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_14", "role": "default" }} , 
 	{ "name": "Eta_ans_5_14_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_14", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_15", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_15", "role": "default" }} , 
 	{ "name": "Eta_ans_5_15_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_15", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_16", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_16", "role": "default" }} , 
 	{ "name": "Eta_ans_5_16_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_16", "role": "ap_vld" }} , 
 	{ "name": "Eta_ans_5_17", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Eta_ans_5_17", "role": "default" }} , 
 	{ "name": "Eta_ans_5_17_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "Eta_ans_5_17", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "mcalcG",
		"VariableLatency" : "0",
		"AlignedPipeline" : "1",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "0",
		"ControlExist" : "1",
		"Port" : [
		{"Name" : "Lam_tabg_0", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_0", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_1", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_1", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_2", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_2", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_3", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_3", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_4", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_4", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_5", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_5", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_6", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_6", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_7", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_7", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_8", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_8", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_9", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_9", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_10", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_10", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_11", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_11", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_12", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_12", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_13", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_13", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_14", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_14", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_15", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_15", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_16", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_16", "Type" : "None", "Direction" : "I"},
		{"Name" : "Lam_tabg_17", "Type" : "None", "Direction" : "I"},
		{"Name" : "Peta_tabg_17", "Type" : "None", "Direction" : "I"},
		{"Name" : "Eta_ans_5_0", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_1", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_2", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_3", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_4", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_5", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_6", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_7", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_8", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_9", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_10", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_11", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_12", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_13", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_14", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_15", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_16", "Type" : "Vld", "Direction" : "O"},
		{"Name" : "Eta_ans_5_17", "Type" : "Vld", "Direction" : "O"}]}]}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set Spec2ImplPortList { 
	Lam_tabg_0 { ap_none {  { Lam_tabg_0 in_data 0 16 } } }
	Peta_tabg_0 { ap_none {  { Peta_tabg_0 in_data 0 16 } } }
	Lam_tabg_1 { ap_none {  { Lam_tabg_1 in_data 0 16 } } }
	Peta_tabg_1 { ap_none {  { Peta_tabg_1 in_data 0 16 } } }
	Lam_tabg_2 { ap_none {  { Lam_tabg_2 in_data 0 16 } } }
	Peta_tabg_2 { ap_none {  { Peta_tabg_2 in_data 0 16 } } }
	Lam_tabg_3 { ap_none {  { Lam_tabg_3 in_data 0 16 } } }
	Peta_tabg_3 { ap_none {  { Peta_tabg_3 in_data 0 16 } } }
	Lam_tabg_4 { ap_none {  { Lam_tabg_4 in_data 0 16 } } }
	Peta_tabg_4 { ap_none {  { Peta_tabg_4 in_data 0 16 } } }
	Lam_tabg_5 { ap_none {  { Lam_tabg_5 in_data 0 16 } } }
	Peta_tabg_5 { ap_none {  { Peta_tabg_5 in_data 0 16 } } }
	Lam_tabg_6 { ap_none {  { Lam_tabg_6 in_data 0 16 } } }
	Peta_tabg_6 { ap_none {  { Peta_tabg_6 in_data 0 16 } } }
	Lam_tabg_7 { ap_none {  { Lam_tabg_7 in_data 0 16 } } }
	Peta_tabg_7 { ap_none {  { Peta_tabg_7 in_data 0 16 } } }
	Lam_tabg_8 { ap_none {  { Lam_tabg_8 in_data 0 16 } } }
	Peta_tabg_8 { ap_none {  { Peta_tabg_8 in_data 0 16 } } }
	Lam_tabg_9 { ap_none {  { Lam_tabg_9 in_data 0 16 } } }
	Peta_tabg_9 { ap_none {  { Peta_tabg_9 in_data 0 16 } } }
	Lam_tabg_10 { ap_none {  { Lam_tabg_10 in_data 0 16 } } }
	Peta_tabg_10 { ap_none {  { Peta_tabg_10 in_data 0 16 } } }
	Lam_tabg_11 { ap_none {  { Lam_tabg_11 in_data 0 16 } } }
	Peta_tabg_11 { ap_none {  { Peta_tabg_11 in_data 0 16 } } }
	Lam_tabg_12 { ap_none {  { Lam_tabg_12 in_data 0 16 } } }
	Peta_tabg_12 { ap_none {  { Peta_tabg_12 in_data 0 16 } } }
	Lam_tabg_13 { ap_none {  { Lam_tabg_13 in_data 0 16 } } }
	Peta_tabg_13 { ap_none {  { Peta_tabg_13 in_data 0 16 } } }
	Lam_tabg_14 { ap_none {  { Lam_tabg_14 in_data 0 16 } } }
	Peta_tabg_14 { ap_none {  { Peta_tabg_14 in_data 0 16 } } }
	Lam_tabg_15 { ap_none {  { Lam_tabg_15 in_data 0 16 } } }
	Peta_tabg_15 { ap_none {  { Peta_tabg_15 in_data 0 16 } } }
	Lam_tabg_16 { ap_none {  { Lam_tabg_16 in_data 0 16 } } }
	Peta_tabg_16 { ap_none {  { Peta_tabg_16 in_data 0 16 } } }
	Lam_tabg_17 { ap_none {  { Lam_tabg_17 in_data 0 16 } } }
	Peta_tabg_17 { ap_none {  { Peta_tabg_17 in_data 0 16 } } }
	Eta_ans_5_0 { ap_vld {  { Eta_ans_5_0 out_data 1 16 }  { Eta_ans_5_0_ap_vld out_vld 1 1 } } }
	Eta_ans_5_1 { ap_vld {  { Eta_ans_5_1 out_data 1 16 }  { Eta_ans_5_1_ap_vld out_vld 1 1 } } }
	Eta_ans_5_2 { ap_vld {  { Eta_ans_5_2 out_data 1 16 }  { Eta_ans_5_2_ap_vld out_vld 1 1 } } }
	Eta_ans_5_3 { ap_vld {  { Eta_ans_5_3 out_data 1 16 }  { Eta_ans_5_3_ap_vld out_vld 1 1 } } }
	Eta_ans_5_4 { ap_vld {  { Eta_ans_5_4 out_data 1 16 }  { Eta_ans_5_4_ap_vld out_vld 1 1 } } }
	Eta_ans_5_5 { ap_vld {  { Eta_ans_5_5 out_data 1 16 }  { Eta_ans_5_5_ap_vld out_vld 1 1 } } }
	Eta_ans_5_6 { ap_vld {  { Eta_ans_5_6 out_data 1 16 }  { Eta_ans_5_6_ap_vld out_vld 1 1 } } }
	Eta_ans_5_7 { ap_vld {  { Eta_ans_5_7 out_data 1 16 }  { Eta_ans_5_7_ap_vld out_vld 1 1 } } }
	Eta_ans_5_8 { ap_vld {  { Eta_ans_5_8 out_data 1 16 }  { Eta_ans_5_8_ap_vld out_vld 1 1 } } }
	Eta_ans_5_9 { ap_vld {  { Eta_ans_5_9 out_data 1 16 }  { Eta_ans_5_9_ap_vld out_vld 1 1 } } }
	Eta_ans_5_10 { ap_vld {  { Eta_ans_5_10 out_data 1 16 }  { Eta_ans_5_10_ap_vld out_vld 1 1 } } }
	Eta_ans_5_11 { ap_vld {  { Eta_ans_5_11 out_data 1 16 }  { Eta_ans_5_11_ap_vld out_vld 1 1 } } }
	Eta_ans_5_12 { ap_vld {  { Eta_ans_5_12 out_data 1 16 }  { Eta_ans_5_12_ap_vld out_vld 1 1 } } }
	Eta_ans_5_13 { ap_vld {  { Eta_ans_5_13 out_data 1 16 }  { Eta_ans_5_13_ap_vld out_vld 1 1 } } }
	Eta_ans_5_14 { ap_vld {  { Eta_ans_5_14 out_data 1 16 }  { Eta_ans_5_14_ap_vld out_vld 1 1 } } }
	Eta_ans_5_15 { ap_vld {  { Eta_ans_5_15 out_data 1 16 }  { Eta_ans_5_15_ap_vld out_vld 1 1 } } }
	Eta_ans_5_16 { ap_vld {  { Eta_ans_5_16 out_data 1 16 }  { Eta_ans_5_16_ap_vld out_vld 1 1 } } }
	Eta_ans_5_17 { ap_vld {  { Eta_ans_5_17 out_data 1 16 }  { Eta_ans_5_17_ap_vld out_vld 1 1 } } }
}
