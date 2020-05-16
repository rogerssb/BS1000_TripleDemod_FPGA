-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
-- Date        : Mon Feb 17 20:25:41 2020
-- Host        : SEMCO_1039B running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Semco/Vivado/Demods/Latest/stcDemod.srcs/sources_1/ip/resamplerTap5/resamplerTap5_sim_netlist.vhdl
-- Design      : resamplerTap5
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k160tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity resamplerTap5_dist_mem_gen_v8_0_11 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    d : in STD_LOGIC_VECTOR ( 17 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 4 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 17 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 17 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 17 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 5;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of resamplerTap5_dist_mem_gen_v8_0_11 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 32;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of resamplerTap5_dist_mem_gen_v8_0_11 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of resamplerTap5_dist_mem_gen_v8_0_11 : entity is "kintex7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of resamplerTap5_dist_mem_gen_v8_0_11 : entity is "resamplerTap5.mif";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 1;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of resamplerTap5_dist_mem_gen_v8_0_11 : entity is 18;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of resamplerTap5_dist_mem_gen_v8_0_11 : entity is "dist_mem_gen_v8_0_11";
end resamplerTap5_dist_mem_gen_v8_0_11;

architecture STRUCTURE of resamplerTap5_dist_mem_gen_v8_0_11 is
  signal \<const0>\ : STD_LOGIC;
  signal \^a\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^spo\ : STD_LOGIC_VECTOR ( 16 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of g0_b0 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of g0_b1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of g0_b10 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of g0_b11 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of g0_b12 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of g0_b13 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of g0_b14 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of g0_b15 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of g0_b2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of g0_b3 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of g0_b4 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of g0_b5 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of g0_b6 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of g0_b7 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of g0_b8 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of g0_b9 : label is "soft_lutpair4";
begin
  \^a\(4 downto 0) <= a(4 downto 0);
  dpo(17) <= \<const0>\;
  dpo(16) <= \<const0>\;
  dpo(15) <= \<const0>\;
  dpo(14) <= \<const0>\;
  dpo(13) <= \<const0>\;
  dpo(12) <= \<const0>\;
  dpo(11) <= \<const0>\;
  dpo(10) <= \<const0>\;
  dpo(9) <= \<const0>\;
  dpo(8) <= \<const0>\;
  dpo(7) <= \<const0>\;
  dpo(6) <= \<const0>\;
  dpo(5) <= \<const0>\;
  dpo(4) <= \<const0>\;
  dpo(3) <= \<const0>\;
  dpo(2) <= \<const0>\;
  dpo(1) <= \<const0>\;
  dpo(0) <= \<const0>\;
  qdpo(17) <= \<const0>\;
  qdpo(16) <= \<const0>\;
  qdpo(15) <= \<const0>\;
  qdpo(14) <= \<const0>\;
  qdpo(13) <= \<const0>\;
  qdpo(12) <= \<const0>\;
  qdpo(11) <= \<const0>\;
  qdpo(10) <= \<const0>\;
  qdpo(9) <= \<const0>\;
  qdpo(8) <= \<const0>\;
  qdpo(7) <= \<const0>\;
  qdpo(6) <= \<const0>\;
  qdpo(5) <= \<const0>\;
  qdpo(4) <= \<const0>\;
  qdpo(3) <= \<const0>\;
  qdpo(2) <= \<const0>\;
  qdpo(1) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(17) <= \<const0>\;
  qspo(16) <= \<const0>\;
  qspo(15) <= \<const0>\;
  qspo(14) <= \<const0>\;
  qspo(13) <= \<const0>\;
  qspo(12) <= \<const0>\;
  qspo(11) <= \<const0>\;
  qspo(10) <= \<const0>\;
  qspo(9) <= \<const0>\;
  qspo(8) <= \<const0>\;
  qspo(7) <= \<const0>\;
  qspo(6) <= \<const0>\;
  qspo(5) <= \<const0>\;
  qspo(4) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
  spo(17) <= \^a\(4);
  spo(16 downto 0) <= \^spo\(16 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
g0_b0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"564FB383"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(0)
    );
g0_b1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"34F5AF4B"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(1)
    );
g0_b10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1942DD66"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(10)
    );
g0_b11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E72B032D"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(11)
    );
g0_b12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF1955B6"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(12)
    );
g0_b13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF07336D"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(13)
    );
g0_b14: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF0F1C"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(14)
    );
g0_b15: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF0E"
    )
        port map (
      I0 => \^a\(1),
      I1 => \^a\(2),
      I2 => \^a\(3),
      I3 => \^a\(4),
      O => \^spo\(15)
    );
g0_b16: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF01"
    )
        port map (
      I0 => \^a\(1),
      I1 => \^a\(2),
      I2 => \^a\(3),
      I3 => \^a\(4),
      O => \^spo\(16)
    );
g0_b2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"25B36184"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(2)
    );
g0_b3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A26FC801"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(3)
    );
g0_b4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"92ECB732"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(4)
    );
g0_b5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A32B47C3"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(5)
    );
g0_b6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D95E2E1D"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(6)
    );
g0_b7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C27BE0DE"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(7)
    );
g0_b8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DA1F2C60"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(8)
    );
g0_b9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9824A7D5"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity resamplerTap5 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of resamplerTap5 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of resamplerTap5 : entity is "resamplerTap5,dist_mem_gen_v8_0_11,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of resamplerTap5 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of resamplerTap5 : entity is "dist_mem_gen_v8_0_11,Vivado 2017.2.1";
end resamplerTap5;

architecture STRUCTURE of resamplerTap5 is
  signal NLW_U0_dpo_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "kintex7";
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of U0 : label is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of U0 : label is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of U0 : label is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of U0 : label is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of U0 : label is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of U0 : label is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of U0 : label is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of U0 : label is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 0;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 0;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of U0 : label is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of U0 : label is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of U0 : label is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of U0 : label is 0;
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 5;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 32;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_clk : integer;
  attribute c_has_clk of U0 : label is 0;
  attribute c_has_qspo : integer;
  attribute c_has_qspo of U0 : label is 0;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_has_qspo_rst : integer;
  attribute c_has_qspo_rst of U0 : label is 0;
  attribute c_has_qspo_srst : integer;
  attribute c_has_qspo_srst of U0 : label is 0;
  attribute c_has_spo : integer;
  attribute c_has_spo of U0 : label is 1;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "resamplerTap5.mif";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 1;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 18;
begin
U0: entity work.resamplerTap5_dist_mem_gen_v8_0_11
     port map (
      a(4 downto 0) => a(4 downto 0),
      clk => '0',
      d(17 downto 0) => B"000000000000000000",
      dpo(17 downto 0) => NLW_U0_dpo_UNCONNECTED(17 downto 0),
      dpra(4 downto 0) => B"00000",
      i_ce => '1',
      qdpo(17 downto 0) => NLW_U0_qdpo_UNCONNECTED(17 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(17 downto 0) => NLW_U0_qspo_UNCONNECTED(17 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(17 downto 0) => spo(17 downto 0),
      we => '0'
    );
end STRUCTURE;
