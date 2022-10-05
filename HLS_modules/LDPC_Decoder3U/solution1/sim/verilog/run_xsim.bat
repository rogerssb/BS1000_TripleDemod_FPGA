
call C:/Xilinx/Vivado/2016.4/bin/xelab xil_defaultlib.apatb_HLSLdpcLogDecScaledMin_top -prj HLSLdpcLogDecScaledMin.prj --initfile "C:/Xilinx/Vivado/2016.4/data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s HLSLdpcLogDecScaledMin 
call C:/Xilinx/Vivado/2016.4/bin/xsim --noieeewarnings HLSLdpcLogDecScaledMin -tclbatch HLSLdpcLogDecScaledMin.tcl

