// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mcalcC (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        nIterationCounter,
        Peta_taby_V_0,
        Lam_taby_V_0,
        Peta_taby_V_1,
        Lam_taby_V_1,
        Peta_taby_V_2,
        Lam_taby_V_2,
        Peta_taby_V_3,
        Lam_taby_V_3,
        Peta_taby_V_4,
        Lam_taby_V_4,
        Peta_taby_V_5,
        Lam_taby_V_5,
        Eta_ans_1_V_0,
        Eta_ans_1_V_0_ap_vld,
        Eta_ans_1_V_1,
        Eta_ans_1_V_1_ap_vld,
        Eta_ans_1_V_2,
        Eta_ans_1_V_2_ap_vld,
        Eta_ans_1_V_3,
        Eta_ans_1_V_3_ap_vld,
        Eta_ans_1_V_4,
        Eta_ans_1_V_4_ap_vld,
        Eta_ans_1_V_5,
        Eta_ans_1_V_5_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv16_0 = 16'b0000000000000000;
parameter    ap_const_lv8_0 = 8'b00000000;
parameter    ap_const_lv32_8 = 32'b1000;
parameter    ap_const_lv9_0 = 9'b000000000;
parameter    ap_const_lv9_7E = 9'b1111110;
parameter    ap_const_lv9_3E = 9'b111110;
parameter    ap_const_lv9_1E = 9'b11110;
parameter    ap_const_lv9_E = 9'b1110;
parameter    ap_const_lv9_6 = 9'b110;
parameter    ap_const_lv9_2 = 9'b10;
parameter    ap_const_lv3_7 = 3'b111;
parameter    ap_const_lv3_3 = 3'b11;
parameter    ap_const_lv3_1 = 3'b1;
parameter    ap_const_lv7_1F = 7'b11111;
parameter    ap_const_lv7_3F = 7'b111111;
parameter    ap_const_lv7_7 = 7'b111;
parameter    ap_const_lv7_F = 7'b1111;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [15:0] nIterationCounter;
input  [7:0] Peta_taby_V_0;
input  [7:0] Lam_taby_V_0;
input  [7:0] Peta_taby_V_1;
input  [7:0] Lam_taby_V_1;
input  [7:0] Peta_taby_V_2;
input  [7:0] Lam_taby_V_2;
input  [7:0] Peta_taby_V_3;
input  [7:0] Lam_taby_V_3;
input  [7:0] Peta_taby_V_4;
input  [7:0] Lam_taby_V_4;
input  [7:0] Peta_taby_V_5;
input  [7:0] Lam_taby_V_5;
output  [7:0] Eta_ans_1_V_0;
output   Eta_ans_1_V_0_ap_vld;
output  [7:0] Eta_ans_1_V_1;
output   Eta_ans_1_V_1_ap_vld;
output  [7:0] Eta_ans_1_V_2;
output   Eta_ans_1_V_2_ap_vld;
output  [7:0] Eta_ans_1_V_3;
output   Eta_ans_1_V_3_ap_vld;
output  [7:0] Eta_ans_1_V_4;
output   Eta_ans_1_V_4_ap_vld;
output  [7:0] Eta_ans_1_V_5;
output   Eta_ans_1_V_5_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg Eta_ans_1_V_0_ap_vld;
reg Eta_ans_1_V_1_ap_vld;
reg Eta_ans_1_V_2_ap_vld;
reg Eta_ans_1_V_3_ap_vld;
reg Eta_ans_1_V_4_ap_vld;
reg Eta_ans_1_V_5_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire   [0:0] ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
wire   [0:0] tmp_250_fu_126_p3;
reg   [0:0] tmp_250_reg_1572;
wire   [0:0] tmp_227_fu_148_p2;
reg   [0:0] tmp_227_reg_1578;
wire   [0:0] tmp_228_fu_154_p2;
reg   [0:0] tmp_228_reg_1584;
wire   [0:0] tmp_229_fu_160_p2;
reg   [0:0] tmp_229_reg_1590;
wire   [0:0] tmp_230_fu_166_p2;
reg   [0:0] tmp_230_reg_1596;
wire   [0:0] tmp_231_fu_172_p2;
reg   [0:0] tmp_231_reg_1602;
wire   [0:0] tmp_232_fu_178_p2;
reg   [0:0] tmp_232_reg_1607;
wire   [0:0] tmp_251_fu_214_p3;
reg   [0:0] tmp_251_reg_1612;
wire   [0:0] tmp_419_1_fu_236_p2;
reg   [0:0] tmp_419_1_reg_1618;
wire   [0:0] tmp_420_1_fu_242_p2;
reg   [0:0] tmp_420_1_reg_1624;
wire   [0:0] tmp_421_1_fu_248_p2;
reg   [0:0] tmp_421_1_reg_1630;
wire   [0:0] tmp_422_1_fu_254_p2;
reg   [0:0] tmp_422_1_reg_1636;
wire   [0:0] tmp_423_1_fu_260_p2;
reg   [0:0] tmp_423_1_reg_1642;
wire   [0:0] tmp_424_1_fu_266_p2;
reg   [0:0] tmp_424_1_reg_1647;
wire   [0:0] tmp_252_fu_302_p3;
reg   [0:0] tmp_252_reg_1652;
wire   [0:0] tmp_419_2_fu_324_p2;
reg   [0:0] tmp_419_2_reg_1659;
wire   [0:0] tmp_420_2_fu_330_p2;
reg   [0:0] tmp_420_2_reg_1665;
wire   [0:0] tmp_421_2_fu_336_p2;
reg   [0:0] tmp_421_2_reg_1671;
wire   [0:0] tmp_422_2_fu_342_p2;
reg   [0:0] tmp_422_2_reg_1677;
wire   [0:0] tmp_423_2_fu_348_p2;
reg   [0:0] tmp_423_2_reg_1683;
wire   [0:0] tmp_424_2_fu_354_p2;
reg   [0:0] tmp_424_2_reg_1688;
wire   [0:0] tmp_253_fu_390_p3;
reg   [0:0] tmp_253_reg_1693;
wire   [0:0] tmp_419_3_fu_412_p2;
reg   [0:0] tmp_419_3_reg_1698;
wire   [0:0] tmp_420_3_fu_418_p2;
reg   [0:0] tmp_420_3_reg_1704;
wire   [0:0] tmp_421_3_fu_424_p2;
reg   [0:0] tmp_421_3_reg_1710;
wire   [0:0] tmp_422_3_fu_430_p2;
reg   [0:0] tmp_422_3_reg_1716;
wire   [0:0] tmp_423_3_fu_436_p2;
reg   [0:0] tmp_423_3_reg_1722;
wire   [0:0] tmp_424_3_fu_442_p2;
reg   [0:0] tmp_424_3_reg_1727;
wire   [0:0] tmp_254_fu_478_p3;
reg   [0:0] tmp_254_reg_1732;
wire   [0:0] tmp_419_4_fu_500_p2;
reg   [0:0] tmp_419_4_reg_1738;
wire   [0:0] tmp_420_4_fu_506_p2;
reg   [0:0] tmp_420_4_reg_1744;
wire   [0:0] tmp_421_4_fu_512_p2;
reg   [0:0] tmp_421_4_reg_1750;
wire   [0:0] tmp_422_4_fu_518_p2;
reg   [0:0] tmp_422_4_reg_1756;
wire   [0:0] tmp_423_4_fu_524_p2;
reg   [0:0] tmp_423_4_reg_1762;
wire   [0:0] tmp_424_4_fu_530_p2;
reg   [0:0] tmp_424_4_reg_1767;
wire   [0:0] tmp_255_fu_566_p3;
reg   [0:0] tmp_255_reg_1772;
wire   [0:0] tmp_419_5_fu_588_p2;
reg   [0:0] tmp_419_5_reg_1778;
wire   [0:0] tmp_420_5_fu_594_p2;
reg   [0:0] tmp_420_5_reg_1784;
wire   [0:0] tmp_421_5_fu_600_p2;
reg   [0:0] tmp_421_5_reg_1790;
wire   [0:0] tmp_422_5_fu_606_p2;
reg   [0:0] tmp_422_5_reg_1796;
wire   [0:0] tmp_423_5_fu_612_p2;
reg   [0:0] tmp_423_5_reg_1802;
wire   [0:0] tmp_424_5_fu_618_p2;
reg   [0:0] tmp_424_5_reg_1807;
wire   [0:0] tmp_fu_90_p2;
wire   [7:0] p_s_fu_100_p3;
wire  signed [8:0] p_cast_fu_108_p1;
wire  signed [8:0] rhs_V_fu_116_p1;
wire   [8:0] vArg_V_fu_120_p2;
wire   [8:0] vArg_V_s_fu_134_p2;
wire   [8:0] vArg_V_9_fu_140_p3;
wire   [7:0] p_58_1_fu_188_p3;
wire  signed [8:0] p_58_1_cast_fu_196_p1;
wire  signed [8:0] rhs_V_1_fu_204_p1;
wire   [8:0] vArg_V_1_fu_208_p2;
wire   [8:0] vArg_V_18_1_fu_222_p2;
wire   [8:0] vArg_V_19_1_fu_228_p3;
wire   [7:0] p_58_2_fu_276_p3;
wire  signed [8:0] p_58_2_cast_fu_284_p1;
wire  signed [8:0] rhs_V_2_fu_292_p1;
wire   [8:0] vArg_V_2_fu_296_p2;
wire   [8:0] vArg_V_18_2_fu_310_p2;
wire   [8:0] vArg_V_19_2_fu_316_p3;
wire   [7:0] p_58_3_fu_364_p3;
wire  signed [8:0] p_58_3_cast_fu_372_p1;
wire  signed [8:0] rhs_V_3_fu_380_p1;
wire   [8:0] vArg_V_3_fu_384_p2;
wire   [8:0] vArg_V_18_3_fu_398_p2;
wire   [8:0] vArg_V_19_3_fu_404_p3;
wire   [7:0] p_58_4_fu_452_p3;
wire  signed [8:0] p_58_4_cast_fu_460_p1;
wire  signed [8:0] rhs_V_4_fu_468_p1;
wire   [8:0] vArg_V_4_fu_472_p2;
wire   [8:0] vArg_V_18_4_fu_486_p2;
wire   [8:0] vArg_V_19_4_fu_492_p3;
wire   [7:0] p_58_5_fu_540_p3;
wire  signed [8:0] p_58_5_cast_fu_548_p1;
wire  signed [8:0] rhs_V_5_fu_556_p1;
wire   [8:0] vArg_V_5_fu_560_p2;
wire   [8:0] vArg_V_18_5_fu_574_p2;
wire   [8:0] vArg_V_19_5_fu_580_p3;
wire   [2:0] p_11_cast_cast_fu_624_p3;
wire   [2:0] sel_tmp_fu_631_p3;
wire   [0:0] sel_tmp1_fu_642_p2;
wire   [0:0] sel_tmp6_fu_652_p2;
wire   [0:0] sel_tmp7_fu_657_p2;
wire   [0:0] sel_tmp2_fu_647_p2;
wire   [0:0] tmp_238_fu_670_p2;
wire   [6:0] sel_tmp3_cast_fu_662_p3;
wire  signed [6:0] sel_tmp_cast_fu_638_p1;
wire   [0:0] sel_tmp13_fu_684_p2;
wire   [0:0] sel_tmp22_fu_694_p2;
wire   [0:0] sel_tmp23_fu_699_p2;
wire   [0:0] sel_tmp14_fu_689_p2;
wire   [0:0] tmp_239_fu_712_p2;
wire   [6:0] sel_tmp15_cast_fu_704_p3;
wire   [6:0] sel_tmp8_fu_676_p3;
wire   [2:0] p_59_1_cast_cast_fu_726_p3;
wire   [2:0] sel_tmp26_fu_733_p3;
wire   [0:0] sel_tmp27_fu_744_p2;
wire   [0:0] sel_tmp32_fu_754_p2;
wire   [0:0] sel_tmp33_fu_759_p2;
wire   [0:0] sel_tmp28_fu_749_p2;
wire   [0:0] tmp_240_fu_772_p2;
wire   [6:0] sel_tmp29_cast_fu_764_p3;
wire  signed [6:0] sel_tmp26_cast_fu_740_p1;
wire   [0:0] sel_tmp39_fu_786_p2;
wire   [0:0] sel_tmp48_fu_796_p2;
wire   [0:0] sel_tmp49_fu_801_p2;
wire   [0:0] sel_tmp40_fu_791_p2;
wire   [0:0] tmp_241_fu_814_p2;
wire   [6:0] sel_tmp41_cast_fu_806_p3;
wire   [6:0] sel_tmp34_fu_778_p3;
wire   [6:0] rhs_V_s_fu_718_p3;
wire   [6:0] rhs_V_14_1_fu_820_p3;
wire   [2:0] p_59_2_cast_cast_fu_843_p3;
wire   [2:0] sel_tmp52_fu_850_p3;
wire   [0:0] sel_tmp53_fu_861_p2;
wire   [0:0] sel_tmp58_fu_871_p2;
wire   [0:0] sel_tmp59_fu_876_p2;
wire   [0:0] sel_tmp54_fu_866_p2;
wire   [0:0] tmp_242_fu_889_p2;
wire   [6:0] sel_tmp55_cast_fu_881_p3;
wire  signed [6:0] sel_tmp52_cast_fu_857_p1;
wire   [0:0] sel_tmp65_fu_903_p2;
wire   [0:0] sel_tmp74_fu_913_p2;
wire   [0:0] sel_tmp75_fu_918_p2;
wire   [0:0] sel_tmp66_fu_908_p2;
wire   [0:0] tmp_243_fu_931_p2;
wire   [6:0] sel_tmp67_cast_fu_923_p3;
wire   [6:0] sel_tmp60_fu_895_p3;
wire   [6:0] r_V_54_1_fu_828_p2;
wire   [6:0] rhs_V_14_2_fu_937_p3;
wire   [0:0] tmp_430_1_fu_834_p2;
wire   [0:0] rev7_fu_838_p2;
wire   [2:0] p_59_3_cast_cast_fu_962_p3;
wire   [2:0] sel_tmp78_fu_969_p3;
wire   [0:0] sel_tmp79_fu_980_p2;
wire   [0:0] sel_tmp84_fu_990_p2;
wire   [0:0] sel_tmp85_fu_995_p2;
wire   [0:0] sel_tmp80_fu_985_p2;
wire   [0:0] tmp_244_fu_1008_p2;
wire   [6:0] sel_tmp81_cast_fu_1000_p3;
wire  signed [6:0] sel_tmp78_cast_fu_976_p1;
wire   [0:0] sel_tmp91_fu_1022_p2;
wire   [0:0] sel_tmp100_fu_1032_p2;
wire   [0:0] sel_tmp101_fu_1037_p2;
wire   [0:0] sel_tmp92_fu_1027_p2;
wire   [0:0] tmp_245_fu_1050_p2;
wire   [6:0] sel_tmp93_cast_fu_1042_p3;
wire   [6:0] sel_tmp86_fu_1014_p3;
wire   [6:0] r_V_55_2_fu_945_p2;
wire   [6:0] rhs_V_14_3_fu_1056_p3;
wire   [0:0] tmp_432_2_fu_951_p2;
wire   [0:0] rev10_fu_957_p2;
wire   [2:0] p_59_4_cast_cast_fu_1081_p3;
wire   [2:0] sel_tmp104_fu_1088_p3;
wire   [0:0] sel_tmp105_fu_1099_p2;
wire   [0:0] sel_tmp110_fu_1109_p2;
wire   [0:0] sel_tmp111_fu_1114_p2;
wire   [0:0] sel_tmp106_fu_1104_p2;
wire   [0:0] tmp_246_fu_1127_p2;
wire   [6:0] sel_tmp107_cast_fu_1119_p3;
wire  signed [6:0] sel_tmp104_cast_fu_1095_p1;
wire   [0:0] sel_tmp117_fu_1141_p2;
wire   [0:0] sel_tmp126_fu_1151_p2;
wire   [0:0] sel_tmp127_fu_1156_p2;
wire   [0:0] sel_tmp118_fu_1146_p2;
wire   [0:0] tmp_247_fu_1169_p2;
wire   [6:0] sel_tmp119_cast_fu_1161_p3;
wire   [6:0] sel_tmp112_fu_1133_p3;
wire   [6:0] r_V_56_3_fu_1064_p2;
wire   [6:0] rhs_V_14_4_fu_1175_p3;
wire   [6:0] r_V_57_4_fu_1183_p2;
wire   [0:0] tmp_434_3_fu_1070_p2;
wire   [0:0] rev13_fu_1076_p2;
wire   [2:0] p_59_5_cast_cast_fu_1204_p3;
wire   [2:0] sel_tmp130_fu_1211_p3;
wire   [0:0] sel_tmp131_fu_1222_p2;
wire   [0:0] sel_tmp136_fu_1232_p2;
wire   [0:0] sel_tmp137_fu_1237_p2;
wire   [0:0] sel_tmp132_fu_1227_p2;
wire   [0:0] tmp_248_fu_1250_p2;
wire   [6:0] sel_tmp133_cast_fu_1242_p3;
wire  signed [6:0] sel_tmp130_cast_fu_1218_p1;
wire   [0:0] sel_tmp143_fu_1264_p2;
wire   [0:0] sel_tmp147_fu_1274_p2;
wire   [0:0] sel_tmp148_fu_1279_p2;
wire   [0:0] sel_tmp144_fu_1269_p2;
wire   [0:0] tmp_249_fu_1292_p2;
wire   [6:0] sel_tmp145_cast_fu_1284_p3;
wire   [6:0] sel_tmp138_fu_1256_p3;
wire   [6:0] rhs_V_14_5_fu_1298_p3;
wire   [6:0] tmp132_fu_1312_p2;
wire   [6:0] tmp133_fu_1318_p2;
wire   [6:0] tmp131_fu_1306_p2;
wire   [6:0] r_V_52_5_fu_1324_p2;
wire   [0:0] tmp135_fu_1338_p2;
wire   [0:0] tmp136_fu_1342_p2;
wire   [0:0] tmp134_fu_1334_p2;
wire   [6:0] tmp137_fu_1354_p2;
wire   [6:0] tmp138_fu_1360_p2;
wire   [6:0] r_V_53_5_fu_1366_p2;
wire   [0:0] tmp139_fu_1376_p2;
wire   [6:0] tmp140_fu_1386_p2;
wire   [6:0] r_V_54_5_fu_1392_p2;
wire   [0:0] tmp141_fu_1402_p2;
wire   [6:0] tmp142_fu_1414_p2;
wire   [6:0] r_V_55_5_fu_1420_p2;
wire   [6:0] r_V_56_5_fu_1436_p2;
wire   [0:0] rev_fu_1199_p2;
wire   [7:0] r_V_52_5_cast_fu_1330_p1;
wire   [0:0] tmp_426_5_fu_1348_p2;
wire   [7:0] mt4_fu_1452_p2;
wire   [7:0] r_V_53_5_cast_fu_1372_p1;
wire   [0:0] tmp_428_5_fu_1380_p2;
wire   [7:0] mt5_fu_1472_p2;
wire   [7:0] r_V_54_5_cast_fu_1398_p1;
wire   [0:0] tmp_430_5_fu_1408_p2;
wire   [7:0] mt6_fu_1492_p2;
wire   [7:0] r_V_55_5_cast_fu_1426_p1;
wire   [0:0] tmp_432_5_fu_1430_p2;
wire   [7:0] mt9_fu_1512_p2;
wire   [7:0] r_V_56_5_cast_fu_1442_p1;
wire   [0:0] tmp_434_5_fu_1446_p2;
wire   [7:0] mt7_fu_1532_p2;
wire   [7:0] r_V_57_4_cast_fu_1189_p1;
wire   [0:0] tmp_436_4_fu_1193_p2;
wire   [7:0] mt_fu_1552_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_pipeline_idle_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'b1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((ap_CS_fsm_pp0_stage0 == 1'b1) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_CS_fsm_pp0_stage0 == 1'b1) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)))) begin
        tmp_227_reg_1578 <= tmp_227_fu_148_p2;
        tmp_228_reg_1584 <= tmp_228_fu_154_p2;
        tmp_229_reg_1590 <= tmp_229_fu_160_p2;
        tmp_230_reg_1596 <= tmp_230_fu_166_p2;
        tmp_231_reg_1602 <= tmp_231_fu_172_p2;
        tmp_232_reg_1607 <= tmp_232_fu_178_p2;
        tmp_250_reg_1572 <= vArg_V_fu_120_p2[ap_const_lv32_8];
        tmp_251_reg_1612 <= vArg_V_1_fu_208_p2[ap_const_lv32_8];
        tmp_252_reg_1652 <= vArg_V_2_fu_296_p2[ap_const_lv32_8];
        tmp_253_reg_1693 <= vArg_V_3_fu_384_p2[ap_const_lv32_8];
        tmp_254_reg_1732 <= vArg_V_4_fu_472_p2[ap_const_lv32_8];
        tmp_255_reg_1772 <= vArg_V_5_fu_560_p2[ap_const_lv32_8];
        tmp_419_1_reg_1618 <= tmp_419_1_fu_236_p2;
        tmp_419_2_reg_1659 <= tmp_419_2_fu_324_p2;
        tmp_419_3_reg_1698 <= tmp_419_3_fu_412_p2;
        tmp_419_4_reg_1738 <= tmp_419_4_fu_500_p2;
        tmp_419_5_reg_1778 <= tmp_419_5_fu_588_p2;
        tmp_420_1_reg_1624 <= tmp_420_1_fu_242_p2;
        tmp_420_2_reg_1665 <= tmp_420_2_fu_330_p2;
        tmp_420_3_reg_1704 <= tmp_420_3_fu_418_p2;
        tmp_420_4_reg_1744 <= tmp_420_4_fu_506_p2;
        tmp_420_5_reg_1784 <= tmp_420_5_fu_594_p2;
        tmp_421_1_reg_1630 <= tmp_421_1_fu_248_p2;
        tmp_421_2_reg_1671 <= tmp_421_2_fu_336_p2;
        tmp_421_3_reg_1710 <= tmp_421_3_fu_424_p2;
        tmp_421_4_reg_1750 <= tmp_421_4_fu_512_p2;
        tmp_421_5_reg_1790 <= tmp_421_5_fu_600_p2;
        tmp_422_1_reg_1636 <= tmp_422_1_fu_254_p2;
        tmp_422_2_reg_1677 <= tmp_422_2_fu_342_p2;
        tmp_422_3_reg_1716 <= tmp_422_3_fu_430_p2;
        tmp_422_4_reg_1756 <= tmp_422_4_fu_518_p2;
        tmp_422_5_reg_1796 <= tmp_422_5_fu_606_p2;
        tmp_423_1_reg_1642 <= tmp_423_1_fu_260_p2;
        tmp_423_2_reg_1683 <= tmp_423_2_fu_348_p2;
        tmp_423_3_reg_1722 <= tmp_423_3_fu_436_p2;
        tmp_423_4_reg_1762 <= tmp_423_4_fu_524_p2;
        tmp_423_5_reg_1802 <= tmp_423_5_fu_612_p2;
        tmp_424_1_reg_1647 <= tmp_424_1_fu_266_p2;
        tmp_424_2_reg_1688 <= tmp_424_2_fu_354_p2;
        tmp_424_3_reg_1727 <= tmp_424_3_fu_442_p2;
        tmp_424_4_reg_1767 <= tmp_424_4_fu_530_p2;
        tmp_424_5_reg_1807 <= tmp_424_5_fu_618_p2;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_pp0_stage0 == 1'b1) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)) & (1'b1 == ap_enable_reg_pp0_iter1))) begin
        Eta_ans_1_V_0_ap_vld = 1'b1;
    end else begin
        Eta_ans_1_V_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_pp0_stage0 == 1'b1) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)) & (1'b1 == ap_enable_reg_pp0_iter1))) begin
        Eta_ans_1_V_1_ap_vld = 1'b1;
    end else begin
        Eta_ans_1_V_1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_pp0_stage0 == 1'b1) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)) & (1'b1 == ap_enable_reg_pp0_iter1))) begin
        Eta_ans_1_V_2_ap_vld = 1'b1;
    end else begin
        Eta_ans_1_V_2_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_pp0_stage0 == 1'b1) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)) & (1'b1 == ap_enable_reg_pp0_iter1))) begin
        Eta_ans_1_V_3_ap_vld = 1'b1;
    end else begin
        Eta_ans_1_V_3_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_pp0_stage0 == 1'b1) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)) & (1'b1 == ap_enable_reg_pp0_iter1))) begin
        Eta_ans_1_V_4_ap_vld = 1'b1;
    end else begin
        Eta_ans_1_V_4_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_pp0_stage0 == 1'b1) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)) & (1'b1 == ap_enable_reg_pp0_iter1))) begin
        Eta_ans_1_V_5_ap_vld = 1'b1;
    end else begin
        Eta_ans_1_V_5_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_start) & (ap_CS_fsm_pp0_stage0 == 1'b1) & (1'b1 == ap_enable_reg_pp0_iter0)) | ((ap_CS_fsm_pp0_stage0 == 1'b1) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)) & (1'b1 == ap_enable_reg_pp0_iter1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (ap_CS_fsm_pp0_stage0 == 1'b1) & (1'b0 == ap_enable_reg_pp0_iter0) & (1'b0 == ap_enable_reg_pp0_iter1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b0 == ap_enable_reg_pp0_iter0))) begin
        ap_pipeline_idle_pp0 = 1'b1;
    end else begin
        ap_pipeline_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_pp0_stage0 == 1'b1) & (1'b1 == ap_enable_reg_pp0_iter0) & ~((1'b1 == ap_enable_reg_pp0_iter0) & (ap_start == 1'b0)))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Eta_ans_1_V_0 = ((tmp_426_5_fu_1348_p2[0:0] === 1'b1) ? mt4_fu_1452_p2 : r_V_52_5_cast_fu_1330_p1);

assign Eta_ans_1_V_1 = ((tmp_428_5_fu_1380_p2[0:0] === 1'b1) ? mt5_fu_1472_p2 : r_V_53_5_cast_fu_1372_p1);

assign Eta_ans_1_V_2 = ((tmp_430_5_fu_1408_p2[0:0] === 1'b1) ? mt6_fu_1492_p2 : r_V_54_5_cast_fu_1398_p1);

assign Eta_ans_1_V_3 = ((tmp_432_5_fu_1430_p2[0:0] === 1'b1) ? mt9_fu_1512_p2 : r_V_55_5_cast_fu_1426_p1);

assign Eta_ans_1_V_4 = ((tmp_434_5_fu_1446_p2[0:0] === 1'b1) ? mt7_fu_1532_p2 : r_V_56_5_cast_fu_1442_p1);

assign Eta_ans_1_V_5 = ((tmp_436_4_fu_1193_p2[0:0] === 1'b1) ? mt_fu_1552_p2 : r_V_57_4_cast_fu_1189_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[ap_const_lv32_0];

assign ap_enable_reg_pp0_iter0 = ap_start;

assign mt4_fu_1452_p2 = (ap_const_lv8_0 - r_V_52_5_cast_fu_1330_p1);

assign mt5_fu_1472_p2 = (ap_const_lv8_0 - r_V_53_5_cast_fu_1372_p1);

assign mt6_fu_1492_p2 = (ap_const_lv8_0 - r_V_54_5_cast_fu_1398_p1);

assign mt7_fu_1532_p2 = (ap_const_lv8_0 - r_V_56_5_cast_fu_1442_p1);

assign mt9_fu_1512_p2 = (ap_const_lv8_0 - r_V_55_5_cast_fu_1426_p1);

assign mt_fu_1552_p2 = (ap_const_lv8_0 - r_V_57_4_cast_fu_1189_p1);

assign p_11_cast_cast_fu_624_p3 = ((tmp_227_reg_1578[0:0] === 1'b1) ? ap_const_lv3_7 : ap_const_lv3_3);

assign p_58_1_cast_fu_196_p1 = $signed(p_58_1_fu_188_p3);

assign p_58_1_fu_188_p3 = ((tmp_fu_90_p2[0:0] === 1'b1) ? ap_const_lv8_0 : Peta_taby_V_1);

assign p_58_2_cast_fu_284_p1 = $signed(p_58_2_fu_276_p3);

assign p_58_2_fu_276_p3 = ((tmp_fu_90_p2[0:0] === 1'b1) ? ap_const_lv8_0 : Peta_taby_V_2);

assign p_58_3_cast_fu_372_p1 = $signed(p_58_3_fu_364_p3);

assign p_58_3_fu_364_p3 = ((tmp_fu_90_p2[0:0] === 1'b1) ? ap_const_lv8_0 : Peta_taby_V_3);

assign p_58_4_cast_fu_460_p1 = $signed(p_58_4_fu_452_p3);

assign p_58_4_fu_452_p3 = ((tmp_fu_90_p2[0:0] === 1'b1) ? ap_const_lv8_0 : Peta_taby_V_4);

assign p_58_5_cast_fu_548_p1 = $signed(p_58_5_fu_540_p3);

assign p_58_5_fu_540_p3 = ((tmp_fu_90_p2[0:0] === 1'b1) ? ap_const_lv8_0 : Peta_taby_V_5);

assign p_59_1_cast_cast_fu_726_p3 = ((tmp_419_1_reg_1618[0:0] === 1'b1) ? ap_const_lv3_7 : ap_const_lv3_3);

assign p_59_2_cast_cast_fu_843_p3 = ((tmp_419_2_reg_1659[0:0] === 1'b1) ? ap_const_lv3_7 : ap_const_lv3_3);

assign p_59_3_cast_cast_fu_962_p3 = ((tmp_419_3_reg_1698[0:0] === 1'b1) ? ap_const_lv3_7 : ap_const_lv3_3);

assign p_59_4_cast_cast_fu_1081_p3 = ((tmp_419_4_reg_1738[0:0] === 1'b1) ? ap_const_lv3_7 : ap_const_lv3_3);

assign p_59_5_cast_cast_fu_1204_p3 = ((tmp_419_5_reg_1778[0:0] === 1'b1) ? ap_const_lv3_7 : ap_const_lv3_3);

assign p_cast_fu_108_p1 = $signed(p_s_fu_100_p3);

assign p_s_fu_100_p3 = ((tmp_fu_90_p2[0:0] === 1'b1) ? ap_const_lv8_0 : Peta_taby_V_0);

assign r_V_52_5_cast_fu_1330_p1 = r_V_52_5_fu_1324_p2;

assign r_V_52_5_fu_1324_p2 = (tmp133_fu_1318_p2 & tmp131_fu_1306_p2);

assign r_V_53_5_cast_fu_1372_p1 = r_V_53_5_fu_1366_p2;

assign r_V_53_5_fu_1366_p2 = (tmp138_fu_1360_p2 & tmp131_fu_1306_p2);

assign r_V_54_1_fu_828_p2 = (rhs_V_s_fu_718_p3 & rhs_V_14_1_fu_820_p3);

assign r_V_54_5_cast_fu_1398_p1 = r_V_54_5_fu_1392_p2;

assign r_V_54_5_fu_1392_p2 = (tmp140_fu_1386_p2 & tmp131_fu_1306_p2);

assign r_V_55_2_fu_945_p2 = (r_V_54_1_fu_828_p2 & rhs_V_14_2_fu_937_p3);

assign r_V_55_5_cast_fu_1426_p1 = r_V_55_5_fu_1420_p2;

assign r_V_55_5_fu_1420_p2 = (tmp142_fu_1414_p2 & r_V_55_2_fu_945_p2);

assign r_V_56_3_fu_1064_p2 = (r_V_55_2_fu_945_p2 & rhs_V_14_3_fu_1056_p3);

assign r_V_56_5_cast_fu_1442_p1 = r_V_56_5_fu_1436_p2;

assign r_V_56_5_fu_1436_p2 = (r_V_56_3_fu_1064_p2 & rhs_V_14_5_fu_1298_p3);

assign r_V_57_4_cast_fu_1189_p1 = r_V_57_4_fu_1183_p2;

assign r_V_57_4_fu_1183_p2 = (r_V_56_3_fu_1064_p2 & rhs_V_14_4_fu_1175_p3);

assign rev10_fu_957_p2 = (tmp_253_reg_1693 ^ 1'b1);

assign rev13_fu_1076_p2 = (tmp_254_reg_1732 ^ 1'b1);

assign rev7_fu_838_p2 = (tmp_252_reg_1652 ^ 1'b1);

assign rev_fu_1199_p2 = (tmp_255_reg_1772 ^ 1'b1);

assign rhs_V_14_1_fu_820_p3 = ((tmp_241_fu_814_p2[0:0] === 1'b1) ? sel_tmp41_cast_fu_806_p3 : sel_tmp34_fu_778_p3);

assign rhs_V_14_2_fu_937_p3 = ((tmp_243_fu_931_p2[0:0] === 1'b1) ? sel_tmp67_cast_fu_923_p3 : sel_tmp60_fu_895_p3);

assign rhs_V_14_3_fu_1056_p3 = ((tmp_245_fu_1050_p2[0:0] === 1'b1) ? sel_tmp93_cast_fu_1042_p3 : sel_tmp86_fu_1014_p3);

assign rhs_V_14_4_fu_1175_p3 = ((tmp_247_fu_1169_p2[0:0] === 1'b1) ? sel_tmp119_cast_fu_1161_p3 : sel_tmp112_fu_1133_p3);

assign rhs_V_14_5_fu_1298_p3 = ((tmp_249_fu_1292_p2[0:0] === 1'b1) ? sel_tmp145_cast_fu_1284_p3 : sel_tmp138_fu_1256_p3);

assign rhs_V_1_fu_204_p1 = $signed(Lam_taby_V_1);

assign rhs_V_2_fu_292_p1 = $signed(Lam_taby_V_2);

assign rhs_V_3_fu_380_p1 = $signed(Lam_taby_V_3);

assign rhs_V_4_fu_468_p1 = $signed(Lam_taby_V_4);

assign rhs_V_5_fu_556_p1 = $signed(Lam_taby_V_5);

assign rhs_V_fu_116_p1 = $signed(Lam_taby_V_0);

assign rhs_V_s_fu_718_p3 = ((tmp_239_fu_712_p2[0:0] === 1'b1) ? sel_tmp15_cast_fu_704_p3 : sel_tmp8_fu_676_p3);

assign sel_tmp100_fu_1032_p2 = (tmp_422_3_reg_1716 ^ 1'b1);

assign sel_tmp101_fu_1037_p2 = (tmp_423_3_reg_1722 & sel_tmp100_fu_1032_p2);

assign sel_tmp104_cast_fu_1095_p1 = $signed(sel_tmp104_fu_1088_p3);

assign sel_tmp104_fu_1088_p3 = ((tmp_424_4_reg_1767[0:0] === 1'b1) ? p_59_4_cast_cast_fu_1081_p3 : ap_const_lv3_1);

assign sel_tmp105_fu_1099_p2 = (tmp_419_4_reg_1738 ^ 1'b1);

assign sel_tmp106_fu_1104_p2 = (tmp_420_4_reg_1744 & sel_tmp105_fu_1099_p2);

assign sel_tmp107_cast_fu_1119_p3 = ((sel_tmp111_fu_1114_p2[0:0] === 1'b1) ? ap_const_lv7_1F : ap_const_lv7_3F);

assign sel_tmp110_fu_1109_p2 = (tmp_420_4_reg_1744 ^ 1'b1);

assign sel_tmp111_fu_1114_p2 = (tmp_421_4_reg_1750 & sel_tmp110_fu_1109_p2);

assign sel_tmp112_fu_1133_p3 = ((tmp_246_fu_1127_p2[0:0] === 1'b1) ? sel_tmp107_cast_fu_1119_p3 : sel_tmp104_cast_fu_1095_p1);

assign sel_tmp117_fu_1141_p2 = (tmp_421_4_reg_1750 ^ 1'b1);

assign sel_tmp118_fu_1146_p2 = (tmp_422_4_reg_1756 & sel_tmp117_fu_1141_p2);

assign sel_tmp119_cast_fu_1161_p3 = ((sel_tmp127_fu_1156_p2[0:0] === 1'b1) ? ap_const_lv7_7 : ap_const_lv7_F);

assign sel_tmp126_fu_1151_p2 = (tmp_422_4_reg_1756 ^ 1'b1);

assign sel_tmp127_fu_1156_p2 = (tmp_423_4_reg_1762 & sel_tmp126_fu_1151_p2);

assign sel_tmp130_cast_fu_1218_p1 = $signed(sel_tmp130_fu_1211_p3);

assign sel_tmp130_fu_1211_p3 = ((tmp_424_5_reg_1807[0:0] === 1'b1) ? p_59_5_cast_cast_fu_1204_p3 : ap_const_lv3_1);

assign sel_tmp131_fu_1222_p2 = (tmp_419_5_reg_1778 ^ 1'b1);

assign sel_tmp132_fu_1227_p2 = (tmp_420_5_reg_1784 & sel_tmp131_fu_1222_p2);

assign sel_tmp133_cast_fu_1242_p3 = ((sel_tmp137_fu_1237_p2[0:0] === 1'b1) ? ap_const_lv7_1F : ap_const_lv7_3F);

assign sel_tmp136_fu_1232_p2 = (tmp_420_5_reg_1784 ^ 1'b1);

assign sel_tmp137_fu_1237_p2 = (tmp_421_5_reg_1790 & sel_tmp136_fu_1232_p2);

assign sel_tmp138_fu_1256_p3 = ((tmp_248_fu_1250_p2[0:0] === 1'b1) ? sel_tmp133_cast_fu_1242_p3 : sel_tmp130_cast_fu_1218_p1);

assign sel_tmp13_fu_684_p2 = (tmp_229_reg_1590 ^ 1'b1);

assign sel_tmp143_fu_1264_p2 = (tmp_421_5_reg_1790 ^ 1'b1);

assign sel_tmp144_fu_1269_p2 = (tmp_422_5_reg_1796 & sel_tmp143_fu_1264_p2);

assign sel_tmp145_cast_fu_1284_p3 = ((sel_tmp148_fu_1279_p2[0:0] === 1'b1) ? ap_const_lv7_7 : ap_const_lv7_F);

assign sel_tmp147_fu_1274_p2 = (tmp_422_5_reg_1796 ^ 1'b1);

assign sel_tmp148_fu_1279_p2 = (tmp_423_5_reg_1802 & sel_tmp147_fu_1274_p2);

assign sel_tmp14_fu_689_p2 = (tmp_230_reg_1596 & sel_tmp13_fu_684_p2);

assign sel_tmp15_cast_fu_704_p3 = ((sel_tmp23_fu_699_p2[0:0] === 1'b1) ? ap_const_lv7_7 : ap_const_lv7_F);

assign sel_tmp1_fu_642_p2 = (tmp_227_reg_1578 ^ 1'b1);

assign sel_tmp22_fu_694_p2 = (tmp_230_reg_1596 ^ 1'b1);

assign sel_tmp23_fu_699_p2 = (tmp_231_reg_1602 & sel_tmp22_fu_694_p2);

assign sel_tmp26_cast_fu_740_p1 = $signed(sel_tmp26_fu_733_p3);

assign sel_tmp26_fu_733_p3 = ((tmp_424_1_reg_1647[0:0] === 1'b1) ? p_59_1_cast_cast_fu_726_p3 : ap_const_lv3_1);

assign sel_tmp27_fu_744_p2 = (tmp_419_1_reg_1618 ^ 1'b1);

assign sel_tmp28_fu_749_p2 = (tmp_420_1_reg_1624 & sel_tmp27_fu_744_p2);

assign sel_tmp29_cast_fu_764_p3 = ((sel_tmp33_fu_759_p2[0:0] === 1'b1) ? ap_const_lv7_1F : ap_const_lv7_3F);

assign sel_tmp2_fu_647_p2 = (tmp_228_reg_1584 & sel_tmp1_fu_642_p2);

assign sel_tmp32_fu_754_p2 = (tmp_420_1_reg_1624 ^ 1'b1);

assign sel_tmp33_fu_759_p2 = (tmp_421_1_reg_1630 & sel_tmp32_fu_754_p2);

assign sel_tmp34_fu_778_p3 = ((tmp_240_fu_772_p2[0:0] === 1'b1) ? sel_tmp29_cast_fu_764_p3 : sel_tmp26_cast_fu_740_p1);

assign sel_tmp39_fu_786_p2 = (tmp_421_1_reg_1630 ^ 1'b1);

assign sel_tmp3_cast_fu_662_p3 = ((sel_tmp7_fu_657_p2[0:0] === 1'b1) ? ap_const_lv7_1F : ap_const_lv7_3F);

assign sel_tmp40_fu_791_p2 = (tmp_422_1_reg_1636 & sel_tmp39_fu_786_p2);

assign sel_tmp41_cast_fu_806_p3 = ((sel_tmp49_fu_801_p2[0:0] === 1'b1) ? ap_const_lv7_7 : ap_const_lv7_F);

assign sel_tmp48_fu_796_p2 = (tmp_422_1_reg_1636 ^ 1'b1);

assign sel_tmp49_fu_801_p2 = (tmp_423_1_reg_1642 & sel_tmp48_fu_796_p2);

assign sel_tmp52_cast_fu_857_p1 = $signed(sel_tmp52_fu_850_p3);

assign sel_tmp52_fu_850_p3 = ((tmp_424_2_reg_1688[0:0] === 1'b1) ? p_59_2_cast_cast_fu_843_p3 : ap_const_lv3_1);

assign sel_tmp53_fu_861_p2 = (tmp_419_2_reg_1659 ^ 1'b1);

assign sel_tmp54_fu_866_p2 = (tmp_420_2_reg_1665 & sel_tmp53_fu_861_p2);

assign sel_tmp55_cast_fu_881_p3 = ((sel_tmp59_fu_876_p2[0:0] === 1'b1) ? ap_const_lv7_1F : ap_const_lv7_3F);

assign sel_tmp58_fu_871_p2 = (tmp_420_2_reg_1665 ^ 1'b1);

assign sel_tmp59_fu_876_p2 = (tmp_421_2_reg_1671 & sel_tmp58_fu_871_p2);

assign sel_tmp60_fu_895_p3 = ((tmp_242_fu_889_p2[0:0] === 1'b1) ? sel_tmp55_cast_fu_881_p3 : sel_tmp52_cast_fu_857_p1);

assign sel_tmp65_fu_903_p2 = (tmp_421_2_reg_1671 ^ 1'b1);

assign sel_tmp66_fu_908_p2 = (tmp_422_2_reg_1677 & sel_tmp65_fu_903_p2);

assign sel_tmp67_cast_fu_923_p3 = ((sel_tmp75_fu_918_p2[0:0] === 1'b1) ? ap_const_lv7_7 : ap_const_lv7_F);

assign sel_tmp6_fu_652_p2 = (tmp_228_reg_1584 ^ 1'b1);

assign sel_tmp74_fu_913_p2 = (tmp_422_2_reg_1677 ^ 1'b1);

assign sel_tmp75_fu_918_p2 = (tmp_423_2_reg_1683 & sel_tmp74_fu_913_p2);

assign sel_tmp78_cast_fu_976_p1 = $signed(sel_tmp78_fu_969_p3);

assign sel_tmp78_fu_969_p3 = ((tmp_424_3_reg_1727[0:0] === 1'b1) ? p_59_3_cast_cast_fu_962_p3 : ap_const_lv3_1);

assign sel_tmp79_fu_980_p2 = (tmp_419_3_reg_1698 ^ 1'b1);

assign sel_tmp7_fu_657_p2 = (tmp_229_reg_1590 & sel_tmp6_fu_652_p2);

assign sel_tmp80_fu_985_p2 = (tmp_420_3_reg_1704 & sel_tmp79_fu_980_p2);

assign sel_tmp81_cast_fu_1000_p3 = ((sel_tmp85_fu_995_p2[0:0] === 1'b1) ? ap_const_lv7_1F : ap_const_lv7_3F);

assign sel_tmp84_fu_990_p2 = (tmp_420_3_reg_1704 ^ 1'b1);

assign sel_tmp85_fu_995_p2 = (tmp_421_3_reg_1710 & sel_tmp84_fu_990_p2);

assign sel_tmp86_fu_1014_p3 = ((tmp_244_fu_1008_p2[0:0] === 1'b1) ? sel_tmp81_cast_fu_1000_p3 : sel_tmp78_cast_fu_976_p1);

assign sel_tmp8_fu_676_p3 = ((tmp_238_fu_670_p2[0:0] === 1'b1) ? sel_tmp3_cast_fu_662_p3 : sel_tmp_cast_fu_638_p1);

assign sel_tmp91_fu_1022_p2 = (tmp_421_3_reg_1710 ^ 1'b1);

assign sel_tmp92_fu_1027_p2 = (tmp_422_3_reg_1716 & sel_tmp91_fu_1022_p2);

assign sel_tmp93_cast_fu_1042_p3 = ((sel_tmp101_fu_1037_p2[0:0] === 1'b1) ? ap_const_lv7_7 : ap_const_lv7_F);

assign sel_tmp_cast_fu_638_p1 = $signed(sel_tmp_fu_631_p3);

assign sel_tmp_fu_631_p3 = ((tmp_232_reg_1607[0:0] === 1'b1) ? p_11_cast_cast_fu_624_p3 : ap_const_lv3_1);

assign tmp131_fu_1306_p2 = (rhs_V_14_3_fu_1056_p3 & rhs_V_14_4_fu_1175_p3);

assign tmp132_fu_1312_p2 = (rhs_V_14_1_fu_820_p3 & rhs_V_14_5_fu_1298_p3);

assign tmp133_fu_1318_p2 = (tmp132_fu_1312_p2 & rhs_V_14_2_fu_937_p3);

assign tmp134_fu_1334_p2 = (tmp_251_reg_1612 ^ tmp_252_reg_1652);

assign tmp135_fu_1338_p2 = (tmp_254_reg_1732 ^ tmp_255_reg_1772);

assign tmp136_fu_1342_p2 = (tmp135_fu_1338_p2 ^ rev10_fu_957_p2);

assign tmp137_fu_1354_p2 = (rhs_V_s_fu_718_p3 & rhs_V_14_5_fu_1298_p3);

assign tmp138_fu_1360_p2 = (tmp137_fu_1354_p2 & rhs_V_14_2_fu_937_p3);

assign tmp139_fu_1376_p2 = (tmp_250_reg_1572 ^ tmp_252_reg_1652);

assign tmp140_fu_1386_p2 = (r_V_54_1_fu_828_p2 & rhs_V_14_5_fu_1298_p3);

assign tmp141_fu_1402_p2 = (tmp_430_1_fu_834_p2 ^ rev10_fu_957_p2);

assign tmp142_fu_1414_p2 = (rhs_V_14_4_fu_1175_p3 & rhs_V_14_5_fu_1298_p3);

assign tmp_227_fu_148_p2 = (($signed(vArg_V_9_fu_140_p3) > $signed(9'b1111110)) ? 1'b1 : 1'b0);

assign tmp_228_fu_154_p2 = (($signed(vArg_V_9_fu_140_p3) > $signed(9'b111110)) ? 1'b1 : 1'b0);

assign tmp_229_fu_160_p2 = (($signed(vArg_V_9_fu_140_p3) > $signed(9'b11110)) ? 1'b1 : 1'b0);

assign tmp_230_fu_166_p2 = (($signed(vArg_V_9_fu_140_p3) > $signed(9'b1110)) ? 1'b1 : 1'b0);

assign tmp_231_fu_172_p2 = (($signed(vArg_V_9_fu_140_p3) > $signed(9'b110)) ? 1'b1 : 1'b0);

assign tmp_232_fu_178_p2 = (($signed(vArg_V_9_fu_140_p3) > $signed(9'b10)) ? 1'b1 : 1'b0);

assign tmp_238_fu_670_p2 = (sel_tmp7_fu_657_p2 | sel_tmp2_fu_647_p2);

assign tmp_239_fu_712_p2 = (sel_tmp23_fu_699_p2 | sel_tmp14_fu_689_p2);

assign tmp_240_fu_772_p2 = (sel_tmp33_fu_759_p2 | sel_tmp28_fu_749_p2);

assign tmp_241_fu_814_p2 = (sel_tmp49_fu_801_p2 | sel_tmp40_fu_791_p2);

assign tmp_242_fu_889_p2 = (sel_tmp59_fu_876_p2 | sel_tmp54_fu_866_p2);

assign tmp_243_fu_931_p2 = (sel_tmp75_fu_918_p2 | sel_tmp66_fu_908_p2);

assign tmp_244_fu_1008_p2 = (sel_tmp85_fu_995_p2 | sel_tmp80_fu_985_p2);

assign tmp_245_fu_1050_p2 = (sel_tmp101_fu_1037_p2 | sel_tmp92_fu_1027_p2);

assign tmp_246_fu_1127_p2 = (sel_tmp111_fu_1114_p2 | sel_tmp106_fu_1104_p2);

assign tmp_247_fu_1169_p2 = (sel_tmp127_fu_1156_p2 | sel_tmp118_fu_1146_p2);

assign tmp_248_fu_1250_p2 = (sel_tmp137_fu_1237_p2 | sel_tmp132_fu_1227_p2);

assign tmp_249_fu_1292_p2 = (sel_tmp148_fu_1279_p2 | sel_tmp144_fu_1269_p2);

assign tmp_250_fu_126_p3 = vArg_V_fu_120_p2[ap_const_lv32_8];

assign tmp_251_fu_214_p3 = vArg_V_1_fu_208_p2[ap_const_lv32_8];

assign tmp_252_fu_302_p3 = vArg_V_2_fu_296_p2[ap_const_lv32_8];

assign tmp_253_fu_390_p3 = vArg_V_3_fu_384_p2[ap_const_lv32_8];

assign tmp_254_fu_478_p3 = vArg_V_4_fu_472_p2[ap_const_lv32_8];

assign tmp_255_fu_566_p3 = vArg_V_5_fu_560_p2[ap_const_lv32_8];

assign tmp_419_1_fu_236_p2 = (($signed(vArg_V_19_1_fu_228_p3) > $signed(9'b1111110)) ? 1'b1 : 1'b0);

assign tmp_419_2_fu_324_p2 = (($signed(vArg_V_19_2_fu_316_p3) > $signed(9'b1111110)) ? 1'b1 : 1'b0);

assign tmp_419_3_fu_412_p2 = (($signed(vArg_V_19_3_fu_404_p3) > $signed(9'b1111110)) ? 1'b1 : 1'b0);

assign tmp_419_4_fu_500_p2 = (($signed(vArg_V_19_4_fu_492_p3) > $signed(9'b1111110)) ? 1'b1 : 1'b0);

assign tmp_419_5_fu_588_p2 = (($signed(vArg_V_19_5_fu_580_p3) > $signed(9'b1111110)) ? 1'b1 : 1'b0);

assign tmp_420_1_fu_242_p2 = (($signed(vArg_V_19_1_fu_228_p3) > $signed(9'b111110)) ? 1'b1 : 1'b0);

assign tmp_420_2_fu_330_p2 = (($signed(vArg_V_19_2_fu_316_p3) > $signed(9'b111110)) ? 1'b1 : 1'b0);

assign tmp_420_3_fu_418_p2 = (($signed(vArg_V_19_3_fu_404_p3) > $signed(9'b111110)) ? 1'b1 : 1'b0);

assign tmp_420_4_fu_506_p2 = (($signed(vArg_V_19_4_fu_492_p3) > $signed(9'b111110)) ? 1'b1 : 1'b0);

assign tmp_420_5_fu_594_p2 = (($signed(vArg_V_19_5_fu_580_p3) > $signed(9'b111110)) ? 1'b1 : 1'b0);

assign tmp_421_1_fu_248_p2 = (($signed(vArg_V_19_1_fu_228_p3) > $signed(9'b11110)) ? 1'b1 : 1'b0);

assign tmp_421_2_fu_336_p2 = (($signed(vArg_V_19_2_fu_316_p3) > $signed(9'b11110)) ? 1'b1 : 1'b0);

assign tmp_421_3_fu_424_p2 = (($signed(vArg_V_19_3_fu_404_p3) > $signed(9'b11110)) ? 1'b1 : 1'b0);

assign tmp_421_4_fu_512_p2 = (($signed(vArg_V_19_4_fu_492_p3) > $signed(9'b11110)) ? 1'b1 : 1'b0);

assign tmp_421_5_fu_600_p2 = (($signed(vArg_V_19_5_fu_580_p3) > $signed(9'b11110)) ? 1'b1 : 1'b0);

assign tmp_422_1_fu_254_p2 = (($signed(vArg_V_19_1_fu_228_p3) > $signed(9'b1110)) ? 1'b1 : 1'b0);

assign tmp_422_2_fu_342_p2 = (($signed(vArg_V_19_2_fu_316_p3) > $signed(9'b1110)) ? 1'b1 : 1'b0);

assign tmp_422_3_fu_430_p2 = (($signed(vArg_V_19_3_fu_404_p3) > $signed(9'b1110)) ? 1'b1 : 1'b0);

assign tmp_422_4_fu_518_p2 = (($signed(vArg_V_19_4_fu_492_p3) > $signed(9'b1110)) ? 1'b1 : 1'b0);

assign tmp_422_5_fu_606_p2 = (($signed(vArg_V_19_5_fu_580_p3) > $signed(9'b1110)) ? 1'b1 : 1'b0);

assign tmp_423_1_fu_260_p2 = (($signed(vArg_V_19_1_fu_228_p3) > $signed(9'b110)) ? 1'b1 : 1'b0);

assign tmp_423_2_fu_348_p2 = (($signed(vArg_V_19_2_fu_316_p3) > $signed(9'b110)) ? 1'b1 : 1'b0);

assign tmp_423_3_fu_436_p2 = (($signed(vArg_V_19_3_fu_404_p3) > $signed(9'b110)) ? 1'b1 : 1'b0);

assign tmp_423_4_fu_524_p2 = (($signed(vArg_V_19_4_fu_492_p3) > $signed(9'b110)) ? 1'b1 : 1'b0);

assign tmp_423_5_fu_612_p2 = (($signed(vArg_V_19_5_fu_580_p3) > $signed(9'b110)) ? 1'b1 : 1'b0);

assign tmp_424_1_fu_266_p2 = (($signed(vArg_V_19_1_fu_228_p3) > $signed(9'b10)) ? 1'b1 : 1'b0);

assign tmp_424_2_fu_354_p2 = (($signed(vArg_V_19_2_fu_316_p3) > $signed(9'b10)) ? 1'b1 : 1'b0);

assign tmp_424_3_fu_442_p2 = (($signed(vArg_V_19_3_fu_404_p3) > $signed(9'b10)) ? 1'b1 : 1'b0);

assign tmp_424_4_fu_530_p2 = (($signed(vArg_V_19_4_fu_492_p3) > $signed(9'b10)) ? 1'b1 : 1'b0);

assign tmp_424_5_fu_618_p2 = (($signed(vArg_V_19_5_fu_580_p3) > $signed(9'b10)) ? 1'b1 : 1'b0);

assign tmp_426_5_fu_1348_p2 = (tmp136_fu_1342_p2 ^ tmp134_fu_1334_p2);

assign tmp_428_5_fu_1380_p2 = (tmp136_fu_1342_p2 ^ tmp139_fu_1376_p2);

assign tmp_430_1_fu_834_p2 = (tmp_250_reg_1572 ^ tmp_251_reg_1612);

assign tmp_430_5_fu_1408_p2 = (tmp135_fu_1338_p2 ^ tmp141_fu_1402_p2);

assign tmp_432_2_fu_951_p2 = (tmp_430_1_fu_834_p2 ^ rev7_fu_838_p2);

assign tmp_432_5_fu_1430_p2 = (tmp135_fu_1338_p2 ^ tmp_432_2_fu_951_p2);

assign tmp_434_3_fu_1070_p2 = (tmp_432_2_fu_951_p2 ^ rev10_fu_957_p2);

assign tmp_434_5_fu_1446_p2 = (tmp_434_3_fu_1070_p2 ^ rev_fu_1199_p2);

assign tmp_436_4_fu_1193_p2 = (tmp_434_3_fu_1070_p2 ^ rev13_fu_1076_p2);

assign tmp_fu_90_p2 = ((nIterationCounter == ap_const_lv16_0) ? 1'b1 : 1'b0);

assign vArg_V_18_1_fu_222_p2 = (ap_const_lv9_0 - vArg_V_1_fu_208_p2);

assign vArg_V_18_2_fu_310_p2 = (ap_const_lv9_0 - vArg_V_2_fu_296_p2);

assign vArg_V_18_3_fu_398_p2 = (ap_const_lv9_0 - vArg_V_3_fu_384_p2);

assign vArg_V_18_4_fu_486_p2 = (ap_const_lv9_0 - vArg_V_4_fu_472_p2);

assign vArg_V_18_5_fu_574_p2 = (ap_const_lv9_0 - vArg_V_5_fu_560_p2);

assign vArg_V_19_1_fu_228_p3 = ((tmp_251_fu_214_p3[0:0] === 1'b1) ? vArg_V_18_1_fu_222_p2 : vArg_V_1_fu_208_p2);

assign vArg_V_19_2_fu_316_p3 = ((tmp_252_fu_302_p3[0:0] === 1'b1) ? vArg_V_18_2_fu_310_p2 : vArg_V_2_fu_296_p2);

assign vArg_V_19_3_fu_404_p3 = ((tmp_253_fu_390_p3[0:0] === 1'b1) ? vArg_V_18_3_fu_398_p2 : vArg_V_3_fu_384_p2);

assign vArg_V_19_4_fu_492_p3 = ((tmp_254_fu_478_p3[0:0] === 1'b1) ? vArg_V_18_4_fu_486_p2 : vArg_V_4_fu_472_p2);

assign vArg_V_19_5_fu_580_p3 = ((tmp_255_fu_566_p3[0:0] === 1'b1) ? vArg_V_18_5_fu_574_p2 : vArg_V_5_fu_560_p2);

assign vArg_V_1_fu_208_p2 = ($signed(p_58_1_cast_fu_196_p1) - $signed(rhs_V_1_fu_204_p1));

assign vArg_V_2_fu_296_p2 = ($signed(p_58_2_cast_fu_284_p1) - $signed(rhs_V_2_fu_292_p1));

assign vArg_V_3_fu_384_p2 = ($signed(p_58_3_cast_fu_372_p1) - $signed(rhs_V_3_fu_380_p1));

assign vArg_V_4_fu_472_p2 = ($signed(p_58_4_cast_fu_460_p1) - $signed(rhs_V_4_fu_468_p1));

assign vArg_V_5_fu_560_p2 = ($signed(p_58_5_cast_fu_548_p1) - $signed(rhs_V_5_fu_556_p1));

assign vArg_V_9_fu_140_p3 = ((tmp_250_fu_126_p3[0:0] === 1'b1) ? vArg_V_s_fu_134_p2 : vArg_V_fu_120_p2);

assign vArg_V_fu_120_p2 = ($signed(p_cast_fu_108_p1) - $signed(rhs_V_fu_116_p1));

assign vArg_V_s_fu_134_p2 = (ap_const_lv9_0 - vArg_V_fu_120_p2);

endmodule //mcalcC
