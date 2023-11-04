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
      clk,
      clk4x,
      Reset,
      FPGA_ID0,
      FPGA_ID1,
      dataI, dataEn,
      dqmDATA,
      dqmCLK,
      dqmFS             : IN  std_logic;
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
         clk,
         clk4x,
         Reset,
         Active            : in std_logic;
         TxData            : in SLV8_ARRAY(PORTS-1 downto 0);
         DataOut_p,
         DataOut_n         : out STD_LOGIC_VECTOR(PORTS-1 downto 0);
         RefClkOut_p,
         RefClkOut_n       : out std_logic
      );
   end component DemodSerDesOut;

   COMPONENT dds6p0
      PORT (
         aclk,
         aclken,
         aresetn,
         s_axis_phase_tvalid  : IN  STD_LOGIC;
         s_axis_phase_tdata   : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_data_tvalid   : OUT STD_LOGIC;
         m_axis_data_tdata    : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT VioTwoBit
      PORT (
         clk : IN STD_LOGIC;
         probe_out0 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
      );
   END COMPONENT;

   constant CHANNEL_1            : std_logic_vector(1 downto 0) := "00";
   constant CHANNEL_2            : std_logic_vector(1 downto 0) := "01";
   constant COMBINER             : std_logic_vector(1 downto 0) := "10";
   constant PORTS                : integer := 5;

  -- Signals
   signal   ID                   : std_logic_vector(1 downto 0);
   signal   TxData4              : UINT8 := x"55";
   signal   TxData               : SLV8_ARRAY(PORTS - 1 downto 0);
   signal   Active1,
            Active2              : std_logic;
   signal   testMode             : std_logic_vector(1 downto 0) := "01";
   signal   probe_out0,
            probe_out1           : STD_LOGIC_VECTOR(4 DOWNTO 0);
   signal   unstableBitOnDMDRev2 : std_logic := '0';
   signal   Sin, Cos             : slv18;
   signal   DDS                  : STD_LOGIC_VECTOR(47 DOWNTO 0);

BEGIN

   OneBit : VioTwoBit
      PORT MAP (
         clk        => clk,
         probe_out0 => testMode
   );

   DDS6 : dds6p0
      PORT MAP (
         aclk                 => clk,
         aclken               => '1',
         aresetn              => not testMode(0),
         s_axis_phase_tvalid  => '1',
         s_axis_phase_tdata   => 32x"0800_0000",
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => DDS
   );

   ID  <= FPGA_ID1 & FPGA_ID0;
   Sin <= DDS(41 downto 24);
   Cos <= DDS(17 downto 0);

   IF_Clk_process : process(clk)
   begin
      if (rising_edge(clk)) then
         if (Reset) then
            TxData4   <= x"55";
            TxData(0) <= x"00";
            TxData(1) <= x"00";
            TxData(2) <= x"00";
            TxData(3) <= x"00";
            TxData(4) <= x"00";
         else
            if (TxData4 < 255) then
               TxData4 <= TxData4 + x"11";
            else
               TxData4 <= x"55";
            end if;

            if (testMode(0)) then
               TxData(0) <= TxData(1);
               TxData(1) <= TxData(2);
               TxData(2) <= TxData(3);
               TxData(3) <= TxData(4);
            elsif (testMode(1)) then
               TxData(0) <= Sin(11 downto 4);
               TxData(1) <= "00" & Sin(17 downto 12);
               TxData(2) <= Cos(13 downto 6);
               TxData(3) <= Cos(17 downto 14) & x"0";
            else
               TxData(0) <= adc0(7 downto 0);
               TxData(1) <= dataI & dataEn & adc0(13 downto 8);
               TxData(2) <= amDataIn(7 downto 0);
               TxData(3) <= amDataIn(11 downto 8) & unstableBitOnDMDRev2 & dqmDATA & dqmCLK & dqmFS;
               -- I've seen sporadic errors on the combiner DataOut23(3) signal. DataOut13 is ok
            end if;
            TxData(4) <= std_logic_vector(TxData4);   -- used as test channel
         end if;
      end if;
   end process IF_Clk_process;

   Active1 <= (ID ?= CHANNEL_1);

   Ch1SerDes : DemodSerDesOut
      Generic Map(
         PORTS    => PORTS
      )
      Port MAP(
         clk         => clk,
         clk4x       => clk4x,
         Reset       => Reset,
         Active      => Active1,
         TxData      => TxData,
         DataOut_p   => PrevData_p,
         DataOut_n   => PrevData_n,
         RefClkOut_p => PrevClk_p,
         RefClkOut_n => PrevClk_n
      );

   Active2 <= (ID ?= CHANNEL_2);

   Ch2SerDes : DemodSerDesOut
      Generic Map(
         PORTS    => PORTS
      )
      Port MAP(
         clk         => clk,
         clk4x       => clk4x,
         Reset       => Reset,
         Active      => Active2,
         TxData      => TxData,
         DataOut_p   => NextData_p,
         DataOut_n   => NextData_n,
         RefClkOut_p => NextClk_p,
         RefClkOut_n => NextClk_n
      );

END rtl;
