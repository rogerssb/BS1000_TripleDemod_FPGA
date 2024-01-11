// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module update_prev_est_23 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        inxtab_2,
        numb,
        Eta_ans_2_V_0,
        Eta_ans_2_V_1,
        SpEtaPrevB_address0,
        SpEtaPrevB_ce0,
        SpEtaPrevB_we0,
        SpEtaPrevB_d0,
        Eta_ans_2_V_2,
        Eta_ans_2_V_3,
        Eta_ans_2_V_4,
        Eta_ans_2_V_5,
        SpEtaPrevBa_address0,
        SpEtaPrevBa_ce0,
        SpEtaPrevBa_we0,
        SpEtaPrevBa_d0,
        Eta_ans_2_V_6,
        Eta_ans_2_V_7,
        Eta_ans_2_V_8,
        Eta_ans_2_V_9,
        SpEtaPrevBb_address0,
        SpEtaPrevBb_ce0,
        SpEtaPrevBb_we0,
        SpEtaPrevBb_d0,
        Eta_ans_5_V_0,
        Eta_ans_5_V_1,
        SpEtaPrevE_address0,
        SpEtaPrevE_ce0,
        SpEtaPrevE_we0,
        SpEtaPrevE_d0,
        Eta_ans_5_V_2,
        Eta_ans_5_V_3,
        Eta_ans_5_V_4,
        Eta_ans_5_V_5,
        SpEtaPrevEa_address0,
        SpEtaPrevEa_ce0,
        SpEtaPrevEa_we0,
        SpEtaPrevEa_d0,
        Eta_ans_5_V_6,
        Eta_ans_5_V_7,
        Eta_ans_5_V_8,
        Eta_ans_5_V_9,
        SpEtaPrevEb_address0,
        SpEtaPrevEb_ce0,
        SpEtaPrevEb_we0,
        SpEtaPrevEb_d0,
        Eta_ans_8_V_0,
        Eta_ans_8_V_1,
        SpEtaPrevB_new_address0,
        SpEtaPrevB_new_ce0,
        SpEtaPrevB_new_we0,
        SpEtaPrevB_new_d0,
        Eta_ans_8_V_2,
        Eta_ans_8_V_3,
        Eta_ans_8_V_4,
        Eta_ans_8_V_5,
        SpEtaPrevBa_new_address0,
        SpEtaPrevBa_new_ce0,
        SpEtaPrevBa_new_we0,
        SpEtaPrevBa_new_d0,
        Eta_ans_8_V_6,
        Eta_ans_8_V_7,
        Eta_ans_8_V_8,
        Eta_ans_8_V_9,
        SpEtaPrevBb_new_address0,
        SpEtaPrevBb_new_ce0,
        SpEtaPrevBb_new_we0,
        SpEtaPrevBb_new_d0,
        Eta_ans_11_V_0,
        Eta_ans_11_V_1,
        SpEtaPrevE_new_address0,
        SpEtaPrevE_new_ce0,
        SpEtaPrevE_new_we0,
        SpEtaPrevE_new_d0,
        Eta_ans_11_V_2,
        Eta_ans_11_V_3,
        Eta_ans_11_V_4,
        Eta_ans_11_V_5,
        SpEtaPrevEa_new_address0,
        SpEtaPrevEa_new_ce0,
        SpEtaPrevEa_new_we0,
        SpEtaPrevEa_new_d0,
        Eta_ans_11_V_6,
        Eta_ans_11_V_7,
        Eta_ans_11_V_8,
        Eta_ans_11_V_9,
        SpEtaPrevEb_new_address0,
        SpEtaPrevEb_new_ce0,
        SpEtaPrevEb_new_we0,
        SpEtaPrevEb_new_d0,
        Eta_ans_V_0,
        SpEtaPrev_address0,
        SpEtaPrev_ce0,
        SpEtaPrev_we0,
        SpEtaPrev_d0,
        SpEtaPrev_q0,
        Eta_ans_V_1,
        Eta_ans_V_2,
        Eta_ans_3_V_0,
        SpEtaPrevC_address0,
        SpEtaPrevC_ce0,
        SpEtaPrevC_we0,
        SpEtaPrevC_d0,
        SpEtaPrevC_q0,
        Eta_ans_3_V_1,
        Eta_ans_3_V_2,
        Eta_ans_6_V_0,
        SpEtaPrev_new_address0,
        SpEtaPrev_new_ce0,
        SpEtaPrev_new_we0,
        SpEtaPrev_new_d0,
        SpEtaPrev_new_q0,
        Eta_ans_6_V_1,
        Eta_ans_6_V_2,
        Eta_ans_9_V_0,
        SpEtaPrevC_new_address0,
        SpEtaPrevC_new_ce0,
        SpEtaPrevC_new_we0,
        SpEtaPrevC_new_d0,
        SpEtaPrevC_new_q0,
        Eta_ans_9_V_1,
        Eta_ans_9_V_2,
        Eta_ans_1_V_0,
        Eta_ans_1_V_1,
        SpEtaPrevA_address0,
        SpEtaPrevA_ce0,
        SpEtaPrevA_we0,
        SpEtaPrevA_d0,
        Eta_ans_1_V_2,
        Eta_ans_1_V_3,
        Eta_ans_1_V_4,
        Eta_ans_1_V_5,
        SpEtaPrevAa_address0,
        SpEtaPrevAa_ce0,
        SpEtaPrevAa_we0,
        SpEtaPrevAa_d0,
        Eta_ans_1_V_6,
        Eta_ans_1_V_7,
        Eta_ans_1_V_8,
        Eta_ans_1_V_9,
        SpEtaPrevAb_address0,
        SpEtaPrevAb_ce0,
        SpEtaPrevAb_we0,
        SpEtaPrevAb_d0,
        Eta_ans_4_V_0,
        Eta_ans_4_V_1,
        SpEtaPrevD_address0,
        SpEtaPrevD_ce0,
        SpEtaPrevD_we0,
        SpEtaPrevD_d0,
        Eta_ans_4_V_2,
        Eta_ans_4_V_3,
        Eta_ans_4_V_4,
        Eta_ans_4_V_5,
        SpEtaPrevDa_address0,
        SpEtaPrevDa_ce0,
        SpEtaPrevDa_we0,
        SpEtaPrevDa_d0,
        Eta_ans_4_V_6,
        Eta_ans_4_V_7,
        Eta_ans_4_V_8,
        Eta_ans_4_V_9,
        SpEtaPrevDb_address0,
        SpEtaPrevDb_ce0,
        SpEtaPrevDb_we0,
        SpEtaPrevDb_d0,
        Eta_ans_7_V_0,
        Eta_ans_7_V_1,
        SpEtaPrevA_new_address0,
        SpEtaPrevA_new_ce0,
        SpEtaPrevA_new_we0,
        SpEtaPrevA_new_d0,
        Eta_ans_7_V_2,
        Eta_ans_7_V_3,
        Eta_ans_7_V_4,
        Eta_ans_7_V_5,
        SpEtaPrevAa_new_address0,
        SpEtaPrevAa_new_ce0,
        SpEtaPrevAa_new_we0,
        SpEtaPrevAa_new_d0,
        Eta_ans_7_V_6,
        Eta_ans_7_V_7,
        Eta_ans_7_V_8,
        Eta_ans_7_V_9,
        SpEtaPrevAb_new_address0,
        SpEtaPrevAb_new_ce0,
        SpEtaPrevAb_new_we0,
        SpEtaPrevAb_new_d0,
        Eta_ans_10_V_0,
        Eta_ans_10_V_1,
        SpEtaPrevD_new_address0,
        SpEtaPrevD_new_ce0,
        SpEtaPrevD_new_we0,
        SpEtaPrevD_new_d0,
        Eta_ans_10_V_2,
        Eta_ans_10_V_3,
        Eta_ans_10_V_4,
        Eta_ans_10_V_5,
        SpEtaPrevDa_new_address0,
        SpEtaPrevDa_new_ce0,
        SpEtaPrevDa_new_we0,
        SpEtaPrevDa_new_d0,
        Eta_ans_10_V_6,
        Eta_ans_10_V_7,
        Eta_ans_10_V_8,
        Eta_ans_10_V_9,
        SpEtaPrevDb_new_address0,
        SpEtaPrevDb_new_ce0,
        SpEtaPrevDb_new_we0,
        SpEtaPrevDb_new_d0
);

parameter    ap_ST_fsm_state1 = 2'b1;
parameter    ap_ST_fsm_state2 = 2'b10;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv16_600 = 16'b11000000000;
parameter    ap_const_lv16_40 = 16'b1000000;
parameter    ap_const_lv16_100 = 16'b100000000;
parameter    ap_const_lv32_17 = 32'b10111;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [15:0] inxtab_2;
input  [15:0] numb;
input  [7:0] Eta_ans_2_V_0;
input  [7:0] Eta_ans_2_V_1;
output  [8:0] SpEtaPrevB_address0;
output   SpEtaPrevB_ce0;
output   SpEtaPrevB_we0;
output  [15:0] SpEtaPrevB_d0;
input  [7:0] Eta_ans_2_V_2;
input  [7:0] Eta_ans_2_V_3;
input  [7:0] Eta_ans_2_V_4;
input  [7:0] Eta_ans_2_V_5;
output  [8:0] SpEtaPrevBa_address0;
output   SpEtaPrevBa_ce0;
output   SpEtaPrevBa_we0;
output  [31:0] SpEtaPrevBa_d0;
input  [7:0] Eta_ans_2_V_6;
input  [7:0] Eta_ans_2_V_7;
input  [7:0] Eta_ans_2_V_8;
input  [7:0] Eta_ans_2_V_9;
output  [8:0] SpEtaPrevBb_address0;
output   SpEtaPrevBb_ce0;
output   SpEtaPrevBb_we0;
output  [31:0] SpEtaPrevBb_d0;
input  [7:0] Eta_ans_5_V_0;
input  [7:0] Eta_ans_5_V_1;
output  [8:0] SpEtaPrevE_address0;
output   SpEtaPrevE_ce0;
output   SpEtaPrevE_we0;
output  [15:0] SpEtaPrevE_d0;
input  [7:0] Eta_ans_5_V_2;
input  [7:0] Eta_ans_5_V_3;
input  [7:0] Eta_ans_5_V_4;
input  [7:0] Eta_ans_5_V_5;
output  [8:0] SpEtaPrevEa_address0;
output   SpEtaPrevEa_ce0;
output   SpEtaPrevEa_we0;
output  [31:0] SpEtaPrevEa_d0;
input  [7:0] Eta_ans_5_V_6;
input  [7:0] Eta_ans_5_V_7;
input  [7:0] Eta_ans_5_V_8;
input  [7:0] Eta_ans_5_V_9;
output  [8:0] SpEtaPrevEb_address0;
output   SpEtaPrevEb_ce0;
output   SpEtaPrevEb_we0;
output  [31:0] SpEtaPrevEb_d0;
input  [7:0] Eta_ans_8_V_0;
input  [7:0] Eta_ans_8_V_1;
output  [8:0] SpEtaPrevB_new_address0;
output   SpEtaPrevB_new_ce0;
output   SpEtaPrevB_new_we0;
output  [15:0] SpEtaPrevB_new_d0;
input  [7:0] Eta_ans_8_V_2;
input  [7:0] Eta_ans_8_V_3;
input  [7:0] Eta_ans_8_V_4;
input  [7:0] Eta_ans_8_V_5;
output  [8:0] SpEtaPrevBa_new_address0;
output   SpEtaPrevBa_new_ce0;
output   SpEtaPrevBa_new_we0;
output  [31:0] SpEtaPrevBa_new_d0;
input  [7:0] Eta_ans_8_V_6;
input  [7:0] Eta_ans_8_V_7;
input  [7:0] Eta_ans_8_V_8;
input  [7:0] Eta_ans_8_V_9;
output  [8:0] SpEtaPrevBb_new_address0;
output   SpEtaPrevBb_new_ce0;
output   SpEtaPrevBb_new_we0;
output  [31:0] SpEtaPrevBb_new_d0;
input  [7:0] Eta_ans_11_V_0;
input  [7:0] Eta_ans_11_V_1;
output  [8:0] SpEtaPrevE_new_address0;
output   SpEtaPrevE_new_ce0;
output   SpEtaPrevE_new_we0;
output  [15:0] SpEtaPrevE_new_d0;
input  [7:0] Eta_ans_11_V_2;
input  [7:0] Eta_ans_11_V_3;
input  [7:0] Eta_ans_11_V_4;
input  [7:0] Eta_ans_11_V_5;
output  [8:0] SpEtaPrevEa_new_address0;
output   SpEtaPrevEa_new_ce0;
output   SpEtaPrevEa_new_we0;
output  [31:0] SpEtaPrevEa_new_d0;
input  [7:0] Eta_ans_11_V_6;
input  [7:0] Eta_ans_11_V_7;
input  [7:0] Eta_ans_11_V_8;
input  [7:0] Eta_ans_11_V_9;
output  [8:0] SpEtaPrevEb_new_address0;
output   SpEtaPrevEb_new_ce0;
output   SpEtaPrevEb_new_we0;
output  [31:0] SpEtaPrevEb_new_d0;
input  [7:0] Eta_ans_V_0;
output  [8:0] SpEtaPrev_address0;
output   SpEtaPrev_ce0;
output   SpEtaPrev_we0;
output  [31:0] SpEtaPrev_d0;
input  [31:0] SpEtaPrev_q0;
input  [7:0] Eta_ans_V_1;
input  [7:0] Eta_ans_V_2;
input  [7:0] Eta_ans_3_V_0;
output  [8:0] SpEtaPrevC_address0;
output   SpEtaPrevC_ce0;
output   SpEtaPrevC_we0;
output  [31:0] SpEtaPrevC_d0;
input  [31:0] SpEtaPrevC_q0;
input  [7:0] Eta_ans_3_V_1;
input  [7:0] Eta_ans_3_V_2;
input  [7:0] Eta_ans_6_V_0;
output  [8:0] SpEtaPrev_new_address0;
output   SpEtaPrev_new_ce0;
output   SpEtaPrev_new_we0;
output  [31:0] SpEtaPrev_new_d0;
input  [31:0] SpEtaPrev_new_q0;
input  [7:0] Eta_ans_6_V_1;
input  [7:0] Eta_ans_6_V_2;
input  [7:0] Eta_ans_9_V_0;
output  [8:0] SpEtaPrevC_new_address0;
output   SpEtaPrevC_new_ce0;
output   SpEtaPrevC_new_we0;
output  [31:0] SpEtaPrevC_new_d0;
input  [31:0] SpEtaPrevC_new_q0;
input  [7:0] Eta_ans_9_V_1;
input  [7:0] Eta_ans_9_V_2;
input  [7:0] Eta_ans_1_V_0;
input  [7:0] Eta_ans_1_V_1;
output  [8:0] SpEtaPrevA_address0;
output   SpEtaPrevA_ce0;
output   SpEtaPrevA_we0;
output  [15:0] SpEtaPrevA_d0;
input  [7:0] Eta_ans_1_V_2;
input  [7:0] Eta_ans_1_V_3;
input  [7:0] Eta_ans_1_V_4;
input  [7:0] Eta_ans_1_V_5;
output  [8:0] SpEtaPrevAa_address0;
output   SpEtaPrevAa_ce0;
output   SpEtaPrevAa_we0;
output  [31:0] SpEtaPrevAa_d0;
input  [7:0] Eta_ans_1_V_6;
input  [7:0] Eta_ans_1_V_7;
input  [7:0] Eta_ans_1_V_8;
input  [7:0] Eta_ans_1_V_9;
output  [8:0] SpEtaPrevAb_address0;
output   SpEtaPrevAb_ce0;
output   SpEtaPrevAb_we0;
output  [31:0] SpEtaPrevAb_d0;
input  [7:0] Eta_ans_4_V_0;
input  [7:0] Eta_ans_4_V_1;
output  [8:0] SpEtaPrevD_address0;
output   SpEtaPrevD_ce0;
output   SpEtaPrevD_we0;
output  [15:0] SpEtaPrevD_d0;
input  [7:0] Eta_ans_4_V_2;
input  [7:0] Eta_ans_4_V_3;
input  [7:0] Eta_ans_4_V_4;
input  [7:0] Eta_ans_4_V_5;
output  [8:0] SpEtaPrevDa_address0;
output   SpEtaPrevDa_ce0;
output   SpEtaPrevDa_we0;
output  [31:0] SpEtaPrevDa_d0;
input  [7:0] Eta_ans_4_V_6;
input  [7:0] Eta_ans_4_V_7;
input  [7:0] Eta_ans_4_V_8;
input  [7:0] Eta_ans_4_V_9;
output  [8:0] SpEtaPrevDb_address0;
output   SpEtaPrevDb_ce0;
output   SpEtaPrevDb_we0;
output  [31:0] SpEtaPrevDb_d0;
input  [7:0] Eta_ans_7_V_0;
input  [7:0] Eta_ans_7_V_1;
output  [8:0] SpEtaPrevA_new_address0;
output   SpEtaPrevA_new_ce0;
output   SpEtaPrevA_new_we0;
output  [15:0] SpEtaPrevA_new_d0;
input  [7:0] Eta_ans_7_V_2;
input  [7:0] Eta_ans_7_V_3;
input  [7:0] Eta_ans_7_V_4;
input  [7:0] Eta_ans_7_V_5;
output  [8:0] SpEtaPrevAa_new_address0;
output   SpEtaPrevAa_new_ce0;
output   SpEtaPrevAa_new_we0;
output  [31:0] SpEtaPrevAa_new_d0;
input  [7:0] Eta_ans_7_V_6;
input  [7:0] Eta_ans_7_V_7;
input  [7:0] Eta_ans_7_V_8;
input  [7:0] Eta_ans_7_V_9;
output  [8:0] SpEtaPrevAb_new_address0;
output   SpEtaPrevAb_new_ce0;
output   SpEtaPrevAb_new_we0;
output  [31:0] SpEtaPrevAb_new_d0;
input  [7:0] Eta_ans_10_V_0;
input  [7:0] Eta_ans_10_V_1;
output  [8:0] SpEtaPrevD_new_address0;
output   SpEtaPrevD_new_ce0;
output   SpEtaPrevD_new_we0;
output  [15:0] SpEtaPrevD_new_d0;
input  [7:0] Eta_ans_10_V_2;
input  [7:0] Eta_ans_10_V_3;
input  [7:0] Eta_ans_10_V_4;
input  [7:0] Eta_ans_10_V_5;
output  [8:0] SpEtaPrevDa_new_address0;
output   SpEtaPrevDa_new_ce0;
output   SpEtaPrevDa_new_we0;
output  [31:0] SpEtaPrevDa_new_d0;
input  [7:0] Eta_ans_10_V_6;
input  [7:0] Eta_ans_10_V_7;
input  [7:0] Eta_ans_10_V_8;
input  [7:0] Eta_ans_10_V_9;
output  [8:0] SpEtaPrevDb_new_address0;
output   SpEtaPrevDb_new_ce0;
output   SpEtaPrevDb_new_we0;
output  [31:0] SpEtaPrevDb_new_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg SpEtaPrevB_ce0;
reg SpEtaPrevB_we0;
reg SpEtaPrevBa_ce0;
reg SpEtaPrevBa_we0;
reg SpEtaPrevBb_ce0;
reg SpEtaPrevBb_we0;
reg SpEtaPrevE_ce0;
reg SpEtaPrevE_we0;
reg SpEtaPrevEa_ce0;
reg SpEtaPrevEa_we0;
reg SpEtaPrevEb_ce0;
reg SpEtaPrevEb_we0;
reg SpEtaPrevB_new_ce0;
reg SpEtaPrevB_new_we0;
reg SpEtaPrevBa_new_ce0;
reg SpEtaPrevBa_new_we0;
reg SpEtaPrevBb_new_ce0;
reg SpEtaPrevBb_new_we0;
reg SpEtaPrevE_new_ce0;
reg SpEtaPrevE_new_we0;
reg SpEtaPrevEa_new_ce0;
reg SpEtaPrevEa_new_we0;
reg SpEtaPrevEb_new_ce0;
reg SpEtaPrevEb_new_we0;
reg[8:0] SpEtaPrev_address0;
reg SpEtaPrev_ce0;
reg SpEtaPrev_we0;
reg[8:0] SpEtaPrevC_address0;
reg SpEtaPrevC_ce0;
reg SpEtaPrevC_we0;
reg[8:0] SpEtaPrev_new_address0;
reg SpEtaPrev_new_ce0;
reg SpEtaPrev_new_we0;
reg[8:0] SpEtaPrevC_new_address0;
reg SpEtaPrevC_new_ce0;
reg SpEtaPrevC_new_we0;
reg SpEtaPrevA_ce0;
reg SpEtaPrevA_we0;
reg SpEtaPrevAa_ce0;
reg SpEtaPrevAa_we0;
reg SpEtaPrevAb_ce0;
reg SpEtaPrevAb_we0;
reg SpEtaPrevD_ce0;
reg SpEtaPrevD_we0;
reg SpEtaPrevDa_ce0;
reg SpEtaPrevDa_we0;
reg SpEtaPrevDb_ce0;
reg SpEtaPrevDb_we0;
reg SpEtaPrevA_new_ce0;
reg SpEtaPrevA_new_we0;
reg SpEtaPrevAa_new_ce0;
reg SpEtaPrevAa_new_we0;
reg SpEtaPrevAb_new_ce0;
reg SpEtaPrevAb_new_we0;
reg SpEtaPrevD_new_ce0;
reg SpEtaPrevD_new_we0;
reg SpEtaPrevDa_new_ce0;
reg SpEtaPrevDa_new_we0;
reg SpEtaPrevDb_new_ce0;
reg SpEtaPrevDb_new_we0;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire   [0:0] ap_CS_fsm_state1;
reg   [8:0] SpEtaPrev_addr_reg_1402;
reg   [8:0] SpEtaPrevC_addr_reg_1407;
reg   [8:0] SpEtaPrev_new_addr_reg_1412;
reg   [8:0] SpEtaPrevC_new_addr_reg_1417;
wire  signed [31:0] tmp_s_fu_626_p1;
wire  signed [31:0] tmp_183_fu_719_p1;
wire   [0:0] ap_CS_fsm_state2;
wire   [0:0] tmp_fu_606_p2;
wire   [15:0] inx1_0_v_cast_cast_fu_612_p3;
wire   [15:0] inx1_fu_620_p2;
wire   [23:0] tmp_6_fu_1274_p4;
wire   [23:0] tmp_7_fu_1309_p4;
wire   [23:0] tmp_8_fu_1344_p4;
wire   [23:0] tmp_9_fu_1379_p4;
reg   [1:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'b1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevC_addr_reg_1407 <= tmp_183_fu_719_p1;
        SpEtaPrevC_new_addr_reg_1417 <= tmp_183_fu_719_p1;
        SpEtaPrev_addr_reg_1402 <= tmp_s_fu_626_p1;
        SpEtaPrev_new_addr_reg_1412 <= tmp_s_fu_626_p1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevA_ce0 = 1'b1;
    end else begin
        SpEtaPrevA_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevA_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevA_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevA_new_we0 = 1'b1;
    end else begin
        SpEtaPrevA_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevA_we0 = 1'b1;
    end else begin
        SpEtaPrevA_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevAa_ce0 = 1'b1;
    end else begin
        SpEtaPrevAa_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevAa_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevAa_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevAa_new_we0 = 1'b1;
    end else begin
        SpEtaPrevAa_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevAa_we0 = 1'b1;
    end else begin
        SpEtaPrevAa_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevAb_ce0 = 1'b1;
    end else begin
        SpEtaPrevAb_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevAb_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevAb_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevAb_new_we0 = 1'b1;
    end else begin
        SpEtaPrevAb_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevAb_we0 = 1'b1;
    end else begin
        SpEtaPrevAb_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevB_ce0 = 1'b1;
    end else begin
        SpEtaPrevB_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevB_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevB_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevB_new_we0 = 1'b1;
    end else begin
        SpEtaPrevB_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevB_we0 = 1'b1;
    end else begin
        SpEtaPrevB_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevBa_ce0 = 1'b1;
    end else begin
        SpEtaPrevBa_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevBa_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevBa_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevBa_new_we0 = 1'b1;
    end else begin
        SpEtaPrevBa_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevBa_we0 = 1'b1;
    end else begin
        SpEtaPrevBa_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevBb_ce0 = 1'b1;
    end else begin
        SpEtaPrevBb_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevBb_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevBb_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevBb_new_we0 = 1'b1;
    end else begin
        SpEtaPrevBb_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevBb_we0 = 1'b1;
    end else begin
        SpEtaPrevBb_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        SpEtaPrevC_address0 = SpEtaPrevC_addr_reg_1407;
    end else if ((ap_CS_fsm_state1 == 1'b1)) begin
        SpEtaPrevC_address0 = tmp_183_fu_719_p1;
    end else begin
        SpEtaPrevC_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0)) | (1'b1 == ap_CS_fsm_state2))) begin
        SpEtaPrevC_ce0 = 1'b1;
    end else begin
        SpEtaPrevC_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        SpEtaPrevC_new_address0 = SpEtaPrevC_new_addr_reg_1417;
    end else if ((ap_CS_fsm_state1 == 1'b1)) begin
        SpEtaPrevC_new_address0 = tmp_183_fu_719_p1;
    end else begin
        SpEtaPrevC_new_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0)) | (1'b1 == ap_CS_fsm_state2))) begin
        SpEtaPrevC_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevC_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        SpEtaPrevC_new_we0 = 1'b1;
    end else begin
        SpEtaPrevC_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        SpEtaPrevC_we0 = 1'b1;
    end else begin
        SpEtaPrevC_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevD_ce0 = 1'b1;
    end else begin
        SpEtaPrevD_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevD_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevD_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevD_new_we0 = 1'b1;
    end else begin
        SpEtaPrevD_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevD_we0 = 1'b1;
    end else begin
        SpEtaPrevD_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevDa_ce0 = 1'b1;
    end else begin
        SpEtaPrevDa_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevDa_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevDa_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevDa_new_we0 = 1'b1;
    end else begin
        SpEtaPrevDa_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevDa_we0 = 1'b1;
    end else begin
        SpEtaPrevDa_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevDb_ce0 = 1'b1;
    end else begin
        SpEtaPrevDb_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevDb_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevDb_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevDb_new_we0 = 1'b1;
    end else begin
        SpEtaPrevDb_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevDb_we0 = 1'b1;
    end else begin
        SpEtaPrevDb_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevE_ce0 = 1'b1;
    end else begin
        SpEtaPrevE_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevE_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevE_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevE_new_we0 = 1'b1;
    end else begin
        SpEtaPrevE_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevE_we0 = 1'b1;
    end else begin
        SpEtaPrevE_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevEa_ce0 = 1'b1;
    end else begin
        SpEtaPrevEa_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevEa_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevEa_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevEa_new_we0 = 1'b1;
    end else begin
        SpEtaPrevEa_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevEa_we0 = 1'b1;
    end else begin
        SpEtaPrevEa_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevEb_ce0 = 1'b1;
    end else begin
        SpEtaPrevEb_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevEb_new_ce0 = 1'b1;
    end else begin
        SpEtaPrevEb_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevEb_new_we0 = 1'b1;
    end else begin
        SpEtaPrevEb_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        SpEtaPrevEb_we0 = 1'b1;
    end else begin
        SpEtaPrevEb_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        SpEtaPrev_address0 = SpEtaPrev_addr_reg_1402;
    end else if ((ap_CS_fsm_state1 == 1'b1)) begin
        SpEtaPrev_address0 = tmp_s_fu_626_p1;
    end else begin
        SpEtaPrev_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0)) | (1'b1 == ap_CS_fsm_state2))) begin
        SpEtaPrev_ce0 = 1'b1;
    end else begin
        SpEtaPrev_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        SpEtaPrev_new_address0 = SpEtaPrev_new_addr_reg_1412;
    end else if ((ap_CS_fsm_state1 == 1'b1)) begin
        SpEtaPrev_new_address0 = tmp_s_fu_626_p1;
    end else begin
        SpEtaPrev_new_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0)) | (1'b1 == ap_CS_fsm_state2))) begin
        SpEtaPrev_new_ce0 = 1'b1;
    end else begin
        SpEtaPrev_new_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        SpEtaPrev_new_we0 = 1'b1;
    end else begin
        SpEtaPrev_new_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        SpEtaPrev_we0 = 1'b1;
    end else begin
        SpEtaPrev_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_start) & (ap_CS_fsm_state1 == 1'b1)) | (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (ap_CS_fsm_state1 == 1'b1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (~(ap_start == 1'b0)) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign SpEtaPrevA_address0 = tmp_s_fu_626_p1;

assign SpEtaPrevA_d0 = {{Eta_ans_1_V_1}, {Eta_ans_1_V_0}};

assign SpEtaPrevA_new_address0 = tmp_s_fu_626_p1;

assign SpEtaPrevA_new_d0 = {{Eta_ans_7_V_1}, {Eta_ans_7_V_0}};

assign SpEtaPrevAa_address0 = tmp_s_fu_626_p1;

assign SpEtaPrevAa_d0 = {{{{Eta_ans_1_V_5}, {Eta_ans_1_V_4}}, {Eta_ans_1_V_3}}, {Eta_ans_1_V_2}};

assign SpEtaPrevAa_new_address0 = tmp_s_fu_626_p1;

assign SpEtaPrevAa_new_d0 = {{{{Eta_ans_7_V_5}, {Eta_ans_7_V_4}}, {Eta_ans_7_V_3}}, {Eta_ans_7_V_2}};

assign SpEtaPrevAb_address0 = tmp_s_fu_626_p1;

assign SpEtaPrevAb_d0 = {{{{Eta_ans_1_V_9}, {Eta_ans_1_V_8}}, {Eta_ans_1_V_7}}, {Eta_ans_1_V_6}};

assign SpEtaPrevAb_new_address0 = tmp_s_fu_626_p1;

assign SpEtaPrevAb_new_d0 = {{{{Eta_ans_7_V_9}, {Eta_ans_7_V_8}}, {Eta_ans_7_V_7}}, {Eta_ans_7_V_6}};

assign SpEtaPrevB_address0 = tmp_s_fu_626_p1;

assign SpEtaPrevB_d0 = {{Eta_ans_2_V_1}, {Eta_ans_2_V_0}};

assign SpEtaPrevB_new_address0 = tmp_s_fu_626_p1;

assign SpEtaPrevB_new_d0 = {{Eta_ans_8_V_1}, {Eta_ans_8_V_0}};

assign SpEtaPrevBa_address0 = tmp_s_fu_626_p1;

assign SpEtaPrevBa_d0 = {{{{Eta_ans_2_V_5}, {Eta_ans_2_V_4}}, {Eta_ans_2_V_3}}, {Eta_ans_2_V_2}};

assign SpEtaPrevBa_new_address0 = tmp_s_fu_626_p1;

assign SpEtaPrevBa_new_d0 = {{{{Eta_ans_8_V_5}, {Eta_ans_8_V_4}}, {Eta_ans_8_V_3}}, {Eta_ans_8_V_2}};

assign SpEtaPrevBb_address0 = tmp_s_fu_626_p1;

assign SpEtaPrevBb_d0 = {{{{Eta_ans_2_V_9}, {Eta_ans_2_V_8}}, {Eta_ans_2_V_7}}, {Eta_ans_2_V_6}};

assign SpEtaPrevBb_new_address0 = tmp_s_fu_626_p1;

assign SpEtaPrevBb_new_d0 = {{{{Eta_ans_8_V_9}, {Eta_ans_8_V_8}}, {Eta_ans_8_V_7}}, {Eta_ans_8_V_6}};

assign SpEtaPrevC_d0 = {{SpEtaPrevC_q0[32'd31 : 32'd24]}, {tmp_7_fu_1309_p4}};

assign SpEtaPrevC_new_d0 = {{SpEtaPrevC_new_q0[32'd31 : 32'd24]}, {tmp_9_fu_1379_p4}};

assign SpEtaPrevD_address0 = tmp_183_fu_719_p1;

assign SpEtaPrevD_d0 = {{Eta_ans_4_V_1}, {Eta_ans_4_V_0}};

assign SpEtaPrevD_new_address0 = tmp_183_fu_719_p1;

assign SpEtaPrevD_new_d0 = {{Eta_ans_10_V_1}, {Eta_ans_10_V_0}};

assign SpEtaPrevDa_address0 = tmp_183_fu_719_p1;

assign SpEtaPrevDa_d0 = {{{{Eta_ans_4_V_5}, {Eta_ans_4_V_4}}, {Eta_ans_4_V_3}}, {Eta_ans_4_V_2}};

assign SpEtaPrevDa_new_address0 = tmp_183_fu_719_p1;

assign SpEtaPrevDa_new_d0 = {{{{Eta_ans_10_V_5}, {Eta_ans_10_V_4}}, {Eta_ans_10_V_3}}, {Eta_ans_10_V_2}};

assign SpEtaPrevDb_address0 = tmp_183_fu_719_p1;

assign SpEtaPrevDb_d0 = {{{{Eta_ans_4_V_9}, {Eta_ans_4_V_8}}, {Eta_ans_4_V_7}}, {Eta_ans_4_V_6}};

assign SpEtaPrevDb_new_address0 = tmp_183_fu_719_p1;

assign SpEtaPrevDb_new_d0 = {{{{Eta_ans_10_V_9}, {Eta_ans_10_V_8}}, {Eta_ans_10_V_7}}, {Eta_ans_10_V_6}};

assign SpEtaPrevE_address0 = tmp_183_fu_719_p1;

assign SpEtaPrevE_d0 = {{Eta_ans_5_V_1}, {Eta_ans_5_V_0}};

assign SpEtaPrevE_new_address0 = tmp_183_fu_719_p1;

assign SpEtaPrevE_new_d0 = {{Eta_ans_11_V_1}, {Eta_ans_11_V_0}};

assign SpEtaPrevEa_address0 = tmp_183_fu_719_p1;

assign SpEtaPrevEa_d0 = {{{{Eta_ans_5_V_5}, {Eta_ans_5_V_4}}, {Eta_ans_5_V_3}}, {Eta_ans_5_V_2}};

assign SpEtaPrevEa_new_address0 = tmp_183_fu_719_p1;

assign SpEtaPrevEa_new_d0 = {{{{Eta_ans_11_V_5}, {Eta_ans_11_V_4}}, {Eta_ans_11_V_3}}, {Eta_ans_11_V_2}};

assign SpEtaPrevEb_address0 = tmp_183_fu_719_p1;

assign SpEtaPrevEb_d0 = {{{{Eta_ans_5_V_9}, {Eta_ans_5_V_8}}, {Eta_ans_5_V_7}}, {Eta_ans_5_V_6}};

assign SpEtaPrevEb_new_address0 = tmp_183_fu_719_p1;

assign SpEtaPrevEb_new_d0 = {{{{Eta_ans_11_V_9}, {Eta_ans_11_V_8}}, {Eta_ans_11_V_7}}, {Eta_ans_11_V_6}};

assign SpEtaPrev_d0 = {{SpEtaPrev_q0[32'd31 : 32'd24]}, {tmp_6_fu_1274_p4}};

assign SpEtaPrev_new_d0 = {{SpEtaPrev_new_q0[32'd31 : 32'd24]}, {tmp_8_fu_1344_p4}};

assign ap_CS_fsm_state1 = ap_CS_fsm[ap_const_lv32_0];

assign ap_CS_fsm_state2 = ap_CS_fsm[ap_const_lv32_1];

assign inx1_0_v_cast_cast_fu_612_p3 = ((tmp_fu_606_p2[0:0] === 1'b1) ? ap_const_lv16_40 : ap_const_lv16_100);

assign inx1_fu_620_p2 = (inx1_0_v_cast_cast_fu_612_p3 + inxtab_2);

assign tmp_183_fu_719_p1 = $signed(inx1_fu_620_p2);

assign tmp_6_fu_1274_p4 = {{{Eta_ans_V_2}, {Eta_ans_V_1}}, {Eta_ans_V_0}};

assign tmp_7_fu_1309_p4 = {{{Eta_ans_3_V_2}, {Eta_ans_3_V_1}}, {Eta_ans_3_V_0}};

assign tmp_8_fu_1344_p4 = {{{Eta_ans_6_V_2}, {Eta_ans_6_V_1}}, {Eta_ans_6_V_0}};

assign tmp_9_fu_1379_p4 = {{{Eta_ans_9_V_2}, {Eta_ans_9_V_1}}, {Eta_ans_9_V_0}};

assign tmp_fu_606_p2 = ((numb == ap_const_lv16_600) ? 1'b1 : 1'b0);

assign tmp_s_fu_626_p1 = $signed(inxtab_2);

endmodule //update_prev_est_23