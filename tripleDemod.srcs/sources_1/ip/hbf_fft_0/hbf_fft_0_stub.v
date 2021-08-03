// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Wed Sep 18 17:56:16 2019
// Host        : scottAlien running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               C:/modem/vivado/tripleDemod.srcs/sources_1/ip/hbf_fft_0/hbf_fft_0_stub.v
// Design      : hbf_fft_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "hbf_fft,Vivado 2016.4" *)
module hbf_fft_0(datain, nfft, nfftwe, rstfifo, scalesch, spectinv, 
  startn, window, clk, fifofull_i, fifofull_q, idata, n, qdata, fft_axis_tuser_xk_index_d, 
  fft_mag_finished, fft_mag_m_axis_data_tlast, fft_mag_m_axis_dout_tvalid, 
  fft_mag_m_axis_tdata_real, index_k, ce2)
/* synthesis syn_black_box black_box_pad_pin="datain[13:0],nfft[4:0],nfftwe[0:0],rstfifo[0:0],scalesch[11:0],spectinv[0:0],startn[0:0],window[15:0],clk,fifofull_i[0:0],fifofull_q[0:0],idata[18:0],n[12:0],qdata[15:0],fft_axis_tuser_xk_index_d[11:0],fft_mag_finished[0:0],fft_mag_m_axis_data_tlast[0:0],fft_mag_m_axis_dout_tvalid[0:0],fft_mag_m_axis_tdata_real[15:0],index_k[12:0],ce2[0:0]" */;
  input [13:0]datain;
  input [4:0]nfft;
  input [0:0]nfftwe;
  input [0:0]rstfifo;
  input [11:0]scalesch;
  input [0:0]spectinv;
  input [0:0]startn;
  input [15:0]window;
  input clk;
  output [0:0]fifofull_i;
  output [0:0]fifofull_q;
  output [18:0]idata;
  output [12:0]n;
  output [15:0]qdata;
  output [11:0]fft_axis_tuser_xk_index_d;
  output [0:0]fft_mag_finished;
  output [0:0]fft_mag_m_axis_data_tlast;
  output [0:0]fft_mag_m_axis_dout_tvalid;
  output [15:0]fft_mag_m_axis_tdata_real;
  output [12:0]index_k;
  output [0:0]ce2;
endmodule
