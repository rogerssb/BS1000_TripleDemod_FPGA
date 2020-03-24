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

Module Name: STC_HW_TB.vhd
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
library std;
use std.textio.all;
use work.fixed_pkg.all;
USE IEEE.math_real.all;
use work.Semco_pkg.ALL;

ENTITY STC_HW_TB IS
END STC_HW_TB;


ARCHITECTURE rtl OF STC_HW_TB IS

   COMPONENT Brik1_Hw_tb is
      GENERIC (SIM_MODE : boolean := false);
      PORT (
         Clk93In           : IN  std_logic;
         BitRateIn,
         Power0In,
         Power1In,
         NoiseIn           : IN  sfixed(0 downto -17);
         BitRate_r         : IN  real;
         DeltaIn           : IN  integer;
         DataOut_o,
         ClkOut_o,
         BS_LED,
         DemodLED : OUT std_logic
      );
   end COMPONENT Brik1_Hw_tb;

  -- Signals
  signal Clk,
         RdAddrEq,
         RdAddrDly      : std_logic := '0';
  signal reset          : std_logic := '1';
  signal BitRate,
         Power0In,
         Power1In,
         NoiseIn        : sfixed(0 downto -17);
  signal FrameCnt,
         Delta,
         DeltaTauEn     : integer := 0;
  signal BitRate_r      : real := 9.33;

BEGIN

   process begin
      wait for 5 nS;
      Clk <= not Clk;
   end process;

   reset_process : process begin
      wait for 20 ns;
      reset <= '0';
   end process reset_process;

   PowerProc : process(Clk)
   begin
      if (rising_edge(Clk)) then
         RdAddrEq <= '1' when (<< signal Brik1.RdAddr_i : natural range 0 to FRAME_LENGTH_4 >> = 13100) else '0';
         RdAddrDly <= RdAddrEq;
         if (<< signal Brik1.Reset  : std_logic >>) then
            Power0In                                        <= to_sfixed(0.120, Power0In);
            Power1In                                        <= to_sfixed(0.120, Power1In);
            NoiseIn                                         <= to_sfixed(0.019, NoiseIn); --0.038, NoiseIn);
            Delta                                           <= 0;
            <<signal Brik1.UUTu.DeltaTauEn : std_logic >>   <= '1';
            <<signal Brik1.TwoClksPerTrellis : std_logic >>     <= '0'; --'1';
            <<signal Brik1.UUTu.MiscBits : SLV18 >>         <= 18x"30008";
            <<signal Brik1.UUTu.TrellisOffsetSlv : SLV4 >>  <= x"0";
         elsif (RdAddrEq and not RdAddrDly) then
           case (FrameCnt) is
            when 0 =>
               Power0In <= to_sfixed(0.0, Power0In);
               Power1In <= to_sfixed(0.120, Power1In);
            when 1 =>
               <<signal Brik1.UUTu.DeltaTauEn : std_logic >> <= '1';
               Power0In <= to_sfixed(0.120, Power0In);
               Power1In <= to_sfixed(0.0, Power1In);
            when 2 =>
               Power0In <= to_sfixed(0.120, Power0In);
               Power1In <= to_sfixed(0.120, Power1In);
            when 3 =>
               Delta <= -2;
            when 5 =>
--            <<signal Brik1.TwoClksPerTrellis : std_logic >>     <= '0';
            BitRate_r <= 9.33;
            when 7 =>
               Delta <= +2;
            when others =>
            end case;
            if (FrameCnt < 10) then
               FrameCnt <= FrameCnt + 1;
            else
               FrameCnt <= 0;
 --           <<signal Brik1.TwoClksPerTrellis : std_logic >>     <= '1';
            end if;
         end if;
      end if;
   end process;

   BitRate <= to_sfixed(BitRate_r*4.0*1.04/93.3, BitRate);    -- 41.6 is 10Mb times 4 plus 4% overhead for pilot

   Brik1 : Brik1_Hw_tb
   GENERIC MAP(
      SIM_MODE => true
   )
   PORT MAP(
      Clk93In   => Clk,
      Power0In  => Power0In,
      Power1In  => Power1In,
      NoiseIn   => NoiseIn,
      BitRateIn => BitRate,
      BitRate_r => BitRate_r,
      DeltaIn   => Delta,
      BS_LED    => open,
      DemodLED  => open
   );

END rtl;
