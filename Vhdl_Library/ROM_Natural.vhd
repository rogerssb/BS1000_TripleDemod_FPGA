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
-- Module Name: ROM_Natural.vhd
-- Description: Block ROM of generically controlled width and depth with Init file.
--    Allows read on both ports.
--
-- Note, the init file must be in hex format
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

ENTITY ROM_Natural IS
   GENERIC(
      FILENAME    : string    := "..\file.slv";
      DATA_WIDTH  : Natural  := 18;
      DEPTH       : Natural  := 2048;
      LATENCY     : Natural  := 1;       -- 1 or 2
      MEM_TYPE    : string    := "block"  -- or "distributed"
   );
   PORT(
      clk,
      ce,
      reset          : IN  std_logic;
      AddrA,
      AddrB          : IN  natural range 0 to DEPTH;
      OutA,
      OutB           : OUT integer range 0 to 2**DATA_WIDTH-1
   );
END ROM_Natural;

ARCHITECTURE rtl OF ROM_Natural IS

   TYPE  vector_of_slvs  IS ARRAY (NATURAL RANGE <>) OF std_logic_vector;
   type  rom_type       is array (0 to DEPTH) of std_logic_vector(DATA_WIDTH-1 downto 0);

   impure function InitRomFromFile (RamFileName : in string) return rom_type is
      file     FilePntr	   : text;
      variable ramfileline : line;
      variable FuncRam	   : rom_type := (others=>(others=>'0'));
      variable Slv_v       : std_logic_vector(31 downto 0);
      variable Good_v      : boolean;
   begin
      file_open(FilePntr, RamFileName, read_mode);
      for i in 0 to DEPTH-5 loop          -- skip last four address since these are zeroed
         if (not endfile(FilePntr)) then
            readline (FilePntr, ramfileline);
            hread(ramfileline, Slv_v, Good_v);
            FuncRam(i) := Slv_v(DATA_WIDTH-1 downto 0);
            assert Good_v report "Failed to convert SLV of: " & ramfileline.all severity FAILURE;
         else
            report "End of file reached" severity FAILURE;
         end if;
       end loop;
       return FuncRam;
   end function;

-- Define RAM

   signal      BlockRom                : rom_type := InitRomFromFile(FILENAME);
   signal      RegA,
               RegB                    : vector_of_slvs(0 to 1)(DATA_WIDTH-1 downto 0);
   attribute   rom_style               : string;
   attribute   rom_style of BlockRom   : signal is MEM_TYPE;

begin

   process(clk)
   begin
       if (rising_edge(clk)) then
           if (reset) then
               RegA(0) <= (others=>'0');
               RegB(0) <= (others=>'0');
               RegA(1) <= (others=>'0');
               RegB(1) <= (others=>'0');
           elsif (ce) then
               RegA(0) <= BlockRom(AddrA);
               RegB(0) <= BlockRom(AddrB);    -- add memory output registers
               RegA(1) <= RegA(1);
               RegB(1) <= RegB(1);
           end if;
       end if;
   end process;

   OutA <= to_integer(unsigned(RegA(Latency-1)));
   OutB <= to_integer(unsigned(RegB(Latency-1)));

end rtl;
