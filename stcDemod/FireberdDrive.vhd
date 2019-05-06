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

Module Name: FireberdDrive.vhd
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
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;
Library xpm;
use xpm.vcomponents.all;

ENTITY FireberdDrive IS
   PORT(
      clk,
      reset,
      ce,
      Clk10MIn,
      ValidIn        : IN  std_logic;
      RecoveredData  : IN  SLV4;
      DataOut,
      ClkOut,
      OverFlow,
      UnderFlow      : OUT std_logic
   );
END FireberdDrive;


ARCHITECTURE rtl OF FireberdDrive IS

   CONSTANT FULL_THRESH : natural := 16384;
--   CONSTANT FULL_THRESH : natural := 16;  -- set lower level for simulation

   -- Signals
   SIGNAL   Shift,
            FifoData    : SLV4;
   SIGNAL   ChkCount    : natural range 0 to 3;
   SIGNAL   RdEn,
            Active,
            WrRstBusy,
            RdRstBusy,
            ProgFull    : std_logic;

BEGIN

   DataOut  <= Shift(3);
   ClkOut   <= Clk10MIn;

   ShiftProcess : process(Clk10MIn, reset)
   begin
      if (reset) then
         Shift    <= x"0";
         ChkCount <= 0;
         Active   <= '0';
         RdEn     <= '0';
      elsif (rising_edge(Clk10MIn)) then
         if (ce) then
            if (ProgFull) then
               Active <= '1';
            end if;
            if (Active) then
               if (ChkCount = 0) then
                  Shift    <= FifoData;
                  ChkCount <= 3;
                  RdEn     <= '1';
               else
                  ChkCount <= ChkCount - 1;
                  Shift <= Shift(2 downto 0) & '0';
                  RdEn  <= '0';
               end if;
            end if;
         end if;
      end if;
   end process ShiftProcess;

xpm_fifo_async_inst : xpm_fifo_async
  generic map (

    FIFO_MEMORY_TYPE         => "block",          --string; "auto", "block", "distributed", or "ultra" ;
    ECC_MODE                 => "no_ecc",         --string; "no_ecc" or "en_ecc";
    FIFO_WRITE_DEPTH         => 32768,            --positive integer
    RELATED_CLOCKS           => 0,                --positive integer; 0 or 1
    WRITE_DATA_WIDTH         => 4,                --positive integer
    WR_DATA_COUNT_WIDTH      => 15,               --positive integer
    PROG_FULL_THRESH         => FULL_THRESH,      --positive integer
    FULL_RESET_VALUE         => 0,                --positive integer; 0 or 1;
    READ_MODE                => "std",            --string; "std" or "fwft";
    FIFO_READ_LATENCY        => 1,                --positive integer;
    READ_DATA_WIDTH          => 4,                --positive integer
    RD_DATA_COUNT_WIDTH      => 15,               --positive integer
    PROG_EMPTY_THRESH        => 10,               --positive integer
    DOUT_RESET_VALUE         => "0",              --string
    CDC_SYNC_STAGES          => 3,                --positive integer
    WAKEUP_TIME              => 0                 --positive integer; 0 or 2;
  )
  port map (

    rst              => reset,
    wr_clk           => clk,
    wr_en            => ValidIn and not WrRstBusy,
    din              => RecoveredData,
    full             => open,
    overflow         => OverFlow,
    wr_rst_busy      => WrRstBusy,
    rd_clk           => Clk10MIn,
    rd_en            => RdEn and not RdRstBusy,
    dout             => FifoData,
    empty            => open,
    underflow        => UnderFlow,
    rd_rst_busy      => RdRstBusy,
    prog_full        => ProgFull,
    wr_data_count    => open,
    prog_empty       => open,
    rd_data_count    => open,
    sleep            => '0',
    injectsbiterr    => '0',
    injectdbiterr    => '0',
    sbiterr          => open,
    dbiterr          => open
  );

END rtl;

