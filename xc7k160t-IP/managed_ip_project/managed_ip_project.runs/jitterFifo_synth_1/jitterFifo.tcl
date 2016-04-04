# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7k160tfbg676-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/modem/vivado/xc7k160t-IP/managed_ip_project/managed_ip_project.cache/wt [current_project]
set_property parent.project_path C:/modem/vivado/xc7k160t-IP/managed_ip_project/managed_ip_project.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_ip c:/modem/vivado/xc7k160t-IP/jitterFifo/jitterFifo.xci
set_property is_locked true [get_files c:/modem/vivado/xc7k160t-IP/jitterFifo/jitterFifo.xci]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
synth_design -top jitterFifo -part xc7k160tfbg676-1 -mode out_of_context
rename_ref -prefix_all jitterFifo_
write_checkpoint -noxdef jitterFifo.dcp
catch { report_utilization -file jitterFifo_utilization_synth.rpt -pb jitterFifo_utilization_synth.pb }
if { [catch {
  file copy -force C:/modem/vivado/xc7k160t-IP/managed_ip_project/managed_ip_project.runs/jitterFifo_synth_1/jitterFifo.dcp c:/modem/vivado/xc7k160t-IP/jitterFifo/jitterFifo.dcp
} _RESULT ] } { 
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}
if { [catch {
  write_verilog -force -mode synth_stub c:/modem/vivado/xc7k160t-IP/jitterFifo/jitterFifo_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode synth_stub c:/modem/vivado/xc7k160t-IP/jitterFifo/jitterFifo_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_verilog -force -mode funcsim c:/modem/vivado/xc7k160t-IP/jitterFifo/jitterFifo_funcsim.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode funcsim c:/modem/vivado/xc7k160t-IP/jitterFifo/jitterFifo_funcsim.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}
