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

Module Name: STC.vhd
Description:
   Top level netlist and clock generation.

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
USE IEEE.math_real.all;
library std;
use std.textio.all;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY STC IS
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
      Blink             : OUT std_logic   -- I'm alive Blinking LED
   );
END STC;


ARCHITECTURE rtl OF STC IS

   COMPONENT A2D_Interface IS
      PORT(
         Clk93P,
         Clk93N,
         reset,
         OverRange_p,
         OverRange_n    : IN  std_logic;
         adc_data_in_p,
         adc_data_in_n  : IN  std_logic_vector(7 downto 0);
         a2d_data       : OUT std_logic_vector(15 downto 0);
         OverRange      : OUT std_logic
      );
   END COMPONENT A2D_Interface;

   COMPONENT Clk_93_x2
      port
         (
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
   END COMPONENT;

   COMPONENT vio_0
      PORT (
         clk : IN STD_LOGIC;
         probe_out0 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out1 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out2 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out3 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out4 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out5 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out6 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
         probe_out7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         probe_out8 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
      );
   END COMPONENT vio_0;

   COMPONENT Brik1
      PORT(
         clk,
         clk2x,
         reset,
         ce,
         validin        : IN  std_logic;
         Variables      : IN  RecordType;
         a2d_data       : IN  std_logic_vector(17 downto 0);
         realout,
         imagout        : OUT Float_1_18;
         validout,
         PilotFound,
         startout       : OUT std_logic
      );
   END COMPONENT Brik1;

   COMPONENT Brik2
      PORT(
         clk,
         reset,
         ce             : IN  std_logic;
         Variables      : IN  RecordType;
         StartIn,
         ValidIn        : IN  std_logic;
         FreqIn,  -- TODO
         InR,
         InI            : IN  std_logic_vector(17 downto 0);
         TrellisEn,
         TrellisStart   : OUT std_logic;
         H0EstR,
         H0EstI,
         H1EstR,
         H1EstI,
         InterpO_R0,
         InterpO_I0,
         InterpO_R1,
         InterpO_I1     : OUT STC_PARM;
         DeltaTauEst    : OUT sfixed(0 downto -5)
      );
   END COMPONENT Brik2;

   COMPONENT TrellisDetector is
      PORT (
         clk,
         clkEn,
         reset,
         sampleEn,
         startFrame              : std_logic;
         h0EstReal,
         h0EstImag,
         h1EstReal,
         h1EstImag,
         in0Real,
         in0Imag,
         in1Real,
         in1Imag              : IN  std_logic_vector(17 downto 0);
         deltaTauEst          : IN  std_logic_vector(5 downto 0);
         finalMetricOutputEn,
         outputEn             : OUT std_logic;
         finalMetric          : OUT std_logic_vector(17 downto 0);
         outputBits           : OUT std_logic_vector(3 downto 0)
      );
   END COMPONENT TrellisDetector;

   COMPONENT FireberdDrive IS
      PORT(
         clk,
         reset,
         ce,
         MsbFirst,
         ValidIn        : IN  std_logic;
         RecoveredData  : IN  SLV4;
         DataOut,
         ClkOut         : OUT std_logic
      );
   END COMPONENT FireberdDrive;

  -- Signals
   SIGNAL   Probe7         : std_logic_vector(7 downto 0);
   SIGNAL   ce,
            clk,
            reset,
            clk2x,
            Clk93P,
            Clk93N,
            ValidIn,
            StartInBrik2,
            ValidInBrik2,
            StartInBrik2Dly,
            ValidInBrik2Dly,
            TrellisEn,
            finalMetricOutputEn,
            TrellisOutEnRaw,
            TrellisOutEn,
            TrellisStart,
            Locked,
            adc_dco           : std_logic;
   SIGNAL   a2d_data          : std_logic_vector(15 downto 0);
   SIGNAL   FinalMetric,
            FreqResolution,
            OneOverFreqRes,
            OneOverFreqAmb,
            IndexP125K,
            IndexN125K,
            TSample,
            Probe8            : std_logic_vector(17 downto 0);
   SIGNAL   TrellisBitsRaw,
            TrellisBits       : std_logic_vector(3 downto 0);
   SIGNAL   PilotSyncOffset   : std_logic_vector(11 downto 0);
   signal   LedFlash          : unsigned(27 downto 0);
   SIGNAL   Variables         : RecordType := c_RecordType;
   SIGNAL   InRBrik2,
            InIBrik2,
            InRBrik2Dly,
            InIBrik2Dly,
            H0EstR,
            H0EstI,
            H1EstR,
            H1EstI,
            InterpO_R0,
            InterpO_I0,
            InterpO_R1,
            InterpO_I1        : STC_PARM;
   SIGNAL   DeltaTauEst       : sfixed(0 downto -5);

-- todo, remove
   SIGNAL   H0R, H0I, H1R, H1I  : std_logic_vector(17 downto 0);
   attribute mark_debug : string;
   attribute mark_debug of TrellisBits       : signal is "true";
   attribute mark_debug of TrellisOutEn      : signal is "true";
   attribute mark_debug of TrellisStart      : signal is "true";
   attribute mark_debug of DataOut           : signal is "true";
   attribute mark_debug of ClkOut            : signal is "true";
   attribute mark_debug of StartInBrik2Dly   : signal is "true";
--   attribute mark_debug of ValidInBrik2Dly   : signal is "true";
--   attribute mark_debug of InRBrik2Dly       : signal is "true";
--   attribute mark_debug of InIBrik2Dly       : signal is "true";

BEGIN

   IBUFDS_inst : IBUFDS
   generic map (
      DQS_BIAS => "FALSE"  -- (FALSE, TRUE)
   )
   port map (
      I  => adc_dco_p,  -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
      IB => adc_dco_n,  -- 1-bit input: Diff_n buffer input (connect directly to top-level port)
      O  => adc_dco     -- 1-bit output: Buffer output
   );

   Clks : Clk_93_x2
      port map (
         -- Clock in ports
         clk_in1     => adc_dco,
         -- Status and control signals
         reset       => '0',--reset_in,
         locked      => Locked,
         clk_186_ce  => ce,
         clk_373_ce  => ce,
         -- Clock out ports
         clk_186     => clk,
         clk_93P     => clk93p,
         clk_93N     => clk93n,
         clk_373     => clk2x
   );

   A2D_In : A2D_Interface
      PORT MAP(
         Clk93P         => Clk93P,
         Clk93N         => Clk93N,
         reset          => reset,
         adc_data_in_p  => adc_data_in_p,
         adc_data_in_n  => adc_data_in_n,
         OverRange_p    => OverRange_p,
         OverRange_n    => OverRange_n,
         a2d_data       => a2d_data,
         OverRange      => OverRange
   );

   reset <= not Locked; -- TODO?? '0'; routes better without reset
   ce <= '1';     -- no need to strobe ce at this point.
   Blink <= LedFlash(LedFlash'left);

   ValidProcess : process(clk) is
   begin
      if(rising_edge(clk)) then
         if (reset) then
            ValidIn <= '0';
         else
            ValidIn <= not ValidIn;    -- simulated A/D data on every other clock
            LedFlash <= LedFlash + 1;
         end if;
      end if;
   end process ValidProcess;

   conjugate_u : vio_0
      PORT MAP (
         clk => clk,
         probe_out0 => FreqResolution,
         probe_out1 => OneOverFreqRes,
         probe_out2 => OneOverFreqAmb,
         probe_out3 => IndexP125K,
         probe_out4 => IndexN125K,
         probe_out5 => TSample,
         probe_out6 => PilotSyncOffset,
         probe_out7 => Probe7,
         probe_out8 => Probe8
   );

--   Variables.FreqResolution   <= to_sfixed(FreqResolution, 17, 0);
--   Variables.OneOverFreqRes   <= to_sfixed(OneOverFreqRes, 17, 0);
--   Variables.OneOverFreqAmb   <= to_sfixed(OneOverFreqAmb, 17, 0);
--   Variables.IndexP125K       <= to_sfixed(IndexP125K,     17, 0);
--   Variables.IndexN125K       <= to_sfixed(IndexN125K,     17, 0);
--   Variables.TSample          <= to_sfixed(TSample,        17, 0);
   Variables.Conjugate        <= Probe7(0);   -- needs to be high for live radio data
   Variables.PilotSyncOffset  <= to_ufixed(PilotSyncOffset, Variables.PilotSyncOffset);


   Brik1_u : Brik1
      PORT MAP(
         clk         => clk,
         clk2x       => clk2x,
         reset       => reset,
         ce          => ce,
         Variables   => Variables,
         a2d_data    => a2d_data & "00",  -- sixteen bit A/D
         validin     => ValidIn,
         realout     => InRBrik2,
         imagout     => InIBrik2,
         validout    => ValidInBrik2,
         startout    => StartInBrik2,
         PilotFound  => PilotFound
      );

   InterBrikClk : process(clk) is
   begin
      if(rising_edge(clk)) then
         if (reset) then
            StartInBrik2Dly <= '0';
            ValidInBrik2Dly <= '0';
            InRBrik2Dly     <= (others=>'0');
            InIBrik2Dly     <= (others=>'0');
         else
            StartInBrik2Dly <= StartInBrik2;
            ValidInBrik2Dly <= ValidInBrik2;
            InRBrik2Dly     <= InRBrik2;
            InIBrik2Dly     <= InIBrik2;
         end if;
      end if;
   end process InterBrikClk;

   Brik2_u : Brik2
      PORT MAP(
         clk            => clk,
         reset          => reset,
         ce             => ce,
         Variables      => Variables,
         StartIn        => StartInBrik2Dly,
         ValidIn        => ValidInBrik2Dly,
         InR            => to_slv(InRBrik2Dly),
         InI            => to_slv(InIBrik2Dly),
         TrellisEn      => TrellisEn,
         TrellisStart   => TrellisStart,
         FreqIn         => FreqResolution,   -- TODO Remove
         H0EstR         => H0EstR,
         H0EstI         => H0EstI,
         H1EstR         => H1EstR,
         H1EstI         => H1EstI,
         InterpO_R0     => InterpO_R0,
         InterpO_I0     => InterpO_I0,
         InterpO_R1     => InterpO_R1,
         InterpO_I1     => InterpO_I1,
         DeltaTauEst    => DeltaTauEst
      );

   Trellis_u : TrellisDetector
      PORT MAP (
         clk                  => clk,
         clkEn                => ce,
         reset                => reset,
         sampleEn             => TrellisEn,
         startFrame           => trellisStart,
         h0EstReal            => to_slv(H0EstR),
         h0EstImag            => to_slv(H0EstI),
         h1EstReal            => to_slv(H1EstR),
         h1EstImag            => to_slv(H1EstI),
         in0Real              => to_slv(InterpO_R0),
         in0Imag              => to_slv(InterpO_I0),
         in1Real              => to_slv(InterpO_R1),
         in1Imag              => to_slv(InterpO_I1),
         deltaTauEst          => to_slv(DeltaTauEst),
         finalMetricOutputEn  => FinalMetricOutputEn,
         outputEn             => TrellisOutEnRaw,
         finalMetric          => FinalMetric,
         outputBits           => TrellisBitsRaw
      );

   TrellisProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            TrellisOutEn <= '0';
            TrellisBits  <= x"0";
         elsif (ce) then
            TrellisOutEn <= TrellisOutEnRaw;
            TrellisBits  <= TrellisBitsRaw;
         end if;
      end if;
   end process TrellisProcess;

   FD : FireberdDrive
      PORT MAP(
         clk            => clk,
         reset          => reset,
         ce             => ce,
         MsbFirst       => Probe7(1),
         ValidIn        => TrellisOutEn,
         RecoveredData  => TrellisBits,
         DataOut        => DataOut,
         ClkOut         => ClkOut
      );

END rtl;
