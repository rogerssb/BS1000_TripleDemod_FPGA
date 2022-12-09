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

   Module Name: PackIFs.vhd
   Description: This module provides a bursting FIFO function.
      Samples are captured continously at the lower clock rate till the FIFO is full.
   The incoming data rate is faster than the FFTs can keep up with, so I ignore
   the first two results while the FFTs settle and use the remaining samples to
   find the peaks of the FFTs. Since I only need peaks of each burst but not relative
   to the other burst, I don't care about breaking up the computations.

      When FIFO Depth exceeds WORDS, the read pulls WORDS of samples out at the higher
   clk rate then sends another WORDS of zeroes for the FFT, then goes back to sleep.
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

ENTITY PackIFs IS
      GENERIC(
         DATA_WIDTH  : positive := 18;
         BINPT       : integer  := -17;
         WORDS       : positive := 256;
         IN_SIM      : boolean  := false
      );
   PORT(
      clk,
      clk4x,
      reset,
      ce,
      ReadyIn        : IN  std_logic;
      ReIn1,
      ImIn1,
      ReIn2,
      ImIn2          : IN  sfixed(DATA_WIDTH+BINPT-1 downto BINPT);
      ReOut4x1,
      ImOut4x1,
      ReOut4x2,
      ImOut4x2       : OUT sfixed(DATA_WIDTH+BINPT-1 downto BINPT);
      Start4x,
      Restart,          -- buffer overrun has been detected, start new frames
      OverFlow4x,
      ValidDataOut4x,    -- Data only for NCOs
      ValidFftOut4x,       -- data and WORDS zeros for fft
      LastOut4x      : OUT std_logic
   );
END PackIFs;


ARCHITECTURE rtl OF PackIFs IS



   type     MODES     is (IDLE, READ, DONE);
   constant DELAY             : natural := 10;


   constant COUNT_WIDTH       : natural := 14;  -- TODO, set to 20 for IN_SIM
   SIGNAL   RdCount           : std_logic_vector(COUNT_WIDTH-1 downto 0);
   constant DEPTH             : natural := 2 ** COUNT_WIDTH;


  -- Signals
   SIGNAL   Pop4x,
            Idle4x,
            WrEn,
            RdRstBusy4x,
            WrRstBusy4x,
            UnderFlow4x,
            ProgFull4x        : std_logic;
   SIGNAL   PopCount4x        : natural range 0 to 2 * WORDS;
   SIGNAL   FifoData4x        : std_logic_vector(71 downto 0);
   SIGNAL   Mode              : MODES := IDLE;

BEGIN

   FifoProcess: process(clk4x)
   begin
      if (rising_edge(clk4x)) then
         if (Reset) then
            Mode           <= IDLE;
            PopCount4x     <= 0;
            Pop4x          <= '0';
            Start4x        <= '0';
            LastOut4x      <= '0';
            ValidFftOut4x  <= '0';
            WrEn           <= '1';
            Restart        <= '0';
         elsif (ce) then
            case (Mode) is
               when IDLE =>
                  if (ProgFull4x and ReadyIn) then
                     Start4x     <= '1';
                     PopCount4x  <= 2 * WORDS;      -- need twice the count to send zeroes for second half
                     Mode        <= READ;
                  end if;
               when READ =>
                  Start4x <= '0';
                  if (PopCount4x > WORDS) then
                     Pop4x          <= '1';
                     ValidFftOut4x  <= '1';
                  end if;

                  if (not Idle4x and ReadyIn) then
                     PopCount4x <= PopCount4x - 1;
                  end if;

                  if (PopCount4x = WORDS) then
                     Pop4x          <= '0';
                  end if;

                  if (PopCount4x = 1) then
                     Mode           <= DONE;
                     PopCount4x     <= DELAY;
                     LastOut4x      <= '1';
                  end if;
               when DONE =>
                  ValidFftOut4x  <= '0';
                  LastOut4x <= '0';
                  PopCount4x <= PopCount4x - 1;
                  if (PopCount4x = DELAY-1) then   -- send start to clear current ready
                     Start4x <= '1';
                  elsif (PopCount4x = DELAY-2) then
                     Start4x <= '0';
                  elsif (PopCount4x = 1) then   -- holdoff on next burst
                     PopCount4x  <= 2 * WORDS;      -- need twice the count to send zeroes for second half
                     Mode        <= READ;
                  end if;
            end case;

            if (OverFlow4x) then    -- the fifo is full but heavily backlogged, let the data drain to feed the FFTs
               WrEn <= '0';     -- then restart the process to avoid noncontiguous data perturbing the results.
            end if;
            if ((WrEn = '0') and (unsigned(RdCount) < 256)) then  -- almost empty, restart process
               Restart <= '1';
            end if;
         end if;
      end if;
   end process FifoProcess;

   ValidDataOut4x <= '1' when (Pop4x and ReadyIn) else '0';

   Idle4x <= '1' when (PopCount4x = 0) else '0';

   clk4xFifo : xpm_fifo_async
      generic map (
         FIFO_MEMORY_TYPE        => "auto",
         ECC_MODE                => "no_ecc",
         FIFO_WRITE_DEPTH        => DEPTH,            -- Note write depth affects the recovery time to drain the fifo and restart
         RELATED_CLOCKS          => 0,
         WRITE_DATA_WIDTH        => 4*ReIn1'length,
         WR_DATA_COUNT_WIDTH     => COUNT_WIDTH,
         PROG_FULL_THRESH        => WORDS-1,
         FULL_RESET_VALUE        => 0,
         READ_MODE               => "std",
         FIFO_READ_LATENCY       => 1,
         READ_DATA_WIDTH         => FifoData4x'length,
         RD_DATA_COUNT_WIDTH     => COUNT_WIDTH,
         PROG_EMPTY_THRESH       => 10,
         DOUT_RESET_VALUE        => 72x"0",
         CDC_SYNC_STAGES         => 3,
         WAKEUP_TIME             => 0
      )
      port map (
         rst                     => reset,
         wr_clk                  => clk,
         wr_en                   => ce and not WrRstBusy4x and WrEn,
         din                     => to_slv(ImIn2) & to_slv(ReIn2) & to_slv(ImIn1) & to_slv(ReIn1),
         full                    => open,
         overflow                => OverFlow4x,
         wr_rst_busy             => WrRstBusy4x,
         rd_clk                  => clk4x,
         rd_en                   => ce and Pop4x and ReadyIn and not RdRstBusy4x, -- RdRstBusy should settle long before the first 512 samples are ready to read
         dout                    => FifoData4x,
         empty                   => open,
         underflow               => UnderFlow4x,
         rd_rst_busy             => RdRstBusy4x,
         prog_full               => ProgFull4x,
         wr_data_count           => open,
         prog_empty              => open,
         rd_data_count           => RdCount,
         sleep                   => '0',
         injectsbiterr           => '0',
         injectdbiterr           => '0',
         sbiterr                 => open,
         dbiterr                 => open
   );

   -- send WORDS samples, then WORDS zeros
   ReOut4x1 <= to_sfixed(FifoData4x(17 downto  0), ReOut4x1) when (PopCount4x >= WORDS) else (others=>'0');
   ImOut4x1 <= to_sfixed(FifoData4x(35 downto 18), ImOut4x1) when (PopCount4x >= WORDS) else (others=>'0');
   ReOut4x2 <= to_sfixed(FifoData4x(53 downto 36), ReOut4x2) when (PopCount4x >= WORDS) else (others=>'0');
   ImOut4x2 <= to_sfixed(FifoData4x(71 downto 54), ImOut4x2) when (PopCount4x >= WORDS) else (others=>'0');



END rtl;

