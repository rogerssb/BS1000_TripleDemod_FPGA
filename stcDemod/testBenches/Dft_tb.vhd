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
use work.fixed_pkg.all;

entity Dft_tb is
end Dft_tb;

architecture rtl of Dft_tb is

  -- Define Components

   COMPONENT DFT IS
         GENERIC(
            N           : integer := 4096;
            NDX         : integer := 32   -- Only calculate non-zero samples
         );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         X_r,
         X_i            : IN  FLOAT_16_LP;
         IndexIn        : IN  FLOAT_4K;
         StartIn        : IN  std_logic;
         Magnitude      : OUT FLOAT_1B;
         Done           : OUT std_logic
      );
   END COMPONENT DFT;

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

   constant DELAY                : positive  := 4;
   constant FFT_INPUT_LENGTH     : positive := 832;

   signal   reset                : std_logic := '1';
   signal   clk                  : std_logic := '1';
   signal   ce                   : std_logic := '1';

   SIGNAL   Start,
   Done,
            FreqDone,
            DataValid,
            DataValid_o       : std_logic := '0';
  SIGNAL    X_r,
            X_i,
            IndexIn,
            IndexOut          : float_4K;
   SIGNAL   Magnitude         : FLOAT_4K;
   SIGNAL   Count             : UINT16 := (others=>'0');
   SIGNAL   Errors            : vector_of_slvs(0 to 1)(31 downto 0);
   SIGNAL   ErrorCount        : UINT16 := (others=>'0');
   SIGNAL   ReadReal,
            ReadImag          : vector_of_slvs(0 to 0)(FLOAT_4K'length-1 downto 0);
   SIGNAL   RealComp,
            ImagComp          : std_logic_vector(17 downto 0);

begin

   process begin
      wait for 500 ps;
      clk <= not clk;
   end process;

   reset_process : process begin
      wait for 2 ns;
      reset <= '0';
   end process reset_process;

   process(clk)
   begin
      if (rising_edge(clk)) then
         Count <= Count + 1;
         Start <= '1' when Count = 10 else '0';
      end if;
   end process;

   ReadR_Data : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "test_data/Brik2_fft_in_0_r.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => FLOAT_4K'length,
      OUT_BINPT         => FLOAT_4K'right
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => '1',
      OutputData        => ReadReal,
      Done              => open
   );

   X_r <= to_sfixed(ReadReal(0), X_r);
   X_i <= to_sfixed(ReadImag(0), X_i);
   IndexIn <= to_sfixed(1992, IndexIn);

   Search_u : DFT
      GENERIC MAP(
         N           => 4096,
         NDX         => 32   -- Only calculate non-zero samples
      )
   PORT MAP(
      clk            => clk,
      reset          => reset,
      ce             => ce,
      X_r            => X_r,
      X_i            => X_i,
      IndexIn        => IndexIn,
      StartIn        => Start,
      Magnitude      => Magnitude,
      Done           => Done
   );

end rtl;
