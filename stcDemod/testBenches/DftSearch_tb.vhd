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

entity DftSearch_tb is
end DftSearch_tb;

architecture rtl of DftSearch_tb is

  -- Define Components

   COMPONENT DFT_Search IS
      GENERIC(
         N           : integer := 4096;
         NDX         : integer := 32
      );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         X_r,
         X_i            : IN FLOAT_16_LP;
         IndexIn        : IN  sfixed(12 downto -19);
         IndexOffset    : IN  FLOAT_64_HP;
         Start,
         NextCycle      : IN  std_logic;
         Magnitude      : OUT FLOAT_1K;
         IndexOut       : OUT sfixed(12 downto -19);
         Done           : OUT std_logic
      );
   END COMPONENT DFT_Search;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------
   type     SearchMode_t   is (FFT_Wait, Center);

   CONSTANT DELTA_F_IND       : FLOAT_64_HP := to_sfixed(FREQ_AMBIGUITY/(FreqSamp/(R*FN)), FLOAT_ZERO_64_HP);

   signal   reset             : std_logic := '1';
   signal   clk               : std_logic := '1';
   signal   ce                : std_logic := '1';

   SIGNAL   StartDFT_A,
            CycleDFT_A,
            DoneDFT_A,
            Pass              : std_logic := '0';
   SIGNAL   PilotCount,
            DFT_Count         : integer := 0;
   SIGNAL   X_r               : float_array_16_LP(0 to 31) := (
                                 to_sfixed(-0.0464757869 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.2127291413  , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.5987715041  , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.3410356043  , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0709213691 , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.5039540201 , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.4717875073 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.1232502975  , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0464686789 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.2127717396  , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.5988223015  , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.3410473063  , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0709407883 , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.5039488189 , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.4717697619 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.1232623755  , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0464533588, FLOAT_ZERO_16_LP),
                                 to_sfixed(0.2127906426 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.5987979223 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.3410031794 , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0709555006, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.5038940883, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.4717007351, FLOAT_ZERO_16_LP),
                                 to_sfixed(0.1232746799 , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0464205266, FLOAT_ZERO_16_LP),
                                 to_sfixed(0.2128111626 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.5987554202 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.3409740177 , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0709713413, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.5039638890, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.4717252893, FLOAT_ZERO_16_LP),
                                 to_sfixed(0.1233382661 , FLOAT_ZERO_16_LP) );
   SIGNAL   X_i               : float_array_16_LP(0 to 31) := (
                                 to_sfixed(0.3020761801 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.4466552275 , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0914478464, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.3384372428, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.2726670378, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0538063223, FLOAT_ZERO_16_LP),
                                 to_sfixed(0.3399361820 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.4804274989 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.3021219527 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.4467133572 , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0914903180, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.3384974940, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.2726475220, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0537727946, FLOAT_ZERO_16_LP),
                                 to_sfixed(0.3399358082 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.4803952693 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.3020917085 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.4466505447 , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0915018960, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.3384832993, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.2726258512, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0537377286, FLOAT_ZERO_16_LP),
                                 to_sfixed(0.3399555019 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.4803299545 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.3020850241 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.4466167756 , FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0915575972, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.3385000652, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.2726540599, FLOAT_ZERO_16_LP),
                                 to_sfixed(-0.0537140561, FLOAT_ZERO_16_LP),
                                 to_sfixed(0.3400225940 , FLOAT_ZERO_16_LP),
                                 to_sfixed(0.4804049583 , FLOAT_ZERO_16_LP) );
   SIGNAL   IndexIn,
            IndexOut          : sfixed(12 downto -19);
   SIGNAL   Magnitude         : FLOAT_1K;
   SIGNAL   SearchMode        : SearchMode_t := FFT_WAIT;
   SIGNAL   Offset            : FLOAT_64_HP;
   SIGNAL   TimeIs            : time;

begin

   process begin
      wait for 500 ps;
      clk <= not clk;
   end process;

   reset_process : process begin
      wait for 2 ns;
      reset <= '0';
   end process reset_process;

   reg_process : process (clk)
   begin
      if (rising_edge(clk)) then
         if (not reset) then
            case SearchMode is
               when FFT_WAIT =>
                  PilotCount     <= 0;
                  StartDFT_A     <= '1';
                  CycleDFT_A     <= '1';
                  SearchMode   <= Center;
                  IndexIn        <= to_sfixed(1410, IndexIn);
               when Center =>
                  if (DoneDFT_A) then
                     PilotCount  <= 0;
                     StartDFT_A  <= '1';
                     IndexIn     <= resize(IndexIn + 0.125, IndexIn);
                     TimeIs <= now;
                  elsif (PilotCount < 48) then
                     StartDFT_A  <= '0';
                     CycleDFT_A  <= '0';
                     PilotCount  <= PilotCount + 1;
                  else
                     PilotCount  <= 0;  -- keep resending search data till it's done
                     CycleDFT_A  <= '1';
                  end if;
            end case;
            if (abs(Magnitude - 220.3) < 1.0) and (abs(IndexOut - 1416.84) < 0.2) then
               Pass <= '1';   -- Execution time ~20000 clocks
            end if;
         end if;
      end if;
   end process reg_process;

   DFT_Count <= PilotCount when (PilotCount < 32) else 0;
   Offset <= resize(DELTA_F_IND / 4, Offset);

   Search_u : DFT_Search
      GENERIC MAP(
         N           => 4096,
         NDX         => 32
      )
   PORT MAP(
      clk            => clk,
      reset          => reset,
      ce             => ce,
      X_r            => X_r(DFT_Count),
      X_i            => X_i(DFT_Count),
      IndexIn        => IndexIn,
      IndexOffset    => Offset,
      Start          => StartDFT_A,
      NextCycle      => CycleDFT_A,
      Magnitude      => Magnitude,
      IndexOut       => IndexOut,
      Done           => DoneDFT_A
   );


end rtl;
