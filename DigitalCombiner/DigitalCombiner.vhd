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
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY DigitalCombiner IS
   PORT (
      clk,
      clk2x,
      clk4x,
      reset,
      ce,
      cs,
      wr0, wr1, wr2, wr3,
      busClk            : IN  std_logic;
      re1In,
      im1In,
      re2In,
      im2In             : IN  float_1_18;
      ch1agc,
      ch2agc            : IN  SLV12;
      addr              : IN  std_logic_vector(4 downto 0);
      dataIn            : IN  SLV32;
      dataOut           : OUT SLV32;
      maximagout,
      maxrealout,
      minimagout,
      minrealout,
      imagout,
      realout,
      ifOut,
      gainoutmax,
      gainoutmin,
      phase_detect      : OUT SLV18;
      agc1_gt_agc2,
      realxord,
      imagxord,
      combinerEn,
      locked,
      CarrierDetect,
      ifBS_n            : OUT STD_LOGIC;
      imaglock,
      reallock          : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
      lag_out           : OUT SLV32;
      nco_control_out   : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
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
         CarrierDetect,
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

  -- Signals
   signal   Real1Out,
            Imag1Out,
            Real2Out,
            Imag2Out       : SLV18;
   signal   Index          : SLV8;
   signal   MDB_180_1,
            MDB_182_3,
            MDB_184_5,
            MDB_188_9      : SLV32;
   signal   MDB_186,
            MDB_187        : SLV16;
   signal   DucCount       : unsigned(1 downto 0) := "00";

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

   IF_Align_u : IF_Align
      PORT MAP (
         clk            => clk,
         clk4x          => clk4x,
         reset          => reset or not combinerEn,
         CarrierDetect  => CarrierDetect,
         ce             => '1',
         Re1In          => re1In,
         Im1In          => im1In,
         Re2In          => re2In,
         Im2In          => im2In,
         Re1Out         => Real1Out,
         Im1Out         => Imag1Out,
         Re2Out         => Real2Out,
         Im2Out         => Imag2Out,
         Index          => Index
     );
/*
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
         CarrierDetect  => CarrierDetect,
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

   GenIF : DUC
      port map (
         clk      => clk2x,
         ce       => '1',
         realIn   => realOut,
         imagIn   => imagOut,
         ifOut    => ifOut
      );
*/
END rtl;

