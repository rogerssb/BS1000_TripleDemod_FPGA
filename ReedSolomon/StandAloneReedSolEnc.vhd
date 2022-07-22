library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE work.Semco_pkg.ALL;

entity StandAloneReedSolEnc is
   port (
      clk,        -- 93.3MHz
      reset             : IN  STD_LOGIC;
      PN63Valid,
      rsEncBitEnOut,
      rsEncBitOut       : OUT STD_LOGIC
   );
end StandAloneReedSolEnc;

architecture rtl of StandAloneReedSolEnc is

   COMPONENT rs_encoder_CCSDS
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


   CONSTANT SYNC_SIZE            : natural := 32;
   CONSTANT SYNC                 : std_logic_vector(0 to SYNC_SIZE - 1) := x"1acffc1d";

   -- Signals

   signal   DecOutTData,
            R_IN,
            N_IN,
            K,                   -- N_IN - R_IN
            SymCount,
            BlockCount              : UINT8 := 8x"44";
   signal   Dec_out_tvalid,
            RS_DecStatVld,
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
            LastOutIntLv,
            InterLeaveVld           : std_logic := '0';
   signal   EncoderDataIn,
            EncodedDataOut,
            InterLeaveOut,
            ColsSlv                 : SLV8;
   signal   InterLeave              : SLV4;
   signal   ShiftCount              : natural range 0 to 32;
   signal   Shifter                 : SLV32;
   signal   pnGen                   : SLV16;
   signal   AsmMode,
            ShiftActive,
            ShiftPreValid,
            Pop                     : std_logic;
   signal   ShiftFifo               : SLV8_ARRAY(0 to 63);
   signal   FifoWr,
            FifoRd,
            SyncCount               : natural range 0 to 63;
   signal   PN63_ShifterOut,
            PN63Pattern             : std_logic_vector(62 downto 0) := "000" & 60x"E4B_766a_fc10_c53d";

BEGIN

   EncodeProcess : process (clk)
      variable Rows_v      : UINT4;
      variable ValidIn_v,
               LastIn_v,
               Start_v     : std_logic;
   begin
      if (rising_edge(clk)) then
         Rows_v      := unsigned(InterLeave);
         ValidIn_v   := '0';
         Start_v     := '0';
         LastIn_v    := EncoderLastIn;
         EncodedLastOutDly <= EncodedLastOut and EncodedValidOut;
         if (reset) then
            R_IN        <= 8x"10";
            N_IN        <= 8x"FF";
            K           <= N_IN - R_IN;
            SymCount    <= 8x"00";
            BlockCount  <= 8x"00";
            ValidIn_v   := '0';
            LastIn_v    := '0';
            Start_v     := '1';
            ColsSlv     <= std_logic_vector(N_IN);
            InterLeave  <= 4x"01";

            pnGen <= 16x"005F";

         else
            if (EncoderLastIn) then
               if (SymCount < R_IN) then
                  SymCount <= SymCount + 1;
               else
                  if (EncoderCtrlRdy) then
                     Start_v  := '1';
                     LastIn_v := '0';
                     SymCount <= 8x"00";
                  end if;
               end if;
            elsif (EncoderReady) then
               if (SymCount < 16) then
                  SymCount <= SymCount + 1;
                  if (SymCount < 8) then
                     pnGen <= pnGen(14 downto 0) & (pnGen(5) xor pnGen(4));   -- PN63
              --       pnGen <= pnGen(14 downto 0) & (pnGen(8) xor pnGen(4));    -- PN511
              --       pnGen <= pnGen(14 downto 0) & (pnGen(10) xor pnGen(8));    -- PN2047
                     PN63_ShifterOut <= PN63_ShifterOut(61 downto 0) & pnGen(7);
                  end if;
               else
                  ValidIn_v   :='1';
                  SymCount    <= 8x"0";
                  if (BlockCount < K - 1) then
                     BlockCount <= BlockCount + 1;
                  else
                     BlockCount  <= 8x"00";
                     LastIn_v    := '1';
                  end if;
               end if;
            end if;

            if (EncoderStart) then
               LastIn_v := '0';
            end if;
         end if;
         EncoderValidIn <= ValidIn_v;
         EncoderLastIn  <= LastIn_v;
         EncoderStart   <= Start_v;

         if (EncoderValidIn) then
            EncoderDataIn   <= pnGen(7 downto 0);
         end if;

         PN63Valid <= (PN63_ShifterOut ?= PN63Pattern);
      end if;
   end process;

   RS_Enc : rs_encoder_CCSDS
      PORT MAP (
         aclk                             => clk,
         aresetn                          => not reset,
         s_axis_input_tdata               => EncoderDataIn,
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
         MAX_INT_BITS   => 4,
         PACK           => true
      )
      PORT MAP(
         Clk            => Clk,
         Reset          => Reset,
         CE             => '1',
         ColsSlv        => ColsSlv,
         InterLeave     => InterLeave,
         SyncIn         => EncodedLastOutDly,
         ValidIn        => EncodedValidOut,
         DataIn         => EncodedDataOut,
         SyncOut        => SyncOutIntLv,
         LastOut        => LastOutIntLv,
         ValidOut       => InterLeaveVld,
         DataOut        => InterLeaveOut
      );

   PostEncodeProcess : process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            ShiftCount     <= 0;
            Shifter        <= 32x"0";
            AsmMode        <= '0';
            rsEncBitEnOut  <= '0';
            rsEncBitOut    <= '0';
            FifoWr         <= 0;
            FifoRd         <= 0;
            SyncCount      <= 0;
         else
            rsEncBitOut   <= Shifter(ShiftCount);
            rsEncBitEnOut <= ShiftPreValid;

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

end rtl;