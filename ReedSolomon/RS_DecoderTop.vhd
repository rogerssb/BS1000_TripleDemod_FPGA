-- Width = 8                  typical symbol width, can be 3 to 12 bits per symbol
-- n=s^Width - 1 = 255        code block length
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
-- Dec_ctrl_tdata channel => {R_IN{5:0], N_IN[7:0]}
-- N_IN is the shortened frame length of 33 to 255. Usually set to 255 for non-shortened code blocks.
-- R_IN is the number of check symbols so 16 or 32
-- PUNC_SEL would be in the Dec_ctrl_tdata word but I see no mention of puncturing the RS codes in the CCSDS green book.
--
-- The incoming data stream will contain an ASM sync marker followed by a RS frame. Note any Viterbi wrapper is transparent
-- and already remove. This layer will find and strip off the ASM marker then pack bits into 8 bit symbols, inverting if
-- the ASM deems necessary. The symbols are fed to the rs_decoder ignoring its s_axis_input_tready since it should
-- always by high anyway.
--
-- interleaving depth L = 1, 2, 3, 4, 5 or 8  default is 1. Interleaving is done after the encoder and thus
-- deinterleaving is done on the Viterbi output after ASM stripping. The size of the frame is 255 * L with a
-- TLast at the end of the frame. This routine performs deinterleaving, recovers the RS Decoder output and then
-- pass the data on in a serial fashion to the upper hdl level.
--
-- The rs_decoder puts out bytes of data that need reserialized. The module counts the clocks between output bytes
-- that are stored in a shift register. The count is divided by eight to generate an 8x output strobe.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE work.Semco_pkg.ALL;

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
      sourceSelect      : OUT SLV4;
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
         fail, errorsVld         : IN  std_logic;
         addr                    : IN  std_logic_vector(4 downto 0);
         errors                  : IN  std_logic_vector(5 downto 0);
         dataIn                  : IN  SLV32;
         dataOut                 : OUT SLV32;
         sourceSelect            : OUT SLV4;
         InterLeave              : OUT SLV4;
         Cols                    : OUT SLV8;
         BitSlips                : OUT std_logic_vector(2 downto 0);
         IL_BET,
         OOL_BET,
         Verifies,
         FlyWheels               : OUT std_logic_vector(4 downto 0);
         Dec_ctrl_tdata,
         frameLen                : OUT SLV16;
         PhaseInc,
         SyncWord                : OUT SLV32
      );
   END COMPONENT;

   COMPONENT ReedSolomonASM IS
   PORT (
      Clk,
      Reset,
      Valid          : IN  std_logic;
      DataIn         : IN  std_logic;
      FrameLen       : IN  natural range 0 to 16383;
      SyncWord       : IN  SLV32;
      BitSlips       : IN  std_logic_vector(2 downto 0);  -- Bit Slips is the ±alignment slop between ASMs
      IL_BET,                                             -- In Lock Bit Error Threshold. Allowed number of invalid bits
      OOL_BET,                                            -- Out of Lock Bit Error Threshold.
      Verifies,                                           -- number of valid frames before lock declared
      FlyWheels      : IN  std_logic_vector(4 downto 0);  -- number of invalid frames before lock lossed
      SyncOut,
      ValidOut       : OUT std_logic;
      DataOut        : OUT SLV8
   );
   END COMPONENT ReedSolomonASM;

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

   COMPONENT rs_decoder
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

   constant DAC_HIGH       : SLV18 := 18x"1ffff";
   constant DAC_LOW        : SLV18 := 18x"20000";

   signal   Dec_tlast_missing,
            Dec_out_tvalid,
            Dec_out_tlast,
            Dec_stat_tvalid,
            S_ctrl_tready,
            OutFifoFull,
            OutFifoEmpty,
            SyncOutAsm,
            SyncOutIntLv,
            Pn63Valid,
            Pn2047Valid,
            ValidAsm,
            PrnAsmValid,
            PrnDecValid,
            PrnIntLvValid,
            Missing,
            Dec_ctrl_tdata_invalid,
            Dec_tlast_unexpected,
            InterLeaveVld,
            IntLvLast,
            RampErr,
            BlockFail,
            NcoMsb,
            Errored,
            AllFFs,
            Fail                       : std_logic;
   signal   ColsSlv,
            ASM_Data,
            DecIntLvOutDly,
            InterLeaveOut,
            NextAsmPrn,
            NextDecPrn,
            NextIntLvPrn,
            Ramp,
            Dec_out_tdata              : SLV8;
   signal   Errors,
            DecCtrlValid               : std_logic_vector(5 downto 0);
   signal   Dec_stat_tdata             : SLV32;
   signal   FrameLenSlv,
            Dec_ctrl_tdata             : SLV16;
   signal   NewConfig,
            InterLeave,
            InterLeavePrev             : SLV4;
   signal   BitSlips                   : std_logic_vector(2 downto 0);
   signal   DecOutArray                : std_logic_vector(0 downto 0);
   signal   IL_BET,
            OOL_BET,
            Verifies,
            FlyWheels                  : std_logic_vector(4 downto 0);
   signal   FrameLen                   : natural range 0 to 16383;     -- total bytes in the frame L=(255-2E-q)*I per CCSDS 131.0-B-3 11.5.3
   signal   DecodeCount                : natural range 0 to 255;
   signal   RS_DecReset                : std_logic_vector(1 downto 0);
   signal   PN63_ShifterOut,
            PN63Pattern                : std_logic_vector(62 downto 0) := "000" & 60x"E4B_766a_fc10_c53d";
   signal   NCO                        : Uint32 := 32x"0";
   signal   phaseInc,
            SyncWord                   : SLV32;
   signal   RS_DecIntLvRd              : natural  range 0 to 255;
   signal   PayLoadSize                : Uint8;

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of dec_tlast_missing, dec_out_tvalid, dec_out_tlast,
      dec_stat_tvalid, s_ctrl_tready, SyncOutAsm, SyncOutIntLv, ValidAsm, dec_ctrl_tdata_invalid,
      dec_tlast_unexpected, InterLeaveVld, Fail, Pn2047Valid,
      ColsSlv, ASM_Data, interLeaveOut, dec_out_tdata, Errors, dec_stat_tdata, FrameLenSlv, dec_ctrl_tdata : signal is "TRUE";

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
         sourceSelect   => sourceSelect,
         fail           => Fail,
         errors         => Errors,
         errorsVld      => Dec_stat_tvalid,
         SyncWord       => SyncWord,
         Interleave     => InterLeave,
         Cols           => ColsSlv,
         bitSlips       => BitSlips,
         IL_BET         => IL_BET,
         OOL_BET        => OOL_BET,
         Verifies       => Verifies,
         FlyWheels      => FlyWheels,
         FrameLen       => FrameLenSlv,
         Dec_ctrl_tdata => dec_ctrl_tdata,
         PhaseInc       => phaseInc
      );

   FrameLen <= to_integer(unsigned(FrameLenSlv));

   RS_Asm : ReedSolomonASM
      PORT MAP (
         Clk         => Clk,
         Reset       => NewConfig(NewConfig'left),
         Valid       => BitEn,
         DataIn      => BitData,
         SyncWord    => SyncWord,
         FrameLen    => FrameLen,
         BitSlips    => BitSlips,
         IL_BET      => IL_BET,
         OOL_BET     => OOL_BET,
         Verifies    => Verifies,
         FlyWheels   => FlyWheels,
         SyncOut     => SyncOutAsm,
         DataOut     => ASM_Data,
         ValidOut    => ValidAsm
   );

   RS_Interleaver : RS_InterLeave
      GENERIC MAP(
         DATA_WIDTH     => 8,
         MAX_COL_BITS   => 8,
         MAX_INT_BITS   => 4,
         PACK           => false
      )
      PORT MAP(
         Clk            => Clk,
         Reset          => NewConfig(NewConfig'left),
         CE             => CE,
         ColsSlv        => ColsSlv,
         InterLeave     => InterLeave,
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
      variable    ShiftPrn_v : SLV8;
      variable    CountPrn_v : integer;
   begin
      if (rising_edge(clk)) then
-- Test code below
         if (ValidAsm) then
            ShiftPrn_v := ASM_Data;
            for i in 0 to 7 loop
               ShiftPrn_v := ShiftPrn_v(6 downto 0) & (ShiftPrn_v(5) xor ShiftPrn_v(4));
            end loop;
            NextAsmPrn <= ShiftPrn_v;
            PrnAsmValid <= (ASM_Data ?= NextAsmPrn);
         end if;

         PayLoadSize   <= unsigned(ColsSlv) - unsigned(dec_ctrl_tdata(12 downto 8));
         RS_DecIntLvRd <= <<signal RS_InterLeaver.ColsCntrRd : natural range 0 to 255>>;
         if ((InterLeaveVld = '1') and (RS_DecIntLvRd < PayLoadSize)) then
            DecIntLvOutDly <= InterLeaveOut;
            AllFFs    <= (DecIntLvOutDly ?= 8x"FF");
            ShiftPrn_v := DecIntLvOutDly;
            for i in 0 to 7 loop
               ShiftPrn_v := ShiftPrn_v(6 downto 0) & (ShiftPrn_v(5) xor ShiftPrn_v(4));
            end loop;
            NextIntLvPrn <= ShiftPrn_v;
            PrnIntLvValid <= (DecIntLvOutDly ?= NextIntLvPrn);
         end if;
-- end of test code

-- Do we need to reset?
         InterLeavePrev <= InterLeave;
         if ( (InterLeave /= InterLeavePrev) or (Reset = '1') ) then
            NewConfig <= (others=>'1');
         else
            NewConfig <= NewConfig(NewConfig'left-1 downto 0) & '0';
         end if;

         if (NewConfig(NewConfig'left) or Dec_tlast_missing) then
            RS_DecReset    <= "11";
            DecCtrlValid   <= 6x"0";
            Missing        <= '1';
         else
            if (SyncOutIntLv) then
               Missing <= '0';
            end if;

            if (SyncOutIntLv) then
               DecCtrlValid <= "000001";
            elsif (s_ctrl_tready) then
               DecCtrlValid <= DecCtrlValid(4 downto 0) & '0';
            end if;

            RS_DecReset <= RS_DecReset(0) & '0';
         end if;
      end if;
   end process;


   myRS_Decoder : rs_decoder
      PORT MAP (
         aclk                             => Clk,
         aresetn                          => not RS_DecReset(1),
         s_axis_input_tdata               => InterLeaveOut,
         s_axis_input_tvalid              => InterLeaveVld and not Missing,   -- don't feed extraneous bytes in till SOF
         s_axis_input_tlast               => IntLvLast,
         s_axis_input_tready              => open,       -- ignored
         s_axis_ctrl_tdata                => Dec_ctrl_tdata,   -- control info from MCU
         s_axis_ctrl_tvalid               => DecCtrlValid(5),     -- start of frame
         s_axis_ctrl_tready               => s_ctrl_tready,
         m_axis_output_tdata              => Dec_out_tdata,
         m_axis_output_tvalid             => Dec_out_tvalid,
         m_axis_output_tready             => not OutFifoFull,
         m_axis_output_tlast              => Dec_out_tlast,
         m_axis_stat_tdata                => Dec_stat_tdata,
         m_axis_stat_tvalid               => Dec_stat_tvalid,
         m_axis_stat_tready               => '1',
         event_s_input_tlast_missing      => Dec_tlast_missing,
         event_s_input_tlast_unexpected   => Dec_tlast_unexpected,
         event_s_ctrl_tdata_invalid       => Dec_ctrl_tdata_invalid
   );

   TestRamp : process(clk)
      variable    ShiftPrn_v :  SLV8;
      variable    CountPrn_v : integer;
   begin
      if (rising_edge(clk)) then
         if (Dec_out_tvalid) then
            ShiftPrn_v := Dec_out_tdata;
            for i in 0 to 7 loop
               ShiftPrn_v := ShiftPrn_v(6 downto 0) & (ShiftPrn_v(5) xor ShiftPrn_v(4));
            end loop;
            NextDecPrn <= ShiftPrn_v;
            PrnDecValid <= (Dec_out_tdata ?= NextDecPrn);
         end if;

         if (Dec_out_tvalid) then
            Ramp <= Dec_out_tdata;
            if (Dec_out_tlast) then
               RampErr <= (unsigned(Dec_out_tdata) - unsigned(Ramp) ?/= 18);
            else
               RampErr <= (unsigned(Dec_out_tdata) - unsigned(Ramp) ?/= 1);
            end if;
         end if;
      end if;
   end process;

   RS_DecOutputFifo : fifo_EightToOne
      PORT MAP (
         clk            => clk,
         srst           => NewConfig(NewConfig'left),
         din            => Dec_out_tdata,
         wr_en          => Dec_out_tvalid,
         rd_en          => rsDecBitEnOut,
         dout           => DecOutArray,
         full           => OutFifoFull,
         empty          => OutFifoEmpty,
         wr_data_count  => open
   );

   rsDecBitOut <= DecOutArray(0);

   ClockOutProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (not OutFifoEmpty) then                            -- if fifo empty, stall NCO
            NCO    <= NCO + unsigned(phaseInc);
         end if;
         NcoMsb    <= NCO(31);
         rsDecBitEnOut <= (NCO(31) ?/= NcoMsb) or OutFifoFull; -- if fifo full, do an extra read


         if (rsDecBitEnOut) then
            PN63_ShifterOut   <= PN63_ShifterOut(61 downto 0) & rsDecBitOut;
            if (Pn63Valid) then
               PN63Pattern <= PN63Pattern(61 downto 0) & PN63Pattern(62);
            end if;
         end if;
      end if;
   end process;

   Pn63Valid  <= (PN63_ShifterOut ?= PN63Pattern);
   Pn2047Valid <= PN63_ShifterOut(0) xor PN63_ShifterOut(9) xor PN63_ShifterOut(11) xor '1';

   Fail     <= dec_stat_tdata(0);
   Errored  <= dec_stat_tdata(1);
   Errors   <= dec_stat_tdata(7 downto 2);

   dac0Data <= DAC_HIGH when (BitData) else DAC_LOW;
   dac1Data <= DAC_HIGH when (SyncOutAsm) else DAC_LOW;
   dac0ClkEn <= '1';
   dac1ClkEn <= '1';
   -- dac2 doesn't exist on triple demod cards

end rtl;
