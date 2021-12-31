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
-- The ASM module will acquire at 0SNR eventually with occasional flywheel drops
-- of a cycle or two. However the CCSDS130.1-G-3 shows the BER curves start at
-- 4dB Eb/No, so locking at 0 gives plenty of margin and is mostly based on the
-- noise rejection of the ASM code word.
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
use std.env.stop;

entity RS_ASM_tb is
end RS_ASM_tb;

architecture rtl of RS_ASM_tb is

  -- Define Components

   COMPONENT ReedSolomonASM IS
      PORT (
         Clk,
         Reset,
         Valid          : IN  std_logic;
         DataIn         : IN  std_logic;
         FrameLen       : IN  natural range 0 to 16383;     -- total bytes in the frame L=(255-2E-q)*I per CCSDS 131.0-B-3 11.5.3
         BitSlips       : IN  std_logic_vector(2 downto 0);
         IL_BET,                                             -- In Lock Bit Error Threshold. Allowed number of invalid bits
         OOL_BET,                                            -- Out of Lock Bit Error Threshold.
         Verifies,                                           -- number of valid frames before lock declared
         FlyWheels      : IN  std_logic_vector(4 downto 0);  -- number of invalid frames before lock lossed
         SyncOut,
         SyncTime,
         Invert,
         ValidOut       : OUT std_logic;
         DataOut        : OUT SLV8
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

   type  tb_mode_t  is (SYNCING, NORMAL, INVERTED, FLYWHEEL, RESYNC, BIT_SLIP);
   type  asm_mode_t is (SEARCHING, VERIFY, LOCK, FLYWHEEL);

   constant SYNC_SIZE      : integer :=32;
   constant SYNC           : std_logic_vector(0 to SYNC_SIZE - 1)  := x"1acffc1d";
   constant BitSlip        : integer := 3;  -- -3 to 3
   constant SIGNAL_AMP     : real := 0.25;
   constant AVERAGING      : natural := 13;

   constant BitSlips       : std_logic_vector(2 downto 0) := 3x"3";
   constant IL_BET         : std_logic_vector(4 downto 0) := 5x"04";
   constant OOL_BET        : std_logic_vector(4 downto 0) := 5x"04";     -- this sync word is shorter than turbo so needs less BET
   constant Verifies       : std_logic_vector(4 downto 0) := 5x"3";
   constant FlyWheels      : std_logic_vector(4 downto 0) := 5x"4";

   signal   Mode_tb,
            LastMode    : tb_mode_t := SYNCING;
   signal   ModeAsm     : asm_mode_t;
   signal   stop_condition : boolean := false;
   signal   Clk,
            reset       : std_logic := '1';
   signal   Invert,
            ValidOut,
            BitError,
            BitOut,
            Locked,
            SyncTime,
            SyncIn,
            SyncOut     : std_logic := '0';
   signal   OutCntr     : signed(14 downto 0) := (others=>'0');
   signal   BitCntr,
            VirtualBytes,
            FrameCnt,
            FrameLen    : integer := 0;
   signal   SyncPattern : std_logic_vector(0 to 31) := SYNC;
   signal   ValidData   : std_logic_vector(3 downto 0) := "0001";
   SIGNAL   PRN         : std_logic_vector(14 downto 0) := (others=>'1');
   signal   NoiseSlv    : SLV16;
   signal   NoiseAvg,
            DataAvg,
            Sum,
            DataIn      : sfixed(0 downto -17) := (others=>'0');
   signal   Noise       : sfixed(0 downto -15) := (others=>'0');   -- sixteen bit value from gng
   signal   NoiseGained : sfixed(4 downto -17) := (others=>'0');
   signal   NoiseGain   : sfixed(3 downto -8) := to_sfixed(0.0, 3, -8);
   signal   Fail,
            Done        : boolean := false;
   signal   Depth       : natural := 1;   -- 1, 2, 3, 4, 5 or 8
   signal   ByteIn,
            ByteDly,
            DataOut     : SLV8;
   signal   Offset      : integer range -4 to 4;
begin

   process begin
      wait for 2.5 ns;
      Clk <= not Clk;
   end process;
/*
   SEQUENCER_PROC : process
   begin
      wait until (Fail or Done);
      report "Test: OK";
      stop;
   end process;
*/
   FrameLen     <= 255 * 8 * Depth;
   VirtualBytes <= 0;   -- Q per CCSDS

   clk_process : process(Clk)
      variable Fail_v   : boolean;
      variable Offset_v : integer range -4 to 4;
   begin
      if (rising_edge(Clk)) then
         reset    <= '0';
         if (ValidData(3)) then
            if (OutCntr = FrameLen - SYNC_SIZE) then
               if (BitCntr < SyncPattern'length - 1) then
                  BitCntr <= BitCntr + 1;
                  SyncIn  <= '0';
                  Offset_v := 0;
                  if (BitCntr = 0) then
                     if (FrameCnt = 8) then
                        Mode_tb     <= INVERTED;
                     elsif (FrameCnt = 10) then
                        Mode_tb     <= NORMAL;
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
                     elsif (FrameCnt = 28) then
                        Mode_tb     <= BIT_SLIP;
                        Offset_v    := 2;
                        OutCntr     <= to_signed(Offset_v, OutCntr);
                        FrameCnt <= FrameCnt + 1;
                     elsif (FrameCnt = 31) then
                        Offset_v    := 3;
                        OutCntr     <= to_signed(Offset_v, OutCntr);
                        FrameCnt <= FrameCnt + 1;
                     elsif (FrameCnt = 35) then
                        Offset_v    := -3;
                        OutCntr     <= to_signed(Offset_v, OutCntr);
                        FrameCnt <= FrameCnt + 1;
                     elsif (FrameCnt = 38) then
                        Offset_v    := -4;
                        OutCntr     <= to_signed(Offset_v, OutCntr); -- outside of bitslip range, should flywheel, search, verify and lock
                        FrameCnt <= FrameCnt + 1;
                     elsif (FrameCnt = 52) then
                        NoiseGain   <= to_sfixed(5.0, NoiseGain); -- turn on noise, should not loose lock
                     elsif (FrameCnt = 60) then
                        if (Depth < 8) then
                           if (Depth = 5) then
                              Depth <= 8;
                           else
                              Depth <= Depth + 1;
                           end if;
                           FrameCnt  <= 0;
                           NoiseGain <= to_sfixed(0.0, NoiseGain);
                           Reset     <= '1';
                        else
                           Done <= true;
                        end if;
                     end if;
                     Offset <= Offset_v;
                  end if;
                  if (BitCntr = 4) then
                     ByteDly <= ByteIn;
                  end if;
               else
                  BitCntr <= 0;
                  LastMode <= Mode_tb;
                  OutCntr <= (others=>'0');
                  SyncIn  <= '1';
                  FrameCnt <= FrameCnt + 1;
                  -- Should verify on first pass,
                  -- lock on 5,
                  -- flywheel on 8,
                  -- relock on 10,
                  -- flywheel on 18
                  -- start searching on 22, the verify/lock on 26/30
               end if;
               DataIn  <= to_sfixed(SIGNAL_AMP*1.0, DataIn)  when SyncPattern(BitCntr) else to_sfixed(-SIGNAL_AMP*1.0, DataIn);
            else
               SyncIn  <= '0';
               OutCntr <= OutCntr + 1;
               DataIn  <= to_sfixed(SIGNAL_AMP, DataIn) when (PRN(13)) else to_sfixed(-SIGNAL_AMP, DataIn);
               --DataIn    <= to_sfixed(OutCntr, DataIn);
               PRN     <= PRN(13 downto 0) & (PRN(14) xor PRN(13));
               if (OutCntr(2 downto 0) = "001") then
                  ByteIn <= PRN(14 downto 7);
                  ByteDly <= ByteIn;
               end if;
            end if;

            if (OutCntr = 6) then
               case (FrameCnt) is
                  when 0 =>
                     Fail_v := (ModeAsm /= SEARCHING);
                  when 1 to 4 =>
                     Fail_v := (ModeAsm /= VERIFY);
                  when 5 to 8 =>
                     Fail_v := (ModeAsm /= LOCK);
                  when 9 to 10 =>
                     Fail_v := (ModeAsm /= LOCK);
                     Fail_v := Fail_v or (Invert = '0');
                  when 11 to 12 =>
                     Fail_v := (ModeAsm /= LOCK);
                  when 13 to 14 =>
                     Fail_v := (ModeAsm /= FLYWHEEL);
                  when 15 to 16 =>
                     Fail_v := (ModeAsm /= LOCK);
                  when 17 TO 21 =>
                     Fail_v := (ModeAsm /= FLYWHEEL);
                  when 22 =>
                     Fail_v := (ModeAsm /= SEARCHING);
                  when 23 TO 26 =>
                     Fail_v := (ModeAsm /= VERIFY);
                  when 27 to 28 =>
                     Fail_v := (ModeAsm /= LOCK);
                  when 29 to 33 =>
                     Fail_v := (ModeAsm /= FLYWHEEL);
                  when 45 =>
                     Fail_v := (ModeAsm /= SEARCHING);
                  when 46 to 49 =>
                     Fail_v := (ModeAsm /= VERIFY);
                  when 50 to 53 =>
                     Fail_v := (ModeAsm /= LOCK);
                  when others =>
                     Fail_v := ((ModeAsm = SEARCHING) OR (ModeAsm = VERIFY));
               end case;
            end if;
         end if;
         Fail      <= ((DataOut /= ByteDly ) and (ValidOut = '1') and (ModeAsm = LOCK)) or Fail_v;
         DataAvg   <= resize(DataAvg - (DataAvg sra 10) + (abs(DataIn) sra 10), DataAvg);
         NoiseAvg  <= resize(NoiseAvg - (NoiseAvg sra AVERAGING) + (abs(NoiseGained) sra AVERAGING), DataAvg);
         ValidData <= ValidData(2 downto 0) & ValidData(3);
         NoiseGained <= resize(NoiseGain * Noise, NoiseGained);
         BitError  <= (Sum(Sum'left) ?/= DataIn(DataIn'left));
      end if;
   end process;

   Locked <= '1' when (ModeAsm /=SEARCHING) else '0';
   Sum    <= resize(DataIn + NoiseGained, Sum, fixed_saturate, fixed_truncate);

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
   Noise <= to_sfixed(NoiseSlv, Noise);

   BitOut <= Sum(Sum'left) when (Mode_tb = INVERTED) else not Sum(Sum'left);   -- sign bit is 0 for positive, so invert

   RS_Asm : ReedSolomonASM
      GENERIC map(
         DATA_WIDTH  => Sum'length
      )
      PORT MAP (
         Clk         => Clk,
         Reset       => reset,
         Valid       => ValidData(3),
         DataIn      => BitOut,
         FrameLen    => FrameLen,
         BitSlips    => BitSlips,
         IL_BET      => IL_BET,
         OOL_BET     => OOL_BET,
         Verifies    => Verifies,
         FlyWheels   => FlyWheels,
         SyncOut     => SyncOut,
         SyncTime    => SyncTime,
         Invert      => Invert,
         DataOut     => DataOut,
         ValidOut    => ValidOut
   );

   ModeAsm <= <<signal RS_Asm.Mode : asm_mode_t>>;

end rtl;

