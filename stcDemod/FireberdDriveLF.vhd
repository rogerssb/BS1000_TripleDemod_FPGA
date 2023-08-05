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

ENTITY FireberdDriveLF IS
   PORT(
      clk,
      ce,
      reset,
      ValidIn           : IN  std_logic;
      RecoveredData     : IN  SLV4;
      PhaseIncr         : IN  SLV16;
      Clock,
      DataOut,
      ClkOut            : OUT std_logic
   );
END FireberdDriveLF;


ARCHITECTURE rtl OF FireberdDriveLF IS

   COMPONENT hardLoopFilter
      PORT(
         clk, clkEn,
         reset,
         clearAccum,
         invertError,
         zeroError         : in  std_logic;
         lead, lag         : in  std_logic_vector(4 downto 0);
         limit             : in  SLV32;
         error             : in  std_logic_vector(11 downto 0);
         loopFreq          : out SLV32;
         ctrl2,
         ctrl4,
         satPos,
         satNeg            : out std_logic;
         lockCount         : out SLV16;
         syncThreshold     : out std_logic_vector(11 downto 0)
      );
   END COMPONENT;

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

   CONSTANT FIFO_THRESH       : integer := 1024;
   -- Signals
   SIGNAL   Accum             : sfixed(15 downto 0);
   SIGNAL   PhaseIncrDly      : std_logic_vector(15 downto 0);
   SIGNAL   ClkDelay          : SLV4;
   SIGNAL   FifoDataOut       : std_logic_vector(0 to 0);
   SIGNAL   FifoDepth         : STD_LOGIC_VECTOR(13 DOWNTO 0);
   SIGNAL   RdEn,
            Active,
            AccumMsb,
            Full,
            Empty             : std_logic;
   signal   FifoOffset        : sfixed(11 downto 0);
   signal   Sum               : sfixed(15 downto -16);
   signal   SumSlv            : SLV32;
   signal   Accum17,
            ClksPer17         : sfixed(16 downto 0);

   attribute KEEP : string;
   attribute KEEP of Active : signal is "true";

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of Accum, Sum, FifoOffset : signal is "TRUE";


BEGIN

   DataOut     <= FifoDataOut(0);
   Accum17     <= resize(Accum, Accum17);    -- add a 0 to front to force unsigned math
   ClksPer17   <= sfixed('0' & PhaseIncr);
   Sum         <= to_sfixed(SumSlv, Sum);
   Clock       <= AccumMsb;

   ClkProcess : process(Clk)
   begin
      if (rising_edge(Clk)) then
         PhaseIncrDly <= PhaseIncr;
         FifoOffset      <= resize(sfixed(FifoDepth) - FIFO_THRESH, FifoOffset);
         AccumMsb        <= Accum(Accum'left);

         if ((reset = '1') or (PhaseIncr /= PhaseIncrDly) or (Full = '1')) then
            Accum          <= (others=>'0');
            Active         <= '0';
            RdEn           <= '0';
            ClkOut         <= '0';
            ClkDelay       <= x"0";
         elsif (ce) then
            if (ufixed(FifoDepth) > FIFO_THRESH) then
               Active <= '1';
            end if;
            if (Active) then
               Accum    <= resize(Accum17 + ClksPer17 + Sum, Accum);
               RdEn     <= (AccumMsb and not Accum(Accum'left)) and not Empty;
            end if;
            ClkDelay <= ClkDelay(2 downto 0) & RdEn;
            ClkOut   <= ClkDelay(3) or ClkDelay(2);    -- Delay ClkOut into valid data, widen pulse to 93M clock
         end if;
      end if;
   end process ClkProcess;

   LF : hardLoopFilter
      PORT MAP(
         clk            => clk,
         clkEn          => ValidIn,
         reset          => reset,
         invertError    => '0',
         zeroError      => '0',
         clearAccum     => '0',
         lead           => 5x"0",
         lag            => 5x"C",
         limit          => 32x"00050000",
         error          => to_slv(FifoOffset),
         loopFreq       => Sumslv,
         ctrl2          => open,
         ctrl4          => open,
         satPos         => open,
         satNeg         => open,
         lockCount      => open,
         syncThreshold  => open
   );

   FdFifo  : Fifo8k4to1       -- 4 bit in, 1 bit output
   PORT MAP (
      clk            => clk,
      srst           => reset or Full,
      din            => RecoveredData,
      wr_en          => ValidIn and not (Full or reset),
      rd_en          => RdEn and not Empty,
      dout           => FifoDataOut,
      full           => Full,
      empty          => Empty,
      wr_data_count  => FifoDepth
   );

END rtl;

