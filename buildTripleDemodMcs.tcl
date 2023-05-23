write_cfgmem -force -format mcs -interface SPIx4 -size 64 -loadbit "up 0 [get_property DIRECTORY [current_project]]/tripleDemod.runs/impl_1/semcoDemodTop.bit" [get_property DIRECTORY [current_project]]/tripleDemodTop.mcs

