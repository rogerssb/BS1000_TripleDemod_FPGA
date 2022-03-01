----------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco Inc. All rights reserved.
--
-- This file contains Semco Inc. proprietary information. It is the
-- property of Semco Inc. and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco Inc.,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco Inc.
--
-- Module Name: Read7606_TB.vhd
-- Description: This is the testbench for the Read7606.vhd module. It essentially
-- emulates the AD7606 which acts as a slave device to the read routine.
--    On the rising edge of StartConv, the DoutX registers are loaded with
-- constant values of 11112222... The testbench then sets Busy for 60 clocks,
-- then the MSB of the DoutX's is presented to the Read7606 and waits for
-- SpiClk rising edge before sending the next pair of bits till all are read.
--
-- Successful results are the AGC outputs at 111, 222, ..., 888. Not too
-- exhaustive, but sufficient. PassA and PassB should stay high till NotDone
-- goes low.
--
-- Notice the FirstData status is ignored in both routines.
-- DoutX data is don't care during busy
-- The Agc output are only 12 bits to match the combiner Agc inputs. 16 bits
-- is frivolous.
--
-- I typically do all my test benches in ModelSim since most of my code is in
-- VHDL-2008. I use a lot of fixed point math.
--
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 2-8-22 Initial release FZ
----------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use std.env.stop;

ENTITY Read7606_TB IS
   END Read7606_TB;


ARCHITECTURE rtl OF Read7606_TB IS

   COMPONENT Read7606 IS
      PORT(
         Clk,           -- 93.3MHz
         Reset,
         CE,
         DoutA,
         DoutB,
         Busy           : IN  std_logic;
         SpiClk,
         SpiCS_n,
         StartConv,
         SpiReset       : OUT std_logic;
         Agc0,
         Agc1,
         Agc2,
         Agc3,
         Agc4,
         Agc5,
         Agc6,
         Agc7           : OUT std_logic_vector(11 downto 0)
      );
   END COMPONENT Read7606;

   signal   Clk,
            Reset,
            Busy,
            PassA,
            PassB,
            NotDone,
            SpiClk,
            SpiCS_n,
            SpiClkDly,
            StartDly,
            StartConv,
            SpiReset       : std_logic := '1';
   signal   Agc0,
            Agc1,
            Agc2,
            Agc3,
            Agc4,
            Agc5,
            Agc6,
            Agc7           : std_logic_vector(11 downto 0);
   signal   DoutA,
            DoutB          : std_logic_vector(63 downto 0);
   signal   Timer,
            Index,
            Frame          : natural range 0 to 63;

BEGIN

   process begin
      wait for 5 ns;   -- run at 93MHz rate
         Clk <= not Clk;
   end process;

   SEQUENCER_PROC : process
   begin
      wait until (not PassA or not PassB or not NotDone);
      if (not PassA) then
         report "DoutA Failed";
      elsif (not PassB) then
         report "DoutB Failed";
      elsif (not NotDone) then
         report "Test: OK";
      end if;
      stop;
   end process;


  Emulate7606_process: process (Clk)
   begin
      if (rising_edge(Clk)) then
         Reset       <= '0';
         StartDly    <= StartConv;
         SpiClkDly   <= SpiClk;
         if (SpiReset) then
            DoutA <= 64x"0";
            DoutB <= 64x"0";
            Frame <= 0;
         elsif (StartConv and not StartDly) then
            DoutA <= 64x"1111222233334444";
            DoutB <= 64x"5555666677778888";
            Busy  <= '1';
            Frame <= Frame + 1;
            Timer <= 60;
            if (Frame > 60) then
               NotDone <= '0';
            end if;
         elsif (Busy) then
            if (Timer > 0) then
               Timer <= Timer - 1;
            else
               Busy  <= '0';
               Index <= 63;
            end if;
         elsif (not SpiCS_n and SpiClk and not SpiClkDly) then
            if (Index > 0) then
               Index <= Index - 1;
            end if;
         end if;
         if (Frame < 2) then
            PassA <= '1';
            PassB <= '1';
         else
            if (Agc0 = x"111") and (Agc1 = x"222") and (Agc2 = x"333") and (Agc3 = x"444") then
               PassA <= '1';
            else
               PassA <= '0';
            end if;
            if (Agc4 = x"555") and (Agc5 = x"666") and (Agc6 = x"777") and (Agc7 = x"888") then
               PassB <= '1';
            else
               PassB <= '0';
            end if;
         end if;
      end if;
   end process;


   Read7606_u : Read7606
      PORT MAP(
         Clk            => Clk,
         Reset          => Reset,
         CE             => '1',
         DoutA          => DoutA(Index),
         DoutB          => DoutB(Index),
         Busy           => Busy,
         SpiClk         => SpiClk,
         SpiCS_n        => SpiCS_n,
         StartConv      => StartConv,
         SpiReset       => SpiReset,
         Agc0           => Agc0,
         Agc1           => Agc1,
         Agc2           => Agc2,
         Agc3           => Agc3,
         Agc4           => Agc4,
         Agc5           => Agc5,
         Agc6           => Agc6,
         Agc7           => Agc7
      );

END rtl;

