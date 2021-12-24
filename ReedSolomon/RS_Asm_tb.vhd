-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco All rights reserved.
--
-- This file contains Semco proprietary information. It is the
-- property of Semco and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco
--
-- Module Name: RS_ASM_tb.vhd
-- Description:
--
-- Dependencies: Top level module
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 4/17/15 Initial release FZ
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.semco_pkg.all;

entity RS_ASM_tb is
end RS_ASM_tb;

architecture rtl of RS_ASM_tb is

  -- Define Components

   COMPONENT ReedSolomonASM IS
      GENERIC(
         DATA_WIDTH  : positive := 18
      );
   PORT (
      Clk,
      Reset,
      Valid          : IN  std_logic;
      DataIn         : IN  std_logic_vector(DATA_WIDTH-1 downto 0);  -- soft decision bit sync output
      Depth          : IN  std_logic_vector(3 downto 0);
      BitSlips       : IN  std_logic_vector(1 downto 0);
      IL_BET,                                             -- In Lock Bit Error Threshold. Allowed number of invalid bits
      OOL_BET,                                            -- Out of Lock Bit Error Threshold.
      Verifies,                                           -- number of valid frames before lock declared
      FlyWheels      : IN  std_logic_vector(4 downto 0);  -- number of invalid frames before lock lossed
      SyncOut,
      SyncTime,
      Invert,
      ValidOut       : OUT std_logic;
      DataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)  -- soft decision invert corrected data
   );
   END COMPONENT ReedSolomonASM;

   COMPONENT gng
      GENERIC (
          INIT_Z1    : signed(63 downto 0) := 64x"45D000FFFFF005FF"; -- 05,030,521,883,283,424,767;
          INIT_Z2    : signed(63 downto 0) := 64x"FFFCBFFFD8000680"; -- 18,445,829,279,364,155,008;
          INIT_Z3    : signed(63 downto 0) := 64x"FFDA350000FE95FF"  -- 18,436,106,298,727,503,359
      );
      PORT (
          clk,                      -- system clock
          rstn,                     -- system synchronous reset, active low
          ce         : IN  STD_LOGIC;  -- clock enable
          valid_out  : OUT STD_LOGIC;  -- output data valid
          data_out   : OUT SLV16     -- output data, s<16,11>
      );
   END COMPONENT gng;

   type  tb_mode_t  is (SYNCING, INVERTED, FLYWHEEL, RESYNC);
   type  asm_mode_t is (SEARCHING, VERIFY, LOCK, FLYWHEEL);

   constant SYNC_SIZE      : integer :=32;
   constant SYNC           : std_logic_vector(0 to SYNC_SIZE - 1)  := x"1acffc1d";
   constant Depth          : integer := 1;   -- 1, 2, 3, 4, 5 or 8
   constant BitSlip        : integer := 3;  -- -3 to 3
   constant SIGNAL_AMP     : real := 32768.0;

   signal   Mode_tb     : tb_mode_t := SYNCING;
   signal   ModeAsm     : asm_mode_t;
   signal   Clk,
            reset       : std_logic := '1';
   signal   Invert,
            ValidOut,
            SyncTime,
            SyncIn,
            SyncOut     : std_logic := '0';
   signal   OutCntr     : signed(13 downto 0) := (others=>'0');
   signal   BitCntr,
            FrameCnt    : integer := 0;
   signal   SyncPattern : std_logic_vector(0 to 31) := SYNC;
   signal   ValidData   : std_logic_vector(3 downto 0) := "0101";
   SIGNAL   PRN         : std_logic_vector(14 downto 0) := (others=>'1');
   signal   NoiseSlv    : SLV16;
   signal   Sum,
            DataIn,
            DataOut     : sfixed(17 downto 0);
   signal   Noise       : sfixed(17 downto 2);
   signal   NoiseGain   : sfixed(3 downto -8);
   signal   DataOutSlv  : SLV18;
   signal   Fail        : boolean;

begin

   process begin
      wait for 2.5 ns;
      Clk <= not Clk;
   end process;


   clk_process : process(Clk)
   begin
      if (rising_edge(Clk)) then
         reset    <= '0';
         if (ValidData(3)) then
            if (OutCntr = 255 * 8 * Depth - SYNC_SIZE) then
               if (BitCntr < SyncPattern'length - 1) then
                  BitCntr <= BitCntr + 1;
                  SyncIn  <= '0';
               else
                  BitCntr <= 0;
                  OutCntr <= (others=>'0');
                  SyncIn  <= '1';
                  FrameCnt <= FrameCnt + 1;
                  -- Should verify on first pass,
                  -- lock on 5,
                  -- flywheel on 8,
                  -- relock on 10,
                  -- flywheel on 18
                  -- start searching on 22, the verify/lock on 26/30
                  if (FrameCnt = 8) then
                     Mode_tb     <= INVERTED;
                     SyncPattern <= not SyncPattern;     -- should invert both
                  elsif (FrameCnt = 12) then
                     Mode_tb     <= FLYWHEEL;
                     SyncPattern <= (others=>'0'); -- should start flywheel
                  elsif (FrameCnt = 14) then
                     Mode_tb     <= RESYNC;
                     SyncPattern <= SYNC;
                  elsif (FrameCnt = 16) then
                     Mode_tb     <= FLYWHEEL;
                     SyncPattern <= (others=>'0'); -- should start flywheel
                  elsif (FrameCnt = 22) then
                     Mode_tb     <= RESYNC;
                     SyncPattern <= SYNC;
                  end if;
               end if;
               DataIn  <= to_sfixed(SIGNAL_AMP*2.0, DataIn)  when SyncPattern(BitCntr) else to_sfixed(-SIGNAL_AMP*2.0, DataIn);
            else
               SyncIn  <= '0';
               OutCntr <= OutCntr + 1;
               DataIn  <= to_sfixed(SIGNAL_AMP, DataIn) when (PRN(13)) else to_sfixed(-SIGNAL_AMP, DataIn);
               --DataIn    <= to_sfixed(OutCntr, DataIn);
               PRN     <= PRN(13 downto 0) & (PRN(14) xor PRN(13));
            end if;

            if (OutCntr = 6) then
               case (FrameCnt) is
                  when 0 | 1 =>
                     Fail <= (ModeAsm /= SEARCHING);
                  when 2 | 3 | 4 | 5 =>
                     Fail <= (ModeAsm /= VERIFY);
                  when 6 to 13 =>
                     Fail <= (ModeAsm /= LOCK);
                  when 14 | 15 =>
                     Fail <= (ModeAsm /= FLYWHEEL);
                  when 16 to 17 =>
                     Fail <= (ModeAsm /= LOCK);
                  when 18 TO 22 =>
                     Fail <= (ModeAsm /= FLYWHEEL);
                  when 23 =>
                     Fail <= (ModeAsm /= SEARCHING);
                  when 24 TO 27 =>
                     Fail <= (ModeAsm /= VERIFY);
                  when others =>
                     Fail <= (ModeAsm /= LOCK);
               end case;
            end if;
         end if;
         ValidData <= ValidData(2 downto 0) & ValidData(3);
         NoiseGain <= to_sfixed(0.25, NoiseGain);
         Noise     <= to_sfixed(NoiseSlv, Noise);
         Sum       <= resize(DataIn + Noise * NoiseGain, Sum, fixed_saturate, fixed_truncate);
         if (ValidOut and not SyncTime) then
            DataOut <= to_sfixed(DataOutSlv, DataOut);
         end if;
      end if;
   end process;

   NoiseGen1 : gng
      GENERIC MAP (
         INIT_Z1 => 64x"45D000FFFFF005FF",     -- 05,030,521,883,283,424,767
         INIT_Z2 => 64x"FFFCBFFFD8000680",     -- 18,445,829,279,364,155,008
         INIT_Z3 => 64x"FFDA350000FE95FF"      -- 18,436,106,298,727,503,359
      )
      PORT MAP (
      clk        => Clk,
      rstn       => not Reset,
      ce         => ValidData(3),
      valid_out  => open,
      data_out   => NoiseSlv
   );

   RS_Asm : ReedSolomonASM
      GENERIC map(
         DATA_WIDTH  => Sum'length
      )
      PORT MAP (
         Clk         => Clk,
         Reset       => reset,
         Valid       => ValidData(3),
         DataIn      => to_slv(Sum),
         Depth       => std_logic_vector(to_unsigned(Depth,4)),
         BitSlips    => 2x"3",
         IL_BET      => 5x"04",
         OOL_BET     => 5x"04",
         Verifies    => 5x"3",
         FlyWheels   => 5x"4",
         SyncOut     => SyncOut,
         SyncTime    => SyncTime,
         Invert      => Invert,
         DataOut     => DataOutSlv,
         ValidOut    => ValidOut
   );

   ModeAsm <= <<signal RS_Asm.Mode : asm_mode_t>>;

end rtl;

