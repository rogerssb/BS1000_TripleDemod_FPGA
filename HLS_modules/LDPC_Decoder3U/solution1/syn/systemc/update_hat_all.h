// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _update_hat_all_HH_
#define _update_hat_all_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct update_hat_all : public sc_module {
    // Port declarations 240
    sc_in< sc_lv<13> > pos_r;
    sc_in< sc_lv<1> > bpest0;
    sc_out< sc_lv<11> > prHat_buf_address1;
    sc_out< sc_logic > prHat_buf_ce1;
    sc_out< sc_logic > prHat_buf_we1;
    sc_out< sc_lv<1> > prHat_buf_d1;
    sc_out< sc_lv<11> > prHat_bufA_address1;
    sc_out< sc_logic > prHat_bufA_ce1;
    sc_out< sc_logic > prHat_bufA_we1;
    sc_out< sc_lv<1> > prHat_bufA_d1;
    sc_out< sc_lv<11> > prHat_bufAa_address1;
    sc_out< sc_logic > prHat_bufAa_ce1;
    sc_out< sc_logic > prHat_bufAa_we1;
    sc_out< sc_lv<1> > prHat_bufAa_d1;
    sc_out< sc_lv<11> > prHat_bufAb_address1;
    sc_out< sc_logic > prHat_bufAb_ce1;
    sc_out< sc_logic > prHat_bufAb_we1;
    sc_out< sc_lv<1> > prHat_bufAb_d1;
    sc_out< sc_lv<11> > prHat_bufAc_address1;
    sc_out< sc_logic > prHat_bufAc_ce1;
    sc_out< sc_logic > prHat_bufAc_we1;
    sc_out< sc_lv<1> > prHat_bufAc_d1;
    sc_out< sc_lv<11> > prHat_bufB_address1;
    sc_out< sc_logic > prHat_bufB_ce1;
    sc_out< sc_logic > prHat_bufB_we1;
    sc_out< sc_lv<1> > prHat_bufB_d1;
    sc_in< sc_lv<1> > bpest1;
    sc_out< sc_lv<11> > prHat_buf1_address1;
    sc_out< sc_logic > prHat_buf1_ce1;
    sc_out< sc_logic > prHat_buf1_we1;
    sc_out< sc_lv<1> > prHat_buf1_d1;
    sc_out< sc_lv<11> > prHat_bufA1_address1;
    sc_out< sc_logic > prHat_bufA1_ce1;
    sc_out< sc_logic > prHat_bufA1_we1;
    sc_out< sc_lv<1> > prHat_bufA1_d1;
    sc_out< sc_lv<11> > prHat_bufB1_address1;
    sc_out< sc_logic > prHat_bufB1_ce1;
    sc_out< sc_logic > prHat_bufB1_we1;
    sc_out< sc_lv<1> > prHat_bufB1_d1;
    sc_out< sc_lv<11> > prHat_bufB1a_address1;
    sc_out< sc_logic > prHat_bufB1a_ce1;
    sc_out< sc_logic > prHat_bufB1a_we1;
    sc_out< sc_lv<1> > prHat_bufB1a_d1;
    sc_out< sc_lv<11> > prHat_bufB1b_address1;
    sc_out< sc_logic > prHat_bufB1b_ce1;
    sc_out< sc_logic > prHat_bufB1b_we1;
    sc_out< sc_lv<1> > prHat_bufB1b_d1;
    sc_out< sc_lv<11> > prHat_bufB1c_address1;
    sc_out< sc_logic > prHat_bufB1c_ce1;
    sc_out< sc_logic > prHat_bufB1c_we1;
    sc_out< sc_lv<1> > prHat_bufB1c_d1;
    sc_in< sc_lv<1> > bpest2;
    sc_out< sc_lv<11> > prHat_buf2_address1;
    sc_out< sc_logic > prHat_buf2_ce1;
    sc_out< sc_logic > prHat_buf2_we1;
    sc_out< sc_lv<1> > prHat_buf2_d1;
    sc_out< sc_lv<11> > prHat_bufA2_address1;
    sc_out< sc_logic > prHat_bufA2_ce1;
    sc_out< sc_logic > prHat_bufA2_we1;
    sc_out< sc_lv<1> > prHat_bufA2_d1;
    sc_out< sc_lv<11> > prHat_bufA2a_address1;
    sc_out< sc_logic > prHat_bufA2a_ce1;
    sc_out< sc_logic > prHat_bufA2a_we1;
    sc_out< sc_lv<1> > prHat_bufA2a_d1;
    sc_out< sc_lv<11> > prHat_bufA2b_address1;
    sc_out< sc_logic > prHat_bufA2b_ce1;
    sc_out< sc_logic > prHat_bufA2b_we1;
    sc_out< sc_lv<1> > prHat_bufA2b_d1;
    sc_out< sc_lv<11> > prHat_bufA2c_address1;
    sc_out< sc_logic > prHat_bufA2c_ce1;
    sc_out< sc_logic > prHat_bufA2c_we1;
    sc_out< sc_lv<1> > prHat_bufA2c_d1;
    sc_out< sc_lv<11> > prHat_bufB2_address1;
    sc_out< sc_logic > prHat_bufB2_ce1;
    sc_out< sc_logic > prHat_bufB2_we1;
    sc_out< sc_lv<1> > prHat_bufB2_d1;
    sc_in< sc_lv<1> > bpest3;
    sc_out< sc_lv<11> > prHat_buf3_address1;
    sc_out< sc_logic > prHat_buf3_ce1;
    sc_out< sc_logic > prHat_buf3_we1;
    sc_out< sc_lv<1> > prHat_buf3_d1;
    sc_out< sc_lv<11> > prHat_bufA3_address1;
    sc_out< sc_logic > prHat_bufA3_ce1;
    sc_out< sc_logic > prHat_bufA3_we1;
    sc_out< sc_lv<1> > prHat_bufA3_d1;
    sc_out< sc_lv<11> > prHat_bufB3_address1;
    sc_out< sc_logic > prHat_bufB3_ce1;
    sc_out< sc_logic > prHat_bufB3_we1;
    sc_out< sc_lv<1> > prHat_bufB3_d1;
    sc_out< sc_lv<11> > prHat_bufB3a_address1;
    sc_out< sc_logic > prHat_bufB3a_ce1;
    sc_out< sc_logic > prHat_bufB3a_we1;
    sc_out< sc_lv<1> > prHat_bufB3a_d1;
    sc_out< sc_lv<11> > prHat_bufB3b_address1;
    sc_out< sc_logic > prHat_bufB3b_ce1;
    sc_out< sc_logic > prHat_bufB3b_we1;
    sc_out< sc_lv<1> > prHat_bufB3b_d1;
    sc_out< sc_lv<11> > prHat_bufB3c_address1;
    sc_out< sc_logic > prHat_bufB3c_ce1;
    sc_out< sc_logic > prHat_bufB3c_we1;
    sc_out< sc_lv<1> > prHat_bufB3c_d1;
    sc_in< sc_lv<1> > bpest4;
    sc_out< sc_lv<11> > prHat_buf4_address1;
    sc_out< sc_logic > prHat_buf4_ce1;
    sc_out< sc_logic > prHat_buf4_we1;
    sc_out< sc_lv<1> > prHat_buf4_d1;
    sc_out< sc_lv<11> > prHat_buf4a_address1;
    sc_out< sc_logic > prHat_buf4a_ce1;
    sc_out< sc_logic > prHat_buf4a_we1;
    sc_out< sc_lv<1> > prHat_buf4a_d1;
    sc_out< sc_lv<11> > prHat_bufA4_address1;
    sc_out< sc_logic > prHat_bufA4_ce1;
    sc_out< sc_logic > prHat_bufA4_we1;
    sc_out< sc_lv<1> > prHat_bufA4_d1;
    sc_out< sc_lv<11> > prHat_bufA4a_address1;
    sc_out< sc_logic > prHat_bufA4a_ce1;
    sc_out< sc_logic > prHat_bufA4a_we1;
    sc_out< sc_lv<1> > prHat_bufA4a_d1;
    sc_out< sc_lv<11> > prHat_bufA4b_address1;
    sc_out< sc_logic > prHat_bufA4b_ce1;
    sc_out< sc_logic > prHat_bufA4b_we1;
    sc_out< sc_lv<1> > prHat_bufA4b_d1;
    sc_out< sc_lv<11> > prHat_bufB4_address1;
    sc_out< sc_logic > prHat_bufB4_ce1;
    sc_out< sc_logic > prHat_bufB4_we1;
    sc_out< sc_lv<1> > prHat_bufB4_d1;
    sc_in< sc_lv<1> > bpest5;
    sc_out< sc_lv<11> > prHat_bufA5_address1;
    sc_out< sc_logic > prHat_bufA5_ce1;
    sc_out< sc_logic > prHat_bufA5_we1;
    sc_out< sc_lv<1> > prHat_bufA5_d1;
    sc_out< sc_lv<11> > prHat_bufB5_address1;
    sc_out< sc_logic > prHat_bufB5_ce1;
    sc_out< sc_logic > prHat_bufB5_we1;
    sc_out< sc_lv<1> > prHat_bufB5_d1;
    sc_out< sc_lv<11> > prHat_bufB5a_address1;
    sc_out< sc_logic > prHat_bufB5a_ce1;
    sc_out< sc_logic > prHat_bufB5a_we1;
    sc_out< sc_lv<1> > prHat_bufB5a_d1;
    sc_out< sc_lv<11> > prHat_bufB5b_address1;
    sc_out< sc_logic > prHat_bufB5b_ce1;
    sc_out< sc_logic > prHat_bufB5b_we1;
    sc_out< sc_lv<1> > prHat_bufB5b_d1;
    sc_out< sc_lv<11> > prHat_bufB5c_address1;
    sc_out< sc_logic > prHat_bufB5c_ce1;
    sc_out< sc_logic > prHat_bufB5c_we1;
    sc_out< sc_lv<1> > prHat_bufB5c_d1;
    sc_in< sc_lv<1> > bpest6;
    sc_out< sc_lv<11> > prHat_buf6_address1;
    sc_out< sc_logic > prHat_buf6_ce1;
    sc_out< sc_logic > prHat_buf6_we1;
    sc_out< sc_lv<1> > prHat_buf6_d1;
    sc_out< sc_lv<11> > prHat_buf6a_address1;
    sc_out< sc_logic > prHat_buf6a_ce1;
    sc_out< sc_logic > prHat_buf6a_we1;
    sc_out< sc_lv<1> > prHat_buf6a_d1;
    sc_out< sc_lv<11> > prHat_bufA6_address1;
    sc_out< sc_logic > prHat_bufA6_ce1;
    sc_out< sc_logic > prHat_bufA6_we1;
    sc_out< sc_lv<1> > prHat_bufA6_d1;
    sc_out< sc_lv<11> > prHat_bufA6a_address1;
    sc_out< sc_logic > prHat_bufA6a_ce1;
    sc_out< sc_logic > prHat_bufA6a_we1;
    sc_out< sc_lv<1> > prHat_bufA6a_d1;
    sc_out< sc_lv<11> > prHat_bufA6b_address1;
    sc_out< sc_logic > prHat_bufA6b_ce1;
    sc_out< sc_logic > prHat_bufA6b_we1;
    sc_out< sc_lv<1> > prHat_bufA6b_d1;
    sc_out< sc_lv<11> > prHat_bufA6c_address1;
    sc_out< sc_logic > prHat_bufA6c_ce1;
    sc_out< sc_logic > prHat_bufA6c_we1;
    sc_out< sc_lv<1> > prHat_bufA6c_d1;
    sc_out< sc_lv<11> > prHat_bufB6_address1;
    sc_out< sc_logic > prHat_bufB6_ce1;
    sc_out< sc_logic > prHat_bufB6_we1;
    sc_out< sc_lv<1> > prHat_bufB6_d1;
    sc_in< sc_lv<1> > bpest7;
    sc_out< sc_lv<11> > prHat_bufA7_address1;
    sc_out< sc_logic > prHat_bufA7_ce1;
    sc_out< sc_logic > prHat_bufA7_we1;
    sc_out< sc_lv<1> > prHat_bufA7_d1;
    sc_out< sc_lv<11> > prHat_bufB7_address1;
    sc_out< sc_logic > prHat_bufB7_ce1;
    sc_out< sc_logic > prHat_bufB7_we1;
    sc_out< sc_lv<1> > prHat_bufB7_d1;
    sc_out< sc_lv<11> > prHat_bufB7a_address1;
    sc_out< sc_logic > prHat_bufB7a_ce1;
    sc_out< sc_logic > prHat_bufB7a_we1;
    sc_out< sc_lv<1> > prHat_bufB7a_d1;
    sc_in< sc_lv<1> > bpest8;
    sc_out< sc_lv<11> > prHat_buf8_address1;
    sc_out< sc_logic > prHat_buf8_ce1;
    sc_out< sc_logic > prHat_buf8_we1;
    sc_out< sc_lv<1> > prHat_buf8_d1;
    sc_in< sc_lv<1> > bpest9;
    sc_out< sc_lv<11> > prHat_bufA9_address1;
    sc_out< sc_logic > prHat_bufA9_ce1;
    sc_out< sc_logic > prHat_bufA9_we1;
    sc_out< sc_lv<1> > prHat_bufA9_d1;
    sc_out< sc_lv<11> > prHat_bufB9_address1;
    sc_out< sc_logic > prHat_bufB9_ce1;
    sc_out< sc_logic > prHat_bufB9_we1;
    sc_out< sc_lv<1> > prHat_bufB9_d1;
    sc_out< sc_lv<11> > prHat_bufB9a_address1;
    sc_out< sc_logic > prHat_bufB9a_ce1;
    sc_out< sc_logic > prHat_bufB9a_we1;
    sc_out< sc_lv<1> > prHat_bufB9a_d1;
    sc_in< sc_lv<1> > bpest10;
    sc_out< sc_lv<11> > prHat_buf10_address1;
    sc_out< sc_logic > prHat_buf10_ce1;
    sc_out< sc_logic > prHat_buf10_we1;
    sc_out< sc_lv<1> > prHat_buf10_d1;
    sc_out< sc_lv<11> > prHat_buf10a_address1;
    sc_out< sc_logic > prHat_buf10a_ce1;
    sc_out< sc_logic > prHat_buf10a_we1;
    sc_out< sc_lv<1> > prHat_buf10a_d1;
    sc_out< sc_lv<11> > prHat_bufA10_address1;
    sc_out< sc_logic > prHat_bufA10_ce1;
    sc_out< sc_logic > prHat_bufA10_we1;
    sc_out< sc_lv<1> > prHat_bufA10_d1;
    sc_out< sc_lv<11> > prHat_bufA10a_address1;
    sc_out< sc_logic > prHat_bufA10a_ce1;
    sc_out< sc_logic > prHat_bufA10a_we1;
    sc_out< sc_lv<1> > prHat_bufA10a_d1;
    sc_out< sc_lv<11> > prHat_bufA10b_address1;
    sc_out< sc_logic > prHat_bufA10b_ce1;
    sc_out< sc_logic > prHat_bufA10b_we1;
    sc_out< sc_lv<1> > prHat_bufA10b_d1;
    sc_out< sc_lv<11> > prHat_bufA10c_address1;
    sc_out< sc_logic > prHat_bufA10c_ce1;
    sc_out< sc_logic > prHat_bufA10c_we1;
    sc_out< sc_lv<1> > prHat_bufA10c_d1;
    sc_out< sc_lv<11> > prHat_buf10b_address1;
    sc_out< sc_logic > prHat_buf10b_ce1;
    sc_out< sc_logic > prHat_buf10b_we1;
    sc_out< sc_lv<1> > prHat_buf10b_d1;
    sc_out< sc_lv<11> > prHat_bufB10_address1;
    sc_out< sc_logic > prHat_bufB10_ce1;
    sc_out< sc_logic > prHat_bufB10_we1;
    sc_out< sc_lv<1> > prHat_bufB10_d1;


    // Module declarations
    update_hat_all(sc_module_name name);
    SC_HAS_PROCESS(update_hat_all);

    ~update_hat_all();

    sc_trace_file* mVcdFile;

    sc_signal< sc_lv<32> > tmp_fu_1025_p1;
    sc_signal< sc_lv<16> > pos_cast_fu_1011_p1;
    static const bool ap_const_boolean_1;
    static const sc_logic ap_const_logic_0;
    static const sc_logic ap_const_logic_1;
    // Thread declarations
    void thread_pos_cast_fu_1011_p1();
    void thread_prHat_buf10_address1();
    void thread_prHat_buf10_ce1();
    void thread_prHat_buf10_d1();
    void thread_prHat_buf10_we1();
    void thread_prHat_buf10a_address1();
    void thread_prHat_buf10a_ce1();
    void thread_prHat_buf10a_d1();
    void thread_prHat_buf10a_we1();
    void thread_prHat_buf10b_address1();
    void thread_prHat_buf10b_ce1();
    void thread_prHat_buf10b_d1();
    void thread_prHat_buf10b_we1();
    void thread_prHat_buf1_address1();
    void thread_prHat_buf1_ce1();
    void thread_prHat_buf1_d1();
    void thread_prHat_buf1_we1();
    void thread_prHat_buf2_address1();
    void thread_prHat_buf2_ce1();
    void thread_prHat_buf2_d1();
    void thread_prHat_buf2_we1();
    void thread_prHat_buf3_address1();
    void thread_prHat_buf3_ce1();
    void thread_prHat_buf3_d1();
    void thread_prHat_buf3_we1();
    void thread_prHat_buf4_address1();
    void thread_prHat_buf4_ce1();
    void thread_prHat_buf4_d1();
    void thread_prHat_buf4_we1();
    void thread_prHat_buf4a_address1();
    void thread_prHat_buf4a_ce1();
    void thread_prHat_buf4a_d1();
    void thread_prHat_buf4a_we1();
    void thread_prHat_buf6_address1();
    void thread_prHat_buf6_ce1();
    void thread_prHat_buf6_d1();
    void thread_prHat_buf6_we1();
    void thread_prHat_buf6a_address1();
    void thread_prHat_buf6a_ce1();
    void thread_prHat_buf6a_d1();
    void thread_prHat_buf6a_we1();
    void thread_prHat_buf8_address1();
    void thread_prHat_buf8_ce1();
    void thread_prHat_buf8_d1();
    void thread_prHat_buf8_we1();
    void thread_prHat_bufA10_address1();
    void thread_prHat_bufA10_ce1();
    void thread_prHat_bufA10_d1();
    void thread_prHat_bufA10_we1();
    void thread_prHat_bufA10a_address1();
    void thread_prHat_bufA10a_ce1();
    void thread_prHat_bufA10a_d1();
    void thread_prHat_bufA10a_we1();
    void thread_prHat_bufA10b_address1();
    void thread_prHat_bufA10b_ce1();
    void thread_prHat_bufA10b_d1();
    void thread_prHat_bufA10b_we1();
    void thread_prHat_bufA10c_address1();
    void thread_prHat_bufA10c_ce1();
    void thread_prHat_bufA10c_d1();
    void thread_prHat_bufA10c_we1();
    void thread_prHat_bufA1_address1();
    void thread_prHat_bufA1_ce1();
    void thread_prHat_bufA1_d1();
    void thread_prHat_bufA1_we1();
    void thread_prHat_bufA2_address1();
    void thread_prHat_bufA2_ce1();
    void thread_prHat_bufA2_d1();
    void thread_prHat_bufA2_we1();
    void thread_prHat_bufA2a_address1();
    void thread_prHat_bufA2a_ce1();
    void thread_prHat_bufA2a_d1();
    void thread_prHat_bufA2a_we1();
    void thread_prHat_bufA2b_address1();
    void thread_prHat_bufA2b_ce1();
    void thread_prHat_bufA2b_d1();
    void thread_prHat_bufA2b_we1();
    void thread_prHat_bufA2c_address1();
    void thread_prHat_bufA2c_ce1();
    void thread_prHat_bufA2c_d1();
    void thread_prHat_bufA2c_we1();
    void thread_prHat_bufA3_address1();
    void thread_prHat_bufA3_ce1();
    void thread_prHat_bufA3_d1();
    void thread_prHat_bufA3_we1();
    void thread_prHat_bufA4_address1();
    void thread_prHat_bufA4_ce1();
    void thread_prHat_bufA4_d1();
    void thread_prHat_bufA4_we1();
    void thread_prHat_bufA4a_address1();
    void thread_prHat_bufA4a_ce1();
    void thread_prHat_bufA4a_d1();
    void thread_prHat_bufA4a_we1();
    void thread_prHat_bufA4b_address1();
    void thread_prHat_bufA4b_ce1();
    void thread_prHat_bufA4b_d1();
    void thread_prHat_bufA4b_we1();
    void thread_prHat_bufA5_address1();
    void thread_prHat_bufA5_ce1();
    void thread_prHat_bufA5_d1();
    void thread_prHat_bufA5_we1();
    void thread_prHat_bufA6_address1();
    void thread_prHat_bufA6_ce1();
    void thread_prHat_bufA6_d1();
    void thread_prHat_bufA6_we1();
    void thread_prHat_bufA6a_address1();
    void thread_prHat_bufA6a_ce1();
    void thread_prHat_bufA6a_d1();
    void thread_prHat_bufA6a_we1();
    void thread_prHat_bufA6b_address1();
    void thread_prHat_bufA6b_ce1();
    void thread_prHat_bufA6b_d1();
    void thread_prHat_bufA6b_we1();
    void thread_prHat_bufA6c_address1();
    void thread_prHat_bufA6c_ce1();
    void thread_prHat_bufA6c_d1();
    void thread_prHat_bufA6c_we1();
    void thread_prHat_bufA7_address1();
    void thread_prHat_bufA7_ce1();
    void thread_prHat_bufA7_d1();
    void thread_prHat_bufA7_we1();
    void thread_prHat_bufA9_address1();
    void thread_prHat_bufA9_ce1();
    void thread_prHat_bufA9_d1();
    void thread_prHat_bufA9_we1();
    void thread_prHat_bufA_address1();
    void thread_prHat_bufA_ce1();
    void thread_prHat_bufA_d1();
    void thread_prHat_bufA_we1();
    void thread_prHat_bufAa_address1();
    void thread_prHat_bufAa_ce1();
    void thread_prHat_bufAa_d1();
    void thread_prHat_bufAa_we1();
    void thread_prHat_bufAb_address1();
    void thread_prHat_bufAb_ce1();
    void thread_prHat_bufAb_d1();
    void thread_prHat_bufAb_we1();
    void thread_prHat_bufAc_address1();
    void thread_prHat_bufAc_ce1();
    void thread_prHat_bufAc_d1();
    void thread_prHat_bufAc_we1();
    void thread_prHat_bufB10_address1();
    void thread_prHat_bufB10_ce1();
    void thread_prHat_bufB10_d1();
    void thread_prHat_bufB10_we1();
    void thread_prHat_bufB1_address1();
    void thread_prHat_bufB1_ce1();
    void thread_prHat_bufB1_d1();
    void thread_prHat_bufB1_we1();
    void thread_prHat_bufB1a_address1();
    void thread_prHat_bufB1a_ce1();
    void thread_prHat_bufB1a_d1();
    void thread_prHat_bufB1a_we1();
    void thread_prHat_bufB1b_address1();
    void thread_prHat_bufB1b_ce1();
    void thread_prHat_bufB1b_d1();
    void thread_prHat_bufB1b_we1();
    void thread_prHat_bufB1c_address1();
    void thread_prHat_bufB1c_ce1();
    void thread_prHat_bufB1c_d1();
    void thread_prHat_bufB1c_we1();
    void thread_prHat_bufB2_address1();
    void thread_prHat_bufB2_ce1();
    void thread_prHat_bufB2_d1();
    void thread_prHat_bufB2_we1();
    void thread_prHat_bufB3_address1();
    void thread_prHat_bufB3_ce1();
    void thread_prHat_bufB3_d1();
    void thread_prHat_bufB3_we1();
    void thread_prHat_bufB3a_address1();
    void thread_prHat_bufB3a_ce1();
    void thread_prHat_bufB3a_d1();
    void thread_prHat_bufB3a_we1();
    void thread_prHat_bufB3b_address1();
    void thread_prHat_bufB3b_ce1();
    void thread_prHat_bufB3b_d1();
    void thread_prHat_bufB3b_we1();
    void thread_prHat_bufB3c_address1();
    void thread_prHat_bufB3c_ce1();
    void thread_prHat_bufB3c_d1();
    void thread_prHat_bufB3c_we1();
    void thread_prHat_bufB4_address1();
    void thread_prHat_bufB4_ce1();
    void thread_prHat_bufB4_d1();
    void thread_prHat_bufB4_we1();
    void thread_prHat_bufB5_address1();
    void thread_prHat_bufB5_ce1();
    void thread_prHat_bufB5_d1();
    void thread_prHat_bufB5_we1();
    void thread_prHat_bufB5a_address1();
    void thread_prHat_bufB5a_ce1();
    void thread_prHat_bufB5a_d1();
    void thread_prHat_bufB5a_we1();
    void thread_prHat_bufB5b_address1();
    void thread_prHat_bufB5b_ce1();
    void thread_prHat_bufB5b_d1();
    void thread_prHat_bufB5b_we1();
    void thread_prHat_bufB5c_address1();
    void thread_prHat_bufB5c_ce1();
    void thread_prHat_bufB5c_d1();
    void thread_prHat_bufB5c_we1();
    void thread_prHat_bufB6_address1();
    void thread_prHat_bufB6_ce1();
    void thread_prHat_bufB6_d1();
    void thread_prHat_bufB6_we1();
    void thread_prHat_bufB7_address1();
    void thread_prHat_bufB7_ce1();
    void thread_prHat_bufB7_d1();
    void thread_prHat_bufB7_we1();
    void thread_prHat_bufB7a_address1();
    void thread_prHat_bufB7a_ce1();
    void thread_prHat_bufB7a_d1();
    void thread_prHat_bufB7a_we1();
    void thread_prHat_bufB9_address1();
    void thread_prHat_bufB9_ce1();
    void thread_prHat_bufB9_d1();
    void thread_prHat_bufB9_we1();
    void thread_prHat_bufB9a_address1();
    void thread_prHat_bufB9a_ce1();
    void thread_prHat_bufB9a_d1();
    void thread_prHat_bufB9a_we1();
    void thread_prHat_bufB_address1();
    void thread_prHat_bufB_ce1();
    void thread_prHat_bufB_d1();
    void thread_prHat_bufB_we1();
    void thread_prHat_buf_address1();
    void thread_prHat_buf_ce1();
    void thread_prHat_buf_d1();
    void thread_prHat_buf_we1();
    void thread_tmp_fu_1025_p1();
};

}

using namespace ap_rtl;

#endif
