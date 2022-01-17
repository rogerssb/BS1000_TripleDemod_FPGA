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
         ReadyOut       : OUT std_logic;     -- buffer is full and can be read
         DataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
      );
   END COMPONENT RS_InterLeave;

   COMPONENT rs_decoder_CCSDS
      PORT (
         aclk : IN STD_LOGIC;
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
            Dec_out_tlast,
            Dec_stat_tvalid,
            S_ctrl_tready,
            SyncOutAsm,
            SyncOutIntLv,
            SyncTime,
            Invert,
            ValidAsm,
            Dec_ctrl_tdata_invalid,
            Dec_stat_tready,
            Dec_tlast_unexpected,
            Dec_ctrl_tvalid,
            Dec_out_tready,
            Dec_tlastn,
            InterLeaveVld,
            Fail,
            TLast                      : std_logic;
   signal   ColsSlv,
            ASM_Data,
            InterLeaveOut,
            Dec_out_tdata,
            BitOutShift                : SLV8;
   signal   Errors                     : std_logic_vector(5 downto 0);
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
/*
   signal   ValidInt_f                 : ufixed(15 downto 0);
   signal   RecipInt_f,
            BitOutCounter_f            : ufixed(2 downto -16);
*/

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of dec_tready, dec_unexpected, dec_tlast, dec_tlast_missing, dec_out_tvalid, dec_out_tlast,
      dec_stat_tvalid, s_ctrl_tready, SyncOutAsm, SyncOutIntLv, SyncTime, Invert, ValidAsm, dec_ctrl_tdata_invalid,
      dec_stat_tready, dec_tlast_unexpected, dec_ctrl_tvalid, dec_out_tready, dec_tlastn, InterLeaveVld, Fail, TLast,
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
         TLast       => Dec_tlast,
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
         SyncOut        => SyncOutIntLv,
         ReadyOut       => InterLeaveVld,
         DataOut        => InterLeaveOut
      );

   myRS_Decoder : rs_decoder_CCSDS
      PORT MAP (
         aclk                             => Clk,
         s_axis_input_tdata               => InterLeaveOut,
         s_axis_input_tvalid              => InterLeaveVld,
         s_axis_input_tlast               => Dec_tlast,
         s_axis_input_tready              => Dec_tready,       -- ignored
         s_axis_ctrl_tdata                => Dec_ctrl_tdata,   -- control info from MCU
         s_axis_ctrl_tvalid               => SyncOutIntLv,     -- start of frame
         s_axis_ctrl_tready               => s_ctrl_tready,
         m_axis_output_tdata              => Dec_out_tdata,
         m_axis_output_tvalid             => Dec_out_tvalid,
         m_axis_output_tready             => Dec_out_tready,
         m_axis_output_tlast              => Dec_out_tlast,
         m_axis_stat_tdata                => Dec_stat_tdata,
         m_axis_stat_tvalid               => Dec_stat_tvalid,
         m_axis_stat_tready               => Dec_stat_tready,
         event_s_input_tlast_missing      => Dec_tlast_missing,
         event_s_input_tlast_unexpected   => Dec_tlast_unexpected,
         event_s_ctrl_tdata_invalid       => Dec_ctrl_tdata_invalid
   );

   SpreadBytes : process (Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            BitOutShift   <= 8x"00";
            BitCounter    <= 0;
        else
            if (Dec_out_tvalid) then
               BitCounter     <= 8;
               BitOutShift    <= Dec_out_tdata;
               rsDecBitEnOut  <= '1';
            else
               if (BitCounter = 0) then
                  rsDecBitEnOut     <= '0';
               else
                  BitCounter   <= BitCounter - 1;
                  BitOutShift    <= BitOutShift sll 1;
               end if;
            end if;
            rsDecBitOut <= BitOutShift(7);
         end if;
      end if;
   end process SpreadBytes;
/*
   SpreadBytes : process (Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            T_ValidInterval   <= 16x"0";
            T_ValidCounter    <= 16x"0";
            BitOutShift       <= 8x"00";
            BitOutCounter_f   <= 19x"0";
        else

            if (Dec_out_tvalid) then   -- determine time between tvalid pulses for each output byte
               T_ValidInterval <= T_ValidCounter;
               T_ValidCounter    <= 16x"0";
               BitOutCounter_f   <= RecipInt_f;
               BitOutShift       <= Dec_out_tdata;
               rsDecBitEnOut     <= '1';
            else
               T_ValidCounter <= T_ValidCounter + 1;
               if (BitOutCounter_f < 1) then
                  BitOutCounter_f   <= resize(BitOutCounter_f + RecipInt_f, BitOutCounter_f);
                  rsDecBitEnOut     <= '0';
               else
                  BitOutCounter_f   <= RecipInt_f;
                  rsDecBitEnOut  <= '1';
                  BitOutShift    <= BitOutShift sll 1;
               end if;
            end if;
            rsDecBitOut <= BitOutShift(7);

            ValidInt_f <= to_ufixed(T_ValidInterval);
            RecipInt_f <= resize(ONE_F / ValidInt_f / EIGHT_F, RecipInt_f);
         end if;
      end if;
   end process SpreadBytes;
*/
   Fail     <= dec_stat_tdata(0);
   Errors   <= dec_stat_tdata(7 downto 2);

   dac0Data <= DAC_HIGH when (BitData) else DAC_LOW;
   dac1Data <= DAC_HIGH when (SyncOutAsm) else DAC_LOW;
   dac0ClkEn <= '1';
   dac1ClkEn <= '1';
   -- dac2 doesn't exist on triple demod cards

end rtl;
