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

Module Name: SinvLuts.vhd
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
library std;
use std.textio.all;
use work.fixed_pkg.all;
USE IEEE.math_real.all;
use work.Semco_pkg.ALL;

ENTITY SinvLuts IS
   PORT(
      clk            : IN  std_logic;
      reset          : IN  std_logic;
      ce             : IN  std_logic;
      Xa, Xb,
      Ya, Yb         : IN natural range 0 to SEARCH_LENGTH;
      SsInvR0A,    -- ±.005
      SsInvR1A,
      SsInvI0A,
      SsInvI1A,
      SsInvR2A,
      SsInvI2A,
      SsInvR3A,
      SsInvI3A,
      SsInvR0B,
      SsInvR1B,
      SsInvI0B,
      SsInvI1B,
      SsInvR2B,
      SsInvI2B,
      SsInvR3B,
      SsInvI3B       : out sfixed(-7 downto -24)   -- 18 bit version
   );
END SinvLuts;

ARCHITECTURE rtl OF SinvLuts IS


   COMPONENT ROM_2D IS
      GENERIC(
      FILENAME    : string    := "..\sourceData\sinv_lut_i.slv";
      DATA_WIDTH  : positive  := 18;
      LEFT        : integer   := -7;
      RIGHT       : integer   := -24;
      ADDR_WIDTH  : positive  := 14;
      Index       : natural   := 1
      );
      PORT(
         clk,
         ce,
         reset          : IN  std_logic;
         AddrA,
         AddrB          : IN  std_logic_vector(ADDR_WIDTH-1 downto 0);
         OutA,
         OutB           : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
      );
   END COMPONENT ROM_2D;

  -- Signals
   SIGNAL   SinvRamR0A,
            SinvRamR1A,
            SinvRamI1A,
            SinvRamR3A,
            SinvRamR0B,
            SinvRamR1B,
            SinvRamI1B,
            SinvRamR3B  : SLV18;

BEGIN

   RamSinvR0 : ROM_2D
      GENERIC MAP(
         FILENAME    => "..\sourceData\sinv_lut_r_pt31.slv",
         Index       => 0
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         AddrA       => to_slv(to_ufixed(Xa, 6, 0)) & to_slv(to_ufixed(Ya, 6, 0)),
         AddrB       => to_slv(to_ufixed(Xb, 6, 0)) & to_slv(to_ufixed(Yb, 6, 0)),
         OutA        => SinvRamR0A,
         OutB        => SinvRamR0B
      );

   RamSinvR1 : ROM_2D
      GENERIC MAP(
         FILENAME    => "..\sourceData\sinv_lut_r_pt31.slv",
         Index       => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         AddrA       => to_slv(to_ufixed(Xa, 6, 0)) & to_slv(to_ufixed(Ya, 6, 0)),
         AddrB       => to_slv(to_ufixed(Xb, 6, 0)) & to_slv(to_ufixed(Yb, 6, 0)),
         OutA        => SinvRamR1A,
         OutB        => SinvRamR1B
      );

   RamSinvR3 : ROM_2D
      GENERIC MAP(
         FILENAME    => "..\sourceData\sinv_lut_r_pt31.slv",
         Index       => 3
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         AddrA       => to_slv(to_ufixed(Xa, 6, 0)) & to_slv(to_ufixed(Ya, 6, 0)),
         AddrB       => to_slv(to_ufixed(Xb, 6, 0)) & to_slv(to_ufixed(Yb, 6, 0)),
         OutA        => SinvRamR3A,
         OutB        => SinvRamR3B
      );

   RamSinvI1 : ROM_2D
      GENERIC MAP(
         FILENAME    => "..\sourceData\sinv_lut_i_pt31.slv",
         Index       => 1
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         AddrA       => to_slv(to_ufixed(Xa, 6, 0)) & to_slv(to_ufixed(Ya, 6, 0)),
         AddrB       => to_slv(to_ufixed(Xb, 6, 0)) & to_slv(to_ufixed(Yb, 6, 0)),
         OutA        => SinvRamI1A,
         OutB        => SinvRamI1B
      );

   SsInvR0A <= to_sfixed(SinvRamR0A, SsInvR0A);
   SsInvR1A <= to_sfixed(SinvRamR1A, SsInvR1A);
   SsInvI1A <= to_sfixed(SinvRamI1A, SsInvI1A);
   SsInvR3A <= to_sfixed(SinvRamR3A, SsInvR3A);

   SsInvR2A <= SsInvR1A;
   SsInvI2A <= not SsInvI1A; --resize(FLOAT_ZERO_1_HP - SsInvI1A, SsInvI2A);
   SsInvI0A <= to_sfixed(0, SsInvI0A);
   SsInvI3A <= to_sfixed(0, SsInvI3A);

   SsInvR0B <= to_sfixed(SinvRamR0B, SsInvR0B);
   SsInvR1B <= to_sfixed(SinvRamR1B, SsInvR1B);
   SsInvI1B <= to_sfixed(SinvRamI1B, SsInvI1B);
   SsInvR3B <= to_sfixed(SinvRamR3B, SsInvR3B);

   SsInvR2B <= SsInvR1B;
   SsInvI2B <= not SsInvI1B; --resize(FLOAT_ZERO_1_HP - SsInvI1B, SsInvI2B);
   SsInvI0B <= to_sfixed(0, SsInvI0B);
   SsInvI3B <= to_sfixed(0, SsInvI3B);

END rtl;

