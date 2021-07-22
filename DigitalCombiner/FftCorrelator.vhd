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

Module Name: FftCorrelator.vhd
Description:

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
7-12-21 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.math_real.all;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY FftCorrelator IS
      GENERIC(
         FREQ_OFFSET  : natural := 1   -- 0=Lo, 1=Cntr, 2=Hi
      );
   PORT(
      Clk186M,
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
END FftCorrelator;


ARCHITECTURE rtl OF FftCorrelator IS

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
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------
   CONSTANT FFT_CODE       : SLV8 := x"01";
   CONSTANT IFFT_CODE      : SLV8 := x"00";
   CONSTANT LO             : natural := 0;
   CONSTANT CNTR           : natural := 1;
   CONSTANT HI             : natural := 2;
   CONSTANT PHASE_INC      : UINT32f := to_ufixed(70000.0 / (280.0e6 / 6.0) * 65536.0 * 65536.0, 31, 0);--)));
   CONSTANT DELAY          : natural := 5;

   SIGNAL   ConfigTValid,
            ConfigDone,
            NcoReset,
            OverflowFft,
            OverflowIFft,
            StartIFft,
            ValidDataInDly,
            ValidFft,
            ValidFftDly,
            ValidMult,
            ValidMixer,
            ValidIFftOut,
            ValidAbs,
            ValidOverAdd,
            FftStarted,
            FftUnexpected,
            FftMissing,
            FftHalted,
            FftTLastOut,
            iFftReady         : std_logic := '0';
   SIGNAL   AbsFft,
            AbsPeak,
            MaxFft            : ufixed(PeakOut'range);
   SIGNAL   R_Mix,
            I_Mix,
            Cos,
            Sin,
            NcodR,
            NcodI,
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
   SIGNAL   DlyR,
            DlyI              : FLOAT_ARRAY_1_18(DELAY downto 0) := (others=>(others=>'0'));
   SIGNAL   FftTLastInDly,
            ValidFftInDly     : std_logic_vector(DELAY downto 0);
   SIGNAL   ConfigTReady      : std_logic_vector(1 downto 0);
   SIGNAL   Count,
            AbsIndex,
            Index0            : natural range 0 to 515;
   SIGNAL   MultTLast         : std_logic_vector(5 downto 0);
   SIGNAL   FftIn,
            FftOutSlv,
            iFftSlv           : std_logic_vector(95 downto 0); -- fixed by FFT
   SIGNAL   NcoData           : std_logic_vector(47 downto 0);
   SIGNAL   SkipFirst2        : std_logic_vector(1 downto 0) := "00";
   SIGNAL   SampleCount       : integer range 0 to 3000 := 0;
   SIGNAL   FreqOffset        : integer range -13 to 14 := -13;

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of ValidOverAdd, ValidOut, AbsPeak, SkipFirst2, Restart, IndexOut : signal is "TRUE";

BEGIN


   NCO : OffsetNCO
      PORT MAP (
         aclk                 => Clk186M,
         aresetn              => not NcoReset,
         s_axis_config_tvalid => '1',
         m_axis_data_tready   => ValidDataIn,
         s_axis_config_tdata  => to_slv(PHASE_INC),
         s_axis_config_tready => open,
         m_axis_data_tvalid   => open,
         m_axis_data_tdata    => NcoData
      );

   DlyProc : process(Clk186M)
   begin
      if (rising_edge(Clk186M)) then
         NcoReset <= '1' when ((Reset = '1') or (FREQ_OFFSET = CNTR)) else '0';   -- disable the NCO when center channel to bypass the mixer
         ValidDataInDly <= ValidDataIn;
         FftTLastInDly <= FftTLastInDly(DELAY-1 downto 0) & FftTLastIn;
         ValidFftInDly <= ValidFftInDly(DELAY-1 downto 0) & ValidFftIn;
         if (ValidDataIn) then
            if (SampleCount < 256*10-1 and (Reset = '0')) then
               SampleCount <= SampleCount + 1;
            else
               SampleCount <= 0;
               if (FreqOffset < 14) then
                  FreqOffset <= FreqOffset + 1;
               else
                  FreqOffset <= -13;
               end if;
            end if;
            DlyR  <= DlyR(DELAY-1 downto 0) & R1;
            DlyI  <= DlyI(DELAY-1 downto 0) & I1;
            R_Mix <= R2;
            I_Mix <= I2;
            if (FREQ_OFFSET = LO) then       -- move IF2 up 70KHz
               Cos   <= to_sfixed(NcoData(17 downto 0), NcodR);
               Sin   <= to_sfixed(NcoData(24+17 downto 24), NcodI);
            elsif (FREQ_OFFSET = CNTR) then
               Cos <= 18x"1_FFFF";           -- -1.0, 0.0, leave IF2 alone, just delayed
               Sin <= 18x"0_0000";
            else                             -- move IF2 up 70KHz
               Cos   <= to_sfixed(NcoData(17 downto 0), NcodR);
               Sin   <= to_sfixed(not(NcoData(24+17 downto 24)), NcodI);
            end if;
         end if;
      end if;
   end process DlyProc;

   ComplexMult : CmplxMult    -- shift R/I_Mix 70KHz
      GENERIC MAP(
         IN_WIDTH  => 18,
         IN_BINPT  => 17,
         OUT_WIDTH => 18,
         OUT_BINPT => 17
      )
      PORT MAP(
         clk         => Clk186M,
         reset       => Reset,
         ce          => '1',
         ValidIn     => ValidDataInDly,
         StartIn     => '0',
         ReadyIn     => '1',
         ReInA       => R_Mix,
         ImInA       => I_Mix,
         ReInB       => Cos,
         ImInB       => Sin,
         ReOut       => NcodR,
         ImOut       => NcodI,
         ValidOut    => ValidMixer,
         StartOut    => open
   );

   FftIn <= 6x"00" & to_slv(NcodI) & 6x"00" & to_slv(NcodR) & 6x"00" & to_slv(DlyI(DlyI'left)) & 6x"00" & to_slv(DlyR(DlyR'left))
         when (ValidMixer) else 96x"00";

   -- Note the FFTs are in floating point output mode but since I only want the relative peak,
   -- I don't care about the absolute level of the signal from frame to frame, unlike the pilot
   -- detector in STC.

   Fft_u : fft_512_Float
    port map (
      aclk                          => Clk186M,
      aresetn                       => not (Reset or Restart),
      aclken                        => ce,
      s_axis_config_tvalid          => '0', -- not needed and prone to error, was ConfigTValid,
      s_axis_config_tready          => ConfigTReady(0),
      s_axis_config_tdata           => FFT_CODE,
      s_axis_data_tvalid            => ValidFftInDly(DELAY),      -- high for 512 samples
      s_axis_data_tready            => FftReady,
      s_axis_data_tdata             => FftIn,
      s_axis_data_tlast             => FftTLastInDly(DELAY),
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


   FftProcess : process(Clk186M)
      variable CountEq255  : std_logic;
   begin
      if (rising_edge(Clk186M)) then
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
      GENERIC MAP (
         IN_WIDTH    => FftR1'length,
         IN_BINPT    => -FftR1'right,
         OUT_WIDTH   => XC_Size'length,
         OUT_BINPT   => -XC_Size'right
      )
      PORT MAP(
         clk         => Clk186M,
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

   SetForInvFFT : process(Clk186M)
   begin
      if (rising_edge(Clk186M)) then
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

   iFft_u : fft_512_Float     -- fft_512 is dual channel, but only one iFft channel is needed
    port map (          -- this FFT is also floating point output in 0.-17 format
      aclk                          => Clk186M,
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
                  OUT_WIDTH => AbsPeak'length,   OUT_BINPT => AbsPeak'right )
      PORT MAP(
         clk    => Clk186M,     reset    => Reset or Restart,    ce       => ce,
         ReIn   => iFftR,     ImIn     => iFftI,      ValidIn  => ValidIFftOut,
         ReOut  => open,      ImOut    => open,
         AbsOut => AbsFft,    ValidOut => ValidAbs,   StartIn  => '0', StartOut => open);


   -- Now find peak of iFFT
   MaxProcess : process(Clk186M)
   begin
      if (rising_edge(Clk186M)) then
         if (Reset) then            -- ignore Restart to let previous IndexOut carry over
            Index0      <= 0;
            IndexOut    <= x"00";
            SkipFirst2  <= "00";
            AbeforeB    <= '1';
            PeakOut     <= (others=>'0');
            AbsPeak     <= (others=>'0');
            MaxFft      <= (others=>'0');
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
                  PeakOut  <= AbsPeak;
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
         end if;
      end if;
   end process MaxProcess;

END rtl;

