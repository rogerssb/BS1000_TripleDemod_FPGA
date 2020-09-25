write_cfgmem -force -format mcs -interface SPIx1 -size 64 -loadbit "up 0 [get_property DIRECTORY [current_project]]/stcDemod.runs/impl_1/stcDemodTop.bit" [get_property DIRECTORY [current_project]]/stcDemodTop.mcs

