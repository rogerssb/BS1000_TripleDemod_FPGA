-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
-- Date        : Tue Oct 22 15:19:29 2019
-- Host        : SEMCO_1039B running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top resamplerTap0 -prefix
--               resamplerTap0_ resamplerTap0_stub.vhdl
-- Design      : resamplerTap0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity resamplerTap0 is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );

end resamplerTap0;

architecture stub of resamplerTap0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[4:0],spo[17:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_11,Vivado 2017.2.1";
begin
end;
