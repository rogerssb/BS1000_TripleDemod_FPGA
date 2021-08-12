#include "mcalcAA.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

void mcalcAA::thread_tmp_916_fu_4709_p1() {
    tmp_916_fu_4709_p1 = esl_zext<32,9>(r18B2_fu_4284_p3.read());
}

void mcalcAA::thread_tmp_917_fu_4714_p1() {
    tmp_917_fu_4714_p1 = esl_sext<32,16>(num_ntB_read_reg_7927.read());
}

void mcalcAA::thread_tmp_918_fu_5584_p2() {
    tmp_918_fu_5584_p2 = (!nIterationCounter.read().is_01() || !ap_const_lv16_0.is_01())? sc_lv<1>(): sc_lv<1>(nIterationCounter.read() == ap_const_lv16_0);
}

void mcalcAA::thread_tmp_954_fu_2108_p1() {
    tmp_954_fu_2108_p1 = varinx3_1024_45_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_955_fu_2144_p1() {
    tmp_955_fu_2144_p1 = varinx3_1024_45_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_956_fu_2180_p1() {
    tmp_956_fu_2180_p1 = varinx18A_1024_a_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_957_fu_2216_p1() {
    tmp_957_fu_2216_p1 = varinx18A_1024_b_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_958_fu_2252_p1() {
    tmp_958_fu_2252_p1 = varinx18A_1024_c_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_959_fu_2274_p4() {
    tmp_959_fu_2274_p4 = varinx18A_1024_c_q0.read().range(19, 14);
}

void mcalcAA::thread_tmp_960_fu_2288_p1() {
    tmp_960_fu_2288_p1 = varinx18A_1024_d_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_961_fu_2324_p1() {
    tmp_961_fu_2324_p1 = varinx18A_1024_e_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_962_fu_2360_p1() {
    tmp_962_fu_2360_p1 = varinx18A_1024_f_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_963_fu_2396_p1() {
    tmp_963_fu_2396_p1 = varinx18A_1024_a_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_964_fu_2432_p1() {
    tmp_964_fu_2432_p1 = varinx18A_1024_b_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_965_fu_2468_p1() {
    tmp_965_fu_2468_p1 = varinx18A_1024_c_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_966_fu_2490_p4() {
    tmp_966_fu_2490_p4 = varinx18A_1024_c_q1.read().range(19, 14);
}

void mcalcAA::thread_tmp_967_fu_2504_p1() {
    tmp_967_fu_2504_p1 = varinx18A_1024_d_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_968_fu_2540_p1() {
    tmp_968_fu_2540_p1 = varinx18A_1024_e_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_969_fu_2576_p1() {
    tmp_969_fu_2576_p1 = varinx18A_1024_f_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_970_fu_2612_p1() {
    tmp_970_fu_2612_p1 = varinx18B_1024_a_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_971_fu_2648_p1() {
    tmp_971_fu_2648_p1 = varinx18B_1024_b_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_972_fu_2670_p4() {
    tmp_972_fu_2670_p4 = varinx18B_1024_b_q0.read().range(19, 14);
}

void mcalcAA::thread_tmp_973_fu_2684_p1() {
    tmp_973_fu_2684_p1 = varinx18B_1024_c_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_974_fu_2720_p1() {
    tmp_974_fu_2720_p1 = varinx18B_1024_d_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_975_fu_2756_p1() {
    tmp_975_fu_2756_p1 = varinx18B_1024_e_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_976_fu_2792_p1() {
    tmp_976_fu_2792_p1 = varinx18B_1024_f_q0.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_977_fu_2828_p1() {
    tmp_977_fu_2828_p1 = varinx18B_1024_a_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_978_fu_2864_p1() {
    tmp_978_fu_2864_p1 = varinx18B_1024_b_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_979_fu_2886_p4() {
    tmp_979_fu_2886_p4 = varinx18B_1024_b_q1.read().range(19, 14);
}

void mcalcAA::thread_tmp_980_fu_2900_p1() {
    tmp_980_fu_2900_p1 = varinx18B_1024_c_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_981_fu_2936_p1() {
    tmp_981_fu_2936_p1 = varinx18B_1024_d_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_982_fu_2972_p1() {
    tmp_982_fu_2972_p1 = varinx18B_1024_e_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_983_fu_3008_p1() {
    tmp_983_fu_3008_p1 = varinx18B_1024_f_q1.read().range(7-1, 0);
}

void mcalcAA::thread_tmp_984_fu_3044_p1() {
    tmp_984_fu_3044_p1 = varinx3_4096_45_q0.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_985_fu_3068_p1() {
    tmp_985_fu_3068_p1 = varinx3_4096_45_q1.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_986_fu_3092_p1() {
    tmp_986_fu_3092_p1 = varinx18A_4096_a_q0.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_987_fu_3116_p1() {
    tmp_987_fu_3116_p1 = varinx18A_4096_b_q0.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_988_fu_3140_p1() {
    tmp_988_fu_3140_p1 = varinx18A_4096_c_q0.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_989_fu_3164_p1() {
    tmp_989_fu_3164_p1 = varinx18A_4096_d_q0.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_990_fu_3188_p1() {
    tmp_990_fu_3188_p1 = varinx18A_4096_e_q0.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_991_fu_3212_p1() {
    tmp_991_fu_3212_p1 = varinx18A_4096_f_q0.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_992_fu_3236_p1() {
    tmp_992_fu_3236_p1 = varinx18A_4096_a_q1.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_993_fu_3260_p1() {
    tmp_993_fu_3260_p1 = varinx18A_4096_b_q1.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_994_fu_3284_p1() {
    tmp_994_fu_3284_p1 = varinx18A_4096_c_q1.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_995_fu_3308_p1() {
    tmp_995_fu_3308_p1 = varinx18A_4096_d_q1.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_996_fu_3332_p1() {
    tmp_996_fu_3332_p1 = varinx18A_4096_e_q1.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_997_fu_3356_p1() {
    tmp_997_fu_3356_p1 = varinx18A_4096_f_q1.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_998_fu_3380_p1() {
    tmp_998_fu_3380_p1 = varinx18B_4096_a_q0.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_999_fu_3404_p1() {
    tmp_999_fu_3404_p1 = varinx18B_4096_b_q0.read().range(9-1, 0);
}

void mcalcAA::thread_tmp_fu_2102_p2() {
    tmp_fu_2102_p2 = (!numb.read().is_01() || !ap_const_lv16_500.is_01())? sc_lv<1>(): sc_lv<1>(numb.read() == ap_const_lv16_500);
}

void mcalcAA::thread_tmp_s_fu_2037_p1() {
    tmp_s_fu_2037_p1 = esl_sext<32,16>(num_nt.read());
}

void mcalcAA::thread_varinx18A_1024_a_address0() {
    varinx18A_1024_a_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18A_1024_a_address1() {
    varinx18A_1024_a_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18A_1024_a_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_1024_a_ce0 = ap_const_logic_1;
    } else {
        varinx18A_1024_a_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_1024_a_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_1024_a_ce1 = ap_const_logic_1;
    } else {
        varinx18A_1024_a_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_1024_a_inx_5_fu_2188_p4() {
    varinx18A_1024_a_inx_5_fu_2188_p4 = varinx18A_1024_a_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx18A_1024_a_inx_6_fu_2202_p4() {
    varinx18A_1024_a_inx_6_fu_2202_p4 = varinx18A_1024_a_q0.read().range(20, 14);
}

void mcalcAA::thread_varinx18A_1024_a_inx_8_fu_2404_p4() {
    varinx18A_1024_a_inx_8_fu_2404_p4 = varinx18A_1024_a_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx18A_1024_a_inx_9_fu_2418_p4() {
    varinx18A_1024_a_inx_9_fu_2418_p4 = varinx18A_1024_a_q1.read().range(20, 14);
}

void mcalcAA::thread_varinx18A_1024_b_address0() {
    varinx18A_1024_b_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18A_1024_b_address1() {
    varinx18A_1024_b_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18A_1024_b_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_1024_b_ce0 = ap_const_logic_1;
    } else {
        varinx18A_1024_b_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_1024_b_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_1024_b_ce1 = ap_const_logic_1;
    } else {
        varinx18A_1024_b_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_1024_b_inx_5_fu_2224_p4() {
    varinx18A_1024_b_inx_5_fu_2224_p4 = varinx18A_1024_b_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx18A_1024_b_inx_6_fu_2238_p4() {
    varinx18A_1024_b_inx_6_fu_2238_p4 = varinx18A_1024_b_q0.read().range(20, 14);
}

void mcalcAA::thread_varinx18A_1024_b_inx_8_fu_2440_p4() {
    varinx18A_1024_b_inx_8_fu_2440_p4 = varinx18A_1024_b_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx18A_1024_b_inx_9_fu_2454_p4() {
    varinx18A_1024_b_inx_9_fu_2454_p4 = varinx18A_1024_b_q1.read().range(20, 14);
}

void mcalcAA::thread_varinx18A_1024_c_address0() {
    varinx18A_1024_c_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18A_1024_c_address1() {
    varinx18A_1024_c_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18A_1024_c_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_1024_c_ce0 = ap_const_logic_1;
    } else {
        varinx18A_1024_c_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_1024_c_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_1024_c_ce1 = ap_const_logic_1;
    } else {
        varinx18A_1024_c_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_1024_c_inx_5_fu_2260_p4() {
    varinx18A_1024_c_inx_5_fu_2260_p4 = varinx18A_1024_c_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx18A_1024_c_inx_7_fu_2476_p4() {
    varinx18A_1024_c_inx_7_fu_2476_p4 = varinx18A_1024_c_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx18A_1024_d_address0() {
    varinx18A_1024_d_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18A_1024_d_address1() {
    varinx18A_1024_d_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18A_1024_d_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_1024_d_ce0 = ap_const_logic_1;
    } else {
        varinx18A_1024_d_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_1024_d_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_1024_d_ce1 = ap_const_logic_1;
    } else {
        varinx18A_1024_d_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_1024_d_inx_5_fu_2296_p4() {
    varinx18A_1024_d_inx_5_fu_2296_p4 = varinx18A_1024_d_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx18A_1024_d_inx_6_fu_2310_p4() {
    varinx18A_1024_d_inx_6_fu_2310_p4 = varinx18A_1024_d_q0.read().range(20, 14);
}

void mcalcAA::thread_varinx18A_1024_d_inx_8_fu_2512_p4() {
    varinx18A_1024_d_inx_8_fu_2512_p4 = varinx18A_1024_d_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx18A_1024_d_inx_9_fu_2526_p4() {
    varinx18A_1024_d_inx_9_fu_2526_p4 = varinx18A_1024_d_q1.read().range(20, 14);
}

void mcalcAA::thread_varinx18A_1024_e_address0() {
    varinx18A_1024_e_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18A_1024_e_address1() {
    varinx18A_1024_e_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18A_1024_e_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_1024_e_ce0 = ap_const_logic_1;
    } else {
        varinx18A_1024_e_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_1024_e_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_1024_e_ce1 = ap_const_logic_1;
    } else {
        varinx18A_1024_e_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_1024_e_inx_5_fu_2332_p4() {
    varinx18A_1024_e_inx_5_fu_2332_p4 = varinx18A_1024_e_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx18A_1024_e_inx_6_fu_2346_p4() {
    varinx18A_1024_e_inx_6_fu_2346_p4 = varinx18A_1024_e_q0.read().range(20, 14);
}

void mcalcAA::thread_varinx18A_1024_e_inx_8_fu_2548_p4() {
    varinx18A_1024_e_inx_8_fu_2548_p4 = varinx18A_1024_e_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx18A_1024_e_inx_9_fu_2562_p4() {
    varinx18A_1024_e_inx_9_fu_2562_p4 = varinx18A_1024_e_q1.read().range(20, 14);
}

void mcalcAA::thread_varinx18A_1024_f_address0() {
    varinx18A_1024_f_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18A_1024_f_address1() {
    varinx18A_1024_f_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18A_1024_f_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_1024_f_ce0 = ap_const_logic_1;
    } else {
        varinx18A_1024_f_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_1024_f_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_1024_f_ce1 = ap_const_logic_1;
    } else {
        varinx18A_1024_f_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_1024_f_inx_5_fu_2368_p4() {
    varinx18A_1024_f_inx_5_fu_2368_p4 = varinx18A_1024_f_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx18A_1024_f_inx_6_fu_2382_p4() {
    varinx18A_1024_f_inx_6_fu_2382_p4 = varinx18A_1024_f_q0.read().range(20, 14);
}

void mcalcAA::thread_varinx18A_1024_f_inx_8_fu_2584_p4() {
    varinx18A_1024_f_inx_8_fu_2584_p4 = varinx18A_1024_f_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx18A_1024_f_inx_9_fu_2598_p4() {
    varinx18A_1024_f_inx_9_fu_2598_p4 = varinx18A_1024_f_q1.read().range(20, 14);
}

void mcalcAA::thread_varinx18A_4096_a_address0() {
    varinx18A_4096_a_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18A_4096_a_address1() {
    varinx18A_4096_a_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18A_4096_a_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_4096_a_ce0 = ap_const_logic_1;
    } else {
        varinx18A_4096_a_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_4096_a_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_4096_a_ce1 = ap_const_logic_1;
    } else {
        varinx18A_4096_a_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_4096_a_inx_5_fu_3096_p4() {
    varinx18A_4096_a_inx_5_fu_3096_p4 = varinx18A_4096_a_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx18A_4096_a_inx_6_fu_3106_p4() {
    varinx18A_4096_a_inx_6_fu_3106_p4 = varinx18A_4096_a_q0.read().range(26, 18);
}

void mcalcAA::thread_varinx18A_4096_a_inx_8_fu_3240_p4() {
    varinx18A_4096_a_inx_8_fu_3240_p4 = varinx18A_4096_a_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx18A_4096_a_inx_9_fu_3250_p4() {
    varinx18A_4096_a_inx_9_fu_3250_p4 = varinx18A_4096_a_q1.read().range(26, 18);
}

void mcalcAA::thread_varinx18A_4096_b_address0() {
    varinx18A_4096_b_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18A_4096_b_address1() {
    varinx18A_4096_b_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18A_4096_b_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_4096_b_ce0 = ap_const_logic_1;
    } else {
        varinx18A_4096_b_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_4096_b_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_4096_b_ce1 = ap_const_logic_1;
    } else {
        varinx18A_4096_b_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_4096_b_inx_5_fu_3120_p4() {
    varinx18A_4096_b_inx_5_fu_3120_p4 = varinx18A_4096_b_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx18A_4096_b_inx_6_fu_3130_p4() {
    varinx18A_4096_b_inx_6_fu_3130_p4 = varinx18A_4096_b_q0.read().range(26, 18);
}

void mcalcAA::thread_varinx18A_4096_b_inx_8_fu_3264_p4() {
    varinx18A_4096_b_inx_8_fu_3264_p4 = varinx18A_4096_b_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx18A_4096_b_inx_9_fu_3274_p4() {
    varinx18A_4096_b_inx_9_fu_3274_p4 = varinx18A_4096_b_q1.read().range(26, 18);
}

void mcalcAA::thread_varinx18A_4096_c_address0() {
    varinx18A_4096_c_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18A_4096_c_address1() {
    varinx18A_4096_c_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18A_4096_c_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_4096_c_ce0 = ap_const_logic_1;
    } else {
        varinx18A_4096_c_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_4096_c_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_4096_c_ce1 = ap_const_logic_1;
    } else {
        varinx18A_4096_c_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_4096_c_inx_5_fu_3144_p4() {
    varinx18A_4096_c_inx_5_fu_3144_p4 = varinx18A_4096_c_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx18A_4096_c_inx_8_fu_3288_p4() {
    varinx18A_4096_c_inx_8_fu_3288_p4 = varinx18A_4096_c_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx18A_4096_d_address0() {
    varinx18A_4096_d_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18A_4096_d_address1() {
    varinx18A_4096_d_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18A_4096_d_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_4096_d_ce0 = ap_const_logic_1;
    } else {
        varinx18A_4096_d_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_4096_d_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_4096_d_ce1 = ap_const_logic_1;
    } else {
        varinx18A_4096_d_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_4096_d_inx_5_fu_3168_p4() {
    varinx18A_4096_d_inx_5_fu_3168_p4 = varinx18A_4096_d_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx18A_4096_d_inx_6_fu_3178_p4() {
    varinx18A_4096_d_inx_6_fu_3178_p4 = varinx18A_4096_d_q0.read().range(26, 18);
}

void mcalcAA::thread_varinx18A_4096_d_inx_8_fu_3312_p4() {
    varinx18A_4096_d_inx_8_fu_3312_p4 = varinx18A_4096_d_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx18A_4096_d_inx_9_fu_3322_p4() {
    varinx18A_4096_d_inx_9_fu_3322_p4 = varinx18A_4096_d_q1.read().range(26, 18);
}

void mcalcAA::thread_varinx18A_4096_e_address0() {
    varinx18A_4096_e_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18A_4096_e_address1() {
    varinx18A_4096_e_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18A_4096_e_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_4096_e_ce0 = ap_const_logic_1;
    } else {
        varinx18A_4096_e_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_4096_e_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_4096_e_ce1 = ap_const_logic_1;
    } else {
        varinx18A_4096_e_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_4096_e_inx_5_fu_3192_p4() {
    varinx18A_4096_e_inx_5_fu_3192_p4 = varinx18A_4096_e_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx18A_4096_e_inx_6_fu_3202_p4() {
    varinx18A_4096_e_inx_6_fu_3202_p4 = varinx18A_4096_e_q0.read().range(26, 18);
}

void mcalcAA::thread_varinx18A_4096_e_inx_8_fu_3336_p4() {
    varinx18A_4096_e_inx_8_fu_3336_p4 = varinx18A_4096_e_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx18A_4096_e_inx_9_fu_3346_p4() {
    varinx18A_4096_e_inx_9_fu_3346_p4 = varinx18A_4096_e_q1.read().range(26, 18);
}

void mcalcAA::thread_varinx18A_4096_f_address0() {
    varinx18A_4096_f_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18A_4096_f_address1() {
    varinx18A_4096_f_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18A_4096_f_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_4096_f_ce0 = ap_const_logic_1;
    } else {
        varinx18A_4096_f_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_4096_f_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18A_4096_f_ce1 = ap_const_logic_1;
    } else {
        varinx18A_4096_f_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18A_4096_f_inx_5_fu_3216_p4() {
    varinx18A_4096_f_inx_5_fu_3216_p4 = varinx18A_4096_f_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx18A_4096_f_inx_6_fu_3226_p4() {
    varinx18A_4096_f_inx_6_fu_3226_p4 = varinx18A_4096_f_q0.read().range(26, 18);
}

void mcalcAA::thread_varinx18A_4096_f_inx_8_fu_3360_p4() {
    varinx18A_4096_f_inx_8_fu_3360_p4 = varinx18A_4096_f_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx18A_4096_f_inx_9_fu_3370_p4() {
    varinx18A_4096_f_inx_9_fu_3370_p4 = varinx18A_4096_f_q1.read().range(26, 18);
}

void mcalcAA::thread_varinx18B_1024_a_address0() {
    varinx18B_1024_a_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18B_1024_a_address1() {
    varinx18B_1024_a_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18B_1024_a_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_1024_a_ce0 = ap_const_logic_1;
    } else {
        varinx18B_1024_a_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_1024_a_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_1024_a_ce1 = ap_const_logic_1;
    } else {
        varinx18B_1024_a_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_1024_a_inx_5_fu_2620_p4() {
    varinx18B_1024_a_inx_5_fu_2620_p4 = varinx18B_1024_a_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx18B_1024_a_inx_6_fu_2634_p4() {
    varinx18B_1024_a_inx_6_fu_2634_p4 = varinx18B_1024_a_q0.read().range(20, 14);
}

void mcalcAA::thread_varinx18B_1024_a_inx_8_fu_2836_p4() {
    varinx18B_1024_a_inx_8_fu_2836_p4 = varinx18B_1024_a_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx18B_1024_a_inx_9_fu_2850_p4() {
    varinx18B_1024_a_inx_9_fu_2850_p4 = varinx18B_1024_a_q1.read().range(20, 14);
}

void mcalcAA::thread_varinx18B_1024_b_address0() {
    varinx18B_1024_b_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18B_1024_b_address1() {
    varinx18B_1024_b_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18B_1024_b_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_1024_b_ce0 = ap_const_logic_1;
    } else {
        varinx18B_1024_b_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_1024_b_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_1024_b_ce1 = ap_const_logic_1;
    } else {
        varinx18B_1024_b_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_1024_b_inx_5_fu_2656_p4() {
    varinx18B_1024_b_inx_5_fu_2656_p4 = varinx18B_1024_b_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx18B_1024_b_inx_7_fu_2872_p4() {
    varinx18B_1024_b_inx_7_fu_2872_p4 = varinx18B_1024_b_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx18B_1024_c_address0() {
    varinx18B_1024_c_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18B_1024_c_address1() {
    varinx18B_1024_c_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18B_1024_c_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_1024_c_ce0 = ap_const_logic_1;
    } else {
        varinx18B_1024_c_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_1024_c_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_1024_c_ce1 = ap_const_logic_1;
    } else {
        varinx18B_1024_c_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_1024_c_inx_5_fu_2692_p4() {
    varinx18B_1024_c_inx_5_fu_2692_p4 = varinx18B_1024_c_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx18B_1024_c_inx_6_fu_2706_p4() {
    varinx18B_1024_c_inx_6_fu_2706_p4 = varinx18B_1024_c_q0.read().range(20, 14);
}

void mcalcAA::thread_varinx18B_1024_c_inx_8_fu_2908_p4() {
    varinx18B_1024_c_inx_8_fu_2908_p4 = varinx18B_1024_c_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx18B_1024_c_inx_9_fu_2922_p4() {
    varinx18B_1024_c_inx_9_fu_2922_p4 = varinx18B_1024_c_q1.read().range(20, 14);
}

void mcalcAA::thread_varinx18B_1024_d_address0() {
    varinx18B_1024_d_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18B_1024_d_address1() {
    varinx18B_1024_d_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18B_1024_d_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_1024_d_ce0 = ap_const_logic_1;
    } else {
        varinx18B_1024_d_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_1024_d_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_1024_d_ce1 = ap_const_logic_1;
    } else {
        varinx18B_1024_d_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_1024_d_inx_5_fu_2728_p4() {
    varinx18B_1024_d_inx_5_fu_2728_p4 = varinx18B_1024_d_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx18B_1024_d_inx_6_fu_2742_p4() {
    varinx18B_1024_d_inx_6_fu_2742_p4 = varinx18B_1024_d_q0.read().range(20, 14);
}

void mcalcAA::thread_varinx18B_1024_d_inx_8_fu_2944_p4() {
    varinx18B_1024_d_inx_8_fu_2944_p4 = varinx18B_1024_d_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx18B_1024_d_inx_9_fu_2958_p4() {
    varinx18B_1024_d_inx_9_fu_2958_p4 = varinx18B_1024_d_q1.read().range(20, 14);
}

void mcalcAA::thread_varinx18B_1024_e_address0() {
    varinx18B_1024_e_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18B_1024_e_address1() {
    varinx18B_1024_e_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18B_1024_e_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_1024_e_ce0 = ap_const_logic_1;
    } else {
        varinx18B_1024_e_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_1024_e_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_1024_e_ce1 = ap_const_logic_1;
    } else {
        varinx18B_1024_e_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_1024_e_inx_5_fu_2764_p4() {
    varinx18B_1024_e_inx_5_fu_2764_p4 = varinx18B_1024_e_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx18B_1024_e_inx_6_fu_2778_p4() {
    varinx18B_1024_e_inx_6_fu_2778_p4 = varinx18B_1024_e_q0.read().range(20, 14);
}

void mcalcAA::thread_varinx18B_1024_e_inx_8_fu_2980_p4() {
    varinx18B_1024_e_inx_8_fu_2980_p4 = varinx18B_1024_e_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx18B_1024_e_inx_9_fu_2994_p4() {
    varinx18B_1024_e_inx_9_fu_2994_p4 = varinx18B_1024_e_q1.read().range(20, 14);
}

void mcalcAA::thread_varinx18B_1024_f_address0() {
    varinx18B_1024_f_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18B_1024_f_address1() {
    varinx18B_1024_f_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18B_1024_f_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_1024_f_ce0 = ap_const_logic_1;
    } else {
        varinx18B_1024_f_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_1024_f_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_1024_f_ce1 = ap_const_logic_1;
    } else {
        varinx18B_1024_f_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_1024_f_inx_5_fu_2800_p4() {
    varinx18B_1024_f_inx_5_fu_2800_p4 = varinx18B_1024_f_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx18B_1024_f_inx_6_fu_2814_p4() {
    varinx18B_1024_f_inx_6_fu_2814_p4 = varinx18B_1024_f_q0.read().range(20, 14);
}

void mcalcAA::thread_varinx18B_1024_f_inx_8_fu_3016_p4() {
    varinx18B_1024_f_inx_8_fu_3016_p4 = varinx18B_1024_f_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx18B_1024_f_inx_9_fu_3030_p4() {
    varinx18B_1024_f_inx_9_fu_3030_p4 = varinx18B_1024_f_q1.read().range(20, 14);
}

void mcalcAA::thread_varinx18B_4096_a_address0() {
    varinx18B_4096_a_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18B_4096_a_address1() {
    varinx18B_4096_a_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18B_4096_a_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_4096_a_ce0 = ap_const_logic_1;
    } else {
        varinx18B_4096_a_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_4096_a_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_4096_a_ce1 = ap_const_logic_1;
    } else {
        varinx18B_4096_a_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_4096_a_inx_5_fu_3384_p4() {
    varinx18B_4096_a_inx_5_fu_3384_p4 = varinx18B_4096_a_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx18B_4096_a_inx_6_fu_3394_p4() {
    varinx18B_4096_a_inx_6_fu_3394_p4 = varinx18B_4096_a_q0.read().range(26, 18);
}

void mcalcAA::thread_varinx18B_4096_a_inx_8_fu_3528_p4() {
    varinx18B_4096_a_inx_8_fu_3528_p4 = varinx18B_4096_a_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx18B_4096_a_inx_9_fu_3538_p4() {
    varinx18B_4096_a_inx_9_fu_3538_p4 = varinx18B_4096_a_q1.read().range(26, 18);
}

void mcalcAA::thread_varinx18B_4096_b_address0() {
    varinx18B_4096_b_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18B_4096_b_address1() {
    varinx18B_4096_b_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18B_4096_b_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_4096_b_ce0 = ap_const_logic_1;
    } else {
        varinx18B_4096_b_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_4096_b_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_4096_b_ce1 = ap_const_logic_1;
    } else {
        varinx18B_4096_b_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_4096_b_inx_5_fu_3408_p4() {
    varinx18B_4096_b_inx_5_fu_3408_p4 = varinx18B_4096_b_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx18B_4096_b_inx_8_fu_3552_p4() {
    varinx18B_4096_b_inx_8_fu_3552_p4 = varinx18B_4096_b_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx18B_4096_c_address0() {
    varinx18B_4096_c_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18B_4096_c_address1() {
    varinx18B_4096_c_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18B_4096_c_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_4096_c_ce0 = ap_const_logic_1;
    } else {
        varinx18B_4096_c_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_4096_c_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_4096_c_ce1 = ap_const_logic_1;
    } else {
        varinx18B_4096_c_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_4096_c_inx_5_fu_3432_p4() {
    varinx18B_4096_c_inx_5_fu_3432_p4 = varinx18B_4096_c_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx18B_4096_c_inx_6_fu_3442_p4() {
    varinx18B_4096_c_inx_6_fu_3442_p4 = varinx18B_4096_c_q0.read().range(26, 18);
}

void mcalcAA::thread_varinx18B_4096_c_inx_8_fu_3576_p4() {
    varinx18B_4096_c_inx_8_fu_3576_p4 = varinx18B_4096_c_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx18B_4096_c_inx_9_fu_3586_p4() {
    varinx18B_4096_c_inx_9_fu_3586_p4 = varinx18B_4096_c_q1.read().range(26, 18);
}

void mcalcAA::thread_varinx18B_4096_d_address0() {
    varinx18B_4096_d_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18B_4096_d_address1() {
    varinx18B_4096_d_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18B_4096_d_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_4096_d_ce0 = ap_const_logic_1;
    } else {
        varinx18B_4096_d_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_4096_d_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_4096_d_ce1 = ap_const_logic_1;
    } else {
        varinx18B_4096_d_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_4096_d_inx_5_fu_3456_p4() {
    varinx18B_4096_d_inx_5_fu_3456_p4 = varinx18B_4096_d_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx18B_4096_d_inx_6_fu_3466_p4() {
    varinx18B_4096_d_inx_6_fu_3466_p4 = varinx18B_4096_d_q0.read().range(26, 18);
}

void mcalcAA::thread_varinx18B_4096_d_inx_8_fu_3600_p4() {
    varinx18B_4096_d_inx_8_fu_3600_p4 = varinx18B_4096_d_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx18B_4096_d_inx_9_fu_3610_p4() {
    varinx18B_4096_d_inx_9_fu_3610_p4 = varinx18B_4096_d_q1.read().range(26, 18);
}

void mcalcAA::thread_varinx18B_4096_e_address0() {
    varinx18B_4096_e_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18B_4096_e_address1() {
    varinx18B_4096_e_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18B_4096_e_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_4096_e_ce0 = ap_const_logic_1;
    } else {
        varinx18B_4096_e_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_4096_e_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_4096_e_ce1 = ap_const_logic_1;
    } else {
        varinx18B_4096_e_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_4096_e_inx_5_fu_3480_p4() {
    varinx18B_4096_e_inx_5_fu_3480_p4 = varinx18B_4096_e_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx18B_4096_e_inx_6_fu_3490_p4() {
    varinx18B_4096_e_inx_6_fu_3490_p4 = varinx18B_4096_e_q0.read().range(26, 18);
}

void mcalcAA::thread_varinx18B_4096_e_inx_8_fu_3624_p4() {
    varinx18B_4096_e_inx_8_fu_3624_p4 = varinx18B_4096_e_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx18B_4096_e_inx_9_fu_3634_p4() {
    varinx18B_4096_e_inx_9_fu_3634_p4 = varinx18B_4096_e_q1.read().range(26, 18);
}

void mcalcAA::thread_varinx18B_4096_f_address0() {
    varinx18B_4096_f_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx18B_4096_f_address1() {
    varinx18B_4096_f_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx18B_4096_f_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_4096_f_ce0 = ap_const_logic_1;
    } else {
        varinx18B_4096_f_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_4096_f_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx18B_4096_f_ce1 = ap_const_logic_1;
    } else {
        varinx18B_4096_f_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx18B_4096_f_inx_5_fu_3504_p4() {
    varinx18B_4096_f_inx_5_fu_3504_p4 = varinx18B_4096_f_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx18B_4096_f_inx_6_fu_3514_p4() {
    varinx18B_4096_f_inx_6_fu_3514_p4 = varinx18B_4096_f_q0.read().range(26, 18);
}

void mcalcAA::thread_varinx18B_4096_f_inx_8_fu_3648_p4() {
    varinx18B_4096_f_inx_8_fu_3648_p4 = varinx18B_4096_f_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx18B_4096_f_inx_9_fu_3658_p4() {
    varinx18B_4096_f_inx_9_fu_3658_p4 = varinx18B_4096_f_q1.read().range(26, 18);
}

void mcalcAA::thread_varinx3_1024_45_address0() {
    varinx3_1024_45_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx3_1024_45_address1() {
    varinx3_1024_45_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx3_1024_45_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx3_1024_45_ce0 = ap_const_logic_1;
    } else {
        varinx3_1024_45_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx3_1024_45_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx3_1024_45_ce1 = ap_const_logic_1;
    } else {
        varinx3_1024_45_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx3_1024_45_inx2_1_1_fu_2116_p4() {
    varinx3_1024_45_inx2_1_1_fu_2116_p4 = varinx3_1024_45_q0.read().range(13, 7);
}

void mcalcAA::thread_varinx3_1024_45_inx2_1_fu_2152_p4() {
    varinx3_1024_45_inx2_1_fu_2152_p4 = varinx3_1024_45_q1.read().range(13, 7);
}

void mcalcAA::thread_varinx3_1024_45_inx3_1_1_fu_2130_p4() {
    varinx3_1024_45_inx3_1_1_fu_2130_p4 = varinx3_1024_45_q0.read().range(20, 14);
}

void mcalcAA::thread_varinx3_1024_45_inx3_1_fu_2166_p4() {
    varinx3_1024_45_inx3_1_fu_2166_p4 = varinx3_1024_45_q1.read().range(20, 14);
}

void mcalcAA::thread_varinx3_4096_45_address0() {
    varinx3_4096_45_address0 =  (sc_lv<9>) (tmp_s_fu_2037_p1.read());
}

void mcalcAA::thread_varinx3_4096_45_address1() {
    varinx3_4096_45_address1 =  (sc_lv<9>) (tmp_837_fu_2068_p1.read());
}

void mcalcAA::thread_varinx3_4096_45_ce0() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx3_4096_45_ce0 = ap_const_logic_1;
    } else {
        varinx3_4096_45_ce0 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx3_4096_45_ce1() {
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        varinx3_4096_45_ce1 = ap_const_logic_1;
    } else {
        varinx3_4096_45_ce1 = ap_const_logic_0;
    }
}

void mcalcAA::thread_varinx3_4096_45_inx2_1_1_fu_3048_p4() {
    varinx3_4096_45_inx2_1_1_fu_3048_p4 = varinx3_4096_45_q0.read().range(17, 9);
}

void mcalcAA::thread_varinx3_4096_45_inx2_1_fu_3072_p4() {
    varinx3_4096_45_inx2_1_fu_3072_p4 = varinx3_4096_45_q1.read().range(17, 9);
}

void mcalcAA::thread_varinx3_4096_45_inx3_1_1_fu_3058_p4() {
    varinx3_4096_45_inx3_1_1_fu_3058_p4 = varinx3_4096_45_q0.read().range(26, 18);
}

void mcalcAA::thread_varinx3_4096_45_inx3_1_fu_3082_p4() {
    varinx3_4096_45_inx3_1_fu_3082_p4 = varinx3_4096_45_q1.read().range(26, 18);
}

}

