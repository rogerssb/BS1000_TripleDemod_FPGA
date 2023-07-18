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
-- Module Name: PilotDet_tb.vhd
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
use ieee.std_logic_textio.all;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.all;
use work.Semco_pkg.ALL;

entity PilotDet_tb is
   generic (
      IN_WIDTH    : natural   := 18;
      IN_BINPT    : natural   := 17;
      OUT_WIDTH   : natural   := 18;
      OUT_BINPT   : natural   := 17
   );
end PilotDet_tb;

architecture rtl of PilotDet_tb is

  -- Define Components

COMPONENT PilotDetectSliding is
   GENERIC
      (SIM_MODE : boolean := false
   );
   PORT(
         clk,
         clk2x,
         reset,
         reset2x,
         ce,
         SpectrumInv,
         Mag0GtMag1,
         ValidIn        : IN  std_logic;
         ReIn,
         ImIn           : IN  FLOAT_1_18;
         SearchRange    : IN  SLV4;
         CorrPntr,                                 -- Packet buffer pointer
         RawAddr        : OUT ufixed(15 downto 0);
         ReOut,
         ImOut          : OUT FLOAT_1_18;          -- Packetized output
         Magnitude0,
         Magnitude1,
         PhaseOut0,
         PhaseOut1,                                -- Streaming Mag/Phs of iFFT
         MagPeak0,
         PhsPeak0,
         MagPeak1,
         PhsPeak1       : OUT SLV18;               -- Peak Mag/Phs of iFFT
         PilotFound,
         ValidOut,                                 -- ReOut/ImOut valid
         StartOut       : OUT std_logic
      );
   end COMPONENT PilotDetectSliding;

COMPONENT ReadGoldRef IS
   GENERIC (
      FILE_NAME         : string := "../test_data/file.txt";
      NUM_VALUES        : natural := 1;         -- number of values per line
      DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
      OUT_WIDTH         : natural := 32;        -- total width of each value
      OUT_BINPT         : natural := 31         -- number of fraction bits if any. If none, set to 0
   );
   PORT(
      clk               : IN  std_logic;
      reset             : IN  std_logic;
      ce                : IN  std_logic;
      OutputData        : OUT vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0);
      Done              : OUT std_logic
   );
END COMPONENT ReadGoldRef;

COMPONENT CompareGoldRef IS
   GENERIC (
      FILE_NAME         : string := "../test_data/file.txt";
      NUM_VALUES        : natural := 1;         -- number of values per line
      DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
      IN_WIDTH          : natural := 32;        -- total width of each value
      IN_BINPT          : natural := 31;        -- number of fraction bits if any. If none, set to 0
      DELAY             : natural := 1
   );
   PORT(
      clk               : IN  std_logic;
      reset             : IN  std_logic;
      ce                : IN  std_logic;
      IgnoreCount       : IN  UINT8slv;
      InputData         : IN  vector_of_slvs(0 to NUM_VALUES-1)(IN_WIDTH-1 downto 0);
      ErrorOut          : OUT UINT32slv;
      Done              : OUT std_logic
   );
END COMPONENT CompareGoldRef;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   constant DELAY                : positive  := 4;

   signal   reset                : std_logic := '1';
   signal   clk, clk2x           : std_logic := '1';

   SIGNAL   DataValid         : std_logic := '0';
   SIGNAL   Done,
            BitRate,
            BitMax            : UINT8 := (others=>'0');
   SIGNAL   Errors            : vector_of_slvs(0 to 1)(31 downto 0);
   SIGNAL   ErrorCount        : UINT16 := (others=>'0');
   SIGNAL   VarsComp0,
            VarsComp1,
            VarsReal,
            VarsImag          : vector_of_slvs(0 to 0)(17 downto 0);
   SIGNAL   RealComp,
            ImagComp,
            ReIn,
            ImIn              : std_logic_vector(17 downto 0);
   signal   Count             : UINT8 := x"11";


begin

   process begin
      wait for 500 ps;
      if (Done > 0) then
         if ( (ErrorCount > 0) ) then
            report "Simulation Failed" severity failure;
         else
            report "Simulation Passed" severity note;
         end if;
         wait;
      else
         clk2x <= not clk2x;
         if (clk2x) then
            clk <= not clk;
         end if;
      end if;
   end process;

   process begin
      wait for 3 ns;
         reset <= '0';
         BitMax <= x"04";
   end process;

   reg_process : process (clk)
   begin
      if (rising_edge(clk)) then
         if (BitRate < BitMax) then
            BitRate <= BitRate + 1;
            DataValid <= '0';
         else
            BitRate <= x"00";
            DataValid <= '1';
            Count <= Count + 1;
         end if;
         if ( unsigned(Errors(0)) > 0 or unsigned(Errors(1)) > 0 ) then
            ErrorCount <= ErrorCount + 1;
         end if;
      end if;
   end process reg_process;

   ReadReal : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "../simData/InRBrik2.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => 17
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => DataValid,
      OutputData        => VarsReal,
      Done              => Done(7)
   );

   ReadImag : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "../simData/InIBrik2.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => 17
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => DataValid,
      OutputData        => VarsImag,
      Done              => Done(6)
   );

   ReIn <= VarsReal(0);
   ImIn <= VarsImag(0);

   PD_u : PilotDetectSliding
      GENERIC MAP
         (SIM_MODE => TRUE
      )
      PORT MAP(
         clk            => clk,
         clk2x          => clk2x,
         reset          => reset,
         reset2x        => reset,
         ce             => '1',
         SpectrumInv    => '0',
         Mag0GtMag1     => '0',
         ValidIn        => DataValid,
         ReIn           => to_sfixed(10x"00" & std_logic_vector(Count), 0, -17),
         ImIn           => to_sfixed(10x"11" & std_logic_vector(Count), 0, -17),
         SearchRange    => x"2",
         CorrPntr       => open,
         RawAddr        => open,
         ReOut          => open,
         ImOut          => open,
         Magnitude0     => open,
         Magnitude1     => open,
         PhaseOut0      => open,
         PhaseOut1      => open,
         MagPeak0       => open,
         PhsPeak0       => open,
         MagPeak1       => open,
         PhsPeak1       => open,
         PilotFound     => open,
         ValidOut       => open,
         StartOut       => open
      );
/*
   VarsComp0(0) <= RealComp;
   VarsComp1(0) <= ImagComp;

   CompareReal : CompareGoldRef
   GENERIC MAP (
      FILE_NAME         => "test_data/resampled_r.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      IN_WIDTH          => 18,
      IN_BINPT          => 17,
      DELAY             => DELAY
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => DataValid_o,
      IgnoreCount       => x"02",
      InputData         => VarsComp0,
      ErrorOut          => Errors(0),
      Done              => Done(0)
   );

   CompareImag : CompareGoldRef
   GENERIC MAP (
      FILE_NAME         => "test_data/resampled_i.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      IN_WIDTH          => 18,
      IN_BINPT          => 17,
      DELAY             => DELAY
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => DataValid_o,
      IgnoreCount       => x"02",
      InputData         => VarsComp1,
      ErrorOut          => Errors(1),
      Done              => Done(1)
   );
*/
end rtl;
-------------
-- CVS Info:
-------------
-- $Source: $
-- $Revision: $
-- $Date: $
-- $Author: $
-- $Log: $
