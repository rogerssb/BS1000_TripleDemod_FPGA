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
      addr              : IN  std_logic_vector(12 downto 0);
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
         MDB_CombRefLvl    : OUT SLV32;
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
         addr               : IN  std_logic_vector(12 downto 0);
         din                : IN  SLV32;
         dout               : OUT SLV32;
         i_in0,q_in0        : IN  SLV18;     -- Raw inputs
         i_in1,q_in1        : IN  SLV18;
         i_out0,q_out0      : OUT SLV18;     -- AGC'd outputs
         i_out1,q_out1      : OUT SLV18;
         agcOut0            : OUT std_logic_vector(11 downto 0);
         agcOut1            : OUT std_logic_vector(11 downto 0)
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
         Im2In          : IN  float_1_18;
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
         am_disable,
         overridech,
         bestsrcmode,
         dQM_AGCn,
         ch0gtch1          : IN STD_LOGIC;
         ch0agc,
         ch1agc            : IN  SLV12;
         ch0Dqm,
         ch1Dqm            : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
         ch0imag,
         ch0real,
         ch1imag,
         ch1real,
         lag_coef,
         lead_coef,
         swprate           : IN  SLV18;
         lockhysterisis,
         lockthreshold     : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
         sweeplmt          : IN  STD_LOGIC_VECTOR(14 DOWNTO 0);
         maximagout,
         maxrealout,
         minimagout,
         minrealout,
         imagout,
         realout,
         gainoutmax,
         gainoutmin,
         phase_detect      : OUT SLV18;
         agc0_gt_agc1,
         realxord,
         imagxord,
         locked            : OUT STD_LOGIC;
         imaglock,
         reallock          : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
         lag_out           : OUT SLV32;
         nco_control_out   : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
      );
   END COMPONENT complexphasedetector_0;

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
            MDB_CombRefLvl,
            PhaseInc,
            combRegsOut,
            agcDataOut        : SLV32;
   signal   MDB_CombSwLmt,
            MDB_CombOptions   : SLV16;
   signal   DucCount          : unsigned(1 downto 0) := "00";
   SIGNAL   PrevData,
            NextData          : STD_LOGIC_VECTOR(4 DOWNTO 0);
   signal   ch0Agc,
            ch1Agc,
            ch0FastAgc,
            ch1FastAgc        : std_logic_vector(11 downto 0);
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
            agcCS0,
            agcCS1,
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
         addr              => addr(5 downto 0),
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
         MDB_CombRefLvl    => MDB_CombRefLvl,
         MDB_CombOptions   => MDB_CombOptions
      );

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

--   combinerBB     <= MDB_CombOptions(12);
   DdsIO_Update   <= MDB_CombOptions(13);
   DdsReset       <= MDB_CombOptions(14);
   ifBS_n         <= MDB_CombOptions(15);

   PhaseInc    <= MDB_CombRate;

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
   ch0Agc         <= DataOut13(3 downto 0) & DataOut12;
   ch1Agc         <= DataOut23(3 downto 0) & DataOut22;
   ch0SCLK        <= DataOut13(6);
   ch0SFS         <= DataOut13(5);
   ch0SDATA       <= DataOut13(7);
   ch1SCLK        <= DataOut23(6);
   ch1SFS         <= DataOut23(5);
   ch1SDATA       <= DataOut23(7);


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
         reset          => reset or not combinerEn,
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
         i_out0         => ch0FastReal,
         q_out0         => ch0FastImag,
         agcOut0        => ch0FastAgc,
         i_in1          => ch1Real,
         q_in1          => ch1Imag,
         i_out1         => ch1FastReal,
         q_out1         => ch1FastImag,
         agcOut1        => ch1FastAgc
      );


   dataOut <= combRegsOut when (not addr(5)) else agcDataOut;

   IF_Align_u : IF_Align
      PORT MAP (
         clk46r6        => clk46r6,
         clk186         => clk186,
         reset          => reset or not combinerEn,
         CarrierDetect  => '1',
         ce             => or(gainoutmin),     -- if one channel is turned off, hold current alignment in case a channel is dead.
         Re1In          => to_sfixed(ch0FastReal, 0, -17),
         Im1In          => to_sfixed(ch0FastImag, 0, -17),
         Re2In          => to_sfixed(ch1FastReal, 0, -17),
         Im2In          => to_sfixed(ch1FastImag, 0, -17),
         Re1Out         => Real1Out,
         Im1Out         => Imag1Out,
         Re2Out         => Real2Out,
         Im2Out         => Imag2Out,
         Index          => Index
     );

  CmplxPhsDet : complexphasedetector_0
      PORT MAP (
         clk            => clk46r6,
         reset          => reset or not combinerEn,
         am_disable     => '0', --MDB_CombRate(16),
         ch0gtch1       => MDB_CombRate(19),
         overridech     => MDB_CombRate(20),
         bestsrcmode    => MDB_CombRate(24),
         dQM_AGCn       => MDB_CombRate(28),
         lockthreshold  => MDB_CombRefLvl(28 downto 16),
         lockhysterisis => MDB_CombRefLvl(12 downto 0),
         ch0agc         => ch0FastAgc,
         ch1agc         => ch1FastAgc,
         ch0Dqm         => ch0Log10MseInv,
         ch1Dqm         => ch1Log10MseInv,
         ch0real        => Real1Out,
         ch0imag        => Imag1Out,
         ch1real        => Real2Out,
         ch1imag        => Imag2Out,
         lag_coef       => MDB_CombLag(17 downto 0),
         lead_coef      => MDB_CombLead(17 downto 0),
         sweeplmt       => MDB_CombSwLmt(14 downto 0),
         swprate        => MDB_CombRate(17 downto 0),
         realout        => realout,
         imagout        => imagout,
         reallock       => reallock,
         imaglock       => imaglock,
         locked         => locked,
         agc0_gt_agc1   => agc0_gt_agc1,
         lag_out        => lag_out,
         nco_control_out=> nco_control_out,
         phase_detect   => phase_detect,
         maximagout     => maximagout,
         maxrealout     => maxrealout,
         minimagout     => minimagout,
         minrealout     => minrealout,
         realxord       => realxord,
         imagxord       => imagxord,
         gainoutmax     => gainoutmax,
         gainoutmin     => gainoutmin
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

