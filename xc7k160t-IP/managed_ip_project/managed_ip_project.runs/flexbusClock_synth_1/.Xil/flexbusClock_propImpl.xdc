set_property SRC_FILE_INFO {cfile:c:/modem/vivado/xc7k160t-IP/flexbusClock/flexbusClock.xdc rfile:../../../../flexbusClock/flexbusClock.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.25