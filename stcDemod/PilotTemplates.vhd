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

Module Name: PilotTemplates.vhd
Description: These are FFTs of the pilot patterns offset -66KHz, 0 and +66KHz

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
use work.Semco_pkg.ALL;

ENTITY PilotTemplates IS
   PORT(
      clk            : IN  std_logic;
      reset          : IN  std_logic;
      ce             : IN  std_logic;
      Count          : IN  natural range 0 to 1023;
--      H0NegR,
--      H0NegI,
--      H1NegR,
--      H1NegI,
--      H0PosR,
--      H0PosI,
--      H1PosR,
--      H1PosI,
      H0CntrR,
      H0CntrI,
      H1CntrR,
      H1CntrI        : OUT FLOAT_256_LP
   );
END PilotTemplates;


ARCHITECTURE rtl OF PilotTemplates IS

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
      FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
      DATA_WIDTH  : positive  := 32;
      BINPT       : integer   := -20;
      ADDR_WIDTH  : positive  := 9;
      FILE_IS_SLV : boolean   := true;    -- nonSLV files are not synthesizable
      LATENCY     : positive  := 1;
      RAM_TYPE    : string    := "block"  -- or "distributed"
      );
      PORT(
         clk,
         ce,
         reset,
         WrEn           : IN  std_logic;
         WrAddr,
         RdAddrA,
         RdAddrB        : IN  natural range 0 to 2**ADDR_WIDTH-1;
         WrData         : In  std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
         RdOutA,
         RdOutB         : OUT std_logic_vector(DATA_WIDTH-1 DOWNTO 0)
      );
   END COMPONENT RAM_2Reads_1Write;

  -- Signals
  SIGNAL /*H0NegRslv,
         H0NegIslv,
         H1NegRslv,
         H1NegIslv,
         H0PosRslv,
         H0PosIslv,
         H1PosRslv,
         H1PosIslv,*/
         H0CntrRslv,
         H0CntrIslv,
         H1CntrRslv,
         H1CntrIslv               : SLV18;

BEGIN

   H0CntrR <= to_sfixed(H0CntrRslv, H0CntrR);
   H0CntrI <= to_sfixed(H0CntrIslv, H0CntrI);
   H1CntrR <= to_sfixed(H1CntrRslv, H1CntrR);
   H1CntrI <= to_sfixed(H1CntrIslv, H1CntrI);
   --   H0NegR  <= to_sfixed(H0NegRslv,  H0NegR);
   --   H0NegI  <= to_sfixed(H0NegIslv,  H0NegI);
   --   H1NegR  <= to_sfixed(H1NegRslv,  H1NegR);
   --   H1NegI  <= to_sfixed(H1NegIslv,  H1NegI);
   --   H0PosR  <= to_sfixed(H0PosRslv,  H0PosR);
   --   H0PosI  <= to_sfixed(H0PosIslv,  H0PosI);
   --   H1PosR  <= to_sfixed(H1PosRslv,  H1PosR);
   --   H1PosI  <= to_sfixed(H1PosIslv,  H1PosI);
/*
   -- -66KHz FFT of H0/1/R/I
   H0NegR_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\neg_h0_r_pt9.slv",
         DATA_WIDTH  => FLOAT_256_LP'length,
         BINPT       => FLOAT_256_LP'right,
         ADDR_WIDTH  => 10,
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
         RdAddrA     => Count,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H0NegRslv,
         RdOutB      => open
      );
   H0NegI_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\Neg_h0_I_pt9.slv",
         DATA_WIDTH  => FLOAT_256_LP'length,
         BINPT       => FLOAT_256_LP'right,
         ADDR_WIDTH  => 10,
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
         RdAddrA     => Count,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H0NegIslv,
         RdOutB      => open
      );
   H1NegR_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\Neg_h1_R_pt9.slv",
         DATA_WIDTH  => FLOAT_256_LP'length,
         BINPT       => FLOAT_256_LP'right,
         ADDR_WIDTH  => 10,
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
         RdAddrA     => Count,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H1NegRslv,
         RdOutB      => open
      );
   H1NegI_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\Neg_h1_I_pt9.slv",
         DATA_WIDTH  => FLOAT_256_LP'length,
         BINPT       => FLOAT_256_LP'right,
         ADDR_WIDTH  => 10,
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
         RdAddrA     => Count,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H1NegIslv,
         RdOutB      => open
      );
*/
   -- 0KHz FFT of H0/1/R/I
   H0CntrR_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\Center_h0_R_pt9.slv",
         DATA_WIDTH  => FLOAT_256_LP'length,
         BINPT       => FLOAT_256_LP'right,
         ADDR_WIDTH  => 10,
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
         RdAddrA     => Count,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H0CntrRslv,
         RdOutB      => open
      );
   H0CntrI_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\Center_h0_I_pt9.slv",
         DATA_WIDTH  => FLOAT_256_LP'length,
         BINPT       => FLOAT_256_LP'right,
         ADDR_WIDTH  => 10,
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
         RdAddrA     => Count,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H0CntrIslv,
         RdOutB      => open
      );
   H1CntrR_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\Center_h1_R_pt9.slv",
         DATA_WIDTH  => FLOAT_256_LP'length,
         BINPT       => FLOAT_256_LP'right,
         ADDR_WIDTH  => 10,
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
         RdAddrA     => Count,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H1CntrRslv,
         RdOutB      => open
      );
   H1CntrI_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\Center_h1_I_pt9.slv",
         DATA_WIDTH  => FLOAT_256_LP'length,
         BINPT       => FLOAT_256_LP'right,
         ADDR_WIDTH  => 10,
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
         RdAddrA     => Count,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H1CntrIslv,
         RdOutB      => open
      );
/*
   -- +66KHz FFT of H0/1/R/I
   H0PosR_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\Pos_h0_R_pt9.slv",
         DATA_WIDTH  => FLOAT_256_LP'length,
         BINPT       => FLOAT_256_LP'right,
         ADDR_WIDTH  => 10,
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
         RdAddrA     => Count,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H0PosRslv,
         RdOutB      => open
      );
   H0PosI_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\Pos_h0_I_pt9.slv",
         DATA_WIDTH  => FLOAT_256_LP'length,
         BINPT       => FLOAT_256_LP'right,
         ADDR_WIDTH  => 10,
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
         RdAddrA     => Count,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H0PosIslv,
         RdOutB      => open
      );
   H1PosR_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\Pos_h1_R_pt9.slv",
         DATA_WIDTH  => FLOAT_256_LP'length,
         BINPT       => FLOAT_256_LP'right,
         ADDR_WIDTH  => 10,
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
         RdAddrA     => Count,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H1PosRslv,
         RdOutB      => open
      );
   H1PosI_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "..\sourceData\Pos_h1_I_pt9.slv",
         DATA_WIDTH  => FLOAT_256_LP'length,
         BINPT       => FLOAT_256_LP'right,
         ADDR_WIDTH  => 10,
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
         RdAddrA     => Count,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => H1PosIslv,
         RdOutB      => open
      );
*/

END rtl;
