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

Module Name: DC_DemodTop.vhd
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
use work.fixed_pkg.ALL;
use work.Semco_pkg.all;
Library UNISIM;
use UNISIM.vcomponents.all;

ENTITY DC_DemodTop IS
   PORT(
      Clk,
      Reset,
      FPGA_ID0,
      FPGA_ID1,
      amDataEn,
      iDemodBit,
      qDemodBit         : IN  std_logic;
      amDataIn          : IN  SLV12;
      adc0              : IN  std_logic_vector(13 downto 0);
      -- interFpga data
      PrevData_p,
      PrevData_n,
      NextData_p,
      NextData_n        : OUT std_logic_vector(4 downto 0);
      NextClk_p,
      NextClk_n,
      PrevClk_p,
      PrevClk_n         : OUT std_logic
   );
END DC_DemodTop;

ARCHITECTURE rtl OF DC_DemodTop IS


   component DemodSerDesOut is
      Generic (
         PORTS    : natural := 5
      );
      Port (
         Clk93M,
         Reset,
         Active            : in std_logic;
         TxData            : in SLV8_ARRAY(PORTS-1 downto 0);
         DataOut_p,
         DataOut_n         : out STD_LOGIC_VECTOR(PORTS-1 downto 0);
         RefClkOut_p,
         RefClkOut_n       : out std_logic
      );
   end component DemodSerDesOut;

   constant CHANNEL_1         : std_logic_vector(1 downto 0) := "00";
   constant CHANNEL_2         : std_logic_vector(1 downto 0) := "01";
   constant COMBINER          : std_logic_vector(1 downto 0) := "10";
   constant PORTS             : integer := 5;

  -- Signals
   signal   ID             : std_logic_vector(1 downto 0);
   signal   TxData4         : UINT8;
   signal   TxData1,
            TxData2        : SLV8_ARRAY(PORTS - 1 downto 0);

BEGIN

   ID <= FPGA_ID1 & FPGA_ID0;

   IF_Clk_process : process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (TxData4 < 255) then
            TxData4 <= TxData4 + x"11";
         else
            TxData4 <= x"55";
         end if;

         if (ID = CHANNEL_1) then
            TxData1(0) <= adc0(7 downto 0);
            TxData1(1) <= iDemodBit & qDemodBit & not adc0(13) & adc0(12 downto 8);
            TxData1(2) <= amDataIn(7 downto 0);
            TxData1(3) <= amDataEn & "000" & amDataIn(11 downto 8);
            TxData1(4) <= std_logic_vector(TxData4);   -- spare channel, setup for debug
            TxData2(0) <= x"00";
            TxData2(1) <= x"00";
            TxData2(2) <= x"00";
            TxData2(3) <= x"00";
            TxData2(4) <= x"00";
         else
            TxData2(0) <= adc0(7 downto 0);
            TxData2(1) <= iDemodBit & qDemodBit & not adc0(13) & adc0(12 downto 8);
            TxData2(2) <= amDataIn(7 downto 0);
            TxData2(3) <= amDataEn & "000" & amDataIn(11 downto 8);
            TxData2(4) <= std_logic_vector(TxData4);
            TxData1(0) <= x"00";
            TxData1(1) <= x"00";
            TxData1(2) <= x"00";
            TxData1(3) <= x"00";
            TxData1(4) <= x"00";
         end if;
      end if;
   end process IF_Clk_process;

   Ch1SerDes : DemodSerDesOut
      Generic Map(
         PORTS    => PORTS
      )
      Port MAP(
         Clk93M      => Clk,
         Reset       => Reset,
         Active      => (ID ?= CHANNEL_1),
         TxData      => TxData1,
         DataOut_p   => PrevData_p,
         DataOut_n   => PrevData_n,
         RefClkOut_p => PrevClk_p,
         RefClkOut_n => PrevClk_n
      );

  Ch2SerDes : DemodSerDesOut
      Generic Map(
         PORTS    => PORTS
      )
      Port MAP(
         Clk93M      => Clk,
         Reset       => Reset,
         Active      => (ID ?= CHANNEL_2),
         TxData      => TxData2,
         DataOut_p   => NextData_p,
         DataOut_n   => NextData_n,
         RefClkOut_p => NextClk_p,
         RefClkOut_n => NextClk_n
      );

END rtl;
