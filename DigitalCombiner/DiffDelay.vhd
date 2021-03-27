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
         DATA_WIDTH  : positive := 18;
         LENGTH_BITS : positive := 10
      );
   PORT(
      clk,
      reset,
      AbeforeB       : IN  std_logic;
      DataInA,
      DataInB        : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
      Diff           : IN  unsigned(LENGTH_BITS-1 downto 0);
      DataOutA,
      DataOutB       : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
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
   SIGNAL   DataIn,
            RdOut                : std_logic_vector(DATA_WIDTH-1 downto 0);
   SIGNAL   Cntr,
            CntrMinusOffset      : unsigned(LENGTH_BITS-1 downto 0) := (others=>'0');
   SIGNAL   DataInDly            : vector_of_slvs(2 downto 0)(DATA_WIDTH-1 downto 0);

BEGIN


   Delay_process: process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            Cntr            <= (others=>'0');
            CntrMinusOffset <= resize(Cntr - Diff - 1, Cntr);
         else
            Cntr            <= resize(Cntr + 1, Cntr);
            CntrMinusOffset <= resize(Cntr - Diff - 1, Cntr);  -- in case Diff is 0, need previous value
            if (AbeforeB) then
               DataOutA    <= RdOut;
               DataOutB    <= DataInDly(2);
               DataInDly   <= DataInDly(1 downto 0) & DataInB;
            else
               DataOutA    <= DataInDly(2);
               DataInDly   <= DataInDly(1 downto 0) & DataInA;
               DataOutB    <= RdOut;
            end if;
         end if;
      end if;
   end process Delay_process;

   DataIn   <= DataInA when (AbeforeB) else DataInB;

   FifoRam : RAM_2Reads_1Write
      GENERIC MAP(
         DATA_WIDTH  => DATA_WIDTH,
         ADDR_WIDTH  => LENGTH_BITS,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => '1',
         reset       => reset,
         WrEn        => '1',
         WrAddr      => to_integer(Cntr),
         RdAddrA     => to_integer(CntrMinusOffset),
         RdAddrB     => 0,
         WrData      => DataIn,
         RdOutA      => RdOut,
         RdOutB      => open
      );


END rtl;

