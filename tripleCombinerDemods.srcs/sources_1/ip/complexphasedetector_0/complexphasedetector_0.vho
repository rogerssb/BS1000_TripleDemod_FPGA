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

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT complexphasedetector_0
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
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : complexphasedetector_0
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
-- INST_TAG_END ------ End INSTANTIATION Template ---------

