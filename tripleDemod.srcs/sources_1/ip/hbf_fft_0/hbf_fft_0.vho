-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: SEMCO:SysGen:hbf_fft:1.0
-- IP Revision: 199734469

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT hbf_fft_0
  PORT (
    datain : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    nfft : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    nfftwe : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rstfifo : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    scalesch : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    spectinv : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    startn : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    window : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    clk : IN STD_LOGIC;
    fifofull_i : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    fifofull_q : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    idata : OUT STD_LOGIC_VECTOR(18 DOWNTO 0);
    n : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
    qdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    fft_axis_tuser_xk_index_d : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    fft_mag_finished : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    fft_mag_m_axis_data_tlast : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    fft_mag_m_axis_dout_tvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    fft_mag_m_axis_tdata_real : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    index_k : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
    ce2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : hbf_fft_0
  PORT MAP (
    datain => datain,
    nfft => nfft,
    nfftwe => nfftwe,
    rstfifo => rstfifo,
    scalesch => scalesch,
    spectinv => spectinv,
    startn => startn,
    window => window,
    clk => clk,
    fifofull_i => fifofull_i,
    fifofull_q => fifofull_q,
    idata => idata,
    n => n,
    qdata => qdata,
    fft_axis_tuser_xk_index_d => fft_axis_tuser_xk_index_d,
    fft_mag_finished => fft_mag_finished,
    fft_mag_m_axis_data_tlast => fft_mag_m_axis_data_tlast,
    fft_mag_m_axis_dout_tvalid => fft_mag_m_axis_dout_tvalid,
    fft_mag_m_axis_tdata_real => fft_mag_m_axis_tdata_real,
    index_k => index_k,
    ce2 => ce2
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

