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
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY STC IS
   PORT(
      ResampleR,
      ResampleI         : IN  SLV18;
      ClocksPerBit      : IN  SLV16;
      Clk93,
      Clk186,
      Clk373,
      ValidIn           : IN  std_logic;
      ClkOut,                 -- FireBerd Clock Output
      DataOut,                -- FireBerd Data Output
      OverRange,              -- A/D input over range
      PilotFound,             -- Pilot Found LED
      PilotLocked,            -- Pilot locked LED
      Blink             : OUT std_logic   -- I'm alive Blinking LED
   );
END STC;


ARCHITECTURE rtl OF STC IS
/*
   COMPONENT Clk_93_x2
      port
         (
        Reset,
        clk_in1,
        clk_186_ce,
        clk_373_ce      : in     std_logic;
        clk_186,
        clk_373,
        locked           : out    std_logic
      );
   END COMPONENT;
*/
   COMPONENT vio_0
      PORT (
         Clk : IN STD_LOGIC;
         probe_out0 : OUT SLV18;
         probe_out1 : OUT SLV18;
         probe_out2 : OUT SLV18;
         probe_out3 : OUT SLV18;
         probe_out4 : OUT SLV18;
         probe_out5 : OUT SLV18;
         probe_out6 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
         probe_out7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         probe_out8 : OUT SLV18;
         probe_out9 : out SLV32
      );
   END COMPONENT vio_0;

   COMPONENT Brik1
      PORT(
         Clk,
         Clk2x,
         Reset,
         Reset2x,
         CE,
         validin        : IN  std_logic;
         Variables      : IN  RecordType;
         ResampleR,
         ResampleI      : IN  Float_1_18;
         realout,
         imagout        : OUT Float_1_18;
         validout,
         PilotFound,
         PilotLocked,
         startout       : OUT std_logic
      );
   END COMPONENT Brik1;

   COMPONENT Brik2
      PORT(
         Clk,
         Reset,
         CE             : IN  std_logic;
         Variables      : IN  RecordType;
         StartIn,
         ValidIn        : IN  std_logic;
         FreqIn         : IN  Float_128k; -- TODO remove line
         InR,
         InI            : IN  SLV18;
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
         Clk,
         clkEn,
         Reset,
         sampleEn,
         startFrame              : std_logic;
         h0EstReal,
         h0EstImag,
         h1EstReal,
         h1EstImag,
         in0Real,
         in0Imag,
         in1Real,
         in1Imag              : IN  SLV18;
         deltaTauEst          : IN  std_logic_vector(5 downto 0);
         finalMetricOutputEn,
         outputEn             : OUT std_logic;
         finalMetric          : OUT SLV18;
         outputBits           : OUT std_logic_vector(3 downto 0)
      );
   END COMPONENT TrellisDetector;

   COMPONENT FireberdDrive IS
      PORT(
         Clk,
         Reset,
         CE,
         MsbFirst,
         ValidIn        : IN  std_logic;
         ClocksPerBit   : IN  SLV16;
         RecoveredData  : IN  SLV4;
         DataOut,
         ClkOut         : OUT std_logic
      );
   END COMPONENT FireberdDrive;

  -- Signals
   SIGNAL   CE,
            Clk,
            Reset,
            Reset2x,
            ResetSrc,
            Clk2x,

            StartInBrik2,
            ValidInBrik2,
            StartInBrik2Dly,
            ValidInBrik2Dly,
            TrellisEn,
            finalMetricOutputEn,
            TrellisOutEnRaw,
            TrellisOutEn,
            TrellisStart,
            TrellisSkip,
            Locked,
            adc_dco           : std_logic;
   SIGNAL   a2d_data          : std_logic_vector(15 downto 0);
   SIGNAL   FinalMetric,
            FreqResolution,
            OneOverFreqRes,
            OneOverFreqAmb,
            IndexP125K,
            IndexN125K,
            TSample           : SLV18;
   SIGNAL   MiscBits          : SLV8;
   SIGNAL   ResampleRatio     : SLV32;
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
   SIGNAL   ResampleR_s,
            ResampleI_s       : Float_1_18;
   SIGNAL   DeltaTauEst       : sfixed(0 downto -5);

-- todo, remove
   signal   InRBrik2Ila,
            InIBrik2Ila       : sfixed(17 downto 0);
   signal   StartIla,
            ValidIla          : std_logic;
   signal   TrellisCount      : natural range 0 to 3300;

   attribute mark_debug : string;
   attribute mark_debug of TrellisBits       : signal is "true";
   attribute mark_debug of TrellisOutEn      : signal is "true";
   attribute mark_debug of TrellisStart      : signal is "true";
   attribute mark_debug of TrellisCount      : signal is "true";
   attribute mark_debug of TrellisSkip       : signal is "true";
   attribute mark_debug of DataOut           : signal is "true";
   attribute mark_debug of ClkOut            : signal is "true";
   attribute mark_debug of StartIla          : signal is "true";
   attribute mark_debug of ValidIla          : signal is "true";
   attribute mark_debug of InRBrik2Ila       : signal is "true";
   attribute mark_debug of InIBrik2Ila       : signal is "true";

BEGIN

-- TODO remove ILAs
   process(Clk)
   begin
      if (rising_edge(Clk)) then
         InRBrik2Ila <= InRBrik2Dly;
         InIBrik2Ila <= InIBrik2Dly;
         StartIla    <= StartInBrik2Dly;
         ValidIla    <= ValidInBrik2Dly;
      end if;
   end process;
/*
   Clks : Clk_93_x2
      port map (
         -- Clock in ports
         clk_in1     => Clk93In, --adc_dco,
         -- Status and control signals
         Reset       => '0',--reset_in,
         locked      => Locked,
         clk_186_ce  => CE,
         clk_373_ce  => CE,
         -- Clock out ports
         clk_186     => Clk,
         clk_373     => Clk2x
   );
*/
   Clk   <= Clk186;
   Clk2x <= Clk373;
   CE    <= '1';     -- no need to strobe CE at this point.
   Blink <= LedFlash(LedFlash'left);
   ResetSrc <= '0'; -- routes better without Reset

   Reset2xProcess : process(Clk2x)
   begin
      if(rising_edge(Clk2x)) then
         Reset2x <= ResetSrc;
      end if;
   end process;

   ValidProcess : process(Clk) is
   begin
      if(rising_edge(Clk)) then
         Reset <= ResetSrc;
         LedFlash <= LedFlash + 1;
         Variables.FreqResolution   <= to_sfixed(FreqResolution,  10, -7);    -- x04F58
         Variables.OneOverFreqRes   <= to_sfixed(OneOverFreqRes, -6,  -23);   -- x0CE7D
         Variables.OneOverFreqAmb   <= to_sfixed(OneOverFreqAmb, -10, -27);   -- x0A7C5
         Variables.IndexP125K       <= to_sfixed(IndexP125K,      12, -5);    -- x16256
         Variables.IndexN125K       <= to_sfixed(IndexN125K,      12, -5);    -- x09D69
         Variables.TSample          <= to_sfixed(TSample,        -24, -41);   -- x0CE7D
         Variables.PilotSyncOffset  <= to_ufixed(PilotSyncOffset, Variables.PilotSyncOffset); -- x5FF
         Variables.MiscBits         <= MiscBits;   -- bit 0 needs to be high for live radio data
      end if;
   end process ValidProcess;

   conjugate_u : vio_0
      PORT MAP (
         Clk => Clk,
         probe_out0 => FreqResolution,
         probe_out1 => OneOverFreqRes,
         probe_out2 => OneOverFreqAmb,
         probe_out3 => IndexP125K,
         probe_out4 => IndexN125K,
         probe_out5 => TSample,
         probe_out6 => PilotSyncOffset,
         probe_out7 => MiscBits,
         probe_out8 => open,
         probe_out9 => ResampleRatio
      );

   ResampleR_s <= to_sfixed(ResampleR, ResampleR_s);
   ResampleI_s <= to_sfixed(ResampleI, ResampleI_s);

   Brik1_u : Brik1
      PORT MAP(
         Clk         => Clk,
         Clk2x       => Clk2x,
         Reset       => Reset,
         Reset2x     => Reset2x,
         CE          => CE,
         Variables   => Variables,
         ResampleR   => ResampleR_s,
         ResampleI   => ResampleI_s,
         validin     => ValidIn,
         realout     => InRBrik2,
         imagout     => InIBrik2,
         validout    => ValidInBrik2,
         startout    => StartInBrik2,
         PilotFound  => PilotFound,
         PilotLocked => PilotLocked
      );

   InterBrikClk : process(Clk) is
   begin
      if(rising_edge(Clk)) then
         if (Reset) then
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
         Clk            => Clk,
         Reset          => Reset,
         CE             => CE,
         Variables      => Variables,
         StartIn        => StartInBrik2Dly,
         ValidIn        => ValidInBrik2Dly,
         FreqIn         => to_sfixed(FreqResolution & 7x"00", Float_zero_128K), --TODO, remove line
         InR            => to_slv(InRBrik2Dly),
         InI            => to_slv(InIBrik2Dly),
         TrellisEn      => TrellisEn,
         TrellisStart   => TrellisStart,
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
         Clk                  => Clk,
         clkEn                => CE,
         Reset                => Reset,
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

   TrellisProcess : process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            TrellisSkip  <= '0';
            TrellisOutEn <= '0';
            TrellisBits  <= x"0";
            TrellisCount <= 0;
         elsif (CE) then
            if (TrellisStart) then  -- ignore the first trellis output
               TrellisSkip <= '1';
               TrellisCount <= 0;
            elsif (TrellisOutEnRaw) then
               TrellisSkip <= '0';
            end if;
            if (TrellisOutEn = '1') and (TrellisCount < 3300) then
               TrellisCount <= TrellisCount + 1;
            end if;
            TrellisOutEn <= TrellisOutEnRaw and not TrellisSkip;
            TrellisBits  <= TrellisBitsRaw;
         end if;
      end if;
   end process TrellisProcess;

   FD : FireberdDrive
      PORT MAP(
         Clk            => Clk,
         Reset          => Reset,
         CE             => CE,
         ClocksPerBit   => ClocksPerBit,
         MsbFirst       => Variables.MiscBits(MSB_FIRST),
         ValidIn        => TrellisOutEn,
         RecoveredData  => TrellisBits,
         DataOut        => DataOut,
         ClkOut         => ClkOut
      );


END rtl;
