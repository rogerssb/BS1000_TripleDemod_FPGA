
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 4 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list Clks/inst/Clk_373]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 18 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {Brik1_u/PD_u/MaxCntr[-1]} {Brik1_u/PD_u/MaxCntr[0]} {Brik1_u/PD_u/MaxCntr[1]} {Brik1_u/PD_u/MaxCntr[2]} {Brik1_u/PD_u/MaxCntr[3]} {Brik1_u/PD_u/MaxCntr[4]} {Brik1_u/PD_u/MaxCntr[5]} {Brik1_u/PD_u/MaxCntr[6]} {Brik1_u/PD_u/MaxCntr[7]} {Brik1_u/PD_u/MaxCntr[8]} {Brik1_u/PD_u/MaxCntr[9]} {Brik1_u/PD_u/MaxCntr[10]} {Brik1_u/PD_u/MaxCntr[11]} {Brik1_u/PD_u/MaxCntr[12]} {Brik1_u/PD_u/MaxCntr[13]} {Brik1_u/PD_u/MaxCntr[14]} {Brik1_u/PD_u/MaxCntr[15]} {Brik1_u/PD_u/MaxCntr[16]}]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 4 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list Clks/inst/clk_93P]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 16 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {a2d_data[0]} {a2d_data[1]} {a2d_data[2]} {a2d_data[3]} {a2d_data[4]} {a2d_data[5]} {a2d_data[6]} {a2d_data[7]} {a2d_data[8]} {a2d_data[9]} {a2d_data[10]} {a2d_data[11]} {a2d_data[12]} {a2d_data[13]} {a2d_data[14]} {a2d_data[15]}]]
create_debug_core u_ila_2 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_2]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_2]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_2]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_2]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_2]
set_property C_INPUT_PIPE_STAGES 4 [get_debug_cores u_ila_2]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_2]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_2]
set_property port_width 1 [get_debug_ports u_ila_2/clk]
connect_debug_port u_ila_2/clk [get_nets [list Clks/inst/clk_186]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe0]
set_property port_width 4 [get_debug_ports u_ila_2/probe0]
connect_debug_port u_ila_2/probe0 [get_nets [list {TrellisBits[0]} {TrellisBits[1]} {TrellisBits[2]} {TrellisBits[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 11 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {Brik1_u/PD_u/Index3[0]} {Brik1_u/PD_u/Index3[1]} {Brik1_u/PD_u/Index3[2]} {Brik1_u/PD_u/Index3[3]} {Brik1_u/PD_u/Index3[4]} {Brik1_u/PD_u/Index3[5]} {Brik1_u/PD_u/Index3[6]} {Brik1_u/PD_u/Index3[7]} {Brik1_u/PD_u/Index3[8]} {Brik1_u/PD_u/Index3[9]} {Brik1_u/PD_u/Index3[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 18 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {Brik1_u/PD_u/Max[-1]} {Brik1_u/PD_u/Max[0]} {Brik1_u/PD_u/Max[1]} {Brik1_u/PD_u/Max[2]} {Brik1_u/PD_u/Max[3]} {Brik1_u/PD_u/Max[4]} {Brik1_u/PD_u/Max[5]} {Brik1_u/PD_u/Max[6]} {Brik1_u/PD_u/Max[7]} {Brik1_u/PD_u/Max[8]} {Brik1_u/PD_u/Max[9]} {Brik1_u/PD_u/Max[10]} {Brik1_u/PD_u/Max[11]} {Brik1_u/PD_u/Max[12]} {Brik1_u/PD_u/Max[13]} {Brik1_u/PD_u/Max[14]} {Brik1_u/PD_u/Max[15]} {Brik1_u/PD_u/Max[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list Brik1_u/PD_u/PilotPulse]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list Brik1_u/PD_u/PilotPulse2x]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe1]
set_property port_width 18 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list {InRBrik2[0]} {InRBrik2[1]} {InRBrik2[2]} {InRBrik2[3]} {InRBrik2[4]} {InRBrik2[5]} {InRBrik2[6]} {InRBrik2[7]} {InRBrik2[8]} {InRBrik2[9]} {InRBrik2[10]} {InRBrik2[11]} {InRBrik2[12]} {InRBrik2[13]} {InRBrik2[14]} {InRBrik2[15]} {InRBrik2[16]} {InRBrik2[17]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe2]
set_property port_width 18 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list {InIBrik2[0]} {InIBrik2[1]} {InIBrik2[2]} {InIBrik2[3]} {InIBrik2[4]} {InIBrik2[5]} {InIBrik2[6]} {InIBrik2[7]} {InIBrik2[8]} {InIBrik2[9]} {InIBrik2[10]} {InIBrik2[11]} {InIBrik2[12]} {InIBrik2[13]} {InIBrik2[14]} {InIBrik2[15]} {InIBrik2[16]} {InIBrik2[17]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe3]
set_property port_width 18 [get_debug_ports u_ila_2/probe3]
connect_debug_port u_ila_2/probe3 [get_nets [list {Brik2_u/DF_I[-17]} {Brik2_u/DF_I[-16]} {Brik2_u/DF_I[-15]} {Brik2_u/DF_I[-14]} {Brik2_u/DF_I[-13]} {Brik2_u/DF_I[-12]} {Brik2_u/DF_I[-11]} {Brik2_u/DF_I[-10]} {Brik2_u/DF_I[-9]} {Brik2_u/DF_I[-8]} {Brik2_u/DF_I[-7]} {Brik2_u/DF_I[-6]} {Brik2_u/DF_I[-5]} {Brik2_u/DF_I[-4]} {Brik2_u/DF_I[-3]} {Brik2_u/DF_I[-2]} {Brik2_u/DF_I[-1]} {Brik2_u/DF_I[0]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe4]
set_property port_width 25 [get_debug_ports u_ila_2/probe4]
connect_debug_port u_ila_2/probe4 [get_nets [list {Brik2_u/Freq[-7]} {Brik2_u/Freq[-6]} {Brik2_u/Freq[-5]} {Brik2_u/Freq[-4]} {Brik2_u/Freq[-3]} {Brik2_u/Freq[-2]} {Brik2_u/Freq[-1]} {Brik2_u/Freq[0]} {Brik2_u/Freq[1]} {Brik2_u/Freq[2]} {Brik2_u/Freq[3]} {Brik2_u/Freq[4]} {Brik2_u/Freq[5]} {Brik2_u/Freq[6]} {Brik2_u/Freq[7]} {Brik2_u/Freq[8]} {Brik2_u/Freq[9]} {Brik2_u/Freq[10]} {Brik2_u/Freq[11]} {Brik2_u/Freq[12]} {Brik2_u/Freq[13]} {Brik2_u/Freq[14]} {Brik2_u/Freq[15]} {Brik2_u/Freq[16]} {Brik2_u/Freq[17]}]]
#create_debug_port u_ila_2 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe5]
#set_property port_width 18 [get_debug_ports u_ila_2/probe5]
#connect_debug_port u_ila_2/probe5 [get_nets [list {Brik2_u/Tau1EstTE[-17]} {Brik2_u/Tau1EstTE[-16]} {Brik2_u/Tau1EstTE[-15]} {Brik2_u/Tau1EstTE[-14]} {Brik2_u/Tau1EstTE[-13]} {Brik2_u/Tau1EstTE[-12]} {Brik2_u/Tau1EstTE[-11]} {Brik2_u/Tau1EstTE[-10]} {Brik2_u/Tau1EstTE[-9]} {Brik2_u/Tau1EstTE[-8]} {Brik2_u/Tau1EstTE[-7]} {Brik2_u/Tau1EstTE[-6]} {Brik2_u/Tau1EstTE[-5]} {Brik2_u/Tau1EstTE[-4]} {Brik2_u/Tau1EstTE[-3]} {Brik2_u/Tau1EstTE[-2]} {Brik2_u/Tau1EstTE[-1]} {Brik2_u/Tau1EstTE[0]}]]
#create_debug_port u_ila_2 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe6]
#set_property port_width 18 [get_debug_ports u_ila_2/probe6]
#connect_debug_port u_ila_2/probe6 [get_nets [list {Brik2_u/H0Mag[-17]} {Brik2_u/H0Mag[-16]} {Brik2_u/H0Mag[-15]} {Brik2_u/H0Mag[-14]} {Brik2_u/H0Mag[-13]} {Brik2_u/H0Mag[-12]} {Brik2_u/H0Mag[-11]} {Brik2_u/H0Mag[-10]} {Brik2_u/H0Mag[-9]} {Brik2_u/H0Mag[-8]} {Brik2_u/H0Mag[-7]} {Brik2_u/H0Mag[-6]} {Brik2_u/H0Mag[-5]} {Brik2_u/H0Mag[-4]} {Brik2_u/H0Mag[-3]} {Brik2_u/H0Mag[-2]} {Brik2_u/H0Mag[-1]} {Brik2_u/H0Mag[0]}]]
#create_debug_port u_ila_2 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe7]
#set_property port_width 18 [get_debug_ports u_ila_2/probe7]
#connect_debug_port u_ila_2/probe7 [get_nets [list {Brik2_u/DF_R[-17]} {Brik2_u/DF_R[-16]} {Brik2_u/DF_R[-15]} {Brik2_u/DF_R[-14]} {Brik2_u/DF_R[-13]} {Brik2_u/DF_R[-12]} {Brik2_u/DF_R[-11]} {Brik2_u/DF_R[-10]} {Brik2_u/DF_R[-9]} {Brik2_u/DF_R[-8]} {Brik2_u/DF_R[-7]} {Brik2_u/DF_R[-6]} {Brik2_u/DF_R[-5]} {Brik2_u/DF_R[-4]} {Brik2_u/DF_R[-3]} {Brik2_u/DF_R[-2]} {Brik2_u/DF_R[-1]} {Brik2_u/DF_R[0]}]]
#create_debug_port u_ila_2 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe8]
#set_property port_width 18 [get_debug_ports u_ila_2/probe8]
#connect_debug_port u_ila_2/probe8 [get_nets [list {Brik2_u/H0EstR_CE[-17]} {Brik2_u/H0EstR_CE[-16]} {Brik2_u/H0EstR_CE[-15]} {Brik2_u/H0EstR_CE[-14]} {Brik2_u/H0EstR_CE[-13]} {Brik2_u/H0EstR_CE[-12]} {Brik2_u/H0EstR_CE[-11]} {Brik2_u/H0EstR_CE[-10]} {Brik2_u/H0EstR_CE[-9]} {Brik2_u/H0EstR_CE[-8]} {Brik2_u/H0EstR_CE[-7]} {Brik2_u/H0EstR_CE[-6]} {Brik2_u/H0EstR_CE[-5]} {Brik2_u/H0EstR_CE[-4]} {Brik2_u/H0EstR_CE[-3]} {Brik2_u/H0EstR_CE[-2]} {Brik2_u/H0EstR_CE[-1]} {Brik2_u/H0EstR_CE[0]}]]
#create_debug_port u_ila_2 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe9]
#set_property port_width 18 [get_debug_ports u_ila_2/probe9]
#connect_debug_port u_ila_2/probe9 [get_nets [list {Brik2_u/H0EstI_CE[-17]} {Brik2_u/H0EstI_CE[-16]} {Brik2_u/H0EstI_CE[-15]} {Brik2_u/H0EstI_CE[-14]} {Brik2_u/H0EstI_CE[-13]} {Brik2_u/H0EstI_CE[-12]} {Brik2_u/H0EstI_CE[-11]} {Brik2_u/H0EstI_CE[-10]} {Brik2_u/H0EstI_CE[-9]} {Brik2_u/H0EstI_CE[-8]} {Brik2_u/H0EstI_CE[-7]} {Brik2_u/H0EstI_CE[-6]} {Brik2_u/H0EstI_CE[-5]} {Brik2_u/H0EstI_CE[-4]} {Brik2_u/H0EstI_CE[-3]} {Brik2_u/H0EstI_CE[-2]} {Brik2_u/H0EstI_CE[-1]} {Brik2_u/H0EstI_CE[0]}]]
#create_debug_port u_ila_2 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe10]
#set_property port_width 18 [get_debug_ports u_ila_2/probe10]
#connect_debug_port u_ila_2/probe10 [get_nets [list {Brik2_u/H1Mag[-17]} {Brik2_u/H1Mag[-16]} {Brik2_u/H1Mag[-15]} {Brik2_u/H1Mag[-14]} {Brik2_u/H1Mag[-13]} {Brik2_u/H1Mag[-12]} {Brik2_u/H1Mag[-11]} {Brik2_u/H1Mag[-10]} {Brik2_u/H1Mag[-9]} {Brik2_u/H1Mag[-8]} {Brik2_u/H1Mag[-7]} {Brik2_u/H1Mag[-6]} {Brik2_u/H1Mag[-5]} {Brik2_u/H1Mag[-4]} {Brik2_u/H1Mag[-3]} {Brik2_u/H1Mag[-2]} {Brik2_u/H1Mag[-1]} {Brik2_u/H1Mag[0]}]]
#create_debug_port u_ila_2 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe11]
#set_property port_width 18 [get_debug_ports u_ila_2/probe11]
#connect_debug_port u_ila_2/probe11 [get_nets [list {Brik2_u/H1EstI_CE[-17]} {Brik2_u/H1EstI_CE[-16]} {Brik2_u/H1EstI_CE[-15]} {Brik2_u/H1EstI_CE[-14]} {Brik2_u/H1EstI_CE[-13]} {Brik2_u/H1EstI_CE[-12]} {Brik2_u/H1EstI_CE[-11]} {Brik2_u/H1EstI_CE[-10]} {Brik2_u/H1EstI_CE[-9]} {Brik2_u/H1EstI_CE[-8]} {Brik2_u/H1EstI_CE[-7]} {Brik2_u/H1EstI_CE[-6]} {Brik2_u/H1EstI_CE[-5]} {Brik2_u/H1EstI_CE[-4]} {Brik2_u/H1EstI_CE[-3]} {Brik2_u/H1EstI_CE[-2]} {Brik2_u/H1EstI_CE[-1]} {Brik2_u/H1EstI_CE[0]}]]
#create_debug_port u_ila_2 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe12]
#set_property port_width 18 [get_debug_ports u_ila_2/probe12]
#connect_debug_port u_ila_2/probe12 [get_nets [list {Brik2_u/H1EstR_CE[-17]} {Brik2_u/H1EstR_CE[-16]} {Brik2_u/H1EstR_CE[-15]} {Brik2_u/H1EstR_CE[-14]} {Brik2_u/H1EstR_CE[-13]} {Brik2_u/H1EstR_CE[-12]} {Brik2_u/H1EstR_CE[-11]} {Brik2_u/H1EstR_CE[-10]} {Brik2_u/H1EstR_CE[-9]} {Brik2_u/H1EstR_CE[-8]} {Brik2_u/H1EstR_CE[-7]} {Brik2_u/H1EstR_CE[-6]} {Brik2_u/H1EstR_CE[-5]} {Brik2_u/H1EstR_CE[-4]} {Brik2_u/H1EstR_CE[-3]} {Brik2_u/H1EstR_CE[-2]} {Brik2_u/H1EstR_CE[-1]} {Brik2_u/H1EstR_CE[0]}]]
#create_debug_port u_ila_2 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe13]
#set_property port_width 18 [get_debug_ports u_ila_2/probe13]
#connect_debug_port u_ila_2/probe13 [get_nets [list {Brik2_u/Tau0EstTE[-17]} {Brik2_u/Tau0EstTE[-16]} {Brik2_u/Tau0EstTE[-15]} {Brik2_u/Tau0EstTE[-14]} {Brik2_u/Tau0EstTE[-13]} {Brik2_u/Tau0EstTE[-12]} {Brik2_u/Tau0EstTE[-11]} {Brik2_u/Tau0EstTE[-10]} {Brik2_u/Tau0EstTE[-9]} {Brik2_u/Tau0EstTE[-8]} {Brik2_u/Tau0EstTE[-7]} {Brik2_u/Tau0EstTE[-6]} {Brik2_u/Tau0EstTE[-5]} {Brik2_u/Tau0EstTE[-4]} {Brik2_u/Tau0EstTE[-3]} {Brik2_u/Tau0EstTE[-2]} {Brik2_u/Tau0EstTE[-1]} {Brik2_u/Tau0EstTE[0]}]]
#create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe14]
set_property port_width 11 [get_debug_ports u_ila_2/probe14]
connect_debug_port u_ila_2/probe14 [get_nets [list {Brik1_u/PD_u/PilotIndex[0]} {Brik1_u/PD_u/PilotIndex[1]} {Brik1_u/PD_u/PilotIndex[2]} {Brik1_u/PD_u/PilotIndex[3]} {Brik1_u/PD_u/PilotIndex[4]} {Brik1_u/PD_u/PilotIndex[5]} {Brik1_u/PD_u/PilotIndex[6]} {Brik1_u/PD_u/PilotIndex[7]} {Brik1_u/PD_u/PilotIndex[8]} {Brik1_u/PD_u/PilotIndex[9]} {Brik1_u/PD_u/PilotIndex[10]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe15]
set_property port_width 18 [get_debug_ports u_ila_2/probe15]
connect_debug_port u_ila_2/probe15 [get_nets [list {Brik1_u/PD_u/Peak2[-1]} {Brik1_u/PD_u/Peak2[0]} {Brik1_u/PD_u/Peak2[1]} {Brik1_u/PD_u/Peak2[2]} {Brik1_u/PD_u/Peak2[3]} {Brik1_u/PD_u/Peak2[4]} {Brik1_u/PD_u/Peak2[5]} {Brik1_u/PD_u/Peak2[6]} {Brik1_u/PD_u/Peak2[7]} {Brik1_u/PD_u/Peak2[8]} {Brik1_u/PD_u/Peak2[9]} {Brik1_u/PD_u/Peak2[10]} {Brik1_u/PD_u/Peak2[11]} {Brik1_u/PD_u/Peak2[12]} {Brik1_u/PD_u/Peak2[13]} {Brik1_u/PD_u/Peak2[14]} {Brik1_u/PD_u/Peak2[15]} {Brik1_u/PD_u/Peak2[16]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe16]
set_property port_width 2 [get_debug_ports u_ila_2/probe16]
connect_debug_port u_ila_2/probe16 [get_nets [list {Brik1_u/PD_u/GoodPilot[0]} {Brik1_u/PD_u/GoodPilot[1]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe17]
set_property port_width 18 [get_debug_ports u_ila_2/probe17]
connect_debug_port u_ila_2/probe17 [get_nets [list {Brik1_u/PD_u/Threshold[-1]} {Brik1_u/PD_u/Threshold[0]} {Brik1_u/PD_u/Threshold[1]} {Brik1_u/PD_u/Threshold[2]} {Brik1_u/PD_u/Threshold[3]} {Brik1_u/PD_u/Threshold[4]} {Brik1_u/PD_u/Threshold[5]} {Brik1_u/PD_u/Threshold[6]} {Brik1_u/PD_u/Threshold[7]} {Brik1_u/PD_u/Threshold[8]} {Brik1_u/PD_u/Threshold[9]} {Brik1_u/PD_u/Threshold[10]} {Brik1_u/PD_u/Threshold[11]} {Brik1_u/PD_u/Threshold[12]} {Brik1_u/PD_u/Threshold[13]} {Brik1_u/PD_u/Threshold[14]} {Brik1_u/PD_u/Threshold[15]} {Brik1_u/PD_u/Threshold[16]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe18]
set_property port_width 8 [get_debug_ports u_ila_2/probe18]
connect_debug_port u_ila_2/probe18 [get_nets [list {Brik1_u/PD_u/BadPilot[0]} {Brik1_u/PD_u/BadPilot[1]} {Brik1_u/PD_u/BadPilot[2]} {Brik1_u/PD_u/BadPilot[3]} {Brik1_u/PD_u/BadPilot[4]} {Brik1_u/PD_u/BadPilot[5]} {Brik1_u/PD_u/BadPilot[6]} {Brik1_u/PD_u/BadPilot[7]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe19]
set_property port_width 18 [get_debug_ports u_ila_2/probe19]
connect_debug_port u_ila_2/probe19 [get_nets [list {Brik1_u/PD_u/Peak1[-1]} {Brik1_u/PD_u/Peak1[0]} {Brik1_u/PD_u/Peak1[1]} {Brik1_u/PD_u/Peak1[2]} {Brik1_u/PD_u/Peak1[3]} {Brik1_u/PD_u/Peak1[4]} {Brik1_u/PD_u/Peak1[5]} {Brik1_u/PD_u/Peak1[6]} {Brik1_u/PD_u/Peak1[7]} {Brik1_u/PD_u/Peak1[8]} {Brik1_u/PD_u/Peak1[9]} {Brik1_u/PD_u/Peak1[10]} {Brik1_u/PD_u/Peak1[11]} {Brik1_u/PD_u/Peak1[12]} {Brik1_u/PD_u/Peak1[13]} {Brik1_u/PD_u/Peak1[14]} {Brik1_u/PD_u/Peak1[15]} {Brik1_u/PD_u/Peak1[16]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe20]
set_property port_width 18 [get_debug_ports u_ila_2/probe20]
connect_debug_port u_ila_2/probe20 [get_nets [list {Brik1_u/PD_u/PilotMag[-1]} {Brik1_u/PD_u/PilotMag[0]} {Brik1_u/PD_u/PilotMag[1]} {Brik1_u/PD_u/PilotMag[2]} {Brik1_u/PD_u/PilotMag[3]} {Brik1_u/PD_u/PilotMag[4]} {Brik1_u/PD_u/PilotMag[5]} {Brik1_u/PD_u/PilotMag[6]} {Brik1_u/PD_u/PilotMag[7]} {Brik1_u/PD_u/PilotMag[8]} {Brik1_u/PD_u/PilotMag[9]} {Brik1_u/PD_u/PilotMag[10]} {Brik1_u/PD_u/PilotMag[11]} {Brik1_u/PD_u/PilotMag[12]} {Brik1_u/PD_u/PilotMag[13]} {Brik1_u/PD_u/PilotMag[14]} {Brik1_u/PD_u/PilotMag[15]} {Brik1_u/PD_u/PilotMag[16]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe22]
set_property port_width 1 [get_debug_ports u_ila_2/probe22]
connect_debug_port u_ila_2/probe22 [get_nets [list Brik1_u/PD_u/PilotFound]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe23]
set_property port_width 1 [get_debug_ports u_ila_2/probe23]
connect_debug_port u_ila_2/probe23 [get_nets [list StartInBrik2]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe24]
set_property port_width 1 [get_debug_ports u_ila_2/probe24]
connect_debug_port u_ila_2/probe24 [get_nets [list Brik1_u/PD_u/StartOut]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe25]
set_property port_width 1 [get_debug_ports u_ila_2/probe25]
connect_debug_port u_ila_2/probe25 [get_nets [list TrellisOutEn]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe26]
set_property port_width 1 [get_debug_ports u_ila_2/probe26]
connect_debug_port u_ila_2/probe26 [get_nets [list TrellisStart]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe27]
set_property port_width 1 [get_debug_ports u_ila_2/probe27]
connect_debug_port u_ila_2/probe27 [get_nets [list ValidInBrik2]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe28]
set_property port_width 1 [get_debug_ports u_ila_2/probe28]
connect_debug_port u_ila_2/probe28 [get_nets [list Brik2_u/ValidFreq]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_186]
