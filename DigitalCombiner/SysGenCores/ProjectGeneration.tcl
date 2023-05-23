# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator. 
#


namespace eval ::xilinx::dsp::planaheaddriver {
	set Compilation {IP Catalog}
	set CompilationFlow {IP}
	set CreateInterfaceDocument {off}
	set DSPDevice {xc7k325t}
	set DSPFamily {kintex7}
	set DSPPackage {fbg676}
	set DSPSpeed {-3}
	set FPGAClockPeriod 10
	set GenerateTestBench 0
	set HDLLanguage {vhdl}
	set IPOOCCacheRootPath {C:/Users/frank/AppData/Local/Xilinx/Sysgen/SysgenVivado/win64.o/ip}
	set IP_Auto_Infer {1}
	set IP_Categories_Text {System_Generator_for_DSP}
	set IP_Common_Repos {0}
	set IP_Description {}
	set IP_Dir {}
	set IP_Library_Text {SysGen}
	set IP_LifeCycle_Menu {2}
	set IP_Logo {sysgen_icon_100.png}
	set IP_Name {}
	set IP_Revision {284404942}
	set IP_Socket_IP {0}
	set IP_Socket_IP_Proj_Path {}
	set IP_Vendor_Text {User_Company}
	set IP_Version_Text {1.0}
	set ImplStrategyName {Vivado Implementation Defaults}
	set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
	set Project {dqmtoebno}
	set ProjectFiles {
		{{conv_pkg.vhd} -lib {xil_defaultlib}}
		{{synth_reg.vhd} -lib {xil_defaultlib}}
		{{synth_reg_w_init.vhd} -lib {xil_defaultlib}}
		{{srl17e.vhd} -lib {xil_defaultlib}}
		{{srl33e.vhd} -lib {xil_defaultlib}}
		{{synth_reg_reg.vhd} -lib {xil_defaultlib}}
		{{single_reg_w_init.vhd} -lib {xil_defaultlib}}
		{{xlclockdriver_rd.vhd} -lib {xil_defaultlib}}
		{{vivado_ip.tcl}}
		{{dqmtoebno_entity_declarations.vhd} -lib {xil_defaultlib}}
		{{dqmtoebno.vhd} -lib {xil_defaultlib}}
		{{dqmtoebno_clock.xdc}}
		{{dqmtoebno.xdc}}
	}
	set SimPeriod 1
	set SimTime 1000
	set SimulationTime {10210.00000000 ns}
	set SynthStrategyName {Vivado Synthesis Defaults}
	set SynthesisTool {Vivado}
	set TargetDir {C:/Semco/Vivado/Demods2016/DigitalCombiner/SysGenCores}
	set TopLevelModule {dqmtoebno}
	set TopLevelSimulinkHandle 4858
	set VHDLLib {xil_defaultlib}
	set TopLevelPortInterface {}
	dict set TopLevelPortInterface dqm_in Name {dqm_in}
	dict set TopLevelPortInterface dqm_in Type Fix_17_0
	dict set TopLevelPortInterface dqm_in ArithmeticType xlSigned
	dict set TopLevelPortInterface dqm_in BinaryPoint 0
	dict set TopLevelPortInterface dqm_in Width 17
	dict set TopLevelPortInterface dqm_in DatFile {dqmtoebno_dqm_in.dat}
	dict set TopLevelPortInterface dqm_in IconText {DQM_In}
	dict set TopLevelPortInterface dqm_in Direction in
	dict set TopLevelPortInterface dqm_in Period 1
	dict set TopLevelPortInterface dqm_in Interface 0
	dict set TopLevelPortInterface dqm_in InterfaceName {}
	dict set TopLevelPortInterface dqm_in InterfaceString {DATA}
	dict set TopLevelPortInterface dqm_in ClockDomain {dqmtoebno}
	dict set TopLevelPortInterface dqm_in Locs {}
	dict set TopLevelPortInterface dqm_in IOStandard {}
	dict set TopLevelPortInterface gateway_out Name {gateway_out}
	dict set TopLevelPortInterface gateway_out Type XFloat_8_24
	dict set TopLevelPortInterface gateway_out ArithmeticType xlFloat
	dict set TopLevelPortInterface gateway_out BinaryPoint 24
	dict set TopLevelPortInterface gateway_out Width 32
	dict set TopLevelPortInterface gateway_out DatFile {dqmtoebno_gateway_out.dat}
	dict set TopLevelPortInterface gateway_out IconText {Gateway Out}
	dict set TopLevelPortInterface gateway_out Direction out
	dict set TopLevelPortInterface gateway_out Period 1
	dict set TopLevelPortInterface gateway_out Interface 0
	dict set TopLevelPortInterface gateway_out InterfaceName {}
	dict set TopLevelPortInterface gateway_out InterfaceString {DATA}
	dict set TopLevelPortInterface gateway_out ClockDomain {dqmtoebno}
	dict set TopLevelPortInterface gateway_out Locs {}
	dict set TopLevelPortInterface gateway_out IOStandard {}
	dict set TopLevelPortInterface clk Name {clk}
	dict set TopLevelPortInterface clk Type -
	dict set TopLevelPortInterface clk ArithmeticType xlUnsigned
	dict set TopLevelPortInterface clk BinaryPoint 0
	dict set TopLevelPortInterface clk Width 1
	dict set TopLevelPortInterface clk DatFile {}
	dict set TopLevelPortInterface clk Direction in
	dict set TopLevelPortInterface clk Period 1
	dict set TopLevelPortInterface clk Interface 6
	dict set TopLevelPortInterface clk InterfaceName {}
	dict set TopLevelPortInterface clk InterfaceString {CLOCK}
	dict set TopLevelPortInterface clk ClockDomain {dqmtoebno}
	dict set TopLevelPortInterface clk Locs {}
	dict set TopLevelPortInterface clk IOStandard {}
	dict set TopLevelPortInterface clk AssociatedInterfaces {}
	dict set TopLevelPortInterface clk AssociatedResets {}
	set MemoryMappedPort {}
}

source SgPaProject.tcl
::xilinx::dsp::planaheadworker::dsp_create_project