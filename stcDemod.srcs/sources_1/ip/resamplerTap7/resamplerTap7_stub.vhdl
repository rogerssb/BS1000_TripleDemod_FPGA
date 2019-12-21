-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
-- Date        : Wed Dec 18 17:02:00 2019
-- Host        : SEMCO_1039B running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Semco/Vivado/Demods/stcDemod.srcs/sources_1/ip/resamplerTap7/resamplerTap7_stub.vhdl
-- Design      : resamplerTap7
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity resamplerTap7 is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );

end resamplerTap7;

architecture stub of resamplerTap7 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[4:0],spo[17:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_11,Vivado 2017.2.1";
begin
end;
