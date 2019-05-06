-- (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: Semco:SysGen:pilotdetect:K7_1.0
-- IP Revision: 111341748

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY xil_defaultlib;
USE xil_defaultlib.pilotdetect;

ENTITY pilotDetection IS
  PORT (
    imagdata : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    realdata : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    validpilot : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    conj_imag : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    clk : IN STD_LOGIC;
    pilot_mag : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    pilot_found : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    pilot_indexes : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    pilot_pulse : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    imagpilotout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    realpilotout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    validpilotout : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END pilotDetection;

ARCHITECTURE pilotDetection_arch OF pilotDetection IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF pilotDetection_arch: ARCHITECTURE IS "yes";
  COMPONENT pilotdetect IS
    PORT (
      imagdata : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      realdata : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      validpilot : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      conj_imag : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      clk : IN STD_LOGIC;
      pilot_mag : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      pilot_found : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      pilot_indexes : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      pilot_pulse : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      imagpilotout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      realpilotout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      validpilotout : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
  END COMPONENT pilotdetect;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF imagdata: SIGNAL IS "xilinx.com:signal:data:1.0 imagdata DATA";
  ATTRIBUTE X_INTERFACE_INFO OF realdata: SIGNAL IS "xilinx.com:signal:data:1.0 realdata DATA";
  ATTRIBUTE X_INTERFACE_INFO OF validpilot: SIGNAL IS "xilinx.com:signal:data:1.0 validpilot DATA";
  ATTRIBUTE X_INTERFACE_INFO OF conj_imag: SIGNAL IS "xilinx.com:signal:data:1.0 conj_imag DATA";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF pilot_mag: SIGNAL IS "xilinx.com:signal:data:1.0 pilot_mag DATA";
  ATTRIBUTE X_INTERFACE_INFO OF pilot_found: SIGNAL IS "xilinx.com:signal:data:1.0 pilot_found DATA";
  ATTRIBUTE X_INTERFACE_INFO OF pilot_indexes: SIGNAL IS "xilinx.com:signal:data:1.0 pilot_indexes DATA";
  ATTRIBUTE X_INTERFACE_INFO OF pilot_pulse: SIGNAL IS "xilinx.com:signal:data:1.0 pilot_pulse DATA";
  ATTRIBUTE X_INTERFACE_INFO OF imagpilotout: SIGNAL IS "xilinx.com:signal:data:1.0 imagpilotout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF realpilotout: SIGNAL IS "xilinx.com:signal:data:1.0 realpilotout DATA";
  ATTRIBUTE X_INTERFACE_INFO OF validpilotout: SIGNAL IS "xilinx.com:signal:data:1.0 validpilotout DATA";
BEGIN
  U0 : pilotdetect
    PORT MAP (
      imagdata => imagdata,
      realdata => realdata,
      validpilot => validpilot,
      conj_imag => conj_imag,
      clk => clk,
      pilot_mag => pilot_mag,
      pilot_found => pilot_found,
      pilot_indexes => pilot_indexes,
      pilot_pulse => pilot_pulse,
      imagpilotout => imagpilotout,
      realpilotout => realpilotout,
      validpilotout => validpilotout
    );
END pilotDetection_arch;
