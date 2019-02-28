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

Module Name: TurboASM.vhd
Description: Attached Sync Marker Detector

ARGUMENTS :
   Rate  2, 3, 4 or 6 determines the coding symbols per bit. Each rate has
its own expanded ASM pattern which is derived from a common pattern that is
Turbo Encoded per the rate.

Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------
Issues and notes.
   Rate 6 :
      At high EbNo there's a 144 of 192 bit correlation just before sync word
      At 0 EbNo, the actual peak is only 127, 133, ...  but others are up to 117

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

ENTITY TurboASM IS
      GENERIC(
         DATA_WIDTH  : positive := 8
      );
   PORT (
      Clk,
      Reset,
      Valid0,
      Valid1         : IN  std_logic;
      Data0,               -- Data0 is first in SOQPSK mode but both show together
      Data1          : IN  std_logic_vector(DATA_WIDTH-1 downto 0);  -- soft decision bit sync output
      Frame,
      Rate           : IN  std_logic_vector(2 downto 0);
      ModMode,               -- 00 = BPSK, 01 = dual independent, ignore as 00, 10 = QPSK, 11 = SOQPSK
      BitSlips       : IN  std_logic_vector(1 downto 0);
      IL_BET,                                             -- In Lock Bit Error Threshold. Allowed number of invalid bits
      OOL_BET,                                            -- Out of Lock Bit Error Threshold.
      Verifies,                                           -- number of valid frames before lock declared
      FlyWheels      : IN  std_logic_vector(4 downto 0);  -- number of invalid frames before lock lossed
      SyncOut,
      InvertOdd,
      InvertEven,
      ValidOut       : OUT std_logic;
      DataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)  -- soft decision invert corrected data
   );
END TurboASM;


ARCHITECTURE rtl OF TurboASM IS

   type  int_matrix is array (natural range <>, natural range <>) of natural;
   -- constants
   constant FRAME_SIZE     : integer := 1784;
   constant SYNC_2         : std_logic_vector(63 downto 0)  := x"034776C7272895B0";
   constant SYNC_3         : std_logic_vector(95 downto 0)  := x"25D5C0CE8990F6C9461BF79C";
   constant SYNC_4         : std_logic_vector(127 downto 0) := X"034776C7272895B0FCB88938D8F76A4F";
   constant SYNC_6         : std_logic_vector(191 downto 0) := x"25D5C0CE8990F6C9461BF79CDA2A3F31766F0936B9E40863";
   constant FRAME_LEN      : int_matrix(0 to 6, 0 to 5) := (      -- FRAME_SIZE * Rate * Frame + Rate * 4 + CountBits - 1;
                              (0, 0, 0, 0, 0, 0),
                              (0, 0, 0, 0, 0, 0),
                              (0, 3640,  7208, 0, 14344, 17912),    -- Rate = 2
                              (0, 5460, 10812, 0, 21516, 26868),   -- Rate = 3
                              (0, 7280, 14416, 0, 28688, 35824),   -- Rate = 4
                              (0, 0, 0, 0, 0, 0),
                              (0, 10920, 21624, 0, 43032, 53736) ); -- Rate = 6
   constant CountBits      : int_array(0 to 7) := (0, 0, 64, 96, 128, 0, 192, 0);
   constant SYNC_WORD      : vector_of_slvs(0 to 6)(191 downto 0) := ( 192x"0", 192x"0",
                              128x"0" & SYNC_2, 96x"0" & SYNC_3, 64x"0" & SYNC_4, 192x"0", SYNC_6);

   type     mode_t         is (SEARCHING, VERIFY, LOCK, FLYWHEEL);

   -- Signals

   signal   Mode           : mode_t := SEARCHING;
   signal   SearchEven,
            SearchOdd,
            SyncEven,
            SyncOdd        : std_logic_vector(95 downto 0);
   signal   Verifies_u,
            VerifyCnt,
            FlyWheels_u,
            FlyWheelCnt    : natural range 0 to 31 := 0;
   signal   BET            : natural range 0 to 131 := 0;
   signal   FrameLen,
            SyncTime,
            FrameCnt,
            FrameLock      : signed(16 downto 0); -- range -3 to FRAME_SIZE * 5 * 6 + 6 * 4 + 192;
   signal   CountPosEvenEven,
            CountNegEvenEven,
            CountPosOddEven,
            CountNegOddEven,
            CountPosEvenOdd,
            CountNegEvenOdd,
            CountPosOddOdd,
            CountNegOddOdd,
            MaxCount,
            TotalBits      : natural range 0 to 192;  -- just test points
   signal   CountGood      : boolean := false;
   signal   Rate_u,
            Frame_u        : natural range 0 to 6;
   signal   Index,
            MaxIndex       : natural range 0 to 15;
   signal   BitSlips_u     : integer range 0 to 3;
   signal   DataEvenDly,
            DataOddDly     : vector_of_slvs(3 downto 0)(DATA_WIDTH-1 downto 0);
   signal   ValidPipe0,
            ValidPipe1,
            ValidPipeDly,
            MaxFound,
            EvenIn,
            SwapEvenOdd    : std_logic;

BEGIN

   Rate_u      <= to_integer(unsigned(Rate));
   Frame_u     <= to_integer(unsigned(Frame));
   BitSlips_u  <= to_integer(unsigned(BitSlips));
   Verifies_u  <= to_integer(unsigned(Verifies));
   FlyWheels_u <= to_integer(unsigned(FlyWheels));

   BET <= to_integer(unsigned(OOL_BET)) when (Mode = SEARCHING) or (Mode = VERIFY) else to_integer(unsigned(IL_BET));

   FrameLen <= to_signed(FRAME_LEN(Rate_u, Frame_u), FrameLen'length);

   SearchProcess : process(Clk)
      variable CountPosEven_v,
               CountNegEven_v,
               CountPosOdd_v,
               CountNegOdd_v,
               CountPosOddEven_v,
               CountNegOddEven_v,
               CountPosEvenEven_v,
               CountNegEvenEven_v,
               CountPosOddOdd_v,
               CountNegOddOdd_v,
               CountPosEvenOdd_v,
               CountNegEvenOdd_v,
               CountOddEven_v,
               CountEvenEven_v,
               CountOddOdd_v,
               CountEvenOdd_v    : natural range 0 to 96;
      variable TotalBits_v       : natural range 0 to 192;
      variable CountGood_v       : boolean := false;
      variable SearchEven_v,
               SearchOdd_v       : std_logic_vector(95 downto 0);
      variable ValidEven_v,
               ValidOdd_v,
               SwapEvenOdd_v     : std_logic;
      variable DataEven_v,
               DataOdd_v         : std_logic_vector(DATA_WIDTH-1 downto 0);
   begin
      if (rising_edge(Clk)) then
         for i in 0 to 95 loop
            SyncEven(i) <= SYNC_WORD(Rate_u)(2*i);
            SyncOdd(i)  <= SYNC_WORD(Rate_u)(2*i+1);
         end loop;
         if (Reset) then
            Mode        <= SEARCHING;
            SearchEven  <= 96x"0";
            SearchOdd   <= 96x"0";
            VerifyCnt   <= 0;
            FlyWheelCnt <= 0;
            FrameCnt    <= (others=>'0');
            MaxCount    <= CountBits(Rate_u) - BET;
            Index       <= 0;
            MaxIndex    <= 0;
            MaxFound    <= '0';
            ValidPipe0   <= '0';
            ValidPipe1  <= '0';
            SyncOut     <= '0';
            SyncTime    <= FrameLen - 7;
            SwapEvenOdd <= '0';
            InvertOdd   <= '0';
            InvertEven  <= '0';
            EvenIn       <= '1';  -- start at 0 which is an even number
         else
            if (Valid0 or Valid1) then
               SearchEven_v := SearchEven;
               SearchOdd_v  := SearchOdd;
               ValidPipe0 <= '1';
               if (ModMode(1) = '0') then   -- treat independent mode as a single stream
                  if (Valid0) then
                     EvenIn <= not EvenIn;
                     ValidEven_v := EvenIn;     -- ignore valid1 and its data
                     DataEven_v  := Data0;
                     ValidOdd_v := not EvenIn;
                     DataOdd_v  := Data0;
                  end if;
               elsif (ModMode(1) = '1') then   -- QPSK data is ambiguous
                  ValidEven_v := Valid0;     -- both valids should be high
                  DataEven_v  := Data0;      -- I and Q are valid
                  ValidOdd_v := Valid1;
                  DataOdd_v  := Data1;
               end if;
               if (ValidEven_v) then   -- shift in sign bits for binary correlation
                  SearchEven_v := SearchEven_v(94 downto 0) & not DataEven_v(DataEven_v'left); -- negative is '0'
                  DataEvenDly <= DataEvenDly(DataEvenDly'left-1 downto 0) & DataEven_v;
               end if;
               if (ValidOdd_v) then
                  SearchOdd_v  := SearchOdd_v(94 downto 0)  & not DataOdd_v(DataOdd_v'left); -- negative is '0'
                  DataOddDly   <= DataOddDly(DataOddDly'left-1 downto 0) & DataOdd_v;
               end if;
               CountPosOddEven_v  := 0;
               CountNegOddEven_v  := 0;
               CountPosEvenEven_v := 0;
               CountNegEvenEven_v := 0;
               CountPosOddOdd_v   := 0;
               CountNegOddOdd_v   := 0;
               CountPosEvenOdd_v  := 0;
               CountNegEvenOdd_v  := 0;
               if ( (Index > 0) or (Mode = SEARCHING) or (VerifyCnt = Verifies_u) ) then
                   for i in 0 to 95 loop  -- range must be constant for synthesis
                     if (i < CountBits(Rate_u)/2) then
                        if (SearchEven_v(i) = SyncEven(i)) then
                           CountPosEvenEven_v := CountPosEvenEven_v + 1;
                        elsif (SearchEven_v(i) = not SyncEven(i)) then  -- avoid compare to 'X'
                           CountNegEvenEven_v := CountNegEvenEven_v + 1;
                        end if;
                        if (SearchOdd_v(i) = SyncOdd(i)) then
                           CountPosOddOdd_v := CountPosOddOdd_v + 1;
                        elsif (SearchOdd_v(i) = not SyncOdd(i)) then
                           CountNegOddOdd_v := CountNegOddOdd_v + 1;
                        end if;
                        if (SearchEven_v(i) = SyncOdd(i)) then
                           CountPosEvenOdd_v := CountPosEvenOdd_v + 1;
                        elsif (SearchEven_v(i) = not SyncOdd(i)) then
                           CountNegEvenOdd_v := CountNegEvenOdd_v + 1;
                        end if;
                        if (SearchOdd_v(i) = SyncEven(i)) then
                           CountPosOddEven_v := CountPosOddEven_v + 1;
                        elsif (SearchOdd_v(i) = not SyncEven(i)) then
                           CountNegOddEven_v := CountNegOddEven_v + 1;
                        end if;
                     end if;
                  end loop;
               end if;
               CountPosEvenEven <= CountPosEvenEven_v;
               CountNegEvenEven <= CountNegEvenEven_v;
               CountPosOddEven  <= CountPosOddEven_v;
               CountNegOddEven  <= CountNegOddEven_v;
               CountPosEvenOdd  <= CountPosEvenOdd_v;
               CountNegEvenOdd  <= CountNegEvenOdd_v;
               CountPosOddOdd   <= CountPosOddOdd_v;
               CountNegOddOdd   <= CountNegOddOdd_v;
               SearchEven   <= SearchEven_v;
               SearchOdd    <= SearchOdd_v;
            else
               ValidPipe0 <= '0';
            end if;
            ValidPipe1 <= ValidPipe0;

            if (ValidPipe1) then
               if (FrameCnt = BitSlips_u + 1) then -- start verify over ±BitSlips of FrameCnt = 0
                  MaxIndex <= 0;
                  MaxFound <= '0';
                  Index    <= 1;
                  MaxCount <= CountBits(Rate_u) - BET;
                  case (Mode) is
                  when SEARCHING =>
                     if (Verifies_u = 0) then
                        Mode <= LOCK;
                     else
                        Mode <= VERIFY;
                     end if;
                     VerifyCnt <= Verifies_u - 1;  -- doesn't decrement till end of frame
                  when others =>
                  end case;
               elsif (Index > 0) and (Index <= 2 * BitSlips_u) then
                  Index <= Index + 1;
               else
                  Index <= 0;
               end if;
               CountEvenEven_v := MyMax(CountPosEvenEven, CountNegEvenEven);
               CountOddOdd_v   := MyMax(CountPosOddOdd,   CountNegOddOdd);
               CountEvenOdd_v  := MyMax(CountPosEvenOdd,  CountNegEvenOdd);
               CountOddEven_v  := MyMax(CountPosOddEven,  CountNegOddEven);
               TotalBits_v := MyMax(CountEvenEven_v + CountOddOdd_v, CountEvenOdd_v + CountOddEven_v);
               if (TotalBits_v > MaxCount) then
                  MaxCount    <= TotalBits_v;
                  FrameLock   <= FrameCnt;
                  CountGood_v := true;
                  MaxIndex    <= Index;
                  if (CountEvenEven_v + CountOddOdd_v > CountEvenOdd_v + CountOddEven_v) then -- Even/Odds are correct
                     CountPosEven_v := CountPosEvenEven;
                     CountNegEven_v := CountNegEvenEven;
                     CountPosOdd_v  := CountPosOddOdd;
                     CountNegOdd_v  := CountNegOddOdd;
                     SyncTime       <= FrameLen - 7;
                     SwapEvenOdd    <= '0';
                  else                                      -- else compare swap values
                     CountPosEven_v := CountPosEvenOdd;
                     CountNegEven_v := CountNegEvenOdd;
                     CountPosOdd_v  := CountPosOddEven;
                     CountNegOdd_v  := CountNegOddEven;
                     if (SwapEvenOdd) then
                        SyncTime       <= FrameLen - 8;
                     else
                        SyncTime       <= FrameLen - 7;
                     end if;
                     SwapEvenOdd    <= '1';
                  end if;
                  FrameCnt <= FrameLen - 1;
                  if (CountPosEven_v > CountNegEven_v) then
                     InvertEven <= '0';
                  else
                     InvertEven <= '1';
                  end if;

                  if (CountPosOdd_v > CountNegOdd_v) then
                     InvertOdd <= '0';
                  else
                     InvertOdd <= '1';
                  end if;
                  case (Mode) is
                  when VERIFY =>
                     if (VerifyCnt > 0) and (MaxFound = '0') then
                        VerifyCnt <= VerifyCnt - 1;
                     else
                        Mode        <= LOCK;
                        FlyWheelCnt <= 0;
                     end if;
                  when FLYWHEEL =>
                     Mode <= LOCK;
                  when others =>
                  end case;
               else
                  if (FrameCnt > -BitSlips_u) then
                     FrameCnt <= FrameCnt - 1;
                  else
                     FrameCnt <= FrameLen - BitSlips_u - 1; -- no ASM detected, Flywheel if locked, Search if Verifying
                     if (Mode = VERIFY) then
                        Mode <= SEARCHING;
                        MaxCount <= CountBits(Rate_u) - BET;
                     elsif (Mode = LOCK) then
                        Mode <= FLYWHEEL;
                        FlyWheelCnt <= FlyWheels_u - 1;
                     elsif (Mode = FLYWHEEL) then
                        if (FlyWheelCnt > 0) then
                           FlyWheelCnt <= FlyWheelCnt - 1;
                        else
                           Mode     <= SEARCHING;
                           MaxCount <= CountBits(Rate_u) - BET;
                        end if;
                     end if;
                  end if;
                  CountGood_v := false;
               end if;
               CountGood    <= CountGood_v;
               TotalBits    <= TotalBits_v;

            end if;
         end if;

         if (FrameCnt = SyncTime) then
            SyncOut <= '1';
         else
            SyncOut <= '0';
         end if;

         ValidPipeDly <= ValidPipe1 and ModMode(1);

         ValidOut <= ValidPipe1 or ValidPipeDly;
         if (FrameCnt(0) xor SwapEvenOdd) then  -- not sure why but the arrays are swapped, zero is an even number
            DataOut <= DataEvenDly(DataEvenDly'left) xor InvertOdd;
         else
            DataOut <= DataOddDly(DataOddDly'left)   xor InvertEven;
         end if;
      end if;
   end process SearchProcess;

END rtl;

