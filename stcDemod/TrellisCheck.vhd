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

Module Name: TrellisCheck.vhd
Description:
   Top level netlist and clock generation.

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
library std;
use std.textio.all;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

ENTITY TrellisCheck IS
   PORT(
      clk,
      reset,
      TrellisOutEn,
      TrellisStart      : IN  std_logic;
      TrellisBits       : IN std_logic_vector(3 downto 0);
      Pass              : OUT std_logic
   );
END TrellisCheck;


ARCHITECTURE rtl OF TrellisCheck IS

   type MyRam is array (0 to 1023) of std_logic_vector (3 downto 0);

   impure function initram (RamFileName : in string) return MyRam is
      file     FilePntr    : text;
      variable ramfileline : line;
      variable FuncRam     : MyRam;
      variable SLV         : std_logic_vector(3 downto 0);
      variable Good_v      : boolean;
   begin
      file_open(FilePntr, RamFileName, read_mode);
      for i in MyRam'range loop
           readline (FilePntr, ramfileline);
           hread(ramfileline, SLV, Good_v);
           assert Good_v report "Failed to convert real of: " & ramfileline.all severity FAILURE;
           FuncRam(i) := SLV;
       end loop;
       return FuncRam;
   end function;

  -- Signals

   SIGNAL   HexData,
            Delay1         : std_logic_vector(3 downto 0) := x"0";
   SIGNAL   RomCntr        : natural range 0 to 1023 := 0;
   SIGNAL   HexOut         : MyRam := InitRam("C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC\HexOut.txt");

BEGIN

   HexProcess : process(clk) is
   begin
      if(rising_edge(clk)) then
         if (reset) then
            RomCntr  <= 0;
            Pass     <= '0';
         elsif (TrellisStart) then
            RomCntr  <= 0;
         elsif (TrellisOutEn) then
            RomCntr <= RomCntr + 1;
            if (Delay1 = TrellisBits) or (RomCntr <= 1) then  -- first and last nibble are junk
               Pass <= '1';
            else
               Pass <= '0';
            end if;
            Delay1   <= HexData;
         end if;
         HexData  <= HexOut(RomCntr);
      end if;
   end process HexProcess;

END rtl;
