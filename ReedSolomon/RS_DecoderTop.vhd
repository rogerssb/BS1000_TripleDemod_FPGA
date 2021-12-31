-- Width = 8                  typical symbol width, can be 3 to 12
-- n=s^Width - 1 = 255        bits per symbol
-- k=223 or 239               data symbols per frame, CCSDS uses 223 or 239
-- r=n-k, 32 or 16             number of check symbols
-- t=(n-k)/2 16 or 8          max symbol errors correctable
--
-- PD=2t^2+9t+3 203 or 659    processing delay, if > n, can't run full speed so the (255,223) code needs 2.6 frames
-- Our highest data rate is 40Mb or 5MB, which is 46.6/5 9.33 clocks per symbol, which means the tvalid only goes
-- high every 9th clock while the decoder runs at the full 46.6MHz and should be able to keep up with a full speed
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
-- always by high anyway. Tlast is not used since the decoder ignores it.
--
-- interleaving depth L = 1, 2, 3, 4, or 5  default is 1. Interleaving is done after the encoder and thus
-- deinterleaving is done on the Viterbi output after ASM stripping. The size of the frame is 255 * L with a
-- tlast at the end of the frame. This routine perform deinterleaving, recover the RS Decoder output and then
-- pass the data on in a serial fashion to the upper hdl level.
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.semco_pkg.all;

entity RS_DecoderTop is
   port (
      clk,
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
      SymEn,
      SymData           : IN  STD_LOGIC;
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
         rsClk
         busClk,
         cs,
         wr0, wr1, wr2, wr3,
         fail, tlast          : IN  std_logic;
         addr                 : IN  std_logic_vector(4 downto 0);
         errors               : IN  SLV8;
         dataIn               : IN  SLV32;
         dataOut,
         ASM_Control          : OUT SLV32;
         control              : OUT SLV16
      );
   END COMPONENT;

   COMPONENT ReedSolomonASM IS
   PORT (
      Clk,
      Reset,
      Valid,
      DataIn         : IN  std_logic;                    -- bit sync output
      FrameLen       : IN  natural range 0 to 16383;     -- total bytes in the frame L=(255-2E-q)*I per CCSDS 131.0-B-3 11.5.3
      BitSlips       : IN  std_logic_vector(2 downto 0);
      IL_BET,                                             -- In Lock Bit Error Threshold. Allowed number of invalid bits
      OOL_BET,                                            -- Out of Lock Bit Error Threshold.
      Verifies,                                           -- number of valid frames before lock declared
      FlyWheels      : IN  std_logic_vector(4 downto 0);  -- number of invalid frames before lock lossed
      SyncOut,
      SyncTime,
      Invert,
      ValidOut       : OUT std_logic;
      DataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)  -- soft decision invert corrected data
   );
   END COMPONENT ReedSolomonASM;

   COMPONENT interLeave
      GENERIC(
         DATA_WIDTH  : positive := 8;
         MAX_WIDTH   : positive := 255;
         MAX_DEPTH   : positive := 8
      );
      PORT(
         clk,
         reset,
         ce,
         validIn,       -- dataIn is valid
         pack           : IN  std_logic;     -- pack or unpack
         WidthSlv       : IN  std_logic_vector (7 downto 0);
         DepthSlv       : IN  std_logic_vector (3 downto 0);
         dataIn         : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
         readyOut       : OUT std_logic;     -- buffer is full and can be read
         dataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
      );
   END COMPONENT interLeave;

   COMPONENT rs_decoder_CCSDS
      PORT (
         aclk                             : IN STD_LOGIC;
         s_axis_input_tdata               : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_input_tvalid              : IN STD_LOGIC;
         s_axis_input_tlast               : IN STD_LOGIC;
         s_axis_input_tready              : OUT STD_LOGIC;
         s_axis_ctrl_tdata                : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
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

   signal   dec_tvalid,
            dec_tready,
            dec_missing,
            dec_unexpected,
            dec_tlast_missing,
            dec_out_tvalid,
            dec_out_tlast,
            dec_stat_tvalid,
            s_ctrl_tready,
            dec_ctrl_tdata_invalid,
            dec_stat_tready,
            dec_tlast_unexpected,
            dec_ctrl_tvalid,
            dec_out_tready,
            dec_tlastn
            fail,
            tlast                      : std_logic;
   signal   WidthSlv,
            ASM_Data,
            dec_tdata,
            dec_ctrl_tdata,
            dec_out_tdata,
            errors                     : SLV8;
   signal   dec_stat_tdata,
            ASM_Control                : SLV32;
   signal   control                    : SLV16;
   signal   DepthSlv       : SLV4;

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
         fail           => fail,
         tlast          => tlast,
         addr           => addr(5downto0),
         errors         => errors,
         dataIn         => din,
         dataOut        => dout,
         ASM_Control    => ASM_Control,
         FrameLen       => FrameLen,
         control        => control
      );

   RS_Asm : ReedSolomonASM
      PORT MAP (
         Clk         => Clk,
         Reset       => reset,
         Valid       => BitEn,
         DataIn      => BitData,
         FrameLen    => FrameLen,
         BitSlips    => ASM_Control( downto ),
         IL_BET      => ASM_Control( downto ),
         OOL_BET     => ASM_Control( downto ),
         Verifies    => ASM_Control( downto ),
         FlyWheels   => ASM_Control( downto ),
         SyncOut     => SyncOut,
         SyncTime    => SyncTime,
         Invert      => Invert,
         DataOut     => ASM_Data,
         ValidOut    => ASM_Valid
   );

   interleaver : interLeave
      GENERIC MAP(
         DATA_WIDTH  => 8,
         MAX_WIDTH   => 255,
         MAX_DEPTH   => 8
      )
      PORT MAP(
         clk            => clk,
         reset          => reset,
         ce             => ce,
         validIn        => ASM_valid,
         pack           => '0',
         WidthSlv       => WidthSlv,
         DepthSlv       => DepthSlv,
         dataIn         => ASM_Data,
         readyOut       => interLeaveOut,
         dataOut        => interLeaveOut
      );

   myRS_Decoder : rs_decoder_CCSDS
      PORT MAP (
         aclk                             => aclk,
         s_axis_input_tdata               => dec_tdata,
         s_axis_input_tvalid              => dec_tvalid,
         s_axis_input_tlast               => dec_tlast,
         s_axis_input_tready              => dec_tready,
         s_axis_ctrl_tdata                => dec_ctrl_tdata,
         s_axis_ctrl_tvalid               => dec_ctrl_tvalid,
         s_axis_ctrl_tready               => s_ctrl_tready,
         m_axis_output_tdata              => dec_out_tdata,
         m_axis_output_tvalid             => dec_out_tvalid,
         m_axis_output_tready             => dec_out_tready,
         m_axis_output_tlast              => dec_out_tlast,
         m_axis_stat_tdata                => dec_stat_tdata,
         m_axis_stat_tvalid               => dec_stat_tvalid,
         m_axis_stat_tready               => dec_stat_tready,
         event_s_input_tlast_missing      => dec_tlast_missing,
         event_s_input_tlast_unexpected   => dec_tlast_unexpected,
         event_s_ctrl_tdata_invalid       => dec_ctrl_tdata_invalid
   );

end rtl;
