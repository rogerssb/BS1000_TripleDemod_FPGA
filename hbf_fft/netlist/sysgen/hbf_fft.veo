  hbf_fft sysgen_dut (
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
