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

Module Name: TepsTop.vhd
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
LIBRARY unisim;
USE unisim.vcomponents.ALL;
USE work.fixed_pkg.ALL;
USE work.semco_pkg.ALL;

ENTITY TepsTop IS
   PORT(
      adc0_clk_p,    -- Pin Y5/4
      adc0_clk_n,
      adc1_clk_p,    -- Pin AB5/4
      adc1_clk_n,                         -- all Diff clocks are 100MHz
      adc2_clk_p,    -- Pin AD5/4
      adc2_clk_n,
      adc3_clk_p,    -- Pin AF5/4
      adc3_clk_n,
      sysref_in_p,   -- Pin U5/4
      sysref_in_n,
      clk_pl_user1_p, -- Pin C8,7   Program to 100MHz, 1:1 with PLL input
      clk_pl_user1_n,
      vin0_01_p,     -- Pin AB2/1
      vin0_01_n,
      vin0_23_p,     -- Pin Y2/1
      vin0_23_n,
      vin1_01_p,     -- Pin AF2/1
      vin1_01_n,
      vin1_23_p,     -- Pin AD2/1
      vin1_23_n,
      vin2_01_p,     -- Pin AK2/1
      vin2_01_n,
      vin2_23_p,     -- Pin AH2/1
      vin2_23_n,
      vin3_01_p,     -- Pin AP2/1
      vin3_01_n,
      vin3_23_p,     -- Pin AM2/1
      vin3_23_n,
      RF_PLL_MUX,    -- Pin C5 MISO
      PS_Clk,        -- 33MHz crystal, no software required for setup. Use for processor clock
      DoutA,         -- AGC Cable pins
      DoutB,
      Busy           : IN  std_logic;
      SpiClk,
      SpiCS_n,
      StartConv,
      SpiReset,
      RF_Pll_CSB,    -- Pin F6
      RF_PLL_SDI,    -- Pin B5
      RF_PLL_SCK     : OUT std_logic;   -- Pin A5
      ImagOut,
      RealOut,
      IfOut          : OUT SLV18_ARRAY(3 downto 0)

   );
END TepsTop;


ARCHITECTURE rtl OF TepsTop IS

   COMPONENT usp_rf_data_converter_0
      PORT (
         adc0_clk_p        : IN STD_LOGIC;
         adc0_clk_n        : IN STD_LOGIC;
         clk_adc0          : OUT STD_LOGIC;
         adc1_clk_p        : IN STD_LOGIC;
         adc1_clk_n        : IN STD_LOGIC;
         clk_adc1          : OUT STD_LOGIC;
         adc2_clk_p        : IN STD_LOGIC;
         adc2_clk_n        : IN STD_LOGIC;
         clk_adc2          : OUT STD_LOGIC;
         adc3_clk_p        : IN STD_LOGIC;
         adc3_clk_n        : IN STD_LOGIC;
         clk_adc3          : OUT STD_LOGIC;
         s_axi_aclk        : IN STD_LOGIC;
         s_axi_aresetn     : IN STD_LOGIC;
         s_axi_awaddr      : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
         s_axi_awvalid     : IN STD_LOGIC;
         s_axi_awready     : OUT STD_LOGIC;
         s_axi_wdata       : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axi_wstrb       : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axi_wvalid      : IN STD_LOGIC;
         s_axi_wready      : OUT STD_LOGIC;
         s_axi_bresp       : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         s_axi_bvalid      : OUT STD_LOGIC;
         s_axi_bready      : IN STD_LOGIC;
         s_axi_araddr      : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
         s_axi_arvalid     : IN STD_LOGIC;
         s_axi_arready     : OUT STD_LOGIC;
         s_axi_rdata       : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axi_rresp       : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         s_axi_rvalid      : OUT STD_LOGIC;
         s_axi_rready      : IN STD_LOGIC;
         irq               : OUT STD_LOGIC;
         sysref_in_p       : IN STD_LOGIC;
         sysref_in_n       : IN STD_LOGIC;
         user_sysref_adc   : IN STD_LOGIC;
         vin0_01_p         : IN STD_LOGIC;
         vin0_01_n         : IN STD_LOGIC;
         vin0_23_p         : IN STD_LOGIC;
         vin0_23_n         : IN STD_LOGIC;
         vin1_01_p         : IN STD_LOGIC;
         vin1_01_n         : IN STD_LOGIC;
         vin1_23_p         : IN STD_LOGIC;
         vin1_23_n         : IN STD_LOGIC;
         vin2_01_p         : IN STD_LOGIC;
         vin2_01_n         : IN STD_LOGIC;
         vin2_23_p         : IN STD_LOGIC;
         vin2_23_n         : IN STD_LOGIC;
         vin3_01_p         : IN STD_LOGIC;
         vin3_01_n         : IN STD_LOGIC;
         vin3_23_p         : IN STD_LOGIC;
         vin3_23_n         : IN STD_LOGIC;
         m0_axis_aresetn   : IN STD_LOGIC;
         m0_axis_aclk      : IN STD_LOGIC;
         m00_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m00_axis_tvalid   : OUT STD_LOGIC;
         m00_axis_tready   : IN STD_LOGIC;
         m01_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m01_axis_tvalid   : OUT STD_LOGIC;
         m01_axis_tready   : IN STD_LOGIC;
         m02_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m02_axis_tvalid   : OUT STD_LOGIC;
         m02_axis_tready   : IN STD_LOGIC;
         m03_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m03_axis_tvalid   : OUT STD_LOGIC;
         m03_axis_tready   : IN STD_LOGIC;
         m1_axis_aresetn   : IN STD_LOGIC;
         m1_axis_aclk      : IN STD_LOGIC;
         m10_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m10_axis_tvalid   : OUT STD_LOGIC;
         m10_axis_tready   : IN STD_LOGIC;
         m11_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m11_axis_tvalid   : OUT STD_LOGIC;
         m11_axis_tready   : IN STD_LOGIC;
         m12_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m12_axis_tvalid   : OUT STD_LOGIC;
         m12_axis_tready   : IN STD_LOGIC;
         m13_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m13_axis_tvalid   : OUT STD_LOGIC;
         m13_axis_tready   : IN STD_LOGIC;
         m2_axis_aresetn   : IN STD_LOGIC;
         m2_axis_aclk      : IN STD_LOGIC;
         m20_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m20_axis_tvalid   : OUT STD_LOGIC;
         m20_axis_tready   : IN STD_LOGIC;
         m21_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m21_axis_tvalid   : OUT STD_LOGIC;
         m21_axis_tready   : IN STD_LOGIC;
         m22_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m22_axis_tvalid   : OUT STD_LOGIC;
         m22_axis_tready   : IN STD_LOGIC;
         m23_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m23_axis_tvalid   : OUT STD_LOGIC;
         m23_axis_tready   : IN STD_LOGIC;
         m3_axis_aresetn   : IN STD_LOGIC;
         m3_axis_aclk      : IN STD_LOGIC;
         m30_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m30_axis_tvalid   : OUT STD_LOGIC;
         m30_axis_tready   : IN STD_LOGIC;
         m31_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m31_axis_tvalid   : OUT STD_LOGIC;
         m31_axis_tready   : IN STD_LOGIC;
         m32_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m32_axis_tvalid   : OUT STD_LOGIC;
         m32_axis_tready   : IN STD_LOGIC;
         m33_axis_tdata    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m33_axis_tvalid   : OUT STD_LOGIC;
         m33_axis_tready   : IN STD_LOGIC
      );
   END COMPONENT;

   COMPONENT Read7606 IS
      PORT(
         Clk,           -- ~93.3MHz
         Reset,
         CE,
         DoutA,
         DoutB,
         Busy           : IN  std_logic;
         SpiClk,
         SpiCS_n,
         StartConv,
         SpiReset       : OUT std_logic;
         Agc0,
         Agc1,
         Agc2,
         Agc3,
         Agc4,
         Agc5,
         Agc6,
         Agc7           : OUT std_logic_vector(11 downto 0)
      );
   END COMPONENT Read7606;

   COMPONENT DigitalCombiner IS
      PORT (
         clk,        -- half clk2x. Symbol rate
         clk2x,      -- `93.3MHz
         clk4x,      -- twice Clk2x
         reset,
         cs,
         wr0, wr1, wr2, wr3,
         busClk            : IN  std_logic;
         re1In,
         im1In,
         re2In,
         im2In             : IN  float_1_18;
         ch1agc,
         ch2agc            : IN  SLV12;
         addr              : IN  std_logic_vector(4 downto 0);
         dataIn            : IN  SLV32;
         dataOut           : OUT SLV32;
         maximagout,
         maxrealout,
         minimagout,
         minrealout,
         imagout,
         realout,
         ifOut,
         gainoutmax,
         gainoutmin,
         phase_detect      : OUT SLV18;
         agc1_gt_agc2,
         realxord,
         imagxord,
         combinerEn,
         locked,
         CarrierDetect,
         ifBS_n            : OUT STD_LOGIC;
         imaglock,
         reallock          : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
         lag_out           : OUT SLV32;
         nco_control_out   : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
      );
   END COMPONENT DigitalCombiner;

   COMPONENT zynq_ultra_ps_e_0
      PORT (
         maxihpm0_lpd_aclk : IN  STD_LOGIC;
         maxigp2_awid      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         maxigp2_awaddr    : OUT STD_LOGIC_VECTOR(39 DOWNTO 0);
         maxigp2_awlen     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         maxigp2_awsize    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         maxigp2_awburst   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         maxigp2_awlock    : OUT STD_LOGIC;
         maxigp2_awcache   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         maxigp2_awprot    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         maxigp2_awvalid   : OUT STD_LOGIC;
         maxigp2_awuser    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         maxigp2_awready   : IN  STD_LOGIC;
         maxigp2_wdata     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         maxigp2_wstrb     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         maxigp2_wlast     : OUT STD_LOGIC;
         maxigp2_wvalid    : OUT STD_LOGIC;
         maxigp2_wready    : IN  STD_LOGIC;
         maxigp2_bid       : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
         maxigp2_bresp     : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
         maxigp2_bvalid    : IN  STD_LOGIC;
         maxigp2_bready    : OUT STD_LOGIC;
         maxigp2_arid      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         maxigp2_araddr    : OUT STD_LOGIC_VECTOR(39 DOWNTO 0);
         maxigp2_arlen     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         maxigp2_arsize    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         maxigp2_arburst   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         maxigp2_arlock    : OUT STD_LOGIC;
         maxigp2_arcache   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         maxigp2_arprot    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         maxigp2_arvalid   : OUT STD_LOGIC;
         maxigp2_aruser    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         maxigp2_arready   : IN  STD_LOGIC;
         maxigp2_rid       : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
         maxigp2_rdata     : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
         maxigp2_rresp     : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
         maxigp2_rlast     : IN  STD_LOGIC;
         maxigp2_rvalid    : IN  STD_LOGIC;
         maxigp2_rready    : OUT STD_LOGIC;
         maxigp2_awqos     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         maxigp2_arqos     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         emio_spi0_sclk_i  : IN  STD_LOGIC;
         emio_spi0_sclk_o  : OUT STD_LOGIC;
         emio_spi0_sclk_t  : OUT STD_LOGIC;
         emio_spi0_m_i     : IN  STD_LOGIC;
         emio_spi0_m_o     : OUT STD_LOGIC;
         emio_spi0_mo_t    : OUT STD_LOGIC;
         emio_spi0_s_i     : IN  STD_LOGIC;
         emio_spi0_s_o     : OUT STD_LOGIC;
         emio_spi0_so_t    : OUT STD_LOGIC;
         emio_spi0_ss_i_n  : IN  STD_LOGIC;
         emio_spi0_ss_o_n  : OUT STD_LOGIC;
         emio_spi0_ss_n_t  : OUT STD_LOGIC;
         pl_ps_irq0        : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
         pl_resetn0        : OUT STD_LOGIC;
         pl_clk0           : OUT STD_LOGIC
      );
   END COMPONENT;

   COMPONENT Clock_Times_0r5_1_2
      PORT (
         reset,
         clk_in1     : IN STD_LOGIC;
         Clk8r33,
         Clk50,
         Clk100,
         Clk200,
         locked      : OUT STD_LOGIC
      );
   END COMPONENT;

  -- Signals
   type  SLV12_ARRAY is array (NATURAL RANGE <>) OF SLV12;
   type  SLV18_ARRAY is array (NATURAL RANGE <>) OF SLV18;

   signal   maxihpm0_lpd_aclk,
            Mcu_awlock,
            Mcu_awvalid,
            Mcu_wlast,
            Mcu_wvalid,
            Mcu_bvalid,
            Mcu_arlock,
            Mcu_arvalid,
            Mcu_rlast,
            Mcu_rvalid,
            Mcu_awready,
            Mcu_wready,
            Mcu_bready,
            Mcu_arready,
            Mcu_rready,
            RfSoc_awready,
            RfSoc_wready,
            RfSoc_bready,
            RfSoc_arready,
            RfSoc_rready,
            RfSoc_bvalid,
            RfSoc_rvalid,
            RfSoc_rlast,
            avm_write,
            avm_read               : STD_LOGIC;
  signal    avm_address             : STD_LOGIC_VECTOR(6 DOWNTO 0);
   signal   pl_ps_irq0              : STD_LOGIC_VECTOR(0 DOWNTO 0);
   signal   RfSoc_bresp,
            RfSoc_rresp,
            Mcu_bresp,
            Mcu_arburst,
            Mcu_rresp,
            Mcu_awburst         : STD_LOGIC_VECTOR(1 DOWNTO 0);
   signal   Mcu_arsize,
            Mcu_awsize,
            Mcu_arprot,
            Mcu_awprot          : STD_LOGIC_VECTOR(2 DOWNTO 0);
   signal   Mcu_awqos,
            Mcu_arqos,
            avm_byteenable,
            Mcu_awcache,
            Mcu_arcache,
            Mcu_wstrb,
            CombCs,
            Agc1GtAgc2,
            CombLocked,
            CarrierDetect       : SLV4;
   signal   Mcu_awlen,
            Mcu_arlen           : SLV8;
   signal   Mcu_awuser,
            Mcu_bid,
            RfSoc_bid,
            RfSoc_rid,
            Mcu_aruser,
            Mcu_arid,
            Mcu_awid,
            Mcu_rid             : SLV16;
   signal   Mcu_wdata,
            Mcu_rdata,
            avm_writedata,
            avm_readdata        : SLV32;
   signal   Mcu_awaddr,
            Mcu_araddr          : STD_LOGIC_VECTOR(39 DOWNTO 0);
   signal   clk_pl_user1,
            Clk8r33,
            Clk50,
            Clk100,
            Clk200,
            locked,
            Reset_n,
            RfAdcRdCS,
            RfAdcWrCS,
            CombAddr,
            clk_adc0,
            irq,
            s_axi_aclk,
            user_sysref_adc,
            m0_axis_aresetn,
            m00_axis_tvalid      : STD_LOGIC;
   signal   Agc                  : SLV12_ARRAY(7 downto 0);
   signal   CombRdData           : SLV32_ARRAY(3 downto 0);
   signal   ChRealSlv16,
            ChImagSlv16          : SLV16_ARRAY(7 downto 0);
   signal   s_axi_araddr,
            s_axi_awaddr         : SLV18;
   signal   s_axi_wdata,
            s_axi_rdata,
            RfSocRdData          : SLV32;
   signal   ChReal_f,
            ChImag_f             : FLOAT_ARRAY_1_18(7 downto 0);

BEGIN


   RfAdcRdCs   <= Mcu_arvalid when (Mcu_araddr ?= 40x"04----") else '0';
   RfAdcWrCs   <= Mcu_awvalid when (Mcu_awaddr ?= 40x"04----") else '0';
   CombAddr    <= '1'         when (Mcu_araddr ?= 40x"08----") else '0';

   pl_sysref : IBUFDS
      port map (
         I  => clk_pl_user1_p,
         IB => clk_pl_user1_n,
         O  => clk_pl_user1
      );

   -- All 8 A/D channels
   RFSOC : usp_rf_data_converter_0
      PORT MAP (
         vin0_01_p         => vin0_01_p,
         vin0_01_n         => vin0_01_n,
         vin0_23_p         => vin0_23_p,
         vin0_23_n         => vin0_23_n,
         vin1_01_p         => vin1_01_p,
         vin1_01_n         => vin1_01_n,
         vin1_23_p         => vin1_23_p,
         vin1_23_n         => vin1_23_n,
         vin2_01_p         => vin2_01_p,
         vin2_01_n         => vin2_01_n,
         vin2_23_p         => vin2_23_p,
         vin2_23_n         => vin2_23_n,
         vin3_01_p         => vin3_01_p,
         vin3_01_n         => vin3_01_n,
         vin3_23_p         => vin3_23_p,
         vin3_23_n         => vin3_23_n,
         adc0_clk_p        => adc0_clk_p,
         adc0_clk_n        => adc0_clk_n,
         clk_adc0          => clk_adc0,      -- clk_adc0 is divided down from adc0_clk
         adc1_clk_p        => adc1_clk_p,
         adc1_clk_n        => adc1_clk_n,
         clk_adc1          => open,          -- all the adcX_clk inputs are driven from the same source
         adc2_clk_p        => adc2_clk_p,    -- and as such the clk_adcX signals are all the same except for phase
         adc2_clk_n        => adc2_clk_n,    -- the output fifo will backfill for the phase offsets
         clk_adc2          => open,
         adc3_clk_p        => adc3_clk_p,
         adc3_clk_n        => adc3_clk_n,
         clk_adc3          => open,
         s_axi_aclk        => s_axi_aclk,
         s_axi_aresetn     => Reset_n,
         s_axi_awaddr      => Mcu_awaddr(17 downto 0),
         s_axi_awvalid     => Mcu_awvalid and RfAdcWrCs,
         s_axi_awready     => RfSoc_awready,
         s_axi_wdata       => Mcu_wdata,
         s_axi_wstrb       => Mcu_wstrb,
         s_axi_wvalid      => Mcu_wvalid,
         s_axi_wready      => RfSoc_wready,
         s_axi_bresp       => RfSoc_bresp,
         s_axi_bvalid      => RfSoc_bvalid,
         s_axi_bready      => RfSoc_bready,
         s_axi_araddr      => Mcu_araddr(17 downto 0),
         s_axi_arvalid     => RfAdcRdCs,
         s_axi_arready     => RfSoc_arready,
         s_axi_rdata       => RfSocRdData,
         s_axi_rresp       => RfSoc_rresp,
         s_axi_rvalid      => RfSoc_rvalid,
         s_axi_rready      => RfSoc_rready,
         irq               => pl_ps_irq0(0),
         sysref_in_p       => sysref_in_p,      -- from Dac1 reference
         sysref_in_n       => sysref_in_n,
         user_sysref_adc   => Clk8r33,
         m0_axis_aresetn   => Reset_n,  -- mX_axis it the RF channel
         m0_axis_aclk      => clk_adc0,         -- mX_axis_aclk is an input that clocks the data out of the channel
         m00_axis_tdata    => ChRealSlv16(0),   -- driving all output data with a commone clock makes all the stream coherent
         m00_axis_tvalid   => open,
         m00_axis_tready   => '1',
         m01_axis_tdata    => ChImagSlv16(0),  -- mX0 is the I output, mX1 is the Q
         m01_axis_tvalid   => open,
         m01_axis_tready   => '1',
         m02_axis_tdata    => ChRealSlv16(1),
         m02_axis_tvalid   => open,
         m02_axis_tready   => '1',
         m03_axis_tdata    => ChImagSlv16(1),
         m03_axis_tvalid   => open,
         m03_axis_tready   => '1',
         m1_axis_aresetn   => Reset_n,
         m1_axis_aclk      => clk_adc0,
         m10_axis_tdata    => ChRealSlv16(2),
         m10_axis_tvalid   => open,
         m10_axis_tready   => '1',
         m11_axis_tdata    => ChImagSlv16(2),
         m11_axis_tvalid   => open,
         m11_axis_tready   => '1',
         m12_axis_tdata    => ChRealSlv16(3),
         m12_axis_tvalid   => open,
         m12_axis_tready   => '1',
         m13_axis_tdata    => ChImagSlv16(3),
         m13_axis_tvalid   => open,
         m13_axis_tready   => '1',
         m2_axis_aresetn   => Reset_n,
         m2_axis_aclk      => clk_adc0,
         m20_axis_tdata    => ChRealSlv16(4),
         m20_axis_tvalid   => open,
         m20_axis_tready   => '1',
         m21_axis_tdata    => ChImagSlv16(4),
         m21_axis_tvalid   => open,
         m21_axis_tready   => '1',
         m22_axis_tdata    => ChRealSlv16(5),
         m22_axis_tvalid   => open,
         m22_axis_tready   => '1',
         m23_axis_tdata    => ChImagSlv16(5),
         m23_axis_tvalid   => open,
         m23_axis_tready   => '1',
         m3_axis_aresetn   => Reset_n,
         m3_axis_aclk      => clk_adc0,
         m30_axis_tdata    => ChRealSlv16(6),
         m30_axis_tvalid   => open,
         m30_axis_tready   => '1',
         m31_axis_tdata    => ChImagSlv16(6),
         m31_axis_tvalid   => open,
         m31_axis_tready   => '1',
         m32_axis_tdata    => ChRealSlv16(7),
         m32_axis_tvalid   => open,
         m32_axis_tready   => '1',
         m33_axis_tdata    => ChImagSlv16(7),
         m33_axis_tvalid   => open,
         m33_axis_tready   => '1'
    );

   Read7606_u : Read7606
      PORT MAP(
         Clk            => clk_adc0,
         Reset          => not Reset_n,
         CE             => '1',
         DoutA          => DoutA,
         DoutB          => DoutB,
         Busy           => Busy,
         SpiClk         => SpiClk,
         SpiCS_n        => SpiCS_n,
         StartConv      => StartConv,
         SpiReset       => SpiReset,
         Agc0           => Agc(0),
         Agc1           => Agc(1),
         Agc2           => Agc(2),
         Agc3           => Agc(3),
         Agc4           => Agc(4),
         Agc5           => Agc(5),
         Agc6           => Agc(6),
         Agc7           => Agc(7)
      );

   ClkGen : Clock_Times_0r5_1_2
      PORT MAP(
         reset          => not Reset_n,
         clk_in1        => clk_pl_user1,
         Clk8r33        => Clk8r33,
         Clk50          => Clk50,
         Clk100         => Clk100,
         Clk200         => Clk200,
         locked         => open
   );


GenLabel :
   for n in 0 to 3 generate
      begin
         ChReal_f(2*n)     <= to_sfixed(ChRealSlv16(2*n)   & "00", ChReal_f(0));
         ChImag_f(2*n)     <= to_sfixed(ChImagSlv16(2*n)   & "00", ChImag_f(0));
         ChReal_f(2*n+1)   <= to_sfixed(ChRealSlv16(2*n+1) & "00", ChReal_f(0));
         ChImag_f(2*n+1)   <= to_sfixed(ChImagSlv16(2*n+1) & "00", ChImag_f(0));
         CombCs(n)         <= CombAddr when (unsigned(avm_address(6 downto 5)) = n) else '0';

   Combiners : DigitalCombiner
      PORT MAP(
         clk               => Clk50,
         clk2x             => Clk100,
         clk4x             => Clk200,
         reset             => not Reset_n,
         cs                => (avm_write or avm_read) and CombCs(n),
         wr0               => avm_write and avm_byteenable(0),
         wr1               => avm_write and avm_byteenable(1),
         wr2               => avm_write and avm_byteenable(2),
         wr3               => avm_write and avm_byteenable(3),
         busClk            => s_axi_aclk,
         addr              => avm_address(4 downto 0),
         dataIn            => avm_writedata,
         dataOut           => CombRdData(n),
         re1In             => ChReal_f(2*n),
         im1In             => ChImag_f(2*n),
         re2In             => ChReal_f(2*n+1),
         im2In             => ChImag_f(2*n+1),
         ch1agc            => Agc(n),
         ch2agc            => Agc(n+1),
         maximagout        => open,
         maxrealout        => open,
         minimagout        => open,
         minrealout        => open,
         imagout           => ImagOut(n),    -- combined Q
         realout           => RealOut(n),    -- combined I
         ifOut             => IfOut(n),
         gainoutmax        => open,
         gainoutmin        => open,
         phase_detect      => open,
         agc1_gt_agc2      => Agc1GtAgc2(n),
         realxord          => open,
         imagxord          => open,
         combinerEn        => open,
         locked            => CombLocked(n),
         CarrierDetect     => CarrierDetect(n),
         ifBS_n            => open,
         imaglock          => open,
         reallock          => open,
         lag_out           => open,
         nco_control_out   => open
   );

   end generate;

   Mcu_rdata <= RfSocRdData when (RfAdcRdCs) else
      CombRdData(to_integer(unsigned(Mcu_araddr(6 downto 5)))) when (CombAddr) else 32x"0";
   Mcu_awready    <= RfSoc_awready when (RfAdcWrCs) else '0';
   Mcu_wready     <= RfSoc_wready  when (RfAdcWrCs) else '0';
   Mcu_arready    <= RfSoc_arready when (RfAdcRdCs) else '0';
   Mcu_rready     <= RfSoc_rready  when (RfAdcRdCs) else '0';
   Mcu_bid        <= RfSoc_bid;
   Mcu_bresp      <= RfSoc_bresp;
   Mcu_bvalid     <= RfSoc_bvalid;
   Mcu_rid        <= RfSoc_rid    when (RfAdcRdCs) else (others=>'0');
   Mcu_rresp      <= RfSoc_rresp  when (RfAdcRdCs) else (others=>'0');
   Mcu_rlast      <= RfSoc_rlast  when (RfAdcRdCs) else '0';
   Mcu_rvalid     <= RfSoc_rvalid when (RfAdcRdCs) else '0';
   RfSoc_bready   <= Mcu_bready   when (RfAdcWrCs) else '0';

   MCU : zynq_ultra_ps_e_0
      PORT MAP (
         maxihpm0_lpd_aclk => PS_Clk,
         maxigp2_awid      => open,
         maxigp2_arid      => open,
         maxigp2_bid       => Mcu_aruser,      -- input
         maxigp2_awlen     => open,
         maxigp2_awsize    => open,
         maxigp2_awaddr    => Mcu_awaddr,
         maxigp2_awburst   => open,
         maxigp2_awlock    => open,
         maxigp2_awcache   => open,
         maxigp2_awprot    => open,
         maxigp2_awvalid   => Mcu_awvalid,
         maxigp2_awuser    => open,
         maxigp2_awready   => Mcu_awready,
         maxigp2_wdata     => Mcu_wdata,
         maxigp2_wstrb     => Mcu_wstrb,
         maxigp2_wlast     => open,
         maxigp2_wvalid    => Mcu_wvalid,
         maxigp2_wready    => Mcu_wready,
         maxigp2_bresp     => Mcu_bresp,
         maxigp2_bvalid    => Mcu_bvalid,
         maxigp2_bready    => Mcu_bready,
         maxigp2_araddr    => Mcu_araddr,
         maxigp2_arlen     => open,
         maxigp2_arsize    => open,
         maxigp2_arburst   => open,
         maxigp2_arlock    => open,
         maxigp2_arcache   => open,
         maxigp2_arprot    => open,
         maxigp2_arvalid   => Mcu_arvalid,
         maxigp2_aruser    => Mcu_aruser,
         maxigp2_arready   => Mcu_arready,
         maxigp2_rid       => Mcu_aruser,      -- input
         maxigp2_rdata     => Mcu_rdata,
         maxigp2_rresp     => Mcu_rresp,
         maxigp2_rlast     => Mcu_rlast,       -- input
         maxigp2_rvalid    => Mcu_rvalid,
         maxigp2_rready    => Mcu_rready,
         maxigp2_awqos     => open,
         maxigp2_arqos     => open,
         emio_spi0_sclk_i  => '0',
         emio_spi0_sclk_o  => RF_PLL_SCK,
         emio_spi0_sclk_t  => open,
         emio_spi0_m_i     => RF_PLL_MUX,
         emio_spi0_m_o     => RF_PLL_SDI,
         emio_spi0_mo_t    => open,
         emio_spi0_s_i     => '0',
         emio_spi0_s_o     => open,
         emio_spi0_so_t    => open,
         emio_spi0_ss_i_n  => '1',
         emio_spi0_ss_o_n  => RF_Pll_CSB,
         emio_spi0_ss_n_t  => open,
         pl_ps_irq0        => pl_ps_irq0,
         pl_resetn0        => Reset_n,
         pl_clk0           => s_axi_aclk
   );

END rtl;

