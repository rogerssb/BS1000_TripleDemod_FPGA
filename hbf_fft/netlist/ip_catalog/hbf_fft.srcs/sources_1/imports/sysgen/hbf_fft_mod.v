`timescale 1 ns / 10 ps
// Generated from Simulink block 
module hbf_fft_stub (
  input [14-1:0] datain,
  input [5-1:0] nfft,
  input [1-1:0] nfftwe,
  input [1-1:0] rstfifo,
  input [12-1:0] scalesch,
  input [1-1:0] spectinv,
  input [1-1:0] startn,
  input [16-1:0] window,
  input clk,
  output [1-1:0] ce2,
  output [1-1:0] fifofull_i,
  output [1-1:0] fifofull_q,
  output [19-1:0] idata,
  output [13-1:0] n,
  output [16-1:0] qdata,
  output [12-1:0] fft_axis_tuser_xk_index_d,
  output [1-1:0] fft_mag_finished,
  output [1-1:0] fft_mag_m_axis_data_tlast,
  output [1-1:0] fft_mag_m_axis_dout_tvalid,
  output [16-1:0] fft_mag_m_axis_tdata_real,
  output [13-1:0] index_k
);
  hbf_fft_0 sysgen_dut (
    .datain(datain),
    .nfft(nfft),
    .nfftwe(nfftwe),
    .rstfifo(rstfifo),
    .scalesch(scalesch),
    .spectinv(spectinv),
    .startn(startn),
    .window(window),
    .clk(clk),
    .ce2(ce2),
    .fifofull_i(fifofull_i),
    .fifofull_q(fifofull_q),
    .idata(idata),
    .n(n),
    .qdata(qdata),
    .fft_axis_tuser_xk_index_d(fft_axis_tuser_xk_index_d),
    .fft_mag_finished(fft_mag_finished),
    .fft_mag_m_axis_data_tlast(fft_mag_m_axis_data_tlast),
    .fft_mag_m_axis_dout_tvalid(fft_mag_m_axis_dout_tvalid),
    .fft_mag_m_axis_tdata_real(fft_mag_m_axis_tdata_real),
    .index_k(index_k)
  );
endmodule
