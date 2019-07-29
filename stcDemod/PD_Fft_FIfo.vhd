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
   The high rate samples are also captured in a second fifo that reduces the
   rate back to normal for processing by the non-PilotDetect functions, ie the
   estimators.
   If the pilot is mostly split between two output packets, the pilot detection
   tend to have both packets with higher responses with the potential of a double
   start, which is bad. To avoid this, the pilot detection attempts to keep the
   pilot within one packet by sending a PacketOffset signal to this routine
   causing a 256 sample No Write interval which drops the next 256 samples then
   continues as normal. This should recenter the pilot of the next frame. Once
   centered, the pilot should remain stable with the only slippage due to bit rate
   offsets from the transmitter 10MHz reference and should only take place during
   initial acquisition.  TODO, is this true or does it burp when pilot slides to edge?

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
--      PacketOffset   : IN  natural range 0 to WORDS;
      ReIn,
      ImIn           : IN  sfixed(DATA_WIDTH+BINPT-1 downto BINPT);
      ReOut1x,
      ImOut1x        : OUT sfixed(DATA_WIDTH+BINPT-1 downto BINPT);
      Start1x,
      ValidOut1x,
      LastOut1x      : OUT std_logic;
      ReOut2x,
      ImOut2x        : OUT sfixed(DATA_WIDTH+BINPT-1 downto BINPT);
      Start2x,
      ValidOut2x,
      LastOut2x      : OUT std_logic
   );
END PD_Fft_Fifo;


ARCHITECTURE rtl OF PD_Fft_Fifo IS

  -- Signals
   SIGNAL   Pop1x,
            Idle1x,
            RdRstBusy1x,
            WrRstBusy1x,
            OverFlow1x,
            UnderFlow1x,
            ProgFull1x,
 --           PacketNoWrite,
            Pop2x,
            Idle2x,
            RdRstBusy2x,
            WrRstBusy2x,
            OverFlow2x,
            UnderFlow2x,
            ProgFull2x        : std_logic;
   SIGNAL   PopCount1x,
            PopCount2x /*,
            MyPackOffset,
            NoWriteCount*/      : natural range 0 to 2 * WORDS;
   SIGNAL   FifoData1x,
            FifoData2x        : std_logic_vector(35 downto 0);

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
            LastOut2x <= '1' when (PopCount2x = 1) else '0';
            ValidOut2x <= not Idle2x;
         end if;
      end if;
   end process Fifo2x_process;
/*
   NoWriteProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            NoWriteCount  <= 0;
            MyPackOffset  <= 0;
            PacketNoWrite <= '0';
         elsif (ce) then
            -- prevent writing next PacketOffset samples so as to recenter pilot in next frame
           if (PacketOffset /= MyPackOffset) then
               PacketNoWrite <= '1';
               MyPackOffset  <= PacketOffset;
               NoWriteCount  <= 256; --PacketOffset;
            elsif (ValidIn = '1') then
               if (NoWriteCount > 0) then
                  NoWriteCount <= NoWriteCount - 1;
               else
                  PacketNoWrite <= '0';
               end if;
            end if;
         end if;
      end if;
   end process NoWriteProcess;
*/

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
         READ_MODE               => "fwft",           --string; "std" or "fwft";
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
         wr_en                   => ce and ValidIn and not WrRstBusy1x, -- and not PacketNoWrite,
         din                     => to_slv(ImIn) & to_slv(ReIn),
         full                    => open,
         overflow                => OverFlow1x,
         wr_rst_busy             => WrRstBusy1x,
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


   Idle1x <= '1' when (PopCount1x = 0) else '0';

   Fifo1x_process: process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            Pop1x       <= '0';
            PopCount1x  <= 0;
            Start1x     <= '0';
            LastOut1x   <= '0';
            ValidOut1x  <= '0';
         elsif (ce) then
            if (ProgFull1x and Idle1x and not Start1x) then -- check Pop also to avoid double start
               Start1x <= '1';                     -- Start precedes the first sample
            end if;
            if (PopCount1x = 1) then   -- Consider changing to 1, I'm getting an underflow on the last read
               Pop1x <= '0';
            end if;
            if (Start1x) then                      -- just started, turn off Start and turn on Pop
               Pop1x <= '1';
               Start1x <= '0';
               PopCount1x <= WORDS;
            elsif (not Idle1x) then
               PopCount1x <= PopCount1x - 1;
            end if;
            LastOut1x <= '1' when (PopCount1x = 1) else '0';
            ValidOut1x <= not Idle1x;
         end if;
      end if;
   end process Fifo1x_process;

   Clk1xFifo : xpm_fifo_async
      generic map (
         FIFO_MEMORY_TYPE        => "block",           --string; "auto", "block", "distributed", or "ultra" ;
         ECC_MODE                => "no_ecc",         --string; "no_ecc" or "en_ecc";
         FIFO_WRITE_DEPTH        => WORDS*2,          --positive integer
         RELATED_CLOCKS          => 0,                --positive integer; 0 or 1
         WRITE_DATA_WIDTH        => FifoData2x'length, --positive integer
         WR_DATA_COUNT_WIDTH     => 10,               --positive integer
         PROG_FULL_THRESH        => WORDS,            --positive integer
         FULL_RESET_VALUE        => 0,                --positive integer; 0 or 1;
         READ_MODE               => "fwft",           --string; "std" or "fwft";
         FIFO_READ_LATENCY       => 1,                --positive integer;
         READ_DATA_WIDTH         => FifoData1x'length, --positive integer
         RD_DATA_COUNT_WIDTH     => 10,               --positive integer
         PROG_EMPTY_THRESH       => 10,               --positive integer
         DOUT_RESET_VALUE        => 36x"0",           --string
         CDC_SYNC_STAGES         => 3,                --positive integer
         WAKEUP_TIME             => 0                 --positive integer; 0 or 2;
      )
      port map (
         rst                     => reset2x,
         wr_clk                  => clk2x,
         wr_en                   => ce and Pop2x and ReadyIn and not WrRstBusy2x,
         din                     => FifoData2x,
         full                    => open,
         overflow                => OverFlow2x,
         wr_rst_busy             => WrRstBusy2x,
         rd_clk                  => Clk,
         rd_en                   => ce and Pop1x and not RdRstBusy1x, -- RdRstBusy should settle long before the first 512 samples are ready to read
         dout                    => FifoData1x,
         empty                   => open,
         underflow               => UnderFlow1x,
         rd_rst_busy             => RdRstBusy1x,
         prog_full               => ProgFull1x,
         wr_data_count           => open,
         prog_empty              => open,
         rd_data_count           => open,
         sleep                   => '0',
         injectsbiterr           => '0',
         injectdbiterr           => '0',
         sbiterr                 => open,
         dbiterr                 => open
   );

   ReOut1x    <= to_sfixed(FifoData1x(17 downto  0), ReOut1x);
   ImOut1x    <= to_sfixed(FifoData1x(35 downto 18), ImOut1x);

END rtl;

