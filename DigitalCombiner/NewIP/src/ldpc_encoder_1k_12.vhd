
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ldpc_encoder_pkg_1k_12.all;

entity ldpc_encoder_1k_12 is
  port
  (
    -- input (unencoded) message
    data_in       : in  std_logic;
    data_in_valid : in  std_logic;

    -- output (encoded) message
    data_out       : out std_logic;
    data_out_valid : out std_logic;

    -- control/status
    encode        : in  std_logic;
    sync          : in  std_logic;
    block_sys_in  : out std_logic;
    block_par_in  : out std_logic;
    block_end_in  : out std_logic;
    block_sys_out : out std_logic;
    block_par_out : out std_logic;
    block_end_out : out std_logic;

    rst_n : in  std_logic;
    clk   : in  std_logic;
    clkEn : in  std_logic
  );
end ldpc_encoder_1k_12;


architecture rtl of ldpc_encoder_1k_12 is

  -- signals
  signal block_sys : std_logic;
  signal block_par : std_logic;
  signal block_end : std_logic;

  signal count : natural range 0 to C_LC_k - 1;
  signal shift : circulant_row_t;

begin

--------------------------------------------------------------------------------
-- count bits
--------------------------------------------------------------------------------
  process (rst_n, clk)
  begin
    if (rst_n = '0') then
      block_sys <= '0';
      block_par <= '0';
      block_end <= '0';
      count <= 0;
    elsif (rising_edge(clk)) then
      if(clkEn = '1') then
          -- count systematic information bits
          if (sync = '1') then
            block_sys <= '1';
            block_par <= '0';
            block_end <= '0';
            count <= 0;
            if (data_in_valid = '1') then
              count <= 1;
            end if;
          elsif (block_sys = '1') then
            if (data_in_valid = '1') then
              if (count < C_LC_k - 1) then
                count <= count + 1;
              else
                count <= 0;
                block_sys <= '0';
                block_par <= '1';
              end if;
            end if;
          -- count parity bits
          elsif (block_par = '1') then
            if (encode = '1' or data_in_valid = '1') then
              if (count < C_LC_n - C_LC_k - 1) then
                count <= count + 1;
              else
                count <= 0;
                block_par <= '0';
                block_end <= '1';
              end if;
            end if;
          elsif (block_end = '1') then
            block_sys <= '1';
            block_end <= '0';
          else
            block_sys <= '1';
            block_par <= '0';
            block_end <= '0';
          end if;
      end if;
    end if;
  end process;

  block_sys_in <= block_sys or sync;
  block_par_in <= block_par;
  block_end_in <= block_end;

--------------------------------------------------------------------------------
-- generate parity
--------------------------------------------------------------------------------
  process (rst_n, clk)
    variable row        : natural range 0 to C_CIRC_ROWS - 1;
    variable shift_xor  : circulant_row_t;
  begin
    if (rst_n = '0') then
      shift <= (others => '0');
    elsif (rising_edge(clk)) then
      if(clkEn = '1') then
          -- compute next multiply
          row := (count / C_LC_m) mod C_CIRC_ROWS;
          shift_xor := shift;
          if (sync = '1') then
            shift_xor := (others => '0');
          end if;
          if (data_in = '1') then
            shift_xor := shift_xor xor C_G(row);
          end if;
          -- shift and accumulate parity
          if (sync = '1' or block_sys = '1') then
            if (data_in_valid = '1') then
              shift <= shift_xor(1 to shift'right) & '0';
              for shift_reg in 0 to C_SHIFT_REGS - 1 loop
                shift(shift_reg * C_LC_m + C_LC_m - 1) <= shift_xor(shift_reg * C_LC_m);
              end loop;
            end if;
          -- shift out parity and clear shift register
          else
            shift <= shift(1 to shift'right) & '0';
          end if;
      end if;
    end if;
  end process;

--------------------------------------------------------------------------------
-- output data
--------------------------------------------------------------------------------
  process (rst_n, clk)
  begin
    if (rst_n = '0') then
      data_out <= '0';
      data_out_valid <= '0';
      block_sys_out <= '0';
      block_par_out <= '0';
      block_end_out <= '0';
    elsif (rising_edge(clk)) then
      if(clkEn = '1') then
          block_sys_out <= '0';
          block_par_out <= '0';
          block_end_out <= '0';
          -- output systematic information bits
          if (sync = '1' or block_sys = '1') then
            data_out <= data_in;
            data_out_valid <= data_in_valid;
            block_sys_out <= '1';
          -- output parity bits
          elsif (block_par = '1') then
            if (encode = '0') then
              data_out <= data_in;
              data_out_valid <= data_in_valid;
            else
              data_out <= shift(0);
              data_out_valid <= '1';
            end if;
            block_par_out <= '1';
          elsif (block_end = '1') then
            data_out <= '0';
            data_out_valid <= '0';
            block_end_out <= '1';
          else
            data_out <= '0';
            data_out_valid <= '0';
          end if;
      end if;
    end if;
  end process;

end rtl;
