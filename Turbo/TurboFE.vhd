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

Module Name: TurboFE.vhd
Description: Top level of Turbo code processing. Runs in three loops.
   First loop captures the raw data and calculates the PCI A/B data and
   defines the eCA/B data based on the Rate.
   The second loop sends the stored data to the SovaMex in A mode. The
   calculated EuOA data is multplied by 3/4 and stored in Ram in interleaved
   mode.
   The third loop calculates EuOB with the SovaMex in B mode and again the
   calculated data is multiplied by 3/4 and stored.
   The B data is then fed back to the A mode

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

ENTITY TurboFE IS
      GENERIC(
         DATA_WIDTH  : positive := 8
      );
      PORT(
         Clk,
         ce,
         SyncIn,
         ValidIn        : IN  std_logic;
         Rate           : IN  integer range 0 to 6;
         DataIn         : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
         PCIA           : OUT SFIX_PCI_ARRAY(0 to 15);
         PCIB           : OUT SFIX_PCI_ARRAY(0 to 3);
         eCA,
         eCB            : OUT UINT4_ARRAY(0 to 31);
         ValidOut       : OUT std_logic
      );
   END TurboFE;


ARCHITECTURE rtl OF TurboFE IS

   Component RandomCcsds IS
      PORT(
         Clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         RandomBit      : OUT std_logic
      );
   END Component RandomCcsds;

   Component DecodeTurboInit IS
      Port (
         Clk,
         reset,
         ce,
         ValidIn     : IN  std_logic;
         DeRand      : IN  SfixPci;
         Rate        : IN  integer range 0 to 6;
         ValidOut    : OUT std_logic;
         PCIA        : OUT SFIX_PCI_ARRAY(0 to 15);
         PCIB        : OUT SFIX_PCI_ARRAY(0 to 3);
         eCA,
         eCB         : OUT UINT4_ARRAY(0 to 31)
      );
   END Component DecodeTurboInit;

   -- Signals
   SIGNAL   r              : sfixed(0 downto 1 - DATA_WIDTH);
   SIGNAL   DeRand         : SfixPci;
   SIGNAL   DeRandValid,
            RandomBit      : std_logic := '0';
signal   InCount,
         DeRandCnt,
         OutCount         : integer := 0;
signal   InShift,
         OutShift          :SLV16;

BEGIN

   r <= to_sfixed(DataIn, r);

   DeRand_process: process (Clk)
   begin
      if (rising_edge(Clk)) then
         if (ce) then
            if (SyncIn) then
               DeRand     <= (others=>'0');
               DeRandValid <= '0';
         InCount <= 0;
            elsif (ValidIn) then
               DeRand <= resize(-r, DeRand) when RandomBit else resize(r, DeRand);
               DeRandValid <= '1';
         InShift <= InShift(14 downto 0) & DataIn(DataIn'left);
         InCount <= InCount + 1;
            else
               DeRandValid <= '0';
            end if;
         end if;

         if (SyncIn) then
            DeRandCnt <= 0;
         elsif (DeRandValid and ce) then
            DeRandCnt <= DeRandCnt + 1;
         end if;

         if (ce) then
            if (SyncIn) then
               OutCount <= 0;
            elsif (ValidOut) then
               OutCount <= OutCount + 1;
               OutShift <= OutShift(OutShift'left-1 downto 0) & PCIA(0)(PCIA(0)'left);
            end if;
         end if;
      end if;
   end process DeRand_process;

   RandomCcsds_u : RandomCcsds
      PORT MAP(
         Clk         => Clk,
         reset       => SyncIn,
         ce          => DeRandValid and ce,
         RandomBit   => RandomBit
   );

   DecodeTurboInit_u : DecodeTurboInit
      Port Map (
         Clk         => Clk,
         reset       => SyncIn,
         ce          => ce,
         ValidIn     => DeRandValid,
         Rate        => Rate,
         DeRand      => DeRand,
         ValidOut    => ValidOut,
         PCIA        => PCIA,
         PCIB        => PCIB,
         eCA         => eCA,
         eCB         => eCB
   );

END rtl;

