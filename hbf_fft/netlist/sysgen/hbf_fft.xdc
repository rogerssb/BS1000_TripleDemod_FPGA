set rateCehbf_fft2 hbf_fft_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[0].ce_reg/has_latency.fd_array[1].reg_comp_1/fd_prim_array[0].rst_comp.fdre_comp
set rateCellshbf_fft2 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCehbf_fft2/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellshbf_fft2 -to $rateCellshbf_fft2 -setup 2
set_multicycle_path -from $rateCellshbf_fft2 -to $rateCellshbf_fft2 -hold 1
