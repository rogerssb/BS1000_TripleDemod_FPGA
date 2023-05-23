// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module write_pcHat (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        ppbhat0_address0,
        ppbhat0_ce0,
        ppbhat0_we0,
        ppbhat0_d0,
        ppbhat1_address0,
        ppbhat1_ce0,
        ppbhat1_we0,
        ppbhat1_d0,
        ppbhat2_address0,
        ppbhat2_ce0,
        ppbhat2_we0,
        ppbhat2_d0,
        ppbhat3_address0,
        ppbhat3_ce0,
        ppbhat3_we0,
        ppbhat3_d0,
        ppbhat4_address0,
        ppbhat4_ce0,
        ppbhat4_we0,
        ppbhat4_d0,
        ppbhat5_address0,
        ppbhat5_ce0,
        ppbhat5_we0,
        ppbhat5_d0,
        ppbhat6_address0,
        ppbhat6_ce0,
        ppbhat6_we0,
        ppbhat6_d0,
        ppbhat7_address0,
        ppbhat7_ce0,
        ppbhat7_we0,
        ppbhat7_d0,
        cols,
        prHat_b1_0_address0,
        prHat_b1_0_ce0,
        prHat_b1_0_q0,
        prHat_b1_1_address0,
        prHat_b1_1_ce0,
        prHat_b1_1_q0,
        prHat_b1_2_address0,
        prHat_b1_2_ce0,
        prHat_b1_2_q0,
        prHat_b2_3_address0,
        prHat_b2_3_ce0,
        prHat_b2_3_q0,
        prHat_b1_4_address0,
        prHat_b1_4_ce0,
        prHat_b1_4_q0,
        prHat_b2_5_address0,
        prHat_b2_5_ce0,
        prHat_b2_5_q0,
        prHat_b1_6_address0,
        prHat_b1_6_ce0,
        prHat_b1_6_q0,
        prHat_b2_7_address0,
        prHat_b2_7_ce0,
        prHat_b2_7_q0,
        prHat_b1_8_address0,
        prHat_b1_8_ce0,
        prHat_b1_8_q0,
        prHat_b1_9_address0,
        prHat_b1_9_ce0,
        prHat_b1_9_q0,
        prHat_b1_10_address0,
        prHat_b1_10_ce0,
        prHat_b1_10_q0,
        prHat_b2_11_address0,
        prHat_b2_11_ce0,
        prHat_b2_11_q0,
        prHat_b1_12_address0,
        prHat_b1_12_ce0,
        prHat_b1_12_q0,
        prHat_b2_13_address0,
        prHat_b2_13_ce0,
        prHat_b2_13_q0,
        prHat_b1_14_address0,
        prHat_b1_14_ce0,
        prHat_b1_14_q0,
        prHat_b2_15_address0,
        prHat_b2_15_ce0,
        prHat_b2_15_q0
);

parameter    ap_ST_fsm_state1 = 6'b1;
parameter    ap_ST_fsm_state2 = 6'b10;
parameter    ap_ST_fsm_state3 = 6'b100;
parameter    ap_ST_fsm_state4 = 6'b1000;
parameter    ap_ST_fsm_state5 = 6'b10000;
parameter    ap_ST_fsm_state6 = 6'b100000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv11_0 = 11'b00000000000;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv32_F = 32'b1111;
parameter    ap_const_lv17_0 = 17'b00000000000000000;
parameter    ap_const_lv32_10 = 32'b10000;
parameter    ap_const_lv11_2 = 11'b10;
parameter    ap_const_lv10_1 = 10'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [10:0] ppbhat0_address0;
output   ppbhat0_ce0;
output   ppbhat0_we0;
output  [0:0] ppbhat0_d0;
output  [10:0] ppbhat1_address0;
output   ppbhat1_ce0;
output   ppbhat1_we0;
output  [0:0] ppbhat1_d0;
output  [9:0] ppbhat2_address0;
output   ppbhat2_ce0;
output   ppbhat2_we0;
output  [0:0] ppbhat2_d0;
output  [9:0] ppbhat3_address0;
output   ppbhat3_ce0;
output   ppbhat3_we0;
output  [0:0] ppbhat3_d0;
output  [9:0] ppbhat4_address0;
output   ppbhat4_ce0;
output   ppbhat4_we0;
output  [0:0] ppbhat4_d0;
output  [9:0] ppbhat5_address0;
output   ppbhat5_ce0;
output   ppbhat5_we0;
output  [0:0] ppbhat5_d0;
output  [9:0] ppbhat6_address0;
output   ppbhat6_ce0;
output   ppbhat6_we0;
output  [0:0] ppbhat6_d0;
output  [9:0] ppbhat7_address0;
output   ppbhat7_ce0;
output   ppbhat7_we0;
output  [0:0] ppbhat7_d0;
input  [15:0] cols;
output  [7:0] prHat_b1_0_address0;
output   prHat_b1_0_ce0;
input  [0:0] prHat_b1_0_q0;
output  [7:0] prHat_b1_1_address0;
output   prHat_b1_1_ce0;
input  [0:0] prHat_b1_1_q0;
output  [7:0] prHat_b1_2_address0;
output   prHat_b1_2_ce0;
input  [0:0] prHat_b1_2_q0;
output  [7:0] prHat_b2_3_address0;
output   prHat_b2_3_ce0;
input  [0:0] prHat_b2_3_q0;
output  [7:0] prHat_b1_4_address0;
output   prHat_b1_4_ce0;
input  [0:0] prHat_b1_4_q0;
output  [7:0] prHat_b2_5_address0;
output   prHat_b2_5_ce0;
input  [0:0] prHat_b2_5_q0;
output  [7:0] prHat_b1_6_address0;
output   prHat_b1_6_ce0;
input  [0:0] prHat_b1_6_q0;
output  [7:0] prHat_b2_7_address0;
output   prHat_b2_7_ce0;
input  [0:0] prHat_b2_7_q0;
output  [7:0] prHat_b1_8_address0;
output   prHat_b1_8_ce0;
input  [0:0] prHat_b1_8_q0;
output  [7:0] prHat_b1_9_address0;
output   prHat_b1_9_ce0;
input  [0:0] prHat_b1_9_q0;
output  [7:0] prHat_b1_10_address0;
output   prHat_b1_10_ce0;
input  [0:0] prHat_b1_10_q0;
output  [7:0] prHat_b2_11_address0;
output   prHat_b2_11_ce0;
input  [0:0] prHat_b2_11_q0;
output  [7:0] prHat_b1_12_address0;
output   prHat_b1_12_ce0;
input  [0:0] prHat_b1_12_q0;
output  [7:0] prHat_b2_13_address0;
output   prHat_b2_13_ce0;
input  [0:0] prHat_b2_13_q0;
output  [7:0] prHat_b1_14_address0;
output   prHat_b1_14_ce0;
input  [0:0] prHat_b1_14_q0;
output  [7:0] prHat_b2_15_address0;
output   prHat_b2_15_ce0;
input  [0:0] prHat_b2_15_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[10:0] ppbhat0_address0;
reg ppbhat0_ce0;
reg ppbhat0_we0;
reg[0:0] ppbhat0_d0;
reg[10:0] ppbhat1_address0;
reg ppbhat1_ce0;
reg ppbhat1_we0;
reg[0:0] ppbhat1_d0;
reg[9:0] ppbhat2_address0;
reg ppbhat2_ce0;
reg ppbhat2_we0;
reg[0:0] ppbhat2_d0;
reg[9:0] ppbhat3_address0;
reg ppbhat3_ce0;
reg ppbhat3_we0;
reg[0:0] ppbhat3_d0;
reg[9:0] ppbhat4_address0;
reg ppbhat4_ce0;
reg ppbhat4_we0;
reg[0:0] ppbhat4_d0;
reg[9:0] ppbhat5_address0;
reg ppbhat5_ce0;
reg ppbhat5_we0;
reg[0:0] ppbhat5_d0;
reg[9:0] ppbhat6_address0;
reg ppbhat6_ce0;
reg ppbhat6_we0;
reg[0:0] ppbhat6_d0;
reg[9:0] ppbhat7_address0;
reg ppbhat7_ce0;
reg ppbhat7_we0;
reg[0:0] ppbhat7_d0;
reg[7:0] prHat_b1_0_address0;
reg prHat_b1_0_ce0;
reg[7:0] prHat_b1_1_address0;
reg prHat_b1_1_ce0;
reg[7:0] prHat_b1_2_address0;
reg prHat_b1_2_ce0;
reg[7:0] prHat_b2_3_address0;
reg prHat_b2_3_ce0;
reg[7:0] prHat_b1_4_address0;
reg prHat_b1_4_ce0;
reg[7:0] prHat_b2_5_address0;
reg prHat_b2_5_ce0;
reg[7:0] prHat_b1_6_address0;
reg prHat_b1_6_ce0;
reg[7:0] prHat_b2_7_address0;
reg prHat_b2_7_ce0;
reg[7:0] prHat_b1_8_address0;
reg prHat_b1_8_ce0;
reg[7:0] prHat_b1_9_address0;
reg prHat_b1_9_ce0;
reg[7:0] prHat_b1_10_address0;
reg prHat_b1_10_ce0;
reg[7:0] prHat_b2_11_address0;
reg prHat_b2_11_ce0;
reg[7:0] prHat_b1_12_address0;
reg prHat_b1_12_ce0;
reg[7:0] prHat_b2_13_address0;
reg prHat_b2_13_ce0;
reg[7:0] prHat_b1_14_address0;
reg prHat_b1_14_ce0;
reg[7:0] prHat_b2_15_address0;
reg prHat_b2_15_ce0;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire   [0:0] ap_CS_fsm_state1;
wire   [16:0] tmp_5_fu_779_p3;
reg   [16:0] tmp_5_reg_879;
wire   [12:0] tmp_2_fu_787_p1;
reg   [12:0] tmp_2_reg_884;
wire   [12:0] i_cast3_fu_791_p1;
reg   [12:0] i_cast3_reg_890;
wire   [0:0] ap_CS_fsm_state2;
wire   [31:0] i_cast2_fu_795_p1;
reg   [31:0] i_cast2_reg_895;
wire   [0:0] tmp_s_fu_811_p2;
wire   [9:0] tmp_6_fu_816_p1;
reg   [9:0] tmp_6_reg_958;
wire   [10:0] i_2_fu_820_p2;
reg   [10:0] i_2_reg_963;
wire   [0:0] ap_CS_fsm_state3;
wire   [31:0] i_1_cast_fu_851_p1;
reg   [31:0] i_1_cast_reg_1008;
wire   [0:0] ap_CS_fsm_state4;
wire   [12:0] sum6_fu_863_p2;
reg   [12:0] sum6_reg_1033;
wire   [0:0] ap_CS_fsm_state5;
reg   [10:0] i_reg_708;
wire   [0:0] ap_CS_fsm_state6;
wire   [31:0] sum2_cast_fu_830_p1;
wire   [31:0] sum6_cast_fu_868_p1;
wire  signed [16:0] tmp_tr_fu_723_p1;
wire   [16:0] p_neg_fu_735_p2;
wire   [15:0] p_lshr_fu_741_p4;
wire   [16:0] tmp_fu_751_p1;
wire   [14:0] tmp_3_fu_761_p4;
wire  signed [15:0] tmp_4_fu_771_p1;
wire   [0:0] tmp_1_fu_727_p3;
wire   [16:0] p_neg_t_fu_755_p2;
wire   [16:0] p_lshr_f_fu_775_p1;
wire   [16:0] i_cast_fu_807_p1;
wire   [12:0] sum2_fu_826_p2;
wire   [9:0] i_1_fu_842_p2;
wire   [12:0] i_1_cast1_fu_847_p1;
reg   [5:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'b1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        i_reg_708 <= i_2_reg_963;
    end else if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        i_reg_708 <= ap_const_lv11_0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        i_1_cast_reg_1008[9 : 1] <= i_1_cast_fu_851_p1[9 : 1];
        sum6_reg_1033 <= sum6_fu_863_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & ~(tmp_s_fu_811_p2 == 1'b0))) begin
        i_2_reg_963 <= i_2_fu_820_p2;
        tmp_6_reg_958 <= tmp_6_fu_816_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_cast2_reg_895[10 : 0] <= i_cast2_fu_795_p1[10 : 0];
        i_cast3_reg_890[10 : 0] <= i_cast3_fu_791_p1[10 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
        tmp_2_reg_884 <= tmp_2_fu_787_p1;
        tmp_5_reg_879 <= tmp_5_fu_779_p3;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_start) & (ap_CS_fsm_state1 == 1'b1)) | ((1'b1 == ap_CS_fsm_state2) & (tmp_s_fu_811_p2 == 1'b0)))) begin
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
    if (((1'b1 == ap_CS_fsm_state2) & (tmp_s_fu_811_p2 == 1'b0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ppbhat0_address0 = sum6_cast_fu_868_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        ppbhat0_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        ppbhat0_address0 = sum2_cast_fu_830_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        ppbhat0_address0 = i_cast2_reg_895;
    end else begin
        ppbhat0_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat0_ce0 = 1'b1;
    end else begin
        ppbhat0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat0_d0 = prHat_b1_1_q0;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        ppbhat0_d0 = prHat_b1_0_q0;
    end else begin
        ppbhat0_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat0_we0 = 1'b1;
    end else begin
        ppbhat0_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ppbhat1_address0 = sum6_cast_fu_868_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        ppbhat1_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        ppbhat1_address0 = sum2_cast_fu_830_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        ppbhat1_address0 = i_cast2_reg_895;
    end else begin
        ppbhat1_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat1_ce0 = 1'b1;
    end else begin
        ppbhat1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat1_d0 = prHat_b2_3_q0;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        ppbhat1_d0 = prHat_b1_2_q0;
    end else begin
        ppbhat1_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat1_we0 = 1'b1;
    end else begin
        ppbhat1_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ppbhat2_address0 = sum6_cast_fu_868_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        ppbhat2_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        ppbhat2_address0 = sum2_cast_fu_830_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        ppbhat2_address0 = i_cast2_reg_895;
    end else begin
        ppbhat2_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat2_ce0 = 1'b1;
    end else begin
        ppbhat2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat2_d0 = prHat_b2_5_q0;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        ppbhat2_d0 = prHat_b1_4_q0;
    end else begin
        ppbhat2_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat2_we0 = 1'b1;
    end else begin
        ppbhat2_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ppbhat3_address0 = sum6_cast_fu_868_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        ppbhat3_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        ppbhat3_address0 = sum2_cast_fu_830_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        ppbhat3_address0 = i_cast2_reg_895;
    end else begin
        ppbhat3_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat3_ce0 = 1'b1;
    end else begin
        ppbhat3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat3_d0 = prHat_b2_7_q0;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        ppbhat3_d0 = prHat_b1_6_q0;
    end else begin
        ppbhat3_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat3_we0 = 1'b1;
    end else begin
        ppbhat3_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ppbhat4_address0 = sum6_cast_fu_868_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        ppbhat4_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        ppbhat4_address0 = sum2_cast_fu_830_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        ppbhat4_address0 = i_cast2_reg_895;
    end else begin
        ppbhat4_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat4_ce0 = 1'b1;
    end else begin
        ppbhat4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat4_d0 = prHat_b1_9_q0;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        ppbhat4_d0 = prHat_b1_8_q0;
    end else begin
        ppbhat4_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat4_we0 = 1'b1;
    end else begin
        ppbhat4_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ppbhat5_address0 = sum6_cast_fu_868_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        ppbhat5_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        ppbhat5_address0 = sum2_cast_fu_830_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        ppbhat5_address0 = i_cast2_reg_895;
    end else begin
        ppbhat5_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat5_ce0 = 1'b1;
    end else begin
        ppbhat5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat5_d0 = prHat_b2_11_q0;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        ppbhat5_d0 = prHat_b1_10_q0;
    end else begin
        ppbhat5_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat5_we0 = 1'b1;
    end else begin
        ppbhat5_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ppbhat6_address0 = sum6_cast_fu_868_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        ppbhat6_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        ppbhat6_address0 = sum2_cast_fu_830_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        ppbhat6_address0 = i_cast2_reg_895;
    end else begin
        ppbhat6_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat6_ce0 = 1'b1;
    end else begin
        ppbhat6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat6_d0 = prHat_b2_13_q0;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        ppbhat6_d0 = prHat_b1_12_q0;
    end else begin
        ppbhat6_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat6_we0 = 1'b1;
    end else begin
        ppbhat6_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ppbhat7_address0 = sum6_cast_fu_868_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        ppbhat7_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        ppbhat7_address0 = sum2_cast_fu_830_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        ppbhat7_address0 = i_cast2_reg_895;
    end else begin
        ppbhat7_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat7_ce0 = 1'b1;
    end else begin
        ppbhat7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat7_d0 = prHat_b2_15_q0;
    end else if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        ppbhat7_d0 = prHat_b1_14_q0;
    end else begin
        ppbhat7_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state6))) begin
        ppbhat7_we0 = 1'b1;
    end else begin
        ppbhat7_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        prHat_b1_0_address0 = i_1_cast_fu_851_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        prHat_b1_0_address0 = i_cast2_fu_795_p1;
    end else begin
        prHat_b1_0_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state4))) begin
        prHat_b1_0_ce0 = 1'b1;
    end else begin
        prHat_b1_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        prHat_b1_10_address0 = i_1_cast_fu_851_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        prHat_b1_10_address0 = i_cast2_fu_795_p1;
    end else begin
        prHat_b1_10_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state4))) begin
        prHat_b1_10_ce0 = 1'b1;
    end else begin
        prHat_b1_10_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        prHat_b1_12_address0 = i_1_cast_fu_851_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        prHat_b1_12_address0 = i_cast2_fu_795_p1;
    end else begin
        prHat_b1_12_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state4))) begin
        prHat_b1_12_ce0 = 1'b1;
    end else begin
        prHat_b1_12_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        prHat_b1_14_address0 = i_1_cast_fu_851_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        prHat_b1_14_address0 = i_cast2_fu_795_p1;
    end else begin
        prHat_b1_14_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state4))) begin
        prHat_b1_14_ce0 = 1'b1;
    end else begin
        prHat_b1_14_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        prHat_b1_1_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        prHat_b1_1_address0 = i_cast2_reg_895;
    end else begin
        prHat_b1_1_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        prHat_b1_1_ce0 = 1'b1;
    end else begin
        prHat_b1_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        prHat_b1_2_address0 = i_1_cast_fu_851_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        prHat_b1_2_address0 = i_cast2_fu_795_p1;
    end else begin
        prHat_b1_2_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state4))) begin
        prHat_b1_2_ce0 = 1'b1;
    end else begin
        prHat_b1_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        prHat_b1_4_address0 = i_1_cast_fu_851_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        prHat_b1_4_address0 = i_cast2_fu_795_p1;
    end else begin
        prHat_b1_4_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state4))) begin
        prHat_b1_4_ce0 = 1'b1;
    end else begin
        prHat_b1_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        prHat_b1_6_address0 = i_1_cast_fu_851_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        prHat_b1_6_address0 = i_cast2_fu_795_p1;
    end else begin
        prHat_b1_6_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state4))) begin
        prHat_b1_6_ce0 = 1'b1;
    end else begin
        prHat_b1_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        prHat_b1_8_address0 = i_1_cast_fu_851_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        prHat_b1_8_address0 = i_cast2_fu_795_p1;
    end else begin
        prHat_b1_8_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state4))) begin
        prHat_b1_8_ce0 = 1'b1;
    end else begin
        prHat_b1_8_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        prHat_b1_9_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        prHat_b1_9_address0 = i_cast2_reg_895;
    end else begin
        prHat_b1_9_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        prHat_b1_9_ce0 = 1'b1;
    end else begin
        prHat_b1_9_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        prHat_b2_11_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        prHat_b2_11_address0 = i_cast2_reg_895;
    end else begin
        prHat_b2_11_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        prHat_b2_11_ce0 = 1'b1;
    end else begin
        prHat_b2_11_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        prHat_b2_13_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        prHat_b2_13_address0 = i_cast2_reg_895;
    end else begin
        prHat_b2_13_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        prHat_b2_13_ce0 = 1'b1;
    end else begin
        prHat_b2_13_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        prHat_b2_15_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        prHat_b2_15_address0 = i_cast2_reg_895;
    end else begin
        prHat_b2_15_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        prHat_b2_15_ce0 = 1'b1;
    end else begin
        prHat_b2_15_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        prHat_b2_3_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        prHat_b2_3_address0 = i_cast2_reg_895;
    end else begin
        prHat_b2_3_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        prHat_b2_3_ce0 = 1'b1;
    end else begin
        prHat_b2_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        prHat_b2_5_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        prHat_b2_5_address0 = i_cast2_reg_895;
    end else begin
        prHat_b2_5_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        prHat_b2_5_ce0 = 1'b1;
    end else begin
        prHat_b2_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        prHat_b2_7_address0 = i_1_cast_reg_1008;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        prHat_b2_7_address0 = i_cast2_reg_895;
    end else begin
        prHat_b2_7_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5))) begin
        prHat_b2_7_ce0 = 1'b1;
    end else begin
        prHat_b2_7_ce0 = 1'b0;
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
            if ((tmp_s_fu_811_p2 == 1'b0)) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[ap_const_lv32_0];

assign ap_CS_fsm_state2 = ap_CS_fsm[ap_const_lv32_1];

assign ap_CS_fsm_state3 = ap_CS_fsm[ap_const_lv32_2];

assign ap_CS_fsm_state4 = ap_CS_fsm[ap_const_lv32_3];

assign ap_CS_fsm_state5 = ap_CS_fsm[ap_const_lv32_4];

assign ap_CS_fsm_state6 = ap_CS_fsm[ap_const_lv32_5];

assign i_1_cast1_fu_847_p1 = i_1_fu_842_p2;

assign i_1_cast_fu_851_p1 = i_1_fu_842_p2;

assign i_1_fu_842_p2 = (tmp_6_reg_958 | ap_const_lv10_1);

assign i_2_fu_820_p2 = (ap_const_lv11_2 + i_reg_708);

assign i_cast2_fu_795_p1 = i_reg_708;

assign i_cast3_fu_791_p1 = i_reg_708;

assign i_cast_fu_807_p1 = i_reg_708;

assign p_lshr_f_fu_775_p1 = $unsigned(tmp_4_fu_771_p1);

assign p_lshr_fu_741_p4 = {{p_neg_fu_735_p2[ap_const_lv32_10 : ap_const_lv32_1]}};

assign p_neg_fu_735_p2 = ($signed(ap_const_lv17_0) - $signed(tmp_tr_fu_723_p1));

assign p_neg_t_fu_755_p2 = (ap_const_lv17_0 - tmp_fu_751_p1);

assign sum2_cast_fu_830_p1 = sum2_fu_826_p2;

assign sum2_fu_826_p2 = (tmp_2_reg_884 + i_cast3_reg_890);

assign sum6_cast_fu_868_p1 = sum6_reg_1033;

assign sum6_fu_863_p2 = (tmp_2_reg_884 + i_1_cast1_fu_847_p1);

assign tmp_1_fu_727_p3 = cols[ap_const_lv32_F];

assign tmp_2_fu_787_p1 = tmp_5_fu_779_p3[12:0];

assign tmp_3_fu_761_p4 = {{cols[ap_const_lv32_F : ap_const_lv32_1]}};

assign tmp_4_fu_771_p1 = $signed(tmp_3_fu_761_p4);

assign tmp_5_fu_779_p3 = ((tmp_1_fu_727_p3[0:0] === 1'b1) ? p_neg_t_fu_755_p2 : p_lshr_f_fu_775_p1);

assign tmp_6_fu_816_p1 = i_reg_708[9:0];

assign tmp_fu_751_p1 = p_lshr_fu_741_p4;

assign tmp_s_fu_811_p2 = (($signed(i_cast_fu_807_p1) < $signed(tmp_5_reg_879)) ? 1'b1 : 1'b0);

assign tmp_tr_fu_723_p1 = $signed(cols);

always @ (posedge ap_clk) begin
    i_cast3_reg_890[12:11] <= 2'b00;
    i_cast2_reg_895[31:11] <= 21'b000000000000000000000;
    i_1_cast_reg_1008[0] <= 1'b1;
    i_1_cast_reg_1008[31:10] <= 22'b0000000000000000000000;
end

endmodule //write_pcHat
