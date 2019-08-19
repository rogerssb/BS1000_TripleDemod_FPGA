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
         SIM_MODE    : boolean := false;
         BuildAll    : boolean := false
      );
   PORT(
      ResampleR,
      ResampleI         : IN  SLV18;
      ClocksPerBit      : IN  SLV16;
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
         CorrPntr       : OUT ufixed(15 downto 0);
         ReOut,
         ImOut          : OUT FLOAT_1_18;
         Magnitude0,
         Magnitude1,
         PhaseOut0,
         PhaseOut1,
         MagPeak,
         PhsPeak        : OUT SLV18;
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
         DiffEn,
         ValidIn        : IN STD_LOGIC;
         CorrPntr       : IN ufixed(15 DOWNTO 0);
         Offset         : IN  SLV4;
         RealIn,
         ImagIn         : IN  Float_1_18;
         PhaseOutA,
         PhaseOutB      : OUT SLV18;
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
         StartDF,
         ValidDF,
         EstimatesDone  : OUT std_logic;
         H0EstR,
         H0EstI,
         H1EstR,
         H1EstI,
         DF_R,
         DF_I           : OUT STC_PARM;
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
         probe_out3,
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
            Clk,
            Clk2x,
            Reset,
            Reset2x,
            StartOutPS,
            ValidOutPS,
            PilotLockedA,
            PhaseDiffEnPS,
            Mag0GtMag1,
            StartInBrik2Dly,
            ValidInBrik2Dly,
            PilotValidOutDly,
            StartDF,
            ValidDF,
            TrellisOutEn,
            interpOutEn,
            lastSampleReset,
            EstimatesDone     : std_logic;
   SIGNAL   TrellisBits,
            OffsetPS          : SLV4;
   SIGNAL   PhaseDiffEnDly    : SLV8;
   SIGNAL   RealOutPS,
            ImagOutPS,
            InRBrik2Dly,
            InIBrik2Dly,
            DF_R,
            DF_I,
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
            PhaseDiff1xGain,
            PhaseDiff2xGain,
            PhaseDiff2Offset  : Float_1_18;
   SIGNAL   PhaseDiff1Gain,
            PhaseDiff2Gain    : sfixed(9 downto -8);
   SIGNAL   m_ndx0,
            m_ndx1            : integer range -5 to 3 := 0;
   SIGNAL   DeltaTauEst       : sfixed(0 downto -5);
   SIGNAL   Magnitude0,
            PhaseOut0,
            Magnitude1,
            PhaseOut1,
            MagPeak,
            PhsPeak,
            PhsLastPeak,
            PhaseDiffGain1Slv,
            PhaseDiffGain2Slv,
            PhaseDiffOffsetSlv,
            PhaseDiffGain1Slv1,
            PhaseDiffGain2Slv1,
            PhaseDiffOffsetSlv1,
            Phase0A,
            Phase0B,
            PhaseDiffSlv,
            PhaseDiff1xGainSlv,
            PhaseDiff2xGainSlv : SLV18;
   SIGNAL   StartCount        : integer range 0 to 3 := 0;
   SIGNAL   PilotPulse,
            PilotValidOut     : std_logic;
   SIGNAL   PilotRealOut,
            PilotImagOut      : Float_1_18;
   SIGNAL   CorrPntr          : ufixed(15 downto 0);
   signal   PnDelay,
            BerRange,
            Ber               : natural range 0 to 255 := 0;
   SIGNAL   ValidData2047,
            ClkOutEnDly,
            pnBitEn,
            dataBit,
            codeBit,
            Reload            : std_logic;

-- todo, remove
   SIGNAL   H0Phase           : std_logic_vector(11 downto 0);
   SIGNAL   ExpectedData,
            TrellisOffsetSlv,
            MiscBits,
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
   signal   DacMux            : vector_of_slvs(0 to 15)(17 downto 0);

   attribute mark_debug : string;
   attribute mark_debug of TrellisBits, TrellisOutEn, EstimatesDone,
                  DataOut, ClkOutEn, StartIla, ValidIla, InRBrik2Ila, InIBrik2Ila,
                  Bert, BitErrors, lastSampleReset, TrellisFull, PhaseDiff2xGainSlv,
                  PhaseDiff1xGainSlv, PhaseDiffSlv, PhaseDiffEn,
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

   PD_u : PilotDetectSliding
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
         CorrPntr       => CorrPntr,
         Magnitude0     => Magnitude0,
         Magnitude1     => Magnitude1,
         PhaseOut0      => PhaseOut0,
         PhaseOut1      => PhaseOut1,
         MagPeak        => MagPeak,
         PhsPeak        => PhsPeak,
         ReOut          => PilotRealOut,
         ImOut          => PilotImagOut,
         ValidOut       => PilotValidOut,
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
            PhaseDiff       <= (others=>'0');
            PhaseDiff1xGain <= (others=>'0');
            PhaseDiff2xGain <= (others=>'0');
            PhaseDiffEnDly  <= (others=>'0');
            PhaseDiffEn     <= '0';
         elsif (PhaseDiffEnPS) then
            PhaseDiff1  <= resize(to_sfixed(PhsPeak, PhaseDiff1) - to_sfixed(PhsLastPeak, PhaseDiff1), PhaseDiff1);
            PhaseDiffEnDly  <= x"01";
         else
            PhaseDiff <= std_logic_vector(resize(PhaseDiff1xGain + PhaseDiff2xGain, 0, -17));
            PhaseDiff1xGain <= resize(PhaseDiff1 * PhaseDiff1Gain, PhaseDiff1xGain);
            PhaseDiff2xGain <= resize((PhaseDiff2 - PhaseDiff2Offset) * PhaseDiff2Gain, PhaseDiff2xGain);
            PhaseDiffEnDly  <= PhaseDiffEnDly(6 downto 0) & '0';
            PhaseDiffEn     <= PhaseDiffEnDly(3) or PhaseDiffEnDly(4);  -- needs two clocks wide for 93Mhz domain
         end if;

         if (Reset) then
            PhsLastPeak <= (others=>'0');
         elsif (PhaseDiffEnDly(7)) then
            PhsLastPeak <= PhsPeak when (MiscBits(1)) else (others=>'0');
         end if;
      end if;
   end process AFC_process;

   PhaseOut <= to_slv(PhaseDiff2) when (not MiscBits(3)) else to_slv(PhsPeak);

   PS_u : pilotsync
      PORT MAP (
         clk            => Clk2x,
         ce             => CE,
         reset          => reset,
         PilotPulseIn   => PilotPulse,
         ValidIn        => PilotValidOut,
         CorrPntr       => CorrPntr,
         Offset         => OffsetPS,
         RealIn         => PilotRealOut,
         ImagIn         => PilotImagOut,
         PhaseOutA      => Phase0A,
         PhaseOutB      => Phase0B,
         DiffEn         => MiscBits(2),
         PhaseDiffEn    => PhaseDiffEnPS,
         PhaseDiff      => PhaseDiff2,
         RealOut        => RealOutPS,     -- 186Mhz
         ImagOut        => ImagOutPS,
         StartOut       => StartOutPS,
         ValidOut       => ValidOutPS,
         PilotLocked    => PilotLocked
   );

   VioPhase  : Vio2x18
      PORT MAP (
         clk         => clk2x,
         probe_out0  => PhaseDiffGain2Slv,
         probe_out1  => PhaseDiffOffsetSlv,
         probe_out2  => PhaseDiffGain1Slv,
         probe_out3  => MiscBits,
         probe_out4  => TrellisOffsetSlv,
         probe_out5  => OffsetPS
   );
   TrellisOffset <= signed(TrellisOffsetSlv);

ShortBuild : if (BuildAll) generate

   InterBrikClk : process(Clk2x) is
   begin
      if(rising_edge(Clk2x)) then
         if (Reset) then
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
         Clk            => Clk2x,
         Reset          => Reset,
         CE             => CE,
         StartIn        => StartInBrik2Dly,
         ValidIn        => ValidInBrik2Dly,
         InR            => to_slv(InRBrik2Dly),
         InI            => to_slv(InIBrik2Dly),
         EstimatesDone  => EstimatesDone,
         StartDF        => StartDF,
         ValidDF        => ValidDF,
         DF_R           => DF_R,
         DF_I           => DF_I,
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

   m_ndx0Slv <= std_logic_vector(TrellisOffset + to_signed(m_ndx0, 4)) when (MiscBits(0)) else std_logic_vector(TrellisOffset - to_signed(m_ndx0, 4));
   m_ndx1Slv <= std_logic_vector(TrellisOffset + to_signed(m_ndx1, 4)) when (MiscBits(0)) else std_logic_vector(TrellisOffset - to_signed(m_ndx1, 4));

   Trellis_u : trellisProcess
      PORT MAP (
         clk                  => Clk2x,
         clkEnable            => CE,
         reset                => Reset,
         estimatesDone        => EstimatesDone,
         frameStart           => StartDF,
         inputValid           => ValidDF,
         dinReal              => to_slv(DF_R),
         dinImag              => to_slv(DF_I),
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
         if (BerRange < 255) then
            BerRange <= BerRange + 1;
            Reload   <= '0';
            if (ValidData2047) then
               Ber <= Ber + 1;
            end if;
         else
            BerRange <= 0;
            if (Ber > 20) then
               Reload <= '1';
            end if;
            Ber <= 0;
         end if;
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
         reload       => Reload,
         data         => DataOut,
         data_bit     => dataBit,
         code_bit     => codeBit
      );
end generate;

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
         DacMux(2)  <= StartInBrik2Dly & 17x"0";              -- Start of Frame signal
         DacMux(3)  <= ValidInBrik2Dly & 17x"0";   -- Valid packet signal
         DacMux(4)  <= Phase0A;                     -- Half Pilot Phase
         DacMux(5)  <= to_slv(CorrPntr) & 2x"0";                   --
         DacMux(6)  <= PhaseDiffSlv;               -- Composite Phase Diff
         DacMux(7)  <= PhaseDiff1xGainSlv;         -- Whole Pilot Phase Diff
         DacMux(8)  <= PhaseDiff2xGainSlv;         -- Half Pilot Phase Diff
         DacMux(9)  <= Magnitude0;                 -- iFFT H0 Magnitude every other sample
         DacMux(10) <= Magnitude1;                 -- H1
         DacMux(11) <= PhaseOut0;                  -- iFFT H0 Phase every other sample
         DacMux(12) <= Phase0B;  --PhaseOut1;                  -- H1
         DacMux(13) <= MagPeak;                    -- Peak Magnitude per frame
         DacMux(14) <= PhsPeak;                    -- Full Pilot Phase at peak magnitude
         DacMux(15) <= to_slv(CorrPntr(8 downto 0)) & 9x"00";        -- Computed H0 Phase            was ValidData2047 & 17x"0";     -- My 2047 BER with triples per error
      end if;
   end process DacOutputs;


   cordic1 : vm_cordic_fast
      GENERIC MAP (
         n => 14
      )
      PORT MAP (
         clk   => Clk,
         ena   => EstimatesDone,
         x     => to_slv(H0EstR(0 downto -13)),
         y     => to_slv(H0EstI(0 downto -13)),
         m     => open,          -- m[n:2]
         p     => H0Phase,
         enOut => open
      );

END rtl;
