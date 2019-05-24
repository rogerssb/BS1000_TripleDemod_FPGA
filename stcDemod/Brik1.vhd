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

Module Name: Brik1.vhd
Description:

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
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY Brik1 IS
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
END Brik1;


ARCHITECTURE rtl OF Brik1 IS

   COMPONENT PilotDetect is
    GENERIC (SIM_MODE : boolean := false
   );
      PORT(
         clk,
         clk2x,
         reset,
         reset2x,
         ce,
         ValidIn        : IN  std_logic;
         Variables      : IN  RecordType;
         ReIn,
         ImIn           : IN  FLOAT_1_18;
         PilotIndex     : OUT ufixed(10 downto 0);
         PilotMag,
         Threshold      : OUT ufixed(10 downto -7);
         ReOut,
         ImOut          : OUT FLOAT_1_18;
         PilotFound,
         ValidOut,
         StartOut       : OUT std_logic
      );
   end COMPONENT PilotDetect;

   COMPONENT pilotsync
      PORT (
         clk,
         reset,
         ce,
         PilotPulseIn,
         ValidIn        : IN STD_LOGIC;
         Variables      : IN  RecordType;   -- for resampler and PilotDetect
         IndexIn        : IN ufixed(10 DOWNTO 0);
         RealIn,
         ImagIn         : IN  Float_1_18;
         RealOut,
         ImagOut        : OUT Float_1_18;
         StartOut,
         ValidOut,
         PilotLocked    : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Signals
   SIGNAL   PilotPulse,
            PilotValidOut     : std_logic;
   SIGNAL   PilotRealOut,
            PilotImagOut      : Float_1_18;
   SIGNAL   PilotIndex        : ufixed(10 downto 0);
   SIGNAL   PilotMag,
            Threshold         : ufixed(11 downto -6);

BEGIN

   PD_u : pilotdetect
      GENERIC MAP (
         SIM_MODE => SIM_MODE
      )
      PORT MAP (
         clk            => clk,
         clk2x          => clk2x,
         reset          => reset,
         reset2x        => reset2x,
         ce             => ce,
         ValidIn        => ValidIn,
         Variables      => Variables,
         ReIn           => ResampleR,
         ImIn           => ResampleI,
         -- outputs
         PilotMag       => PilotMag,
         PilotFound     => PilotFound,
         PilotIndex     => PilotIndex,
         Threshold      => Threshold,
         ReOut          => PilotRealOut,
         ImOut          => PilotImagOut,
         ValidOut       => PilotValidOut,
         StartOut       => PilotPulse
   );

   PS_u : pilotsync
      PORT MAP (
         clk            => clk,
         ce             => ce,
         reset          => reset,
         Variables      => Variables,
         PilotPulseIn   => PilotPulse,
         ValidIn        => PilotValidOut,
         IndexIn        => PilotIndex,
         RealIn         => PilotRealOut,
         ImagIn         => PilotImagOut,
         RealOut        => RealOut,
         ImagOUt        => ImagOut,
         StartOut       => StartOut,
         ValidOut       => ValidOut,
         PilotLocked    => PilotLocked
   );

END rtl;
