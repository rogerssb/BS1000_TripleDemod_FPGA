-- -------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-- ----------------------------------------------------------------------------
-- (c) Copyright 2014 Semco Inc. All rights reserved.
--
-- This file contains Semco Inc. proprietary information. It is the
-- property of Semco Inc. and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco Inc.,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-- ----------------------------------------------------------------------------
--
-- Company:     Semco Inc.
--
-- Module Name: Read7606.vhd
-- Description:   Read the 64 bit DOutA/B streams from the AD7606.
--    First strobe ConvSt, wait for Busy to go low then set SpiCS_n low and
-- clock the SpiClk 64 times while shifting the two streams into the shift registers.
--
--
-- ----------------------------------------------------------------------------
--                                DETAILS
-- ----------------------------------------------------------------------------
-- The only system level input signals are the clk, reset and CE
-- The 12 bit AGCs are the outputs. All other signals are tied to the AD7606
-- via the LVDS link. Our clk usually runs at 93.3MHz or 4/3 of 70MHz yielding
-- a 205Ksps output rate on the Agcs. The AD7606 had a 22KHz lowpass filter, so
-- the 205K is 10x and more than adequate for the combiner.
-- ----------------------------------------------------------------------------
--                                HISTORY
-- ----------------------------------------------------------------------------
-- 9-6-16 Initial release FZ
-- -------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.math_real.ALL;    -- Just used for defining constants

ENTITY Read7606 IS
   PORT(
      Clk,           -- 93.3MHz yields a 205Ksps rate. 453 clocks
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
END Read7606;


ARCHITECTURE rtl OF Read7606 IS


   type  Mode_t is (BOOT, IDLE, STROBE, BUSY_WAIT, SPI_CLK_LOW, SPI_CLK_HI, READ);
   constant Tclk                 : real := 10.7;   -- incoming Clk period
   constant Tlp_conv             : real := 10.0;   -- all times are in nanoSeconds
   constant Thp_conv             : real := 10.0;
   constant Td_cnv_busy          : real := 22.0;
   constant Treset_full          : real := 3200.0 + 100.0; -- add some slop to the minimum reset pulse
   constant Tdevice_setup_full   : real := 274000.0 + 1000.0; -- add some slop
   constant Td_sck_do            : real := 17.0;

  -- Signals
   SIGNAL   ShiftRegA,
            ShiftRegB         : std_logic_vector(63 downto 0);
   signal   WaitCount         : natural range 0 to 26000;
   signal   BitCount          : natural range 0 to 64;
   SIGNAL   Mode              : Mode_t;
BEGIN


  Spi_process: process (Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            WaitCount   <= integer(Treset_full/Tclk);
            Mode        <= BOOT;
            SpiCS_n     <= '1';
            SpiClk      <= '1';
            StartConv   <= '0';
            SPiReset    <= '1';
         elsif (CE) then
            case (Mode) is
               when BOOT =>
                  if (WaitCount > 0) then
                     WaitCount <= WaitCount - 1;
                  else
                     SpiReset    <= '0';
                     Mode        <= IDLE;
                     WaitCount   <= integer(Tdevice_setup_full/Tclk);
                  end if;
               when IDLE =>
                  if (WaitCount > 0) then  -- just came out of reset
                     WaitCount <= WaitCount - 1;
                  else
                     Mode        <= STROBE;
                     StartConv   <= '1';
                     WaitCount   <= 3;
                  end if;
               when STROBE =>
                  if (WaitCount > 0) then
                     WaitCount <= WaitCount - 1;
                  else
                     StartConv   <= '0';
                     Mode        <= BUSY_WAIT;
                     WaitCount   <= integer(Td_cnv_busy/Tclk);
                  end if;
               when BUSY_WAIT =>
                  if (WaitCount > 0) then
                     WaitCount <= WaitCount - 1;
                  elsif (not Busy) then
                     Mode        <= SPI_CLK_LOW;
                     WaitCount   <= integer(Td_sck_do/Tclk)+1;
                     SpiCS_n     <= '0';
                     BitCount    <= 0;
                  end if;
               when SPI_CLK_LOW =>
                  if (WaitCount > 0) then
                     WaitCount <= WaitCount - 1;
                     SpiClk <= '0'; -- wait 1 clock after CS low
                  else
                     Mode        <= SPI_CLK_HI;
                     WaitCount   <= integer(Td_sck_do/Tclk);
                     SpiClk      <= '1';
                     ShiftRegA <= ShiftRegA(ShiftRegA'left-1 downto 0) & DoutA;
                     ShiftRegB <= ShiftRegB(ShiftRegB'left-1 downto 0) & DoutB;
                  end if;
               when SPI_CLK_HI =>
                  if (WaitCount > 0) then
                     WaitCount <= WaitCount - 1;
                  else
                     if (BitCount < 63) then
                        BitCount    <= BitCount + 1;
                        Mode        <= SPI_CLK_LOW;
                        WaitCount   <= integer(Td_sck_do/Tclk);
                        SpiClk      <= '0';
                     else
                        Mode     <= Read;
                        SpiCS_n  <= '1';
                     end if;
                  end if;
               when READ =>
                  Agc0        <= ShiftRegA(63 downto 48 + 4);
                  Agc1        <= ShiftRegA(47 downto 32 + 4);
                  Agc2        <= ShiftRegA(31 downto 16 + 4);
                  Agc3        <= ShiftRegA(15 downto 00 + 4);
                  Agc4        <= ShiftRegB(63 downto 48 + 4);
                  Agc5        <= ShiftRegB(47 downto 32 + 4);
                  Agc6        <= ShiftRegB(31 downto 16 + 4);
                  Agc7        <= ShiftRegB(15 downto 00 + 4);
                  WaitCount   <= 1;
                  Mode        <= IDLE;
            end case;
         end if;
      end if;
   end process Spi_process;



END rtl;

