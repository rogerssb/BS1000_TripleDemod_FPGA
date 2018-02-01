@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 0027b497f38f46a7b40b8158d1351c26 -m64 --debug typical --relax --mt 2 -d "SIMULATE=" -d "SELFTEST=" -d "USE_VIVADO_CORES=" -d "SEMCO_DEMOD=" -L xbip_utils_v3_0_7 -L axi_utils_v2_0_3 -L xbip_pipe_v3_0_3 -L xbip_bram18k_v3_0_3 -L mult_gen_v12_0_12 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_3 -L xbip_dsp48_multadd_v3_0_3 -L dds_compiler_v6_0_13 -L xil_defaultlib -L fir_compiler_v7_2_7 -L fifo_generator_v13_1_3 -L dist_mem_gen_v8_0_11 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot test_behav xil_defaultlib.test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
