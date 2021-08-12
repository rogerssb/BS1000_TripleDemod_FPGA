@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.3\\bin
call %xv_path%/xelab  -wto 7b5c2931ff9f467db4efc64cc4b41775 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L blk_mem_gen_v8_3_4 -L xbip_utils_v3_0_7 -L c_reg_fd_v12_0_3 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_3 -L xbip_dsp48_addsub_v3_0_3 -L xbip_addsub_v3_0_3 -L c_addsub_v12_0_10 -L util_vector_logic_v2_0 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot design_2_wrapper_behav xil_defaultlib.design_2_wrapper xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
