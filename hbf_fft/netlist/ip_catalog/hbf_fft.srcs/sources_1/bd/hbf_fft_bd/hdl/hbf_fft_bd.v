//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
//Date        : Wed Jan 20 18:19:45 2021
//Host        : SEMCO_1039B running 64-bit major release  (build 9200)
//Command     : generate_target hbf_fft_bd.bd
//Design      : hbf_fft_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "hbf_fft_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=hbf_fft_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=1,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SYSGEN,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "hbf_fft_bd.hwdef" *) 
module hbf_fft_bd
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

  wire clk_1;
  wire [13:0]datain_1;
  wire [0:0]hbf_fft_1_ce2;
  wire [11:0]hbf_fft_1_fft_axis_tuser_xk_index_d;
  wire [0:0]hbf_fft_1_fft_mag_finished;
  wire [0:0]hbf_fft_1_fft_mag_m_axis_data_tlast;
  wire [0:0]hbf_fft_1_fft_mag_m_axis_dout_tvalid;
  wire [15:0]hbf_fft_1_fft_mag_m_axis_tdata_real;
  wire [0:0]hbf_fft_1_fifofull_i;
  wire [0:0]hbf_fft_1_fifofull_q;
  wire [18:0]hbf_fft_1_idata;
  wire [12:0]hbf_fft_1_index_k;
  wire [12:0]hbf_fft_1_n;
  wire [15:0]hbf_fft_1_qdata;
  wire [4:0]nfft_1;
  wire [0:0]nfftwe_1;
  wire [0:0]rstfifo_1;
  wire [11:0]scalesch_1;
  wire [0:0]spectinv_1;
  wire [0:0]startn_1;
  wire [15:0]window_1;

  assign ce2[0] = hbf_fft_1_ce2;
  assign clk_1 = clk;
  assign datain_1 = datain[13:0];
  assign fft_axis_tuser_xk_index_d[11:0] = hbf_fft_1_fft_axis_tuser_xk_index_d;
  assign fft_mag_finished[0] = hbf_fft_1_fft_mag_finished;
  assign fft_mag_m_axis_data_tlast[0] = hbf_fft_1_fft_mag_m_axis_data_tlast;
  assign fft_mag_m_axis_dout_tvalid[0] = hbf_fft_1_fft_mag_m_axis_dout_tvalid;
  assign fft_mag_m_axis_tdata_real[15:0] = hbf_fft_1_fft_mag_m_axis_tdata_real;
  assign fifofull_i[0] = hbf_fft_1_fifofull_i;
  assign fifofull_q[0] = hbf_fft_1_fifofull_q;
  assign idata[18:0] = hbf_fft_1_idata;
  assign index_k[12:0] = hbf_fft_1_index_k;
  assign n[12:0] = hbf_fft_1_n;
  assign nfft_1 = nfft[4:0];
  assign nfftwe_1 = nfftwe[0];
  assign qdata[15:0] = hbf_fft_1_qdata;
  assign rstfifo_1 = rstfifo[0];
  assign scalesch_1 = scalesch[11:0];
  assign spectinv_1 = spectinv[0];
  assign startn_1 = startn[0];
  assign window_1 = window[15:0];
  hbf_fft_bd_hbf_fft_1_0 hbf_fft_1
       (.ce2(hbf_fft_1_ce2),
        .clk(clk_1),
        .datain(datain_1),
        .fft_axis_tuser_xk_index_d(hbf_fft_1_fft_axis_tuser_xk_index_d),
        .fft_mag_finished(hbf_fft_1_fft_mag_finished),
        .fft_mag_m_axis_data_tlast(hbf_fft_1_fft_mag_m_axis_data_tlast),
        .fft_mag_m_axis_dout_tvalid(hbf_fft_1_fft_mag_m_axis_dout_tvalid),
        .fft_mag_m_axis_tdata_real(hbf_fft_1_fft_mag_m_axis_tdata_real),
        .fifofull_i(hbf_fft_1_fifofull_i),
        .fifofull_q(hbf_fft_1_fifofull_q),
        .idata(hbf_fft_1_idata),
        .index_k(hbf_fft_1_index_k),
        .n(hbf_fft_1_n),
        .nfft(nfft_1),
        .nfftwe(nfftwe_1),
        .qdata(hbf_fft_1_qdata),
        .rstfifo(rstfifo_1),
        .scalesch(scalesch_1),
        .spectinv(spectinv_1),
        .startn(startn_1),
        .window(window_1));
endmodule
