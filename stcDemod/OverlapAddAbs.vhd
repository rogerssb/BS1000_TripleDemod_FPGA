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
USE work.Semco_pkg.ALL;

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
      AbsOut         : OUT sfixed(OUT_WIDTH+OUT_BINPT-1 downto OUT_BINPT);
      ValidOut,
      StartOut       : OUT std_logic
   );
END OverlapAddAbs;


ARCHITECTURE rtl OF OverlapAddAbs IS

   COMPONENT DelayLine IS
      GENERIC (
         LENGTH      : natural := 4096;
         DATA_WIDTH  : natural := 16;
         BINPT       : natural := 15;
         ADDR_WIDTH  : natural := 12;  -- longest delay is 4096
         RAM_TYPE    : string  := "block"  -- or "distributed"
      );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         Input          : IN  sfixed(DATA_WIDTH-BINPT-1 downto -BINPT);
         Output         : OUT sfixed(DATA_WIDTH-BINPT-1 downto -BINPT)
      );
   END COMPONENT DelayLine;

   CONSTANT IN_LEFT     : integer := ReIn'left;
   CONSTANT IN_RIGHT    : integer := ReIn'right;
   CONSTANT LATENCY     : natural := 2;

  -- Signals
   SIGNAL   ReDlyLine,
            ImDlyLine,
            ReDly,
            ImDly       : sfixed(IN_LEFT downto IN_RIGHT);
   SIGNAL   A0,
            B0          : sfixed(IN_LEFT+1 downto IN_RIGHT); -- same width but 2x higher range
   SIGNAL   MultR,
            MultI,
            MultRDly,
            MultIDly    : sfixed(2*A0'left+1 downto 2*A0'right);
   SIGNAL   ValidDly,
            StartDly    : std_logic_vector(4 downto 1);
   SIGNAL   Count       : integer range 0 to 2048;
   SIGNAL   OverFlow    : std_logic;
   SIGNAL   FullSize    : sfixed(2*A0'left+2 downto OUT_BINPT);

   attribute mark_debug : string;
   attribute mark_debug of OverFlow    : signal is "true";


BEGIN

   ClkProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            A0          <= (others=>'0');
            B0          <= (others=>'0');
            ReDly       <= (others=>'0');
            ImDly       <= (others=>'0');
            MultR       <= (others=>'0');
            MultI       <= (others=>'0');
            MultRDly    <= (others=>'0');
            MultIDly    <= (others=>'0');
            AbsOut      <= (others=>'0');
            ValidDly    <= (others=>'0');
            StartDly    <= (others=>'0');
            FullSize    <= (others=>'0');
            Count       <= 0;
         elsif (ce) then
            if (ValidIn) then
               -- pipeline level 1, latch inputs
               A0 <= ReIn + ReDly;
               B0 <= ImIn + ImDly;
               ReDly <= ReDlyLine;
               ImDly <= ImDlyLine;
               Count <= Count + 1;
            else
               Count <= 0;
            end if;
               -- pipeline level 2, multiply latched inputs
            if (ValidDly(1)) then
               MultR     <= A0 * A0;
               MultI     <= B0 * B0;
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
            StartDly <= StartDly(3 downto 1) & StartIn;
            ValidDly <= ValidDly(3 downto 1) & ValidIn;
         end if;
      end if;
   end process ClkProcess;

   StartOut <= StartDly(4);
   ValidOut <= ValidDly(4);

   -- Save the last 512 samples, then retrieve them for the first 512 of next packet
   DelayReal : DelayLine
      GENERIC MAP(
         LENGTH      => 512 - LATENCY,
         DATA_WIDTH  => 18,
         BINPT       => 17,
         ADDR_WIDTH  => 9,
         RAM_TYPE    => "distributed"

      )
      PORT MAP(
         clk      => clk,
         reset    => reset,
         ce       => ce and ValidIn,
         Input    => ReIn,
         Output   => ReDlyLine
      );

   DelayImag : DelayLine
      GENERIC MAP(
         LENGTH      => 512 - LATENCY,
         DATA_WIDTH  => 18,
         BINPT       => 17,
         ADDR_WIDTH  => 9,
         RAM_TYPE    => "distributed"
      )
      PORT MAP(
         clk      => clk,
         reset    => reset,
         ce       => ce and ValidIn,
         Input    => ImIn,
         Output   => ImDlyLine
      );

END rtl;

