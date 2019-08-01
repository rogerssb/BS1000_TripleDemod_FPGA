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
      DacSelect         : IN  SLV4;
      Clk93,
      Clk186,
      SpectrumInv,
      ValidIn           : IN  std_logic;
      DataOut,                            -- Trellis Data Output
      ClkOutEn,                           -- Trellis Clock Output
      PilotFound,                         -- Pilot Found LED
      PilotLocked,
      TrellisFull,
      Dac0ClkEn,
      Dac1ClkEn,
      Dac2ClkEn         : OUT std_logic;
      Dac0Data,
      Dac1Data,
      Dac2Data          : OUT SLV18
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
         ValidOut,
         StartOut       : OUT std_logic
      );
   end COMPONENT PilotDetect;

   COMPONENT pilotsync
      PORT (
         clk,
         reset,
         ce,
         PilotPulseIn,
         ValidIn        : IN STD_LOGIC;
         PilotSyncOffset : IN  natural range 0 to 4095;
         IndexIn        : IN ufixed(10 DOWNTO 0);
         RealIn,
         ImagIn         : IN  Float_1_18;
         RealOut,
         ImagOut        : OUT Float_1_18;
         StartOut,
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

  -- Signals
   SIGNAL   ResetSrc          : SLV8 := x"FF";
   SIGNAL   CE,
            Clk,
            Clk2x,
            Reset,
            Reset2x,
            StartOutPS,
            ValidOutPS,
            StartInBrik2Dly,
            ValidInBrik2Dly,
            TrellisOutEn,
            interpOutEn,
            lastSampleReset,
            EstimatesDone     : std_logic;
   SIGNAL   TrellisBits       : std_logic_vector(3 downto 0);
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
            StartDac2Data     : SLV18;
   SIGNAL   PilotPulse,
            PilotValidOut     : std_logic;
   SIGNAL   PilotRealOut,
            PilotImagOut      : Float_1_18;
   SIGNAL   PilotIndex        : ufixed(10 downto 0);

-- todo, remove
   SIGNAL   ExpectedData      : SLV4;
   SIGNAL   DataAddr          : integer range 0 to 800;
   SIGNAL   Bert,
            BitErrors         : natural range 0 to 3200;
   signal   sample0r,
            sample0i,
            InRBrik2Ila,
            InIBrik2Ila       : SLV18;
   signal   StartIla,
            ValidIla          : std_logic;

   attribute mark_debug : string;
   attribute mark_debug of TrellisBits, TrellisOutEn, EstimatesDone,
                  DataOut, ClkOutEn, StartIla, ValidIla, InRBrik2Ila, InIBrik2Ila,
                  Bert, BitErrors, lastSampleReset, TrellisFull : signal is "true";

BEGIN

-- TODO remove ILAs
   process(Clk)
   begin
      if (rising_edge(Clk)) then
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

   PD_u : pilotdetect
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
         PilotFound     => PilotFound,
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
         StartOut       => PilotPulse
   );

   PS_u : pilotsync
      PORT MAP (
         clk            => Clk,
         ce             => CE,
         reset          => reset,
         PilotSyncOffset => to_integer(unsigned(PilotSyncOffset)),
         PilotPulseIn   => PilotPulse,
         ValidIn        => PilotValidOut,
         IndexIn        => PilotIndex,
         RealIn         => PilotRealOut,
         ImagIn         => PilotImagOut,
         RealOut        => RealOutPS,     -- 93Mhz
         ImagOut        => ImagOutPS,
         StartOut       => StartOutPS,
         ValidOut       => ValidOutPS,
         PilotLocked    => PilotLocked
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
            StartInBrik2Dly <= StartOutPS;
            ValidInBrik2Dly <= ValidOutPS;
            InRBrik2Dly     <= RealOutPS;
            InIBrik2Dly     <= ImagOutPS;
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
         m_ndx0               => std_logic_vector(to_signed(m_ndx0, 4)),
         m_ndx1               => std_logic_vector(to_signed(m_ndx1, 4)),
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

   StartDac2Data <= 18x"1FFFF" when (StartInBrik2Dly) else 18x"0";

   DacOutputs : process(Clk2x)
   begin
      if (rising_edge(Clk2x)) then
         if (DacSelect = x"0") then
            Dac0Data    <= to_slv(InRBrik2Dly);
            Dac1Data    <= to_slv(InIBrik2Dly);
            Dac2Data    <= StartDac2Data;
            Dac0ClkEn   <= ValidInBrik2Dly;
            Dac1ClkEn   <= ValidInBrik2Dly;
            Dac2ClkEn   <= ValidInBrik2Dly;
         elsif (DacSelect = x"1") then
            Dac0Data    <= sample0r;
            Dac1Data    <= sample0i;
            Dac2Data    <= 18x"1FFFF" when (interpOutEn) else 18x"0";
            Dac0ClkEn   <= '1';
            Dac1ClkEn   <= '1';
            Dac2ClkEn   <= '1';
         elsif (DacSelect = x"2") then
            Dac0Data    <= (TrellisBits & 14x"0");
            Dac1Data    <= sample0r;
            Dac2Data    <= 18x"1FFFF" when (EstimatesDone) else 18x"0";
            Dac0ClkEn   <= TrellisOutEn;
            Dac1ClkEn   <= TrellisOutEn;
            Dac2ClkEn   <= TrellisOutEn;
         elsif (DacSelect = x"3") then
            Dac0Data    <= Magnitude0;
            Dac1Data    <= Magnitude1;
            Dac2Data    <= StartDac2Data;
            Dac0ClkEn   <= '1';
            Dac1ClkEn   <= '1';
            Dac2ClkEn   <= '1';
         elsif (DacSelect = x"4") then
            Dac0Data    <= Magnitude0;
            Dac1Data    <= PhaseOut0;
            Dac2Data    <= StartDac2Data;
            Dac0ClkEn   <= '1';
            Dac1ClkEn   <= '1';
            Dac2ClkEn   <= '1';
         elsif (DacSelect = x"5") then
            Dac0Data    <= Magnitude1;
            Dac1Data    <= PhaseOut1;
            Dac2Data    <= StartDac2Data;
            Dac0ClkEn   <= '1';
            Dac1ClkEn   <= '1';
            Dac2ClkEn   <= '1';
         elsif (DacSelect = x"6") then
            Dac0Data    <= Mag0Peak;
            Dac1Data    <= Phs0Peak;
            Dac2Data    <= StartDac2Data;
            Dac0ClkEn   <= '1';
            Dac1ClkEn   <= '1';
            Dac2ClkEn   <= '1';
         elsif (DacSelect = x"7") then
            Dac0Data    <= Mag1Peak;
            Dac1Data    <= Phs1Peak;
            Dac2Data    <= StartDac2Data;
            Dac0ClkEn   <= '1';
            Dac1ClkEn   <= '1';
            Dac2ClkEn   <= '1';
         else
            Dac0Data    <= Mag0Peak;
            Dac1Data    <= Mag1Peak;
            Dac2Data    <= StartDac2Data;
            Dac0ClkEn   <= '1';
            Dac1ClkEn   <= '1';
            Dac2ClkEn   <= '1';
         end if;
      end if;
   end process DacOutputs;

END rtl;
