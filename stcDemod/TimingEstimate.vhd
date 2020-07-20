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

Module Name: TimingEstimate.vhd
Description: The 65x65 2D surface map is calculated to find the minimum value.
   The routine starts with the center at 32,32 and finds the values for each quadrant
   as ±16 from the center (16,16; 16,48; 48,16; 48,48) The lowest is picked as the
   new center and the offsets halved to ±8, thus finding the 4 squares in the
   selected corner. The subquadrant continues to be selected as the offsets halve
   till ±1. At this point the neighbors are searched 3 times to get the corners.

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
USE IEEE.std_logic_textio.all;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.all;
use work.Semco_pkg.ALL;

ENTITY TimingEstimate IS
   PORT(
      clk,
      ce,
      reset,
      StartIn        : IN  std_logic;
      Xr,
      Xi             : IN  FLOAT_1_18;
      Tau0Est,
      Tau1Est        : OUT STC_Parm;
      Tau0Ndx,
      Tau1Ndx        : OUT natural range 0 to SEARCH_LENGTH;
      RdAddr         : OUT natural range 0 to TIME_DEPTH-1;
      Done           : OUT std_logic
   );
END TimingEstimate;


ARCHITECTURE rtl OF TimingEstimate IS

   Component ComputeMetric is
      port (
         clk,
         ce,
         reset,
         StartIn        : IN  std_logic;
         Xr,
         Xi             : IN  FLOAT_1_18;
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
         Result         : OUT FLOAT_256_HP;
         Done           : OUT Std_logic
      );
   END COMPONENT ComputeMetric;

   COMPONENT SinvLuts IS
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         Xa,
         Xb,
         Ya,
         Yb             : IN natural range 0 to SEARCH_LENGTH;
         SsInvR0A,    -- ±.005
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
         SsInvI3B        : out sfixed(-7 downto -24)   -- 18 bit version
      );
   END COMPONENT SinvLuts;

   function ResultsMin(Results_v : in FLOAT_ARRAY_256_HP(0 to 3)) return integer is
   -- find minimum of first three values
      variable Index01_v,
               Index23_v,
               Index_v    : integer range 0 to 3;
      variable Mag01_v,
               Mag23_v  : FLOAT_256_HP;
   begin
      if (Results_v(1) < Results_v(0)) then
         Index01_v  := 1;
         Mag01_v    := Results_v(1);
      else
         Index01_v  := 0;
         Mag01_v    := Results_v(0);
      end if;

      if (Results_v(2) < Results_v(3)) then
         Index23_v  := 2;
         Mag23_v    := Results_v(2);
      else
         Index23_v  := 3;
         Mag23_v    := Results_v(3);
      end if;

      if (Mag23_v < Mag01_v) then
         Index_v := Index23_v;
      else
         Index_v := Index01_v;
      end if;
      return Index_v;
   end function;

   function OffsetX(Index : in integer; Offset : in integer) return integer is
   -- find minimum of first three values
      variable Result     : integer range -32 to 32;
   begin
      if (Offset > 1) then
         Result := Index mod 2;
         if (Result = 0) then
            Result := -Offset;
         else
            Result := Offset;
         end if;
      else
         if  (Index mod 2 = 1) then
            Result := Offset;
         else
            Result := -Offset;
         end if;
      end if;
      return Result;
   end function;

   function OffsetY(Index : in integer; Offset : in integer) return integer is
   -- find minimum of first three values
      variable Result     : integer range -32 to 32;
   begin
      if (Offset > 1) then       -- ± Offset
         if (Index >= 2) then
            Result := Offset;
         else
            Result := -Offset;
         end if;
      else
         if (Index >= 2) then    -- 0 or Offset
            Result := Offset;
         else
            Result := -Offset;
         end if;
      end if;
      return Result;
   end function;

   -- constants
   type    ModeType           is (IDLE, SEARCH, NEIGHBORS, FIND_INDEX, FIND_TAU, TAU_SUB, FINISH);

   CONSTANT ADDR_MAX          : positive := PILOT_LENGTH_4;   -- 0 to 256 twice. 512 implies done
   CONSTANT ALMOST_ONE        : STC_Parm := to_sfixed(1.0, PARM_ZERO, FIXED_SATURATE, FIXED_TRUNCATE);

  -- Signals
   SIGNAL   CenterX,
            CenterY           : natural range 0 to SEARCH_LENGTH := 32;
   SIGNAL   ResultsCM         : FLOAT_ARRAY_256_HP(0 to 3);
   SIGNAL   ResultsCMreg,
            MinCM             : FLOAT_256_HP;
   SIGNAL   Mode              : ModeType := IDLE;
   SIGNAL   Offset            : integer range 0 to 16 := 16;
   SIGNAL   RdCntr            : integer range 0 to ADDR_MAX;
   SIGNAL   RdCntr_u          : unsigned(9 downto 0);
   SIGNAL   ComputeDone,
            StartCM           : std_logic;
   SIGNAL   MinIndex,
            Iterations        : integer range 0 to 3;
   SIGNAL   MinX, MinY        : integer range 0 to SEARCH_LENGTH;
   SIGNAL   xx, yy            : natural_array(0 to 3);
   SIGNAL   Tau0Est_sf,
            Tau1Est_sf        : sfixed(6 downto -8);
   SIGNAL   PipeLine          : natural range 0 to 2;
   SIGNAL   OffsetXreg,
            OffsetYreg        : integer range -32 to 32;
   SIGNAL   Tau0Sf,
            Tau1Sf            : sfixed(6 downto 0);
   SIGNAL   SsInvR0A,
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
            SsInvI3B,
            SsInvR0C,
            SsInvR1C,
            SsInvI0C,
            SsInvI1C,
            SsInvR2C,
            SsInvI2C,
            SsInvR3C,
            SsInvI3C,
            SsInvR0D,
            SsInvR1D,
            SsInvI0D,
            SsInvI1D,
            SsInvR2D,
            SsInvI2D,
            SsInvR3D,
            SsInvI3D          : sfixed(-7 downto -24);

/*
   attribute mark_debug : string;
   attribute mark_debug of StartIn, Xr, Xi, RdAddr, Mode, PipeLine, Done : signal is "true";
*/

BEGIN

   process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            RdCntr         <= 0;
            MinX           <= 0;                      -- current minimum x,y
            MinY           <= 0;
            OffsetXreg     <= 0;
            OffsetYreg     <= 0;
            ResultsCMreg   <= (others => '0');
            MinCM          <= to_sfixed(255, MinCM);  -- current minimum value
            PipeLine       <= 0;
            Done           <= '0';
            StartCM        <= '0';
            CenterX        <= 32;
            CenterY        <= 32;
            xx             <= (others => 0);
            yy             <= (others => 0);
            Offset         <= 16;
            Mode           <= IDLE;
            Iterations     <= 0;
            MinIndex       <= 0;
            Tau0Ndx        <= 0;
            Tau1Ndx        <= 0;
            Tau0Est        <= (others => '0');
            Tau1Est        <= (others => '0');
            Tau0Est_sf     <= (others => '0');
            Tau1Est_sf     <= (others => '0');
            Tau0Sf         <= (others => '0');
            Tau1Sf         <= (others => '0');
         elsif (ce) then
            if (Mode /= IDLE) then
               if (RdCntr = ADDR_MAX-1) then -- idles at zero so first ROM value is present
                  RdCntr <= 0;
               elsif (RdCntr > 0) then
                  RdCntr <= RdCntr + 1;
               elsif (StartCM = '1') then
                  RdCntr <= 1;
               end if;
            end if;
            case Mode is
            when IDLE =>
               RdCntr      <= 0;
               PipeLine    <= 0;
               Done        <= '0';
               CenterX     <= 32;
               CenterY     <= 32;   -- start search in center of 65x65 matrix
               Offset      <= 16;   -- ±Offset
               MinCM       <= to_sfixed(255, MinCM);
               if (StartIn) then
                  StartCM  <= '1';  -- launch Metrics then wait for done
                  Mode     <= SEARCH;
               else
                  StartCM  <= '0';
               end if;
            when SEARCH =>
               case PipeLine is
               when 0 =>
                  if (ComputeDone) then
                     MinIndex <= ResultsMin(ResultsCM);
                     PipeLine <= PipeLine + 1;
                  else
                     StartCM <= '0';
                  end if;
               when 1 =>
                  if (ResultsCM(MinIndex) < MinCM) then
                     MinCM <= ResultsCM(MinIndex);
                     MinX  <= xx(MinIndex);
                     MinY  <= yy(MinIndex);
                  end if;
                  PipeLine <= PipeLine + 1;
               when 2 =>
                  CenterX <= CenterX + OffsetX(MinIndex, Offset);
                  CenterY <= CenterY + OffsetY(MinIndex, Offset);
                  PipeLine <= 0;
                  if (Offset >= 2) then
                     Offset   <= Offset / 2;
                  else
                     Mode <= NEIGHBORS;
                     Iterations <= 3;
                  end if;
                  StartCM <= '1';
               end case;
            when NEIGHBORS =>
               case PipeLine is
               when 0 =>
                  if (ComputeDone) then
                     MinIndex <= ResultsMin(ResultsCM);
                     PipeLine <= PipeLine + 1;
                  else
                     StartCM <= '0';
                  end if;
               When 1 =>
                  -- find new offsets
                  OffsetXreg <= OffsetX(MinIndex, Offset);
                  OffsetYreg <= OffsetY(MinIndex, Offset);
                  ResultsCMreg <= ResultsCM(MinIndex);
                  PipeLine <= PipeLine + 1;
               When 2 =>
                  -- keep Centers within 1 to 63
                  CenterX <= MyMax(MyMin(CenterX + OffsetXreg, SEARCH_LENGTH-1), 1);
                  CenterY <= MyMax(MyMin(CenterY + OffsetYreg, SEARCH_LENGTH-1), 1);
                  PipeLine <= 0;
                  if (ResultsCMreg < MinCM) then
                     MinCM <= ResultsCMreg;
                     MinX  <= xx(MinIndex);
                     MinY  <= yy(MinIndex);
                  end if;
                  if (Iterations = 0) then
                     Mode <= FIND_INDEX;
                     PipeLine <= 0;
                  else
                     Iterations <= Iterations - 1;
                  end if;
                  StartCM <= '1';
               end case;
            when FIND_INDEX =>
               StartCM <= '0';   -- turn off start pulse
               case PipeLine is
               when 0 =>
                  if (ComputeDone) then
                     -- Down to the last 4 block, find min
                     MinIndex <= ResultsMin(ResultsCM);
                     PipeLine <= PipeLine + 1;
                  end if;
               When 1 =>
                  ResultsCMreg <= ResultsCM(MinIndex);
                  PipeLine <= PipeLine + 1;
               when 2 =>
                  if (ResultsCMreg < MinCM) then
                     Tau0Ndx  <= xx(MinIndex);
                     Tau1Ndx  <= yy(MinIndex);
                  else
                     Tau0Ndx  <= MinX;
                     Tau1Ndx  <= MinY;
                  end if;
                  Mode     <= FIND_TAU;
                  PipeLine <= 0;
               end case;
            when FIND_TAU =>
               -- we have the Ndx's, calculate the Estimates on the next clock
               --// interpolate to get better accuracy on the timing estimates
               -- *tau_est0 = (float)(*tau0_est_ndx - SAMPS_BIT_OVER)/(float)SAMPS_BIT_OVER;
               Tau0Sf   <= to_sfixed(Tau0Ndx, Tau0Sf, FIXED_WRAP, FIXED_TRUNCATE);
               Tau1Sf   <= to_sfixed(Tau1Ndx, Tau1Sf, FIXED_WRAP, FIXED_TRUNCATE);
               Mode     <= TAU_SUB;
            when TAU_SUB =>
               Tau0Est_sf  <= resize(SAMPS_BIT_OVER - Tau0Sf, Tau0Est_sf, FIXED_WRAP, FIXED_TRUNCATE);
               -- *tau_est1 = (float)(*tau1_est_ndx - SAMPS_BIT_OVER)/(float)SAMPS_BIT_OVER;
               Tau1Est_sf  <= resize(SAMPS_BIT_OVER - Tau1Sf, Tau1Est_sf);
               Mode <= FINISH;
            when FINISH =>
               Done <= '1';
               -- we have the Ndx's, calculate the Estimates on the next clock
               --// interpolate to get better accuracy on the timing estimates
               -- *tau_est0 = (float)(*tau0_est_ndx - SAMPS_BIT_OVER)/(float)SAMPS_BIT_OVER;
               if (Tau0Ndx = 0) then   -- saturate via if, rather than inline
                  Tau0Est <= ALMOST_ONE;
               else
                  Tau0Est     <= resize(Tau0Est_sf / SAMPS_BIT_OVER, Tau0Est, FIXED_WRAP, FIXED_TRUNCATE);
               end if;
               -- *tau_est1 = (float)(*tau1_est_ndx - SAMPS_BIT_OVER)/(float)SAMPS_BIT_OVER;
               if (Tau1Ndx = 0) then
                  Tau1Est <= ALMOST_ONE;
               else
                  Tau1Est     <= resize(Tau1Est_sf / SAMPS_BIT_OVER, Tau1Est, FIXED_WRAP, FIXED_TRUNCATE);
               end if;
               -- // the result of the search is actually inverted from what it needs to be to fix that here
               -- *tau_est0 *= -1.0f;
               -- *tau_est1 *= -1.0f;
               -- taken care of by reversing the subtractions above
               Mode <= IDLE;
            end case;
            xx(0) <= CenterX - Offset;
            yy(0) <= CenterY - Offset;
            xx(1) <= CenterX + Offset;
            yy(1) <= CenterY - Offset;
            xx(2) <= CenterX - Offset;
            yy(2) <= CenterY + Offset;
            xx(3) <= CenterX + Offset;
            yy(3) <= CenterY + Offset;
         end if;
      end if;
   end process;

   ComputeMetric1_u : ComputeMetric
      port map (
         clk            => clk,
         ce             => ce,
         reset          => reset,   -- clear dones
         StartIn        => StartCM,
         Xr             => Xr,
         Xi             => Xi,
         IndexX         => xx(0),
         IndexY         => yy(0),
         SsInvR0        => SsInvR0A,
         SsInvR1        => SsInvR1A,
         SsInvI0        => SsInvI0A,
         SsInvI1        => SsInvI1A,
         SsInvR2        => SsInvR2A,
         SsInvI2        => SsInvI2A,
         SsInvR3        => SsInvR3A,
         SsInvI3        => SsInvI3A,
         Result         => ResultsCM(0),
         Done           => ComputeDone
      );

   ComputeMetric2_u : ComputeMetric
      port map (
         clk            => clk,
         ce             => ce,
         reset          => reset,   -- clear dones
         StartIn        => StartCM,
         Xr             => Xr,
         Xi             => Xi,
         IndexX         => xx(1),
         IndexY         => yy(1),
         SsInvR0        => SsInvR0B,
         SsInvR1        => SsInvR1B,
         SsInvI0        => SsInvI0B,
         SsInvI1        => SsInvI1B,
         SsInvR2        => SsInvR2B,
         SsInvI2        => SsInvI2B,
         SsInvR3        => SsInvR3B,
         SsInvI3        => SsInvI3B,
         Result         => ResultsCM(1),
         Done           => open
      );

   ComputeMetric3_u : ComputeMetric
      port map (
         clk            => clk,
         ce             => ce,
         reset          => reset,   -- clear dones
         StartIn        => StartCM,
         Xr             => Xr,
         Xi             => Xi,
         IndexX         => xx(2),
         IndexY         => yy(2),
         SsInvR0        => SsInvR0C,
         SsInvR1        => SsInvR1C,
         SsInvI0        => SsInvI0C,
         SsInvI1        => SsInvI1C,
         SsInvR2        => SsInvR2C,
         SsInvI2        => SsInvI2C,
         SsInvR3        => SsInvR3C,
         SsInvI3        => SsInvI3C,
         Result         => ResultsCM(2),
         Done           => open
      );

   ComputeMetric4_u : ComputeMetric
      port map (
         clk            => clk,
         ce             => ce,
         reset          => reset,   -- clear done
         StartIn        => StartCM,
         Xr             => Xr,
         Xi             => Xi,
         IndexX         => xx(3),
         IndexY         => yy(3),
         SsInvR0        => SsInvR0D,
         SsInvR1        => SsInvR1D,
         SsInvI0        => SsInvI0D,
         SsInvI1        => SsInvI1D,
         SsInvR2        => SsInvR2D,
         SsInvI2        => SsInvI2D,
         SsInvR3        => SsInvR3D,
         SsInvI3        => SsInvI3D,
         Result         => ResultsCM(3),
         Done           => open
      );

   SinvLutAB : SinvLuts
      PORT MAP(
         clk      => clk,
         reset    => reset,
         ce       => ce,
         Xa       => xx(0),
         Ya       => yy(0),
         Xb       => xx(1),
         Yb       => yy(1),
         SsInvR0a => SsInvR0A,
         SsInvR1a => SsInvR1A,
         SsInvI0a => SsInvI0A,
         SsInvI1a => SsInvI1A,
         SsInvR2a => SsInvR2A,
         SsInvI2a => SsInvI2A,
         SsInvR3a => SsInvR3A,
         SsInvI3a => SsInvI3A,
         SsInvR0b => SsInvR0B,
         SsInvR1b => SsInvR1B,
         SsInvI0b => SsInvI0B,
         SsInvI1b => SsInvI1B,
         SsInvR2b => SsInvR2B,
         SsInvI2b => SsInvI2B,
         SsInvR3b => SsInvR3B,
         SsInvI3b => SsInvI3B
      );

   SinvLutCD : SinvLuts
      PORT MAP(
         clk      => clk,
         reset    => reset,
         ce       => ce,
         Xa       => xx(2),
         Ya       => yy(2),
         Xb       => xx(3),
         Yb       => yy(3),
         SsInvR0a => SsInvR0C,
         SsInvR1a => SsInvR1C,
         SsInvI0a => SsInvI0C,
         SsInvI1a => SsInvI1C,
         SsInvR2a => SsInvR2C,
         SsInvI2a => SsInvI2C,
         SsInvR3a => SsInvR3C,
         SsInvI3a => SsInvI3C,
         SsInvR0b => SsInvR0D,
         SsInvR1b => SsInvR1D,
         SsInvI0b => SsInvI0D,
         SsInvI1b => SsInvI1D,
         SsInvR2b => SsInvR2D,
         SsInvI2b => SsInvI2D,
         SsInvR3b => SsInvR3D,
         SsInvI3b => SsInvI3D
      );


   RdCntr_u <= to_unsigned(RdCntr,10);
   RdAddr <= to_integer(RdCntr_u(7 downto 0));

END rtl;
