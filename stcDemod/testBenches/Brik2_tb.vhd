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
-- Module Name: Brik2_tb.vhd
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
use ieee.math_real.all;
library std;
use std.env;
use work.Semco_pkg.all;
use work.fixed_pkg.all;
entity Brik2_tb is
end Brik2_tb;

architecture rtl of Brik2_tb is

  -- Define Components

   COMPONENT Brik2
      PORT(
         clk,
         reset,
         ce             : IN  std_logic;
         Variables      : IN  RecordType;
         StartIn,
         ValidIn        : IN  std_logic;
         FreqIn      : in Float_128k;
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
         in1Imag              : IN  SLV18;
         deltaTauEst          : IN  std_logic_vector(5 downto 0);
         finalMetricOutputEn,
         outputEn             : OUT std_logic;
         finalMetric          : OUT SLV18;
         outputBits           : OUT std_logic_vector(3 downto 0)
      );
   END COMPONENT TrellisDetector;

   COMPONENT ReadGoldRef IS
      GENERIC (
         FILE_NAME         : string := "../simData";
         NUM_VALUES        : natural := 1;         -- number of values per line
         DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
         OUT_WIDTH         : natural := 32;        -- total width of each value
         OUT_BINPT         : integer := -31;       -- number of fraction bits if any. If none, set to 0
         DELAY             : natural := 0
      );
      PORT(
         clk               : IN  std_logic;
         reset             : IN  std_logic;
         ce                : IN  std_logic;
         OutputData        : OUT vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0);
         Done              : OUT std_logic
      );
   END COMPONENT ReadGoldRef;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   constant DELAY             : natural  := 0;
   constant ZEROS_OF          : natural_array(0 to 15) := (4,3,3,2,3,2,2,1,3,2,2,1,2,1,1,0);
   constant ExpectedBer       : natural_array(0 to 15) :=(
      1693, 1635, 1638, 1644, 186, 125, 75, 43, 20, 5, 3, 1, 0, 0, 0, 0);
      -- 35200
   signal   reset,
            clk,
            ce                : std_logic := '1';

   SIGNAL   StartIn,
            ValidIn,
            Pass,
            TrellisEn,
            TrellisSkip,
            NotFirstFrame,
            finalMetricOutputEn,
            TrellisOutEnRaw,
            TrellisStart,
            TrellisOutEn      : std_logic := '0';
   SIGNAL   Dones             : UINT8 := (others=>'1');
   SIGNAL   StartRead,
            ValidRead         : vector_of_slvs(0 to 0)(0 downto 0) := (others=>(others=>'0'));
   SIGNAL   VarsReal,
            VarsImag          : vector_of_slvs(0 to 0)(17 downto 0) := (others=>(others=>'0'));
   SIGNAL   RealRead,
            ImagRead,
            FinalMetric       : SLV18;
   SIGNAL   TrellisBitsRaw,
            TrellisBits       : SLV4;
   SIGNAL   Variables         : RecordType := c_RecordType;
   SIGNAL   H0EstR,
            H0EstI,
            H1EstR,
            H1EstI,
            InterpO_R0,
            InterpO_I0,
            InterpO_R1,
            InterpO_I1        : STC_PARM;
   SIGNAL   DeltaTauEst       : sfixed(0 downto -5);
   SIGNAL   PacketCount,
            FrameCount,
            SampleCount,
            TrellisCount,
            ErrorCount,
            ErrorTotal,
            BitCount          : natural := 0;
   SIGNAL   BER               : real := 0.0;
   SIGNAL   FreqIn            : Float_128K := to_sfixed(0001, Float_zero_128k);

BEGIN

   process begin
      wait for 500 ps;
      clk <= not clk;
   end process;

   reset_process : process begin
      wait for 4 ns;
      reset <= '0';
   end process reset_process;

   ReadReal : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "..\simData\AllOnesDataR_+0_100_50%.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => -17,
      DELAY             => Delay
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => '1',
      OutputData        => VarsReal,
      Done              => Dones(7)
   );

   ReadImag : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "..\simData\AllOnesDataI_+0_100_50%.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => 18,
      OUT_BINPT         => -17,
      DELAY             => Delay
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => '1',
      OutputData        => VarsImag,
      Done              => Dones(6)
   );

   ReadValid : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "..\simData\AllOnesDataV_+0_100_50%.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => Bools,
      OUT_WIDTH         => 1,
      OUT_BINPT         => 0,
      DELAY             => Delay
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => '1',
      OutputData        => ValidRead,
      Done              => Dones(5)
   );

   ReadStart : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "..\simData\AllOnesDataS_+0_100_50%.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => Bools,
      OUT_WIDTH         => 1,
      OUT_BINPT         => 0,
      DELAY             => Delay
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => '1',
      OutputData        => StartRead,
      Done              => Dones(4)
   );

   StartProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            StartIn  <= '0';
            ValidIn  <= '0';
            RealRead <= (others=>'0');
            ImagRead <= (others=>'0');
         elsif (ce) then
            StartIn  <= StartRead(0)(0);
            RealRead <= VarsReal(0);
            ImagRead <= VarsImag(0);
            ValidIn  <= ValidRead(0)(0);
            if (ValidIn) then
               SampleCount <= SampleCount + 1;
            else
               SampleCount <= 0;
            end if;
            if (ValidRead(0)(0) and not ValidIn) then
               PacketCount <= PacketCount + 1;
            elsif (StartIn) then
               PacketCount <= 0;
            end if;
         end if;
      end if;
   end process StartProcess;

   Brik2_u : Brik2
   PORT MAP(
      clk            => clk,
      reset          => reset,
      ce             => ce,
      Variables      => Variables,
      InR            => RealRead,
      InI            => ImagRead,
      FreqIn         => FreqIn,
      StartIn        => StartIn,
      ValidIn        => ValidIn,
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
            TrellisOutEn   <= '0';
            TrellisSkip    <= '0';
            TrellisBits    <= x"0";
            TrellisCount   <= 0;
            ErrorCount     <= 0;
         elsif (CE) then
            if (TrellisStart) then  -- ignore the first trellis output
               TrellisSkip <= '1';
               if (NotFirstFrame) then
                  ErrorTotal <= ErrorTotal + ErrorCount;
                  BitCount   <= BitCount + 3200;
                  FrameCount <= FrameCount + 1;
               end if;
               if (FrameCount = 4) then
                  FreqIn <= Float_Zero_128K; -- Let freq estimate build
               end if;
               TrellisCount <= 0;
               ErrorCount   <=  0;
               NotFirstFrame <= '1';
            end if;
            TrellisOutEn <= '1' when (TrellisOutEnRaw = '1') and (TrellisSkip = '0') and (TrellisCount < 800) else '0';
            if (TrellisOutEnRaw) then
               TrellisSkip <= '0';
            end if;
            if (TrellisOutEn) then
               TrellisCount <= TrellisCount + 1;
               ErrorCount <= ErrorCount + ZEROS_OF(to_integer(unsigned(TrellisBits)));
            end if;
            if (BitCount > 0) then
               BER <= real(ErrorTotal) / real(BitCount);
            end if;
            TrellisBits  <= TrellisBitsRaw;
         end if;
      end if;
   end process TrellisProcess;

end rtl;
