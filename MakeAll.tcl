# File offsets. 
#	Demods 0
#	LDPCx3 1
#	STC    2
#	MultiH 3
#	LDPC12 4
#	LDPC23 5
#	LDPC45 6

# Combiner versions

current_run [get_runs synthDemodComb325]
set_property verilog_define {TRIPLE_DEMOD COMBINER} [current_fileset] 
reset_run synthDemodComb325
launch_runs implDemodComb325 -to_step write_bitstream -jobs 8
wait_on_run implDemodComb325

current_run [get_runs synthMultiHComb325]
set_property verilog_define {TRIPLE_MULTIH COMBINER} [current_fileset] 
reset_run synthMultiHComb325
launch_runs implMultiHComb325 -to_step write_bitstream -jobs 8
wait_on_run implMultiHComb325

current_run [get_runs synth12Comb325]
set_property verilog_define {TRIPLE_LDPC_12 COMBINER} [current_fileset] 
reset_run synth12Comb325
launch_runs impl12Comb325 -to_step write_bitstream -jobs 8
wait_on_run impl12Comb325

current_run [get_runs synth23Comb325]
set_property verilog_define {TRIPLE_LDPC_23 COMBINER} [current_fileset] 
reset_run synth23Comb325
launch_runs impl23Comb325 -to_step write_bitstream -jobs 8
wait_on_run impl23Comb325

current_run [get_runs synth45Comb325]
set_property verilog_define {TRIPLE_LDPC_45 COMBINER} [current_fileset] 
reset_run synth45Comb325
launch_runs impl45Comb325 -to_step write_bitstream -jobs 8
wait_on_run impl45Comb325

# build combiner mcs file
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x00000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implDemodComb325/semcoDemodTop.bit up 0x03000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implMultiHComb325/semcoDemodTop.bit up 0x04000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl12Comb325/semcoDemodTop.bit up 0x05000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl23Comb325/semcoDemodTop.bit up 0x06000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl45Comb325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleDemodCombiners.mcs"

#Demod 325 Versions

current_run [get_runs synthDemod325]
set_property verilog_define {TRIPLE_DEMOD COMBINER_DEMOD} [current_fileset]
reset_run synthDemod325
launch_runs implDemod325 -to_step write_bitstream -jobs 8
wait_on_run implDemod325

current_run [get_runs synthMultiH325]
set_property verilog_define {TRIPLE_MULTIH COMBINER_DEMOD} [current_fileset]
reset_run synthMultiH325
launch_runs implMultiH325 -to_step write_bitstream -jobs 8
wait_on_run implMultiH325

current_run [get_runs synth12Demod325]
set_property verilog_define {TRIPLE_LDPC_12 COMBINER_DEMOD} [current_fileset]
reset_run synth12Demod325
launch_runs impl12Demod325 -to_step write_bitstream -jobs 8
wait_on_run impl12Demod325

current_run [get_runs synth23Demod325]
set_property verilog_define {TRIPLE_LDPC_23 COMBINER_DEMOD} [current_fileset] 
reset_run synth23Demod325
launch_runs impl23Demod325 -to_step write_bitstream -jobs 8
wait_on_run impl23Demod325

current_run [get_runs synth45Demod325]
set_property verilog_define {TRIPLE_LDPC_45 COMBINER_DEMOD} [current_fileset] 
reset_run synth45Demod325
launch_runs impl45Demod325 -to_step write_bitstream -jobs 8
wait_on_run impl45Demod325

#build combiner-demod 325 file
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x00000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implDemod325/semcoDemodTop.bit up 0x03000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/ImplMultiH325/semcoDemodTop.bit up 0x04000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl12Demod325/semcoDemodTop.bit up 0x05000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl23Demod325/semcoDemodTop.bit up 0x06000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl45Demod325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleDemodCombinerDriver325.mcs"

#Demod 160 Versions

current_run [get_runs synthDemod160]
set_property verilog_define {TRIPLE_DEMOD COMBINER_DEMOD} [current_fileset] 
reset_run synthDemod160
launch_runs implDemod160 -to_step write_bitstream -jobs 8
wait_on_run implDemod160current_run [get_runs synth12Demod160]

current_run [get_runs synthMultiH160]
set_property verilog_define {TRIPLE_MULTIH COMBINER_DEMOD} [current_fileset] 
reset_run synthMultiH160
launch_runs implMultiH160 -to_step write_bitstream -jobs 8
wait_on_run implMultiH160

set_property verilog_define {TRIPLE_LDPC_12 COMBINER_DEMOD} [current_fileset] 
reset_run synth12Demod160
launch_runs impl12Demod160 -to_step write_bitstream -jobs 8
wait_on_run impl12Demod160

current_run [get_runs synth23Demod160]
set_property verilog_define {TRIPLE_LDPC_23 COMBINER_DEMOD} [current_fileset] 
reset_run synth23Demod160
launch_runs impl23Demod160 -to_step write_bitstream -jobs 8
wait_on_run impl23Demod160

current_run [get_runs synth45Demod160]
set_property verilog_define {TRIPLE_LDPC_45 COMBINER_DEMOD} [current_fileset] 
reset_run synth45Demod160
launch_runs impl45Demod160 -to_step write_bitstream -jobs 8
wait_on_run impl45Demod160

#build demod 160 file
write_cfgmem  -format mcs -size 512 -interface SPIx4 -loadbit "up 0x00000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implDemod160/semcoDemodTop.bit up 0x01800000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/ImplMultiH160/semcoDemodTop.bit up 0x02000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl12Demod160/semcoDemodTop.bit up 0x02800000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl23Demod160/semcoDemodTop.bit up 0x03000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl45Demod160/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleDemodCombinerDriver160.mcs"
