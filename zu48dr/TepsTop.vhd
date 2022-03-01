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
USE work.fixed_pkg.ALL;
USE work.semco_pkg.ALL;

ENTITY TepsTop IS
   PORT(
      adc0_clk_p,
      adc0_clk_n,
      adc1_clk_p,
      adc1_clk_n,
      adc2_clk_p,
      adc2_clk_n,
      adc3_clk_p,
      adc3_clk_n,
      vin0_01_p,
      vin0_01_n,
      vin1_01_p,
      vin1_01_n,
      vin2_01_p,
      vin2_01_n,
      vin3_01_p,
      vin3_01_n,
      PS_Clk,        -- 33MHz crystal, no software required for setup. Use for processor clock
      DoutA,
      DoutB,
      FirstData,
      Busy           : IN  std_logic;
      SpiClk,
      SpiCS_n,
      StartConv,
      SpiReset,
      RF_Pll_CSB,
      RF_PLL_SDI,
      RF_PLL_SCK     : OUT std_logic

   );
END TepsTop;


ARCHITECTURE rtl OF TepsTop IS

    COMPONENT usp_rf_data_converter_0
        PORT (
            adc0_clk_p          : IN STD_LOGIC;
            adc0_clk_n          : IN STD_LOGIC;
            clk_adc0            : OUT STD_LOGIC;
            adc1_clk_p          : IN STD_LOGIC;
            adc1_clk_n          : IN STD_LOGIC;
            clk_adc1            : OUT STD_LOGIC;
            adc2_clk_p          : IN STD_LOGIC;
            adc2_clk_n          : IN STD_LOGIC;
            clk_adc2            : OUT STD_LOGIC;
            adc3_clk_p          : IN STD_LOGIC;
            adc3_clk_n          : IN STD_LOGIC;
            clk_adc3            : OUT STD_LOGIC;
            s_axi_aclk          : IN STD_LOGIC;
            s_axi_aresetn       : IN STD_LOGIC;
            s_axi_awaddr        : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            s_axi_awvalid       : IN STD_LOGIC;
            s_axi_awready       : OUT STD_LOGIC;
            s_axi_wdata         : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            s_axi_wstrb         : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            s_axi_wvalid        : IN STD_LOGIC;
            s_axi_wready        : OUT STD_LOGIC;
            s_axi_bresp         : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
            s_axi_bvalid        : OUT STD_LOGIC;
            s_axi_bready        : IN STD_LOGIC;
            s_axi_araddr        : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            s_axi_arvalid       : IN STD_LOGIC;
            s_axi_arready       : OUT STD_LOGIC;
            s_axi_rdata         : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
            s_axi_rresp         : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
            s_axi_rvalid        : OUT STD_LOGIC;
            s_axi_rready        : IN STD_LOGIC;
            irq                 : OUT STD_LOGIC;
            sysref_in_p         : IN STD_LOGIC;
            sysref_in_n         : IN STD_LOGIC;
            user_sysref_adc     : IN STD_LOGIC;
            vin0_01_p           : IN STD_LOGIC;
            vin0_01_n           : IN STD_LOGIC;
            vin1_01_p           : IN STD_LOGIC;
            vin1_01_n           : IN STD_LOGIC;
            vin2_01_p           : IN STD_LOGIC;
            vin2_01_n           : IN STD_LOGIC;
            vin3_01_p           : IN STD_LOGIC;
            vin3_01_n           : IN STD_LOGIC;
            m0_axis_aresetn     : IN STD_LOGIC;
            m0_axis_aclk        : IN STD_LOGIC;
            m00_axis_tdata      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            m00_axis_tvalid     : OUT STD_LOGIC;
            m00_axis_tready     : IN STD_LOGIC;
            m01_axis_tdata      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            m01_axis_tvalid     : OUT STD_LOGIC;
            m01_axis_tready     : IN STD_LOGIC;
            m1_axis_aresetn     : IN STD_LOGIC;
            m1_axis_aclk        : IN STD_LOGIC;
            m10_axis_tdata      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            m10_axis_tvalid     : OUT STD_LOGIC;
            m10_axis_tready     : IN STD_LOGIC;
            m11_axis_tdata      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            m11_axis_tvalid     : OUT STD_LOGIC;
            m11_axis_tready     : IN STD_LOGIC;
            m2_axis_aresetn     : IN STD_LOGIC;
            m2_axis_aclk        : IN STD_LOGIC;
            m20_axis_tdata      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            m20_axis_tvalid     : OUT STD_LOGIC;
            m20_axis_tready     : IN STD_LOGIC;
            m21_axis_tdata      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            m21_axis_tvalid     : OUT STD_LOGIC;
            m21_axis_tready     : IN STD_LOGIC;
            m3_axis_aresetn     : IN STD_LOGIC;
            m3_axis_aclk        : IN STD_LOGIC;
            m30_axis_tdata      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            m30_axis_tvalid     : OUT STD_LOGIC;
            m30_axis_tready     : IN STD_LOGIC;
            m31_axis_tdata      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            m31_axis_tvalid     : OUT STD_LOGIC;
            m31_axis_tready     : IN STD_LOGIC
        );
    END COMPONENT;

   COMPONENT Read7606 IS
      PORT(
         Clk,           -- ~93.3MHz
         Reset,
         CE,
         DoutA,
         DoutB,
         FirstData,
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
         ce,
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

   COMPONENT axi_amm_bridge_0
      PORT (
         s_axi_aclk : IN STD_LOGIC;
         s_axi_aresetn : IN STD_LOGIC;
         s_axi_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
         s_axi_awvalid : IN STD_LOGIC;
         s_axi_awready : OUT STD_LOGIC;
         s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axi_wvalid : IN STD_LOGIC;
         s_axi_wready : OUT STD_LOGIC;
         s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         s_axi_bvalid : OUT STD_LOGIC;
         s_axi_bready : IN STD_LOGIC;
         s_axi_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
         s_axi_arvalid : IN STD_LOGIC;
         s_axi_arready : OUT STD_LOGIC;
         s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         s_axi_rvalid : OUT STD_LOGIC;
         s_axi_rready : IN STD_LOGIC;
         avm_address : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
         avm_write : OUT STD_LOGIC;
         avm_read : OUT STD_LOGIC;
         avm_byteenable : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         avm_writedata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         avm_readdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT Clock_Times_0r5_1_2
      PORT (
         reset,
         clk_in1     : IN STD_LOGIC;
         ClkOver2,
         Clk,
         ClkX2,
         locked      : OUT STD_LOGIC
      );
   END COMPONENT;

  -- Signals
   signal   maxihpm0_lpd_aclk,
            maxigp2_awlock,
            maxigp2_awvalid,
            maxigp2_awready,
            maxigp2_wlast,
            maxigp2_wvalid,
            maxigp2_wready,
            maxigp2_bvalid,
            maxigp2_bready,
            maxigp2_arlock,
            maxigp2_arvalid,
            maxigp2_arready,
            maxigp2_rlast,
            maxigp2_rvalid,
            maxigp2_rready,
            avm_write,
            avm_read,
            emio_spi0_sclk_i,
            emio_spi0_sclk_o,
            emio_spi0_sclk_t,
            emio_spi0_m_i,
            emio_spi0_m_o,
            emio_spi0_mo_t,
            emio_spi0_s_i,
            emio_spi0_s_o,
            emio_spi0_so_t,
            emio_spi0_ss_i_n,
            emio_spi0_ss_o_n,
            emio_spi0_ss_n_t        : STD_LOGIC;
  signal    avm_address             : STD_LOGIC_VECTOR(4 DOWNTO 0);
   signal   pl_ps_irq0              : STD_LOGIC_VECTOR(0 DOWNTO 0);
   signal   maxigp2_bresp,
            maxigp2_arburst,
            maxigp2_rresp,
            maxigp2_awburst         : STD_LOGIC_VECTOR(1 DOWNTO 0);
   signal   maxigp2_arsize,
            maxigp2_awsize,
            maxigp2_arprot,
            maxigp2_awprot          : STD_LOGIC_VECTOR(2 DOWNTO 0);
   signal   maxigp2_awqos,
            maxigp2_arqos,
            avm_byteenable,
            maxigp2_awcache,
            maxigp2_arcache,
            maxigp2_wstrb           : SLV4;
   signal   maxigp2_awlen,
            maxigp2_arlen           : SLV8;
   signal   maxigp2_awuser,
            maxigp2_bid,
            maxigp2_aruser,
            maxigp2_arid,
            maxigp2_awid,
            maxigp2_rid             : SLV16;
   signal   maxigp2_wdata,
            maxigp2_rdata,
            avm_writedata,
            avm_readdata            : SLV32;
   signal   maxigp2_awaddr,
            maxigp2_araddr          : STD_LOGIC_VECTOR(39 DOWNTO 0);
   signal   Clk,
            ClkOver2,
            ClkX1,
            ClkX2,
            locked,
            Reset_n,
            clk_adc0,
            irq,
            s_axi_aclk,
            sysref_in_p,
            sysref_in_n,
            user_sysref_adc,
            m0_axis_aresetn,
            m00_axis_tvalid,
            m01_axis_tvalid,
            m1_axis_aresetn,
            m10_axis_tvalid,
            m11_axis_tvalid,
            m2_axis_aresetn,
            m20_axis_tvalid,
            m21_axis_tvalid,
            m3_axis_aresetn,
            m30_axis_tvalid,
            m31_axis_tvalid     : STD_LOGIC;
   signal   Agc0,
            Agc1,
            Agc2,
            Agc3,
            Agc4,
            Agc5,
            Agc6,
            Agc7                 : std_logic_vector(11 downto 0);
   signal   Ch0Real,
            Ch0Imag,
            Ch1Real,
            Ch1Imag,
            Ch2Real,
            Ch2Imag,
            Ch3Real,
            Ch3Imag              : SLV16;
   signal   Ch0Real_f,
            Ch0Imag_f,
            Ch1Real_f,
            Ch1Imag_f,
            Ch2Real_f,
            Ch2Imag_f,
            Ch3Real_f,
            Ch3Imag_f            : float_1_18;
   signal   Ch0Real18,
            s_axi_araddr,
            s_axi_awaddr         : SLV18;
   signal   s_axi_wdata,
            s_axi_rdata          : SLV32;

BEGIN
/*
   Delay_process: process (clk)
      variable p_r_v,
               p_i_v     : float;
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            Push     <= '0';
            MuxCntr  <= (others=>'0');
         elsif ce = '1' then
               BufCntr <= resize(BufCntr + 1, BufCntr);
            end if;
         end if;
      end if;
   end process Delay_process;
*/

   Clk         <= clk_adc0;         -- 125MHz
   RF_Pll_CSB  <= emio_spi0_ss_o_n;
   RF_PLL_SDI  <= emio_spi0_m_o;
   RF_PLL_SCK  <= emio_spi0_sclk_o;

   RFSOC : usp_rf_data_converter_0
      PORT MAP (
         vin0_01_p         => vin0_01_p,
         vin0_01_n         => vin0_01_n,
         vin1_01_p         => vin1_01_p,
         vin1_01_n         => vin1_01_n,
         vin2_01_p         => vin2_01_p,
         vin2_01_n         => vin2_01_n,
         vin3_01_p         => vin3_01_p,
         vin3_01_n         => vin3_01_n,
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
         s_axi_awaddr      => maxigp2_awaddr(17 downto 0),
         s_axi_awvalid     => maxigp2_awvalid,
         s_axi_awready     => maxigp2_awready,
         s_axi_wdata       => maxigp2_wdata,
         s_axi_wstrb       => maxigp2_wstrb,
         s_axi_wvalid      => maxigp2_wvalid,
         s_axi_wready      => maxigp2_wready,
         s_axi_bresp       => maxigp2_bresp,
         s_axi_bvalid      => maxigp2_bvalid,
         s_axi_bready      => maxigp2_bready,
         s_axi_araddr      => maxigp2_araddr(17 downto 0),
         s_axi_arvalid     => maxigp2_arvalid,
         s_axi_arready     => maxigp2_arready,
         s_axi_rdata       => maxigp2_rdata,
         s_axi_rresp       => maxigp2_rresp,
         s_axi_rvalid      => maxigp2_rvalid,
         s_axi_rready      => maxigp2_rready,
         irq               => pl_ps_irq0(0),
         sysref_in_p       => sysref_in_p,      -- from Dac1??
         sysref_in_n       => sysref_in_n,
         user_sysref_adc   => user_sysref_adc,
         m0_axis_aresetn   => m0_axis_aresetn,  -- mX_axis it the RF channel
         m0_axis_aclk      => clk_adc0,         -- mX_axis_aclk is an input that clocks the data out of the channel
         m00_axis_tdata    => Ch0Real,   -- driving all output data with a commone clock makes all the stream coherent
         m00_axis_tvalid   => m00_axis_tvalid,  -- mX0 is the I output, mX1 is the Q
         m00_axis_tready   => '1',
         m01_axis_tdata    => Ch0Imag,
         m01_axis_tvalid   => m01_axis_tvalid,
         m01_axis_tready   => '1',
         m1_axis_aresetn   => m1_axis_aresetn,
         m1_axis_aclk      => clk_adc0,
         m10_axis_tdata    => Ch1Real,
         m10_axis_tvalid   => m10_axis_tvalid,
         m10_axis_tready   => '1',
         m11_axis_tdata    => Ch1Imag,
         m11_axis_tvalid   => m11_axis_tvalid,
         m11_axis_tready   => '1',
         m2_axis_aresetn   => m2_axis_aresetn,
         m2_axis_aclk      => clk_adc0,
         m20_axis_tdata    => Ch2Real,
         m20_axis_tvalid   => m20_axis_tvalid,
         m20_axis_tready   => '1',
         m21_axis_tdata    => Ch2Imag,
         m21_axis_tvalid   => m21_axis_tvalid,
         m21_axis_tready   => '1',
         m3_axis_aresetn   => m3_axis_aresetn,
         m3_axis_aclk      => clk_adc0,
         m30_axis_tdata    => Ch3Real,
         m30_axis_tvalid   => m30_axis_tvalid,
         m30_axis_tready   => '1',
         m31_axis_tdata    => Ch3Imag,
         m31_axis_tvalid   => m31_axis_tvalid,
         m31_axis_tready   => '1'
    );


   Read7606_u : Read7606
      PORT MAP(
         Clk            => Clk,
         Reset          => not Reset_n,
         CE             => '1',
         DoutA          => DoutA,
         DoutB          => DoutB,
         FirstData      => FirstData,
         Busy           => Busy,
         SpiClk         => SpiClk,
         SpiCS_n        => SpiCS_n,
         StartConv      => StartConv,
         SpiReset       => SpiReset,
         Agc0           => Agc0,
         Agc1           => Agc1,
         Agc2           => Agc2,
         Agc3           => Agc3,
         Agc4           => Agc4,
         Agc5           => Agc5,
         Agc6           => Agc6,
         Agc7           => Agc7
      );

   ClkGen : Clock_Times_0r5_1_2
      PORT MAP(
         reset          => not Reset_n,
         clk_in1        => clk_adc0,
         ClkOver2       => ClkOver2,
         Clk            => ClkX1,
         ClkX2          => ClkX2,
         locked         => open
   );

   Ch0Real18 <= Ch0Real & "00";
   Ch0Real_f <= to_sfixed(Ch0Real18, Ch0Real_f);
   Ch0Imag_f <= to_sfixed(Ch0Imag & "00", Ch0Imag_f);
   Ch1Real_f <= to_sfixed(Ch1Real & "00", Ch1Real_f);
   Ch1Imag_f <= to_sfixed(Ch1Imag & "00", Ch1Imag_f);
   Ch2Real_f <= to_sfixed(Ch2Real & "00", Ch2Real_f);
   Ch2Imag_f <= to_sfixed(Ch2Imag & "00", Ch2Imag_f);
   Ch3Real_f <= to_sfixed(Ch3Real & "00", Ch3Real_f);
   Ch3Imag_f <= to_sfixed(Ch3Imag & "00", Ch3Imag_f);

   Combiner0_1 : DigitalCombiner
      PORT MAP(
         clk               => ClkOver2,
         clk2x             => ClkX1,
         clk4x             => ClkX2,
         reset             => not Reset_n,
         cs                => avm_write or avm_read,
         wr0               => avm_write and avm_byteenable(0),
         wr1               => avm_write and avm_byteenable(1),
         wr2               => avm_write and avm_byteenable(2),
         wr3               => avm_write and avm_byteenable(3),
         busClk            => s_axi_aclk,
         addr              => avm_address,
         dataIn            => avm_writedata,
         dataOut           => avm_readdata,
         ce                => m00_axis_tvalid,
         re1In             => Ch0Real_f,
         im1In             => Ch0Imag_f,
         re2In             => Ch1Real_f,
         im2In             => Ch1Imag_f,
         ch1agc            => Agc0,
         ch2agc            => Agc1,
         maximagout        => open,
         maxrealout        => open,
         minimagout        => open,
         minrealout        => open,
         imagout           => open,    -- combined Q
         realout           => open,    -- combined I
         ifOut             => open,
         gainoutmax        => open,
         gainoutmin        => open,
         phase_detect      => open,
         agc1_gt_agc2      => open,
         realxord          => open,
         imagxord          => open,
         combinerEn        => open,
         locked            => open,
         CarrierDetect     => open,
         ifBS_n            => open,
         imaglock          => open,
         reallock          => open,
         lag_out           => open,
         nco_control_out   => open
   );

   MCU : zynq_ultra_ps_e_0
      PORT MAP (
         maxihpm0_lpd_aclk => PS_Clk,
         maxigp2_awid      => open,
         maxigp2_arid      => open,
         maxigp2_bid       => maxigp2_aruser,      -- input
         maxigp2_awlen     => open,
         maxigp2_awsize    => open,
         maxigp2_awaddr    => maxigp2_awaddr,
         maxigp2_awburst   => open,
         maxigp2_awlock    => open,
         maxigp2_awcache   => open,
         maxigp2_awprot    => open,
         maxigp2_awvalid   => maxigp2_awvalid,
         maxigp2_awuser    => open,
         maxigp2_awready   => maxigp2_awready,
         maxigp2_wdata     => maxigp2_wdata,
         maxigp2_wstrb     => maxigp2_wstrb,
         maxigp2_wlast     => open,
         maxigp2_wvalid    => maxigp2_wvalid,
         maxigp2_wready    => maxigp2_wready,
         maxigp2_bresp     => maxigp2_bresp,
         maxigp2_bvalid    => maxigp2_bvalid,
         maxigp2_bready    => maxigp2_bready,
         maxigp2_araddr    => maxigp2_araddr,
         maxigp2_arlen     => open,
         maxigp2_arsize    => open,
         maxigp2_arburst   => open,
         maxigp2_arlock    => open,
         maxigp2_arcache   => open,
         maxigp2_arprot    => open,
         maxigp2_arvalid   => maxigp2_arvalid,
         maxigp2_aruser    => maxigp2_aruser,
         maxigp2_arready   => maxigp2_arready,
         maxigp2_rid       => maxigp2_aruser,      -- input
         maxigp2_rdata     => maxigp2_rdata,
         maxigp2_rresp     => maxigp2_rresp,
         maxigp2_rlast     => maxigp2_rlast,       -- input
         maxigp2_rvalid    => maxigp2_rvalid,
         maxigp2_rready    => maxigp2_rready,
         maxigp2_awqos     => open,
         maxigp2_arqos     => open,
         emio_spi0_sclk_i  => '0',
         emio_spi0_sclk_o  => emio_spi0_sclk_o,
         emio_spi0_sclk_t  => open,
         emio_spi0_m_i     => '0',
         emio_spi0_m_o     => emio_spi0_m_o,
         emio_spi0_mo_t    => open,
         emio_spi0_s_i     => '0',
         emio_spi0_s_o     => open,
         emio_spi0_so_t    => open,
         emio_spi0_ss_i_n  => '1',
         emio_spi0_ss_o_n  => emio_spi0_ss_o_n,
         emio_spi0_ss_n_t  => open,
         pl_ps_irq0        => pl_ps_irq0,
         pl_resetn0        => Reset_n,
         pl_clk0           => s_axi_aclk
   );

   CombinerAxiBridge : axi_amm_bridge_0
      PORT MAP (
         s_axi_aclk        => s_axi_aclk,
         s_axi_aresetn     => Reset_n,
         s_axi_awaddr      => maxigp2_awaddr(4 downto 0),
         s_axi_awvalid     => maxigp2_awvalid,
         s_axi_awready     => maxigp2_awready,
         s_axi_wdata       => maxigp2_wdata,
         s_axi_wstrb       => maxigp2_wstrb,
         s_axi_wvalid      => maxigp2_wvalid,
         s_axi_wready      => maxigp2_wready,
         s_axi_bresp       => maxigp2_bresp,
         s_axi_bvalid      => maxigp2_bvalid,
         s_axi_bready      => maxigp2_bready,
         s_axi_araddr      => maxigp2_araddr(4 downto 0),
         s_axi_arvalid     => maxigp2_arvalid,
         s_axi_arready     => maxigp2_arready,
         s_axi_rdata       => maxigp2_rdata,
         s_axi_rresp       => maxigp2_rresp,
         s_axi_rvalid      => maxigp2_rvalid,
         s_axi_rready      => maxigp2_rready,
         avm_address       => avm_address,
         avm_write         => avm_write,
         avm_read          => avm_read,
         avm_byteenable    => avm_byteenable,
         avm_writedata     => avm_writedata,
         avm_readdata      => avm_readdata
  );

END rtl;

