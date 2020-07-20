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
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use work.Semco_pkg.all;
use work.fixed_generic_pkg_mod.all;

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

COMPONENT PilotDetector is
   generic (
      IN_WIDTH    : natural   := 18;
      IN_BINPT    : natural   := 17;
      OUT_WIDTH   : natural   := 18;
      OUT_BINPT   : natural   := 17
   );
   port (
      clk,
      ce,
      reset,
      ValidIn,
      LastIn      : in  std_logic;
      ReIn,
      ImIn        : in  std_logic_vector(IN_WIDTH - 1 downto 0);
      ReOut,
      ImOut       : out std_logic_vector(OUT_WIDTH - 1 downto 0);
      PilotFound  : out std_logic
   );
   end COMPONENT PilotDetector;

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
   signal   clk                  : std_logic := '1';
   signal   ce                   : std_logic := '1';

   SIGNAL   DataCount         : unsigned(12 downto 0) := 13x"000";
   SIGNAL   DataValid,
            DataValid_o       : std_logic := '0';
   SIGNAL   Done              : UINT8 := (others=>'0');
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
         clk <= not clk;
      end if;
   end process;

   process begin
      wait for 3 ns;
         reset <= '0';
   end process;

   reg_process : process (clk)
   begin
      if (rising_edge(clk)) then
         DataValid <= '1' when (DataCount < 1054) else '0';
         DataCount <= DataCount + 1;
         if ( unsigned(Errors(0)) > 0 or unsigned(Errors(1)) > 0 ) then
            ErrorCount <= ErrorCount + 1;
         end if;
      end if;
   end process reg_process;

   ce <= '1' when (DataValid = '1') and (DataCount < 512) else '0';

   ReadReal : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "test_data/resampled_r.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => 17
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => ce,
      OutputData        => VarsReal,
      Done              => Done(7)
   );

   ReadImag : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "test_data/resampled_i.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => 17
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => ce,
      OutputData        => VarsImag,
      Done              => Done(6)
   );

   ReIn <= VarsReal(0) when (DataCount < 512) else (others=>'0');
   ImIn <= VarsImag(0) when (DataCount < 512) else (others=>'0');

   Pd_u : PilotDetector
      generic map(
         IN_WIDTH       => IN_WIDTH,
         IN_BINPT       => IN_BINPT,
         OUT_WIDTH      => OUT_WIDTH,
         OUT_BINPT      => OUT_BINPT
      )
      port map(
         clk            => clk,
         ce             => '1',
         reset          => reset,
         ValidIn        => DataValid,
         LastIn         => '0',
         ReIn           => ReIn,
         ImIn           => ImIn,
         ReOut          => open,
         ImOut          => open,
         PilotFound     => open
      );

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

end rtl;
-------------
-- CVS Info:
-------------
-- $Source: $
-- $Revision: $
-- $Date: $
-- $Author: $
-- $Log: $
