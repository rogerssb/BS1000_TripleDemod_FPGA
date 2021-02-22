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

Module Name: LogToLin.vhd
Description: Convert the LOG input and convert to a linear ratio.

ARGUMENTS : The size of the input and output are adjustable.
   For instance, the AGC difference for combining has a usable range of 20dB or 100:1.
   This requires a ±32 input range (6 downto -?) and 128 to 1/128 output range or (7 downto -7).


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
USE IEEE.math_real.all;
USE work.Semco_pkg.ALL;

ENTITY LogToLin IS
      GENERIC(
         LEFT_IN   : natural := 6;
         RIGHT_IN  : natural := 4;
         LEFT_OUT  : natural := 6;
         RIGHT_OUT : natural := 4;
         LOG_RATIO : real    := 20.0   -- 10 log or 20 log
      );
   PORT(
      clk            : IN  std_logic;
      reset          : IN  std_logic;
      ce             : IN  std_logic;
      LogIn          : IN  sfixed(LEFT_IN downto -RIGHT_IN);
      LinearOut      : OUT ufixed(LEFT_OUT downto -RIGHT_OUT)
   );
END LogToLin;


ARCHITECTURE rtl OF LogToLin IS

   constant ARRAY_SIZE  : natural := 2**(LEFT_IN + RIGHT_IN + 1);
   constant MinLogIn    : sfixed(LEFT_IN+1 downto -RIGHT_IN) := (LEFT_IN+1 downto LEFT_IN => '1', others => '0');
   type     MyRom is array (0 to ARRAY_SIZE-1) of ufixed(LEFT_OUT downto -RIGHT_OUT);

   impure function DefineValues return MyRom is
      variable ArrayOut : MyRom;
      variable Real_v   : real;
   begin
      for i in ArrayOut'range loop
         Real_v      := real(i) / (2.0 ** RIGHT_IN) - 2.0**LEFT_IN;        -- scale array index to match sfixed lsb, then force to positive range
         ArrayOut(i) := to_ufixed(10.0**(Real_v / LOG_RATIO), ArrayOut(0));
      end loop;
      return ArrayOut;
   end DefineValues;

   signal      ZeroAdj                 : sfixed(LEFT_IN+1 downto -RIGHT_IN);
   signal      BlockRom                : MyRom := DefineValues;
   signal      RdAddr                  : natural range 0 to ARRAY_SIZE-1;
   attribute   ram_style               : string;
   attribute   ram_style of BlockRom   : signal is "Block";

begin

   ZeroAdj <= resize(LogIn - MinLogIn, ZeroAdj);
   RdAddr <= to_integer(unsigned(to_slv(ZeroAdj)));

   process(clk)
   begin
       if (rising_edge(clk)) then
           if (ce) then
               LinearOut <= BlockRom(RdAddr);
           end if;
       end if;
   end process;

END rtl;

