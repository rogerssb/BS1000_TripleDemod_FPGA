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

Module Name: DualAgc.vhd
Description:

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------
   S 0001.0000 0000 0000 0 is 1.0 in 4:-13 format of GainInt. Drop the sign bit and
grab the next 10 bits to form the address to the LUT gives 10x040 as shown:
        00 01.00 0000 which is ufixed(3 downto -6);

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
9-6-16 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.math_real.all;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY DualAgc IS
   PORT(
      Clk,
      Reset          : IN  std_logic;
      Attack,
      Decay          : IN  std_logic_vector(2 downto 0);
      RealIn,
      ImagIn,
      RefLevel       : IN  float_1_18;
      RealGained,
      ImagGained,
      AgcVoltage     : OUT float_1_18
   );
END DualAgc;


ARCHITECTURE rtl OF DualAgc IS

   type     MyRam is array (0 to 1023) of sfixed(0 downto -17); -- 2D Array Declaration for RAM signal. Note first read is addr 0

   impure function initRam  return MyRam is
      variable FuncRam     : MyRam;
      variable RealValue   : real;
      variable UFixI       : ufixed(3 downto -6);
   begin
      for i in MyRam'range loop
         if (i = 0) then
            FuncRam(i)  := to_sfixed(-0.05, 0, -17);  -- log10(0) is -infinity
         else
            UFixI       := to_ufixed(real(i)/64.0, 3, -6);
            RealValue   := (log10(to_real(UFixI))) / 44.0;  -- 44dB/V scaling
            FuncRam(i)  := to_sfixed(RealValue, 0, -17, fixed_saturate, fixed_truncate);
         end if;
      end loop;
      return FuncRam;
   end function;

   -- Define RAM
   signal      AgcRom                  : MyRam := initRam;
   attribute   ram_style               : string;
   attribute   ram_style of AgcRom     : signal is "block";
  -- Signals
   signal      RealSq,
               ImagSq         : sfixed(1 downto -16) := (others=>'0');
   signal      SumSq,
               ShiftAttack,
               ShiftDecay     : sfixed(3 downto -17) := (others=>'0');
   signal      GainInt        : sfixed(4 downto -13) := (others=>'0');
   signal      AgcAddr        : sfixed(10 downto 0);
   signal      RomAddr        : natural range 0 to 1023;

   signal      GainIntSlv     : SLV18;
   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of GainIntSlv : signal is "TRUE";


BEGIN

   GainIntSlv <= to_slv(GainInt);

   ShiftAttack <= SumSq sra to_integer(unsigned(Attack));
   ShiftDecay  <= SumSq sra to_integer(unsigned(Decay));
   AgcAddr     <= GainInt(4 downto -6);
   RomAddr     <= to_integer(ufixed(AgcAddr(9 downto 0)));

  Delay_process: process (Clk)
   variable GainInt_v   : sfixed(4 downto -13);
   begin
      if (rising_edge(Clk)) then
         if ((Reset) or (and(Attack) and (and(Decay)))) then   -- if Attack and Decay = 7, bypass the fast AGC
            RealGained <= RealIn;
            ImagGained <= ImagIn;
            RealSq     <= (others=>'0');
            ImagSq     <= (others=>'0');
            SumSq      <= (others=>'0');
            GainInt    <= to_sfixed(1.472, GainInt);  -- nominal
            AgcVoltage <= (others=>'0');
         else
            RealGained <= resize(RealIn * GainInt, RealGained);
            ImagGained <= resize(ImagIn * GainInt, ImagGained);
            RealSq     <= resize(RealGained * RealGained, RealSq);
            ImagSq     <= resize(ImagGained * ImagGained, ImagSq);
            SumSq      <= resize(RefLevel - (RealSq + ImagSq), SumSq);
            GainInt_v  := resize(GainInt + ShiftAttack, GainInt_v) when not SumSq(1) else resize(GainInt + ShiftDecay, GainInt_v);
            if (GainInt_v(4)) then  -- saturate to ufixed(3 downto -13) to keep gain positive else gainint runs away
               if (SumSq < 0) then
                  GainInt <= to_sfixed(0, GainInt);
               else
                  GainInt <= to_sfixed(15.99, GainInt);
               end if;
            else
               GainInt <= GainInt_v;
            end if;
            AgcVoltage <= AgcRom(RomAddr);
         end if;
      end if;
   end process Delay_process;

END rtl;

