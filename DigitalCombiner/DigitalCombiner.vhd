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
   GENERIC (
      useVio   : boolean := false
   );
   PORT (
      clk,
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
      addr              : IN  std_logic_vector(12 downto 0);
      dataIn            : IN  SLV32;
      dataOut           : OUT SLV32;
      maximagout,
      maxrealout,
      minimagout,
      minrealout,
      imagout,
      realout,
      agc1_gt_agc3,
      gainoutmax,
      gainoutmin,
      phase_detect      : OUT SLV18;
      agc1_gt_agc1      : OUT SLV12;
      agc1_gt_agc2,
      realxord,
      imagxord,
      locked,
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
          busClk        : IN  std_logic;
          addr          : IN  std_logic_vector(12 downto 0);
          dataIn        : IN  SLV32;
          dataOut       : OUT SLV32;
          lagCoef,
          leadCoef,
          sweepRate,
          refLevel      : OUT SLV18;
          sweepLimit    : OUT std_logic_vector(13 downto 0);
          attack        : OUT std_logic_vector(2 downto 0);
          decay         : OUT std_logic_vector(2 downto 0);
          ifBS_n        : OUT std_logic
      );
   END COMPONENT combinerRegs;

   COMPONENT IF_Align
      PORT (
         Clk,
         Clk4x,
         ce,
         Reset          : IN  std_logic;
         Attack,
         Decay          : IN  std_logic_vector(2 downto 0);
         RefLevel,
         Re1In,
         Im1In,
         Re2In,
         Im2In          : IN  float_1_18;
         AgcDiff        : OUT FLOAT_1_18;
         Re1Out,
         Im1Out,
         Re2Out,
         Im2Out         : OUT SLV18
      );
   END COMPONENT IF_Align;

   COMPONENT complexphasedetector_0
      PORT (
         clk,
         reset             : IN  STD_LOGIC;
         ch1agc,
         ch2agc            : IN  SLV12;
         ch1imag,
         ch1real,
         ch2imag,
         ch2real,
         fastagc_diff,
         lag_coef,
         lead_coef,
         swprate           : IN  SLV18;
         sweeplmt          : IN  STD_LOGIC_VECTOR(13 DOWNTO 0);
         maximagout,
         maxrealout,
         minimagout,
         minrealout,
         imagout,
         realout,
         agc1_gt_agc3,
         gainoutmax,
         gainoutmin,
         phase_detect      : OUT SLV18;
         agc1_gt_agc1      : OUT SLV12;
         agc1_gt_agc2,
         realxord,
         imagxord,
         locked            : OUT STD_LOGIC;
         imaglock,
         reallock          : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
         lag_out           : OUT SLV32;
         nco_control_out   : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
      );
   END COMPONENT complexphasedetector_0;

  -- Signals
   signal   Real1Out,
            Imag1Out,
            Real2Out,
            Imag2Out,
            refLevel       : SLV18;
   signal   FastAgcDiff    : FLOAT_1_18;
   signal   attack,
            decay          : std_logic_vector(2 downto 0);
   signal   lagCoef,
            leadCoef,
            sweepRate      : SLV18;
   signal   sweepLimit     : STD_LOGIC_VECTOR(13 DOWNTO 0);
   signal   regCs          : std_logic;

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of Real1Out, Real2Out, cs, wr0, wr1, wr2, wr3,
      busClk, addr, dataIn, dataOut, lagCoef, leadCoef, sweepRate,
      sweepLimit, refLevel, attack, decay, ifBS_n : signal is "TRUE";


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
         lagCoef     => lagCoef,
         leadCoef    => leadCoef,
         sweepRate   => sweepRate,
         sweepLimit  => sweepLimit,
         refLevel    => refLevel,
         attack      => attack,
         decay       => decay,
         ifBS_n      => ifBS_n
      );


   IF_Align_u : IF_Align
      PORT MAP (
         clk         => clk,
         clk4x       => clk4x,
         reset       => reset,
         ce          => '1',
         Attack      => attack,
         Decay       => decay,
         RefLevel    => to_sfixed(refLevel, 0, -17),
         Re1In       => re1In,
         Im1In       => im1In,
         Re2In       => re2In,
         Im2In       => im2In,
         Re1Out      => Real1Out,
         Im1Out      => Imag1Out,
         Re2Out      => Real2Out,
         Im2Out      => Imag2Out,
         AgcDiff     => FastAgcDiff
     );

  CmplxPhsDet : complexphasedetector_0
   PORT MAP (
      clk            => clk,
      reset          => reset,
      ch1agc         => ch1Agc,
      ch2agc         => ch2Agc,
      ch1real        => Real1Out,
      ch1imag        => Imag1Out,
      ch2real        => Real2Out,
      ch2imag        => Imag2Out,
      fastagc_diff   => to_slv(FastAgcDiff),
      lag_coef       => lagCoef,
      lead_coef      => leadCoef,
      sweeplmt       => sweepLimit,
      swprate        => sweepRate,
      realout        => realout,
      imagout        => imagout,
      reallock       => reallock,
      imaglock       => imaglock,
      locked         => locked,
      agc1_gt_agc1   => agc1_gt_agc1,
      agc1_gt_agc2   => agc1_gt_agc2,
      agc1_gt_agc3   => agc1_gt_agc3,
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

END rtl;

