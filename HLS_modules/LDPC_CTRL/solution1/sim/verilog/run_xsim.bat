
call xelab xil_defaultlib.apatb_LDPC_CTRL_top -prj LDPC_CTRL.prj --initfile "C:/Xilinx/Vivado/2016.3/bin/../data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s LDPC_CTRL 
call xsim --noieeewarnings LDPC_CTRL -tclbatch LDPC_CTRL.tcl

