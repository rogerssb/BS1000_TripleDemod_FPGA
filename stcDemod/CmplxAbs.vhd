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

Module Name: CmplxAbs.vhd
Description: Add Squares of ReIn and ImIn

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
USE work.Semco_pkg.ALL;

ENTITY CmplxAbs IS
   GENERIC (
      IN_WIDTH    : integer   := 18;
      IN_BINPT    : integer   := -17;  -- Note, BinPt is typically negative
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
      AbsOut         : OUT sfixed(OUT_WIDTH+OUT_BINPT-1 downto OUT_BINPT);
      ValidOut,
      StartOut       : OUT std_logic
   );
END CmplxAbs;


ARCHITECTURE rtl OF CmplxAbs IS

   CONSTANT IN_LEFT     : integer := ReIn'left;
   CONSTANT IN_RIGHT    : integer := ReIn'right;

  -- Signals
   SIGNAL   A0,
            B0          : sfixed(IN_LEFT downto IN_RIGHT);
   SIGNAL   MultR,
            MultI,
            MultRDly,
            MultIDly    : sfixed(2*IN_LEFT+1 downto 2*IN_RIGHT);
   SIGNAL   ValidDly,
            StartDly    : std_logic_vector(4 downto 1);

BEGIN

   ClkProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            A0       <= (others=>'0');
            B0       <= (others=>'0');
            MultR    <= (others=>'0');
            MultI    <= (others=>'0');
            MultRDly <= (others=>'0');
            MultIDly <= (others=>'0');
            AbsOut   <= (others=>'0');
            ValidDly <= (others=>'0');
            StartDly <= (others=>'0');
         elsif (ce) then
            if (ValidIn) then
               -- pipeline level 1, latch inputs
               A0       <= ReIn;
               B0       <= ImIn;
            end if;
               -- pipeline level 2, multiply latched inputs
            if (ValidDly(1)) then
               MultR     <= resize(A0 * A0, MultR);
               MultI     <= resize(B0 * B0, MultI);
            end if;
               -- pipeline level 3, just pipelines
            if (ValidDly(2)) then
               MultRDly  <= MultR;
               MultIDly  <= MultI;
            end if;
               -- pipeline level 4, add squares
            if (ValidDly(3)) then
               AbsOut   <= resize(MultRDly + MultIDly, AbsOut);
            end if;
            StartDly <= StartDly(3 downto 1) & StartIn;
            ValidDly <= ValidDly(3 downto 1) & ValidIn;
         end if;
      end if;
   end process ClkProcess;

   StartOut <= StartDly(4);
   ValidOut <= ValidDly(4);

END rtl;

