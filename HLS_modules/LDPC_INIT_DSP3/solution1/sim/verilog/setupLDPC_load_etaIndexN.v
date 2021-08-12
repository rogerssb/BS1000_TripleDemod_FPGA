// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.2
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module setupLDPC_load_etaIndexN (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        num,
        etaIndexN_V_address0,
        etaIndexN_V_ce0,
        etaIndexN_V_we0,
        etaIndexN_V_d0,
        dout,
        dout_ap_vld,
        din,
        cs,
        cs_ap_vld,
        clk,
        clk_ap_vld
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 5'b1;
parameter    ap_ST_st2_fsm_1 = 5'b10;
parameter    ap_ST_st3_fsm_2 = 5'b100;
parameter    ap_ST_st4_fsm_3 = 5'b1000;
parameter    ap_ST_st5_fsm_4 = 5'b10000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv4_0 = 4'b0000;
parameter    ap_const_lv8_3 = 8'b11;
parameter    ap_const_lv5_0 = 5'b00000;
parameter    ap_const_lv16_0 = 16'b0000000000000000;
parameter    ap_const_lv4_8 = 4'b1000;
parameter    ap_const_lv4_1 = 4'b1;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv8_1 = 8'b1;
parameter    ap_const_lv5_18 = 5'b11000;
parameter    ap_const_lv5_1 = 5'b1;
parameter    ap_const_lv16_1 = 16'b1;
parameter    ap_const_lv5_10 = 5'b10000;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [16:0] num;
output  [15:0] etaIndexN_V_address0;
output   etaIndexN_V_ce0;
output   etaIndexN_V_we0;
output  [15:0] etaIndexN_V_d0;
output  [0:0] dout;
output   dout_ap_vld;
input  [0:0] din;
output  [0:0] cs;
output   cs_ap_vld;
output  [0:0] clk;
output   clk_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg etaIndexN_V_ce0;
reg etaIndexN_V_we0;
reg[0:0] dout;
reg dout_ap_vld;
reg cs_ap_vld;
reg clk_ap_vld;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm = 5'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_23;
wire   [3:0] loop_3_fu_150_p2;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_55;
wire   [7:0] read_1_fu_170_p2;
wire   [0:0] exitcond5_fu_144_p2;
wire   [4:0] loop_4_fu_182_p2;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_bdd_70;
wire   [15:0] pos_1_fu_203_p2;
reg   [15:0] pos_1_reg_290;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_bdd_79;
wire   [0:0] tmp_3_fu_198_p2;
wire   [4:0] loop_5_fu_231_p2;
reg    ap_sig_cseq_ST_st5_fsm_4;
reg    ap_sig_bdd_94;
wire   [15:0] data_V_2_fu_249_p3;
wire   [0:0] exitcond_fu_225_p2;
reg   [3:0] loop_reg_76;
reg   [7:0] read_reg_87;
reg   [4:0] loop_1_reg_98;
wire   [0:0] exitcond6_fu_176_p2;
reg   [15:0] pos_reg_109;
reg   [15:0] p_s_reg_121;
reg   [4:0] loop_2_reg_133;
wire   [63:0] tmp_4_fu_256_p1;
wire   [16:0] pos_cast_fu_194_p1;
wire   [15:0] r_V_fu_237_p2;
wire   [15:0] data_V_1_fu_243_p2;
reg   [4:0] ap_NS_fsm;




/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond5_fu_144_p2 == ap_const_lv1_0))) begin
        loop_1_reg_98 <= ap_const_lv5_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond6_fu_176_p2))) begin
        loop_1_reg_98 <= loop_4_fu_182_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3) & ~(ap_const_lv1_0 == tmp_3_fu_198_p2))) begin
        loop_2_reg_133 <= ap_const_lv5_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4) & (ap_const_lv1_0 == exitcond_fu_225_p2))) begin
        loop_2_reg_133 <= loop_5_fu_231_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_144_p2 == ap_const_lv1_0))) begin
        loop_reg_76 <= loop_3_fu_150_p2;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        loop_reg_76 <= ap_const_lv4_0;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3) & ~(ap_const_lv1_0 == tmp_3_fu_198_p2))) begin
        p_s_reg_121 <= ap_const_lv16_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4) & (ap_const_lv1_0 == exitcond_fu_225_p2))) begin
        p_s_reg_121 <= data_V_2_fu_249_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & ~(ap_const_lv1_0 == exitcond6_fu_176_p2))) begin
        pos_reg_109 <= ap_const_lv16_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4) & ~(ap_const_lv1_0 == exitcond_fu_225_p2))) begin
        pos_reg_109 <= pos_1_reg_290;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_144_p2 == ap_const_lv1_0))) begin
        read_reg_87 <= read_1_fu_170_p2;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        read_reg_87 <= ap_const_lv8_3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        pos_1_reg_290 <= pos_1_fu_203_p2;
    end
end

/// ap_done assign process. ///
always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0 or ap_sig_cseq_ST_st4_fsm_3 or tmp_3_fu_198_p2)
begin
    if (((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3) & (ap_const_lv1_0 == tmp_3_fu_198_p2)))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0)
begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// ap_ready assign process. ///
always @ (ap_sig_cseq_ST_st4_fsm_3 or tmp_3_fu_198_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3) & (ap_const_lv1_0 == tmp_3_fu_198_p2))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st1_fsm_0 assign process. ///
always @ (ap_sig_bdd_23)
begin
    if (ap_sig_bdd_23) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st2_fsm_1 assign process. ///
always @ (ap_sig_bdd_55)
begin
    if (ap_sig_bdd_55) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st3_fsm_2 assign process. ///
always @ (ap_sig_bdd_70)
begin
    if (ap_sig_bdd_70) begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st4_fsm_3 assign process. ///
always @ (ap_sig_bdd_79)
begin
    if (ap_sig_bdd_79) begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st5_fsm_4 assign process. ///
always @ (ap_sig_bdd_94)
begin
    if (ap_sig_bdd_94) begin
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_0;
    end
end

/// clk_ap_vld assign process. ///
always @ (ap_sig_cseq_ST_st4_fsm_3 or tmp_3_fu_198_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3) & (ap_const_lv1_0 == tmp_3_fu_198_p2))) begin
        clk_ap_vld = ap_const_logic_1;
    end else begin
        clk_ap_vld = ap_const_logic_0;
    end
end

/// cs_ap_vld assign process. ///
always @ (ap_sig_cseq_ST_st4_fsm_3 or tmp_3_fu_198_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3) & (ap_const_lv1_0 == tmp_3_fu_198_p2))) begin
        cs_ap_vld = ap_const_logic_1;
    end else begin
        cs_ap_vld = ap_const_logic_0;
    end
end

/// dout assign process. ///
always @ (ap_sig_cseq_ST_st2_fsm_1 or exitcond5_fu_144_p2 or ap_sig_cseq_ST_st3_fsm_2 or read_reg_87 or exitcond6_fu_176_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond6_fu_176_p2))) begin
        dout = ap_const_lv1_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_144_p2 == ap_const_lv1_0))) begin
        dout = read_reg_87[ap_const_lv32_7];
    end else begin
        dout = 'bx;
    end
end

/// dout_ap_vld assign process. ///
always @ (ap_sig_cseq_ST_st2_fsm_1 or exitcond5_fu_144_p2 or ap_sig_cseq_ST_st3_fsm_2 or exitcond6_fu_176_p2)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_144_p2 == ap_const_lv1_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond6_fu_176_p2)))) begin
        dout_ap_vld = ap_const_logic_1;
    end else begin
        dout_ap_vld = ap_const_logic_0;
    end
end

/// etaIndexN_V_ce0 assign process. ///
always @ (ap_sig_cseq_ST_st5_fsm_4)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        etaIndexN_V_ce0 = ap_const_logic_1;
    end else begin
        etaIndexN_V_ce0 = ap_const_logic_0;
    end
end

/// etaIndexN_V_we0 assign process. ///
always @ (ap_sig_cseq_ST_st5_fsm_4 or exitcond_fu_225_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4) & ~(ap_const_lv1_0 == exitcond_fu_225_p2))) begin
        etaIndexN_V_we0 = ap_const_logic_1;
    end else begin
        etaIndexN_V_we0 = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_start or ap_CS_fsm or exitcond5_fu_144_p2 or tmp_3_fu_198_p2 or exitcond_fu_225_p2 or exitcond6_fu_176_p2)
begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~(ap_start == ap_const_logic_0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if ((exitcond5_fu_144_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st3_fsm_2 : 
        begin
            if ((ap_const_lv1_0 == exitcond6_fu_176_p2)) begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end else begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end
        end
        ap_ST_st4_fsm_3 : 
        begin
            if ((ap_const_lv1_0 == tmp_3_fu_198_p2)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_st5_fsm_4;
            end
        end
        ap_ST_st5_fsm_4 : 
        begin
            if (~(ap_const_lv1_0 == exitcond_fu_225_p2)) begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_st5_fsm_4;
            end
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end


/// ap_sig_bdd_23 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_23 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_55 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_55 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

/// ap_sig_bdd_70 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_70 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end

/// ap_sig_bdd_79 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_79 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end

/// ap_sig_bdd_94 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_94 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_4]);
end
assign clk = ap_const_lv1_0;
assign cs = ap_const_lv1_1;
assign data_V_1_fu_243_p2 = (r_V_fu_237_p2 | ap_const_lv16_1);
assign data_V_2_fu_249_p3 = ((din[0:0]===1'b1)? data_V_1_fu_243_p2: r_V_fu_237_p2);
assign etaIndexN_V_address0 = tmp_4_fu_256_p1;
assign etaIndexN_V_d0 = p_s_reg_121;
assign exitcond5_fu_144_p2 = (loop_reg_76 == ap_const_lv4_8? 1'b1: 1'b0);
assign exitcond6_fu_176_p2 = (loop_1_reg_98 == ap_const_lv5_18? 1'b1: 1'b0);
assign exitcond_fu_225_p2 = (loop_2_reg_133 == ap_const_lv5_10? 1'b1: 1'b0);
assign loop_3_fu_150_p2 = (loop_reg_76 + ap_const_lv4_1);
assign loop_4_fu_182_p2 = (loop_1_reg_98 + ap_const_lv5_1);
assign loop_5_fu_231_p2 = (loop_2_reg_133 + ap_const_lv5_1);
assign pos_1_fu_203_p2 = (pos_reg_109 + ap_const_lv16_1);
assign pos_cast_fu_194_p1 = pos_reg_109;
assign r_V_fu_237_p2 = p_s_reg_121 << ap_const_lv16_1;
assign read_1_fu_170_p2 = read_reg_87 << ap_const_lv8_1;
assign tmp_3_fu_198_p2 = ($signed(pos_cast_fu_194_p1) < $signed(num)? 1'b1: 1'b0);
assign tmp_4_fu_256_p1 = pos_reg_109;


endmodule //setupLDPC_load_etaIndexN

