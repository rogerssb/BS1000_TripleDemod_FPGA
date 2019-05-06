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
-- Module Name: Pilot_tb.vhd
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

entity Pilot_tb is
end Pilot_tb;

architecture rtl of Pilot_tb is

  -- Define Components

   COMPONENT PilotDetect is
      PORT(
            clk,
            clk2x,
            reset,
            ce,
            ValidIn        : IN  std_logic;
            Variables      : IN  RecordType;
            ReIn,
            ImIn           : IN  FLOAT_1_18;
            PilotIndex     : OUT ufixed(10 downto 0);
            PilotMag,
            Threshold      : OUT sfixed(16 downto -1);
            ReOut,
            ImOut          : OUT FLOAT_1_18;
            PilotFound,
            ValidOut,
            StartOut       : OUT std_logic
      );
   end COMPONENT PilotDetect;

   COMPONENT pilotsync
      PORT (
         clk,
         reset,
         ce,
         PilotPulseIn,
         ValidIn       : IN STD_LOGIC;
         Variables     : IN  RecordType;
         IndexIn       : IN ufixed(10 DOWNTO 0);
         RealIn,
         ImagIn        : IN  Float_1_18;
         RealOut,
         ImagOut       : OUT Float_1_18;
         StartOut,
         ValidOut      : OUT STD_LOGIC
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

   COMPONENT WriteGoldRef IS
      GENERIC (
         FILE_NAME         : string := "../test_data/file.txt";
         NUM_VALUES        : natural := 1;         -- number of values per line
         DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
         OUT_WIDTH         : natural := 32;        -- total width of each value
         OUT_BINPT         : integer := -31        -- number of fraction bits if any. If none, set to 0
      );
      PORT(
         clk,
         ce,
         Done              : IN  std_logic;
         InputData         : IN vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0)
      );
   END COMPONENT WriteGoldRef;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   constant DELAY       : positive  := 4;
   type  MAG_ARRAY_18  is array (natural range <>) of sfixed(16 downto -1);
--                                              PilotOffset  DataRate
--   CONSTANT DEAD_TIME   : positive :=   62;--     ?          40Mb
--   CONSTANT DEAD_TIME   : positive :=  254;--     ?          30Mb
--   CONSTANT DEAD_TIME   : positive :=  637;--    1536        20Mb
--   CONSTANT DEAD_TIME   : positive := 1020;--    1536        15Mb
   CONSTANT DEAD_TIME   : positive := 1785;--    1024        10Mb
--   CONSTANT DEAD_TIME   : positive := 4083;--    1024        5Mb

   signal   reset       : std_logic := '1';
   signal   clk, clk2x  : std_logic := '1';
   signal   ce          : std_logic := '1';

   SIGNAL   DataValid,
            ValidIn,
            Done1,
            Done2,
            PilotFound,
            ValidDetect,
            StartDetect,
            ValidOut,
            StartOut    : std_logic := '0';
   SIGNAL   RealRead,
            ImagRead    : vector_of_slvs(0 to 0)(17 downto 0);
   SIGNAL   Variables   : RecordType := c_RecordType;
   SIGNAL   Count       : natural range 0 to 512+DEAD_TIME;
   SIGNAL   PilotCount  : natural range 0 to 13312;
   SIGNAL   PilotIndex  : ufixed(10 DOWNTO 0);
   SIGNAL   PilotMag,
            Threshold   : sfixed(16 downto -1);
   SIGNAL   ReDetect,
            ImDetect,
            ReOut,
            ImOut       : FLOAT_1_18;
   SIGNAL   MagThresh,
            ReImOut     : vector_of_slvs(1 downto 0)(17 downto 0);
   SIGNAL   Booleans    : vector_of_slvs(3 downto 0)(0 downto 0);

begin

   Variables.PilotSyncOffset <= to_ufixed(512 * 2, Variables.PilotSyncOffset);

   process begin
      wait for 500 ps;
      if (Done1 = '1') then
         report "Simulation Finished" severity failure;
         wait;
      else
         clk2x <= not clk2x;
      end if;
   end process;

   process begin
      wait for 20 ns;
         reset <= '0';
   end process;

   clkProcess : process(clk2x)
   begin
      if (rising_edge(clk2x)) then
         clk <= not clk;
      end if;
   end process clkProcess;

   reg_process : process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            Count <= 0;
            PilotCount <= 0;
            DataValid <= '0';
         else
            if (Count < 512 + DEAD_TIME) then -- samples per packet plus spare clks at 40Mb rate
               Count <= Count + 1;
               if (Count = 511) then
                  DataValid <= '0';
               end if;
            else
               Count <= 0;
               DataValid <= '1';
            end if;
            if (DataValid) then
               ValidIn <= '1';
               if (PilotCount < 13311) then
                  PilotCount <= PilotCount + 1;
               else
                  PilotCount <= 0;
               end if;
            else
               ValidIn <= '0';
            end if;
         end if;
      end if;
   end process reg_process;

   RealData : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "../simData/resampled_r_+0_100_95%.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => -17
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => DataValid,
      OutputData        => RealRead,
      Done              => Done1
   );

   ImagData : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "../simData/resampled_i_+0_100_95%.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => -17
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => DataValid,
      OutputData        => ImagRead,
      Done              => Done2
   );

   PD : PilotDetect
      PORT MAP(
         clk            => clk,
         clk2x          => clk2x,
         reset          => reset,
         ce             => ce,
         ValidIn        => ValidIn,
         Variables      => Variables,
         ReIn           => to_sfixed(RealRead(0), PARM_ZERO),
         ImIn           => to_sfixed(ImagRead(0), PARM_ZERO),
         PilotMag       => PilotMag,
         PilotIndex     => PilotIndex,
         Threshold      => Threshold,
         ReOut          => ReDetect,
         ImOut          => ImDetect,
         PilotFound     => PilotFound,
         ValidOut       => ValidDetect,
         StartOut       => StartDetect
   );

   PS_u : pilotsync
   PORT MAP (
      clk            => clk,
      reset          => reset,
      ce             => ce,
      Variables      => Variables,
      PilotPulseIn   => StartDetect,
      ValidIn        => ValidDetect,
      IndexIn        => PilotIndex,
      RealIn         => ReDetect,
      ImagIn         => ImDetect,
      RealOut        => ReOut,
      ImagOut        => ImOut,
      StartOut       => StartOut,
      ValidOut       => ValidOut
   );
/*
   MagThresh(1) <= to_slv(PilotMag);
   MagThresh(0) <= to_slv(Threshold);

   WriteMagThresh : WriteGoldRef
   GENERIC MAP(
      FILE_NAME   => "../simData/PilotMagThresh.txt",
      NUM_VALUES  => 2,
      DATA_TYPE   => UFix,
      OUT_WIDTH   => 18,
      OUT_BINPT   => -1
   )
   PORT MAP(
      clk         => clk,
      ce          => not reset,
      Done        => '0',
      InputData   => MagThresh
   );

   ReImOut(1) <= to_slv(ReOut);
   ReImOut(0) <= to_slv(ImOut);

   WriteReIm : WriteGoldRef
   GENERIC MAP(
      FILE_NAME   => "../simData/PilotReIm.txt",
      NUM_VALUES  => 2,
      DATA_TYPE   => SFix,
      OUT_WIDTH   => 18,
      OUT_BINPT   => -17
   )
   PORT MAP(
      clk         => clk,
      ce          => not reset,
      Done        => '0',
      InputData   => ReImOut
   );

   Booleans(3)(0) <= PilotPulse;
   Booleans(2)(0) <= PilotFound;
   Booleans(1)(0) <= ValidOut;
   Booleans(0)(0) <= StartOut;

   WriteBools : WriteGoldRef
   GENERIC MAP(
      FILE_NAME   => "../simData/PilotBools.txt",
      NUM_VALUES  => 4,
      DATA_TYPE   => Bools,
      OUT_WIDTH   => 1,
      OUT_BINPT   => 0
   )
   PORT MAP(
      clk         => clk,
      ce          => not reset,
      Done        => '0',
      InputData   => Booleans
   );
*/
end rtl;
