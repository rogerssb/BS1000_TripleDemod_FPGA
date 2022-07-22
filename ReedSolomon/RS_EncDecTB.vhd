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

Module Name: RS_EncDecTB.vhd
Description:   Fill a 2D array of Dimension Rows x Cols bytes according to Pack
input.
   If Pack, fill across by Cols then down one Row. Read by Rows, then Cols.
   If unPack, fill by Rows then Cols. Read by Cols then Rows

   Passing data through both processes should recreate the original stream.

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
USE work.semco_pkg.all;
use std.env.stop;

ENTITY RS_EncDecTB IS
END RS_EncDecTB;


ARCHITECTURE rtl OF RS_EncDecTB IS

   component RS_DecoderTop
      port (
         clk,        -- 93.3MHz
         ce,
         reset,
         busClk,
         cs,
         wr0,
         wr1,
         wr2,
         wr3               : IN  STD_LOGIC;
         addr              : IN  STD_LOGIC_VECTOR(12 downto 0);
         din               : IN  SLV32;
         dout              : OUT SLV32;
         bitEn,
         bitData           : IN  STD_LOGIC;
         dac0Select,
         dac1Select,
         dac2Select        : IN  SLV4;
         dac0ClkEn,
         dac1ClkEn,
         dac2ClkEn         : OUT STD_LOGIC;
         dac0Data,
         dac1Data,
         dac2Data          : OUT SLV18;
         rsDecBitEnOut,
         rsDecBitOut       : OUT STD_LOGIC
      );
   end component RS_DecoderTop;

   COMPONENT RS_EncoderTop IS
      port (
         clk,        -- 93.3MHz
         ce,
         reset,
         busClk,
         cs,
         wr0,
         wr1,
         wr2,
         wr3               : IN  STD_LOGIC;
         addr              : IN  STD_LOGIC_VECTOR(12 downto 0);
         din               : IN  SLV32;
         dout              : OUT SLV32;
         sourceSelect      : OUT SLV4;
         bitEn,
         bitData           : IN  STD_LOGIC;
         dac0ClkEn,
         dac1ClkEn,
         dac2ClkEn         : OUT STD_LOGIC;
         dac0Data,
         dac1Data,
         dac2Data          : OUT SLV18;
         encDataOut,
         encDataEn,
         syncOutIntLv      : OUT STD_LOGIC;
         FrameCount           : IN UINT4
      );
   END COMPONENT RS_EncoderTop;


   constant RS_DEC_CONTROL       : unsigned(12 downto 0) := 13x"40";
   constant RS_DEC_STATUS        : unsigned(12 downto 0) := 13x"44";
   constant RS_DEC_ASM_CONTROL   : unsigned(12 downto 0) := 13x"48";
   constant RS_DEC_NCO           : unsigned(12 downto 0) := 13x"50";
   constant RS_ENC_CONTROL       : unsigned(12 downto 0) := 13x"20";
   constant RS_ENC_NCO           : unsigned(12 downto 0) := 13x"28";
   type     mcuFsm               is (IDLE, SETUP, WRITE, FINISH);
   type     asm_mode_t           is (SEARCHING, VERIFY, LOCK, FLYWHEEL);

   -- Signals
   signal   pnGen                : SLV16;
   signal   ModeAsm              : asm_mode_t := SEARCHING;
   signal   mcuMode              : mcuFsm := IDLE;
   signal   addr                 : unsigned(12 downto 0) := RS_DEC_CONTROL;
   signal   clk,
            ClkOver2,
            Fail3,
            bitEn,
            WaitForSync,
            RS_DecStatVld,
            ShiftValid,
            ShiftOut,
            PnValid,
            syncOutIntLv,
            uutDecBitEnOut,
            uutDecBitOut,
            rsDecBitEnOut,
            rsDecBitOut          : std_logic := '0';
   signal   reset                : std_logic := '1';
   signal   SymCount             : UINT8;
   signal   AsmMode,
            wrLsb,
            wrMsb,
            CsEnc,
            CsDec,
            TwoWords             : std_logic;
   signal   McuDataIn,
            McuDataOut,
            uutDataOut,
            McuDataCapt,
            RS_DecStatus         : SLV32;
   signal   InterLeave,
            FrameCount           : UINT4;
   signal   FrameLen             : SLV16;
   signal   R_IN                 : Uint8 := 8x"20";
   signal   N_IN                 : Uint8 := 8x"FF";
   signal   SYNC_SIZE            : natural := 32;
   signal   K                    : real;
   signal   NcoRatio             : real;
   signal   InBits,
            OutBits              : natural;
   signal   PN63_ShifterOut,
            PN63Pattern                : std_logic_vector(62 downto 0) := "000" & 60x"E4B_766a_fc10_c53d";

BEGIN

   process begin
      wait for 5 ns;   -- run at 93MHz rate
         clk <= not clk;
         if (clk) then
            ClkOver2 <= not ClkOver2;
         end if;
   end process;
/*
   process begin
      reset <= '1';
      wait for 20 ns;
      reset <= '0';
      wait;
   end process;
*/
--   SEQUENCER_PROC : process
--   begin
--      wait until (Fail1 or Fail2/* or Fail3*/ or Done);
--      if (Fail1) then
--         report "Test1 Failed";
--      elsif (Fail2) then
--         report "Test2 Failed";
--      elsif (Fail3) then
--         report "Test3 Failed";
--      elsif (Done) then
--         report "Test: OK";
--      end if;
--      stop;
--   end process;

   EncodeProcess : process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            SymCount <= 8x"00";
            pnGen    <= 16x"005F";
         else
            if (SymCount < 15) then
               SymCount <= SymCount + 1;
               bitEn    <= '0';
            else
               SymCount <= 8x"00";
               bitEn <= '1';
               pnGen <= pnGen(14 downto 0) & (pnGen(5) xor pnGen(4));   -- PN63
        --       pnGen <= pnGen(14 downto 0) & (pnGen(8) xor pnGen(4));    -- PN511
        --       pnGen <= pnGen(14 downto 0) & (pnGen(10) xor pnGen(8));    -- PN2047
            end if;

         if (bitEn) then
            PN63_ShifterOut   <= PN63_ShifterOut(61 downto 0) & pnGen(7);
            if (PnValid) then
               PN63Pattern <= PN63Pattern(61 downto 0) & PN63Pattern(62);
            end if;
         end if;

         end if;
      end if;
   end process;

   PnValid  <= (PN63_ShifterOut ?= PN63Pattern);

   RS_Enc : RS_EncoderTop
      port map (
         clk               => clk,
         ce                => '1',
         reset             => reset,
         busClk            => ClkOver2,
         cs                => CsEnc,
         wr0               => wrLsb,
         wr1               => wrLsb,
         wr2               => wrMsb,
         wr3               => wrMsb,
         addr              => std_logic_vector(addr),
         din               => McuDataIn,
         dout              => open,
         sourceSelect      => open,
         bitEn             => bitEn,
         bitData           => pnGen(7),
         dac0ClkEn         => open,
         dac1ClkEn         => open,
         dac2ClkEn         => open,
         dac0Data          => open,
         dac1Data          => open,
         dac2Data          => open,
         encDataOut        => ShiftOut,
         encDataEn         => ShiftValid,
         syncOutIntLv      => syncOutIntLv,
         FrameCount        => FrameCount
      );

   InterLeaveProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            FrameCount <= 4x"0";
            InterLeave <= 4x"1";
         elsif (syncOutIntLv) then
            if (FrameCount < 15) then
               FrameCount <= FrameCount + 1;
            else
               FrameCount <= 4x"0";
 --              if (InterLeave = x"5") then
 --                 InterLeave <= x"8";
 --              elsif (InterLeave = x"8") then
                  if (R_IN = 8x"10") then
                     R_IN <= 8x"20";
                     InterLeave <= x"1";
                  else
                     R_IN <= 8x"10";
                     InterLeave <= x"1";
       --              stop;
                  end if;
 --              else
 --                 InterLeave <= InterLeave + 1;
 --              end if;
            end if;

            OutBits <= 0;
            InBits  <= 0;
         else
            if (rsDecBitEnOut) then
               OutBits <= OutBits + 1;
            end if;
            if (ShiftValid) then
               InBits <= InBits + 1;
            end if;
         end if;
      end if;
   end process;

   RS_Dec : RS_DecoderTop
      port map(
         clk               => clk,
         ce                => '1',
         reset             => reset,
         busClk            => ClkOver2,
         cs                => CsDec,
         wr0               => wrLsb,
         wr1               => wrLsb,
         wr2               => wrMsb,
         wr3               => wrMsb,
         addr              => std_logic_vector(addr),
         din               => McuDataIn,
         dout              => McuDataOut,
         bitEn             => ShiftValid,
         bitData           => ShiftOut,
         dac0Select        => 4x"0",
         dac1Select        => 4x"0",
         dac2Select        => 4x"0",
         dac0ClkEn         => open,
         dac1ClkEn         => open,
         dac2ClkEn         => open,
         dac0Data          => open,
         dac1Data          => open,
         dac2Data          => open,
         rsDecBitEnOut     => rsDecBitEnOut,
         rsDecBitOut       => rsDecBitOut
      );

   ModeAsm        <= <<signal RS_Dec.RS_Asm.Mode : asm_mode_t>>;
   RS_DecStatus   <= <<signal RS_Dec.Dec_stat_tdata : SLV32>>;
   RS_DecStatVld  <= <<signal RS_Dec.Dec_stat_tvalid : STD_LOGIC>>;
   WaitForSync    <= <<signal RS_Dec.RS_Interleaver.WaitForSync : STD_LOGIC>>;

   Fail3 <= '1' when ((ModeAsm = LOCK) and (RS_DecStatVld = '1') and (WaitForSync = '0') and (RS_DecStatus /= 32x"0")) else '0';


/*  Per CCSDS 131.0-B-3 the managed parameters for Reed Solomon consists of:
    Error Correction Capability (E symbols)     8, 16 yielding RS(255,239) and RS(255,223)
    yields message length of K = 255-2*E
    Interleaving Depths I                       1,2, 3, 4, 5, 8
    Shortend Length (S symbols)                 Integer 0 to K

                                    31:16       15:12               9:8         7:0
    Reed Solomon Control Register   FrameLen    Interleave[3:0]     R_IN_MSBs   N_IN[7:0]
R_MSBs = 01 or 10. I append 0000s for 010000 or 100000 for 16 or 32
N_IN defines the total symbols per frame, usually 255 but could be shortened by Q
FrameLen needs calculated as I(255 - K + S), for normal frame, S = K so -K+S = 0. FrameLen - 255*I

                                    31:24           23:16           15:0
    Reed Solomon Status Register    FailCnt[7:0]    FrameCnt[7:0]   ErrCnt[15:0]

                                    31:29       28:24       21:16       13:8        4:0
    Attached Sync Marker (ASM)      BitSlips    IL_BET      OOL_BET     Verifies    FlyWheels
            Default
    BitSlips    3   Allowed number of clock slips between ASMs, slips can be plus or minus
    IL_BET      4   In Lock Bit Error Threshold is the number of ASM bits than can be wrong when locked
    OOL_BET     4   Out Of Lock Bit Error Threshold is the number of ASM bits than can be wrong when searching (not locked)
    Verifies    3   Number of verify frames before declaring Lock. Prevents premature locking on first n correlations above threshold
    FlyWheels   4   Number of ASM misses before reverting back to Search mode

    FailCnt and ErrCnt will accumulate errors until read, which resets them to 0
    FrameCnt keeps track of the number of frames between reads so FERs can be calculated
*/

   mcuProcess : process (ClkOver2)
   begin
      if (rising_edge(ClkOver2)) then
         FrameLen <= std_logic_vector(to_unsigned(to_integer(InterLeave) * to_integer(N_IN) * 8 + SYNC_SIZE, 16));
         case (mcuMode) is
            when IDLE =>
               wrLsb    <= '0';
               wrMsb    <= '0';
               CsEnc    <= '0';
               CsDec    <= '0';
               mcuMode  <= SETUP;
               K        <= real(to_integer(N_IN - R_IN));
               NcoRatio <= 1.0/16.0 * ((real(to_integer(N_IN)) * real(to_integer(InterLeave)))+ 4.0)/(K * real(to_integer(InterLeave)));
            when SETUP =>
               case (addr) is
                  when RS_DEC_CONTROL =>
                     McuDataIn <= FrameLen & std_logic_vector(InterLeave) & std_logic_vector(R_IN(7 downto 4)) & std_logic_vector(N_IN);
                     TwoWords  <= '1';
--                  when RS_DEC_STATUS =>
--                     McuDataIn <= 32x"0"; -- read status only
--                     TwoWords  <= '1';
                  when RS_DEC_NCO =>
                     McuDataIn <= std_logic_vector(to_unsigned(integer(1.0/16.0 * 2.0**32), 32));
                     TwoWords  <= '1';
                  when RS_ENC_NCO =>
                     McuDataIn <= std_logic_vector(to_unsigned(integer(NcoRatio * 2.0**32), 32));
                     TwoWords  <= '1';
                  when RS_ENC_CONTROL =>
                     McuDataIn <= 8x"0" & std_logic_vector(N_IN) & std_logic_vector(InterLeave) & "0000" & std_logic_vector(R_IN);
                     TwoWords  <= '1';
                  when others =>
                     McuDataIn <= 32x"6404_0304";
                     TwoWords  <= '1';
               end case;
               mcuMode <= WRITE;
            when WRITE =>
               if (TwoWords) then
                  wrLsb <= '1';
                  wrMsb <= '1';
               else
                  wrLsb <= not Addr(1);
                  wrMsb <= Addr(1);
               end if;
               CsEnc    <= Addr(5);
               CsDec    <= Addr(6);
               mcuMode  <= FINISH;
            when others =>
               McuDataCapt <= McuDataOut;
               if (addr = RS_DEC_ASM_CONTROL) then
                  addr <= RS_ENC_CONTROL;
               elsif (addr = RS_ENC_NCO) then
                  addr <= RS_DEC_CONTROL;
                  reset <= '0';
               elsif (TwoWords) then
                  addr <= addr + 4;
               else
                  addr <= addr + 2;
               end if;
               wrLsb    <= '0';
               wrMsb    <= '0';
               CsEnc    <= '0';
               CsDec    <= '0';
               mcuMode  <= IDLE;
         end case;
      end if;
   end process mcuProcess;

END rtl;

