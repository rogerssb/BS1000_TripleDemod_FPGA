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
-- Module Name: RAM_2Reads_1WriteX2.vhd
-- Description: Block RAM of generically controlled width and depth with Init file.
--    Allows read and write on port A with additional read on port B.The optional
-- init file can be used to function as a ROM also. Just tie WrEnA low.
--
-- Has secondary std_logic memory for SovaMex pAu data
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

ENTITY RAM_2Reads_1WriteX2 IS
   GENERIC(
      FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
      DATA_WIDTH  : positive  := 32;
      BINPT       : integer   := -20;      -- only used to scale file readings. Watch the sign
      ADDR_WIDTH  : natural   := 9;
      FILE_IS_SLV : boolean   := false;    -- nonSLV files are not synthesizable
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
END RAM_2Reads_1WriteX2;

ARCHITECTURE rtl OF RAM_2Reads_1WriteX2 IS

   type     MyRamA is array (0 to 2**ADDR_WIDTH-1) of std_logic_vector (DATA_WIDTH-2 downto 0); -- 2D Array Declaration for RAM signal. Note first read is addr 0

   signal   BlockRamB   : std_logic_vector(0 to 2**ADDR_WIDTH-1);
   signal   BufA,
            BufB,
            RdRegA,
            RdRegB,
            RamDataA,
            RamDataB    : std_logic_vector(DATA_WIDTH-1 downto 0) ;

   -- Define RAM
   signal      BlockRam                : MyRamA := (others=>(others=>'0'));
   attribute   ram_style               : string;
   attribute   ram_style of BlockRam   : signal is RAM_TYPE;

begin

   process(clk)
   begin
       if (rising_edge(clk)) then
           if (WrEn and ce) then
               BlockRam(WrAddr)  <= WrData(DATA_WIDTH-2 downto 0);
               BlockRamB(WrAddr) <= WrData(DATA_WIDTH - 1);
           end if;
           if (ce) then
               RamDataA <= BlockRamB(RdAddrA) & BlockRam(RdAddrA);
               RamDataB <= BlockRamB(RdAddrB) & BlockRam(RdAddrB);
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

   -- this is the lazy cousine who'll get it out eventually
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
