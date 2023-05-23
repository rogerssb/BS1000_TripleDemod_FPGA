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

Module Name: DigitalCombiner.vhd
Description:

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
5-15-21 Initial release FZ

12-13-22 Added pipeline stages between complexPhaseDetector and IF reconstruction
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
Library UNIMACRO;
use UNIMACRO.vcomponents.all;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY DigitalCombiner IS
   PORT (
      clk46r6,
      clk93r3,
      clk186,
      SideCarClk,
      cs,
      wr0, wr1, wr2, wr3,
      busClk,
      reset,
      dataI,
      DdsMiso,
      DdsSyncClk,
      NextClk_p,
      NextClk_n,
      PrevClk_p,
      PrevClk_n         : IN  std_logic;
      PrevData_p,
      PrevData_n,
      NextData_p,
      NextData_n        : IN  std_logic_vector(4 downto 0);
      addr              : IN  std_logic_vector(5 downto 0);
      dataIn            : IN  SLV32;
      dataOut           : OUT SLV32;
      imagout,
      realout,
      ifOut             : OUT SLV18;
      ch0MseSum,
      ch1MseSum         : OUT std_logic_vector(33 downto 0);
      ch0Log10MseSum,
      ch1Log10MseSum    : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      agc0_gt_agc1,
      realxord,
      imagxord,
      combinerEn,
      locked,
      ifBS_n            : OUT STD_LOGIC;
      imaglock,
      reallock          : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
      DdsData           : OUT SLV18;
      DdsIO_Reset,
      DdsIO_Update,
      DdsReset,
      DdsCS_n,
      DdsSClk,
      DdsMosi        : OUT STD_LOGIC
   );
END DigitalCombiner;


ARCHITECTURE rtl OF DigitalCombiner IS

   COMPONENT combinerRegs
      PORT (
         cs,
         wr0, wr1, wr2, wr3,
         realLock, imagLock,
         locked, ddsMiso,
         combinerFlag,
         agc0_gt_agc1,
         busClk            : IN  std_logic;
         addr              : IN  std_logic_vector(5 downto 0);
         dataIn            : IN  SLV32;
         dataOut           : OUT SLV32;
         Index             : IN  SLV8;
         MDB_CombLag,
         MDB_CombLead,
         MDB_CombRate,
         MDB_CombLocks    : OUT SLV32;
         MDB_dB_Range,
         MDB_dB_Ratio,
         MDB_CombSwLmt,
         MDB_CombOptions   : OUT SLV16
      );
   END COMPONENT combinerRegs;

   COMPONENT combinerfastagc
      PORT (
         clk, ce,
         reset,
         cs,
         busClk,
         wr0,wr1,wr2,wr3    : IN  std_logic;
         addr               : IN  std_logic_vector(5 downto 0);
         din                : IN  SLV32;
         dout               : OUT SLV32;
         i_in0,q_in0        : IN  SLV18;     -- Raw inputs
         i_in1,q_in1        : IN  SLV18;
         agcIn0, agcIn1     : IN  std_logic_vector(11 downto 0);
         i_out0,q_out0      : OUT SLV18;     -- AGC'd outputs
         i_out1,q_out1      : OUT SLV18;
         agcOut0, agcOut1   : OUT std_logic_vector(12 downto 0)
      );
   END COMPONENT combinerfastagc;

   COMPONENT IF_Align
      PORT (
         clk46r6,
         clk186,
         ce,
         CarrierDetect,
         Reset          : IN  std_logic;
         Re1In,
         Im1In,
         Re2In,
         Im2In          : IN  SLV18;
         Index          : OUT SLV8;
         Re1Out,
         Im1Out,
         Re2Out,
         Im2Out         : OUT SLV18
      );
   END COMPONENT IF_Align;

   COMPONENT complexphasedetectorswap_0
      PORT (
         clk,
         reset,
         enmasterswitching,
         overridech,
         ch0gtch1          : IN STD_LOGIC;
         ch0agc, ch1agc    : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
         ch0imag,
         ch0real,
         ch1imag,
         ch1real,
         lag_coef,
         lead_coef,
         swprate           : IN  SLV18;
         lockhysterisis,
         lockthreshold     : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
         db_ratio,
         db_range          : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
         sweeplmt          : IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
         maximagout,
         maxrealout,
         minimagout,
         minrealout,
         imagout,
         realout,
         gainoutmax,
         gainoutmin,
         phase_detect       : OUT SLV18;
         agc0_gt_agc1,
         realxord,
         imagxord,
         locked            : OUT STD_LOGIC;
         imaglock,
         reallock          : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
         lag_out           : OUT SLV32;
         power             : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)

      );
   END COMPONENT;

   component DUC
         port (
            clk,
            ce,
            invert   : in  std_logic;
            realIn,
            imagIn   : in  std_logic_vector(17 downto 0);
            ifOut    : out std_logic_vector(17 downto 0)
         );
   END component DUC;

   component CombinerSerDesIn is
      Generic (
         CHANNEL  : natural := 1;
         PORTS    : natural := 6
      );
      Port (
         ClkIn1,
         ClkIn2,
         Clk93r3,
         Reset             : in  std_logic;
         DataIn1,
         DataIn2           : in  STD_LOGIC_VECTOR(PORTS-2 downto 0);
         DataOut10,
         DataOut11,
         DataOut12,
         DataOut13,
         DataOut14,
         DataOut20,
         DataOut21,
         DataOut22,
         DataOut23,
         DataOut24         : out SLV8
      );
   end component CombinerSerDesIn;

   COMPONENT dualQuadDdc
      PORT(
         clk,
         reset,
         invert            : IN  std_logic;
         ifIn1,
         ifIn2             : IN  SLV18;
         iOut1,
         qOut1,
         iOut2,
         qOut2             : OUT SLV18;
         clkEnOut           : OUT std_logic
      );
   END COMPONENT dualQuadDdc;

   COMPONENT dqmChip2Chip
      PORT (
         clk,
         reset,
         combinerStartOfFrame,
         dqmStartOfFrame,
         ch0SCLK,
         ch0SFS,
         ch0SDATA,
         ch1SCLK,
         ch1SFS,
         ch1SDATA             : IN std_logic;
         mseSum               : IN std_logic_vector (33 downto 0);
         log10MseSum          : IN std_logic_vector (10 downto 0);
         mseMCLK,
         mseMFS,
         mseMDATA             : OUT std_logic;
         ch0MseSum,
         ch1MseSum            : OUT std_logic_vector (33 downto 0);
         ch0Log10MseSum,
         ch1Log10MseSum       : OUT std_logic_vector (10 downto 0)
      );
   END COMPONENT dqmChip2Chip;

   COMPONENT OffsetNCO IS
      PORT (
         aclk : IN STD_LOGIC;
         aresetn : IN STD_LOGIC;
         s_axis_config_tvalid : IN STD_LOGIC;
         s_axis_config_tready : OUT STD_LOGIC;
         s_axis_config_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_data_tvalid : OUT STD_LOGIC;
         m_axis_data_tready : IN STD_LOGIC;
         m_axis_data_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
      );
   END COMPONENT;

  -- Signals
   signal   Real1Out,
            Imag1Out,
            Real2Out,
            Imag2Out          : SLV18;
   signal   Index             : SLV8;
   signal   MDB_CombLag,
            MDB_CombLead,
            MDB_CombRate,
            MDB_CombLocks,
            PhaseInc,
            combRegsOut,
            agcDataOut        : SLV32;
   signal   MDB_CombSwLmt,
            MDB_CombOptions,
            MDB_dB_Ratio,
            MDB_dB_Range      : SLV16;
   signal   DucCount          : unsigned(1 downto 0) := "00";
   SIGNAL   PrevData,
            NextData          : STD_LOGIC_VECTOR(4 DOWNTO 0);
   signal   ch0Agc,
            ch1Agc            : std_logic_vector(11 downto 0);
   signal   ch0FastAgc,
            ch1FastAgc,
            ch0Gain, ch1Gain   : std_logic_vector(12 downto 0);
   signal   ch0Log10MseInv,
            ch1Log10MseInv    : STD_LOGIC_VECTOR(10 DOWNTO 0);
   signal   LagCoef,
            LeadCoef,
            SweepRate,
            phase_detect,
            MaxImagout,
            MaxRealout,
            MinImagout,
            ProbeOut2,
            MinRealout,
            GainOutMax,
            GainOutMin,
            RealCmbFF,
            ImagCmbFF,
            CombReal,
            CombImag,
            ImagCmbFFDly,
            NcoCos,
            NcoSin,
            ch0Adc17,
            ch1Adc17,
            ch0Real,
            ch0Imag,
            ch1Real,
            ch1Imag,
            ch0FastReal,
            ch0FastImag,
            ch1FastReal,
            ch1FastImag       : SLV18;
   signal   fifoOut           : std_logic_vector(35 downto 0);
   signal   NcoData           : std_logic_vector(47 downto 0);
   signal   lag_out           : std_logic_vector(31 downto 0);
   signal   nco_control_out   : std_logic_vector(21 downto 0);
   signal   DataOut10,
            DataOut11,
            DataOut12,
            DataOut13,
            DataOut14,
            DataOut20,
            DataOut21,
            DataOut22,
            DataOut23,
            DataOut24         : SLV8;
   signal   ch0SCLK,
            ch0SFS,
            ch0SDATA,
            ch1SCLK,
            ch1SFS,
            ch1SDATA,
            dataI0, dataI1,
            dataEn0, dataEn1,
            agcCS0,
            agcCS1,
            dQM_AGCn,
            orMinGain,
            unstableBitOnDMDRev2_1,
            unstableBitOnDMDRev2_2,

            CombinerReset,
            IF_CW,
            IF_Offset,
            InvertDDC,
            InvertDUC,
            almostFull,
            NextClk,
            PrevClk,
            ResetPdClk        : STD_LOGIC;
   signal   DdsGain           : unsigned(2 downto 0);
   signal   SubSample         : uint32;
   signal   power             : STD_LOGIC_VECTOR(17 DOWNTO 0);

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of DataOut10,
            ch0Real,
            ch0Imag,
            ch1Real,
            ch1Imag,
            ch0Adc17,
            ch1Adc17,
            Real1Out,
            Imag1Out,
            Real2Out,
            Imag2Out,
            power,
            dataI,
            Index,
            ch0Agc,
            ch1Agc,
            imagout,
            realout,
            SubSample             : signal is "TRUE";

BEGIN

   DC_Regs : combinerRegs
      PORT MAP(
         cs                => cs,
         wr0               => wr0,
         wr1               => wr1,
         wr2               => wr2,
         wr3               => wr3,
         busClk            => busClk,
         addr              => addr,
         dataIn            => dataIn,
         dataOut           => combRegsOut,
         Index             => Index,
         combinerFlag      => '1',
         agc0_gt_agc1      => agc0_gt_agc1,
         realLock          => realLock(12),
         imagLock          => imagLock(12),
         locked            => locked,
         ddsMiso           => DdsMiso,
         MDB_CombLag       => MDB_CombLag,
         MDB_CombLead      => MDB_CombLead,
         MDB_CombSwLmt     => MDB_CombSwLmt,
         MDB_CombRate      => MDB_CombRate,
         MDB_CombLocks     => MDB_CombLocks,
         MDB_CombOptions   => MDB_CombOptions,
         MDB_dB_Range      => MDB_dB_Range,
         MDB_dB_Ratio      => MDB_dB_Ratio
      );

/*
#define MDB_combLagLS16             200
#define MDB_combLagMS16             201
#define MDB_combLeadLS16            202
#define MDB_combLeadMS16            203
#define MDB_combRateLS16            204
#define MDB_combRateMS16            205
#define MDB_combLimit               206
#define MDB_combOptions             207
#define MDB_combLocksLS16           208
#define MDB_combLocksMS16           209
*/

   DdsCS_n        <= MDB_CombOptions(0);
   DdsSClk        <= MDB_CombOptions(1);
   DdsMosi        <= MDB_CombOptions(2);
   -- 3 is available

   combinerEn     <= MDB_CombOptions(4);
   IF_CW          <= MDB_CombOptions(5);
   InvertDDC      <= MDB_CombOptions(6);
   InvertDUC      <= MDB_CombOptions(7);

--   combinerActive <= MDB_CombOptions(8);
   IF_Offset      <= MDB_CombOptions(9);
   -- 10 is available
   DdsIO_Reset    <= MDB_CombOptions(11);

   dQM_AGCn       <= MDB_CombOptions(12);
   DdsIO_Update   <= MDB_CombOptions(13);
   DdsReset       <= MDB_CombOptions(14);
   ifBS_n         <= MDB_CombOptions(15);

   PhaseInc    <= MDB_CombRate;

   CombinerReset <= reset or not(combinerEn or ifBS_n);

   GenIBufs : for n in 0 to 4 generate
   begin
      IBufNext : IBUFDS
      generic map (
         DIFF_TERM     => true,    -- Differential Termination
         IBUF_LOW_PWR  => false,   -- Low power (TRUE) vs performance (FALSE) setting for referenced I/O standards
         IOSTANDARD    => "LVDS")
      port map (
         I     => NextData_p(n),
         IB    => NextData_n(n),
         O     => NextData(n)
      );

      IBufPrev : IBUFDS
      generic map (
         DIFF_TERM     => true,    -- Differential Termination
         IBUF_LOW_PWR  => false,   -- Low power (TRUE) vs performance (FALSE) setting for referenced I/O standards
         IOSTANDARD    => "LVDS")
      port map (
         I     => PrevData_p(n),
         IB    => PrevData_n(n),
         O     => PrevData(n)
      );
   end generate;

   NextClkBuf : IBUFDS
   generic map (
      DIFF_TERM     => true,    -- Differential Termination
      IBUF_LOW_PWR  => false,   -- Low power (TRUE) vs performance (FALSE) setting for referenced I/O standards
      IOSTANDARD    => "LVDS")
   port map (
      I     => NextClk_p,
      IB    => NextClk_n,
      O     => NextClk
   );

   PrevClkBuf : IBUFDS
   generic map (
      DIFF_TERM     => true,    -- Differential Termination
      IBUF_LOW_PWR  => false,   -- Low power (TRUE) vs performance (FALSE) setting for referenced I/O standards
      IOSTANDARD    => "LVDS")
   port map (
      I     => PrevClk_p,
      IB    => PrevClk_n,
      O     => PrevClk
   );

   SerDesIn : CombinerSerDesIn
   generic map
      ( PORTS => 6)
   port map (
      Clk93r3     => clk93r3,
      Reset       => reset,
      ClkIn1      => NextClk,  -- Next is Ch1
      DataIn1     => NextData,
      DataOut10   => DataOut10,
      DataOut11   => DataOut11,
      DataOut12   => DataOut12,
      DataOut13   => DataOut13,
      DataOut14   => DataOut14,
      ClkIn2      => PrevClk,  -- Prev is Ch2
      DataIn2     => PrevData,
      DataOut20   => DataOut20,
      DataOut21   => DataOut21,
      DataOut22   => DataOut22,
      DataOut23   => DataOut23,
      DataOut24   => DataOut24
   );

   ch0Adc17       <= DataOut11(5 downto 0) & DataOut10 & "0000";
   ch1Adc17       <= DataOut21(5 downto 0) & DataOut20 & "0000";
   ch0Agc         <= DataOut13(7 downto 4) & DataOut12;
   ch1Agc         <= DataOut23(7 downto 4) & DataOut22;
   ch0SCLK        <= DataOut13(1);
   ch0SFS         <= DataOut13(0);
   ch0SDATA       <= DataOut13(2);
   ch1SCLK        <= DataOut23(1);
   ch1SFS         <= DataOut23(0);
   ch1SDATA       <= DataOut23(2);
   dataI0         <= DataOut11(7);
   dataI1         <= DataOut21(7);
   dataEn0        <= DataOut11(6);
   dataEn1        <= DataOut21(6);
-- I've seen sporadic errors on the DataOut23(3) signal. DataOut13 is ok
   unstableBitOnDMDRev2_1 <= DataOut13(3);
   unstableBitOnDMDRev2_2 <= DataOut23(3);


   c2c : dqmChip2Chip   -- only use the combiner section
      port map (
        clk                   => clk93r3,
        reset                 => reset,
        combinerStartOfFrame  => '0',
        dqmStartOfFrame       => '0',
        mseSum                => (others=>'0'),
        log10MseSum           => (others=>'0'),
        mseMCLK               => open,
        mseMFS                => open,
        mseMDATA              => open,
        ch0SCLK               => ch0SCLK,
        ch0SFS                => ch0SFS,
        ch0SDATA              => ch0SDATA,
        ch0MseSum             => ch0MseSum,
        ch0Log10MseSum        => ch0Log10MseSum,
        ch1SCLK               => ch1SCLK,
        ch1SFS                => ch1SFS,
        ch1SDATA              => ch1SDATA,
        ch1MseSum             => ch1MseSum,
        ch1Log10MseSum        => ch1Log10MseSum
    );
   /*
   DQM's are 12 bit signed values. In a high noise environment the values range in the
   -56 to -59 area with 0 to 5dB of bounce. The combined DQM is in the -65 to -69 range.

   In no noise, the DQM's are steady at -383 on all three channels.

   The combiner wants higher C/N to indicated by a more positive value, therefore, I'll
   negate the DQM's before sending them to the combiner.
   */
   ch0Log10MseInv <= not ch0Log10MseSum;
   ch1Log10MseInv <= not ch1Log10MseSum;


   preDdc : dualQuadDdc    -- Down convert incoming IFs to baseband, do both channels with same phase LO
   port map (
      clk      => clk93r3,
      reset    => reset,
      invert   => InvertDDC,
      ifIn1    => ch0Adc17,
      ifIn2    => ch1Adc17,
      clkEnOut => open,
      iOut1    => ch0Real,
      qOut1    => ch0Imag,
      iOut2    => ch1Real,
      qOut2    => ch1Imag
   );

   fastAgc0 : combinerfastagc
      PORT MAP (
         clk            => clk46r6,
         ce             => '1',
         reset          => CombinerReset,
         cs             => cs,
         busClk         => busClk,
         wr0            => wr0,
         wr1            => wr1,
         wr2            => wr2,
         wr3            => wr3,
         addr           => addr,
         din            => dataIn,
         dout           => agcDataOut,
         i_in0          => ch0Real,
         q_in0          => ch0Imag,
         agcIn0         => ch0Agc,
         agcIn1         => ch1Agc,
         i_in1          => ch1Real,
         q_in1          => ch1Imag,

         i_out0         => ch0FastReal,
         q_out0         => ch0FastImag,
         i_out1         => ch1FastReal,
         q_out1         => ch1FastImag,
         agcOut0        => ch0FastAgc,
         agcOut1        => ch1FastAgc
      );


   dataOut <= combRegsOut when (not addr(5)) else agcDataOut;

   IF_Align_u : IF_Align
      PORT MAP (
         clk46r6        => clk46r6,
         clk186         => clk186,
         reset          => CombinerReset,
         CarrierDetect  => '1',
         ce             => orMinGain,     -- if one channel is turned off, hold current alignment in case a channel is dead.
         Re1In          => ch0FastReal,
         Im1In          => ch0FastImag,
         Re2In          => ch1FastReal,
         Im2In          => ch1FastImag,
         Re1Out         => Real1Out,
         Im1Out         => Imag1Out,
         Re2Out         => Real2Out,
         Im2Out         => Imag2Out,
         Index          => Index
     );

   ch0Gain <= ch0Log10MseInv & "00" when (dqm_AGCn) else ch0FastAgc;
   ch1Gain <= ch1Log10MseInv & "00" when (dqm_AGCn) else ch1FastAgc;

   CmplxPhsDet : complexphasedetectorswap_0
      PORT MAP (
         clk            => clk46r6,                            -- MDB_combDbRange             199
         reset          => CombinerReset,                      -- MDB_combLagLS16             200
         ch0gtch1       => MDB_CombRate(19),                   -- MDB_combLagMS16             201
         overridech     => MDB_CombRate(20),                   -- MDB_combLeadLS16            202
         lockthreshold  => MDB_CombLocks(28 downto 16),        -- MDB_combLeadMS16            203
         lockhysterisis => MDB_CombLocks(12 downto 0),         -- MDB_combRateLS16            204
         enmasterswitching => MDB_CombRate(24),                -- MDB_combRateMS16            205
         ch0agc         => ch0Gain,                            -- MDB_combLimit               206
         ch1agc         => ch1Gain,                            -- MDB_combOptions             207
         ch0real        => Real1Out,                           -- MDB_combLocksLS16           208
         ch0imag        => Imag1Out,                           -- MDB_combLocksMS16           209
         ch1real        => Real2Out,                           -- MDB_CalfControlsLS16        210
         ch1imag        => Imag2Out,                           -- MDB_CalfControlsMS16        211
         lag_coef       => MDB_CombLag(17 downto 0),           -- MDB_CalfULimitLS16          212
         lead_coef      => MDB_CombLead(17 downto 0),          -- MDB_CalfULimitMS16          213
         sweeplmt       => MDB_CombSwLmt(14 downto 0),         -- MDB_CalfLLimitLS16          214
         swprate        => MDB_CombRate(17 downto 0),          -- MDB_CalfLLimitMS16          215
         db_range       => MDB_dB_Range,                       -- MDB_CalfRatiosLS16          216
         db_ratio       => MDB_dB_Ratio,                       -- MDB_CalfRatiosMS16          217
         realout        => realout,                            -- MDB_CalfIntegrator0         218
         imagout        => imagout,                            -- MDB_CalfIntegrator1         219
         reallock       => reallock,
         imaglock       => imaglock,
         locked         => locked,
         agc0_gt_agc1   => agc0_gt_agc1,
         lag_out        => lag_out,
         phase_detect   => phase_detect,
         maximagout     => maximagout,
         maxrealout     => maxrealout,
         minimagout     => minimagout,
         minrealout     => minrealout,
         realxord       => realxord,
         imagxord       => imagxord,
         gainoutmax     => gainoutmax,
         gainoutmin     => gainoutmin,
         power          => power
      );

  -- create a series of rising edges for the ILA to subsample the data for lower frequnecy acquistion
   subClkProc : process(clk93r3)
   begin
      if (rising_edge(clk93r3)) then
         SubSample <= SubSample + 1;
      end if;
   end process;


-- drive combiner outputs to demod as 70MHz IF
   GenIF : DUC
      port map (
         clk      => clk93r3,
         ce       => '1',
         invert   => InvertDUC,
         realIn   => realOut,
         imagIn   => imagOut,
         ifOut    => ifOut
      );

----------------------------------------------------------------------------------
--                   AD9957 outputs

-- Send the complex outputs to the IF generator on the sidecar

   NCO : OffsetNCO
      PORT MAP (
         aclk                 => clk46r6,
         aresetn              => not ResetPdClk,
         s_axis_config_tvalid => '1',
         s_axis_config_tdata  => PhaseInc,
         m_axis_data_tready   => '1',
         s_axis_config_tready => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => NcoData
      );

   NcoCos <= NcoData(17 downto 0);
   NcoSin <= NcoData(24+17 downto 24);

   DdsGain <= unsigned(MDB_CombLag(22 downto 20));
   IF_BuffProc : process (clk46r6)
   begin
      if (rising_edge(clk46r6)) then
         orMinGain   <= or(gainoutmin);
         ResetPdClk  <= Reset;
         CombReal    <= realOut;
         CombImag    <= imagOut;
         if (IF_CW) then
            RealCmbFF <= 18x"10000";
            ImagCmbFF <= 18x"10000";
         elsif (IF_Offset) then
            RealCmbFF <= NcoCos;
            ImagCmbFF <= NcoSin;
         else
            if (DdsGain = 1) then
               RealCmbFF <= CombReal(16 downto 0) & 1b"0";
               ImagCmbFF <= CombImag(16 downto 0) & 1b"0";
            elsif (DdsGain = 2) then
               RealCmbFF <= CombReal(15 downto 0) & 2b"0";
               ImagCmbFF <= CombImag(15 downto 0) & 2b"0";
            elsif (DdsGain = 3) then
               RealCmbFF <= CombReal(14 downto 0) & 3b"0";
               ImagCmbFF <= CombImag(14 downto 0) & 3b"0";
            elsif (DdsGain = 4) then
               RealCmbFF <= CombReal(13 downto 0) & 4b"0";
               ImagCmbFF <= CombImag(13 downto 0) & 4b"0";
            elsif (DdsGain = 5) then
               RealCmbFF <= CombReal(12 downto 0) & 5b"0";
               ImagCmbFF <= CombImag(12 downto 0) & 5b"0";
            else
               RealCmbFF <= CombReal;
               ImagCmbFF <= CombImag;
            end if;
         end if;
         ImagCmbFFDly <= ImagCmbFF;
      end if;
   end process;

   IF_OutProc : process (clk93r3)
   begin
      if (rising_edge(clk93r3)) then
         if (SideCarClk) then
            DdsData <= ImagCmbFFDly;
         else
            DdsData <= RealCmbFF;
         end if;
      end if;
   end process;

END rtl;

