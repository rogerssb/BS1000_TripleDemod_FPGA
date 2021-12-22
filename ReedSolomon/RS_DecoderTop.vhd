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


entity RS_DecoderTop is
   port (
      aclk,
      enc_in_tvalid,
      dec_ctrl_tvalid,
      dec_out_tready,
      enc_in_tlast        : IN  std_logic;
      dec_ctrl_tdata,
      enc_in_tdata        : IN  std_logic_vector(7 downto 0);

      enc_in_tready,
      dec_missing,
      dec_unexpected,
      dec_tlast_missing,
      dec_out_tvalid,
      dec_out_tlast,
      dec_stat_tvalid,
      s_ctrl_tready,
      dec_ctrl_tdata_invalid,
      dec_stat_tready,
      dec_tlast_unexpected  : OUT std_logic;
      dec_out_tdata            : OUT std_logic_vector(7 downto 0);
      dec_stat_tdata              : OUT std_logic_vector(31 downto 0)
   );
end RS_DecoderTop;

architecture rtl of RS_DecoderTop is

   COMPONENT rs_encoder_CCSDS       -- s_axis_ctrl = R_IN[13:8]  N_IN[7:0]. N_IN = 255, R_IN = 16 or 32
      PORT (
         aclk                             : IN STD_LOGIC;
         s_axis_input_tdata               : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_input_tvalid              : IN STD_LOGIC;
         s_axis_input_tready              : OUT STD_LOGIC;
         s_axis_input_tlast               : IN STD_LOGIC;
         s_axis_ctrl_tdata                : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_ctrl_tvalid               : IN STD_LOGIC;
         s_axis_ctrl_tready               : OUT STD_LOGIC;
         m_axis_output_tdata              : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_output_tvalid             : OUT STD_LOGIC;
         m_axis_output_tready             : IN STD_LOGIC;
         m_axis_output_tlast              : OUT STD_LOGIC;
         event_s_input_tlast_missing      : OUT STD_LOGIC;
         event_s_input_tlast_unexpected   : OUT STD_LOGIC;
         event_s_ctrl_tdata_invalid       : OUT STD_LOGIC
      );
   END COMPONENT;

   COMPONENT rs_decoder_CCSDS
      PORT (
         aclk : IN STD_LOGIC;
         s_axis_input_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_input_tvalid : IN STD_LOGIC;
         s_axis_input_tlast : IN STD_LOGIC;
         s_axis_input_tready : OUT STD_LOGIC;
         s_axis_ctrl_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_ctrl_tvalid : IN STD_LOGIC;
         s_axis_ctrl_tready : OUT STD_LOGIC;
         m_axis_output_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         m_axis_output_tvalid : OUT STD_LOGIC;
         m_axis_output_tready : IN STD_LOGIC;
         m_axis_output_tlast : OUT STD_LOGIC;
         m_axis_stat_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_stat_tvalid : OUT STD_LOGIC;
         m_axis_stat_tready : IN STD_LOGIC;
         event_s_input_tlast_missing : OUT STD_LOGIC;
         event_s_input_tlast_unexpected : OUT STD_LOGIC;
         event_s_ctrl_tdata_invalid : OUT STD_LOGIC
      );
   END COMPONENT;

   signal   dec_tvalid,
            dec_tready,
            enc_ctrl_tvalid,
            dec_tlast       : std_logic;
   signal   dec_tdata,
            enc_ctrl_tdata       : std_logic_vector(7 downto 0);

begin

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
