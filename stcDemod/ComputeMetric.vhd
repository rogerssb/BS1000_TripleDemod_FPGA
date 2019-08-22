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

Module Name: ComputeMetric.vhd
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
USE IEEE.std_logic_textio.all;
library std;
use std.textio.all;
use work.fixed_pkg.all;
USE IEEE.math_real.all;
use work.Semco_pkg.ALL;

ENTITY  ComputeMetric is
   port (
      clk,
      ce,
      reset,
      StartIn        : IN  std_logic;
      IndexX,
      IndexY         : IN  integer range 0 to SEARCH_LENGTH;
      SsInvR0,    -- ±.005
      SsInvR1,
      SsInvI0,
      SsInvI1,
      SsInvR2,
      SsInvI2,
      SsInvR3,
      SsInvI3        : IN  sfixed(-7 downto -24);   -- 18 bit version
      Xr,
      Xi             : IN  FLOAT_1_18;
      Result         : OUT FLOAT_256_HP;
      Done           : OUT Std_logic
   );
end ComputeMetric;

ARCHITECTURE rtl OF ComputeMetric IS

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
            FuncRam(i) := to_sfixed(Slv_v(24 downto 0), FuncRam(i)); --7), FuncRam(i));
            assert Good_v report "Failed to convert real of: " & ramfileline.all severity FAILURE;
         else
            report "End of file reached" severity FAILURE;
         end if;
       end loop;
       return FuncRam;
   end function;

   CONSTANT DELAY       : positive := 4;
   CONSTANT DELAY23     : positive := 8;

   type     ModeType is (Idle, ExtractTemplate, Loop23);

  -- Signals
   SIGNAL   Mode           : ModeType := Idle;
   SIGNAL   SsInvR0Ss0R,      -- max ±5e-3
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
            XrSpinvR0,
            XrSpinvI0,
            XiSpinvR0,
            XiSpinvI0,
            XrSpinvR1,
            XrSpinvI1,
            XiSpinvR1,
            XiSpinvI1        : sfixed(-7 downto -24);
  SIGNAL    NormRSs0R0,
            NormRSs0I0,
            NormISs0R0,
            NormISs0I0,
            NormRSs1R1,
            NormRSs1I1,
            NormISs1R1,
            NormISs1I1,
            Ss0R,
            Ss0I,
            Ss1R,
            Ss1I,
            Ss0RReg,
            Ss0IReg,
            Ss1RReg,
            Ss1IReg,
            Ss0R23,
            Ss0I23,
            Ss1R23,
            Ss1I23            : FLOAT_1_18;     -- max ±1
   SIGNAL   NormLongR,
            NormLongI,
            NormTempR0,
            NormTempI0,
            NormTempR1,
            NormTempI1        : FLOAT_16_HP;
   SIGNAL   XrNorm,
            XiNorm            : FLOAT_16_LP;
   SIGNAL   XrNormSq,
            XiNormSq          : FLOAT_16_HP;
   SIGNAL   NormOut           : FLOAT_256_HP;
   SIGNAL   PilotCount        : integer range 0 to PILOT_LENGTH_4 / 2 + DELAY + 3;
   SIGNAL   XrDelay,
            XiDelay           : FLOAT_ARRAY_1_18(DELAY23-1 downto 0);
   SIGNAL   Sig0R             : SIG_ARRAY := InitSigFromFile("..\sourceData\s0_lut_r.slv");
   SIGNAL   Sig0I             : SIG_ARRAY := InitSigFromFile("..\sourceData\s0_lut_i.slv");
   SIGNAL   Sig1R             : SIG_ARRAY := InitSigFromFile("..\sourceData\s1_lut_r.slv");
   SIGNAL   Sig1I             : SIG_ARRAY := InitSigFromFile("..\sourceData\s1_lut_i.slv");

BEGIN

   ComputeProcess: process (clk)
      variable Real_v : real;
      variable MyLine : line;
   begin
      if (rising_edge(clk)) then
         if (reset) then
            PilotCount  <= 0;
            Done        <= '0';
            NormTempR0  <= (others=>'0');
            NormTempI0  <= (others=>'0');
            NormTempR1  <= (others=>'0');
            NormTempI1  <= (others=>'0');
            Ss0R        <= (others=>'0');
            Ss0I        <= (others=>'0');
            Ss1R        <= (others=>'0');
            Ss1I        <= (others=>'0');
            Ss0RReg     <= (others=>'0');
            Ss0IReg     <= (others=>'0');
            Ss1RReg     <= (others=>'0');
            Ss1IReg     <= (others=>'0');
            Ss0R23      <= (others=>'0');
            Ss0I23      <= (others=>'0');
            Ss1R23      <= (others=>'0');
            Ss1I23      <= (others=>'0');
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
            XrSpinvR0   <= (others=>'0');
            XrSpinvI0   <= (others=>'0');
            XiSpinvR0   <= (others=>'0');
            XiSpinvI0   <= (others=>'0');
            XrSpinvR1   <= (others=>'0');
            XrSpinvI1   <= (others=>'0');
            XiSpinvR1   <= (others=>'0');
            XiSpinvI1   <= (others=>'0');
            NormRSs0R0  <= (others=>'0');
            NormRSs0I0  <= (others=>'0');
            NormISs0R0  <= (others=>'0');
            NormISs0I0  <= (others=>'0');
            NormRSs1R1  <= (others=>'0');
            NormRSs1I1  <= (others=>'0');
            NormISs1R1  <= (others=>'0');
            NormISs1I1  <= (others=>'0');
            NormLongR   <= (others=>'0');
            NormLongI   <= (others=>'0');
            XrNorm      <= (others=>'0');
            XiNorm      <= (others=>'0');
            XrNormSq    <= (others=>'0');
            XiNormSq    <= (others=>'0');
            NormOut     <= (others=>'0');
            XrDelay     <= (others=>(others=>'0'));
            XiDelay     <= (others=>(others=>'0'));
            Mode        <= Idle;
            Result      <= (others=>'0');
         elsif (ce) then
            XrDelay <= XrDelay(DELAY23-2 downto 0) & Xr;
            XiDelay <= XiDelay(DELAY23-2 downto 0) & Xi;
            case (Mode) is
            when Idle=>
               Done        <= '0';
               PilotCount  <= 0;
               NormTempR0  <= (others=>'0');
               NormTempI0  <= (others=>'0');
               NormTempR1  <= (others=>'0');
               NormTempI1  <= (others=>'0');
               Ss0R        <= (others=>'0');
               Ss0I        <= (others=>'0');
               Ss1R        <= (others=>'0');
               Ss1I        <= (others=>'0');
               Ss0RReg     <= (others=>'0');
               Ss0IReg     <= (others=>'0');
               Ss1RReg     <= (others=>'0');
               Ss1IReg     <= (others=>'0');
               Ss0R23      <= (others=>'0');
               Ss0I23      <= (others=>'0');
               Ss1R23      <= (others=>'0');
               Ss1I23      <= (others=>'0');
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
               XrSpinvR0   <= (others=>'0');
               XrSpinvI0   <= (others=>'0');
               XiSpinvR0   <= (others=>'0');
               XiSpinvI0   <= (others=>'0');
               XrSpinvR1   <= (others=>'0');
               XrSpinvI1   <= (others=>'0');
               XiSpinvR1   <= (others=>'0');
               XiSpinvI1   <= (others=>'0');
               NormRSs0R0  <= (others=>'0');
               NormRSs0I0  <= (others=>'0');
               NormISs0R0  <= (others=>'0');
               NormISs0I0  <= (others=>'0');
               NormRSs1R1  <= (others=>'0');
               NormRSs1I1  <= (others=>'0');
               NormISs1R1  <= (others=>'0');
               NormISs1I1  <= (others=>'0');
               NormLongR   <= (others=>'0');
               NormLongI   <= (others=>'0');
               XrNorm      <= (others=>'0');
               XiNorm      <= (others=>'0');
               XrNormSq    <= (others=>'0');
               XiNormSq    <= (others=>'0');
               NormOut     <= (others=>'0');
               XrDelay     <= (others=>(others=>'0'));
               XiDelay     <= (others=>(others=>'0'));
               if (StartIn) then
                  Done        <= '0';  -- leave active till next use to allow other CM modules to finish
                  Mode <= ExtractTemplate;
               end if;
            when ExtractTemplate =>
	            -- extract the template (with the desired offset)--together these form S, a PILOT_LENGTH_4x2 matrix
               -- ss0_r[k] = sig_0_r[SEARCH_SKIP*k+x_ndx];
               -- ss0_i[k] = sig_0_i[SEARCH_SKIP*k+x_ndx];
               -- ss1_r[k] = sig_1_r[SEARCH_SKIP*k+y_ndx];
               -- ss1_i[k] = sig_1_i[SEARCH_SKIP*k+y_ndx];
               if (PilotCount < PILOT_LENGTH_4/2) then
                  Ss0RReg <= resize(Sig0R(SEARCH_SKIP * PilotCount + IndexX), ss0RReg);
                  Ss0IReg <= resize(Sig0I(SEARCH_SKIP * PilotCount + IndexX), ss0IReg);
                  Ss1RReg <= resize(Sig1R(SEARCH_SKIP * PilotCount + IndexY), ss1RReg);
                  Ss1IReg <= resize(Sig1I(SEARCH_SKIP * PilotCount + IndexY), ss1IReg);
               end if;
               Ss0R <= Ss0RReg;
               Ss0I <= Ss0IReg;
               Ss1R <= Ss1RReg;
               Ss1I <= Ss1IReg;
               -- get the inverted matrix inv(S'*S) for s0 and s1 (this was precomputed)
               -- ss_inv_r = SS_inv_LUT_r[x_ndx][y_ndx];
               -- ss_inv_i = SS_inv_LUT_i[x_ndx][y_ndx];
               -- SsInvR0  <= SInvLutR0(IndexX, IndexY);  -- ss_inv_r is 1x4 matrix
               -- SsInvI0  <= SInvLutI0(IndexX, IndexY);  -- these are pulled from LUT below
               -- SsInvR1  <= SInvLutR1(IndexX, IndexY);
               -- SsInvI1  <= SInvLutI1(IndexX, IndexY);
               -- SsInvR2  <= SInvLutR2(IndexX, IndexY);
               -- SsInvI2  <= SInvLutI2(IndexX, IndexY);
               -- SsInvR3  <= SInvLutR3(IndexX, IndexY);
               -- SsInvI3  <= SInvLutI3(IndexX, IndexY);
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

               -- complex_mult(x_r[k],x_i[k],S_pinv_r[0][k],S_pinv_i[0][k],&temp0_r,&temp0_i);
               -- A_r[0] += temp0_r;
               -- A_i[0] += temp0_i;
               XrSpinvR0 <= resize(XrDelay(DELAY-1) * SpinvR0, XrSpinvR0);
               XrSpinvI0 <= resize(XrDelay(DELAY-1) * SpinvI0, XrSpinvI0);
               XiSpinvR0 <= resize(XiDelay(DELAY-1) * SpinvR0, XiSpinvR0);
               XiSpinvI0 <= resize(XiDelay(DELAY-1) * SpinvI0, XiSpinvI0);
               NormTempR0 <= resize(XrSpinvR0 - XiSpinvI0 + NormTempR0, NormTempR0);
               NormTempI0 <= resize(XrSpinvI0 + XiSpinvR0 + NormTempI0, NormTempI0);
               -- complex_mult(x_r[k],x_i[k],S_pinv_r[1][k],S_pinv_i[1][k],&temp1_r,&temp1_i);
               -- A_r[1] += temp1_r;
               -- A_i[1] += temp1_i;
               XrSpinvR1 <= resize(XrDelay(DELAY-1) * SpinvR1, XrSpinvR1);
               XrSpinvI1 <= resize(XrDelay(DELAY-1) * SpinvI1, XrSpinvI1);
               XiSpinvR1 <= resize(XiDelay(DELAY-1) * SpinvR1, XiSpinvR1);
               XiSpinvI1 <= resize(XiDelay(DELAY-1) * SpinvI1, XiSpinvI1);
               NormTempR1 <= resize(XrSpinvR1 - XiSpinvI1 + NormTempR1, NormTempR1);
               NormTempI1 <= resize(XrSpinvI1 + XiSpinvR1 + NormTempI1, NormTempI1);
               if (PilotCount < PILOT_LENGTH_4 / 2 + DELAY) then -- allow time to propagate
                  PilotCount <= PilotCount + 1;
               else
                  PilotCount  <= 0;
                  Mode        <= Loop23;
               end if;
            when Loop23 =>
               -- pull Ss values again to avoid long delaylines
               if (PilotCount < PILOT_LENGTH_4/2) then
                  Ss0R23     <= resize(Sig0R(SEARCH_SKIP * PilotCount + IndexX), ss0R23);   -- the resizes probably are Float1 to Float1, but could change
                  Ss0I23     <= resize(Sig0I(SEARCH_SKIP * PilotCount + IndexX), ss0I23);
                  Ss1R23     <= resize(Sig1R(SEARCH_SKIP * PilotCount + IndexY), ss1R23);
                  Ss1I23     <= resize(Sig1I(SEARCH_SKIP * PilotCount + IndexY), ss1I23);
               end if;
	            -- compute S*inv(S'*S)*S'*x (the result is a PILOT_LENGTH_4x1 vector)
               -- complex_mult(norm_temp_r[0],norm_temp_i[0],ss0_r[k],ss0_i[k],&temp0_r,&temp0_i);
               NormRSs0R0 <= resize(NormTempR0 * Ss0R23, NormRSs0R0);
               NormRSs0I0 <= resize(NormTempR0 * Ss0I23, NormRSs0I0);
               NormISs0R0 <= resize(NormTempI0 * Ss0R23, NormISs0R0);
               NormISs0I0 <= resize(NormTempI0 * Ss0I23, NormISs0I0);
               -- complex_mult(norm_temp_r[1],norm_temp_i[1],ss1_r[k],ss1_i[k],&temp1_r,&temp1_i);
               NormRSs1R1 <= resize(NormTempR1 * Ss1R23, NormRSs1R1);
               NormRSs1I1 <= resize(NormTempR1 * Ss1I23, NormRSs1I1);
               NormISs1R1 <= resize(NormTempI1 * Ss1R23, NormISs1R1);
               NormISs1I1 <= resize(NormTempI1 * Ss1I23, NormISs1I1);
               -- norm_temp_long_r[k] = temp1_r + temp1_r;
               -- norm_temp_long_i[k] = temp1_i + temp1_i;
               NormLongR <= resize(NormRSs0R0 - NormISs0I0 + NormRSs1R1 - NormISs1I1, NormLongR);
               NormLongI <= resize(NormRSs0I0 + NormISs0R0 + NormRSs1I1 + NormISs1R1, NormLongI);
	            -- compute x - S*inv(S'*S)*S'*x (the result is a PILOT_LENGTH_4x1 vector)
               -- norm_temp_long_r[k] = x_r[k] - norm_temp_long_r[k];
               -- norm_temp_long_i[k] = x_i[k] - norm_temp_long_i[k];
               if (PilotCount > 2) then                              -- data is repeated for second loop. Don't start accum yet
                  XrNorm <= resize(XrDelay(DELAY23-1) - NormLongR, XrNorm);
                  XiNorm <= resize(XiDelay(DELAY23-1) - NormLongI, XiNorm);
                  -- compute the Frobenius norm of the vector (the sum of the squares)
                  -- complex_abs2(norm_temp_long_r[k],norm_temp_long_i[k],&temp0);
                  -- norm += temp0;
                  XrNormSq <= resize(XrNorm * XrNorm, XrNormSq);
                  XiNormSq <= resize(XiNorm * XiNorm, XiNormSq);
                  NormOut <= resize(XrNormSq + XiNormSq + NormOut, NormOut);
               end if;
               if (PilotCount < PILOT_LENGTH_4 / 2 + DELAY + 2) then -- allow time to propagate
                  PilotCount <= PilotCount + 1;
               else
                  PilotCount  <= 0;
                  Result      <= resize(NormOut, Result);
                  Done        <= '1';
                  Mode        <= Idle;
               end if;
            end case;
         end if;
      end if;
   end process ComputeProcess;

END rtl;

