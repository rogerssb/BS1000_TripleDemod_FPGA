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

Module Name: ClkAndDataMux.vhd
Description: 24 pairs of clock and data can be switched to any or all of 16
   clock and data outputs. Each pair is independent of the others. The data
   is latched on the input side before routing through the crosspoint, then
   again on the output pin.

   Control is handle via a UART direct from the beagle bone.

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
3-6-23 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
USE work.semco_pkg.all;

ENTITY ClkAndDataMux IS
      GENERIC(
         INPUT_PAIRS    : positive := 24;
         IN_WIDTH       : positive := 5;
         OUTPUT_PAIRS   : positive := 16
      );
   PORT(
      ClkIn_p,
      ClkIn_n,
      DataIn_p,
      DataIn_n       : IN  std_logic_vector(INPUT_PAIRS-1 downto 0);
      Clk93_p,
      Clk93_n,
      Rxd            : IN  std_logic;
      Txd            : OUT std_logic;
      ClkOut,
      DataOut        : OUT std_logic_vector(OUTPUT_PAIRS-1 downto 0)
   );
END ClkAndDataMux;


ARCHITECTURE rtl OF ClkAndDataMux IS

   Component UartControl
      GENERIC (
         REVISION_NUM   : string;
         FIRMWARE_VER   : string;
         OUTPUT_PAIRS   : positive := 16;
         IN_WIDTH       : positive := 5
      );
      PORT(
         clk,
         reset,
         Rxd            : IN  std_logic;
         Txd,
         TxEn,
         NotBusy        : OUT std_logic;
         Selects        : OUT VECTOR_OF_SLVS(OUTPUT_PAIRS-1 downto 0)(IN_WIDTH-1 downto 0)
      );
   END Component UartControl;

   COMPONENT VioByte
      PORT (
         clk         : IN STD_LOGIC;
         probe_out0  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
   END COMPONENT VioByte;

   signal   ClkIn,
            DataIn,
            DataInFF,
            DataInDly      : std_logic_vector(INPUT_PAIRS-1 downto 0);
   signal   Selects        : VECTOR_OF_SLVS(OUTPUT_PAIRS-1 downto 0)(IN_WIDTH-1 downto 0);
   signal   reset,
            TxdUart,
            clk            : std_logic;
   signal   LtxCount       : UInt16 := x"0000";
   signal   Resets         : SLV16 := 16x"FFFF";
   signal   VioX8          : SLV8;

   attribute IOB : string;
   attribute IOB of DataOut, DataInFF : signal is "TRUE";

   attribute KEEP : string;
   attribute KEEP of LtxCount : signal is "TRUE";


BEGIN


   IBUFDS_Data : IBUFDS
      generic map (
         DIFF_TERM => TRUE,
         IBUF_LOW_PWR => TRUE,
         IOSTANDARD => "LVDS_25"
      )
      port map (
         I  => Clk93_p,
         IB => Clk93_n,
         O  => clk
   );

   ResetProcess : process (clk)
   begin
      if (rising_edge(clk)) then
         Resets <= Resets(14 downto 0) & '0';
         reset  <= Resets(15);
         LtxCount <= LtxCount + 1;
      end if;
   end process;

   Uart : UartControl
      GENERIC MAP(
         REVISION_NUM   => "0100",
         FIRMWARE_VER   => "0100",
         OUTPUT_PAIRS   => OUTPUT_PAIRS,
         IN_WIDTH       => IN_WIDTH
      )
      PORT MAP (
         clk      => clk,
         reset    => reset,
         Rxd      => Rxd,
         Txd      => TxdUart,
         TxEn     => open,
         NotBusy  => open,
         Selects  => Selects
      );

   Vio : VioByte
      PORT MAP (
         clk         => clk,
         probe_out0  => VioX8
   );

      Txd <= Rxd when (VioX8(0)) else TxdUart;

GenInputs :
   for n in 0 to INPUT_PAIRS-1 generate
   begin

      IBUFDS_Data : IBUFDS
         generic map (
            DIFF_TERM => TRUE,      -- Differential Termination
            IBUF_LOW_PWR => TRUE,   -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD => "LVDS_25"
         )
         port map (
            I  => DataIn_p(n),      -- Diff_p buffer input (connect directly to top-level port)
            IB => DataIn_n(n),      -- Diff_n buffer input (connect directly to top-level port)
            O  => DataIn(n)         -- Buffer output
      );

      IBUFGDS_Clk : IBUFDS
         generic map (
            DIFF_TERM => TRUE,      -- Differential Termination
            IBUF_LOW_PWR => TRUE,   -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD => "LVDS_25"
         )
         port map (
            I  => ClkIn_p(n),      -- Diff_p buffer input (connect directly to top-level port)
            IB => ClkIn_n(n),      -- Diff_n buffer input (connect directly to top-level port)
            O  => ClkIn(n)         -- Buffer output
      );

      -- Latch incoming data
      DelayFF_process: process (ClkIn(n))
      begin
         if (falling_edge(ClkIn(n))) then
            DataInFF(n) <= DataIn(n);
         end if;
      end process DelayFF_process;

      -- pipeline incoming data
      DelayPipe_process: process (ClkIn(n))
      begin
         if (rising_edge(ClkIn(n))) then
            if (VioX8(1)) then
               DataInDly(n) <= VioX8(2);
            else
               DataInDly(n) <= DataInFF(n);
            end if;
         end if;
      end process DelayPipe_process;

end generate;

GenOutputs:
   for n in 0 to OUTPUT_PAIRS-1 generate
      -- Select output clock
      ClkOut(n) <= ClkIn(to_integer(unsigned(Selects(n))));
      -- Latch outgoing data.
      -- Data being latched on input and output relative timing skew between clk/data pairs
      DelayOut_process: process (ClkOut(n))
      begin
         if (rising_edge(ClkOut(n))) then
            DataOut(n) <= DataInFF(to_integer(unsigned(Selects(n))));
         end if;
      end process DelayOut_process;

   end generate;

END rtl;

