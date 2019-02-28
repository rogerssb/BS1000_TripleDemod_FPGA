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

Module Name: TurboDF_Rom.vhd
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
use work.semco_pkg.ALL;

ENTITY TurboDF_Rom IS
   PORT(
      Clk,
      Reset,
      CountEn        : IN  std_logic;
--      Rate,
--      Frame          : IN  natural range 0 to 6;
--      Addr           : IN  std_logic_vector(16 downto 0);
--      ReOut          : OUT SLV2;
      ReNoise        : OUT SLV12
   );
END TurboDF_Rom;


ARCHITECTURE rtl OF TurboDF_Rom IS

   COMPONENT NoiseI
     PORT (
       clka : IN STD_LOGIC;
       addra : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
       douta : OUT STD_LOGIC_VECTOR(11 downto 0)
     );
   END COMPONENT;
/*
   COMPONENT DFI21
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI22
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI24
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI25
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI31
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI32
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI34
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI35
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI41
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI42
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI44
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI45
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI61
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI62
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI64
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

   COMPONENT DFI65
      PORT (
         clka : IN STD_LOGIC;
         addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
         douta : OUT STD_LOGIC_VECTOR(1 downto 0)
      );
   END COMPONENT;

  -- Signals
   SIGNAL   ReData1,
            ReData2,
            ReData4,
            ReData5     : vector_of_slvs(6 downto 0)(1 downto 0);
*/
   SIGNAL   Noise_I     : SLV12;
   SIGNAL   NoiseCntr   : unsigned(12 downto 0) := (others=>'0');

BEGIN

   ClkProcess : process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            NoiseCntr   <= (others=>'0');
 --            ReOut       <= "00";
               ReNoise     <= (others=>'0');
         else
--          ReOut <= ReData1(Rate) when (Frame = 1) else ReData2(Rate) when (Frame = 2) else ReData4(Rate) when (Frame = 4) else ReData5(Rate);
            ReNoise <= Noise_I;
            if (CountEn) then
               if (NoiseCntr < 7185) then
                  NoiseCntr <= NoiseCntr + 1;
               else
                  NoiseCntr <= (others=>'0');
               end if;
            end if;
         end if;
      end if;
   end process;
/*
   ReData1(0) <= "00";
   ReData2(0) <= "00";
   ReData4(0) <= "00";
   ReData5(0) <= "00";
   ReData1(1) <= "00";
   ReData2(1) <= "00";
   ReData4(1) <= "00";
   ReData5(1) <= "00";
   ReData1(5) <= "00";
   ReData2(5) <= "00";
   ReData4(5) <= "00";
   ReData5(5) <= "00";
*/

   iNoise : NoiseI
     PORT MAP (
       clka    => Clk,
       addra   => std_logic_vector(NoiseCntr),
       douta   => Noise_I
     );
/*
   I_Data21 : DFI21
      PORT MAP (
         clka    => Clk,
         addra   => Addr(12 downto 0),
         douta   => ReData1(2)
   );

   I_Data31 : DFI31
      PORT MAP (
         clka    => Clk,
         addra   => Addr(13 downto 0),
         douta   => ReData1(3)
   );

   I_Data41 : DFI41
      PORT MAP (
         clka    => Clk,
         addra   => Addr(13 downto 0),
         douta   => ReData1(4)
   );

   I_Data61 : DFI61
      PORT MAP (
         clka    => Clk,
         addra   => Addr(14 downto 0),
         douta   => ReData1(6)
   );

   I_Data22 : DFI22
      PORT MAP (
         clka    => Clk,
         addra   => Addr(13 downto 0),
         douta   => ReData2(2)
   );

   I_Data32 : DFI32
      PORT MAP (
         clka    => Clk,
         addra   => Addr(14 downto 0),
         douta   => ReData2(3)
   );

   I_Data42 : DFI42
      PORT MAP (
         clka    => Clk,
         addra   => Addr(14 downto 0),
         douta   => ReData2(4)
   );

   I_Data62 : DFI62
      PORT MAP (
         clka    => Clk,
         addra   => Addr(15 downto 0),
         douta   => ReData2(6)
   );

   I_Data24 : DFI24
      PORT MAP (
         clka    => Clk,
         addra   => Addr(14 downto 0),
         douta   => ReData4(2)
   );

   I_Data34 : DFI34
      PORT MAP (
         clka    => Clk,
         addra   => Addr(15 downto 0),
         douta   => ReData4(3)
   );

   I_Data64 : DFI64
      PORT MAP (
         clka    => Clk,
         addra   => Addr(16 downto 0),
         douta   => ReData4(6)
   );

   I_Data25 : DFI25
      PORT MAP (
         clka    => Clk,
         addra   => Addr(15 downto 0),
         douta   => ReData5(2)
   );

   I_Data35 : DFI35
      PORT MAP (
         clka    => Clk,
         addra   => Addr(15 downto 0),
         douta   => ReData5(3)
   );

   I_Data45 : DFI45
      PORT MAP (
         clka    => Clk,
         addra   => Addr(16 downto 0),
         douta   => ReData5(4)
   );

  I_Data44 : DFI44
      PORT MAP (
         clka    => Clk,
         addra   => Addr(15 downto 0),
         douta   => ReData4(4)
   );

   I_Data65 : DFI65
      PORT MAP (
         clka    => Clk,
         addra   => Addr(16 downto 0),
         douta   => ReData5(6)
   );
*/
END rtl;

