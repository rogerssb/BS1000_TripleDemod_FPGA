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

ENTITY RAM_2Reads_1Write IS
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
END RAM_2Reads_1Write;

ARCHITECTURE rtl OF RAM_2Reads_1Write IS

   type     MyRam is array (0 to 2**ADDR_WIDTH-1) of std_logic_vector (DATA_WIDTH-1 downto 0); -- 2D Array Declaration for RAM signal. Note first read is addr 0

   signal   BufA,
            BufB,
            RdRegA,
            RdRegB,
            RamDataA,
            RamDataB    : std_logic_vector(DATA_WIDTH-1 downto 0) ;
   signal   WrEnCe      : std_logic;

   -- The folowing code either initializes the memory values to a specified file or to all zeros to match hardware
   -- The decimal place is set in Matlab such that BinPt bits are right justified in a 32 bit word. This routine reads
   -- the 32 bit hex values, then takes the rightmost DataWidth values. Having data width minimizes the ram width.
   impure function initramfromfile (RamFileName : in string) return MyRam is
      file     FilePntr    : text;
      variable ramfileline : line;
      variable FuncRam     : MyRam;
      variable SLV         : std_logic_vector(31 downto 0);
      variable RealValue   : real;
      variable Good_v      : boolean;
      variable CountMax    : natural;
   begin
      if (MAX_ADDR > 0) then
         CountMax := MAX_ADDR;
      else
         CountMax := MyRam'length;
      end if;
      file_open(FilePntr, RamFileName, read_mode);
      for i in 0 to CountMax loop
         if not ENDFILE(FilePntr) then
            readline (FilePntr, ramfileline);
            if (FILE_IS_SLV) then
               hread(ramfileline, SLV, Good_v);
               assert Good_v report "Failed to convert hex of: " & ramfileline.all severity FAILURE;
               FuncRam(i) := SLV(DATA_WIDTH-1 downto 0);
            else
               read(ramfileline, RealValue, Good_v);
               FuncRam(i) := to_slv(to_sfixed(RealValue, DATA_WIDTH + BINPT - 1, BINPT, fixed_saturate, fixed_truncate));
               assert Good_v report "Failed to convert real of: " & ramfileline.all severity FAILURE;
            end if;
         else
            if (i < MyRam'high) then
               report "End of file reached before end of memory initialized" severity warning;
            end if;
            exit;
         end if;
      end loop;
      return FuncRam;
   end function;

   impure function init_from_file_or_zeroes(RamFileName : string) return MyRam is
   begin
       if (RamFileName = "") then
           return (others => (others => '0'));
       else
           return InitRamFromFile(RamFileName) ;
       end if;
   end;

   -- Define RAM
   signal      BlockRam                : MyRam := init_from_file_or_zeroes(FILENAME);
   attribute   ram_style               : string;
   attribute   ram_style of BlockRam   : signal is RAM_TYPE;

   attribute KEEP : string;
   attribute KEEP of WrEnCe : signal is "true";

begin

   WrEnCe <= WrEn and ce;

   process(clk)
   begin
       if (rising_edge(clk)) then
           if (WrEnCe) then
               BlockRam(WrAddr) <= WrData;
           end if;
           if (ce) then
               RamDataA <= BlockRam(RdAddrA);
               RamDataB <= BlockRam(RdAddrB);
           end if;
       end if;
   end process;

   --  Following code generates LOW_LATENCY (no output register)
   --  Following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing
   no_output_register : if LATENCY = 1 generate
       RdOutA <= RamDataA;
       RdOutB <= RamDataB;
   end generate;

   --  Following code generates HIGH_PERFORMANCE (use output register)
   --  Following is a 2 clock cycle read latency with improved clock-to-out timing
   output_register : if LATENCY = 2  generate
      process(clk)
      begin
          if (rising_edge(clk)) then
              if (reset) then
                  RdRegA <= (others => '0');
                  RdRegB <= (others => '0');
              elsif (ce) then
                  RdRegA <= RamDataA;
                  RdRegB <= RamDataB;
              end if;
          end if;
      end process;
      RdOutA <= RdRegA;
      RdOutB <= RdRegB;
   end generate;

   -- this is the lazy cousing who'll get it out eventually
   buffered_output_register : if LATENCY = 3  generate
      process(clk)
      begin
         if(rising_edge(clk)) then
            if (reset) then
               RdRegA <= (others => '0');
               RdRegB <= (others => '0');
               BufA   <= (others => '0');
               BufB   <= (others => '0');
            elsif (ce) then
               RdRegA <= RamDataA;
               RdRegB <= RamDataB;
               BufA   <= RdRegA;
               BufB   <= RdRegB;
            end if;
         end if;
      end process;
      RdOutA <= BufA;
      RdOutB <= BufB;
   end generate;

end rtl;
