-------------------------------------------------------------------
-- System Generator version 2016.2 VHDL source file.
--
-- Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity pilotdetect_xldelay is
   generic(width        : integer := -1;
           latency      : integer := -1;
           reg_retiming : integer :=  0;
           reset        : integer :=  0);
   port(d       : in std_logic_vector (width-1 downto 0);
        ce      : in std_logic;
        clk     : in std_logic;
        en      : in std_logic;
        rst     : in std_logic;
        q       : out std_logic_vector (width-1 downto 0));

end pilotdetect_xldelay;

architecture behavior of pilotdetect_xldelay is
   component synth_reg
      generic (width       : integer;
               latency     : integer);
      port (i       : in std_logic_vector(width-1 downto 0);
            ce      : in std_logic;
            clr     : in std_logic;
            clk     : in std_logic;
            o       : out std_logic_vector(width-1 downto 0));
   end component; -- end component synth_reg

   component synth_reg_reg
      generic (width       : integer;
               latency     : integer);
      port (i       : in std_logic_vector(width-1 downto 0);
            ce      : in std_logic;
            clr     : in std_logic;
            clk     : in std_logic;
            o       : out std_logic_vector(width-1 downto 0));
   end component;

   signal internal_ce  : std_logic;

begin
   internal_ce  <= ce and en;

   srl_delay: if ((reg_retiming = 0) and (reset = 0)) or (latency < 1) generate
     synth_reg_srl_inst : synth_reg
       generic map (
         width   => width,
         latency => latency)
       port map (
         i   => d,
         ce  => internal_ce,
         clr => '0',
         clk => clk,
         o   => q);
   end generate srl_delay;

   reg_delay: if ((reg_retiming = 1) or (reset = 1)) and (latency >= 1) generate
     synth_reg_reg_inst : synth_reg_reg
       generic map (
         width   => width,
         latency => latency)
       port map (
         i   => d,
         ce  => internal_ce,
         clr => rst,
         clk => clk,
         o   => q);
   end generate reg_delay;
end architecture behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_148444ce42 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((18 - 1) downto 0);
    d1 : in std_logic_vector((18 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_148444ce42;
architecture behavior of sysgen_mux_148444ce42
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((18 - 1) downto 0);
  signal d1_1_27: std_logic_vector((18 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((18 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((18 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((18 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((18 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_16_22_push_front_pop_back_en = '1')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= '1';
  y <= pipe_16_22_back;
end behavior;


library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_negate_333ced04b8 is
  port (
    ip : in std_logic_vector(17 downto 0);
    op : out std_logic_vector(17 downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_negate_333ced04b8;
architecture behavior of sysgen_negate_333ced04b8 is
  signal ip_18_25: signed(17 downto 0);
begin
  ip_18_25 <= std_logic_vector_to_signed(ip);
  op <= "011111111111111111" when (ip_18_25 = "100000000000000000") else signed_to_std_logic_vector(-ip_18_25);
end behavior;


library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_e3fda8f884 is
  port (
    op : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_e3fda8f884;
architecture behavior of sysgen_constant_e3fda8f884
is
begin
  op <= "000000000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_0e16603724 is
  port (
    op : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_0e16603724;
architecture behavior of sysgen_constant_0e16603724
is
begin
  op <= "111111110";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_1b89fab8d7 is
  port (
    a : in std_logic_vector((9 - 1) downto 0);
    b : in std_logic_vector((9 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_1b89fab8d7;
architecture behavior of sysgen_relational_1b89fab8d7
is
  signal a_1_31: unsigned((9 - 1) downto 0);
  signal b_1_34: unsigned((9 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_12_3_rel <= a_1_31 = b_1_34;
  op_mem_37_22_front_din <= result_12_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mcode_block_fcf00fc5a8 is
  port (
    fifo_full : in std_logic_vector((1 - 1) downto 0);
    cnt_eq_512 : in std_logic_vector((1 - 1) downto 0);
    pop : out std_logic_vector((1 - 1) downto 0);
    start_correlator : out std_logic_vector((1 - 1) downto 0);
    count_rst : out std_logic_vector((1 - 1) downto 0);
    write_zeros : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mcode_block_fcf00fc5a8;
architecture behavior of sysgen_mcode_block_fcf00fc5a8
is
  signal fifo_full_2_38: boolean;
  signal cnt_eq_512_2_48: boolean;
  signal current_state_26_27_next: unsigned((2 - 1) downto 0);
  signal current_state_26_27: unsigned((2 - 1) downto 0) := "00";
  signal write_zeros_join_34_1: boolean;
  signal count_rst_join_34_1: boolean;
  signal start_correlator_join_34_1: boolean;
  signal pop_join_34_1: boolean;
  signal next_state_join_52_9: unsigned((2 - 1) downto 0);
  signal next_state_join_58_9: unsigned((2 - 1) downto 0);
  signal next_state_join_50_1: unsigned((2 - 1) downto 0);
begin
  fifo_full_2_38 <= ((fifo_full) = "1");
  cnt_eq_512_2_48 <= ((cnt_eq_512) = "1");
  proc_current_state_26_27: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        current_state_26_27 <= current_state_26_27_next;
      end if;
    end if;
  end process proc_current_state_26_27;
  proc_switch_34_1: process (current_state_26_27)
  is
  begin
    case current_state_26_27 is
      when "00" =>
        write_zeros_join_34_1 <= true;
        count_rst_join_34_1 <= true;
        start_correlator_join_34_1 <= false;
        pop_join_34_1 <= false;
      when "01" =>
        write_zeros_join_34_1 <= true;
        count_rst_join_34_1 <= false;
        start_correlator_join_34_1 <= true;
        pop_join_34_1 <= true;
      when "10" =>
        write_zeros_join_34_1 <= false;
        count_rst_join_34_1 <= false;
        start_correlator_join_34_1 <= false;
        pop_join_34_1 <= true;
      when "11" =>
        write_zeros_join_34_1 <= false;
        count_rst_join_34_1 <= true;
        start_correlator_join_34_1 <= false;
        pop_join_34_1 <= false;
      when others =>
        write_zeros_join_34_1 <= false;
        count_rst_join_34_1 <= false;
        start_correlator_join_34_1 <= false;
        pop_join_34_1 <= false;
    end case;
  end process proc_switch_34_1;
  proc_if_52_9: process (current_state_26_27, fifo_full_2_38)
  is
  begin
    if fifo_full_2_38 then
      next_state_join_52_9 <= std_logic_vector_to_unsigned("01");
    else
      next_state_join_52_9 <= current_state_26_27;
    end if;
  end process proc_if_52_9;
  proc_if_58_9: process (cnt_eq_512_2_48, current_state_26_27)
  is
  begin
    if cnt_eq_512_2_48 then
      next_state_join_58_9 <= std_logic_vector_to_unsigned("11");
    else
      next_state_join_58_9 <= current_state_26_27;
    end if;
  end process proc_if_58_9;
  proc_switch_50_1: process (current_state_26_27, next_state_join_52_9, next_state_join_58_9)
  is
  begin
    case current_state_26_27 is
      when "00" =>
        next_state_join_50_1 <= next_state_join_52_9;
      when "01" =>
        next_state_join_50_1 <= std_logic_vector_to_unsigned("10");
      when "10" =>
        next_state_join_50_1 <= next_state_join_58_9;
      when "11" =>
        next_state_join_50_1 <= std_logic_vector_to_unsigned("00");
      when others =>
        next_state_join_50_1 <= current_state_26_27;
    end case;
  end process proc_switch_50_1;
  current_state_26_27_next <= next_state_join_50_1;
  pop <= boolean_to_vector(pop_join_34_1);
  start_correlator <= boolean_to_vector(start_correlator_join_34_1);
  count_rst <= boolean_to_vector(count_rst_join_34_1);
  write_zeros <= boolean_to_vector(write_zeros_join_34_1);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_6d354cfe17 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((18 - 1) downto 0);
    d1 : in std_logic_vector((18 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_6d354cfe17;
architecture behavior of sysgen_mux_6d354cfe17
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((18 - 1) downto 0);
  signal d1_1_27: std_logic_vector((18 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((18 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_delay_2eaa039003 is
  port (
    d : in std_logic_vector((18 - 1) downto 0);
    q : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_delay_2eaa039003;
architecture behavior of sysgen_delay_2eaa039003
is
  signal d_1_22: std_logic_vector((18 - 1) downto 0);
begin
  d_1_22 <= d;
  q <= d_1_22;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_c51054fc18 is
  port (
    ip : in std_logic_vector((18 - 1) downto 0);
    op : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_c51054fc18;
architecture behavior of sysgen_shift_c51054fc18
is
  signal ip_1_23: signed((18 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000");
  signal op_mem_46_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_46_20_back: signed((18 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal internal_ip_33_3_convert: signed((18 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  internal_ip_33_3_convert <= std_logic_vector_to_signed(convert_type(signed_to_std_logic_vector(ip_1_23), 18, 18, xlSigned, 18, 16, xlSigned, xlRound, xlWrap));
  op_mem_46_20_front_din <= internal_ip_33_3_convert;
  op_mem_46_20_push_front_pop_back_en <= '1';
  op <= signed_to_std_logic_vector(op_mem_46_20_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_c0cd8b3c82 is
  port (
    ip : in std_logic_vector((18 - 1) downto 0);
    op : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_c0cd8b3c82;
architecture behavior of sysgen_shift_c0cd8b3c82
is
  signal ip_1_23: signed((18 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000");
  signal op_mem_46_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_46_20_back: signed((18 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_33_3_convert: signed((18 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_33_3_convert <= s2s_cast(ip_1_23, 18, 18, 16);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_dc7d2f1ef0 is
  port (
    ip : in std_logic_vector((18 - 1) downto 0);
    op : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_dc7d2f1ef0;
architecture behavior of sysgen_shift_dc7d2f1ef0
is
  signal ip_1_23: signed((18 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000");
  signal op_mem_46_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_46_20_back: signed((18 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_33_3_convert: signed((18 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_33_3_convert <= s2s_cast(ip_1_23, 17, 18, 16);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_33_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_delay_8b3a0008e3 is
  port (
    d : in std_logic_vector((18 - 1) downto 0);
    q : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_delay_8b3a0008e3;
architecture behavior of sysgen_delay_8b3a0008e3
is
  signal d_1_22: std_logic_vector((18 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (1 - 1)) of std_logic_vector((18 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    0 => "000000000000000000");
  signal op_mem_20_24_front_din: std_logic_vector((18 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((18 - 1) downto 0);
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d;
  op_mem_20_24_back <= op_mem_20_24(0);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_20_24_push_front_pop_back_en = '1')) then
        op_mem_20_24(0) <= op_mem_20_24_front_din;
      end if;
    end if;
  end process proc_op_mem_20_24;
  op_mem_20_24_front_din <= d_1_22;
  op_mem_20_24_push_front_pop_back_en <= '1';
  q <= op_mem_20_24_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_df52b3f9f9 is
  port (
    in0 : in std_logic_vector((18 - 1) downto 0);
    in1 : in std_logic_vector((18 - 1) downto 0);
    y : out std_logic_vector((36 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_df52b3f9f9;
architecture behavior of sysgen_concat_df52b3f9f9
is
  signal in0_1_23: unsigned((18 - 1) downto 0);
  signal in1_1_27: unsigned((18 - 1) downto 0);
  signal y_2_1_concat: unsigned((36 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_7dc385d728 is
  port (
    op : out std_logic_vector((36 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_7dc385d728;
architecture behavior of sysgen_constant_7dc385d728
is
begin
  op <= "000000000000000000000000000000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_f456e3a573 is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_f456e3a573;
architecture behavior of sysgen_constant_f456e3a573
is
begin
  op <= "0";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_ba5259fe63 is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_ba5259fe63;
architecture behavior of sysgen_constant_ba5259fe63
is
begin
  op <= "1";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_70f34f62d7 is
  port (
    input_port : in std_logic_vector((18 - 1) downto 0);
    output_port : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_70f34f62d7;
architecture behavior of sysgen_reinterpret_70f34f62d7
is
  signal input_port_1_40: signed((18 - 1) downto 0);
  signal output_port_5_5_force: unsigned((18 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_reinterpret_17fd93603d is
  port (
    input_port : in std_logic_vector((18 - 1) downto 0);
    output_port : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_reinterpret_17fd93603d;
architecture behavior of sysgen_reinterpret_17fd93603d
is
  signal input_port_1_40: unsigned((18 - 1) downto 0);
  signal output_port_5_5_force: signed((18 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
--
--  Filename      : xlslice.vhd
--
--  Description   : VHDL description of a block that sets the output to a
--                  specified range of the input bits. The output is always
--                  set to an unsigned type with it's binary point at zero.
--
---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity pilotdetect_xlslice is
    generic (
        new_msb      : integer := 9;           -- position of new msb
        new_lsb      : integer := 1;           -- position of new lsb
        x_width      : integer := 16;          -- Width of x input
        y_width      : integer := 8);          -- Width of y output
    port (
        x : in std_logic_vector (x_width-1 downto 0);
        y : out std_logic_vector (y_width-1 downto 0));
end pilotdetect_xlslice;

architecture behavior of pilotdetect_xlslice is
begin
    y <= x(new_msb downto new_lsb);
end  behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_222d6d85fc is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_222d6d85fc;
architecture behavior of sysgen_concat_222d6d85fc
is
  signal in0_1_23: boolean;
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((9 - 1) downto 0);
begin
  in0_1_23 <= ((in0) = "1");
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(boolean_to_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_57ee5c1d4b is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_57ee5c1d4b;
architecture behavior of sysgen_concat_57ee5c1d4b
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((9 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_2039aba8d7 is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((18 - 1) downto 0);
    d1 : in std_logic_vector((18 - 1) downto 0);
    d2 : in std_logic_vector((18 - 1) downto 0);
    d3 : in std_logic_vector((18 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_2039aba8d7;
architecture behavior of sysgen_mux_2039aba8d7
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((18 - 1) downto 0);
  signal d1_1_27: std_logic_vector((18 - 1) downto 0);
  signal d2_1_30: std_logic_vector((18 - 1) downto 0);
  signal d3_1_33: std_logic_vector((18 - 1) downto 0);
  type array_type_pipe_20_22 is array (0 to (1 - 1)) of std_logic_vector((18 - 1) downto 0);
  signal pipe_20_22: array_type_pipe_20_22 := (
    0 => "000000000000000000");
  signal pipe_20_22_front_din: std_logic_vector((18 - 1) downto 0);
  signal pipe_20_22_back: std_logic_vector((18 - 1) downto 0);
  signal pipe_20_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((18 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  pipe_20_22_back <= pipe_20_22(0);
  proc_pipe_20_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_20_22_push_front_pop_back_en = '1')) then
        pipe_20_22(0) <= pipe_20_22_front_din;
      end if;
    end if;
  end process proc_pipe_20_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  pipe_20_22_front_din <= unregy_join_6_1;
  pipe_20_22_push_front_pop_back_en <= '1';
  y <= pipe_20_22_back;
end behavior;


library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_b834ce322d is
  port (
    in0 : in std_logic_vector((9 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_b834ce322d;
architecture behavior of sysgen_concat_b834ce322d
is
  signal in0_1_23: unsigned((9 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((10 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_65e9092d81 is
  port (
    in0 : in std_logic_vector((2 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_65e9092d81;
architecture behavior of sysgen_concat_65e9092d81
is
  signal in0_1_23: unsigned((2 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((10 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_f84e73127e is
  port (
    in0 : in std_logic_vector((8 - 1) downto 0);
    in1 : in std_logic_vector((2 - 1) downto 0);
    y : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_f84e73127e;
architecture behavior of sysgen_concat_f84e73127e
is
  signal in0_1_23: unsigned((8 - 1) downto 0);
  signal in1_1_27: unsigned((2 - 1) downto 0);
  signal y_2_1_concat: unsigned((10 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_377354b5ea is
  port (
    op : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_377354b5ea;
architecture behavior of sysgen_constant_377354b5ea
is
begin
  op <= "0000000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_b2984b3948 is
  port (
    op : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_b2984b3948;
architecture behavior of sysgen_constant_b2984b3948
is
begin
  op <= "00";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_81939abd89 is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((10 - 1) downto 0);
    d1 : in std_logic_vector((10 - 1) downto 0);
    d2 : in std_logic_vector((10 - 1) downto 0);
    d3 : in std_logic_vector((10 - 1) downto 0);
    y : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_81939abd89;
architecture behavior of sysgen_mux_81939abd89
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((10 - 1) downto 0);
  signal d1_1_27: std_logic_vector((10 - 1) downto 0);
  signal d2_1_30: std_logic_vector((10 - 1) downto 0);
  signal d3_1_33: std_logic_vector((10 - 1) downto 0);
  type array_type_pipe_20_22 is array (0 to (1 - 1)) of std_logic_vector((10 - 1) downto 0);
  signal pipe_20_22: array_type_pipe_20_22 := (
    0 => "0000000000");
  signal pipe_20_22_front_din: std_logic_vector((10 - 1) downto 0);
  signal pipe_20_22_back: std_logic_vector((10 - 1) downto 0);
  signal pipe_20_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((10 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  pipe_20_22_back <= pipe_20_22(0);
  proc_pipe_20_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_20_22_push_front_pop_back_en = '1')) then
        pipe_20_22(0) <= pipe_20_22_front_din;
      end if;
    end if;
  end process proc_pipe_20_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  pipe_20_22_front_din <= unregy_join_6_1;
  pipe_20_22_push_front_pop_back_en <= '1';
  y <= pipe_20_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_2e499fd69d is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((6 - 1) downto 0);
    y : out std_logic_vector((7 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_2e499fd69d;
architecture behavior of sysgen_concat_2e499fd69d
is
  signal in0_1_23: boolean;
  signal in1_1_27: unsigned((6 - 1) downto 0);
  signal y_2_1_concat: unsigned((7 - 1) downto 0);
begin
  in0_1_23 <= ((in0) = "1");
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(boolean_to_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_3e7267ab01 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((6 - 1) downto 0);
    y : out std_logic_vector((7 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_3e7267ab01;
architecture behavior of sysgen_concat_3e7267ab01
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((6 - 1) downto 0);
  signal y_2_1_concat: unsigned((7 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_2b7c6b2428 is
  port (
    in0 : in std_logic_vector((7 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_2b7c6b2428;
architecture behavior of sysgen_concat_2b7c6b2428
is
  signal in0_1_23: unsigned((7 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_a8c933a1a7 is
  port (
    in0 : in std_logic_vector((2 - 1) downto 0);
    in1 : in std_logic_vector((6 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_a8c933a1a7;
architecture behavior of sysgen_concat_a8c933a1a7
is
  signal in0_1_23: unsigned((2 - 1) downto 0);
  signal in1_1_27: unsigned((6 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_b4de442209 is
  port (
    in0 : in std_logic_vector((6 - 1) downto 0);
    in1 : in std_logic_vector((2 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_b4de442209;
architecture behavior of sysgen_concat_b4de442209
is
  signal in0_1_23: unsigned((6 - 1) downto 0);
  signal in1_1_27: unsigned((2 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_78f34e96e5 is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_78f34e96e5;
architecture behavior of sysgen_constant_78f34e96e5
is
begin
  op <= "00000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_4b3c2484ae is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    d2 : in std_logic_vector((8 - 1) downto 0);
    d3 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_4b3c2484ae;
architecture behavior of sysgen_mux_4b3c2484ae
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((8 - 1) downto 0);
  signal d1_1_27: std_logic_vector((8 - 1) downto 0);
  signal d2_1_30: std_logic_vector((8 - 1) downto 0);
  signal d3_1_33: std_logic_vector((8 - 1) downto 0);
  type array_type_pipe_20_22 is array (0 to (1 - 1)) of std_logic_vector((8 - 1) downto 0);
  signal pipe_20_22: array_type_pipe_20_22 := (
    0 => "00000000");
  signal pipe_20_22_front_din: std_logic_vector((8 - 1) downto 0);
  signal pipe_20_22_back: std_logic_vector((8 - 1) downto 0);
  signal pipe_20_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((8 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  pipe_20_22_back <= pipe_20_22(0);
  proc_pipe_20_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_20_22_push_front_pop_back_en = '1')) then
        pipe_20_22(0) <= pipe_20_22_front_din;
      end if;
    end if;
  end process proc_pipe_20_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  pipe_20_22_front_din <= unregy_join_6_1;
  pipe_20_22_push_front_pop_back_en <= '1';
  y <= pipe_20_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_delay_3791cc6a11 is
  port (
    d : in std_logic_vector((1 - 1) downto 0);
    q : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_delay_3791cc6a11;
architecture behavior of sysgen_delay_3791cc6a11
is
  signal d_1_22: std_logic;
  type array_type_op_mem_20_24 is array (0 to (1 - 1)) of std_logic;
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    0 => '0');
  signal op_mem_20_24_front_din: std_logic;
  signal op_mem_20_24_back: std_logic;
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d(0);
  op_mem_20_24_back <= op_mem_20_24(0);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_20_24_push_front_pop_back_en = '1')) then
        op_mem_20_24(0) <= op_mem_20_24_front_din;
      end if;
    end if;
  end process proc_op_mem_20_24;
  op_mem_20_24_front_din <= d_1_22;
  op_mem_20_24_push_front_pop_back_en <= '1';
  q <= std_logic_to_vector(op_mem_20_24_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_1fcd00473b is
  port (
    a : in std_logic_vector((1 - 1) downto 0);
    b : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_1fcd00473b;
architecture behavior of sysgen_expr_1fcd00473b
is
  signal a_1_24: boolean;
  signal b_1_27: boolean;
  signal fulldout_5_2_bit: boolean;
begin
  a_1_24 <= ((a) = "1");
  b_1_27 <= ((b) = "1");
  fulldout_5_2_bit <= ((boolean_to_vector(b_1_27) and boolean_to_vector(a_1_24)) = "1");
  dout <= boolean_to_vector(fulldout_5_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_8a1084dbe1 is
  port (
    a : in std_logic_vector((1 - 1) downto 0);
    b : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_8a1084dbe1;
architecture behavior of sysgen_expr_8a1084dbe1
is
  signal a_1_24: boolean;
  signal b_1_27: boolean;
  signal bit_5_26: boolean;
  signal fulldout_5_2_bitnot: boolean;
begin
  a_1_24 <= ((a) = "1");
  b_1_27 <= ((b) = "1");
  bit_5_26 <= ((boolean_to_vector(b_1_27) and boolean_to_vector(a_1_24)) = "1");
  fulldout_5_2_bitnot <= ((not boolean_to_vector(bit_5_26)) = "1");
  dout <= boolean_to_vector(fulldout_5_2_bitnot);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_c024ed0ea3 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((4 - 1) downto 0);
    y : out std_logic_vector((5 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_c024ed0ea3;
architecture behavior of sysgen_concat_c024ed0ea3
is
  signal in0_1_23: boolean;
  signal in1_1_27: unsigned((4 - 1) downto 0);
  signal y_2_1_concat: unsigned((5 - 1) downto 0);
begin
  in0_1_23 <= ((in0) = "1");
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(boolean_to_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_b172047307 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((4 - 1) downto 0);
    y : out std_logic_vector((5 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_b172047307;
architecture behavior of sysgen_concat_b172047307
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((4 - 1) downto 0);
  signal y_2_1_concat: unsigned((5 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_392cf7ce5c is
  port (
    in0 : in std_logic_vector((5 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((6 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_392cf7ce5c;
architecture behavior of sysgen_concat_392cf7ce5c
is
  signal in0_1_23: unsigned((5 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((6 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_4adcefda0f is
  port (
    in0 : in std_logic_vector((2 - 1) downto 0);
    in1 : in std_logic_vector((4 - 1) downto 0);
    y : out std_logic_vector((6 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_4adcefda0f;
architecture behavior of sysgen_concat_4adcefda0f
is
  signal in0_1_23: unsigned((2 - 1) downto 0);
  signal in1_1_27: unsigned((4 - 1) downto 0);
  signal y_2_1_concat: unsigned((6 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_a152b8b4ce is
  port (
    in0 : in std_logic_vector((4 - 1) downto 0);
    in1 : in std_logic_vector((2 - 1) downto 0);
    y : out std_logic_vector((6 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_a152b8b4ce;
architecture behavior of sysgen_concat_a152b8b4ce
is
  signal in0_1_23: unsigned((4 - 1) downto 0);
  signal in1_1_27: unsigned((2 - 1) downto 0);
  signal y_2_1_concat: unsigned((6 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_7d4cdb5bbb is
  port (
    op : out std_logic_vector((6 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_7d4cdb5bbb;
architecture behavior of sysgen_constant_7d4cdb5bbb
is
begin
  op <= "000000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_bba3bd89f4 is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((6 - 1) downto 0);
    d1 : in std_logic_vector((6 - 1) downto 0);
    d2 : in std_logic_vector((6 - 1) downto 0);
    d3 : in std_logic_vector((6 - 1) downto 0);
    y : out std_logic_vector((6 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_bba3bd89f4;
architecture behavior of sysgen_mux_bba3bd89f4
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((6 - 1) downto 0);
  signal d1_1_27: std_logic_vector((6 - 1) downto 0);
  signal d2_1_30: std_logic_vector((6 - 1) downto 0);
  signal d3_1_33: std_logic_vector((6 - 1) downto 0);
  type array_type_pipe_20_22 is array (0 to (1 - 1)) of std_logic_vector((6 - 1) downto 0);
  signal pipe_20_22: array_type_pipe_20_22 := (
    0 => "000000");
  signal pipe_20_22_front_din: std_logic_vector((6 - 1) downto 0);
  signal pipe_20_22_back: std_logic_vector((6 - 1) downto 0);
  signal pipe_20_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((6 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  pipe_20_22_back <= pipe_20_22(0);
  proc_pipe_20_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_20_22_push_front_pop_back_en = '1')) then
        pipe_20_22(0) <= pipe_20_22_front_din;
      end if;
    end if;
  end process proc_pipe_20_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  pipe_20_22_front_din <= unregy_join_6_1;
  pipe_20_22_push_front_pop_back_en <= '1';
  y <= pipe_20_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_1672b64d97 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((2 - 1) downto 0);
    y : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_1672b64d97;
architecture behavior of sysgen_concat_1672b64d97
is
  signal in0_1_23: boolean;
  signal in1_1_27: unsigned((2 - 1) downto 0);
  signal y_2_1_concat: unsigned((3 - 1) downto 0);
begin
  in0_1_23 <= ((in0) = "1");
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(boolean_to_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_83b84ba15d is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((2 - 1) downto 0);
    y : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_83b84ba15d;
architecture behavior of sysgen_concat_83b84ba15d
is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((2 - 1) downto 0);
  signal y_2_1_concat: unsigned((3 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_6a9e537061 is
  port (
    in0 : in std_logic_vector((3 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_6a9e537061;
architecture behavior of sysgen_concat_6a9e537061
is
  signal in0_1_23: unsigned((3 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((4 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_concat_059a3b2d1a is
  port (
    in0 : in std_logic_vector((2 - 1) downto 0);
    in1 : in std_logic_vector((2 - 1) downto 0);
    y : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_concat_059a3b2d1a;
architecture behavior of sysgen_concat_059a3b2d1a
is
  signal in0_1_23: unsigned((2 - 1) downto 0);
  signal in1_1_27: unsigned((2 - 1) downto 0);
  signal y_2_1_concat: unsigned((4 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_55eaac7d5b is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_55eaac7d5b;
architecture behavior of sysgen_constant_55eaac7d5b
is
begin
  op <= "0000";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_bb4a1d2355 is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((4 - 1) downto 0);
    d1 : in std_logic_vector((4 - 1) downto 0);
    d2 : in std_logic_vector((4 - 1) downto 0);
    d3 : in std_logic_vector((4 - 1) downto 0);
    y : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_bb4a1d2355;
architecture behavior of sysgen_mux_bb4a1d2355
is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((4 - 1) downto 0);
  signal d1_1_27: std_logic_vector((4 - 1) downto 0);
  signal d2_1_30: std_logic_vector((4 - 1) downto 0);
  signal d3_1_33: std_logic_vector((4 - 1) downto 0);
  type array_type_pipe_20_22 is array (0 to (1 - 1)) of std_logic_vector((4 - 1) downto 0);
  signal pipe_20_22: array_type_pipe_20_22 := (
    0 => "0000");
  signal pipe_20_22_front_din: std_logic_vector((4 - 1) downto 0);
  signal pipe_20_22_back: std_logic_vector((4 - 1) downto 0);
  signal pipe_20_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((4 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  pipe_20_22_back <= pipe_20_22(0);
  proc_pipe_20_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (pipe_20_22_push_front_pop_back_en = '1')) then
        pipe_20_22(0) <= pipe_20_22_front_din;
      end if;
    end if;
  end process proc_pipe_20_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  pipe_20_22_front_din <= unregy_join_6_1;
  pipe_20_22_push_front_pop_back_en <= '1';
  y <= pipe_20_22_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_1993043fd7 is
  port (
    op : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_1993043fd7;
architecture behavior of sysgen_constant_1993043fd7
is
begin
  op <= "1111111110";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_ecdb93f3d8 is
  port (
    addr_eq_1023 : in std_logic_vector((1 - 1) downto 0);
    start : in std_logic_vector((1 - 1) downto 0);
    wait_x0 : in std_logic_vector((1 - 1) downto 0);
    write : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_ecdb93f3d8;
architecture behavior of sysgen_expr_ecdb93f3d8
is
  signal addr_eq_1023_1_24: boolean;
  signal start_1_38: boolean;
  signal wait_x0_1_45: boolean;
  signal write_1_54: boolean;
  signal bit_7_25: boolean;
  signal bitnot_7_90: boolean;
  signal bit_7_68: boolean;
  signal fulldout_7_2_bit: boolean;
begin
  addr_eq_1023_1_24 <= ((addr_eq_1023) = "1");
  start_1_38 <= ((start) = "1");
  wait_x0_1_45 <= ((wait_x0) = "1");
  write_1_54 <= ((write) = "1");
  bit_7_25 <= ((boolean_to_vector(write_1_54) and boolean_to_vector(addr_eq_1023_1_24)) = "1");
  bitnot_7_90 <= ((not boolean_to_vector(start_1_38)) = "1");
  bit_7_68 <= ((boolean_to_vector(wait_x0_1_45) and boolean_to_vector(bitnot_7_90)) = "1");
  fulldout_7_2_bit <= ((boolean_to_vector(bit_7_25) or boolean_to_vector(bit_7_68)) = "1");
  dout <= boolean_to_vector(fulldout_7_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_d590143351 is
  port (
    addr_eq_1023 : in std_logic_vector((1 - 1) downto 0);
    start : in std_logic_vector((1 - 1) downto 0);
    wait_x0 : in std_logic_vector((1 - 1) downto 0);
    write : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_d590143351;
architecture behavior of sysgen_expr_d590143351
is
  signal addr_eq_1023_1_24: boolean;
  signal start_1_38: boolean;
  signal wait_x0_1_45: boolean;
  signal write_1_54: boolean;
  signal bitnot_7_45: boolean;
  signal bit_7_25: boolean;
  signal bit_7_76: boolean;
  signal fulldout_7_2_bit: boolean;
begin
  addr_eq_1023_1_24 <= ((addr_eq_1023) = "1");
  start_1_38 <= ((start) = "1");
  wait_x0_1_45 <= ((wait_x0) = "1");
  write_1_54 <= ((write) = "1");
  bitnot_7_45 <= ((not boolean_to_vector(addr_eq_1023_1_24)) = "1");
  bit_7_25 <= ((boolean_to_vector(write_1_54) and boolean_to_vector(bitnot_7_45)) = "1");
  bit_7_76 <= ((boolean_to_vector(wait_x0_1_45) and boolean_to_vector(start_1_38)) = "1");
  fulldout_7_2_bit <= ((boolean_to_vector(bit_7_25) or boolean_to_vector(bit_7_76)) = "1");
  dout <= boolean_to_vector(fulldout_7_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_a77d10299f is
  port (
    a : in std_logic_vector((10 - 1) downto 0);
    b : in std_logic_vector((10 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_a77d10299f;
architecture behavior of sysgen_relational_a77d10299f
is
  signal a_1_31: unsigned((10 - 1) downto 0);
  signal b_1_34: unsigned((10 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_12_3_rel <= a_1_31 = b_1_34;
  op_mem_37_22_front_din <= result_12_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
--
--  Filename      : xlregister.vhd
--
--  Description   : VHDL description of an arbitrary wide register.
--                  Unlike the delay block, an initial value is
--                  specified and is considered valid at the start
--                  of simulation.  The register is only one word
--                  deep.
--
--  Mod. History  : Removed valid bit logic from wrapper.
--                : Changed VHDL to use a bit_vector generic for its
--
---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity pilotdetect_xlregister is

   generic (d_width          : integer := 5;          -- Width of d input
            init_value       : bit_vector := b"00");  -- Binary init value string

   port (d   : in std_logic_vector (d_width-1 downto 0);
         rst : in std_logic_vector(0 downto 0) := "0";
         en  : in std_logic_vector(0 downto 0) := "1";
         ce  : in std_logic;
         clk : in std_logic;
         q   : out std_logic_vector (d_width-1 downto 0));

end pilotdetect_xlregister;

architecture behavior of pilotdetect_xlregister is

   component synth_reg_w_init
      generic (width      : integer;
               init_index : integer;
               init_value : bit_vector;
               latency    : integer);
      port (i   : in std_logic_vector(width-1 downto 0);
            ce  : in std_logic;
            clr : in std_logic;
            clk : in std_logic;
            o   : out std_logic_vector(width-1 downto 0));
   end component; -- end synth_reg_w_init

   -- synthesis translate_off
   signal real_d, real_q           : real;    -- For debugging info ports
   -- synthesis translate_on
   signal internal_clr             : std_logic;
   signal internal_ce              : std_logic;

begin

   internal_clr <= rst(0) and ce;
   internal_ce  <= en(0) and ce;

   -- Synthesizable behavioral model
   synth_reg_inst : synth_reg_w_init
      generic map (width      => d_width,
                   init_index => 2,
                   init_value => init_value,
                   latency    => 1)
      port map (i   => d,
                ce  => internal_ce,
                clr => internal_clr,
                clk => clk,
                o   => q);

end architecture behavior;


library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_shift_5fce716372 is
  port (
    ip : in std_logic_vector((18 - 1) downto 0);
    op : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_shift_5fce716372;
architecture behavior of sysgen_shift_5fce716372
is
  signal ip_1_23: signed((18 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000");
  signal op_mem_46_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_46_20_back: signed((18 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal internal_ip_33_3_convert: signed((18 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  internal_ip_33_3_convert <= std_logic_vector_to_signed(convert_type(signed_to_std_logic_vector(ip_1_23), 18, 17, xlSigned, 18, 16, xlSigned, xlRound, xlWrap));
  op_mem_46_20_front_din <= internal_ip_33_3_convert;
  op_mem_46_20_push_front_pop_back_en <= '1';
  op <= signed_to_std_logic_vector(op_mem_46_20_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mcode_block_7a50437cc6 is
  port (
    a : in std_logic_vector((10 - 1) downto 0);
    a_br : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mcode_block_7a50437cc6;
architecture behavior of sysgen_mcode_block_7a50437cc6
is
  signal a_1_29: unsigned((10 - 1) downto 0);
  signal slice_5_26: unsigned((1 - 1) downto 0);
  signal slice_5_42: unsigned((1 - 1) downto 0);
  signal a_br_5_1_concat: unsigned((2 - 1) downto 0);
  signal slice_7_34: unsigned((1 - 1) downto 0);
  signal a_br_7_4_concat: unsigned((3 - 1) downto 0);
  signal slice_7_34_x_000000: unsigned((1 - 1) downto 0);
  signal a_br_7_4_concat_x_000000: unsigned((4 - 1) downto 0);
  signal slice_7_34_x_000001: unsigned((1 - 1) downto 0);
  signal a_br_7_4_concat_x_000001: unsigned((5 - 1) downto 0);
  signal slice_7_34_x_000002: unsigned((1 - 1) downto 0);
  signal a_br_7_4_concat_x_000002: unsigned((6 - 1) downto 0);
  signal slice_7_34_x_000003: unsigned((1 - 1) downto 0);
  signal a_br_7_4_concat_x_000003: unsigned((7 - 1) downto 0);
  signal slice_7_34_x_000004: unsigned((1 - 1) downto 0);
  signal a_br_7_4_concat_x_000004: unsigned((8 - 1) downto 0);
  signal slice_7_34_x_000005: unsigned((1 - 1) downto 0);
  signal a_br_7_4_concat_x_000005: unsigned((9 - 1) downto 0);
  signal slice_7_34_x_000006: unsigned((1 - 1) downto 0);
  signal a_br_7_4_concat_x_000006: unsigned((10 - 1) downto 0);
begin
  a_1_29 <= std_logic_vector_to_unsigned(a);
  slice_5_26 <= u2u_slice(a_1_29, 0, 0);
  slice_5_42 <= u2u_slice(a_1_29, 1, 1);
  a_br_5_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_5_26) & unsigned_to_std_logic_vector(slice_5_42));
  slice_7_34 <= u2u_slice(a_1_29, 2, 2);
  a_br_7_4_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(a_br_5_1_concat) & unsigned_to_std_logic_vector(slice_7_34));
  slice_7_34_x_000000 <= u2u_slice(a_1_29, 3, 3);
  a_br_7_4_concat_x_000000 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(a_br_7_4_concat) & unsigned_to_std_logic_vector(slice_7_34_x_000000));
  slice_7_34_x_000001 <= u2u_slice(a_1_29, 4, 4);
  a_br_7_4_concat_x_000001 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(a_br_7_4_concat_x_000000) & unsigned_to_std_logic_vector(slice_7_34_x_000001));
  slice_7_34_x_000002 <= u2u_slice(a_1_29, 5, 5);
  a_br_7_4_concat_x_000002 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(a_br_7_4_concat_x_000001) & unsigned_to_std_logic_vector(slice_7_34_x_000002));
  slice_7_34_x_000003 <= u2u_slice(a_1_29, 6, 6);
  a_br_7_4_concat_x_000003 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(a_br_7_4_concat_x_000002) & unsigned_to_std_logic_vector(slice_7_34_x_000003));
  slice_7_34_x_000004 <= u2u_slice(a_1_29, 7, 7);
  a_br_7_4_concat_x_000004 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(a_br_7_4_concat_x_000003) & unsigned_to_std_logic_vector(slice_7_34_x_000004));
  slice_7_34_x_000005 <= u2u_slice(a_1_29, 8, 8);
  a_br_7_4_concat_x_000005 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(a_br_7_4_concat_x_000004) & unsigned_to_std_logic_vector(slice_7_34_x_000005));
  slice_7_34_x_000006 <= u2u_slice(a_1_29, 9, 9);
  a_br_7_4_concat_x_000006 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(a_br_7_4_concat_x_000005) & unsigned_to_std_logic_vector(slice_7_34_x_000006));
  a_br <= unsigned_to_std_logic_vector(a_br_7_4_concat_x_000006);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_constant_734763fe12 is
  port (
    op : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_constant_734763fe12;
architecture behavior of sysgen_constant_734763fe12
is
begin
  op <= "1111111101";
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_c9661e2436 is
  port (
    finish : in std_logic_vector((1 - 1) downto 0);
    start : in std_logic_vector((1 - 1) downto 0);
    wait_x0 : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_c9661e2436;
architecture behavior of sysgen_expr_c9661e2436
is
  signal finish_1_24: boolean;
  signal start_1_32: boolean;
  signal wait_x0_1_39: boolean;
  signal bitnot_6_46: boolean;
  signal bit_6_25: boolean;
  signal bitnot_6_92: boolean;
  signal bit_6_70: boolean;
  signal fulldout_6_2_bit: boolean;
begin
  finish_1_24 <= ((finish) = "1");
  start_1_32 <= ((start) = "1");
  wait_x0_1_39 <= ((wait_x0) = "1");
  bitnot_6_46 <= ((not boolean_to_vector(start_1_32)) = "1");
  bit_6_25 <= ((boolean_to_vector(finish_1_24) and boolean_to_vector(bitnot_6_46)) = "1");
  bitnot_6_92 <= ((not boolean_to_vector(start_1_32)) = "1");
  bit_6_70 <= ((boolean_to_vector(wait_x0_1_39) and boolean_to_vector(bitnot_6_92)) = "1");
  fulldout_6_2_bit <= ((boolean_to_vector(bit_6_25) or boolean_to_vector(bit_6_70)) = "1");
  dout <= boolean_to_vector(fulldout_6_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_ba1420c02b is
  port (
    finish : in std_logic_vector((1 - 1) downto 0);
    start : in std_logic_vector((1 - 1) downto 0);
    start_ifft_1 : in std_logic_vector((1 - 1) downto 0);
    wait_x0 : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_ba1420c02b;
architecture behavior of sysgen_expr_ba1420c02b
is
  signal finish_1_24: boolean;
  signal start_1_32: boolean;
  signal start_ifft_1_1_39: boolean;
  signal wait_x0_1_53: boolean;
  signal bit_7_25: boolean;
  signal bit_7_89: boolean;
  signal bit_7_61: boolean;
  signal fulldout_7_2_bit: boolean;
begin
  finish_1_24 <= ((finish) = "1");
  start_1_32 <= ((start) = "1");
  start_ifft_1_1_39 <= ((start_ifft_1) = "1");
  wait_x0_1_53 <= ((wait_x0) = "1");
  bit_7_25 <= ((boolean_to_vector(finish_1_24) and boolean_to_vector(start_1_32)) = "1");
  bit_7_89 <= ((boolean_to_vector(wait_x0_1_53) and boolean_to_vector(start_1_32)) = "1");
  bit_7_61 <= ((boolean_to_vector(start_ifft_1_1_39) or boolean_to_vector(bit_7_89)) = "1");
  fulldout_7_2_bit <= ((boolean_to_vector(bit_7_25) or boolean_to_vector(bit_7_61)) = "1");
  dout <= boolean_to_vector(fulldout_7_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_a42a5f85e1 is
  port (
    finish : in std_logic_vector((1 - 1) downto 0);
    r_addr_eq_1022 : in std_logic_vector((1 - 1) downto 0);
    read_0 : in std_logic_vector((1 - 1) downto 0);
    start : in std_logic_vector((1 - 1) downto 0);
    wait_x0 : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_a42a5f85e1;
architecture behavior of sysgen_expr_a42a5f85e1
is
  signal finish_1_24: boolean;
  signal r_addr_eq_1022_1_32: boolean;
  signal read_0_1_48: boolean;
  signal start_1_56: boolean;
  signal wait_x0_1_63: boolean;
  signal bit_8_25: boolean;
  signal bitnot_8_89: boolean;
  signal bit_8_68: boolean;
  signal bit_8_122: boolean;
  signal bit_8_68_x_000000: boolean;
  signal fulldout_8_2_bit: boolean;
begin
  finish_1_24 <= ((finish) = "1");
  r_addr_eq_1022_1_32 <= ((r_addr_eq_1022) = "1");
  read_0_1_48 <= ((read_0) = "1");
  start_1_56 <= ((start) = "1");
  wait_x0_1_63 <= ((wait_x0) = "1");
  bit_8_25 <= ((boolean_to_vector(finish_1_24) and boolean_to_vector(start_1_56)) = "1");
  bitnot_8_89 <= ((not boolean_to_vector(r_addr_eq_1022_1_32)) = "1");
  bit_8_68 <= ((boolean_to_vector(read_0_1_48) and boolean_to_vector(bitnot_8_89)) = "1");
  bit_8_122 <= ((boolean_to_vector(start_1_56) and boolean_to_vector(wait_x0_1_63)) = "1");
  bit_8_68_x_000000 <= ((boolean_to_vector(bit_8_68) or boolean_to_vector(bit_8_122)) = "1");
  fulldout_8_2_bit <= ((boolean_to_vector(bit_8_25) or boolean_to_vector(bit_8_68_x_000000)) = "1");
  dout <= boolean_to_vector(fulldout_8_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_b4b1b8224d is
  port (
    r_addr_eq_1022 : in std_logic_vector((1 - 1) downto 0);
    read_0 : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_b4b1b8224d;
architecture behavior of sysgen_expr_b4b1b8224d
is
  signal r_addr_eq_1022_1_24: boolean;
  signal read_0_1_40: boolean;
  signal fulldout_5_2_bit: boolean;
begin
  r_addr_eq_1022_1_24 <= ((r_addr_eq_1022) = "1");
  read_0_1_40 <= ((read_0) = "1");
  fulldout_5_2_bit <= ((boolean_to_vector(r_addr_eq_1022_1_24) and boolean_to_vector(read_0_1_40)) = "1");
  dout <= boolean_to_vector(fulldout_5_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_34a27e207b is
  port (
    r_addr_eq_1022 : in std_logic_vector((1 - 1) downto 0);
    read_1 : in std_logic_vector((1 - 1) downto 0);
    start_ifft_1 : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_34a27e207b;
architecture behavior of sysgen_expr_34a27e207b
is
  signal r_addr_eq_1022_1_24: boolean;
  signal read_1_1_40: boolean;
  signal start_ifft_1_1_48: boolean;
  signal bitnot_6_46: boolean;
  signal bit_6_25: boolean;
  signal fulldout_6_2_bit: boolean;
begin
  r_addr_eq_1022_1_24 <= ((r_addr_eq_1022) = "1");
  read_1_1_40 <= ((read_1) = "1");
  start_ifft_1_1_48 <= ((start_ifft_1) = "1");
  bitnot_6_46 <= ((not boolean_to_vector(r_addr_eq_1022_1_24)) = "1");
  bit_6_25 <= ((boolean_to_vector(read_1_1_40) and boolean_to_vector(bitnot_6_46)) = "1");
  fulldout_6_2_bit <= ((boolean_to_vector(bit_6_25) or boolean_to_vector(start_ifft_1_1_48)) = "1");
  dout <= boolean_to_vector(fulldout_6_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_a0374b5183 is
  port (
    r_addr_eq_1022 : in std_logic_vector((1 - 1) downto 0);
    read_1 : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_a0374b5183;
architecture behavior of sysgen_expr_a0374b5183
is
  signal r_addr_eq_1022_1_24: boolean;
  signal read_1_1_40: boolean;
  signal fulldout_5_2_bit: boolean;
begin
  r_addr_eq_1022_1_24 <= ((r_addr_eq_1022) = "1");
  read_1_1_40 <= ((read_1) = "1");
  fulldout_5_2_bit <= ((boolean_to_vector(read_1_1_40) and boolean_to_vector(r_addr_eq_1022_1_24)) = "1");
  dout <= boolean_to_vector(fulldout_5_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_5ceae8d63b is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_5ceae8d63b;
architecture behavior of sysgen_logical_5ceae8d63b
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 or d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_745d7733b5 is
  port (
    r0 : in std_logic_vector((1 - 1) downto 0);
    r1 : in std_logic_vector((1 - 1) downto 0);
    s : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_745d7733b5;
architecture behavior of sysgen_expr_745d7733b5
is
  signal r0_1_24: boolean;
  signal r1_1_28: boolean;
  signal s_1_32: boolean;
  signal bitnot_6_31: boolean;
  signal bitnot_6_67: boolean;
  signal bit_6_50: boolean;
  signal bit_6_31: boolean;
  signal bitnot_6_112: boolean;
  signal bit_6_112: boolean;
  signal bit_6_89: boolean;
  signal fulldout_6_2_bit: boolean;
begin
  r0_1_24 <= ((r0) = "1");
  r1_1_28 <= ((r1) = "1");
  s_1_32 <= ((s) = "1");
  bitnot_6_31 <= ((not boolean_to_vector(s_1_32)) = "1");
  bitnot_6_67 <= ((not boolean_to_vector(r1_1_28)) = "1");
  bit_6_50 <= ((boolean_to_vector(r0_1_24) and boolean_to_vector(bitnot_6_67)) = "1");
  bit_6_31 <= ((boolean_to_vector(bitnot_6_31) and boolean_to_vector(bit_6_50)) = "1");
  bitnot_6_112 <= ((not boolean_to_vector(r0_1_24)) = "1");
  bit_6_112 <= ((boolean_to_vector(bitnot_6_112) and boolean_to_vector(r1_1_28)) = "1");
  bit_6_89 <= ((boolean_to_vector(s_1_32) and boolean_to_vector(bit_6_112)) = "1");
  fulldout_6_2_bit <= ((boolean_to_vector(bit_6_31) or boolean_to_vector(bit_6_89)) = "1");
  dout <= boolean_to_vector(fulldout_6_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_c938aa3d94 is
  port (
    r0 : in std_logic_vector((1 - 1) downto 0);
    r1 : in std_logic_vector((1 - 1) downto 0);
    s : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_c938aa3d94;
architecture behavior of sysgen_expr_c938aa3d94
is
  signal r0_1_24: boolean;
  signal r1_1_28: boolean;
  signal s_1_32: boolean;
  signal bitnot_6_59: boolean;
  signal bit_6_42: boolean;
  signal bit_6_25: boolean;
  signal bitnot_6_87: boolean;
  signal bitnot_6_112: boolean;
  signal bit_6_112: boolean;
  signal bit_6_87: boolean;
  signal fulldout_6_2_bit: boolean;
begin
  r0_1_24 <= ((r0) = "1");
  r1_1_28 <= ((r1) = "1");
  s_1_32 <= ((s) = "1");
  bitnot_6_59 <= ((not boolean_to_vector(r1_1_28)) = "1");
  bit_6_42 <= ((boolean_to_vector(r0_1_24) and boolean_to_vector(bitnot_6_59)) = "1");
  bit_6_25 <= ((boolean_to_vector(s_1_32) and boolean_to_vector(bit_6_42)) = "1");
  bitnot_6_87 <= ((not boolean_to_vector(s_1_32)) = "1");
  bitnot_6_112 <= ((not boolean_to_vector(r0_1_24)) = "1");
  bit_6_112 <= ((boolean_to_vector(bitnot_6_112) and boolean_to_vector(r1_1_28)) = "1");
  bit_6_87 <= ((boolean_to_vector(bitnot_6_87) and boolean_to_vector(bit_6_112)) = "1");
  fulldout_6_2_bit <= ((boolean_to_vector(bit_6_25) or boolean_to_vector(bit_6_87)) = "1");
  dout <= boolean_to_vector(fulldout_6_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_b6ae4784bd is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_b6ae4784bd;
architecture behavior of sysgen_logical_b6ae4784bd
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mcode_block_66bf1a97d1 is
  port (
    start : in std_logic_vector((1 - 1) downto 0);
    addr_eq_511 : in std_logic_vector((1 - 1) downto 0);
    buf_we : out std_logic_vector((1 - 1) downto 0);
    output_valid : out std_logic_vector((1 - 1) downto 0);
    rst_addr : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mcode_block_66bf1a97d1;
architecture behavior of sysgen_mcode_block_66bf1a97d1
is
  signal start_2_33: boolean;
  signal addr_eq_511_2_39: boolean;
  signal current_state_30_27_next: unsigned((2 - 1) downto 0);
  signal current_state_30_27: unsigned((2 - 1) downto 0) := "00";
  signal rst_addr_join_38_1: boolean;
  signal output_valid_join_38_1: boolean;
  signal buf_we_join_38_1: boolean;
  signal next_state_join_51_9: unsigned((2 - 1) downto 0);
  signal next_state_join_55_9: unsigned((2 - 1) downto 0);
  signal bool_59_12: boolean;
  signal not_61_31: boolean;
  signal bool_61_16: boolean;
  signal next_state_join_59_9: unsigned((2 - 1) downto 0);
  signal next_state_join_49_1: unsigned((2 - 1) downto 0);
begin
  start_2_33 <= ((start) = "1");
  addr_eq_511_2_39 <= ((addr_eq_511) = "1");
  proc_current_state_30_27: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        current_state_30_27 <= current_state_30_27_next;
      end if;
    end if;
  end process proc_current_state_30_27;
  proc_switch_38_1: process (current_state_30_27)
  is
  begin
    case current_state_30_27 is
      when "00" =>
        rst_addr_join_38_1 <= true;
        output_valid_join_38_1 <= false;
        buf_we_join_38_1 <= false;
      when "01" =>
        rst_addr_join_38_1 <= false;
        output_valid_join_38_1 <= true;
        buf_we_join_38_1 <= false;
      when "10" =>
        rst_addr_join_38_1 <= false;
        output_valid_join_38_1 <= false;
        buf_we_join_38_1 <= true;
      when others =>
        rst_addr_join_38_1 <= false;
        output_valid_join_38_1 <= false;
        buf_we_join_38_1 <= false;
    end case;
  end process proc_switch_38_1;
  proc_if_51_9: process (current_state_30_27, start_2_33)
  is
  begin
    if start_2_33 then
      next_state_join_51_9 <= std_logic_vector_to_unsigned("01");
    else
      next_state_join_51_9 <= current_state_30_27;
    end if;
  end process proc_if_51_9;
  proc_if_55_9: process (addr_eq_511_2_39, current_state_30_27)
  is
  begin
    if addr_eq_511_2_39 then
      next_state_join_55_9 <= std_logic_vector_to_unsigned("10");
    else
      next_state_join_55_9 <= current_state_30_27;
    end if;
  end process proc_if_55_9;
  bool_59_12 <= addr_eq_511_2_39 and start_2_33;
  not_61_31 <=  not start_2_33;
  bool_61_16 <= addr_eq_511_2_39 and not_61_31;
  proc_if_59_9: process (bool_59_12, bool_61_16, current_state_30_27)
  is
  begin
    if bool_59_12 then
      next_state_join_59_9 <= std_logic_vector_to_unsigned("01");
    elsif bool_61_16 then
      next_state_join_59_9 <= std_logic_vector_to_unsigned("00");
    else
      next_state_join_59_9 <= current_state_30_27;
    end if;
  end process proc_if_59_9;
  proc_switch_49_1: process (current_state_30_27, next_state_join_51_9, next_state_join_55_9, next_state_join_59_9)
  is
  begin
    case current_state_30_27 is
      when "00" =>
        next_state_join_49_1 <= next_state_join_51_9;
      when "01" =>
        next_state_join_49_1 <= next_state_join_55_9;
      when "10" =>
        next_state_join_49_1 <= next_state_join_59_9;
      when others =>
        next_state_join_49_1 <= current_state_30_27;
    end case;
  end process proc_switch_49_1;
  current_state_30_27_next <= next_state_join_49_1;
  buf_we <= boolean_to_vector(buf_we_join_38_1);
  output_valid <= boolean_to_vector(output_valid_join_38_1);
  rst_addr <= boolean_to_vector(rst_addr_join_38_1);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_cb632989dd is
  port (
    a : in std_logic_vector((18 - 1) downto 0);
    b : in std_logic_vector((18 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_cb632989dd;
architecture behavior of sysgen_relational_cb632989dd
is
  signal a_1_31: unsigned((18 - 1) downto 0);
  signal b_1_34: unsigned((18 - 1) downto 0);
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_18_3_rel <= a_1_31 > b_1_34;
  op <= boolean_to_vector(result_18_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_fb2a2194e2 is
  port (
    cnt_eq_511 : in std_logic_vector((1 - 1) downto 0);
    compare : in std_logic_vector((1 - 1) downto 0);
    valid : in std_logic_vector((1 - 1) downto 0);
    wait_x0 : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_fb2a2194e2;
architecture behavior of sysgen_expr_fb2a2194e2
is
  signal cnt_eq_511_1_24: boolean;
  signal compare_1_36: boolean;
  signal valid_1_45: boolean;
  signal wait_x0_1_52: boolean;
  signal bitnot_7_31: boolean;
  signal bit_7_54: boolean;
  signal bit_7_31: boolean;
  signal bitnot_7_104: boolean;
  signal bit_7_104: boolean;
  signal fulldout_7_2_bit: boolean;
begin
  cnt_eq_511_1_24 <= ((cnt_eq_511) = "1");
  compare_1_36 <= ((compare) = "1");
  valid_1_45 <= ((valid) = "1");
  wait_x0_1_52 <= ((wait_x0) = "1");
  bitnot_7_31 <= ((not boolean_to_vector(valid_1_45)) = "1");
  bit_7_54 <= ((boolean_to_vector(cnt_eq_511_1_24) and boolean_to_vector(compare_1_36)) = "1");
  bit_7_31 <= ((boolean_to_vector(bitnot_7_31) and boolean_to_vector(bit_7_54)) = "1");
  bitnot_7_104 <= ((not boolean_to_vector(valid_1_45)) = "1");
  bit_7_104 <= ((boolean_to_vector(bitnot_7_104) and boolean_to_vector(wait_x0_1_52)) = "1");
  fulldout_7_2_bit <= ((boolean_to_vector(bit_7_31) or boolean_to_vector(bit_7_104)) = "1");
  dout <= boolean_to_vector(fulldout_7_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_expr_18ba54a1e8 is
  port (
    cnt_eq_511 : in std_logic_vector((1 - 1) downto 0);
    compare : in std_logic_vector((1 - 1) downto 0);
    valid : in std_logic_vector((1 - 1) downto 0);
    wait_x0 : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_expr_18ba54a1e8;
architecture behavior of sysgen_expr_18ba54a1e8
is
  signal cnt_eq_511_1_24: boolean;
  signal compare_1_36: boolean;
  signal valid_1_45: boolean;
  signal wait_x0_1_52: boolean;
  signal bit_7_46: boolean;
  signal bit_7_25: boolean;
  signal bitnot_7_102: boolean;
  signal bit_7_102: boolean;
  signal bit_7_147: boolean;
  signal bit_7_102_x_000000: boolean;
  signal fulldout_7_2_bit: boolean;
begin
  cnt_eq_511_1_24 <= ((cnt_eq_511) = "1");
  compare_1_36 <= ((compare) = "1");
  valid_1_45 <= ((valid) = "1");
  wait_x0_1_52 <= ((wait_x0) = "1");
  bit_7_46 <= ((boolean_to_vector(cnt_eq_511_1_24) and boolean_to_vector(compare_1_36)) = "1");
  bit_7_25 <= ((boolean_to_vector(valid_1_45) and boolean_to_vector(bit_7_46)) = "1");
  bitnot_7_102 <= ((not boolean_to_vector(cnt_eq_511_1_24)) = "1");
  bit_7_102 <= ((boolean_to_vector(bitnot_7_102) and boolean_to_vector(compare_1_36)) = "1");
  bit_7_147 <= ((boolean_to_vector(valid_1_45) and boolean_to_vector(wait_x0_1_52)) = "1");
  bit_7_102_x_000000 <= ((boolean_to_vector(bit_7_102) or boolean_to_vector(bit_7_147)) = "1");
  fulldout_7_2_bit <= ((boolean_to_vector(bit_7_25) or boolean_to_vector(bit_7_102_x_000000)) = "1");
  dout <= boolean_to_vector(fulldout_7_2_bit);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mux_92b6e25f44 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((9 - 1) downto 0);
    d1 : in std_logic_vector((9 - 1) downto 0);
    y : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mux_92b6e25f44;
architecture behavior of sysgen_mux_92b6e25f44
is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((9 - 1) downto 0);
  signal d1_1_27: std_logic_vector((9 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((9 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_45adaa63b5 is
  port (
    a : in std_logic_vector((18 - 1) downto 0);
    b : in std_logic_vector((18 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_45adaa63b5;
architecture behavior of sysgen_relational_45adaa63b5
is
  signal a_1_31: unsigned((18 - 1) downto 0);
  signal b_1_34: unsigned((18 - 1) downto 0);
  type array_type_op_mem_37_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_37_22: array_type_op_mem_37_22 := (
    0 => false);
  signal op_mem_37_22_front_din: boolean;
  signal op_mem_37_22_back: boolean;
  signal op_mem_37_22_push_front_pop_back_en: std_logic;
  signal result_16_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_37_22_back <= op_mem_37_22(0);
  proc_op_mem_37_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_37_22_push_front_pop_back_en = '1')) then
        op_mem_37_22(0) <= op_mem_37_22_front_din;
      end if;
    end if;
  end process proc_op_mem_37_22;
  result_16_3_rel <= a_1_31 < b_1_34;
  op_mem_37_22_front_din <= result_16_3_rel;
  op_mem_37_22_push_front_pop_back_en <= '1';
  op <= boolean_to_vector(op_mem_37_22_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_logical_f0792c23bd is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_logical_f0792c23bd;
architecture behavior of sysgen_logical_f0792c23bd
is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal d2_1_30: std_logic;
  type array_type_latency_pipe_5_26 is array (0 to (1 - 1)) of std_logic;
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    0 => '0');
  signal latency_pipe_5_26_front_din: std_logic;
  signal latency_pipe_5_26_back: std_logic;
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  d2_1_30 <= d2(0);
  latency_pipe_5_26_back <= latency_pipe_5_26(0);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (latency_pipe_5_26_push_front_pop_back_en = '1')) then
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 and d1_1_27 and d2_1_30;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= '1';
  y <= std_logic_to_vector(latency_pipe_5_26_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mcode_block_9f7c19dc49 is
  port (
    maxvalid_i : in std_logic_vector((1 - 1) downto 0);
    valid_i : in std_logic_vector((1 - 1) downto 0);
    pilotmag : in std_logic_vector((18 - 1) downto 0);
    delaymag : in std_logic_vector((18 - 1) downto 0);
    pilotfound : out std_logic_vector((1 - 1) downto 0);
    threshold : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mcode_block_9f7c19dc49;
architecture behavior of sysgen_mcode_block_9f7c19dc49
is
  signal maxvalid_i_11_56: boolean;
  signal valid_i_11_68: boolean;
  signal pilotmag_11_77: unsigned((18 - 1) downto 0);
  signal delaymag_11_87: unsigned((18 - 1) downto 0);
  signal good_pilots_13_33_next: unsigned((8 - 1) downto 0);
  signal good_pilots_13_33: unsigned((8 - 1) downto 0) := "00000000";
  signal bad_pilots_14_33_next: unsigned((8 - 1) downto 0);
  signal bad_pilots_14_33: unsigned((8 - 1) downto 0) := "00000000";
  signal bad_pilots_14_33_en: std_logic;
  signal threshold_v_15_34_next: unsigned((18 - 1) downto 0);
  signal threshold_v_15_34: unsigned((18 - 1) downto 0) := "000000000000000000";
  signal twoover26_16_32_next: unsigned((18 - 1) downto 0);
  signal twoover26_16_32: unsigned((18 - 1) downto 0);
  signal twoover26_16_32_reg_i: std_logic_vector((18 - 1) downto 0);
  signal twoover26_16_32_reg_o: std_logic_vector((18 - 1) downto 0);
  signal ignoreinitial_17_35_next: unsigned((8 - 1) downto 0);
  signal ignoreinitial_17_35: unsigned((8 - 1) downto 0) := "00000000";
  signal cast_24_35: unsigned((9 - 1) downto 0);
  signal good_pilots_24_21_addsub: unsigned((9 - 1) downto 0);
  signal rel_21_21: boolean;
  signal bad_pilots_join_21_17: unsigned((8 - 1) downto 0);
  signal good_pilots_join_21_17: unsigned((9 - 1) downto 0);
  signal cast_30_34: unsigned((9 - 1) downto 0);
  signal bad_pilots_30_21_addsub: unsigned((9 - 1) downto 0);
  signal rel_27_21: boolean;
  signal good_pilots_join_27_17: unsigned((8 - 1) downto 0);
  signal bad_pilots_join_27_17: unsigned((9 - 1) downto 0);
  signal good_pilots_join_20_13: unsigned((9 - 1) downto 0);
  signal bad_pilots_join_20_13: unsigned((9 - 1) downto 0);
  signal cast_33_53: signed((21 - 1) downto 0);
  signal cast_33_71: signed((21 - 1) downto 0);
  signal cast_33_108: signed((21 - 1) downto 0);
  signal addsub_33_53: signed((21 - 1) downto 0);
  signal cast_threshold_v_33_13_convert: unsigned((18 - 1) downto 0);
  signal cast_35_33: unsigned((9 - 1) downto 0);
  signal ignoreinitial_35_17_addsub: unsigned((9 - 1) downto 0);
  signal rel_34_17: boolean;
  signal ignoreinitial_join_34_13: unsigned((9 - 1) downto 0);
  signal good_pilots_join_19_9: unsigned((9 - 1) downto 0);
  signal threshold_v_join_19_9: unsigned((18 - 1) downto 0);
  signal ignoreinitial_join_19_9: unsigned((9 - 1) downto 0);
  signal bad_pilots_join_19_9: unsigned((9 - 1) downto 0);
  signal bad_pilots_join_19_9_en: std_logic;
  signal mult_41_52: unsigned((36 - 1) downto 0);
  signal cast_threshold_41_13_convert: unsigned((18 - 1) downto 0);
  signal rel_38_13: boolean;
  signal threshold_join_38_9: unsigned((18 - 1) downto 0);
  signal pilotfound_43_9_rel: boolean;
  signal cast_good_pilots_13_33_next: unsigned((8 - 1) downto 0);
  signal cast_bad_pilots_14_33_next: unsigned((8 - 1) downto 0);
  signal cast_ignoreinitial_17_35_next: unsigned((8 - 1) downto 0);
begin
  maxvalid_i_11_56 <= ((maxvalid_i) = "1");
  valid_i_11_68 <= ((valid_i) = "1");
  pilotmag_11_77 <= std_logic_vector_to_unsigned(pilotmag);
  delaymag_11_87 <= std_logic_vector_to_unsigned(delaymag);
  proc_good_pilots_13_33: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        good_pilots_13_33 <= good_pilots_13_33_next;
      end if;
    end if;
  end process proc_good_pilots_13_33;
  proc_bad_pilots_14_33: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (bad_pilots_14_33_en = '1')) then
        bad_pilots_14_33 <= bad_pilots_14_33_next;
      end if;
    end if;
  end process proc_bad_pilots_14_33;
  proc_threshold_v_15_34: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        threshold_v_15_34 <= threshold_v_15_34_next;
      end if;
    end if;
  end process proc_threshold_v_15_34;
  twoover26_16_32_reg_i <= unsigned_to_std_logic_vector(twoover26_16_32_next);
  twoover26_16_32 <= std_logic_vector_to_unsigned(twoover26_16_32_reg_o);
  twoover26_16_32_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2,
      init_value => b"000010011101100010",
      latency => 1,
      width => 18)
    port map (
      ce => ce,
      clk => clk,
      clr => clr,
      i => twoover26_16_32_reg_i,
      o => twoover26_16_32_reg_o);
  proc_ignoreinitial_17_35: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        ignoreinitial_17_35 <= ignoreinitial_17_35_next;
      end if;
    end if;
  end process proc_ignoreinitial_17_35;
  cast_24_35 <= u2u_cast(good_pilots_13_33, 0, 9, 0);
  good_pilots_24_21_addsub <= cast_24_35 + std_logic_vector_to_unsigned("000000001");
  rel_21_21 <= good_pilots_13_33 >= std_logic_vector_to_unsigned("00000011");
  proc_if_21_17: process (bad_pilots_14_33, good_pilots_13_33, good_pilots_24_21_addsub, rel_21_21)
  is
  begin
    if rel_21_21 then
      bad_pilots_join_21_17 <= std_logic_vector_to_unsigned("00000000");
      good_pilots_join_21_17 <= u2u_cast(good_pilots_13_33, 0, 9, 0);
    else
      bad_pilots_join_21_17 <= bad_pilots_14_33;
      good_pilots_join_21_17 <= good_pilots_24_21_addsub;
    end if;
  end process proc_if_21_17;
  cast_30_34 <= u2u_cast(bad_pilots_14_33, 0, 9, 0);
  bad_pilots_30_21_addsub <= cast_30_34 + std_logic_vector_to_unsigned("000000001");
  rel_27_21 <= bad_pilots_14_33 > std_logic_vector_to_unsigned("01111111");
  proc_if_27_17: process (bad_pilots_14_33, bad_pilots_30_21_addsub, good_pilots_13_33, rel_27_21)
  is
  begin
    if rel_27_21 then
      good_pilots_join_27_17 <= std_logic_vector_to_unsigned("00000000");
      bad_pilots_join_27_17 <= u2u_cast(bad_pilots_14_33, 0, 9, 0);
    else
      good_pilots_join_27_17 <= good_pilots_13_33;
      bad_pilots_join_27_17 <= bad_pilots_30_21_addsub;
    end if;
  end process proc_if_27_17;
  proc_if_20_13: process (bad_pilots_join_21_17, bad_pilots_join_27_17, good_pilots_join_21_17, good_pilots_join_27_17, maxvalid_i_11_56)
  is
  begin
    if maxvalid_i_11_56 then
      good_pilots_join_20_13 <= good_pilots_join_21_17;
      bad_pilots_join_20_13 <= u2u_cast(bad_pilots_join_21_17, 0, 9, 0);
    else
      good_pilots_join_20_13 <= u2u_cast(good_pilots_join_27_17, 0, 9, 0);
      bad_pilots_join_20_13 <= bad_pilots_join_27_17;
    end if;
  end process proc_if_20_13;
  cast_33_53 <= u2s_cast(threshold_v_15_34, 17, 21, 17);
  cast_33_71 <= u2s_cast(pilotmag_11_77, 17, 21, 17);
  cast_33_108 <= u2s_cast(delaymag_11_87, 17, 21, 17);
  addsub_33_53 <= cast_33_53 + cast_33_71 - cast_33_108;
  cast_threshold_v_33_13_convert <= s2u_cast(addsub_33_53, 17, 18, 17);
  cast_35_33 <= u2u_cast(ignoreinitial_17_35, 0, 9, 0);
  ignoreinitial_35_17_addsub <= cast_35_33 + std_logic_vector_to_unsigned("000000001");
  rel_34_17 <= ignoreinitial_17_35 < std_logic_vector_to_unsigned("00110011");
  proc_if_34_13: process (ignoreinitial_17_35, ignoreinitial_35_17_addsub, rel_34_17)
  is
  begin
    if rel_34_17 then
      ignoreinitial_join_34_13 <= ignoreinitial_35_17_addsub;
    else
      ignoreinitial_join_34_13 <= u2u_cast(ignoreinitial_17_35, 0, 9, 0);
    end if;
  end process proc_if_34_13;
  proc_if_19_9: process (bad_pilots_join_20_13, cast_threshold_v_33_13_convert, good_pilots_13_33, good_pilots_join_20_13, ignoreinitial_17_35, ignoreinitial_join_34_13, threshold_v_15_34, valid_i_11_68)
  is
  begin
    if valid_i_11_68 then
      bad_pilots_join_19_9_en <= '1';
    else
      bad_pilots_join_19_9_en <= '0';
    end if;
    bad_pilots_join_19_9 <= bad_pilots_join_20_13;
    if valid_i_11_68 then
      good_pilots_join_19_9 <= good_pilots_join_20_13;
      threshold_v_join_19_9 <= cast_threshold_v_33_13_convert;
      ignoreinitial_join_19_9 <= ignoreinitial_join_34_13;
    else
      good_pilots_join_19_9 <= u2u_cast(good_pilots_13_33, 0, 9, 0);
      threshold_v_join_19_9 <= threshold_v_15_34;
      ignoreinitial_join_19_9 <= u2u_cast(ignoreinitial_17_35, 0, 9, 0);
    end if;
  end process proc_if_19_9;
  mult_41_52 <= (threshold_v_join_19_9 * twoover26_16_32);
  cast_threshold_41_13_convert <= u2u_cast(mult_41_52, 34, 18, 17);
  rel_38_13 <= ignoreinitial_join_19_9 < std_logic_vector_to_unsigned("000110011");
  proc_if_38_9: process (cast_threshold_41_13_convert, rel_38_13)
  is
  begin
    if rel_38_13 then
      threshold_join_38_9 <= std_logic_vector_to_unsigned("010000000000000000");
    else
      threshold_join_38_9 <= cast_threshold_41_13_convert;
    end if;
  end process proc_if_38_9;
  pilotfound_43_9_rel <= good_pilots_join_19_9 >= std_logic_vector_to_unsigned("000000011");
  cast_good_pilots_13_33_next <= u2u_cast(good_pilots_join_19_9, 0, 8, 0);
  good_pilots_13_33_next <= cast_good_pilots_13_33_next;
  cast_bad_pilots_14_33_next <= u2u_cast(bad_pilots_join_19_9, 0, 8, 0);
  bad_pilots_14_33_next <= cast_bad_pilots_14_33_next;
  bad_pilots_14_33_en <= bad_pilots_join_19_9_en;
  threshold_v_15_34_next <= threshold_v_join_19_9;
  twoover26_16_32_next <= twoover26_16_32;
  cast_ignoreinitial_17_35_next <= u2u_cast(ignoreinitial_join_19_9, 0, 8, 0);
  ignoreinitial_17_35_next <= cast_ignoreinitial_17_35_next;
  pilotfound <= boolean_to_vector(pilotfound_43_9_rel);
  threshold <= unsigned_to_std_logic_vector(threshold_join_38_9);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_relational_924fff1a23 is
  port (
    a : in std_logic_vector((18 - 1) downto 0);
    b : in std_logic_vector((18 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_relational_924fff1a23;
architecture behavior of sysgen_relational_924fff1a23
is
  signal a_1_31: unsigned((18 - 1) downto 0);
  signal b_1_34: unsigned((18 - 1) downto 0);
  signal result_22_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_22_3_rel <= a_1_31 >= b_1_34;
  op <= boolean_to_vector(result_22_3_rel);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

-------------------------------------------------------------------
 -- System Generator version 11.1 VHDL source file.
 --
 -- Copyright(C) 2009 by Xilinx, Inc.  All rights reserved.  This
 -- text/file contains proprietary, confidential information of Xilinx,
 -- Inc., is distributed under license from Xilinx, Inc., and may be used,
 -- copied and/or disclosed only pursuant to the terms of a valid license
 -- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
 -- this text/file solely for design, simulation, implementation and
 -- creation of design files limited to Xilinx devices or technologies.
 -- Use with non-Xilinx devices or technologies is expressly prohibited
 -- and immediately terminates your license unless covered by a separate
 -- agreement.
 --
 -- Xilinx is providing this design, code, or information "as is" solely
 -- for use in developing programs and solutions for Xilinx devices.  By
 -- providing this design, code, or information as one possible
 -- implementation of this feature, application or standard, Xilinx is
 -- making no representation that this implementation is free from any
 -- claims of infringement.  You are responsible for obtaining any rights
 -- you may require for your implementation.  Xilinx expressly disclaims
 -- any warranty whatsoever with respect to the adequacy of the
 -- implementation, including but not limited to warranties of
 -- merchantability or fitness for a particular purpose.
 --
 -- Xilinx products are not intended for use in life support appliances,
 -- devices, or systems.  Use in such applications is expressly prohibited.
 --
 -- Any modifications that are made to the source code are done at the user's
 -- sole risk and will be unsupported.
 --
 -- This copyright and support notice must be retained as part of this
 -- text at all times.  (c) Copyright 1995-2009 Xilinx, Inc.  All rights
 -- reserved.
 -------------------------------------------------------------------
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity pilotdetect_xladdsub is
   generic (
     core_name0: string := "";
     a_width: integer := 16;
     a_bin_pt: integer := 4;
     a_arith: integer := xlUnsigned;
     c_in_width: integer := 16;
     c_in_bin_pt: integer := 4;
     c_in_arith: integer := xlUnsigned;
     c_out_width: integer := 16;
     c_out_bin_pt: integer := 4;
     c_out_arith: integer := xlUnsigned;
     b_width: integer := 8;
     b_bin_pt: integer := 2;
     b_arith: integer := xlUnsigned;
     s_width: integer := 17;
     s_bin_pt: integer := 4;
     s_arith: integer := xlUnsigned;
     rst_width: integer := 1;
     rst_bin_pt: integer := 0;
     rst_arith: integer := xlUnsigned;
     en_width: integer := 1;
     en_bin_pt: integer := 0;
     en_arith: integer := xlUnsigned;
     full_s_width: integer := 17;
     full_s_arith: integer := xlUnsigned;
     mode: integer := xlAddMode;
     extra_registers: integer := 0;
     latency: integer := 0;
     quantization: integer := xlTruncate;
     overflow: integer := xlWrap;
     c_latency: integer := 0;
     c_output_width: integer := 17;
     c_has_c_in : integer := 0;
     c_has_c_out : integer := 0
   );
   port (
     a: in std_logic_vector(a_width - 1 downto 0);
     b: in std_logic_vector(b_width - 1 downto 0);
     c_in : in std_logic_vector (0 downto 0) := "0";
     ce: in std_logic;
     clr: in std_logic := '0';
     clk: in std_logic;
     rst: in std_logic_vector(rst_width - 1 downto 0) := "0";
     en: in std_logic_vector(en_width - 1 downto 0) := "1";
     c_out : out std_logic_vector (0 downto 0);
     s: out std_logic_vector(s_width - 1 downto 0)
   );
 end pilotdetect_xladdsub;

 architecture behavior of pilotdetect_xladdsub is
 component synth_reg
 generic (
 width: integer := 16;
 latency: integer := 5
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;

 function format_input(inp: std_logic_vector; old_width, delta, new_arith,
 new_width: integer)
 return std_logic_vector
 is
 variable vec: std_logic_vector(old_width-1 downto 0);
 variable padded_inp: std_logic_vector((old_width + delta)-1 downto 0);
 variable result: std_logic_vector(new_width-1 downto 0);
 begin
 vec := inp;
 if (delta > 0) then
 padded_inp := pad_LSB(vec, old_width+delta);
 result := extend_MSB(padded_inp, new_width, new_arith);
 else
 result := extend_MSB(vec, new_width, new_arith);
 end if;
 return result;
 end;

 constant full_s_bin_pt: integer := fractional_bits(a_bin_pt, b_bin_pt);
 constant full_a_width: integer := full_s_width;
 constant full_b_width: integer := full_s_width;

 signal full_a: std_logic_vector(full_a_width - 1 downto 0);
 signal full_b: std_logic_vector(full_b_width - 1 downto 0);
 signal core_s: std_logic_vector(full_s_width - 1 downto 0);
 signal conv_s: std_logic_vector(s_width - 1 downto 0);
 signal temp_cout : std_logic;
 signal internal_clr: std_logic;
 signal internal_ce: std_logic;
 signal extra_reg_ce: std_logic;
 signal override: std_logic;
 signal logic1: std_logic_vector(0 downto 0);


 component pilotdetect_c_addsub_v12_0_i0
    port (
    a: in std_logic_vector(19 - 1 downto 0);
    clk: in std_logic:= '0';
    ce: in std_logic:= '0';
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(19 - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_addsub_v12_0_i1
    port (
    a: in std_logic_vector(19 - 1 downto 0);
    clk: in std_logic:= '0';
    ce: in std_logic:= '0';
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(19 - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_addsub_v12_0_i2
    port (
    a: in std_logic_vector(11 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(11 - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_addsub_v12_0_i3
    port (
    a: in std_logic_vector(9 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(9 - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_addsub_v12_0_i5
    port (
    a: in std_logic_vector(7 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(7 - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_addsub_v12_0_i6
    port (
    a: in std_logic_vector(5 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(5 - 1 downto 0)
 		  );
 end component;

begin
 internal_clr <= (clr or (rst(0))) and ce;
 internal_ce <= ce and en(0);
 logic1(0) <= '1';
 addsub_process: process (a, b, core_s)
 begin
 full_a <= format_input (a, a_width, b_bin_pt - a_bin_pt, a_arith,
 full_a_width);
 full_b <= format_input (b, b_width, a_bin_pt - b_bin_pt, b_arith,
 full_b_width);
 conv_s <= convert_type (core_s, full_s_width, full_s_bin_pt, full_s_arith,
 s_width, s_bin_pt, s_arith, quantization, overflow);
 end process addsub_process;


 comp0: if ((core_name0 = "pilotdetect_c_addsub_v12_0_i0")) generate
  core_instance0:pilotdetect_c_addsub_v12_0_i0
   port map (
         a => full_a,
         clk => clk,
         ce => internal_ce,
         s => core_s,
         b => full_b
  );
   end generate;

 comp1: if ((core_name0 = "pilotdetect_c_addsub_v12_0_i1")) generate
  core_instance1:pilotdetect_c_addsub_v12_0_i1
   port map (
         a => full_a,
         clk => clk,
         ce => internal_ce,
         s => core_s,
         b => full_b
  );
   end generate;

 comp2: if ((core_name0 = "pilotdetect_c_addsub_v12_0_i2")) generate
  core_instance2:pilotdetect_c_addsub_v12_0_i2
   port map (
         a => full_a,
         s => core_s,
         b => full_b
  );
   end generate;

 comp3: if ((core_name0 = "pilotdetect_c_addsub_v12_0_i3")) generate
  core_instance3:pilotdetect_c_addsub_v12_0_i3
   port map (
         a => full_a,
         s => core_s,
         b => full_b
  );
   end generate;

 comp4: if ((core_name0 = "pilotdetect_c_addsub_v12_0_i5")) generate
  core_instance4:pilotdetect_c_addsub_v12_0_i5
   port map (
         a => full_a,
         s => core_s,
         b => full_b
  );
   end generate;

 comp5: if ((core_name0 = "pilotdetect_c_addsub_v12_0_i6")) generate
  core_instance5:pilotdetect_c_addsub_v12_0_i6
   port map (
         a => full_a,
         s => core_s,
         b => full_b
  );
   end generate;

latency_test: if (extra_registers > 0) generate
 override_test: if (c_latency > 1) generate
 override_pipe: synth_reg
 generic map (
 width => 1,
 latency => c_latency
 )
 port map (
 i => logic1,
 ce => internal_ce,
 clr => internal_clr,
 clk => clk,
 o(0) => override);
 extra_reg_ce <= ce and en(0) and override;
 end generate override_test;
 no_override: if ((c_latency = 0) or (c_latency = 1)) generate
 extra_reg_ce <= ce and en(0);
 end generate no_override;
 extra_reg: synth_reg
 generic map (
 width => s_width,
 latency => extra_registers
 )
 port map (
 i => conv_s,
 ce => extra_reg_ce,
 clr => internal_clr,
 clk => clk,
 o => s
 );
 cout_test: if (c_has_c_out = 1) generate
 c_out_extra_reg: synth_reg
 generic map (
 width => 1,
 latency => extra_registers
 )
 port map (
 i(0) => temp_cout,
 ce => extra_reg_ce,
 clr => internal_clr,
 clk => clk,
 o => c_out
 );
 end generate cout_test;
 end generate;

 latency_s: if ((latency = 0) or (extra_registers = 0)) generate
 s <= conv_s;
 end generate latency_s;
 latency0: if (((latency = 0) or (extra_registers = 0)) and
 (c_has_c_out = 1)) generate
 c_out(0) <= temp_cout;
 end generate latency0;
 tie_dangling_cout: if (c_has_c_out = 0) generate
 c_out <= "0";
 end generate tie_dangling_cout;
 end architecture behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Filename      : xladdsubmode.vhd
 --
 --  Date          : 10/1/99
 --
 --  Description   : VHDL description of a fixed point addsub block.  This
 --                  block has the option to use a core.
 --
 --  Mod. History  : Moved conversion function before extra register
 --                  stage.
 --                : Fixed ouput width bug with behavioral model.
 --                : Removed valid bit logic from wrapper.
 --
 --  Mod. Dates    : 10/10/01
 --                : 10/13/01
 --                : 8/2/02
 --
 ---------------------------------------------------------------------

 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity pilotdetect_xladdsubmode is
   generic (
     core_name0: string := "";
     a_width: integer := 16;             -- Width of a input
     a_bin_pt: integer := 4;             -- Binary point of input a
     a_arith: integer := xlUnsigned;     -- Type of arith of a input
     b_width: integer := 8;              -- Width of b input
     b_bin_pt: integer := 2;             -- Binary point of input b
     b_arith: integer := xlUnsigned;     -- Type of arith of b input
     c_in_width: integer := 16;             -- Width of cin input
     c_in_bin_pt: integer := 4;             -- Binary point of input cin
     c_in_arith: integer := xlUnsigned;     -- Type of arith of cin input
     c_out_width: integer := 16;
     c_out_bin_pt: integer := 4;
     c_out_arith: integer := xlUnsigned;
     s_width: integer := 17;             -- Width of s output
     s_bin_pt: integer := 4;             -- Binary point of output s
     s_arith: integer := xlUnsigned;     -- Type of arith of outputi
     rst_width: integer := 1;            -- Width of input rst
     rst_bin_pt: integer := 0;           -- Binary point of input rst
     rst_arith: integer := xlUnsigned;   -- Type of arith of input rst
     en_width: integer := 1;             -- Width of input en
     en_bin_pt: integer := 0;            -- Binary point of input en
     en_arith: integer := xlUnsigned;    -- Type of arith of input en
     padded_width: integer := 16;        -- padded input width
     full_s_width: integer := 17;        --
     full_s_arith: integer := xlUnsigned;-- Type of arith of output
     mode_width: integer := 1;           -- Width of mode input
     mode_bin_pt: integer := 0;          -- Binary point of input mode
     mode_arith: integer := xlUnsigned;  -- Type of arith of mode input
     extra_registers: integer := 0;      -- = latency - c_latency
     latency: integer := 0;              -- Ouput delay clk cycles
     quantization: integer := xlTruncate;-- xlRound or xlTruncate
     overflow: integer := xlWrap;        -- xlSaturate or xlWrap
     c_a_width: integer := 16;           -- core width
     c_b_width: integer := 8;
     c_a_type: integer := 1;             -- 0 = signed, 1 = unsigned
     c_b_type: integer := 1;             -- 0 = signed, 1 = unsigned
     c_has_sclr: integer := 0;           -- 1 = add/sub registered
     c_has_ce: integer := 0;             -- 1 = add/sub registered
     c_latency: integer := 0;            -- 0 = not pipelined, > 1 if pipelined
     c_output_width: integer := 17;
     c_enable_rlocs: integer := 1;
     c_has_c_in  : integer := 0;
     c_has_c_out : integer := 0);
   port (
     a     : in std_logic_vector(a_width - 1 downto 0);
     b     : in std_logic_vector(b_width - 1 downto 0);
     c_in  : in std_logic_vector (0 downto 0) := (others => '0');
     mode  : in std_logic_vector(mode_width - 1 downto 0) := (others => '0'); -- 0 = add, 1 = sub
     ce    : in std_logic;
     clr   : in std_logic := '0';
     clk   : in std_logic;
     rst   : in std_logic_vector(rst_width - 1 downto 0) := (others => '0');
     en    : in std_logic_vector(en_width - 1 downto 0) := (others => '1');
     c_out : out std_logic_vector (0 downto 0);
     s     : out std_logic_vector(s_width - 1 downto 0)
   );
 end pilotdetect_xladdsubmode;

 architecture behavior of pilotdetect_xladdsubmode is

 component synth_reg
 generic (
 width: integer := 16;
 latency: integer := 5
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;

 -- Pad LSB with zeros and sign or zero extend inputs
 function format_input(inp: std_logic_vector; old_width, delta, new_arith,
 new_width: integer)
 return std_logic_vector
 is
 variable vec: std_logic_vector(old_width-1 downto 0);
 variable padded_inp: std_logic_vector((old_width + delta)-1 downto 0);
 variable result: std_logic_vector(new_width-1 downto 0);
 begin
 vec := inp;

 -- Pad LSB with zeros and sign or zero extend inputs
 if delta > 0 then
 padded_inp := pad_LSB(vec, old_width+delta);
 -- sign or zero extend zero padded input depending on arith type
 result := extend_MSB(padded_inp, new_width, new_arith);
 else
 -- sign or zero extend input depending on arith type
 result := extend_MSB(vec, new_width, new_arith);
 end if;
 return result;
 end;

 constant full_s_bin_pt: integer := fractional_bits(a_bin_pt, b_bin_pt);
 constant full_a_width: integer := full_s_width;
 constant full_b_width: integer := full_s_width;

 signal full_a: std_logic_vector(full_a_width - 1 downto 0);
 signal full_b: std_logic_vector(full_b_width - 1 downto 0);
 signal full_s: std_logic_vector(full_s_width - 1 downto 0);
 signal core_s: std_logic_vector(full_s_width - 1 downto 0);
 signal conv_s: std_logic_vector(s_width - 1 downto 0);
 signal add: std_logic;

 -- synthesis translate_off
 signal real_a, real_b, real_s: real; -- For debugging info ports
 -- synthesis translate_on

 signal internal_clr: std_logic;
 signal internal_ce: std_logic;
 signal extra_reg_ce: std_logic;
 signal override: std_logic;
 signal logic1: std_logic_vector(0 downto 0);
 signal temp_cout : std_logic;


 component pilotdetect_c_addsub_v12_0_i4
    port (
    a: in std_logic_vector(19 - 1 downto 0);
    add: in std_logic;
    clk: in std_logic:= '0';
    ce: in std_logic:= '0';
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(19 - 1 downto 0)
 		  );
 end component;

begin
 internal_clr <= (clr or (rst(0))) and ce;
 internal_ce <= ce and en(0);
 logic1(0) <= '1';

 addsubmode_process: process(a, b, core_s)
 begin
 full_a <= format_input(a, a_width, b_bin_pt - a_bin_pt, a_arith,
 full_a_width);
 full_b <= format_input(b, b_width, a_bin_pt - b_bin_pt, b_arith,
 full_b_width);

 -- Convert to output type and do saturation arith.
 conv_s <= convert_type(core_s, full_s_width, full_s_bin_pt, full_s_arith,
 s_width, s_bin_pt, s_arith, quantization, overflow);

 -- Debugging info for internal full precision variables
 -- synthesis translate_off
 -- real_a <= to_real(full_a, full_s_bin_pt, a_arith);
 -- real_b <= to_real(full_b, full_s_bin_pt, b_arith);
 -- real_s <= to_real(reg_s, full_s_bin_pt, full_s_arith);
 -- synthesis translate_on
 end process addsubmode_process; -- end addsubmode_process

 -- Add pin is oppsite from what the core expects
 add <= not(mode(0));


 comp0: if ((core_name0 = "pilotdetect_c_addsub_v12_0_i4")) generate
  core_instance0:pilotdetect_c_addsub_v12_0_i4
   port map (
         a => full_a,
         add => add,
         clk => clk,
         ce => internal_ce,
         s => core_s,
         b => full_b
  );
   end generate;

latency_test: if (extra_registers > 0) generate
 override_test: if (c_latency > 1) generate
 override_pipe: synth_reg
 generic map (
 width => 1,
 latency => c_latency
 )
 port map (
 i => logic1,
 ce => internal_ce,
 clr => internal_clr,
 clk => clk,
 o(0) => override
 );
 extra_reg_ce <= ce and en(0) and override;
 end generate override_test; -- end override_test

 no_override: if ((c_latency = 0) or (c_latency = 1)) generate
 extra_reg_ce <= ce and en(0);
 end generate no_override; -- end no_override

 extra_reg: synth_reg
 generic map (
 width => s_width,
 latency => extra_registers
 )
 port map (
 i => conv_s,
 ce => extra_reg_ce,
 clr => internal_clr,
 clk => clk,
 o => s
 );

 cout_test : if (c_has_c_out = 1) generate
 c_out_extra_reg: synth_reg
 generic map (
 width => 1,
 latency => extra_registers
 )
 port map (
 i(0) => temp_cout,
 ce => extra_reg_ce,
 clr => internal_clr,
 clk => clk,
 o => c_out
 );
 end generate cout_test;

 end generate latency_test; -- end latency_test

 latency_s: if ((latency = 0) or (extra_registers = 0)) generate
 s <= conv_s;
 end generate latency_s; -- end latency_s

 latency0: if (((latency = 0) or (extra_registers = 0)) and
 (c_has_c_out = 1)) generate
 c_out(0) <= temp_cout;
 end generate latency0; -- end latency0

 tie_dangling_cout: if (c_has_c_out = 0) generate
 c_out <= "0";
 end generate tie_dangling_cout;

 end architecture behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Filename      : xlcounter_rst.vhd
 --
 --  Created       : 1/31/01
 --  Modified      :
 --
 --  Description   : VHDL wrapper for a counter. This wrapper
 --                  uses the Binary Counter CoreGenerator core.
 --
 ---------------------------------------------------------------------


 ---------------------------------------------------------------------
 --
 --  Entity        : xlcounter
 --
 --  Architecture  : behavior
 --
 --  Description   : Top level VHDL description of a counter.
 --
 ---------------------------------------------------------------------

 library IEEE;
 use IEEE.std_logic_1164.all;

entity pilotdetect_xlcounter_free is
   generic (
     core_name0: string := "";
     op_width: integer := 5;
     op_arith: integer := xlSigned
   );
   port (
     ce: in std_logic;
     clr: in std_logic;
     clk: in std_logic;
     op: out std_logic_vector(op_width - 1 downto 0);
     up: in std_logic_vector(0 downto 0) := (others => '0');
     load: in std_logic_vector(0 downto 0) := (others => '0');
     din: in std_logic_vector(op_width - 1 downto 0) := (others => '0');
     en: in std_logic_vector(0 downto 0);
     rst: in std_logic_vector(0 downto 0)
   );
 end pilotdetect_xlcounter_free;

 architecture behavior of pilotdetect_xlcounter_free is


 component pilotdetect_c_counter_binary_v12_0_i0
    port (
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_counter_binary_v12_0_i1
    port (
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_counter_binary_v12_0_i2
    port (
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_counter_binary_v12_0_i3
    port (
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_counter_binary_v12_0_i4
    port (
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_counter_binary_v12_0_i5
    port (
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_counter_binary_v12_0_i6
    port (
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_counter_binary_v12_0_i7
    port (
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_c_counter_binary_v12_0_i8
    port (
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)
 		  );
 end component;

-- synthesis translate_off
   constant zeroVec: std_logic_vector(op_width - 1 downto 0) := (others => '0');
   constant oneVec: std_logic_vector(op_width - 1 downto 0) := (others => '1');
   constant zeroStr: string(1 to op_width) :=
     std_logic_vector_to_bin_string(zeroVec);
   constant oneStr: string(1 to op_width) :=
     std_logic_vector_to_bin_string(oneVec);
 -- synthesis translate_on

   signal core_sinit: std_logic;
   signal core_ce: std_logic;
   signal op_net: std_logic_vector(op_width - 1 downto 0);
 begin
   core_ce <= ce and en(0);
   core_sinit <= (clr or rst(0)) and ce;
   op <= op_net;


 comp0: if ((core_name0 = "pilotdetect_c_counter_binary_v12_0_i0")) generate
  core_instance0:pilotdetect_c_counter_binary_v12_0_i0
   port map (
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  );
   end generate;

 comp1: if ((core_name0 = "pilotdetect_c_counter_binary_v12_0_i1")) generate
  core_instance1:pilotdetect_c_counter_binary_v12_0_i1
   port map (
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  );
   end generate;

 comp2: if ((core_name0 = "pilotdetect_c_counter_binary_v12_0_i2")) generate
  core_instance2:pilotdetect_c_counter_binary_v12_0_i2
   port map (
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  );
   end generate;

 comp3: if ((core_name0 = "pilotdetect_c_counter_binary_v12_0_i3")) generate
  core_instance3:pilotdetect_c_counter_binary_v12_0_i3
   port map (
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  );
   end generate;

 comp4: if ((core_name0 = "pilotdetect_c_counter_binary_v12_0_i4")) generate
  core_instance4:pilotdetect_c_counter_binary_v12_0_i4
   port map (
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  );
   end generate;

 comp5: if ((core_name0 = "pilotdetect_c_counter_binary_v12_0_i5")) generate
  core_instance5:pilotdetect_c_counter_binary_v12_0_i5
   port map (
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  );
   end generate;

 comp6: if ((core_name0 = "pilotdetect_c_counter_binary_v12_0_i6")) generate
  core_instance6:pilotdetect_c_counter_binary_v12_0_i6
   port map (
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  );
   end generate;

 comp7: if ((core_name0 = "pilotdetect_c_counter_binary_v12_0_i7")) generate
  core_instance7:pilotdetect_c_counter_binary_v12_0_i7
   port map (
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  );
   end generate;

 comp8: if ((core_name0 = "pilotdetect_c_counter_binary_v12_0_i8")) generate
  core_instance8:pilotdetect_c_counter_binary_v12_0_i8
   port map (
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
  );
   end generate;

end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Entity        : xldpram
 --
 --  Architecture  : behavior
 --
 --  Description   : Top level HDL wrapper for block dual port ram
 --
 ---------------------------------------------------------------------

 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity pilotdetect_xldpram is
   generic (
     core_name0: string := "";
     c_width_a: integer := 13;
     c_address_width_a: integer := 4;
     c_width_b: integer := 13;
     c_address_width_b: integer := 4;
     c_has_sinita: integer := 0;
     c_has_sinitb: integer := 0;
     latency: integer := 1
   );
   port (
     dina: in std_logic_vector(c_width_a - 1 downto 0);
     addra: in std_logic_vector(c_address_width_a - 1 downto 0);
     wea: in std_logic_vector(0 downto 0);
     a_ce: in std_logic;
     a_clk: in std_logic;
     rsta: in std_logic_vector(0 downto 0) := (others => '0');
     ena: in std_logic_vector(0 downto 0) := (others => '1');
     douta: out std_logic_vector(c_width_a - 1 downto 0);
     dinb: in std_logic_vector(c_width_b - 1 downto 0);
     addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
     web: in std_logic_vector(0 downto 0);
     b_ce: in std_logic;
     b_clk: in std_logic;
     rstb: in std_logic_vector(0 downto 0) := (others => '0');
     enb: in std_logic_vector(0 downto 0) := (others => '1');
     doutb: out std_logic_vector(c_width_b - 1 downto 0)
   );
 end pilotdetect_xldpram;

 architecture behavior of pilotdetect_xldpram is
 component synth_reg
 generic (
 width: integer;
 latency: integer
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;

 signal core_addra: std_logic_vector(c_address_width_a - 1 downto 0);
 signal core_addrb: std_logic_vector(c_address_width_b - 1 downto 0);
 signal core_dina, core_douta, dly_douta:
 std_logic_vector(c_width_a - 1 downto 0);
 signal core_dinb, core_doutb, dly_doutb:
 std_logic_vector(c_width_b - 1 downto 0);
 signal core_wea, core_web: std_logic;
 signal core_a_ce, core_b_ce: std_logic;
 signal sinita, sinitb: std_logic;


 component pilotdetect_blk_mem_gen_v8_3_i0
    port (
addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic_vector(0 downto 0);
      web: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i1
    port (
addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic_vector(0 downto 0);
      web: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i2
    port (
addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic_vector(0 downto 0);
      web: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i3
    port (
addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic_vector(0 downto 0);
      web: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i4
    port (
addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic_vector(0 downto 0);
      web: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i5
    port (
addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic_vector(0 downto 0);
      web: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i6
    port (
addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic_vector(0 downto 0);
      web: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i20
    port (
addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic_vector(0 downto 0);
      web: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0)
 		  );
 end component;

begin
 core_addra <= addra;
 core_dina <= dina;
 douta <= dly_douta;
 core_wea <= wea(0);
 core_a_ce <= a_ce and ena(0);
 sinita <= rsta(0) and a_ce;

 core_addrb <= addrb;
 core_dinb <= dinb;
 doutb <= dly_doutb;
 core_web <= web(0);
 core_b_ce <= b_ce and enb(0);
 sinitb <= rstb(0) and b_ce;


 comp0: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i0")) generate
  core_instance0:pilotdetect_blk_mem_gen_v8_3_i0
   port map (
addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea(0) => core_wea,
        dinb => core_dinb,
        web(0) => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb
  );
   end generate;

 comp1: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i1")) generate
  core_instance1:pilotdetect_blk_mem_gen_v8_3_i1
   port map (
addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea(0) => core_wea,
        dinb => core_dinb,
        web(0) => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb
  );
   end generate;

 comp2: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i2")) generate
  core_instance2:pilotdetect_blk_mem_gen_v8_3_i2
   port map (
addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea(0) => core_wea,
        dinb => core_dinb,
        web(0) => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb
  );
   end generate;

 comp3: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i3")) generate
  core_instance3:pilotdetect_blk_mem_gen_v8_3_i3
   port map (
addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea(0) => core_wea,
        dinb => core_dinb,
        web(0) => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb
  );
   end generate;

 comp4: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i4")) generate
  core_instance4:pilotdetect_blk_mem_gen_v8_3_i4
   port map (
addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea(0) => core_wea,
        dinb => core_dinb,
        web(0) => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb
  );
   end generate;

 comp5: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i5")) generate
  core_instance5:pilotdetect_blk_mem_gen_v8_3_i5
   port map (
addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea(0) => core_wea,
        dinb => core_dinb,
        web(0) => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb
  );
   end generate;

 comp6: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i6")) generate
  core_instance6:pilotdetect_blk_mem_gen_v8_3_i6
   port map (
addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea(0) => core_wea,
        dinb => core_dinb,
        web(0) => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb
  );
   end generate;

 comp7: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i20")) generate
  core_instance7:pilotdetect_blk_mem_gen_v8_3_i20
   port map (
addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea(0) => core_wea,
        dinb => core_dinb,
        web(0) => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb
  );
   end generate;

latency_test: if (latency > 2) generate
 regA: synth_reg
 generic map (
 width => c_width_a,
 latency => latency - 2
 )
 port map (
 i => core_douta,
 ce => core_a_ce,
 clr => '0',
 clk => a_clk,
 o => dly_douta
 );
 regB: synth_reg
 generic map (
 width => c_width_b,
 latency => latency - 2
 )
 port map (
 i => core_doutb,
 ce => core_b_ce,
 clr => '0',
 clk => b_clk,
 o => dly_doutb
 );
 end generate;
 latency1: if (latency <= 2) generate
 dly_douta <= core_douta;
 dly_doutb <= core_doutb;
 end generate;
 end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Entity        : xldpram
 --
 --  Architecture  : behavior
 --
 --  Description   : Top level HDL wrapper for distributed dual port ram
 --
 ---------------------------------------------------------------------

 library IEEE;
 use IEEE.std_logic_1164.all;

entity pilotdetect_xldpram_dist is
   generic (
     core_name0: string := "";
     c_width: integer := 12;
     addr_width: integer := 12;
     c_address_width: integer := 4;
     latency: integer := 1
   );
   port (
     dina: in std_logic_vector(c_width - 1 downto 0);
     addra: in std_logic_vector(addr_width - 1 downto 0);
     wea: in std_logic_vector(0 downto 0);
     ena: in std_logic_vector(0 downto 0) := (others => '1');
     a_ce: in std_logic;
     a_clk: in std_logic;
     douta: out std_logic_vector(c_width - 1 downto 0);
     addrb: in std_logic_vector(addr_width - 1 downto 0);
     enb: in std_logic_vector(0 downto 0) := (others => '1');
     b_ce: in std_logic;
     b_clk: in std_logic;
     doutb: out std_logic_vector(c_width - 1 downto 0)
   );
 end pilotdetect_xldpram_dist;

 architecture behavior of pilotdetect_xldpram_dist is
 component synth_reg is
 generic (
 width: integer := 8;
 latency: integer := 1
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;
 constant num_extra_addr_bits: integer := (c_address_width - addr_width);
 signal core_addra, core_addrb: std_logic_vector(c_address_width - 1 downto 0);
 signal core_data_in, core_douta, core_doutb: std_logic_vector(c_width - 1 downto 0);
 signal reg_douta, reg_doutb: std_logic_vector(c_width - 1 downto 0);
 signal core_we: std_logic_vector(0 downto 0);
 signal core_cea, core_ceb: std_logic;


 component pilotdetect_dist_mem_gen_v8_0_i0
    port (
a: in std_logic_vector(c_address_width - 1 downto 0);
 clk: in std_logic;
 d: in std_logic_vector(c_width - 1 downto 0);
 we: in std_logic;
 dpra: in std_logic_vector(c_address_width - 1 downto 0);
 spo: out std_logic_vector(c_width - 1 downto 0);
 dpo: out std_logic_vector(c_width - 1 downto 0)

 		  );
 end component;

 component pilotdetect_dist_mem_gen_v8_0_i1
    port (
a: in std_logic_vector(c_address_width - 1 downto 0);
 clk: in std_logic;
 d: in std_logic_vector(c_width - 1 downto 0);
 we: in std_logic;
 dpra: in std_logic_vector(c_address_width - 1 downto 0);
 spo: out std_logic_vector(c_width - 1 downto 0);
 dpo: out std_logic_vector(c_width - 1 downto 0)

 		  );
 end component;

begin

 -- Pad the address with zeros at the MSB
 need_to_pad_addr : if num_extra_addr_bits > 0 generate
 core_addra(c_address_width - 1 downto addr_width) <= (others => '0');
 core_addra(addr_width - 1 downto 0) <= addra;
 core_addrb(c_address_width - 1 downto addr_width) <= (others => '0');
 core_addrb(addr_width - 1 downto 0) <= addrb;
 end generate;

 no_need_to_pad_addr: if num_extra_addr_bits = 0 generate
 core_addra <= addra;
 core_addrb <= addrb;
 end generate;
 douta <= reg_douta;
 doutb <= reg_doutb;
 core_cea <= a_ce and ena(0);
 core_ceb <= b_ce and enb(0);
 core_we(0) <= wea(0) and core_cea;
 registered_dpram : if latency > 0 generate
 output_rega: synth_reg
 generic map (
 width => c_width,
 latency => latency
 )
 port map (
 i => core_douta,
 ce => core_cea,
 clr => '0',
 clk => a_clk,
 o => reg_douta
 );
 output_regb: synth_reg
 generic map (
 width => c_width,
 latency => latency
 )
 port map (
 i => core_doutb,
 ce => core_ceb,
 clr => '0',
 clk => b_clk,
 o => reg_doutb
 );
 end generate;
 nonregistered_ram : if latency = 0 generate
 reg_douta <= core_douta;
 reg_doutb <= core_doutb;
 end generate;


 comp0: if ((core_name0 = "pilotdetect_dist_mem_gen_v8_0_i0")) generate
  core_instance0:pilotdetect_dist_mem_gen_v8_0_i0
   port map (
a => core_addra,
 clk => a_clk,
 d => dina,
 we => core_we(0),
 dpra => core_addrb,
 spo => core_douta,
 dpo => core_doutb

  );
   end generate;

 comp1: if ((core_name0 = "pilotdetect_dist_mem_gen_v8_0_i1")) generate
  core_instance1:pilotdetect_dist_mem_gen_v8_0_i1
   port map (
a => core_addra,
 clk => a_clk,
 d => dina,
 we => core_we(0),
 dpra => core_addrb,
 spo => core_douta,
 dpo => core_doutb

  );
   end generate;

end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
 --
 --  Entity        : xlfifogen
 --
 --  Architecture  : behavior
 --
 --  Description   : Top level VHDL description of a fifo block
 --
 ---------------------------------------------------------------------

 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;

entity pilotdetect_xlfifogen_u is
   generic (
     core_name0: string := "";
     data_width: integer := -1;
     data_count_width: integer := -1;
     percent_full_width: integer := -1;
     has_ae : integer := 0;
     has_af : integer := 0;
     extra_registers: integer := 0;
     has_rst : boolean := false
   );
   port (
     din: in std_logic_vector(data_width - 1 downto 0);
     we: in std_logic;
     we_ce: in std_logic;
     re: in std_logic;
     re_ce: in std_logic;
     rst: in std_logic;
     en: in std_logic;
     ce: in std_logic;
     clk: in std_logic;
     empty: out std_logic;
     full: out std_logic;
     percent_full: out std_logic_vector(percent_full_width - 1 downto 0);
     dcount: out std_logic_vector(data_count_width - 1 downto 0);
     ae: out std_logic;
     af: out std_logic;
     dout: out std_logic_vector(data_width - 1 downto 0)
   );
 end pilotdetect_xlfifogen_u;

 architecture behavior of pilotdetect_xlfifogen_u is
 component synth_reg
 generic (
 width: integer := 16;
 latency: integer := 5
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;



 component pilotdetect_fifo_generator_v13_1_i0
    port (
      clk: in std_logic;
      din: in std_logic_vector(data_width - 1 downto 0);
      wr_en: in std_logic;
      rd_en: in std_logic;
      dout: out std_logic_vector(data_width - 1 downto 0);
      full: out std_logic;
      empty: out std_logic;
      data_count: out std_logic_vector(data_count_width - 1 downto 0)
 		  );
 end component;

  signal rd_en: std_logic;
   signal wr_en: std_logic;
   signal srst: std_logic;
   signal core_full: std_logic;
   signal core_dcount: std_logic_vector(data_count_width - 1 downto 0);
   signal srst_vec: std_logic_vector(0 downto 0);
   signal dout_net: std_logic_vector(data_width - 1 downto 0);
   signal count: integer;
   signal empty_net: std_logic;
   signal ae_net: std_logic;
   signal af_net: std_logic;

 begin


 comp0: if ((core_name0 = "pilotdetect_fifo_generator_v13_1_i0")) generate
  core_instance0:pilotdetect_fifo_generator_v13_1_i0
   port map (
        clk => clk,
        din => din,
        wr_en => wr_en,
        rd_en => rd_en,
        full => core_full,
        dout => dout_net,
        empty => empty_net
,
        data_count => core_dcount
  );
   end generate;

-- Process to remap data count from 0000->1111 when fifo is full.
   modify_count: process(core_full, core_dcount) is
   begin
     if core_full = '1' then
       percent_full <= (others => '1');
     else
       percent_full <= core_dcount(data_count_width-1 downto data_count_width-percent_full_width);
     end if;
   end process modify_count;


   --Zero ae/af if these signals are not specified on the core
   terminate_core_ae: if has_ae /= 1 generate
   begin
     ae <= '0';
   end generate terminate_core_ae;
   terminate_core_af: if has_af /= 1 generate
   begin
     af <= '0';
   end generate terminate_core_af;
latency_gt_0: if (extra_registers > 0) generate
   reg: synth_reg
     generic map (
       width => 1,
       latency => extra_registers
     )
     port map (
       i => std_logic_to_vector(rst),
       ce => ce,
       clr => '0',
       clk => clk,
       o => srst_vec
     );
     srst <= srst_vec(0);
 end generate;

 latency_eq_0: if (extra_registers = 0) generate
   srst <= rst and ce;
 end generate;

    process (dout_net, empty_net, core_full, core_dcount, ae_net, af_net, re, we, en, re_ce, we_ce) is
    begin
        dout <= dout_net;
        empty <= empty_net;
        full <= core_full;
        dcount <= core_dcount;
        ae <= ae_net;
        af <= af_net;
        rd_en <= re and en and re_ce;
        wr_en <= we and en and we_ce;
    end process;
 end  behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

-------------------------------------------------------------------
 -- System Generator version 11.1 VHDL source file.
 --
 -- Copyright(C) 2009 by Xilinx, Inc.  All rights reserved.  This
 -- text/file contains proprietary, confidential information of Xilinx,
 -- Inc., is distributed under license from Xilinx, Inc., and may be used,
 -- copied and/or disclosed only pursuant to the terms of a valid license
 -- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
 -- this text/file solely for design, simulation, implementation and
 -- creation of design files limited to Xilinx devices or technologies.
 -- Use with non-Xilinx devices or technologies is expressly prohibited
 -- and immediately terminates your license unless covered by a separate
 -- agreement.
 --
 -- Xilinx is providing this design, code, or information "as is" solely
 -- for use in developing programs and solutions for Xilinx devices.  By
 -- providing this design, code, or information as one possible
 -- implementation of this feature, application or standard, Xilinx is
 -- making no representation that this implementation is free from any
 -- claims of infringement.  You are responsible for obtaining any rights
 -- you may require for your implementation.  Xilinx expressly disclaims
 -- any warranty whatsoever with respect to the adequacy of the
 -- implementation, including but not limited to warranties of
 -- merchantability or fitness for a particular purpose.
 --
 -- Xilinx products are not intended for use in life support appliances,
 -- devices, or systems.  Use in such applications is expressly prohibited.
 --
 -- Any modifications that are made to the source code are done at the user's
 -- sole risk and will be unsupported.
 --
 -- This copyright and support notice must be retained as part of this
 -- text at all times.  (c) Copyright 1995-2009 Xilinx, Inc.  All rights
 -- reserved.
 -------------------------------------------------------------------
 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity pilotdetect_xlmult is
   generic (
     core_name0: string := "";
     a_width: integer := 4;
     a_bin_pt: integer := 2;
     a_arith: integer := xlSigned;
     b_width: integer := 4;
     b_bin_pt: integer := 1;
     b_arith: integer := xlSigned;
     p_width: integer := 8;
     p_bin_pt: integer := 2;
     p_arith: integer := xlSigned;
     rst_width: integer := 1;
     rst_bin_pt: integer := 0;
     rst_arith: integer := xlUnsigned;
     en_width: integer := 1;
     en_bin_pt: integer := 0;
     en_arith: integer := xlUnsigned;
     quantization: integer := xlTruncate;
     overflow: integer := xlWrap;
     extra_registers: integer := 0;
     c_a_width: integer := 7;
     c_b_width: integer := 7;
     c_type: integer := 0;
     c_a_type: integer := 0;
     c_b_type: integer := 0;
     c_pipelined: integer := 1;
     c_baat: integer := 4;
     multsign: integer := xlSigned;
     c_output_width: integer := 16
   );
   port (
     a: in std_logic_vector(a_width - 1 downto 0);
     b: in std_logic_vector(b_width - 1 downto 0);
     ce: in std_logic;
     clr: in std_logic;
     clk: in std_logic;
     core_ce: in std_logic := '0';
     core_clr: in std_logic := '0';
     core_clk: in std_logic := '0';
     rst: in std_logic_vector(rst_width - 1 downto 0);
     en: in std_logic_vector(en_width - 1 downto 0);
     p: out std_logic_vector(p_width - 1 downto 0)
   );
 end  pilotdetect_xlmult;

 architecture behavior of pilotdetect_xlmult is
 component synth_reg
 generic (
 width: integer := 16;
 latency: integer := 5
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;


 component pilotdetect_mult_gen_v12_0_i0
    port (
      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_mult_gen_v12_0_i1
    port (
      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)
 		  );
 end component;

signal tmp_a: std_logic_vector(c_a_width - 1 downto 0);
 signal conv_a: std_logic_vector(c_a_width - 1 downto 0);
 signal tmp_b: std_logic_vector(c_b_width - 1 downto 0);
 signal conv_b: std_logic_vector(c_b_width - 1 downto 0);
 signal tmp_p: std_logic_vector(c_output_width - 1 downto 0);
 signal conv_p: std_logic_vector(p_width - 1 downto 0);
 -- synthesis translate_off
 signal real_a, real_b, real_p: real;
 -- synthesis translate_on
 signal rfd: std_logic;
 signal rdy: std_logic;
 signal nd: std_logic;
 signal internal_ce: std_logic;
 signal internal_clr: std_logic;
 signal internal_core_ce: std_logic;
 begin
 -- synthesis translate_off
 -- synthesis translate_on
 internal_ce <= ce and en(0);
 internal_core_ce <= core_ce and en(0);
 internal_clr <= (clr or rst(0)) and ce;
 nd <= internal_ce;
 input_process: process (a,b)
 begin
 tmp_a <= zero_ext(a, c_a_width);
 tmp_b <= zero_ext(b, c_b_width);
 end process;
 output_process: process (tmp_p)
 begin
 conv_p <= convert_type(tmp_p, c_output_width, a_bin_pt+b_bin_pt, multsign,
 p_width, p_bin_pt, p_arith, quantization, overflow);
 end process;


 comp0: if ((core_name0 = "pilotdetect_mult_gen_v12_0_i0")) generate
  core_instance0:pilotdetect_mult_gen_v12_0_i0
   port map (
        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b
  );
   end generate;

 comp1: if ((core_name0 = "pilotdetect_mult_gen_v12_0_i1")) generate
  core_instance1:pilotdetect_mult_gen_v12_0_i1
   port map (
        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b
  );
   end generate;

latency_gt_0: if (extra_registers > 0) generate
 reg: synth_reg
 generic map (
 width => p_width,
 latency => extra_registers
 )
 port map (
 i => conv_p,
 ce => internal_ce,
 clr => internal_clr,
 clk => clk,
 o => p
 );
 end generate;
 latency_eq_0: if (extra_registers = 0) generate
 p <= conv_p;
 end generate;
 end architecture behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
 use IEEE.std_logic_1164.all;

entity pilotdetect_xlspram is
   generic (
     core_name0: string := "";
     c_width: integer := 12;
     c_address_width: integer := 4;
     latency: integer := 1
     );
   port (
     data_in: in std_logic_vector(c_width - 1 downto 0);
     addr: in std_logic_vector(c_address_width - 1 downto 0);
     we: in std_logic_vector(0 downto 0);
     en: in std_logic_vector(0 downto 0);
     rst: in std_logic_vector(0 downto 0);
     ce: in std_logic;
     clk: in std_logic;
     data_out: out std_logic_vector(c_width - 1 downto 0)
   );
 end pilotdetect_xlspram;

 architecture behavior of pilotdetect_xlspram is
 component synth_reg
 generic (
 width: integer;
 latency: integer
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;
 signal core_data_out, dly_data_out: std_logic_vector(c_width - 1 downto 0);
 signal core_we, core_ce, sinit: std_logic;


 component pilotdetect_blk_mem_gen_v8_3_i7
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      dina: in std_logic_vector(c_width - 1 downto 0);
      wea: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

begin
 data_out <= dly_data_out;
 core_we <= we(0);
 core_ce <= ce and en(0);
 sinit <= rst(0) and ce;


 comp0: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i7")) generate
  core_instance0:pilotdetect_blk_mem_gen_v8_3_i7
   port map (
        addra => addr,
        clka => clk,
        dina => data_in,
        wea(0) => core_we,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

latency_test: if (latency > 1) generate
 reg: synth_reg
 generic map (
 width => c_width,
 latency => latency - 1
 )
 port map (
 i => core_data_out,
 ce => core_ce,
 clr => '0',
 clk => clk,
 o => dly_data_out
 );
 end generate;
 latency_1: if (latency <= 1) generate
 dly_data_out <= core_data_out;
 end generate;
 end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_arith.all;

entity pilotdetect_xlsprom is
   generic (
     core_name0: string := "";
     c_width: integer := 12;             -- equal to data_width
     c_address_width: integer := 4;      -- Block RAM address width (might not
                                         -- be equal to addr_width, but
                                         -- addr_width <= c_address_width)
     latency: integer := 1
   );
   port (
     addr: in std_logic_vector(c_address_width - 1 downto 0);
     en: in std_logic_vector(0 downto 0);
     rst: in std_logic_vector(0 downto 0);
     ce: in std_logic;
     clk: in std_logic;
     data: out std_logic_vector(c_width - 1 downto 0)
   );
 end pilotdetect_xlsprom;

 architecture behavior of pilotdetect_xlsprom is
 component synth_reg
 generic (
 width: integer;
 latency: integer
 );
 port (
 i: in std_logic_vector(width - 1 downto 0);
 ce: in std_logic;
 clr: in std_logic;
 clk: in std_logic;
 o: out std_logic_vector(width - 1 downto 0)
 );
 end component;

 signal core_addr: std_logic_vector(c_address_width - 1 downto 0);
 signal core_data_out: std_logic_vector(c_width - 1 downto 0);
 signal core_ce, sinit: std_logic;


 component pilotdetect_blk_mem_gen_v8_3_i8
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i9
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i10
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i11
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i12
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i13
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i14
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i15
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i16
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i17
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i18
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

 component pilotdetect_blk_mem_gen_v8_3_i19
    port (
      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)
 		  );
 end component;

begin
 core_addr <= addr;
 core_ce <= ce and en(0);
 sinit <= rst(0) and ce;


 comp0: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i8")) generate
  core_instance0:pilotdetect_blk_mem_gen_v8_3_i8
   port map (
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

 comp1: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i9")) generate
  core_instance1:pilotdetect_blk_mem_gen_v8_3_i9
   port map (
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

 comp2: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i10")) generate
  core_instance2:pilotdetect_blk_mem_gen_v8_3_i10
   port map (
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

 comp3: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i11")) generate
  core_instance3:pilotdetect_blk_mem_gen_v8_3_i11
   port map (
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

 comp4: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i12")) generate
  core_instance4:pilotdetect_blk_mem_gen_v8_3_i12
   port map (
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

 comp5: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i13")) generate
  core_instance5:pilotdetect_blk_mem_gen_v8_3_i13
   port map (
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

 comp6: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i14")) generate
  core_instance6:pilotdetect_blk_mem_gen_v8_3_i14
   port map (
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

 comp7: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i15")) generate
  core_instance7:pilotdetect_blk_mem_gen_v8_3_i15
   port map (
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

 comp8: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i16")) generate
  core_instance8:pilotdetect_blk_mem_gen_v8_3_i16
   port map (
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

 comp9: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i17")) generate
  core_instance9:pilotdetect_blk_mem_gen_v8_3_i17
   port map (
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

 comp10: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i18")) generate
  core_instance10:pilotdetect_blk_mem_gen_v8_3_i18
   port map (
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

 comp11: if ((core_name0 = "pilotdetect_blk_mem_gen_v8_3_i19")) generate
  core_instance11:pilotdetect_blk_mem_gen_v8_3_i19
   port map (
        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out
  );
   end generate;

latency_test: if (latency > 1) generate
 reg: synth_reg
 generic map (
 width => c_width,
 latency => latency - 1
 )
 port map (
 i => core_data_out,
 ce => core_ce,
 clr => '0',
 clk => clk,
 o => data
 );
 end generate;

 latency_1: if (latency <= 1) generate
 data <= core_data_out;
 end generate;
 end behavior;

