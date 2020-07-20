-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco, Inc. All rights reserved.
--
-- This file contains Semco Inc. proprietary information. It is the
-- property of Semco Inc. and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco Inc.,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco, Inc.
--
-- Module Name: RAM_2Reads_1Write.vhd
-- Description: Block RAM of generically controlled width and depth with Init file.
--    Allows read and write on port A with additional read on port B.The optional
-- init file can be used to function as a ROM also. Just tie WrEnA low.
--
-- Note, the init file must be a hex slv format.
--
-- Dependencies: None
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 9-4-16  Initial release FZ
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use IEEE.std_logic_textio.all;
use work.fixed_pkg.all;
library std;
use std.textio.all;

ENTITY RAM_2Reads_1WriteVerWrap IS
   GENERIC(
      FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
      DATA_WIDTH  : positive  := 32;
      BINPT       : integer   := -20;      -- only used to scale file readings. Watch the sign
      ADDR_WIDTH  : natural   := 9;
      FILE_IS_SLV : boolean   := false;    -- nonSLV files are not synthesizable
      LATENCY     : positive  := 1;
      MAX_ADDR    : natural   := 0;       -- if non-zero only count to max_addr
      RAM_TYPE    : string    := "block"  -- or "distributed"
   );
   PORT(
      clk,
      ce,
      reset,
      WrEn           : IN  std_logic;
      WrAddr,
      RdAddrA,
      RdAddrB        : IN  std_logic_vector(ADDR_WIDTH-1 DOWNTO 0);
      WrData         : IN  std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
      RdOutA,
      RdOutB         : OUT std_logic_vector(DATA_WIDTH-1 DOWNTO 0)
   );
END RAM_2Reads_1WriteVerWrap;

ARCHITECTURE rtl OF RAM_2Reads_1WriteVerWrap IS

   component RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;      -- only used to scale file readings. Watch the sign
         ADDR_WIDTH  : natural   := 9;
         FILE_IS_SLV : boolean   := false;    -- nonSLV files are not synthesizable
         LATENCY     : positive  := 1;
         MAX_ADDR    : natural   := 0;       -- if non-zero only count to max_addr
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
   end component RAM_2Reads_1Write;

   signal   WrAddr_n,
            RdAddrA_n,
            RdAddrB_n   :  natural range 0 to 2**ADDR_WIDTH-1;

   begin

      WrAddr_n    <= to_integer(unsigned(WrAddr));
      RdAddrA_n   <= to_integer(unsigned(RdAddrA));
      RdAddrB_n   <= to_integer(unsigned(RdAddrB));

      RamWrapper : RAM_2Reads_1Write
         GENERIC MAP(
            FILENAME    => FILENAME,
            DATA_WIDTH  => DATA_WIDTH,
            BINPT       => BINPT,
            ADDR_WIDTH  => ADDR_WIDTH,
            FILE_IS_SLV => FILE_IS_SLV,
            LATENCY     => LATENCY,
            MAX_ADDR    => MAX_ADDR,
            RAM_TYPE    => RAM_TYPE
         )
         PORT MAP(
            clk         => clk,
            ce          => ce,
            reset       => reset,
            WrEn        => WrEn,
            WrAddr      => WrAddr_n,
            RdAddrA     => RdAddrA_n,
            RdAddrB     => RdAddrB_n,
            WrData      => WrData,
            RdOutA      => RdOutA,
            RdOutB      => RdOutB
         );

end rtl;
