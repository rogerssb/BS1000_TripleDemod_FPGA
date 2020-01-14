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

Module Name: FireberdDrive.vhd
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
Library xpm;
use xpm.vcomponents.all;

ENTITY FireberdDrive IS
   PORT(
      clk,
      reset,
      ce,
      MsbFirst,
      ValidIn        : IN  std_logic;
      RecoveredData  : IN  SLV4;
      ClocksPerBit   : IN  sfixed(0 downto -15);
      DataOut,
      ClkOut         : OUT std_logic
   );
END FireberdDrive;


ARCHITECTURE rtl OF FireberdDrive IS

   COMPONENT Fifo8k4to1
      PORT (
         clk : IN STD_LOGIC;
         srst : IN STD_LOGIC;
         din            : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         wr_en : IN STD_LOGIC;
         rd_en : IN STD_LOGIC;
         dout           : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         full           : OUT STD_LOGIC;
         empty          : OUT STD_LOGIC;
         wr_data_count : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
         prog_full      : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Signals
   SIGNAL   Accum       : sfixed(0 downto -15);
   SIGNAL   FifoDataIn,
            ClkDelay    : SLV4;
   SIGNAL   FifoDataOut : std_logic_vector(0 to 0);
   SIGNAL   WrCount     : STD_LOGIC_VECTOR(13 DOWNTO 0);
   SIGNAL   RdEn,
            Active,
            Empty,
            ProgFull    : std_logic;

   attribute KEEP : string;
   attribute KEEP of Active : signal is "true";

BEGIN

   FifoDataIn <= RecoveredData when (MsbFirst) else reverse_slv_bits(RecoveredData);
   DataOut    <= FifoDataOut(0);

   ClkProcess : process(Clk)
      variable Accum_v   : sfixed(0 downto -15);
   begin
      if (rising_edge(Clk)) then
         if (reset) then
            Accum    <= to_sfixed(0, Accum);
            Active   <= '0';
            RdEn     <= '0';
            ClkOut   <= '0';
            ClkDelay <= x"0";
         elsif (ce) then
            if (ProgFull) then
               Active <= '1';
            end if;
            if (Active) then
               Accum_v  := resize(Accum + ClocksPerBit, Accum);
               Accum    <= Accum_v;
               RdEn     <= Accum_v(0) and not Accum(0) and not empty;
            end if;
            ClkDelay <= ClkDelay(2 downto 0) & RdEn;
            ClkOut   <= ClkDelay(3) or ClkDelay(2);    -- Delay ClkOut into valid data, widen pulse to 93M clock
         end if;
      end if;
   end process ClkProcess;

   FdFifo  : Fifo8k4to1       -- 4 bit in, 1 bit output
   PORT MAP (
      clk            => clk,
      srst           => reset,
      din            => FifoDataIn,
      wr_en          => ValidIn,
      rd_en          => RdEn and not empty,
      dout           => FifoDataOut,
      full           => open,
      empty          => empty,
      wr_data_count  => WrCount,
      prog_full      => ProgFull
   );

END rtl;

