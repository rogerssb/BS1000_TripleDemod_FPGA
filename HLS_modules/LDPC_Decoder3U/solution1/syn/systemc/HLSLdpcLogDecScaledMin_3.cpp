#include "HLSLdpcLogDecScaledMin.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

void HLSLdpcLogDecScaledMin::thread_hdltv_gen() {
    const char* dump_tv = std::getenv("AP_WRITE_TV");
    if (!(dump_tv && string(dump_tv) == "on")) return;

    wait();

    mHdltvinHandle << "[ " << endl;
    mHdltvoutHandle << "[ " << endl;
    int ap_cycleNo = 0;
    while (1) {
        wait();
        const char* mComma = ap_cycleNo == 0 ? " " : ", " ;
        mHdltvinHandle << mComma << "{"  <<  " \"ap_rst\" :  \"" << ap_rst.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"ap_start\" :  \"" << ap_start.read() << "\" ";
        mHdltvoutHandle << mComma << "{"  <<  " \"ap_done\" :  \"" << ap_done.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"ap_idle\" :  \"" << ap_idle.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"ap_ready\" :  \"" << ap_ready.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR_address0\" :  \"" << pR_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR_ce0\" :  \"" << pR_ce0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pR_q0\" :  \"" << pR_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR1_address0\" :  \"" << pR1_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR1_ce0\" :  \"" << pR1_ce0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pR1_q0\" :  \"" << pR1_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR2_address0\" :  \"" << pR2_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR2_ce0\" :  \"" << pR2_ce0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pR2_q0\" :  \"" << pR2_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR3_address0\" :  \"" << pR3_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR3_ce0\" :  \"" << pR3_ce0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pR3_q0\" :  \"" << pR3_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR4_address0\" :  \"" << pR4_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR4_ce0\" :  \"" << pR4_ce0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pR4_q0\" :  \"" << pR4_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR5_address0\" :  \"" << pR5_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR5_ce0\" :  \"" << pR5_ce0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pR5_q0\" :  \"" << pR5_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR6_address0\" :  \"" << pR6_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR6_ce0\" :  \"" << pR6_ce0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pR6_q0\" :  \"" << pR6_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR7_address0\" :  \"" << pR7_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR7_ce0\" :  \"" << pR7_ce0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pR7_q0\" :  \"" << pR7_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR8_address0\" :  \"" << pR8_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR8_ce0\" :  \"" << pR8_ce0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pR8_q0\" :  \"" << pR8_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR9_address0\" :  \"" << pR9_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR9_ce0\" :  \"" << pR9_ce0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pR9_q0\" :  \"" << pR9_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR10_address0\" :  \"" << pR10_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR10_ce0\" :  \"" << pR10_ce0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR10_we0\" :  \"" << pR10_we0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR10_d0\" :  \"" << pR10_d0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pR10_q0\" :  \"" << pR10_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR10_address1\" :  \"" << pR10_address1.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR10_ce1\" :  \"" << pR10_ce1.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR10_we1\" :  \"" << pR10_we1.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pR10_d1\" :  \"" << pR10_d1.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pR10_q1\" :  \"" << pR10_q1.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat0_address0\" :  \"" << pbhat0_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat0_ce0\" :  \"" << pbhat0_ce0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat0_we0\" :  \"" << pbhat0_we0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat0_d0\" :  \"" << pbhat0_d0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat1_address0\" :  \"" << pbhat1_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat1_ce0\" :  \"" << pbhat1_ce0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat1_we0\" :  \"" << pbhat1_we0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat1_d0\" :  \"" << pbhat1_d0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat2_address0\" :  \"" << pbhat2_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat2_ce0\" :  \"" << pbhat2_ce0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat2_we0\" :  \"" << pbhat2_we0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat2_d0\" :  \"" << pbhat2_d0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat3_address0\" :  \"" << pbhat3_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat3_ce0\" :  \"" << pbhat3_ce0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat3_we0\" :  \"" << pbhat3_we0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat3_d0\" :  \"" << pbhat3_d0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat4_address0\" :  \"" << pbhat4_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat4_ce0\" :  \"" << pbhat4_ce0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat4_we0\" :  \"" << pbhat4_we0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat4_d0\" :  \"" << pbhat4_d0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat5_address0\" :  \"" << pbhat5_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat5_ce0\" :  \"" << pbhat5_ce0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat5_we0\" :  \"" << pbhat5_we0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat5_d0\" :  \"" << pbhat5_d0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat6_address0\" :  \"" << pbhat6_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat6_ce0\" :  \"" << pbhat6_ce0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat6_we0\" :  \"" << pbhat6_we0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat6_d0\" :  \"" << pbhat6_d0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat7_address0\" :  \"" << pbhat7_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat7_ce0\" :  \"" << pbhat7_ce0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat7_we0\" :  \"" << pbhat7_we0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pbhat7_d0\" :  \"" << pbhat7_d0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"cnt\" :  \"" << cnt.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"cnt_ap_vld\" :  \"" << cnt_ap_vld.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"nR_M\" :  \"" << nR_M.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"etaIndexM_M\" :  \"" << etaIndexM_M.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pCodeM\" :  \"" << pCodeM.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pMaxIterations\" :  \"" << pMaxIterations.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"itt_num\" :  \"" << itt_num.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"itt_num_ap_vld\" :  \"" << itt_num_ap_vld.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"numbits\" :  \"" << numbits.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"mux\" :  \"" << mux.read() << "\" ";
        mHdltvinHandle << "}" << std::endl;
        mHdltvoutHandle << "}" << std::endl;
        ap_cycleNo++;
    }
}

}

