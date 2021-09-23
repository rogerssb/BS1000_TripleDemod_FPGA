-- (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: Semco:SysGen:complexphasedetector:1.0
-- IP Revision: 262549179

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.complexphasedetector;

ENTITY complexphasedetector_0 IS
  PORT (
    ch1agc : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    ch1imag : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    ch1real : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    ch2agc : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    ch2imag : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    ch2real : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    lag_coef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    lead_coef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    reset : IN STD_LOGIC;
    sweeplmt : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
    swprate : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    am_disable : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    gainoutch1 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    gainoutch2 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    imaglock : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
    imagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    imagxord : OUT STD_LOGIC;
    lag_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    locked : OUT STD_LOGIC;
    ch1imagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    ch1realout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    ch2imagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    ch2realout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    nco_control_out : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
    phase_detect : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    reallock : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
    realout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    realxord : OUT STD_LOGIC
  );
END complexphasedetector_0;

ARCHITECTURE complexphasedetector_0_arch OF complexphasedetector_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF complexphasedetector_0_arch: ARCHITECTURE IS "yes";
  COMPONENT complexphasedetector IS
    PORT (
      ch1agc : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      ch1imag : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      ch1real : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      ch2agc : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      ch2imag : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      ch2real : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      lag_coef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      lead_coef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      reset : IN STD_LOGIC;
      sweeplmt : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
      swprate : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      am_disable : IN STD_LOGIC;
      clk : IN STD_LOGIC;
      gainoutch1 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      gainoutch2 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      imaglock : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
      imagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      imagxord : OUT STD_LOGIC;
      lag_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      locked : OUT STD_LOGIC;
      ch1imagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      ch1realout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      ch2imagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      ch2realout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      nco_control_out : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
      phase_detect : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      reallock : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
      realout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      realxord : OUT STD_LOGIC
    );
  END COMPONENT complexphasedetector;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF complexphasedetector_0_arch: ARCHITECTURE IS "complexphasedetector,Vivado 2017.2.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF complexphasedetector_0_arch : ARCHITECTURE IS "complexphasedetector_0,complexphasedetector,{}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ch1agc: SIGNAL IS "xilinx.com:signal:data:1.0 ch1agc DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch1imag: SIGNAL IS "xilinx.com:signal:data:1.0 ch1imag DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch1real: SIGNAL IS "xilinx.com:signal:data:1.0 ch1real DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch2agc: SIGNAL IS "xilinx.com:signal:data:1.0 ch2agc DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch2imag: SIGNAL IS "xilinx.com:signal:data:1.0 ch2imag DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch2real: SIGNAL IS "xilinx.com:signal:data:1.0 ch2real DATA";
  ATTRIBUTE X_INTERFACE_INFO OF lag_coef: SIGNAL IS "xilinx.com:signal:data:1.0 lag_coef DATA";
  ATTRIBUTE X_INTERFACE_INFO OF lead_coef: SIGNAL IS "xilinx.com:signal:data:1.0 lead_coef DATA";
  ATTRIBUTE X_INTERFACE_INFO OF reset: SIGNAL IS "xilinx.com:signal:reset:1.0 reset RST";
  ATTRIBUTE X_INTERFACE_INFO OF sweeplmt: SIGNAL IS "xilinx.com:signal:data:1.0 sweeplmt DATA";
  ATTRIBUTE X_INTERFACE_INFO OF swprate: SIGNAL IS "xilinx.com:signal:data:1.0 swprate DATA";
  ATTRIBUTE X_INTERFACE_INFO OF am_disable: SIGNAL IS "xilinx.com:signal:data:1.0 am_disable DATA";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF gainoutch1: SIGNAL IS "xilinx.com:signal:data:1.0 gainoutch1 DATA";
  ATTRIBUTE X_INTERFACE_INFO OF gainoutch2: SIGNAL IS "xilinx.com:signal:data:1.0 gainoutch2 DATA";
  ATTRIBUTE X_INTERFACE_INFO OF imaglock: SIGNAL IS "xilinx.com:signal:data:1.0 imaglock DATA";
  ATTRIBUTE X_INTERFACE_INFO OF imagout: SIGNAL IS "xilinx.com:signal:data:1.0 imagout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF imagxord: SIGNAL IS "xilinx.com:signal:data:1.0 imagxord DATA";
  ATTRIBUTE X_INTERFACE_INFO OF lag_out: SIGNAL IS "xilinx.com:signal:data:1.0 lag_out DATA";
  ATTRIBUTE X_INTERFACE_INFO OF locked: SIGNAL IS "xilinx.com:signal:data:1.0 locked DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch1imagout: SIGNAL IS "xilinx.com:signal:data:1.0 ch1imagout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch1realout: SIGNAL IS "xilinx.com:signal:data:1.0 ch1realout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch2imagout: SIGNAL IS "xilinx.com:signal:data:1.0 ch2imagout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch2realout: SIGNAL IS "xilinx.com:signal:data:1.0 ch2realout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF nco_control_out: SIGNAL IS "xilinx.com:signal:data:1.0 nco_control_out DATA";
  ATTRIBUTE X_INTERFACE_INFO OF phase_detect: SIGNAL IS "xilinx.com:signal:data:1.0 phase_detect DATA";
  ATTRIBUTE X_INTERFACE_INFO OF reallock: SIGNAL IS "xilinx.com:signal:data:1.0 reallock DATA";
  ATTRIBUTE X_INTERFACE_INFO OF realout: SIGNAL IS "xilinx.com:signal:data:1.0 realout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF realxord: SIGNAL IS "xilinx.com:signal:data:1.0 realxord DATA";
BEGIN
  U0 : complexphasedetector
    PORT MAP (
      ch1agc => ch1agc,
      ch1imag => ch1imag,
      ch1real => ch1real,
      ch2agc => ch2agc,
      ch2imag => ch2imag,
      ch2real => ch2real,
      lag_coef => lag_coef,
      lead_coef => lead_coef,
      reset => reset,
      sweeplmt => sweeplmt,
      swprate => swprate,
      am_disable => am_disable,
      clk => clk,
      gainoutch1 => gainoutch1,
      gainoutch2 => gainoutch2,
      imaglock => imaglock,
      imagout => imagout,
      imagxord => imagxord,
      lag_out => lag_out,
      locked => locked,
      ch1imagout => ch1imagout,
      ch1realout => ch1realout,
      ch2imagout => ch2imagout,
      ch2realout => ch2realout,
      nco_control_out => nco_control_out,
      phase_detect => phase_detect,
      reallock => reallock,
      realout => realout,
      realxord => realxord
    );
END complexphasedetector_0_arch;
