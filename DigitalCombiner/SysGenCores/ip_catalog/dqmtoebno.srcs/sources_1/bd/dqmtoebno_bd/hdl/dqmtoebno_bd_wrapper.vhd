--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
--Date        : Wed May 25 17:22:49 2022
--Host        : SEMCO_1039B running 64-bit major release  (build 9200)
--Command     : generate_target dqmtoebno_bd_wrapper.bd
--Design      : dqmtoebno_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dqmtoebno_bd_wrapper is
  port (
    clk : in STD_LOGIC;
    dqm_in : in STD_LOGIC_VECTOR ( 16 downto 0 );
    gateway_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end dqmtoebno_bd_wrapper;

architecture STRUCTURE of dqmtoebno_bd_wrapper is
  component dqmtoebno_bd is
  port (
    clk : in STD_LOGIC;
    dqm_in : in STD_LOGIC_VECTOR ( 16 downto 0 );
    gateway_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component dqmtoebno_bd;
begin
dqmtoebno_bd_i: component dqmtoebno_bd
     port map (
      clk => clk,
      dqm_in(16 downto 0) => dqm_in(16 downto 0),
      gateway_out(31 downto 0) => gateway_out(31 downto 0)
    );
end STRUCTURE;
