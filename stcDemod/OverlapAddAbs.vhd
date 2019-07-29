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

Module Name: OverlapAddAbs.vhd
Description: Add Squares of ReIn and ImIn. Gen ValidOut and StartOut to match
   timing.

Dependencies: None

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

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
use work.Semco_pkg.ALL;

ENTITY OverlapAddAbs IS
   GENERIC (
      IN_WIDTH    : integer   := 18;
      IN_BINPT    : integer   := -17;
      OUT_WIDTH   : integer   := 18;
      OUT_BINPT   : integer   := -17
   );
   PORT(
      clk            : IN  std_logic;
      reset          : IN  std_logic;
      ce             : IN  std_logic;
      ReIn,
      ImIn           : IN  sfixed(IN_WIDTH+IN_BINPT-1 downto IN_BINPT);
      ValidIn,
      StartIn        : IN  std_logic;     -- Start is just delayed in sync
      AbsOut         : OUT ufixed(OUT_WIDTH+OUT_BINPT-1 downto OUT_BINPT);
      ReOut,
      ImOut          : OUT sfixed(IN_WIDTH+IN_BINPT downto IN_BINPT);
      ValidOut,
      StartOut       : OUT std_logic
   );
END OverlapAddAbs;


ARCHITECTURE rtl OF OverlapAddAbs IS

   CONSTANT IN_LEFT     : integer := ReIn'left;
   CONSTANT IN_RIGHT    : integer := ReIn'right;
   CONSTANT DELAY       : integer := 512;

   type DelayLine is array (natural range <>) of sfixed(IN_LEFT downto IN_RIGHT);

  -- Signals
   SIGNAL   A0,
            B0          : sfixed(IN_LEFT+1 downto IN_RIGHT); -- same width but 2x higher range
   SIGNAL   MultR,
            MultI,
            MultRDly,
            MultIDly    : ufixed(2*A0'left+1 downto 2*A0'right);
   SIGNAL   ValidDly,
            StartDly    : std_logic_vector(4 downto 1);
   SIGNAL   Count       : integer range 0 to 1023;
   SIGNAL   OverFlow    : std_logic;
   SIGNAL   FullSize    : ufixed(2*A0'left+2 downto OUT_BINPT);
   SIGNAL   ReDlyLine,
            ImDlyLine   : DelayLine(DELAY downto 0) := (others=>(others=>'0'));     -- TODO FZ, remove initialization to pack into SRL16s

BEGIN

   ClkProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            A0          <= (others=>'0');
            B0          <= (others=>'0');
            MultR       <= (others=>'0');
            MultI       <= (others=>'0');
            MultRDly    <= (others=>'0');
            MultIDly    <= (others=>'0');
            AbsOut      <= (others=>'0');
            ValidDly    <= (others=>'0');
            StartDly    <= (others=>'0');
            FullSize    <= (others=>'0');
            Count       <= 0;
            OverFlow    <= '0';
         elsif (ce) then
            ValidDly <= ValidDly(3 downto 1) & ValidIn;
            StartDly <= StartDly(3 downto 1) & StartIn;
            if (ValidIn) then
               ReDlyLine <= ReDlyLine(DELAY-1 downto 0) & ReIn;
               ImDlyLine <= ImDlyLine(DELAY-1 downto 0) & ImIn;
               -- pipeline level 1, latch inputs
               A0 <= ReIn + ReDlyLine(DELAY);
               B0 <= ImIn + ImDlyLine(DELAY);
               if (Count < 1023) then
                  Count <= Count + 1;
               end if;
            else
               Count <= 0;
            end if;
               -- pipeline level 2, multiply latched inputs
            if (ValidDly(1)) then
               MultR     <= ufixed(A0 * A0);
               MultI     <= ufixed(B0 * B0);
            end if;
               -- pipeline level 3, just pipeline out of DSP48
            if (ValidDly(2)) then
               MultRDly  <= MultR;
               MultIDly  <= MultI;
            end if;
               -- pipeline level 4, add squares
            if (ValidDly(3)) then
               AbsOut   <= resize(MultRDly + MultIDly, AbsOut);
               FullSize <= resize(MultRDly + MultIDly, FullSize);
            end if;
            OverFlow <= '0' when (AbsOut = FullSize) else '1';
         end if;
      end if;
   end process ClkProcess;

   StartOut <= StartDly(4);
   ValidOut <= ValidDly(4);
   ReOut    <= A0;
   ImOut    <= B0;

END rtl;

