-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity dqmtoebno_stub is
  port (
    dqm_in : in std_logic_vector( 17-1 downto 0 );
    clk : in std_logic;
    gateway_out : out std_logic_vector( 32-1 downto 0 )
  );
end dqmtoebno_stub;
architecture structural of dqmtoebno_stub is 
begin
  sysgen_dut : entity xil_defaultlib.dqmtoebno 
  port map (
    dqm_in => dqm_in,
    clk => clk,
    gateway_out => gateway_out
  );
end structural;
