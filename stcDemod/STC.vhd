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
use work.Semco_pkg.ALL;

ENTITY STC IS
   GENERIC (
         SIM_MODE    : boolean := false
      );
   PORT(
      ResampleR,
      ResampleI         : IN  SLV18;
      ClocksPerBit      : IN  SLV16;
      PilotSyncOffset   : IN  SLV12;
      DacSelect0,
      DacSelect1,
      DacSelect2        : IN  SLV4;
      Clk93,
      Clk186,
      SpectrumInv,
      ValidIn           : IN  std_logic;
      DataOut,                            -- Trellis Data Output
      ClkOutEn,                           -- Trellis Clock Output
      PilotFound,                         -- Pilot Found LED
      PilotLocked,
      TrellisFull,
      PhaseDiffEn,
      Dac0ClkEn,
      Dac1ClkEn,
      Dac2ClkEn         : OUT std_logic;
      Dac0Data,
      Dac1Data,
      Dac2Data          : OUT SLV18;
      PhaseDiff         : OUT std_logic_vector(17 downto 0)
   );
END STC;


ARCHITECTURE rtl OF STC IS

   COMPONENT PilotDetect is
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
         PilotIndex     : OUT ufixed(10 downto 0);
         ReOut,
         ImOut          : OUT FLOAT_1_18;
         Magnitude0,
         Magnitude1,
         PhaseOut0,
         PhaseOut1,
         Mag0Peak,
         Mag1Peak,
         Phs0Peak,
         Phs1Peak       : OUT SLV18;
         PilotFound,
         PilotTime,
         ValidOut,
         StartOut       : OUT std_logic
      );
   end COMPONENT PilotDetect;
/*
   COMPONENT pilotsync
      PORT (
         clk,
         reset,
         ce,
         PilotPulseIn,
         Mag0GtMag1,
         ValidIn        : IN STD_LOGIC;
         PilotSyncOffset : IN  natural range 0 to 4095;
         IndexIn        : IN ufixed(10 DOWNTO 0);
         RealIn,
         ImagIn         : IN  Float_1_18;
         PhaseOut       : OUT SLV18;
         RealOut,
         ImagOut,
         PhaseDiff      : OUT Float_1_18;
         StartOut,
         PhaseDiffEn,
         ValidOut,
         PilotLocked    : OUT STD_LOGIC
      );
   END COMPONENT;
*/
   COMPONENT PilotSyncOverTwoPackets
      PORT (
         clk,
         reset,
         ce,
         PilotPulseIn,
         PilotTime,
         Mag0GtMag1,
         ValidIn        : IN STD_LOGIC;
         PilotSyncOffset : IN  natural range 0 to 4095;
         IndexIn        : IN ufixed(10 DOWNTO 0);
         RealIn,
         ImagIn         : IN  Float_1_18;
         RdAddrDiff,
         PhaseOut       : OUT SLV18;
         RealOut,
         ImagOut,
         PhaseDiff      : OUT Float_1_18;
         StartOut,
         PhaseDiffEn,
         ValidOut,
         PilotLocked    : OUT STD_LOGIC
      );
   END COMPONENT;

   COMPONENT Brik2
      PORT(
         clk,
         reset,
         ce             : IN  std_logic;
         StartIn,
         ValidIn        : IN  std_logic;
         InR,
         InI            : IN  SLV18;
         EstimatesDone   : OUT std_logic;
         H0EstR,
         H0EstI,
         H1EstR,
         H1EstI         : OUT STC_PARM;
         m_ndx0,
         m_ndx1         : OUT integer range -5 to 3;
         Mu0,
         Mu1            : OUT FLOAT_1_18;
         DeltaTauEst    : OUT sfixed(0 downto -5)
      );
   END COMPONENT Brik2;

   COMPONENT trellisProcess
      PORT (
       clk,
       clk2x,
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
       m_ndx0,
       m_ndx1           : IN  SLV4;
       deltaTauEstIn    : IN  std_logic_vector(5 downto 0);
       sample0r,
       sample0i         : OUT SLV18;
       outputEn,
       lastSampleReset,
       full,
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
         probe_out0 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out1 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out2 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out3 : OUT STD_LOGIC_VECTOR(0 downto 0);
         probe_out4 : OUT STD_LOGIC_VECTOR(3 downto 0)
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
            Clk,
            Clk2x,
            Reset,
            Reset2x,
            StartOutPS,
            ValidOutPS,
            StartOutPSB,
            ValidOutPSB,
            PhaseDiffEnPS,
            PhaseDiffEnPSA,
            PhaseDiffEnPSB,
            PilotLockedA,
            PilotLockedB,
            Mag0GtMag1,
            StartInBrik2Dly,
            ValidInBrik2Dly,
            PilotValidOutDly,
            TrellisOutEn,
            interpOutEn,
            lastSampleReset,
            EstimatesDone     : std_logic;
   SIGNAL   TrellisBits       : std_logic_vector(3 downto 0);
   SIGNAL   RealOutPS,
            ImagOutPS,
            RealOutPSB,
            ImagOutPSB,
            InRBrik2Dly,
            InIBrik2Dly,
            H0EstR,
            H0EstI,
            H1EstR,
            H1EstI            : STC_PARM;
   SIGNAL   ResampleR_s,
            ResampleI_s,
            Ch0Mu,
            Ch1Mu,
            PhaseDiff1,
            PhaseDiff2,
            PhaseDiff2A,
            PhaseDiff2B,
            PhaseDiff1xGain,
            PhaseDiff2xGain,
            PhaseDiff2Offset : Float_1_18;
   SIGNAL   PhaseDiff1Gain,
            PhaseDiff2Gain     : sfixed(9 downto -8);
   SIGNAL   m_ndx0,
            m_ndx1            : integer range -5 to 3 := 0;
   SIGNAL   DeltaTauEst       : sfixed(0 downto -5);
   SIGNAL   Magnitude0,
            Magnitude1,
            PhaseOut0,
            PhaseOut1,
            Mag0Peak,
            Mag1Peak,
            Phs0Peak,
            Phs1Peak,
            Phs0LastPeak,
            Phs1LastPeak,
            PhaseDiffGain1Slv,
            PhaseDiffGain2Slv,
            PhaseDiffOffsetSlv,
            PhaseDiffGain1Slv1,
            PhaseDiffGain2Slv1,
            PhaseDiffOffsetSlv1,
            Phase2,
            Phase2A,
            Phase2B,
            RdAddrDiff,
            PhaseDiffSlv,
            PhaseDiff1xGainSlv,
            PhaseDiff2xGainSlv,
            StartDac2Data     : SLV18;
   SIGNAL   StartCount        : integer range 0 to 3 := 0;
   SIGNAL   PilotPulse,
            PilotTime,
            PilotValidOut     : std_logic;
   SIGNAL   PilotRealOut,
            PilotImagOut      : Float_1_18;
   SIGNAL   PilotIndex        : ufixed(10 downto 0);
   signal   PnDelay           : natural range 0 to 255 := 0;
   SIGNAL   ValidData2047,
            ClkOutEnDly,
            pnBitEn,
            dataBit,
            codeBit           : std_logic;

-- todo, remove
   SIGNAL   H0Phase           : std_logic_vector(15 downto 0);
   SIGNAL   ExpectedData,
            TrellisOffsetSlv,
            m_ndx0Slv,
            m_ndx1Slv         : SLV4;
   SIGNAL   TrellisOffset     : signed(3 downto 0);
   SIGNAL   DataAddr          : integer range 0 to 800;
   SIGNAL   Bert,
            BitErrors         : natural range 0 to 3200;
   signal   sample0r,
            sample0i,
            InRBrik2Ila,
            InIBrik2Ila       : SLV18;
   signal   StartIla,
            ValidIla          : std_logic;
   signal   PilotSel          : std_logic_vector(0 downto 0);
   signal   DacMux            : vector_of_slvs(0 to 15)(17 downto 0);

   attribute mark_debug : string;
   attribute mark_debug of TrellisBits, TrellisOutEn, EstimatesDone,
                  DataOut, ClkOutEn, StartIla, ValidIla, InRBrik2Ila, InIBrik2Ila,
                  Bert, BitErrors, lastSampleReset, TrellisFull, PhaseDiff2xGainSlv,
                  PhaseDiff1xGainSlv, PhaseDiffSlv,
                  m_ndx0Slv, m_ndx1Slv, ValidData2047 : signal is "true";

BEGIN


   process(Clk)
   begin
      if (rising_edge(Clk)) then
-- TODO remove ILAs
   PhaseDiff1xGainSlv <= to_slv(PhaseDiff1xGain);
   PhaseDiff2xGainSlv <= to_slv(PhaseDiff2xGain);
   PhaseDiffSlv       <= to_slv(PhaseDiff);
         InRBrik2Ila <= to_slv(InRBrik2Dly);
         InIBrik2Ila <= to_slv(InIBrik2Dly);
         StartIla    <= StartInBrik2Dly;
         ValidIla    <= ValidInBrik2Dly;
      end if;
   end process;

   ReadData : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC\Iseed12345678HexData.slv",
         DATA_WIDTH  => 4,
         BINPT       => 0,
         FILE_IS_SLV => true,
         ADDR_WIDTH  => 10,
         MAX_ADDR    => 800,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => Clk2x,
         ce          => '1',
         reset       => Reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => 0,
         RdAddrB     => DataAddr,
         WrData      => (others=>'0'),
         RdOutA      => open,
         RdOutB      => ExpectedData
      );

   -- Capture BER info per frame
   CaptureProc : process(Clk2x)
      variable CaptureErrors : SLV4;
   begin
      if (rising_edge(Clk2x)) then
         CaptureErrors  := ExpectedData xor TrellisBits;
         if (lastSampleReset) then
            DataAddr  <= 0;
            Bert      <= BitErrors;
            BitErrors <= 0;
         elsif (TrellisOutEn) then
            DataAddr <= DataAddr + 1;
            BitErrors <= BitErrors + count_bits(CaptureErrors);
         end if;
      end if;
   end process;

   Clk   <= Clk93;
   Clk2x <= Clk186;
   CE    <= '1';     -- no need to strobe CE at this point.

   ResetProcess : process(Clk)
   begin
      if(rising_edge(Clk)) then
         ResetSrc <= ResetSrc(6 downto 0) & '0';
         Reset    <= ResetSrc(7);
      end if;
   end process;

   Reset2xProcess : process(Clk2x)
   begin
      if(rising_edge(Clk2x)) then
         Reset2x <= ResetSrc(7);
      end if;
   end process;

   ResampleR_s <= to_sfixed(ResampleR, ResampleR_s);
   ResampleI_s <= to_sfixed(ResampleI, ResampleI_s);

   PD_u : PilotDetect
      GENERIC MAP (
         SIM_MODE => SIM_MODE
      )
      PORT MAP (
         clk            => Clk,
         clk2x          => Clk2x,
         reset          => Reset,
         reset2x        => Reset2x,
         ce             => Ce,
         ValidIn        => ValidIn,
         SpectrumInv    => SpectrumInv,
         ReIn           => ResampleR_s,
         ImIn           => ResampleI_s,
         -- outputs
         PilotFound     => PilotFound,    -- not used
         PilotIndex     => PilotIndex,
         Magnitude0     => Magnitude0,
         Magnitude1     => Magnitude1,
         PhaseOut0      => PhaseOut0,
         PhaseOut1      => PhaseOut1,
         Mag0Peak       => Mag0Peak,
         Mag1Peak       => Mag1Peak,
         Phs0Peak       => Phs0Peak,
         Phs1Peak       => Phs1Peak,
         ReOut          => PilotRealOut,
         ImOut          => PilotImagOut,
         ValidOut       => PilotValidOut,
         PilotTime      => PilotTime,
         StartOut       => PilotPulse
   );

   AFC_process : process(Clk2x)
   begin
      if (rising_edge(Clk2x)) then
         PilotValidOutDly  <= PilotValidOut;
         PhaseDiffGain1Slv1  <= PhaseDiffGain1Slv; -- the slv to slv transfer are to make the ILA unconfused
         PhaseDiffGain2Slv1  <= PhaseDiffGain2Slv;
         PhaseDiffOffsetSlv1 <= PhaseDiffOffsetSlv;
         PhaseDiff1Gain    <= to_sfixed(PhaseDiffGain1Slv1, PhaseDiff1Gain);
         PhaseDiff2Gain    <= to_sfixed(PhaseDiffGain2Slv1, PhaseDiff2Gain);
         PhaseDiff2Offset  <= to_sfixed(PhaseDiffOffsetSlv1, PhaseDiff2Offset);
         if (Reset) then
            Phs0LastPeak <= (others=>'0');
            Phs1LastPeak <= (others=>'0');
            PhaseDiff    <= (others=>'0');
            PhaseDiffEn  <= '0';
         elsif (StartOutPS) then
            if (StartCount = 0) then
               if (Mag0GtMag1) then
                  PhaseDiff1 <= resize(to_sfixed(Phs0Peak, PhaseDiff1) - to_sfixed(Phs0LastPeak, PhaseDiff1), PhaseDiff1);
               else
                  PhaseDiff1 <= resize(to_sfixed(Phs1Peak, PhaseDiff1) - to_sfixed(Phs1LastPeak, PhaseDiff1), PhaseDiff1);
               end if;
               PhaseDiff1xGain <= resize(PhaseDiff1 * PhaseDiff1Gain, PhaseDiff1xGain);
               PhaseDiff <= std_logic_vector(resize(PhaseDiff1xGain + PhaseDiff2xGain, 0, -17));
               Phs0LastPeak <= Phs0Peak;
               Phs1LastPeak <= Phs1Peak;
               PhaseDiffEn <= '1';
            end if;
            StartCount <= 3;
         elsif (PilotValidOut and not PilotValidOutDly) then
            if (StartCount > 0) then
               StartCount <= StartCount - 1;
            end if;
         else
            PhaseDiffEn <= '0';  -- make clk93 wide
            PhaseDiff2xGain <= resize((PhaseDiff2 - PhaseDiff2Offset) * PhaseDiff2Gain, PhaseDiff2xGain);
         end if;
      end if;
   end process AFC_process;

   VioPhase  : Vio2x18
      PORT MAP (
         clk         => clk2x,
         probe_out0  => PhaseDiffGain2Slv,
         probe_out1  => PhaseDiffOffsetSlv,
         probe_out2  => PhaseDiffGain1Slv,
         probe_out3  => PilotSel,
         probe_out4  => TrellisOffsetSlv
   );
   TrellisOffset <= signed(TrellisOffsetSlv);

   Mag0GtMag1 <= '1' when (Mag0Peak > Mag1Peak) else '0';
/*
   PS_u : pilotsync
      PORT MAP (
         clk            => Clk,
         ce             => CE,
         reset          => reset,
         PilotSyncOffset => to_integer(unsigned(PilotSyncOffset)),
         PilotPulseIn   => PilotPulse,
         Mag0GtMag1     => Mag0GtMag1,
         ValidIn        => PilotValidOut,
         IndexIn        => PilotIndex,
         RealIn         => PilotRealOut,
         ImagIn         => PilotImagOut,
         PhaseOut       => Phase2A,
         PhaseDiffEn    => PhaseDiffEnPSA,
         PhaseDiff      => PhaseDiff2A,
         RealOut        => RealOutPS,     -- 93Mhz
         ImagOut        => ImagOutPS,
         StartOut       => StartOutPS,
         ValidOut       => ValidOutPS,
         PilotLocked    => PilotLockedA
   );
*/
   PS_u : PilotSyncOverTwoPackets
      PORT MAP (
         clk            => Clk,
         ce             => CE,
         reset          => reset,
         PilotSyncOffset => to_integer(unsigned(PilotSyncOffset)),
         PilotPulseIn   => PilotPulse,
         PilotTime      => PilotTime,
         RdAddrDiff     => RdAddrDiff,
         Mag0GtMag1     => Mag0GtMag1,
         ValidIn        => PilotValidOut,
         IndexIn        => PilotIndex,
         RealIn         => PilotRealOut,
         ImagIn         => PilotImagOut,
         PhaseOut       => Phase2B,
         PhaseDiffEn    => PhaseDiffEnPSB,
         PhaseDiff      => PhaseDiff2B,
         RealOut        => RealOutPSB,     -- 93Mhz
         ImagOut        => ImagOutPSB,
         StartOut       => StartOutPSB,
         ValidOut       => ValidOutPSB,
         PilotLocked    => PilotLockedB
   );

   PhaseDiffEn   <= /*PhaseDiffEnPSA when (PilotSel(0) = '0') else*/ PhaseDiffEnPSB;
   PhaseDiff2    <= /*PhaseDiff2A    when (PilotSel(0) = '0') else*/ PhaseDiff2B;
   Phase2        <= /*Phase2A        when (PilotSel(0) = '0') else*/ Phase2B;
   PilotLocked   <= /*PilotLockedA   when (PilotSel(0) = '0') else*/ PilotLockedB;

   InterBrikClk : process(Clk) is
   begin
      if(rising_edge(Clk)) then
         if (Reset) then
            StartInBrik2Dly <= '0';
            ValidInBrik2Dly <= '0';
            InRBrik2Dly     <= (others=>'0');
            InIBrik2Dly     <= (others=>'0');
         else
            StartInBrik2Dly <= /*StartOutPS when (PilotSel(0) = '0') else*/ StartOutPSB;
            ValidInBrik2Dly <= /*ValidOutPS when (PilotSel(0) = '0') else*/ ValidOutPSB;
            InRBrik2Dly     <= /*RealOutPS  when (PilotSel(0) = '0') else*/ RealOutPSB;
            InIBrik2Dly     <= /*ImagOutPS  when (PilotSel(0) = '0') else*/ ImagOutPSB;
         end if;
      end if;
   end process InterBrikClk;

   Brik2_u : Brik2
      PORT MAP(
         Clk            => Clk,
         Reset          => Reset,
         CE             => CE,
         StartIn        => StartInBrik2Dly,
         ValidIn        => ValidInBrik2Dly,
         InR            => to_slv(InRBrik2Dly),
         InI            => to_slv(InIBrik2Dly),
         EstimatesDone  => EstimatesDone,
         H0EstR         => H0EstR,
         H0EstI         => H0EstI,
         H1EstR         => H1EstR,
         H1EstI         => H1EstI,
         DeltaTauEst    => DeltaTauEst,
         m_ndx0         => m_ndx0,
         m_ndx1         => m_ndx1,
         Mu0            => Ch0Mu,
         Mu1            => Ch1Mu
      );

   m_ndx0Slv <= std_logic_vector(to_signed(m_ndx0, 4) + TrellisOffset);
   m_ndx1Slv <= std_logic_vector(to_signed(m_ndx1, 4) + TrellisOffset);

   Trellis_u : trellisProcess
      PORT MAP (
         clk                  => Clk,
         clk2x                => Clk2x,
         clkEnable            => CE,
         reset                => Reset,
         estimatesDone        => EstimatesDone,
         frameStart           => StartInBrik2Dly,
         inputValid           => ValidInBrik2Dly,
         dinReal              => to_slv(InRBrik2Dly),
         dinImag              => to_slv(InIBrik2Dly),
         h0EstRealIn          => to_slv(H0EstR),
         h0EstImagIn          => to_slv(H0EstI),
         h1EstRealIn          => to_slv(H1EstR),
         h1EstImagIn          => to_slv(H1EstI),
         ch0MuIn              => to_slv(Ch0Mu),
         ch1MuIn              => to_slv(Ch1Mu),
         deltaTauEstIn        => to_slv(DeltaTauEst),
         m_ndx0               => m_ndx0Slv,
         m_ndx1               => m_ndx1Slv,
         sample0r             => sample0r,
         sample0i             => sample0i,
         interpOutEn          => interpOutEn,
         lastSampleReset      => lastSampleReset,
         full                 => TrellisFull,
         outputEn             => TrellisOutEn,
         outputBits           => TrellisBits
      );

   FD : FireberdDrive
      PORT MAP(
         clk            => Clk2x,
         reset          => Reset,
         ce             => CE,
         ValidIn        => TrellisOutEn,
         MsbFirst       => '1',
         RecoveredData  => TrellisBits,
         ClocksPerBit   => to_sfixed(ClocksPerBit, 0, -15),
         DataOut        => DataOut,
         ClkOut         => ClkOutEn
      );

   PnProc : process(Clk2x)
   begin
      if (rising_edge(Clk2x)) then
         if (EstimatesDone) then
            PnDelay <= 0;
         elsif (PnDelay < 255) then
            PnDelay <= PnDelay + 1;
         end if;
         pnBitEn <= ClkOutEn and not ClkOutEnDly;
         ClkOutEnDly <= ClkOutEn;
         ValidData2047 <= dataBit xor codeBit;
      end if;
   end process PnProc;

   pn_derand : bert_correlator
      port map (
         poly         => 24x"500",
         poly_length  => 5x"0b",
         poly_mode    => '0',
         reset        => reset,
         clock        => clk2x,
         enable       => pnBitEn, --   clock in data
         lfsr_enable  => pnBitEn, --   gated clock in data
         reload       => PilotSel(0),
         data         => DataOut,
         data_bit     => dataBit,
         code_bit     => codeBit
      );

   StartDac2Data <= 18x"1FFFF" when (StartInBrik2Dly) else 18x"0";

   DacOutputs : process(Clk2x)
   begin
      if (rising_edge(Clk2x)) then

         Dac0Data <= DacMux(to_integer(unsigned(DacSelect0)));
         Dac1Data <= DacMux(to_integer(unsigned(DacSelect1)));
         Dac2Data <= DacMux(to_integer(unsigned(DacSelect2)));
         Dac0ClkEn  <= '1';
         Dac1ClkEn  <= '1';
         Dac2ClkEn  <= '1';
         DacMux(0)  <= to_slv(InRBrik2Dly);        -- reframed resample R & I
         DacMux(1)  <= to_slv(InIBrik2Dly);        --
         DacMux(2)  <= StartDac2Data;              -- Start of Frame signal
         DacMux(3)  <= ValidInBrik2Dly & 17x"0";   -- Valid packet signal
         DacMux(4)  <= Phase2;                     -- Half Pilot Phase
         DacMux(5)  <= to_slv(PilotIndex) & 7x"0";                   --
         DacMux(6)  <= PhaseDiffSlv;               -- Composite Phase Diff
         DacMux(7)  <= PhaseDiff1xGainSlv;         -- Whole Pilot Phase Diff
         DacMux(8)  <= PhaseDiff2xGainSlv;         -- Half Pilot Phase Diff
         DacMux(9)  <= Magnitude0;                 -- iFFT H0 Magnitude every other sample
         DacMux(10) <= Magnitude1;                 -- H1
         DacMux(11) <= PhaseOut0;                  -- iFFT H0 Phase every other sample
         DacMux(12) <= PhaseOut1;                  -- H1
         DacMux(13) <= Mag0Peak;                   -- Peak Magnitude H0 per frame
         DacMux(14) <= Phs0Peak;                   -- Full Pilot Phase at peak magnitude
         DacMux(15) <= Mag1Peak;                   --
         DacMux(1)  <= RdAddrDiff;                   --
         DacMux(1)  <= H0Phase & "00";        -- Computed H0 Phase            was ValidData2047 & 17x"0";     -- My 2047 BER with triples per error
      end if;
   end process DacOutputs;


   cordic1 : vm_cordic_fast
      GENERIC MAP (
         n => H0EstR'length
      )
      PORT MAP (
         clk   => Clk,
         ena   => EstimatesDone,
         x     => to_slv(H0EstR),
         y     => to_slv(H0EstI),
         m     => open,          -- m[n:2]
         p     => H0Phase,
         enOut => open
      );

END rtl;
