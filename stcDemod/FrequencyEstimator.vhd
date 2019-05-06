-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco, Inc. All rights reserved.
--
-- This file contains Semco Inc. proprietary information. It is the
-- property of Semco Inc. and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco Inc.,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco, Inc.
--
-- Module Name: FrequencyEstimator.vhd
-- Description: *This is the top-level function for frequency_estimator.c. It accepts as input the received training
--       sequences, the training sequence templates, and timing and channel estimates. It outputs a final
--       frequency estimate. The timing and channel estimates are used to produce estimated training
--       sequence templates based on the templates provided. The four most recent training sequences are stored.
--    Performs a frequency offset estimation. The estimate
--    is made using the four most recent 512-sample pilots. The estimation is performed by,
--    first, downsampling the vector product of the received pilots and the conjugate of the
--    estimated pilots, second, performing a forward FFT of this downsampled product, third,
--    identify seven candidate peaks in the FFT output, fourth, peform a fine-grain DFT search around
--    the peaks in order to identify the true FFT output max.
--
--    The estimator operates in two modes. In the FE_ACQUIRE mode, the estimate returned is the
--    result of a fine grain search over seven candidate FFT output peaks. But, during the
--    FE_TRACK mode, the estimate returned is the result of a fine grain search of the current
--    peak identified by the center bin of the histogram. Note that during the FE_TRACK mode,
--    the fine grain searches of the FFT candidate peaks continue, though the results are only
--    used to collect statistical information in the histogram. This information can then
--    be used for making decisions about changing operating modes.
--
--    The downsampling is performed by six stages of 2:1 half-band decimators. The amount
--    of the downsampling is a power-of-two, and is 64 in this case. The resolution
--    of the FFT output is determined by the size of the FFT, which is fixed at 4096 here, which must
--    also be a power-of-two.
-- ARGUMENTS :
--       Rr    :  real part of the received RF primary training sequence
--       Ri    :  imaginary part of the received RF primaty training sequence
--       p0_r     :  real part of the transmitter-0 primary training sequence template
--       p0_i     :  imaginary part of the transmitter-0 primary training sequence template
--       p1_r     :  real part of the transmitter-1 primary training sequence template
--       p1_i     :  imaginary part of the transmitter-1 primary training sequence template
--       tau_0_est:  estimate of the transmitter-0 differential delay
--       tau_1_est:  estimate of the transmitter-1 differential delay
--       h0_est_r :  real part of the estimate of the transmitter-0 channel
--       h0_est_i :  imaginary part of the estimate of the transmitter-0 channel
--       h1_est_r :  real part of the estimate of the transmitter-1 channel
--       h1_est_i :  imaginary part of the estimate of the transmitter-1 channel
--       freq     :  pointer to the final frequence estimation result.
--       AcqTrack :  pointer to the current mode of the frequency estimator (FE_ACQUIRE, or FE_TRACK)

--
-- Dependencies:
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
-- Start is one clock pulse wide, one clock before new Rr, Ri
--
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 9/2/16 Initial release FZ
-- -------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
library std;
use std.textio.all;
use work.fixed_pkg.all;
USE IEEE.math_real.all;
USE work.Semco_pkg.ALL;

ENTITY FrequencyEstimator IS
      GENERIC(
         FFT_LENGTH  : positive := 4096;
         NDX         : positive := 32
      );
   PORT(
      clk,
      reset,
      ce             : IN  std_logic;
      Variables      : IN  RecordType;
      StartIn,
      ValidIn        : IN  std_logic;
      Rr,
      Ri             : IN  FLOAT_1_LP;
      Tau0Est,
      Tau1Est,
      H0EstR,
      H0EstI,
      H1EstR,
      H1EstI         : IN  STC_Parm;
      Freq           : OUT FLOAT_128K;
      AcqTrack       : OUT AcqTrack_t;
      Done           : OUT std_logic
   );
END FrequencyEstimator;


ARCHITECTURE rtl OF FrequencyEstimator IS

   COMPONENT Decimate512By64 IS
     PORT(
         clk,
         ce,
         reset,
         StartIn        : IN  std_logic;
         X_In           : IN  FLOAT_1_HP;
         Y_Out          : OUT FLOAT_ARRAY_1_HP(0 to 7);
         Done           : OUT std_logic
      );
   END COMPONENT Decimate512By64;

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;
         ADDR_WIDTH  : positive  := 9;
         FILE_IS_SLV : boolean   := false;
         LATENCY     : positive  := 1;
         RAM_TYPE    : string    := "block"
      );
      PORT(
         clk,
         ce,
         reset,
         WrEn           : IN  std_logic;
         WrAddr,
         RdAddrA,
         RdAddrB        : IN  natural range 0 to ADDR_WIDTH-1;
         WrData         : In  std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
         RdOutA,
         RdOutB         : OUT std_logic_vector(DATA_WIDTH-1 DOWNTO 0)
      );
   END COMPONENT RAM_2Reads_1Write;

   COMPONENT xfft_0
     PORT (
       aclk : IN STD_LOGIC;
       aclken : IN STD_LOGIC;
       aresetn : IN STD_LOGIC;
       s_axis_config_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       s_axis_config_tvalid : IN STD_LOGIC;
       s_axis_config_tready : OUT STD_LOGIC;
       s_axis_data_tdata : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
       s_axis_data_tvalid : IN STD_LOGIC;
       s_axis_data_tready : OUT STD_LOGIC;
       s_axis_data_tlast : IN STD_LOGIC;
       m_axis_data_tdata : OUT STD_LOGIC_VECTOR(79 DOWNTO 0);
       m_axis_data_tvalid : OUT STD_LOGIC;
       m_axis_data_tlast : OUT STD_LOGIC;
       event_frame_started : OUT STD_LOGIC;
       event_tlast_unexpected : OUT STD_LOGIC;
       event_tlast_missing : OUT STD_LOGIC;
       event_data_in_channel_halt : OUT STD_LOGIC
     );
   END COMPONENT;

   COMPONENT DFT_Search IS
      GENERIC(
         N           : integer := 4096;
         NDX         : integer := 32
      );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         X_r,
         X_i            : IN  FLOAT_16_LP;
         IndexIn        : IN  sfixed(12 downto -19);
         IndexOffset    : IN  FLOAT_1K;
         Start,
         NextCycle      : IN  std_logic;
         Magnitude      : OUT FLOAT_1K;
         IndexOut       : OUT sfixed(12 downto -19);
         Done           : OUT std_logic
      );
   END COMPONENT DFT_Search;

   COMPONENT p0_r_c
      PORT (
      clka  : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      douta : OUT SLV18;
      clkb  : IN STD_LOGIC;
      addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      doutb : OUT SLV18
   );
   END COMPONENT p0_r_c;

   COMPONENT p0_i_c
      PORT (
      clka  : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      douta : OUT SLV18;
      clkb  : IN STD_LOGIC;
      addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      doutb : OUT SLV18
   );
   END COMPONENT p0_i_c;

   COMPONENT p1_r_c
      PORT (
      clka  : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      douta : OUT SLV18;
      clkb  : IN STD_LOGIC;
      addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      doutb : OUT SLV18
   );
   END COMPONENT p1_r_c;

   COMPONENT p1_i_c
      PORT (
      clka  : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      douta : OUT SLV18;
      clkb  : IN STD_LOGIC;
      addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      doutb : OUT SLV18
   );
   END COMPONENT p1_i_c;

   COMPONENT Ram512x50DP3
      PORT (
         clka  : IN STD_LOGIC;
         wea   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
         dina  : IN STD_LOGIC_VECTOR(49 DOWNTO 0);
         clkb  : IN STD_LOGIC;
         addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
         doutb : OUT STD_LOGIC_VECTOR(49 DOWNTO 0)
      );
   END COMPONENT Ram512x50DP3;

   function BitReverse (IntIn : in integer; Width : in integer) return integer is
     variable reverse   : unsigned(Width downto 0) := (others=>'0');   -- add sign bit of 0 or 1 = 800 which is negative
     variable aa        : unsigned(0 to Width-1);
     variable result    : integer range 0 to 2**Width-1;
   begin
     aa := to_unsigned(IntIn, 12);
     for i in aa'RANGE loop
       reverse(i) := aa(i);
     end loop;
     result := to_integer(reverse);
     return result;
   end;


   CONSTANT R_TOP             : positive := 2*FLOAT_ZERO_16_LP'length-1;
   CONSTANT R_END             : positive := FLOAT_ZERO_16_LP'length;
   CONSTANT I_TOP             : positive := FLOAT_ZERO_16_LP'length-1;
   CONSTANT I_END             : natural := 0;
   CONSTANT IND_START         : INT_ARRAY(0 to 3) := (200, 408, 616, 824);
   CONSTANT LOG2_FFT_LENGTH   : positive := LOG2(FFT_LENGTH);
   CONSTANT PILOT_COUNT_DONE  : positive := NDX + 16;
   CONSTANT CYCLE_MAX         : positive := 2;
   CONSTANT DELTA_F_IND       : FLOAT_64_HP := to_sfixed(FREQ_AMBIGUITY/(FREQ_SAMP/(R*FN)), FLOAT_ZERO_64_HP); -- doesn't change with baud rate
   CONSTANT RR_DELAY          : positive := 4;
   CONSTANT PIPECOUNT5        : positive := 5;

   type     SearchMode_t   is (Idle, FFT_Load, FFT_Wait, Center, Edges, Edges1, FineGrainSearch,
                              Fine1, UpdateHist1, UpdateHist2, UpdateHist3, UpdateHist4, UpdateHist5,
                              UpdateHist6, UpdateHist7, UpdateHist8, UpdateHist9);
   type     STC_PARM_ARRAY is array (natural range <>) of STC_Parm;

   subtype  SFix0DowntoM23    is sfixed(0 downto -23);
   type     SFix0toM23_ARRAY is array (natural range <>) of SFix0DowntoM23;

  -- Signals
   SIGNAL   p0_r,
            p0_i,          -- buffers for stored pilot-template vector products
            p1_r,
            p1_i,
            p0Offset_r,    -- p0/1_r/i with Offset index
            p0Offset_i,
            p1Offset_r,
            p1Offset_i     : Float_1_18;     -- final pilot template results
  SIGNAL    p0H0rr,        -- partial products for p_r, p_i
            p0H0ii,
            p0H0ri,
            p0H0ir,
            p1OffH1rr,
            p1OffH1ii,
            p1OffH1ir,
            p1OffH1ri,
            p1H1rr,
            p1H1ii,
            p1H1ri,
            p1H1ir,
            p0OffH0rr,
            p0OffH0ii,
            p0OffH0ir,
            p0OffH0ri,
            PilotPtr2R,
            PilotPtr2I,
            PilotPtr1R,
            PilotPtr1I,
            PilotPtr0R,
            PilotPtr0I           : FLOAT_1_LP := (others=>'0');
   SIGNAL   p_r, p_i             : FLOAT_2_LP;
   SIGNAL   RrDelay,
            RiDelay              : FLOAT_ARRAY_1_LP(RR_DELAY-1 downto 0) := (others=>(others=>'0'));
   SIGNAL   p0_r_slv,
            p0_i_slv,
            p1_r_slv,
            p1_i_slv,
            p0OffsetRslv,
            p0OffsetIslv,
            p1OffsetRslv,
            p1OffsetIslv         : SLV18;
   SIGNAL   RrPr, RrPi,
            RiPr, RiPi,
            PilotTemplate0R,
            PilotTemplate0I,
            PilotTemplate1R,
            PilotTemplate1I,
            PilotTemplate2R,
            PilotTemplate2I,
            PilotTemplate3R,
            PilotTemplate3I,
            Pilot2Prr,
            Pilot2Pri,
            Pilot2Pir,
            Pilot2Pii,
            Pilot1Prr,
            Pilot1Pri,
            Pilot1Pir,
            Pilot1Pii,
            Pilot0Prr,
            Pilot0Pri,
            Pilot0Pir,
            Pilot0Pii      : FLOAT_1_HP := (others=>'0'); --double;
            -- buffers for downsampled pilot_template vector products
   SIGNAL   PilotTemplateDown3R,
            PilotTemplateDown3I,
            PilotTemplateDown2R,
            PilotTemplateDown2I,
            PilotTemplateDown1R,
            PilotTemplateDown1I,
            PilotTemplateDown0R,
            PilotTemplateDown0I  : FLOAT_ARRAY_1_HP(0 to 7);
   SIGNAL   PilotTemplateDownR,
            PilotTemplateDownI   : SFix0toM23_ARRAY(0 to 4095) := (others=>(others=>'0'));
   SIGNAL   PilotDownSlvR,
            PilotDownSlvI        : std_logic_vector(23 downto 0);
   SIGNAL   FE_FFT_Out_slv       : std_logic_vector(79 downto 0); -- fixed by FFT
   SIGNAL   FE_FFT_R,
            FE_FFT_I             : sfixed(13 downto -23);
   SIGNAL   SquareRe,
            SquareIm,
            ComplexAbs,
            FftMaxValue          : FLOAT_16K := (others=>'0');
   SIGNAL   DFT_InputsR,
            DFT_InputsI          : FLOAT_ARRAY_1_HP(0 to NDX-1);
   SIGNAL   PilotPtr2,
            PilotPtr1,
            PilotPtr0,
            PilotBufWrData,
            PilotBufArd,
            PilotBufBrd,
            PilotBufCrd          : std_logic_vector(R_TOP downto 0);
   SIGNAL   MuxCntr              : natural range 0 to 2;
   SIGNAL   RomPntr,
            BufCntrMinusOffset   : std_logic_vector(8 downto 0);
   SIGNAL   PR_Count,
            BufCntr,
            Offset,
            DiffBtoO             : natural range 0 to PILOT_LENGTH_4+RR_DELAY+2;
   SIGNAL   PilotCount           : natural range 0 to PILOT_COUNT_DONE;
   SIGNAL   DFT_Count            : natural range 0 to NDX-1;
   SIGNAL   CycleCount_Ila,
            CycleCount           : natural range 0 to CYCLE_MAX + 1;
   SIGNAL   WrEnPilotA,
            WrEnPilotB,
            WrEnPilotC           : std_logic_vector(0 downto 0);
   SIGNAL   PilotIndex_Ila,
            PilotIndex,
            PilotDelay1,
            PilotDelay2          : natural range 0 to 4096;
   SIGNAL   NaturalCount,
            FftIndex,
            FftIndex2            : natural range 0 to 4095;
   SIGNAL   Push,
            StartDFT_A,
            StartDFT_B,
            CycleDFT_A,
            CycleDFT_B,
            StartDec64,
            DoneDec64,
            DFT_DoneA,
            DFT_DoneB,
            FirstTime,
            FftReady,
            ValidFftOutDly,
            ValidOutFFT,
            TemplateActive,
            FftTLast,
            ValidInFFT           : std_logic;
   SIGNAL   MaxValue,
            DFT_ValueA,
            DFT_ValueB           : FLOAT_1K;
   SIGNAL   PipeLine             : natural range 0 to 10;
   SIGNAL   HistogramBin         : integer range -40 to 46;
   SIGNAL   DataGatherCycle      : natural range 0 to 100;
   SIGNAL   MaxIndex,
            DFT_IndexInA,
            DFT_IndexInB,
            DFT_IndexA,
            DFT_IndexB,
            IndexOffset          : sfixed(12 downto -19);
   SIGNAL   Max2ValRatio         : sfixed(5 downto -5);
   SIGNAL   FreqCoarse,
            HistCntrFreq,
            FreqEst,
            DeltaOverAmbig,
            HistFreqAmbgty,
            DeltaFreq            : FLOAT_128K;
   SIGNAL   Histogram            : INT8F_ARRAY(0 to 12); -- Hist is sfixed for timing int to sfixed
   signal   Max1Hist,
            Max2Hist             : integer range 0 to 13;
   SIGNAL   DftOffset            : FLOAT_64_HP;
   SIGNAL   SearchMode           : SearchMode_t;
   SIGNAL   Max1Val,
            Max2Val              : sfixed(5 downto -5);
   SIGNAL   Max2OffTimeAmb            : FLOAT_16K;
   SIGNAL   RoundUpDeltaAmbig    : INT8f;
   SIGNAL   Max1Val_s,
            Max2Val_s            : sfixed(6 downto -5);
   SIGNAL   Max2Minus6           : sfixed(3 downto 0);


   signal   rsq, isq, root, max  : real;   -- test points
   signal   NaturalOrder         : float_array_1K(0 to 4095) := (others=>(others=>'0'));

   signal   DFT_DoneA_Ila,
            DFT_DoneB_Ila        : std_logic;
   signal   MaxValue_Ila         : sfixed(14+10 downto 14-14); -- Float_1k
   signal   FreqCoarse_Ila,
            HistCntrFreq_Ila,
            FreqEst_Ila          : sfixed(7+17 downto 7-7);
   signal   MaxIndex_Ila,
            DFT_IndexInA_Ila,
            DFT_IndexInB_Ila     : sfixed(19+12 downto 19-19);
   signal   FftMaxValue_Ila      : sfixed(10+14 downto 10-10);
   signal   NaturalRead,
            DFT_ValueA_Ila,
            DFT_ValueB_Ila       : sfixed(24+0 downto 24-24);
   signal   DFT_IndexA_Ila,
            DFT_IndexB_Ila       : sfixed(12+19 downto 19-19);
   signal   DFT_R_Ila,
            DFT_I_Ila            : sfixed(20+4 downto 20-20);
   attribute mark_debug : string;
   attribute mark_debug of NaturalRead          : signal is "true";
   attribute mark_debug of AcqTrack             : signal is "true";
   attribute mark_debug of MaxValue_Ila         : signal is "true";
   attribute mark_debug of MaxIndex_Ila         : signal is "true";
   attribute mark_debug of FftMaxValue_Ila      : signal is "true";
   attribute mark_debug of DataGatherCycle      : signal is "true";
   attribute mark_debug of HistCntrFreq_Ila     : signal is "true";
   attribute mark_debug of FreqCoarse_Ila       : signal is "true";
   attribute mark_debug of FreqEst_Ila          : signal is "true";
   attribute mark_debug of SearchMode           : signal is "true";
   attribute mark_debug of DFT_R_Ila            : signal is "true";
   attribute mark_debug of DFT_I_Ila            : signal is "true";
   attribute mark_debug of DFT_ValueA_Ila       : signal is "true";
   attribute mark_debug of DFT_IndexA_Ila       : signal is "true";
   attribute mark_debug of DFT_IndexInA_Ila     : signal is "true";
   attribute mark_debug of DFT_DoneA_Ila        : signal is "true";
   attribute mark_debug of DFT_ValueB_Ila       : signal is "true";
   attribute mark_debug of DFT_IndexB_Ila       : signal is "true";
   attribute mark_debug of DFT_IndexInB_Ila     : signal is "true";
   attribute mark_debug of DFT_DoneB_Ila        : signal is "true";

BEGIN

   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         DFT_R_Ila         <= DFT_InputsR(DFT_Count);
         DFT_I_Ila         <= DFT_InputsI(DFT_Count);
         DFT_ValueA_Ila    <= DFT_ValueA;
         DFT_IndexA_Ila    <= DFT_IndexA;
         DFT_IndexInA_Ila  <= DFT_IndexInA;
         DFT_DoneA_Ila     <= DFT_DoneA;
         DFT_ValueB_Ila    <= DFT_ValueB;
         DFT_IndexB_Ila    <= DFT_IndexB;
         DFT_IndexInB_Ila  <= DFT_IndexInB;
         DFT_DoneB_Ila     <= DFT_DoneB;
         HistCntrFreq_Ila  <= HistCntrFreq;
         FreqCoarse_Ila    <= FreqCoarse;
         FreqEst_Ila       <= FreqEst;
         FftMaxValue_Ila   <= FftMaxValue;
         MaxValue_Ila      <= MaxValue;
         MaxIndex_Ila      <= MaxIndex;
      end if;
   end process;


   Offset   <= to_integer((Tau1Est - Tau0Est)*NB_4 + 0.5) when (Tau1Est > Tau0Est) else
               to_integer((Tau0Est - Tau1Est)*NB_4 + 0.5);     -- round to nearest sample
   DiffBtoO <= BufCntr - Offset;
   BufCntrMinusOffset   <= std_logic_vector(to_unsigned(DiffBtoO, 9)) when (DiffBtoO >= 0) else 9x"00";
   RomPntr              <= std_logic_vector(to_unsigned(BufCntr, 9));

  Delay_process: process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            Push           <= '0';
            StartDec64     <= '0';
            TemplateActive <= '0';
            MuxCntr        <= 2; -- first start will set it to 0
            BufCntr        <= 0;
            PR_Count       <= 0;
            p_r            <= (others=>'0');
            p_i            <= (others=>'0');
            p0_r           <= (others=>'0');
            p0_i           <= (others=>'0');
            p1_r           <= (others=>'0');
            p1_i           <= (others=>'0');
            p0Offset_r     <= (others=>'0');
            p0Offset_i     <= (others=>'0');
            p1Offset_r     <= (others=>'0');
            p1Offset_i     <= (others=>'0');
            PilotPtr2R     <= (others=>'0');
            PilotPtr2I     <= (others=>'0');
            PilotPtr1R     <= (others=>'0');
            PilotPtr1I     <= (others=>'0');
            PilotPtr0R     <= (others=>'0');
            PilotPtr0I     <= (others=>'0');
            RrPr           <= (others=>'0');
            RrPi           <= (others=>'0');
            RiPr           <= (others=>'0');
            RiPi           <= (others=>'0');
            Pilot2Prr      <= (others=>'0');
            Pilot2Pri      <= (others=>'0');
            Pilot2Pir      <= (others=>'0');
            Pilot2Pii      <= (others=>'0');
            Pilot1Prr      <= (others=>'0');
            Pilot1Pri      <= (others=>'0');
            Pilot1Pir      <= (others=>'0');
            Pilot1Pii      <= (others=>'0');
            Pilot0Prr      <= (others=>'0');
            Pilot0Pri      <= (others=>'0');
            Pilot0Pir      <= (others=>'0');
            Pilot0Pii      <= (others=>'0');
            PilotTemplate3R   <= (others=>'0');
            PilotTemplate3I   <= (others=>'0');
            PilotTemplate2R   <= (others=>'0');
            PilotTemplate2I   <= (others=>'0');
            PilotTemplate1R   <= (others=>'0');
            PilotTemplate1I   <= (others=>'0');
            PilotTemplate0R   <= (others=>'0');
            PilotTemplate0I   <= (others=>'0');
            p0H0rr         <= (others=>'0');
            p0H0ii         <= (others=>'0');
            p0H0ri         <= (others=>'0');
            p0H0ir         <= (others=>'0');
            p1OffH1rr      <= (others=>'0');
            p1OffH1ii      <= (others=>'0');
            p1OffH1ir      <= (others=>'0');
            p1OffH1ri      <= (others=>'0');
            p1H1rr         <= (others=>'0');
            p1H1ii         <= (others=>'0');
            p1H1ri         <= (others=>'0');
            p1H1ir         <= (others=>'0');
            p0OffH0rr      <= (others=>'0');
            p0OffH0ii      <= (others=>'0');
            p0OffH0ir      <= (others=>'0');
            p0OffH0ri      <= (others=>'0');
            RrDelay        <= (others=>(others=>'0'));
            RiDelay        <= (others=>(others=>'0'));
         elsif ce = '1' then
            if (StartIn = '1') then   -- note, Start is one clock pulse wide, one clock before new Rr, Ri
            -- pipeline count = 0
               BufCntr        <= 0;
               PR_Count       <= 0;
               Push           <= '1';
               TemplateActive <= '1';
               if (MuxCntr < 2) then
                  MuxCntr <= MuxCntr + 1;
               else
                  MuxCntr <= 0;
               end if;
               p_r         <= (others=>'0');
               p_i         <= (others=>'0');
               p0H0rr      <= (others=>'0');
               p0H0ii      <= (others=>'0');
               p0H0ri      <= (others=>'0');
               p0H0ir      <= (others=>'0');
               p1OffH1rr   <= (others=>'0');
               p1OffH1ii   <= (others=>'0');
               p1OffH1ir   <= (others=>'0');
               p1OffH1ri   <= (others=>'0');
               p1H1rr      <= (others=>'0');
               p1H1ii      <= (others=>'0');
               p1H1ri      <= (others=>'0');
               p1H1ir      <= (others=>'0');
               p0OffH0rr   <= (others=>'0');
               p0OffH0ii   <= (others=>'0');
               p0OffH0ir   <= (others=>'0');
               p0OffH0ri   <= (others=>'0');
               RrDelay     <= (others=>(others=>'0'));
               RiDelay     <= (others=>(others=>'0'));
            end if;
            if (TemplateActive) then
               -- pipeline count = 1
               p0_r        <= resize(to_sfixed(p0_r_slv, 0, -31), p0_r);    -- retrieve data from buffers
               p0_i        <= resize(to_sfixed(p0_i_slv, 0, -31), p0_i);   -- TODO, resize memory to fit p's
               p1_r        <= resize(to_sfixed(p1_r_slv, 0, -31), p1_r);
               p1_i        <= resize(to_sfixed(p1_i_slv, 0, -31), p1_i);
               p0Offset_r  <= resize(to_sfixed(p0OffsetRslv, 0, -31), p0Offset_r);
               p0Offset_i  <= resize(to_sfixed(p0OffsetIslv, 0, -31), p0Offset_i);
               p1Offset_r  <= resize(to_sfixed(p1OffsetRslv, 0, -31), p1Offset_r);
               p1Offset_i  <= resize(to_sfixed(p1OffsetIslv, 0, -31), p1Offset_i);
               -- pipeline count = 2
               p0H0rr      <= resize(p0_r*H0EstR, p0H0rr);  -- partial products for p_r, p_i
               p0H0ii      <= resize(p0_i*H0EstI, p0H0ii);
               p0H0ri      <= resize(p0_i*H0EstR , p0H0ri);
               p0H0ir      <= resize(p0_r*H0EstI , p0H0ir);
               p1OffH1rr   <= resize(p1Offset_r*H1EstR , p1OffH1rr);
               p1OffH1ii   <= resize(p1Offset_i*H1EstI , p1OffH1ii);
               p1OffH1ir   <= resize(p1Offset_i*H1EstR , p1OffH1ir);
               p1OffH1ri   <= resize(p1Offset_i*H1EstI , p1OffH1ri);
               p1H1rr      <= resize(p1_r*H1EstR, p1H1rr);
               p1H1ii      <= resize(p1_i*H1EstI, p1H1ii);
               p1H1ri      <= resize(p1_i*H1EstR , p1H1ri);
               p1H1ir      <= resize(p1_r*H1EstI , p1H1ir);
               p0OffH0rr   <= resize(p0Offset_r*H0EstR , p0OffH0rr);
               p0OffH0ii   <= resize(p0Offset_i*H0EstI , p0OffH0ii);
               p0OffH0ir   <= resize(p0Offset_i*H0EstR , p0OffH0ir);
               p0OffH0ri   <= resize(p0Offset_i*H0EstI , p0OffH0ri);
               -- pipeline count = 3
               -- update the pilot template with the estimates of the channel gains
               if (Tau1Est > Tau0Est) then
                  if (BufCntr < Offset+1) then
                     p_r <= resize(p0H0rr - p0H0ii, p_r) ;
                     p_i <= resize(p0H0ir + p0H0ri, p_i);
                  else
                     p_r <= resize(p0H0rr - p0H0ii + p1OffH1rr - p1OffH1ii, p_r);
                     p_i <= resize(p0H0ir + p0H0ri + p1OffH1ir + p1OffH1ri, p_i);
                  end if;
               else
                  if (BufCntr < Offset+1) then
                     p_r <= resize(p1H1rr - p1H1ii, p_r);
                     p_i <= resize(p1H1ir + p1H1ri, p_i);
                  else
                     p_r <= resize(p1H1rr - p1H1ii + p0OffH0rr - p0OffH0ii, p_r);
                     p_i <= resize(p1H1ir + p1H1ri + p0OffH0ir + p0OffH0ri, p_i);
                  end if;
               end if;
               -- these buffers have latency of 3 to match pipeline count of 3
               PilotPtr2R  <= to_sfixed(PilotPtr2(R_TOP downto R_END), PilotPtr2R);
               PilotPtr2I  <= to_sfixed(PilotPtr2(I_TOP downto I_END), PilotPtr2I);
               PilotPtr1R  <= to_sfixed(PilotPtr1(R_TOP downto R_END), PilotPtr1R);
               PilotPtr1I  <= to_sfixed(PilotPtr1(I_TOP downto I_END), PilotPtr1I);
               PilotPtr0R  <= to_sfixed(PilotPtr0(R_TOP downto R_END), PilotPtr0R);
               PilotPtr0I  <= to_sfixed(PilotPtr0(I_TOP downto I_END), PilotPtr0I);
               -- pipeline count = 4, compute and store the pilot-template vector product
               RrPr              <= resize(RrDelay(RR_DELAY-1) * p_r, RrPr);
               RrPi              <= resize(RrDelay(RR_DELAY-1) * p_i, RrPi);
               RiPr              <= resize(RiDelay(RR_DELAY-1) * p_r, RiPr);
               RiPi              <= resize(RiDelay(RR_DELAY-1) * p_i, RiPi);
               Pilot2Prr         <= resize(PilotPtr2R          * p_r, Pilot2Prr);
               Pilot2Pri         <= resize(PilotPtr2R          * p_i, Pilot2Pri);
               Pilot2Pir         <= resize(PilotPtr2I          * p_r, Pilot2Pir);
               Pilot2Pii         <= resize(PilotPtr2I          * p_i, Pilot2Pii);
               Pilot1Prr         <= resize(PilotPtr1R          * p_r, Pilot1Prr);
               Pilot1Pri         <= resize(PilotPtr1R          * p_i, Pilot1Pri);
               Pilot1Pir         <= resize(PilotPtr1I          * p_r, Pilot1Pir);
               Pilot1Pii         <= resize(PilotPtr1I          * p_i, Pilot1Pii);
               Pilot0Prr         <= resize(PilotPtr0R          * p_r, Pilot0Prr);
               Pilot0Pri         <= resize(PilotPtr0R          * p_i, Pilot0Pri);
               Pilot0Pir         <= resize(PilotPtr0I          * p_r, Pilot0Pir);
               Pilot0Pii         <= resize(PilotPtr0I          * p_i, Pilot0Pii);
               -- pipeline count = 5
               if (BufCntr < 4 + PIPECOUNT5) or (BufCntr >=PILOT_LENGTH_4 + PIPECOUNT5 - 7) then -- zero first 4 and last 7 values
                  PilotTemplate3R   <= FLOAT_ZERO_1_HP;
                  PilotTemplate3I   <= FLOAT_ZERO_1_HP;
                  PilotTemplate2R   <= FLOAT_ZERO_1_HP;
                  PilotTemplate2I   <= FLOAT_ZERO_1_HP;
                  PilotTemplate1R   <= FLOAT_ZERO_1_HP;
                  PilotTemplate1I   <= FLOAT_ZERO_1_HP;
                  PilotTemplate0R   <= FLOAT_ZERO_1_HP;
                  PilotTemplate0I   <= FLOAT_ZERO_1_HP;
               else
                  PilotTemplate3R   <= resize(RrPr + RiPi, PilotTemplate3R); -- use just calculated p_r/i, complex multiply by RF to drive DecBy64
                  PilotTemplate3I   <= resize(RiPr - RrPi, PilotTemplate3I); -- needed to negate p_i
                  PilotTemplate2R   <= resize(Pilot2Prr + Pilot2Pii, PilotTemplate2R);
                  PilotTemplate2I   <= resize(Pilot2Pir - Pilot2Pri, PilotTemplate2I); -- needed to negate p_i
                  PilotTemplate1R   <= resize(Pilot1Prr + Pilot1Pii, PilotTemplate1R);
                  PilotTemplate1I   <= resize(Pilot1Pir - Pilot1Pri, PilotTemplate1I); -- needed to negate p_i
                  PilotTemplate0R   <= resize(Pilot0Prr + Pilot0Pii, PilotTemplate0R);
                  PilotTemplate0I   <= resize(Pilot0Pir - Pilot0Pri, PilotTemplate0I); -- needed to negate p_i
               end if;
               if (BufCntr < PILOT_LENGTH_4-1) then
                  BufCntr <= BufCntr + 1;
               end if;
               if (PR_Count < PILOT_LENGTH_4 + RR_DELAY) then
                  PR_Count <= PR_Count + 1;
               else
                  TemplateActive <= '0';
               end if;
               if (PR_Count = PILOT_LENGTH_4-1) then
                  Push <= '0';
               end if;
               if (BufCntr = 4) then
                  StartDec64 <= '1';
               else
                  StartDec64 <= '0';
               end if;
               if (ValidIn) then
                  RrDelay <= RrDelay(RR_DELAY-2 downto 0) & Rr;
                  RiDelay <= RiDelay(RR_DELAY-2 downto 0) & Ri;
               end if;
            end if;
         end if;
      end if;
   end process Delay_process;


   p0_r_u : RAM_2Reads_1Write -- data is stored as sfixed32.31, will resize on read as desired
      GENERIC MAP(
         FILENAME    => "C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\p0_r_pt31.slv",
         DATA_WIDTH  => 32,
         BINPT       => -31,
         ADDR_WIDTH  => BUF_ADDR_WIDTH,
         FILE_IS_SLV => true,
         LATENCY     => 1,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => BufCntr,
         RdAddrA     => BufCntr,
         RdAddrB     => BufCntrMinusOffset,
         WrData      => (others=>'0'),
         RdOutA      => p0_r_slv,
         RdOutB      => p0OffsetRslv
      );

   p0_i_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\p0_i_pt31.slv",
         DATA_WIDTH  => 32,
         BINPT       => -31,
         ADDR_WIDTH  => BUF_ADDR_WIDTH,
         FILE_IS_SLV => true,
         LATENCY     => 1,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => BufCntr,
         RdAddrA     => BufCntr,
         RdAddrB     => BufCntrMinusOffset,
         WrData      => (others=>'0'),
         RdOutA      => p0_i_slv,
         RdOutB      => p0OffsetIslv
      );

   p1_r_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\p1_r_pt31.slv",
         DATA_WIDTH  => 32,
         BINPT       => -31,
         ADDR_WIDTH  => BUF_ADDR_WIDTH,
         FILE_IS_SLV => true,
         LATENCY     => 1,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => BufCntr,
         RdAddrA     => BufCntr,
         RdAddrB     => BufCntrMinusOffset,
         WrData      => (others=>'0'),
         RdOutA      => p1_r_slv,
         RdOutB      => p1OffsetRslv
      );
   p1_i_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\p1_i_pt31.slv",
         DATA_WIDTH  => 32,
         BINPT       => -31,
         ADDR_WIDTH  => BUF_ADDR_WIDTH,
         FILE_IS_SLV => true,
         LATENCY     => 1,
         RAM_TYPE    => "block"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => BufCntr,
         RdAddrA     => BufCntr,
         RdAddrB     => BufCntrMinusOffset,
         WrData      => (others=>'0'),
         RdOutA      => p1_i_slv,
         RdOutB      => p1OffsetIslv
      );

   WrEnPilotA <= '1' when (Push = '1') and (MuxCntr = 0) else '0';
   PilotBufWrData <= to_slv(Rr) & to_slv(Ri);  -- allow one clk    read delay

   PilotBufA : RAM_2Reads_1Write
      generic map (
         LATENCY    => 3,     -- allow 3 clocks to align with first Rr data
         DATA_WIDTH => 2*FLOAT_1_LP'length,
         BINPT       => FLOAT_ZERO_1_lP'right,
         ADDR_WIDTH => BUF_ADDR_WIDTH,
         FILENAME    => "",
         RAM_TYPE    => "block"
      )
      port map(
         clk         => clk,
         ce          => ce,
         reset       => StartIn,
         WrEn        => WrEnPilotA,
         WrData      => PilotBufWrData,
         WrAddr      => BufCntr,
         RdAddrA     => BufCntr,
         RdAddrB     => 0,
         RdOutA      => PilotBufArd,
         RdOutB      => open
     );

   WrEnPilotB <= '1' when (Push = '1') and (MuxCntr = 1) else '0';

   PilotBufB : RAM_2Reads_1Write
      generic map (
         LATENCY    => 3,
         DATA_WIDTH => 2*FLOAT_1_LP'length,
         BINPT       => FLOAT_ZERO_1_lP'right,
         ADDR_WIDTH => BUF_ADDR_WIDTH,
         FILENAME    => "",
         RAM_TYPE    => "block"
      )
      port map(
         clk         => clk,
         ce          => ce,
         reset       => StartIn,
         WrEn        => WrEnPilotB,
         WrData      => PilotBufWrData,
         WrAddr      => BufCntr,
         RdAddrA     => BufCntr,
         RdAddrB     => 0,
         RdOutA      => PilotBufBrd,
         RdOutB      => open
     );

   WrEnPilotC <= '1' when (Push = '1') and (MuxCntr = 2) else '0';

   PilotBufC : RAM_2Reads_1Write
      generic map (
         LATENCY    => 3,
         DATA_WIDTH => 2*FLOAT_1_LP'length,
         BINPT       => FLOAT_ZERO_1_lP'right,
         ADDR_WIDTH => BUF_ADDR_WIDTH,
         FILENAME    => "",
         RAM_TYPE    => "block"
      )
      port map(
         clk         => clk,
         ce          => ce,
         reset       => StartIn,
         WrEn        => WrEnPilotC,
         WrData      => PilotBufWrData,
         WrAddr      => BufCntr,
         RdAddrA     => BufCntr,
         RdAddrB     => 0,
         RdOutA      => PilotBufCrd,
         RdOutB      => open
     );

-- Decimate the PilotTemplates by 64
   Dec64A_R : Decimate512By64
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartDec64,
         X_In        => PilotTemplate3R,
         Y_Out       => PilotTemplateDown3R,
         Done        => DoneDec64
      );

   Dec64A_I : Decimate512By64
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartDec64,
         X_In        => PilotTemplate3I,
         Y_Out       => PilotTemplateDown3I,
         Done        => open
      );

   Dec64B_R : Decimate512By64
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartDec64,
         X_In        => PilotTemplate2R,
         Y_Out       => PilotTemplateDown2R,
         Done        => open
      );

   Dec64B_I : Decimate512By64
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartDec64,
         X_In        => PilotTemplate2I,
         Y_Out       => PilotTemplateDown2I,
         Done        => open
      );

   Dec64C_R : Decimate512By64
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartDec64,
         X_In        => PilotTemplate1R,
         Y_Out       => PilotTemplateDown1R,
         Done        => open
      );

   Dec64C_I : Decimate512By64
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartDec64,
         X_In        => PilotTemplate1I,
         Y_Out       => PilotTemplateDown1I,
         Done        => open
      );

   Dec64D_R : Decimate512By64
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartDec64,
         X_In        => PilotTemplate0R,
         Y_Out       => PilotTemplateDown0R,
         Done        => open
      );

   Dec64D_I : Decimate512By64
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartDec64,
         X_In        => PilotTemplate0I,
         Y_Out       => PilotTemplateDown0I,
         Done        => open
      );

   PeakSrch : process (clk)
      variable HistBinRemain_v,
               HistFreqAmbgty_v,
               HCFoverFreqRes_v  : FLOAT_128K;
      variable MyLine            : line;
      variable Histogram_v       : INT8F_ARRAY(0 to 12);
      variable BitReverse_v,
               IndexFlip_v       : integer range 0 to 4095;
      variable Signed4K_v        : signed(12 downto 0);
   begin
      if (rising_edge(clk)) then
         if (reset) then
            SquareRe          <= (others=>'0');
            SquareIm          <= (others=>'0');
            ComplexAbs        <= (others=>'0');
            FftMaxValue       <= (others=>'0');
            PilotIndex        <= 0;
            PilotDelay1       <= 0;
            PilotDelay2       <= 0;
            PilotCount        <= 0;
            NaturalCount      <= 0;
            FftIndex          <= 0;
            FftIndex2         <= 0;
            FirstTime         <= '1';
            StartDFT_A        <= '0';
            StartDFT_B        <= '0';
            CycleDFT_A        <= '0';
            CycleDFT_B        <= '0';
            Done              <= '0';
            ValidInFFT        <= '0';
            ValidFftOutDly    <= '0';
            CycleCount        <= 0;
            DataGatherCycle   <= 0;
            PipeLine          <= 0;
            HistogramBin      <= 0;
            Max1Hist          <= 0;
            Max2Hist          <= 6;   -- Hist(6) = 1 at restart
            SearchMode        <= Idle;
            AcqTrack          <= Acquire;
            MaxValue          <= (others=>'0');
            MaxIndex          <= (others=>'0');
            IndexOffset       <= (others=>'0');
            DFT_IndexInA      <= (others=>'0');
            DFT_IndexInB      <= (others=>'0');
            FreqCoarse        <= (others=>'0');
            FreqEst           <= (others=>'0');
            Freq              <= (others=>'0');
            HistCntrFreq      <= (others=>'0');
            Histogram         <= (6=>x"01", others=>x"00");
            Max2OffTimeAmb         <= (others=>'0');
            HistFreqAmbgty    <= (others=>'0');
            DeltaFreq         <= (others=>'0');
            DeltaOverAmbig    <= (others=>'0');
            RoundUpDeltaAmbig <= (others=>'0');
            Max2ValRatio      <= (others=>'0');
            Max2Minus6        <= (others=>'0');
            FE_FFT_R          <= (others=>'0');
            FE_FFT_I          <= (others=>'0');
         elsif (ce) then
            if (NaturalCount < 4095) then
               NaturalCount <= NaturalCount + 1;
            end if;
            ValidFftOutDly <= ValidOutFFT;
            FE_FFT_R       <= to_sfixed(FE_FFT_Out_slv(36 downto 0), FE_FFT_R);
            FE_FFT_I       <= to_sfixed(FE_FFT_Out_slv(76 downto 40), FE_FFT_I);
            Case SearchMode is
               when Idle =>
                  if (DoneDec64) then
                     PilotIndex     <= 0;
                     SearchMode     <= FFT_Load;
                  end if;
                  Done <= '0';
                  PipeLine <= 0;
               when FFT_Load =>
                  if (PilotIndex = 4095) then
                     ValidInFFT        <= '0';
                     PilotIndex        <= 0;
                     PilotDelay1       <= 0;
                     PilotDelay2       <= 0;
                     FftMaxValue       <= (others=>'0');
                     SearchMode        <= FFT_Wait;
                  elsif (PilotIndex = 0) and (ValidInFFT = '0') then
                     ValidInFFT     <= '1';       -- assumes RAM reads are immediate since only 32 nonzero elements
                  elsif FftReady then              -- don't count if FftReady blips low
                     PilotIndex <= PilotIndex + 1; -- count 4096 samples into FFT. Note only 32 samples are nonzero
                  end if;
               when FFT_Wait =>  -- Start DFTs on two largest peaks in FFT since we have two DFT engines already
/*                      C program max_ind = 1417 @ -100_000 Note, first pass is always off since only one set of values
                                            1480 @ -90000
                                            1846 @ -35000
                                            1984 @ -10000
                                            2044 @ -500
                                            2050 @  500
                                            2110 @  10000
                                            2248 @  35000
                                            2614 @  90000
                                            2677 @  100_000
*/
                  PilotDelay1 <= PilotIndex;
                  PilotDelay2 <= PilotDelay1;
                  if (ValidFftOutDly = '1') and (PilotIndex < 4095) then
                     PilotIndex  <= PilotIndex + 1;   -- reuse counter for output
                  end if;
                  if (PilotDelay2 < 4095) then   -- find two peaks of fft output
                     StartDFT_A     <= '0';
                     CycleDFT_A     <= '0';
                     SquareRe    <= resize(FE_FFT_R * FE_FFT_R, SquareRe);
                     SquareIm    <= resize(FE_FFT_I * FE_FFT_I, SquareIm);
                     ComplexAbs  <= resize(SquareRe + SquareIm, ComplexAbs);
                     BitReverse_v := BitReverse(PilotDelay2, 12);  -- allow time for Abs function
                     if (BitReverse_v < FFT_LENGTH/2 + 1) then
                        IndexFlip_v := BitReverse_v + FFT_LENGTH/2 - 1; -- 0 => 2047, 2048 => 4095
                     else
                        IndexFlip_v := BitReverse_v - FFT_LENGTH/2 - 1;  -- 4095 => 2046, 2049 => 0
                     end if;
                     NaturalOrder(IndexFlip_v) <= ComplexAbs;  -- store result in natural order
                     if (ComplexAbs > FftMaxValue) then
                        FftMaxValue <= ComplexAbs;
                        FftIndex    <= IndexFlip_v;   -- save two largest results
                        FftIndex2   <= FftIndex;
                     end if;
                  else
                     StartDFT_A     <= '1';
                     CycleDFT_A     <= '1';
                     StartDFT_B     <= '1';
                     CycleDFT_B     <= '1';
                     PilotIndex     <= 0;
                     PilotDelay1    <= 0;
                     PilotDelay2    <= 0;
                     NaturalCount   <= 0; -- scan NaturalOrder spectrum
                     CycleCount     <= 1; -- sometimes the peaks are barely larger and grab the wrong one
                     Signed4K_v     := to_signed(FftIndex, Signed4K_v);   -- do cast in two steps to avoid long delays
                     DFT_IndexInA   <= to_sfixed(Signed4K_v, DFT_IndexInA);
                     Signed4K_v     := to_signed(FftIndex2, Signed4K_v);
                     DFT_IndexInB   <= to_sfixed(Signed4K_v, DFT_IndexInB);
                     PilotCount     <= 0;
                     SearchMode     <= Center;
                  end if;
               when Center =>
                  -- dft_search((double)max_ind,
                  --          input_buf_r,input_buf_i,FFT_INPUT_LENGTH,FN,
                  --          &y[3],&x[3]);
                  if (DFT_DoneA = '1' and DFT_DoneB = '1' and PilotCount > 2) then  -- Done tends to be two clocks wide
                     -- find greater of two peaks, setting index to result
                     if (DFT_ValueA > DFT_ValueB) then
                        MaxValue       <= DFT_ValueA;
                        MaxIndex       <= DFT_IndexA;
                        DFT_IndexInA   <= resize(DFT_IndexA - DELTA_F_IND, DFT_IndexInA);
                        DFT_IndexInB   <= resize(DFT_IndexA + DELTA_F_IND, DFT_IndexInB);
                     else
                        MaxValue       <= DFT_ValueB;
                        MaxIndex       <= DFT_IndexB;
                        DFT_IndexInA   <= resize(DFT_IndexB - DELTA_F_IND, DFT_IndexInA);
                        DFT_IndexInB   <= resize(DFT_IndexB + DELTA_F_IND, DFT_IndexInB);
                     end if;
                     CycleCount     <= 0;
                     SearchMode     <= Edges;
                     PipeLine       <= 0;
                     PilotCount     <= 0;
                     StartDFT_A     <= '1';
                     CycleDFT_A     <= '1';
                     StartDFT_B     <= '1';
                     CycleDFT_B     <= '1';
                  elsif (PilotCount < PILOT_COUNT_DONE) then
                     StartDFT_A <= '0';
                     CycleDFT_A <= '0';
                     StartDFT_B <= '0';
                     CycleDFT_B <= '0';
                     PilotCount <= PilotCount + 1;
                  else
                     PilotCount <= 0;  -- keep resending search data till it's done
                     CycleDFT_A <= '1';
                     CycleDFT_B <= '1';
                  end if;
               when Edges =>
                     -- for(i=2; i>=0; i--)
                     -- {
                     --    max_ind_f = x[i+1] - delta_f_ind;
                     --    dft_search((double)max_ind_f,
                     --             input_buf_r,input_buf_i,FFT_INPUT_LENGTH,FN,
                     --             &y[i],&x[i]);
                     -- }
                     -- for(i=4; i<=6; i++)
                     -- {
                     --    max_ind_f = x[i-1] + delta_f_ind;
                     --    dft_search((double)max_ind_f,
                     --             input_buf_r,input_buf_i,FFT_INPUT_LENGTH,FN,
                     --             &y[i],&x[i]);
                     -- }
                     -- the 'PilotCount > 2' is to insure Dones are cleared from previous action
                  if (DFT_DoneA = '1' and DFT_DoneB = '1' and PilotCount > 2) then  -- initial search done, check ±3
                     if (DFT_ValueA > MaxValue) and (DFT_ValueA >= DFT_ValueB) then   -- find Max of Current Max, MaxA or MaxB
                        MaxValue <= DFT_ValueA;
                        MaxIndex <= DFT_IndexA;
                     elsif (DFT_ValueB > MaxValue) and (DFT_ValueB >= DFT_ValueA) then
                        MaxValue <= DFT_ValueB;
                        MaxIndex <= DFT_IndexB;
                     end if;
                     SearchMode <= Edges1;
                 elsif (PilotCount < PILOT_COUNT_DONE) then
                     StartDFT_A <= '0';
                     StartDFT_B <= '0';
                     CycleDFT_A <= '0';
                     CycleDFT_B <= '0';
                     PilotCount <= PilotCount + 1;
                  else
                     CycleDFT_A <= '1';
                     CycleDFT_B <= '1';
                     PilotCount <= 0;
                  end if;
               when Edges1 =>
                  if (CycleCount < CYCLE_MAX) then
                     CycleCount     <= CycleCount + 1;
                     DFT_IndexInA   <= resize(DFT_IndexA - DELTA_F_IND, DFT_IndexInA);
                     DFT_IndexInB   <= resize(DFT_IndexB + DELTA_F_IND, DFT_IndexInB);
                     StartDFT_A <= '1';
                     StartDFT_B <= '1';
                     CycleDFT_A <= '1';
                     CycleDFT_B <= '1';
                     SearchMode <= Edges;
                  else
                     if (MaxIndex > Variables.IndexP125K) then       -- don't exceed +125K
                        FreqCoarse <= to_sfixed(125000, FreqCoarse);
                     elsif (MaxIndex < Variables.IndexN125K) then    -- don't exceed -125K
                        FreqCoarse <= to_sfixed(125000, FreqCoarse);
                     else
                        FreqCoarse <= resize((MaxIndex - FN/2.0 + 1.0) * Variables.FreqResolution, FreqCoarse);
                     end if;
                     HCFoverFreqRes_v := resize(HistCntrFreq * Variables.OneOverFreqRes, HCFoverFreqRes_v);
                     DFT_IndexInA  <= resize(HCFoverFreqRes_v + FN/2.0 - 1.0, DFT_IndexInA);
                     SearchMode    <= FineGrainSearch;  -- C code wants DFT next but ignores response
                     StartDFT_A <= '1';
                     CycleDFT_A <= '1';
                  end if;
                  PilotCount <= 0;
               when FineGrainSearch =>
                  if (PilotCount < PILOT_COUNT_DONE) then
                     StartDFT_A <= '0';
                     CycleDFT_A <= '0';
                     PilotCount <= PilotCount + 1;
                  else
                     CycleDFT_A <= '1';
                     PilotCount <= 0;
                  end if;
                  if (DFT_DoneA = '1' and PilotCount > 2) then
                     IndexOffset <= resize((DFT_IndexA - FN/2.0 + 1.0), IndexOffset);
                     SearchMode <= Fine1;
                  end if;
               when Fine1 =>
                  if (AcqTrack = Track) then
                     FreqEst <= resize(IndexOffset * Variables.FreqResolution, FreqEst);
                  else
                     FreqEst <= FreqCoarse;
                  end if;
                  SearchMode <= UpdateHist1;
               when UpdateHist1 =>
                  if (PilotCount < PILOT_COUNT_DONE) then
                     StartDFT_A <= '0';
                     CycleDFT_A <= '0';
                     PilotCount <= PilotCount + 1;
                  else
                     CycleDFT_A <= '1';
                     PilotCount <= 0;
                  end if;
                  if (DFT_DoneA = '1' and PilotCount > 2) then
                     DeltaFreq <= resize(FreqCoarse - HistCntrFreq, DeltaFreq);
                     SearchMode <= UpdateHist2;
                  end if;
               when UpdateHist2 =>
                     DeltaOverAmbig <= resize(DeltaFreq * Variables.OneOverFreqAmb, DeltaOverAmbig);
                     SearchMode <= UpdateHist3;
               when UpdateHist3 =>
                     if (DeltaFreq > 0) then
                        HistogramBin <= to_integer(DeltaOverAmbig + 0.5) + 6;
                        RoundUpDeltaAmbig  <= resize(DeltaOverAmbig + 0.5, RoundUpDeltaAmbig);
                     else
                        HistogramBin <= to_integer(DeltaOverAmbig - 0.5) + 6;
                        RoundUpDeltaAmbig  <= resize(DeltaOverAmbig - 0.5, RoundUpDeltaAmbig);
                     end if;
                     SearchMode <= UpdateHist4;
               when UpdateHist4 =>
                  HistFreqAmbgty <= resize(RoundUpDeltaAmbig * FREQ_AMBIGUITY, HistFreqAmbgty);
                  SearchMode <= UpdateHist5;
               when UpdateHist5 =>
                  if (HistogramBin < 0) or (HistogramBin > 12) then -- out of range, restart
                     Histogram       <= (6=>x"01", others=>x"00");
                     Max2Hist        <= 6;
                     AcqTrack        <= Acquire;
                     HistCntrFreq    <= FreqCoarse;
                     DataGatherCycle <= 0;
                     Freq            <= FreqCoarse;
                     Done            <= '1';
                     SearchMode      <= Idle;
                  else
                     Histogram_v := Histogram;
                     --histBinRem = fec-(bin-6)*amb - hcf, so hcf += histBinRem cancels hcf
                     HistBinRemain_v := resize(FreqCoarse - HistFreqAmbgty - HistCntrFreq, HistBinRemain_v);
                     Histogram_v(HistogramBin) := resize(Histogram_v(HistogramBin) + 1, ZERO8sf);
                     HistCntrFreq <= resize(HistCntrFreq + HistBinRemain_v, HistCntrFreq);
                     if (Histogram_v(HistogramBin) > Histogram_v(Max2Hist)) then
                        Max2Hist <= HistogramBin;   -- if new is > Max2
                        Max1Hist <= Max2Hist;
                     elsif (Histogram_v(HistogramBin) > Histogram_v(Max1Hist)) and (HistogramBin /= Max2Hist) then
                        Max1Hist <= HistogramBin;   -- elsif new is > Max1. Can't have Max1 = Max2
                     end if;
                     Histogram  <= Histogram_v;
                     SearchMode <= UpdateHist6;
                  end if;
               when  UpdateHist6 =>
                  if (DataGatherCycle >= 100) then
                     DataGatherCycle <= 0;
                     Histogram       <= (6=>x"01", others=>x"00");
                     Max2Hist        <= 6;
                     Max2Val_s       <= Histogram(Max2Hist)(6 downto 0) & "00000";
                     Max1Val_s       <= Histogram(Max1Hist)(6 downto 0) & "00000";
                     Max2Minus6      <= resize(to_sfixed(Max2Hist, Max2Minus6) - 6, Max2Minus6);
                     SearchMode      <= UpdateHist7;
                  else
                     DataGatherCycle <= DataGatherCycle + 1;
                     SearchMode <= UpdateHist9;
                  end if;
               when UpdateHist7 =>
                     IF (AcqTrack = Acquire) then
                        Max2ValRatio <= resize(3 / 4 * Max2Val_s, Max2ValRatio);
                     else
                        Max2ValRatio <= resize(29 / 32 * Max2Val_s, Max2ValRatio); -- 0.90625=29/32
                     end if;
                     Max2OffTimeAmb <= resize(Max2Minus6 * FREQ_AMBIGUITY, Max2OffTimeAmb);
                     SearchMode <= UpdateHist8;
               when  UpdateHist8 =>
                     if  (Max2ValRatio > Max1Val_s) then
                        AcqTrack <= Track;
                     else
                        AcqTrack <= Acquire;
                     end if;
                     HistCntrFreq <= resize(Max2OffTimeAmb + HistCntrFreq, HistCntrFreq);
                     SearchMode <= UpdateHist9;
               when  UpdateHist9 =>
                  if (AcqTrack = Acquire) then
                     Freq <= FreqCoarse;
                  else
                     Freq <= FreqEst;
                  end if;
                  Done <= '1';
                  SearchMode <= Idle;
               when others =>
                  SearchMode <= Idle;
               end case;
         end if;
      end if;
   end process PeakSrch;

   process (all)
   begin
      for i in 0 to 7 loop
         PilotTemplateDownR(IND_START(0)+i) <= resize(PilotTemplateDown0R(i), PilotTemplateDownR(0));
         PilotTemplateDownR(IND_START(1)+i) <= resize(PilotTemplateDown1R(i), PilotTemplateDownR(0));
         PilotTemplateDownR(IND_START(2)+i) <= resize(PilotTemplateDown2R(i), PilotTemplateDownR(0));
         PilotTemplateDownR(IND_START(3)+i) <= resize(PilotTemplateDown3R(i), PilotTemplateDownR(0));

         PilotTemplateDownI(IND_START(0)+i) <= resize(PilotTemplateDown0I(i), PilotTemplateDownI(0));
         PilotTemplateDownI(IND_START(1)+i) <= resize(PilotTemplateDown1I(i), PilotTemplateDownI(0));
         PilotTemplateDownI(IND_START(2)+i) <= resize(PilotTemplateDown2I(i), PilotTemplateDownI(0));
         PilotTemplateDownI(IND_START(3)+i) <= resize(PilotTemplateDown3I(i), PilotTemplateDownI(0));
      end loop;
   end process;


   DFT_InputsR(0 to 7)     <= PilotTemplateDown0R;
   DFT_InputsR(8 to 15)    <= PilotTemplateDown1R;
   DFT_InputsR(16 to 23)   <= PilotTemplateDown2R;
   DFT_InputsR(24 to 31)   <= PilotTemplateDown3R;

   DFT_InputsI(0 to 7)     <= PilotTemplateDown0I;
   DFT_InputsI(8 to 15)    <= PilotTemplateDown1I;
   DFT_InputsI(16 to 23)   <= PilotTemplateDown2I;
   DFT_InputsI(24 to 31)   <= PilotTemplateDown3I;

   PilotDownSlvR           <= to_slv(PilotTemplateDownR(PilotIndex));
   PilotDownSlvI           <= to_slv(PilotTemplateDownI(PilotIndex));

   FftTLast <= '1' when (PilotIndex = 4095) and (SearchMode = FFT_LOAD) else '0';

   NaturalRead <= NaturalOrder(NaturalCount);
-- synthesis off

   process(clk)
      variable abs_r, abs_i   : real;
   begin
      if (PilotIndex = 1) then
         max <= 0.0;
         rsq <= 0.0;
         isq <= 0.0;
         root <= 0.0;
      else
         abs_r := abs(to_real(PilotTemplateDownR(PilotIndex)));
         abs_i := abs(to_real(PilotTemplateDownI(PilotIndex)));
         rsq <= abs_r ** 2.0;
         isq <= abs_i ** 2.0;
         root <= sqrt(rsq + isq);
         if (root > max) then
            max <= root;
         end if;
      end if;
  end process;
-- synthesis on

   FFT_u : xfft_0
    port map (
      aclk                        => clk,
      aresetn                     => not reset,
      aclken                      => ce,
      s_axis_config_tvalid        => '0',
      s_axis_config_tready        => open,
      s_axis_config_tdata         => (others=>'0'),
      s_axis_data_tvalid          => ValidInFFT,
      s_axis_data_tready          => FftReady,
      s_axis_data_tdata           => PilotDownSlvI & PilotDownSlvR,
      s_axis_data_tlast           => FftTLast,
      m_axis_data_tvalid          => ValidOutFFT,
      m_axis_data_tdata           => FE_FFT_Out_slv,
      m_axis_data_tlast           => open,
      event_frame_started         => open,
      event_tlast_unexpected      => open,
      event_tlast_missing         => open,
      event_data_in_channel_halt  => open
      );

   DFT_Count <= PilotCount when (PilotCount < 32) else 0;
   DftOffset <= resize(DELTA_F_IND / 4, DftOffset);

   SearchA : DFT_Search
      GENERIC MAP(
         N           => 4096,
         NDX         => NDX
      )
   PORT MAP(
      clk            => clk,
      reset          => reset,
      ce             => ce,
      X_r            => DFT_InputsR(DFT_Count),
      X_i            => DFT_InputsI(DFT_Count),
      IndexIn        => DFT_IndexInA,
      IndexOffset    => DftOffset,
      Start          => StartDFT_A,
      NextCycle      => CycleDFT_A,
      Magnitude      => DFT_ValueA,
      IndexOut       => DFT_IndexA,
      Done           => DFT_DoneA
   );

   SearchB : DFT_Search
      GENERIC MAP(
         N           => 4096,
         NDX         => NDX
      )
   PORT MAP(
      clk            => clk,
      reset          => reset,
      ce             => ce,
      X_r            => DFT_InputsR(DFT_Count),
      X_i            => DFT_InputsI(DFT_Count),
      IndexIn        => DFT_IndexInB,
      IndexOffset    => DftOffset,
      Start          => StartDFT_B,
      NextCycle      => CycleDFT_B,
      Magnitude      => DFT_ValueB,
      IndexOut       => DFT_IndexB,
      Done           => DFT_DoneB
   );


   -- done with this burst, setup for next
   -- push latest data in buf2 to buf1, 1 to 0 and overwrite 0 with next input data
   buffer_mux : process(PilotBufArd, PilotBufBrd, PilotBufCrd, MuxCntr)
   begin
      case (MuxCntr) is
         when 0 =>
            PilotPtr2 <= PilotBufCrd;
            PilotPtr1 <= PilotBufBrd;
            PilotPtr0 <= PilotBufArd;
         when 1 =>
            PilotPtr2 <= PilotBufArd;
            PilotPtr1 <= PilotBufCrd;
            PilotPtr0 <= PilotBufBrd;
         when others =>
            PilotPtr2 <= PilotBufBrd;
            PilotPtr1 <= PilotBufArd;
            PilotPtr0 <= PilotBufCrd;
      end case;
   end process buffer_mux;

END rtl;
