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
-- Module Name: TurboAsm_tb.vhd
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

entity TurboAsm_tb is
end TurboAsm_tb;

architecture rtl of TurboAsm_tb is

  -- Define Components

   COMPONENT TurboASM IS
      GENERIC(
         DATA_WIDTH  : positive := SfixPci'length
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
   END COMPONENT TurboASM;

   component TurboDF_Rom IS
      PORT(
         Clk,
         Reset,
         CountEn        : IN  std_logic;
         ReNoise        : OUT SLV12
      );
   END COMPONENT TurboDF_Rom;

   constant SYNC_2         : std_logic_vector(0 to 63)  := x"034776C7272895B0";
   constant SYNC_3         : std_logic_vector(0 to 95)  := x"25D5C0CE8990F6C9461BF79C";
   constant SYNC_4         : std_logic_vector(0 to 127) := X"034776C7272895B0FCB88938D8F76A4F";
   constant SYNC_6         : std_logic_vector(0 to 191) := x"25D5C0CE8990F6C9461BF79CDA2A3F31766F0936B9E40863";
   constant Rate           : integer := 2;   -- 2, 3, 4 or 6
   constant Frame          : integer := 1;   -- 1, 2, 4 or 5
   constant BitSlip        : integer := 3;  -- -3 to 3
   constant SIGNAL_AMP     : real := 0.125;

   type     mode_t         is (VALID, INVERT_BOTH, INVERT_ODD, INVERT_EVEN, FLYWHEEL);

   signal   Mode        : mode_t := VALID;
   signal   ModMode     : std_logic_vector(1 downto 0) := "00";   -- start is single stream BPSK mode
   signal   Clk,
            reset       : std_logic := '1';
   signal   InvertOdd,
            InvertEven,
            InvertOddIn,
            InvertEvenIn,
            Verified,
            DataIn,
            SyncIn,
            ValidOut,
            SyncOut     : std_logic := '0';
   signal   OutCntr,
            InCntr      : signed(13 downto 0) := (5 downto 1=>'1', others=>'0');
   signal   Slip        : integer := 0;  -- -3 to 3
   signal   BitCntr,
            FrameCnt    : integer := 0;
   signal   SyncPattern : std_logic_vector(0 to 63) := SYNC_2;
   signal   ValidData   : std_logic_vector(5 downto 0) := "000001";
   SIGNAL   PRN         : std_logic_vector(14 downto 0) := (others=>'1');
   signal   NoiseSlv    : slv12;
   signal   Sum,
            Data        : sfixed(0 downto SfixPci'right);
   signal   NoiseGain,
            NoiseSum    : sfixed(3 downto -8);
   signal   Noise       : sfixed(0 downto -11);
   signal   DataOut,
            Expected    : std_logic_vector(Sum'length-1 downto 0);

begin

   process begin
      wait for 2.5 ns;
      Clk <= not Clk;
   end process;


   clk_process : process(Clk)
   begin
      if (rising_edge(Clk)) then
         reset    <= '0';
         if (ValidData(ValidData'left)) then
            if (OutCntr = 1784 * Frame * Rate + Rate * 4 - 6) then   -- change sync pattern before needed to send it for settling time
               -- Should verify on first pass,
               -- lock on 5,
               -- flywheel on 8,
               -- relock on 10,
               -- flywheel on 18
               -- start searching on 22, the verify/lock on 26/30
               if (FrameCnt = 4) then
                  SyncPattern  <= not SYNC_2;     -- should invert both
                  Mode         <= INVERT_BOTH;
                  InvertOddIn  <= '1';
                  InvertEvenIn <= '1';
               elsif (FrameCnt = 6) then
                  SyncPattern <= (others=>'0'); -- should start flywheeil
                  Mode        <= FLYWHEEL;
               elsif (FrameCnt = 8) then
                  SyncPattern <= SYNC_2 xor x"AAAAAAAAAAAAAAAA";  -- should resync and invert odds
                   InvertEvenIn <= '0';
                   Mode         <= INVERT_ODD;
               elsif (FrameCnt = 10) then
                  InvertOddIn  <= '0';
                  InvertEvenIn <= '1';
                  Mode         <= INVERT_EVEN;
                  SyncPattern <= SYNC_2 xor x"5555555555555555";  -- should invert evens
               elsif (FrameCnt = 16) then
                  SyncPattern <= (others=>'0');
                  Mode        <= FLYWHEEL;
               elsif (FrameCnt = 24) then
                  InvertOddIn  <= '0';
                  InvertEvenIn <= '0';
                  Mode         <= VALID;
                  SyncPattern  <= SYNC_2;
               end if;
               OutCntr <= OutCntr + 1;
               if (OutCntr(0)) then
                  Data    <= to_sfixed(std_logic_vector(OutCntr(Data'length-1 downto 0)) xor InvertOddIn, Data);
               else
                  Data    <= to_sfixed(std_logic_vector(OutCntr(Data'length-1 downto 0)) xor InvertEvenIn, Data);
               end if;
               PRN     <= PRN(13 downto 0) & (PRN(14) xor PRN(13));
               NoiseGain <= to_sfixed(0.0, 3, -8);
               NoiseSum <= (others=>'0');
            elsif (OutCntr = 1784 * Frame * Rate + Rate * 4 - Slip) then   -- adjust Slip over BitSlip range, usually 0
               if (BitCntr < SyncPattern'length - 1) then
                  BitCntr <= BitCntr + 1;
                  SyncIn  <= '0';
               else
                  BitCntr <= 0;
                  OutCntr <= (others=>'0');
                  SyncIn  <= '1';
                  FrameCnt <= FrameCnt + 1;
               end if;
               Data  <= to_sfixed(SIGNAL_AMP, Data)  when SyncPattern(BitCntr) else to_sfixed(-SIGNAL_AMP, Data);
               NoiseGain <= to_sfixed(0.0, 3, -8);
               NoiseSum <= resize(NoiseSum + abs(Noise), NoiseSum);
            else
               SyncIn  <= '0';
               OutCntr <= OutCntr + 1;
               if (OutCntr(0)) then
                  Data    <= to_sfixed(std_logic_vector(OutCntr(Data'length-1 downto 0)) xor InvertOddIn, Data);
               else
                  Data    <= to_sfixed(std_logic_vector(OutCntr(Data'length-1 downto 0)) xor InvertEvenIn, Data);
               end if;
               PRN     <= PRN(13 downto 0) & (PRN(14) xor PRN(13));
               NoiseGain <= to_sfixed(0.0, 3, -8);
            end if;
         end if;
         ValidData <= ValidData(ValidData'left-1 downto 0) & ValidData(ValidData'left);
         Noise     <= resize(to_sfixed(NoiseSlv, Noise) * NoiseGain, Noise);
         Sum       <= resize(Data + Noise, Sum, fixed_saturate, fixed_truncate);
      end if;
   end process;

   OutputProc : process(Clk)
   begin
      if (rising_edge(Clk)) then       -- When Slip is not zero, the frame is the wrong length. The ASM will correct via the Sync code
         if (SyncOut) then             -- if the sync is missing, the ASM will flywheel and the data is then off Slip clocks per frame.
            InCntr <= (others=>'0');   -- at which point Verified will fail.
         elsif (ValidOut) then
            InCntr <= InCntr + 1;
            if (DataOut = Expected) or (InCntr >= 1784 * Frame * Rate + Rate * 4 - 1) then    -- skip over ASM
               Verified <= '1';
            else
               Verified <= '0';
            end if;
         end if;
      end if;
   end process OutputProc;

   Expected <= std_logic_vector(InCntr(Sum'length-1 downto 0));

   DF_Rom : TurboDF_Rom
      PORT MAP(
         Clk      => Clk,
         Reset    => reset,
         CountEn  => ValidData(3),
         ReNoise  => NoiseSlv
      );


   Top : TurboASM
      GENERIC map(
         DATA_WIDTH  => Sum'length
      )
      PORT MAP (
         Clk         => Clk,
         Reset       => reset,
         Valid0     => ValidData(3),
         Valid1     => ValidData(3),
         Data0       => to_slv(Sum),
         Data1       => to_slv(Sum),
         ModMode     => ModMode,
         Rate        => std_logic_vector(to_unsigned(Rate,3)),
         Frame       => std_logic_vector(to_unsigned(Frame,3)),
         BitSlips    => 2x"3",
         IL_BET      => 5x"08",
         OOL_BET     => 5x"10",
         Verifies    => 5x"3",
         FlyWheels   => 5x"4",
         SyncOut     => SyncOut,
         InvertEven  => InvertEven,
         InvertOdd   => InvertOdd,
         DataOut     => DataOut,
         ValidOut    => ValidOut
   );

end rtl;

