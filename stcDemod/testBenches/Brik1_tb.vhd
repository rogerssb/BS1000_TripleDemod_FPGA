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
-- Module Name: Brik1_tb.vhd
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
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity Brik1_tb is
end Brik1_tb;

architecture rtl of Brik1_tb is

  -- Define Components

   COMPONENT Brik1 is
      GENERIC (SIM_MODE : boolean := false
      );
      PORT(
         clk,
         clk2x,
         reset,
         reset2x,
         ce,
         ValidIn        : IN  std_logic;
         Variables      : IN  RecordType;   -- for pilotSync and PilotDetect
         ResampleR,
         ResampleI      : IN  Float_1_18;
         RealOut,
         ImagOut        : OUT Float_1_18;
         ValidOut,
         PilotFound,
         PilotLocked,
         StartOut       : OUT std_logic
      );
   end COMPONENT Brik1;

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

   COMPONENT ReadGoldRef IS
      GENERIC (
         FILE_NAME         : string := "../test_data/file.txt";
         NUM_VALUES        : natural := 1;         -- number of values per line
         DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
         OUT_WIDTH         : natural := 32;        -- total width of each value
         OUT_BINPT         : integer := -31        -- number of fraction bits if any. If none, set to 0
      );
      PORT(
         clk               : IN  std_logic;
         reset             : IN  std_logic;
         ce                : IN  std_logic;
         OutputData        : OUT vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0);
         Done              : OUT std_logic
      );
   END COMPONENT ReadGoldRef;

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;      -- only needed for ROMs
         ADDR_WIDTH  : positive  := 9;
         FILE_IS_SLV : boolean   := false;    -- nonSLV files are not synthesizable
         LATENCY     : positive  := 1;
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

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   constant C_READ               : std_logic := '1';
   constant SIM_MODE             : boolean := true; -- false; --

   signal   reset,
            clk,
            clk2x,
            ce                   : std_logic := '1';

   SIGNAL   PilotPacket,
            StartOut,
            DataValid_o          : std_logic := '0';
   SIGNAL   DataValid            : SLV8 := x"01";
   SIGNAL   RdAddr_i             : natural range 0 to 226304 := 12800;  -- start just before next pilot
   SIGNAL   Dones                : SLV4 := x"0";
   SIGNAL   RealRead,
            ImagRead             : vector_of_slvs(0 to 1)(17 downto 0);
   signal   Variables            : RecordType := c_RecordType;
   SIGNAL   Ratio,
            OneMinusRatio,
            H0r,
            H0i,
            H1r,
            H1i,
            ResampleR_s,
            ResampleI_s,
            RealOut,
            ImagOut              : FLOAT_1_18;
   SIGNAL   PilotSyncOffset      : natural range 0 to 2047 := 1535;
/*
   -- Brik2
   signal   InRBrik2Dly,
            InIBrik2Dly,
             H0EstR,
             H0EstI,
             H1EstR,
             H1EstI,
             InterpO_R0,
             InterpO_I0,
             InterpO_R1,
             InterpO_I1          : FLOAT_1_18;
   signal   TrellisEn,
            TrellisStart,
            ValidInBrik2Dly,
            StartInBrik2Dly      : std_logic;
   signal   DeltaTauEst          : sfixed(0 downto -5);
*/
begin

   process begin
      wait for 2.50 ns;
      if (or(Dones) = '1') then
         report "Simulation Finished" severity failure;
         wait;
      else
         clk2x <= not clk2x;
      end if;
   end process;

   process begin
      wait for 30 ns;
         reset <= '0';
      wait for 10 us;
         Variables.MiscBits(TIME_SEL) <= '0';
   end process;

   process begin
      wait for 40 ns;
         if (<< signal Brik1u.PD_u.OverflowIFft : std_logic >> ) then
            report "iFFT OverFlow Failure" severity WARNING;
         end if;
         if (<< signal Brik1u.PD_u.OverflowFft  : std_logic >>) then
            report "FFT OverFlow Failure" severity WARNING;
         end if;
         if (<< signal Brik1u.PD_u.Cntr0Abs.Overflow  : std_logic >>) then
            report "Center Abs 0 OverFlow Failure" severity WARNING;
         end if;
         if (<< signal Brik1u.PD_u.Cntr1Abs.Overflow  : std_logic >>) then
            report "Center Abs 1 OverFlow Failure" severity WARNING;
         end if;
         if (<< signal Brik1u.PD_u.H0Cntr_x_Fft.Overflow  : std_logic >>) then
            report "Center H0*Fft OverFlow Failure" severity WARNING;
         end if;
         if (<< signal Brik1u.PD_u.H1Cntr_x_Fft.Overflow  : std_logic >>) then
            report "Center H1*Fft OverFlow Failure" severity WARNING;
         end if;
   end process;

   clk_process : process (clk2x)
   begin
      if (rising_edge(clk2x)) then
         clk <= not clk;
      end if;
   end process clk_process;

   reg_process : process (clk)
   begin
      if (rising_edge(clk)) then
         DataValid <= DataValid(DataValid'left-1 downto 0) & DataValid(DataValid'left);
         if (DataValid(DataValid'left)) then
            if (RdAddr_i < 226304) then
               RdAddr_i <= RdAddr_i + 1;
            else
               RdAddr_i <= 0;
               PilotSyncOffset <= PilotSyncOffset + 1;
            end if;
         end if;

         if (reset) then
            Ratio <= to_sfixed(0.0, Ratio);
         elsif (StartOut) then
            Ratio <= resize(Ratio + 0.125, Ratio);
         end if;
      end if;
   end process reg_process;

   ReadRealC : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "../simData/resampled_r_+0_50_100%.txt",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         ADDR_WIDTH  => 18,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => 0,
         RdAddrB     => RdAddr_i,
         WrData      => (others=>'0'),
         RdOutA      => open,
         RdOutB      => RealRead(0)
      );

   ReadImagC : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "../simData/resampled_i_+0_50_100%.txt",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         ADDR_WIDTH  => 18,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => 0,
         RdAddrB     => RdAddr_i,
         WrData      => (others=>'0'),
         RdOutA      => open,
         RdOutB      => ImagRead(0)
      );

   ReadRealC1 : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "../simData/resampled_r_+0_50_0%.txt",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         ADDR_WIDTH  => 18,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => 0,
         RdAddrB     => RdAddr_i,
         WrData      => (others=>'0'),
         RdOutA      => open,
         RdOutB      => RealRead(1)
      );

   ReadImagC1 : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "../simData/resampled_i_+0_50_0%.txt",
         DATA_WIDTH  => 18,
         BINPT       => -17,
         ADDR_WIDTH  => 18,
         LATENCY     => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => 0,
         RdAddrB     => RdAddr_i,
         WrData      => (others=>'0'),
         RdOutA      => open,
         RdOutB      => ImagRead(1)
      );
   Variables.MiscBits(CONJUGATE) <= '0';
   Variables.MiscBits(RESAMP_DIS) <= C_READ; -- Set high to use C program IQ data
   Variables.PilotSyncOffset <= PilotSyncOffset;

   OneMinusRatio  <= resize(1.0 - Ratio, OneMinusRatio);
   H0r            <= to_sfixed(RealRead(0), ResampleR_s);
   H0i            <= to_sfixed(ImagRead(0), ResampleI_s);
   H1r            <= to_sfixed(RealRead(1), ResampleR_s);
   H1i            <= to_sfixed(ImagRead(1), ResampleI_s);
   ResampleR_s <= resize((H0r * Ratio) + (H1r * OneMinusRatio), ResampleR_s);
   ResampleI_s <= resize((H0i * Ratio) + (H1i * OneMinusRatio), ResampleI_s);

   Brik1u : Brik1
      generic map (
         SIM_MODE    => SIM_MODE
      )
      port map(
         clk            => clk,
         clk2x          => clk2x,
         ce             => ce,
         reset          => reset,
         reset2x        => reset,
         Variables      => Variables,
         ResampleR      => ResampleR_s,
         ResampleI      => ResampleI_s,
         validin        => DataValid(DataValid'left),
         PilotFound     => open,
         PilotLocked    => open,
         RealOut        => RealOut,
         ImagOut        => ImagOut,
         ValidOut       => DataValid_o,
         startout       => StartOut
   );
/*
   InterBrikClk : process(Clk) is
   begin
      if(rising_edge(Clk)) then
         if (Reset) then
            StartInBrik2Dly <= '0';
            ValidInBrik2Dly <= '0';
            InRBrik2Dly     <= (others=>'0');
            InIBrik2Dly     <= (others=>'0');
         else
            InRBrik2Dly     <= RealOut;
            InIBrik2Dly     <= ImagOut;
            ValidInBrik2Dly <= DataValid_o;
            StartInBrik2Dly <= StartOut;
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
         FreqIn         => 25x"00000",
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
*/

/*
   type     MAG_ARRAY_18  is array (natural range <>) of sfixed(16 downto -1);
   SIGNAL   GoodPilot         : integer range 0 to 3;
   SIGNAL   BadPilot,
            IgnoreInitial     : integer range 0 to 128;
   SIGNAL   PeakPointer       : natural range 0 to 26;
   SIGNAL   Count,
            Packet,
            MaxIndex          : natural range 0 to 1024;
   SIGNAL   PilotMag,
            Threshold,
            Max,
            CurrentPeak,
            Peak1,
            Peak2             : sfixed(16 downto -1) := (others=>'0');
   SIGNAL   MagDelay          : MAG_ARRAY_18(26 downto 0);
   SIGNAL   PilotFound,
            CalcThreshold,
            PilotPulse,
            PilotPulse1x,
            StartOut,
            Fail              : std_logic;
   SIGNAL   PilotIndex        : ufixed(10 downto 0);


   ThresholdTestbench : process(clk)
      variable rand_v : real;
      variable seed1,
               seed2             : positive;
   begin
      if (rising_edge(clk)) then
         if (reset) then
            Max <= to_sfixed(4000, Max);
         end if;
         if (Count < 40) then
            Count       <= Count + 1;
            PilotPulse  <= '0';
         else
            Count       <= 0;
            PilotPulse  <= '1';
            if (Packet < 25) then
               Packet <= Packet + 1;
               uniform(seed1, seed2, rand_v);
               Max    <= to_sfixed(rand_v * 400.0, Max);
            else
               Max    <= to_sfixed(rand_v * 4000.0 + 400.0, Max);
               Packet <= 0;
            end if;
            Fail <= Peak1 ?= Peak2;
         end if;
      end if;
   end process ThresholdTestbench;

   DetectProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            Threshold      <= to_sfixed(5000, Threshold); -- set initial RunningTotal to typical at highest signal levels
            MagDelay       <= (others=>(others=>'0'));
            PilotMag       <= (others=>'0');
            PilotFound     <= '0';
            PilotPulse1x   <= '0';
            GoodPilot      <= 0;
            BadPilot       <= 0;
            IgnoreInitial  <= 0;
            CurrentPeak    <= (others=>'0');
            Peak1          <= (others=>'0');
            Peak2          <= (0=>'1', others=>'0');
            PilotIndex     <= (others=>'0');
         elsif (ce) then
            PilotMag     <= Max;          -- Latch clock transfers
            PilotPulse1x <= PilotPulse;
            if (PilotPulse1x) then
               PilotIndex  <= to_ufixed(MaxIndex, PilotIndex);
               if (IgnoreInitial < 25) then
                  IgnoreInitial <= IgnoreInitial + 1; -- let first frame accumulate to set threshold
               else
                  CalcThreshold  <= '1';
                  PeakPointer    <= 1;          -- no need to check PilotMag(0) since Peak1 is set to PilotMag also
                  Peak1          <= PilotMag;   -- Assume first is largest
                  Peak2          <= (others=>'0');
                  CurrentPeak    <= (others=>'0');
               end if;
               if (PilotMag > Threshold) then
                  BadPilot <= 0;
                  if (GoodPilot < 2) then
                     GoodPilot <= GoodPilot + 1;   -- 3 good frames in a row = found
                  else
                     PilotFound <= '1';-- when (BadPilot >= 25) else '0';
                     GoodPilot <= 3;
                     StartOut <= '1';
                  end if;
               else
                  if (BadPilot <= 127) then    -- 128 bad packets in a row = lost
                     BadPilot <= BadPilot + 1;
                  else
                     GoodPilot <= 0;
                     PilotFound <= '0';
                  end if;
               end if;
               MagDelay   <= MagDelay(25 downto 0) & PilotMag; -- only use last 26, but pipelining wants array of 27
            else
               StartOut <= '0';
            end if;
            if (CalcThreshold) then          -- Place threshold in center of two highest peaks
               CurrentPeak <= MagDelay(PeakPointer);
               if (PeakPointer < 26) then
                  if (CurrentPeak > Peak1) then
                     Peak1 <= CurrentPeak;   -- Found new peak, store previous in peak2
                     Peak2 <= Peak1;
                  elsif (CurrentPeak > Peak2) then
                     Peak2 <= CurrentPeak;
                  end if;
                  PeakPointer <= PeakPointer + 1;
               else
                  if (MagDelay(25) > Peak1) then
                     Threshold <= resize((MagDelay(25) + Peak1) / 2, Threshold);
                     Peak1 <= MagDelay(25);
                     Peak2 <= Peak1;
                  else
                     Threshold <= resize((Peak1 + Peak2) / 2, Threshold);
                  end if;
                  CalcThreshold <= '0';
                  CurrentPeak <= (others=>'0');
               end if;
            end if;
         end if;
      end if;
   end process DetectProcess;
*/
end rtl;
-------------
-- CVS Info:
-------------
-- $Source: $
-- $Revision: $
-- $Date: $
-- $Author: $
-- $Log: $
