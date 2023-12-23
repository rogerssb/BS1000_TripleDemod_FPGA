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
      PdClk,
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
      ch1MseSum,
      ch2MseSum         : OUT std_logic_vector(33 downto 0);
      ch1Log10MseSum,
      ch2Log10MseSum    : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      Ch1isMaster,
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
         Ch1isMaster,
         busClk            : IN  std_logic;
         addr              : IN  std_logic_vector(5 downto 0);
         dataIn            : IN  SLV32;
         dataOut           : OUT SLV32;
         Index             : IN  SLV8;
         agcDifferential   : IN SLV16;
         MDB_CombLag,
         MDB_CombLead,
         MDB_CombRate,
         MDB_CombLocks     : OUT SLV32;
         MDB_dB_Range,
         MDB_dB_Ratio,
         MDB_CombSwLmt,
         MDB_CombOptions,
         MDB_AgcZero       : OUT SLV16

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

   COMPONENT complexphasedetector_0
      PORT (
         clk,
         reset,
         enmasterswitching,
         overridech,
         ForceCh1          : IN STD_LOGIC;
         Ch1agc, Ch2Agc    : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
         Ch1imag,
         Ch1real,
         Ch2imag,
         Ch2real,
         lag_coef,
         lead_coef,
         swprate           : IN  SLV18;
         lockhysterisis,
         lockthreshold     : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
--         db_ratio,
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
         Ch1isMaster,
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

   COMPONENT fifo36DualClk
      PORT (
         rst : IN STD_LOGIC;
         wr_clk : IN STD_LOGIC;
         rd_clk : IN STD_LOGIC;
         din : IN STD_LOGIC_VECTOR(35 DOWNTO 0);
         wr_en : IN STD_LOGIC;
         rd_en : IN STD_LOGIC;
         dout : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
         full : OUT STD_LOGIC;
         empty : OUT STD_LOGIC;
         prog_full : OUT STD_LOGIC
      );
   END COMPONENT;

   COMPONENT PdClkDdr
      PORT (
         clk_in,
         io_reset                : IN STD_LOGIC;
         clk_out                 : OUT STD_LOGIC;
         data_out_from_device    : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
         data_out_to_pins        : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
      );
   END COMPONENT;

COMPONENT vioCombDrive
  PORT (
    clk : IN STD_LOGIC;
    probe_out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
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
            agcDifferential   : SLV16;
   signal   DucCount          : unsigned(1 downto 0) := "00";
   SIGNAL   PrevData,
            NextData          : STD_LOGIC_VECTOR(4 DOWNTO 0);
   signal   Ch1AgcNorm,
            Ch1Agc,
            Ch2Agc            : std_logic_vector(11 downto 0);
   signal   Ch1FastAgc,
            Ch2FastAgc,
            Ch1Gain, Ch2Gain  : std_logic_vector(12 downto 0);
   signal   Ch1Log10MseInv,
            Ch2Log10MseInv    : STD_LOGIC_VECTOR(10 DOWNTO 0);
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
            Ch1Adc17,
            Ch2Adc17,
            Ch1Real,
            Ch1Imag,
            Ch2Real,
            Ch2Imag,
            Ch1FastReal,
            Ch1FastImag,
            Ch2FastReal,
            Ch2FastImag       : SLV18;
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
   signal   Ch1SCLK,
            Ch1SFS,
            Ch1SDATA,
            Ch2SCLK,
            Ch2SFS,
            Ch2SDATA,
            dataI0, dataI1,
            dataEn0, dataEn1,
            agcCS0,
            agcCS1,
            dQM_AGCn,
            orMinGain,
            unstableBitOnDMDRev2_1,
            unstableBitOnDMDRev2_2,
            unstableBitOnDMDRev3_1,
            unstableBitOnDMDRev3_2,
            fifoProgFull,
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


   signal   dbRangeLock, dbRangeUnlock,
            dbBandAid,
            dB_Range     : SLV16;
   signal   ForceCh1,      ForceChan1,
            overridech,    OverRide,
            enMasterSwitch, MasterSwitch : STD_LOGIC_VECTOR(0 DOWNTO 0);
   signal   GoVio          : boolean;

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of DataOut10,
            Ch1Real,
            Ch1Imag,
            Ch2Real,
            Ch2Imag,
            Ch1Adc17,
            Ch2Adc17,
            DataOut14,
            DataOut24,
            Real1Out,
            Imag1Out,
            Real2Out,
            Imag2Out,
            power,
            dataI,
            Index,
            Ch1Agc,
            Ch2Agc,
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
         Ch1isMaster       => Ch1isMaster,
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
         MDB_dB_Range      => dBRangeLock,
         MDB_dB_Ratio      => dBRangeUnLock,
         agcDifferential   => agcDifferential
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
#define MDB_agcDifferential         210
#define MDB_agcZero                 211
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
   ifBS_n    <= '1'; --     <= MDB_CombOptions(15); Disable Bit Sync inputs

   PhaseInc    <= MDB_CombRate;

   CombinerReset <= reset or not combinerEn;

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

   Ch1Adc17       <= DataOut11(5 downto 0) & DataOut10 & "0000";
   Ch2Adc17       <= DataOut21(5 downto 0) & DataOut20 & "0000";
   Ch1Agc         <= DataOut13(7 downto 4) & DataOut11(7) & DataOut12(6 downto 0);
   Ch2Agc         <= DataOut23(7 downto 4) & DataOut21(7) & DataOut22(6 downto 0);
   Ch1SCLK        <= DataOut13(1);
   Ch1SFS         <= DataOut13(0);
   Ch1SDATA       <= DataOut13(2);
   Ch2SCLK        <= DataOut23(1);
   Ch2SFS         <= DataOut23(0);
   Ch2SDATA       <= DataOut23(2);
--   dataI0         <= ;            -- DataOut?4 isn't used
--   dataI1         <= ;
   dataEn0        <= DataOut11(6);
   dataEn1        <= DataOut21(6);
-- I've seen sporadic errors on the DataOut23(3) signal. DataOut13 is ok
   unstableBitOnDMDRev2_1 <= DataOut13(3);
   unstableBitOnDMDRev2_2 <= DataOut23(3);
-- I've seen sporadic errors on the DataOut12(7) signal. DataOut22 is ok
   unstableBitOnDMDRev3_1 <= DataOut12(7);
   unstableBitOnDMDRev3_2 <= DataOut22(7);


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
        ch0SCLK               => Ch1SCLK,
        ch0SFS                => Ch1SFS,
        ch0SDATA              => Ch1SDATA,
        ch0MseSum             => Ch1MseSum,
        ch0Log10MseSum        => Ch1Log10MseSum,
        ch1SCLK               => Ch2SCLK,
        ch1SFS                => Ch2SFS,
        ch1SDATA              => Ch2SDATA,
        ch1MseSum             => Ch2MseSum,
        ch1Log10MseSum        => Ch2Log10MseSum
    );
   /*
   DQM's are 12 bit signed values. In a high noise environment the values range in the
   -56 to -59 area with 0 to 5dB of bounce. The combined DQM is in the -65 to -69 range.

   In no noise, the DQM's are steady at -383 on all three channels.

   The combiner wants higher C/N to indicated by a more positive value, therefore, I'll
   negate the DQM's before sending them to the combiner.
   */
   Ch1Log10MseInv <= not Ch1Log10MseSum;
   Ch2Log10MseInv <= not Ch2Log10MseSum;


   preDdc : dualQuadDdc    -- Down convert incoming IFs to baseband, do both channels with same phase LO
   port map (
      clk      => clk93r3,
      reset    => reset,
      invert   => InvertDDC,
      ifIn1    => Ch1Adc17,
      ifIn2    => Ch2Adc17,
      clkEnOut => open,
      iOut1    => Ch1Real,
      qOut1    => Ch1Imag,
      iOut2    => Ch2Real,
      qOut2    => Ch2Imag
   );

   agcDifferential <= to_slv(resize(to_sfixed('0' & Ch1Agc, 1, -11) - to_sfixed('0' & Ch2Agc, 1, -11), 3, -12));

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
         i_in0          => Ch1Real,
         q_in0          => Ch1Imag,
         agcIn0         => Ch1Agc,
         agcIn1         => Ch2Agc,
         i_in1          => Ch2Real,
         q_in1          => Ch2Imag,

         i_out0         => Ch1FastReal,
         q_out0         => Ch1FastImag,
         i_out1         => Ch2FastReal,
         q_out1         => Ch2FastImag,
         agcOut0        => Ch1FastAgc,
         agcOut1        => Ch2FastAgc
      );


   dataOut <= combRegsOut when (not addr(5)) else agcDataOut;

   IF_Align_u : IF_Align
      PORT MAP (
         clk46r6        => clk46r6,
         clk186         => clk186,
         reset          => CombinerReset,
         CarrierDetect  => '1',
         ce             => orMinGain,     -- if one channel is turned off, hold current alignment in case a channel is dead.
         Re1In          => Ch1FastReal,
         Im1In          => Ch1FastImag,
         Re2In          => Ch2FastReal,
         Im2In          => Ch2FastImag,
         Re1Out         => Real1Out,
         Im1Out         => Imag1Out,
         Re2Out         => Real2Out,
         Im2Out         => Imag2Out,
         Index          => Index
     );

   Ch1Gain <= Ch1Log10MseInv & "00" when (dqm_AGCn) else Ch1FastAgc;
   Ch2Gain <= Ch2Log10MseInv & "00" when (dqm_AGCn) else Ch2FastAgc;

 Vios: vioCombDrive
  PORT MAP (
    clk                 => clk46r6,
    probe_out0          => dB_Range,
    probe_out1          => ForceChan1,
    probe_out2          => OverRide,
    probe_out3          => MasterSwitch
  );

   GoVio             <= (dB_Range /= x"0000");
   ForceCh1(0)       <= ForceChan1(0) when (GoVio) else MDB_CombRate(19);
   overridech(0)     <= OverRide(0) when (GoVio) else MDB_CombRate(20);
   enMasterSwitch(0) <= MasterSwitch(0) when (GoVio) else MDB_CombRate(24);
   dbBandAid         <= dB_Range when (GoVio) else dbRangeLock when (Locked) else dbRangeUnLock;

   CmplxPhsDet : complexphasedetector_0
      PORT MAP (
         clk            => clk46r6,                            -- MDB_combDbRange             199 in 16.10. 6dB = 0x1800
         reset          => CombinerReset,                      -- MDB_combLagLS16             200
         ForceCh1       => ForceCh1(0),                        -- MDB_combLagMS16             201
         overridech     => overridech(0),                      -- MDB_combLeadLS16            202
         lockthreshold  => MDB_CombLocks(28 downto 16),        -- MDB_combLeadMS16            203
         lockhysterisis => MDB_CombLocks(12 downto 0),         -- MDB_combRateLS16            204
         enMasterSwitching => enMasterSwitch(0),               -- MDB_combRateMS16            205
         db_range       => dbBandAid,                          -- MDB_combLimit               206
         Ch1agc         => Ch1Gain,
         Ch2agc         => Ch2Gain,                                   -- MDB_combOptions             207  -- MDB_combLocksLS16           208
         Ch1real        => Real1Out,                                 -- MDB_combLocksMS16           209
         Ch1imag        => Imag1Out,
         Ch2real        => Real2Out,
         Ch2imag        => Imag2Out,
         lag_coef       => MDB_CombLag(17 downto 0),
         lead_coef      => MDB_CombLead(17 downto 0),
         sweeplmt       => MDB_CombSwLmt(14 downto 0),
         swprate        => MDB_CombRate(17 downto 0),
         realout        => realout,
         imagout        => imagout,
         reallock       => reallock,
         imaglock       => imaglock,
         locked         => locked,
         Ch1isMaster    => Ch1isMaster,
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
         orMinGain   <= or(gainoutmin(17 downto 8) );
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
--         ImagCmbFFDly <= ImagCmbFF;
      end if;
   end process;
/*
   IF_OutProc : process (clk93r3)
   begin
      if (rising_edge(clk93r3)) then
         if (PdClk) then
            DdsData <= ImagCmbFFDly;
         else
            DdsData <= RealCmbFF;
         end if;
      end if;
   end process;
*/

   PdClkAlign : fifo36DualClk
      PORT  MAP(
         rst         => CombinerReset,
         wr_clk      => clk46r6,
         rd_clk      => PdClk,
         din         => RealCmbFF & ImagCmbFF,
         wr_en       => '1',
         rd_en       => fifoProgFull,
         full        => open,
         empty       => open,
         prog_full   => fifoProgFull,
         dout        => fifoOut
      );


   PdClkLsb : PdClkDdr
   port map (
      clk_in                  => PdClk,
      io_reset                => reset,
      data_out_from_device    => FifoOut(26 downto 18) & FifoOut(8 downto 0),
      data_out_to_pins        => DdsData(8 downto 0)
   );

   PdClkMsb : PdClkDdr
   port map (
      clk_in                  => PdClk,
      io_reset                => reset,
      data_out_from_device    => FifoOut(35 downto 27) & FifoOut(17 downto 9),
      data_out_to_pins        => DdsData(17 downto 9)
   );

END rtl;

