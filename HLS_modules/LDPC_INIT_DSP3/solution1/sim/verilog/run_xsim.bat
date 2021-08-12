
call xelab xil_defaultlib.apatb_setupLDPC_top -prj setupLDPC.prj --lib "ieee_proposed=./ieee_proposed" -s setupLDPC 
call xsim --noieeewarnings setupLDPC -tclbatch setupLDPC.tcl

