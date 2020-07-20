/*-------------------------------------------------------------------------------
                     PROPRIETARY NOTICE
   ----------------------------------------------------------------------------
   (c) Copyright 2014 Semco, Inc. All rights reserved.

   This file contains Semco Inc. proprietary information. It is the
   property of Semco Inc. and shall not be used, disclosed to others or
   reproduced without the express written consent of Semco Inc.,
   including, but without limitation, it is not to be used in the creation,
   manufacture, development, or derivation of any designs, or configuration.

   ---------------------------------------------------------------------------

   Company:     Semco, Inc.

   Module Name: FrequencyEstimatorDFT.vhd

   Description:
         This is the top-level function for frequency_estimator.c. It accepts as input the received training
      sequences, the training sequence templates, and timing and channel estimates. It outputs a final
      frequency estimate. The timing and channel estimates are used to produce estimated training
      sequence templates based on the templates provided. The four most recent training sequences are stored.
         Performs a frequency offset estimation. The estimate
      is made using the four most recent 512-sample pilots. The estimation is performed by,
      first, downsampling the vector product of the received pilots and the conjugate of the
      estimated pilots, second, performing a DFT peak search of this downsampled product, third,
      identify seven candidate peaks around the DFT output, fourth, perform a fine-grain DFT search around
      the peaks in order to identify the true DFT output max.
         The estimator operates in two modes. In the FE_ACQUIRE mode, the estimate returned is the
      result of a fine grain search over seven candidate output peaks. But, during the
      FE_TRACK mode, the estimate returned is the result of a fine grain search of the current
      peak identified by the center bin of the histogram. Note that during the FE_TRACK mode,
      the fine grain searches of the candidate peaks continue, though the results are only
      used to collect statistical information in the histogram. This information can then
      be used for making decisions about changing operating modes.
         The downsampling is performed by six stages of 2:1 half-band decimators. The amount
      of the downsampling is a power-of-two, and is 64 in this case.
         The DFTs scan from -125KHz to +125KHz in DELTA_F_IND/2 steps which is half the distance between
      pickets of the downsampled spectrum.

      Calculation time 4148 clocks. FFT version uses 11527 clocks

   ARGUMENTS :
      Rr    :  real part of the received RF primary training sequence
      Ri    :  imaginary part of the received RF primaty training sequence
      p0_r     :  real part of the transmitter-0 primary training sequence template
      p0_i     :  imaginary part of the transmitter-0 primary training sequence template
      p1_r     :  real part of the transmitter-1 primary training sequence template
      p1_i     :  imaginary part of the transmitter-1 primary training sequence template
      tau_0_est:  estimate of the transmitter-0 differential delay
      tau_1_est:  estimate of the transmitter-1 differential delay
      h0_est_r :  real part of the estimate of the transmitter-0 channel
      h0_est_i :  imaginary part of the estimate of the transmitter-0 channel
      h1_est_r :  real part of the estimate of the transmitter-1 channel
      h1_est_i :  imaginary part of the estimate of the transmitter-1 channel
      freq     :  pointer to the final frequence estimation result.
      AcqTrack :  pointer to the current mode of the frequency estimator (FE_ACQUIRE, or FE_TRACK)


   Dependencies:
      DFT
      DFT_Search
   ----------------------------------------------------------------------------
                                  DETAILS
   ----------------------------------------------------------------------------
   Start is one clock pulse wide, one clock before new Rr, Ri

   ----------------------------------------------------------------------------
                                  HISTORY
   ----------------------------------------------------------------------------
   4/2/17 Initial release FZ
   -------------------------------------------------------------
*/
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
library std;
use std.textio.all;
use work.fixed_pkg.all;
USE IEEE.math_real.all;
USE work.Semco_pkg.ALL;

ENTITY FrequencyEstimatorDFT IS
      GENERIC(
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
END FrequencyEstimatorDFT;


ARCHITECTURE rtl OF FrequencyEstimatorDFT IS

   COMPONENT Decimate512By64 IS
     PORT(
         clk,
         ce,
         reset,
         StartIn        : IN  std_logic;
         X_In           : IN  FLOAT_16_HP;
         Y_Out          : OUT FLOAT_ARRAY_16_HP(0 to 7);
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

   COMPONENT DFT_Search IS
      GENERIC(
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

   COMPONENT DFT IS
         GENERIC(
            NDX         : integer := 32   -- Only calculate non-zero samples
         );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         X_r,
         X_i            : IN  FLOAT_16_HP;
         IndexIn        : IN  sfixed(12 downto -19);
         StartIn        : IN  std_logic;
         Magnitude      : OUT FLOAT_1K;
         Done           : OUT std_logic
      );
   END COMPONENT DFT;

   COMPONENT p0_r_c
      PORT (
      clka : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      clkb : IN STD_LOGIC;
      addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
   );
   END COMPONENT p0_r_c;

   COMPONENT p0_i_c
      PORT (
      clka : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      clkb : IN STD_LOGIC;
      addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
   );
   END COMPONENT p0_i_c;

   COMPONENT p1_r_c
      PORT (
      clka : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      clkb : IN STD_LOGIC;
      addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
   );
   END COMPONENT p1_r_c;

   COMPONENT p1_i_c
      PORT (
      clka : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      clkb : IN STD_LOGIC;
      addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
   );
   END COMPONENT p1_i_c;

   COMPONENT Ram512x50DP3
      PORT (
         clka : IN STD_LOGIC;
         wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
         dina : IN STD_LOGIC_VECTOR(49 DOWNTO 0);
         clkb : IN STD_LOGIC;
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
   CONSTANT PILOT_COUNT_DONE  : positive := NDX + 16;
   CONSTANT CYCLE_MAX         : positive := 2;
   CONSTANT DELTA_F_IND       : FLOAT_64_HP := to_sfixed(FREQ_AMBIGUITY/(FreqSamp/(R*FN)), FLOAT_ZERO_64_HP); -- doesn't change with baud rate
   CONSTANT RR_DELAY          : positive := 4;
   CONSTANT PIPECOUNT5        : positive := 5;
   CONSTANT MINUS125K         : sfixed(7 downto -10) := to_sfixed(64, 7, -10);   -- Note, need enough resolution for offsets at start

   type     SearchMode_t   is (Idle, ScanDFT, Center, Edges, Edges1, FineGrainSearch,
                              Fine1, UpdateHist1, UpdateHist2, UpdateHist3, UpdateHist4, UpdateHist5,
                              UpdateHist6, UpdateHist7, UpdateHist8, UpdateHist9);
   type     STC_PARM_ARRAY is array (natural range <>) of STC_Parm;

   subtype  SFix0DowntoM23    is sfixed(0 downto -23);
   type     SFix0toM23_ARRAY is array (natural range <>) of SFix0DowntoM23;
   type     SFix12toM19Array  is array (natural range <>) of sfixed(12 downto -19);

  -- Signals
   SIGNAL   p0_r,
            p0_i,          -- buffers for stored pilot-template vector products
            p1_r,
            p1_i,
            p0Offset_r,    -- p0/1_r/i with Offset index
            p0Offset_i,
            p1Offset_r,
            p1Offset_i  : FLOAT_1_18;      -- final pilot template results
   SIGNAL   p0H0rr,        -- partial products for p_r, p_i
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
   SIGNAL   p_r, p_i             : FLOAT_2_LP := (others=>'0');
   SIGNAL   RrDelay,
            RiDelay              : FLOAT_ARRAY_1_LP(RR_DELAY-1 downto 0) := (others=>(others=>'0'));
   SIGNAL   p0_r_slv,
            p0_i_slv,
            p1_r_slv,
            p1_i_slv,
            p0OffsetRslv,
            p0OffsetIslv,
            p1OffsetRslv,
            p1OffsetIslv         : std_logic_vector(17 downto 0);
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
            Pilot0Pii      : FLOAT_16_HP := (others=>'0'); --double;
            -- buffers for downsampled pilot_template vector products
   SIGNAL   PilotTemplateDown3R,
            PilotTemplateDown3I,
            PilotTemplateDown2R,
            PilotTemplateDown2I,
            PilotTemplateDown1R,
            PilotTemplateDown1I,
            PilotTemplateDown0R,
            PilotTemplateDown0I  : FLOAT_ARRAY_16_HP(0 to 7);
   SIGNAL   DFT_InputsR,
            DFT_InputsI          : FLOAT_ARRAY_16_HP(0 to NDX-1);
   SIGNAL   PilotPtr2,
            PilotPtr1,
            PilotPtr0,
            PilotBufWrData,
            PilotBufArd,
            PilotBufBrd,
            PilotBufCrd          : std_logic_vector(R_TOP downto 0);
   SIGNAL   MuxCntr              : integer range 0 to 2;
   SIGNAL   RomPntr,
            BufCntrMinusOffset   : std_logic_vector(8 downto 0);
   SIGNAL   PR_Count,
            BufCntr,
            Offset,
            DiffBtoO             : natural range 0 to PILOT_LENGTH_4+RR_DELAY+2;
   SIGNAL   PilotCount           : integer range 0 to PILOT_COUNT_DONE;
   SIGNAL   DFT_Count            : integer range 0 to NDX-1;
   SIGNAL   CycleCount_Ila,
            CycleCount           : integer range 0 to 2;
   SIGNAL   WrEnPilotA,
            WrEnPilotB,
            WrEnPilotC           : std_logic_vector(0 downto 0);
   SIGNAL   Push,
            StartDFT_A,
            StartDFT_B,
            CycleDFT_A,
            CycleDFT_B,
            StartDec64,
            DoneDec64,
            DFT_DoneA,
            DFT_DoneB,
            DFT_Start,
            TemplateActive,
            FirstTime            : std_logic;
   SIGNAL   MaxValue,
            DFT_ValueA,
            DFT_ValueB,
            Scan                 : FLOAT_1K;
   SIGNAL   DFT_Value,
            DFT_ValueOut         : FLOAT_ARRAY_1K(0 to 7);
   SIGNAL   DFT_Scan             : FLOAT_ARRAY_1K(0 to 399) := (others=>(others=>'0'));
   SIGNAL   ScanCount            : natural range 0 to 399;  -- scans are for simulation visuals only and should optimize away
   SIGNAL   PipeLine,
            i, j                 : natural range 0 to 40;
   SIGNAL   HistogramBin         : integer range -40 to 46;
   SIGNAL   DataGatherCycle      : integer range 0 to 100;
   SIGNAL   MaxIndex,
            DFT_IndexInA,
            DFT_IndexInB,
            DFT_IndexA,
            DFT_IndexB,
            IndexOffset          : sfixed(12 downto -19);
   SIGNAL   DFT_Index            : SFix12toM19Array(0 to 7);
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
   SIGNAL   Max2OffTimesAmb      : FLOAT_16K;
   SIGNAL   RoundUpDeltaAmbig    : INT8f;
   SIGNAL   Max1Val_s,
            Max2Val_s            : sfixed(6 downto -5);
   SIGNAL   Max2Minus6           : sfixed(3 downto 0);
   SIGNAL   DFT_Done             : SLV8;


   -- TODO Remove test points
   signal   FreqCoarse_Ila,
            FreqEst_Ila,
            HistCntrFreq_Ila,
            PilotPtr2R_Ila,
            PilotTemp2R_Ila      : sfixed(17 downto 0);
   signal   DFT_DoneA_Ila,
            DFT_DoneB_Ila        : std_logic;
   signal   MaxIndex_Ila,
            DFT_IndexA_Ila,
            DFT_IndexB_Ila,
            DFT_IndexInA_Ila,
            DFT_IndexInB_Ila     : sfixed(12 downto 0);
   signal   DFT_ValueA_Ila,
            DFT_ValueB_Ila,
            MaxValue_Ila,
            Scan_Ila             : sfixed(10 downto 0); -- Float_1k
   signal   DFT_R_Ila,
            DFT_I_Ila,
            PilotTempOut_Ila     : sfixed(20+4 downto 20-20); -- float16
   signal   IlaCount32           : natural range 0 to 31 := 0;
   signal   IlaCount8            : natural range 0 to 7  := 0;
   attribute mark_debug : string;
   attribute mark_debug of AcqTrack             : signal is "true";
   attribute mark_debug of MaxValue_Ila         : signal is "true";
   attribute mark_debug of MaxIndex_Ila         : signal is "true";
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
   attribute mark_debug of DFT_ValueB_Ila       : signal is "true";
   attribute mark_debug of DFT_IndexB_Ila       : signal is "true";
   attribute mark_debug of DFT_IndexInB_Ila     : signal is "true";
   attribute mark_debug of Scan_Ila             : signal is "true";
   attribute mark_debug of PilotPtr2R_Ila       : signal is "true";
   attribute mark_debug of PilotTemp2R_Ila      : signal is "true";
   attribute mark_debug of PilotTempOut_Ila     : signal is "true";

BEGIN

   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         DFT_R_Ila         <= DFT_InputsR(DFT_Count);
         DFT_I_Ila         <= DFT_InputsI(DFT_Count);
         DFT_ValueA_Ila    <= DFT_ValueA(10 downto 0);
         DFT_IndexA_Ila    <= DFT_IndexA(12 downto 0);
         DFT_IndexInA_Ila  <= DFT_IndexInA(12 downto 0);
         DFT_ValueB_Ila    <= DFT_ValueB(10 downto 0);
         DFT_IndexB_Ila    <= DFT_IndexB(12 downto 0);
         DFT_IndexInB_Ila  <= DFT_IndexInB(12 downto 0);
         HistCntrFreq_Ila  <= HistCntrFreq(17 downto 0);
         FreqCoarse_Ila    <= FreqCoarse(17 downto 0);
         FreqEst_Ila       <= FreqEst(17 downto 0);
         MaxValue_Ila      <= MaxValue(10 downto 0);
         MaxIndex_Ila      <= MaxIndex(12 downto 0);
         Scan_Ila          <= Scan(10 downto 0);
         PilotPtr2R_Ila    <= PilotPtr2R(0 downto -17);
         PilotTemp2R_Ila   <= PilotTemplate2R(4 downto -13);
         PilotTempOut_Ila  <= PilotTemplateDown2R(IlaCount8);
         if (IlaCount32 < 31) then
            IlaCount32 <= IlaCount32 + 1;
         else
            IlaCount32 <= 0;
         end if;
         if (IlaCount8 < 7) then
            IlaCount8 <= IlaCount8 + 1;
         else
            IlaCount8 <= 0;
         end if;
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
               p0_r        <= to_sfixed(p0_r_slv, p0_r);    -- retrieve data from buffers
               p0_i        <= to_sfixed(p0_i_slv, p0_i);
               p1_r        <= to_sfixed(p1_r_slv, p1_r);
               p1_i        <= to_sfixed(p1_i_slv, p1_i);
               p0Offset_r  <= to_sfixed(p0OffsetRslv, p0Offset_r);
               p0Offset_i  <= to_sfixed(p0OffsetIslv, p0Offset_i);
               p1Offset_r  <= to_sfixed(p1OffsetRslv, p1Offset_r);
               p1Offset_i  <= to_sfixed(p1OffsetIslv, p1Offset_i);
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
                  PilotTemplate3R   <= FLOAT_ZERO_16_HP;
                  PilotTemplate3I   <= FLOAT_ZERO_16_HP;
                  PilotTemplate2R   <= FLOAT_ZERO_16_HP;
                  PilotTemplate2I   <= FLOAT_ZERO_16_HP;
                  PilotTemplate1R   <= FLOAT_ZERO_16_HP;
                  PilotTemplate1I   <= FLOAT_ZERO_16_HP;
                  PilotTemplate0R   <= FLOAT_ZERO_16_HP;
                  PilotTemplate0I   <= FLOAT_ZERO_16_HP;
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

   -- data is stored as hex sfixed18.17

   p0_r_u : p0_r_c
      PORT MAP (
         clka  => clk,
         addra => RomPntr,
         douta => p0_r_slv,
         clkb  => clk,
         addrb => BufCntrMinusOffset,
         doutb => p0OffsetRslv
      );

   p0_i_u : p0_i_c
      PORT MAP (
         clka  => clk,
         addra => RomPntr,
         douta => p0_i_slv,
         clkb  => clk,
         addrb => BufCntrMinusOffset,
         doutb => p0OffsetIslv
      );

   p1_r_u : p1_r_c
      PORT MAP (
         clka  => clk,
         addra => RomPntr,
         douta => p1_r_slv,
         clkb  => clk,
         addrb => BufCntrMinusOffset,
         doutb => p1OffsetRslv
      );

   p1_i_u : p1_i_c
      PORT MAP (
         clka  => clk,
         addra => RomPntr,
         douta => p1_i_slv,
         clkb  => clk,
         addrb => BufCntrMinusOffset,
         doutb => p1OffsetIslv
      );

/*
   p0_r_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\p0_r_pt17.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
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
         WrAddr      => 0,
         RdAddrA     => RomPntr,
         RdAddrB     => BufCntrMinusOffset,
         WrData      => (others=>'0'),
         RdOutA      => p0_r_slv,
         RdOutB      => p0OffsetRslv
      );

   p0_i_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\p0_i_pt17.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
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
         WrAddr      => 0,
         RdAddrA     => RomPntr,
         RdAddrB     => BufCntrMinusOffset,
         WrData      => (others=>'0'),
         RdOutA      => p0_i_slv,
         RdOutB      => p0OffsetIslv
      );

   p1_r_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\p1_r_pt17.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
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
         WrAddr      => 0,
         RdAddrA     => RomPntr,
         RdAddrB     => BufCntrMinusOffset,
         WrData      => (others=>'0'),
         RdOutA      => p1_r_slv,
         RdOutB      => p1OffsetRslv
      );
   p1_i_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\p1_i_pt17.slv",
         DATA_WIDTH  => 18,
         BINPT       => -17,
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
         WrAddr      => 0,
         RdAddrA     => RomPntr,
         RdAddrB     => BufCntrMinusOffset,
         WrData      => (others=>'0'),
         RdOutA      => p1_i_slv,
         RdOutB      => p1OffsetIslv
      );
*/
   WrEnPilotA(0) <= '1' when (Push = '1') and (MuxCntr = 0) else '0';
   PilotBufWrData <= to_slv(Rr) & to_slv(Ri);  -- allow one clk read delay

   PilotBufA : Ram512x50DP3
      PORT MAP (
         clka  => clk,
         wea   => WrEnPilotA,
         addra => RomPntr,
         dina  => PilotBufWrData,
         clkb  => clk,
         addrb => RomPntr,
         doutb => PilotBufArd
   );
/*
   PilotBufA : RAM_2Reads_1Write
      generic map (
         LATENCY     => 3,     -- allow 3 clocks to align with first Rr data
         DATA_WIDTH  => 2*FLOAT_1_LP'length,
         BINPT       => FLOAT_ZERO_1_lP'right,
         ADDR_WIDTH  => BUF_ADDR_WIDTH,
         FILENAME    => "",
         RAM_TYPE    => "block"
      )
      port map(
         clk         => clk,
         ce          => ce,
         reset       => StartIn,
         WrEn        => WrEnPilotA,
         WrData      => PilotBufWrData,
         WrAddr      => RomPntr_i,
         RdAddrA     => RomPntr_i,
         RdAddrB     => 0,
         RdOutA      => PilotBufArd,
         RdOutB      => open
     );
*/
   WrEnPilotB(0) <= '1' when (Push = '1') and (MuxCntr = 1) else '0';

   PilotBufB : Ram512x50DP3
      PORT MAP (
         clka  => clk,
         wea   => WrEnPilotB,
         addra => RomPntr,
         dina  => PilotBufWrData,
         clkb  => clk,
         addrb => RomPntr,
         doutb => PilotBufBrd
   );
/*
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
         WrAddr      => RomPntr_i,
         RdAddrA     => RomPntr_i,
         RdAddrB     => 0,
         RdOutA      => PilotBufBrd,
         RdOutB      => open
     );
*/
   WrEnPilotC(0) <= '1' when (Push = '1') and (MuxCntr = 2) else '0';

   PilotBufC : Ram512x50DP3
      PORT MAP (
         clka  => clk,
         wea   => WrEnPilotC,
         addra => RomPntr,
         dina  => PilotBufWrData,
         clkb  => clk,
         addrb => RomPntr,
         doutb => PilotBufCrd
   );
/*
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
         WrAddr      => RomPntr_i,
         RdAddrA     => RomPntr_i,
         RdAddrB     => 0,
         RdOutA      => PilotBufCrd,
         RdOutB      => open
     );
*/
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
            PilotCount        <= 0;
            FirstTime         <= '1';
            StartDFT_A        <= '0';
            StartDFT_B        <= '0';
            CycleDFT_A        <= '0';
            CycleDFT_B        <= '0';
            Done              <= '0';
            DFT_Start         <= '0';
            i                 <= 0;
            j                 <= 0;
            CycleCount        <= 0;
            DataGatherCycle   <= 0;
            PipeLine          <= 0;
            HistogramBin      <= 0;
            Max1Hist          <= 0;
            Max2Hist          <= 6;   -- Hist(6) = 1 at restart
            SearchMode        <= Idle;
            AcqTrack          <= Acquire;
            DFT_Value         <= (others=>(others=>'0'));
            DFT_Index         <= (others=>(others=>'0'));
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
            Max2OffTimesAmb   <= (others=>'0');
            HistFreqAmbgty    <= (others=>'0');
            DeltaFreq         <= (others=>'0');
            DeltaOverAmbig    <= (others=>'0');
            RoundUpDeltaAmbig <= (others=>'0');
            Max1Val           <= (others=>'0');
            Max1Val_s         <= (others=>'0');
            Max2Val           <= (others=>'0');
            Max2Val_s         <= (others=>'0');
            Max2ValRatio      <= (others=>'0');
            Max2Minus6        <= (others=>'0');
         elsif (ce) then
            Case SearchMode is   -- first part of search runs a DFT from -125k to +125k every DELTA_F_IND which is the picket spacing
               when Idle =>
                  if (DoneDec64) then  -- setup to run first 8 DFTs
                     i <= 8;
                     j <= 0;        -- had to make the 60 an sfixed constant, otherwise assumed 64 was negative number. Huh???
                     DFT_Index(0) <= resize((MINUS125K + 0.0) * DELTA_F_IND, DFT_Index(0));
                     DFT_Index(1) <= resize((MINUS125K + 0.25) * DELTA_F_IND, DFT_Index(1));
                     DFT_Index(2) <= resize((MINUS125K + 0.5) * DELTA_F_IND, DFT_Index(2));
                     DFT_Index(3) <= resize((MINUS125K + 0.75) * DELTA_F_IND, DFT_Index(3));
                     DFT_Index(4) <= resize((MINUS125K + 1.0) * DELTA_F_IND, DFT_Index(4));
                     DFT_Index(5) <= resize((MINUS125K + 1.25) * DELTA_F_IND, DFT_Index(5));
                     DFT_Index(6) <= resize((MINUS125K + 1.50) * DELTA_F_IND, DFT_Index(6));
                     DFT_Index(7) <= resize((MINUS125K + 1.75) * DELTA_F_IND, DFT_Index(7));
                     DFT_Start  <= '1';               -- Note, the DELTA_F_IND is a constant over bit rates
                     MaxValue   <= FLOAT_ZERO_1K;
                     PilotCount <= 0;
                     SearchMode <= ScanDFT;
                  end if;
                  Done <= '0';
                  PipeLine <= 0;
               when ScanDFT =>
                  if (DFT_Done(0)) then
                     DFT_Index(0) <= resize(DFT_Index(0) + 2 * DELTA_F_IND, DFT_Index(0));
                     DFT_Index(1) <= resize(DFT_Index(1) + 2 * DELTA_F_IND, DFT_Index(1));
                     DFT_Index(2) <= resize(DFT_Index(2) + 2 * DELTA_F_IND, DFT_Index(2));
                     DFT_Index(3) <= resize(DFT_Index(3) + 2 * DELTA_F_IND, DFT_Index(3));
                     DFT_Index(4) <= resize(DFT_Index(4) + 2 * DELTA_F_IND, DFT_Index(4));
                     DFT_Index(5) <= resize(DFT_Index(5) + 2 * DELTA_F_IND, DFT_Index(5));
                     DFT_Index(6) <= resize(DFT_Index(6) + 2 * DELTA_F_IND, DFT_Index(6));
                     DFT_Index(7) <= resize(DFT_Index(7) + 2 * DELTA_F_IND, DFT_Index(7));
                     DFT_Start  <= '1';
                     PilotCount <= 0;
                     DFT_Value  <= DFT_ValueOut;
                     i <= 0;
                     j <= j + 1;
                  else
                     DFT_Start <= '0';
                     PilotCount <= PilotCount + 1;
                  end if;
                  if (i < 8) then   -- after DFT ends, check values for peak
                     if (DFT_Value(i) >= MaxValue) then
                        MaxValue <= DFT_Value(i);
                        DFT_IndexInA <= DFT_Index(i);
                        DFT_IndexInB <= DFT_IndexInA; -- keep top two for further processing
                     end if;
                     DFT_Scan(j*8-8+i) <= DFT_Value(i);
                     i <= i + 1;
                  else
                     if (j = 40) then  -- we're done scanning
                        StartDFT_A     <= '1';
                        CycleDFT_A     <= '1';
                        StartDFT_B     <= '1';
                        CycleDFT_B     <= '1';
                        CycleCount     <= 1;
                        PilotCount     <= 0;
                        i              <= 0;
                        j              <= 0;
                        ScanCount      <= 0;
                        SearchMode <= Center;
                     end if;
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
                  elsif (PilotCount < PILOT_COUNT_DONE) then   -- give enough time for DFT iteration
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
                  if (ScanCount < 399) then
                     ScanCount <= ScanCount + 1;
                     Scan <= DFT_Scan(ScanCount);
             --     else
             --        ScanCount <= 0;
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
                     Max2OffTimesAmb <= resize(Max2Minus6 * FREQ_AMBIGUITY, Max2OffTimesAmb);
                     SearchMode <= UpdateHist8;
               when  UpdateHist8 =>
                     if  (Max2ValRatio > Max1Val_s) then
                        AcqTrack <= Track;
                     else
                        AcqTrack <= Acquire;
                     end if;
                     HistCntrFreq <= resize(Max2OffTimesAmb + HistCntrFreq, HistCntrFreq);
                     SearchMode <= UpdateHist9;
               when  UpdateHist9 =>
                  if (AcqTrack = Acquire) or (Variables.MiscBits(FORCE_ACQUIRE) = '1') then
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

   DFT_InputsR(0 to 7)     <= PilotTemplateDown0R;
   DFT_InputsR(8 to 15)    <= PilotTemplateDown1R;
   DFT_InputsR(16 to 23)   <= PilotTemplateDown2R;
   DFT_InputsR(24 to 31)   <= PilotTemplateDown3R;

   DFT_InputsI(0 to 7)     <= PilotTemplateDown0I;
   DFT_InputsI(8 to 15)    <= PilotTemplateDown1I;
   DFT_InputsI(16 to 23)   <= PilotTemplateDown2I;
   DFT_InputsI(24 to 31)   <= PilotTemplateDown3I;

   DFT_Count <= PilotCount when (PilotCount < 32) else 0;
   DftOffset <= resize(DELTA_F_IND / 1, DftOffset);   -- over 4 or over 2. Pickets are DELTA_F_IND apart

   SearchA : DFT_Search
      GENERIC MAP(
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

   DFT_0to7 : for i in 0 to 7 generate
      DFT_u : DFT
         GENERIC MAP(
            NDX         => NDX   -- Only calculate non-zero samples
         )
      PORT MAP (
         clk         => clk,
         reset       => reset,
         ce          => ce,
         X_r         => DFT_InputsR(DFT_Count),
         X_i         => DFT_InputsI(DFT_Count),
         IndexIn     => DFT_Index(i),
         StartIn     => DFT_Start,
         Magnitude   => DFT_ValueOut(i),
         Done        => DFT_Done(i)
      );
   end generate;

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
