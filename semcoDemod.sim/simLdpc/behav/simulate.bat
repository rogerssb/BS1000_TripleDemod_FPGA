@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim test_behav -key {Behavioral:simLdpc:Functional:test} -tclbatch test.tcl -view C:/modem/vivado2017/simLdpc.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
