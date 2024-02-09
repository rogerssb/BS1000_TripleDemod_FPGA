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

Module Name: ChannelEstimate.vhd
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

ENTITY  ChannelEstimate is
   port (
      clk,
      ce,
      reset,
      StartIn        : IN  std_logic;
      TauEst0Index,
      TauEst1Index   : IN  integer range 0 to 64;
      Xr,
      Xi             : IN  FLOAT_1_18;
      H0EstR,
      H0EstI,
      H1EstR,
      H1EstI         : OUT STC_Parm;
      RdAddr         : OUT natural range 0 to TIME_DEPTH-1;
      Done           : OUT Std_logic
   );
end ChannelEstimate;

ARCHITECTURE rtl OF ChannelEstimate IS

   COMPONENT SinvLuts IS
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         Xa, Xb,
         Ya, Yb         : IN natural range 0 to 64;
         SsInvR0A,      -- ±.005
         SsInvR1A,
         SsInvI0A,
         SsInvI1A,
         SsInvR2A,
         SsInvI2A,
         SsInvR3A,
         SsInvI3A,
         SsInvR0B,
         SsInvR1B,
         SsInvI0B,
         SsInvI1B,
         SsInvR2B,
         SsInvI2B,
         SsInvR3B,
         SsInvI3B       : out sfixed(-7 downto -24)   -- 18 bit version
      );
   END COMPONENT SinvLuts;

   impure function InitSigFromFile (RamFileName : in string) return SIG_Array is
      file     FilePntr	   : text;
      variable ramfileline : line;
      variable FuncRam	   : SIG_ARRAY;
      variable Slv_v       : SLV32;
      variable Good_v      : boolean;
   begin
      file_open(FilePntr, RamFileName, read_mode);
      for i in FuncRam'range loop
         if (not endfile(FilePntr)) then
            readline (FilePntr, ramfileline);
            hread(ramfileline, Slv_v, Good_v);
            FuncRam(i) := to_sfixed(Slv_v(FuncRam(i)'length-1 downto 0), FuncRam(i));
            assert Good_v report "Failed to convert real of: " & ramfileline.all severity FAILURE;
         else
            report "End of file reached" severity FAILURE;
         end if;
       end loop;
       return FuncRam;
   end function;

   CONSTANT DELAY       : positive := 4;
   type     ModeType is (Idle, ExtractTemplate);

  -- Signals
   SIGNAL   Mode        : ModeType;
   SIGNAL   Ss0R,
            Ss0I,
            Ss1R,
            Ss1I,
            Ss0RReg,
            Ss0IReg,
            Ss1RReg,
            Ss1IReg    : FLOAT_1_18;
   SIGNAL   SsInvR0Ss0R,  -- ±.005
            SsInvR0Ss0I,
            SsInvI0Ss0R,
            SsInvI0Ss0I,
            SsInvR1Ss1R,
            SsInvR1Ss1I,
            SsInvI1Ss1R,
            SsInvI1Ss1I,
            SsInvR2Ss0R,
            SsInvR2Ss0I,
            SsInvI2Ss0R,
            SsInvI2Ss0I,
            SsInvR3Ss1R,
            SsInvR3Ss1I,
            SsInvI3Ss1R,
            SsInvI3Ss1I,
            SpinvR0,
            SpinvI0,
            SpinvR1,
            SpinvI1,
            SpinvR0Dly,
            SpinvI0Dly,
            SpinvR1Dly,
            SpinvI1Dly,
            XrSpinvR0,
            XrSpinvI0,
            XiSpinvR0,
            XiSpinvI0,
            XrSpinvR1,
            XrSpinvI1,
            XiSpinvR1,
            XiSpinvI1,
            SsInvR0,
            SsInvR1,
            SsInvI0,
            SsInvI1,
            SsInvR2,
            SsInvI2,
            SsInvR3,
            SsInvI3     : sfixed(-7 downto -24);   -- 18 bit version
   SIGNAL   Ar0,
            Ai0,
            Ar1,
            Ai1         : FLOAT_16_HP;
   SIGNAL   PilotCount  : integer range 0 to PILOT_LENGTH_4 / 2 + DELAY + 2;
   SIGNAL   XrDelay,
            XiDelay     : FLOAT_ARRAY_1_18(DELAY-1 downto 0);
   SIGNAL   Sig0R       : SIG_ARRAY := InitSigFromFile("..\stcDemod\sourceData\s0_lut_r.slv");
   SIGNAL   Sig0I       : SIG_ARRAY := InitSigFromFile("..\stcDemod\sourceData\s0_lut_i.slv");
   SIGNAL   Sig1R       : SIG_ARRAY := InitSigFromFile("..\stcDemod\sourceData\s1_lut_r.slv");
   SIGNAL   Sig1I       : SIG_ARRAY := InitSigFromFile("..\stcDemod\sourceData\s1_lut_i.slv");

BEGIN

   ChannelProcess : process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            PilotCount  <= 0;
            Done        <= '0';
            Ar0         <= (others=>'0');
            Ai0         <= (others=>'0');
            Ar1         <= (others=>'0');
            Ai1         <= (others=>'0');
            Ss0R        <= (others=>'0');
            Ss0I        <= (others=>'0');
            Ss1R        <= (others=>'0');
            Ss1I        <= (others=>'0');
            Ss0RReg     <= (others=>'0');
            Ss0IReg     <= (others=>'0');
            Ss1RReg     <= (others=>'0');
            Ss1IReg     <= (others=>'0');
            SsInvR0Ss0R <= (others=>'0');
            SsInvR0Ss0I <= (others=>'0');
            SsInvI0Ss0R <= (others=>'0');
            SsInvI0Ss0I <= (others=>'0');
            SsInvR1Ss1R <= (others=>'0');
            SsInvR1Ss1I <= (others=>'0');
            SsInvI1Ss1R <= (others=>'0');
            SsInvI1Ss1I <= (others=>'0');
            SsInvR2Ss0R <= (others=>'0');
            SsInvR2Ss0I <= (others=>'0');
            SsInvI2Ss0R <= (others=>'0');
            SsInvI2Ss0I <= (others=>'0');
            SsInvR3Ss1R <= (others=>'0');
            SsInvR3Ss1I <= (others=>'0');
            SsInvI3Ss1R <= (others=>'0');
            SsInvI3Ss1I <= (others=>'0');
            SpinvR0     <= (others=>'0');
            SpinvI0     <= (others=>'0');
            SpinvR1     <= (others=>'0');
            SpinvI1     <= (others=>'0');
            SpinvR0Dly  <= (others=>'0');
            SpinvI0Dly  <= (others=>'0');
            SpinvR1Dly  <= (others=>'0');
            SpinvI1Dly  <= (others=>'0');
            XrSpinvR0   <= (others=>'0');
            XrSpinvI0   <= (others=>'0');
            XiSpinvR0   <= (others=>'0');
            XiSpinvI0   <= (others=>'0');
            XrSpinvR1   <= (others=>'0');
            XrSpinvI1   <= (others=>'0');
            XiSpinvR1   <= (others=>'0');
            XiSpinvI1   <= (others=>'0');
            H0EstR      <= to_sfixed(0.707, H0EstR);
            H0EstI      <= (others=>'0');
            H1EstR      <= to_sfixed(0.707, H0EstR);
            H1EstI      <= (others=>'0');
            XrDelay     <= (others=>(others=>'0'));
            XiDelay     <= (others=>(others=>'0'));
            Mode        <= Idle;
         elsif (ce) then
            XrDelay <= XrDelay(Delay-2 downto 0) & Xr;
            XiDelay <= XiDelay(Delay-2 downto 0) & Xi;
            case (Mode) is
            when Idle=>
               PilotCount  <= 0;
               Done        <= '0';
               Ar0         <= (others=>'0');
               Ai0         <= (others=>'0');
               Ar1         <= (others=>'0');
               Ai1         <= (others=>'0');
               Ss0R        <= (others=>'0');
               Ss0I        <= (others=>'0');
               Ss1R        <= (others=>'0');
               Ss1I        <= (others=>'0');
               Ss0RReg     <= (others=>'0');
               Ss0IReg     <= (others=>'0');
               Ss1RReg     <= (others=>'0');
               Ss1IReg     <= (others=>'0');
               SsInvR0Ss0R <= (others=>'0');
               SsInvR0Ss0I <= (others=>'0');
               SsInvI0Ss0R <= (others=>'0');
               SsInvI0Ss0I <= (others=>'0');
               SsInvR1Ss1R <= (others=>'0');
               SsInvR1Ss1I <= (others=>'0');
               SsInvI1Ss1R <= (others=>'0');
               SsInvI1Ss1I <= (others=>'0');
               SsInvR2Ss0R <= (others=>'0');
               SsInvR2Ss0I <= (others=>'0');
               SsInvI2Ss0R <= (others=>'0');
               SsInvI2Ss0I <= (others=>'0');
               SsInvR3Ss1R <= (others=>'0');
               SsInvR3Ss1I <= (others=>'0');
               SsInvI3Ss1R <= (others=>'0');
               SsInvI3Ss1I <= (others=>'0');
               SpinvR0     <= (others=>'0');
               SpinvI0     <= (others=>'0');
               SpinvR1     <= (others=>'0');
               SpinvI1     <= (others=>'0');
               SpinvR0Dly  <= (others=>'0');
               SpinvI0Dly  <= (others=>'0');
               SpinvR1Dly  <= (others=>'0');
               SpinvI1Dly  <= (others=>'0');
               XrSpinvR0   <= (others=>'0');
               XrSpinvI0   <= (others=>'0');
               XiSpinvR0   <= (others=>'0');
               XiSpinvI0   <= (others=>'0');
               XrSpinvR1   <= (others=>'0');
               XrSpinvI1   <= (others=>'0');
               XiSpinvR1   <= (others=>'0');
               XiSpinvI1   <= (others=>'0');
               XrDelay     <= (others=>(others=>'0'));
               XiDelay     <= (others=>(others=>'0'));
               if (StartIn) then
                  Mode <= ExtractTemplate;
               end if;
            when ExtractTemplate =>
	            -- extract the template (with the desired offset)--together these form S, a PILOT_LENGTH_4x2 matrix
               -- ss0_r[k] = sig_0_r[SEARCH_SKIP*k+tau_est0_ndx];
               -- ss0_i[k] = sig_0_i[SEARCH_SKIP*k+tau_est0_ndx];
               -- ss1_r[k] = sig_1_r[SEARCH_SKIP*k+tau_est1_ndx];
               -- ss1_i[k] = sig_1_i[SEARCH_SKIP*k+tau_est1_ndx];
               if (PilotCount < PILOT_LENGTH_4/2) then
                  Ss0RReg <= resize(Sig0R(SEARCH_SKIP * PilotCount + TauEst0Index), ss0R);   -- the resizes probably are Float1 to Float1, but could change
                  Ss0IReg <= resize(Sig0I(SEARCH_SKIP * PilotCount + TauEst0Index), ss0I);
                  Ss1RReg <= resize(Sig1R(SEARCH_SKIP * PilotCount + TauEst1Index), ss1R);   -- buffer RAM outputs
                  Ss1IReg <= resize(Sig1I(SEARCH_SKIP * PilotCount + TauEst1Index), ss1I);
	            end if;
               Ss0R <= Ss0RReg;
               Ss0I <= Ss0IReg;
               Ss1R <= Ss1RReg;
               Ss1I <= Ss1IReg;
               -- get the inverted matrix inv(S'*S) for s0 and s1 (this was precomputed)
               -- ss_inv_r = SS_inv_LUT_r[tau_est0_ndx][tau_est1_ndx];
               -- ss_inv_i = SS_inv_LUT_i[tau_est0_ndx][tau_est1_ndx];
               -- SsInvR0  <= SinvRamR0;  -- Done in ROM_2D's
               -- SsInvI0  <= SinvRamI0;
               -- SsInvR1  <= SinvRamR1;
               -- SsInvI1  <= SinvRamI1;
               -- SsInvR2  <= SinvRamR2;
               -- SsInvI2  <= SinvRamI2;
               -- SsInvR3  <= SinvRamR3;
               -- SsInvI3  <= SinvRamI3;
               -- for(k=0; k<PILOT_HALF_LENGTH_4; k++){
               -- complex_mult(ss_inv_r[0],ss_inv_i[0],ss0_r[k],-ss0_i[k],&temp0_r,&temp0_i);
               SsInvR0Ss0R <= resize(SsInvR0 * Ss0R, SsInvR0Ss0R);
               SsInvR0Ss0I <= resize(SsInvR0 * Ss0I, SsInvR0Ss0I);
               SsInvI0Ss0R <= resize(SsInvI0 * Ss0R, SsInvI0Ss0R);
               SsInvI0Ss0I <= resize(SsInvI0 * Ss0I, SsInvI0Ss0I);
               -- complex_mult(ss_inv_r[1],ss_inv_i[1],ss1_r[k],-ss1_i[k],&temp1_r,&temp1_i);
               SsInvR1Ss1R <= resize(SsInvR1 * Ss1R, SsInvR1Ss1R);
               SsInvR1Ss1I <= resize(SsInvR1 * Ss1I, SsInvR1Ss1I);
               SsInvI1Ss1R <= resize(SsInvI1 * Ss1R, SsInvI1Ss1R);
               SsInvI1Ss1I <= resize(SsInvI1 * Ss1I, SsInvI1Ss1I);
               -- S_pinv_r[0][k] = temp0_r + temp1_r; S_pinv_i[0][k] = temp0_i + temp1_i;
               SpinvR0 <= resize(SsInvR0Ss0R + SsInvI0Ss0I + SsInvR1Ss1R + SsInvI1Ss1I, SpinvR0);
               SpinvI0 <= resize(SsInvI0Ss0R - SsInvR0Ss0I + SsInvI1Ss1R - SsInvR1Ss1I, SpinvI0);
               SpinvR0Dly <= SpinvR0;  -- gives multipliers register inputs
               SpinvI0Dly <= SpinvI0;

               -- complex_mult(ss_inv_r[2],ss_inv_i[2],ss0_r[k],-ss0_i[k],&temp0_r,&temp0_i);
               SsInvR2Ss0R <= resize(SsInvR2 * Ss0R, SsInvR2Ss0R);
               SsInvR2Ss0I <= resize(SsInvR2 * Ss0I, SsInvR2Ss0I);
               SsInvI2Ss0R <= resize(SsInvI2 * Ss0R, SsInvI2Ss0R);
               SsInvI2Ss0I <= resize(SsInvI2 * Ss0I, SsInvI2Ss0I);
               -- complex_mult(ss_inv_r[3],ss_inv_i[3],ss1_r[k],-ss1_i[k],&temp1_r,&temp1_i);
               SsInvR3Ss1R <= resize(SsInvR3 * Ss1R, SsInvR3Ss1R);
               SsInvR3Ss1I <= resize(SsInvR3 * Ss1I, SsInvR3Ss1I);
               SsInvI3Ss1R <= resize(SsInvI3 * Ss1R, SsInvI3Ss1R);
               SsInvI3Ss1I <= resize(SsInvI3 * Ss1I, SsInvI3Ss1I);
               -- S_pinv_r[1][k] = temp0_r + temp1_r; S_pinv_i[1][k] = temp0_i + temp1_i;
               SpinvR1 <= resize(SsInvR2Ss0R + SsInvI2Ss0I + SsInvR3Ss1R + SsInvI3Ss1I, SpinvR1);
               SpinvI1 <= resize(SsInvI2Ss0R - SsInvR2Ss0I + SsInvI3Ss1R - SsInvR3Ss1I, SpinvI1);
               SpinvR1Dly <= SpinvR1;
               SpinvI1Dly <= SpinvI1;

               -- complex_mult(x_r[k],x_i[k],S_pinv_r[0][k],S_pinv_i[0][k],&temp0_r,&temp0_i);
               -- A_r[0] += temp0_r;
               -- A_i[0] += temp0_i;
               XrSpinvR0 <= resize(XrDelay(DELAY-1) * SpinvR0Dly, XrSpinvR0);
               XrSpinvI0 <= resize(XrDelay(DELAY-1) * SpinvI0Dly, XrSpinvI0);
               XiSpinvR0 <= resize(XiDelay(DELAY-1) * SpinvR0Dly, XiSpinvR0);
               XiSpinvI0 <= resize(XiDelay(DELAY-1) * SpinvI0Dly, XiSpinvI0);
               -- complex_mult(x_r[k],x_i[k],S_pinv_r[1][k],S_pinv_i[1][k],&temp1_r,&temp1_i);
               -- A_r[1] += temp1_r;
               -- A_i[1] += temp1_i;
               XrSpinvR1 <= resize(XrDelay(DELAY-1) * SpinvR1Dly, XrSpinvR1);
               XrSpinvI1 <= resize(XrDelay(DELAY-1) * SpinvI1Dly, XrSpinvI1);
               XiSpinvR1 <= resize(XiDelay(DELAY-1) * SpinvR1Dly, XiSpinvR1);
               XiSpinvI1 <= resize(XiDelay(DELAY-1) * SpinvI1Dly, XiSpinvI1);
               if (PilotCount > DELAY) then
                  Ar0 <= resize(XrSpinvR0 - XiSpinvI0 + Ar0, Ar0);
                  Ai0 <= resize(XrSpinvI0 + XiSpinvR0 + Ai0, Ai0);
                  Ar1 <= resize(XrSpinvR1 - XiSpinvI1 + Ar1, Ar1);
                  Ai1 <= resize(XrSpinvI1 + XiSpinvR1 + Ai1, Ai1);
               end if;
               if (PilotCount < PILOT_LENGTH_4 / 2 + DELAY + 2) then -- allow time to propagate
                  PilotCount <= PilotCount + 1;
               else
                  PilotCount <= 0;
                  H0EstR   <= resize(Ar0, H0EstR);
                  H0EstI   <= resize(Ai0, H0EstI);
                  H1EstR   <= resize(Ar1, H1EstR);
                  H1EstI   <= resize(Ai1, H1EstI);
                  Done     <= '1';
                  Mode     <= Idle;
               end if;
            end case;
         end if;
      end if;
   end process ChannelProcess;

   RdAddr <= PilotCount when PilotCount < TIME_DEPTH else 0;

   SinvLut : SinvLuts
      PORT MAP(
         clk      => clk,
         reset    => reset,
         ce       => ce,
         Xa       => TauEst0Index,
         Xb       => 0,
         Ya       => TauEst1Index,
         Yb       => 0,
         SsInvR0A => SsInvR0,
         SsInvR1A => SsInvR1,
         SsInvI0A => SsInvI0,
         SsInvI1A => SsInvI1,
         SsInvR2A => SsInvR2,
         SsInvI2A => SsInvI2,
         SsInvR3A => SsInvR3,
         SsInvI3A => SsInvI3,
         SsInvR0B => open,
         SsInvR1B => open,
         SsInvI0B => open,
         SsInvI1B => open,
         SsInvR2B => open,
         SsInvI2B => open,
         SsInvR3B => open,
         SsInvI3B => open
      );

END rtl;

