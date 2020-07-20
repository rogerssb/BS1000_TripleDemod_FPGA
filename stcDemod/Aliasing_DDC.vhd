-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2016 Semco. All rights reserved.
--
-- This file contains Semco. proprietary information. It is the
-- property of Semco. and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco
--
-- Module Name: Aliasing_DDC.vhd
-- Description: This module takes a+bi, squares each term, adds them together to
-- create real x.
--
-- Dependencies: DDC_LPF
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
--
-- ce is the clock enable
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 8/24/16 Initial release FZ
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.all;
use work.Semco_pkg.all;

entity Aliasing_DDC is
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
      ValidIn  : in  std_logic;
      IfIn     : in  std_logic_vector(IN_WIDTH - 1 downto 0);
      Re,
      Im       : out std_logic_vector(OUT_WIDTH - 1 downto 0);
      ValidOut : out std_logic
   );
   end Aliasing_DDC;

architecture rtl of Aliasing_DDC is

   COMPONENT ddc_lpf is
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
      ValidIn  : in  std_logic;
      DataIn   : in  std_logic_vector(IN_WIDTH - 1 downto 0);
      DataOut  : out std_logic_vector(OUT_WIDTH - 1 downto 0)
   );
   end component ddc_lpf;

   constant PASS_THRU_LENGTH  : natural := 14;

   signal   If_fix,
            Delay0,
            DataImag,
            DataReal    : sfixed(IN_WIDTH-IN_BINPT-1 downto -IN_BINPT);
   signal   NegDelay0   : sfixed(IN_WIDTH-IN_BINPT downto -IN_BINPT);
   signal   Delay3,
            Delay4,
            FilterData  : std_logic_vector(OUT_WIDTH-1 downto 0);
   signal   PassThru    : vector_of_slvs(PASS_THRU_LENGTH-1 downto 0)(OUT_WIDTH-1 downto 0);
   signal   Counter     : unsigned(1 downto 0);
   signal   MainValid,
            Delay1      : std_logic;
--   signal   m_axis_data_tdata : std_logic_vector(23 downto 0);

begin

   If_fix <= to_sfixed(IfIn, If_fix);
   MainValid <= not Delay1 and not Counter(0);
   NegDelay0 <= -Delay0;

   Mult_process: process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then               -- BRAMs prefer synchronous reset
            Delay0   <= (others=>'0');
            Delay1   <= '0';
            Delay3   <= (others=>'0');
            Delay4   <= (others=>'0');
            DataReal <= (others=>'0');
            DataImag <= (others=>'0');
            PassThru <= (others=>(others=>'0'));
            Counter  <= to_unsigned(0, 2);   -- adjust start phase to match C reference
         elsif ce = '1' then
            if (Delay1 = '1') then
               Counter <= Counter + 1;
               if (Counter(1) = '0') then
                  DataImag <= Delay0;
               else
                  DataImag <= resize(NegDelay0, DataImag, fixed_saturate, fixed_round);
               end if;
               DataReal <= DataImag;
            end if;
            Delay0 <= If_fix;
            Delay1 <= ValidIn;
            if (MainValid = '1') then
               Delay3 <= PassThru(PASS_THRU_LENGTH - 1);
               Delay4 <= FilterData; --m_axis_data_tdata(OUT_WIDTH-1 downto 0);
               PassThru <= PassThru(PASS_THRU_LENGTH-2 downto 0) & to_slv(DataReal);
            end if;
         end if;
      end if;
   end process Mult_process;

   filter_u : ddc_lpf
      generic map (
         IN_WIDTH  => IN_WIDTH,
         IN_BINPT  => IN_BINPT,
         OUT_WIDTH => OUT_WIDTH,
         OUT_BINPT => OUT_BINPT
      )
      port map(
         clk      => clk,
         ce       => ce,
         reset    => reset,
         ValidIn  => MainValid,
         DataIn   => to_slv(DataImag),
         DataOut  => FilterData
      );

   ValidOut <= MainValid;
   Re <= Delay3;
   Im <= Delay4;

end rtl;
