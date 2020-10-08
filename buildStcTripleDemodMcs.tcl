write_cfgmem -force -format mcs -interface SPIx4 -size 64 -loadbit "up 1000000 [get_property DIRECTORY [current_project]]/stcTriple.runs/impl_2/stcDemodTop.bit" [get_property DIRECTORY [current_project]]/stcTriple.mcs

