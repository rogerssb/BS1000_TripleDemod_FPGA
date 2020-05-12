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

10-25-19 Removed MiscBit selection on TrellisOffset polarity
11-12-19 Removed most MiscBits, Mag0GtMag1 requires 2:1 to switch
12_??-19 Removed Detection Filter from Brik2 module. Changed STC routing to match
12-19-19 Change PilotSync Offset to 9. Changed TrellisOffset in VIO to 0
01-14-20 Add Peaks and DeltaTau outputs for meter, add ReadHold to pause data while reading

-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.all;
use work.Semco_pkg.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

ENTITY STC IS
   GENERIC (
         SIM_MODE    : boolean := false
      );
   PORT(
      ResampleR,
      ResampleI         : IN  SLV18;
      ClocksPerBit      : IN  SLV16;
      HxThreshSlv       : IN  SLV12;
      DacSelect0,
      DacSelect1,
      DacSelect2        : IN  SLV4;
      Clk93,
 --     Clk93Dly,		-- TODO uncomment
      Clk186,
      SpectrumInv,
      ReadHold,
      ValidIn           : IN  STD_LOGIC;
      DataOut,                            -- Trellis Data Output
      ClkOutEn,                           -- Trellis Clock Output
      PilotFound,                         -- Pilot Found LED
      PilotLocked,
      StartOfFrame,
      PhaseDiffEn,
      Dac0ClkEn,
      Dac1ClkEn,
      Dac2ClkEn         : OUT STD_LOGIC;
      PilotOffset       : OUT STD_LOGIC_VECTOR(8 downto 0); -- signed Pilot Detect Offset from center
      DeltaTau          : OUT STD_LOGIC_VECTOR(5 downto 0);
      Peaks             : OUT SLV32;
      Dac0Data,
      Dac1Data,
      Dac2Data          : OUT SLV18;
      HxEstR,
      HxEstI,
      PhaseOut,
      PhaseDiff         : OUT SLV18
   );
END STC;


ARCHITECTURE rtl OF STC IS

   COMPONENT PilotDetectSliding is
    GENERIC (SIM_MODE : boolean := false
   );
      PORT(
         clk,
         clk2x,
         reset,
         reset2x,
         ce,
         SpectrumInv,
         ValidIn        : IN  std_logic;
         ReIn,
         ImIn           : IN  FLOAT_1_18;
         SearchRange    : IN SLV4;
         RawAddr,
         CorrPntr       : OUT ufixed(15 downto 0);
         ReOut,
         ImOut          : OUT FLOAT_1_18;
         PilotOffset    : OUT SFixed(8 downto 0);
         Magnitude0,
         Magnitude1,
         PhaseOut0,
         PhaseOut1,
         MagPeak0,
         PhsPeak0,
         MagPeak1,
         PhsPeak1       : OUT SLV18;
         PilotFound,
         ValidOut,
         StartOut       : OUT std_logic
      );
   end COMPONENT PilotDetectSliding;

   COMPONENT PilotSync
      PORT (
         clk,
         reset,
         ce,
         PilotPulseIn,
         PilotFound,
         ValidIn        : IN STD_LOGIC;
         CorrPntr       : IN ufixed(15 DOWNTO 0);
         Offset         : IN  SLV4;
         RealIn,
         ImagIn         : IN  Float_1_18;
         StartNextFrame : OUT ufixed(15 DOWNTO 0);
         RealOut,
         ImagOut        : OUT Float_1_18;
         StartOut,
         ValidOut    : OUT STD_LOGIC
      );
   END COMPONENT;

   COMPONENT Brik2
      PORT(
         clk186,
         clk93,
         reset,
         reset2x,
         ce,
         StartHPP,
         StartIn,
         ValidIn,
         Mag0GtMag1     : IN  std_logic;
         InR,
         InI            : IN  SLV18;
         H0MagIn,
         H1MagIn        : IN  std_logic_vector(12 downto 0);
         PilotLocked,
         EstimatesDone  : OUT std_logic;
         H0EstR,
         H0EstI,
         H1EstR,
         H1EstI         : OUT STC_PARM;
         m_ndx0,
         m_ndx1         : OUT integer range -5 to 3;
         Mu0,
         Mu1            : OUT FLOAT_1_18;
         PhaseDiff      : OUT sfixed(0 downto -11);
         DeltaTauEst    : OUT sfixed(0 downto -5);
         PhaseOutA,
         PhaseOutB      : OUT SLV12
      );
   END COMPONENT Brik2;

   COMPONENT trellisProcess
      PORT (
       clk,
       clkEnable,
       reset,
       frameStart,
       inputValid,
       estimatesDone    : IN  std_logic;
       dinReal,
       dinImag,
       h0EstRealIn,
       h0EstImagIn,
       h1EstRealIn,
       h1EstImagIn,
       ch0MuIn,
       ch1MuIn          : IN  SLV18;
--       clksPerOutput,					-- TODO uncomment
       m_ndx0,
       m_ndx1           : IN  SLV4;
       deltaTauEstIn    : IN  std_logic_vector(5 downto 0);
       sample0r,
       sample0i         : OUT SLV18;	-- TODO uncomment
       outputEn,
       lastSampleReset,
       full,							-- TODO uncomment
       interpOutEn      : OUT std_logic;
       outputBits       : OUT SLV4
   );
   END COMPONENT TrellisProcess;

   COMPONENT FireberdDrive
      PORT(
         clk,
         reset,
         ce,
         MsbFirst,
         ValidIn        : IN  std_logic;
         RecoveredData  : IN  SLV4;
         ClocksPerBit   : IN  sfixed(0 downto -15);
         DataOut,
         ClkOut         : OUT std_logic
      );
   END COMPONENT FireberdDrive;

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;      -- only needed for ROMs
         ADDR_WIDTH  : positive  := 9;
         FILE_IS_SLV : boolean   := false;    -- nonSLV files are not synthesizable
         LATENCY     : positive  := 1;
         MAX_ADDR    : natural   := 0;
         RAM_TYPE    : string    := "block"  -- or "distributed"
      );
      PORT(
         clk,
         ce,
         reset,
         WrEn           : IN  std_logic;
         WrAddr,
         RdAddrA,
         RdAddrB        : IN  natural range 0 to 2**ADDR_WIDTH-1;
         WrData         : In  std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
         RdOutA,
         RdOutB         : OUT std_logic_vector(DATA_WIDTH-1 DOWNTO 0)
      );
   END COMPONENT RAM_2Reads_1Write;

   COMPONENT Vio2x18
      PORT (
         clk : IN STD_LOGIC;
         probe_out0,
         probe_out1,
         probe_out2,
         probe_out3 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out4,
         probe_out5 :  OUT STD_LOGIC_VECTOR(3 downto 0)
      );
   END COMPONENT;

   COMPONENT vm_cordic_fast IS
      GENERIC (
         n  : positive := 14
      );
      PORT (
         clk,
         ena      : IN  std_logic;
         x,
         y        : IN  std_logic_vector(n-1 downto 0);
         m        : OUT std_logic_vector(n downto 2);
         p        : OUT std_logic_vector(n-2 downto 1);
         enOut    : OUT std_logic
      );
   END COMPONENT vm_cordic_fast;

   COMPONENT  bert_correlator is
        port (
           poly         : IN  std_logic_vector(23 downto 0);
           poly_length  : IN  std_logic_vector(4 downto 0);
           poly_mode,
           reset,
           clock,
           enable,
           lfsr_enable,
           reload,
           data         : IN  std_logic;
           data_bit,
           code_bit     : OUT std_logic
        );
   end component;

  -- Signals
   SIGNAL   ResetSrc          : SLV8 := x"FF";
   SIGNAL   CE,
            Reset,
            Reset2x,
            Reset93,
            Reset186,
            StartOutPS,
            ValidOutPS,
            PilotFoundPD,
            PilotFoundCE,
            PhaseDiffEnPS,
            Mag0GtMag1,
            CordicValid,
            StartInBrik2Dly,
            ValidInBrik2Dly,
            PilotValidOutDly,
            TrellisOutEn,
            interpOutEn,
            lastSampleReset,
            EstimatesDone,
            EstimatesDoneDly  : std_logic;
   SIGNAL   TrellisBits,
            ClkPerTrellis     : SLV4;
   SIGNAL   PhaseDiffEnDly    : SLV8;
   SIGNAL   StartOffset       : SLV16;
   SIGNAL   RealOutPS,
            ImagOutPS,
            InRBrik2Dly,
            InIBrik2Dly,
            H0EstR,
            H0EstI,
            H1EstR,
            H1EstI            : STC_PARM;
   SIGNAL   ResampleR_s,
            ResampleI_s,
            Ch0Mu,
            Ch1Mu             : Float_1_18;
   SIGNAL   PhaseDiff2        : sfixed(0 downto -11);
   SIGNAL   m_ndx0,
            m_ndx1            : integer range -5 to 3 := 0;
   SIGNAL   DeltaTauEst       : sfixed(0 downto -5);
   SIGNAL   Magnitude0,
            PhaseOut0,
            Magnitude1,
            PhaseOut1,
            MagPeak0,
            MagPeak1,
            PhsPeak,
            PhsPeak0,
            PhsPeak1,
            Ch0MuSlv,
            Ch1MuSlv,
            PhsLastPeak       : SLV18;
   SIGNAL   Phase0A,
            Phase0B           : SLV12;
   SIGNAL   StartCount        : integer range 0 to 3 := 0;
   SIGNAL   PilotPulse,
            PilotValidOut     : std_logic;
   SIGNAL   PilotRealOut,
            PilotImagOut      : Float_1_18;
   SIGNAL   RawAddr,
            StartNextFrame,
            StartFrameOffset,
            CorrPntr          : ufixed(15 downto 0);
   signal   BerRange,
            Ber               : natural range 0 to 3200 := 0;
   SIGNAL   ValidData2047,
            ClkOutEnDly,
            pnBitEn,
            dataBit,
            codeBit,
            Reload            : std_logic;
   SIGNAL   deltaTauEstSlv    : std_logic_vector(5 downto 0);
   SIGNAL   PilotOffset_s     : SFixed(8 downto 0);
   SIGNAL   H0Phase,
            H1Phase           : SLV12;
   SIGNAL   H0Mag,
            H1Mag             : std_logic_vector(12 downto 0);
   SIGNAL   H0Mag_u,
            H1Mag_u,
            HxThresh          : ufixed(0 downto -12);
   SIGNAL   CorrPntr8to0      : std_logic_vector(8 downto 0);

-- todo, remove
   SIGNAL   ExpectedData,
            TrellisOffsetSlv,
            m_ndx0Slv,
            m_ndx1Slv         : SLV4;
   SIGNAL   TrellisOffset     : signed(3 downto 0);
   SIGNAL   DataAddr          : ufixed(9 downto 0);
   SIGNAL   DataAddr_i        : natural range 0 to 1023;
   SIGNAL   BitErrors,
            BitError          : natural range 0 to 32000;
   signal   MiscBits,
            HxPhase,
            InRBrik2Ila,
            InIBrik2Ila       : SLV18;
   signal   StartIla,
            ValidIla          : std_logic;
   signal   DacMux            : vector_of_slvs(0 to 15)(17 downto 0);
   signal   DeltaTauEn        : std_logic;

   attribute mark_debug : string;
   attribute mark_debug of EstimatesDone,
                  StartIla, ValidIla, InRBrik2Ila, InIBrik2Ila, PilotFoundCE, PilotFoundPD,
                  PhaseDiff, CorrPntr, m_ndx0Slv, m_ndx1Slv, Mag0GtMag1,
                  H0Phase, H1Phase, H0Mag, H1Mag, deltaTauEstSlv,
                  DataOut, ClkOutEn, ValidData2047 : signal is "true";

BEGIN


   process(Clk186)
   begin
      if (rising_edge(Clk186)) then
-- TODO remove ILAs
         InRBrik2Ila <= to_slv(InRBrik2Dly);
         InIBrik2Ila <= to_slv(InIBrik2Dly);
         StartIla    <= StartInBrik2Dly;
         ValidIla    <= ValidInBrik2Dly;
      end if;
   end process;

   DataAddr_i <= to_integer(DataAddr);
   ReadData : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\Iseed12345678HexData.slv",
         DATA_WIDTH  => 4,
         BINPT       => 0,
         FILE_IS_SLV => true,
         ADDR_WIDTH  => 10,
         MAX_ADDR    => 800,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => Clk186,
         ce          => '1',
         reset       => Reset2x,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => 0,
         RdAddrB     => DataAddr_i,
         WrData      => (others=>'0'),
         RdOutA      => open,
         RdOutB      => ExpectedData
      );

   -- Capture BER info per frame
   CaptureProc : process(Clk186)
      variable CaptureErrors : SLV4;
   begin
      if (rising_edge(Clk186)) then
         if (SIM_MODE) then
            CaptureErrors  := ExpectedData xor TrellisBits;
            if ((EstimatesDone and not EstimatesDoneDly) or Reset2x) then
               DataAddr  <= (others=>'0');
               BitErrors <= 0;
               BitError  <= BitErrors;
            elsif (TrellisOutEn) then
               DataAddr <= resize(DataAddr + 1, DataAddr);
               BitErrors <= BitErrors + count_bits(CaptureErrors);
            end if;
         else
            pnBitEn <= ClkOutEn and not ClkOutEnDly;
            ClkOutEnDly <= ClkOutEn;
            ValidData2047 <= dataBit xnor codeBit;
         if (not EstimatesDone) then
               Reload   <= '0';
               if (pnBitEn and not ValidData2047) then
                  Ber <= Ber + 1;
               end if;
            else
               Ber <= 0;
               if (Ber > 200) then
                  Reload <= '1';
               end if;
            end if;
         end if;
      end if;
   end process;

   CE    <= '1';     -- no need to strobe CE at this point.

   Reset93Process : process(Clk93)
   begin
      if(rising_edge(Clk93)) then
         ResetSrc <= ResetSrc(6 downto 0) & '0';
         Reset93  <= ResetSrc(7);
      end if;
   end process;

   Reset186Process : process(Clk186)
   begin
      if(rising_edge(Clk186)) then
         if not (Clk93) then		-- Clk93Dly  TODO uncomment
            Reset186 <= ResetSrc(7);
         end if;
      end if;
   end process;

   ResetBufg : BUFG
   port map (
      I => Reset93,
      O => Reset
   );

   Reset2Bufg : BUFG
   port map (
      I => Reset186,
      O => Reset2x
   );

   ResampleR_s <= to_sfixed(ResampleR, ResampleR_s);
   ResampleI_s <= to_sfixed(ResampleI, ResampleI_s);

   PD_u : PilotDetectSliding
      GENERIC MAP (
         SIM_MODE => SIM_MODE
      )
      PORT MAP (
         clk            => Clk93,
         clk2x          => Clk186,
         reset          => Reset,
         reset2x        => Reset2x,
         ce             => Ce,
         ValidIn        => ValidIn,
         SpectrumInv    => SpectrumInv,
         ReIn           => ResampleR_s,
         ImIn           => ResampleI_s,
         SearchRange    => x"1",
         -- outputs
         PilotFound     => PilotFoundPD,
         PilotOffset    => PilotOffset_s,
         CorrPntr       => CorrPntr,
         RawAddr        => RawAddr,
         Magnitude0     => Magnitude0,
         Magnitude1     => Magnitude1,
         PhaseOut0      => PhaseOut0,
         PhaseOut1      => PhaseOut1,
         MagPeak0       => MagPeak0,
         PhsPeak0       => PhsPeak0,
         MagPeak1       => MagPeak1,
         PhsPeak1       => PhsPeak1,
         ReOut          => PilotRealOut,
         ImOut          => PilotImagOut,
         ValidOut       => PilotValidOut,
         StartOut       => PilotPulse
   );

   PilotOffset <= to_slv(PilotOffset_s);

   AFC_process : process(Clk186)
   begin
      if (rising_edge(Clk186)) then
         PilotValidOutDly  <= PilotValidOut;
         StartOffset       <= x"0008";
         StartFrameOffset  <= resize(StartNextFrame + ufixed(StartOffset), StartFrameOffset);
         if (Reset2x) then
            PhaseDiffEnDly  <= (others=>'0');
            PhaseDiffEn     <= '0';
         elsif (StartFrameOffset = RawAddr) then
            PhaseDiffEnDly  <= x"01";
         else
            PhaseDiffEnDly  <= PhaseDiffEnDly(6 downto 0) & '0';
            PhaseDiffEn     <= PhaseDiffEnDly(3) or PhaseDiffEnDly(4);  -- needs two clocks wide for 93Mhz domain
         end if;

         if (Reset2x) then
            PhsLastPeak <= (others=>'0');
         elsif (PhaseDiffEnDly(7)) then
            PhsLastPeak <= PhsPeak when (MiscBits(1)) else (others=>'0');
         end if;
      end if;
   end process AFC_process;

   PhaseDiff      <= to_slv(PhaseDiff2) & 6x"00";
   PhaseOut       <= HxPhase when (MiscBits(3)) else to_slv(PhsPeak);  -- Pilot Detect or Channel Est Phase select
   PhsPeak        <= PhsPeak0 when Mag0GtMag1 else PhsPeak1;         -- Pilot Detect Phase select
   HxPhase        <= (H0Phase & 6x"0") when Mag0GtMag1 else (H1Phase & 6X"0");  -- Channel Est Phase select
   StartOfFrame   <= PhaseDiffEn;
   PilotFound     <= PilotFoundPD and PilotFoundCE;

   PS_u : pilotsync
      PORT MAP (
         clk            => Clk186,
         ce             => CE,
         reset          => Reset2x,
         PilotPulseIn   => PilotPulse,
         ValidIn        => PilotValidOut,
         PilotFound     => PilotFound,
         CorrPntr       => CorrPntr,
         StartNextFrame => StartNextFrame,
         Offset         => x"A",
         RealIn         => PilotRealOut,
         ImagIn         => PilotImagOut,
         RealOut        => RealOutPS,     -- 186Mhz
         ImagOut        => ImagOutPS,
         StartOut       => StartOutPS,
         ValidOut       => ValidOutPS
   );
/*
   g1 : if (not SIM_MODE) generate
   VioPhase  : Vio2x18
      PORT MAP (
         clk         => Clk186,
         probe_out0  => open,
         probe_out1  => open,
         probe_out2  => open,
         probe_out3  => MiscBits,
         probe_out4  => TrellisOffsetSlv,
         probe_out5  => ClkPerTrellis
   );
   end generate;
*/
   MiscBits       <= 18x"80F4";
   TrellisOffsetSlv <= x"D";

   TrellisOffset  <= signed(TrellisOffsetSlv);

   InterBrikClk : process(Clk186) is
   begin
      if(rising_edge(Clk186)) then
         if (Reset2x) then
            StartInBrik2Dly <= '0';
            ValidInBrik2Dly <= '0';
            InRBrik2Dly     <= (others=>'0');
            InIBrik2Dly     <= (others=>'0');
         else
            StartInBrik2Dly <= StartOutPS;
            ValidInBrik2Dly <= ValidOutPS;
            InRBrik2Dly     <= RealOutPS;
            InIBrik2Dly     <= ImagOutPS;

         end if;
      end if;
   end process InterBrikClk;

   Brik2_u : Brik2
      PORT MAP(
         clk93          => Clk93,
         Clk186         => Clk186,
         Reset          => Reset,
         Reset2x        => Reset2x,
         CE             => CE,
         StartIn        => StartInBrik2Dly,
         ValidIn        => ValidInBrik2Dly,
         InR            => to_slv(InRBrik2Dly),
         InI            => to_slv(InIBrik2Dly),
         Mag0GtMag1     => Mag0GtMag1,
         H0MagIn        => H0Mag,
         H1MagIn        => H1Mag,
         PhaseOutA      => Phase0A,
         PhaseOutB      => Phase0B,
         PhaseDiff      => PhaseDiff2,
         StartHPP       => CordicValid,
         H0EstR         => H0EstR,
         H0EstI         => H0EstI,
         H1EstR         => H1EstR,
         H1EstI         => H1EstI,
         DeltaTauEst    => DeltaTauEst,
         m_ndx0         => m_ndx0,
         m_ndx1         => m_ndx1,
         Mu0            => Ch0Mu,
         Mu1            => Ch1Mu,
         EstimatesDone  => EstimatesDone,
         PilotLocked    => PilotLocked
      );

   TP_Process : process(Clk186)
   begin
      if (rising_edge(Clk186)) then
         m_ndx0Slv      <= std_logic_vector(TrellisOffset + to_signed(m_ndx0, 4));
         m_ndx1Slv      <= std_logic_vector(TrellisOffset + to_signed(m_ndx1, 4));
         Ch0MuSlv       <= to_slv(Ch0Mu);
         Ch1MuSlv       <= to_slv(Ch1Mu);
         if (SIM_MODE) then
            deltaTauEstSlv <= to_slv(DeltaTauEst) when DeltaTauEn else 6x"00";
         else
            -- deltaTauEstSlv <= to_slv(DeltaTauEst) when MiscBits(12) else 6x"00";
            deltaTauEstSlv <= to_slv(DeltaTauEst);
         end if;
         if (not ReadHold) then
            DeltaTau          <= deltaTauEstSlv;    -- output to meter
            Peaks             <= MagPeak1(15 downto 0) & MagPeak0(15 downto 0);
         end if;
         EstimatesDoneDly  <= EstimatesDone;
         if (Mag0GtMag1) then
            HxEstR <= to_slv(H0EstR);
            HxEstI <= to_slv(H0EstI);
         else
            HxEstR <= to_slv(H1EstR);
            HxEstI <= to_slv(H1EstI);
         end if;
      end if;
   end process;

   Trellis_u : trellisProcess
      PORT MAP (
         clk                  => Clk186,
         clkEnable            => CE,
         reset                => Reset2x,
         estimatesDone        => EstimatesDone and not EstimatesDoneDly,   -- rising edge of 93M clock pulse
         frameStart           => StartInBrik2Dly,
         inputValid           => ValidInBrik2Dly,
         dinReal              => to_slv(InRBrik2Dly),
         dinImag              => to_slv(InIBrik2Dly),
         h0EstRealIn          => to_slv(H0EstR),
         h0EstImagIn          => to_slv(H0EstI),
         h1EstRealIn          => to_slv(H1EstR),
         h1EstImagIn          => to_slv(H1EstI),
         ch0MuIn              => Ch0MuSlv,
         ch1MuIn              => Ch1MuSlv,
         deltaTauEstIn        => deltaTauEstSlv,
--         clksPerOutput        => ClkPerTrellis,	-- TODO uncomment
         m_ndx0               => m_ndx0Slv,
         m_ndx1               => m_ndx1Slv,
         sample0r             => open,
         sample0i             => open,
         interpOutEn          => interpOutEn,
         lastSampleReset      => lastSampleReset,
         full                 => open,
         outputEn             => TrellisOutEn,
         outputBits           => TrellisBits
      );

   FD : FireberdDrive
      PORT MAP(
         clk            => Clk186,
         reset          => Reset2x,
         ce             => CE,
         ValidIn        => TrellisOutEn,
         MsbFirst       => '1',
         RecoveredData  => TrellisBits,
         ClocksPerBit   => to_sfixed(ClocksPerBit, 0, -15),
         DataOut        => DataOut,
         ClkOut         => ClkOutEn
      );

   pn_derand : bert_correlator
      port map (
         poly         => 24x"500",
         poly_length  => 5x"0b",
         poly_mode    => '0',
         reset        => Reset2x,
         clock        => Clk186,
         enable       => pnBitEn, --   clock in data
         lfsr_enable  => pnBitEn, --   gated clock in data
         reload       => Reload,
         data         => DataOut,
         data_bit     => dataBit,
         code_bit     => codeBit
      );

   DacOutputs : process(Clk93)
   begin
      if (rising_edge(Clk93)) then
         Dac0Data   <= DacMux(to_integer(unsigned(DacSelect0)));
         Dac1Data   <= DacMux(to_integer(unsigned(DacSelect1)));
         Dac2Data   <= DacMux(to_integer(unsigned(DacSelect2)));
         Dac0ClkEn  <= '1';
         Dac1ClkEn  <= '1';
         Dac2ClkEn  <= '1';
         DacMux(0)  <= MagPeak1;
         DacMux(1)  <= PhsPeak1;       --
         DacMux(2)  <= m_ndx0Slv & 14x"0";
         DacMux(3)  <= m_ndx1Slv & 14x"0";
         DacMux(4)  <= Phase0A & 6x"0";
         DacMux(5)  <= PhaseOut;
         DacMux(6)  <= PhaseDiff;
         DacMux(7)  <= H0Phase & 6x"0";
         DacMux(8)  <= H1Phase & 6x"0";
         DacMux(9)  <= Magnitude0;                 -- iFFT H0 Magnitude every other sample
         DacMux(10) <= Magnitude1;                 -- H1
         DacMux(11) <= PhaseOut0;                  -- iFFT H0 Phase every other sample
         DacMux(12) <= PhaseOut1;                  -- H1
         DacMux(13) <= MagPeak0;                    -- Peak Magnitude per frame
         DacMux(14) <= PhsPeak0;                    -- Full Pilot Phase at peak magnitude
         DacMux(15) <= PilotOffset & 9x"00";

         CorrPntr8to0 <= to_slv(CorrPntr(8 downto 0));
         if (Reset) then
            Mag0GtMag1 <= '0';
         elsif (H0Mag_u > H1Mag_u sla 1) then
            Mag0GtMag1   <= '1';
         elsif (H1Mag_u > H0Mag_u sla 1) then
            Mag0GtMag1   <= '0';
         end if;
         PilotFoundCE <= '1' when (H0Mag_u > HxThresh) or (H1Mag_u > HxThresh) else '0';  -- about .15 at noise threshold
         if (CordicValid) then
            H0Mag_u  <= to_ufixed(H0Mag, H0Mag_u);
            H1Mag_u  <= to_ufixed(H1Mag, H1Mag_u);
         end if;
      end if;
   end process DacOutputs;

   HxThresh <= to_ufixed('0' & HxThreshSlv, HxThresh);

   cordic0 : vm_cordic_fast
      GENERIC MAP (
         n => 14
      )
      PORT MAP (
         clk   => Clk93,
         ena   => EstimatesDone,
         x     => to_slv(H0EstR(0 downto -13)),
         y     => to_slv(H0EstI(0 downto -13)),
         m     => H0Mag,          -- m[n:2]
         p     => H0Phase,
         enOut => CordicValid
      );

   cordic1 : vm_cordic_fast
      GENERIC MAP (
         n => 14
      )
      PORT MAP (
         clk   => Clk93,
         ena   => EstimatesDone,
         x     => to_slv(H1EstR(0 downto -13)),
         y     => to_slv(H1EstI(0 downto -13)),
         m     => H1Mag,          -- m[n:2]
         p     => H1Phase,
         enOut => open
      );

END rtl;
