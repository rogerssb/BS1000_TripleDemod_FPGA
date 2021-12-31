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
-- Module Name: VariableDelayLine.vhd
-- Description: This module provides a variable length delay line using a FIFO
-- function.
--
-- Dependencies: RAM_2Reads_1Write
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
-- Data is delayed in time a variable number of enabled clocks.
-- ce is the clock enable
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 9/12/16 Initial release FZ, variant of DelayLineSlv from STC code
-- -------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Semco_pkg.ALL;

ENTITY VariableDelayLine IS
   GENERIC (
      DATA_WIDTH  : natural := 16;
      ADDR_WIDTH  : natural := 12;  -- longest delay is 4096
      RAM_TYPE    : string  := "block"  -- or "distributed"
   );
   PORT(
      clk,
      reset,
      ce             : IN  std_logic;
      Delay          : IN  UINT16;
      Input          : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
      Output         : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
   );
END VariableDelayLine;


ARCHITECTURE rtl OF VariableDelayLine IS

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
   CONSTANT MAX_ADDR       : natural := 2**ADDRESS_WIDTH-1;
  -- Signals
   SIGNAL   LengthMet      : std_logic := '0';
   SIGNAL   RdAddr,
            WrAddr         : unsigned(ADDRESS_WIDTH-1 downto 0);
   SIGNAL   FifoOut,
            DataInDly      : std_logic_vector(DATA_WIDTH-1 downto 0);
   SIGNAL   ShiftReg       : vector_of_slvs(MAX_ADDR downto 0)(DATA_WIDTH-1 downto 0);

BEGIN

   GenDelay : if (MAX_ADDR > 32) generate
      SimpleDualPortRAM_process: process (clk)
      begin
         if (rising_edge(clk)) then
            if (reset = '1') then               -- BRAMs prefer synchronous reset
               WrAddr      <= (others=>'0');
               RdAddr      <= (others=>'0');
               LengthMet   <= '0';
            elsif (ce = '1') then
               DataInDly   <= Input;
               WrAddr <= WrAddr + 1;
               RdAddr <= resize(WrAddr - Delay + 2, RdAddr);
               if (WrAddr > Delay) then
                  LengthMet   <= '1';
               end if;
            end if;
         end if;
      end process SimpleDualPortRAM_process;

      uMainFifo : RAM_2Reads_1Write
         GENERIC MAP(
            FILENAME       => "",
            DATA_WIDTH     => DATA_WIDTH,
            ADDR_WIDTH     => ADDRESS_WIDTH,
            RAM_TYPE       => RAM_TYPE,
            LATENCY        => 1
         )
         PORT MAP(
            clk            => clk,
            ce             => ce,
            reset          => reset,
            WrEn           => '1',
            WrAddr         => to_integer(WrAddr),
            RdAddrA        => to_integer(RdAddr),
            RdAddrB        => 0,
            WrData         => Input,
            RdOutA         => FifoOut,
            RdOutB         => open
         );

      Output <= Input when (Delay = 0) else DataInDly when (Delay = 1) else FifoOut when (LengthMet = '1') else (others=>'0');


   else generate

      process (clk)
      begin
         if (rising_edge(clk)) then
            if (ce) then
               ShiftReg <= ShiftReg(MAX_ADDR-2 downto 0) & Input;
            end if;
         end if;
      end process;

      Output <= ShiftReg(to_integer(Delay)) when (Delay > 0) else Input;

   end generate;

END rtl;

