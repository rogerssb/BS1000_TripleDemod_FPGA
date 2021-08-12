#include "HLSLdpcLogDecScaledMin.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

void HLSLdpcLogDecScaledMin::thread_prLam2C_buf_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLam2C_buf_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2C_buf_we0 = grp_calc_n_23_fu_7881_prLam2C_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2C_buf_we0 = grp_calc_n_12_fu_7606_prLam2C_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2C_buf_we0 = grp_calc_n_fu_7175_prLam2C_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLam2C_buf_we0 = grp_write_result_23_fu_6795_prLam2C_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam2C_buf_we0 = grp_write_result_12_fu_6479_prLam2C_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLam2C_buf_we0 = grp_write_result_fu_4833_prLam2C_buf_we0.read();
    } else {
        prLam2C_buf_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2C_bufa_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2C_bufa_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2C_bufa_address0 = grp_calc_n_23_fu_7881_prLam2C_bufa_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2C_bufa_address0 = grp_calc_n_fu_7175_prLam2C_bufa_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2C_bufa_address0 = grp_write_result_23_fu_6795_prLam2C_bufa_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2C_bufa_address0 = grp_write_result_fu_4833_prLam2C_bufa_address0.read();
    } else {
        prLam2C_bufa_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2C_bufa_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2C_bufa_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2C_bufa_ce0 = grp_calc_n_23_fu_7881_prLam2C_bufa_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2C_bufa_ce0 = grp_calc_n_fu_7175_prLam2C_bufa_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2C_bufa_ce0 = grp_write_result_23_fu_6795_prLam2C_bufa_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2C_bufa_ce0 = grp_write_result_fu_4833_prLam2C_bufa_ce0.read();
    } else {
        prLam2C_bufa_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2C_bufa_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2C_bufa_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2C_bufa_d0 = grp_calc_n_23_fu_7881_prLam2C_bufa_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2C_bufa_d0 = grp_calc_n_fu_7175_prLam2C_bufa_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2C_bufa_d0 = grp_write_result_23_fu_6795_prLam2C_bufa_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2C_bufa_d0 = grp_write_result_fu_4833_prLam2C_bufa_d0.read();
    } else {
        prLam2C_bufa_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2C_bufa_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLam2C_bufa_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2C_bufa_we0 = grp_calc_n_23_fu_7881_prLam2C_bufa_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2C_bufa_we0 = grp_calc_n_fu_7175_prLam2C_bufa_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2C_bufa_we0 = grp_write_result_23_fu_6795_prLam2C_bufa_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2C_bufa_we0 = grp_write_result_fu_4833_prLam2C_bufa_we0.read();
    } else {
        prLam2C_bufa_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2C_bufb_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2C_bufb_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2C_bufb_address0 = grp_calc_n_23_fu_7881_prLam2C_bufb_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2C_bufb_address0 = grp_calc_n_fu_7175_prLam2C_bufb_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2C_bufb_address0 = grp_write_result_23_fu_6795_prLam2C_bufb_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2C_bufb_address0 = grp_write_result_fu_4833_prLam2C_bufb_address0.read();
    } else {
        prLam2C_bufb_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2C_bufb_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2C_bufb_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2C_bufb_ce0 = grp_calc_n_23_fu_7881_prLam2C_bufb_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2C_bufb_ce0 = grp_calc_n_fu_7175_prLam2C_bufb_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2C_bufb_ce0 = grp_write_result_23_fu_6795_prLam2C_bufb_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2C_bufb_ce0 = grp_write_result_fu_4833_prLam2C_bufb_ce0.read();
    } else {
        prLam2C_bufb_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2C_bufb_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2C_bufb_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2C_bufb_d0 = grp_calc_n_23_fu_7881_prLam2C_bufb_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2C_bufb_d0 = grp_calc_n_fu_7175_prLam2C_bufb_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2C_bufb_d0 = grp_write_result_23_fu_6795_prLam2C_bufb_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2C_bufb_d0 = grp_write_result_fu_4833_prLam2C_bufb_d0.read();
    } else {
        prLam2C_bufb_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2C_bufb_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLam2C_bufb_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2C_bufb_we0 = grp_calc_n_23_fu_7881_prLam2C_bufb_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2C_bufb_we0 = grp_calc_n_fu_7175_prLam2C_bufb_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2C_bufb_we0 = grp_write_result_23_fu_6795_prLam2C_bufb_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2C_bufb_we0 = grp_write_result_fu_4833_prLam2C_bufb_we0.read();
    } else {
        prLam2C_bufb_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2_buf2_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2_buf2_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2_buf2_address0 = grp_calc_n_23_fu_7881_prLam2_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2_buf2_address0 = grp_calc_n_12_fu_7606_prLam2_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2_buf2_address0 = grp_calc_n_fu_7175_prLam2_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLam2_buf2_address0 = grp_write_result_23_fu_6795_prLam2_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam2_buf2_address0 = grp_write_result_12_fu_6479_prLam2_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2_buf2_address0 = grp_write_result_fu_4833_prLam2_buf2_address0.read();
    } else {
        prLam2_buf2_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2_buf2_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2_buf2_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2_buf2_ce0 = grp_calc_n_23_fu_7881_prLam2_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2_buf2_ce0 = grp_calc_n_12_fu_7606_prLam2_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2_buf2_ce0 = grp_calc_n_fu_7175_prLam2_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLam2_buf2_ce0 = grp_write_result_23_fu_6795_prLam2_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam2_buf2_ce0 = grp_write_result_12_fu_6479_prLam2_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2_buf2_ce0 = grp_write_result_fu_4833_prLam2_buf2_ce0.read();
    } else {
        prLam2_buf2_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2_buf2_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2_buf2_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2_buf2_d0 = grp_calc_n_23_fu_7881_prLam2_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2_buf2_d0 = grp_calc_n_12_fu_7606_prLam2_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2_buf2_d0 = grp_calc_n_fu_7175_prLam2_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLam2_buf2_d0 = grp_write_result_23_fu_6795_prLam2_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam2_buf2_d0 = grp_write_result_12_fu_6479_prLam2_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2_buf2_d0 = grp_write_result_fu_4833_prLam2_buf2_d0.read();
    } else {
        prLam2_buf2_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2_buf2_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLam2_buf2_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2_buf2_we0 = grp_calc_n_23_fu_7881_prLam2_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2_buf2_we0 = grp_calc_n_12_fu_7606_prLam2_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2_buf2_we0 = grp_calc_n_fu_7175_prLam2_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLam2_buf2_we0 = grp_write_result_23_fu_6795_prLam2_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam2_buf2_we0 = grp_write_result_12_fu_6479_prLam2_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2_buf2_we0 = grp_write_result_fu_4833_prLam2_buf2_we0.read();
    } else {
        prLam2_buf2_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2_buf4_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2_buf4_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2_buf4_address0 = grp_calc_n_23_fu_7881_prLam2_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2_buf4_address0 = grp_calc_n_12_fu_7606_prLam2_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2_buf4_address0 = grp_calc_n_fu_7175_prLam2_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2_buf4_address0 = grp_write_result_23_fu_6795_prLam2_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLam2_buf4_address0 = grp_write_result_12_fu_6479_prLam2_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLam2_buf4_address0 = grp_write_result_fu_4833_prLam2_buf4_address0.read();
    } else {
        prLam2_buf4_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2_buf4_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2_buf4_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2_buf4_ce0 = grp_calc_n_23_fu_7881_prLam2_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2_buf4_ce0 = grp_calc_n_12_fu_7606_prLam2_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2_buf4_ce0 = grp_calc_n_fu_7175_prLam2_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2_buf4_ce0 = grp_write_result_23_fu_6795_prLam2_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLam2_buf4_ce0 = grp_write_result_12_fu_6479_prLam2_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLam2_buf4_ce0 = grp_write_result_fu_4833_prLam2_buf4_ce0.read();
    } else {
        prLam2_buf4_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2_buf4_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2_buf4_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2_buf4_d0 = grp_calc_n_23_fu_7881_prLam2_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2_buf4_d0 = grp_calc_n_12_fu_7606_prLam2_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2_buf4_d0 = grp_calc_n_fu_7175_prLam2_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2_buf4_d0 = grp_write_result_23_fu_6795_prLam2_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLam2_buf4_d0 = grp_write_result_12_fu_6479_prLam2_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLam2_buf4_d0 = grp_write_result_fu_4833_prLam2_buf4_d0.read();
    } else {
        prLam2_buf4_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2_buf4_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLam2_buf4_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2_buf4_we0 = grp_calc_n_23_fu_7881_prLam2_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2_buf4_we0 = grp_calc_n_12_fu_7606_prLam2_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2_buf4_we0 = grp_calc_n_fu_7175_prLam2_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2_buf4_we0 = grp_write_result_23_fu_6795_prLam2_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLam2_buf4_we0 = grp_write_result_12_fu_6479_prLam2_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLam2_buf4_we0 = grp_write_result_fu_4833_prLam2_buf4_we0.read();
    } else {
        prLam2_buf4_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2_buf4a_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2_buf4a_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2_buf4a_address0 = grp_calc_n_23_fu_7881_prLam2_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2_buf4a_address0 = grp_calc_n_12_fu_7606_prLam2_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2_buf4a_address0 = grp_calc_n_fu_7175_prLam2_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2_buf4a_address0 = grp_write_result_23_fu_6795_prLam2_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam2_buf4a_address0 = grp_write_result_12_fu_6479_prLam2_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2_buf4a_address0 = grp_write_result_fu_4833_prLam2_buf4a_address0.read();
    } else {
        prLam2_buf4a_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2_buf4a_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2_buf4a_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2_buf4a_ce0 = grp_calc_n_23_fu_7881_prLam2_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2_buf4a_ce0 = grp_calc_n_12_fu_7606_prLam2_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2_buf4a_ce0 = grp_calc_n_fu_7175_prLam2_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2_buf4a_ce0 = grp_write_result_23_fu_6795_prLam2_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam2_buf4a_ce0 = grp_write_result_12_fu_6479_prLam2_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2_buf4a_ce0 = grp_write_result_fu_4833_prLam2_buf4a_ce0.read();
    } else {
        prLam2_buf4a_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2_buf4a_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam2_buf4a_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2_buf4a_d0 = grp_calc_n_23_fu_7881_prLam2_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2_buf4a_d0 = grp_calc_n_12_fu_7606_prLam2_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2_buf4a_d0 = grp_calc_n_fu_7175_prLam2_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2_buf4a_d0 = grp_write_result_23_fu_6795_prLam2_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam2_buf4a_d0 = grp_write_result_12_fu_6479_prLam2_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2_buf4a_d0 = grp_write_result_fu_4833_prLam2_buf4a_d0.read();
    } else {
        prLam2_buf4a_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam2_buf4a_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLam2_buf4a_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam2_buf4a_we0 = grp_calc_n_23_fu_7881_prLam2_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam2_buf4a_we0 = grp_calc_n_12_fu_7606_prLam2_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam2_buf4a_we0 = grp_calc_n_fu_7175_prLam2_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam2_buf4a_we0 = grp_write_result_23_fu_6795_prLam2_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam2_buf4a_we0 = grp_write_result_12_fu_6479_prLam2_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam2_buf4a_we0 = grp_write_result_fu_4833_prLam2_buf4a_we0.read();
    } else {
        prLam2_buf4a_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf10_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf10_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf10_address0 = grp_calc_n_12_fu_7606_prLamB_buf10_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf10_address0 = grp_calc_n_fu_7175_prLamB_buf10_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamB_buf10_address0 = grp_write_result_12_fu_6479_prLamB_buf10_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf10_address0 = grp_write_result_fu_4833_prLamB_buf10_address0.read();
    } else {
        prLamB_buf10_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf10_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf10_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf10_ce0 = grp_calc_n_12_fu_7606_prLamB_buf10_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf10_ce0 = grp_calc_n_fu_7175_prLamB_buf10_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamB_buf10_ce0 = grp_write_result_12_fu_6479_prLamB_buf10_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf10_ce0 = grp_write_result_fu_4833_prLamB_buf10_ce0.read();
    } else {
        prLamB_buf10_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf10_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf10_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf10_d0 = grp_calc_n_12_fu_7606_prLamB_buf10_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf10_d0 = grp_calc_n_fu_7175_prLamB_buf10_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamB_buf10_d0 = grp_write_result_12_fu_6479_prLamB_buf10_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf10_d0 = grp_write_result_fu_4833_prLamB_buf10_d0.read();
    } else {
        prLamB_buf10_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf10_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamB_buf10_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf10_we0 = grp_calc_n_12_fu_7606_prLamB_buf10_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf10_we0 = grp_calc_n_fu_7175_prLamB_buf10_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamB_buf10_we0 = grp_write_result_12_fu_6479_prLamB_buf10_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf10_we0 = grp_write_result_fu_4833_prLamB_buf10_we0.read();
    } else {
        prLamB_buf10_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf1_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf1_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf1_address0 = grp_calc_n_23_fu_7881_prLamB_buf1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf1_address0 = grp_calc_n_12_fu_7606_prLamB_buf1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf1_address0 = grp_calc_n_fu_7175_prLamB_buf1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf1_address0 = grp_write_result_23_fu_6795_prLamB_buf1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf1_address0 = grp_write_result_12_fu_6479_prLamB_buf1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf1_address0 = grp_write_result_fu_4833_prLamB_buf1_address0.read();
    } else {
        prLamB_buf1_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf1_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf1_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf1_ce0 = grp_calc_n_23_fu_7881_prLamB_buf1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf1_ce0 = grp_calc_n_12_fu_7606_prLamB_buf1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf1_ce0 = grp_calc_n_fu_7175_prLamB_buf1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf1_ce0 = grp_write_result_23_fu_6795_prLamB_buf1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf1_ce0 = grp_write_result_12_fu_6479_prLamB_buf1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf1_ce0 = grp_write_result_fu_4833_prLamB_buf1_ce0.read();
    } else {
        prLamB_buf1_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf1_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf1_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf1_d0 = grp_calc_n_23_fu_7881_prLamB_buf1_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf1_d0 = grp_calc_n_12_fu_7606_prLamB_buf1_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf1_d0 = grp_calc_n_fu_7175_prLamB_buf1_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf1_d0 = grp_write_result_23_fu_6795_prLamB_buf1_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf1_d0 = grp_write_result_12_fu_6479_prLamB_buf1_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf1_d0 = grp_write_result_fu_4833_prLamB_buf1_d0.read();
    } else {
        prLamB_buf1_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf1_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamB_buf1_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf1_we0 = grp_calc_n_23_fu_7881_prLamB_buf1_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf1_we0 = grp_calc_n_12_fu_7606_prLamB_buf1_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf1_we0 = grp_calc_n_fu_7175_prLamB_buf1_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf1_we0 = grp_write_result_23_fu_6795_prLamB_buf1_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf1_we0 = grp_write_result_12_fu_6479_prLamB_buf1_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf1_we0 = grp_write_result_fu_4833_prLamB_buf1_we0.read();
    } else {
        prLamB_buf1_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf1a_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf1a_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf1a_address0 = grp_calc_n_23_fu_7881_prLamB_buf1a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf1a_address0 = grp_calc_n_12_fu_7606_prLamB_buf1a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf1a_address0 = grp_calc_n_fu_7175_prLamB_buf1a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf1a_address0 = grp_write_result_23_fu_6795_prLamB_buf1a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf1a_address0 = grp_write_result_12_fu_6479_prLamB_buf1a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf1a_address0 = grp_write_result_fu_4833_prLamB_buf1a_address0.read();
    } else {
        prLamB_buf1a_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf1a_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf1a_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf1a_ce0 = grp_calc_n_23_fu_7881_prLamB_buf1a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf1a_ce0 = grp_calc_n_12_fu_7606_prLamB_buf1a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf1a_ce0 = grp_calc_n_fu_7175_prLamB_buf1a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf1a_ce0 = grp_write_result_23_fu_6795_prLamB_buf1a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf1a_ce0 = grp_write_result_12_fu_6479_prLamB_buf1a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf1a_ce0 = grp_write_result_fu_4833_prLamB_buf1a_ce0.read();
    } else {
        prLamB_buf1a_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf1a_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf1a_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf1a_d0 = grp_calc_n_23_fu_7881_prLamB_buf1a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf1a_d0 = grp_calc_n_12_fu_7606_prLamB_buf1a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf1a_d0 = grp_calc_n_fu_7175_prLamB_buf1a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf1a_d0 = grp_write_result_23_fu_6795_prLamB_buf1a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf1a_d0 = grp_write_result_12_fu_6479_prLamB_buf1a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf1a_d0 = grp_write_result_fu_4833_prLamB_buf1a_d0.read();
    } else {
        prLamB_buf1a_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf1a_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamB_buf1a_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf1a_we0 = grp_calc_n_23_fu_7881_prLamB_buf1a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf1a_we0 = grp_calc_n_12_fu_7606_prLamB_buf1a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf1a_we0 = grp_calc_n_fu_7175_prLamB_buf1a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf1a_we0 = grp_write_result_23_fu_6795_prLamB_buf1a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf1a_we0 = grp_write_result_12_fu_6479_prLamB_buf1a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf1a_we0 = grp_write_result_fu_4833_prLamB_buf1a_we0.read();
    } else {
        prLamB_buf1a_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf1b_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf1b_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf1b_address0 = grp_calc_n_23_fu_7881_prLamB_buf1b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf1b_address0 = grp_calc_n_fu_7175_prLamB_buf1b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf1b_address0 = grp_write_result_23_fu_6795_prLamB_buf1b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf1b_address0 = grp_write_result_fu_4833_prLamB_buf1b_address0.read();
    } else {
        prLamB_buf1b_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf1b_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf1b_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf1b_ce0 = grp_calc_n_23_fu_7881_prLamB_buf1b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf1b_ce0 = grp_calc_n_fu_7175_prLamB_buf1b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf1b_ce0 = grp_write_result_23_fu_6795_prLamB_buf1b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf1b_ce0 = grp_write_result_fu_4833_prLamB_buf1b_ce0.read();
    } else {
        prLamB_buf1b_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf1b_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf1b_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf1b_d0 = grp_calc_n_23_fu_7881_prLamB_buf1b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf1b_d0 = grp_calc_n_fu_7175_prLamB_buf1b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf1b_d0 = grp_write_result_23_fu_6795_prLamB_buf1b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf1b_d0 = grp_write_result_fu_4833_prLamB_buf1b_d0.read();
    } else {
        prLamB_buf1b_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf1b_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamB_buf1b_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf1b_we0 = grp_calc_n_23_fu_7881_prLamB_buf1b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf1b_we0 = grp_calc_n_fu_7175_prLamB_buf1b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf1b_we0 = grp_write_result_23_fu_6795_prLamB_buf1b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf1b_we0 = grp_write_result_fu_4833_prLamB_buf1b_we0.read();
    } else {
        prLamB_buf1b_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf2_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf2_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf2_address0 = grp_calc_n_23_fu_7881_prLamB_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf2_address0 = grp_calc_n_fu_7175_prLamB_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf2_address0 = grp_write_result_23_fu_6795_prLamB_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf2_address0 = grp_write_result_fu_4833_prLamB_buf2_address0.read();
    } else {
        prLamB_buf2_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf2_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf2_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf2_ce0 = grp_calc_n_23_fu_7881_prLamB_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf2_ce0 = grp_calc_n_fu_7175_prLamB_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf2_ce0 = grp_write_result_23_fu_6795_prLamB_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf2_ce0 = grp_write_result_fu_4833_prLamB_buf2_ce0.read();
    } else {
        prLamB_buf2_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf2_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf2_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf2_d0 = grp_calc_n_23_fu_7881_prLamB_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf2_d0 = grp_calc_n_fu_7175_prLamB_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf2_d0 = grp_write_result_23_fu_6795_prLamB_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf2_d0 = grp_write_result_fu_4833_prLamB_buf2_d0.read();
    } else {
        prLamB_buf2_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf2_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamB_buf2_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf2_we0 = grp_calc_n_23_fu_7881_prLamB_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf2_we0 = grp_calc_n_fu_7175_prLamB_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf2_we0 = grp_write_result_23_fu_6795_prLamB_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf2_we0 = grp_write_result_fu_4833_prLamB_buf2_we0.read();
    } else {
        prLamB_buf2_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf3_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf3_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf3_address0 = grp_calc_n_23_fu_7881_prLamB_buf3_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf3_address0 = grp_calc_n_12_fu_7606_prLamB_buf3_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf3_address0 = grp_calc_n_fu_7175_prLamB_buf3_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf3_address0 = grp_write_result_23_fu_6795_prLamB_buf3_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf3_address0 = grp_write_result_12_fu_6479_prLamB_buf3_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf3_address0 = grp_write_result_fu_4833_prLamB_buf3_address0.read();
    } else {
        prLamB_buf3_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf3_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf3_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf3_ce0 = grp_calc_n_23_fu_7881_prLamB_buf3_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf3_ce0 = grp_calc_n_12_fu_7606_prLamB_buf3_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf3_ce0 = grp_calc_n_fu_7175_prLamB_buf3_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf3_ce0 = grp_write_result_23_fu_6795_prLamB_buf3_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf3_ce0 = grp_write_result_12_fu_6479_prLamB_buf3_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf3_ce0 = grp_write_result_fu_4833_prLamB_buf3_ce0.read();
    } else {
        prLamB_buf3_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf3_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf3_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf3_d0 = grp_calc_n_23_fu_7881_prLamB_buf3_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf3_d0 = grp_calc_n_12_fu_7606_prLamB_buf3_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf3_d0 = grp_calc_n_fu_7175_prLamB_buf3_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf3_d0 = grp_write_result_23_fu_6795_prLamB_buf3_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf3_d0 = grp_write_result_12_fu_6479_prLamB_buf3_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf3_d0 = grp_write_result_fu_4833_prLamB_buf3_d0.read();
    } else {
        prLamB_buf3_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf3_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamB_buf3_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf3_we0 = grp_calc_n_23_fu_7881_prLamB_buf3_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf3_we0 = grp_calc_n_12_fu_7606_prLamB_buf3_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf3_we0 = grp_calc_n_fu_7175_prLamB_buf3_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf3_we0 = grp_write_result_23_fu_6795_prLamB_buf3_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf3_we0 = grp_write_result_12_fu_6479_prLamB_buf3_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf3_we0 = grp_write_result_fu_4833_prLamB_buf3_we0.read();
    } else {
        prLamB_buf3_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf3a_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf3a_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf3a_address0 = grp_calc_n_23_fu_7881_prLamB_buf3a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf3a_address0 = grp_calc_n_12_fu_7606_prLamB_buf3a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf3a_address0 = grp_calc_n_fu_7175_prLamB_buf3a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf3a_address0 = grp_write_result_23_fu_6795_prLamB_buf3a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf3a_address0 = grp_write_result_12_fu_6479_prLamB_buf3a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf3a_address0 = grp_write_result_fu_4833_prLamB_buf3a_address0.read();
    } else {
        prLamB_buf3a_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf3a_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf3a_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf3a_ce0 = grp_calc_n_23_fu_7881_prLamB_buf3a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf3a_ce0 = grp_calc_n_12_fu_7606_prLamB_buf3a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf3a_ce0 = grp_calc_n_fu_7175_prLamB_buf3a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf3a_ce0 = grp_write_result_23_fu_6795_prLamB_buf3a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf3a_ce0 = grp_write_result_12_fu_6479_prLamB_buf3a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf3a_ce0 = grp_write_result_fu_4833_prLamB_buf3a_ce0.read();
    } else {
        prLamB_buf3a_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf3a_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf3a_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf3a_d0 = grp_calc_n_23_fu_7881_prLamB_buf3a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf3a_d0 = grp_calc_n_12_fu_7606_prLamB_buf3a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf3a_d0 = grp_calc_n_fu_7175_prLamB_buf3a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf3a_d0 = grp_write_result_23_fu_6795_prLamB_buf3a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf3a_d0 = grp_write_result_12_fu_6479_prLamB_buf3a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf3a_d0 = grp_write_result_fu_4833_prLamB_buf3a_d0.read();
    } else {
        prLamB_buf3a_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf3a_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamB_buf3a_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf3a_we0 = grp_calc_n_23_fu_7881_prLamB_buf3a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf3a_we0 = grp_calc_n_12_fu_7606_prLamB_buf3a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf3a_we0 = grp_calc_n_fu_7175_prLamB_buf3a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf3a_we0 = grp_write_result_23_fu_6795_prLamB_buf3a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf3a_we0 = grp_write_result_12_fu_6479_prLamB_buf3a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf3a_we0 = grp_write_result_fu_4833_prLamB_buf3a_we0.read();
    } else {
        prLamB_buf3a_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf3b_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf3b_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf3b_address0 = grp_calc_n_23_fu_7881_prLamB_buf3b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf3b_address0 = grp_calc_n_12_fu_7606_prLamB_buf3b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf3b_address0 = grp_calc_n_fu_7175_prLamB_buf3b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf3b_address0 = grp_write_result_12_fu_6479_prLamB_buf3b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf3b_address0 = grp_write_result_fu_4833_prLamB_buf3b_address0.read();
    } else {
        prLamB_buf3b_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf3b_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf3b_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf3b_ce0 = grp_calc_n_23_fu_7881_prLamB_buf3b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf3b_ce0 = grp_calc_n_12_fu_7606_prLamB_buf3b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf3b_ce0 = grp_calc_n_fu_7175_prLamB_buf3b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf3b_ce0 = grp_write_result_12_fu_6479_prLamB_buf3b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf3b_ce0 = grp_write_result_fu_4833_prLamB_buf3b_ce0.read();
    } else {
        prLamB_buf3b_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf3b_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf3b_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf3b_d0 = grp_calc_n_23_fu_7881_prLamB_buf3b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf3b_d0 = grp_calc_n_12_fu_7606_prLamB_buf3b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf3b_d0 = grp_calc_n_fu_7175_prLamB_buf3b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf3b_d0 = grp_write_result_12_fu_6479_prLamB_buf3b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf3b_d0 = grp_write_result_fu_4833_prLamB_buf3b_d0.read();
    } else {
        prLamB_buf3b_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf3b_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamB_buf3b_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf3b_we0 = grp_calc_n_23_fu_7881_prLamB_buf3b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf3b_we0 = grp_calc_n_12_fu_7606_prLamB_buf3b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf3b_we0 = grp_calc_n_fu_7175_prLamB_buf3b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf3b_we0 = grp_write_result_12_fu_6479_prLamB_buf3b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf3b_we0 = grp_write_result_fu_4833_prLamB_buf3b_we0.read();
    } else {
        prLamB_buf3b_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf4_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf4_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf4_address0 = grp_calc_n_23_fu_7881_prLamB_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf4_address0 = grp_calc_n_12_fu_7606_prLamB_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf4_address0 = grp_calc_n_fu_7175_prLamB_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf4_address0 = grp_write_result_12_fu_6479_prLamB_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf4_address0 = grp_write_result_fu_4833_prLamB_buf4_address0.read();
    } else {
        prLamB_buf4_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf4_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf4_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf4_ce0 = grp_calc_n_23_fu_7881_prLamB_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf4_ce0 = grp_calc_n_12_fu_7606_prLamB_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf4_ce0 = grp_calc_n_fu_7175_prLamB_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf4_ce0 = grp_write_result_12_fu_6479_prLamB_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf4_ce0 = grp_write_result_fu_4833_prLamB_buf4_ce0.read();
    } else {
        prLamB_buf4_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf4_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf4_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf4_d0 = grp_calc_n_23_fu_7881_prLamB_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf4_d0 = grp_calc_n_12_fu_7606_prLamB_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf4_d0 = grp_calc_n_fu_7175_prLamB_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf4_d0 = grp_write_result_12_fu_6479_prLamB_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf4_d0 = grp_write_result_fu_4833_prLamB_buf4_d0.read();
    } else {
        prLamB_buf4_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf4_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamB_buf4_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf4_we0 = grp_calc_n_23_fu_7881_prLamB_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf4_we0 = grp_calc_n_12_fu_7606_prLamB_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf4_we0 = grp_calc_n_fu_7175_prLamB_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf4_we0 = grp_write_result_12_fu_6479_prLamB_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf4_we0 = grp_write_result_fu_4833_prLamB_buf4_we0.read();
    } else {
        prLamB_buf4_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf5_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf5_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf5_address0 = grp_calc_n_23_fu_7881_prLamB_buf5_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf5_address0 = grp_calc_n_12_fu_7606_prLamB_buf5_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf5_address0 = grp_calc_n_fu_7175_prLamB_buf5_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf5_address0 = grp_write_result_23_fu_6795_prLamB_buf5_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf5_address0 = grp_write_result_12_fu_6479_prLamB_buf5_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf5_address0 = grp_write_result_fu_4833_prLamB_buf5_address0.read();
    } else {
        prLamB_buf5_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf5_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf5_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf5_ce0 = grp_calc_n_23_fu_7881_prLamB_buf5_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf5_ce0 = grp_calc_n_12_fu_7606_prLamB_buf5_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf5_ce0 = grp_calc_n_fu_7175_prLamB_buf5_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf5_ce0 = grp_write_result_23_fu_6795_prLamB_buf5_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf5_ce0 = grp_write_result_12_fu_6479_prLamB_buf5_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf5_ce0 = grp_write_result_fu_4833_prLamB_buf5_ce0.read();
    } else {
        prLamB_buf5_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf5_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf5_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf5_d0 = grp_calc_n_23_fu_7881_prLamB_buf5_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf5_d0 = grp_calc_n_12_fu_7606_prLamB_buf5_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf5_d0 = grp_calc_n_fu_7175_prLamB_buf5_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf5_d0 = grp_write_result_23_fu_6795_prLamB_buf5_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf5_d0 = grp_write_result_12_fu_6479_prLamB_buf5_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf5_d0 = grp_write_result_fu_4833_prLamB_buf5_d0.read();
    } else {
        prLamB_buf5_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf5_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamB_buf5_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf5_we0 = grp_calc_n_23_fu_7881_prLamB_buf5_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf5_we0 = grp_calc_n_12_fu_7606_prLamB_buf5_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf5_we0 = grp_calc_n_fu_7175_prLamB_buf5_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf5_we0 = grp_write_result_23_fu_6795_prLamB_buf5_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf5_we0 = grp_write_result_12_fu_6479_prLamB_buf5_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf5_we0 = grp_write_result_fu_4833_prLamB_buf5_we0.read();
    } else {
        prLamB_buf5_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf5a_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf5a_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf5a_address0 = grp_calc_n_23_fu_7881_prLamB_buf5a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf5a_address0 = grp_calc_n_12_fu_7606_prLamB_buf5a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf5a_address0 = grp_calc_n_fu_7175_prLamB_buf5a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf5a_address0 = grp_write_result_23_fu_6795_prLamB_buf5a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf5a_address0 = grp_write_result_12_fu_6479_prLamB_buf5a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf5a_address0 = grp_write_result_fu_4833_prLamB_buf5a_address0.read();
    } else {
        prLamB_buf5a_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf5a_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf5a_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf5a_ce0 = grp_calc_n_23_fu_7881_prLamB_buf5a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf5a_ce0 = grp_calc_n_12_fu_7606_prLamB_buf5a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf5a_ce0 = grp_calc_n_fu_7175_prLamB_buf5a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf5a_ce0 = grp_write_result_23_fu_6795_prLamB_buf5a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf5a_ce0 = grp_write_result_12_fu_6479_prLamB_buf5a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf5a_ce0 = grp_write_result_fu_4833_prLamB_buf5a_ce0.read();
    } else {
        prLamB_buf5a_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf5a_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf5a_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf5a_d0 = grp_calc_n_23_fu_7881_prLamB_buf5a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf5a_d0 = grp_calc_n_12_fu_7606_prLamB_buf5a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf5a_d0 = grp_calc_n_fu_7175_prLamB_buf5a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf5a_d0 = grp_write_result_23_fu_6795_prLamB_buf5a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf5a_d0 = grp_write_result_12_fu_6479_prLamB_buf5a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf5a_d0 = grp_write_result_fu_4833_prLamB_buf5a_d0.read();
    } else {
        prLamB_buf5a_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf5a_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamB_buf5a_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf5a_we0 = grp_calc_n_23_fu_7881_prLamB_buf5a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf5a_we0 = grp_calc_n_12_fu_7606_prLamB_buf5a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf5a_we0 = grp_calc_n_fu_7175_prLamB_buf5a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamB_buf5a_we0 = grp_write_result_23_fu_6795_prLamB_buf5a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf5a_we0 = grp_write_result_12_fu_6479_prLamB_buf5a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf5a_we0 = grp_write_result_fu_4833_prLamB_buf5a_we0.read();
    } else {
        prLamB_buf5a_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf5b_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf5b_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf5b_address0 = grp_calc_n_23_fu_7881_prLamB_buf5b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf5b_address0 = grp_calc_n_fu_7175_prLamB_buf5b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf5b_address0 = grp_write_result_fu_4833_prLamB_buf5b_address0.read();
    } else {
        prLamB_buf5b_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf5b_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf5b_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf5b_ce0 = grp_calc_n_23_fu_7881_prLamB_buf5b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf5b_ce0 = grp_calc_n_fu_7175_prLamB_buf5b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf5b_ce0 = grp_write_result_fu_4833_prLamB_buf5b_ce0.read();
    } else {
        prLamB_buf5b_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf5b_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf5b_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf5b_d0 = grp_calc_n_23_fu_7881_prLamB_buf5b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf5b_d0 = grp_calc_n_fu_7175_prLamB_buf5b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf5b_d0 = grp_write_result_fu_4833_prLamB_buf5b_d0.read();
    } else {
        prLamB_buf5b_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf5b_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamB_buf5b_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf5b_we0 = grp_calc_n_23_fu_7881_prLamB_buf5b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf5b_we0 = grp_calc_n_fu_7175_prLamB_buf5b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf5b_we0 = grp_write_result_fu_4833_prLamB_buf5b_we0.read();
    } else {
        prLamB_buf5b_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf6_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf6_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf6_address0 = grp_calc_n_23_fu_7881_prLamB_buf6_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf6_address0 = grp_calc_n_12_fu_7606_prLamB_buf6_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf6_address0 = grp_calc_n_fu_7175_prLamB_buf6_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf6_address0 = grp_write_result_23_fu_6795_prLamB_buf6_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf6_address0 = grp_write_result_12_fu_6479_prLamB_buf6_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf6_address0 = grp_write_result_fu_4833_prLamB_buf6_address0.read();
    } else {
        prLamB_buf6_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf6_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf6_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf6_ce0 = grp_calc_n_23_fu_7881_prLamB_buf6_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf6_ce0 = grp_calc_n_12_fu_7606_prLamB_buf6_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf6_ce0 = grp_calc_n_fu_7175_prLamB_buf6_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf6_ce0 = grp_write_result_23_fu_6795_prLamB_buf6_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf6_ce0 = grp_write_result_12_fu_6479_prLamB_buf6_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf6_ce0 = grp_write_result_fu_4833_prLamB_buf6_ce0.read();
    } else {
        prLamB_buf6_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf6_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf6_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf6_d0 = grp_calc_n_23_fu_7881_prLamB_buf6_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf6_d0 = grp_calc_n_12_fu_7606_prLamB_buf6_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf6_d0 = grp_calc_n_fu_7175_prLamB_buf6_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf6_d0 = grp_write_result_23_fu_6795_prLamB_buf6_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf6_d0 = grp_write_result_12_fu_6479_prLamB_buf6_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf6_d0 = grp_write_result_fu_4833_prLamB_buf6_d0.read();
    } else {
        prLamB_buf6_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf6_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamB_buf6_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf6_we0 = grp_calc_n_23_fu_7881_prLamB_buf6_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf6_we0 = grp_calc_n_12_fu_7606_prLamB_buf6_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf6_we0 = grp_calc_n_fu_7175_prLamB_buf6_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf6_we0 = grp_write_result_23_fu_6795_prLamB_buf6_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf6_we0 = grp_write_result_12_fu_6479_prLamB_buf6_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf6_we0 = grp_write_result_fu_4833_prLamB_buf6_we0.read();
    } else {
        prLamB_buf6_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf7_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf7_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf7_address0 = grp_calc_n_12_fu_7606_prLamB_buf7_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf7_address0 = grp_calc_n_fu_7175_prLamB_buf7_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf7_address0 = grp_write_result_12_fu_6479_prLamB_buf7_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf7_address0 = grp_write_result_fu_4833_prLamB_buf7_address0.read();
    } else {
        prLamB_buf7_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf7_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf7_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf7_ce0 = grp_calc_n_12_fu_7606_prLamB_buf7_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf7_ce0 = grp_calc_n_fu_7175_prLamB_buf7_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf7_ce0 = grp_write_result_12_fu_6479_prLamB_buf7_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf7_ce0 = grp_write_result_fu_4833_prLamB_buf7_ce0.read();
    } else {
        prLamB_buf7_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf7_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf7_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf7_d0 = grp_calc_n_12_fu_7606_prLamB_buf7_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf7_d0 = grp_calc_n_fu_7175_prLamB_buf7_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf7_d0 = grp_write_result_12_fu_6479_prLamB_buf7_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf7_d0 = grp_write_result_fu_4833_prLamB_buf7_d0.read();
    } else {
        prLamB_buf7_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf7_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamB_buf7_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf7_we0 = grp_calc_n_12_fu_7606_prLamB_buf7_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf7_we0 = grp_calc_n_fu_7175_prLamB_buf7_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf7_we0 = grp_write_result_12_fu_6479_prLamB_buf7_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf7_we0 = grp_write_result_fu_4833_prLamB_buf7_we0.read();
    } else {
        prLamB_buf7_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf7a_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf7a_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf7a_address0 = grp_calc_n_12_fu_7606_prLamB_buf7a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf7a_address0 = grp_calc_n_fu_7175_prLamB_buf7a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf7a_address0 = grp_write_result_12_fu_6479_prLamB_buf7a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf7a_address0 = grp_write_result_fu_4833_prLamB_buf7a_address0.read();
    } else {
        prLamB_buf7a_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf7a_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf7a_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf7a_ce0 = grp_calc_n_12_fu_7606_prLamB_buf7a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf7a_ce0 = grp_calc_n_fu_7175_prLamB_buf7a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf7a_ce0 = grp_write_result_12_fu_6479_prLamB_buf7a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf7a_ce0 = grp_write_result_fu_4833_prLamB_buf7a_ce0.read();
    } else {
        prLamB_buf7a_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf7a_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf7a_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf7a_d0 = grp_calc_n_12_fu_7606_prLamB_buf7a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf7a_d0 = grp_calc_n_fu_7175_prLamB_buf7a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf7a_d0 = grp_write_result_12_fu_6479_prLamB_buf7a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf7a_d0 = grp_write_result_fu_4833_prLamB_buf7a_d0.read();
    } else {
        prLamB_buf7a_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf7a_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamB_buf7a_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf7a_we0 = grp_calc_n_12_fu_7606_prLamB_buf7a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf7a_we0 = grp_calc_n_fu_7175_prLamB_buf7a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf7a_we0 = grp_write_result_12_fu_6479_prLamB_buf7a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf7a_we0 = grp_write_result_fu_4833_prLamB_buf7a_we0.read();
    } else {
        prLamB_buf7a_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf9_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf9_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf9_address0 = grp_calc_n_12_fu_7606_prLamB_buf9_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf9_address0 = grp_calc_n_fu_7175_prLamB_buf9_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf9_address0 = grp_write_result_12_fu_6479_prLamB_buf9_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf9_address0 = grp_write_result_fu_4833_prLamB_buf9_address0.read();
    } else {
        prLamB_buf9_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf9_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf9_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf9_ce0 = grp_calc_n_12_fu_7606_prLamB_buf9_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf9_ce0 = grp_calc_n_fu_7175_prLamB_buf9_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf9_ce0 = grp_write_result_12_fu_6479_prLamB_buf9_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf9_ce0 = grp_write_result_fu_4833_prLamB_buf9_ce0.read();
    } else {
        prLamB_buf9_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf9_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf9_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf9_d0 = grp_calc_n_12_fu_7606_prLamB_buf9_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf9_d0 = grp_calc_n_fu_7175_prLamB_buf9_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf9_d0 = grp_write_result_12_fu_6479_prLamB_buf9_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf9_d0 = grp_write_result_fu_4833_prLamB_buf9_d0.read();
    } else {
        prLamB_buf9_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf9_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamB_buf9_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf9_we0 = grp_calc_n_12_fu_7606_prLamB_buf9_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf9_we0 = grp_calc_n_fu_7175_prLamB_buf9_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf9_we0 = grp_write_result_12_fu_6479_prLamB_buf9_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf9_we0 = grp_write_result_fu_4833_prLamB_buf9_we0.read();
    } else {
        prLamB_buf9_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf9a_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf9a_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf9a_address0 = grp_calc_n_12_fu_7606_prLamB_buf9a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf9a_address0 = grp_calc_n_fu_7175_prLamB_buf9a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf9a_address0 = grp_write_result_12_fu_6479_prLamB_buf9a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf9a_address0 = grp_write_result_fu_4833_prLamB_buf9a_address0.read();
    } else {
        prLamB_buf9a_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf9a_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf9a_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf9a_ce0 = grp_calc_n_12_fu_7606_prLamB_buf9a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf9a_ce0 = grp_calc_n_fu_7175_prLamB_buf9a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf9a_ce0 = grp_write_result_12_fu_6479_prLamB_buf9a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf9a_ce0 = grp_write_result_fu_4833_prLamB_buf9a_ce0.read();
    } else {
        prLamB_buf9a_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf9a_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamB_buf9a_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf9a_d0 = grp_calc_n_12_fu_7606_prLamB_buf9a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf9a_d0 = grp_calc_n_fu_7175_prLamB_buf9a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf9a_d0 = grp_write_result_12_fu_6479_prLamB_buf9a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf9a_d0 = grp_write_result_fu_4833_prLamB_buf9a_d0.read();
    } else {
        prLamB_buf9a_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf9a_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamB_buf9a_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf9a_we0 = grp_calc_n_12_fu_7606_prLamB_buf9a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf9a_we0 = grp_calc_n_fu_7175_prLamB_buf9a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf9a_we0 = grp_write_result_12_fu_6479_prLamB_buf9a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamB_buf9a_we0 = grp_write_result_fu_4833_prLamB_buf9a_we0.read();
    } else {
        prLamB_buf9a_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf_address0 = grp_calc_n_23_fu_7881_prLamB_buf_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf_address0 = grp_calc_n_12_fu_7606_prLamB_buf_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf_address0 = grp_calc_n_fu_7175_prLamB_buf_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf_address0 = grp_write_result_23_fu_6795_prLamB_buf_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf_address0 = grp_write_result_12_fu_6479_prLamB_buf_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf_address0 = grp_write_result_fu_4833_prLamB_buf_address0.read();
    } else {
        prLamB_buf_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf_ce0 = grp_calc_n_23_fu_7881_prLamB_buf_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf_ce0 = grp_calc_n_12_fu_7606_prLamB_buf_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf_ce0 = grp_calc_n_fu_7175_prLamB_buf_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf_ce0 = grp_write_result_23_fu_6795_prLamB_buf_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf_ce0 = grp_write_result_12_fu_6479_prLamB_buf_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf_ce0 = grp_write_result_fu_4833_prLamB_buf_ce0.read();
    } else {
        prLamB_buf_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamB_buf_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf_d0 = grp_calc_n_23_fu_7881_prLamB_buf_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf_d0 = grp_calc_n_12_fu_7606_prLamB_buf_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf_d0 = grp_calc_n_fu_7175_prLamB_buf_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf_d0 = grp_write_result_23_fu_6795_prLamB_buf_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf_d0 = grp_write_result_12_fu_6479_prLamB_buf_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf_d0 = grp_write_result_fu_4833_prLamB_buf_d0.read();
    } else {
        prLamB_buf_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamB_buf_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamB_buf_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamB_buf_we0 = grp_calc_n_23_fu_7881_prLamB_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamB_buf_we0 = grp_calc_n_12_fu_7606_prLamB_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamB_buf_we0 = grp_calc_n_fu_7175_prLamB_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamB_buf_we0 = grp_write_result_23_fu_6795_prLamB_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamB_buf_we0 = grp_write_result_12_fu_6479_prLamB_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamB_buf_we0 = grp_write_result_fu_4833_prLamB_buf_we0.read();
    } else {
        prLamB_buf_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf10_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf10_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf10_address0 = grp_calc_n_12_fu_7606_prLamC_buf10_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf10_address0 = grp_calc_n_fu_7175_prLamC_buf10_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf10_address0 = grp_write_result_12_fu_6479_prLamC_buf10_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf10_address0 = grp_write_result_fu_4833_prLamC_buf10_address0.read();
    } else {
        prLamC_buf10_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf10_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf10_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf10_ce0 = grp_calc_n_12_fu_7606_prLamC_buf10_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf10_ce0 = grp_calc_n_fu_7175_prLamC_buf10_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf10_ce0 = grp_write_result_12_fu_6479_prLamC_buf10_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf10_ce0 = grp_write_result_fu_4833_prLamC_buf10_ce0.read();
    } else {
        prLamC_buf10_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf10_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf10_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf10_d0 = grp_calc_n_12_fu_7606_prLamC_buf10_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf10_d0 = grp_calc_n_fu_7175_prLamC_buf10_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf10_d0 = grp_write_result_12_fu_6479_prLamC_buf10_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf10_d0 = grp_write_result_fu_4833_prLamC_buf10_d0.read();
    } else {
        prLamC_buf10_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf10_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamC_buf10_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf10_we0 = grp_calc_n_12_fu_7606_prLamC_buf10_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf10_we0 = grp_calc_n_fu_7175_prLamC_buf10_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf10_we0 = grp_write_result_12_fu_6479_prLamC_buf10_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf10_we0 = grp_write_result_fu_4833_prLamC_buf10_we0.read();
    } else {
        prLamC_buf10_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf10a_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf10a_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf10a_address0 = grp_calc_n_23_fu_7881_prLamC_buf10a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf10a_address0 = grp_calc_n_12_fu_7606_prLamC_buf10a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf10a_address0 = grp_calc_n_fu_7175_prLamC_buf10a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_buf10a_address0 = grp_write_result_23_fu_6795_prLamC_buf10a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf10a_address0 = grp_write_result_12_fu_6479_prLamC_buf10a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_buf10a_address0 = grp_write_result_fu_4833_prLamC_buf10a_address0.read();
    } else {
        prLamC_buf10a_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf10a_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf10a_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf10a_ce0 = grp_calc_n_23_fu_7881_prLamC_buf10a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf10a_ce0 = grp_calc_n_12_fu_7606_prLamC_buf10a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf10a_ce0 = grp_calc_n_fu_7175_prLamC_buf10a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_buf10a_ce0 = grp_write_result_23_fu_6795_prLamC_buf10a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf10a_ce0 = grp_write_result_12_fu_6479_prLamC_buf10a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_buf10a_ce0 = grp_write_result_fu_4833_prLamC_buf10a_ce0.read();
    } else {
        prLamC_buf10a_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf10a_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf10a_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf10a_d0 = grp_calc_n_23_fu_7881_prLamC_buf10a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf10a_d0 = grp_calc_n_12_fu_7606_prLamC_buf10a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf10a_d0 = grp_calc_n_fu_7175_prLamC_buf10a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_buf10a_d0 = grp_write_result_23_fu_6795_prLamC_buf10a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf10a_d0 = grp_write_result_12_fu_6479_prLamC_buf10a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_buf10a_d0 = grp_write_result_fu_4833_prLamC_buf10a_d0.read();
    } else {
        prLamC_buf10a_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf10a_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamC_buf10a_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf10a_we0 = grp_calc_n_23_fu_7881_prLamC_buf10a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf10a_we0 = grp_calc_n_12_fu_7606_prLamC_buf10a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf10a_we0 = grp_calc_n_fu_7175_prLamC_buf10a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_buf10a_we0 = grp_write_result_23_fu_6795_prLamC_buf10a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf10a_we0 = grp_write_result_12_fu_6479_prLamC_buf10a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_buf10a_we0 = grp_write_result_fu_4833_prLamC_buf10a_we0.read();
    } else {
        prLamC_buf10a_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf10b_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf10b_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf10b_address0 = grp_calc_n_23_fu_7881_prLamC_buf10b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf10b_address0 = grp_calc_n_12_fu_7606_prLamC_buf10b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf10b_address0 = grp_calc_n_fu_7175_prLamC_buf10b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_buf10b_address0 = grp_write_result_23_fu_6795_prLamC_buf10b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf10b_address0 = grp_write_result_12_fu_6479_prLamC_buf10b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf10b_address0 = grp_write_result_fu_4833_prLamC_buf10b_address0.read();
    } else {
        prLamC_buf10b_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf10b_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf10b_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf10b_ce0 = grp_calc_n_23_fu_7881_prLamC_buf10b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf10b_ce0 = grp_calc_n_12_fu_7606_prLamC_buf10b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf10b_ce0 = grp_calc_n_fu_7175_prLamC_buf10b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_buf10b_ce0 = grp_write_result_23_fu_6795_prLamC_buf10b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf10b_ce0 = grp_write_result_12_fu_6479_prLamC_buf10b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf10b_ce0 = grp_write_result_fu_4833_prLamC_buf10b_ce0.read();
    } else {
        prLamC_buf10b_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf10b_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf10b_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf10b_d0 = grp_calc_n_23_fu_7881_prLamC_buf10b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf10b_d0 = grp_calc_n_12_fu_7606_prLamC_buf10b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf10b_d0 = grp_calc_n_fu_7175_prLamC_buf10b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_buf10b_d0 = grp_write_result_23_fu_6795_prLamC_buf10b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf10b_d0 = grp_write_result_12_fu_6479_prLamC_buf10b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf10b_d0 = grp_write_result_fu_4833_prLamC_buf10b_d0.read();
    } else {
        prLamC_buf10b_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf10b_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamC_buf10b_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf10b_we0 = grp_calc_n_23_fu_7881_prLamC_buf10b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf10b_we0 = grp_calc_n_12_fu_7606_prLamC_buf10b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf10b_we0 = grp_calc_n_fu_7175_prLamC_buf10b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_buf10b_we0 = grp_write_result_23_fu_6795_prLamC_buf10b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf10b_we0 = grp_write_result_12_fu_6479_prLamC_buf10b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf10b_we0 = grp_write_result_fu_4833_prLamC_buf10b_we0.read();
    } else {
        prLamC_buf10b_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf1_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf1_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf1_address0 = grp_calc_n_23_fu_7881_prLamC_buf1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf1_address0 = grp_calc_n_12_fu_7606_prLamC_buf1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf1_address0 = grp_calc_n_fu_7175_prLamC_buf1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf1_address0 = grp_write_result_23_fu_6795_prLamC_buf1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf1_address0 = grp_write_result_12_fu_6479_prLamC_buf1_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf1_address0 = grp_write_result_fu_4833_prLamC_buf1_address0.read();
    } else {
        prLamC_buf1_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf1_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf1_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf1_ce0 = grp_calc_n_23_fu_7881_prLamC_buf1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf1_ce0 = grp_calc_n_12_fu_7606_prLamC_buf1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf1_ce0 = grp_calc_n_fu_7175_prLamC_buf1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf1_ce0 = grp_write_result_23_fu_6795_prLamC_buf1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf1_ce0 = grp_write_result_12_fu_6479_prLamC_buf1_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf1_ce0 = grp_write_result_fu_4833_prLamC_buf1_ce0.read();
    } else {
        prLamC_buf1_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf1_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf1_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf1_d0 = grp_calc_n_23_fu_7881_prLamC_buf1_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf1_d0 = grp_calc_n_12_fu_7606_prLamC_buf1_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf1_d0 = grp_calc_n_fu_7175_prLamC_buf1_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf1_d0 = grp_write_result_23_fu_6795_prLamC_buf1_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf1_d0 = grp_write_result_12_fu_6479_prLamC_buf1_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf1_d0 = grp_write_result_fu_4833_prLamC_buf1_d0.read();
    } else {
        prLamC_buf1_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf1_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamC_buf1_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf1_we0 = grp_calc_n_23_fu_7881_prLamC_buf1_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf1_we0 = grp_calc_n_12_fu_7606_prLamC_buf1_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf1_we0 = grp_calc_n_fu_7175_prLamC_buf1_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf1_we0 = grp_write_result_23_fu_6795_prLamC_buf1_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf1_we0 = grp_write_result_12_fu_6479_prLamC_buf1_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf1_we0 = grp_write_result_fu_4833_prLamC_buf1_we0.read();
    } else {
        prLamC_buf1_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf2_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf2_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf2_address0 = grp_calc_n_23_fu_7881_prLamC_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf2_address0 = grp_calc_n_fu_7175_prLamC_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_buf2_address0 = grp_write_result_23_fu_6795_prLamC_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf2_address0 = grp_write_result_fu_4833_prLamC_buf2_address0.read();
    } else {
        prLamC_buf2_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf2_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf2_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf2_ce0 = grp_calc_n_23_fu_7881_prLamC_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf2_ce0 = grp_calc_n_fu_7175_prLamC_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_buf2_ce0 = grp_write_result_23_fu_6795_prLamC_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf2_ce0 = grp_write_result_fu_4833_prLamC_buf2_ce0.read();
    } else {
        prLamC_buf2_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf2_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf2_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf2_d0 = grp_calc_n_23_fu_7881_prLamC_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf2_d0 = grp_calc_n_fu_7175_prLamC_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_buf2_d0 = grp_write_result_23_fu_6795_prLamC_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf2_d0 = grp_write_result_fu_4833_prLamC_buf2_d0.read();
    } else {
        prLamC_buf2_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf2_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamC_buf2_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf2_we0 = grp_calc_n_23_fu_7881_prLamC_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf2_we0 = grp_calc_n_fu_7175_prLamC_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_buf2_we0 = grp_write_result_23_fu_6795_prLamC_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf2_we0 = grp_write_result_fu_4833_prLamC_buf2_we0.read();
    } else {
        prLamC_buf2_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf2a_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf2a_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf2a_address0 = grp_calc_n_23_fu_7881_prLamC_buf2a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf2a_address0 = grp_calc_n_fu_7175_prLamC_buf2a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_buf2a_address0 = grp_write_result_fu_4833_prLamC_buf2a_address0.read();
    } else {
        prLamC_buf2a_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf2a_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf2a_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf2a_ce0 = grp_calc_n_23_fu_7881_prLamC_buf2a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf2a_ce0 = grp_calc_n_fu_7175_prLamC_buf2a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_buf2a_ce0 = grp_write_result_fu_4833_prLamC_buf2a_ce0.read();
    } else {
        prLamC_buf2a_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf2a_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf2a_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf2a_d0 = grp_calc_n_23_fu_7881_prLamC_buf2a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf2a_d0 = grp_calc_n_fu_7175_prLamC_buf2a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_buf2a_d0 = grp_write_result_fu_4833_prLamC_buf2a_d0.read();
    } else {
        prLamC_buf2a_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf2a_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamC_buf2a_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf2a_we0 = grp_calc_n_23_fu_7881_prLamC_buf2a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf2a_we0 = grp_calc_n_fu_7175_prLamC_buf2a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_buf2a_we0 = grp_write_result_fu_4833_prLamC_buf2a_we0.read();
    } else {
        prLamC_buf2a_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf2b_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf2b_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf2b_address0 = grp_calc_n_23_fu_7881_prLamC_buf2b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf2b_address0 = grp_calc_n_fu_7175_prLamC_buf2b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf2b_address0 = grp_write_result_fu_4833_prLamC_buf2b_address0.read();
    } else {
        prLamC_buf2b_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf2b_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf2b_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf2b_ce0 = grp_calc_n_23_fu_7881_prLamC_buf2b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf2b_ce0 = grp_calc_n_fu_7175_prLamC_buf2b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf2b_ce0 = grp_write_result_fu_4833_prLamC_buf2b_ce0.read();
    } else {
        prLamC_buf2b_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf2b_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf2b_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf2b_d0 = grp_calc_n_23_fu_7881_prLamC_buf2b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf2b_d0 = grp_calc_n_fu_7175_prLamC_buf2b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf2b_d0 = grp_write_result_fu_4833_prLamC_buf2b_d0.read();
    } else {
        prLamC_buf2b_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf2b_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamC_buf2b_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf2b_we0 = grp_calc_n_23_fu_7881_prLamC_buf2b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf2b_we0 = grp_calc_n_fu_7175_prLamC_buf2b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf2b_we0 = grp_write_result_fu_4833_prLamC_buf2b_we0.read();
    } else {
        prLamC_buf2b_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf3_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf3_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf3_address0 = grp_calc_n_23_fu_7881_prLamC_buf3_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf3_address0 = grp_calc_n_12_fu_7606_prLamC_buf3_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf3_address0 = grp_calc_n_fu_7175_prLamC_buf3_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf3_address0 = grp_write_result_23_fu_6795_prLamC_buf3_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf3_address0 = grp_write_result_12_fu_6479_prLamC_buf3_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf3_address0 = grp_write_result_fu_4833_prLamC_buf3_address0.read();
    } else {
        prLamC_buf3_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf3_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf3_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf3_ce0 = grp_calc_n_23_fu_7881_prLamC_buf3_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf3_ce0 = grp_calc_n_12_fu_7606_prLamC_buf3_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf3_ce0 = grp_calc_n_fu_7175_prLamC_buf3_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf3_ce0 = grp_write_result_23_fu_6795_prLamC_buf3_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf3_ce0 = grp_write_result_12_fu_6479_prLamC_buf3_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf3_ce0 = grp_write_result_fu_4833_prLamC_buf3_ce0.read();
    } else {
        prLamC_buf3_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf3_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf3_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf3_d0 = grp_calc_n_23_fu_7881_prLamC_buf3_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf3_d0 = grp_calc_n_12_fu_7606_prLamC_buf3_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf3_d0 = grp_calc_n_fu_7175_prLamC_buf3_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf3_d0 = grp_write_result_23_fu_6795_prLamC_buf3_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf3_d0 = grp_write_result_12_fu_6479_prLamC_buf3_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf3_d0 = grp_write_result_fu_4833_prLamC_buf3_d0.read();
    } else {
        prLamC_buf3_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf3_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamC_buf3_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf3_we0 = grp_calc_n_23_fu_7881_prLamC_buf3_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf3_we0 = grp_calc_n_12_fu_7606_prLamC_buf3_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf3_we0 = grp_calc_n_fu_7175_prLamC_buf3_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf3_we0 = grp_write_result_23_fu_6795_prLamC_buf3_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf3_we0 = grp_write_result_12_fu_6479_prLamC_buf3_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf3_we0 = grp_write_result_fu_4833_prLamC_buf3_we0.read();
    } else {
        prLamC_buf3_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf4_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf4_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf4_address0 = grp_calc_n_23_fu_7881_prLamC_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf4_address0 = grp_calc_n_12_fu_7606_prLamC_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf4_address0 = grp_calc_n_fu_7175_prLamC_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf4_address0 = grp_write_result_12_fu_6479_prLamC_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf4_address0 = grp_write_result_fu_4833_prLamC_buf4_address0.read();
    } else {
        prLamC_buf4_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf4_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf4_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf4_ce0 = grp_calc_n_23_fu_7881_prLamC_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf4_ce0 = grp_calc_n_12_fu_7606_prLamC_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf4_ce0 = grp_calc_n_fu_7175_prLamC_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf4_ce0 = grp_write_result_12_fu_6479_prLamC_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf4_ce0 = grp_write_result_fu_4833_prLamC_buf4_ce0.read();
    } else {
        prLamC_buf4_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf4_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf4_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf4_d0 = grp_calc_n_23_fu_7881_prLamC_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf4_d0 = grp_calc_n_12_fu_7606_prLamC_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf4_d0 = grp_calc_n_fu_7175_prLamC_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf4_d0 = grp_write_result_12_fu_6479_prLamC_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf4_d0 = grp_write_result_fu_4833_prLamC_buf4_d0.read();
    } else {
        prLamC_buf4_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf4_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamC_buf4_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf4_we0 = grp_calc_n_23_fu_7881_prLamC_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf4_we0 = grp_calc_n_12_fu_7606_prLamC_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf4_we0 = grp_calc_n_fu_7175_prLamC_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf4_we0 = grp_write_result_12_fu_6479_prLamC_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf4_we0 = grp_write_result_fu_4833_prLamC_buf4_we0.read();
    } else {
        prLamC_buf4_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf4a_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf4a_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf4a_address0 = grp_calc_n_23_fu_7881_prLamC_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf4a_address0 = grp_calc_n_12_fu_7606_prLamC_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf4a_address0 = grp_calc_n_fu_7175_prLamC_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf4a_address0 = grp_write_result_12_fu_6479_prLamC_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_buf4a_address0 = grp_write_result_fu_4833_prLamC_buf4a_address0.read();
    } else {
        prLamC_buf4a_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf4a_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf4a_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf4a_ce0 = grp_calc_n_23_fu_7881_prLamC_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf4a_ce0 = grp_calc_n_12_fu_7606_prLamC_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf4a_ce0 = grp_calc_n_fu_7175_prLamC_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf4a_ce0 = grp_write_result_12_fu_6479_prLamC_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_buf4a_ce0 = grp_write_result_fu_4833_prLamC_buf4a_ce0.read();
    } else {
        prLamC_buf4a_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf4a_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf4a_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf4a_d0 = grp_calc_n_23_fu_7881_prLamC_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf4a_d0 = grp_calc_n_12_fu_7606_prLamC_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf4a_d0 = grp_calc_n_fu_7175_prLamC_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf4a_d0 = grp_write_result_12_fu_6479_prLamC_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_buf4a_d0 = grp_write_result_fu_4833_prLamC_buf4a_d0.read();
    } else {
        prLamC_buf4a_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf4a_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamC_buf4a_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf4a_we0 = grp_calc_n_23_fu_7881_prLamC_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf4a_we0 = grp_calc_n_12_fu_7606_prLamC_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf4a_we0 = grp_calc_n_fu_7175_prLamC_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf4a_we0 = grp_write_result_12_fu_6479_prLamC_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_buf4a_we0 = grp_write_result_fu_4833_prLamC_buf4a_we0.read();
    } else {
        prLamC_buf4a_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf4b_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf4b_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf4b_address0 = grp_calc_n_23_fu_7881_prLamC_buf4b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf4b_address0 = grp_calc_n_12_fu_7606_prLamC_buf4b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf4b_address0 = grp_calc_n_fu_7175_prLamC_buf4b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf4b_address0 = grp_write_result_12_fu_6479_prLamC_buf4b_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf4b_address0 = grp_write_result_fu_4833_prLamC_buf4b_address0.read();
    } else {
        prLamC_buf4b_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf4b_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf4b_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf4b_ce0 = grp_calc_n_23_fu_7881_prLamC_buf4b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf4b_ce0 = grp_calc_n_12_fu_7606_prLamC_buf4b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf4b_ce0 = grp_calc_n_fu_7175_prLamC_buf4b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf4b_ce0 = grp_write_result_12_fu_6479_prLamC_buf4b_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf4b_ce0 = grp_write_result_fu_4833_prLamC_buf4b_ce0.read();
    } else {
        prLamC_buf4b_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf4b_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf4b_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf4b_d0 = grp_calc_n_23_fu_7881_prLamC_buf4b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf4b_d0 = grp_calc_n_12_fu_7606_prLamC_buf4b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf4b_d0 = grp_calc_n_fu_7175_prLamC_buf4b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf4b_d0 = grp_write_result_12_fu_6479_prLamC_buf4b_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf4b_d0 = grp_write_result_fu_4833_prLamC_buf4b_d0.read();
    } else {
        prLamC_buf4b_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf4b_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamC_buf4b_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf4b_we0 = grp_calc_n_23_fu_7881_prLamC_buf4b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf4b_we0 = grp_calc_n_12_fu_7606_prLamC_buf4b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf4b_we0 = grp_calc_n_fu_7175_prLamC_buf4b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLamC_buf4b_we0 = grp_write_result_12_fu_6479_prLamC_buf4b_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf4b_we0 = grp_write_result_fu_4833_prLamC_buf4b_we0.read();
    } else {
        prLamC_buf4b_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf5_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf5_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf5_address0 = grp_calc_n_23_fu_7881_prLamC_buf5_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf5_address0 = grp_calc_n_12_fu_7606_prLamC_buf5_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf5_address0 = grp_calc_n_fu_7175_prLamC_buf5_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf5_address0 = grp_write_result_23_fu_6795_prLamC_buf5_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf5_address0 = grp_write_result_12_fu_6479_prLamC_buf5_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf5_address0 = grp_write_result_fu_4833_prLamC_buf5_address0.read();
    } else {
        prLamC_buf5_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf5_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf5_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf5_ce0 = grp_calc_n_23_fu_7881_prLamC_buf5_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf5_ce0 = grp_calc_n_12_fu_7606_prLamC_buf5_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf5_ce0 = grp_calc_n_fu_7175_prLamC_buf5_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf5_ce0 = grp_write_result_23_fu_6795_prLamC_buf5_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf5_ce0 = grp_write_result_12_fu_6479_prLamC_buf5_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf5_ce0 = grp_write_result_fu_4833_prLamC_buf5_ce0.read();
    } else {
        prLamC_buf5_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf5_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf5_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf5_d0 = grp_calc_n_23_fu_7881_prLamC_buf5_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf5_d0 = grp_calc_n_12_fu_7606_prLamC_buf5_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf5_d0 = grp_calc_n_fu_7175_prLamC_buf5_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf5_d0 = grp_write_result_23_fu_6795_prLamC_buf5_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf5_d0 = grp_write_result_12_fu_6479_prLamC_buf5_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf5_d0 = grp_write_result_fu_4833_prLamC_buf5_d0.read();
    } else {
        prLamC_buf5_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf5_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamC_buf5_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf5_we0 = grp_calc_n_23_fu_7881_prLamC_buf5_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf5_we0 = grp_calc_n_12_fu_7606_prLamC_buf5_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf5_we0 = grp_calc_n_fu_7175_prLamC_buf5_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf5_we0 = grp_write_result_23_fu_6795_prLamC_buf5_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf5_we0 = grp_write_result_12_fu_6479_prLamC_buf5_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf5_we0 = grp_write_result_fu_4833_prLamC_buf5_we0.read();
    } else {
        prLamC_buf5_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf6_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf6_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf6_address0 = grp_calc_n_23_fu_7881_prLamC_buf6_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf6_address0 = grp_calc_n_12_fu_7606_prLamC_buf6_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf6_address0 = grp_calc_n_fu_7175_prLamC_buf6_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf6_address0 = grp_write_result_23_fu_6795_prLamC_buf6_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf6_address0 = grp_write_result_12_fu_6479_prLamC_buf6_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf6_address0 = grp_write_result_fu_4833_prLamC_buf6_address0.read();
    } else {
        prLamC_buf6_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf6_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf6_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf6_ce0 = grp_calc_n_23_fu_7881_prLamC_buf6_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf6_ce0 = grp_calc_n_12_fu_7606_prLamC_buf6_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf6_ce0 = grp_calc_n_fu_7175_prLamC_buf6_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf6_ce0 = grp_write_result_23_fu_6795_prLamC_buf6_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf6_ce0 = grp_write_result_12_fu_6479_prLamC_buf6_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf6_ce0 = grp_write_result_fu_4833_prLamC_buf6_ce0.read();
    } else {
        prLamC_buf6_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf6_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf6_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf6_d0 = grp_calc_n_23_fu_7881_prLamC_buf6_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf6_d0 = grp_calc_n_12_fu_7606_prLamC_buf6_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf6_d0 = grp_calc_n_fu_7175_prLamC_buf6_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf6_d0 = grp_write_result_23_fu_6795_prLamC_buf6_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf6_d0 = grp_write_result_12_fu_6479_prLamC_buf6_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf6_d0 = grp_write_result_fu_4833_prLamC_buf6_d0.read();
    } else {
        prLamC_buf6_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf6_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamC_buf6_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf6_we0 = grp_calc_n_23_fu_7881_prLamC_buf6_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf6_we0 = grp_calc_n_12_fu_7606_prLamC_buf6_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf6_we0 = grp_calc_n_fu_7175_prLamC_buf6_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf6_we0 = grp_write_result_23_fu_6795_prLamC_buf6_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf6_we0 = grp_write_result_12_fu_6479_prLamC_buf6_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf6_we0 = grp_write_result_fu_4833_prLamC_buf6_we0.read();
    } else {
        prLamC_buf6_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf7_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf7_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf7_address0 = grp_calc_n_12_fu_7606_prLamC_buf7_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf7_address0 = grp_calc_n_fu_7175_prLamC_buf7_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf7_address0 = grp_write_result_12_fu_6479_prLamC_buf7_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf7_address0 = grp_write_result_fu_4833_prLamC_buf7_address0.read();
    } else {
        prLamC_buf7_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf7_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf7_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf7_ce0 = grp_calc_n_12_fu_7606_prLamC_buf7_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf7_ce0 = grp_calc_n_fu_7175_prLamC_buf7_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf7_ce0 = grp_write_result_12_fu_6479_prLamC_buf7_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf7_ce0 = grp_write_result_fu_4833_prLamC_buf7_ce0.read();
    } else {
        prLamC_buf7_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf7_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf7_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf7_d0 = grp_calc_n_12_fu_7606_prLamC_buf7_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf7_d0 = grp_calc_n_fu_7175_prLamC_buf7_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf7_d0 = grp_write_result_12_fu_6479_prLamC_buf7_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf7_d0 = grp_write_result_fu_4833_prLamC_buf7_d0.read();
    } else {
        prLamC_buf7_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf7_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamC_buf7_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf7_we0 = grp_calc_n_12_fu_7606_prLamC_buf7_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf7_we0 = grp_calc_n_fu_7175_prLamC_buf7_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf7_we0 = grp_write_result_12_fu_6479_prLamC_buf7_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf7_we0 = grp_write_result_fu_4833_prLamC_buf7_we0.read();
    } else {
        prLamC_buf7_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf9_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf9_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf9_address0 = grp_calc_n_fu_7175_prLamC_buf9_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf9_address0 = grp_write_result_fu_4833_prLamC_buf9_address0.read();
    } else {
        prLamC_buf9_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf9_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf9_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf9_ce0 = grp_calc_n_fu_7175_prLamC_buf9_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf9_ce0 = grp_write_result_fu_4833_prLamC_buf9_ce0.read();
    } else {
        prLamC_buf9_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf9_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()))) {
        prLamC_buf9_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf9_d0 = grp_calc_n_fu_7175_prLamC_buf9_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf9_d0 = grp_write_result_fu_4833_prLamC_buf9_d0.read();
    } else {
        prLamC_buf9_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf9_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state8.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, icmp_reg_9087.read())))) {
        prLamC_buf9_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf9_we0 = grp_calc_n_fu_7175_prLamC_buf9_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf9_we0 = grp_write_result_fu_4833_prLamC_buf9_we0.read();
    } else {
        prLamC_buf9_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf_address0 = grp_calc_n_23_fu_7881_prLamC_buf_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf_address0 = grp_calc_n_12_fu_7606_prLamC_buf_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf_address0 = grp_calc_n_fu_7175_prLamC_buf_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf_address0 = grp_write_result_23_fu_6795_prLamC_buf_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf_address0 = grp_write_result_12_fu_6479_prLamC_buf_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf_address0 = grp_write_result_fu_4833_prLamC_buf_address0.read();
    } else {
        prLamC_buf_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf_ce0 = grp_calc_n_23_fu_7881_prLamC_buf_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf_ce0 = grp_calc_n_12_fu_7606_prLamC_buf_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf_ce0 = grp_calc_n_fu_7175_prLamC_buf_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf_ce0 = grp_write_result_23_fu_6795_prLamC_buf_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf_ce0 = grp_write_result_12_fu_6479_prLamC_buf_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf_ce0 = grp_write_result_fu_4833_prLamC_buf_ce0.read();
    } else {
        prLamC_buf_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_buf_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf_d0 = grp_calc_n_23_fu_7881_prLamC_buf_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf_d0 = grp_calc_n_12_fu_7606_prLamC_buf_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf_d0 = grp_calc_n_fu_7175_prLamC_buf_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf_d0 = grp_write_result_23_fu_6795_prLamC_buf_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf_d0 = grp_write_result_12_fu_6479_prLamC_buf_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf_d0 = grp_write_result_fu_4833_prLamC_buf_d0.read();
    } else {
        prLamC_buf_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_buf_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamC_buf_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_buf_we0 = grp_calc_n_23_fu_7881_prLamC_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLamC_buf_we0 = grp_calc_n_12_fu_7606_prLamC_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_buf_we0 = grp_calc_n_fu_7175_prLamC_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLamC_buf_we0 = grp_write_result_23_fu_6795_prLamC_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLamC_buf_we0 = grp_write_result_12_fu_6479_prLamC_buf_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_buf_we0 = grp_write_result_fu_4833_prLamC_buf_we0.read();
    } else {
        prLamC_buf_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_bufa_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_bufa_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_bufa_address0 = grp_calc_n_23_fu_7881_prLamC_bufa_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_bufa_address0 = grp_calc_n_fu_7175_prLamC_bufa_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_bufa_address0 = grp_write_result_23_fu_6795_prLamC_bufa_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_bufa_address0 = grp_write_result_fu_4833_prLamC_bufa_address0.read();
    } else {
        prLamC_bufa_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_bufa_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_bufa_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_bufa_ce0 = grp_calc_n_23_fu_7881_prLamC_bufa_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_bufa_ce0 = grp_calc_n_fu_7175_prLamC_bufa_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_bufa_ce0 = grp_write_result_23_fu_6795_prLamC_bufa_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_bufa_ce0 = grp_write_result_fu_4833_prLamC_bufa_ce0.read();
    } else {
        prLamC_bufa_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_bufa_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_bufa_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_bufa_d0 = grp_calc_n_23_fu_7881_prLamC_bufa_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_bufa_d0 = grp_calc_n_fu_7175_prLamC_bufa_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_bufa_d0 = grp_write_result_23_fu_6795_prLamC_bufa_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_bufa_d0 = grp_write_result_fu_4833_prLamC_bufa_d0.read();
    } else {
        prLamC_bufa_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_bufa_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamC_bufa_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_bufa_we0 = grp_calc_n_23_fu_7881_prLamC_bufa_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_bufa_we0 = grp_calc_n_fu_7175_prLamC_bufa_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_bufa_we0 = grp_write_result_23_fu_6795_prLamC_bufa_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLamC_bufa_we0 = grp_write_result_fu_4833_prLamC_bufa_we0.read();
    } else {
        prLamC_bufa_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_bufb_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_bufb_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_bufb_address0 = grp_calc_n_23_fu_7881_prLamC_bufb_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_bufb_address0 = grp_calc_n_fu_7175_prLamC_bufb_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_bufb_address0 = grp_write_result_23_fu_6795_prLamC_bufb_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_bufb_address0 = grp_write_result_fu_4833_prLamC_bufb_address0.read();
    } else {
        prLamC_bufb_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_bufb_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_bufb_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_bufb_ce0 = grp_calc_n_23_fu_7881_prLamC_bufb_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_bufb_ce0 = grp_calc_n_fu_7175_prLamC_bufb_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_bufb_ce0 = grp_write_result_23_fu_6795_prLamC_bufb_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_bufb_ce0 = grp_write_result_fu_4833_prLamC_bufb_ce0.read();
    } else {
        prLamC_bufb_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_bufb_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLamC_bufb_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_bufb_d0 = grp_calc_n_23_fu_7881_prLamC_bufb_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_bufb_d0 = grp_calc_n_fu_7175_prLamC_bufb_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_bufb_d0 = grp_write_result_23_fu_6795_prLamC_bufb_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_bufb_d0 = grp_write_result_fu_4833_prLamC_bufb_d0.read();
    } else {
        prLamC_bufb_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLamC_bufb_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLamC_bufb_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLamC_bufb_we0 = grp_calc_n_23_fu_7881_prLamC_bufb_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLamC_bufb_we0 = grp_calc_n_fu_7175_prLamC_bufb_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLamC_bufb_we0 = grp_write_result_23_fu_6795_prLamC_bufb_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLamC_bufb_we0 = grp_write_result_fu_4833_prLamC_bufb_we0.read();
    } else {
        prLamC_bufb_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam_buf2_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam_buf2_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam_buf2_address0 = grp_calc_n_23_fu_7881_prLam_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam_buf2_address0 = grp_calc_n_12_fu_7606_prLam_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam_buf2_address0 = grp_calc_n_fu_7175_prLam_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLam_buf2_address0 = grp_write_result_23_fu_6795_prLam_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLam_buf2_address0 = grp_write_result_12_fu_6479_prLam_buf2_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLam_buf2_address0 = grp_write_result_fu_4833_prLam_buf2_address0.read();
    } else {
        prLam_buf2_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam_buf2_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam_buf2_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam_buf2_ce0 = grp_calc_n_23_fu_7881_prLam_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam_buf2_ce0 = grp_calc_n_12_fu_7606_prLam_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam_buf2_ce0 = grp_calc_n_fu_7175_prLam_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLam_buf2_ce0 = grp_write_result_23_fu_6795_prLam_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLam_buf2_ce0 = grp_write_result_12_fu_6479_prLam_buf2_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLam_buf2_ce0 = grp_write_result_fu_4833_prLam_buf2_ce0.read();
    } else {
        prLam_buf2_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam_buf2_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam_buf2_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam_buf2_d0 = grp_calc_n_23_fu_7881_prLam_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam_buf2_d0 = grp_calc_n_12_fu_7606_prLam_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam_buf2_d0 = grp_calc_n_fu_7175_prLam_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLam_buf2_d0 = grp_write_result_23_fu_6795_prLam_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLam_buf2_d0 = grp_write_result_12_fu_6479_prLam_buf2_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLam_buf2_d0 = grp_write_result_fu_4833_prLam_buf2_d0.read();
    } else {
        prLam_buf2_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam_buf2_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLam_buf2_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam_buf2_we0 = grp_calc_n_23_fu_7881_prLam_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam_buf2_we0 = grp_calc_n_12_fu_7606_prLam_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam_buf2_we0 = grp_calc_n_fu_7175_prLam_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state22.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state45.read())))) {
        prLam_buf2_we0 = grp_write_result_23_fu_6795_prLam_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLam_buf2_we0 = grp_write_result_12_fu_6479_prLam_buf2_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state29.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state52.read())))) {
        prLam_buf2_we0 = grp_write_result_fu_4833_prLam_buf2_we0.read();
    } else {
        prLam_buf2_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam_buf4_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam_buf4_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam_buf4_address0 = grp_calc_n_23_fu_7881_prLam_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam_buf4_address0 = grp_calc_n_12_fu_7606_prLam_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam_buf4_address0 = grp_calc_n_fu_7175_prLam_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam_buf4_address0 = grp_write_result_23_fu_6795_prLam_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLam_buf4_address0 = grp_write_result_12_fu_6479_prLam_buf4_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam_buf4_address0 = grp_write_result_fu_4833_prLam_buf4_address0.read();
    } else {
        prLam_buf4_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam_buf4_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam_buf4_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam_buf4_ce0 = grp_calc_n_23_fu_7881_prLam_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam_buf4_ce0 = grp_calc_n_12_fu_7606_prLam_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam_buf4_ce0 = grp_calc_n_fu_7175_prLam_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam_buf4_ce0 = grp_write_result_23_fu_6795_prLam_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLam_buf4_ce0 = grp_write_result_12_fu_6479_prLam_buf4_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam_buf4_ce0 = grp_write_result_fu_4833_prLam_buf4_ce0.read();
    } else {
        prLam_buf4_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam_buf4_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam_buf4_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam_buf4_d0 = grp_calc_n_23_fu_7881_prLam_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam_buf4_d0 = grp_calc_n_12_fu_7606_prLam_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam_buf4_d0 = grp_calc_n_fu_7175_prLam_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam_buf4_d0 = grp_write_result_23_fu_6795_prLam_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLam_buf4_d0 = grp_write_result_12_fu_6479_prLam_buf4_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam_buf4_d0 = grp_write_result_fu_4833_prLam_buf4_d0.read();
    } else {
        prLam_buf4_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam_buf4_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLam_buf4_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam_buf4_we0 = grp_calc_n_23_fu_7881_prLam_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam_buf4_we0 = grp_calc_n_12_fu_7606_prLam_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam_buf4_we0 = grp_calc_n_fu_7175_prLam_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam_buf4_we0 = grp_write_result_23_fu_6795_prLam_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state15.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state38.read())))) {
        prLam_buf4_we0 = grp_write_result_12_fu_6479_prLam_buf4_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam_buf4_we0 = grp_write_result_fu_4833_prLam_buf4_we0.read();
    } else {
        prLam_buf4_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam_buf4a_address0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam_buf4a_address0 =  (sc_lv<10>) (inx_cast1_reg_8910.read());
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam_buf4a_address0 = grp_calc_n_23_fu_7881_prLam_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam_buf4a_address0 = grp_calc_n_12_fu_7606_prLam_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam_buf4a_address0 = grp_calc_n_fu_7175_prLam_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam_buf4a_address0 = grp_write_result_23_fu_6795_prLam_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam_buf4a_address0 = grp_write_result_12_fu_6479_prLam_buf4a_address0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam_buf4a_address0 = grp_write_result_fu_4833_prLam_buf4a_address0.read();
    } else {
        prLam_buf4a_address0 = "XXXXXXXXXX";
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam_buf4a_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam_buf4a_ce0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam_buf4a_ce0 = grp_calc_n_23_fu_7881_prLam_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam_buf4a_ce0 = grp_calc_n_12_fu_7606_prLam_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam_buf4a_ce0 = grp_calc_n_fu_7175_prLam_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam_buf4a_ce0 = grp_write_result_23_fu_6795_prLam_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam_buf4a_ce0 = grp_write_result_12_fu_6479_prLam_buf4a_ce0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam_buf4a_ce0 = grp_write_result_fu_4833_prLam_buf4a_ce0.read();
    } else {
        prLam_buf4a_ce0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam_buf4a_d0() {
    if ((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read()))) {
        prLam_buf4a_d0 = ap_const_lv16_0;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam_buf4a_d0 = grp_calc_n_23_fu_7881_prLam_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam_buf4a_d0 = grp_calc_n_12_fu_7606_prLam_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam_buf4a_d0 = grp_calc_n_fu_7175_prLam_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam_buf4a_d0 = grp_write_result_23_fu_6795_prLam_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam_buf4a_d0 = grp_write_result_12_fu_6479_prLam_buf4a_d0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam_buf4a_d0 = grp_write_result_fu_4833_prLam_buf4a_d0.read();
    } else {
        prLam_buf4a_d0 =  (sc_lv<16>) ("XXXXXXXXXXXXXXXX");
    }
}

void HLSLdpcLogDecScaledMin::thread_prLam_buf4a_we0() {
    if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state6.read())))) {
        prLam_buf4a_we0 = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read())))) {
        prLam_buf4a_we0 = grp_calc_n_23_fu_7881_prLam_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1087_reg_9281.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1090_reg_9285.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1106_reg_9345.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1109_reg_9349.read())))) {
        prLam_buf4a_we0 = grp_calc_n_12_fu_7606_prLam_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state32.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1084_reg_9277.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state55.read()) && 
                 !esl_seteq<1,1,1>(ap_const_lv1_0, tmp_1103_reg_9341.read())))) {
        prLam_buf4a_we0 = grp_calc_n_fu_7175_prLam_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state24.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state47.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state23.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state46.read())))) {
        prLam_buf4a_we0 = grp_write_result_23_fu_6795_prLam_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state17.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state40.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state16.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state39.read())))) {
        prLam_buf4a_we0 = grp_write_result_12_fu_6479_prLam_buf4a_we0.read();
    } else if (((esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state31.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state54.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state30.read())) || 
                (esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm_state53.read())))) {
        prLam_buf4a_we0 = grp_write_result_fu_4833_prLam_buf4a_we0.read();
    } else {
        prLam_buf4a_we0 = ap_const_logic_0;
    }
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp13_demorgan_fu_8403_p2() {
    sel_tmp13_demorgan_fu_8403_p2 = (grp_fu_8236_p2.read() | grp_fu_8212_p2.read());
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp13_fu_8409_p2() {
    sel_tmp13_fu_8409_p2 = (sel_tmp13_demorgan_fu_8403_p2.read() ^ ap_const_lv1_1);
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp14_fu_8415_p2() {
    sel_tmp14_fu_8415_p2 = (grp_fu_8218_p2.read() & sel_tmp13_fu_8409_p2.read());
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp15_cast_fu_8439_p3() {
    sel_tmp15_cast_fu_8439_p3 = (!sel_tmp23_fu_8433_p2.read()[0].is_01())? sc_lv<12>(): ((sel_tmp23_fu_8433_p2.read()[0].to_bool())? ap_const_lv12_200: ap_const_lv12_400);
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp1_fu_8357_p2() {
    sel_tmp1_fu_8357_p2 = (grp_fu_8200_p2.read() ^ ap_const_lv1_1);
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp22_demorgan_fu_8421_p2() {
    sel_tmp22_demorgan_fu_8421_p2 = (sel_tmp13_demorgan_fu_8403_p2.read() | grp_fu_8218_p2.read());
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp22_fu_8427_p2() {
    sel_tmp22_fu_8427_p2 = (sel_tmp22_demorgan_fu_8421_p2.read() ^ ap_const_lv1_1);
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp23_fu_8433_p2() {
    sel_tmp23_fu_8433_p2 = (grp_fu_8224_p2.read() & sel_tmp22_fu_8427_p2.read());
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp2_fu_8363_p2() {
    sel_tmp2_fu_8363_p2 = (grp_fu_8206_p2.read() & sel_tmp1_fu_8357_p2.read());
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp3_cast_fu_8381_p3() {
    sel_tmp3_cast_fu_8381_p3 = (!sel_tmp7_fu_8375_p2.read()[0].is_01())? sc_lv<12>(): ((sel_tmp7_fu_8375_p2.read()[0].to_bool())? ap_const_lv12_100: ap_const_lv12_200);
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp6_fu_8369_p2() {
    sel_tmp6_fu_8369_p2 = (grp_fu_8236_p2.read() ^ ap_const_lv1_1);
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp7_fu_8375_p2() {
    sel_tmp7_fu_8375_p2 = (grp_fu_8212_p2.read() & sel_tmp6_fu_8369_p2.read());
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp8_fu_8395_p3() {
    sel_tmp8_fu_8395_p3 = (!tmp_827_fu_8389_p2.read()[0].is_01())? sc_lv<12>(): ((tmp_827_fu_8389_p2.read()[0].to_bool())? sel_tmp3_cast_fu_8381_p3.read(): sel_tmp_fu_8349_p3.read());
}

void HLSLdpcLogDecScaledMin::thread_sel_tmp_fu_8349_p3() {
    sel_tmp_fu_8349_p3 = (!tmp_826_fu_8343_p2.read()[0].is_01())? sc_lv<12>(): ((tmp_826_fu_8343_p2.read()[0].to_bool())? storemerge6_fu_8335_p3.read(): ap_const_lv12_80);
}

void HLSLdpcLogDecScaledMin::thread_storemerge6_fu_8335_p3() {
    storemerge6_fu_8335_p3 = (!grp_fu_8200_p2.read()[0].is_01())? sc_lv<12>(): ((grp_fu_8200_p2.read()[0].to_bool())? ap_const_lv12_80: ap_const_lv12_800);
}

void HLSLdpcLogDecScaledMin::thread_test_in1_phi_fu_3679_p4() {
    test_in1_phi_fu_3679_p4 = test_in1_reg_3676.read();
}

void HLSLdpcLogDecScaledMin::thread_tmp_1061_fu_8570_p4() {
    tmp_1061_fu_8570_p4 = inx_reg_3556.read().range(11, 10);
}

void HLSLdpcLogDecScaledMin::thread_tmp_1065_fu_8648_p1() {
    tmp_1065_fu_8648_p1 = inx_reg_3556.read().range(11-1, 0);
}

void HLSLdpcLogDecScaledMin::thread_tmp_1072_fu_8727_p1() {
    tmp_1072_fu_8727_p1 = tmp_949_reg_3568.read().range(8-1, 0);
}

void HLSLdpcLogDecScaledMin::thread_tmp_1091_fu_8780_p1() {
    tmp_1091_fu_8780_p1 = nIterationCounter.read().range(8-1, 0);
}

void HLSLdpcLogDecScaledMin::thread_tmp_1110_fu_8866_p4() {
    tmp_1110_fu_8866_p4 = i_i_reg_3685.read().range(11, 10);
}

void HLSLdpcLogDecScaledMin::thread_tmp_826_fu_8343_p2() {
    tmp_826_fu_8343_p2 = (grp_fu_8200_p2.read() | grp_fu_8230_p2.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_827_fu_8389_p2() {
    tmp_827_fu_8389_p2 = (sel_tmp7_fu_8375_p2.read() | sel_tmp2_fu_8363_p2.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_828_fu_8447_p2() {
    tmp_828_fu_8447_p2 = (sel_tmp23_fu_8433_p2.read() | sel_tmp14_fu_8415_p2.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_943_fu_8586_p1() {
    tmp_943_fu_8586_p1 = esl_sext<16,8>(pR_q0.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_944_fu_8596_p1() {
    tmp_944_fu_8596_p1 = esl_sext<16,8>(pR1_q0.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_945_fu_8608_p1() {
    tmp_945_fu_8608_p1 = esl_sext<16,8>(pR2_q0.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_946_fu_8619_p1() {
    tmp_946_fu_8619_p1 = esl_sext<16,8>(pR3_q0.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_947_fu_8631_p1() {
    tmp_947_fu_8631_p1 = esl_sext<16,8>(pR4_q0.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_948_fu_8658_p1() {
    tmp_948_fu_8658_p1 = esl_zext<32,11>(pos_fu_8652_p2.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_950_fu_8722_p2() {
    tmp_950_fu_8722_p2 = (!tmp_949_reg_3568.read().is_01() || !pMaxIterations.read().is_01())? sc_lv<1>(): (sc_biguint<16>(tmp_949_reg_3568.read()) < sc_biguint<16>(pMaxIterations.read()));
}

void HLSLdpcLogDecScaledMin::thread_tmp_951_fu_8677_p1() {
    tmp_951_fu_8677_p1 = esl_sext<16,8>(pR5_q0.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_952_fu_8683_p1() {
    tmp_952_fu_8683_p1 = esl_sext<16,8>(pR6_q0.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_953_fu_8694_p1() {
    tmp_953_fu_8694_p1 = esl_sext<16,8>(pR7_q0.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_954_fu_8702_p1() {
    tmp_954_fu_8702_p1 = esl_sext<16,8>(pR8_q0.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_955_fu_8708_p1() {
    tmp_955_fu_8708_p1 = esl_sext<16,8>(pR9_q0.read());
}

void HLSLdpcLogDecScaledMin::thread_tmp_956_fu_8768_p2() {
    tmp_956_fu_8768_p2 = (!nIterationCounter.read().is_01() || !ap_const_lv16_0.is_01())? sc_lv<1>(): sc_lv<1>(nIterationCounter.read() != ap_const_lv16_0);
}

void HLSLdpcLogDecScaledMin::thread_tmp_958_fu_8784_p2() {
    tmp_958_fu_8784_p2 = (!ap_const_lv16_1.is_01() || !nIterationCounter.read().is_01())? sc_lv<16>(): (sc_biguint<16>(ap_const_lv16_1) + sc_biguint<16>(nIterationCounter.read()));
}

void HLSLdpcLogDecScaledMin::thread_tmp_959_fu_8796_p2() {
    tmp_959_fu_8796_p2 = (!ap_const_lv8_1.is_01() || !tmp_1091_fu_8780_p1.read().is_01())? sc_lv<8>(): (sc_biguint<8>(ap_const_lv8_1) + sc_biguint<8>(tmp_1091_fu_8780_p1.read()));
}

void HLSLdpcLogDecScaledMin::thread_tmp_960_fu_8803_p2() {
    tmp_960_fu_8803_p2 = (!tmp_958_fu_8784_p2.read().is_01() || !pMaxIterations.read().is_01())? sc_lv<1>(): (sc_biguint<16>(tmp_958_fu_8784_p2.read()) < sc_biguint<16>(pMaxIterations.read()));
}

void HLSLdpcLogDecScaledMin::thread_tmp_i1_fu_8744_p2() {
    tmp_i1_fu_8744_p2 = (!m_i1_reg_3592.read().is_01() || !rows.read().is_01())? sc_lv<1>(): (sc_bigint<16>(m_i1_reg_3592.read()) < sc_bigint<16>(rows.read()));
}

void HLSLdpcLogDecScaledMin::thread_tmp_i2_fu_8732_p2() {
    tmp_i2_fu_8732_p2 = (!m_i2_reg_3580.read().is_01() || !rows.read().is_01())? sc_lv<1>(): (sc_bigint<16>(m_i2_reg_3580.read()) < sc_bigint<16>(rows.read()));
}

void HLSLdpcLogDecScaledMin::thread_tmp_i3_fu_8832_p2() {
    tmp_i3_fu_8832_p2 = (!m_i3_reg_3640.read().is_01() || !rows.read().is_01())? sc_lv<1>(): (sc_bigint<16>(m_i3_reg_3640.read()) < sc_bigint<16>(rows.read()));
}

void HLSLdpcLogDecScaledMin::thread_tmp_i4_fu_8820_p2() {
    tmp_i4_fu_8820_p2 = (!m_i4_reg_3628.read().is_01() || !rows.read().is_01())? sc_lv<1>(): (sc_bigint<16>(m_i4_reg_3628.read()) < sc_bigint<16>(rows.read()));
}

void HLSLdpcLogDecScaledMin::thread_tmp_i5_fu_8808_p2() {
    tmp_i5_fu_8808_p2 = (!m_i5_reg_3616.read().is_01() || !rows.read().is_01())? sc_lv<1>(): (sc_bigint<16>(m_i5_reg_3616.read()) < sc_bigint<16>(rows.read()));
}

void HLSLdpcLogDecScaledMin::thread_tmp_i_113_fu_8854_p2() {
    tmp_i_113_fu_8854_p2 = (!i_i_cast_fu_8850_p1.read().is_01() || !cols.read().is_01())? sc_lv<1>(): (sc_bigint<16>(i_i_cast_fu_8850_p1.read()) < sc_bigint<16>(cols.read()));
}

void HLSLdpcLogDecScaledMin::thread_tmp_i_fu_8756_p2() {
    tmp_i_fu_8756_p2 = (!m_i_reg_3604.read().is_01() || !rows.read().is_01())? sc_lv<1>(): (sc_bigint<16>(m_i_reg_3604.read()) < sc_bigint<16>(rows.read()));
}

void HLSLdpcLogDecScaledMin::thread_tmp_s_fu_8558_p2() {
    tmp_s_fu_8558_p2 = (!inx_cast_fu_8554_p1.read().is_01() || !cols.read().is_01())? sc_lv<1>(): (sc_bigint<16>(inx_cast_fu_8554_p1.read()) < sc_bigint<16>(cols.read()));
}

}

