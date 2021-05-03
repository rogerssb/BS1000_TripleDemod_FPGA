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

   COMPONENT vio_0
      PORT (
         clk        : IN STD_LOGIC;
         probe_out0 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out1 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out2 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out3 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out4 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
         probe_out5 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
         probe_out6 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
         probe_out7 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out8 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         probe_out9 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
   END COMPONENT;

   constant CHANNEL_1         : std_logic_vector(1 downto 0) := "00";
   constant CHANNEL_2         : std_logic_vector(1 downto 0) := "01";
   constant COMBINER          : std_logic_vector(1 downto 0) := "10";
   constant PORTS             : integer := 5;

  -- Signals
   signal   ID             : std_logic_vector(1 downto 0);
   signal   TxData4        : UINT8 := x"55";
   signal   TxData1,
            TxData2        : SLV8_ARRAY(PORTS - 1 downto 0);
   signal   Vio9           : SLV16;
   signal   Active1,
            Active2        : std_logic;

BEGIN

   ID <= FPGA_ID1 & FPGA_ID0;

   VIO : vio_0
      PORT MAP (
         clk         => Clk,
         probe_out0  => open,
         probe_out1  => open,
         probe_out2  => open,
         probe_out3  => open,
         probe_out4  => open,
         probe_out5  => open,
         probe_out6  => open,
         probe_out7  => open,
         probe_out8  => open,
         probe_out9  => Vio9
   );

   IF_Clk_process : process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            TxData4 <= x"55";
            TxData1(0) <= x"00";
            TxData1(1) <= x"00";
            TxData1(2) <= x"00";
            TxData1(3) <= x"00";
            TxData1(4) <= x"00";
            TxData2(0) <= x"00";
            TxData2(1) <= x"00";
            TxData2(2) <= x"00";
            TxData2(3) <= x"00";
            TxData2(4) <= x"00";
         else
            if (TxData4 < 255) then
               TxData4 <= TxData4 + x"11";
            else
               TxData4 <= x"55";
            end if;

            if (ID = CHANNEL_1) then
               TxData1(0) <=  x"12" when (Vio9(0)) else adc0(7 downto 0);
               TxData1(1) <=  x"23" when (Vio9(0)) else iDemodBit & qDemodBit & not adc0(13) & adc0(12 downto 8);
               TxData1(2) <=  x"34" when (Vio9(0)) else amDataIn(7 downto 0);
               TxData1(3) <=  x"45" when (Vio9(0)) else amDataEn & "000" & amDataIn(11 downto 8);
               TxData1(4) <= std_logic_vector(TxData4);   -- spare channel, setup for debug
               TxData2(0) <= x"00";
               TxData2(1) <= x"00";
               TxData2(2) <= x"00";
               TxData2(3) <= x"00";
               TxData2(4) <= x"00";
            else
               TxData2(0) <= x"56" when (Vio9(0)) else adc0(7 downto 0);
               TxData2(1) <= x"67" when (Vio9(0)) else iDemodBit & qDemodBit & not adc0(13) & adc0(12 downto 8);
               TxData2(2) <= x"78" when (Vio9(0)) else amDataIn(7 downto 0);
               TxData2(3) <= x"89" when (Vio9(0)) else amDataEn & "000" & amDataIn(11 downto 8);
               TxData2(4) <= std_logic_vector(TxData4);
               TxData1(0) <= x"00";
               TxData1(1) <= x"00";
               TxData1(2) <= x"00";
               TxData1(3) <= x"00";
               TxData1(4) <= x"00";
            end if;
         end if;
      end if;
   end process IF_Clk_process;

   Active1 <= '1' when (ID = CHANNEL_1) else '0';

   Ch1SerDes : DemodSerDesOut
      Generic Map(
         PORTS    => PORTS
      )
      Port MAP(
         Clk93M      => Clk,
         Reset       => Reset,
         Active      => Active1,
         TxData      => TxData1,
         DataOut_p   => PrevData_p,
         DataOut_n   => PrevData_n,
         RefClkOut_p => PrevClk_p,
         RefClkOut_n => PrevClk_n
      );

   Active2 <= '1' when (ID = CHANNEL_2) else '0';

   Ch2SerDes : DemodSerDesOut
      Generic Map(
         PORTS    => PORTS
      )
      Port MAP(
         Clk93M      => Clk,
         Reset       => Reset,
         Active      => Active2,
         TxData      => TxData2,
         DataOut_p   => NextData_p,
         DataOut_n   => NextData_n,
         RefClkOut_p => NextClk_p,
         RefClkOut_n => NextClk_n
      );

END rtl;
