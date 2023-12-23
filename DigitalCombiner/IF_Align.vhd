/*-----------------------------------------------------------------------------
                     PROPRIETARY NOTICE
  -----------------------------------------------------------------------------
   (c) Copyright 2014 Semco All rights reserved.

   This file contains Semco proprietary information. It is the
   property of Semco and shall not be used, disclosed to others or
   reproduced without the express written consent of Semco,
   including, but without limitation, it is not to be used in the creation,
   manufacture, development, or derivation of any designs, or configuration.

  -----------------------------------------------------------------------------

   Company:     Semco

      Module Name: IF_Align.vhd

      Description: Pack the two complex inputs into 128 sample packets then do an FFT
   on both complex pairs. Multiply the FFT outputs together. Do IFFTs of
   the cross correlations then overlap from previous frame and add the results.
   Then search the result for the largest magnitude. This Index points to the offset
   of the two IFs.
      The incoming IFs are then delayed per the Index to align the output IFs.

   Dependencies: Top level module

  -----------------------------------------------------------------------------
                                  DETAILS
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
                                  HISTORY
  -----------------------------------------------------------------------------
   4/15/21 Initial release FZ

-----------------------------------------------------------------------------*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity IF_Align is
   GENERIC
      (SIM_MODE : boolean := false
   );
   PORT(
         clk46r6,
         clk186,
         reset,
         CarrierDetect,
         ce             : IN  std_logic;
         Re1In,
         Im1In,
         Re2In,
         Im2In          : IN  SLV18;
         Index          : OUT SLV8;
         Re1Out,
         Im1Out,
         Re2Out,
         Im2Out         : OUT SLV18
      );
end IF_Align;

architecture rtl of IF_Align is

   COMPONENT fft_512_Float IS
      PORT (
         aclk : IN STD_LOGIC;
         aclken : IN STD_LOGIC;
         aresetn : IN STD_LOGIC;
         s_axis_config_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         s_axis_config_tvalid : IN STD_LOGIC;
         s_axis_config_tready : OUT STD_LOGIC;
         s_axis_data_tdata : IN STD_LOGIC_VECTOR(95 DOWNTO 0);
         s_axis_data_tvalid : IN STD_LOGIC;
         s_axis_data_tready : OUT STD_LOGIC;
         s_axis_data_tlast : IN STD_LOGIC;
         m_axis_data_tdata : OUT STD_LOGIC_VECTOR(95 DOWNTO 0);
         m_axis_data_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_data_tvalid : OUT STD_LOGIC;
         m_axis_data_tlast : OUT STD_LOGIC;
         m_axis_status_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         m_axis_status_tvalid : OUT STD_LOGIC;
         event_frame_started : OUT STD_LOGIC;
         event_tlast_unexpected : OUT STD_LOGIC;
         event_tlast_missing : OUT STD_LOGIC;
         event_data_in_channel_halt : OUT STD_LOGIC
      );
   END COMPONENT fft_512_Float;

   COMPONENT CmplxMult IS
      GENERIC (
         IN_WIDTH  : integer := 8;
         IN_BINPT  : integer := 7;
         OUT_WIDTH : integer := 8;
         OUT_BINPT : integer := 3
      );
      PORT(
         clk,
         reset,
         ce,
         ValidIn,
         StartIn,
         ReadyIn        : IN  std_logic;
         ReInA,
         ImInA,
         ReInB,
         ImInB          : IN  sfixed(IN_WIDTH-IN_BINPT-1 downto -IN_BINPT);
         ReOut,
         ImOut          : OUT sfixed(OUT_WIDTH-OUT_BINPT-1 downto -OUT_BINPT);
         ValidOut,
         StartOut       : OUT std_logic
      );
   END COMPONENT CmplxMult;

   COMPONENT OverlapAddAbs IS
      GENERIC (
         IN_WIDTH    : integer   := 18;
         IN_BINPT    : integer   := -17;
         OUT_WIDTH   : integer   := 18;
         OUT_BINPT   : integer   := -17
      );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         ReIn,
         ImIn           : IN  sfixed(IN_WIDTH+IN_BINPT-1 downto IN_BINPT);
         ValidIn,
         StartIn        : IN  std_logic;     -- Start is just delayed in sync
         ReOut,
         ImOut          : OUT sfixed(IN_WIDTH+IN_BINPT downto IN_BINPT+1);
         AbsOut         : OUT ufixed(OUT_WIDTH+OUT_BINPT-1 downto OUT_BINPT);
         ValidOut,
         StartOut       : OUT std_logic
      );
   END COMPONENT OverlapAddAbs;

   COMPONENT PackIFs IS
         GENERIC(
            DATA_WIDTH  : positive := 18;
            BINPT       : integer  := -17;
            WORDS       : positive := 128;
            IN_SIM      : boolean := false
         );
      PORT(
      clk,
      clk4X,
      reset,
      ce,
      ReadyIn           : IN  std_logic := '0';
      ReIn1,
      ImIn1,
      ReIn2,
      ImIn2             : IN  sfixed(DATA_WIDTH+BINPT-1 downto BINPT);
      ReOut4x1,
      ImOut4x1,
      ReOut4x2,
      ImOut4x2          : OUT sfixed(DATA_WIDTH+BINPT-1 downto BINPT);
      Start4x,
      Restart,
      OverFlow4x,
      ValidDataOut4x,     -- Data is valid for NCOs
      ValidFftOut4x,    -- data and WORDS zeros for fft
      LastOut4x         : OUT std_logic
      );
   END COMPONENT PackIFs;

   COMPONENT DiffDelay
      GENERIC(
         DATA_WIDTH  : positive := 18
      );
      PORT(
         clk,
         reset,
         AbeforeB       : IN  std_logic;
         RealIn1,
         ImagIn1,
         RealIn2,
         ImagIn2        : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
         Diff           : IN  uint8;
         RealOut1,
         ImagOut1,
         RealOut2,
         ImagOut2       : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
      );
   END COMPONENT DiffDelay;

--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------
   CONSTANT FFT_CODE    : SLV8 := x"01";
   CONSTANT IFFT_CODE      : SLV8 := x"00";

   SIGNAL   AbsSize           : ufixed(4 downto -15);

   SIGNAL   ConfigTValid,
            ConfigDone,
            OverflowFft,
            OverflowIFft,
            Restart,
            StartIFft,
            ValidFftIn,
            ValidFft,
            ValidFftDly,
            ValidMult,
            ValidIFftOut,
            ValidAbs,
            ValidOverAdd,
            ValidOut,
            AbeforeB,
            FftStarted,
            FftUnexpected,
            FftMissing,
            FftHalted,
            FftReady,
            FftTLastIn,
            FftTLastOut,
            iFftReady         : std_logic := '0';
   SIGNAL   ReInDly1,
            ImInDly1,
            ReInDly2,
            ImInDly2          : FLOAT_1_18;
   SIGNAL   AbsFft,
            MaxFft,
            AbsPeak           : ufixed(AbsSize'range);
   SIGNAL   PackR1,
            PackI1,
            PackR2,
            PackI2,
            FftR1,            -- FFT outputs are in floating point but I'm ignoring the exponent
            FftI1,            -- since I'm only looking for the peak of single FFTs
            FftR2,
            FftI2,
            XC_Size,
            Fft1xFft2R,
            Fft1xFft2I,
            iFftSize,
            iFftR,
            iFftI             : float_1_18 := float_zero_1_18;
   SIGNAL   Count,
            AbsIndex,
            Index0            : natural range 0 to 515;
   SIGNAL   MultTLast         : std_logic_vector(5 downto 0);
   SIGNAL   FftOutSlv,
            iFftSlv           : std_logic_vector(95 downto 0); -- fixed by FFT
   SIGNAL   SkipFirst2,
            ConfigTReady      : std_logic_vector(1 downto 0) := "00";
   SIGNAL   IndexAcc          : sfixed(8 downto -7) := (others=>'0');
   SIGNAL   IndexOut,
            IndexAbs          : uint8 := x"00";
   SIGNAL   IF_Diff           : SLV18;

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of ValidOverAdd, Index, ValidOut,
            SkipFirst2, Restart, IndexAbs, IF_Diff : signal is "TRUE";

constant in_simulation : boolean := false
--pragma synthesis_off
                                    or true
--pragma synthesis_on
;
constant in_synthesis : boolean := not in_simulation;

begin

   Delay_u : DiffDelay
      GENERIC MAP (
         DATA_WIDTH  => 18
      )
      PORT MAP (
         clk         => clk46r6,
         reset       => Reset,
         AbeforeB    => IndexAcc(IndexAcc'left),
         RealIn1     => Re1In,
         ImagIn1     => Im1In,
         RealIn2     => Re2In,
         ImagIn2     => Im2In,
         Diff        => IndexAbs,
         RealOut1    => Re1Out,
         ImagOut1    => Im1Out,
         RealOut2    => Re2Out,
         ImagOut2    => Im2Out
      );


   LatchInputs : process(clk46r6)
   begin
      if (rising_edge(clk46r6)) then
         IF_Diff <= to_slv(resize(to_sfixed(Re1Out, 17, 0) - to_sfixed(Re2Out, 17, 0), 17, 0));
         if (Reset) then
            ReInDly1       <= (others=>'0');
            ImInDly1       <= (others=>'0');
            ReInDly2       <= (others=>'0');
            ImInDly2       <= (others=>'0');
         elsif (ce) then
            ReInDly1 <= to_sfixed(Re1Out, ReInDly1);     -- feedback DiffDelay outputs to force delay to 0.
            ImInDly1 <= to_sfixed(Im1Out, ReInDly1);     -- FFT process tends to drift off at large offsets
            ReInDly2 <= to_sfixed(Re2Out, ReInDly1);
            ImInDly2 <= to_sfixed(Im2Out, ReInDly1);
         end if;
      end if;
   end process;

   SetForInvFFT : process(clk186)
   begin
      if (rising_edge(clk186)) then
         if (Reset or Restart) then
            ConfigTValid   <= '0';
            ConfigDone     <= '0';
         elsif (ce) then
            if (not ConfigDone and (and(ConfigTReady))) then
               ConfigTValid <= '1';
               ConfigDone   <= '1';
            else
               ConfigTValid   <= '0';
            end if;
         end if;
      end if;
   end process;

   -- Pack the two I/Q data streams into 256 sample packets for burst processing
   PackFifo : PackIFs
         GENERIC MAP(
            DATA_WIDTH     => ReInDly1'length,
            BINPT          => ReInDly1'right,
            WORDS          => 256,
            IN_SIM         => in_simulation
         )
      PORT MAP(
         clk               => clk46r6,
         clk4X             => clk186,
         reset             => Reset or Restart,
         ce                => ce,
         ReadyIn           => FftReady,
         ReIn1             => ReInDly1,
         ImIn1             => ImInDly1,
         ReIn2             => ReInDly2,
         ImIn2             => ImInDly2,
         ReOut4x1          => PackR1,
         ImOut4x1          => PackI1,
         ReOut4x2          => PackR2,
         ImOut4x2          => PackI2,
         Start4x           => open,
         Restart           => Restart,       -- when Packer overflows, restart alignment. FFTs can't keep up
         OverFlow4x        => open,
         ValidDataOut4x    => open,          -- Data is valid for NCOs
         ValidFftOut4x     => ValidFftIn,    -- data and WORDS zeros for fft
         LastOut4x         => FftTLastIn
     );

   -- Note the FFTs are in floating point output mode but since I only want the relative peak,
   -- I don't care about the absolute level of the signal from frame to frame, unlike the pilot
   -- detector in STC.

   Fft_u : fft_512_Float
    port map (
      aclk                          => clk186,
      aresetn                       => not (Reset or Restart),
      aclken                        => ce,
      s_axis_config_tvalid          => '0', -- not needed and prone to error, was ConfigTValid,
      s_axis_config_tready          => ConfigTReady(0),
      s_axis_config_tdata           => FFT_CODE,
      s_axis_data_tvalid            => ValidFftIn,
      s_axis_data_tready            => FftReady,
      s_axis_data_tdata             => 6x"00" & to_slv(PackI2) & 6x"00" & to_slv(PackR2) & 6x"00" & to_slv(PackI1) & 6x"00" & to_slv(PackR1),
      s_axis_data_tlast             => FftTLastIn,
      m_axis_data_tvalid            => ValidFft,
      m_axis_data_tdata             => FftOutSlv,
      m_axis_data_tuser             => open,
      m_axis_data_tlast             => FftTLastOut,
      m_axis_status_tdata           => open,
      m_axis_status_tvalid          => open,
      event_frame_started           => FftStarted,
      event_tlast_unexpected        => FftUnexpected,
      event_tlast_missing           => FftMissing,
      event_data_in_channel_halt    => FftHalted
      );


   FftProcess : process(clk186)
      variable CountEq255  : std_logic;
   begin
      if (rising_edge(clk186)) then
         if (Reset or Restart) then
            Count          <= 0;
            OverflowFft    <= '0';
            ValidFftDly    <= '0';
            FftR1          <= (others=>'0');
            FftI1          <= (others=>'0');
            FftR2          <= (others=>'0');
            FftI2          <= (others=>'0');
            MultTLast      <= (others=>'0');
         elsif (ce) then
            if (ValidFft = '1') and (Count < 255) then
               Count <= Count + 1;
            else
               Count <= 0;
            end if;
            ValidFftDly    <= ValidFft;
            FftR1          <= to_sfixed(FftOutSlv(17 downto 00), FftR1);
            FftI1          <= to_sfixed(FftOutSlv(41 downto 24), FftI1);
            FftR2          <= to_sfixed(FftOutSlv(65 downto 48), FftR2);
            FftI2          <= to_sfixed(FftOutSlv(89 downto 72), FftI2);
            CountEq255     := '1' when (Count = 255) else '0';
            MultTLast      <= MultTLast(4 downto 0) & CountEq255;
            StartIFft      <= CountEq255;
         end if;
      end if;
   end process FftProcess;


   -- Complex multiply FFT outputs
   MultiplyFft : CmplxMult
         GENERIC MAP(
         IN_WIDTH    => FftR1'length,
         IN_BINPT    => -FftR1'right,
         OUT_WIDTH   => XC_Size'length,
         OUT_BINPT   => -XC_Size'right
         )
      PORT MAP(
         clk         => clk186,
         ce          => ce,
         reset       => Reset or Restart,
         ReadyIn     => iFftReady,
         ReInA       => FftR1,
         ImInA       => FftI1,
         ReInB       => FftR2,
         ImInB       => not(FftI2),    --conjugate one input
         ValidIn     => ValidFftDly,
         StartIn     => StartIFft,
         ReOut       => Fft1xFft2R,
         ImOut       => Fft1xFft2I,
         ValidOut    => ValidMult,
         StartOut    => open
      );

   iFft_u : fft_512_Float     -- fft_512 is dual channel, but only one iFft channel is needed
    port map (          -- this FFT is also floating point output in 0.-17 format
      aclk                          => clk186,
      aresetn                       => not (Reset or Restart),
      aclken                        => ce,
      s_axis_config_tvalid          => ConfigTValid,
      s_axis_config_tready          => ConfigTReady(1),
      s_axis_config_tdata           => IFFT_CODE,
      s_axis_data_tvalid            => ValidMult,
      s_axis_data_tready            => iFftReady,
      s_axis_data_tdata             => 48x"00" & 6x"00" & to_slv(Fft1xFft2I) & 6x"00" & to_slv(Fft1xFft2R),
      s_axis_data_tlast             => MultTLast(5),
      m_axis_data_tvalid            => ValidIFftOut,
      m_axis_data_tdata             => iFftSlv,
      m_axis_data_tuser             => open,
      m_axis_data_tlast             => open,
      m_axis_status_tdata           => open,
      m_axis_status_tvalid          => open,
      event_frame_started           => open,
      event_tlast_unexpected        => open,
      event_tlast_missing           => open,
      event_data_in_channel_halt    => open
      );

   iFftR <= to_sfixed(iFftSlv(17 downto 00), iFftR);
   iFftI <= to_sfixed(iFftSlv(41 downto 24), iFftI);


   iFftToAbs : OverlapAddAbs
      GENERIC MAP(IN_WIDTH  => iFftSize'length, IN_BINPT  => iFftSize'right,
                  OUT_WIDTH => AbsSize'length,  OUT_BINPT => AbsSize'right )
      PORT MAP(
         clk    => clk186,     reset    => Reset or Restart,    ce       => ce,
         ReIn   => iFftR,     ImIn     => iFftI,      ValidIn  => ValidIFftOut,
         ReOut  => open,      ImOut    => open,
         AbsOut => AbsFft,    ValidOut => ValidAbs,   StartIn  => '0', StartOut => open);


   -- Now find peak of iFFT
   MaxProcess : process(clk186)
   begin
      if (rising_edge(clk186)) then
         if (Reset or not CarrierDetect) then            -- ignore Restart to let previous IndexOut carry over
            Index0      <= 0;
            IndexOut    <= x"00";
            SkipFirst2  <= "00";
            AbeforeB    <= '1';
            AbsPeak     <= (others=>'0');
            MaxFft      <= (others=>'0');
            IndexAcc    <= (others=>'0');
            IndexAbs    <= (others=>'0');
         elsif (ce) then
            ValidOverAdd   <= ValidAbs;  -- delay ValidAbs to realign OverAdd sum outputs
            MaxFft         <= AbsFft;    -- just delayed to keep timing happy
            if (ValidOverAdd) then
               -- Find the peak of this packet
               if (MaxFft > AbsPeak) then
                  AbsPeak     <= MaxFft;
                  AbsIndex    <= Index0;
               end if;

               Index0 <= Index0 + 1;
            else
               Index0 <= 0;
               AbsPeak  <= (others=>'0');

               if ((SkipFirst2(1) = '0') and (Index0 = 512)) then
                  ValidOut <= '1';
                  if (AbsIndex > 255) then  -- save result and setup for next
                     IndexOut <= to_unsigned(512 - AbsIndex, 8);
                     AbeforeB <= '1';
                  else
                     IndexOut <= to_unsigned(AbsIndex, 8);
                     AbeforeB <= '0';
            end if;
               else
                  ValidOut <= '0';
               end if;
            end if;

            if (Restart) then
               SkipFirst2 <= "11";
            elsif (Index0 = 512) then
               SkipFirst2 <= SkipFirst2(0) & '0';   -- skip first two results to allow overlap
            end if;

            if (ValidOut) then      -- Accumulate indexOut over time to smooth
               if (AbeforeB) then
                  IndexAcc <= resize(IndexAcc - to_sfixed('0' & std_logic_vector(IndexOut), 1, -7), IndexAcc);
               else
                  IndexAcc <= resize(IndexAcc + to_sfixed('0' & std_logic_vector(IndexOut), 1, -7), IndexAcc);
               end if;
            end if;

               if (IndexAcc >= 0) then -- If saturated, reset
               if (IndexAcc > 127) and (AbeforeB = '0') then   -- if DiffDelay is on wrong end of offset, the FFT can appear inverted
                     IndexAcc <= to_sfixed(0.0, IndexAcc);
                  else
                     IndexAbs <=   '0' & unsigned(IndexAcc(6 downto 0));
                  end if;
               else
               if (IndexAcc < -127) and (AbeforeB = '1') then   -- if DiffDelay is on wrong end of offset, the FFT can appear inverted
                     IndexAcc <= to_sfixed(0.0, IndexAcc);
                  else
                     IndexAbs <= unsigned('0' & (not (std_logic_vector(IndexAcc(6 downto 0)))));
                  end if;
               end if;

            Index <= to_slv(IndexAcc(7 downto 0));

         end if;
      end if;
   end process MaxProcess;


end rtl;
