-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
-- Date        : Fri Dec 09 11:24:34 2016
-- Host        : Sherlock running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/modem/telemetry/stcDemod/pilotDetector.srcs/sources_1/ip/pilotSynch/pilotSynch_stub.vhdl
-- Design      : pilotSynch
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k160tfbg676-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pilotSynch is
  Port ( 
    imagsyncin : in STD_LOGIC_VECTOR ( 17 downto 0 );
    pilotindexin : in STD_LOGIC_VECTOR ( 10 downto 0 );
    pilotpulsein : in STD_LOGIC_VECTOR ( 0 to 0 );
    realsyncin : in STD_LOGIC_VECTOR ( 17 downto 0 );
    validsyncin : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    imagout : out STD_LOGIC_VECTOR ( 17 downto 0 );
    offset : out STD_LOGIC_VECTOR ( 10 downto 0 );
    realout : out STD_LOGIC_VECTOR ( 17 downto 0 );
    startout : out STD_LOGIC_VECTOR ( 0 to 0 );
    validout : out STD_LOGIC_VECTOR ( 0 to 0 );
    pilot_index : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );

end pilotSynch;

architecture stub of pilotSynch is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "imagsyncin[17:0],pilotindexin[10:0],pilotpulsein[0:0],realsyncin[17:0],validsyncin[0:0],clk,imagout[17:0],offset[10:0],realout[17:0],startout[0:0],validout[0:0],pilot_index[10:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "pilotsync,Vivado 2016.3";
begin
end;
