-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Wed Feb 03 11:30:43 2021
-- Host        : SEMCO_1039B running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Semco/Vivado/Demods2016/xc7k160t-IP/reciprocalLut/reciprocalLut_stub.vhdl
-- Design      : reciprocalLut
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reciprocalLut is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );

end reciprocalLut;

architecture stub of reciprocalLut is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[4:0],spo[17:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_11,Vivado 2016.4";
begin
end;
