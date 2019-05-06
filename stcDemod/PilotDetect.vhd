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

      Module Name: PilotDetect.vhd

      Description: Pack the data into 512 sample packets then do an FFT. Multiply
   the FFT output with stored FFTs of the pilot at -66KHz, 0Hz and +66KHz as
   cross correlations of the incoming pilot and the stored pilots. Do IFFTs of
   the cross correlations then overlap from previous frame and add the results.
   Then search the result for the largest magnitude index. This index points
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
   9/17/16 Initial release FZ
-----------------------------------------------------------------------------*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity PilotDetect is
   GENERIC (SIM_MODE : boolean := false
   );
   PORT(
         clk,
         clk2x,
         reset,
         reset2x,
         ce,
         ValidIn        : IN  std_logic;
         Variables      : IN  RecordType;
         ReIn,
         ImIn           : IN  FLOAT_1_18;
         PilotIndex     : OUT ufixed(10 downto 0);
            AbsPos0,
            AbsPos1,
            AbsCntr0,
            AbsCntr1,
            AbsNeg0,
            AbsNeg1,
         PilotMag,
         Threshold      : OUT sfixed(11 downto -6);
            iFftPos0R,
            iFftPos1R,
            iFftPos0I,
            iFftPos1I        : OUT sfixed(4 downto -13);
         ReOut,
         ImOut          : OUT FLOAT_1_18;
         PilotFound,
         ValidOut,
         StartOut       : OUT std_logic
      );
end PilotDetect;

architecture rtl of PilotDetect is

  -- Define Components

   COMPONENT PilotTemplates IS
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         Count          : IN  natural range 0 to 1023;
         H0NegR,
         H0NegI,
         H1NegR,
         H1NegI,
         H0CntrR,
         H0CntrI,
         H1CntrR,
         H1CntrI,
         H0PosR,
         H0PosI,
         H1PosR,
         H1PosI         : OUT Float_256_LP
      );
   END COMPONENT PilotTemplates;

   COMPONENT fft_1k IS
     PORT (
       aclk,
       aclken,
       aresetn,
       s_axis_config_tvalid         : IN STD_LOGIC;
       s_axis_config_tdata          : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       s_axis_config_tready         : OUT STD_LOGIC;
       s_axis_data_tvalid           : IN STD_LOGIC;
       s_axis_data_tready           : OUT STD_LOGIC;
       s_axis_data_tlast            : IN STD_LOGIC;
       s_axis_data_tdata            : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
       m_axis_data_tdata            : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
       m_axis_data_tvalid,
       m_axis_data_tlast,
       event_frame_started,
       event_tlast_unexpected,
       event_tlast_missing,
       event_data_in_channel_halt   : OUT STD_LOGIC
     );
   END COMPONENT fft_1k;

   COMPONENT CmplxMult IS
   GENERIC (
      OUT_BINPT : integer := -3
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
      ImInB          : IN  Float_256_LP;
      ReOut,
      ImOut          : OUT sfixed(OUT_BINPT + 17 downto OUT_BINPT);
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
         ImIn           : IN  FLOAT_1_18;
         ValidIn,
         StartIn        : IN  std_logic;
         AbsOut         : OUT FLOAT_1_18;
         ValidOut,
         StartOut       : OUT std_logic
      );
   END COMPONENT OverlapAddAbs;

   COMPONENT PD_Fft_Fifo IS
         GENERIC(
            DATA_WIDTH  : positive := 18;
            BINPT       : integer  := -17;
            WORDS       : positive := 512
         );
      PORT(
         clk,
         clk2x,
         reset,
         reset2x,
         ce,
         ReadyIn,
         ValidIn           : IN  std_logic;
 --        PacketOffset      : IN  natural range 0 to 512;
         ReIn,
         ImIn              : IN  sfixed(DATA_WIDTH-BINPT-1 downto -BINPT);
         ReOut1x,
         ImOut1x           : OUT sfixed(DATA_WIDTH-BINPT-1 downto -BINPT);
         Start1x,
         ValidOut1x,
         LastOut1x         : OUT std_logic;
         ReOut2x,
         ImOut2x           : OUT sfixed(DATA_WIDTH-BINPT-1 downto -BINPT);
         Start2x,
         ValidOut2x,
         LastOut2x         : OUT std_logic
      );
   END COMPONENT PD_Fft_Fifo;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------
   CONSTANT FFT_TOP_R      : natural := 26; -- Pick useful FFT bits
   CONSTANT FFT_BOT_R      : natural := FFT_TOP_R - 17;
   CONSTANT FFT_TOP_I      : natural := FFT_TOP_R + 32;
   CONSTANT FFT_BOT_I      : natural := FFT_TOP_I - 17;
   CONSTANT IFFT_TOP_R     : natural := 19; -- Pick useful iFFT bits
   CONSTANT IFFT_BOT_R     : natural := IFFT_TOP_R - 17;
   CONSTANT IFFT_TOP_I     : natural := IFFT_TOP_R + 32;
   CONSTANT IFFT_BOT_I     : natural := IFFT_TOP_I - 17;
   CONSTANT FFT_CODE       : SLV8 := x"01";
   CONSTANT IFFT_CODE      : SLV8 := x"00";
   CONSTANT FFT_IFFT_DELAY : natural := 4334;
   CONSTANT FFT_ALL_ONES   : std_logic_vector(31 downto FFT_TOP_R) := (others=>'1');
   CONSTANT FFT_ALL_ZEROS  : std_logic_vector(31 downto FFT_TOP_R) := (others=>'0');
   CONSTANT IFFT_ALL_ONES  : std_logic_vector(31 downto IFFT_TOP_R) := (others=>'1');
   CONSTANT IFFT_ALL_ZEROS : std_logic_vector(31 downto IFFT_TOP_R) := (others=>'0');


   function count_ones(in_vector : std_logic_vector) return natural is
      variable result : natural;
   begin
      result            := 0;
      for i in (in_vector'left) downto in_vector'right loop
         if (in_vector(i) = '1') then
            result      := result + 1;
         end if;
      end loop;
      return result;
   end function count_ones;

   function count_zeros(in_vector : std_logic_vector) return natural is
      variable result : natural;
   begin
      result            := 0;
      for i in (in_vector'left) downto in_vector'right loop
         if (in_vector(i) = '0') then
            result      := result + 1;
         end if;
      end loop;
      return result;
   end function count_zeros;

--   CONSTANT HYSTERESIS     : positive := 64; -- turn PacketOffset on/off
   type  MAG_ARRAY  is array (natural range <>) of sfixed(11 downto -6);

   SIGNAL   ConfigTValid,
            ConfigDone,
            OverflowFft,
            OverflowIFft,
            StartPack,
            Start1x,
            ValidInDly,
            ValidAbsDly,
            ValidPack,
            ValidFft,
            ValidFftDly,
            ValidMult,
            ValidIFftOut,
            ValidCos,
            ValidAbs,
            Hi1, Hi0,
            Lo1, Lo0,
            FftStarted,
            FftUnexpected,
            FftMissing,
            FftHalted,
            FftReady,
            FftTLastIn,
            FftTLastOut,
            PilotPulse,
            PilotPulse1x,
            CalcThreshold     : std_logic := '0';
   SIGNAL   SkipPacket        : std_logic_vector(1 downto 0);
   SIGNAL   ReInDly,
            ImInDly           : sfixed(14 downto -3);
   SIGNAL   XC_Zero,
            XC0NegR,           -- -66KHz version of H0's
            XC0NegI,
            XC0CntrR,              -- 0Hz version of H0's
            XC0CntrI,
            XC0PosR,           -- +66KHz version of H0's
            XC0PosI,
            XC1NegR,           -- -66KHz version of H1's
            XC1NegI,
            XC1CntrR,              -- 0Hz version of H1's
            XC1CntrI,
            XC1PosR,           -- +66KHz version of H1's
            XC1PosI           : sfixed(14 downto -3);
   SIGNAL   iFftZero,
            iFftNeg0R,
            iFftNeg1R,
            iFftCntr0R,
            iFftCntr1R,
            iFftNeg0I,
            iFftNeg1I,
            iFftCntr0I,
            iFftCntr1I/*,
            iFftPos0R,
            iFftPos1R,
            iFftPos0I,
            iFftPos1I   */     : sfixed(4 downto -13);
  SIGNAL    AbsZero,          -- just used for setting generics
/*            AbsPos0,
            AbsPos1,
            AbsCntr0,
            AbsCntr1,
            AbsNeg0,
            AbsNeg1,
*/            MaxPos,
            MaxCntr,
            MaxCntrDly,
            MaxNeg,
            Max1,
            Max2,
            Max,
            CurrentPeak,
            Peak1,
            Peak2             : sfixed(PilotMag'left downto PilotMag'right);
   SIGNAL   MagDelay          : MAG_ARRAY(27 downto 0);
   SIGNAL   PackR,
            PackI             : float_1_18 := float_zero_1_18;
   SIGNAL   FftR,
            FftI,
            H0NegR,
            H0NegI,
            H1NegR,
            H1NegI,
            H0CntrR,
            H0CntrI,
            H1CntrR,
            H1CntrI,
            H0PosR,
            H0PosI,
            H1PosR,              -- good size
            H1PosI            : FLOAT_256_LP;
   SIGNAL   Count,
--            PacketOffset,
            Index0,
            Index1,
            Index2,
            Index3,
            MaxIndex          : natural range 0 to 1024;
   SIGNAL   MultTLast,
            ConfigTReady      : std_logic_vector(6 downto 0);
   SIGNAL   tdata1,
            tdata2            : std_logic_vector(47 downto 0) := (others => '0');
   SIGNAL   FftOutSlv,
            iFftNeg0Slv,
            iFftNeg1Slv,
            iFftCntr0Slv,
            iFftCntr1Slv,
            iFftPos0Slv,
            iFftPos1Slv       : std_logic_vector(63 downto 0); -- fixed by FFT
   SIGNAL   iFftReady         : std_logic_vector(5 downto 0);
   SIGNAL   GoodPilot         : integer range 0 to 3;
   SIGNAL   BadPilot,
            IgnoreInitial     : integer range 0 to 128;
   SIGNAL   PeakPointer,
            PacketsPerFrame   : natural range 0 to 27;
   SIGNAL   SampleCount       : natural range 0 to 163830;

-- ILAs
   SIGNAL   PilotFound_Ila    : std_logic;
   SIGNAL   GoodPilot_Ila     : integer range 0 to 3;
   SIGNAL   BadPilot_Ila      : integer range 0 to 128;
   SIGNAL   iFftOnesHi,
            iFftOnesLo,
            iFftZerosHi,
            iFftZerosLo       : natural range 0 to 31;
   SIGNAL   PilotMag_Ila,
            Threshold_Ila,
            Peak1_Ila,
            Peak2_Ila         : SLV18;
   attribute mark_debug : string;
   attribute mark_debug of PilotMag_Ila      : signal is "true";
   attribute mark_debug of PilotFound_Ila    : signal is "true";
   attribute mark_debug of Threshold_Ila     : signal is "true";
   attribute mark_debug of GoodPilot_Ila     : signal is "true";
   attribute mark_debug of BadPilot_Ila      : signal is "true";
   attribute mark_debug of Peak1_Ila         : signal is "true";
   attribute mark_debug of Peak2_Ila         : signal is "true";
   attribute mark_debug of PilotIndex        : signal is "true";
   attribute mark_debug of OverflowFft       : signal is "true";
   attribute mark_debug of OverflowIFft      : signal is "true";
   attribute mark_debug of iFftOnesHi    : signal is "true";
   attribute mark_debug of iFftOnesLo    : signal is "true";
   attribute mark_debug of iFftZerosHi   : signal is "true";
   attribute mark_debug of iFftZerosLo   : signal is "true";

begin

   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         PilotMag_Ila   <= to_slv(PilotMag);
         Peak1_Ila      <= to_slv(Peak1);
         Peak2_Ila      <= to_slv(Peak2);
         Threshold_Ila  <= to_slv(Threshold);
         PilotFound_Ila <= PilotFound;
         GoodPilot_Ila  <= GoodPilot;
         BadPilot_Ila   <= BadPilot;
--         if (SIM_MODE) then
--            PacketsPerFrame  <= 5;
--         else
            PacketsPerFrame  <= 26;
--         end if;
      end if;
   end process IlaProcess;


   -- provide an option of flipping the frequency spectrum by inverting I (Conjugate).
   Conjugate_u : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            ReInDly        <= (others=>'0');
            ImInDly        <= (others=>'0');
         elsif (ce) then
            if (ValidIn and not ValidInDly) then   -- use rising edge of ValidIn to allow for ValidIn wider than one of this clk width
               ReInDly <= ReIn;
               if (Variables.MiscBits(Conjugate)) then
                  ImInDly <= not ImIn;
               else
                  ImInDly <= ImIn;
               end if;
            end if;
            ValidInDly <= ValidIn;
         end if;
      end if;
   end process;

   SetForInvFFT : process(Clk2x)
   begin
      if (rising_edge(Clk2x)) then
         if (reset2x) then
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

   -- Pack the resampler data into 512 sample packets for burst processing
   PackFifo : PD_Fft_Fifo
         GENERIC MAP(
            DATA_WIDTH     => ReInDly'length,
            BINPT          => ReInDly'right,
            WORDS          => 512
         )
      PORT MAP(
         clk               => clk,
         clk2x             => Clk2x,
         reset             => reset,
         reset2x           => reset2x,
         ce                => ce,
 --        PacketOffset      => PacketOffset,
         ReadyIn           => FftReady,
         ValidIn           => ValidInDly,
         ReIn              => ReInDly,
         ImIn              => ImInDly,
         ReOut2x           => PackR,
         ImOut2x           => PackI,
         Start2x           => StartPack,
         ValidOut2x        => ValidPack,
         LastOut2x         => FftTLastIn,
         ReOut1x           => ReOut,
         ImOut1x           => ImOut,
         Start1x           => Start1x,
         ValidOut1x        => ValidOut,
         LastOut1x         => open
      );

   Fft_u : fft_1k
    port map (
      aclk                        => Clk2x,
      aresetn                     => not reset2x,
      aclken                      => ce,
      s_axis_config_tvalid        => '0', -- not needed and prone to error, was ConfigTValid,
      s_axis_config_tready        => ConfigTReady(6),
      s_axis_config_tdata         => FFT_CODE,
      s_axis_data_tvalid          => ValidPack,
      s_axis_data_tready          => FftReady,
      s_axis_data_tdata           => 6x"00" & to_slv(PackI) & 6x"00" & to_slv(PackR),
      s_axis_data_tlast           => FftTLastIn,
      m_axis_data_tvalid          => ValidFft,
      m_axis_data_tdata           => FftOutSlv,
      m_axis_data_tlast           => FftTLastOut,
      event_frame_started         => FftStarted,
      event_tlast_unexpected      => FftUnexpected,
      event_tlast_missing         => FftMissing,
      event_data_in_channel_halt  => FftHalted
      );


   FftProcess : process(Clk2x)
      variable CountEq1023,
               Hi1, Hi0,
               Lo1, Lo0       : std_logic;
   begin
      if (rising_edge(Clk2x)) then
         if (reset2x) then
            Count          <= 0;
            OverflowFft    <= '0';
            ValidFftDly    <= '0';
            FftR           <= (others=>'0');
            FftI           <= (others=>'0');
            MultTLast      <= (others=>'0');
         elsif (ce) then
            if (ValidFft = '1') and (Count < 1023) then
               Count <= Count + 1;
            else
               Count <= 0;
            end if;
            ValidFftDly    <= ValidFft;
            FftR           <= to_sfixed(FftOutSlv(FFT_TOP_R downto FFT_BOT_R), FftR);
            FftI           <= to_sfixed(FftOutSlv(FFT_TOP_I downto FFT_BOT_I), FftI);
            Lo1            := (FftOutSlv(31 downto FFT_TOP_R) ?= FFT_ALL_ONES);
            Hi1            := (FftOutSlv(63 downto FFT_TOP_I) ?= FFT_ALL_ONES);
            Lo0            := (FftOutSlv(31 downto FFT_TOP_R) ?= FFT_ALL_ZEROS);
            Hi0            := (FftOutSlv(63 downto FFT_TOP_I) ?= FFT_ALL_ZEROS);
            OverflowFft    <= ((not Hi1 and not Hi0) or (not Lo1 and not Lo0));
            CountEq1023    := '1' when (Count = 1023) else '0';
            MultTLast      <= MultTLast(5 downto 0) & CountEq1023;
         end if;
      end if;
   end process FftProcess;

   Templates : PilotTemplates
      PORT MAP(
         clk      => Clk2x,
         reset    => reset2x,
         ce       => ce,
         Count    => Count,
         H0NegR   => H0NegR,
         H0NegI   => H0NegI,
         H1NegR   => H1NegR,
         H1NegI   => H1NegI,
         H0CntrR  => H0CntrR,
         H0CntrI  => H0CntrI,
         H1CntrR  => H1CntrR,
         H1CntrI  => H1CntrI,
         H0PosR   => H0PosR,
         H0PosI   => H0PosI,
         H1PosR   => H1PosR,
         H1PosI   => H1PosI
      );


   -- Multiply the stored pilot fft by the incoming stream
   H0Neg_x_Fft : CmplxMult
      GENERIC MAP ( OUT_BINPT => XC_Zero'right)
      PORT MAP(
         clk         => Clk2x,
         ce          => ce,
         reset       => reset2x,
         ReadyIn     => iFftReady(0),
         ReInA       => H0NegR,
         ImInA       => H0NegI,
         ReInB       => FftR,
         ImInB       => FftI,
         ValidIn     => ValidFftDly,
         StartIn     => '0',
         ReOut       => XC0NegR,
         ImOut       => XC0NegI,
         ValidOut    => ValidMult,
         StartOut    => open
      );

   iFftNeg0_u : fft_1k
    port map (
      aclk                        => Clk2x,
      aresetn                     => not reset2x,
      aclken                      => ce,
      s_axis_config_tvalid        => ConfigTValid,
      s_axis_config_tready        => ConfigTReady(0),
      s_axis_config_tdata         => IFFT_CODE,
      s_axis_data_tvalid          => ValidMult,
      s_axis_data_tready          => iFftReady(0),
      s_axis_data_tdata           => 6x"00" & to_slv(XC0NegI) & 6x"00" & to_slv(XC0NegR),
      s_axis_data_tlast           => MultTLast(6),
      m_axis_data_tvalid          => ValidIFftOut,
      m_axis_data_tdata           => iFftNeg0Slv,
      m_axis_data_tlast           => open,
      event_frame_started         => open,
      event_tlast_unexpected      => open,
      event_tlast_missing         => open,
      event_data_in_channel_halt  => open
      );

   H1Neg_x_Fft : CmplxMult
      GENERIC MAP ( OUT_BINPT => XC_Zero'right)
      PORT MAP(
         clk         => Clk2x,
         ce          => ce,
         reset       => reset2x,
         ReadyIn     => iFftReady(1),
         ReInA       => H1NegR,
         ImInA       => H1NegI,
         ReInB       => FftR,
         ImInB       => FftI,
         ValidIn     => ValidFftDly,
         StartIn     => '0',
         ReOut       => XC1NegR,
         ImOut       => XC1NegI,
         ValidOut    => open,
         StartOut    => open
      );

   iFftNeg1_u : fft_1k
    port map (
      aclk                        => Clk2x,
      aresetn                     => not reset2x,
      aclken                      => ce,
      s_axis_config_tvalid        => ConfigTValid,
      s_axis_config_tready        => ConfigTReady(1),
      s_axis_config_tdata         => IFFT_CODE,
      s_axis_data_tvalid          => ValidMult,
      s_axis_data_tready          => iFftReady(1),
      s_axis_data_tdata           => 6x"00" & to_slv(XC1NegI) & 6x"00" & to_slv(XC1NegR),
      s_axis_data_tlast           => MultTLast(6),
      m_axis_data_tvalid          => open,
      m_axis_data_tdata           => iFftNeg1Slv,
      m_axis_data_tlast           => open,
      event_frame_started         => open,
      event_tlast_unexpected      => open,
      event_tlast_missing         => open,
      event_data_in_channel_halt  => open
      );

   iFftNeg0R <= to_sfixed(iFftNeg0Slv(IFFT_TOP_R downto IFFT_BOT_R), iFftNeg0R);
   iFftNeg0I <= to_sfixed(iFftNeg0Slv(IFFT_TOP_I downto IFFT_BOT_I), iFftNeg0I);
   iFftNeg1R <= to_sfixed(iFftNeg1Slv(IFFT_TOP_R downto IFFT_BOT_R), iFftNeg1R);
   iFftNeg1I <= to_sfixed(iFftNeg1Slv(IFFT_TOP_I downto IFFT_BOT_I), iFftNeg1I);
/*
   Neg0Abs : OverlapAddAbs
      GENERIC MAP(IN_WIDTH  => iFftZero'length, IN_BINPT  => iFftZero'right,
                  OUT_WIDTH => AbsZero'length,  OUT_BINPT => AbsZero'right )
      PORT MAP(
         clk    => Clk2x,     reset    => reset2x,   ce       => ce,
         ReIn   => iFftNeg0R, ImIn     => iFftNeg0I, ValidIn  => ValidIFftOut,
         AbsOut => AbsNeg0,   ValidOut => ValidAbs,  StartIn  => '0',    StartOut => open);
*/
   Neg1Abs : OverlapAddAbs
      GENERIC MAP(IN_WIDTH  => iFftZero'length, IN_BINPT  => iFftZero'right,
                  OUT_WIDTH => AbsZero'length,  OUT_BINPT => AbsZero'right )
      PORT MAP(
         clk    => Clk2x,     reset    => reset2x,   ce       => ce,
         ReIn   => iFftNeg1R, ImIn     => iFftNeg1I, ValidIn  => ValidIFftOut,
         AbsOut => AbsNeg1,   ValidOut => open,      StartIn  => '0', StartOut => open);



   -- Do same for center (no offset frequency)
   H0Cntr_x_Fft : CmplxMult
      GENERIC MAP ( OUT_BINPT => XC_Zero'right)
      PORT MAP(
         clk         => Clk2x,
         ce          => ce,
         reset       => reset2x,
         ReadyIn     => iFftReady(2),
         ReInA       => H0CntrR,
         ImInA       => H0CntrI,
         ReInB       => FftR,
         ImInB       => FftI,
         ValidIn     => ValidFftDly,
         StartIn     => '0',
         ReOut       => XC0CntrR,
         ImOut       => XC0CntrI,
         ValidOut    => open,
         StartOut    => open
      );

   iFftCntr0_u : fft_1k
    port map (
      aclk                        => Clk2x,
      aresetn                     => not reset2x,
      aclken                      => ce,
      s_axis_config_tvalid        => ConfigTValid,
      s_axis_config_tready        => ConfigTReady(2),
      s_axis_config_tdata         => IFFT_CODE,
      s_axis_data_tvalid          => ValidMult,
      s_axis_data_tready          => iFftReady(2),
      s_axis_data_tdata           => 6x"00" & to_slv(XC0CntrI) & 6x"00" & to_slv(XC0CntrR),
      s_axis_data_tlast           => MultTLast(6),
      m_axis_data_tvalid          => open,
      m_axis_data_tdata           => iFftCntr0Slv,
      m_axis_data_tlast           => open,
      event_frame_started         => open,
      event_tlast_unexpected      => open,
      event_tlast_missing         => open,
      event_data_in_channel_halt  => open
      );

   process(Clk2x)
   begin
      if (rising_edge(Clk2x)) then
         if (reset2x) then
            OverflowIFft <= '0';
            Lo1          <= '1';
            Hi1          <= '1';
            Lo0          <= '1';
            Hi0          <= '1';
         elsif (ce) then
            Hi1          <= (iFftCntr0Slv(63 downto IFFT_TOP_I) ?= IFFT_ALL_ONES);  -- Hi checks for Imag, Lo checks for Real
            Hi0          <= (iFftCntr0Slv(63 downto IFFT_TOP_I) ?= IFFT_ALL_ZEROS);
            Lo1          <= (iFftCntr0Slv(31 downto IFFT_TOP_R) ?= IFFT_ALL_ONES);
            Lo0          <= (iFftCntr0Slv(31 downto IFFT_TOP_R) ?= IFFT_ALL_ZEROS);
            OverflowIFft <= not ( (Lo1 or Lo0) and (Hi1 or Hi0) );
            iFftOnesHi   <= count_ones( iFftCntr0Slv(31 downto IFFT_TOP_R) );
            iFftOnesLo   <= count_ones( iFftCntr0Slv(63 downto IFFT_TOP_I) );
            iFftZerosHi  <= count_zeros(iFftCntr0Slv(31 downto IFFT_TOP_R) );
            iFftZerosLo  <= count_zeros(iFftCntr0Slv(63 downto IFFT_TOP_I) );
         end if;
      end if;
   end process;

   H1Cntr_x_Fft : CmplxMult
      GENERIC MAP ( OUT_BINPT => XC_Zero'right)
      PORT MAP(
         clk         => Clk2x,
         ce          => ce,
         reset       => reset2x,
         ReadyIn     => iFftReady(3),
         ReInA       => H1CntrR,
         ImInA       => H1CntrI,
         ReInB       => FftR,
         ImInB       => FftI,
         ValidIn     => ValidFftDly,
         StartIn     => '0',
         ReOut       => XC1CntrR,
         ImOut       => XC1CntrI,
         ValidOut    => open,
         StartOut    => open
      );

   iFftCntr1_u : fft_1k
    port map (
      aclk                        => Clk2x,
      aresetn                     => not reset2x,
      aclken                      => ce,
      s_axis_config_tvalid        => ConfigTValid,
      s_axis_config_tready        => ConfigTReady(3),
      s_axis_config_tdata         => IFFT_CODE,
      s_axis_data_tvalid          => ValidMult,
      s_axis_data_tready          => iFftReady(3),
      s_axis_data_tdata           => 6x"00" & to_slv(XC1CntrI) & 6x"00" & to_slv(XC1CntrR),
      s_axis_data_tlast           => MultTLast(6),
      m_axis_data_tvalid          => open,
      m_axis_data_tdata           => iFftCntr1Slv,
      m_axis_data_tlast           => open,
      event_frame_started         => open,
      event_tlast_unexpected      => open,
      event_tlast_missing         => open,
      event_data_in_channel_halt  => open
      );

   iFftCntr0R <= to_sfixed(iFftCntr0Slv(IFFT_TOP_R downto IFFT_BOT_R), iFftCntr0R);
   iFftCntr0I <= to_sfixed(iFftCntr0Slv(IFFT_TOP_I downto IFFT_BOT_I), iFftCntr0I);
   iFftCntr1R <= to_sfixed(iFftCntr1Slv(IFFT_TOP_R downto IFFT_BOT_R), iFftCntr1R);
   iFftCntr1I <= to_sfixed(iFftCntr1Slv(IFFT_TOP_I downto IFFT_BOT_I), iFftCntr1I);

   Cntr0Abs : OverlapAddAbs
      GENERIC MAP(IN_WIDTH  => iFftZero'length, IN_BINPT  => iFftZero'right,
                  OUT_WIDTH => AbsZero'length,  OUT_BINPT => AbsZero'right )
      PORT MAP(
         clk    => Clk2x,      reset    => reset2x,    ce       => ce,
         ReIn   => iFftCntr0R, ImIn     => iFftCntr0I, ValidIn  => ValidIFftOut,
         AbsOut => AbsCntr0,   ValidOut => open,       StartIn  => '0', StartOut => open);

   Cntr1Abs : OverlapAddAbs
      GENERIC MAP(IN_WIDTH  => iFftZero'length, IN_BINPT  => iFftZero'right,
                  OUT_WIDTH => AbsZero'length,  OUT_BINPT => AbsZero'right )
      PORT MAP(
         clk    => Clk2x,      reset    => reset2x,    ce       => ce,
         ReIn   => iFftCntr1R, ImIn     => iFftCntr1I, ValidIn  => ValidIFftOut,
         AbsOut => AbsCntr1,   ValidOut => open,       StartIn  => '0', StartOut => open);


   -- process +66Khz offset
   H0Pos_x_Fft : CmplxMult
      GENERIC MAP ( OUT_BINPT => XC_Zero'right)
      PORT MAP(
         clk         => Clk2x,
         ce          => ce,
         reset       => reset2x,
         ReadyIn     => iFftReady(4),
         ReInA       => H0PosR,
         ImInA       => H0PosI,
         ReInB       => FftR,
         ImInB       => FftI,
         ValidIn     => ValidFftDly,
         StartIn     => '0',
         ReOut       => XC0PosR,
         ImOut       => XC0PosI,
         ValidOut    => open,
         StartOut    => open
      );

   iFftPos0_u : fft_1k
    port map (
      aclk                        => Clk2x,
      aresetn                     => not reset2x,
      aclken                      => ce,
      s_axis_config_tvalid        => ConfigTValid,
      s_axis_config_tready        => ConfigTReady(4),
      s_axis_config_tdata         => IFFT_CODE,
      s_axis_data_tvalid          => ValidMult,
      s_axis_data_tready          => iFftReady(4),
      s_axis_data_tdata           => 6x"00" & to_slv(XC0PosI) & 6x"00" & to_slv(XC0PosR),
      s_axis_data_tlast           => MultTLast(6),
      m_axis_data_tvalid          => open,
      m_axis_data_tdata           => iFftPos0Slv,
      m_axis_data_tlast           => open,
      event_frame_started         => open,
      event_tlast_unexpected      => open,
      event_tlast_missing         => open,
      event_data_in_channel_halt  => open
      );

   H1Pos_x_Fft : CmplxMult
      GENERIC MAP ( OUT_BINPT => XC_Zero'right)
      PORT MAP(
         clk         => Clk2x,
         ce          => ce,
         reset       => reset2x,
         ReadyIn     => iFftReady(5),
         ReInA       => H1PosR,
         ImInA       => H1PosI,
         ReInB       => FftR,
         ImInB       => FftI,
         ValidIn     => ValidFftDly,
         StartIn     => '0',
         ReOut       => XC1PosR,
         ImOut       => XC1PosI,
         ValidOut    => open,
         StartOut    => open
      );

   iFftPos1_u : fft_1k
    port map (
      aclk                        => Clk2x,
      aresetn                     => not reset2x,
      aclken                      => ce,
      s_axis_config_tvalid        => ConfigTValid,
      s_axis_config_tready        => ConfigTReady(5),
      s_axis_config_tdata         => IFFT_CODE,
      s_axis_data_tvalid          => ValidMult,
      s_axis_data_tready          => iFftReady(5),
      s_axis_data_tdata           => 6x"00" & to_slv(XC1PosI) & 6x"00" & to_slv(XC1PosR),
      s_axis_data_tlast           => MultTLast(6),
      m_axis_data_tvalid          => open,
      m_axis_data_tdata           => iFftPos1Slv,
      m_axis_data_tlast           => open,
      event_frame_started         => open,
      event_tlast_unexpected      => open,
      event_tlast_missing         => open,
      event_data_in_channel_halt  => open
      );

   iFftPos0R <= to_sfixed(iFftPos0Slv(IFFT_TOP_R downto IFFT_BOT_R), iFftPos0R);
   iFftPos0I <= to_sfixed(iFftPos0Slv(IFFT_TOP_I downto IFFT_BOT_I), iFftPos0I);
   iFftPos1R <= to_sfixed(iFftPos1Slv(IFFT_TOP_R downto IFFT_BOT_R), iFftPos1R);
   iFftPos1I <= to_sfixed(iFftPos1Slv(IFFT_TOP_I downto IFFT_BOT_I), iFftPos1I);

   Pos0Abs : OverlapAddAbs
      GENERIC MAP(IN_WIDTH  => iFftZero'length, IN_BINPT  => iFftZero'right,
                  OUT_WIDTH => AbsZero'length,  OUT_BINPT => AbsZero'right )
      PORT MAP(
         clk    => Clk2x,     reset    => reset2x,   ce       => ce,
         ReIn   => iFftPos0R, ImIn     => iFftPos0I, ValidIn  => ValidIFftOut,
         AbsOut => AbsPos0,   ValidOut => open,      StartIn  => '0', StartOut => open);

   Pos1Abs : OverlapAddAbs
      GENERIC MAP(IN_WIDTH  => iFftZero'length, IN_BINPT  => iFftZero'right,
                  OUT_WIDTH => AbsZero'length,  OUT_BINPT => AbsZero'right )
      PORT MAP(
         clk    => Clk2x,     reset    => reset2x,   ce       => ce,
         ReIn   => iFftPos1R, ImIn     => iFftPos1I, ValidIn  => ValidIFftOut,
         AbsOut => AbsPos1,   ValidOut => open,      StartIn  => '0', StartOut => open);
/*
   -- Now find peak of all offsets and H0/1
   MaxProcess : process(Clk2x)
   begin
      if (rising_edge(Clk2x)) then
         if (reset2x) then
            MaxIndex     <= 0;
            Index0       <= 0;
            Index1       <= 0;
            Index2       <= 0;
            Index3       <= 0;
            PilotPulse   <= '0';
            Max1         <= (others=>'0');
            Max2         <= (others=>'0');
            Max          <= (others=>'0');
            MaxPos       <= (others=>'0');
            MaxCntr      <= (others=>'0');
            MaxCntrDly   <= (others=>'0');
            MaxNeg       <= (others=>'0');
         elsif (ce) then
            Index1   <= Index0;
            Index2   <= Index1;
            Index3   <= Index2;
            MaxCntrDly <= MaxCntr;     --pipeline center to line up with pos/neg => Max1
            if (ValidAbs = '1') and (Index3 <= 514) then
               if (AbsPos0 > AbsPos1) then
                  MaxPos <= AbsPos0;
               else
                  MaxPos <= AbsPos1;
               end if;
               if (AbsCntr0 > AbsCntr1) then
                  MaxCntr <= AbsCntr0;
               else
                  MaxCntr <= AbsCntr1;
               end if;
               if (AbsNeg0 > AbsNeg1) then
                  MaxNeg <= AbsNeg0;
               else
                  MaxNeg <= AbsNeg1;
               end if;
               if (MaxNeg > MaxPos) then
                  Max1 <= MaxNeg;
               else
                  Max1 <= MaxPos;
               end if;
               if (MaxCntrDly > Max1) then
                  Max2 <= MaxCntrDly;
               else
                  Max2 <= Max1;
               end if;
               if (Max2 > Max) then
                  Max <= Max2;
                  MaxIndex <= Index3;
               end if;
            else
               MaxPos   <= (others=>'0');
               MaxCntr  <= (others=>'0');
               MaxNeg   <= (others=>'0');
               Max1     <= (others=>'0');
               Max2     <= (others=>'0');
               Max      <= (others=>'0');
            end if;
            if (ValidAbs) then
               if (Index3 = 512) then  -- only check first 512 samples
                  PilotPulse     <= '1';
               elsif (Index3 = 514) then  -- send wider pulse to threshold logic at lower clock
                  PilotPulse     <= '0';
               end if;
               Index0 <= Index0 + 1;
            else
               Index0 <= 0;
            end if;
         end if;
      end if;
   end process MaxProcess;

   DetectProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            Threshold         <= to_sfixed(5000, Threshold); -- set initial RunningTotal to typical at highest signal levels
            MagDelay          <= (others=>(others=>'0'));
            PilotMag          <= (others=>'0');
            PilotFound        <= '0';
            PilotPulse1x      <= '0';
            ValidAbsDly       <= '0';
            SkipPacket        <= "00";
 --           PacketOffset      <= 0;
            BadPilot          <= 0;
            if (SIM_MODE) then
               GoodPilot         <= 3;
               IgnoreInitial     <= 25;
            else
               GoodPilot         <= 0;
               IgnoreInitial     <= 0;
            end if;
            CurrentPeak       <= (others=>'0');
            Peak1             <= (others=>'0');
            Peak2             <= (0=>'1', others=>'0');
            PilotIndex        <= (others=>'0');
         elsif (ce) then
            PilotMag     <= Max;          -- Latch clock transfers
            PilotPulse1x <= PilotPulse;
            if (PilotPulse1x) then
               PilotIndex  <= to_ufixed(MaxIndex, PilotIndex);
               if (IgnoreInitial < 25) then
                  IgnoreInitial <= IgnoreInitial + 1; -- let first frame accumulate to set threshold
               else
                  CalcThreshold  <= '1';
                  PeakPointer    <= 1;          -- no need to check PilotMag(0) since Peak1 is set to PilotMag also
                  Peak1          <= PilotMag;   -- Assume first is largest
                  Peak2          <= (others=>'0');
                  CurrentPeak    <= (others=>'0');
               end if;
               if (PilotMag > Threshold) then
                  BadPilot <= 0;
                  if (GoodPilot < 2) then
                     GoodPilot <= GoodPilot + 1;   -- 3 good frames in a row = found
                  else
                     PilotFound <= '1';
                     GoodPilot <= 3;
                     StartOut <= SkipPacket ?= "00";  -- prevents double starts
                     -- force bulk of pilot within one packet
   --                     if ((PilotIndex > 384 + HYSTERESIS) or (PilotIndex < 128 - HYSTERESIS)) and (SkipPacket = "00") then
   --                        PacketOffset  <= to_integer(PilotIndex);
   --                        SkipPacket        <= "11";
   --                     elsif ((PilotIndex > 384 - HYSTERESIS) or (PilotIndex < 128 + HYSTERESIS)) and (SkipPacket = "00") then
   --                        PacketOffset <= to_integer(PilotIndex);
   --                     end if;
                    SkipPacket       <= "11";
                  end if;
               else
                  if (BadPilot <= 127) then    -- 128 bad packets in a row = lost
                     BadPilot <= BadPilot + 1;
                  else
                     GoodPilot <= 0;
                     PilotFound <= '0';
                  end if;
               end if;
               MagDelay   <= MagDelay(26 downto 0) & PilotMag; -- only use last 26, but pipelining wants array of 27
            else
               StartOut <= '0';
            end if;

            if (ValidAbs and not ValidAbsDly) then -- skip end of this and all of next packet
               SkipPacket <= SkipPacket(0) & '0';
            end if;
            ValidAbsDly  <= ValidAbs;

            if (CalcThreshold) then          -- Place threshold in center of two highest peaks
               CurrentPeak <= MagDelay(PeakPointer);
               if (PeakPointer <= PacketsPerFrame) then
                  if (CurrentPeak > Peak1) then
                     Peak1 <= CurrentPeak;   -- Found new peak, store previous in peak2
                     Peak2 <= Peak1;
                  elsif (CurrentPeak > Peak2) then
                     Peak2 <= CurrentPeak;
                  end if;
                  PeakPointer <= PeakPointer + 1;
               else
                  Threshold <= resize((Peak1 + Peak2) / 2, Threshold);
                  CalcThreshold <= '0';
                  CurrentPeak <= (others=>'0');
               end if;
            end if;
         end if;
      end if;
   end process DetectProcess;
*/
end rtl;
