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

Module Name: CmplxMult.vhd
Description: Multiply ReInA, ImInA by ReInB, ImInB

Dependencies: None

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------
   Standard associative property gives (a+ib)*(c+id) = ac + i*(bc + ad) - bd
Mult0 = (a-b)*d
MultR = (c-d)*a
MultI = (c+d)*b
Re = MultR + Mult0 = ad - bd + ac - ad = ac - bd
Im = MultI + Mult0 = bc + bd + ad - bd = bc + ad

Originally used to drive iFft which halts input for one cycle per packet, so
added a one clock delay option that is bypassed on StartIn. If not needed just
tie ReadyIn high. Note, only one not ready per packet.
----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
2-6-17 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY CmplxMult IS
   GENERIC (
      IN_LEFT     : integer := 8;
      IN_RIGHT    : integer := -9;
      OUT_LEFT    : integer := 14;
      OUT_BINPT  : integer := -3
   );
   PORT(
      clk,
      reset,
      ce,
      ValidIn,
      StartIn,
      ReadyIn        : IN  std_logic;
      ReInA,
      ImInA,
      ReInB,
      ImInB          : IN  sfixed(IN_LEFT downto IN_RIGHT);
      ReOut,
      ImOut          : OUT sfixed(OUT_LEFT downto OUT_BINPT);
      ValidOut,
      StartOut       : OUT std_logic
   );
END CmplxMult;


ARCHITECTURE rtl OF CmplxMult IS



  -- Signals
   SIGNAL   A0,
            A1,
            B0,
            B1,
            C0,
            D0,
            D1          : sfixed(ReInA'left downto ReInA'right);
   SIGNAL   DiffAB,
            DiffCD,
            SumCD       : sfixed(A0'left+1 downto A0'right);
   SIGNAL   Mult0,
            MultR,
            MultI,
            Mult0DlyA,
            Mult0DlyB,
            MultRDly,
            MultIDly    : sfixed(A0'left+DiffAB'left+1 downto 2*A0'right);
   SIGNAL   FullSizeR,
            FullSizeI   : sfixed(Mult0'left+1 downto ReOut'right); -- truncate the bottom to ignore lower bits
   SIGNAL   RealValue,
            ImagValue,
            ReDly,
            ImDly       : sfixed(reOut'left downto ReOut'right);
   SIGNAL   ValidDly,
            StartDly    : std_logic_vector(6 downto 1);
   SIGNAL   ByPass,
            OverFlow    : std_logic;
   attribute mark_debug : string;
   attribute mark_debug of OverFlow   : signal is "true";

BEGIN

   ClkProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            A0          <= (others=>'0');
            A1          <= (others=>'0');
            B0          <= (others=>'0');
            B1          <= (others=>'0');
            C0          <= (others=>'0');
            D0          <= (others=>'0');
            D1          <= (others=>'0');
            DiffAB      <= (others=>'0');
            DiffCD      <= (others=>'0');
            SumCD       <= (others=>'0');
            Mult0       <= (others=>'0');
            MultR       <= (others=>'0');
            MultI       <= (others=>'0');
            Mult0DlyA   <= (others=>'0');
            Mult0DlyB   <= (others=>'0');
            MultRDly    <= (others=>'0');
            MultIDly    <= (others=>'0');
            ReDly       <= (others=>'0');
            ImDly       <= (others=>'0');
            RealValue   <= (others=>'0');
            ImagValue   <= (others=>'0');
            ValidDly    <= (others=>'0');
            StartDly    <= (others=>'0');
            FullSizeR   <= (others=>'0');
            FullSizeI   <= (others=>'0');
            ByPass      <= '0';
            OverFlow    <= '1';
         elsif (ce) then
            if (ValidIn) then
               -- pipeline level 1, latch inputs
               A0       <= ReInA;
               B0       <= ImInA;
               C0       <= ReInB;
               D0       <= ImInB;
            end if;
               -- pipeline level 2, Delay latched inputs and gen sums
            if (ValidDly(1)) then
               A1       <= A0;
               B1       <= B0;
               D1       <= D0;
               DiffAB   <= A0 - B0;
               DiffCD   <= C0 - D0;
               SumCD    <= C0 + D0;
            end if;
               -- pipeline level 3, multiply partials
            if (ValidDly(2)) then
               Mult0     <=  DiffAB * D1;
               MultR     <=  DiffCD * A1;
               MultI     <=  SumCD  * B1;
            end if;
               -- pipeline level 4, just pipelines
            if (ValidDly(3)) then
               Mult0DlyA <= Mult0;
               Mult0DlyB <= Mult0;
               MultRDly  <= MultR;
               MultIDly  <= MultI;
             end if;
              -- pipeline level 5, add partials
            if (ValidDly(4)) then
               RealValue <= resize(MultRDly + Mult0DlyA, RealValue, FIXED_SATURATE, FIXED_TRUNCATE);  -- tends to overflow at highest levels
               ImagValue <= resize(MultIDly + Mult0DlyB, ImagValue, FIXED_SATURATE, FIXED_TRUNCATE);
               FullSizeR <= resize(MultRDly + Mult0DlyA, FullSizeR);
               FullSizeI <= resize(MultIDly + Mult0DlyB, FullSizeI);
            end if;
            OverFlow <= '0' when (FullSizeR = RealValue) and (FullSizeI = ImagValue) else '1';
            StartDly <= StartDly(5 downto 1) & StartIn;
            ValidDly <= ValidDly(5 downto 1) & ValidIn;
            ReDly    <= RealValue;
            ImDly    <= ImagValue;
            if (StartIn) then
               ByPass <= '0';
            elsif (Not ReadyIn) then
               ByPass <= '1';
            end if;
         end if;
      end if;
   end process ClkProcess;

   ReOut <= RealValue when (not ByPass and ReadyIn) else ReDly;
   ImOut <= ImagValue when (not ByPass and ReadyIn) else ImDly;
   StartOut <= StartDly(5) when (not ByPass and ReadyIn) else StartDly(6) ;
   ValidOut <= ValidDly(5) when (not ByPass and ReadyIn) else (ValidDly(6) and ReadyIn) ;

END rtl;

