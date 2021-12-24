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

Module Name: ReedSolomonASM.vhd
Description: Attached Sync Marker Detector

ARGUMENTS :
   Fine the repeating 32 bit sync word. The distance between sync words is
255 * 8 times the interleave depth.

Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
9-6-16 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Semco_pkg.ALL;

ENTITY ReedSolomonASM IS
      GENERIC(
         DATA_WIDTH  : positive := 118
      );
   PORT (
      Clk,
      Reset,
      Valid          : IN  std_logic;
      DataIn         : IN  std_logic_vector(DATA_WIDTH-1 downto 0);  -- soft decision bit sync output
      Depth          : IN  std_logic_vector(3 downto 0);
      BitSlips       : IN  std_logic_vector(1 downto 0);  -- Bit Slips is the ±alignment slop between ASMs
      IL_BET,                                             -- In Lock Bit Error Threshold. Allowed number of invalid bits
      OOL_BET,                                            -- Out of Lock Bit Error Threshold.
      Verifies,                                           -- number of valid frames before lock declared
      FlyWheels      : IN  std_logic_vector(4 downto 0);  -- number of invalid frames before lock lossed
      SyncOut,
      Invert,
      SyncTime,
      ValidOut       : OUT std_logic;
      DataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)  -- soft decision invert corrected data
   );
END ReedSolomonASM;


ARCHITECTURE rtl OF ReedSolomonASM IS

   type  int_matrix is array (natural range <>, natural range <>) of natural;
   -- constants
   constant FRAME_SIZE     : integer := 255 * 8;   -- 255 bytes
   constant SYNC_SIZE      : natural := 32;
   constant SYNC           : std_logic_vector(SYNC_SIZE-1 downto 0)  := x"1acffc1d";
   constant FRAME_LEN      : int_array(0 to 7) := (FRAME_SIZE*1,FRAME_SIZE*2,FRAME_SIZE*3,FRAME_SIZE*4,
                                                   FRAME_SIZE*5,FRAME_SIZE*6,FRAME_SIZE*7,FRAME_SIZE*8);
   type     asm_mode_t         is (SEARCHING, VERIFY, LOCK, FLYWHEEL);

   -- Signals

   signal   Mode           : asm_mode_t := SEARCHING;
   signal   Search         : std_logic_vector(SYNC_SIZE-1 downto 0);
   signal   Verifies_u,
            VerifyCnt,
            FlyWheels_u,
            FlyWheelCnt    : natural range 0 to SYNC_SIZE-1 := 0;
   signal   BET            : natural range 0 to 131 := 0;
   signal   FrameCnt,FrameLock  : integer range -3 to FRAME_SIZE * 8;
   signal   FrameLen       : natural range 0 to 16383;
   signal   CountPos,
            CountNeg,
            TotalBits,
            MaxCount       : natural range 0 to SYNC_SIZE;  -- just test points
   signal   CountGood      : boolean := false;
   signal   Index,
            MaxIndex       : natural range 0 to 15;
   signal   BitSlips_u     : integer range 0 to 3;
   signal   Depth_u        : integer range 0 to 7;
   signal   DataDly        : vector_of_slvs(3 downto 0)(DATA_WIDTH-1 downto 0);
   signal   ValidPipe,
            MaxFound       : std_logic;

BEGIN

   Depth_u     <= to_integer(unsigned(Depth))-1;
   BitSlips_u  <= to_integer(unsigned(BitSlips));
   Verifies_u  <= to_integer(unsigned(Verifies));
   FlyWheels_u <= to_integer(unsigned(FlyWheels));

   BET <= to_integer(unsigned(OOL_BET)) when (Mode = SEARCHING) or (Mode = VERIFY) else to_integer(unsigned(IL_BET));

   FrameLen <= FRAME_LEN(Depth_u);

   SearchProcess : process(Clk)
      variable CountPos_v,
               CountNeg_v,
               TotalBits_v       : natural range 0 to SYNC_SIZE;
      variable CountGood_v       : boolean := false;
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            Mode        <= SEARCHING;
            Search      <= 32x"0";
            VerifyCnt   <= 0;
            FlyWheelCnt <= 0;
            FrameCnt    <= 0;
            Index       <= 0;
            MaxIndex    <= 0;
            MaxCount    <= 0;
            MaxFound    <= '0';
            ValidPipe   <= '0';
            SyncTime    <= '0';
            SyncOut     <= '0';
            Invert      <= '0';
         else
            ValidPipe   <= Valid;
            if (FrameCnt = 29) then
               SyncTime <= '1';
            elsif (FrameCnt = 2037) then
               SyncTime <= '0';
            end if;

            if (Valid) then
               Search      <= Search(30 downto 0) & not DataIn(DataIn'left);     -- soft data sign bits, 0 = positive
               DataDly     <= DataDly(DataDly'left-1 downto 0) & DataIn;         -- soft data for output
               CountPos_v  := 0;
               CountNeg_v  := 0;
               if ( (Index > 0) or (Mode = SEARCHING) or (VerifyCnt = Verifies_u) ) then
                   for i in 0 to SYNC_SIZE-1 loop
                     if (Search(i) = SYNC(i)) then
                        CountPos_v := CountPos_v + 1;
                     elsif (Search(i) = not Sync(i)) then  -- avoid compare to 'X'
                        CountNeg_v := CountNeg_v + 1;
                     end if;
                  end loop;
               end if;
               CountPos <= CountPos_v;
               CountNeg <= CountNeg_v;
            end if;

            if (ValidPipe) then
               if (FrameCnt = BitSlips_u + 1) then -- start search over ±BitSlips of FrameCnt = 0
                  MaxIndex <= 0;
                  MaxFound <= '0';
                  Index    <= 1;
               elsif (Index > 0) and (Index <= 2 * BitSlips_u) then
                  Index <= Index + 1;
               else
                  Index <= 0;
               end if;
               TotalBits_v := MyMax(CountPos_v, CountNeg_v);
               if (TotalBits_v > MaxCount) then
                  MaxCount    <= TotalBits_v;
                  FrameLock   <= FrameCnt;
                  CountGood_v := true;
                  MaxIndex    <= Index;
                  MaxFound    <= '1';
               else
                  CountGood_v := false;
                  if (FrameCnt = BitSlips_u) then
                     if (MaxCount > (SYNC_SIZE / 2) + BET * 2) then
                        MaxCount <= MaxCount - BET;
                     end if;
                  end if;
               end if;
               CountGood    <= CountGood_v;
               TotalBits    <= TotalBits_v;

               if (CountGood_v) then   -- on valid hit, recenter the counter
                  SyncOut  <= '1';
                  FrameCnt <= FrameLen - 1;
                  if (Index > 0) then
                     if (CountPos_v > CountNeg_v) then
                        Invert <= '0';
                     else
                        Invert <= '1';
                     end if;

                     case (Mode) is
                     when SEARCHING =>
                        if (Verifies_u = 0) then
                           Mode <= LOCK;
                        else
                           Mode <= VERIFY;
                        end if;
                        VerifyCnt <= Verifies_u;
                     when VERIFY =>
                        if (VerifyCnt > 0) then
                           VerifyCnt <= VerifyCnt - 1;
                        else
                           Mode        <= LOCK;
                           FlyWheelCnt <= 0;
                        end if;
                     when FLYWHEEL =>
                        Mode <= LOCK;
                     when others =>
                     end case;
                  end if;
               else
                  if (FrameCnt = 0) then
                     SyncOut <= '1';
                  else
                     SyncOut <= '0';
                  end if;

                  if (FrameCnt > -BitSlips_u) then
                     FrameCnt <= FrameCnt - 1;
                  else
                     FrameCnt <= FrameLen - BitSlips_u - 1; -- no ASM detected, Flywheel if locked, Search if Verifying
                     if (Mode = VERIFY) then
                        Mode <= SEARCHING;
                        MaxCount <= SYNC_SIZE - BET;
                     elsif (Mode = LOCK) then
                        Mode <= FLYWHEEL;
                        FlyWheelCnt <= FlyWheels_u;
                     elsif (Mode = FLYWHEEL) then
                        if (FlyWheelCnt > 0) then
                           FlyWheelCnt <= FlyWheelCnt - 1;
                        else
                           Mode     <= SEARCHING;
                           MaxCount <= SYNC_SIZE - BET;
                        end if;
                     end if;
                  end if;
               end if;
            else
               SyncOut   <= '0';
            end if;
         end if;

         ValidOut <= ValidPipe;
         DataOut  <= DataDly(DataDly'left) xor Invert;
      end if;
   end process SearchProcess;

END rtl;

