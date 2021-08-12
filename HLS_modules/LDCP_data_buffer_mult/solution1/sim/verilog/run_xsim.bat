
call xelab xil_defaultlib.apatb_LDPC_buff_top -prj LDPC_buff.prj --initfile "C:/Xilinx/Vivado/2016.3/bin/../data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s LDPC_buff 
call xsim --noieeewarnings LDPC_buff -tclbatch LDPC_buff.tcl

