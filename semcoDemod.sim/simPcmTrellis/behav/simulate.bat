@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim test_behav -key {Behavioral:simPcmTrellis:Functional:test} -tclbatch test.tcl -view C:/modem/vivado/testPcmTrellis.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
