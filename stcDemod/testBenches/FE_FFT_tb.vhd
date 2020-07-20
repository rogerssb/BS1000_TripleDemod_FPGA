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
-- Module Name: FE_FFT_tb.vhd
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
-- 9/17/16 Initial release FZ
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.Semco_pkg.all;
use work.fixed_generic_pkg_mod.all;

entity FE_FFT_tb is
end FE_FFT_tb;

architecture rtl of FE_FFT_tb is

  -- Define Components

   COMPONENT DFT_Search IS
      GENERIC(
         LENGTH      : integer := FFT_INPUT_LENGTH;
         N           : integer := 4096
      );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         X_r,
         X_i,
         IndexIn        : IN  FLOAT_4K;
         StartBinSrch,
         StartZeroSrch  : IN  std_logic;
         Magnitude      : OUT FLOAT_1B;
         IndexOut       : OUT FLOAT_4K;
         Done           : OUT std_logic
      );
   END COMPONENT DFT_Search;

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
   constant FFT_INPUT_LENGTH     : positive := 832;

   signal   reset                : std_logic := '1';
   signal   clk                  : std_logic := '1';
   signal   ce                   : std_logic := '1';

   SIGNAL   StartIn,
            FreqDone,
            DataValid,
            DataValid_o       : std_logic := '0';
  SIGNAL    r_r,
            r_i              : float;
   SIGNAL   ReOut,
            ImOut             : UINT32slv;
   SIGNAL   Done              : UINT8 := (others=>'0');
   SIGNAL   Errors            : vector_of_slvs(0 to 1)(31 downto 0);
   SIGNAL   ErrorCount        : UINT16 := (others=>'0');
   SIGNAL   VarsComp0,
            VarsComp1,
            VarsRead          : vector_of_slvs(0 to 0)(17 downto 0);
   SIGNAL   RealComp,
            ImagComp          : std_logic_vector(17 downto 0);
   signal   tempCount         : float := (others=>'0');

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

   reset_process : process begin
      wait for 2 ns;
      reset <= '0';
   end process reset_process;

   reg_process : process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            tempCount <= to_sfixed(-1/4096, FLOAT_ZERO);
         else
            tempCount <= resize(tempCount + 1/4096, tempCount);
         end if;
         if ( unsigned(Errors(0)) > 0 or unsigned(Errors(1)) > 0 ) then
            ErrorCount <= ErrorCount + 1/256;
         end if;
      end if;
   end process reg_process;

   StartIn     <= not bitwise_or(to_slv(tempCount));

   Search_u : DFT_Search
      GENERIC(
         LENGTH      => FFT_INPUT_LENGTH,
         N           => 4096
      );
   PORT(
      clk            => clk,              -- : IN  std_logic;
      reset          => reset,            -- : IN  std_logic;
      ce             => ce,               -- : IN  std_logic;
      X_r            => X_r,              -- : IN  FLOAT_4K;
      X_i            => X_i,              -- : IN  FLOAT_4K;
      IndexIn        => IndexIn,          -- : IN  FLOAT_4K;
      StartBinSrch   => StartBinSrch,     -- : IN  std_logic;
      StartZeroSrch  => StartZeroSrch,    -- : IN  std_logic;
      Magnitude      => Magnitude,        -- : OUT FLOAT_1B;
      IndexOut       => IndexOut,         -- : OUT FLOAT_4K;
      Done           => Done              -- : OUT std_logic
   );

end rtl;
