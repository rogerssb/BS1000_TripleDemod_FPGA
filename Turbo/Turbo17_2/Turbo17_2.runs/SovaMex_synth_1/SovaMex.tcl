# 
# Synthesis run script generated by Vivado
# 

set_param simulator.modelsimInstallPath C:/modeltech_pe_10.5c/win32pe
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_param project.vivado.isBlockSynthRun true
create_project -in_memory -part xc7k325tffg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Semco/Vivado/BS1000_Demod_vivado2017/Turbo/Turbo17_2/Turbo17_2.cache/wt [current_project]
set_property parent.project_path C:/Semco/Vivado/BS1000_Demod_vivado2017/Turbo/Turbo17_2/Turbo17_2.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib work [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/Semco/Vivado/BS1000_Demod_vivado2017/Turbo/Turbo17_2/Turbo17_2.cache/ip [current_project]
set_property ip_cache_permissions disable [current_project]
read_vhdl -vhdl2008 -library work {
  C:/Semco/Vivado/BS1000_Demod_vivado2017/Turbo/fixed_pkg_2008Bishop.vhd
  C:/Semco/Vivado/BS1000_Demod_vivado2017/Turbo/Semco_pkg.vhd
  C:/Semco/Vivado/BS1000_Demod_vivado2017/Turbo/SovaMex.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc -mode out_of_context C:/Semco/Vivado/BS1000_Demod_vivado2017/Turbo/Turbo17_2/Turbo17_2.srcs/SovaMex/new/SovaMex_ooc.xdc
set_property used_in_implementation false [get_files C:/Semco/Vivado/BS1000_Demod_vivado2017/Turbo/Turbo17_2/Turbo17_2.srcs/SovaMex/new/SovaMex_ooc.xdc]


synth_design -top SovaMex -part xc7k325tffg676-2 -mode out_of_context

rename_ref -prefix_all SovaMex_

write_checkpoint -force -noxdef SovaMex.dcp

catch { report_utilization -file SovaMex_utilization_synth.rpt -pb SovaMex_utilization_synth.pb }