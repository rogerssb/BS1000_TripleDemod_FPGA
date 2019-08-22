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
-- Module Name: ROM_2D.vhd
-- Description: Block ROM of generically controlled width and depth with Init file.
--    Allows read on both ports. Setup as a 2x2 array.
--
-- Note, the init file must be a hex slv format in 0 downto -31 scaling. The resulting
-- output is -7 downto -24. This routine will not work if LEFT or RIGHT are not
-- within the 0 to -31 range.
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
library std;
use std.textio.all;
use work.fixed_pkg.all;
USE IEEE.math_real.all;
use work.Semco_pkg.ALL;

ENTITY ROM_2D IS
   GENERIC(
      FILENAME    : string    := "..\simData\sinv_lut_i.slv";
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
      OutB           : OUT std_logic_vector(DATA_WIDTH-1 DOWNTO 0)
   );
END ROM_2D;

ARCHITECTURE rtl OF ROM_2D IS

   type     ram_type is array (0 to 2**ADDR_WIDTH-1) of std_logic_vector (DATA_WIDTH-1 downto 0);

   impure function InitRamFromFile (RamFileName : in string; Index : in integer) return ram_type is
      file     FilePntr	   : text;
      variable ramfileline : line;
      variable FuncRam	   : ram_type := (others=>(others=>'0'));
      variable Slv_v       : SLV32;
      variable Good_v      : boolean;
      variable SFixOut     : sfixed(LEFT downto RIGHT);
      variable SFixIn      : sfixed(0 downto -31);
   begin
      file_open(FilePntr, RamFileName, read_mode);
      for i in 0 to SEARCH_LENGTH loop
         for j in 0 to SEARCH_LENGTH loop
            for k in 0 to 3 loop
               if (not endfile(FilePntr)) then
                  readline (FilePntr, ramfileline);
                  hread(ramfileline, Slv_v, Good_v);
                  if (Index = k) then
                     SFixIn := to_sfixed(Slv_v, SFixIn);
                     SFixOut := resize(SFixIn, SFixOut);
                     FuncRam(i*128+j) := to_slv(SFixOut);
                  end if;
                  assert Good_v report "Failed to convert SLV of: " & ramfileline.all severity FAILURE;
               else
                  report "End of file reached" severity FAILURE;
               end if;
            end loop;
         end loop;
       end loop;
       return FuncRam;
   end function;

-- Define RAM

   signal   BlockRam          : ram_type := InitRamFromFile(FILENAME, Index);
   signal   RdAddrA,
            RdAddrB           : integer range 0 to 2**14 - 1;
   signal   RegA,
            RegB              : std_logic_vector(DATA_WIDTH-1 DOWNTO 0);

begin

   RdAddrA <= to_integer(unsigned(AddrA));
   RdAddrB <= to_integer(unsigned(AddrB));

   process(clk)
   begin
       if (rising_edge(clk)) then
           if (reset) then
               RegA <= (others=>'0');
               RegB <= (others=>'0');
               OutA <= (others=>'0');
               OutB <= (others=>'0');
           elsif (ce) then
               RegA <= BlockRam(RdAddrA);
               RegB <= BlockRam(RdAddrB);    -- add memory output registers
               OutA <= RegA;
               OutB <= RegB;
           end if;
       end if;
   end process;

end rtl;
