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
      EstimatesDone,
      ValidIn        : IN  std_logic;
      RecoveredData  : IN  SLV4;
      PhaseIncr      : IN  SLV16;
      DataOut,
      ClkOut         : OUT std_logic
   );
END FireberdDrive;


ARCHITECTURE rtl OF FireberdDrive IS

   COMPONENT Fifo8k4to1
      PORT (
         clk            : IN STD_LOGIC;
         srst           : IN STD_LOGIC;
         din            : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         wr_en          : IN STD_LOGIC;
         rd_en          : IN STD_LOGIC;
         dout           : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         full           : OUT STD_LOGIC;
         empty          : OUT STD_LOGIC;
         wr_data_count  : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
      );
   END COMPONENT;

   CONSTANT FIFO_THRESH       : natural := 26;
   -- Signals
   SIGNAL   Accum             : signed(15 downto 0);
   SIGNAL   PhaseIncrDly      : SLV16;
   SIGNAL   EffectiveRate     : signed(12 downto 0);
   SIGNAL   ClkDelay          : SLV4;
   SIGNAL   FifoDataOut       : std_logic_vector(0 to 0);
   SIGNAL   FifoDepth         : STD_LOGIC_VECTOR(13 DOWNTO 0);
   SIGNAL   FifoOffset        : signed(12 DOWNTO 0);
   SIGNAL   RdEn,
            Active,
            AccumMsb,
            Full,
            Empty             : std_logic;

   attribute KEEP : string;
   attribute KEEP of Active : signal is "true";

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of FifoDepth : signal is "true";

BEGIN

   DataOut  <= FifoDataOut(0);

   ClkProcess : process(Clk)
   begin
      if (rising_edge(Clk)) then
         PhaseIncrDly    <= PhaseIncr;
         FifoOffset      <= (FIFO_THRESH - signed(FifoDepth(12 downto 0)));
         AccumMsb        <= Accum(15);
         if ((reset = '1') or (PhaseIncr /= PhaseIncrDly)) then
            Accum          <= (others=>'0');
            EffectiveRate  <= (others=>'0');
            Active         <= '0';
            RdEn           <= '0';
            ClkOut         <= '0';
            ClkDelay       <= x"0";
         elsif (ce) then
            if (unsigned(FifoDepth) > FIFO_THRESH) then
               Active <= '1';
            end if;
            if (Active) then
               Accum    <= Accum + signed(PhaseIncr) + EffectiveRate - (FifoOffset sra 2);
               RdEn     <= AccumMsb and not Accum(15) and not Empty;
               if (EstimatesDone) then
                  EffectiveRate <= EffectiveRate - FifoOffset;
               end if;
            end if;
            ClkDelay <= ClkDelay(2 downto 0) & RdEn;
            ClkOut   <= ClkDelay(3) or ClkDelay(2);    -- Delay ClkOut into valid data, widen pulse to 93M clock
         end if;
      end if;
   end process ClkProcess;

   FdFifo  : Fifo8k4to1       -- 4 bit in, 1 bit output
   PORT MAP (
      clk            => clk,
      srst           => reset or Full,
      din            => RecoveredData,
      wr_en          => ValidIn and not reset,
      rd_en          => RdEn and not Empty,
      dout           => FifoDataOut,
      full           => Full,
      empty          => Empty,
      wr_data_count  => FifoDepth
   );

END rtl;

