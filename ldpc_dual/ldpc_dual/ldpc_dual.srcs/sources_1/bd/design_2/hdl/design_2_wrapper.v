//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
//Date        : Thu Oct 10 09:02:37 2019
//Host        : DESKTOP-JTGGDF4 running 64-bit major release  (build 9200)
//Command     : generate_target design_2_wrapper.bd
//Design      : design_2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_2_wrapper
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

  wire [1:0]BLOCK_RATE;
  wire [1:0]BLOCK_SIZE;
  wire [0:0]DECODE_OUT;
  wire DECODE_OUT_VALID;
  wire [7:0]Decoder_B_Iterations;
  wire [15:0]ERR_CODE;
  wire [7:0]Iteration_Number;
  wire [1:0]LDPC_MODE;
  wire LDPC_RUN;
  wire [0:0]buff_ready;
  wire [15:0]clk_div;
  wire clock_rtl;
  wire [31:0]cnt;
  wire [31:0]cnt_B;
  wire [15:0]cur_read_pos_V;
  wire [15:0]cur_write_pos_V;
  wire [7:0]data_in;
  wire [7:0]deran_data;
  wire deran_data_ap_vld;
  wire [1:0]deran_sel;
  wire [0:0]full;
  wire [0:0]overrun;
  wire [15:0]pMaxIterations;
  wire [0:0]rd_clk_in;
  wire [0:0]rd_clk_out;
  wire [0:0]read_clk_en;
  wire reset_rtl;
  wire [0:0]sync;
  wire [0:0]write_clk_en;

  design_2 design_2_i
       (.BLOCK_RATE(BLOCK_RATE),
        .BLOCK_SIZE(BLOCK_SIZE),
        .DECODE_OUT(DECODE_OUT),
        .DECODE_OUT_VALID(DECODE_OUT_VALID),
        .Decoder_B_Iterations(Decoder_B_Iterations),
        .ERR_CODE(ERR_CODE),
        .Iteration_Number(Iteration_Number),
        .LDPC_MODE(LDPC_MODE),
        .LDPC_RUN(LDPC_RUN),
        .buff_ready(buff_ready),
        .clk_div(clk_div),
        .clock_rtl(clock_rtl),
        .cnt(cnt),
        .cnt_B(cnt_B),
        .cur_read_pos_V(cur_read_pos_V),
        .cur_write_pos_V(cur_write_pos_V),
        .data_in(data_in),
        .deran_data(deran_data),
        .deran_data_ap_vld(deran_data_ap_vld),
        .deran_sel(deran_sel),
        .full(full),
        .overrun(overrun),
        .pMaxIterations(pMaxIterations),
        .rd_clk_in(rd_clk_in),
        .rd_clk_out(rd_clk_out),
        .read_clk_en(read_clk_en),
        .reset_rtl(reset_rtl),
        .sync(sync),
        .write_clk_en(write_clk_en));
endmodule
