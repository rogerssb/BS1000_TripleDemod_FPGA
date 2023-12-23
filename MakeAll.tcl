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
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_DEMOD COMBINER} [current_fileset] 
remove_files  -fileset constrsCombiners C:/Semco/Vivado/Demods2022/tripleCombinerDemods.srcs/constrsCombiners/new/DebugCombLdpc.xdc
add_files -fileset constrsCombiners C:/Semco/Vivado/Demods2022/tripleCombinerDemods.srcs/constrsCombiners/new/DebugCombDemods.xdc
set_property target_constrs_file C:/Semco/Vivado/Demods2022/tripleCombinerDemods.srcs/constrsCombiners/new/DebugCombDemods.xdc [current_fileset -constrset]
reset_run synthDemodComb325
launch_runs implDemodComb325 -to_step write_bitstream -jobs 8
wait_on_run -quiet implDemodComb325
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x00000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implDemodComb325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implDemodComb325/tripleComb.mcs"

remove_files  -fileset constrsCombiners C:/Semco/Vivado/Demods2022/tripleCombinerDemods.srcs/constrsCombiners/new/DebugCombDemods.xdc
current_run [get_runs synthMultiHComb325]
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_MULTIH COMBINER} [current_fileset] 
reset_run synthMultiHComb325
launch_runs implMultiHComb325 -to_step write_bitstream -jobs 8
wait_on_run -quiet implMultiHComb325
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x03000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implMultiHComb325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implMultiHComb325/tripleCombMultiH.mcs"

add_files -fileset constrsCombiners C:/Semco/Vivado/Demods2022/tripleCombinerDemods.srcs/constrsCombiners/new/DebugCombLdpc.xdc
set_property top semcoDemodTop [current_fileset]
current_run [get_runs synth12Comb325]
set_property verilog_define {TRIPLE_LDPC_12 COMBINER} [current_fileset] 
reset_run synth12Comb325
launch_runs impl12Comb325 -to_step write_bitstream -jobs 8
wait_on_run -quiet impl12Comb325
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x04000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl12Comb325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl12Comb325/tripleComb45.mcs"

current_run [get_runs synth23Comb325]
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_LDPC_23 COMBINER} [current_fileset] 
reset_run synth23Comb325
launch_runs impl23Comb325 -to_step write_bitstream -jobs 8
wait_on_run -quiet impl23Comb325
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x04000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl23Comb325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl23Comb325/tripleComb23.mcs"

current_run [get_runs synth45Comb325]
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_LDPC_45 COMBINER} [current_fileset] 
reset_run synth45Comb325
launch_runs impl45Comb325 -to_step write_bitstream -jobs 8
wait_on_run -quiet impl45Comb325
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x00000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl45Comb325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl45Comb325/tripleComb45.mcs"

# build combiner mcs file
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x00000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implDemodComb325/semcoDemodTop.bit up 0x02000000 C:/Semco/Vivado/Demods2017/stcTriple.runs/impl325Combiner/stcDemodTop.bit up 0x03000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implMultiHComb325/semcoDemodTop.bit up 0x04000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl12Comb325/semcoDemodTop.bit up 0x05000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl23Comb325/semcoDemodTop.bit up 0x06000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl45Comb325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleDemodCombiners.mcs"


#Demod 325 Versions

current_run [get_runs synthDemod325]
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_DEMOD COMBINER_DEMOD} [current_fileset]
reset_run synthDemod325
launch_runs implDemod325 -to_step write_bitstream -jobs 8
wait_on_run -quiet implDemod325
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x00000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implDemod325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implDemod325/tripleDemod_325.mcs"

current_run [get_runs synthMultiH325]
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_MULTIH COMBINER_DEMOD} [current_fileset]
reset_run synthMultiH325
launch_runs implMultiH325 -to_step write_bitstream -jobs 8
wait_on_run -quiet implMultiH325
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x03000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implMultiH325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implMultiH325/tripleMultiH_325.mcs"

current_run [get_runs synth12Demod325]
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_LDPC_12 COMBINER_DEMOD} [current_fileset]
reset_run synth12Demod325
launch_runs impl12Demod325 -to_step write_bitstream -jobs 8
wait_on_run -quiet impl12Demod325
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x04000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl12Demod325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl12Demod325/triple12_325.mcs"

current_run [get_runs synth23Demod325]
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_LDPC_23 COMBINER_DEMOD} [current_fileset] 
reset_run synth23Demod325
launch_runs impl23Demod325 -to_step write_bitstream -jobs 8
wait_on_run -quiet impl23Demod325
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x0500000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl23Demod325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl23Demod325/triple23_325.mcs"

current_run [get_runs synth45Demod325]
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_LDPC_45 COMBINER_DEMOD} [current_fileset] 
reset_run synth45Demod325
launch_runs impl45Demod325 -to_step write_bitstream -jobs 8
wait_on_run -quiet impl45Demod325
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x06000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl45Demod325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl45Demod325/triple45_325.mcs"

#build combiner-demod 325 file
write_cfgmem  -format mcs -size 1024 -interface SPIx4 -loadbit "up 0x00000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implDemod325/semcoDemodTop.bit up 0x02000000 C:/Semco/Vivado/Demods2017/stcTriple.runs/impl325Combdriver/stcDemodTop.bit up 0x03000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/ImplMultiH325/semcoDemodTop.bit up 0x04000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl12Demod325/semcoDemodTop.bit up 0x05000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl23Demod325/semcoDemodTop.bit up 0x06000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl45Demod325/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleDemodCombinerDriver325.mcs"


#Demod 160 Versions

current_run [get_runs synthDemod160]
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_DEMOD COMBINER_DEMOD} [current_fileset] 
reset_run synthDemod160
launch_runs implDemod160 -to_step write_bitstream -jobs 8
wait_on_run -quiet implDemod160
write_cfgmem  -format mcs -size 512 -interface SPIx4 -loadbit "up 0x00000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implDemod160/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implDemod160/tripleDemod160.mcs"

set_property verilog_define {TRIPLE_LDPC COMBINER_DEMOD} [current_fileset] 
set_property top semcoDemodTop [current_fileset]
reset_run synthLdpcDemod160
launch_runs implLdpcDemod160 -to_step write_bitstream -jobs 8
wait_on_run -quiet implLdpcDemod160
write_cfgmem  -format mcs -size 512 -interface SPIx4 -loadbit "up 0x008000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implLdpcDemod160/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implLdpcDemod160/tripleLdpc.mcs"

current_run [get_runs synthMultiH160]
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_MULTIH COMBINER_DEMOD} [current_fileset] 
reset_run synthMultiH160
launch_runs implMultiH160 -to_step write_bitstream -jobs 8
wait_on_run -quiet implMultiH160
write_cfgmem  -format mcs -size 512 -interface SPIx4 -loadbit "up 0x01800000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implMultiH160/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implMultiH160/tripleMultiH160.mcs"

set_property verilog_define {TRIPLE_LDPC_12 COMBINER_DEMOD} [current_fileset] 
set_property top semcoDemodTop [current_fileset]
reset_run synth12Demod160
launch_runs impl12Demod160 -to_step write_bitstream -jobs 8
wait_on_run -quiet impl12Demod160
write_cfgmem  -format mcs -size 512 -interface SPIx4 -loadbit "up 0x02000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl12Demod160/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl12Demod160/triple12.mcs"

current_run [get_runs synth23Demod160]
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_LDPC_23 COMBINER_DEMOD} [current_fileset] 
reset_run synth23Demod160
launch_runs impl23Demod160 -to_step write_bitstream -jobs 8
wait_on_run -quiet impl23Demod160
write_cfgmem  -format mcs -size 512 -interface SPIx4 -loadbit "up 0x02800000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl23Demod160/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl23Demod160/triple23.mcs"

current_run [get_runs synth45Demod160]
set_property top semcoDemodTop [current_fileset]
set_property verilog_define {TRIPLE_LDPC_45 COMBINER_DEMOD} [current_fileset] 
reset_run synth45Demod160
launch_runs impl45Demod160 -to_step write_bitstream -jobs 8
wait_on_run -quiet impl45Demod160
write_cfgmem  -format mcs -size 512 -interface SPIx4 -loadbit "up 0x03000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl45Demod160/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl45Demod160/triple45.mcs"

#build demod 160 file
write_cfgmem  -format mcs -size 512 -interface SPIx4 -loadbit "up 0x00000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/implDemod160/semcoDemodTop.bit up 0x01000000 C:/Semco/Vivado/Demods2017/stcTriple.runs/impl160Combdriver/stcDemodTop.bit up 0x01800000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/ImplMultiH160/semcoDemodTop.bit up 0x02000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl12Demod160/semcoDemodTop.bit up 0x02800000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl23Demod160/semcoDemodTop.bit up 0x03000000 C:/Semco/Vivado/Demods2022/tripleCombinerDemods.runs/impl45Demod160/semcoDemodTop.bit " -force -file "C:/Semco/Vivado/Demods2022/tripleDemodCombinerDriver160.mcs"
