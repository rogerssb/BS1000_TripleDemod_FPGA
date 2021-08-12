
call xelab xil_defaultlib.apatb_LDPC_Div_top -prj LDPC_Div.prj --initfile "C:/Xilinx/Vivado/2016.3/bin/../data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s LDPC_Div 
call xsim --noieeewarnings LDPC_Div -tclbatch LDPC_Div.tcl

