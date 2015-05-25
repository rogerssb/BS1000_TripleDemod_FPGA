# ------------------------------------------------------------------------------
# GNU make port to mingw32 Version: 3.80.0 Production Release-3
# Verne Stauffer, 2009-04-23
#
# This file creates a single NGC output file from multiple NGC input files. The
# immediate requirement is to provide the legacy demodulator verilog code in
# linkable binary format.
#
# The sequence is
# 1. Open legacyDemod.ise in Project Navigator
# 2. Run XST to produce output file legacyDemod.ngc
# 3. Run this file to produce output file legacyDemodTop.ngc
#
# ------------------------------------------------------------------------------

XILINX_PATH = C:/Xilinx/10.1/ISE/bin/nt/
SEARCH_DIRECTORIES = -sd coregen
UCF_FILE = demod.ucf
DESIGN = legacyDemod
PART = xc3sd3400a-4cs484

$(DESIGN)Top.ngc: $(DESIGN).ngc $(UCF_FILE)
	$(XILINX_PATH)ngcbuild.exe -p $(PART) $(SEARCH_DIRECTORIES) -uc $(UCF_FILE) $(DESIGN).ngc $(DESIGN)Top.ngc
