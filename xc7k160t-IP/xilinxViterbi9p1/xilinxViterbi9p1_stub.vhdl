-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
-- Date        : Fri Nov 04 10:53:39 2016
-- Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub c:/modem/vivado/xc7k160t-IP/xilinxViterbi9p1/xilinxViterbi9p1_stub.vhdl
-- Design      : xilinxViterbi9p1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k160tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xilinxViterbi9p1 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_data_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_data_tvalid : in STD_LOGIC;
    s_axis_data_tready : out STD_LOGIC;
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_data_tvalid : out STD_LOGIC;
    s_axis_dstat_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_dstat_tvalid : in STD_LOGIC;
    m_axis_dstat_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_dstat_tvalid : out STD_LOGIC
  );

end xilinxViterbi9p1;

architecture stub of xilinxViterbi9p1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,s_axis_data_tdata[15:0],s_axis_data_tvalid,s_axis_data_tready,m_axis_data_tdata[7:0],m_axis_data_tvalid,s_axis_dstat_tdata[15:0],s_axis_dstat_tvalid,m_axis_dstat_tdata[15:0],m_axis_dstat_tvalid";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "viterbi_v9_1_5,Vivado 2015.4";
begin
end;
