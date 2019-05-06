-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
-- Date        : Fri Dec 09 11:50:35 2016
-- Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/modem/telemetry/stcDemod/pilotDetector.srcs/sources_1/ip/pilotDetection/pilotDetection_stub.vhdl
-- Design      : pilotDetection
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k160tfbg676-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pilotDetection is
  Port ( 
    imagdata : in STD_LOGIC_VECTOR ( 17 downto 0 );
    realdata : in STD_LOGIC_VECTOR ( 17 downto 0 );
    validpilot : in STD_LOGIC_VECTOR ( 0 to 0 );
    conj_imag : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    pilot_mag : out STD_LOGIC_VECTOR ( 17 downto 0 );
    pilot_found : out STD_LOGIC_VECTOR ( 0 to 0 );
    pilot_indexes : out STD_LOGIC_VECTOR ( 8 downto 0 );
    pilot_pulse : out STD_LOGIC_VECTOR ( 0 to 0 );
    imagpilotout : out STD_LOGIC_VECTOR ( 17 downto 0 );
    realpilotout : out STD_LOGIC_VECTOR ( 17 downto 0 );
    validpilotout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end pilotDetection;

architecture stub of pilotDetection is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "imagdata[17:0],realdata[17:0],validpilot[0:0],conj_imag[0:0],clk,pilot_mag[17:0],pilot_found[0:0],pilot_indexes[8:0],pilot_pulse[0:0],imagpilotout[17:0],realpilotout[17:0],validpilotout[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "pilotdetect,Vivado 2016.3";
begin
end;
