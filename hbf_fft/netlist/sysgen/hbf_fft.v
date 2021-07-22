`ifndef xlConvPkgIncluded
`include "conv_pkg.v"
`endif

`timescale 1 ns / 10 ps
// Generated from Simulink block hbf_fft/QuadDwnCnv
module hbf_fft_quaddwncnv (
  input [14-1:0] data,
  input [1-1:0] spectinv,
  input clk_1,
  input ce_1,
  input clk_2,
  input ce_2,
  output [19-1:0] iout,
  output [16-1:0] qout
);
  wire [14-1:0] muxq_y_net;
  wire [1-1:0] counter_op_net;
  wire [14-1:0] cmult1_p_net;
  wire [14-1:0] odd_sample_q_net;
  wire [14-1:0] delay_q_net;
  wire [14-1:0] even_sample_q_net;
  wire [19-1:0] fir_compiler_7_2_m_axis_data_tdata_real_net;
  wire [16-1:0] cmult2_p_net;
  wire [14-1:0] datain_net;
  wire [1-1:0] spectinv_net;
  wire src_clk_net;
  wire src_ce_net;
  wire clk_net;
  wire ce_net;
  wire [14-1:0] cmult_p_net;
  wire [1-1:0] expression_dout_net;
  wire fir_compiler_7_2_s_axis_data_tready_net;
  wire fir_compiler_7_2_m_axis_data_tvalid_net;
  wire [14-1:0] muxi_y_net;
  wire [14-1:0] register_q_net;
  wire [14-1:0] register1_q_net;
  assign iout = fir_compiler_7_2_m_axis_data_tdata_real_net;
  assign qout = cmult2_p_net;
  assign datain_net = data;
  assign spectinv_net = spectinv;
  assign src_clk_net = clk_1;
  assign src_ce_net = ce_1;
  assign clk_net = clk_2;
  assign ce_net = ce_2;
  hbf_fft_xlcmult #(
    .a_arith(`xlSigned),
    .a_bin_pt(13),
    .a_width(14),
    .b_bin_pt(13),
    .c_a_type(0),
    .c_a_width(14),
    .c_b_type(0),
    .c_b_width(14),
    .c_output_width(28),
    .core_name0("hbf_fft_mult_gen_v12_0_i0"),
    .extra_registers(1),
    .multsign(2),
    .overflow(2),
    .p_arith(`xlSigned),
    .p_bin_pt(13),
    .p_width(14),
    .quantization(1),
    .zero_const(0)
  )
  cmult (
    .clr(1'b0),
    .core_clr(1'b1),
    .en(1'b1),
    .rst(1'b0),
    .a(even_sample_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .core_clk(clk_net),
    .core_ce(ce_net),
    .p(cmult_p_net)
  );
  hbf_fft_xlcmult #(
    .a_arith(`xlSigned),
    .a_bin_pt(13),
    .a_width(14),
    .b_bin_pt(13),
    .c_a_type(0),
    .c_a_width(14),
    .c_b_type(0),
    .c_b_width(14),
    .c_output_width(28),
    .core_name0("hbf_fft_mult_gen_v12_0_i0"),
    .extra_registers(1),
    .multsign(2),
    .overflow(2),
    .p_arith(`xlSigned),
    .p_bin_pt(13),
    .p_width(14),
    .quantization(1),
    .zero_const(0)
  )
  cmult1 (
    .clr(1'b0),
    .core_clr(1'b1),
    .en(1'b1),
    .rst(1'b0),
    .a(odd_sample_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .core_clk(clk_net),
    .core_ce(ce_net),
    .p(cmult1_p_net)
  );
  hbf_fft_xlcmult #(
    .a_arith(`xlSigned),
    .a_bin_pt(13),
    .a_width(14),
    .b_bin_pt(14),
    .c_a_type(0),
    .c_a_width(14),
    .c_b_type(1),
    .c_b_width(16),
    .c_output_width(30),
    .core_name0("hbf_fft_mult_gen_v12_0_i1"),
    .extra_registers(1),
    .multsign(2),
    .overflow(1),
    .p_arith(`xlSigned),
    .p_bin_pt(14),
    .p_width(16),
    .quantization(1),
    .zero_const(0)
  )
  cmult2 (
    .clr(1'b0),
    .core_clr(1'b1),
    .en(1'b1),
    .rst(1'b0),
    .a(delay_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .core_clk(clk_net),
    .core_ce(ce_net),
    .p(cmult2_p_net)
  );
  sysgen_counter_cc4715fc3c counter (
    .clr(1'b0),
    .clk(clk_net),
    .ce(ce_net),
    .op(counter_op_net)
  );
  hbf_fft_xldelay #(
    .latency(17),
    .reg_retiming(0),
    .reset(0),
    .width(14)
  )
  delay (
    .en(1'b1),
    .rst(1'b1),
    .d(muxq_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net)
  );
  hbf_fft_xldsamp #(
    .d_arith(`xlSigned),
    .d_bin_pt(13),
    .d_width(14),
    .ds_ratio(2),
    .latency(1),
    .phase(0),
    .q_arith(`xlSigned),
    .q_bin_pt(13),
    .q_width(14)
  )
  even_sample (
    .src_clr(1'b0),
    .dest_clr(1'b0),
    .en(1'b1),
    .rst(1'b0),
    .d(datain_net),
    .src_clk(src_clk_net),
    .src_ce(src_ce_net),
    .dest_clk(clk_net),
    .dest_ce(ce_net),
    .q(even_sample_q_net)
  );
  sysgen_expr_ef3479172e expression (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .a(counter_op_net),
    .b(spectinv_net),
    .dout(expression_dout_net)
  );
  xlfir_compiler_3170ad7fab44481f67471b56a251a967 fir_compiler_7_2 (
    .s_axis_data_tdata_real(muxi_y_net),
    .src_clk(clk_net),
    .src_ce(ce_net),
    .clk(src_clk_net),
    .ce(src_ce_net),
    .clk_2(clk_net),
    .ce_2(ce_net),
    .clk_logic_2(clk_net),
    .ce_logic_2(ce_net),
    .s_axis_data_tready(fir_compiler_7_2_s_axis_data_tready_net),
    .m_axis_data_tvalid(fir_compiler_7_2_m_axis_data_tvalid_net),
    .m_axis_data_tdata_real(fir_compiler_7_2_m_axis_data_tdata_real_net)
  );
  sysgen_mux_27fb71596f muxi (
    .clr(1'b0),
    .sel(counter_op_net),
    .d0(register_q_net),
    .d1(cmult_p_net),
    .clk(clk_net),
    .ce(ce_net),
    .y(muxi_y_net)
  );
  sysgen_mux_27fb71596f muxq (
    .clr(1'b0),
    .sel(expression_dout_net),
    .d0(cmult1_p_net),
    .d1(register1_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .y(muxq_y_net)
  );
  hbf_fft_xldsamp #(
    .d_arith(`xlSigned),
    .d_bin_pt(13),
    .d_width(14),
    .ds_ratio(2),
    .latency(1),
    .phase(1),
    .q_arith(`xlSigned),
    .q_bin_pt(13),
    .q_width(14)
  )
  odd_sample (
    .src_clr(1'b0),
    .dest_clr(1'b0),
    .en(1'b1),
    .rst(1'b0),
    .d(datain_net),
    .src_clk(src_clk_net),
    .src_ce(src_ce_net),
    .dest_clk(clk_net),
    .dest_ce(ce_net),
    .q(odd_sample_q_net)
  );
  hbf_fft_xlregister #(
    .d_width(14),
    .init_value(14'b00000000000000)
  )
  register (
    .en(1'b1),
    .rst(1'b0),
    .d(even_sample_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register_q_net)
  );
  hbf_fft_xlregister #(
    .d_width(14),
    .init_value(14'b00000000000000)
  )
  register1 (
    .en(1'b1),
    .rst(1'b0),
    .d(odd_sample_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register1_q_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block hbf_fft/WindMult
module hbf_fft_windmult (
  input [1-1:0] inwe,
  input [19-1:0] inreal,
  input [16-1:0] inimag,
  input [16-1:0] factor,
  input clk_2,
  input ce_2,
  output [1-1:0] outwe,
  output [18-1:0] outreal,
  output [18-1:0] outimag
);
  wire [1-1:0] register2_q_net;
  wire [18-1:0] mult_p_net;
  wire [18-1:0] mult1_p_net;
  wire [1-1:0] mcode_enout_net;
  wire [19-1:0] fir_compiler_7_2_m_axis_data_tdata_real_net;
  wire [16-1:0] cmult2_p_net;
  wire [16-1:0] window_net;
  wire clk_net;
  wire ce_net;
  wire [1-1:0] register_q_net;
  wire [1-1:0] register1_q_net;
  assign outwe = register2_q_net;
  assign outreal = mult_p_net;
  assign outimag = mult1_p_net;
  assign mcode_enout_net = inwe;
  assign fir_compiler_7_2_m_axis_data_tdata_real_net = inreal;
  assign cmult2_p_net = inimag;
  assign window_net = factor;
  assign clk_net = clk_2;
  assign ce_net = ce_2;
  hbf_fft_xlmult #(
    .a_arith(`xlSigned),
    .a_bin_pt(17),
    .a_width(19),
    .b_arith(`xlUnsigned),
    .b_bin_pt(14),
    .b_width(16),
    .c_a_type(0),
    .c_a_width(19),
    .c_b_type(1),
    .c_b_width(16),
    .c_baat(19),
    .c_output_width(35),
    .c_type(0),
    .core_name0("hbf_fft_mult_gen_v12_0_i2"),
    .extra_registers(0),
    .multsign(2),
    .overflow(1),
    .p_arith(`xlSigned),
    .p_bin_pt(17),
    .p_width(18),
    .quantization(1)
  )
  mult (
    .clr(1'b0),
    .core_clr(1'b1),
    .en(1'b1),
    .rst(1'b0),
    .a(fir_compiler_7_2_m_axis_data_tdata_real_net),
    .b(window_net),
    .clk(clk_net),
    .ce(ce_net),
    .core_clk(clk_net),
    .core_ce(ce_net),
    .p(mult_p_net)
  );
  hbf_fft_xlmult #(
    .a_arith(`xlUnsigned),
    .a_bin_pt(14),
    .a_width(16),
    .b_arith(`xlSigned),
    .b_bin_pt(14),
    .b_width(16),
    .c_a_type(1),
    .c_a_width(16),
    .c_b_type(0),
    .c_b_width(16),
    .c_baat(16),
    .c_output_width(32),
    .c_type(0),
    .core_name0("hbf_fft_mult_gen_v12_0_i3"),
    .extra_registers(0),
    .multsign(2),
    .overflow(1),
    .p_arith(`xlSigned),
    .p_bin_pt(17),
    .p_width(18),
    .quantization(1)
  )
  mult1 (
    .clr(1'b0),
    .core_clr(1'b1),
    .en(1'b1),
    .rst(1'b0),
    .a(window_net),
    .b(cmult2_p_net),
    .clk(clk_net),
    .ce(ce_net),
    .core_clk(clk_net),
    .core_ce(ce_net),
    .p(mult1_p_net)
  );
  hbf_fft_xlregister #(
    .d_width(1),
    .init_value(1'b0)
  )
  register (
    .en(1'b1),
    .rst(1'b0),
    .d(mcode_enout_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register_q_net)
  );
  hbf_fft_xlregister #(
    .d_width(1),
    .init_value(1'b0)
  )
  register1 (
    .en(1'b1),
    .rst(1'b0),
    .d(register_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register1_q_net)
  );
  hbf_fft_xlregister #(
    .d_width(1),
    .init_value(1'b0)
  )
  register2 (
    .en(1'b1),
    .rst(1'b0),
    .d(register1_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register2_q_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block hbf_fft/nfftCounter/TwoPower1
module hbf_fft_twopower1 (
  input [5-1:0] in,
  input [1-1:0] en,
  input clk_2,
  input ce_2,
  output [13-1:0] out1
);
  wire [13-1:0] mux3_y_net;
  wire [5-1:0] nfft_net;
  wire [1-1:0] logical_y_net;
  wire clk_net;
  wire ce_net;
  wire [13-1:0] constant_op_net;
  wire [13-1:0] mux_y_net;
  wire [1-1:0] slice0_y_net;
  wire [13-1:0] shift_op_net;
  wire [13-1:0] mux1_y_net;
  wire [1-1:0] slice1_y_net;
  wire [13-1:0] shift1_op_net;
  wire [13-1:0] mux2_y_net;
  wire [1-1:0] slice2_y_net;
  wire [13-1:0] shift2_op_net;
  wire [1-1:0] slice3_y_net;
  wire [13-1:0] shift3_op_net;
  wire [5-1:0] register_q_net;
  assign out1 = mux3_y_net;
  assign nfft_net = in;
  assign logical_y_net = en;
  assign clk_net = clk_2;
  assign ce_net = ce_2;
  sysgen_constant_e34fae1d80 constant (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant_op_net)
  );
  sysgen_mux_facf6a2d8c mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(slice0_y_net),
    .d0(constant_op_net),
    .d1(shift_op_net),
    .y(mux_y_net)
  );
  sysgen_mux_facf6a2d8c mux1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(slice1_y_net),
    .d0(mux_y_net),
    .d1(shift1_op_net),
    .y(mux1_y_net)
  );
  sysgen_mux_facf6a2d8c mux2 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(slice2_y_net),
    .d0(mux1_y_net),
    .d1(shift2_op_net),
    .y(mux2_y_net)
  );
  sysgen_mux_37fb526337 mux3 (
    .clr(1'b0),
    .sel(slice3_y_net),
    .d0(mux2_y_net),
    .d1(shift3_op_net),
    .clk(clk_net),
    .ce(ce_net),
    .y(mux3_y_net)
  );
  hbf_fft_xlregister #(
    .d_width(5),
    .init_value(5'b00000)
  )
  register (
    .rst(1'b0),
    .d(nfft_net),
    .en(logical_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register_q_net)
  );
  sysgen_shift_3c7dd62b9d shift (
    .clk(1'b1),
    .ce(1'b1),
    .clr(1'b0),
    .ip(constant_op_net),
    .op(shift_op_net)
  );
  sysgen_shift_9b76a59f0d shift1 (
    .clr(1'b0),
    .ip(mux_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(shift1_op_net)
  );
  sysgen_shift_a1ed70e27b shift2 (
    .clr(1'b0),
    .ip(mux1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(shift2_op_net)
  );
  sysgen_shift_ce77793538 shift3 (
    .clr(1'b0),
    .ip(mux2_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(shift3_op_net)
  );
  hbf_fft_xlslice #(
    .new_lsb(0),
    .new_msb(0),
    .x_width(5),
    .y_width(1)
  )
  slice0 (
    .x(register_q_net),
    .y(slice0_y_net)
  );
  hbf_fft_xlslice #(
    .new_lsb(1),
    .new_msb(1),
    .x_width(5),
    .y_width(1)
  )
  slice1 (
    .x(register_q_net),
    .y(slice1_y_net)
  );
  hbf_fft_xlslice #(
    .new_lsb(2),
    .new_msb(2),
    .x_width(5),
    .y_width(1)
  )
  slice2 (
    .x(register_q_net),
    .y(slice2_y_net)
  );
  hbf_fft_xlslice #(
    .new_lsb(3),
    .new_msb(3),
    .x_width(5),
    .y_width(1)
  )
  slice3 (
    .x(register_q_net),
    .y(slice3_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block hbf_fft/nfftCounter
module hbf_fft_nfftcounter (
  input [5-1:0] nfft,
  input [1-1:0] nfftwe,
  input [1-1:0] start,
  input clk_2,
  input ce_2,
  output [1-1:0] en,
  output [13-1:0] k,
  output [13-1:0] n
);
  wire [1-1:0] mcode_enout_net;
  wire [13-1:0] mcode_kindexout_net;
  wire [13-1:0] mux3_y_net;
  wire [5-1:0] nfft_net;
  wire [1-1:0] logical_y_net;
  wire [1-1:0] register2_q_net;
  wire clk_net;
  wire ce_net;
  assign en = mcode_enout_net;
  assign k = mcode_kindexout_net;
  assign n = mux3_y_net;
  assign nfft_net = nfft;
  assign logical_y_net = nfftwe;
  assign register2_q_net = start;
  assign clk_net = clk_2;
  assign ce_net = ce_2;
  hbf_fft_twopower1 twopower1 (
    .in(nfft_net),
    .en(logical_y_net),
    .clk_2(clk_net),
    .ce_2(ce_net),
    .out1(mux3_y_net)
  );
  sysgen_mcode_block_14a26cadd7 mcode (
    .clr(1'b0),
    .start(register2_q_net),
    .limit(mux3_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .kindexout(mcode_kindexout_net),
    .enout(mcode_enout_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block hbf_fft/strobe
module hbf_fft_strobe (
  input [1-1:0] in1,
  input clk_2,
  input ce_2,
  output [1-1:0] out1
);
  wire [1-1:0] logical_y_net;
  wire [1-1:0] nfftwe_net;
  wire clk_net;
  wire ce_net;
  wire [1-1:0] inverter_op_net;
  wire [1-1:0] register4_q_net;
  wire [1-1:0] register_q_net;
  wire [1-1:0] register3_q_net;
  assign out1 = logical_y_net;
  assign nfftwe_net = in1;
  assign clk_net = clk_2;
  assign ce_net = ce_2;
  sysgen_inverter_98d9985633 inverter (
    .clr(1'b0),
    .ip(register4_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(inverter_op_net)
  );
  sysgen_logical_aa12fd5a97 logical (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .d0(register_q_net),
    .d1(inverter_op_net),
    .y(logical_y_net)
  );
  hbf_fft_xlregister #(
    .d_width(1),
    .init_value(1'b0)
  )
  register (
    .en(1'b1),
    .rst(1'b0),
    .d(register4_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register_q_net)
  );
  hbf_fft_xlregister #(
    .d_width(1),
    .init_value(1'b0)
  )
  register3 (
    .en(1'b1),
    .rst(1'b0),
    .d(nfftwe_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register3_q_net)
  );
  hbf_fft_xlregister #(
    .d_width(1),
    .init_value(1'b0)
  )
  register4 (
    .en(1'b1),
    .rst(1'b0),
    .d(register3_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register4_q_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block hbf_fft_struct
module hbf_fft_struct (
  input [14-1:0] datain,
  input [5-1:0] nfft,
  input [1-1:0] nfftwe,
  input [1-1:0] rstfifo,
  input [12-1:0] scalesch,
  input [1-1:0] spectinv,
  input [1-1:0] startn,
  input [16-1:0] window,
  input clk_1,
  input ce_1,
  input clk_2,
  input ce_2,
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
  output [13-1:0] index_k,
  output [1-1:0] ce2
);
  wire [14-1:0] datain_net;
  wire [1-1:0] fifoi_full_net;
  wire [1-1:0] fifoq_full_net;
  wire [19-1:0] fir_compiler_7_2_m_axis_data_tdata_real_net;
  wire [13-1:0] mux3_y_net;
  wire [5-1:0] nfft_net;
  wire [1-1:0] nfftwe_net;
  wire [16-1:0] cmult2_p_net;
  wire [1-1:0] rstfifo_net;
  wire [12-1:0] scalesch_net;
  wire [1-1:0] spectinv_net;
  wire [1-1:0] startn_net;
  wire [16-1:0] window_net;
  wire [12-1:0] xndelay_q_net;
  wire [1-1:0] register_q_net;
  wire [1-1:0] cordic_6_0_m_axis_dout_tlast_net;
  wire [1-1:0] cordic_6_0_m_axis_dout_tvalid_net;
  wire [16-1:0] cordic_6_0_m_axis_dout_tdata_real_net;
  wire [13-1:0] mcode_kindexout_net;
  wire [1-1:0] clock_enable_probe_q_net;
  wire src_clk_net;
  wire src_ce_net;
  wire clk_net;
  wire ce_net;
  wire [1-1:0] register2_q_net;
  wire [18-1:0] mult_p_net;
  wire [18-1:0] mult1_p_net;
  wire [1-1:0] mcode_enout_net;
  wire [1-1:0] logical_y_net_x0;
  wire [1-1:0] register2_q_net_x0;
  wire [17-1:0] bitbasher_a_net;
  wire [18-1:0] fast_fourier_transform_9_0_m_axis_data_tdata_xn_re_net;
  wire [17-1:0] bitbasher1_a_net;
  wire [18-1:0] fast_fourier_transform_9_0_m_axis_data_tdata_xn_im_net;
  wire [16-1:0] cordic_6_0_m_axis_dout_tdata_phase_net;
  wire fast_fourier_transform_9_0_m_axis_data_tvalid_net;
  wire fast_fourier_transform_9_0_m_axis_data_tlast_net;
  wire [1-1:0] constant_op_net;
  wire [1-1:0] constant4_op_net;
  wire [1-1:0] constant7_op_net;
  wire [18-1:0] fifoi_dout_net;
  wire fifoi_empty_net;
  wire fast_fourier_transform_9_0_s_axis_data_tready_net;
  wire [18-1:0] fifoq_dout_net;
  wire fifoq_empty_net;
  wire fast_fourier_transform_9_0_s_axis_config_tready_net;
  wire [12-1:0] fast_fourier_transform_9_0_m_axis_data_tuser_xk_index_net;
  wire fast_fourier_transform_9_0_event_frame_started_net;
  wire fast_fourier_transform_9_0_event_tlast_unexpected_net;
  wire fast_fourier_transform_9_0_event_tlast_missing_net;
  wire fast_fourier_transform_9_0_event_data_in_channel_halt_net;
  wire invfifoiempty_op_net;
  wire [1-1:0] logical_y_net;
  wire [1-1:0] register1_q_net;
  assign datain_net = datain;
  assign fifofull_i = fifoi_full_net;
  assign fifofull_q = fifoq_full_net;
  assign idata = fir_compiler_7_2_m_axis_data_tdata_real_net;
  assign n = mux3_y_net;
  assign nfft_net = nfft;
  assign nfftwe_net = nfftwe;
  assign qdata = cmult2_p_net;
  assign rstfifo_net = rstfifo;
  assign scalesch_net = scalesch;
  assign spectinv_net = spectinv;
  assign startn_net = startn;
  assign window_net = window;
  assign fft_axis_tuser_xk_index_d = xndelay_q_net;
  assign fft_mag_finished = register_q_net;
  assign fft_mag_m_axis_data_tlast = cordic_6_0_m_axis_dout_tlast_net;
  assign fft_mag_m_axis_dout_tvalid = cordic_6_0_m_axis_dout_tvalid_net;
  assign fft_mag_m_axis_tdata_real = cordic_6_0_m_axis_dout_tdata_real_net;
  assign index_k = mcode_kindexout_net;
  assign ce2 = clock_enable_probe_q_net;
  assign src_clk_net = clk_1;
  assign src_ce_net = ce_1;
  assign clk_net = clk_2;
  assign ce_net = ce_2;
  hbf_fft_quaddwncnv quaddwncnv (
    .data(datain_net),
    .spectinv(spectinv_net),
    .clk_1(src_clk_net),
    .ce_1(src_ce_net),
    .clk_2(clk_net),
    .ce_2(ce_net),
    .iout(fir_compiler_7_2_m_axis_data_tdata_real_net),
    .qout(cmult2_p_net)
  );
  hbf_fft_windmult windmult (
    .inwe(mcode_enout_net),
    .inreal(fir_compiler_7_2_m_axis_data_tdata_real_net),
    .inimag(cmult2_p_net),
    .factor(window_net),
    .clk_2(clk_net),
    .ce_2(ce_net),
    .outwe(register2_q_net),
    .outreal(mult_p_net),
    .outimag(mult1_p_net)
  );
  hbf_fft_nfftcounter nfftcounter (
    .nfft(nfft_net),
    .nfftwe(logical_y_net_x0),
    .start(register2_q_net_x0),
    .clk_2(clk_net),
    .ce_2(ce_net),
    .en(mcode_enout_net),
    .k(mcode_kindexout_net),
    .n(mux3_y_net)
  );
  hbf_fft_strobe strobe (
    .in1(nfftwe_net),
    .clk_2(clk_net),
    .ce_2(ce_net),
    .out1(logical_y_net_x0)
  );
  sysgen_bitbasher_dc22de8076 bitbasher (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .b(fast_fourier_transform_9_0_m_axis_data_tdata_xn_re_net),
    .a(bitbasher_a_net)
  );
  sysgen_bitbasher_dc22de8076 bitbasher1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .b(fast_fourier_transform_9_0_m_axis_data_tdata_xn_im_net),
    .a(bitbasher1_a_net)
  );
  xlcordic_0cfb8f5888c7b91b056046514e96cf30 cordic_6_0 (
    .s_axis_cartesian_tvalid(fast_fourier_transform_9_0_m_axis_data_tvalid_net),
    .s_axis_cartesian_tdata_imag(bitbasher_a_net),
    .s_axis_cartesian_tdata_real(bitbasher1_a_net),
    .s_axis_cartesian_tlast(fast_fourier_transform_9_0_m_axis_data_tlast_net),
    .clk(clk_net),
    .ce(ce_net),
    .m_axis_dout_tvalid(cordic_6_0_m_axis_dout_tvalid_net),
    .m_axis_dout_tdata_phase(cordic_6_0_m_axis_dout_tdata_phase_net),
    .m_axis_dout_tdata_real(cordic_6_0_m_axis_dout_tdata_real_net),
    .m_axis_dout_tlast(cordic_6_0_m_axis_dout_tlast_net)
  );
  hbf_fft_xlceprobe #(
    .d_width(16),
    .q_width(1)
  )
  clock_enable_probe (
    .d(cordic_6_0_m_axis_dout_tdata_real_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(clock_enable_probe_q_net)
  );
  sysgen_constant_0e6301439b constant (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant_op_net)
  );
  sysgen_constant_d3b9b8ab34 constant4 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant4_op_net)
  );
  sysgen_constant_0e6301439b constant7 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant7_op_net)
  );
  hbf_fft_xlfifogen #(
    .core_name0("hbf_fft_fifo_generator_v13_0_i0"),
    .data_count_width(4),
    .data_width(18),
    .extra_registers(0),
    .has_ae(0),
    .has_af(0),
    .percent_full_width(2)
  )
  fifoi (
    .en(1'b1),
    .din(mult_p_net),
    .we(register2_q_net),
    .re(fast_fourier_transform_9_0_s_axis_data_tready_net),
    .rst(rstfifo_net),
    .clk(clk_net),
    .ce(ce_net),
    .we_ce(ce_net),
    .re_ce(ce_net),
    .dout(fifoi_dout_net),
    .empty(fifoi_empty_net),
    .full(fifoi_full_net)
  );
  hbf_fft_xlfifogen #(
    .core_name0("hbf_fft_fifo_generator_v13_0_i0"),
    .data_count_width(4),
    .data_width(18),
    .extra_registers(0),
    .has_ae(0),
    .has_af(0),
    .percent_full_width(1)
  )
  fifoq (
    .en(1'b1),
    .din(mult1_p_net),
    .we(register2_q_net),
    .re(fast_fourier_transform_9_0_s_axis_data_tready_net),
    .rst(rstfifo_net),
    .clk(clk_net),
    .ce(ce_net),
    .we_ce(ce_net),
    .re_ce(ce_net),
    .dout(fifoq_dout_net),
    .empty(fifoq_empty_net),
    .full(fifoq_full_net)
  );
  xlfast_fourier_transform_f3b02437395edd789bc1dec94ace7f65 fast_fourier_transform_9_0 (
    .s_axis_config_tdata_scale_sch(scalesch_net),
    .s_axis_config_tdata_fwd_inv(constant_op_net),
    .s_axis_config_tdata_nfft(nfft_net),
    .s_axis_config_tvalid(logical_y_net_x0),
    .s_axis_data_tdata_xn_im(fifoq_dout_net),
    .s_axis_data_tdata_xn_re(fifoi_dout_net),
    .s_axis_data_tvalid(invfifoiempty_op_net),
    .s_axis_data_tlast(constant4_op_net),
    .clk(clk_net),
    .ce(ce_net),
    .s_axis_config_tready(fast_fourier_transform_9_0_s_axis_config_tready_net),
    .s_axis_data_tready(fast_fourier_transform_9_0_s_axis_data_tready_net),
    .m_axis_data_tdata_xn_im(fast_fourier_transform_9_0_m_axis_data_tdata_xn_im_net),
    .m_axis_data_tdata_xn_re(fast_fourier_transform_9_0_m_axis_data_tdata_xn_re_net),
    .m_axis_data_tuser_xk_index(fast_fourier_transform_9_0_m_axis_data_tuser_xk_index_net),
    .m_axis_data_tvalid(fast_fourier_transform_9_0_m_axis_data_tvalid_net),
    .m_axis_data_tlast(fast_fourier_transform_9_0_m_axis_data_tlast_net),
    .event_frame_started(fast_fourier_transform_9_0_event_frame_started_net),
    .event_tlast_unexpected(fast_fourier_transform_9_0_event_tlast_unexpected_net),
    .event_tlast_missing(fast_fourier_transform_9_0_event_tlast_missing_net),
    .event_data_in_channel_halt(fast_fourier_transform_9_0_event_data_in_channel_halt_net)
  );
  sysgen_inverter_98d9985633 invfifoiempty (
    .clr(1'b0),
    .ip(fifoi_empty_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(invfifoiempty_op_net)
  );
  sysgen_logical_22e0f235e6 logical (
    .clr(1'b0),
    .d0(cordic_6_0_m_axis_dout_tvalid_net),
    .d1(cordic_6_0_m_axis_dout_tlast_net),
    .clk(clk_net),
    .ce(ce_net),
    .y(logical_y_net)
  );
  hbf_fft_xlregister #(
    .d_width(1),
    .init_value(1'b0)
  )
  register (
    .d(constant7_op_net),
    .rst(register2_q_net_x0),
    .en(logical_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register_q_net)
  );
  hbf_fft_xlregister #(
    .d_width(1),
    .init_value(1'b0)
  )
  register1 (
    .en(1'b1),
    .rst(1'b0),
    .d(startn_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register1_q_net)
  );
  hbf_fft_xlregister #(
    .d_width(1),
    .init_value(1'b0)
  )
  register2 (
    .en(1'b1),
    .rst(1'b0),
    .d(register1_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register2_q_net_x0)
  );
  sysgen_delay_b0141befbf xndelay (
    .clr(1'b0),
    .d(fast_fourier_transform_9_0_m_axis_data_tuser_xk_index_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(xndelay_q_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block 
module hbf_fft_default_clock_driver (
  input hbf_fft_sysclk,
  input hbf_fft_sysce,
  input hbf_fft_sysclr,
  output hbf_fft_clk1,
  output hbf_fft_ce1,
  output hbf_fft_clk2,
  output hbf_fft_ce2
);
  xlclockdriver #(
    .period(1),
    .log_2_period(1)
  )
  clockdriver_x0 (
    .sysclk(hbf_fft_sysclk),
    .sysce(hbf_fft_sysce),
    .sysclr(hbf_fft_sysclr),
    .clk(hbf_fft_clk1),
    .ce(hbf_fft_ce1)
  );
  xlclockdriver #(
    .period(2),
    .log_2_period(2)
  )
  clockdriver (
    .sysclk(hbf_fft_sysclk),
    .sysce(hbf_fft_sysce),
    .sysclr(hbf_fft_sysclr),
    .clk(hbf_fft_clk2),
    .ce(hbf_fft_ce2)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block 
(* core_generation_info = "hbf_fft,sysgen_core_2015_4,{,compilation=IP Catalog,block_icon_display=Default,family=kintex7,part=xc7k160t,speed=-3,package=fbg676,synthesis_language=verilog,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=1,ce_clr=0,clock_period=10,system_simulink_period=1,waveform_viewer=1,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=240300,bitbasher=2,ceprobe=1,cmult=3,constant=4,cordic_v6_0=1,counter=1,delay=2,dsamp=2,expr=1,fifo=2,fir_compiler_v7_2=1,inv=2,logical=2,mcode=1,mult=2,mux=6,register=12,shift=4,slice=4,xfft_v9_0=1,}" *)
module hbf_fft (
  input [14-1:0] datain,
  input [5-1:0] nfft,
  input [1-1:0] nfftwe,
  input [1-1:0] rstfifo,
  input [12-1:0] scalesch,
  input [1-1:0] spectinv,
  input [1-1:0] startn,
  input [16-1:0] window,
  input clk,
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
  output [13-1:0] index_k,
  output [1-1:0] ce2
);
  wire clk_1_net;
  wire ce_1_net;
  wire clk_2_net;
  wire ce_2_net;
  hbf_fft_default_clock_driver hbf_fft_default_clock_driver (
    .hbf_fft_sysclk(clk),
    .hbf_fft_sysce(1'b1),
    .hbf_fft_sysclr(1'b0),
    .hbf_fft_clk1(clk_1_net),
    .hbf_fft_ce1(ce_1_net),
    .hbf_fft_clk2(clk_2_net),
    .hbf_fft_ce2(ce_2_net)
  );
  hbf_fft_struct hbf_fft_struct (
    .datain(datain),
    .nfft(nfft),
    .nfftwe(nfftwe),
    .rstfifo(rstfifo),
    .scalesch(scalesch),
    .spectinv(spectinv),
    .startn(startn),
    .window(window),
    .clk_1(clk_1_net),
    .ce_1(ce_1_net),
    .clk_2(clk_2_net),
    .ce_2(ce_2_net),
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
    .index_k(index_k),
    .ce2(ce2)
  );
endmodule
