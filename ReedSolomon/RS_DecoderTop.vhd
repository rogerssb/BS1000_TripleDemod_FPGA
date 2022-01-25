-- Width = 8                  typical symbol width, can be 3 to 12
-- n=s^Width - 1 = 255        bits per symbol
-- k=223 or 239               data symbols per frame, CCSDS uses 223 or 239
-- r=n-k, 32 or 16             number of check symbols
-- t=(n-k)/2 16 or 8          max symbol errors correctable
--
-- PD=2t^2+9t+3 203 or 659    processing delay, if > n, can't run full speed so the (255,223) code needs 2.6 frames
-- Our highest data rate is 40Mb or 5MB, which is 46.6/5 9.33 clocks per symbol, which means the tvalid only goes
-- high every 9th clock while the decoder runs at the full 93.3MHz and should be able to keep up with a full speed
-- signal.
--
-- shortened code is when code is less than n, still 16 or 32 check symbols
--
-- s_axis_ctrl channel => R_IN{5:0], N_IN[7:0]
-- N_IN is the frame length, so static at 255 for CCSDS
-- R_IN is the number of check symbols so 16 or 32
-- PUNC_SEL would be in the s_axis_ctrl word but I see no mention of puncturing the RS codes in the CCSDS green book.
--
-- The incoming data stream will contain an ASM sync marker followed by a RS frame. Note any Viterbi is transparent
-- and ignored. This layer will find and strip off the ASM marker then pack bits into 8 bit symbols, inverting if
-- the ASM deems necessary. The symbols are fed to the rs_decoder ignoring its s_axis_input_tready since it should
-- always by high anyway. TLast is not used since the decoder ignores it.
--
-- interleaving depth L = 1, 2, 3, 4, or 5  default is 1. Interleaving is done after the encoder and thus
-- deinterleaving is done on the Viterbi output after ASM stripping. The size of the frame is 255 * L with a
-- TLast at the end of the frame. This routine perform deinterleaving, recover the RS Decoder output and then
-- pass the data on in a serial fashion to the upper hdl level.
--
-- The rs_decoder puts out bytes of data that need reserialized. The module count the clocks between output bytes
-- that are stored in a shift register. The count is divided by eight to generate an 8x output strobe.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.semco_pkg.all;

entity RS_DecoderTop is
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
end RS_DecoderTop;

architecture rtl of RS_DecoderTop is

   COMPONENT reedSolomonRegs
      PORT (
         rsClk,
         busClk,
         cs,
         wr0, wr1, wr2, wr3,
         fail, errorsVld      : IN  std_logic;
         addr                 : IN  std_logic_vector(4 downto 0);
         errors               : IN  std_logic_vector(5 downto 0);
         dataIn               : IN  SLV32;
         dataOut              : OUT SLV32;
         InterLeave           : OUT SLV4;
         Cols                 : OUT SLV8;
         BitSlips             : OUT std_logic_vector(2 downto 0);
         IL_BET,
         OOL_BET,
         Verifies,
         FlyWheels             : OUT std_logic_vector(4 downto 0);
         s_axis_control,
         frameLen              : OUT SLV16
      );
   END COMPONENT;

   COMPONENT ReedSolomonASM IS
   PORT (
      Clk,
      Reset,
      Valid          : IN  std_logic;
      DataIn         : IN  std_logic;
      FrameLen       : IN  natural range 0 to 16383;
      BitSlips       : IN  std_logic_vector(2 downto 0);  -- Bit Slips is the ±alignment slop between ASMs
      IL_BET,                                             -- In Lock Bit Error Threshold. Allowed number of invalid bits
      OOL_BET,                                            -- Out of Lock Bit Error Threshold.
      Verifies,                                           -- number of valid frames before lock declared
      FlyWheels      : IN  std_logic_vector(4 downto 0);  -- number of invalid frames before lock lossed
      TLast,
      SyncOut,
      Invert,
      SyncTime,
      ValidOut       : OUT std_logic;
      DataOut        : OUT SLV8                          -- invert corrected bytes
   );
   END COMPONENT ReedSolomonASM;

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
         LastOut,
         ValidOut       : OUT std_logic;     -- buffer is full and can be read
         DataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
      );
   END COMPONENT RS_InterLeave;

   COMPONENT rs_decoder_CCSDS
      PORT (
         aclk,
         aresetn                          : IN STD_LOGIC;
         s_axis_input_tdata               : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_input_tvalid              : IN STD_LOGIC;
         s_axis_input_tlast               : IN STD_LOGIC;
         s_axis_input_tready              : OUT STD_LOGIC;
         s_axis_ctrl_tdata                : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         s_axis_ctrl_tvalid               : IN STD_LOGIC;
         s_axis_ctrl_tready               : OUT STD_LOGIC;
         m_axis_output_tdata              : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_output_tvalid             : OUT STD_LOGIC;
         m_axis_output_tready             : IN STD_LOGIC;
         m_axis_output_tlast              : OUT STD_LOGIC;
         m_axis_stat_tdata                : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_stat_tvalid               : OUT STD_LOGIC;
         m_axis_stat_tready               : IN STD_LOGIC;
         event_s_input_tlast_missing      : OUT STD_LOGIC;
         event_s_input_tlast_unexpected   : OUT STD_LOGIC;
         event_s_ctrl_tdata_invalid       : OUT STD_LOGIC
      );
   END COMPONENT;

   constant DAC_HIGH       : SLV18 := 18x"1ffff";
   constant DAC_LOW        : SLV18 := 18x"20000";
   constant ONE_F          : ufixed(2 downto 0) := to_ufixed(1.0, 2, 0);
   constant EIGHT_F        : ufixed(3 downto 0) := to_ufixed(8.0, 3, 0);

   signal   Dec_tready,
            Dec_unexpected,
            Dec_tlast,
            Dec_tlast_missing,
            Dec_out_tvalid,
            Dec_out_tready,
            Dec_out_tlast,
            Dec_stat_tvalid,
            S_ctrl_tready,
            SyncOutAsm,
            SyncOutIntLv,
            SyncTime,
            Invert,
            ValidAsm,
            ASM_tlast,
            Dec_ctrl_tdata_invalid,
            Dec_tlast_unexpected,
            InterLeaveVld,
            IntLvLast,
            Fail,
            TLast                      : std_logic;
   signal   HoldDataValid,
            HoldCtrlValid              : std_logic := '1';
   signal   HoldCounter                : UINT8 := 8x"00";
   signal   ColsSlv,
            ASM_Data,
            Dec_tdata,
            InterLeaveOut,
            Dec_out_tdata,
            BitOutShift                : SLV8;
   signal   Errors,
            DecCtrlValid               : std_logic_vector(5 downto 0);
   signal   Dec_stat_tdata             : SLV32;
   signal   T_ValidInterval,
            T_ValidCounter             : unsigned(15 downto 0);
   signal   FrameLenSlv,
            Dec_ctrl_tdata             : SLV16;
   signal   RowsSlv                    : SLV4;
   signal   BitSlips                   : std_logic_vector(2 downto 0);
   signal   IL_BET,
            OOL_BET,
            Verifies,
            FlyWheels                  : std_logic_vector(4 downto 0);
   signal   FrameLen                   : natural range 0 to 16383;     -- total bytes in the frame L=(255-2E-q)*I per CCSDS 131.0-B-3 11.5.3
   signal   BitCounter                 : natural range 0 to 8;
   signal   BlockCount                 : natural range 0 to 255;
   signal   RS_DecReset                : std_logic_vector(1 downto 0);

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of dec_tready, dec_unexpected, dec_tlast, dec_tlast_missing, dec_out_tvalid, dec_out_tlast,
      dec_stat_tvalid, s_ctrl_tready, SyncOutAsm, SyncOutIntLv, SyncTime, Invert, ValidAsm, dec_ctrl_tdata_invalid,
      dec_tlast_unexpected, InterLeaveVld, Fail, TLast,
      ColsSlv, ASM_Data, interLeaveOut, dec_out_tdata, Errors, dec_stat_tdata, FrameLenSlv, dec_ctrl_tdata, RowsSlv,
      BitSlips, IL_BET, OOL_BET, Verifies, FlyWheels, FrameLen : signal is "TRUE";

begin

   RSregs : reedSolomonRegs
      PORT MAP(
         rsClk          => Clk,
         busClk         => busClk,
         cs             => cs,
         wr0            => wr0,
         wr1            => wr1,
         wr2            => wr2,
         wr3            => wr3,
         addr           => addr(4 downto 0),
         dataIn         => din,
         dataOut        => dout,
         fail           => Fail,
         errors         => Errors,
         errorsVld      => Dec_stat_tvalid,
         Interleave     => RowsSlv,
         Cols           => ColsSlv,
         bitSlips       => BitSlips,
         IL_BET         => IL_BET,
         OOL_BET        => OOL_BET,
         Verifies       => Verifies,
         FlyWheels      => FlyWheels,
         FrameLen       => FrameLenSlv,
         s_axis_control => dec_ctrl_tdata
      );

   FrameLen <= to_integer(unsigned(FrameLenSlv));

   RS_Asm : ReedSolomonASM
      PORT MAP (
         Clk         => Clk,
         Reset       => Reset,
         Valid       => BitEn,
         DataIn      => BitData,
         FrameLen    => FrameLen,
         BitSlips    => BitSlips,
         IL_BET      => IL_BET,
         OOL_BET     => OOL_BET,
         Verifies    => Verifies,
         FlyWheels   => FlyWheels,
         SyncOut     => SyncOutAsm,
         TLast       => ASM_tlast,     -- not used
         SyncTime    => SyncTime,      -- not used
         Invert      => Invert,        -- not used
         DataOut     => ASM_Data,
         ValidOut    => ValidAsm
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
         CE             => CE,
         Pack           => '0',
         ColsSlv        => ColsSlv,
         RowsSlv        => RowsSlv,
         SyncIn         => SyncOutAsm,
         ValidIn        => ValidAsm,
         DataIn         => ASM_Data,
         LastOut        => IntLvLast,
         SyncOut        => SyncOutIntLv,
         ValidOut       => InterLeaveVld,
         DataOut        => InterLeaveOut
      );

   -- The RS_Decoder has no way to force it into sync with the interleaver output without
   -- doing a hard reset for two clocks, wait three then strobe DecCtrlValid.
   DecControl : process (Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            RS_DecReset    <= "11";
            DecCtrlValid   <= 6x"0";
         else
            if (SyncOutIntLv) then
               BlockCount   <= 0;
               RS_DecReset  <= Dec_tlast_missing & Dec_tlast_missing;
               DecCtrlValid <= "000001";
            elsif ((InterLeaveVld = '1') and (BlockCount < 255)) then
               BlockCount <= BlockCount + 1;
            else
               RS_DecReset <= RS_DecReset(0) & '0';
               DecCtrlValid   <= DecCtrlValid(4 downto 0) & '0';
            end if;
         end if;
      end if;
   end process;

   Dec_tlast <= '1' when (BlockCount = 254) else '0';
   Dec_tdata <= 8x"55" when (BlockCount = 200) else InterLeaveOut;

   myRS_Decoder : rs_decoder_CCSDS
      PORT MAP (
         aclk                             => Clk,
         aresetn                          => not RS_DecReset(1),
         s_axis_input_tdata               => Dec_tdata, -- InterLeaveOut,
         s_axis_input_tvalid              => not HoldDataValid and InterLeaveVld,
         s_axis_input_tlast               => Dec_tlast,
         s_axis_input_tready              => dec_tready,       -- ignored
         s_axis_ctrl_tdata                => Dec_ctrl_tdata,   -- control info from MCU
         s_axis_ctrl_tvalid               => not HoldCtrlValid and DecCtrlValid(5),     -- start of frame
         s_axis_ctrl_tready               => s_ctrl_tready,
         m_axis_output_tdata              => Dec_out_tdata,
         m_axis_output_tvalid             => Dec_out_tvalid,
         m_axis_output_tready             => Dec_out_tready,
         m_axis_output_tlast              => Dec_out_tlast,
         m_axis_stat_tdata                => Dec_stat_tdata,
         m_axis_stat_tvalid               => Dec_stat_tvalid,
         m_axis_stat_tready               => '1',
         event_s_input_tlast_missing      => Dec_tlast_missing,
         event_s_input_tlast_unexpected   => Dec_tlast_unexpected,
         event_s_ctrl_tdata_invalid       => Dec_ctrl_tdata_invalid
   );

   SpreadBytes : process (Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            BitOutShift    <= 8x"00";
            BitCounter     <= 0;
            Dec_out_tready <= '1';
            HoldDataValid  <= '1';
            HoldCtrlValid  <= '1';
            HoldCounter    <= 8x"00";
            rsDecBitEnOut  <= '0';
         else
            if (HoldDataValid) then
               if (HoldCounter < 255) then
                  HoldCounter <= HoldCounter + 1;
                  if (HoldCounter = 10) then
                     HoldCtrlValid <= '0';
                  elsif (HoldCounter = 128) then
                     HoldDataValid <= '0';
                  end if;
               end if;
            elsif (SyncOutIntLv) then  -- use holdCounter to check IntLvVal's per block
               HoldCounter <= 8x"00";
            elsif (InterLeaveVld) then
               HoldCounter <= HoldCounter + 1;
            end if;

            if (BitCounter > 0) then
               if (BitCounter = 1) then
                  rsDecBitEnOut  <= '0';
                  Dec_out_tready <= '1';
                  BitCounter     <= 0;
               else
               rsDecBitEnOut  <= '1';
                  BitCounter  <= BitCounter - 1;
                  BitOutShift <= BitOutShift sll 1;
               end if;
            elsif (Dec_out_tvalid) then
               BitOutShift    <= Dec_out_tdata;
               BitCounter     <= 8;
               Dec_out_tready <= '0';
            end if;
            rsDecBitEnOut  <= not Dec_out_tready;
            rsDecBitOut <= BitOutShift(7);
         end if;
      end if;
   end process SpreadBytes;

   Fail     <= dec_stat_tdata(0);
   Errors   <= dec_stat_tdata(7 downto 2);

   dac0Data <= DAC_HIGH when (BitData) else DAC_LOW;
   dac1Data <= DAC_HIGH when (SyncOutAsm) else DAC_LOW;
   dac0ClkEn <= '1';
   dac1ClkEn <= '1';
   -- dac2 doesn't exist on triple demod cards

end rtl;
