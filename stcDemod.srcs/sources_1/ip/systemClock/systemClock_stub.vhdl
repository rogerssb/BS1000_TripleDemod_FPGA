-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
-- Date        : Fri Jul  5 13:08:01 2019
-- Host        : SEMCO1039 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top systemClock -prefix
--               systemClock_ systemClock_stub.vhdl
-- Design      : systemClock
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity systemClock is
  Port ( 
    clk93 : out STD_LOGIC;
    clk186 : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end systemClock;

architecture stub of systemClock is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk93,clk186,locked,clk_in1";
begin
end;
