#include "mcalcAA.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

void mcalcAA::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_pp0_stage0;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter1 = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && 
             !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
            ap_enable_reg_pp0_iter1 = ap_start.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter2 = ap_const_logic_0;
    } else {
        if (!(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0))) {
            ap_enable_reg_pp0_iter2 = ap_enable_reg_pp0_iter1.read();
        }
    }
    if ((esl_seteq<1,1,1>(ap_CS_fsm_pp0_stage0.read(), ap_const_lv1_1) && !(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)))) {
        SpEtaPrev_three_V_lo_reg_8647 = SpEtaPrev_q0.read().range(23, 16);
        SpEtaPrev_two_V_load_reg_8642 = SpEtaPrev_q0.read().range(15, 8);
        a18A2_reg_8337 = a18A2_fu_3860_p3.read();
        a18A_reg_8247 = a18A_fu_3716_p3.read();
        a18B2_reg_8517 = a18B2_fu_4148_p3.read();
        a18B_reg_8427 = a18B_fu_4004_p3.read();
        a_reg_8217 = a_fu_3668_p3.read();
        b18A2_reg_8342 = b18A2_fu_3868_p3.read();
        b18A_reg_8252 = b18A_fu_3724_p3.read();
        b18B2_reg_8522 = b18B2_fu_4156_p3.read();
        b18B_reg_8432 = b18B_fu_4012_p3.read();
        b_reg_8222 = b_fu_3676_p3.read();
        c18A2_reg_8347 = c18A2_fu_3876_p3.read();
        c18A_reg_8257 = c18A_fu_3732_p3.read();
        c18B2_reg_8527 = c18B2_fu_4164_p3.read();
        c18B_reg_8437 = c18B_fu_4020_p3.read();
        c_reg_8227 = c_fu_3684_p3.read();
        d18A2_reg_8352 = d18A2_fu_3884_p3.read();
        d18A_reg_8262 = d18A_fu_3740_p3.read();
        d18B2_reg_8532 = d18B2_fu_4172_p3.read();
        d18B_reg_8442 = d18B_fu_4028_p3.read();
        d_reg_8232 = d_fu_3692_p3.read();
        e18A2_reg_8357 = e18A2_fu_3892_p3.read();
        e18A_reg_8267 = e18A_fu_3748_p3.read();
        e18B2_reg_8537 = e18B2_fu_4180_p3.read();
        e18B_reg_8447 = e18B_fu_4036_p3.read();
        e_reg_8237 = e_fu_3700_p3.read();
        f18A2_reg_8362 = f18A2_fu_3900_p3.read();
        f18A_reg_8272 = f18A_fu_3756_p3.read();
        f18B2_reg_8542 = f18B2_fu_4188_p3.read();
        f18B_reg_8452 = f18B_fu_4044_p3.read();
        f_reg_8242 = f_fu_3708_p3.read();
        g18A2_reg_8367 = g18A2_fu_3908_p3.read();
        g18A_reg_8277 = g18A_fu_3764_p3.read();
        g18B2_reg_8547 = g18B2_fu_4196_p3.read();
        g18B_reg_8457 = g18B_fu_4052_p3.read();
        h18A2_reg_8372 = h18A2_fu_3916_p3.read();
        h18A_reg_8282 = h18A_fu_3772_p3.read();
        h18B2_reg_8552 = h18B2_fu_4204_p3.read();
        h18B_reg_8462 = h18B_fu_4060_p3.read();
        i18A2_reg_8377 = i18A2_fu_3924_p3.read();
        i18A_reg_8287 = i18A_fu_3780_p3.read();
        i18B2_reg_8557 = i18B2_fu_4212_p3.read();
        i18B_reg_8467 = i18B_fu_4068_p3.read();
        j18A2_reg_8382 = j18A2_fu_3932_p3.read();
        j18A_reg_8292 = j18A_fu_3788_p3.read();
        j18B2_reg_8562 = j18B2_fu_4220_p3.read();
        j18B_reg_8472 = j18B_fu_4076_p3.read();
        k18A2_reg_8387 = k18A2_fu_3940_p3.read();
        k18A_reg_8297 = k18A_fu_3796_p3.read();
        k18B2_reg_8567 = k18B2_fu_4228_p3.read();
        k18B_reg_8477 = k18B_fu_4084_p3.read();
        l18A2_reg_8392 = l18A2_fu_3948_p3.read();
        l18A_reg_8302 = l18A_fu_3804_p3.read();
        l18B2_reg_8572 = l18B2_fu_4236_p3.read();
        l18B_reg_8482 = l18B_fu_4092_p3.read();
        m18A2_reg_8397 = m18A2_fu_3956_p3.read();
        m18A_reg_8307 = m18A_fu_3812_p3.read();
        m18B2_reg_8577 = m18B2_fu_4244_p3.read();
        m18B_reg_8487 = m18B_fu_4100_p3.read();
        n18A2_reg_8402 = n18A2_fu_3964_p3.read();
        n18A_reg_8312 = n18A_fu_3820_p3.read();
        n18B2_reg_8582 = n18B2_fu_4252_p3.read();
        n18B_reg_8492 = n18B_fu_4108_p3.read();
        num_ntA_read_reg_7932 = num_ntA.read();
        num_ntB_read_reg_7927 = num_ntB.read();
        o18A2_reg_8407 = o18A2_fu_3972_p3.read();
        o18A_reg_8317 = o18A_fu_3828_p3.read();
        o18B2_reg_8587 = o18B2_fu_4260_p3.read();
        o18B_reg_8497 = o18B_fu_4116_p3.read();
        p18A2_reg_8412 = p18A2_fu_3980_p3.read();
        p18A_reg_8322 = p18A_fu_3836_p3.read();
        p18B2_reg_8592 = p18B2_fu_4268_p3.read();
        p18B_reg_8502 = p18B_fu_4124_p3.read();
        q18A2_reg_8417 = q18A2_fu_3988_p3.read();
        q18A_reg_8327 = q18A_fu_3844_p3.read();
        q18B2_reg_8597 = q18B2_fu_4276_p3.read();
        q18B_reg_8507 = q18B_fu_4132_p3.read();
        r18A2_reg_8422 = r18A2_fu_3996_p3.read();
        r18A_reg_8332 = r18A_fu_3852_p3.read();
        r18B2_reg_8602 = r18B2_fu_4284_p3.read();
        r18B_reg_8512 = r18B_fu_4140_p3.read();
        tmp_1010_reg_8637 = tmp_1010_fu_4322_p1.read();
        tmp_837_reg_7942 = tmp_837_fu_2068_p1.read();
    }
}

void mcalcAA::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
break;
        default : 
            ap_NS_fsm = "X";
            break;
    }
}

}

