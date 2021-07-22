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

      Description: Pack the data into 128 sample packets then do an FFT. Multiply
   the FFT output with stored FFTs of the pilot at -66KHz, 0Hz and +66KHz as
   cross correlations of the incoming pilot and the stored pilots. Do IFFTs of
   the cross correlations then overlap from previous frame and add the results.
   Then search the result for the largest magnitude. This points
   to the start of the pilot in the incoming signal. Now repack the resampled
   inputs such that pilot is contained in one packet.
      If the incoming pilot data is split across two packets the results of each
   are less than normal and comparable to each other. To prevent this the routine
   request that the front end packetizer skip 256 sample

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
         clk,
         clk4x,
         reset,
         ce             : IN  std_logic;
         Attack,
         Decay          : IN  std_logic_vector(2 downto 0);
         RefLevel,
         Re1In,
         Im1In,
         Re2In,
         Im2In          : IN  FLOAT_1_18;
         AgcDiff        : OUT FLOAT_1_18;
         Index          : OUT SLV8;
         Re1Out,
         Im1Out,
         Re2Out,
         Im2Out         : OUT SLV18
      );
end IF_Align;

architecture rtl of IF_Align is

  -- Define Components
   COMPONENT DualAgc IS
      PORT(
         Clk,
         Reset          : IN  std_logic;
         Attack,
         Decay          : IN  std_logic_vector(2 downto 0);
         RealIn,
         ImagIn,
         RefLevel       : IN  float_1_18;
         RealGained,
         ImagGained,
         AgcVoltage     : OUT float_1_18
      );
   END COMPONENT DualAgc;

   COMPONENT PackIFs IS
         GENERIC(
            DATA_WIDTH  : positive := 18;
            BINPT       : integer  := -17;
            WORDS       : positive := 128;
            IN_SIM      : boolean := false
         );
      PORT(
      clk,
      clk4x,
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

   COMPONENT DiffDelay
      GENERIC(
         DATA_WIDTH  : positive := 18
      );
      PORT(
         clk,
         reset,
         AbeforeB       : IN  std_logic;
         DataInA1,
         DataInA2,
         DataInB1,
         DataInB2       : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
         Diff           : IN  uint8;
         DataOutA1,
         DataOutA2,
         DataOutB1,
         DataOutB2       : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
      );
   END COMPONENT DiffDelay;

   COMPONENT FftCorrelator
      GENERIC(
         FREQ_OFFSET  : natural := 1   -- 0=Lo, 1=Cntr, 2=Hi
         );
      PORT(
         clk186M,
         Reset,
         Restart,
         ValidDataIn,
         ValidFftIn,
         FftTLastIn,
         ce             : IN  std_logic;
         I1, R1, I2, R2 : IN  float_1_18;
         PeakOut        : OUT ufixed(4 downto -15);
         IndexOut       : OUT UINT8;
         FftReady,
         ValidOut,
         AbeforeB       : OUT std_logic
      );
   END COMPONENT FftCorrelator;

--                       CONSTANT DEFINITIONS
   CONSTANT LO          : natural := 0;
   CONSTANT CNTR        : natural := 1;
   CONSTANT HI          : natural := 2;
   CONSTANT FFT_CODE    : SLV8 := x"01";

   TYPE     FFT_ARRAY is array (natural range <>) of ufixed(4 downto -15);
-------------------------------------------------------------------------------

   SIGNAL   Restart,
            ValidDataOut,
            ValidFftOut,
            FftReady0,
            FftTLastIn        : std_logic;
   SIGNAL   AbeforeB,
            ValidFft,
            FftReady          : std_logic_vector(2 downto 0);
   SIGNAL   Re1Agcd,
            Im1Agcd,
            Re2Agcd,
            Im2Agcd,
            ReInDly1,
            ImInDly1,
            ReInDly2,
            ImInDly2,
            AgcVoltage1,
            AgcVoltage2        : FLOAT_1_18;
   SIGNAL   PeakOut            : FFT_ARRAY(2 downto 0);
   SIGNAL   PackR1,
            PackI1,
            PackR2,
            PackI2            : float_1_18 := float_zero_1_18;
   SIGNAL   IndexAcc          : sfixed(8 downto -7) := (others=>'0');
   SIGNAL   IndexOut          : UINT8_ARRAY(2 downto 0);
   SIGNAL   IndexAbs,
            NewIndex          : UINT8;
   SIGNAL   Largest           : natural range 0 to 2;
   SIGNAL   IF_Diff,
            AgcVoltage1Slv,
            AgcVoltage2Slv,
            AgcDiffSlv        : SLV18;

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of IndexAcc, IndexAbs, IF_Diff, NewIndex : signal is "TRUE";

constant in_simulation : boolean := false
--pragma synthesis_off
                                    or true
--pragma synthesis_on
;
constant in_synthesis : boolean := not in_simulation;

begin

   -- AGC the two IF signals before any compensation efforts to remove RF Channel impairments
   -- since the IF_Align and CmplPhsDet are both assuming the pristine signals from the transmitter
   AgcVoltage1Slv    <= to_slv(AgcVoltage1);
   AgcVoltage2Slv    <= to_slv(AgcVoltage2);
   AgcDiffSlv        <= to_slv(AgcDiff);

   AGC1 : DualAgc
      PORT MAP (
         Clk         => Clk,
         Reset       => Reset,
         Attack      => Attack,
         Decay       => Decay,
         RealIn      => Re1In,
         ImagIn      => Im1In,
         RefLevel    => RefLevel,
         RealGained  => Re1Agcd,
         ImagGained  => Im1Agcd,
         AgcVoltage  => AgcVoltage1
   );

   AGC2 : DualAgc
      PORT MAP (
         Clk         => Clk,
         Reset       => Reset,
         Attack      => Attack,
         Decay       => Decay,
         RealIn      => Re2In,
         ImagIn      => Im2In,
         RefLevel    => RefLevel,
         RealGained  => Re2Agcd,
         ImagGained  => Im2Agcd,
         AgcVoltage  => AgcVoltage2
   );


   Delay_u : DiffDelay
      GENERIC MAP (
         DATA_WIDTH  => 18
      )
      PORT MAP (
         clk         => Clk,
         reset       => Reset,
         AbeforeB    => IndexAcc(IndexAcc'left),
         DataInA1    => to_slv(Re1Agcd),
         DataInA2    => to_slv(Im1Agcd),
         DataInB1    => to_slv(Re2Agcd),
         DataInB2    => to_slv(Im2Agcd),
         Diff        => IndexAbs,
         DataOutA1   => Re1Out,
         DataOutA2   => Im1Out,
         DataOutB1   => Re2Out,
         DataOutB2   => Im2Out
      );


   LatchInputs : process(clk)
   begin
      if (rising_edge(clk)) then
         AgcDiff <= resize(AgcVoltage1 - AgcVoltage2, AgcDiff);
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

   -- Pack the two I/Q data streams into 256 sample packets for burst processing
   PackFifo : PackIFs
         GENERIC MAP(
            DATA_WIDTH     => ReInDly1'length,
            BINPT          => ReInDly1'right,
            WORDS          => 256,
            IN_SIM         => in_simulation
         )
      PORT MAP(
         clk               => clk,
         clk4x             => Clk4x,
         reset             => Reset or Restart,
         ce                => ce,
         ReadyIn           => FftReady0,
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
         ValidDataOut4x    => ValidDataOut,  -- Data is valid for NCOs
         ValidFftOut4x     => ValidFftOut,    -- data and WORDS zeros for fft
         LastOut4x         => FftTLastIn
     );

   Fft_u : fft_512_Float
    port map (
      aclk                          => Clk4x,
      aresetn                       => not (Reset or Restart),
      aclken                        => ce,
      s_axis_config_tvalid          => '0', -- not needed and prone to error, was ConfigTValid,
      s_axis_config_tready          => open,
      s_axis_config_tdata           => FFT_CODE,
      s_axis_data_tvalid            => ValidFftOut,
      s_axis_data_tready            => FftReady0,
      s_axis_data_tdata             => 96x"00",
      s_axis_data_tlast             => FftTLastIn,
      m_axis_data_tvalid            => open,
      m_axis_data_tdata             => open,
      m_axis_data_tuser             => open,
      m_axis_data_tlast             => open,
      m_axis_status_tdata           => open,
      m_axis_status_tvalid          => open,
      event_frame_started           => open,
      event_tlast_unexpected        => open,
      event_tlast_missing           => open,
      event_data_in_channel_halt    => open
      );

   GenCorrs : for n in 0 to 2 generate
   begin
         FftCorr : FftCorrelator
         GENERIC MAP(
            FREQ_OFFSET  => n
         )
      PORT MAP(
         Clk186M     => Clk4x,
         Reset       => Reset,
         Restart     => Restart,
         ce          => ce,
         FftTLastIn  => FftTLastIn,
         R1          => PackR1,
         I1          => PackI1,
         R2          => PackR2,
         I2          => PackI2,
         ValidDataIn => ValidDataOut,
         ValidFftIn  => ValidFftOut,
         IndexOut    => IndexOut(n),
         PeakOut     => PeakOut(n),
         ValidOut    => ValidFft(n),
         AbeforeB    => AbeforeB(n),
         FftReady    => FftReady(n)
      );
   end generate;


   -- Now find peak of iFFT
   MaxProcess : process(Clk4x)
   begin
      if (rising_edge(Clk4x)) then
         if (Reset) then            -- ignore Restart to let previous IndexOut carry over
            IndexAcc    <= (others=>'0');
            IndexAbs    <= (others=>'0');
            Largest      <= CNTR;
         elsif (ce) then
            if ( (PeakOut(0) > PeakOut(1) ) and (PeakOut(0) > PeakOut(2) ) ) then
               Largest <= 0;
            elsif ( (PeakOut(1) > PeakOut(0) ) and (PeakOut(1) > PeakOut(2) ) ) then
               Largest <= 1;
            else
               Largest <= 2;
            end if;
            if (ValidFft(Largest)) then      -- Accumulate indexOut over time to smooth
               if (AbeforeB(Largest)) then
                  IndexAcc <= resize(IndexAcc - to_sfixed('0' & std_logic_vector(IndexOut(Largest)), 1, -7), IndexAcc);
               else
                  IndexAcc <= resize(IndexAcc + to_sfixed('0' & std_logic_vector(IndexOut(Largest)), 1, -7), IndexAcc);
               end if;
               NewIndex <= IndexOut(Largest);
            end if;

            if (in_synthesis) then
               if (IndexAcc >= 0) then -- If saturated, reset
                  if (IndexAcc > 127) and (AbeforeB(Largest) = '0') then   -- if DiffDelay is on wrong end of offset, the FFT can appear inverted
                     IndexAcc <= to_sfixed(0.0, IndexAcc);
                  else
                     IndexAbs <=   '0' & unsigned(IndexAcc(6 downto 0));
                  end if;
               else
                  if (IndexAcc < -127) and (AbeforeB(Largest) = '1') then   -- if DiffDelay is on wrong end of offset, the FFT can appear inverted
                     IndexAcc <= to_sfixed(0.0, IndexAcc);
                  else
                     IndexAbs <= unsigned('0' & (not (std_logic_vector(IndexAcc(6 downto 0)))));
                  end if;
               end if;
            end if;
            Index <= to_slv(IndexAcc(7 downto 0));

         end if;
      end if;
   end process MaxProcess;


end rtl;
