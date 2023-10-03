# Note, all 325 build will have BERT and Spectral Sweep

# Build 325 with Combiner function
current_run [get_runs synth325Combiner]
set_property verilog_define {STC_TRIPLE COMBINER ADD_BERT ADD_SPECTRAL_SWEEP} [current_fileset]
reset_run synth325Combiner
launch_runs impl325Combiner -to_step write_bitstream -jobs 6
wait_on_run impl325Combiner -quiet
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit {up 0x02000000 "C:/Semco/Vivado/Demods2017/stcTriple.runs/impl325Combiner/stcDemodTop.bit" } -force -file "C:/Semco/Vivado/Demods2017/stcTriple325Combiner.mcs"

# Build 325 with Combiner Drive function for Demods 1 and 2
current_run [get_runs synth325CombDriver]
set_property verilog_define {STC_TRIPLE COMBINER_DEMOD ADD_BERT ADD_SPECTRAL_SWEEP} [current_fileset]
reset_run synth325CombDriver
launch_runs impl325CombDriver -to_step write_bitstream -jobs 6
wait_on_run impl325CombDriver -quiet
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit {up 0x02000000 "C:/Semco/Vivado/Demods2017/stcTriple.runs/impl325Combdriver/stcDemodTop.bit" } -force -file "C:/Semco/Vivado/Demods2017/stcTriple325CombDriver.mcs"

# Build 325 with only BERT and SSC function for Demods 1 and 2
current_run [get_runs synth325NoComb]
set_property verilog_define {STC_TRIPLE ADD_BERT ADD_SPECTRAL_SWEEP} [current_fileset]
reset_run synth325NoComb
launch_runs impl325NoComb -to_step write_bitstream -jobs 6
wait_on_run impl325NoComb -quiet
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit {up 0x02000000 "C:/Semco/Vivado/Demods2017/stcTriple.runs/impl325NoComb/stcDemodTop.bit" } -force -file "C:/Semco/Vivado/Demods2017/stcTriple325NoComb.mcs"

# Build 160 with Combiner Drive function for Demods 1 and 2
current_run [get_runs synth160CombDriver]
set_property verilog_define {STC_TRIPLE COMBINER_DEMOD ADD_BERT} [current_fileset]
reset_run synth160CombDriver
launch_runs impl160CombDriver -to_step write_bitstream -jobs 6
wait_on_run impl160CombDriver -quiet
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit {up 0x01000000 "C:/Semco/Vivado/Demods2017/stcTriple.runs/impl160Combdriver/stcDemodTop.bit" } -force -file "C:/Semco/Vivado/Demods2017/stcTriple160CombDriver.mcs"

# Build plain 160 STC
current_run [get_runs synth160NoComb]
set_property verilog_define {STC_TRIPLE ADD_BERT} [current_fileset]
reset_run synth160NoComb
launch_runs impl160NoComb -to_step write_bitstream -jobs 6
wait_on_run impl160NoComb -quiet
write_cfgmem  -format mcs -size 512 -interface SPIx4 -loadbit {up 0x01000000 "C:/Semco/Vivado/Demods2017/stcTriple.runs/impl160NoComb/stcDemodTop.bit" } -force -file "C:/Semco/Vivado/Demods2017/stcTriple160NoComb.mcs"

