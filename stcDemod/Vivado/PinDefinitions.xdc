## Define pin location and IO standards

set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]

#RF FMC mode
set_property IOSTANDARD LVDS [get_ports adc_dco_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports adc_dco_p]
set_property PACKAGE_PIN AA24 [get_ports adc_dco_p]
set_property PACKAGE_PIN AA25 [get_ports adc_dco_n]
set_property IOSTANDARD LVDS [get_ports adc_dco_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports adc_dco_n]

set_property IOSTANDARD LVDS [get_ports OverRange_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports OverRange_p]
set_property PACKAGE_PIN U24 [get_ports OverRange_p]
set_property PACKAGE_PIN U25 [get_ports OverRange_n]
set_property IOSTANDARD LVDS [get_ports OverRange_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports OverRange_n]
set_property IOSTANDARD LVDS [get_ports {adc_data_in_p[0]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_p[0]}]
set_property PACKAGE_PIN W23 [get_ports {adc_data_in_p[0]}]
set_property PACKAGE_PIN W24 [get_ports {adc_data_in_n[0]}]
set_property IOSTANDARD LVDS [get_ports {adc_data_in_n[0]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_n[0]}]

set_property IOSTANDARD LVDS [get_ports {adc_data_in_p[1]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_p[1]}]
set_property PACKAGE_PIN W25 [get_ports {adc_data_in_p[1]}]
set_property PACKAGE_PIN Y25 [get_ports {adc_data_in_n[1]}]
set_property IOSTANDARD LVDS [get_ports {adc_data_in_n[1]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_n[1]}]

set_property IOSTANDARD LVDS [get_ports {adc_data_in_p[2]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_p[2]}]
set_property PACKAGE_PIN AA22 [get_ports {adc_data_in_p[2]}]
set_property PACKAGE_PIN AB22 [get_ports {adc_data_in_n[2]}]
set_property IOSTANDARD LVDS [get_ports {adc_data_in_n[2]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_n[2]}]

set_property IOSTANDARD LVDS [get_ports {adc_data_in_p[3]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_p[3]}]
set_property PACKAGE_PIN W28 [get_ports {adc_data_in_p[3]}]
set_property PACKAGE_PIN Y28 [get_ports {adc_data_in_n[3]}]
set_property IOSTANDARD LVDS [get_ports {adc_data_in_n[3]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_n[3]}]

set_property IOSTANDARD LVDS [get_ports {adc_data_in_p[4]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_p[4]}]
set_property PACKAGE_PIN U26 [get_ports {adc_data_in_p[4]}]
set_property PACKAGE_PIN U27 [get_ports {adc_data_in_n[4]}]
set_property IOSTANDARD LVDS [get_ports {adc_data_in_n[4]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_n[4]}]

set_property IOSTANDARD LVDS [get_ports {adc_data_in_p[5]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_p[5]}]
set_property PACKAGE_PIN V27 [get_ports {adc_data_in_p[5]}]
set_property PACKAGE_PIN V28 [get_ports {adc_data_in_n[5]}]
set_property IOSTANDARD LVDS [get_ports {adc_data_in_n[5]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_n[5]}]

set_property IOSTANDARD LVDS [get_ports {adc_data_in_p[6]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_p[6]}]
set_property PACKAGE_PIN V29 [get_ports {adc_data_in_p[6]}]
set_property PACKAGE_PIN W29 [get_ports {adc_data_in_n[6]}]
set_property IOSTANDARD LVDS [get_ports {adc_data_in_n[6]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_n[6]}]

set_property IOSTANDARD LVDS [get_ports {adc_data_in_p[7]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_p[7]}]
set_property PACKAGE_PIN V22 [get_ports {adc_data_in_p[7]}]
set_property PACKAGE_PIN V23 [get_ports {adc_data_in_n[7]}]
set_property IOSTANDARD LVDS [get_ports {adc_data_in_n[7]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {adc_data_in_n[7]}]

## spi
#set_property -dict {PACKAGE_PIN Y33 IOSTANDARD LVCMOS18} [get_ports SpiCs_n]
#set_property -dict {PACKAGE_PIN W33     IOSTANDARD LVCMOS18} [get_ports spi_csn_clk]    ; ## FMC_LPC_LA33_P
#set_property -dict {PACKAGE_PIN Y30 IOSTANDARD LVCMOS18} [get_ports SpiClk]
#set_property -dict {PACKAGE_PIN W30 IOSTANDARD LVCMOS18} [get_ports SpiIO]

# GPIO SW 3:0
#et_property -dict {PACKAGE_PIN AN14 IOSTANDARD LVCMOS18} [get_ports {GPIO_DipSw[3]}]
#et_property -dict {PACKAGE_PIN AP18 IOSTANDARD LVCMOS18} [get_ports {GPIO_DipSw[2]}]
#et_property -dict {PACKAGE_PIN AN19 IOSTANDARD LVCMOS18} [get_ports {GPIO_DipSw[1]}]
#et_property -dict {PACKAGE_PIN AN16 IOSTANDARD LVCMOS18} [get_ports {GPIO_DipSw[0]}]

# pushbuttons
#et_property -dict {PACKAGE_PIN AF8 IOSTANDARD LVCMOS18} [get_ports South]
#
## Rotary Sw
#set_property -dict {PACKAGE_PIN Y21     IOSTANDARD LVCMOS18} [get_ports rotaryIncA];
#set_property -dict {PACKAGE_PIN AD26    IOSTANDARD LVCMOS18} [get_ports rotaryIncB];
#set_property -dict {PACKAGE_PIN AF28    IOSTANDARD LVCMOS18} [get_ports rotaryPush];

## LEDs
#set_property -dict {PACKAGE_PIN AP8 IOSTANDARD LVCMOS18} [get_ports Pass];       LED[0]
#set_property -dict {PACKAGE_PIN H23 IOSTANDARD LVCMOS18} [get_ports OverFlow];   LED[1]
#set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS18} [get_ports UnderFlow]:  LED[2]
set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS18} [get_ports Blink]
set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS18} [get_ports OverRange]
#set_property -dict {PACKAGE_PIN M22 IOSTANDARD LVCMOS18} [get_ports LED[5]]
set_property -dict {PACKAGE_PIN R23 IOSTANDARD LVCMOS18} [get_ports PilotFound]
set_property -dict {PACKAGE_PIN P23 IOSTANDARD LVCMOS18} [get_ports PilotLocked]; # LED[7]

set_property -dict {PACKAGE_PIN H27 IOSTANDARD LVCMOS18} [get_ports DataOut]
set_property -dict {PACKAGE_PIN G27 IOSTANDARD LVCMOS18} [get_ports ClkOut]

set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.PERSIST NO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 90 [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN DIV-1 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]



































