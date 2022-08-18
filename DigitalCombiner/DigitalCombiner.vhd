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
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY DigitalCombiner IS
   PORT (
      clk,
      clk2x,
      clk4x,
      SideCarClk,
      reset,
      cs,
      wr0, wr1, wr2, wr3,
      busClk,
      NextClk_p,
      NextClk_n,
      PrevClk_p,
      PrevClk_n         : IN  std_logic;
      PrevData_p,
      PrevData_n,
      NextData_p,
      NextData_n        : IN  std_logic_vector(4 downto 0);
      addr              : IN  std_logic_vector(4 downto 0);
      dataIn            : IN  SLV32;
      dataOut           : OUT SLV32;
      imagout,
      realout           : OUT SLV18;
      agc1_gt_agc2,
      realxord,
      imagxord,
      combinerEn,
      locked,
      ifBS_n            : OUT STD_LOGIC;
      imaglock,
      reallock          : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
      DdsData           : OUT SLV18
   );
END DigitalCombiner;


ARCHITECTURE rtl OF DigitalCombiner IS

   COMPONENT combinerRegs
      PORT (
         cs,
         wr0, wr1, wr2, wr3,
         realLock, imagLock, locked,
         busClk         : IN  std_logic;
         addr           : IN  std_logic_vector(4 downto 0);
         dataIn         : IN  SLV32;
         dataOut        : OUT SLV32;
         Index          : IN  SLV8;
         MDB_180_1,
         MDB_182_3,
         MDB_184_5,
         MDB_188_9      : OUT SLV32;
         MDB_186,
         MDB_187        : OUT SLV16
      );
   END COMPONENT combinerRegs;

   COMPONENT IF_Align
      PORT (
         Clk,
         Clk4x,
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
         ch1gtch2          : IN STD_LOGIC;
         ch1agc,
         ch2agc            : IN  SLV12;
         ch1imag,
         ch1real,
         ch2imag,
         ch2real,
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
         agc1_gt_agc2,
 --        CarrierDetect,
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
            ce       : in  std_logic;
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
         Clk93M,
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
         reset             : IN  std_logic;
         ifIn1,
         ifIn2             : IN  SLV18;
         iOut1,
         qOut1,
         iOut2,
         qOut2             : OUT SLV18;
         syncOut           : OUT std_logic
      );
   END COMPONENT dualQuadDdc;

   component PdClkMmcm
      port (
         reset,
         clk_in1           : in     std_logic;
         locked,
         clk_out1,
         clk_out2          : out    std_logic
      );
   end component;

   COMPONENT AD9957
      PORT(
         clk,
         reset,
         DdsMiso        : IN  std_logic;
         DdsMosi,
         DdsCS_n,
         DdsClk,
         IO_Reset,
         DdsReset,
         DdsUpdate      : OUT std_logic
      );
   END COMPONENT AD9957;

  -- Signals
   signal   Real1Out,
            Imag1Out,
            Real2Out,
            Imag2Out          : SLV18;
   signal   Index             : SLV8;
   signal   MDB_180_1,
            MDB_182_3,
            MDB_184_5,
            MDB_188_9         : SLV32;
   signal   MDB_186,
            MDB_187           : SLV16;
   signal   DucCount          : unsigned(1 downto 0) := "00";
   SIGNAL   PrevData,
            NextData          : STD_LOGIC_VECTOR(4 DOWNTO 0);

   signal   Ch1Agc            : std_logic_vector(11 downto 0);
   signal   Ch2Agc            : std_logic_vector(11 downto 0);
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
            ImagCmbFFDly,
            Ch1Adc17,
            Ch2Adc17,
            Ch1Real,
            Ch1Imag,
            Ch2Real,
            Ch2Imag           : SLV18;
   signal   lag_out           : std_logic_vector(31 downto 0);
   signal   nco_control_out   : std_logic_vector(21 downto 0);
   signal   abs_agc_diff      : std_logic_vector(10 downto 0);
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
   signal   NextClk,
            PrevClk,
            DdsPdClkBufg,
            DdsPdClk2xBufg    : STD_LOGIC;

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of DataOut10,
            DataOut11,
            DataOut12,
            DataOut13,
            DataOut14,
            DataOut20,
            DataOut21,
            DataOut22,
            DataOut23,
            DataOut24,
            Ch1Real,
            Ch1Imag,
            Ch2Real,
            Ch2Imag,
            Ch1Adc17,
            Ch2Adc17,
            Real1Out,
            Imag1Out,
            Real2Out,
            Imag2Out,
            Index,
            ch1Agc,
            ch2Agc,
            imagout,
            realout             : signal is "TRUE";

BEGIN

   DC_Regs : combinerRegs
      PORT MAP(
         cs          => cs,
         wr0         => wr0,
         wr1         => wr1,
         wr2         => wr2,
         wr3         => wr3,
         busClk      => busClk,
         addr        => addr,
         dataIn      => dataIn,
         dataOut     => dataOut,
         Index       => Index,
         realLock    => realLock(12),
         imagLock    => imagLock(12),
         locked      => locked,
         MDB_180_1   => MDB_180_1,
         MDB_182_3   => MDB_182_3,
         MDB_186     => MDB_186,
         MDB_184_5   => MDB_184_5,
         MDB_188_9   => MDB_188_9,
         MDB_187     => MDB_187
      );

   combinerEn  <= MDB_187(4);
   ifBS_n      <= MDB_187(0);

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
      Clk93M      => clk,
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

   Ch1Adc17 <= DataOut11(5 downto 0) & DataOut10 & "0000";
   Ch2Adc17 <= DataOut21(5 downto 0) & DataOut20 & "0000";
   Ch1Agc <= DataOut13(3 downto 0) & DataOut12;
   Ch2Agc <= DataOut23(3 downto 0) & DataOut22;

   preDdc : dualQuadDdc    -- Down convert incoming IFs to baseband, do both channels with same phase LO
   port map (
      clk      => clk,
      reset    => reset,
      ifIn1    => Ch1Adc17,
      ifIn2    => Ch2Adc17,
      syncOut  => open,
      iOut1    => Ch1Real,
      qOut1    => Ch1Imag,
      iOut2    => Ch2Real,
      qOut2    => Ch2Imag
   );


   IF_Align_u : IF_Align
      PORT MAP (
         clk            => clk,
         clk4x          => clk4x,
         reset          => reset or not combinerEn,
         CarrierDetect  => '1',
         ce             => '1',
         Re1In          => to_sfixed(Ch1Real, 0, -17),
         Im1In          => to_sfixed(Ch1Imag, 0, -17),
         Re2In          => to_sfixed(Ch2Real, 0, -17),
         Im2In          => to_sfixed(Ch2Imag, 0, -17),
         Re1Out         => Real1Out,
         Im1Out         => Imag1Out,
         Re2Out         => Real2Out,
         Im2Out         => Imag2Out,
         Index          => Index
     );

  CmplxPhsDet : complexphasedetector_0
      PORT MAP (
         clk            => clk,
         reset          => reset or not combinerEn,
         ch1agc         => ch1Agc,
         ch2agc         => ch2Agc,
         ch1real        => Real1Out,
         ch1imag        => Imag1Out,
         ch2real        => Real2Out,
         ch2imag        => Imag2Out,
         lag_coef       => MDB_180_1(17 downto 0),
         lead_coef      => MDB_182_3(17 downto 0),
         sweeplmt       => MDB_186(14 downto 0),
         swprate        => MDB_184_5(17 downto 0),
         realout        => realout,
         imagout        => imagout,
         reallock       => reallock,
         imaglock       => imaglock,
         locked         => locked,
         agc1_gt_agc2   => agc1_gt_agc2,
--         CarrierDetect  => CarrierDetect,
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
         gainoutmin     => gainoutmin,
         am_disable     => MDB_188_9(0),
         ch1gtch2       => MDB_188_9(1),
         overridech     => MDB_188_9(2),
         lockthreshold  => MDB_188_9(28 downto 16),
         lockhysterisis => '0' & MDB_188_9(15 downto 4)
      );
/*
   GenIF : DUC
      port map (
         clk      => clk2x,
         ce       => '1',
         realIn   => realOut,
         imagIn   => imagOut,
         ifOut    => ifOut
      );
*/


   DdsClkBufg : PdClkMmcm
      port map (
         clk_in1     => SideCarClk,
         reset       => reset,
         locked      => open,
         clk_out1    => DdsPdClkBufg,
         clk_out2    => DdsPdClk2xBufg
   );

      IF_BuffProc : process (DdsPdClkBufg)
      begin
         if (rising_edge(DdsPdClkBufg)) then
            RealCmbFF      <= realout;
            ImagCmbFF      <= imagout;
            ImagCmbFFDly   <= ImagCmbFF;
         end if;
      end process;

      IF_OutProc : process (DdsPdClk2xBufg)
      begin
         if (rising_edge(DdsPdClk2xBufg)) then
            if (DdsPdClkBufg) then
               DdsData <= ImagCmbFFDly;
            else
               DdsData <= RealCmbFF;
            end if;
         end if;
      end process;

       -- The upconverter mixes R*R and I*I then adds, I*I is -1 so needs inverted
/*
   AD9957_u : AD9957
      PORT MAP(
      clk         => Clk,
      reset       => Reset,
      DdsMiso     => DdsMiso,
      DdsMosi     => DdsMosi,
      DdsCS_n     => DdsCS_n,
      DdsClk      => DdsSClk,
      IO_Reset    => DdsIO_Reset,
      DdsReset    => DdsReset,
      DdsUpdate   => DdsIO_Update
   );
*/
END rtl;

