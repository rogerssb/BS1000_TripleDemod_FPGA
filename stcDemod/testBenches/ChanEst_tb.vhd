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
-- Module Name: ChanEst_tb.vhd
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

entity ChanEst_tb is
end ChanEst_tb;

architecture rtl of ChanEst_tb is

  -- Define Components

   COMPONENT ChannelEstimate is
      port (
      clk,
      ce,
      reset,
      StartIn        : IN  std_logic;
      TauEst0Index,
      TauEst1Index   : IN  integer range 0 to SEARCH_LENGTH;
      Xr,
      Xi             : IN  FLOAT_1_18;
      H0EstR,
      H0EstI,
      H1EstR,
      H1EstI         : OUT STC_Parm;
      RdAddr         : OUT natural range 0 to TIME_DEPTH-1;
      Done           : OUT Std_logic
      );
   end COMPONENT ChannelEstimate;

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
         DATA_WIDTH  : positive  := 32;
         BINPT       : natural   := 20;      -- only needed for ROMs
         ADDR_WIDTH  : positive  := 9;
         FILE_IS_SLV : boolean   := false;    -- nonSLV files are not synthesizable
         LATENCY     : positive  := 1;
         RAM_TYPE    : string    := "block"  -- or "distributed"
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

   signal   reset                : std_logic := '1';
   signal   clk                  : std_logic := '1';
   signal   ce                   : std_logic := '1';

   SIGNAL   StartIn,
            Pass              : std_logic := '0';
   SIGNAL   Xr,
            Xi                : FLOAT_1_18;
   SIGNAL   H0EstR,
            H0EstI,
            H1EstR,
            H1EstI,
            ErrH0EstR,
            ErrH0EstI,
            ErrH1EstR,
            ErrH1EstI         : STC_PARM;
   SIGNAL   Done              : std_logic := '0';
   SIGNAL   VarsReadR,
            VarsReadI         : FLOAT_SLV_LP;
  signal    Count, x, y       : natural := 0;
   SIGNAL   RdAddr            : natural range 0 to TIME_DEPTH-1;

begin

   process begin
      wait for 500 ps;
      if (Done = '1') then
         report "Simulation Done" severity note;
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
         BINPT       => -FLOAT_1_LP'right,
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
         BINPT       => -FLOAT_1_LP'right,
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
   Xr       <= resize(to_sfixed(VarsReadR, FLOAT_ZERO_1_LP), Xr);
   Xi       <= resize(to_sfixed(VarsReadI, FLOAT_ZERO_1_LP), Xi);

   CE_u : ChannelEstimate
   PORT MAP(
      clk            => clk,
      ce             => ce,
      reset          => reset,
      StartIn        => StartIn,
      TauEst0Index   => 32,
      TauEst1Index   => 34,
      Xr             => Xr,
      Xi             => Xi,
      H0EstR         => H0EstR,
      H0EstI         => H0EstI,
      H1EstR         => H1EstR,
      H1EstI         => H1EstI,
      RdAddr         => RdAddr,
      Done           => Done
   );

   -- Pass should go high when tauEst0Index = 32 and TauEst1Index = 34
   ErrH0EstR <= resize(abs(H0EstR + 0.612648), ErrH0EstR);
   ErrH0EstI <= resize(abs(H0EstI + 0.460930), ErrH0EstI);
   ErrH1EstR <= resize(abs(H1EstR + 0.147713), ErrH1EstR);
   ErrH1EstI <= resize(abs(H1EstI + 0.097717), ErrH1EstI);
   Pass     <= '1' when (ErrH0EstR < 0.02)
                    and (ErrH0EstI < 0.02)
                    and (ErrH1EstR < 0.02)
                    and (ErrH1EstI < 0.02)
                  else '0';

end rtl;
