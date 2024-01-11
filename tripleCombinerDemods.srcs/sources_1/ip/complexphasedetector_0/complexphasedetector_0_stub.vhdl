-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Mon Dec 18 13:17:52 2023
-- Host        : SEMCO_1039B running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Semco/Vivado/Demods2022/tripleCombinerDemods.srcs/sources_1/ip/complexphasedetector_0/complexphasedetector_0_stub.vhdl
-- Design      : complexphasedetector_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity complexphasedetector_0 is
  Port ( 
    ch1agc : in STD_LOGIC_VECTOR ( 12 downto 0 );
    ch1imag : in STD_LOGIC_VECTOR ( 17 downto 0 );
    ch1real : in STD_LOGIC_VECTOR ( 17 downto 0 );
    ch2agc : in STD_LOGIC_VECTOR ( 12 downto 0 );
    ch2imag : in STD_LOGIC_VECTOR ( 17 downto 0 );
    ch2real : in STD_LOGIC_VECTOR ( 17 downto 0 );
    enmasterswitching : in STD_LOGIC;
    forcech1 : in STD_LOGIC;
    lag_coef : in STD_LOGIC_VECTOR ( 17 downto 0 );
    lead_coef : in STD_LOGIC_VECTOR ( 17 downto 0 );
    lockhysterisis : in STD_LOGIC_VECTOR ( 12 downto 0 );
    lockthreshold : in STD_LOGIC_VECTOR ( 12 downto 0 );
    overridech : in STD_LOGIC;
    reset : in STD_LOGIC;
    sweeplmt : in STD_LOGIC_VECTOR ( 14 downto 0 );
    swprate : in STD_LOGIC_VECTOR ( 17 downto 0 );
    db_range : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    ch1ismaster : out STD_LOGIC;
    gainoutmax : out STD_LOGIC_VECTOR ( 17 downto 0 );
    gainoutmin : out STD_LOGIC_VECTOR ( 17 downto 0 );
    imaglock : out STD_LOGIC_VECTOR ( 12 downto 0 );
    imagout : out STD_LOGIC_VECTOR ( 17 downto 0 );
    imagxord : out STD_LOGIC;
    lag_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    locked : out STD_LOGIC;
    maximagout : out STD_LOGIC_VECTOR ( 17 downto 0 );
    maxrealout : out STD_LOGIC_VECTOR ( 17 downto 0 );
    minimagout : out STD_LOGIC_VECTOR ( 17 downto 0 );
    minrealout : out STD_LOGIC_VECTOR ( 17 downto 0 );
    nco_control_out : out STD_LOGIC_VECTOR ( 21 downto 0 );
    phase_detect : out STD_LOGIC_VECTOR ( 17 downto 0 );
    power : out STD_LOGIC_VECTOR ( 17 downto 0 );
    reallock : out STD_LOGIC_VECTOR ( 12 downto 0 );
    realout : out STD_LOGIC_VECTOR ( 17 downto 0 );
    realxord : out STD_LOGIC
  );

end complexphasedetector_0;

architecture stub of complexphasedetector_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ch1agc[12:0],ch1imag[17:0],ch1real[17:0],ch2agc[12:0],ch2imag[17:0],ch2real[17:0],enmasterswitching,forcech1,lag_coef[17:0],lead_coef[17:0],lockhysterisis[12:0],lockthreshold[12:0],overridech,reset,sweeplmt[14:0],swprate[17:0],db_range[15:0],clk,ch1ismaster,gainoutmax[17:0],gainoutmin[17:0],imaglock[12:0],imagout[17:0],imagxord,lag_out[31:0],locked,maximagout[17:0],maxrealout[17:0],minimagout[17:0],minrealout[17:0],nco_control_out[21:0],phase_detect[17:0],power[17:0],reallock[12:0],realout[17:0],realxord";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "complexphasedetector,Vivado 2016.4";
begin
end;
