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

Module Name: RS_DecoderTopTB.vhd
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

ENTITY RS_DecoderTopTB IS
END RS_DecoderTopTB;


ARCHITECTURE rtl OF RS_DecoderTopTB IS

   COMPONENT OffsetNCO IS
      PORT (
         aclk : IN STD_LOGIC;
         aresetn : IN STD_LOGIC;
         s_axis_config_tvalid : IN STD_LOGIC;
         s_axis_config_tready : OUT STD_LOGIC;
         s_axis_config_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_data_tvalid : OUT STD_LOGIC;
         m_axis_data_tready : IN STD_LOGIC;
         m_axis_data_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
      );
   END COMPONENT;

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

   COMPONENT rs_encoder_CCSDS
      PORT (
         aclk : IN STD_LOGIC;
         s_axis_input_tdata               : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_input_tvalid              : IN  STD_LOGIC;
         s_axis_input_tready              : OUT STD_LOGIC;
         s_axis_input_tlast               : IN  STD_LOGIC;
         s_axis_ctrl_tdata                : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
         s_axis_ctrl_tvalid               : IN  STD_LOGIC;
         s_axis_ctrl_tready               : OUT STD_LOGIC;
         m_axis_output_tdata              : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_output_tvalid             : OUT STD_LOGIC;
         m_axis_output_tready             : IN  STD_LOGIC;
         m_axis_output_tlast              : OUT STD_LOGIC;
         event_s_input_tlast_missing      : OUT STD_LOGIC;
         event_s_input_tlast_unexpected   : OUT STD_LOGIC;
         event_s_ctrl_tdata_invalid       : OUT STD_LOGIC
      );
   END COMPONENT;

   COMPONENT RS_InterLeave
      GENERIC(
         DATA_WIDTH     : positive := 8;
         MAX_COL_BITS   : positive := 8;
         MAX_ROW_BITS   : positive := 4
      );
      PORT(
         Clk,
         Reset,
         CE,
         ValidIn,       -- dataIn is valid
         SyncIn,        -- start of frame
         Pack           : IN  std_logic;     -- pack or unpack
         ColsSlv        : IN  std_logic_vector (MAX_COL_BITS - 1 downto 0);
         RowsSlv        : IN  std_logic_vector (MAX_ROW_BITS - 1 downto 0);
         DataIn         : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
         SyncOut,
         ValidOut       : OUT std_logic;     -- buffer is full and can be read
         DataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
      );
   END COMPONENT RS_InterLeave;

   COMPONENT digitalPLL
      PORT (
         clk,
         reset,
         referenceClkEn    : IN  std_logic;
         centerFreq        : IN SLV32;
         loopGain          : IN std_logic_vector(4 downto 0);
         feedbackDivider   : IN SLV8;
         feedbackClkEn,
         dllOutputClk,
         filteredRefClk    : OUT std_logic;
         phaseError        : OUT SLV8
      );
   END COMPONENT;


   CONSTANT DLLCENTERFREQ        : SLV32 := 32x"bc0_0000"; --af8af8a";
   CONSTANT DLLLOOPGAIN          : std_logic_vector(4 downto 0) := 5x"08";
   CONSTANT DLLFEEDBACKDIVIDER   : SLV8 := 8x"1";
   CONSTANT TestASM              : BOOLEAN := false;
   CONSTANT SYNC_SIZE            : natural := 32;
   CONSTANT SYNC                 : std_logic_vector(0 to SYNC_SIZE - 1) := x"1acffc1d";
   CONSTANT CHECK_SUMS32         : UINT8_ARRAY(0 to 31) := (8d"102",8d"215",8d"187",8d"199",8d"199",
                                       8d"61",8d"46",8d"219",8d"228",8d"51",8d"113",8d"26",8d"62",
                                       8d"204",8d"43",8d"108",8d"92",8d"229",8d"113",8d"41",8d"28",
                                       8d"209",8d"56",8d"111",8d"129",8d"186",8d"49",8d"180",8d"49",
                                       8d"195",8d"204",8d"79");
   CONSTANT CHECK_SUMS16        : UINT8_ARRAY(0 to 15) := (8d"77",8d"204",8d"10",8d"77",8d"250",
                                       8d"123",8d"108",8d"51",8d"45",8d"2",8d"51",8d"151",8d"218",
                                       8d"94",8d"110",8d"111");
   constant RS_DEC_CONTROL      : unsigned(12 downto 0) := 13x"00";
   constant RS_DEC_STATUS       : unsigned(12 downto 0) := 13x"04";
   constant RS_DEC_ASM_CONTROL  : unsigned(12 downto 0) := 13x"08";
   type     mcuFsm               is (IDLE, SETUP, WRITE, FINISH);
   type     asm_mode_t         is (SEARCHING, VERIFY, LOCK, FLYWHEEL);

   -- Signals

   signal   ModeAsm           : asm_mode_t := SEARCHING;
   signal   mcuMode           : mcuFsm := IDLE;
   signal   addr              : unsigned(12 downto 0) := 13x"0000";
   signal   clk,
            ClkOver2                   : std_logic := '0';
   signal   reset                      : std_logic := '1';

   signal   MaxCount                   : natural := 16;
   signal   FakeCount,
            ValidCount,
            ValidMax,
            CheckCnt                   : natural range 0 to 64535 := 0;
   signal   DecOutTData,
            Expected1,
            Expected2,
            ShiftIn,

            R_IN,
            N_IN,
            K,                   -- N_IN - R_IN
            ExpectCols,
            ExpectCntCol,
            SymCount,
            BlockCount              : UINT8 := 8x"44";
   signal   ExpectRows,
            ExpectCntRow            : UINT4;
   signal   Dec_out_tvalid,
            DecValidDly1,
            DecValidDly2,
            RS_DecStatVld,
            rsDecBitEnOut,
            rsDecBitOut,
            NewRow,
            Done,
            Fail1,
            Fail2,
            Fail3,
            WaitForSync,
            EncoderValidIn,
            EncoderLastIn,
            EncoderReady,
            EncoderStart,
            EncoderCtrlRdy,
            EncodedValidOut,
            EncodedLastOut,
            EncodedLastOutDly,
            EncoderLastMissing,
            EncoderLastWrong,
            EncoderCtrlWrong,
            SyncOutIntLv,
            InterLeaveVld           : std_logic := '0';
   signal   s_axis_input_tdata,
            EncodedDataOut,
            EncodedDataOut1,
            InterLeaveOut,
            dllPhaseError,
            ColsSlv                 : SLV8;
   signal   RowsSlv                 : SLV4;
   signal   ShiftCount              : natural range 0 to 32;
   signal   Shifter,
            RS_DecStatus,
            McuDataIn,
            McuDataOut,
            McuDataCapt             : SLV32;
   signal   FrameLen                : SLV16;
   signal   AsmMode,
            wrLsb,
            wrMsb,
            cs,
            TwoWords,
            ShiftActive,
            ShiftValid,
            ShiftPreValid,
            Pop,
            ShiftOut,
            dllOutputClk,
            pllReferenceClk         : std_logic;
   signal   ShiftFifo               : SLV8_ARRAY(0 to 63);
   signal   FifoWr,
            FifoRd,
            SyncCount               : natural range 0 to 63;

BEGIN

   process begin
      wait for 5 ns;   -- run at 93MHz rate
         clk <= not clk;
         if (clk) then
            ClkOver2 <= not ClkOver2;
         end if;
   end process;

   process begin
      reset <= '1';
      wait for 20 ns;
      reset <= '0';
      wait;
   end process;

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
      variable Rows_v      : UINT4;
      variable ValidIn_v,
               LastIn_v,
               Start_v  : std_logic;
   begin
      if (rising_edge(clk)) then
         Rows_v      := unsigned(RowsSlv);
         ValidIn_v   := '0';
         Start_v     := '0';
         LastIn_v    := EncoderLastIn;
         EncodedLastOutDly <= EncodedLastOut and EncodedValidOut;
         if (reset) then
            R_IN        <= 8x"20";
            N_IN        <= 8x"FF";
            K           <= N_IN - R_IN;
            SymCount    <= 8x"00";
            BlockCount  <= 8x"00";
            Done        <= '0';
            ValidIn_v   := '0';
            LastIn_v    := '0';
            Start_v     := '1';
            ColsSlv     <= std_logic_vector(N_IN);
            RowsSlv     <= 4x"01";
            FakeCount   <= to_integer(Rows_v) * 16;
         else
            if (EncoderLastIn) then
               if (SymCount < R_IN) then
                  SymCount <= SymCount + 1;
               else
                  if (EncoderCtrlRdy) then
                     Start_v := '1';
                     LastIn_v := '0';
                     SymCount <= 8x"00";
                  end if;
               end if;
            elsif (EncoderReady) then
               if (SymCount < 186) then
                  SymCount <= SymCount + 1;
               else
                  ValidIn_v   :='1';
                  SymCount    <= 8x"0";
                  if (BlockCount < K - 1) then
                     BlockCount <= BlockCount + 1;
                  else
                     BlockCount  <= 8x"00";     -- last encoder input is x00
                     LastIn_v    := '1';
                     if (FakeCount > 0) then
                        FakeCount <= FakeCount - 1;
                     else
                        Rows_v := unsigned(RowsSlv);
                        if (Rows_v = x"5") then
                           Rows_v := x"8";
                        elsif (Rows_v = x"8") then
                           Done <= '1';
                        else
                           Rows_v := Rows_v + 1;
                        end if;
                        FakeCount   <= to_integer(Rows_v) * 16;
                        RowsSlv     <= std_logic_vector(Rows_v);
                        NewRow      <= '1';
                     end if;
                  end if;
               end if;
            end if;

            if (WaitForSync) then
               NewRow <= '0';
            end if;

            if (EncoderStart) then
               LastIn_v := '0';
            end if;
         end if;
         EncoderValidIn <= ValidIn_v;
         EncoderLastIn  <= LastIn_v;
         EncoderStart   <= Start_v;
      end if;
   end process;


   Fail1 <= EncoderValidIn and not EncoderReady;

   RS_Enc : rs_encoder_CCSDS
      PORT MAP (
         aclk                             => clk,
         s_axis_input_tdata               => std_logic_vector(BlockCount),
         s_axis_input_tvalid              => EncoderValidIn,
         s_axis_input_tready              => EncoderReady,
         s_axis_input_tlast               => EncoderLastIn,
         s_axis_ctrl_tdata                => std_logic_vector(R_IN) & std_logic_vector(N_IN),
         s_axis_ctrl_tvalid               => EncoderStart,
         s_axis_ctrl_tready               => EncoderCtrlRdy,
         m_axis_output_tdata              => EncodedDataOut,
         m_axis_output_tvalid             => EncodedValidOut,
         m_axis_output_tready             => '1',
         m_axis_output_tlast              => EncodedLastOut,
         event_s_input_tlast_missing      => EncoderLastMissing,
         event_s_input_tlast_unexpected   => EncoderLastWrong,
         event_s_ctrl_tdata_invalid       => EncoderCtrlWrong
   );

   RS_Interleaver : RS_InterLeave
      GENERIC MAP(
         DATA_WIDTH     => 8,
         MAX_COL_BITS   => 8,
         MAX_ROW_BITS   => 4
      )
      PORT MAP(
         Clk            => Clk,
         Reset          => Reset,
         CE             => '1',
         Pack           => '1',
         ColsSlv        => ColsSlv,
         RowsSlv        => RowsSlv,
         SyncIn         => EncodedLastOutDly,
         ValidIn        => EncodedValidOut,
         DataIn         => EncodedDataOut,
         SyncOut        => SyncOutIntLv,
         ValidOut       => InterLeaveVld,
         DataOut        => InterLeaveOut
      );

   PostIntLvVerify : process (clk)
      variable Good_v   : std_logic;
   begin
      if (rising_edge(clk)) then
         if (reset or NewRow) then
            Expected1      <= 8x"01";
            ExpectCntRow   <= 4x"0";
            ExpectCntCol   <= 8x"00";
            ExpectRows     <= 4x"1";
            ExpectCols     <= 8x"00";
            WaitForSync    <= '1';
         else
            if (SyncOutIntLv) then
               ValidCount     <= 0;
               ValidMax       <= ValidCount;
               Expected1      <= 8x"01";
               ExpectCntRow   <= 4x"0";
               ExpectCntCol   <= 8x"00";
               ExpectRows     <= unsigned(RowsSlv);
               ExpectCols     <= unsigned(ColsSlv);
               WaitForSync    <= '0';
            elsif (InterLeaveVld and not WaitForSync) then
               ValidCount <= ValidCount + 1;
               if (ExpectCntRow < ExpectRows - 1) then
                  ExpectCntRow <= ExpectCntRow + 1;
               else
                  ExpectCntRow   <= 4x"0";
                  ExpectCntCol   <= ExpectCntCol + 1;
                  if (ExpectCntCol < K - 2) then
                     Expected1 <= Expected1 + 1;
                     CheckCnt  <= 0;
                  elsif (ExpectCntCol = K - 2) then
                     Expected1 <= 8x"00";
                  else
                     if (CheckCnt < R_IN) then
                        if (R_IN = 32) then
                           Expected1 <= CHECK_SUMS32(CheckCnt);
                        else
                           Expected1 <= CHECK_SUMS16(CheckCnt);
                        end if;
                        CheckCnt  <= CheckCnt + 1;
                     else
                        Expected1 <= 8x"01";
                     end if;
                  end if;
               end if;

            end if;
         end if;
      Good_v := (unsigned(InterLeaveOut) ?= Expected1);
      Good_v := Good_v or (InterleaveOut ?= 8x"00");
      Fail2 <= not Good_v and (WaitForSync ?= '0');
      end if;
   end process;

   PostEncodeProcess : process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            ShiftCount     <= 0;
            Shifter        <= 32x"0";
            AsmMode        <= '0';
            ShiftActive    <= '0';
            ShiftValid     <= '0';
            ShiftOut       <= '0';
            FifoWr         <= 0;
            FifoRd         <= 0;
            SyncCount      <= 0;
         else
            ShiftOut   <= Shifter(ShiftCount);
            ShiftValid <= ShiftPreValid;

            if (InterLeaveVld) then
               ShiftFifo(FifoWr) <= InterLeaveOut;
               if (FifoWr < 63) then
                  FifoWr <= FifoWr + 1;
               else
                  FifoWr <= 0;
               end if;
            end if;

            if (SyncOutIntLv) then
               SyncCount      <= FifoWr;
               AsmMode        <= '1';
               ShiftPreValid  <= '0';  -- hold shifting on sync in
            elsif (Pop) then
               Pop            <= '0';
               Shifter        <= 24x"0" & ShiftFifo(FifoRd);
               ShiftCount     <= 7;
               ShiftPreValid  <= '1';
               if (FifoRd < 63) then
                  FifoRd <= FifoRd + 1;
               else
                  FifoRd <= 0;
               end if;
            elsif (ShiftCount > 0) then
               ShiftPreValid  <= '1';  -- turn back on after sync detected
               ShiftCount <= ShiftCount - 1;
            elsif ((FifoRd = SyncCount) and (AsmMode = '1')) then
                  AsmMode <= '0';
                  Shifter <= SYNC;
                  ShiftCount <= 31;
                  ShiftPreValid  <= '1';
            elsif (FifoRd /= FifoWr) then
               Pop <= '1';
               ShiftPreValid  <= '0';
            else
               ShiftPreValid  <= '0';
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
         cs                => cs,
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

   ModeAsm <= <<signal RS_Dec.RS_Asm.Mode : asm_mode_t>>;
   RS_DecStatus <= <<signal RS_Dec.Dec_stat_tdata : SLV32>>;
   RS_DecStatVld <= <<signal RS_Dec.Dec_stat_tvalid : STD_LOGIC>>;

   Fail3 <= '1' when ((ModeAsm = LOCK) and (RS_DecStatVld = '1') and (WaitForSync = '0') and (RS_DecStatus /= 32x"040206")) else '0';

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
         FrameLen <= std_logic_vector( to_unsigned(to_integer(unsigned(RowsSlv)) * 255 * 8 + SYNC_SIZE, 16));
         case (mcuMode) is
            when IDLE =>
               wrLsb    <= '0';
               wrMsb    <= '0';
               cs       <= '0';
               mcuMode  <= SETUP;
            when SETUP =>
               case (addr) is
                  when RS_DEC_CONTROL =>
                     McuDataIn <= FrameLen & RowsSlv & std_logic_vector(R_IN(7 downto 4)) & std_logic_vector(N_IN);
                     TwoWords  <= '1';
--                  when RS_DEC_STATUS =>
--                     McuDataIn <= 32x"0"; -- read status only
--                     TwoWords  <= '1';
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
               cs       <= '1';
               mcuMode  <= FINISH;
            when others =>
               McuDataCapt <= McuDataOut;
               if (addr = 13x"08") then
                  addr <= 13x"00";
               elsif (TwoWords) then
                  addr <= addr + 4;
               else
                  addr <= addr + 2;
               end if;
               wrLsb    <= '0';
               wrMsb    <= '0';
               cs       <= '0';
               mcuMode  <= IDLE;
         end case;
      end if;
   end process mcuProcess;


ASMtest: if (TestASM)  generate
begin
   <<signal RS_Dec.Dec_out_tvalid : std_logic>> <= Dec_out_tvalid;
   <<signal RS_Dec.Dec_out_tdata  : SLV8>>      <= std_logic_vector(DecOutTData);

   testProcess : process (Clk)
   begin
      if (rising_edge(Clk)) then
         if (FakeCount > 0) then
            FakeCount <= FakeCount - 1;
            Dec_out_tvalid <= '0';
         else
            FakeCount <= MaxCount - 1;
            Dec_out_tvalid <= '1';
         end if;

         -- capture data
         if (rsDecBitEnOut) then
            ShiftIn <= ShiftIn(6 downto 0) & rsDecBitOut;
         end if;

         -- confirm results
         DecValidDly1 <= Dec_out_tvalid;
         DecValidDly2 <= DecValidDly1;
         if (Dec_out_tvalid) then
            DecOutTData <= DecOutTData + 1;
            Expected1 <= DecOutTData;
            Expected2 <= Expected1;
         end if;
         if (DecValidDly2) then
            Fail1 <= (Expected2 ?/= ShiftIn);
         end if;

         -- next data rate
         if (DecOutTData = 8x"54") then
            DecOutTData <= 8x"44";
            MaxCount <= MaxCount + 1;
         end if;
      end if;
   end process testProcess;
end generate;

END rtl;

