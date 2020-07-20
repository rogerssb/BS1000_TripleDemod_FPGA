-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco All rights reserved.
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
-- Module Name: TimeEst_tb.vhd
-- Description:
--
-- Dependencies: Top level module
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 4/17/15 Initial release FZ
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
library std;
use std.textio.all;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity TimeEst_tb is
end TimeEst_tb;

architecture rtl of TimeEst_tb is

   -- Define Components

   COMPONENT TimingEstimate IS
      PORT(
         clk,
         ce,
         reset,
         StartIn        : IN  std_logic;
         Xr,
         Xi             : IN  FLOAT_1_LP;
         Tau0Est,
         Tau1Est        : OUT STC_Parm;
         Tau0Ndx,
         Tau1Ndx        : OUT natural range 0 to SEARCH_LENGTH;
         RdAddr         : OUT natural range 0 to TIME_DEPTH-1;
         Done           : OUT std_logic
      );
   END COMPONENT TimingEstimate;

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

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------
   type  INT_ARRAY_1X2 is array (1 downto 0) of integer;

   signal   reset                : std_logic := '1';
   signal   clk                  : std_logic := '1';
   signal   ce                   : std_logic := '1';

   SIGNAL   StartIn           : std_logic := '0';
   SIGNAL   Pass              : std_logic;
   SIGNAL   Xr,
            Xi                : FLOAT_1_LP;
   SIGNAL   Tau0Est,
            Tau1Est           : STC_Parm;
   SIGNAL   Tau0Ndx,
            Tau1Ndx           : integer range 0 to SEARCH_LENGTH;
   SIGNAL   Dones             : UINT8 := (others=>'1');
   SIGNAL   VarsReadR,
            VarsReadI         : FLOAT_SLV_LP;
  signal    Count,
            ErrorCount        : natural := 0;
   SIGNAL   RdAddr            : natural range 0 to TIME_DEPTH-1;


begin

   process begin
      wait for 500 ps;
      if (Dones = 255) then
         if (Pass = '0') then
            report "Simulation Failed" severity failure;
         else
            report "Simulation Passed" severity failure;
         end if;
         wait;
      else
         clk <= not clk;
      end if;
   end process;

   reset_process : process begin
      wait for 2 ns;
      reset <= '0';
   end process reset_process;

   reg_process : process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            Count <= 0;
         else
            if (Count < 36000) then
               Count <= Count + 1;
            else
               Count <= 0;
            end if;
         end if;
      end if;
   end process reg_process;

   RepeatR_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\simData\TimeEstGoldXr.txt",
         DATA_WIDTH  => FLOAT_1_LP'length,
         BINPT       => FLOAT_1_LP'right,
         ADDR_WIDTH  => 8,
         FILE_IS_SLV => false,
         LATENCY     => 1
     )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => RdAddr,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => VarsReadR,
         RdOutB      => open
      );

   RepeatI_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\simData\TimeEstGoldXi.txt",
         DATA_WIDTH  => FLOAT_1_LP'length,
         BINPT       => FLOAT_1_LP'right,
         ADDR_WIDTH  => 8,
         FILE_IS_SLV => false,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => RdAddr,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => VarsReadI,
         RdOutB      => open
      );

   StartIn  <=  '1' when (Count = 0) else '0';
   Xr       <= to_sfixed(VarsReadR, Xr);
   Xi       <= to_sfixed(VarsReadI, Xi);

   TE_u : TimingEstimate
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartIn,
         Xr          => Xr,
         Xi          => Xi,
         Tau0Est     => Tau0Est,
         Tau1Est     => Tau1Est,
         Tau0Ndx     => Tau0Ndx,
         Tau1Ndx     => Tau1Ndx,
         RdAddr      => RdAddr,
         Done        => Dones(4)
   );

   Pass <= '1' when (Tau0Ndx = 32) and (Tau1Ndx = 34) else '0';
   -- Tau0Ndx=32, Tau1Ndx=34, ResultCMreg=2.84109, Tau0Est=0, Tau1Est=-0.0625
end rtl;
