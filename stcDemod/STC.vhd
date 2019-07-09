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
      ValidIn           : IN  std_logic;
      DataOut,                            -- Trellis Data Output
      ClkOutEn,                           -- Trellis Clock Output
      PilotFound,                         -- Pilot Found LED
      PilotLocked,
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
         ValidIn        : IN  std_logic;
         ReIn,
         ImIn           : IN  FLOAT_1_18;
         PilotIndex     : OUT ufixed(10 downto 0);
         PilotMag,
         Threshold      : OUT ufixed(10 downto -7);
         ReOut,
         ImOut          : OUT FLOAT_1_18;
         Magnitude0,
         Magnitude1,
         PhaseOut0,
         PhaseOut1      : OUT SLV18;
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
       deltaTauEstIn    : IN  std_logic_vector(5 downto 0);
       sample0r,
       sample0i         : OUT SLV18;
       outputEn,
       interpOutEn      : OUT std_logic;
       outputBits       : OUT SLV4
   );
   END COMPONENT TrellisProcess;

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
   SIGNAL   DeltaTauEst       : sfixed(0 downto -5);
   SIGNAL   Magnitude0,
            Magnitude1,
            PhaseOut0,
            PhaseOut1,
            StartDac2Data     : SLV18;
   SIGNAL   PilotPulse,
            PilotValidOut     : std_logic;
   SIGNAL   PilotRealOut,
            PilotImagOut      : Float_1_18;
   SIGNAL   PilotIndex        : ufixed(10 downto 0);
   SIGNAL   PilotMag,
            Threshold         : ufixed(11 downto -6);

-- todo, remove
   signal   sample0r,
            sample0i,
            InRBrik2Ila,
            InIBrik2Ila       : SLV18;
   signal   StartIla,
            ValidIla          : std_logic;
   signal   TrellisCount      : natural range 0 to 3300;

   attribute mark_debug : string;
   attribute mark_debug of TrellisBits, TrellisOutEn, EstimatesDone, TrellisCount,
                  DataOut, ClkOutEn, StartIla, ValidIla, InRBrik2Ila, InIBrik2Ila       : signal is "true";

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
         ReIn           => ResampleR_s,
         ImIn           => ResampleI_s,
         -- outputs
         PilotMag       => PilotMag,
         PilotFound     => PilotFound,
         PilotIndex     => PilotIndex,
         Threshold      => Threshold,
         Magnitude0     => Magnitude0,
         Magnitude1     => Magnitude1,
         PhaseOut0      => PhaseOut0,
         PhaseOut1      => PhaseOut1,
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
         RealOut        => RealOutPS,
         ImagOut        => ImagOutPS,
         StartOut       => StartOutPS,
         ValidOut       => ValidOutPS,
         PilotLocked    => PilotLocked
   );

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
         H0EstR         => H0EstR,
         H0EstI         => H0EstI,
         H1EstR         => H1EstR,
         H1EstI         => H1EstI,
         DeltaTauEst    => DeltaTauEst,
         Mu0            => Ch0Mu,
         Mu1            => Ch1Mu
      );

   Trellis_u : trellisProcess
      PORT MAP (
         clk                  => clk,
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
         sample0r             => sample0r,
         sample0i             => sample0i,
         interpOutEn          => interpOutEn,
         outputEn             => TrellisOutEn,
         outputBits           => TrellisBits
      );

   FD : fireberdDrive
      PORT MAP(
         Clk            => Clk2x,
         Reset          => Reset,
         CE             => CE,
         ClocksPerBit   => ClocksPerBit,
         MsbFirst       => '1',
         ValidIn        => TrellisOutEn,
         RecoveredData  => TrellisBits,
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
            Dac0Data    <= PhaseOut0;
            Dac1Data    <= PhaseOut1;
            Dac2Data    <= StartDac2Data;
            Dac0ClkEn   <= '1';
            Dac1ClkEn   <= '1';
            Dac2ClkEn   <= '1';
         elsif (DacSelect = x"5") then
            Dac0Data    <= Magnitude0;
            Dac1Data    <= PhaseOut0;
            Dac2Data    <= StartDac2Data;
            Dac0ClkEn   <= '1';
            Dac1ClkEn   <= '1';
            Dac2ClkEn   <= '1';
         else
            Dac0Data    <= Magnitude1;
            Dac1Data    <= PhaseOut1;
            Dac2Data    <= StartDac2Data;
            Dac0ClkEn   <= '1';
            Dac1ClkEn   <= '1';
            Dac2ClkEn   <= '1';
         end if;
      end if;
   end process DacOutputs;

END rtl;
