
call xelab xil_defaultlib.apatb_LDPC_Out_top -prj LDPC_Out.prj --initfile "C:/Xilinx/Vivado/2016.3/bin/../data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s LDPC_Out 
call xsim --noieeewarnings LDPC_Out -tclbatch LDPC_Out.tcl

