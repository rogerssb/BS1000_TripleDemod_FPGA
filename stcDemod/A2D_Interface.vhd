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

Module Name: A2D_Interface.vhd
Description: COnvert LVDS to single ended DDR, then split the DDR data.
   Input clock is 93.3MHz with 186.6MHz data.

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
1-15-17 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
library std;
Library UNISIM;
use UNISIM.vcomponents.all;

ENTITY A2D_Interface IS
   PORT(
      Clk93P,
      Clk93N,
      reset,
      OverRange_p,
      OverRange_n    : IN  std_logic;
      adc_data_in_p,
      adc_data_in_n  : IN  std_logic_vector(7 downto 0);
      a2d_data       : OUT std_logic_vector(15 downto 0);
      OverRange      : OUT std_logic
   );
END A2D_Interface;


ARCHITECTURE rtl OF A2D_Interface IS

   SIGNAL   Ddr,
            DdrDly,
            SpiCapture  : std_logic_vector(7 downto 0);
   SIGNAL   DdrData     : std_logic_vector(15 downto 0);
   SIGNAL   Init,
            SouthDly,
            SpiOutEn    : std_logic;
   SIGNAL   SpiReg      : std_logic_vector(23 downto 0);
   SIGNAL   SpiCount    : natural range 0 to 24;
   SIGNAL   DivBy8      : unsigned(2 downto 0);

begin

/*
   SPI_Process : process(Clk93P)
   begin
      if (rising_edge(Clk93P)) then
         if (reset) then
            SpiCs_n     <= '1';
            SpiOutEn    <= '0';
            Init        <= '1';
            SouthDly    <= '0';
            SpiReg      <= x"000000";
            SpiCapture  <= x"00";
            SpiCount    <= 0;
            DivBy8      <= "000";
         else
            SouthDly <= South;
            if (Init) then        -- used as boot
               Init     <= '0';
               SpiOutEn <= '1';
               SpiReg   <= x"001409";     -- set two's comp
               SpiCount <= 24;
               DivBy8   <= "000";
               SpiCs_n  <= '0';
            elsif (South= '1' and SouthDly = '0' and SpiCount = 0) then
               case "0" & GPIO_DipSw(2 downto 0) is
               when x"0" =>
                  SpiReg   <= x"000D00";   -- outputs normal
               when x"1" =>
                  SpiReg   <= x"000D07";   -- one/zero
               when x"2" =>
                  SpiReg   <= x"000D01";   -- midscale
               when x"3" =>
                  SpiReg   <= x"000D02";   -- all hi
               when x"4" =>
                  SpiReg   <= x"000D03";   -- all low
               when x"5" =>
                  SpiReg   <= x"000D06";   -- pn short
               when others =>
                  SpiReg   <= x"8001FF";   -- read id
               end case;
               SpiOutEn <= '1';
               SpiCount <= 24;
               DivBy8   <= "000";
               SpiCs_n  <= '0';
            elsif (SpiCount > 0) then
               DivBy8 <= DivBy8 + 1;
               if (DivBy8 = 7) then
                  SpiReg <= SpiReg(22 downto 0) & SpiIO;
                  SpiCount <= SpiCount - 1;
                  if (unsigned(GPIO_DipSw(2 downto 0)) > 5) and (SpiCount = 9) then
                     SpiOutEn <= '0';
                  end if;
               end if;
            else
               SpiCs_n     <= '1';
               SpiCapture  <= SpiReg(7 downto 0);
               SpiOutEn    <= '0';
            end if;

         end if;
      end if;
   end process SPI_Process;

   SpiIO    <= SpiReg(23) when (SpiOutEn) else 'Z';
   SpiClk   <= DivBy8(2);
*/
   a2d_data <= DdrData xor x"8000";  -- convert offset binary to two's comp

   IBUFDS_OR : IBUFDS
      generic map (
         DQS_BIAS => "FALSE"  -- (FALSE, TRUE)
      )
      port map (
         I  => OverRange_p,  -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
         IB => OverRange_n,  -- 1-bit input: Diff_n buffer input (connect directly to top-level port)
         O  => OverRange     -- 1-bit output: Buffer output
      );


   DiffPairs : for i in 0 to 7 generate
      IBUFDS_0 : IBUFDS
         generic map (
            DQS_BIAS => "FALSE"  -- (FALSE, TRUE)
         )
         port map (
            I  => adc_data_in_p(i),  -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
            IB => adc_data_in_n(i),  -- 1-bit input: Diff_n buffer input (connect directly to top-level port)
            O  => Ddr(i)             -- 1-bit output: Buffer output
         );

      IDELAYE3_inst : IDELAYE3
      generic map (
         CASCADE => "NONE",          -- Cascade setting (MASTER, NONE, SLAVE_END, SLAVE_MIDDLE)
         DELAY_FORMAT => "COUNT",    -- Units of the DELAY_VALUE (COUNT, TIME)
         DELAY_SRC => "IDATAIN",     -- Delay input (DATAIN, IDATAIN)
         DELAY_TYPE => "FIXED",      -- Set the type of tap delay line (FIXED, VARIABLE, VAR_LOAD)
         DELAY_VALUE => 511,         -- Input delay value setting
         IS_CLK_INVERTED => '0',     -- Optional inversion for CLK
         IS_RST_INVERTED => '0',     -- Optional inversion for RST
         REFCLK_FREQUENCY => 300.0,  -- IDELAYCTRL clock input frequency in MHz (200.0-2667.0)
         SIM_DEVICE => "ULTRASCALE", -- Set the device version (ULTRASCALE, ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
         UPDATE_MODE => "ASYNC"      -- Determines when updates to the delay will take effect (ASYNC, MANUAL, SYNC)
      )
      port map (
         CLK         => Clk93P,      -- 1-bit input: Clock input
         CE          => '0',         -- 1-bit input: Active high enable increment/decrement input
         RST         => reset,       -- 1-bit input: Asynchronous Reset to the DELAY_VALUE
         CASC_IN     => '0',         -- 1-bit input: Cascade delay input from slave ODELAY CASCADE_OUT
         CASC_RETURN => '0',         -- 1-bit input: Cascade delay returning from slave ODELAY DATAOUT
         CNTVALUEIN  => 9x"1FF",     -- 9-bit input: Counter value input
         DATAIN      => '0',         -- 1-bit input: Data input from the logic
         EN_VTC      => '0',         -- 1-bit input: Keep delay constant over VT
         IDATAIN     => Ddr(i),      -- 1-bit input: Data input from the IOBUF
         INC         => '0',         -- 1-bit input: Increment / Decrement tap delay input
         LOAD        => '0',         -- 1-bit input: Load DELAY_VALUE input
         CASC_OUT    => open,        -- 1-bit output: Cascade delay output to ODELAY input cascade
         CNTVALUEOUT => open,        -- 9-bit output: Counter value output
         DATAOUT     => DdrDly(i)    -- 1-bit output: Delayed data output
      );

      IDDRE_0 : IDDRE1
         generic map (
            DDR_CLK_EDGE => "SAME_EDGE_PIPELINED", -- IDDRE1 mode (OPPOSITE_EDGE, SAME_EDGE, SAME_EDGE_PIPELINED)
            IS_CB_INVERTED => '0',           -- Optional inversion for CB
            IS_C_INVERTED => '0'             -- Optional inversion for C
         )
         port map (
            R  => reset,            -- 1-bit input: Active High Async Reset
            D  => DdrDly(i),        -- 1-bit input: Serial Data Input
            C  => Clk93N,           -- 1-bit input: High-speed clock
            CB => Clk93P,           -- 1-bit input: Inversion of High-speed clock C
            Q1 => DdrData(2*i+1),   -- 1-bit output: Registered parallel output 1
            Q2 => DdrData(2*i)      -- 1-bit output: Registered parallel output 2
         );

   end generate;

END rtl;

