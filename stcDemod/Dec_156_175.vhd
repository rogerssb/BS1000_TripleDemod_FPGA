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
-- Description: This module resamples the I/Q channels using a FIR structure.
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
library std;
use std.textio.all;
use work.fixed_pkg.all;
use work.Semco_pkg.all;

entity Dec_156_175 is
   generic (
      IN_WIDTH    : natural   := 18;
      IN_BINPT    : integer   := 17;
      OUT_WIDTH   : natural   := 18;
      OUT_BINPT   : integer   := 17
   );
   port (
      clk,
      ce,
      reset,
      ValidIn  : in  std_logic;
      ReIn,
      ImIn     : in  std_logic_vector(IN_WIDTH - 1 downto 0);
      ReOut,
      ImOut    : out std_logic_vector(OUT_WIDTH - 1 downto 0);
      ValidOut : out std_logic
   );
   end Dec_156_175;

architecture rtl of Dec_156_175 is

   procedure ReadValues (
         FileName : in string;
         ArrayOut : out vector_of_slvs(0 to 155)(17 downto 0)
      ) is
      variable LineVar  : line;
      file     FilePntr : text;
      variable Slv_v    : SLV32;
      variable Good_v   : boolean;
      begin
         --Open the file in read mode.
         file_open(FilePntr, FileName, read_mode); --FileName, read_mode);
            for i in 0 to 155 loop
                --make sure its not the end of file.
               if(NOT ENDFILE(FilePntr)) then
                  readline(FilePntr, LineVar);   --read the current line.
                   --extract the real value from the read line and store it in the variable.
                  hread(LineVar, Slv_v, Good_V);
                  assert Good_v report "Failed to convert SLV of: " & LineVar.all severity FAILURE;
                  ArrayOut(i) := Slv_v(31 downto 14);
               else
                  report "Dec_156_175 ran out of data reading " & FileName severity FAILURE;
               end if;
            end loop;
         file_close(FilePntr); --close the file after reading.
   end ReadValues;

   subtype  DATA_TYPE   is sfixed(IN_WIDTH-IN_BINPT-1 downto -IN_BINPT);
   subtype  COEFF_TYPE  is sfixed(0 downto -17);
   subtype  COEFF_TYPE1 is sfixed(1 downto -16);
   type  DATA_ARRAY     is array (natural range <>) of DATA_TYPE;
   type  SFIX_ARRAY     is array (natural range <>) of COEFF_TYPE;
   type  SFIX_ARRAY1    is array (natural range <>) of COEFF_TYPE1;

   constant UP                : natural := 175;
   constant DOWN              : natural := 156;
   constant NUM_COEFFS        : natural := 156;
   constant DELAY4_LEN        : natural := 8;
   constant DELAY5_LEN        : natural := 4;
   constant H1_SIZE           : COEFF_TYPE := (others=>'0');

   signal   ReShift,
            ImShift     : DATA_ARRAY(0 to 7);
   signal   CalcNextAddr,
            Delay0,
            Delay6,
            Compare0,
            SkipData,
            And0,
            And1        : std_logic;
   signal   Delay4      : std_logic_vector(DELAY4_LEN-1 downto 0);
   signal   Delay5      : std_logic_vector(DELAY5_LEN-1 downto 0);
   signal   Delay1,
            Delay2,
            Delay7,
            Delay8,
            Mux0,
            Mux1,
            Mux2,
            Mux3        : DATA_TYPE;
   signal   Coeff0Reg,
            Coeff1Reg,
            Coeff2Reg,
            Coeff5Reg,
            Coeff6Reg,
            Coeff7Reg,
            Coeff8Reg   : COEFF_TYPE;
   signal   Coeff3Reg,
            Coeff4Reg,
            Mux4,
            Mux5        : COEFF_TYPE1;
   signal   CoeffReg    : SFIX_ARRAY1(0 to 7);
   signal   Coeff0,
            Coeff1,
            Coeff2,
            Coeff3,
            Coeff6,
            Coeff7      : SFIX_ARRAY(0 to NUM_COEFFS-1);
   signal   Coeff4,
            Coeff5      : SFIX_ARRAY1(0 to NUM_COEFFS-1);
   signal   Mult0,
            Mult1,
            Mult2,
            Mult3       : sfixed(Mux0'left+Mux4'left+1 downto Mux0'right+Mux4'right);
   signal   Add0,
            Add1        : sfixed(Mult0'left+1 downto Mult0'right);
   signal   Add2,
            Add3        : sfixed(OUT_WIDTH-OUT_BINPT-1 downto -OUT_BINPT);
   signal   Accum0,
            Accum1      : sfixed(Add0'left+3 downto Add0'right);
   signal   MuxSel,
            Delay3      : unsigned(1 downto 0);
   signal   Add4,
            Sub0,
            Mux6        : integer := 0;
   signal   AddrCounter : integer := 0;-- range 0 to 255;


begin

   read_coeffs : process(clk)
      variable Temp        : vector_of_slvs(0 to NUM_COEFFS-1)(17 downto 0);
   begin
      if (rising_edge(clk)) then
         ReadValues("C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\H_156_175_1_pt31.slv", Temp);
            for i in 0 to NUM_COEFFS-1 loop
               Coeff0(i) <= sfixed(Temp(i));
            end loop;
         ReadValues("C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\H_156_175_2_pt31.slv", Temp);
            for i in 0 to NUM_COEFFS-1 loop
               Coeff1(i) <= sfixed(Temp(i));
            end loop;
         ReadValues("C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\H_156_175_3_pt31.slv", Temp);
            for i in 0 to NUM_COEFFS-1 loop
               Coeff2(i) <= sfixed(Temp(i));
            end loop;
         ReadValues("C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\H_156_175_4_pt30.slv", Temp);
            for i in 0 to NUM_COEFFS-1 loop
               Coeff3(i) <= sfixed(Temp(i));
            end loop;
         ReadValues("C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\H_156_175_5_pt30.slv", Temp);
            for i in 0 to NUM_COEFFS-1 loop
               Coeff4(i) <= sfixed(Temp(i));
            end loop;
         ReadValues("C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\H_156_175_6_pt31.slv", Temp);
            for i in 0 to NUM_COEFFS-1 loop
               Coeff5(i) <= sfixed(Temp(i));
            end loop;
         ReadValues("C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\H_156_175_7_pt31.slv", Temp);
            for i in 0 to NUM_COEFFS-1 loop
               Coeff6(i) <= sfixed(Temp(i));
            end loop;
         ReadValues("C:\Users\frank.ziegler\Documents\GitHub\stcDemod\sourceData\H_156_175_8_pt31.slv", Temp);
            for i in 0 to NUM_COEFFS-1 loop
               Coeff7(i) <= sfixed(Temp(i));
            end loop;
      end if;
   end process read_coeffs;

   Add4 <= AddrCounter + (UP-DOWN);
   Sub0 <= AddrCounter - (DOWN-(UP-DOWN));
   Mux6 <= Sub0 when Compare0 else Add4;

   reg_process : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            ReShift     <= (others=>(others=>'0'));
            ImShift     <= (others=>(others=>'0'));
            CoeffReg    <= (others=>(others=>'0'));
            Mux0        <= (others=>'0');
            Mux1        <= (others=>'0');
            Mux2        <= (others=>'0');
            Mux3        <= (others=>'0');
            Mux4        <= (others=>'0');
            Mux5        <= (others=>'0');
            Add0        <= (others=>'0');
            Add1        <= (others=>'0');
            Add2        <= (others=>'0');
            Add3        <= (others=>'0');
            Mult0       <= (others=>'0');
            Mult1       <= (others=>'0');
            Mult2       <= (others=>'0');
            Mult3       <= (others=>'0');
            Accum0      <= (others=>'0');
            Accum1      <= (others=>'0');
            AddrCounter <= 0;
            CalcNextAddr<= '0';
            Compare0    <= '0';
            SkipData    <= '0';
            And0        <= '0';
            And1        <= '0';
            Delay0      <= '0';
            Delay1      <= (others=>'0');
            Delay2      <= (others=>'0');
            Delay3      <= (others=>'0');
            Delay4      <= (others=>'0');
            Delay5      <= (others=>'0');
            Delay6      <= '0';
            Delay7      <= (others=>'0');
            Delay8      <= (others=>'0');
            MuxSel     <= (others=>'0');
         elsif (ce = '1') then
            if (Delay0 = '1') then
               ReShift     <= Delay2 & ReShift(0 to 6);
               ImShift     <= Delay1 & ImShift(0 to 6);
            end if;
            if (MuxSel = 0) then
               if (Delay0 and not SkipData) then
                  MuxSel     <= MuxSel+1;
               end if;
            else
               MuxSel     <= MuxSel + 1;
            end if;
            if (MuxSel = 2) then
               CalcNextAddr <= '1';
            else
               CalcNextAddr <= '0';
            end if;
            if (CalcNextAddr and not And1) then
               AddrCounter <= Mux6;
            end if;
            Compare0    <= '1' when (AddrCounter >= DOWN - (UP - DOWN)) else '0';  -- 137
            And1        <= SkipData and Delay0;
            SkipData    <= '0' when And1 else Compare0 when Delay0;

            Delay0      <= ValidIn;
            Delay1      <= to_sfixed(ImIn, Delay1);
            Delay2      <= to_sfixed(ReIn, Delay2);
            Delay3      <= MuxSel;
            Delay4      <= Delay4(DELAY4_LEN-2 downto 0) & And0;
            Delay5      <= Delay5(DELAY5_LEN-2 downto 0) & Delay0;
            Delay6      <= Delay4(DELAY4_LEN-1);
            if (Delay4(DELAY4_LEN-1)) then
               Delay7   <= Add3;
               Delay8   <= Add2;
            end if;
            Mux0        <= ReShift(to_integer(Delay3));
            Mux1        <= ReShift(to_integer(Delay3)+4);
            Mux2        <= ImShift(to_integer(Delay3));
            Mux3        <= ImShift(to_integer(Delay3)+4);
            Coeff0Reg   <= Coeff0(AddrCounter);
            Coeff1Reg   <= Coeff1(AddrCounter);
            Coeff2Reg   <= Coeff2(AddrCounter);
            Coeff3Reg   <= Coeff3(AddrCounter);
            Coeff4Reg   <= Coeff4(AddrCounter);
            Coeff5Reg   <= Coeff5(AddrCounter);
            Coeff6Reg   <= Coeff6(AddrCounter);
            Coeff7Reg   <= Coeff7(AddrCounter);
            CoeffReg(0) <= resize(Coeff0Reg, CoeffReg(0));
            CoeffReg(1) <= resize(Coeff1Reg, CoeffReg(1));
            CoeffReg(2) <= resize(Coeff2Reg, CoeffReg(2));
            CoeffReg(3) <= resize(Coeff3Reg, CoeffReg(3));
            CoeffReg(4) <= resize(Coeff4Reg, CoeffReg(4));
            CoeffReg(5) <= resize(Coeff5Reg, CoeffReg(5));
            CoeffReg(6) <= resize(Coeff6Reg, CoeffReg(6));
            CoeffReg(7) <= resize(Coeff7Reg, CoeffReg(7));
            Mux4        <= CoeffReg(to_integer(Delay3));
            Mux5        <= CoeffReg(to_integer(Delay3)+4);
            And0        <= not SkipData and Delay0;
            Add0        <= Mult0 + Mult1;
            Add1        <= Mult2 + Mult3;
            Add2        <= resize(Add0 + Accum0, Add2, fixed_saturate, fixed_round);
            Add3        <= resize(Add1 + Accum1, Add3, fixed_saturate, fixed_round);
            Mult0       <= Mux0 * Mux4;
            Mult1       <= Mux1 * Mux5;
            Mult2       <= Mux2 * Mux4;
            Mult3       <= Mux3 * Mux5;
            if (Delay5(DELAY5_LEN-1) = '1') then
               Accum0   <= (others=>'0');
               Accum1   <= (others=>'0');
            else
               Accum0   <= resize(Accum0 + Add0, Accum0);
               Accum1   <= resize(Accum1 + Add1, Accum1);
            end if;
         end if;
      end if;
   end process reg_process;

   ReOut <= to_slv(Delay8);
   ImOut <= to_slv(Delay7);
   ValidOut <= Delay6;



end;