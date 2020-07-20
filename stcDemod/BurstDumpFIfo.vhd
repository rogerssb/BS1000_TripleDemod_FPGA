-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco, Inc. All rights reserved.
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
-- Module Name: BurstDumpFifo.vhd
-- Description: This module provides a bursting FIFO function. WORDS
-- samples are captured when Push is high.
--
-- Dependencies: SimpleDualPortRAM
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
-- When Push is received, the data is added to the FIFO. When WORDS samples are
-- available, Pop is set for WORDS cycles to pull the last WORDS samples. LastOut
-- is set on the last pop. The FIFO can continue to be pushed, because the pop is
-- at a higher duty cycle and will thus never overflow.
--
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 10/13/16 Initial release FZ
-- -------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.Semco_pkg.ALL;

ENTITY BurstDumpFifo IS
      GENERIC(
         DATA_WIDTH  : positive := 18;
         WORDS       : positive := 512
      );
   PORT(
      clk            : IN  std_logic;
      reset          : IN  std_logic;
      ce             : IN  std_logic;
      ReIn,
      ImIn           : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
      Push           : IN  std_logic;
      ReOut,
      ImOut          : OUT std_logic_vector(DATA_WIDTH-1 downto 0);
      Start,
      ValidOut,
      LastOut        : OUT std_logic
   );
END BurstDumpFifo;


ARCHITECTURE rtl OF BurstDumpFifo IS

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;
         ADDR_WIDTH  : positive  := 9;
         FILE_IS_SLV : boolean   := false;
         LATENCY     : positive  := 1;
         RAM_TYPE    : string    := "block"
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
   SIGNAL   Pop,
            PopReg,
            PushFifo       : std_logic;
   SIGNAL   RdAddr,
            WrAddr         : integer range 0 to WORDS-1;
   SIGNAL   Depth          : integer range -1 to WORDS;
   SIGNAL   PopCount       : integer range 0 to WORDS+2;

BEGIN


   Fifo_process: process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            Pop         <= '0';
            PopReg      <= '0';
            Start       <= '0';
            LastOut     <= '0';
            PopCount    <= 0;
            WrAddr      <= 0;
            RdAddr      <= 0;
            Depth       <= 0;
         elsif ce = '1' then
            if ((Pop = '1') and (Push = '0') and (Depth > 0)) then
               Depth <= Depth - 1;
            elsif (Push and not Pop) then
               Depth <= Depth + 1;
            end if;

            if (Push = '1') and (Depth < WORDS-1) then
               if (WrAddr < WORDS-1) then
                  WrAddr <= WrAddr + 1;
               else
                  WrAddr <= 0;
               end if;
            end if;

            if (Pop = '1') then
               if (RdAddr < WORDS-1) then
                  RdAddr <= RdAddr + 1;
               end if;
            end if;
            PopReg <= Pop;

            if ((Depth >= WORDS) or ((Depth >= WORDS-1) and (Push = '1'))) and (Pop = '0') then    -- check Pop also to avoid double start
               PopCount <= WORDS;
               Pop <= '1';
               RdAddr <= RdAddr + 1;
               Start <= '1';           -- Start precedes the first sample
            elsif (Pop) then
               PopCount <= PopCount - 1;
               Start <= '0';
               if (PopCount = 1) then
                  Pop <= '0';
               end if;
            end if;
            LastOut <= '1' when (PopCount = 1) else '0';
         end if;
      end if;
   end process Fifo_process;

   PushFifo <= '1' when (Push = '1') and (Depth < WORDS) else '0';

   ReFifo_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => DATA_WIDTH,
         ADDR_WIDTH  => log2(WORDS)+1,
         LATENCY     => 2,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => PushFifo,
         WrAddr      => WrAddr,
         RdAddrA     => RdAddr,
         RdAddrB     => 0,
         WrData      => ReIn,
         RdOutA      => ReOut,
         RdOutB      => open
      );

   ImFifo_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "",
         DATA_WIDTH  => DATA_WIDTH,
         ADDR_WIDTH  => log2(WORDS)+1,
         LATENCY     => 2
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => PushFifo,
         WrAddr      => WrAddr,
         RdAddrA     => RdAddr,
         RdAddrB     => 0,
         WrData      => ImIn,
         RdOutA      => ImOut,
         RdOutB      => open
      );

   ValidOut <= PopReg;

END rtl;

