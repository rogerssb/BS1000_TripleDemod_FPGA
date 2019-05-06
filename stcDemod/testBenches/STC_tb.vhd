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
-- Module Name: STC_tb.vhd
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
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity STC_tb is
end STC_tb;

architecture rtl of STC_tb is

  -- Define Components
   COMPONENT TestPieces IS
      PORT(
         adc_dco_p,
         adc_dco_n         : IN  std_logic;
         Blink             : OUT std_logic   -- I'm alive Blinking LED
      );
   END COMPONENT TestPieces;

   COMPONENT STC_Test IS
      PORT(
         adc_dco_p,
         adc_dco_n,
         OverRange_p,
         OverRange_n       : IN  std_logic;
         adc_data_in_p,
         adc_data_in_n     : IN  std_logic_vector(7 downto 0); -- ddr input from 16 bit A/D
         ClkOut,                 -- FireBerd Clock Output
         DataOut,                -- FireBerd Data Output
         OverRange,              -- A/D input over range
         PilotFound,             -- Pilot Found LED
         Blink       : OUT std_logic   -- I'm alive Blinking LED
      );
   END COMPONENT STC_Test;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   CONSTANT ACQUIRE_STEP   : natural := 1;
   CONSTANT TRACK_STEP     : natural := 2;
   CONSTANT STEPS          : unsigned(4 downto 0) := 5x"08";
   constant OneOverFreqRes : sfixed(-6 downto -23) := to_sfixed(1.0/FREQ_RESOLUTION, -6 , -23);

   signal   clk            : std_logic := '0';
   signal   clk_n          : std_logic := '1';
   SIGNAL   FreqLpf,
            LpfDiffAbs,
            LpfDiff        : sfixed(17 downto -14) := (others=>'0');
   signal   FreqCoarse     : sfixed(17 downto -7) := (others=>'0');
   signal   DiffCount      : unsigned(4 downto 0) := STEPS;
   signal   StartCount     : unsigned(1 downto 0) := "00";
   signal   AcqTrack       : AcqTrack_t := Acquire;
begin

   process begin
      wait for 250 ps;  -- clk2x rate, sort of
      clk   <= clk_n;
      clk_n <= not clk;
   end process;

   process begin
         FreqCoarse <= to_sfixed(10000, FreqCoarse);
      wait for 0.4 us;
         FreqCoarse <= to_sfixed(9000, FreqCoarse);
      wait;
   end process;

   process(clk)
      variable Partial_v        : sfixed(17 downto -14);
   begin
      if (rising_edge(clk)) then
         LpfDiff     <= resize(FreqCoarse - FreqLpf, LpfDiff, fixed_saturate, fixed_truncate);
         LpfDiffAbs  <= resize(Abs(LpfDiff), LpfDiffAbs);
         StartCount  <= StartCount + 1;
         if (StartCount = 0) then -- only once per frame
            -- run 1-alpha lowpass filter to smooth FreqCoarse
                     -- 2^-10 ~= 0.001
            if (AcqTrack = Track) then
               Partial_v := resize(LpfDiff sra 10, Partial_v);
            else
               Partial_v := resize(LpfDiff sra 2, Partial_v);
            end if;
            if (LpfDiff > 40) and (AcqTrack = Track) then   -- don't let large errors pertubate results
                FreqLpf <= resize(FreqLpf + 5, FreqLpf);
            elsif (LpfDiff < -40) and (AcqTrack = Track) then
               FreqLpf <= resize(FreqLpf - 5, FreqLpf);
            else
              FreqLpf <= resize(FreqLpf + Partial_v, FreqLpf);
            end if;
            if (LpfDiffAbs > 40) then -- greater than 40 Hz offset skews the frame data
               if (DiffCount + ACQUIRE_STEP < STEPS) then
                  DiffCount <= DiffCount + ACQUIRE_STEP;
               else
                  AcqTrack <= Acquire;
                  DiffCount <= STEPS;   -- saturate high
               end if;
            elsif (DiffCount > TRACK_STEP) then
               DiffCount <= DiffCount - TRACK_STEP;
            else
               AcqTrack <= Track;
               DiffCount <= 5x"00";         -- saturate low
            end if;
         end if;
      end if;
   end process;

   Test_u : STC_Test
      PORT MAP(
         adc_dco_p      => clk,
         adc_dco_n      => clk_n,
         OverRange_p    => '0',
         OverRange_n    => '1',
         adc_data_in_p  => x"00",
         adc_data_in_n  => x"FF",
         ClkOut         => open,
         DataOut        => open,
         OverRange      => open,
         PilotFound     => open,
         Blink          => open
      );
end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity Clk_93_x2 is
      port (
        reset,
        clk_in1,
        clk_186_ce,
        clk_373_ce      : in     std_logic;
        clk_186,
        clk_93P,
        clk_93N,
        clk_373,
        locked           : out    std_logic
      );
END Clk_93_x2;

architecture rtl of Clk_93_x2 is

   signal   clk186,
            clk93    : std_logic := '0';
   signal   ResetDly : SLV4 := x"F";

   begin

   clk_373 <= clk_in1;
   clk_186 <= clk186;
   clk_93P <= clk93;
   clk_93N <= not clk93;
   locked  <= not ResetDly(3);

   process(clk_373)
   begin
      if (rising_edge(clk_373)) then
         clk186 <= not clk186;
      end if;
   end process;

   process(clk186)
   begin
      if (rising_edge(clk186)) then
         clk93 <= not clk93;
         if (reset) then
            ResetDly <= x"F";
         else
            ResetDly <= ResetDly(2 downto 0) & '0';
         end if;
      end if;
   end process;

end rtl;



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity IBUFDS is
   generic (
      DQS_BIAS    : boolean := FALSE  -- (FALSE, TRUE)
   );
   port (
      I,
      IB    : IN  std_logic;
      O     : OUT std_logic
   );

end IBUFDS;

architecture rtl of IBUFDS is

   begin

   O <= I;

end rtl;



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity vio_0 is
   PORT (
      clk         : IN STD_LOGIC;
      probe_out0  : OUT SLV18;
      probe_out1  : OUT SLV18;
      probe_out2  : OUT SLV18;
      probe_out3  : OUT SLV18;
      probe_out4  : OUT SLV18;
      probe_out5  : OUT SLV18;
      probe_out6  : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      probe_out7  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      probe_out8  : OUT SLV18
   );
END vio_0;

architecture rtl of vio_0 is

   signal   reset : slv8 := x"ff";

   begin

   probe_out0  <= 18x"04f58"; --to_slv(to_sfixed(FREQ_RESOLUTION, 10, -7));
   probe_out1  <= 18x"0ce7d"; --to_slv(to_sfixed(1.0/FREQ_RESOLUTION, -6 , -23));
   probe_out2  <= 18x"0a7c5"; --to_slv(to_sfixed(1.0/FREQ_AMBIGUITY, -10, -27));
   probe_out3  <= 18x"16256"; --to_slv(to_sfixed(125000.0/FREQ_RESOLUTION - 1.0 + FN/2.0, 12, -5));
   probe_out4  <= 18x"09d69"; --to_slv(to_sfixed(-125000.0/FREQ_RESOLUTION - 1.0 + FN/2.0, 12, -5));
   probe_out5  <= 18x"0ce7d"; --to_slv(to_sfixed(TSAMPLE_4, -24, -41));
   probe_out6  <= x"400";
   probe_out7  <= '0' & reset(7) & 6x"03";
   probe_out8  <= 18x"0";

   process(clk)
   begin
      if (rising_edge(clk)) then
         reset <= reset (6 downto 0) & '0';
      end if;
   end process;

end rtl;
