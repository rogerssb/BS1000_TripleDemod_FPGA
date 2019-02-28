set_property PACKAGE_PIN D8 [get_ports Pll2Ref]
set_property PACKAGE_PIN F8 [get_ports Pll3Ref]
set_property PACKAGE_PIN C12 [get_ports Clk93]
set_property PACKAGE_PIN G11 [get_ports ClkPll]
set_property PACKAGE_PIN F9 [get_ports CS]
set_property PACKAGE_PIN H8 [get_ports MOSI]
set_property PACKAGE_PIN J8 [get_ports SClk]
set_property PACKAGE_PIN F10 [get_ports PD_n]
set_property PACKAGE_PIN F23 [get_ports BitOut]
set_property PACKAGE_PIN G24 [get_ports BitClk]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 26 [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports ClkPll]
set_property IOSTANDARD LVCMOS33 [get_ports Clk93]
set_property IOSTANDARD LVCMOS33 [get_ports Pll2Ref]
set_property IOSTANDARD LVCMOS33 [get_ports Pll3Ref]
set_property IOSTANDARD LVCMOS33 [get_ports CS]
set_property IOSTANDARD LVCMOS33 [get_ports MOSI]
set_property IOSTANDARD LVCMOS33 [get_ports PD_n]
set_property IOSTANDARD LVCMOS33 [get_ports SClk]
set_property IOSTANDARD LVCMOS33 [get_ports BitOut]
set_property IOSTANDARD LVCMOS33 [get_ports BitClk]




