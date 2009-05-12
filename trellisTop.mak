# GNU make port to mingw32 Version: 3.80.0 Production Release-3
# Verne Stauffer, Koos Technical Services, 12/15/05

XILINX_PATH = C:/Xilinx/10.1/ISE/bin/nt/

PART = xc3sd3400a-4cs484
PROJECT = top
TRELLIS = trellisTop

SEARCH_DIRECTORIES = -sd coregen

top.bit: top.ncd
	$(XILINX_PATH)/bitgen.exe -intstyle ise -w -g \
        DebugBitstream:No \
        -g Binary:no \
        -g CRC:Enable \
        -g Reset_on_err:No \
        -g ConfigRate:6 \
        -g ProgPin:PullUp \
        -g DonePin:PullUp \
        -g TckPin:PullUp \
        -g TdiPin:PullUp \
        -g TdoPin:PullUp \
        -g TmsPin:PullUp \
        -g UnusedPin:PullUp \
        -g UserID:0xFFFFFFFF \
        -g StartUpClk:CClk \
        -g DONE_cycle:4 \
        -g GTS_cycle:5 \
        -g GWE_cycle:6 \
        -g LCK_cycle:NoWait \
        -g Security:None \
        -g DonePipe:No \
        -g DriveDone:No \
        -g en_sw_gsr:No \
        -g en_porb:Yes \
        -g drive_awake:No \
        -g suspend_filter:Yes \
        -g sw_clk:Startupclk \
        -g sw_gwe_cycle:5 \
        -g sw_gts_cycle:4 \
        $(PROJECT).ncd 

$(PROJECT).ngd: $(PROJECT).ngc $(PROJECT).ucf
	erase /q _ngo
	erase /q top_xdb
	erase /q xlnx_auto_0_xdb 
	$(XILINX_PATH)ngdbuild -intstyle ise $(SEARCH_DIRECTORIES) -dd _ngo -nt timestamp -uc $(PROJECT).ucf -p $(PART) $(PROJECT).ngc $(PROJECT).ngd
$(PROJECT).ncd: $(PROJECT).ngd $(PROJECT).ucf
	$(XILINX_PATH)map -detail -intstyle ise -p $(PART) -cm area -pr b -timing -ol high -k 4 -c 100 -tx off -o $(PROJECT)_map.ncd $(PROJECT).ngd $(PROJECT).pcf
	$(XILINX_PATH)par -w -intstyle ise -pl high -t 1 $(PROJECT)_map.ncd $(PROJECT).ncd $(PROJECT).pcf
	$(XILINX_PATH)trce -intstyle ise -v 3 -s 4 -tsi $(PROJECT).tsi -xml $(PROJECT) $(PROJECT).ncd -o $(PROJECT).twr $(PROJECT).pcf


$(TRELLIS).ngd: $(TRELLIS).ngc pcmTrellis.ucf
	erase /q _ngo
	erase /q pcmTrellis_xdb
	erase /q xlnx_auto_0_xdb 
	$(XILINX_PATH)ngdbuild -intstyle ise $(SEARCH_DIRECTORIES) -dd _ngo -nt timestamp -uc pcmTrellis.ucf -p $(PART) $(TRELLIS).ngc $(TRELLIS).ngd
$(TRELLIS).ncd: $(TRELLIS).ngd pcmTrellis.ucf
	$(XILINX_PATH)map -detail -intstyle ise -p $(PART) -cm area -pr b -timing -ol high -k 4 -c 100 -tx off -o $(TRELLIS)_map.ncd $(TRELLIS).ngd $(TRELLIS).pcf
	$(XILINX_PATH)par -w -intstyle ise -pl high -t 1 $(TRELLIS)_map.ncd $(TRELLIS).ncd $(TRELLIS).pcf
	$(XILINX_PATH)trce -intstyle ise -v 3 -s 4 -tsi $(TRELLIS).tsi -xml $(TRELLIS) $(TRELLIS).ncd -o $(TRELLIS).twr $(TRELLIS).pcf
$(TRELLIS).tsi: $(TRELLIS).ncd pcmTrellis.ucf
	$(XILINX_PATH)trce -intstyle ise -v 3 -s 4 -tsi $(TRELLIS).tsi -xml $(TRELLIS) $(TRELLIS).ncd -o $(TRELLIS).twr $(TRELLIS).pcf
