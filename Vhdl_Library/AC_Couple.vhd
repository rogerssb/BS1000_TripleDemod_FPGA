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

Module Name: AC_Couple.vhd
Description:
   The module calculates the DC average of the input with a rolloff defined
   by timeConstant. The higher the time constant the lower the bandwidth.
   TimeConstants are four bits of 0000 to 1111.

   The DC voltage is then subtracted from the input signal to generate the
   output signal

   Setting the time constant to 0 disables the DC correction thus bypassing
   the module.

   The module requires a 4 bit register from the processor and software driver
   as well as the fixed_pkg_2008.vhd and semco_pkg.vhd files which are VHDL-2008

ARGUMENTS : Offset slides the range of coupling by factors of 2


Dependencies:  Type must be declared VHDL_2008 in synthesis

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

ENTITY AC_Couple IS
      GENERIC(
         OFFSET      : natural range 0 to 7 := 4;
         DATA_WIDTH  : positive := 18
      );
   PORT(
      clk            : IN  std_logic;
      reset          : IN  std_logic;
      ce             : IN  std_logic;
      timeConstant   : IN  SLV4;
      dataIn         : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
      dataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
   );
END AC_Couple;


ARCHITECTURE rtl OF AC_Couple IS

  -- Signals
   SIGNAL   inputSFa,
            outputSF    : sfixed(0 downto -(DATA_WIDTH-1)) := (others=>'0');
   SIGNAL   inputSF,
            dcOffsetSF,
            dcOffShift,
            shiftedSF   : sfixed(0 downto -(DATA_WIDTH+OFFSET+14)) := (others=>'0');
   signal   shift       : natural range 0 to 15;

BEGIN

   inputSFa <= to_sfixed(dataIn, inputSFa);
   inputSF  <= resize(inputSFa, inputSF);
   shift    <= to_integer(unsigned(timeConstant));
   dataOut  <= to_slv(outputSF);

   AC_proc : process(clk)
      variable shifted,
               dcOffsetShift : sfixed(0 downto -(DATA_WIDTH+OFFSET+14));
   begin
      if (rising_edge(clk)) then
         if (reset) then
            dcOffsetSF  <= (others=>'0');
            outputSF    <= (others=>'0');
         else
            if (timeConstant = x"0") then
               shifted        := resize(inputSF sra OFFSET, dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF, dcOffsetShift);
            elsif (timeConstant = x"1") then
               shifted        := resize(inputSF sra (1+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (1+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"2") then
               shifted        := resize(inputSF sra (2+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (2+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"3") then
               shifted        := resize(inputSF sra (3+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (3+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"4") then
               shifted        := resize(inputSF sra (4+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (4+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"5") then
               shifted        := resize(inputSF sra (5+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (5+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"6") then
               shifted        := resize(inputSF sra (6+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (6+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"7") then
               shifted        := resize(inputSF sra (7+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (7+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"8") then
               shifted        := resize(inputSF sra (8+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (8+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"9") then
               shifted        := resize(inputSF sra (9+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (9+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"A") then
               shifted        := resize(inputSF sra (10+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (10+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"B") then
               shifted        := resize(inputSF sra (11+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (11+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"C") then
               shifted        := resize(inputSF sra (12+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (12+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"D") then
               shifted        := resize(inputSF sra (13+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (13+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"E") then
               shifted        := resize(inputSF sra (14+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (14+OFFSET), dcOffsetShift);
            elsif (timeConstant = x"F") then
               shifted        := resize(inputSF sra (15+OFFSET), dcOffsetShift);
               dcOffsetShift  := resize(dcOffsetSF sra (15+OFFSET), dcOffsetShift);
            end if;
            shiftedSF   <= shifted;
            dcOffShift  <= dcOffsetShift;
            if (timeConstant = x"0") then
               dcOffsetSF <= (others=>'0');
            else
               dcOffsetSF <= resize(dcOffsetSF - dcOffsetShift + shifted, dcOffsetSF);
            end if;
            outputSF <= resize(inputSF - dcOffsetSF, outputSF);
         end if;
      end if;
   end process;

END rtl;

