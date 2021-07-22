# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator. 
#


namespace eval ::xilinx::dsp::planaheaddriver {
	set Compilation {IP Catalog}
	set CompilationFlow {IP}
	set CreateInterfaceDocument {on}
	set DSPDevice {xc7k160t}
	set DSPFamily {kintex7}
	set DSPPackage {fbg676}
	set DSPSpeed {-3}
	set FPGAClockPeriod 10
	set GenerateTestBench 0
	set HDLLanguage {verilog}
	set IPOOCCacheRootPath {C:/Users/scott rogers/AppData/Local/Xilinx/Sysgen/SysgenVivado/win64.o/ip}
	set IP_Auto_Infer {1}
	set IP_Categories_Text {System Generator for DSP}
	set IP_Common_Repos {0}
	set IP_Description {}
	set IP_Dir {}
	set IP_Library_Text {SysGen}
	set IP_LifeCycle_Menu {1}
	set IP_Logo {sysgen_icon_100.png}
	set IP_Name {hbf_fft}
	set IP_Revision {199734469}
	set IP_Socket_IP {0}
	set IP_Socket_IP_Proj_Path {}
	set IP_Vendor_Text {SEMCO}
	set IP_Version_Text {1.0}
	set ImplStrategyName {Vivado Implementation Defaults}
	set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
	set Project {hbf_fft}
	set ProjectFiles {
		{{conv_pkg.v}}
		{{synth_reg.v}}
		{{synth_reg_w_init.v}}
		{{convert_type.v}}
		{{xlclockdriver_rd.v}}
		{{vivado_ip.tcl}}
		{{hbf_fft_entity_declarations.v}}
		{{hbf_fft.v}}
		{{hbf_fft_clock.xdc}}
		{{hbf_fft.xdc}}
		{{hbf_fft.htm}}
	}
	set SimPeriod 1
	set SimTime 240300
	set SimulationTime {2403210.00000000 ns}
	set SynthStrategyName {Vivado Synthesis Defaults}
	set SynthesisTool {Vivado}
	set TargetDir {C:/modem/vivado/hbf_fft/netlist}
	set TopLevelModule {hbf_fft}
	set TopLevelSimulinkHandle 3.00012
	set TopLevelPortInterface {}
	dict set TopLevelPortInterface window Name {window}
	dict set TopLevelPortInterface window Type UFix_16_14
	dict set TopLevelPortInterface window ArithmeticType xlUnsigned
	dict set TopLevelPortInterface window BinaryPoint 14
	dict set TopLevelPortInterface window Width 16
	dict set TopLevelPortInterface window DatFile {hbf_fft_window.dat}
	dict set TopLevelPortInterface window IconText {Window}
	dict set TopLevelPortInterface window Direction in
	dict set TopLevelPortInterface window Period 2
	dict set TopLevelPortInterface window Interface 0
	dict set TopLevelPortInterface window InterfaceName {}
	dict set TopLevelPortInterface window InterfaceString {DATA}
	dict set TopLevelPortInterface window ClockDomain {hbf_fft}
	dict set TopLevelPortInterface window Locs {}
	dict set TopLevelPortInterface window IOStandard {}
	dict set TopLevelPortInterface startn Name {startn}
	dict set TopLevelPortInterface startn Type Bool
	dict set TopLevelPortInterface startn ArithmeticType xlUnsigned
	dict set TopLevelPortInterface startn BinaryPoint 0
	dict set TopLevelPortInterface startn Width 1
	dict set TopLevelPortInterface startn DatFile {hbf_fft_startn.dat}
	dict set TopLevelPortInterface startn IconText {Startn}
	dict set TopLevelPortInterface startn Direction in
	dict set TopLevelPortInterface startn Period 2
	dict set TopLevelPortInterface startn Interface 0
	dict set TopLevelPortInterface startn InterfaceName {}
	dict set TopLevelPortInterface startn InterfaceString {DATA}
	dict set TopLevelPortInterface startn ClockDomain {hbf_fft}
	dict set TopLevelPortInterface startn Locs {}
	dict set TopLevelPortInterface startn IOStandard {}
	dict set TopLevelPortInterface spectinv Name {spectinv}
	dict set TopLevelPortInterface spectinv Type UFix_1_0
	dict set TopLevelPortInterface spectinv ArithmeticType xlUnsigned
	dict set TopLevelPortInterface spectinv BinaryPoint 0
	dict set TopLevelPortInterface spectinv Width 1
	dict set TopLevelPortInterface spectinv DatFile {hbf_fft_spectinv.dat}
	dict set TopLevelPortInterface spectinv IconText {SpectInv}
	dict set TopLevelPortInterface spectinv Direction in
	dict set TopLevelPortInterface spectinv Period 2
	dict set TopLevelPortInterface spectinv Interface 0
	dict set TopLevelPortInterface spectinv InterfaceName {}
	dict set TopLevelPortInterface spectinv InterfaceString {DATA}
	dict set TopLevelPortInterface spectinv ClockDomain {hbf_fft}
	dict set TopLevelPortInterface spectinv Locs {}
	dict set TopLevelPortInterface spectinv IOStandard {}
	dict set TopLevelPortInterface scalesch Name {scalesch}
	dict set TopLevelPortInterface scalesch Type UFix_12_0
	dict set TopLevelPortInterface scalesch ArithmeticType xlUnsigned
	dict set TopLevelPortInterface scalesch BinaryPoint 0
	dict set TopLevelPortInterface scalesch Width 12
	dict set TopLevelPortInterface scalesch DatFile {hbf_fft_scalesch.dat}
	dict set TopLevelPortInterface scalesch IconText {ScaleSch}
	dict set TopLevelPortInterface scalesch Direction in
	dict set TopLevelPortInterface scalesch Period 2
	dict set TopLevelPortInterface scalesch Interface 0
	dict set TopLevelPortInterface scalesch InterfaceName {}
	dict set TopLevelPortInterface scalesch InterfaceString {DATA}
	dict set TopLevelPortInterface scalesch ClockDomain {hbf_fft}
	dict set TopLevelPortInterface scalesch Locs {}
	dict set TopLevelPortInterface scalesch IOStandard {}
	dict set TopLevelPortInterface rstfifo Name {rstfifo}
	dict set TopLevelPortInterface rstfifo Type Bool
	dict set TopLevelPortInterface rstfifo ArithmeticType xlUnsigned
	dict set TopLevelPortInterface rstfifo BinaryPoint 0
	dict set TopLevelPortInterface rstfifo Width 1
	dict set TopLevelPortInterface rstfifo DatFile {hbf_fft_rstfifo.dat}
	dict set TopLevelPortInterface rstfifo IconText {Rstfifo}
	dict set TopLevelPortInterface rstfifo Direction in
	dict set TopLevelPortInterface rstfifo Period 2
	dict set TopLevelPortInterface rstfifo Interface 0
	dict set TopLevelPortInterface rstfifo InterfaceName {}
	dict set TopLevelPortInterface rstfifo InterfaceString {DATA}
	dict set TopLevelPortInterface rstfifo ClockDomain {hbf_fft}
	dict set TopLevelPortInterface rstfifo Locs {}
	dict set TopLevelPortInterface rstfifo IOStandard {}
	dict set TopLevelPortInterface nfftwe Name {nfftwe}
	dict set TopLevelPortInterface nfftwe Type Bool
	dict set TopLevelPortInterface nfftwe ArithmeticType xlUnsigned
	dict set TopLevelPortInterface nfftwe BinaryPoint 0
	dict set TopLevelPortInterface nfftwe Width 1
	dict set TopLevelPortInterface nfftwe DatFile {hbf_fft_nfftwe.dat}
	dict set TopLevelPortInterface nfftwe IconText {NfftWe}
	dict set TopLevelPortInterface nfftwe Direction in
	dict set TopLevelPortInterface nfftwe Period 2
	dict set TopLevelPortInterface nfftwe Interface 0
	dict set TopLevelPortInterface nfftwe InterfaceName {}
	dict set TopLevelPortInterface nfftwe InterfaceString {DATA}
	dict set TopLevelPortInterface nfftwe ClockDomain {hbf_fft}
	dict set TopLevelPortInterface nfftwe Locs {}
	dict set TopLevelPortInterface nfftwe IOStandard {}
	dict set TopLevelPortInterface nfft Name {nfft}
	dict set TopLevelPortInterface nfft Type UFix_5_0
	dict set TopLevelPortInterface nfft ArithmeticType xlUnsigned
	dict set TopLevelPortInterface nfft BinaryPoint 0
	dict set TopLevelPortInterface nfft Width 5
	dict set TopLevelPortInterface nfft DatFile {hbf_fft_nfft.dat}
	dict set TopLevelPortInterface nfft IconText {Nfft}
	dict set TopLevelPortInterface nfft Direction in
	dict set TopLevelPortInterface nfft Period 2
	dict set TopLevelPortInterface nfft Interface 0
	dict set TopLevelPortInterface nfft InterfaceName {}
	dict set TopLevelPortInterface nfft InterfaceString {DATA}
	dict set TopLevelPortInterface nfft ClockDomain {hbf_fft}
	dict set TopLevelPortInterface nfft Locs {}
	dict set TopLevelPortInterface nfft IOStandard {}
	dict set TopLevelPortInterface datain Name {datain}
	dict set TopLevelPortInterface datain Type Fix_14_13
	dict set TopLevelPortInterface datain ArithmeticType xlSigned
	dict set TopLevelPortInterface datain BinaryPoint 13
	dict set TopLevelPortInterface datain Width 14
	dict set TopLevelPortInterface datain DatFile {hbf_fft_datain.dat}
	dict set TopLevelPortInterface datain IconText {DataIn}
	dict set TopLevelPortInterface datain Direction in
	dict set TopLevelPortInterface datain Period 1
	dict set TopLevelPortInterface datain Interface 0
	dict set TopLevelPortInterface datain InterfaceName {}
	dict set TopLevelPortInterface datain InterfaceString {DATA}
	dict set TopLevelPortInterface datain ClockDomain {hbf_fft}
	dict set TopLevelPortInterface datain Locs {}
	dict set TopLevelPortInterface datain IOStandard {}
	dict set TopLevelPortInterface fifofull_i Name {fifofull_i}
	dict set TopLevelPortInterface fifofull_i Type Bool
	dict set TopLevelPortInterface fifofull_i ArithmeticType xlUnsigned
	dict set TopLevelPortInterface fifofull_i BinaryPoint 0
	dict set TopLevelPortInterface fifofull_i Width 1
	dict set TopLevelPortInterface fifofull_i DatFile {hbf_fft_fifofull_i.dat}
	dict set TopLevelPortInterface fifofull_i IconText {FIFOFULL_I}
	dict set TopLevelPortInterface fifofull_i Direction out
	dict set TopLevelPortInterface fifofull_i Period 2
	dict set TopLevelPortInterface fifofull_i Interface 0
	dict set TopLevelPortInterface fifofull_i InterfaceName {}
	dict set TopLevelPortInterface fifofull_i InterfaceString {DATA}
	dict set TopLevelPortInterface fifofull_i ClockDomain {hbf_fft}
	dict set TopLevelPortInterface fifofull_i Locs {}
	dict set TopLevelPortInterface fifofull_i IOStandard {}
	dict set TopLevelPortInterface fifofull_q Name {fifofull_q}
	dict set TopLevelPortInterface fifofull_q Type Bool
	dict set TopLevelPortInterface fifofull_q ArithmeticType xlUnsigned
	dict set TopLevelPortInterface fifofull_q BinaryPoint 0
	dict set TopLevelPortInterface fifofull_q Width 1
	dict set TopLevelPortInterface fifofull_q DatFile {hbf_fft_fifofull_q.dat}
	dict set TopLevelPortInterface fifofull_q IconText {FIFOFULL_Q}
	dict set TopLevelPortInterface fifofull_q Direction out
	dict set TopLevelPortInterface fifofull_q Period 2
	dict set TopLevelPortInterface fifofull_q Interface 0
	dict set TopLevelPortInterface fifofull_q InterfaceName {}
	dict set TopLevelPortInterface fifofull_q InterfaceString {DATA}
	dict set TopLevelPortInterface fifofull_q ClockDomain {hbf_fft}
	dict set TopLevelPortInterface fifofull_q Locs {}
	dict set TopLevelPortInterface fifofull_q IOStandard {}
	dict set TopLevelPortInterface idata Name {idata}
	dict set TopLevelPortInterface idata Type Fix_19_17
	dict set TopLevelPortInterface idata ArithmeticType xlSigned
	dict set TopLevelPortInterface idata BinaryPoint 17
	dict set TopLevelPortInterface idata Width 19
	dict set TopLevelPortInterface idata DatFile {hbf_fft_idata.dat}
	dict set TopLevelPortInterface idata IconText {Idata}
	dict set TopLevelPortInterface idata Direction out
	dict set TopLevelPortInterface idata Period 2
	dict set TopLevelPortInterface idata Interface 0
	dict set TopLevelPortInterface idata InterfaceName {}
	dict set TopLevelPortInterface idata InterfaceString {DATA}
	dict set TopLevelPortInterface idata ClockDomain {hbf_fft}
	dict set TopLevelPortInterface idata Locs {}
	dict set TopLevelPortInterface idata IOStandard {}
	dict set TopLevelPortInterface n Name {n}
	dict set TopLevelPortInterface n Type UFix_13_0
	dict set TopLevelPortInterface n ArithmeticType xlUnsigned
	dict set TopLevelPortInterface n BinaryPoint 0
	dict set TopLevelPortInterface n Width 13
	dict set TopLevelPortInterface n DatFile {hbf_fft_n.dat}
	dict set TopLevelPortInterface n IconText {N}
	dict set TopLevelPortInterface n Direction out
	dict set TopLevelPortInterface n Period 2
	dict set TopLevelPortInterface n Interface 0
	dict set TopLevelPortInterface n InterfaceName {}
	dict set TopLevelPortInterface n InterfaceString {DATA}
	dict set TopLevelPortInterface n ClockDomain {hbf_fft}
	dict set TopLevelPortInterface n Locs {}
	dict set TopLevelPortInterface n IOStandard {}
	dict set TopLevelPortInterface qdata Name {qdata}
	dict set TopLevelPortInterface qdata Type Fix_16_14
	dict set TopLevelPortInterface qdata ArithmeticType xlSigned
	dict set TopLevelPortInterface qdata BinaryPoint 14
	dict set TopLevelPortInterface qdata Width 16
	dict set TopLevelPortInterface qdata DatFile {hbf_fft_qdata.dat}
	dict set TopLevelPortInterface qdata IconText {Qdata}
	dict set TopLevelPortInterface qdata Direction out
	dict set TopLevelPortInterface qdata Period 2
	dict set TopLevelPortInterface qdata Interface 0
	dict set TopLevelPortInterface qdata InterfaceName {}
	dict set TopLevelPortInterface qdata InterfaceString {DATA}
	dict set TopLevelPortInterface qdata ClockDomain {hbf_fft}
	dict set TopLevelPortInterface qdata Locs {}
	dict set TopLevelPortInterface qdata IOStandard {}
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d Name {fft_axis_tuser_xk_index_d}
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d Type UFix_12_0
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d ArithmeticType xlUnsigned
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d BinaryPoint 0
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d Width 12
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d DatFile {hbf_fft_fft_axis_tuser_xk_index_d.dat}
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d IconText {fft_axis_tuser_xk_index_d}
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d Direction out
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d Period 2
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d Interface 0
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d InterfaceName {}
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d InterfaceString {DATA}
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d ClockDomain {hbf_fft}
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d Locs {}
	dict set TopLevelPortInterface fft_axis_tuser_xk_index_d IOStandard {}
	dict set TopLevelPortInterface fft_mag_finished Name {fft_mag_finished}
	dict set TopLevelPortInterface fft_mag_finished Type Bool
	dict set TopLevelPortInterface fft_mag_finished ArithmeticType xlUnsigned
	dict set TopLevelPortInterface fft_mag_finished BinaryPoint 0
	dict set TopLevelPortInterface fft_mag_finished Width 1
	dict set TopLevelPortInterface fft_mag_finished DatFile {hbf_fft_fft_mag_finished.dat}
	dict set TopLevelPortInterface fft_mag_finished IconText {fft_mag_finished}
	dict set TopLevelPortInterface fft_mag_finished Direction out
	dict set TopLevelPortInterface fft_mag_finished Period 2
	dict set TopLevelPortInterface fft_mag_finished Interface 0
	dict set TopLevelPortInterface fft_mag_finished InterfaceName {}
	dict set TopLevelPortInterface fft_mag_finished InterfaceString {DATA}
	dict set TopLevelPortInterface fft_mag_finished ClockDomain {hbf_fft}
	dict set TopLevelPortInterface fft_mag_finished Locs {}
	dict set TopLevelPortInterface fft_mag_finished IOStandard {}
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast Name {fft_mag_m_axis_data_tlast}
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast Type Bool
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast ArithmeticType xlUnsigned
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast BinaryPoint 0
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast Width 1
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast DatFile {hbf_fft_fft_mag_m_axis_data_tlast.dat}
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast IconText {fft_mag_m_axis_data_tlast}
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast Direction out
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast Period 2
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast Interface 0
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast InterfaceName {}
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast InterfaceString {DATA}
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast ClockDomain {hbf_fft}
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast Locs {}
	dict set TopLevelPortInterface fft_mag_m_axis_data_tlast IOStandard {}
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid Name {fft_mag_m_axis_dout_tvalid}
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid Type Bool
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid ArithmeticType xlUnsigned
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid BinaryPoint 0
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid Width 1
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid DatFile {hbf_fft_fft_mag_m_axis_dout_tvalid.dat}
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid IconText {fft_mag_m_axis_dout_tvalid}
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid Direction out
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid Period 2
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid Interface 0
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid InterfaceName {}
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid InterfaceString {DATA}
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid ClockDomain {hbf_fft}
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid Locs {}
	dict set TopLevelPortInterface fft_mag_m_axis_dout_tvalid IOStandard {}
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real Name {fft_mag_m_axis_tdata_real}
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real Type Fix_16_14
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real ArithmeticType xlSigned
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real BinaryPoint 14
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real Width 16
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real DatFile {hbf_fft_fft_mag_m_axis_tdata_real.dat}
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real IconText {fft_mag_m_axis_tdata_real}
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real Direction out
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real Period 2
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real Interface 0
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real InterfaceName {}
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real InterfaceString {DATA}
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real ClockDomain {hbf_fft}
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real Locs {}
	dict set TopLevelPortInterface fft_mag_m_axis_tdata_real IOStandard {}
	dict set TopLevelPortInterface index_k Name {index_k}
	dict set TopLevelPortInterface index_k Type UFix_13_0
	dict set TopLevelPortInterface index_k ArithmeticType xlUnsigned
	dict set TopLevelPortInterface index_k BinaryPoint 0
	dict set TopLevelPortInterface index_k Width 13
	dict set TopLevelPortInterface index_k DatFile {hbf_fft_index_k.dat}
	dict set TopLevelPortInterface index_k IconText {index_k}
	dict set TopLevelPortInterface index_k Direction out
	dict set TopLevelPortInterface index_k Period 2
	dict set TopLevelPortInterface index_k Interface 0
	dict set TopLevelPortInterface index_k InterfaceName {}
	dict set TopLevelPortInterface index_k InterfaceString {DATA}
	dict set TopLevelPortInterface index_k ClockDomain {hbf_fft}
	dict set TopLevelPortInterface index_k Locs {}
	dict set TopLevelPortInterface index_k IOStandard {}
	dict set TopLevelPortInterface ce2 Name {ce2}
	dict set TopLevelPortInterface ce2 Type Bool
	dict set TopLevelPortInterface ce2 ArithmeticType xlUnsigned
	dict set TopLevelPortInterface ce2 BinaryPoint 0
	dict set TopLevelPortInterface ce2 Width 1
	dict set TopLevelPortInterface ce2 DatFile {hbf_fft_ce2.dat}
	dict set TopLevelPortInterface ce2 IconText {CE2}
	dict set TopLevelPortInterface ce2 Direction out
	dict set TopLevelPortInterface ce2 Period 1
	dict set TopLevelPortInterface ce2 Interface 0
	dict set TopLevelPortInterface ce2 InterfaceName {}
	dict set TopLevelPortInterface ce2 InterfaceString {DATA}
	dict set TopLevelPortInterface ce2 ClockDomain {hbf_fft}
	dict set TopLevelPortInterface ce2 Locs {}
	dict set TopLevelPortInterface ce2 IOStandard {}
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
	dict set TopLevelPortInterface clk ClockDomain {hbf_fft}
	dict set TopLevelPortInterface clk Locs {}
	dict set TopLevelPortInterface clk IOStandard {}
	dict set TopLevelPortInterface clk AssociatedInterfaces {}
	dict set TopLevelPortInterface clk AssociatedResets {}
	set MemoryMappedPort {}
}

source SgPaProject.tcl
::xilinx::dsp::planaheadworker::dsp_create_project