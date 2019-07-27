@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 0027b497f38f46a7b40b8158d1351c26 -m64 --debug typical --relax --mt 2 -d "SEMCO_DEMOD=" -d "SIMULATE=" -d "USE_FAKE_LDPC_DECODER=" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot test_behav xil_defaultlib.test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
