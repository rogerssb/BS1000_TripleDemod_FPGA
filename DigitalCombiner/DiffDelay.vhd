/*-------------------------------------------------------------------------------
                  PROPRIETARY NOTICE
----------------------------------------------------------------------------
(c) Copyright 2014 Semco Inc. All rights reserved.

This file contains Semco Inc. proprietary information. It is the
property of Semco Inc. and shall not be used, disclosed to others or
reproduced without the express written consent of Semco Inc.,
including, but without limitation, it is not to be used in the creation,
manufacture, development, or derivation of any designs, or configuration.

----------------------------------------------------------------------------

Company:     Semco Inc.

Module Name: DiffDelay.vhd
Description:

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
9-6-16 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Semco_pkg.ALL;

ENTITY DiffDelay IS
      GENERIC(
         DATA_WIDTH  : positive := 18
      );
   PORT(
      clk,
      reset,
      AbeforeB       : IN  std_logic;
      DataInA1,
      DataInA2,
      DataInB1,
      DataInB2        : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
      Diff           : IN  uint8;
      DataOutA1,
      DataOutA2,
      DataOutB1,
      DataOutB2       : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
   );
END DiffDelay;


ARCHITECTURE rtl OF DiffDelay IS

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";
         DATA_WIDTH  : positive  := 32;
         ADDR_WIDTH  : positive  := 9;
         LATENCY     : positive  := 1
      );
      PORT(
         clk,
         ce,
         reset,
         WrEn           : IN  std_logic;
         WrAddr,
         RdAddrA,
         RdAddrB        : IN  natural range 0 to 2**ADDR_WIDTH-1;
         WrData         : In  std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
         RdOutA,
         RdOutB         : OUT std_logic_vector(DATA_WIDTH-1 DOWNTO 0)
      );
   END COMPONENT RAM_2Reads_1Write;


  -- Signals
   SIGNAL   DataInA,
            DataInB,
            RdOutA,
            RdOutB         : std_logic_vector(DATA_WIDTH*2-1 downto 0);
   SIGNAL   Cntr,
            CntrA,
            CntrB          : unsigned(6 downto 0) := (others=>'0');

BEGIN


   Delay_process: process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            Cntr        <= (others=>'0');
            CntrA       <= (others=>'0');
            CntrB       <= (others=>'0');
            DataOutA1   <= (others=>'0');
            DataOutA2   <= (others=>'0');
            DataOutB1   <= (others=>'0');
            DataOutB2   <= (others=>'0');
         else
            Cntr            <= resize(Cntr + 1, Cntr);
            if (AbeforeB) then
               CntrA <= resize(Cntr - Diff - 1, Cntr);   -- in case Diff is 0, need same cntr
               CntrB <= Cntr - 1;                        -- allow two clocks for data to settle
            else
               CntrB <= resize(Cntr - Diff - 1, Cntr);
               CntrA <= Cntr - 1;
            end if;

            DataOutA1   <= RdOutA(DATA_WIDTH*2-1 downto DATA_WIDTH);
            DataOutA2   <= RdOutA(DATA_WIDTH-1 downto 0);
            DataOutB1   <= RdOutB(DATA_WIDTH*2-1 downto DATA_WIDTH);
            DataOutB2   <= RdOutB(DATA_WIDTH-1 downto 0);
         end if;
      end if;
   end process Delay_process;

   DataInA  <= DataInA1 & DataInA2;
   DataInB  <= DataInB1 & DataInB2;

   FifoRamA : RAM_2Reads_1Write
      GENERIC MAP(
         DATA_WIDTH  => DATA_WIDTH*2,
         ADDR_WIDTH  => 7,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => '1',
         reset       => reset,
         WrEn        => '1',
         WrAddr      => to_integer(Cntr),
         RdAddrA     => to_integer(CntrA),
         RdAddrB     => 0,
         WrData      => DataInA,
         RdOutA      => RdOutA,
         RdOutB      => open
      );

   FifoRamB : RAM_2Reads_1Write
      GENERIC MAP(
         DATA_WIDTH  => DATA_WIDTH*2,
         ADDR_WIDTH  => 7,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => '1',
         reset       => reset,
         WrEn        => '1',
         WrAddr      => to_integer(Cntr),
         RdAddrA     => to_integer(CntrB),
         RdAddrB     => 0,
         WrData      => DataInB,
         RdOutA      => RdOutB,
         RdOutB      => open
      );

END rtl;

