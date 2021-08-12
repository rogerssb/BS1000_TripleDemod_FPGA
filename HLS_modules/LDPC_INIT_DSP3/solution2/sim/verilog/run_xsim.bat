
call xelab xil_defaultlib.apatb_setupLDPC_top -prj setupLDPC.prj --initfile "C:/Xilinx/Vivado/2016.3/bin/../data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s setupLDPC 
call xsim --noieeewarnings setupLDPC -tclbatch setupLDPC.tcl

