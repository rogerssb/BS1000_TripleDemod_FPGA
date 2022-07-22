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

Module Name: RS_EncoderTop.vhd
   Description:   Fill a 2D array of Dimension Rows x Cols bytes by rows
then read out by columns to interleave the data, then Reed Solomon encode
each Cols worth of shuffled data and send to transmitter.

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
5-15-22 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Semco_pkg.ALL;

ENTITY RS_EncoderTop IS
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
      FrameCount        : in uint4
   );
END RS_EncoderTop;


ARCHITECTURE rtl OF RS_EncoderTop IS

   component rsEncRegs is
      PORT (
         busClk,
         cs,
         wr0,
         wr1,
         wr2,
         wr3               : IN  std_logic;
         addr              : IN  STD_LOGIC_VECTOR(12 downto 0);
         dataIn            : IN  SLV32;
         dataOut           : OUT SLV32;
         checks,                          -- check symbols
         blocks            : OUT SLV8;    -- code word symbols count
         InterLeave,
         sourceSelect      : OUT SLV4;
         phaseInc          : OUT SLV32
   );
   END component rsEncRegs;

   COMPONENT fifo_OneToEight
      PORT (
         clk,
         srst,
         wr_en,
         rd_en          : IN STD_LOGIC;
         din            : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
         full,
         empty          : OUT STD_LOGIC;
         dout,
         rd_data_count  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT fifo_EightToOne
      PORT (
         clk,
         srst,
         wr_en,
         rd_en          : IN STD_LOGIC;
         din            : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         dout           : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         full,
         empty          : OUT STD_LOGIC;
         wr_data_count  : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT rs_encoder
      PORT (
         aclk,
         aresetn                          : IN STD_LOGIC;
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
         MAX_INT_BITS   : positive := 4;
         PACK           : boolean  := false
      );
      PORT(
         Clk,
         Reset,
         CE,
         ValidIn,       -- dataIn is valid
         SyncIn         : IN  std_logic; -- start of frame
         ColsSlv        : IN  std_logic_vector (MAX_COL_BITS - 1 downto 0);
         InterLeave     : IN  std_logic_vector (MAX_INT_BITS - 1 downto 0);
         DataIn         : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
         SyncOut,
         LastOut,
         ValidOut       : OUT std_logic;     -- buffer is full and can be read
         DataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
      );
   END COMPONENT RS_InterLeave;

   constant ASM           : SLV8_Array(0 to 3) := (x"1a", x"cf", x"fc", x"1d");

   -- Signals
   signal   K,                      -- N_IN - R_IN
            BlockCount              : UINT8;
   signal   EncoderValidIn,
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
            InterLeaveVld,
            NcoMsb,
            FailEnc,
            AsmInsert,
            InFifoEmpty,
            InFifoFull,
            OutFifoEmpty,
            OutFifoFull             : std_logic := '0';
   signal   fifoData,
            OutFifoDataIn,
            InDataCount,
            R_IN,
            N_IN,
            ResetDly,
            InterLeaveOut,
            Ramp,
            EncodedDataOut          : SLV8;
   signal   InterLeave              : SLV4;
   signal   BitDataArray,
            OutDataArray            : std_logic_vector(0 downto 0);
   signal   phaseInc                : SLV32;
   signal   NCO                     : Uint32 := 32x"0";
   signal   SyncCount               : natural range 0 to 3;
   signal   OutDataCount            : std_logic_vector(10 downto 0);
   signal   OutBytes                : natural;
   signal   Expected                : uint8;
   signal   IntLvCnt                : uint4;
   signal   ExpectCnt               : natural := 0;
   signal   ExpectedError,
            AsmInsFall,
            AsmInsDly,
            ExpCntOverFlw,
            Once                    : std_logic := '0';
   signal   CheckSum                : UInt8_Array(0 to 17) := (8x"00", 8x"4D", 8x"CC", 8x"0A", 8x"4D",
                  8x"FA", 8x"7B", 8x"6C", 8x"33", 8x"2D", 8x"02", 8x"33", 8x"97", 8x"DA", 8x"5E", 8x"6E", 8x"6F", 8x"00");

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of phaseInc, InterLeave, R_IN, N_IN, NCO, fifoData, EncoderValidIn, EncoderLastIn,
         EncodedValidOut, EncodedLastOut, EncodedLastOutDly, EncoderLastMissing, EncoderLastWrong,
         EncoderCtrlWrong, OutFifoDataIn, InterLeaveVld, AsmInsert, encDataEn, OutFifoFull, OutFifoEmpty,
         encDataOut : signal is "TRUE";

BEGIN

   rs_encoder_regs : rsEncRegs
      PORT MAP (
         busClk         => busClk,
         cs             => cs,
         wr0            => wr0,
         wr1            => wr1,
         wr2            => wr2,
         wr3            => wr3,
         addr           => addr,
         dataIn         => din,
         dataOut        => dout,
         checks         => R_IN,
         blocks         => N_IN,
         InterLeave     => InterLeave,
         phaseInc       => phaseInc,
         sourceSelect   => sourceSelect
   );

   K <= unsigned(N_IN) - unsigned(R_IN);
   bitDataArray(0) <= bitData;

   RS_EncInputFifo : fifo_OneToEight -- pack data into fifo till encoder is ready
      PORT MAP (
         clk            => clk,
         srst           => reset,
         din            => bitDataArray,
         wr_en          => bitEn,
         rd_en          => EncoderValidIn,
         dout           => fifoData,         -- serial data is packed into 8 bit bytes for encoding
         full           => InFifoFull,
         empty          => InFifoEmpty,
         rd_data_count  => InDataCount
   );

   EncodeProcess : process (clk)
   begin
      if (rising_edge(clk)) then
         EncodedLastOutDly <= EncodedLastOut and EncodedValidOut;
         if (reset or EncoderLastMissing) then
            BlockCount     <= 8x"00";
            EncoderValidIn <= '0';
            EncoderLastIn  <= '0';
            EncoderStart   <= '0';
            ResetDly       <= 8x"FF";
         else
            if (EncoderCtrlRdy) then      -- wait for encoder ready to start
               ResetDly <= ResetDly(ResetDly'left - 1 downto 0) & '0';

               if (ResetDly(6) and not ResetDly(5)) then
                  EncoderStart <= '1';
               elsif (EncoderStart and not ResetDly(7)) then
                  EncoderStart <= '0';
               end if;
            end if;

            if (not ResetDly(7)) then
               if (EncoderLastIn) then
                  if (EncoderCtrlRdy) then      -- wait for Control Ready before releasing LastIn
                     EncoderStart   <= '1';     -- start a new frame
                     EncoderLastIn  <= '0';
                     EncoderValidIn <= '0';
                  end if;                                   -- don't do more than one push
               elsif (EncoderReady and not InFifoEmpty and not EncoderValidIn) then
                  EncoderValidIn <='1';
                  if (BlockCount < K - 1) then
                     BlockCount <= BlockCount + 1;
                  else
                     BlockCount     <= 8x"00";
                     EncoderLastIn  <= '1';
                  end if;
               else
                  EncoderValidIn <= '0';
               end if;
            end if;
         end if;
      end if;
   end process;


   FailEnc <= EncoderValidIn and not EncoderReady;

   RS_Enc : rs_encoder
      PORT MAP (
         aclk                             => clk,
         aresetn                          => not (reset or EncoderLastMissing),
         s_axis_input_tdata               => fifoData,    --std_logic_vector(BlockCount), FZ TODO  insert BlockCount here for test
         s_axis_input_tvalid              => EncoderValidIn,
         s_axis_input_tready              => EncoderReady,
         s_axis_input_tlast               => EncoderLastIn,
         s_axis_ctrl_tdata                => R_IN & N_IN,
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

   TestRamp : process(clk)    -- run blockCount into s_axis_input_tdata for end to end test
   begin
      if (rising_edge(clk)) then
         if (EncodedValidOut) then
            Ramp <= EncodedDataOut;
         end if;
      end if;
   end process;

   RS_Interleaver : RS_InterLeave
      GENERIC MAP(
         DATA_WIDTH     => 8,
         MAX_COL_BITS   => 8,
         MAX_INT_BITS   => 4,
         PACK           => true        -- We're encoding, so shuffle the deck. The decoder unshuffles it
      )
      PORT MAP(
         Clk            => Clk,
         Reset          => Reset,
         CE             => '1',
         ColsSlv        => N_IN,
         InterLeave     => InterLeave,
         SyncIn         => EncodedLastOutDly,
         ValidIn        => EncodedValidOut,
         DataIn         => EncodedDataOut,
         SyncOut        => syncOutIntLv,
         LastOut        => open,
         ValidOut       => InterLeaveVld,
         DataOut        => InterLeaveOut
      );


   SyncProcess : process(clk)    -- wait for end of interleave then insert SYNC bytes
   begin
      if (rising_edge(clk)) then
         if (syncOutIntLv) then
            SyncCount <= 0;
            AsmInsert <= '1';
         elsif (SyncCount < 3) then
            SyncCount <= SyncCount + 1;
         else
            AsmInsert <= '0';
         end if;
      end if;
   end process;

   OutFifoDataIn <= InterLeaveOut when (not AsmInsert) else ASM(SyncCount);

   RS_EncOutputFifo : fifo_EightToOne
      PORT MAP (
         clk            => clk,
         srst           => reset,
         din            => OutFifoDataIn,
         wr_en          => InterLeaveVld or AsmInsert,
         rd_en          => encDataEn,
         dout           => OutDataArray,
         full           => OutFifoFull,
         empty          => OutFifoEmpty,
         wr_data_count  => OutDataCount
   );

   dac0ClkEn <= '1';
   dac1ClkEn <= '1';
   dac2ClkEn <= '1';
   dac0Data  <= '0' & OutDataCount & 6x"0";
   dac1Data  <=  AsmInsert & 17x"0";
   dac2Data  <=  FailEnc & 17x"0";

   ClockOutProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            NCO         <= 32x"0";
            NcoMsb      <='0';
            encDataEn   <='0';
         else
            if (not OutFifoEmpty) then
               NCO <= NCO + unsigned(phaseInc);
            end if;
            NcoMsb    <= NCO(31);
            encDataEn <= (NCO(31) ?/= NcoMsb) or OutFifoFull;
         end if;

-- test code
         AsmInsDly <= AsmInsert;
         if (AsmInsDly and not AsmInsert and Once) then
            AsmInsFall <= '1';
         end if;

         if (FrameCount > 2) then      -- allow interleaver ping-pong buffers to fill
            if (syncOutIntLv) then
               OutBytes <= 0;
               ExpectCnt <= 0;
               Expected  <= unsigned(ASM(0));
               IntLvCnt  <= unsigned(InterLeave);
               ExpectedError  <= '0';
               AsmInsFall     <= '0';
               ExpCntOverFlw  <= '0';
               Once           <= '1';
            elsif (InterLeaveVld or AsmInsert) then
               OutBytes <= OutBytes + 1;  -- simple byte counter to check frame length
               if (Once = '1') then -- and (AsmInsFall = '1')) then
                  ExpectedError <= '1' when (Expected /= unsigned(OutFifoDataIn)) else '0';
                  if (ExpectCnt < 3) then          -- continuous count regardless of interleave
                     ExpectCnt <= ExpectCnt + 1;
                     Expected <= unsigned(ASM(ExpectCnt+1));
                  elsif (ExpectCnt = 3) then       -- < 3 done in upper loop, check payload
                     ExpectCnt <= ExpectCnt + 1;
                     Expected <= 8x"1";
                  elsif (InterLeave /= x"1") then  -- change expected on first interleave cycle
                     if (IntLvCnt = x"1") then
                        IntLvCnt <= unsigned(InterLeave);
                     else
                        IntLvCnt <= IntLvCnt - 1;
                     end if;

                     if (IntLvCnt = x"1") then
                        ExpectCnt <= ExpectCnt + 1;
                        if (ExpectCnt >= 241) then    -- check checksums
                           Expected <= CheckSum(ExpectCnt - 241);
                        else
                           Expected <= Expected + 1;
                        end if;
                     end if;
                  else
                     ExpectCnt <= ExpectCnt + 1;
                     if (ExpectCnt >= 241) then    -- check checksums
                        Expected <= CheckSum(ExpectCnt - 241);
                     else
                        Expected <= Expected + 1;
                     end if;
                  end if;
               end if;
            end if;
         else                    -- prepare for next Interleave
            OutBytes <= 0;
            ExpectCnt <= 0;
            Expected  <= unsigned(ASM(0));
            IntLvCnt  <= unsigned(InterLeave);
            ExpectedError  <= '0';
            AsmInsFall     <= '0';
            ExpCntOverFlw  <= '0';
         end if;
      end if;
   end process;

   encDataOut <= OutDataArray(0);

END rtl;

