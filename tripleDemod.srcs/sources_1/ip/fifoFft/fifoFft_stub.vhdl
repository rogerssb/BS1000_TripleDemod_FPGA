-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
-- Date        : Fri Jun 17 01:27:28 2022
-- Host        : SEMCO_1039B running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Semco/Vivado/BitSyncBertMods/tripleDemod.srcs/sources_1/ip/fifoFft/fifoFft_stub.vhdl
-- Design      : fifoFft
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k160tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fifoFft is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 22 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 22 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );

end fifoFft;

architecture stub of fifoFft is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,din[22:0],wr_en,rd_en,dout[22:0],full,empty";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_1_4,Vivado 2017.2.1";
begin
end;