-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco, Inc. All rights reserved.
--
-- This file contains Semco Inc. proprietary information. It is the
-- property of Semco Inc. and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco Inc.,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco, Inc.
--
-- Module Name: DelayLine.vhd
-- Description: This module provides a variable length delay line using a FIFO
-- function.
--
-- Dependencies: SimpleDualPortRAM
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
-- Data is strictly delayed in time a given number of enabled clocks.
-- Delay is defined by Length input.
-- ce is the clock enable
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 9/12/16 Initial release FZ
-- 4/19/17 Fixed typo in text above.
-- -------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.fixed_pkg.ALL;
USE work.Semco_pkg.ALL;

ENTITY DelayLine IS
   GENERIC (
      LENGTH      : natural := 4096;
      DATA_WIDTH  : natural := 16;
      BINPT       : natural := 15;
      ADDR_WIDTH  : natural := 12;  -- longest delay is 4096
      RAM_TYPE    : string  := "block"  -- or "distributed"
   );
   PORT(
      clk            : IN  std_logic;
      reset          : IN  std_logic;
      ce             : IN  std_logic;
      Input          : IN  sfixed(DATA_WIDTH-BINPT-1 downto -BINPT);
      Output         : OUT sfixed(DATA_WIDTH-BINPT-1 downto -BINPT)
   );
END DelayLine;


ARCHITECTURE rtl OF DelayLine IS

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;
         ADDR_WIDTH  : positive  := 9;
         FILE_IS_SLV : boolean   := true;    -- nonSLV files are not synthesizable
         LATENCY     : positive  := 1;
         RAM_TYPE    : string    := "block"  -- or "distributed"
      );
      PORT(
         clk,
         ce,
         reset,
         WrEn              : IN  std_logic;
         WrAddr,
         RdAddrA,
         RdAddrB           : IN  natural range 0 to 2**ADDR_WIDTH-1;
         WrData            : In  std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
         RdOutA,
         RdOutB            : OUT std_logic_vector(DATA_WIDTH-1 DOWNTO 0)
      );
   END COMPONENT RAM_2Reads_1Write;

   CONSTANT ADDRESS_WIDTH  : natural := myMax(ADDR_WIDTH, 2);
   CONSTANT MAX_ADDR       : natural := 2**ADDR_WIDTH-1;
  -- Signals
   SIGNAL   LengthMet      : std_logic := '0';
   SIGNAL   RdAddr,
            WrAddr         : natural range 0 to MAX_ADDR;
   SIGNAL   FifoOut        : std_logic_vector(DATA_WIDTH-1 downto 0);
   SIGNAL   ShiftReg       : vector_of_slvs(LENGTH-1 downto 0)(DATA_WIDTH-1 downto 0);

BEGIN

   Delay : if (LENGTH > 32) generate
      SimpleDualPortRAM_process: process (clk)
      begin
         if (rising_edge(clk)) then
            if (reset = '1') then               -- BRAMs prefer synchronous reset
               WrAddr      <= 0;
               RdAddr      <= 0;
               LengthMet   <= '0';
            elsif ce = '1' then
               if (WrAddr < MAX_ADDR - 1) then
                  WrAddr <= WrAddr + 1;
               else
                  WrAddr <= 0;
               end if;
               if (WrAddr = LENGTH-2) then
                  LengthMet <= '1';
               end if;
               if (LengthMet = '1') then   -- one clock till data is retrieved
                  if (RdAddr < MAX_ADDR - 1) then
                     RdAddr <= RdAddr + 1;
                  else
                     RdAddr <= 0;
                  end if;
               end if;
            end if;
         end if;
      end process SimpleDualPortRAM_process;

      uMainFifo : RAM_2Reads_1Write
         GENERIC MAP(
            FILENAME       => "",
            DATA_WIDTH     => DATA_WIDTH,
            ADDR_WIDTH     => ADDR_WIDTH,
            RAM_TYPE       => RAM_TYPE,
            LATENCY        => 2
         )
         PORT MAP(
            clk            => clk,
            ce             => ce,
            reset          => reset,
            WrEn           => '1',
            WrAddr         => WrAddr,
            RdAddrA        => RdAddr,
            RdAddrB        => 0,
            WrData         => to_slv(Input),
            RdOutA         => FifoOut,
            RdOutB         => open
         );

      Output <= to_sfixed(FifoOut, Output) when (LengthMet = '1') else (others=>'0');

   else generate
      process (clk)
      begin
         if (rising_edge(clk)) then
            if (ce) then
               ShiftReg <= ShiftReg(LENGTH-2 downto 0) & to_slv(Input);
            end if;
         end if;
      end process;

      Output <= to_sfixed(ShiftReg(LENGTH-1), Output);
   end generate;

END rtl;

