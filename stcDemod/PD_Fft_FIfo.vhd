/*-----------------------------------------------------------------------------
                     PROPRIETARY NOTICE
  -----------------------------------------------------------------------------
   (c) Copyright 2014 Semco, Inc. All rights reserved.

   This file contains Semco proprietary information. It is the
   property of Semco and shall not be used, disclosed to others or
   reproduced without the express written consent of Semco,
   including, but without limitation, it is not to be used in the creation,
   manufacture, development, or derivation of any designs, or configuration.

  -----------------------------------------------------------------------------

   Company:     Semco

   Module Name: PD_Fft_Fifo.vhd
   Description: This module provides a bursting FIFO function.
      Samples are captured when ValidIn is high at the lower clock rate.
   When Depth exceeds WORDS, the read pulls WORDS of samples out at the higher
   clk rate then sends WORDS of zero for the FFT, then goes back to sleep.
   The FFT Input Ready signal is fed back to prevent sending unwanted samples.

   Dependencies:

  -----------------------------------------------------------------------------
                                  DETAILS
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
                                  HISTORY
  -----------------------------------------------------------------------------
   10/13/16 Initial release FZ
  ---------------------------------------------------------------------------*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
Library xpm;
use xpm.vcomponents.all;
use work.fixed_pkg.ALL;
use work.Semco_pkg.ALL;

ENTITY PD_Fft_Fifo IS
      GENERIC(
         DATA_WIDTH  : positive := 18;
         BINPT       : integer  := -17;
         WORDS       : positive := 512
      );
   PORT(
      clk,
      clk2x,
      reset,
      reset2x,
      ce,
      ReadyIn,
      ValidIn        : IN  std_logic;
      ReIn,
      ImIn           : IN  sfixed(DATA_WIDTH+BINPT-1 downto BINPT);
      ReOut2x,
      ImOut2x        : OUT sfixed(DATA_WIDTH+BINPT-1 downto BINPT);
      Start2x,
      ValidOut2x,
      ValidData2x,
      LastOut2x      : OUT std_logic
   );
END PD_Fft_Fifo;


ARCHITECTURE rtl OF PD_Fft_Fifo IS

  -- Signals
   SIGNAL   Pop2x,
            Idle2x,
            RdRstBusy2x,
            WrRstBusy2x,
            OverFlow2x,
            UnderFlow2x,
            ProgFull2x        : std_logic;
   SIGNAL   PopCount2x        : natural range 0 to 2 * WORDS;
   SIGNAL   FifoData2x        : std_logic_vector(35 downto 0);

   signal   WrCount  : ufixed(17 downto 0);

BEGIN

   Idle2x <= '1' when (PopCount2x = 0) else '0';

   Fifo2x_process: process (clk2x)
   begin
      if (rising_edge(clk2x)) then
         if (reset2x = '1') then
            PopCount2x    <= 0;
            Pop2x         <= '0';
            Start2x       <= '0';
            LastOut2x     <= '0';
            ValidOut2x    <= '0';
         elsif (ce) then
            if (ProgFull2x and Idle2x and not Start2x) then     -- check Start2x also to avoid double start
               Start2x <= '1';                  -- Start precedes the first sample
            end if;
            if (PopCount2x = WORDS+1) then
               Pop2x <= '0';
            end if;

            if (Start2x) then
               Pop2x <= '1';
               Start2x <= '0';
               PopCount2x <= 2 * WORDS;      -- need twice the count to send zeroes for second half
            elsif (not Idle2x and ReadyIn) then
               PopCount2x <= PopCount2x - 1;
            end if;

            if (PopCount2x >= WORDS + 1) then
               ValidData2x <= ReadyIn;
            else
               ValidData2x <= '0';
            end if;

            LastOut2x <= '1' when (PopCount2x = 1) else '0';
            ValidOut2x <= not Idle2x;
         end if;
      end if;
   end process Fifo2x_process;

   Clk2xFifo : xpm_fifo_async
      generic map (
         FIFO_MEMORY_TYPE        => "block",          --string; "auto", "block", "distributed", or "ultra" ;
         ECC_MODE                => "no_ecc",         --string; "no_ecc" or "en_ecc";
         FIFO_WRITE_DEPTH        => WORDS*2,          --positive integer
         RELATED_CLOCKS          => 0,                --positive integer; 0 or 1
         WRITE_DATA_WIDTH        => 2*ReIn'length,    --positive integer
         WR_DATA_COUNT_WIDTH     => 10,               --positive integer
         PROG_FULL_THRESH        => WORDS-1,          --positive integer
         FULL_RESET_VALUE        => 0,                --positive integer; 0 or 1;
         READ_MODE               => "std",            --string; "std" or "fwft";
         FIFO_READ_LATENCY       => 1,                --positive integer;
         READ_DATA_WIDTH         => FifoData2x'length,  --positive integer
         RD_DATA_COUNT_WIDTH     => 10,               --positive integer
         PROG_EMPTY_THRESH       => 10,               --positive integer
         DOUT_RESET_VALUE        => 36x"0",           --string
         CDC_SYNC_STAGES         => 3,                --positive integer
         WAKEUP_TIME             => 0                 --positive integer; 0 or 2;
      )
      port map (
         rst                     => reset,
         wr_clk                  => clk,
         wr_en                   => ce and ValidIn and not WrRstBusy2x, -- and not PacketNoWrite,
         din                     => to_slv(ImIn) & to_slv(ReIn),
         full                    => open,
         overflow                => OverFlow2x,
         wr_rst_busy             => WrRstBusy2x,
         rd_clk                  => Clk2x,
         rd_en                   => ce and Pop2x and ReadyIn and not RdRstBusy2x, -- RdRstBusy should settle long before the first 512 samples are ready to read
         dout                    => FifoData2x,
         empty                   => open,
         underflow               => UnderFlow2x,
         rd_rst_busy             => RdRstBusy2x,
         prog_full               => ProgFull2x,
         wr_data_count           => open,
         prog_empty              => open,
         rd_data_count           => open,
         sleep                   => '0',
         injectsbiterr           => '0',
         injectdbiterr           => '0',
         sbiterr                 => open,
         dbiterr                 => open
   );

   -- send WORDS samples, then WORDS zeros
   ReOut2x    <= to_sfixed(FifoData2x(17 downto  0), ReOut2x) when (PopCount2x >= 512) else (others=>'0');
   ImOut2x    <= to_sfixed(FifoData2x(35 downto 18), ImOut2x) when (PopCount2x >= 512) else (others=>'0');



END rtl;

