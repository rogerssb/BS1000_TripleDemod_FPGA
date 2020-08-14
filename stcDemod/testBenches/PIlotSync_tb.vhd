-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco All rights reserved.
--
-- This file contains Semco proprietary information. It is the
-- property of Semco and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco
--
-- Module Name: PilotSync_tb.vhd
-- Description:
--
-- Dependencies: Top level module
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 4/17/15 Initial release FZ
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity PilotSync_tb is
end PilotSync_tb;

architecture rtl of PilotSync_tb is

  -- Define Components

   COMPONENT pilotsync
      PORT (
         clk,
         reset,
         ce,
         PilotPulseIn,
         PilotFound,
         ValidIn        : IN STD_LOGIC;
         CorrPntr       : IN ufixed(15 DOWNTO 0);
         RealIn,
         ImagIn         : IN  Float_1_18;
         Offset         : IN  SLV4;       -- TODO, remove
         PilotOffset    : OUT SFixed(8 downto 0);
         StartNextFrame : OUT ufixed(15 DOWNTO 0);
         RealOut,
         ImagOut        : OUT Float_1_18;
         StartOut,
         ValidOut       : OUT STD_LOGIC
      );
   END COMPONENT;

   COMPONENT ReadGoldRef IS
      GENERIC (
         FILE_NAME         : string := "../test_data/file.txt";
         NUM_VALUES        : natural := 1;         -- number of values per line
         DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
         OUT_WIDTH         : natural := 32;        -- total width of each value
         OUT_BINPT         : integer := -31        -- number of fraction bits if any. If none, set to 0
      );
      PORT(
         clk               : IN  std_logic;
         reset             : IN  std_logic;
         ce                : IN  std_logic;
         OutputData        : OUT vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0);
         Done              : OUT std_logic
      );
   END COMPONENT ReadGoldRef;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   signal   reset       : std_logic := '1';
   signal   clk         : std_logic := '1';
   signal   ce          : std_logic := '1';

   SIGNAL   ValidIn,
            StartIn,
            PilotFound,
            ReadEn,
            StartOut,
            ValidOut,
            Done1       : std_logic := '0';
   SIGNAL   ReRead,
            ImRead      : vector_of_slvs(0 downto 0)(17 downto 0);
   SIGNAL   ReOut,
            ImOut       : FLOAT_1_18;
   SIGNAL   Booleans    : vector_of_slvs(3 downto 0)(0 downto 0);
   SIGNAL   Count,
            PacketCount,
            FrameCount  : natural;


begin

   process begin
      wait for 500 ps;
      if (Done1 = '1') then
         report "Simulation Finished" severity failure;
         wait;
      else
         clk <= not clk;
      end if;
   end process;

   process begin
      wait for 20 ns;
         reset <= '0';
   end process;

   ReData : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "../simData/resampled_r_+0_50_50%_Indx281.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => -17
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => ReadEn,
      OutputData        => ReRead,
      Done              => Done1
   );

   ImData : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "../simData/resampled_i_+0_50_50%_Indx281.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => -17
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => ReadEn,
      OutputData        => ImRead,
      Done              => open
   );

   ClkProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            Count <= 0;
            PacketCount <= 0;
            FrameCount  <= 0;
            StartIn <= '1';
            ValidIn <= '0';
            ReadEn  <= '0';
         else
            if (Count = 0) then
               StartIn  <= '1' when (PacketCount = 1) else '0';
               Count    <= 1;
            elsif (Count < 513) then
               StartIn  <= '0';
               ValidIn  <= '1';
               ReadEn   <= '1';
               Count    <= Count + 1;
            elsif (Count < 600) then
               Count    <= Count + 1;
               StartIn <= '0';
               ValidIn <= '0';
               ReadEn  <= '0';
            else
               Count <= 0;
               if (PacketCount < 25) then
                  PacketCount <= PacketCount + 1;
               else
                  FrameCount  <= FrameCount + 1;
                  PacketCount <= 0;
               end if;
            end if;
         end if;
      end if;
   end process ClkProcess;

   PS_u : pilotsync
   PORT MAP (
      clk            => clk,
      reset          => reset,
      ce             => ce,
      PilotPulseIn   => StartIn,
      PilotFound     => '1',
      ValidIn        => ValidIn,
      Offset         => x"0",
      CorrPntr       => to_ufixed(FrameCount, 15, 0),
      RealIn         => to_sfixed(ReRead(0), FLOAT_ZERO_1_18),
      ImagIn         => to_sfixed(ImRead(0), FLOAT_ZERO_1_18),
      PilotOffset    => open,
      StartNextFrame => open,
      RealOut        => open,
      ImagOut        => open,
      StartOut       => open,
      ValidOut       => open
   );

end rtl;
