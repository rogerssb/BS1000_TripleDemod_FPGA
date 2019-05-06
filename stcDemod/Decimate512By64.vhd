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

Module Name: Decimate512By64.vhd
Description: Decimate a 512 sample buffer by 64

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

ENTITY Decimate512By64 IS
   PORT(
      clk,
      ce,
      reset,
      StartIn        : IN  std_logic;
      X_In           : IN  FLOAT_1_HP;
      Y_Out          : OUT FLOAT_ARRAY_1_HP(0 to 7);
      Done           : OUT std_logic
   );
END Decimate512By64;


ARCHITECTURE rtl OF Decimate512By64 IS

   COMPONENT DecimateBy2 IS
      GENERIC (
         NX    : positive := 512
      );
      PORT(
         clk,
         ce,
         reset,
         StartIn,
         ActiveIn,
         ValidIn        : IN  std_logic;
         X_In           : IN  FLOAT_1_HP;
         Y_Out          : OUT FLOAT_1_HP;
         OutCount       : OUT std_logic_vector(8 downto 0);
         ActiveOut,
         Done,
         ValidOut       : OUT std_logic
      );
   END COMPONENT DecimateBy2;

   constant NX                : positive := 512;

  -- Signals
   SIGNAL   Actives,
            Dones,
            Valids            : std_logic_vector(5 downto 0);
   SIGNAL   DecData           : FLOAT_ARRAY_1_HP(0 to 5);
   SIGNAL   OutCounts         : vector_of_slvs(1 to 5)(8 downto 0);
   SIGNAL   CountOut          : integer range 0 to 8;

BEGIN

      DecBy2_0_u : DecimateBy2
      GENERIC MAP(
         NX          => NX
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => StartIn,
         ActiveIn    => '1',
         ValidIn     => '1',
         X_In        => X_IN,
         OutCount    => open,
         Y_Out       => DecData(0),
         ActiveOut   => Actives(0),
         Done        => Dones(0),
         ValidOut    => Valids(0)
      );

   DecBy2_1to5 : for i in 1 to 5 generate
      DecBy2_u : DecimateBy2
      GENERIC MAP(
         NX          => NX / 2**i
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         StartIn     => Dones(i-1),
         ActiveIn    => Actives(i-1),
         ValidIn     => Valids(i-1),
         X_In        => DecData(i-1),
         Y_Out       => DecData(i),
         OutCount    => OutCounts(i),
         ActiveOut   => Actives(i),
         Done        => Dones(i),
         ValidOut    => Valids(i)
      );
   end generate;

   CountOut <= to_integer(unsigned(OutCounts(5)));

   DoneProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (StartIn or reset) then
            Y_Out <= (others=>(others=>'0'));
            Done  <= '0';
         elsif (Valids(5)) then
            Y_Out(CountOut-1) <= resize(DecData(5), Y_Out(0));
            if (CountOut = 8) then
               Done <= '1';
            end if;
         else
            Done <= '0';
         end if;
      end if;
   end process DoneProcess;

END rtl;


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY DecimateBy2 IS
   GENERIC (
      NX    : positive := 512
   );
   PORT(
      clk,
      ce,
      reset,
      StartIn,
      ActiveIn,
      ValidIn        : IN  std_logic;
      X_In           : IN  FLOAT_1_HP;
      Y_Out          : OUT FLOAT_1_HP;
      OutCount       : OUT std_logic_vector(8 downto 0);
      Done,
      ActiveOut,
      ValidOut       : OUT std_logic
   );
END DecimateBy2;


ARCHITECTURE rtl OF DecimateBy2 IS

   -- constants
   CONSTANT ACC_SIZE    : sfixed(0 downto -17) := (others=>'0');  -- just used for sizing
   CONSTANT ACC4_COEFF  : sfixed(0 downto -17) := to_sfixed(0.50428003183361492, ACC_SIZE);
   CONSTANT ACC17_COEFF : sfixed(0 downto -17) := to_sfixed(0.049436909329760352, ACC_SIZE);
   CONSTANT ACC35_COEFF : sfixed(0 downto -17) := to_sfixed(0.2972968934129529, ACC_SIZE);


  -- Signals
   SIGNAL   Bank0             : FLOAT_ARRAY_1_HP(8 downto 0);
   SIGNAL   BankIndex         : integer range 0 to NX+4;      -- count 0 to 512 + 4
   SIGNAL   Active,
            Valid             : std_logic;
   SIGNAL   OutCount_u        : unsigned(8 downto 0);
   SIGNAL   Acc4,
            Acc17,
            Acc35             : FLOAT_1_HP;
BEGIN

  Delay_process: process (clk)
      variable Bank_v   : FLOAT_ARRAY_1_HP(8 downto 0);
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            Bank0       <= (others=>(others=>'0'));
            BankIndex   <= 0;
            Active      <= '0';
            ActiveOut   <= '0';
            Done        <= '0';
            Valid       <= '0';
            ValidOut    <= '0';
            Acc4        <= (others=>'0');
            Acc17       <= (others=>'0');
            Acc35       <= (others=>'0');
            OutCount_u  <= to_unsigned(NX/2, 9);
            OutCount    <= (others=>'0');
            Y_Out       <= (others=>'0');
         elsif ce = '1' then
            if (StartIn) then
               Active      <= '1';
               Valid       <= '0';
               BankIndex   <= 0;
               OutCount_u  <= (others=>'0');
               Acc4        <= (others=>'0');
               Acc17       <= (others=>'0');
               Acc35       <= (others=>'0');
               Y_Out       <= (others=>'0');
            elsif ((Active = '1' and ValidIn = '1') or ((ActiveIn = '0') and (OutCount_u < NX/2))) then  -- stuff zeros on tail
               Done <= '0';
               if (BankIndex < NX) then
                  Bank_v := Bank0(7 downto 0) & X_in;
               else
                  Bank_v := Bank0(7 downto 0) & FLOAT_ZERO_1_HP;
               end if;
               if ((BankIndex >= 4) and (OutCount_u < NX/2) and (BankIndex mod 2 = 0)) then
                  Acc4  <= resize(Bank_v(4) * ACC4_COEFF, Acc4);
                  Acc17 <= resize((Bank_v(1) + Bank_v(7)) * ACC17_COEFF, Acc17); -- can't use negative numbers so subtract
                  Acc35 <= resize((Bank_v(3) + Bank_v(5)) * ACC35_COEFF, Acc35);
                  OutCount_u <= OutCount_u + 1;
                  Valid <= '1';
               else
                  Valid <= '0';
               end if;
               Done <= '1' when (BankIndex = 2) else '0';    -- Goes high one clock before first valid output
               if (OutCount_u = NX/2) then
                  Active <= '0';
               end if;
               BankIndex <= BankIndex + 1;
               Bank0 <=Bank_v;
            else
               if (OutCount_u = NX/2) then
                  Active <= '0';
               end if;
               Done <= '0';
               Valid <= '0';  -- only leave output high for one clock
            end if;
            ValidOut <= Valid;
            Y_Out    <= resize(Acc4 - Acc17 + Acc35, Y_Out, fixed_saturate, fixed_truncate);   -- Subtract Acc17 to account for negative coefficient
            OutCount <= std_logic_vector(OutCount_u);
            ActiveOut <= Active;
        end if;
      end if;
   end process Delay_process;

END rtl;