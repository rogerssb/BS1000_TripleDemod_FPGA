
call xelab xil_defaultlib.apatb_HLSLdpcLogDecScaledMin_top -prj HLSLdpcLogDecScaledMin.prj --initfile "C:/Xilinx/Vivado/2016.3/bin/../data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s HLSLdpcLogDecScaledMin 
call xsim --noieeewarnings HLSLdpcLogDecScaledMin -tclbatch HLSLdpcLogDecScaledMin.tcl

