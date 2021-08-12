onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+design_2 -L xil_defaultlib -L xpm -L blk_mem_gen_v8_3_4 -L xbip_utils_v3_0_7 -L c_reg_fd_v12_0_3 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_3 -L xbip_dsp48_addsub_v3_0_3 -L xbip_addsub_v3_0_3 -L c_addsub_v12_0_10 -L util_vector_logic_v2_0 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_2 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {design_2.udo}

run -all

endsim

quit -force
