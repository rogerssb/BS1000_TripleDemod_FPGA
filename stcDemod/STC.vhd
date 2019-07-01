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
      PilotOffset       : IN  natural range 0 to 4095;
      DacSelect         : IN  SLV4;
      Clk93,
      Clk186,
      ValidIn           : IN  std_logic;
      ClkOut,                 -- FireBerd Clock Output
      DataOut,                -- FireBerd Data Output
      Dac0ClkEn,
      Dac1ClkEn,
      Dac2ClkEn,
      PilotFound,             -- Pilot Found LED
      PilotLocked       : OUT std_logic;   -- I'm alive Blinking LED
      Dac0Data,
      Dac1Data,
      Dac2Data          : OUT SLV18
   );
END STC;


ARCHITECTURE rtl OF STC IS

   COMPONENT Brik1
      GENERIC (SIM_MODE : boolean := false
      );
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
         Clk2x,
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
   SIGNAL   ResetSrc          : SLV8 := x"FF";
   SIGNAL   CE,
            Clk,
            Clk2x,
            Reset,
            Reset2x,
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
            Locked            : std_logic;
   SIGNAL   FinalMetric       : SLV18;
   SIGNAL   TrellisBitsRaw,
            TrellisBits       : std_logic_vector(3 downto 0);
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
            InIBrik2Ila       : SLV18;
   signal   StartIla,
            ValidIla          : std_logic;
   signal   TrellisCount      : natural range 0 to 3300;
   signal   PilotOffsetI      : integer range -7 to 7 := 0;

   attribute mark_debug : string;
   attribute mark_debug of TrellisBits, TrellisOutEn, TrellisStart, TrellisCount, TrellisSkip,
                  DataOut, ClkOut, StartIla, ValidIla, InRBrik2Ila, InIBrik2Ila       : signal is "true";

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
   Variables.PilotSyncOffset <= PilotOffset + PilotOffsetI;

   ResetProcess : process(Clk)
   begin
      if(rising_edge(Clk)) then
         ResetSrc <= ResetSrc(6 downto 0) & '0';
         Reset    <= ResetSrc(7);
   --         if (StartInBrik2) then
   --            PilotOffsetI <= PilotOffsetI + 1;
   --         end if;
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

   Brik1_u : Brik1
      generic map (
         SIM_MODE    => SIM_MODE
      )
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
         Clk2x          => Clk2x,
         Reset          => Reset,
         CE             => CE,
         Variables      => Variables,
         StartIn        => StartInBrik2Dly,
         ValidIn        => ValidInBrik2Dly,
         FreqIn         => (others=>'0'), --to_sfixed(FreqResolution & 7x"00", Float_zero_128K), --TODO, remove line
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
         Clk                  => Clk2x,
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

   process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (DacSelect = x"0") then
            Dac0Data    <= to_slv(InRBrik2);
            Dac1Data    <= to_slv(InIBrik2);
            Dac2Data    <= 18x"1FFFF" when (StartInBrik2) else 18x"0";
            Dac0ClkEn   <= ValidInBrik2;
            Dac1ClkEn   <= ValidInBrik2;
            Dac2ClkEn   <= ValidInBrik2;
         elsif (DacSelect = x"1") then
            Dac0Data    <= to_slv(InterpO_R0);
            Dac1Data    <= to_slv(InterpO_I0);
            Dac2Data    <= 18x"1FFFF" when (TrellisStart) else 18x"0";
            Dac0ClkEn   <= TrellisEn;
            Dac1ClkEn   <= TrellisEn;
            Dac2ClkEn   <= TrellisEn;
         else -- if (DacSelect = x"2") then
            Dac0Data    <= to_slv(InterpO_R1);
            Dac1Data    <= to_slv(InterpO_I1);
            Dac2Data    <= 18x"1FFFF" when (TrellisStart) else 18x"0";
            Dac0ClkEn   <= TrellisEn;
            Dac1ClkEn   <= TrellisEn;
            Dac2ClkEn   <= TrellisEn;
         end if;
      end if;
   end process;

END rtl;
