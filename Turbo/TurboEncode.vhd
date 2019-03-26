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

Module Name: TurboEncode.vhd
Description:

ARGUMENTS :


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

ENTITY TurboEncode IS
   GENERIC
   (
      FILE_LOC    : string := "TurboCodes\"
   );
   PORT(
      Clk,                 -- must be at least 6x the DataValid rate
      reset          : IN  std_logic;
      Rate,
      Frame          : IN natural range 0 to 6;
      ClkRate        : IN natural range 0 to 255;
      SyncOut,
      ValidOut,
      DataOut        : OUT std_logic
   );
END TurboEncode;


ARCHITECTURE rtl OF TurboEncode IS

   COMPONENT IT_DT IS
      GENERIC(
            FILE_LOC    : string := ""
         );
      PORT(
         Clk,
         ce,
         reset          : IN  std_logic;
         IT_Addr,
         DT_Addr        : IN  natural range 0 to 8924;
         Frame          : IN  natural range 0 to 5;  -- 1784*(1,2,4 or 5) skip 3
         IT_Data,
         DT_Data        : OUT natural range 0 to 8919
      );
   END COMPONENT IT_DT;

   Component RandomCcsds IS
      PORT(
         Clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         RandomBit      : OUT std_logic
      );
   END Component RandomCcsds;

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;      -- only used to scale file readings. Watch the sign
         ADDR_WIDTH  : natural   := 9;
         FILE_IS_SLV : boolean   := false;    -- nonSLV files are not synthesizable, SLVs are 32 bit hex
         LATENCY     : positive  := 1;
         RAM_TYPE    : string    := "block"  -- or "distributed"
      );
      PORT(
         clk,
         ce,
         reset,
         WrEn           : IN  std_logic;
         WrAddr,
         RdAddrA,
         RdAddrB        : IN  natural range 0 to 2**ADDR_WIDTH-1;
         WrData         : In  std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
         RdOutA,
         RdOutB         : OUT std_logic_vector(DATA_WIDTH-1 DOWNTO 0)
      );
   END COMPONENT RAM_2Reads_1Write;

   constant SYNC_2         : std_logic_vector(63 downto 0)  := x"034776C7272895B0";
   constant SYNC_3         : std_logic_vector(95 downto 0)  := x"25D5C0CE8990F6C9461BF79C";
   constant SYNC_4         : std_logic_vector(127 downto 0) := X"034776C7272895B0FCB88938D8F76A4F";
   constant SYNC_6         : std_logic_vector(191 downto 0) := x"25D5C0CE8990F6C9461BF79CDA2A3F31766F0936B9E40863";

   constant FRAME_SIZE  : int_array(0 to 5) := (1784, 1*1784, 2*1784, 3*1784, 4*1784, 5*1784);
   constant A           : natural := 0;
   constant B           : natural := 1;

  -- Signals
   SIGNAL   PRN            : std_logic_vector(5 downto 0);  -- do PRN6 (63) to match Arb Gen
   SIGNAL   AsmShift       : std_logic_vector(0 to 191);
   SIGNAL   EncoderA,
            EncoderB       : std_logic_vector(4 downto 1);
   SIGNAL   DataBitA,
            DataBitB       : std_logic_vector(1 downto 0);
   SIGNAL   Filling        : std_logic_vector(2 downto 0);
   SIGNAL   UsingOut,
            UsingIn        : natural range 0 to 1;
   SIGNAL   DataRamA,
            DataRamB       : std_logic_vector(8923 downto 0);
   SIGNAL   CounterSlv     : std_logic_vector(13 downto 0);
   SIGNAL   Counter,
            IT_Data        : natural range 0 to 8923;
   SIGNAL   AsmCounter     : natural range 0 to 192;
   SIGNAL   RateCnt,
            State          : natural range 0 to 5;
   SIGNAL   ClkDiv         : natural range 0 to 255;
   SIGNAL   SyncPend,
            RandomBit,
            DataBitB1,
            Out0a,
            Out1a,
            Out2a,
            Out3a,
            Out1b,
            Out3b,
            EncoderAxor,
            EncoderBxor    : std_logic;

BEGIN

-- Need external data source with 2x clock based on both edges of incoming data clock. Only works for rate = 2;

   State <= 1 when (Counter < FRAME_SIZE(Frame)) else 2;
   CounterSlv <= std_logic_vector(to_unsigned(Counter, 14));

   Out0a <= DataBitA(UsingOut) when (State = 1) else EncoderA(3) xor EncoderA(4);
   Out1a <= EncoderAxor xor EncoderA(1) xor EncoderA(3) xor EncoderA(4);
   Out2a <= EncoderAxor xor EncoderA(2) xor EncoderA(4);
   Out3a <= EncoderAxor xor EncoderA(1) xor EncoderA(2) xor EncoderA(3) xor EncoderA(4);
   EncoderAxor <= DataBitA(UsingOut) xor EncoderA(3) xor EncoderA(4) when (State = 1) else '0';  -- (D3 xor x4) xor (D3 xor D4) = 0

   Out1b <= EncoderBxor xor EncoderB(1) xor EncoderB(3) xor EncoderB(4);
   Out3b <= EncoderBxor xor EncoderB(1) xor EncoderB(2) xor EncoderB(3) xor EncoderB(4);
   EncoderBxor <= DataBitB(UsingOut) xor EncoderB(3) xor EncoderB(4) when (State = 1) else '0';  -- (D3 xor x4) xor (D3 xor D4) = 0

   EncodeProc : process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            Counter     <= 0;
            Filling     <= "101";
            DataOut     <= '0';
            ValidOut    <= '0';
            SyncOut     <= '0';
            SyncPend    <= '0';
            UsingIn     <= 0;
            UsingOut    <= 0;
            RateCnt     <= 0;
            ClkDiv      <= 0;
            EncoderA    <= X"0";
            EncoderB    <= x"0";
            AsmCounter  <= 32 * Rate;
            AsmShift    <= SYNC_2 & 128x"0" when Rate = 2 else SYNC_3 & 96x"0" when (Rate = 3) else SYNC_4 & 64x"0" when (Rate = 4) else SYNC_6;
            PRN         <= (others=>'1');
         else
            if (ClkDiv = 1) then
               ValidOut <= '1';
               SyncPend <= '0';
               SyncOut  <= SyncPend;   -- SyncOut is one clock after ValidIn of last ASM bit
            else
               ValidOut <= '0';
               SyncOut  <= '0';
            end if;

            if (ClkDiv < ClkRate) then
               ClkDiv <= ClkDiv + 1;
            else
               if (Filling /= "101") then  -- wait till first buffer is full
                  ClkDiv <= 0;
                  if (AsmCounter > 0) then
                     DataOut    <= AsmShift(0);
                     AsmShift   <= AsmShift(1 to 191) & '0';
                     AsmCounter <= AsmCounter - 1;
                     EncoderA   <= x"0";
                     EncoderB   <= x"0";
                     if (AsmCounter = 1) then
                        SyncPend  <= '1';
                     end if;
                  else
                     If (RateCnt < Rate - 1) then
                        RateCnt <= RateCnt + 1;
                     else
                        RateCnt <= 0;
                        if (Counter < FRAME_SIZE(Frame) + 4 - 1) then
                           Counter <= Counter + 1;
                           EncoderA <= EncoderA(3 downto 1) & EncoderAxor;
                           EncoderB <= EncoderB(3 downto 1) & EncoderBxor;
                        else  -- done this frame, start another
                           UsingOut <= 1 - UsingOut;
                           AsmCounter <= 32 * Rate;
                           AsmShift   <= SYNC_2 & 128x"0" when Rate = 2 else SYNC_3 & 96x"0" when (Rate = 3) else SYNC_4 & 64x"0" when (Rate = 4) else SYNC_6;
                           Counter <= 0;
                           Filling(UsingIn) <= '1';
                        end if;
                     end if;

                     case(Rate) is
                     when 2 =>
                        case(RateCnt) is
                           when 0 =>      DataOut <= Out0a xor RandomBit;
                           when others => DataOut <= Out1a xor RandomBit when (not CounterSlv(0)) else Out1b xor RandomBit;
                        end case;
                     when 3 =>
                        case(RateCnt) is
                           when 0 =>      DataOut <= Out0a xor RandomBit;
                           when 1 =>      DataOut <= Out1a xor RandomBit;
                           when others => DataOut <= Out1b xor RandomBit;
                        end case;
                     when 4 =>
                        case(RateCnt) is
                           when 0 =>      DataOut <= Out0a xor RandomBit;
                           when 1 =>      DataOut <= Out2a xor RandomBit;
                           when 2 =>      DataOut <= Out3A xor RandomBit;
                           when others => DataOut <= Out1b xor RandomBit;
                        end case;
                     when others =>
                        case(RateCnt) is
                           when 0 =>      DataOut <= Out0a xor RandomBit;
                           when 1 =>      DataOut <= Out1a xor RandomBit;
                           when 2 =>      DataOut <= Out2A xor RandomBit;
                           when 3 =>      DataOut <= Out3a xor RandomBit;
                           when 4 =>      DataOut <= Out1b xor RandomBit;
                           when others => DataOut <= Out3b xor RandomBit;
                        end case;
                     end case;
                  end if;
               end if;
            end if;

            if (or(Filling)) then         -- fill next framne during sync
               PRN <= PRN(PRN'left-1 downto 0) & (PRN(PRN'left) xor PRN(PRN'left-1));
--               if (UsingIn) then
--                  DataRamA(Counter) <= PRN(PRN'left);
--               else
--                  DataRamB(Counter) <= PRN(PRN'left);
--               end if;
               if (Counter < FRAME_SIZE(Frame) - 1) then
                  Counter <= Counter + 1;
               else
                  Filling   <= "000";
                  Counter <= 0;
                  UsingIn   <= 1 - UsingIn;
               end if;
--            elsif (ClkDiv = 0) then
--               DataBitA1 <= DataRamA(Counter);
--               DataBitA0 <= DataRamB(Counter);
--            elsif (ClkDiv = 1) then
--               DataBitB1 <= DataRamA(IT_Data);
--               DataBitB0 <= DataRamB(IT_Data);
            end if;

         end if;
      end if;
   end process EncodeProc;

   DataA : RAM_2Reads_1Write
      GENERIC MAP (
         DATA_WIDTH  => 1,
         ADDR_WIDTH  => 14,
         LATENCY     => 1,
         RAM_TYPE    => "block"  -- or "distributed"
      )
      PORT MAP(
         clk         => Clk,
         ce          => '1',
         reset       => reset,
         WrEn        => Filling(0),
         WrAddr      => Counter,
         RdAddrA     => Counter,
         RdAddrB     => IT_Data,
         WrData      => PRN(PRN'left downto PRN'left),
         RdOutA      => DataBitA(0 downto 0),
         RdOutB      => DataBitB(0 downto 0)
   );

   DataB : RAM_2Reads_1Write
      GENERIC MAP (
         DATA_WIDTH  => 1,
         ADDR_WIDTH  => 14,
         LATENCY     => 1,
         RAM_TYPE    => "block"  -- or "distributed"
      )
      PORT MAP(
         clk         => Clk,
         ce          => '1',
         reset       => reset,
         WrEn        => Filling(1),
         WrAddr      => Counter,
         RdAddrA     => Counter,
         RdAddrB     => IT_Data,
         WrData      => PRN(PRN'left downto PRN'left),
         RdOutA      => DataBitA(1 downto 1),
         RdOutB      => DataBitB(1 downto 1)
   );

   IT_DT_Data : IT_DT
      GENERIC MAP(
         FILE_LOC    => FILE_LOC
      )
      PORT MAP(
         Clk      => Clk,
         ce       => '1',
         reset    => reset,
         IT_Addr  => Counter,
         DT_Addr  => 0,
         Frame    => Frame,
         IT_Data  => IT_Data,
         DT_Data  => open
   );

   RandomCcsds_u : RandomCcsds
      PORT MAP (
         Clk         => Clk,
         reset       => SyncOut,
         ce          => ValidOut,
         RandomBit   => RandomBit
   );

END rtl;

