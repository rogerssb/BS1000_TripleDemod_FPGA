write_cfgmem -force -format mcs -interface SPIx1 -size 64 -loadbit "up 0 [get_property DIRECTORY [current_project]]/stcMod.runs/impl_1/stcModTop.bit" [get_property DIRECTORY [current_project]]/stcModTop.mcs

