-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
-- Date        : Mon Feb 17 20:24:23 2020
-- Host        : SEMCO_1039B running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Semco/Vivado/Demods/Latest/stcDemod.srcs/sources_1/ip/halfbandEven/halfbandEven_stub.vhdl
-- Design      : halfbandEven
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k160tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfbandEven is
  Port ( 
    aresetn : in STD_LOGIC;
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    s_axis_data_tvalid : in STD_LOGIC;
    s_axis_data_tready : out STD_LOGIC;
    s_axis_data_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axis_data_tvalid : out STD_LOGIC;
    m_axis_data_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end halfbandEven;

architecture stub of halfbandEven is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aresetn,aclk,aclken,s_axis_data_tvalid,s_axis_data_tready,s_axis_data_tdata[23:0],m_axis_data_tvalid,m_axis_data_tuser[0:0],m_axis_data_tdata[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fir_compiler_v7_2_8,Vivado 2017.2.1";
begin
end;