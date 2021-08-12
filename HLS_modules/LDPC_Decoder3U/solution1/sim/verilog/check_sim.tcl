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
         "c.HLSLdpcLogDecScaledMin.autotvin_pR.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pR1.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pR2.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pR3.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pR4.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pR5.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pR6.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pR7.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pR8.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pR9.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pbhat0.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pbhat1.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pbhat2.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pbhat3.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pbhat4.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pbhat5.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pbhat6.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pbhat7.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_pMaxIterations.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_numbits.dat"
         "c.HLSLdpcLogDecScaledMin.autotvin_mux.dat"
         "c.HLSLdpcLogDecScaledMin.autotvout_pbhat0.dat"
         "c.HLSLdpcLogDecScaledMin.autotvout_pbhat1.dat"
         "c.HLSLdpcLogDecScaledMin.autotvout_pbhat2.dat"
         "c.HLSLdpcLogDecScaledMin.autotvout_pbhat3.dat"
         "c.HLSLdpcLogDecScaledMin.autotvout_pbhat4.dat"
         "c.HLSLdpcLogDecScaledMin.autotvout_pbhat5.dat"
         "c.HLSLdpcLogDecScaledMin.autotvout_pbhat6.dat"
         "c.HLSLdpcLogDecScaledMin.autotvout_pbhat7.dat"
         "c.HLSLdpcLogDecScaledMin.autotvout_cnt.dat"
         "c.HLSLdpcLogDecScaledMin.autotvout_itt_num.dat"
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
         "rtl.HLSLdpcLogDecScaledMin.autotvout_pbhat0.dat"
         "rtl.HLSLdpcLogDecScaledMin.autotvout_pbhat1.dat"
         "rtl.HLSLdpcLogDecScaledMin.autotvout_pbhat2.dat"
         "rtl.HLSLdpcLogDecScaledMin.autotvout_pbhat3.dat"
         "rtl.HLSLdpcLogDecScaledMin.autotvout_pbhat4.dat"
         "rtl.HLSLdpcLogDecScaledMin.autotvout_pbhat5.dat"
         "rtl.HLSLdpcLogDecScaledMin.autotvout_pbhat6.dat"
         "rtl.HLSLdpcLogDecScaledMin.autotvout_pbhat7.dat"
         "rtl.HLSLdpcLogDecScaledMin.autotvout_cnt.dat"
         "rtl.HLSLdpcLogDecScaledMin.autotvout_itt_num.dat"
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
