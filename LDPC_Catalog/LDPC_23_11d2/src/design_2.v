//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
//Date        : Mon Jan 09 16:11:42 2023
//Host        : DCO_XPS running 64-bit major release  (build 9200)
//Command     : generate_target design_2.bd
//Design      : design_2
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_2,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=112,numReposBlks=112,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=7,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=2,synth_mode=Global}" *) (* HW_HANDOFF = "design_2.hwdef" *) 
module design_2
   (BLOCK_RATE,
    BLOCK_SIZE,
    DECODE_OUT,
    DECODE_OUT_VALID,
    Decoder_B_Iterations,
    ERR_CODE,
    Iteration_Number,
    LDPC_MODE,
    LDPC_RUN,
    buff_ready,
    clk_div,
    clock_rtl,
    cnt,
    cnt_B,
    cur_read_pos_V,
    cur_write_pos_V,
    data_in,
    deran_data,
    deran_data_ap_vld,
    deran_sel,
    full,
    overrun,
    pMaxIterations,
    rd_clk_in,
    rd_clk_out,
    read_clk_en,
    reset_rtl,
    sync,
    write_clk_en);
  input [1:0]BLOCK_RATE;
  input [1:0]BLOCK_SIZE;
  output [0:0]DECODE_OUT;
  output DECODE_OUT_VALID;
  output [7:0]Decoder_B_Iterations;
  output [15:0]ERR_CODE;
  output [7:0]Iteration_Number;
  output [1:0]LDPC_MODE;
  input LDPC_RUN;
  output [0:0]buff_ready;
  input [15:0]clk_div;
  input clock_rtl;
  output [31:0]cnt;
  output [31:0]cnt_B;
  output [15:0]cur_read_pos_V;
  output [15:0]cur_write_pos_V;
  input [7:0]data_in;
  output [7:0]deran_data;
  output deran_data_ap_vld;
  input [1:0]deran_sel;
  output [0:0]full;
  output [0:0]overrun;
  input [15:0]pMaxIterations;
  input [0:0]rd_clk_in;
  output [0:0]rd_clk_out;
  output [0:0]read_clk_en;
  input reset_rtl;
  input [0:0]sync;
  input [0:0]write_clk_en;

  wire [1:0]BLOCK_RATE_1;
  wire [1:0]BLOCK_SIZE_1;
  wire [10:0]Decoder_A_pbhat0_address0;
  wire Decoder_A_pbhat0_ce0;
  wire [0:0]Decoder_A_pbhat0_d0;
  wire Decoder_A_pbhat0_we0;
  wire [10:0]Decoder_A_pbhat1_address0;
  wire Decoder_A_pbhat1_ce0;
  wire [0:0]Decoder_A_pbhat1_d0;
  wire Decoder_A_pbhat1_we0;
  wire [9:0]Decoder_A_pbhat2_address0;
  wire Decoder_A_pbhat2_ce0;
  wire [0:0]Decoder_A_pbhat2_d0;
  wire Decoder_A_pbhat2_we0;
  wire [9:0]Decoder_A_pbhat3_address0;
  wire Decoder_A_pbhat3_ce0;
  wire [0:0]Decoder_A_pbhat3_d0;
  wire Decoder_A_pbhat3_we0;
  wire [9:0]Decoder_A_pbhat4_address0;
  wire Decoder_A_pbhat4_ce0;
  wire [0:0]Decoder_A_pbhat4_d0;
  wire Decoder_A_pbhat4_we0;
  wire [9:0]Decoder_A_pbhat5_address0;
  wire Decoder_A_pbhat5_ce0;
  wire [0:0]Decoder_A_pbhat5_d0;
  wire Decoder_A_pbhat5_we0;
  wire [9:0]Decoder_A_pbhat6_address0;
  wire Decoder_A_pbhat6_ce0;
  wire [0:0]Decoder_A_pbhat6_d0;
  wire Decoder_A_pbhat6_we0;
  wire [9:0]Decoder_A_pbhat7_address0;
  wire Decoder_A_pbhat7_ce0;
  wire [0:0]Decoder_A_pbhat7_d0;
  wire Decoder_A_pbhat7_we0;
  wire Decoder_B_ap_done;
  wire [31:0]Decoder_B_cnt;
  wire [7:0]Decoder_B_itt_num;
  wire Decoder_B_itt_num_ap_vld;
  wire [10:0]Decoder_B_pR1_address0;
  wire Decoder_B_pR1_ce0;
  wire [10:0]Decoder_B_pR2_address0;
  wire Decoder_B_pR2_ce0;
  wire [10:0]Decoder_B_pR3_address0;
  wire Decoder_B_pR3_ce0;
  wire [9:0]Decoder_B_pR4_address0;
  wire Decoder_B_pR4_ce0;
  wire [9:0]Decoder_B_pR5_address0;
  wire Decoder_B_pR5_ce0;
  wire [9:0]Decoder_B_pR6_address0;
  wire Decoder_B_pR6_ce0;
  wire [9:0]Decoder_B_pR7_address0;
  wire Decoder_B_pR7_ce0;
  wire [9:0]Decoder_B_pR8_address0;
  wire Decoder_B_pR8_ce0;
  wire [9:0]Decoder_B_pR9_address0;
  wire Decoder_B_pR9_ce0;
  wire [10:0]Decoder_B_pR_address0;
  wire Decoder_B_pR_ce0;
  wire [10:0]Decoder_B_pbhat0_address0;
  wire Decoder_B_pbhat0_ce0;
  wire [0:0]Decoder_B_pbhat0_d0;
  wire Decoder_B_pbhat0_we0;
  wire [10:0]Decoder_B_pbhat1_address0;
  wire Decoder_B_pbhat1_ce0;
  wire [0:0]Decoder_B_pbhat1_d0;
  wire Decoder_B_pbhat1_we0;
  wire [9:0]Decoder_B_pbhat2_address0;
  wire Decoder_B_pbhat2_ce0;
  wire [0:0]Decoder_B_pbhat2_d0;
  wire Decoder_B_pbhat2_we0;
  wire [9:0]Decoder_B_pbhat3_address0;
  wire Decoder_B_pbhat3_ce0;
  wire [0:0]Decoder_B_pbhat3_d0;
  wire Decoder_B_pbhat3_we0;
  wire [9:0]Decoder_B_pbhat4_address0;
  wire Decoder_B_pbhat4_ce0;
  wire [0:0]Decoder_B_pbhat4_d0;
  wire Decoder_B_pbhat4_we0;
  wire [9:0]Decoder_B_pbhat5_address0;
  wire Decoder_B_pbhat5_ce0;
  wire [0:0]Decoder_B_pbhat5_d0;
  wire Decoder_B_pbhat5_we0;
  wire [9:0]Decoder_B_pbhat6_address0;
  wire Decoder_B_pbhat6_ce0;
  wire [0:0]Decoder_B_pbhat6_d0;
  wire Decoder_B_pbhat6_we0;
  wire [9:0]Decoder_B_pbhat7_address0;
  wire Decoder_B_pbhat7_ce0;
  wire [0:0]Decoder_B_pbhat7_d0;
  wire Decoder_B_pbhat7_we0;
  wire HLSLdpcLogDecScaledMin_0_ap_done;
  wire HLSLdpcLogDecScaledMin_0_ap_ready;
  wire [31:0]HLSLdpcLogDecScaledMin_0_cnt;
  wire [7:0]HLSLdpcLogDecScaledMin_0_itt_num;
  wire HLSLdpcLogDecScaledMin_0_itt_num_ap_vld;
  wire [10:0]HLSLdpcLogDecScaledMin_0_pR1_address0;
  wire HLSLdpcLogDecScaledMin_0_pR1_ce0;
  wire [10:0]HLSLdpcLogDecScaledMin_0_pR2_address0;
  wire HLSLdpcLogDecScaledMin_0_pR2_ce0;
  wire [10:0]HLSLdpcLogDecScaledMin_0_pR3_address0;
  wire HLSLdpcLogDecScaledMin_0_pR3_ce0;
  wire [9:0]HLSLdpcLogDecScaledMin_0_pR4_address0;
  wire HLSLdpcLogDecScaledMin_0_pR4_ce0;
  wire [9:0]HLSLdpcLogDecScaledMin_0_pR5_address0;
  wire HLSLdpcLogDecScaledMin_0_pR5_ce0;
  wire [9:0]HLSLdpcLogDecScaledMin_0_pR6_address0;
  wire HLSLdpcLogDecScaledMin_0_pR6_ce0;
  wire [9:0]HLSLdpcLogDecScaledMin_0_pR7_address0;
  wire HLSLdpcLogDecScaledMin_0_pR7_ce0;
  wire [9:0]HLSLdpcLogDecScaledMin_0_pR8_address0;
  wire HLSLdpcLogDecScaledMin_0_pR8_ce0;
  wire [9:0]HLSLdpcLogDecScaledMin_0_pR9_address0;
  wire HLSLdpcLogDecScaledMin_0_pR9_ce0;
  wire [10:0]HLSLdpcLogDecScaledMin_0_pR_V_address0;
  wire HLSLdpcLogDecScaledMin_0_pR_V_ce0;
  wire [0:0]LDPC_CTRL_0_buff_reset;
  wire LDPC_CTRL_0_buff_reset_ap_vld;
  wire [0:0]LDPC_CTRL_0_buff_start;
  wire LDPC_CTRL_0_buff_start_ap_vld;
  wire [15:0]LDPC_CTRL_0_err_code;
  wire LDPC_CTRL_0_err_code_ap_vld;
  wire [0:0]LDPC_CTRL_0_init_start;
  wire LDPC_CTRL_0_init_start_ap_vld;
  wire [0:0]LDPC_CTRL_0_mem_mux;
  wire [1:0]LDPC_CTRL_0_rate_V;
  wire LDPC_CTRL_0_rate_V_ap_vld;
  wire [1:0]LDPC_CTRL_0_size_V;
  wire LDPC_CTRL_0_size_V_ap_vld;
  wire [1:0]LDPC_CTRL_0_status_V;
  wire LDPC_CTRL_0_status_V_ap_vld;
  wire [15:0]LDPC_Out_0_cur_read_pos_V;
  wire [0:0]LDPC_Out_0_data_out;
  wire LDPC_Out_0_data_out_ap_vld;
  wire [10:0]LDPC_Out_0_mem_out1_address0;
  wire LDPC_Out_0_mem_out1_ce0;
  wire [9:0]LDPC_Out_0_mem_out2_address0;
  wire LDPC_Out_0_mem_out2_ce0;
  wire [9:0]LDPC_Out_0_mem_out3_address0;
  wire LDPC_Out_0_mem_out3_ce0;
  wire [9:0]LDPC_Out_0_mem_out4_address0;
  wire LDPC_Out_0_mem_out4_ce0;
  wire [9:0]LDPC_Out_0_mem_out5_address0;
  wire LDPC_Out_0_mem_out5_ce0;
  wire [9:0]LDPC_Out_0_mem_out6_address0;
  wire LDPC_Out_0_mem_out6_ce0;
  wire [9:0]LDPC_Out_0_mem_out7_address0;
  wire LDPC_Out_0_mem_out7_ce0;
  wire [0:0]LDPC_Out_0_rd_clk_out;
  wire [0:0]LDPC_Out_0_rd_mux;
  wire LDPC_Out_0_rd_mux_ap_vld;
  wire LDPC_Out_0_read_r;
  wire LDPC_RUN_1;
  wire [15:0]LDPC_buff_0_cur_write_pos_V;
  wire [10:0]LDPC_buff_0_dec_dat_address0;
  wire LDPC_buff_0_dec_dat_ce0;
  wire [0:0]LDPC_buff_0_decode_start;
  wire LDPC_buff_0_decode_start_ap_vld;
  wire [0:0]LDPC_buff_0_decode_start_b;
  wire LDPC_buff_0_decode_start_b_ap_vld;
  wire [7:0]LDPC_buff_0_deran_data;
  wire [0:0]LDPC_buff_0_full;
  wire [0:0]LDPC_buff_0_overrun;
  wire [10:0]LDPC_buff_0_raw_dat1_address0;
  wire LDPC_buff_0_raw_dat1_ce0;
  wire [7:0]LDPC_buff_0_raw_dat1_d0;
  wire LDPC_buff_0_raw_dat1_we0;
  wire [10:0]LDPC_buff_0_raw_dat2_address0;
  wire LDPC_buff_0_raw_dat2_ce0;
  wire [7:0]LDPC_buff_0_raw_dat2_d0;
  wire LDPC_buff_0_raw_dat2_we0;
  wire [10:0]LDPC_buff_0_raw_dat3_address0;
  wire LDPC_buff_0_raw_dat3_ce0;
  wire [7:0]LDPC_buff_0_raw_dat3_d0;
  wire LDPC_buff_0_raw_dat3_we0;
  wire [9:0]LDPC_buff_0_raw_dat4_address0;
  wire LDPC_buff_0_raw_dat4_ce0;
  wire LDPC_buff_0_raw_dat4_ce1;
  wire [7:0]LDPC_buff_0_raw_dat4_d0;
  wire [9:0]LDPC_buff_0_raw_dat5_address0;
  wire LDPC_buff_0_raw_dat5_ce0;
  wire [7:0]LDPC_buff_0_raw_dat5_d0;
  wire LDPC_buff_0_raw_dat5_we0;
  wire [9:0]LDPC_buff_0_raw_dat6_address0;
  wire LDPC_buff_0_raw_dat6_ce0;
  wire [7:0]LDPC_buff_0_raw_dat6_d0;
  wire LDPC_buff_0_raw_dat6_we0;
  wire [9:0]LDPC_buff_0_raw_dat7_address0;
  wire LDPC_buff_0_raw_dat7_ce0;
  wire [7:0]LDPC_buff_0_raw_dat7_d0;
  wire LDPC_buff_0_raw_dat7_we0;
  wire [9:0]LDPC_buff_0_raw_dat8_address0;
  wire LDPC_buff_0_raw_dat8_ce0;
  wire [7:0]LDPC_buff_0_raw_dat8_d0;
  wire LDPC_buff_0_raw_dat8_we0;
  wire [9:0]LDPC_buff_0_raw_dat9_address0;
  wire LDPC_buff_0_raw_dat9_ce0;
  wire [7:0]LDPC_buff_0_raw_dat9_d0;
  wire LDPC_buff_0_raw_dat9_we0;
  wire [10:0]LDPC_buff_0_raw_dat_V_address0;
  wire LDPC_buff_0_raw_dat_V_ce0;
  wire [7:0]LDPC_buff_0_raw_dat_V_d0;
  wire LDPC_buff_0_upgraded_ipi_deran_data_ap_vld;
  wire LDPC_buff_0_upgraded_ipi_raw_dat_we0;
  wire [0:0]Net;
  wire Net1;
  wire ap_rst_1;
  wire [0:0]buff_rst_lat_S;
  wire [0:0]c_addsub_0_S;
  wire [1:0]c_addsub_10_S;
  wire [1:0]c_addsub_11_S;
  wire [1:0]c_addsub_1_S;
  wire [15:0]c_addsub_2_S;
  wire [15:0]c_addsub_3_S;
  wire [15:0]c_addsub_4_S;
  wire [15:0]c_addsub_5_S;
  wire [15:0]c_addsub_7_S;
  wire [0:0]c_addsub_8_S;
  wire [15:0]clk_div_1;
  wire clk_wiz_0_clk_out1;
  wire [0:0]data_ce_mux1_Res;
  wire [0:0]data_ce_mux2_Res;
  wire [0:0]data_ce_mux2_Res1;
  wire [0:0]data_ce_mux3_Res;
  wire [0:0]data_ce_mux_Res;
  wire [0:0]data_ce_mux_ab_2_Res;
  wire [0:0]data_ce_mux_ab_3_Res;
  wire [0:0]data_ce_mux_ab_4_Res;
  wire [0:0]data_ce_mux_ab_5_Res;
  wire [0:0]data_ce_mux_ab_6_Res;
  wire [0:0]data_ce_mux_ab_7_Res;
  wire [0:0]data_ce_mux_bb_2_Res;
  wire [0:0]data_ce_mux_bb_3_Res;
  wire [0:0]data_ce_mux_bb_4_Res;
  wire [0:0]data_ce_mux_bb_5_Res;
  wire [0:0]data_ce_mux_bb_6_Res;
  wire [0:0]data_ce_mux_bb_7_Res;
  wire [7:0]data_in_1;
  wire [0:0]data_mux11_S;
  wire [0:0]data_mux12_S;
  wire [0:0]data_mux13_S;
  wire [0:0]data_mux14_S;
  wire [0:0]data_mux15_S;
  wire [0:0]data_mux16_S;
  wire [0:0]data_mux17_S;
  wire [0:0]data_mux1_S;
  wire [0:0]decode_data_0_douta;
  wire [0:0]decode_data_1_douta;
  wire [0:0]decode_data_a_1_douta;
  wire [0:0]decode_data_a_2_douta;
  wire [0:0]decode_data_a_3_douta;
  wire [0:0]decode_data_a_4_douta;
  wire [0:0]decode_data_a_5_douta;
  wire [0:0]decode_data_a_6_douta;
  wire [0:0]decode_data_a_7_douta;
  wire [0:0]decode_data_b_1_douta;
  wire [0:0]decode_data_b_2_douta;
  wire [0:0]decode_data_b_3_douta;
  wire [0:0]decode_data_b_4_douta;
  wire [0:0]decode_data_b_5_douta;
  wire [0:0]decode_data_b_6_douta;
  wire [0:0]decode_data_b_7_douta;
  wire [7:0]decode_start_lat1_S;
  wire [0:0]decode_start_lat1_S1;
  wire [0:0]decode_start_lat_S;
  wire [1:0]deran_sel_1;
  wire [7:0]itt_num_lat1_S;
  wire [7:0]mux_lat1_S;
  wire [15:0]pMaxIterations_1;
  wire [0:0]raw_ce_mux1_Res;
  wire [0:0]raw_ce_mux2_Res;
  wire [0:0]raw_ce_mux_aa1_Res;
  wire [0:0]raw_ce_mux_aa2_Res;
  wire [0:0]raw_ce_mux_aa3_Res;
  wire [0:0]raw_ce_mux_aa4_Res;
  wire [0:0]raw_ce_mux_aa5_Res;
  wire [0:0]raw_ce_mux_aa6_Res;
  wire [0:0]raw_ce_mux_aa7_Res;
  wire [0:0]raw_ce_mux_aa8_Res;
  wire [0:0]raw_ce_mux_aa9_Res;
  wire [0:0]raw_ce_mux_ba1_Res;
  wire [0:0]raw_ce_mux_ba2_Res;
  wire [0:0]raw_ce_mux_ba3_Res;
  wire [0:0]raw_ce_mux_ba4_Res;
  wire [0:0]raw_ce_mux_ba5_Res;
  wire [0:0]raw_ce_mux_ba6_Res;
  wire [0:0]raw_ce_mux_ba7_Res;
  wire [0:0]raw_ce_mux_ba8_Res;
  wire [0:0]raw_ce_mux_ba9_Res;
  wire [7:0]raw_data_0_doutb;
  wire [7:0]raw_data_a1_doutb;
  wire [7:0]raw_data_a2_doutb;
  wire [7:0]raw_data_a3_doutb;
  wire [7:0]raw_data_a4_doutb;
  wire [7:0]raw_data_a5_doutb;
  wire [7:0]raw_data_a6_doutb;
  wire [7:0]raw_data_a7_doutb;
  wire [7:0]raw_data_a8_doutb;
  wire [7:0]raw_data_a9_doutb;
  wire [7:0]raw_data_b1_doutb;
  wire [7:0]raw_data_b2_doutb;
  wire [7:0]raw_data_b3_doutb;
  wire [7:0]raw_data_b4_doutb;
  wire [7:0]raw_data_b5_doutb;
  wire [7:0]raw_data_b6_doutb;
  wire [7:0]raw_data_b7_doutb;
  wire [7:0]raw_data_b8_doutb;
  wire [7:0]raw_data_b9_doutb;
  wire [7:0]raw_data_b_doutb;
  wire [0:0]rd_clk_in_1;
  wire [0:0]reset_1;
  wire setupLDPC_0_ap_done;
  wire setupLDPC_0_ap_ready;
  wire [15:0]setupLDPC_0_etaIndexM_M_V;
  wire setupLDPC_0_etaIndexM_M_V_ap_vld;
  wire [15:0]setupLDPC_0_nR_M_V;
  wire setupLDPC_0_nR_M_V_ap_vld;
  wire [15:0]setupLDPC_0_numbits_V;
  wire setupLDPC_0_numbits_V_ap_vld;
  wire [15:0]setupLDPC_0_pCodeM_V;
  wire setupLDPC_0_pCodeM_V_ap_vld;
  wire [15:0]setupLDPC_0_pMaxIterations_V;
  wire setupLDPC_0_pMaxIterations_V_ap_vld;
  wire [0:0]util_vector_logic_0_Res;
  wire [0:0]write_clk_en_1;
  wire [0:0]xlconstant_0_dout;
  wire [7:0]xlconstant_0_dout1;
  wire [0:0]xlconstant_1_dout;
  wire [0:0]xlconstant_2_dout;
  wire [7:0]xlconstant_3_dout;

  assign BLOCK_RATE_1 = BLOCK_RATE[1:0];
  assign BLOCK_SIZE_1 = BLOCK_SIZE[1:0];
  assign DECODE_OUT[0] = LDPC_Out_0_data_out;
  assign DECODE_OUT_VALID = LDPC_Out_0_data_out_ap_vld;
  assign Decoder_B_Iterations[7:0] = itt_num_lat1_S;
  assign ERR_CODE[15:0] = c_addsub_2_S;
  assign Iteration_Number[7:0] = mux_lat1_S;
  assign LDPC_MODE[1:0] = c_addsub_1_S;
  assign LDPC_RUN_1 = LDPC_RUN;
  assign ap_rst_1 = reset_rtl;
  assign buff_ready[0] = c_addsub_0_S;
  assign clk_div_1 = clk_div[15:0];
  assign clk_wiz_0_clk_out1 = clock_rtl;
  assign cnt[31:0] = HLSLdpcLogDecScaledMin_0_cnt;
  assign cnt_B[31:0] = Decoder_B_cnt;
  assign cur_read_pos_V[15:0] = LDPC_Out_0_cur_read_pos_V;
  assign cur_write_pos_V[15:0] = LDPC_buff_0_cur_write_pos_V;
  assign data_in_1 = data_in[7:0];
  assign deran_data[7:0] = decode_start_lat1_S;
  assign deran_data_ap_vld = LDPC_buff_0_upgraded_ipi_deran_data_ap_vld;
  assign deran_sel_1 = deran_sel[1:0];
  assign full[0] = LDPC_buff_0_full;
  assign overrun[0] = LDPC_buff_0_overrun;
  assign pMaxIterations_1 = pMaxIterations[15:0];
  assign rd_clk_in_1 = rd_clk_in[0];
  assign rd_clk_out[0] = LDPC_Out_0_rd_clk_out;
  assign read_clk_en[0] = LDPC_Out_0_read_r;
  assign reset_1 = sync[0];
  assign write_clk_en_1 = write_clk_en[0];
  design_2_data_ce_mux_1 CE_not
       (.Op1(Net),
        .Res(data_ce_mux2_Res));
  design_2_HLSLdpcLogDecScaledMin_0_0 Decoder_A
       (.ap_clk(clk_wiz_0_clk_out1),
        .ap_done(HLSLdpcLogDecScaledMin_0_ap_done),
        .ap_ready(HLSLdpcLogDecScaledMin_0_ap_ready),
        .ap_rst(buff_rst_lat_S),
        .ap_start(decode_start_lat_S),
        .cnt(HLSLdpcLogDecScaledMin_0_cnt),
        .etaIndexM_M(c_addsub_4_S),
        .itt_num(HLSLdpcLogDecScaledMin_0_itt_num),
        .itt_num_ap_vld(HLSLdpcLogDecScaledMin_0_itt_num_ap_vld),
        .mux(Net),
        .nR_M(c_addsub_3_S),
        .numbits(c_addsub_7_S),
        .pCodeM(c_addsub_5_S),
        .pMaxIterations(pMaxIterations_1),
        .pR10_q0(xlconstant_0_dout1),
        .pR1_address0(HLSLdpcLogDecScaledMin_0_pR1_address0),
        .pR1_ce0(HLSLdpcLogDecScaledMin_0_pR1_ce0),
        .pR1_q0(raw_data_a1_doutb),
        .pR2_address0(HLSLdpcLogDecScaledMin_0_pR2_address0),
        .pR2_ce0(HLSLdpcLogDecScaledMin_0_pR2_ce0),
        .pR2_q0(raw_data_a2_doutb),
        .pR3_address0(HLSLdpcLogDecScaledMin_0_pR3_address0),
        .pR3_ce0(HLSLdpcLogDecScaledMin_0_pR3_ce0),
        .pR3_q0(raw_data_a3_doutb),
        .pR4_address0(HLSLdpcLogDecScaledMin_0_pR4_address0),
        .pR4_ce0(HLSLdpcLogDecScaledMin_0_pR4_ce0),
        .pR4_q0(raw_data_a4_doutb),
        .pR5_address0(HLSLdpcLogDecScaledMin_0_pR5_address0),
        .pR5_ce0(HLSLdpcLogDecScaledMin_0_pR5_ce0),
        .pR5_q0(raw_data_a5_doutb),
        .pR6_address0(HLSLdpcLogDecScaledMin_0_pR6_address0),
        .pR6_ce0(HLSLdpcLogDecScaledMin_0_pR6_ce0),
        .pR6_q0(raw_data_a6_doutb),
        .pR7_address0(HLSLdpcLogDecScaledMin_0_pR7_address0),
        .pR7_ce0(HLSLdpcLogDecScaledMin_0_pR7_ce0),
        .pR7_q0(raw_data_a7_doutb),
        .pR8_address0(HLSLdpcLogDecScaledMin_0_pR8_address0),
        .pR8_ce0(HLSLdpcLogDecScaledMin_0_pR8_ce0),
        .pR8_q0(raw_data_a8_doutb),
        .pR9_address0(HLSLdpcLogDecScaledMin_0_pR9_address0),
        .pR9_ce0(HLSLdpcLogDecScaledMin_0_pR9_ce0),
        .pR9_q0(raw_data_a9_doutb),
        .pR_address0(HLSLdpcLogDecScaledMin_0_pR_V_address0),
        .pR_ce0(HLSLdpcLogDecScaledMin_0_pR_V_ce0),
        .pR_q0(raw_data_0_doutb),
        .pbhat0_address0(Decoder_A_pbhat0_address0),
        .pbhat0_ce0(Decoder_A_pbhat0_ce0),
        .pbhat0_d0(Decoder_A_pbhat0_d0),
        .pbhat0_we0(Decoder_A_pbhat0_we0),
        .pbhat1_address0(Decoder_A_pbhat1_address0),
        .pbhat1_ce0(Decoder_A_pbhat1_ce0),
        .pbhat1_d0(Decoder_A_pbhat1_d0),
        .pbhat1_we0(Decoder_A_pbhat1_we0),
        .pbhat2_address0(Decoder_A_pbhat2_address0),
        .pbhat2_ce0(Decoder_A_pbhat2_ce0),
        .pbhat2_d0(Decoder_A_pbhat2_d0),
        .pbhat2_we0(Decoder_A_pbhat2_we0),
        .pbhat3_address0(Decoder_A_pbhat3_address0),
        .pbhat3_ce0(Decoder_A_pbhat3_ce0),
        .pbhat3_d0(Decoder_A_pbhat3_d0),
        .pbhat3_we0(Decoder_A_pbhat3_we0),
        .pbhat4_address0(Decoder_A_pbhat4_address0),
        .pbhat4_ce0(Decoder_A_pbhat4_ce0),
        .pbhat4_d0(Decoder_A_pbhat4_d0),
        .pbhat4_q0(1'b0),
        .pbhat4_we0(Decoder_A_pbhat4_we0),
        .pbhat5_address0(Decoder_A_pbhat5_address0),
        .pbhat5_ce0(Decoder_A_pbhat5_ce0),
        .pbhat5_d0(Decoder_A_pbhat5_d0),
        .pbhat5_q0(1'b0),
        .pbhat5_we0(Decoder_A_pbhat5_we0),
        .pbhat6_address0(Decoder_A_pbhat6_address0),
        .pbhat6_ce0(Decoder_A_pbhat6_ce0),
        .pbhat6_d0(Decoder_A_pbhat6_d0),
        .pbhat6_q0(1'b0),
        .pbhat6_we0(Decoder_A_pbhat6_we0),
        .pbhat7_address0(Decoder_A_pbhat7_address0),
        .pbhat7_ce0(Decoder_A_pbhat7_ce0),
        .pbhat7_d0(Decoder_A_pbhat7_d0),
        .pbhat7_q0(1'b0),
        .pbhat7_we0(Decoder_A_pbhat7_we0),
        .test_port({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  design_2_HLSLdpcLogDecScaledMin_0_1 Decoder_B
       (.ap_clk(clk_wiz_0_clk_out1),
        .ap_done(Decoder_B_ap_done),
        .ap_ready(Net1),
        .ap_rst(buff_rst_lat_S),
        .ap_start(decode_start_lat1_S1),
        .cnt(Decoder_B_cnt),
        .etaIndexM_M(c_addsub_4_S),
        .itt_num(Decoder_B_itt_num),
        .itt_num_ap_vld(Decoder_B_itt_num_ap_vld),
        .mux(data_ce_mux2_Res),
        .nR_M(c_addsub_3_S),
        .numbits(c_addsub_7_S),
        .pCodeM(c_addsub_5_S),
        .pMaxIterations(pMaxIterations_1),
        .pR10_q0(xlconstant_3_dout),
        .pR1_address0(Decoder_B_pR1_address0),
        .pR1_ce0(Decoder_B_pR1_ce0),
        .pR1_q0(raw_data_b1_doutb),
        .pR2_address0(Decoder_B_pR2_address0),
        .pR2_ce0(Decoder_B_pR2_ce0),
        .pR2_q0(raw_data_b2_doutb),
        .pR3_address0(Decoder_B_pR3_address0),
        .pR3_ce0(Decoder_B_pR3_ce0),
        .pR3_q0(raw_data_b3_doutb),
        .pR4_address0(Decoder_B_pR4_address0),
        .pR4_ce0(Decoder_B_pR4_ce0),
        .pR4_q0(raw_data_b4_doutb),
        .pR5_address0(Decoder_B_pR5_address0),
        .pR5_ce0(Decoder_B_pR5_ce0),
        .pR5_q0(raw_data_b5_doutb),
        .pR6_address0(Decoder_B_pR6_address0),
        .pR6_ce0(Decoder_B_pR6_ce0),
        .pR6_q0(raw_data_b6_doutb),
        .pR7_address0(Decoder_B_pR7_address0),
        .pR7_ce0(Decoder_B_pR7_ce0),
        .pR7_q0(raw_data_b7_doutb),
        .pR8_address0(Decoder_B_pR8_address0),
        .pR8_ce0(Decoder_B_pR8_ce0),
        .pR8_q0(raw_data_b8_doutb),
        .pR9_address0(Decoder_B_pR9_address0),
        .pR9_ce0(Decoder_B_pR9_ce0),
        .pR9_q0(raw_data_b9_doutb),
        .pR_address0(Decoder_B_pR_address0),
        .pR_ce0(Decoder_B_pR_ce0),
        .pR_q0(raw_data_b_doutb),
        .pbhat0_address0(Decoder_B_pbhat0_address0),
        .pbhat0_ce0(Decoder_B_pbhat0_ce0),
        .pbhat0_d0(Decoder_B_pbhat0_d0),
        .pbhat0_we0(Decoder_B_pbhat0_we0),
        .pbhat1_address0(Decoder_B_pbhat1_address0),
        .pbhat1_ce0(Decoder_B_pbhat1_ce0),
        .pbhat1_d0(Decoder_B_pbhat1_d0),
        .pbhat1_we0(Decoder_B_pbhat1_we0),
        .pbhat2_address0(Decoder_B_pbhat2_address0),
        .pbhat2_ce0(Decoder_B_pbhat2_ce0),
        .pbhat2_d0(Decoder_B_pbhat2_d0),
        .pbhat2_we0(Decoder_B_pbhat2_we0),
        .pbhat3_address0(Decoder_B_pbhat3_address0),
        .pbhat3_ce0(Decoder_B_pbhat3_ce0),
        .pbhat3_d0(Decoder_B_pbhat3_d0),
        .pbhat3_we0(Decoder_B_pbhat3_we0),
        .pbhat4_address0(Decoder_B_pbhat4_address0),
        .pbhat4_ce0(Decoder_B_pbhat4_ce0),
        .pbhat4_d0(Decoder_B_pbhat4_d0),
        .pbhat4_q0(1'b0),
        .pbhat4_we0(Decoder_B_pbhat4_we0),
        .pbhat5_address0(Decoder_B_pbhat5_address0),
        .pbhat5_ce0(Decoder_B_pbhat5_ce0),
        .pbhat5_d0(Decoder_B_pbhat5_d0),
        .pbhat5_q0(1'b0),
        .pbhat5_we0(Decoder_B_pbhat5_we0),
        .pbhat6_address0(Decoder_B_pbhat6_address0),
        .pbhat6_ce0(Decoder_B_pbhat6_ce0),
        .pbhat6_d0(Decoder_B_pbhat6_d0),
        .pbhat6_q0(1'b0),
        .pbhat6_we0(Decoder_B_pbhat6_we0),
        .pbhat7_address0(Decoder_B_pbhat7_address0),
        .pbhat7_ce0(Decoder_B_pbhat7_ce0),
        .pbhat7_d0(Decoder_B_pbhat7_d0),
        .pbhat7_q0(1'b0),
        .pbhat7_we0(Decoder_B_pbhat7_we0),
        .test_port({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  design_2_LDPC_CTRL_0_0 LDPC_CTRL_0
       (.ap_clk(clk_wiz_0_clk_out1),
        .ap_rst(ap_rst_1),
        .ap_start(xlconstant_0_dout),
        .block_V(BLOCK_SIZE_1),
        .buff_reset(LDPC_CTRL_0_buff_reset),
        .buff_reset_ap_vld(LDPC_CTRL_0_buff_reset_ap_vld),
        .buff_start(LDPC_CTRL_0_buff_start),
        .buff_start_ap_vld(LDPC_CTRL_0_buff_start_ap_vld),
        .code_V(BLOCK_RATE_1),
        .err_code(LDPC_CTRL_0_err_code),
        .err_code_ap_vld(LDPC_CTRL_0_err_code_ap_vld),
        .init_done(setupLDPC_0_ap_done),
        .init_ready(setupLDPC_0_ap_ready),
        .init_start(LDPC_CTRL_0_init_start),
        .init_start_ap_vld(LDPC_CTRL_0_init_start_ap_vld),
        .rate_V(LDPC_CTRL_0_rate_V),
        .rate_V_ap_vld(LDPC_CTRL_0_rate_V_ap_vld),
        .run(LDPC_RUN_1),
        .size_V(LDPC_CTRL_0_size_V),
        .size_V_ap_vld(LDPC_CTRL_0_size_V_ap_vld),
        .status_V(LDPC_CTRL_0_status_V),
        .status_V_ap_vld(LDPC_CTRL_0_status_V_ap_vld));
  design_2_xlconstant_0_0 LDPC_CTRL_ap_start
       (.dout(xlconstant_0_dout));
  design_2_LDPC_Div_0_0 LDPC_Div_0
       (.ap_clk(clk_wiz_0_clk_out1),
        .ap_rst(buff_rst_lat_S),
        .ap_start(c_addsub_0_S),
        .block_V(c_addsub_10_S),
        .clk_div(clk_div_1),
        .rd_clk_out(LDPC_Out_0_rd_clk_out),
        .rd_clk_out_ap_vld(LDPC_Out_0_read_r),
        .reset(reset_1));
  design_2_LDPC_Out_0_0 LDPC_Out_0
       (.ap_clk(clk_wiz_0_clk_out1),
        .ap_rst(buff_rst_lat_S),
        .ap_start(c_addsub_0_S),
        .cur_read_pos_V(LDPC_Out_0_cur_read_pos_V),
        .data_out(LDPC_Out_0_data_out),
        .data_out_ap_vld(LDPC_Out_0_data_out_ap_vld),
        .mem_out0_address0(LDPC_buff_0_dec_dat_address0),
        .mem_out0_ce0(LDPC_buff_0_dec_dat_ce0),
        .mem_out0_q0(data_mux1_S),
        .mem_out1_address0(LDPC_Out_0_mem_out1_address0),
        .mem_out1_ce0(LDPC_Out_0_mem_out1_ce0),
        .mem_out1_q0(data_mux11_S),
        .mem_out2_address0(LDPC_Out_0_mem_out2_address0),
        .mem_out2_ce0(LDPC_Out_0_mem_out2_ce0),
        .mem_out2_q0(data_mux12_S),
        .mem_out3_address0(LDPC_Out_0_mem_out3_address0),
        .mem_out3_ce0(LDPC_Out_0_mem_out3_ce0),
        .mem_out3_q0(data_mux13_S),
        .mem_out4_address0(LDPC_Out_0_mem_out4_address0),
        .mem_out4_ce0(LDPC_Out_0_mem_out4_ce0),
        .mem_out4_q0(data_mux14_S),
        .mem_out5_address0(LDPC_Out_0_mem_out5_address0),
        .mem_out5_ce0(LDPC_Out_0_mem_out5_ce0),
        .mem_out5_q0(data_mux15_S),
        .mem_out6_address0(LDPC_Out_0_mem_out6_address0),
        .mem_out6_ce0(LDPC_Out_0_mem_out6_ce0),
        .mem_out6_q0(data_mux16_S),
        .mem_out7_address0(LDPC_Out_0_mem_out7_address0),
        .mem_out7_ce0(LDPC_Out_0_mem_out7_ce0),
        .mem_out7_q0(data_mux17_S),
        .numbits_V(c_addsub_7_S),
        .rd_clk_in(rd_clk_in_1),
        .rd_mux(LDPC_Out_0_rd_mux),
        .rd_mux_ap_vld(LDPC_Out_0_rd_mux_ap_vld),
        .reset(reset_1));
  design_2_LDPC_buff_0_0 LDPC_buff_0
       (.ap_clk(clk_wiz_0_clk_out1),
        .ap_rst(buff_rst_lat_S),
        .ap_start(c_addsub_0_S),
        .cur_write_pos_V(LDPC_buff_0_cur_write_pos_V),
        .data_in(data_in_1),
        .decode_done(HLSLdpcLogDecScaledMin_0_ap_done),
        .decode_done_b(Decoder_B_ap_done),
        .decode_ready(HLSLdpcLogDecScaledMin_0_ap_ready),
        .decode_ready_b(Net1),
        .decode_start(LDPC_buff_0_decode_start),
        .decode_start_ap_vld(LDPC_buff_0_decode_start_ap_vld),
        .decode_start_b(LDPC_buff_0_decode_start_b),
        .decode_start_b_ap_vld(LDPC_buff_0_decode_start_b_ap_vld),
        .deran_V(deran_sel_1),
        .deran_data(LDPC_buff_0_deran_data),
        .deran_data_ap_vld(LDPC_buff_0_upgraded_ipi_deran_data_ap_vld),
        .full(LDPC_buff_0_full),
        .mux(LDPC_CTRL_0_mem_mux),
        .numbits_V(c_addsub_7_S),
        .out_mux(data_ce_mux2_Res),
        .overrun(LDPC_buff_0_overrun),
        .raw_dat0_address0(LDPC_buff_0_raw_dat_V_address0),
        .raw_dat0_ce0(LDPC_buff_0_raw_dat_V_ce0),
        .raw_dat0_d0(LDPC_buff_0_raw_dat_V_d0),
        .raw_dat0_we0(LDPC_buff_0_upgraded_ipi_raw_dat_we0),
        .raw_dat1_address0(LDPC_buff_0_raw_dat1_address0),
        .raw_dat1_ce0(LDPC_buff_0_raw_dat1_ce0),
        .raw_dat1_d0(LDPC_buff_0_raw_dat1_d0),
        .raw_dat1_we0(LDPC_buff_0_raw_dat1_we0),
        .raw_dat2_address0(LDPC_buff_0_raw_dat2_address0),
        .raw_dat2_ce0(LDPC_buff_0_raw_dat2_ce0),
        .raw_dat2_d0(LDPC_buff_0_raw_dat2_d0),
        .raw_dat2_we0(LDPC_buff_0_raw_dat2_we0),
        .raw_dat3_address0(LDPC_buff_0_raw_dat3_address0),
        .raw_dat3_ce0(LDPC_buff_0_raw_dat3_ce0),
        .raw_dat3_d0(LDPC_buff_0_raw_dat3_d0),
        .raw_dat3_we0(LDPC_buff_0_raw_dat3_we0),
        .raw_dat4_address0(LDPC_buff_0_raw_dat4_address0),
        .raw_dat4_ce0(LDPC_buff_0_raw_dat4_ce1),
        .raw_dat4_d0(LDPC_buff_0_raw_dat4_d0),
        .raw_dat4_we0(LDPC_buff_0_raw_dat4_ce0),
        .raw_dat5_address0(LDPC_buff_0_raw_dat5_address0),
        .raw_dat5_ce0(LDPC_buff_0_raw_dat5_ce0),
        .raw_dat5_d0(LDPC_buff_0_raw_dat5_d0),
        .raw_dat5_we0(LDPC_buff_0_raw_dat5_we0),
        .raw_dat6_address0(LDPC_buff_0_raw_dat6_address0),
        .raw_dat6_ce0(LDPC_buff_0_raw_dat6_ce0),
        .raw_dat6_d0(LDPC_buff_0_raw_dat6_d0),
        .raw_dat6_we0(LDPC_buff_0_raw_dat6_we0),
        .raw_dat7_address0(LDPC_buff_0_raw_dat7_address0),
        .raw_dat7_ce0(LDPC_buff_0_raw_dat7_ce0),
        .raw_dat7_d0(LDPC_buff_0_raw_dat7_d0),
        .raw_dat7_we0(LDPC_buff_0_raw_dat7_we0),
        .raw_dat8_address0(LDPC_buff_0_raw_dat8_address0),
        .raw_dat8_ce0(LDPC_buff_0_raw_dat8_ce0),
        .raw_dat8_d0(LDPC_buff_0_raw_dat8_d0),
        .raw_dat8_we0(LDPC_buff_0_raw_dat8_we0),
        .raw_dat9_address0(LDPC_buff_0_raw_dat9_address0),
        .raw_dat9_ce0(LDPC_buff_0_raw_dat9_ce0),
        .raw_dat9_d0(LDPC_buff_0_raw_dat9_d0),
        .raw_dat9_we0(LDPC_buff_0_raw_dat9_we0),
        .reset(reset_1),
        .write_r(write_clk_en_1));
  design_2_buff_start_lat_0 buff_rst_lat
       (.A(LDPC_CTRL_0_buff_reset),
        .CE(LDPC_CTRL_0_buff_reset_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(buff_rst_lat_S));
  design_2_c_addsub_0_1 buff_start_lat
       (.A(LDPC_CTRL_0_buff_start),
        .CE(LDPC_CTRL_0_buff_start_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(c_addsub_0_S));
  design_2_util_vector_logic_0_0 data_ce_mux
       (.Op1(LDPC_buff_0_dec_dat_ce0),
        .Op2(Net),
        .Res(data_ce_mux_Res));
  design_2_data_ce_mux_0 data_ce_mux1
       (.Op1(LDPC_buff_0_dec_dat_ce0),
        .Op2(data_ce_mux2_Res),
        .Res(data_ce_mux1_Res));
  design_2_data_ce_mux1_0 data_ce_mux_ab_1
       (.Op1(data_ce_mux2_Res),
        .Op2(LDPC_Out_0_mem_out1_ce0),
        .Res(data_ce_mux3_Res));
  design_2_data_ce_mux_ab_1_0 data_ce_mux_ab_2
       (.Op1(data_ce_mux2_Res),
        .Op2(LDPC_Out_0_mem_out2_ce0),
        .Res(data_ce_mux_ab_2_Res));
  design_2_data_ce_mux_ab_2_0 data_ce_mux_ab_3
       (.Op1(data_ce_mux2_Res),
        .Op2(LDPC_Out_0_mem_out3_ce0),
        .Res(data_ce_mux_ab_3_Res));
  design_2_data_ce_mux_ab_3_0 data_ce_mux_ab_4
       (.Op1(data_ce_mux2_Res),
        .Op2(LDPC_Out_0_mem_out4_ce0),
        .Res(data_ce_mux_ab_4_Res));
  design_2_data_ce_mux_ab_4_0 data_ce_mux_ab_5
       (.Op1(data_ce_mux2_Res),
        .Op2(LDPC_Out_0_mem_out5_ce0),
        .Res(data_ce_mux_ab_5_Res));
  design_2_data_ce_mux_ab_5_0 data_ce_mux_ab_6
       (.Op1(data_ce_mux2_Res),
        .Op2(LDPC_Out_0_mem_out6_ce0),
        .Res(data_ce_mux_ab_6_Res));
  design_2_data_ce_mux_ab_6_0 data_ce_mux_ab_7
       (.Op1(data_ce_mux2_Res),
        .Op2(LDPC_Out_0_mem_out7_ce0),
        .Res(data_ce_mux_ab_7_Res));
  design_2_data_ce_mux_3 data_ce_mux_bb_1
       (.Op1(Net),
        .Op2(LDPC_Out_0_mem_out1_ce0),
        .Res(data_ce_mux2_Res1));
  design_2_data_ce_mux_bb_1_0 data_ce_mux_bb_2
       (.Op1(Net),
        .Op2(LDPC_Out_0_mem_out2_ce0),
        .Res(data_ce_mux_bb_2_Res));
  design_2_data_ce_mux_bb_2_0 data_ce_mux_bb_3
       (.Op1(Net),
        .Op2(LDPC_Out_0_mem_out3_ce0),
        .Res(data_ce_mux_bb_3_Res));
  design_2_data_ce_mux_bb_3_0 data_ce_mux_bb_4
       (.Op1(Net),
        .Op2(LDPC_Out_0_mem_out4_ce0),
        .Res(data_ce_mux_bb_4_Res));
  design_2_data_ce_mux_bb_4_0 data_ce_mux_bb_5
       (.Op1(Net),
        .Op2(LDPC_Out_0_mem_out5_ce0),
        .Res(data_ce_mux_bb_5_Res));
  design_2_data_ce_mux_bb_5_0 data_ce_mux_bb_6
       (.Op1(Net),
        .Op2(LDPC_Out_0_mem_out6_ce0),
        .Res(data_ce_mux_bb_6_Res));
  design_2_data_ce_mux_bb_6_0 data_ce_mux_bb_7
       (.Op1(Net),
        .Op2(LDPC_Out_0_mem_out7_ce0),
        .Res(data_ce_mux_bb_7_Res));
  design_2_data_mux_0 data_mux1
       (.A(decode_data_0_douta),
        .B(decode_data_1_douta),
        .BYPASS(Net),
        .S(data_mux1_S));
  design_2_data_mux1_0 data_mux11
       (.A(decode_data_a_1_douta),
        .B(decode_data_b_1_douta),
        .BYPASS(Net),
        .S(data_mux11_S));
  design_2_data_mux11_0 data_mux12
       (.A(decode_data_a_2_douta),
        .B(decode_data_b_2_douta),
        .BYPASS(Net),
        .S(data_mux12_S));
  design_2_data_mux12_0 data_mux13
       (.A(decode_data_a_3_douta),
        .B(decode_data_b_3_douta),
        .BYPASS(Net),
        .S(data_mux13_S));
  design_2_data_mux13_0 data_mux14
       (.A(decode_data_a_4_douta),
        .B(decode_data_b_4_douta),
        .BYPASS(Net),
        .S(data_mux14_S));
  design_2_data_mux14_0 data_mux15
       (.A(decode_data_a_5_douta),
        .B(decode_data_b_5_douta),
        .BYPASS(Net),
        .S(data_mux15_S));
  design_2_data_mux15_0 data_mux16
       (.A(decode_data_a_6_douta),
        .B(decode_data_b_6_douta),
        .BYPASS(Net),
        .S(data_mux16_S));
  design_2_data_mux16_0 data_mux17
       (.A(decode_data_a_7_douta),
        .B(decode_data_b_7_douta),
        .BYPASS(Net),
        .S(data_mux17_S));
  design_2_blk_mem_gen_0_4 decode_data_a_0
       (.addra(LDPC_buff_0_dec_dat_address0),
        .addrb(Decoder_A_pbhat0_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_A_pbhat0_d0),
        .douta(decode_data_0_douta),
        .ena(data_ce_mux1_Res),
        .enb(Decoder_A_pbhat0_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_A_pbhat0_we0));
  design_2_decode_data_b_0_0 decode_data_a_1
       (.addra(LDPC_Out_0_mem_out1_address0),
        .addrb(Decoder_A_pbhat1_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_A_pbhat1_d0),
        .douta(decode_data_a_1_douta),
        .ena(data_ce_mux3_Res),
        .enb(Decoder_A_pbhat1_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_A_pbhat1_we0));
  design_2_decode_data_a_1_0 decode_data_a_2
       (.addra(LDPC_Out_0_mem_out2_address0),
        .addrb(Decoder_A_pbhat2_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_A_pbhat2_d0),
        .douta(decode_data_a_2_douta),
        .ena(data_ce_mux_ab_2_Res),
        .enb(Decoder_A_pbhat2_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_A_pbhat2_we0));
  design_2_decode_data_a_2_0 decode_data_a_3
       (.addra(LDPC_Out_0_mem_out3_address0),
        .addrb(Decoder_A_pbhat3_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_A_pbhat3_d0),
        .douta(decode_data_a_3_douta),
        .ena(data_ce_mux_ab_3_Res),
        .enb(Decoder_A_pbhat3_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_A_pbhat3_we0));
  design_2_decode_data_a_3_0 decode_data_a_4
       (.addra(LDPC_Out_0_mem_out4_address0),
        .addrb(Decoder_A_pbhat4_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_A_pbhat4_d0),
        .douta(decode_data_a_4_douta),
        .ena(data_ce_mux_ab_4_Res),
        .enb(Decoder_A_pbhat4_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_A_pbhat4_we0));
  design_2_decode_data_a_4_0 decode_data_a_5
       (.addra(LDPC_Out_0_mem_out5_address0),
        .addrb(Decoder_A_pbhat5_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_A_pbhat5_d0),
        .douta(decode_data_a_5_douta),
        .ena(data_ce_mux_ab_5_Res),
        .enb(Decoder_A_pbhat5_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_A_pbhat5_we0));
  design_2_decode_data_a_5_0 decode_data_a_6
       (.addra(LDPC_Out_0_mem_out6_address0),
        .addrb(Decoder_A_pbhat6_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_A_pbhat6_d0),
        .douta(decode_data_a_6_douta),
        .ena(data_ce_mux_ab_6_Res),
        .enb(Decoder_A_pbhat6_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_A_pbhat6_we0));
  design_2_decode_data_a_6_0 decode_data_a_7
       (.addra(LDPC_Out_0_mem_out7_address0),
        .addrb(Decoder_A_pbhat7_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_A_pbhat7_d0),
        .douta(decode_data_a_7_douta),
        .ena(data_ce_mux_ab_7_Res),
        .enb(Decoder_A_pbhat7_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_A_pbhat7_we0));
  design_2_decode_data_0_0 decode_data_b_0
       (.addra(LDPC_buff_0_dec_dat_address0),
        .addrb(Decoder_B_pbhat0_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_B_pbhat0_d0),
        .douta(decode_data_1_douta),
        .ena(data_ce_mux_Res),
        .enb(Decoder_B_pbhat0_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_B_pbhat0_we0));
  design_2_decode_data_a_0_0 decode_data_b_1
       (.addra(LDPC_Out_0_mem_out1_address0),
        .addrb(Decoder_B_pbhat1_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_B_pbhat1_d0),
        .douta(decode_data_b_1_douta),
        .ena(data_ce_mux2_Res1),
        .enb(Decoder_B_pbhat1_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_B_pbhat1_we0));
  design_2_decode_data_b_1_0 decode_data_b_2
       (.addra(LDPC_Out_0_mem_out2_address0),
        .addrb(Decoder_B_pbhat2_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_B_pbhat2_d0),
        .douta(decode_data_b_2_douta),
        .ena(data_ce_mux_bb_2_Res),
        .enb(Decoder_B_pbhat2_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_B_pbhat2_we0));
  design_2_decode_data_b_2_0 decode_data_b_3
       (.addra(LDPC_Out_0_mem_out3_address0),
        .addrb(Decoder_B_pbhat3_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_B_pbhat3_d0),
        .douta(decode_data_b_3_douta),
        .ena(data_ce_mux_bb_3_Res),
        .enb(Decoder_B_pbhat3_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_B_pbhat3_we0));
  design_2_decode_data_b_3_0 decode_data_b_4
       (.addra(LDPC_Out_0_mem_out4_address0),
        .addrb(Decoder_B_pbhat4_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_B_pbhat4_d0),
        .douta(decode_data_b_4_douta),
        .ena(data_ce_mux_bb_4_Res),
        .enb(Decoder_B_pbhat4_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_B_pbhat4_we0));
  design_2_decode_data_b_4_0 decode_data_b_5
       (.addra(LDPC_Out_0_mem_out5_address0),
        .addrb(Decoder_B_pbhat5_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_B_pbhat5_d0),
        .douta(decode_data_b_5_douta),
        .ena(data_ce_mux_bb_5_Res),
        .enb(Decoder_B_pbhat5_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_B_pbhat5_we0));
  design_2_decode_data_b_5_0 decode_data_b_6
       (.addra(LDPC_Out_0_mem_out6_address0),
        .addrb(Decoder_B_pbhat6_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_B_pbhat6_d0),
        .douta(decode_data_b_6_douta),
        .ena(data_ce_mux_bb_6_Res),
        .enb(Decoder_B_pbhat6_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_B_pbhat6_we0));
  design_2_decode_data_b_6_0 decode_data_b_7
       (.addra(LDPC_Out_0_mem_out7_address0),
        .addrb(Decoder_B_pbhat7_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(1'b0),
        .dinb(Decoder_B_pbhat7_d0),
        .douta(decode_data_b_7_douta),
        .ena(data_ce_mux_bb_7_Res),
        .enb(Decoder_B_pbhat7_ce0),
        .wea(xlconstant_2_dout),
        .web(Decoder_B_pbhat7_we0));
  design_2_mux_lat_1 decode_start_lat
       (.A(LDPC_buff_0_decode_start),
        .CE(LDPC_buff_0_decode_start_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(decode_start_lat_S),
        .SCLR(HLSLdpcLogDecScaledMin_0_ap_ready));
  design_2_decode_start_lat_1 decode_start_lat1
       (.A(LDPC_buff_0_decode_start_b),
        .CE(LDPC_buff_0_decode_start_b_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(decode_start_lat1_S1),
        .SCLR(Net1));
  design_2_decode_start_lat_0 deran_lat
       (.A(LDPC_buff_0_deran_data),
        .CE(LDPC_buff_0_upgraded_ipi_deran_data_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(decode_start_lat1_S));
  design_2_c_addsub_2_0 err_code_lat
       (.A(LDPC_CTRL_0_err_code),
        .CE(LDPC_CTRL_0_err_code_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(c_addsub_2_S));
  design_2_c_addsub_3_1 etaIndexM_M_lat
       (.A(setupLDPC_0_etaIndexM_M_V),
        .CE(setupLDPC_0_etaIndexM_M_V_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(c_addsub_4_S));
  design_2_c_addsub_0_0 init_start_lat
       (.A(LDPC_CTRL_0_init_start),
        .CE(LDPC_CTRL_0_init_start_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(c_addsub_8_S));
  design_2_mux_lat_0 itt_num_lat
       (.A(HLSLdpcLogDecScaledMin_0_itt_num),
        .CE(HLSLdpcLogDecScaledMin_0_itt_num_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(mux_lat1_S));
  design_2_itt_num_lat_0 itt_num_lat1
       (.A(Decoder_B_itt_num),
        .CE(Decoder_B_itt_num_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(itt_num_lat1_S));
  design_2_c_addsub_3_0 nR_M_lat
       (.A(setupLDPC_0_nR_M_V),
        .CE(setupLDPC_0_nR_M_V_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(c_addsub_3_S));
  design_2_c_addsub_6_0 numbits_lat
       (.A(setupLDPC_0_numbits_V),
        .CE(setupLDPC_0_numbits_V_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(c_addsub_7_S));
  design_2_mux_lat_2 out_mux_lat
       (.A(LDPC_Out_0_rd_mux),
        .CE(LDPC_Out_0_rd_mux_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(Net));
  design_2_c_addsub_4_0 pCodeM_lat
       (.A(setupLDPC_0_pCodeM_V),
        .CE(setupLDPC_0_pCodeM_V_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(c_addsub_5_S));
  design_2_c_addsub_5_0 pMaxIterations_lat
       (.A(setupLDPC_0_pMaxIterations_V),
        .CE(setupLDPC_0_pMaxIterations_V_ap_vld),
        .CLK(clk_wiz_0_clk_out1));
  design_2_c_addsub_8_1 rate_lat
       (.A(LDPC_CTRL_0_rate_V),
        .CE(LDPC_CTRL_0_rate_V_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(c_addsub_11_S));
  design_2_raw_ce_mux2_0 raw_ce_mux_aa
       (.Op1(LDPC_buff_0_raw_dat_V_ce0),
        .Op2(util_vector_logic_0_Res),
        .Res(raw_ce_mux1_Res));
  design_2_raw_ce_mux_aa_1 raw_ce_mux_aa1
       (.Op1(LDPC_buff_0_raw_dat1_ce0),
        .Op2(util_vector_logic_0_Res),
        .Res(raw_ce_mux_aa1_Res));
  design_2_raw_ce_mux_aa1_0 raw_ce_mux_aa2
       (.Op1(LDPC_buff_0_raw_dat2_ce0),
        .Op2(util_vector_logic_0_Res),
        .Res(raw_ce_mux_aa2_Res));
  design_2_raw_ce_mux_aa2_0 raw_ce_mux_aa3
       (.Op1(LDPC_buff_0_raw_dat3_ce0),
        .Op2(util_vector_logic_0_Res),
        .Res(raw_ce_mux_aa3_Res));
  design_2_raw_ce_mux_aa3_0 raw_ce_mux_aa4
       (.Op1(LDPC_buff_0_raw_dat4_ce1),
        .Op2(util_vector_logic_0_Res),
        .Res(raw_ce_mux_aa4_Res));
  design_2_raw_ce_mux_aa4_0 raw_ce_mux_aa5
       (.Op1(LDPC_buff_0_raw_dat5_ce0),
        .Op2(util_vector_logic_0_Res),
        .Res(raw_ce_mux_aa5_Res));
  design_2_raw_ce_mux_aa5_0 raw_ce_mux_aa6
       (.Op1(LDPC_buff_0_raw_dat6_ce0),
        .Op2(util_vector_logic_0_Res),
        .Res(raw_ce_mux_aa6_Res));
  design_2_raw_ce_mux_aa6_0 raw_ce_mux_aa7
       (.Op1(LDPC_buff_0_raw_dat7_ce0),
        .Op2(util_vector_logic_0_Res),
        .Res(raw_ce_mux_aa7_Res));
  design_2_raw_ce_mux_aa7_0 raw_ce_mux_aa8
       (.Op1(LDPC_buff_0_raw_dat8_ce0),
        .Op2(util_vector_logic_0_Res),
        .Res(raw_ce_mux_aa8_Res));
  design_2_raw_ce_mux_aa8_0 raw_ce_mux_aa9
       (.Op1(LDPC_buff_0_raw_dat9_ce0),
        .Op2(util_vector_logic_0_Res),
        .Res(raw_ce_mux_aa9_Res));
  design_2_data_ce_mux_2 raw_ce_mux_ba
       (.Op1(LDPC_buff_0_raw_dat_V_ce0),
        .Op2(LDPC_CTRL_0_mem_mux),
        .Res(raw_ce_mux2_Res));
  design_2_raw_ce_mux_ba_1 raw_ce_mux_ba1
       (.Op1(LDPC_buff_0_raw_dat1_ce0),
        .Op2(LDPC_CTRL_0_mem_mux),
        .Res(raw_ce_mux_ba1_Res));
  design_2_raw_ce_mux_ba1_0 raw_ce_mux_ba2
       (.Op1(LDPC_buff_0_raw_dat2_ce0),
        .Op2(LDPC_CTRL_0_mem_mux),
        .Res(raw_ce_mux_ba2_Res));
  design_2_raw_ce_mux_ba2_0 raw_ce_mux_ba3
       (.Op1(LDPC_buff_0_raw_dat3_ce0),
        .Op2(LDPC_CTRL_0_mem_mux),
        .Res(raw_ce_mux_ba3_Res));
  design_2_raw_ce_mux_ba3_0 raw_ce_mux_ba4
       (.Op1(LDPC_buff_0_raw_dat4_ce1),
        .Op2(LDPC_CTRL_0_mem_mux),
        .Res(raw_ce_mux_ba4_Res));
  design_2_raw_ce_mux_ba4_0 raw_ce_mux_ba5
       (.Op1(LDPC_buff_0_raw_dat5_ce0),
        .Op2(LDPC_CTRL_0_mem_mux),
        .Res(raw_ce_mux_ba5_Res));
  design_2_raw_ce_mux_ba5_0 raw_ce_mux_ba6
       (.Op1(LDPC_buff_0_raw_dat6_ce0),
        .Op2(LDPC_CTRL_0_mem_mux),
        .Res(raw_ce_mux_ba6_Res));
  design_2_raw_ce_mux_ba6_0 raw_ce_mux_ba7
       (.Op1(LDPC_buff_0_raw_dat7_ce0),
        .Op2(LDPC_CTRL_0_mem_mux),
        .Res(raw_ce_mux_ba7_Res));
  design_2_raw_ce_mux_ba7_0 raw_ce_mux_ba8
       (.Op1(LDPC_buff_0_raw_dat8_ce0),
        .Op2(LDPC_CTRL_0_mem_mux),
        .Res(raw_ce_mux_ba8_Res));
  design_2_raw_ce_mux_ba8_0 raw_ce_mux_ba9
       (.Op1(LDPC_buff_0_raw_dat9_ce0),
        .Op2(LDPC_CTRL_0_mem_mux),
        .Res(raw_ce_mux_ba9_Res));
  design_2_blk_mem_gen_0_3 raw_data_a
       (.addra(LDPC_buff_0_raw_dat_V_address0),
        .addrb(HLSLdpcLogDecScaledMin_0_pR_V_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat_V_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_0_doutb),
        .ena(raw_ce_mux1_Res),
        .enb(HLSLdpcLogDecScaledMin_0_pR_V_ce0),
        .rsta(1'b0),
        .wea(LDPC_buff_0_upgraded_ipi_raw_dat_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_a_0 raw_data_a1
       (.addra(LDPC_buff_0_raw_dat1_address0),
        .addrb(HLSLdpcLogDecScaledMin_0_pR1_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat1_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_a1_doutb),
        .ena(raw_ce_mux_aa1_Res),
        .enb(HLSLdpcLogDecScaledMin_0_pR1_ce0),
        .wea(LDPC_buff_0_raw_dat1_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_a1_0 raw_data_a2
       (.addra(LDPC_buff_0_raw_dat2_address0),
        .addrb(HLSLdpcLogDecScaledMin_0_pR2_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat2_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_a2_doutb),
        .ena(raw_ce_mux_aa2_Res),
        .enb(HLSLdpcLogDecScaledMin_0_pR2_ce0),
        .wea(LDPC_buff_0_raw_dat2_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_a2_0 raw_data_a3
       (.addra(LDPC_buff_0_raw_dat3_address0),
        .addrb(HLSLdpcLogDecScaledMin_0_pR3_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat3_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_a3_doutb),
        .ena(raw_ce_mux_aa3_Res),
        .enb(HLSLdpcLogDecScaledMin_0_pR3_ce0),
        .wea(LDPC_buff_0_raw_dat3_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_a3_0 raw_data_a4
       (.addra(LDPC_buff_0_raw_dat4_address0),
        .addrb(HLSLdpcLogDecScaledMin_0_pR4_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat4_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_a4_doutb),
        .ena(raw_ce_mux_aa4_Res),
        .enb(HLSLdpcLogDecScaledMin_0_pR4_ce0),
        .wea(LDPC_buff_0_raw_dat4_ce0),
        .web(xlconstant_1_dout));
  design_2_raw_data_a4_0 raw_data_a5
       (.addra(LDPC_buff_0_raw_dat5_address0),
        .addrb(HLSLdpcLogDecScaledMin_0_pR5_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat5_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_a5_doutb),
        .ena(raw_ce_mux_aa5_Res),
        .enb(HLSLdpcLogDecScaledMin_0_pR5_ce0),
        .wea(LDPC_buff_0_raw_dat5_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_a5_0 raw_data_a6
       (.addra(LDPC_buff_0_raw_dat6_address0),
        .addrb(HLSLdpcLogDecScaledMin_0_pR6_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat6_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_a6_doutb),
        .ena(raw_ce_mux_aa6_Res),
        .enb(HLSLdpcLogDecScaledMin_0_pR6_ce0),
        .wea(LDPC_buff_0_raw_dat6_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_a6_0 raw_data_a7
       (.addra(LDPC_buff_0_raw_dat7_address0),
        .addrb(HLSLdpcLogDecScaledMin_0_pR7_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat7_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_a7_doutb),
        .ena(raw_ce_mux_aa7_Res),
        .enb(HLSLdpcLogDecScaledMin_0_pR7_ce0),
        .wea(LDPC_buff_0_raw_dat7_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_a7_0 raw_data_a8
       (.addra(LDPC_buff_0_raw_dat8_address0),
        .addrb(HLSLdpcLogDecScaledMin_0_pR8_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat8_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_a8_doutb),
        .ena(raw_ce_mux_aa8_Res),
        .enb(HLSLdpcLogDecScaledMin_0_pR8_ce0),
        .wea(LDPC_buff_0_raw_dat8_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_a8_0 raw_data_a9
       (.addra(LDPC_buff_0_raw_dat9_address0),
        .addrb(HLSLdpcLogDecScaledMin_0_pR9_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat9_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_a9_doutb),
        .ena(raw_ce_mux_aa9_Res),
        .enb(HLSLdpcLogDecScaledMin_0_pR9_ce0),
        .wea(LDPC_buff_0_raw_dat9_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_0_0 raw_data_b
       (.addra(LDPC_buff_0_raw_dat_V_address0),
        .addrb(Decoder_B_pR_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat_V_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_b_doutb),
        .ena(raw_ce_mux2_Res),
        .enb(Decoder_B_pR_ce0),
        .rsta(1'b0),
        .wea(LDPC_buff_0_upgraded_ipi_raw_dat_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_b_0 raw_data_b1
       (.addra(LDPC_buff_0_raw_dat1_address0),
        .addrb(Decoder_B_pR1_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat1_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_b1_doutb),
        .ena(raw_ce_mux_ba1_Res),
        .enb(Decoder_B_pR1_ce0),
        .wea(LDPC_buff_0_raw_dat1_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_b1_0 raw_data_b2
       (.addra(LDPC_buff_0_raw_dat2_address0),
        .addrb(Decoder_B_pR2_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat2_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_b2_doutb),
        .ena(raw_ce_mux_ba2_Res),
        .enb(Decoder_B_pR2_ce0),
        .wea(LDPC_buff_0_raw_dat2_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_b2_0 raw_data_b3
       (.addra(LDPC_buff_0_raw_dat3_address0),
        .addrb(Decoder_B_pR3_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat3_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_b3_doutb),
        .ena(raw_ce_mux_ba3_Res),
        .enb(Decoder_B_pR3_ce0),
        .wea(LDPC_buff_0_raw_dat3_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_b3_0 raw_data_b4
       (.addra(LDPC_buff_0_raw_dat4_address0),
        .addrb(Decoder_B_pR4_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat4_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_b4_doutb),
        .ena(raw_ce_mux_ba4_Res),
        .enb(Decoder_B_pR4_ce0),
        .wea(LDPC_buff_0_raw_dat4_ce0),
        .web(xlconstant_1_dout));
  design_2_raw_data_b4_0 raw_data_b5
       (.addra(LDPC_buff_0_raw_dat5_address0),
        .addrb(Decoder_B_pR5_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat5_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_b5_doutb),
        .ena(raw_ce_mux_ba5_Res),
        .enb(Decoder_B_pR5_ce0),
        .wea(LDPC_buff_0_raw_dat5_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_b5_0 raw_data_b6
       (.addra(LDPC_buff_0_raw_dat6_address0),
        .addrb(Decoder_B_pR6_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat6_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_b6_doutb),
        .ena(raw_ce_mux_ba6_Res),
        .enb(Decoder_B_pR6_ce0),
        .wea(LDPC_buff_0_raw_dat6_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_b6_0 raw_data_b7
       (.addra(LDPC_buff_0_raw_dat7_address0),
        .addrb(Decoder_B_pR7_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat7_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_b7_doutb),
        .ena(raw_ce_mux_ba7_Res),
        .enb(Decoder_B_pR7_ce0),
        .wea(LDPC_buff_0_raw_dat7_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_b7_0 raw_data_b8
       (.addra(LDPC_buff_0_raw_dat8_address0),
        .addrb(Decoder_B_pR8_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat8_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_b8_doutb),
        .ena(raw_ce_mux_ba8_Res),
        .enb(Decoder_B_pR8_ce0),
        .wea(LDPC_buff_0_raw_dat8_we0),
        .web(xlconstant_1_dout));
  design_2_raw_data_b8_0 raw_data_b9
       (.addra(LDPC_buff_0_raw_dat9_address0),
        .addrb(Decoder_B_pR9_address0),
        .clka(clk_wiz_0_clk_out1),
        .clkb(clk_wiz_0_clk_out1),
        .dina(LDPC_buff_0_raw_dat9_d0),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .doutb(raw_data_b9_doutb),
        .ena(raw_ce_mux_ba9_Res),
        .enb(Decoder_B_pR9_ce0),
        .wea(LDPC_buff_0_raw_dat9_we0),
        .web(xlconstant_1_dout));
  design_2_setupLDPC_0_0 setupLDPC_0
       (.ap_done(setupLDPC_0_ap_done),
        .ap_ready(setupLDPC_0_ap_ready),
        .ap_start(c_addsub_8_S),
        .etaIndexM_M_V(setupLDPC_0_etaIndexM_M_V),
        .etaIndexM_M_V_ap_vld(setupLDPC_0_etaIndexM_M_V_ap_vld),
        .nR_M_V(setupLDPC_0_nR_M_V),
        .nR_M_V_ap_vld(setupLDPC_0_nR_M_V_ap_vld),
        .numbits_V(setupLDPC_0_numbits_V),
        .numbits_V_ap_vld(setupLDPC_0_numbits_V_ap_vld),
        .pCodeM_V(setupLDPC_0_pCodeM_V),
        .pCodeM_V_ap_vld(setupLDPC_0_pCodeM_V_ap_vld),
        .pMaxIterations_V(setupLDPC_0_pMaxIterations_V),
        .pMaxIterations_V_ap_vld(setupLDPC_0_pMaxIterations_V_ap_vld),
        .rate_V(c_addsub_11_S),
        .size_V(c_addsub_10_S));
  design_2_c_addsub_8_0 size_lat
       (.A(LDPC_CTRL_0_size_V),
        .CE(LDPC_CTRL_0_size_V_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(c_addsub_10_S));
  design_2_c_addsub_0_2 status_lat
       (.A(LDPC_CTRL_0_status_V),
        .CE(LDPC_CTRL_0_status_V_ap_vld),
        .CLK(clk_wiz_0_clk_out1),
        .S(c_addsub_1_S));
  design_2_util_vector_logic_0_1 util_vector_logic_0
       (.Op1(LDPC_CTRL_0_mem_mux),
        .Res(util_vector_logic_0_Res));
  design_2_xlconstant_0_1 xlconstant_0
       (.dout(xlconstant_0_dout1));
  design_2_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
  design_2_xlconstant_2_0 xlconstant_2
       (.dout(xlconstant_2_dout));
  design_2_xlconstant_3_0 xlconstant_3
       (.dout(xlconstant_3_dout));
endmodule
