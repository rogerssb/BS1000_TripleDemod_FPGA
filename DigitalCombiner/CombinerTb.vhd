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

Module Name: DemodSerDesTop.vhd
Description: The IF signal is delayed up to 127 clocks then down converted to baseband
and decimated by 2 to the ClkOver2 rate. This is then filtered to match the noise bandwidth,
frequency shifted, noise is added and the sum AM modulated. This composite is the
up converted to 70MHz and drives the SerDes output to the Combiner.

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
LIBRARY STD;
USE std.textio.ALL;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY CombinerTb IS
   END CombinerTb;

ARCHITECTURE rtl OF CombinerTb IS

   component DemodPreDist
      PORT (
            Clk,
            ClkOver2,
            Clk2x,
            Reset,
            NcoReset_n,
            FPGA_ID0,
            FPGA_ID1          : IN std_logic;
            adc0In,
            AM_Amp,
            NoiseGain         : IN  SLV18;
            PhaseInc,
            AM_Freq           : IN  SLV32;
            ChAgc             : IN  SLV12;
            Delay             : IN  SLV8;
            RealOut,
            ImagOut,
            ifOut             : OUT SLV18
         );
   END component DemodPreDist;

   component DUC
      port (
         clk,
         ce       : in  std_logic;
         realIn,
         imagIn   : in  std_logic_vector(17 downto 0);
         ifOut    : out std_logic_vector(17 downto 0)
      );
   END component DUC;

   COMPONENT bert_lfsr
      PORT (
         clock         : in  std_logic;
         reset         : in  std_logic;
         enable        : in  std_logic;
         reload        : in  std_logic;
         poly          : in  std_logic_vector(23 downto 0);
         poly_length   : in  std_logic_vector(4  downto 0);
         load_data     : in  std_logic_vector(23 downto 0);
         data          : out std_logic_vector(23 downto 0);
         serial        : out std_logic
      );
   END COMPONENT BERT_LFSR;

   COMPONENT CombinerTop
      PORT(
         ch1Adc,
         ch2Adc,
         ch1RealIn,
         ch1ImagIn,
         ch2RealIn,
         ch2ImagIn               : IN std_logic_vector(17 downto 0);
         ch1Agc                  : IN std_logic_vector(11 downto 0);
         ch2Agc                  : IN std_logic_vector(11 downto 0);
         addr                    : IN std_logic_vector(4 downto 0);
         dataIn                  : IN std_logic_vector(31 downto 0);
         reset,
         clk, clk2x, clkOver2,
         busClk, ComplexOrIF,
         cs,
         wr0, wr1, wr2, wr3      : IN std_logic;

         locked, agc1_gt_agc2,
         RealXord, ImagXord,
         ifBS_n, combinerEn      : OUT std_logic;
         ifOut,
         maxImagout, maxRealout,
         minImagout, minRealout,
         imagout, realout,
         gainOutMax, gainOutMin,
         phase_detect,
         ch1RealPre, ch1ImagPre,
         ch2RealPre, ch2ImagPre  : OUT std_logic_vector(17 downto 0);
         RealLock, ImagLock      : OUT std_logic_vector(12 downto 0);
         nco_control_out         : OUT std_logic_vector(21 downto 0);
         dataOut                 : OUT std_logic_vector(31 downto 0);
         lag_out                 : OUT std_logic_vector(31 downto 0)
     );
   END COMPONENT;


   -- Constants
   constant Plus1             : Float_1_18 := to_sfixed( 0.707 / 2.0, 0, -17);
   constant Neg1              : Float_1_18 := to_sfixed(-0.707 / 2.0, 0, -17);
   constant Zero              : Float_1_18 := to_sfixed(0.0, 0, -17);
   constant COMB_LAG_COEF     : std_logic_vector(4 downto 0) :=  5b"0_00--";
   constant COMB_LEAD_COEF    : std_logic_vector(4 downto 0) :=  5b"0_01--";
   constant COMB_SWEEP_RATE   : std_logic_vector(4 downto 0) :=  5b"0_10--";
   constant COMB_SWEEP_LIMIT  : std_logic_vector(4 downto 0) :=  5b"0_110-";
   constant COMB_OPTIONS      : std_logic_vector(4 downto 0) :=  5b"0_111-";
   constant COMB_LOCK_THRESH  : std_logic_vector(4 downto 0) :=  5b"1_00--";
   constant Fs                : real := 280.0e6/6.0;

   type     Modulation        is (BPSK, QPSK, OQPSK);
   type     mcuFsm            is (IDLE, SETUP, WRITE, READ, FINISH);

   -- Signals
   signal   mcuMode           : mcuFsm := IDLE;
   signal   Mode              : Modulation := BPSK;
   signal   PrnDataI,
            PrnDataQ,
            PrnEn,
            wrLsb, wrMsb, cs, TwoWords,
            RealXord, ImagXord, combinerEn, combLocked, agc1_gt_agc2,
            NcoReset1_n, resetComb_n,
            RecoveredDataI, RecoveredDataQ, FirstBer_n, FirstWr_n,
            Clk,
            Clk2x,
            ClkOver2,
            Reset             : std_logic := '0';
   signal   addr              : unsigned(4 downto 0) := 5x"00";
   signal   RealLock, ImagLock : std_logic_vector(12 downto 0);
   signal   ResetShft         : SLV18 := 18x"3FFFF";
   signal   DataRate          : integer range 0 to 127 := 0;
   signal   DataIsim,
            DataQsim          : FLOAT_1_18;
   signal   combinerIF,
            AM_Amp1,
            NoiseGain1,
            AM_Amp2,
            NoiseGain2,
            adc0In,
            IF1,
            IF2,
            ch1RealIn,
            ch1ImagIn,
            ch2RealIn,
            ch2ImagIn,
            maxImagout, maxRealout,
            minImagout, minRealout,
            imagout, realout,
            gainOutMax, gainOutMin,
            LagCoef,
            LeadCoef,
            SweepRate,
            phase_detect      : SLV18;
   signal   Options           : SLV16;
   signal   PhaseInc1,
            AM_Freq1,
            PhaseInc2,
            AM_Freq2,
            DC_DataIn,
            DC_DataOut,
            DC_DataCapt,
            LockThresh,
            lag_out           : SLV32;
   signal   Ch1Agc,
            Ch2Agc            : SLV12;
   signal   Delay1,
            Delay2            : SLV8;
   signal   nco_control_out   : std_logic_vector(21 downto 0);
   signal   SweepLimit        : std_logic_vector(13 downto 0);
   signal   BitCountI,
            ErrorCountI,
            BitErrorsI,
            BitCountQ,
            ErrorCountQ,
            BitErrorsQ,
            AM_FreqHz1,
            AM_AmpPerCent1,
            OffsetFreqHz1,
            AgcVolts1,
            DelayNs1,
            SNRdB1,
            AM_FreqHz2,
            AM_AmpPerCent2,
            OffsetFreqHz2,
            AgcVolts2,
            DelayNs2,
            SNRdB2            : real := 0.0;
   signal   PrnDelayI,
            PrnDelayQ         : std_logic_vector(13 downto 0);
   signal   IIandD,
            QIandD            : sfixed(2 downto -17);
   signal   BERI, BERQ        : real := 0.0;

begin


   process begin
      wait for 2.50 ns;
      Clk2x <= not Clk2x;
      if (not Clk2x) then
         Clk <= not Clk;
         if (not Clk) then
            ClkOver2 <= not ClkOver2;
         end if;
      end if;
   end process;

   process begin
      wait for 2500 ns;
      resetComb_n <= '1';
   end process;

   LFSR11 : BERT_LFSR
      PORT MAP(
         clock       => ClkOver2,
         reset       => Reset,
         reload      => not resetComb_n,
         enable      => PrnEn,
         poly        => 24x"6000",
         poly_length => 5x"0F",
         load_data   => 24x"1001",
         data        => open,
         serial      => PrnDataI
   );

   LFSR15 : BERT_LFSR
      PORT MAP(
         clock       => ClkOver2,
         reset       => Reset,
         reload      => not resetComb_n,
         enable      => PrnEn,
         poly        => 24x"6000",
         poly_length => 5x"0F",
         load_data   => 24x"9009",
         data        => open,
         serial      => PrnDataQ
   );

   Delay_process: process (ClkOver2)
   begin
      if (rising_edge(ClkOver2)) then
         ResetShft      <= ResetShft(16 downto 0) & '0';
         Reset          <= ResetShft(ResetShft'left);
         DataRate   <= DataRate + 1 when (DataRate < 9) else 0;
         if (DataRate = 0) then
            PrnEn   <= '1';
            case (Mode) is
               when BPSK =>
                  DataIsim <= Plus1 when (PrnDataI) else Neg1;
                  DataQsim <= Zero;
               when QPSK =>
                  DataIsim <= Plus1 when (PrnDataI) else Neg1;
                  DataQsim <= Plus1 when (PrnDataQ) else Neg1;
               when OQPSK =>
                  DataIsim <= Plus1 when (PrnDataI) else Neg1;
               when others =>
                  DataIsim <= Zero;
                  DataQsim <= Zero;
            end case;
         elsif ((DataRate = 5) and (Mode = OQPSK)) then
            DataQsim <= Plus1 when (PrnDataQ) else Neg1;   -- Delay Q a half bit
            -- PrnEn should have gone low on DataRate = 1
         else
            PrnEn <= '0';
         end if;
      end if;
   end process;

   GenIF : DUC
      port map (
         clk      => clk,
         ce       => '1',
         realIn   => to_slv(DataIsim),
         imagIn   => to_slv(DataQsim),
         ifOut    => adc0In
      );

   AM_FreqHz1     <= 1000.0;     -- 0 to �50KHz
   AM_AmpPerCent1 <= 5.0;
   OffsetFreqHz1  <= 4666.0;  --�125KHz but must be withing 10KHz of OffsetFreqHz2 to avoid excess differential offset
   DelayNs1       <= 2000.0;  -- 0 to 2000, for negative delay, set this to 0 and set DelayNs2 to 0 to 2000, Delay is differential
   SNRdB1         <= 0.0;     -- 0 to 80
   AgcVolts1      <= -2.0 + SNRdB1 / 20.0;     -- �2.0

   AM_FreqHz2     <= 2000.0;
   AM_AmpPerCent2 <= 0.0;
   OffsetFreqHz2  <= 0.0;     -- if measuring BERs, the stronger signal can't have a frequency offset for the IandDs get beat notes
   DelayNs2       <= 50.0;
   SNRdB2         <= 20.0;
   AgcVolts2      <= -2.0 + SNRdB2 / 20.0;

   NoiseGain1  <= std_logic_vector(to_unsigned(integer(10.0**(-SNRdB1/20.0) * 32768.0),18)); -- 0x08000 is roughly 0dB
   PhaseInc1   <= std_logic_vector(to_unsigned(integer(OffsetFreqHz1 / Fs * 2.0**32),32));
   AM_Freq1    <= std_logic_vector(to_unsigned(integer(AM_FreqHz1 / Fs * 2.0**32),32));
   Ch1Agc      <= std_logic_vector(to_signed(integer(AgcVolts1 / 2.2 * 2.0**11),12));
   Delay1      <= std_logic_vector(to_unsigned(integer(DelayNs1 * 1.0e-9 * Fs),8));
   AM_Amp1     <= std_logic_vector(to_unsigned(integer(2.0**17 * AM_AmpPerCent1 / 100.0),18));

   NoiseGain2  <= std_logic_vector(to_unsigned(integer(10.0**(-SNRdB2/20.0) * 32768.0),18));
   PhaseInc2   <= std_logic_vector(to_unsigned(integer(OffsetFreqHz2 / Fs * 2.0**32),32));
   AM_Freq2    <= std_logic_vector(to_unsigned(integer(AM_FreqHz2 / Fs * 2.0**32),32));
   Ch2Agc      <= std_logic_vector(to_signed(integer(AgcVolts2 / 2.2 * 2.0**11),12));
   Delay2      <= std_logic_vector(to_unsigned(integer(DelayNs2 * 1.0e-9 * Fs),8));
   AM_Amp2     <= std_logic_vector(to_unsigned(integer(2.0**17 * AM_AmpPerCent2 / 100.0),18));

   LagCoef     <= 18x"00C80";
   LeadCoef    <= 18x"0A000";
   SweepLimit  <= 14x"0013";
   SweepRate   <= 18x"00064";
   LockThresh  <= 32x"00800700";
   Options     <= 16x"0011";
   NcoReset1_n <= ResetComb_n;

   Channel1 : DemodPreDist
      port map(
         Clk         => Clk,
         ClkOver2    => ClkOver2,
         Clk2x       => Clk2x,
         Reset       => Reset,
         NcoReset_n  => NcoReset1_n,
         FPGA_ID0    => '0',
         FPGA_ID1    => '0',
         adc0In      => adc0In,
         AM_Amp      => AM_Amp1,
         NoiseGain   => NoiseGain1,
         PhaseInc    => PhaseInc1,
         AM_Freq     => AM_Freq1,
         ChAgc       => Ch1Agc,
         Delay       => Delay1,
         RealOut     => ch1RealIn,
         ImagOut     => ch1ImagIn,
         ifOut       => IF1
      );

   Channel2 : DemodPreDist
      port map(
         Clk         => Clk,
         ClkOver2    => ClkOver2,
         Clk2x       => Clk2x,
         Reset       => Reset,
         NcoReset_n  => NcoReset1_n,
         FPGA_ID0    => '1',
         FPGA_ID1    => '0',
         adc0In      => adc0In,
         AM_Amp      => AM_Amp2,
         NoiseGain   => NoiseGain2,
         PhaseInc    => PhaseInc2,
         AM_Freq     => AM_Freq2,
         ChAgc       => Ch2Agc,
         Delay       => Delay2,
         RealOut     => ch2RealIn,
         ImagOut     => ch2ImagIn,
         ifOut       => IF2
      );

    Combiner : CombinerTop
      port map (
         Clk               => Clk,
         ClkOver2          => ClkOver2,
         Clk2x             => Clk2x,
         reset             => not resetComb_n,
         cs                => cs,
         busClk            => ClkOver2,
         wr0               => wrLsb,
         wr1               => wrLsb,
         wr2               => wrMsb,
         wr3               => wrMsb,
         addr              => std_logic_vector(addr),
         dataIn            => DC_DataIn,
         dataOut           => DC_DataOut,
         ch1Adc            => IF1,
         ch2Adc            => IF2,
         ch1RealIn         => ch1RealIn,
         ch1ImagIn         => ch1ImagIn,
         ch2RealIn         => ch2RealIn,
         ch2ImagIn         => ch2ImagIn,
         ComplexOrIF       => '1',
         ch1agc            => Ch1Agc,
         ch2agc            => Ch2Agc,
         realout           => realout,
         imagout           => imagout,
         ifOut             => combinerIF,
         combinerEn        => combinerEn,
         reallock          => RealLock,
         imaglock          => ImagLock,
         locked            => combLocked,
         agc1_gt_agc2      => agc1_gt_agc2,
         lag_out           => lag_out,
         nco_control_out   => nco_control_out,
         phase_detect      => phase_detect,
         maximagout        => maxImagout,
         maxrealout        => maxRealout,
         minimagout        => minImagout,
         minrealout        => minRealout,
         realxord          => RealXord,
         imagxord          => ImagXord,
         gainoutmax        => gainOutMax,
         gainoutmin        => gainOutMin,
         ifBS_n            => open
      );

   mcuProcess : process (ClkOver2)
   begin
      if (rising_edge(ClkOver2)) then
         case (mcuMode) is
            when IDLE =>
               wrLsb    <= '0';
               wrMsb    <= '0';
               cs       <= '0';
               mcuMode  <= SETUP;
            when SETUP =>
               case? (std_logic_vector(addr)) is
                  when COMB_LAG_COEF =>
                     DC_DataIn <= 14x"000" & LagCoef;
                     TwoWords  <= '1';
                  when COMB_LEAD_COEF =>
                     DC_DataIn <= 14x"000" & LeadCoef;
                     TwoWords  <= '1';
                  when COMB_SWEEP_RATE =>
                     DC_DataIn <= 14x"000" & SweepRate;
                     TwoWords  <= '1';
                  when COMB_SWEEP_LIMIT =>
                     DC_DataIn <= 18x"000" & SweepLimit;
                     TwoWords  <= '0';
                  when COMB_OPTIONS =>
                     DC_DataIn <= Options & 16x"0000";
                     TwoWords  <= '0';
                  when COMB_LOCK_THRESH =>
                     DC_DataIn <= LockThresh;
                     TwoWords  <= '1';
                  when others =>
                     mcuMode <= IDLE;
               end case?;
               mcuMode <= WRITE;
            when WRITE =>
               if (TwoWords) then
                  wrLsb <= '1';
                  wrMsb <= '1';
               else
                  wrLsb <= not Addr(1);
                  wrMsb <= Addr(1);
               end if;
               cs       <= '1';
               mcuMode  <= READ;
            when READ =>
               wrLsb    <= '0';
               wrMsb    <= '0';
               mcuMode  <= FINISH;
            when others =>
               if (FirstWr_n) then
                  case? (std_logic_vector(addr)) is
                     when COMB_LAG_COEF =>
                        if (DC_DataOut(28 downto 0) /= 11x"000" & LagCoef) then
                           report "LagCoef read failed. Read " & to_hstring(DC_DataOut);
                        end if;
                     when COMB_LEAD_COEF =>
                        if (DC_DataOut(23 downto 0) /= 6x"00" & LeadCoef) then
                           report "LeadCoef read failed. Read " & to_hstring(DC_DataOut);
                        end if;
                     when COMB_SWEEP_RATE =>
                        if (DC_DataOut /= 14x"000" & SweepRate) then
                           report "Sweep Rate read failed. Read " & to_hstring(DC_DataOut);
                        end if;
                     when COMB_SWEEP_LIMIT =>
                        if (DC_DataOut /= Options & 2x"0" & SweepLimit) then
                           report "Sweep Limit read failed. Read " & to_hstring(DC_DataOut);
                        end if;
                     when COMB_OPTIONS =>
                        if (DC_DataOut /= Options & 2x"0" & SweepLimit) then
                           report "Options read failed. Read " & to_hstring(DC_DataOut);
                        end if;
                     when COMB_LOCK_THRESH =>
                        if (DC_DataOut /= LockThresh) then
                           report "LockThresh read failed. Read " & to_hstring(DC_DataOut);
                        end if;
                     when others =>
                        report "McuMode is illegal, " & to_hstring(addr);
                  end case?;
               end if;
               DC_DataCapt <= DC_DataOut;
               if (std_logic_vector(addr) ?= COMB_LOCK_THRESH) then
                  addr        <= 5x"00";
                  FirstWr_n   <= '1';
               elsif (TwoWords) then
                  addr <= addr + 4;
               else
                  addr <= addr + 2;
               end if;
               cs       <= '0';
               mcuMode  <= IDLE;
         end case;
      end if;
   end process mcuProcess;

   OutProc: process (ClkOver2)
   begin
      if (rising_edge(ClkOver2)) then
         if (DataRate = 0) then
            IIandD         <= resize(to_sfixed(realOut, DataIsim), IIandD);
            QIandD         <= resize(to_sfixed(imagOut, DataIsim), IIandD);
            RecoveredDataI <= IIandD(2);
            RecoveredDataQ <= QIandD(2);
            PrnDelayI      <= PrnDelayI(PrnDelayI'left-1 downto 0) & PrnDataI;
            PrnDelayQ      <= PrnDelayQ(PrnDelayQ'left-1 downto 0) & PrnDataQ;
         else
            IIandD         <= resize(IIandD + to_sfixed(realOut, DataIsim), IIandD);
            QIandD         <= resize(QIandD + to_sfixed(imagOut, DataIsim), IIandD);
         end if;
         if (DataRate = 1) then
            if (not firstBer_n) then
               if (BitCountI < 25.0) then
                  BitCountI <= BitCountI + 1.0;
               else
                  firstBer_n <= '1';
                  BitCountI  <= 1.0;   -- prevent divide by zero
                  BitCountQ  <= 1.0;
               end if;
            else
               BERI         <= ErrorCountI / BitCountI;
               BERQ         <= ErrorCountQ / BitCountQ;
               if ((ErrorCountI > 50.0) or (BitCountI > 1.0e5)) then
                  BitCountI    <= 1.0;
                  BitErrorsI   <= ErrorCountI;
                  report      "BER I = " & to_string(ErrorCountI / BitCountI, "%1.2e");
                  ErrorCountI  <= 0.0;
               else
                  BitCountI  <= BitCountI + 1.0;
                  if (PrnDelayI(10) /= RecoveredDataI) then
                     ErrorCountI  <= ErrorCountI + 1.0;
                  end if;
               end if;
               if (Mode /= BPSK) then
                  if ((ErrorCountQ > 50.0) or (BitCountQ > 1.0e5)) then
                     BitCountQ    <= 1.0;
                     BitErrorsQ   <= ErrorCountQ;
                     report      "BER Q = " & to_string(ErrorCountQ / BitCountQ, "%1.2e");
                     ErrorCountQ  <= 0.0;
                  else
                     BitCountQ  <= BitCountQ + 1.0;
                     if (PrnDelayQ(10) /= RecoveredDataQ) then
                        ErrorCountQ  <= ErrorCountQ + 1.0;
                     end if;
                  end if;
               end if;
            end if;
         end if;
      end if;
   end process OutProc;

end rtl;
