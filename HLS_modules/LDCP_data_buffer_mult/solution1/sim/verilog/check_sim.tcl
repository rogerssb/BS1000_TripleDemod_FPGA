# ==============================================================
# File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
# Version: 2016.3
# Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
# 
# ==============================================================

proc sc_sim_check {ret err logfile} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set errfile "err.log"
    if {[file exists $errfile] && [file size $errfile] != 0} {
        set fl [open $errfile r]
        while {[gets $fl line] >= 0} {
            if {[string first "AESL_mErrNo = " $line] == 0} {
                set mismatch_num [string range $line [string length "AESL_mErrNo = "] end]
                if {$mismatch_num != 0} {
                    ap_puts_err "COSIM" 403 "SystemC simulation FAILED with ${mismatch_num} mismatches detected."
                    break
                }
            }
        }
    }
    if {$ret || $err != ""} {
        if { [lindex $::errorCode 0] eq "CHILDSTATUS"} {
            set status [lindex $::errorCode 2]
            if {$status != ""} {
                ap_puts_err "COSIM" 404 "Simulation failed: Function \'main\' returns nonzero value \'$status\'."
            } else {
                ap_puts_err "COSIM" 405 "Simulation failed."
            }
        } else {
            ap_puts_err "COSIM" 405 "Simulation failed."
        }
    }
    if {[file exists $logfile]} {
        set cmdret [catch {eval exec "grep \"Error:\" $logfile"} err]
        file delete -force $logfile
        if {$cmdret == 0} {
            ap_puts_err "COSIM" 405 "Simulation failed."
        }
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
}

proc rtl_sim_check {} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set errfile "err.log"
    if {[file exists $errfile] && [file size $errfile] != 0} {
        set fl [open $errfile r]
        set unmatch_num 0
        while {[gets $fl line] >= 0} {
            if {[string first "unmatched" $line] != -1} {
                set unmatch_num [expr $unmatch_num + 1]
            }
        }
        if {$unmatch_num != 0} {
            ap_puts_err "COSIM" 406 "Simulation FAILED with ${unmatch_num} mismatches detected."
        }
    }
    if {[file exists ".aesl_error"]} {
        set errfl [open ".aesl_error" r]
        gets $errfl line
        if {$line != 0} {
            ap_puts_err "COSIM" 407 "Simulation failed: Function \'main\' returns nonzero value \'$line\'."
        }
    }
    if {[file exists ".exit.err"]} {
        ap_puts_err "COSIM" 405 "Simulation failed."
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
}

proc check_tvin_file {} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set rtlfilelist {
         "c.LDPC_buff.autotvin_data_in.dat"
         "c.LDPC_buff.autotvin_reset.dat"
         "c.LDPC_buff.autotvin_raw_dat0.dat"
         "c.LDPC_buff.autotvin_raw_dat1.dat"
         "c.LDPC_buff.autotvin_raw_dat2.dat"
         "c.LDPC_buff.autotvin_raw_dat3.dat"
         "c.LDPC_buff.autotvin_raw_dat4.dat"
         "c.LDPC_buff.autotvin_raw_dat5.dat"
         "c.LDPC_buff.autotvin_raw_dat6.dat"
         "c.LDPC_buff.autotvin_raw_dat7.dat"
         "c.LDPC_buff.autotvin_raw_dat8.dat"
         "c.LDPC_buff.autotvin_raw_dat9.dat"
         "c.LDPC_buff.autotvin_raw_dat10.dat"
         "c.LDPC_buff.autotvin_numbits_V.dat"
         "c.LDPC_buff.autotvin_write_r.dat"
         "c.LDPC_buff.autotvin_deran_V.dat"
         "c.LDPC_buff.autotvin_decode_done.dat"
         "c.LDPC_buff.autotvin_decode_ready.dat"
         "c.LDPC_buff.autotvin_decode_done_b.dat"
         "c.LDPC_buff.autotvin_decode_ready_b.dat"
         "c.LDPC_buff.autotvin_out_mux.dat"
         "c.LDPC_buff.autotvout_raw_dat0.dat"
         "c.LDPC_buff.autotvout_raw_dat1.dat"
         "c.LDPC_buff.autotvout_raw_dat2.dat"
         "c.LDPC_buff.autotvout_raw_dat3.dat"
         "c.LDPC_buff.autotvout_raw_dat4.dat"
         "c.LDPC_buff.autotvout_raw_dat5.dat"
         "c.LDPC_buff.autotvout_raw_dat6.dat"
         "c.LDPC_buff.autotvout_raw_dat7.dat"
         "c.LDPC_buff.autotvout_raw_dat8.dat"
         "c.LDPC_buff.autotvout_raw_dat9.dat"
         "c.LDPC_buff.autotvout_raw_dat10.dat"
         "c.LDPC_buff.autotvout_overrun.dat"
         "c.LDPC_buff.autotvout_full.dat"
         "c.LDPC_buff.autotvout_mux.dat"
         "c.LDPC_buff.autotvout_decode_start.dat"
         "c.LDPC_buff.autotvout_decode_start_b.dat"
         "c.LDPC_buff.autotvout_deran_data.dat"
         "c.LDPC_buff.autotvout_cur_write_pos_V.dat"
    }
    foreach rtlfile $rtlfilelist {
        if {[file isfile $rtlfile]} {
        } else {
            ap_puts_err "COSIM" 320 "C TB testing failed. Please check C TB or re-run cosim.  "
            return 1
        }
        set ret [catch {eval exec "grep /runtime $rtlfile"} err]
        if { $ret } {
            ap_puts_err "COSIM" 320 "C TB testing failed. Please check C TB or re-run cosim.  "
            return 1
        }
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
    return 0
}

proc check_tvout_file {} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set rtlfilelist {
         "rtl.LDPC_buff.autotvout_raw_dat0.dat"
         "rtl.LDPC_buff.autotvout_raw_dat1.dat"
         "rtl.LDPC_buff.autotvout_raw_dat2.dat"
         "rtl.LDPC_buff.autotvout_raw_dat3.dat"
         "rtl.LDPC_buff.autotvout_raw_dat4.dat"
         "rtl.LDPC_buff.autotvout_raw_dat5.dat"
         "rtl.LDPC_buff.autotvout_raw_dat6.dat"
         "rtl.LDPC_buff.autotvout_raw_dat7.dat"
         "rtl.LDPC_buff.autotvout_raw_dat8.dat"
         "rtl.LDPC_buff.autotvout_raw_dat9.dat"
         "rtl.LDPC_buff.autotvout_raw_dat10.dat"
         "rtl.LDPC_buff.autotvout_overrun.dat"
         "rtl.LDPC_buff.autotvout_full.dat"
         "rtl.LDPC_buff.autotvout_mux.dat"
         "rtl.LDPC_buff.autotvout_decode_start.dat"
         "rtl.LDPC_buff.autotvout_decode_start_b.dat"
         "rtl.LDPC_buff.autotvout_deran_data.dat"
         "rtl.LDPC_buff.autotvout_cur_write_pos_V.dat"
    }
    foreach rtlfile $rtlfilelist {
        if {[file isfile $rtlfile]} {
        } else {
            ap_puts_err "COSIM" 303 "Aborting co-simulation: RTL simulation failed.  "
            return 1
        }
        set ret [catch {eval exec "grep /runtime $rtlfile"} err]
        if { $ret } {
            ap_puts_err "COSIM" 303 "Aborting co-simulation: RTL simulation failed.  "
            return 1
        }
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
    return 0
}
