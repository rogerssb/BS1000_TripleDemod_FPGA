# (c) Copyright 2014 Xilinx, Inc. All rights reserved.

# Add in a clock definition for each input clock to the out-of-context module.
# The module will be synthesized as top so reference the clock origin using get_ports.
# You will need to define a clock on each input clock port, no top level clock information
# is provided to the module when set as out-of-context.
# Here is an example:
create_clock -name clk93 -period 10.7 [get_ports Clk]

set_multicycle_path -setup 3 -from [get_pins */C] -to [get_pins {*/D */CE */R}]
set_multicycle_path -hold  2 -from [get_pins */C] -to [get_pins {*/D */CE */R}]

set_false_path -from [get_port Reset] -to [all_registers]