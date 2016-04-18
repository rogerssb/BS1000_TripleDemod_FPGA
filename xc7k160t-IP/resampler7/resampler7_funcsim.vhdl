-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
-- Date        : Thu May 28 15:20:12 2015
-- Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim c:/modem/vivado/xc7k160t-IP/resampler7/resampler7_funcsim.vhdl
-- Design      : resampler7
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k160tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity resampler7_dist_mem_gen_v8_0 is
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
  attribute C_ADDR_WIDTH of resampler7_dist_mem_gen_v8_0 : entity is 5;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of resampler7_dist_mem_gen_v8_0 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of resampler7_dist_mem_gen_v8_0 : entity is 32;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of resampler7_dist_mem_gen_v8_0 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of resampler7_dist_mem_gen_v8_0 : entity is "kintex7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of resampler7_dist_mem_gen_v8_0 : entity is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of resampler7_dist_mem_gen_v8_0 : entity is "resampler7.mif";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of resampler7_dist_mem_gen_v8_0 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of resampler7_dist_mem_gen_v8_0 : entity is 1;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of resampler7_dist_mem_gen_v8_0 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of resampler7_dist_mem_gen_v8_0 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of resampler7_dist_mem_gen_v8_0 : entity is 18;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of resampler7_dist_mem_gen_v8_0 : entity is "dist_mem_gen_v8_0";
end resampler7_dist_mem_gen_v8_0;

architecture STRUCTURE of resampler7_dist_mem_gen_v8_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^a\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^spo\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of g0_b0 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of g0_b1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of g0_b10 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of g0_b11 : label is "soft_lutpair5";
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
  spo(16) <= \^a\(4);
  spo(15) <= \^a\(4);
  spo(14) <= \^a\(4);
  spo(13) <= \^a\(4);
  spo(12) <= \^a\(4);
  spo(11 downto 0) <= \^spo\(11 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
g0_b0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6F7BD739"
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
      INIT => X"C60D5233"
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
      INIT => X"FFFF078F"
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
      INIT => X"FFFF007F"
    )
        port map (
      I0 => \^a\(0),
      I1 => \^a\(1),
      I2 => \^a\(2),
      I3 => \^a\(3),
      I4 => \^a\(4),
      O => \^spo\(11)
    );
g0_b2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1CF812F3"
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
      INIT => X"71FA3902"
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
      INIT => X"773591FA"
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
      INIT => X"D8B700AB"
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
      INIT => X"9F98A064"
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
      INIT => X"E0753FE0"
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
      INIT => X"FFF36AB5"
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
      INIT => X"000F1993"
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
entity resampler7 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of resampler7 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of resampler7 : entity is "resampler7,dist_mem_gen_v8_0,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of resampler7 : entity is "resampler7,dist_mem_gen_v8_0,{x_ipProduct=Vivado 2015.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=dist_mem_gen,x_ipVersion=8.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=VERILOG,C_FAMILY=kintex7,C_ADDR_WIDTH=5,C_DEFAULT_DATA=0,C_DEPTH=32,C_HAS_CLK=0,C_HAS_D=0,C_HAS_DPO=0,C_HAS_DPRA=0,C_HAS_I_CE=0,C_HAS_QDPO=0,C_HAS_QDPO_CE=0,C_HAS_QDPO_CLK=0,C_HAS_QDPO_RST=0,C_HAS_QDPO_SRST=0,C_HAS_QSPO=0,C_HAS_QSPO_CE=0,C_HAS_QSPO_RST=0,C_HAS_QSPO_SRST=0,C_HAS_SPO=1,C_HAS_WE=0,C_MEM_INIT_FILE=resampler7.mif,C_ELABORATION_DIR=./,C_MEM_TYPE=0,C_PIPELINE_STAGES=0,C_QCE_JOINED=0,C_QUALIFY_WE=0,C_READ_MIF=1,C_REG_A_D_INPUTS=0,C_REG_DPRA_INPUT=0,C_SYNC_ENABLE=1,C_WIDTH=18,C_PARSER_TYPE=1}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of resampler7 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of resampler7 : entity is "dist_mem_gen_v8_0,Vivado 2015.1";
end resampler7;

architecture STRUCTURE of resampler7 is
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
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of U0 : label is std.standard.true;
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
  attribute c_mem_init_file of U0 : label is "resampler7.mif";
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
U0: entity work.resampler7_dist_mem_gen_v8_0
     port map (
      a(4 downto 0) => a(4 downto 0),
      clk => '0',
      d(17) => '0',
      d(16) => '0',
      d(15) => '0',
      d(14) => '0',
      d(13) => '0',
      d(12) => '0',
      d(11) => '0',
      d(10) => '0',
      d(9) => '0',
      d(8) => '0',
      d(7) => '0',
      d(6) => '0',
      d(5) => '0',
      d(4) => '0',
      d(3) => '0',
      d(2) => '0',
      d(1) => '0',
      d(0) => '0',
      dpo(17 downto 0) => NLW_U0_dpo_UNCONNECTED(17 downto 0),
      dpra(4) => '0',
      dpra(3) => '0',
      dpra(2) => '0',
      dpra(1) => '0',
      dpra(0) => '0',
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