--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
--Date        : Wed May 25 17:22:49 2022
--Host        : SEMCO_1039B running 64-bit major release  (build 9200)
--Command     : generate_target dqmtoebno_bd.bd
--Design      : dqmtoebno_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dqmtoebno_bd is
  port (
    clk : in STD_LOGIC;
    dqm_in : in STD_LOGIC_VECTOR ( 16 downto 0 );
    gateway_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of dqmtoebno_bd : entity is "dqmtoebno_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=dqmtoebno_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=1,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SYSGEN,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of dqmtoebno_bd : entity is "dqmtoebno_bd.hwdef";
end dqmtoebno_bd;

architecture STRUCTURE of dqmtoebno_bd is
  component dqmtoebno_bd_dqmtoebno_1_0 is
  port (
    dqm_in : in STD_LOGIC_VECTOR ( 16 downto 0 );
    clk : in STD_LOGIC;
    gateway_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component dqmtoebno_bd_dqmtoebno_1_0;
  signal clk_1 : STD_LOGIC;
  signal dqm_in_1 : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal dqmtoebno_1_gateway_out : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  clk_1 <= clk;
  dqm_in_1(16 downto 0) <= dqm_in(16 downto 0);
  gateway_out(31 downto 0) <= dqmtoebno_1_gateway_out(31 downto 0);
dqmtoebno_1: component dqmtoebno_bd_dqmtoebno_1_0
     port map (
      clk => clk_1,
      dqm_in(16 downto 0) => dqm_in_1(16 downto 0),
      gateway_out(31 downto 0) => dqmtoebno_1_gateway_out(31 downto 0)
    );
end STRUCTURE;
