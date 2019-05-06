-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2016 Semco. All rights reserved.
--
-- This file contains Semco. proprietary information. It is the
-- property of Semco. and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco
--
-- Module Name: DDC_LPF.vhd
-- Description: This module filters the imaginary path of the Aliasing DDC using
--    a standard FIR architecture.
--
-- Dependencies: None
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
--
-- ce is the clock enable
-- ValidIn is expected to go hi once every four clocks.
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 8/24/16 Initial release FZ
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.all;
use work.Semco_pkg.all;

entity ddc_lpf is
   generic (
      IN_WIDTH    : natural   := 18;
      IN_BINPT    : natural   := 17;
      OUT_WIDTH   : natural   := 18;
      OUT_BINPT   : natural   := 17
   );
   port (
      clk,
      ce,
      reset,
      ValidIn  : in  std_logic;
      DataIn   : in  std_logic_vector(IN_WIDTH - 1 downto 0);
      DataOut  : out std_logic_vector(OUT_WIDTH - 1 downto 0)
   );
   end ddc_lpf;

architecture rtl of ddc_lpf is


-- h1 consists of the non-zero taps of a halfband filter (order 48) that was generated in MATLAB
-- with the following command:
--
-- h = remez(48,(0 0.17 0.33 0.5)*2,(1 1 0 0));
-- h1 = 2*h(2:2:end);
--
-- (h0 is an impulse and represents a delay of 12 samples)

-- Coefficients were further modified by Chris Lavin to go from order
-- 40, to 48 to make the hardware utilization more efficient.

   subtype  DATA_TYPE   is sfixed(IN_WIDTH-IN_BINPT-1 downto -IN_BINPT);
   subtype  COEFF_TYPE  is sfixed(0 downto -17);
   type  DATA_ARRAY     is array (natural range <>) of DATA_TYPE;
   type  SFIX_ARRAY     is array (natural range <>) of COEFF_TYPE;

   constant NUM_IMAG_COEFFS   : natural := 24;
   constant DELAY3_LEN        : natural := 4;
   constant H1_SIZE           : COEFF_TYPE := (others=>'0');
   constant h1                : SFIX_ARRAY(0 to NUM_IMAG_COEFFS/2-1) := (
         to_sfixed(-0.0000210174403, H1_SIZE),
         to_sfixed( 0.0001348647796, H1_SIZE),
         to_sfixed(-0.0005257635805, H1_SIZE),
         to_sfixed( 0.0015689796596, H1_SIZE),
         to_sfixed(-0.0039197724731, H1_SIZE),
         to_sfixed( 0.0086029808759, H1_SIZE),
         to_sfixed(-0.0171272994009, H1_SIZE),
         to_sfixed( 0.0317530040337, H1_SIZE),
         to_sfixed(-0.0563815140547, H1_SIZE),
         to_sfixed( 0.0999964008243, H1_SIZE),
         to_sfixed(-0.1946352538560, H1_SIZE),
         to_sfixed( 0.6305538201783, H1_SIZE) );

   signal   DataShift   : DATA_ARRAY(0 to  NUM_IMAG_COEFFS-1);
   signal   Delay1      : std_logic;
   signal   Delay3      : std_logic_vector(DELAY3_LEN-1 downto 0);
   signal   Delay0,
            Mux0,
            Mux1,
            Mux2,
            Mux3,
            Mux4,
            Mux5,
            Add5        : DATA_TYPE;
   signal   Mux6,
            Mux7,
            Mux8        : COEFF_TYPE;
   signal   Add0,
            Add1,
            Add2        : sfixed(IN_WIDTH-IN_BINPT downto -IN_BINPT);
   signal   Mult0,
            Mult1,
            Mult2,
            Delay2      : sfixed(Add0'left+h1(0)'left+1 downto Add0'right+h1(0)'right);
   signal   Add3        : sfixed(Mult0'left+1 downto Mult0'right);
   signal   Add4        : sfixed(Add3'left+1 downto Add3'right);
   signal   Accum       : sfixed(Add4'left+3 downto Add4'right);
   signal   Counter,
            NotCounter  : unsigned(1 downto 0);

begin

   NotCounter <= not(Counter);
   Mux0 <= DataShift(to_integer(Counter));
   Mux1 <= DataShift(to_integer(Counter)+4);
   Mux2 <= DataShift(to_integer(Counter)+8);
   Mux3 <= DataShift(to_integer(NotCounter)+12);
   Mux4 <= DataShift(to_integer(NotCounter)+16);
   Mux5 <= DataShift(to_integer(NotCounter)+20);


   reg_process : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            DataShift   <= (others=>(others=>'0'));
            Mux6        <= (others=>'0');
            Mux7        <= (others=>'0');
            Mux8        <= (others=>'0');
            Add0        <= (others=>'0');
            Add1        <= (others=>'0');
            Add2        <= (others=>'0');
            Add3        <= (others=>'0');
            Add4        <= (others=>'0');
            Add5        <= (others=>'0');
            Mult0       <= (others=>'0');
            Mult1       <= (others=>'0');
            Mult2       <= (others=>'0');
            Accum       <= (others=>'0');
            Delay0      <= (others=>'0');
            Delay1      <= '0';
            Delay2      <= (others=>'0');
            Delay3      <= (others=>'0');
            Counter      <= (others=>'0');
         elsif (ce = '1') then
            if (Delay1 = '1') then
               DataShift   <= Delay0 & DataShift(0 to NUM_IMAG_COEFFS-2);
               Counter     <= (others=>'0');
            else
               Counter     <= Counter + 1;
            end if;
            Delay3      <= Delay3(DELAY3_LEN-2 downto 0) & Delay1;
            Mux6        <= h1(to_integer(Counter));
            Mux7        <= h1(to_integer(Counter)+4);
            Mux8        <= h1(to_integer(Counter)+8);
            Add0        <= Mux0 + Mux5;
            Add1        <= Mux2 + Mux3;
            Add2        <= Mux1 + Mux4;
            Add3        <= Mult0 + Mult1;
            Mult0       <= Mux6 * Add0;
            Mult1       <= Mux8 * Add1;
            Mult2       <= Mux7 * Add2;
            Delay2      <= Mult2;
            Add4        <= Add3 + Delay2;
            if (Delay3(DELAY3_LEN-1) = '1') then
               Add5        <= resize(Add4 + Accum, Add5, fixed_saturate, fixed_round);
               Accum    <= (others=>'0');
            else
               Accum    <= resize(Accum + Add4, Accum);
            end if;
            Delay0      <= to_sfixed(DataIn, Delay0);
            Delay1      <= ValidIn;
         end if;
      end if;
   end process reg_process;

   DataOut <= to_slv(Add5);

end;