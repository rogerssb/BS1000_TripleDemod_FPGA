-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: Semco:SysGen:complexphasedetector:1.1
-- IP Revision: 333805135

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.complexphasedetector;

ENTITY complexphasedetector_0 IS
  PORT (
    ch1agc : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    ch1imag : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    ch1real : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    ch2agc : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    ch2imag : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    ch2real : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    enmasterswitching : IN STD_LOGIC;
    forcech1 : IN STD_LOGIC;
    lag_coef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    lead_coef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    lockhysterisis : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    lockthreshold : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    overridech : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    sweeplmt : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
    swprate : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    db_range : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    clk : IN STD_LOGIC;
    ch1ismaster : OUT STD_LOGIC;
    gainoutmax : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    gainoutmin : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    imaglock : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
    imagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    imagxord : OUT STD_LOGIC;
    lag_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    locked : OUT STD_LOGIC;
    maximagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    maxrealout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    minimagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    minrealout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    nco_control_out : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
    phase_detect : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    power : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
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
      ch1agc : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
      ch1imag : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      ch1real : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      ch2agc : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
      ch2imag : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      ch2real : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      enmasterswitching : IN STD_LOGIC;
      forcech1 : IN STD_LOGIC;
      lag_coef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      lead_coef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      lockhysterisis : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
      lockthreshold : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
      overridech : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      sweeplmt : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
      swprate : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      db_range : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      clk : IN STD_LOGIC;
      ch1ismaster : OUT STD_LOGIC;
      gainoutmax : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      gainoutmin : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      imaglock : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
      imagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      imagxord : OUT STD_LOGIC;
      lag_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      locked : OUT STD_LOGIC;
      maximagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      maxrealout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      minimagout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      minrealout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      nco_control_out : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
      phase_detect : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      power : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      reallock : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
      realout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      realxord : OUT STD_LOGIC
    );
  END COMPONENT complexphasedetector;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF complexphasedetector_0_arch: ARCHITECTURE IS "complexphasedetector,Vivado 2016.4";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF complexphasedetector_0_arch : ARCHITECTURE IS "complexphasedetector_0,complexphasedetector,{}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ch1agc: SIGNAL IS "xilinx.com:signal:data:1.0 ch1agc DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch1imag: SIGNAL IS "xilinx.com:signal:data:1.0 ch1imag DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch1real: SIGNAL IS "xilinx.com:signal:data:1.0 ch1real DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch2agc: SIGNAL IS "xilinx.com:signal:data:1.0 ch2agc DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch2imag: SIGNAL IS "xilinx.com:signal:data:1.0 ch2imag DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ch2real: SIGNAL IS "xilinx.com:signal:data:1.0 ch2real DATA";
  ATTRIBUTE X_INTERFACE_INFO OF enmasterswitching: SIGNAL IS "xilinx.com:signal:data:1.0 enmasterswitching DATA";
  ATTRIBUTE X_INTERFACE_INFO OF forcech1: SIGNAL IS "xilinx.com:signal:data:1.0 forcech1 DATA";
  ATTRIBUTE X_INTERFACE_INFO OF lag_coef: SIGNAL IS "xilinx.com:signal:data:1.0 lag_coef DATA";
  ATTRIBUTE X_INTERFACE_INFO OF lead_coef: SIGNAL IS "xilinx.com:signal:data:1.0 lead_coef DATA";
  ATTRIBUTE X_INTERFACE_INFO OF lockhysterisis: SIGNAL IS "xilinx.com:signal:data:1.0 lockhysterisis DATA";
  ATTRIBUTE X_INTERFACE_INFO OF lockthreshold: SIGNAL IS "xilinx.com:signal:data:1.0 lockthreshold DATA";
  ATTRIBUTE X_INTERFACE_INFO OF overridech: SIGNAL IS "xilinx.com:signal:data:1.0 overridech DATA";
  ATTRIBUTE X_INTERFACE_INFO OF reset: SIGNAL IS "xilinx.com:signal:reset:1.0 reset RST";
  ATTRIBUTE X_INTERFACE_INFO OF sweeplmt: SIGNAL IS "xilinx.com:signal:data:1.0 sweeplmt DATA";
  ATTRIBUTE X_INTERFACE_INFO OF swprate: SIGNAL IS "xilinx.com:signal:data:1.0 swprate DATA";
  ATTRIBUTE X_INTERFACE_INFO OF db_range: SIGNAL IS "xilinx.com:signal:data:1.0 db_range DATA";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF ch1ismaster: SIGNAL IS "xilinx.com:signal:data:1.0 ch1ismaster DATA";
  ATTRIBUTE X_INTERFACE_INFO OF gainoutmax: SIGNAL IS "xilinx.com:signal:data:1.0 gainoutmax DATA";
  ATTRIBUTE X_INTERFACE_INFO OF gainoutmin: SIGNAL IS "xilinx.com:signal:data:1.0 gainoutmin DATA";
  ATTRIBUTE X_INTERFACE_INFO OF imaglock: SIGNAL IS "xilinx.com:signal:data:1.0 imaglock DATA";
  ATTRIBUTE X_INTERFACE_INFO OF imagout: SIGNAL IS "xilinx.com:signal:data:1.0 imagout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF imagxord: SIGNAL IS "xilinx.com:signal:data:1.0 imagxord DATA";
  ATTRIBUTE X_INTERFACE_INFO OF lag_out: SIGNAL IS "xilinx.com:signal:data:1.0 lag_out DATA";
  ATTRIBUTE X_INTERFACE_INFO OF locked: SIGNAL IS "xilinx.com:signal:data:1.0 locked DATA";
  ATTRIBUTE X_INTERFACE_INFO OF maximagout: SIGNAL IS "xilinx.com:signal:data:1.0 maximagout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF maxrealout: SIGNAL IS "xilinx.com:signal:data:1.0 maxrealout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF minimagout: SIGNAL IS "xilinx.com:signal:data:1.0 minimagout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF minrealout: SIGNAL IS "xilinx.com:signal:data:1.0 minrealout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF nco_control_out: SIGNAL IS "xilinx.com:signal:data:1.0 nco_control_out DATA";
  ATTRIBUTE X_INTERFACE_INFO OF phase_detect: SIGNAL IS "xilinx.com:signal:data:1.0 phase_detect DATA";
  ATTRIBUTE X_INTERFACE_INFO OF power: SIGNAL IS "xilinx.com:signal:data:1.0 power DATA";
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
      enmasterswitching => enmasterswitching,
      forcech1 => forcech1,
      lag_coef => lag_coef,
      lead_coef => lead_coef,
      lockhysterisis => lockhysterisis,
      lockthreshold => lockthreshold,
      overridech => overridech,
      reset => reset,
      sweeplmt => sweeplmt,
      swprate => swprate,
      db_range => db_range,
      clk => clk,
      ch1ismaster => ch1ismaster,
      gainoutmax => gainoutmax,
      gainoutmin => gainoutmin,
      imaglock => imaglock,
      imagout => imagout,
      imagxord => imagxord,
      lag_out => lag_out,
      locked => locked,
      maximagout => maximagout,
      maxrealout => maxrealout,
      minimagout => minimagout,
      minrealout => minrealout,
      nco_control_out => nco_control_out,
      phase_detect => phase_detect,
      power => power,
      reallock => reallock,
      realout => realout,
      realxord => realxord
    );
END complexphasedetector_0_arch;
