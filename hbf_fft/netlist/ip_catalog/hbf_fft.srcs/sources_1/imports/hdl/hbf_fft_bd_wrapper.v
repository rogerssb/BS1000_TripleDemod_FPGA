//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
//Date        : Wed Sep 18 17:48:09 2019
//Host        : scottAlien running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target hbf_fft_bd_wrapper.bd
//Design      : hbf_fft_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module hbf_fft_bd_wrapper
   (ce2,
    clk,
    datain,
    fft_axis_tuser_xk_index_d,
    fft_mag_finished,
    fft_mag_m_axis_data_tlast,
    fft_mag_m_axis_dout_tvalid,
    fft_mag_m_axis_tdata_real,
    fifofull_i,
    fifofull_q,
    idata,
    index_k,
    n,
    nfft,
    nfftwe,
    qdata,
    rstfifo,
    scalesch,
    spectinv,
    startn,
    window);
  output [0:0]ce2;
  input clk;
  input [13:0]datain;
  output [11:0]fft_axis_tuser_xk_index_d;
  output [0:0]fft_mag_finished;
  output [0:0]fft_mag_m_axis_data_tlast;
  output [0:0]fft_mag_m_axis_dout_tvalid;
  output [15:0]fft_mag_m_axis_tdata_real;
  output [0:0]fifofull_i;
  output [0:0]fifofull_q;
  output [18:0]idata;
  output [12:0]index_k;
  output [12:0]n;
  input [4:0]nfft;
  input [0:0]nfftwe;
  output [15:0]qdata;
  input [0:0]rstfifo;
  input [11:0]scalesch;
  input [0:0]spectinv;
  input [0:0]startn;
  input [15:0]window;

  wire [0:0]ce2;
  wire clk;
  wire [13:0]datain;
  wire [11:0]fft_axis_tuser_xk_index_d;
  wire [0:0]fft_mag_finished;
  wire [0:0]fft_mag_m_axis_data_tlast;
  wire [0:0]fft_mag_m_axis_dout_tvalid;
  wire [15:0]fft_mag_m_axis_tdata_real;
  wire [0:0]fifofull_i;
  wire [0:0]fifofull_q;
  wire [18:0]idata;
  wire [12:0]index_k;
  wire [12:0]n;
  wire [4:0]nfft;
  wire [0:0]nfftwe;
  wire [15:0]qdata;
  wire [0:0]rstfifo;
  wire [11:0]scalesch;
  wire [0:0]spectinv;
  wire [0:0]startn;
  wire [15:0]window;

  hbf_fft_bd hbf_fft_bd_i
       (.ce2(ce2),
        .clk(clk),
        .datain(datain),
        .fft_axis_tuser_xk_index_d(fft_axis_tuser_xk_index_d),
        .fft_mag_finished(fft_mag_finished),
        .fft_mag_m_axis_data_tlast(fft_mag_m_axis_data_tlast),
        .fft_mag_m_axis_dout_tvalid(fft_mag_m_axis_dout_tvalid),
        .fft_mag_m_axis_tdata_real(fft_mag_m_axis_tdata_real),
        .fifofull_i(fifofull_i),
        .fifofull_q(fifofull_q),
        .idata(idata),
        .index_k(index_k),
        .n(n),
        .nfft(nfft),
        .nfftwe(nfftwe),
        .qdata(qdata),
        .rstfifo(rstfifo),
        .scalesch(scalesch),
        .spectinv(spectinv),
        .startn(startn),
        .window(window));
endmodule
