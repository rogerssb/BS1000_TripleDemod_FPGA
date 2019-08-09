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
         SpectrumInv,
         ValidIn        : IN  std_logic;
         ReIn,
         ImIn           : IN  FLOAT_1_18;
         PilotIndex     : OUT ufixed(10 downto 0);
         ReOut,
         ImOut          : OUT FLOAT_1_18;
         Magnitude0,
         Magnitude1,
         PhaseOut0,
         PhaseOut1,
         Mag0Peak,
         Mag1Peak,
         Phs0Peak,
         Phs1Peak       : OUT SLV18;
         PilotFound,
         PilotTime,
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
         H0CntrR,
         H0CntrI,
         H1CntrR,
         H1CntrI         : OUT Float_256_LP
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
      IN_LEFT     : integer := 8;
      IN_RIGHT    : integer := -9;
      OUT_LEFT    : integer := 14;
      OUT_BINPT  : integer := -3
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
         ImIn           : IN  sfixed(IN_WIDTH+IN_BINPT-1 downto IN_BINPT);
         ValidIn,
         StartIn        : IN  std_logic;     -- Start is just delayed in sync
         ReOut,
         ImOut          : OUT sfixed(IN_WIDTH+IN_BINPT downto IN_BINPT);
         AbsOut         : OUT ufixed(OUT_WIDTH+OUT_BINPT-1 downto OUT_BINPT);
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

   COMPONENT vm_cordic_fast IS
      GENERIC (
         n  : positive := 14
      );
      PORT (
         clk,
         ena      : IN  std_logic;
         x,
         y        : IN  std_logic_vector(n-1 downto 0);
         m        : OUT std_logic_vector(n downto 2);
         p        : OUT std_logic_vector(n-2 downto 1);
         enOut    : OUT std_logic
      );
   END COMPONENT vm_cordic_fast;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------
   CONSTANT FFT_TOP_R      : natural := 26; -- Pick useful FFT bits
   CONSTANT FFT_BOT_R      : natural := FFT_TOP_R - 17;
   CONSTANT FFT_TOP_I      : natural := FFT_TOP_R + 32;
   CONSTANT FFT_BOT_I      : natural := FFT_TOP_I - 17;
   CONSTANT IFFT_TOP_R     : natural := 22; -- Pick useful iFFT bits, was 19 but overflowed at gain ~= 60000
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
   CONSTANT PACKETS_PER_FRAME : positive  := 26;

   SIGNAL   AbsZero           : ufixed(6 downto -11);
   type     MAG_ARRAY  is array (natural range <>) of ufixed(AbsZero'range);

   SIGNAL   ConfigTValid,
            ConfigDone,
            OverflowFft,
            OverflowIFft,
            StartIFft,
            ValidInDly,
            ValidAbsDly,
            ValidPack,
            ValidFft,
            ValidFftDly,
            ValidMult0,
            ValidMult1,
            ValidIFftOut,
            ValidAbs,
            ValidOverAdd,
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
            ValidCordic,
            CalcThreshold     : std_logic := '0';
   SIGNAL   ReInDly,
            ImInDly           : FLOAT_1_18;
   SIGNAL   XC_Zero,
            XC0CntrR,              -- 0Hz version of H0's
            XC0CntrI,
            XC1CntrR,              -- 0Hz version of H1's
            XC1CntrI          : sfixed(14 downto -3);
   SIGNAL   iFftZero,
            iFftCntr0R,
            iFftCntr1R,
            iFftCntr0I,
            iFftCntr1I        : sfixed(4 downto -13);
   SIGNAL   OverAddR0,
            OverAddI0,
            OverAddR1,
            OverAddI1         : sfixed(5 downto -13);
   SIGNAL   Mag0,
            Mag1,
            Mag0PeakFind,
            Mag1PeakFind,
            Mag0ArrayFind,
            Mag1ArrayFind     : std_logic_vector(OverAddR0'length-2 downto 0);
   SIGNAL   Phase0,
            Phase1,
            Phs0PeakFind,
            Phs1PeakFind,
            Phs0ArrayFind,
            Phs1ArrayFind     : std_logic_vector(OverAddR0'length - 3 downto 0);
   SIGNAL   MagPeakArray0,
            MagPeakArray1     : vector_of_slvs(25 downto 0)(Mag0'left downto 0) := (others=>(others=>'0'));
   SIGNAL   PhsPeakArray0,
            PhsPeakArray1     : vector_of_slvs(25 downto 0)(Phase0'left downto 0) := (others=>(others=>'0'));
   SIGNAL   PilotMag,
            PreviousMag,
            Threshold,
            AbsCntr0,
            AbsCntr1,
            MaxCntr,
            Max,
            CurrentPeak,
            Peak1,
            Peak2             : ufixed(AbsZero'range);
   SIGNAL   MagDelay          : MAG_ARRAY(27 downto 0);
   SIGNAL   PackR,
            PackI             : float_1_18 := float_zero_1_18;
   SIGNAL   FftR,
            FftI,
            H0CntrR,
            H0CntrI,
            H1CntrR,
            H1CntrI           : FLOAT_256_LP;
   SIGNAL   Count,
            Index0,
            Index1,
            IndexMag,
            MaxIndex          : natural range 0 to 1023;
   SIGNAL   MultTLast         : std_logic_vector(5 downto 0);
   SIGNAL   tdata1,
            tdata2            : std_logic_vector(47 downto 0) := (others => '0');
   SIGNAL   FftOutSlv,
            iFftCntr0Slv,
            iFftCntr1Slv      : std_logic_vector(63 downto 0); -- fixed by FFT
   SIGNAL   iFftReady         : std_logic_vector(1 downto 0);
   SIGNAL   Resets1X,
            ConfigTReady      : std_logic_vector(2 downto 0);
   SIGNAL   GoodPilot         : integer range 0 to 3;
   SIGNAL   BadPilot,
            IgnoreInitial     : integer range 0 to 128;
   SIGNAL   PeakPointer       : natural range 0 to 27;
   SIGNAL   SampleCount       : natural range 0 to 163830;
   CONSTANT PHS_ZEROS_FILL    : std_logic_vector(17-Phase0'length downto 0) := (others=>'0');
-- ILAs
    SIGNAL  PilotMag_Ila,
            Threshold_Ila,
            Peak1_Ila,
            Peak2_Ila,
            AbsCntr0_Ila,
            AbsCntr1_Ila,
            Resets2X          : SLV18;

   attribute mark_debug : string;
   attribute mark_debug of PilotMag_Ila, PilotFound, Threshold_Ila, Peak1_Ila, Peak2_Ila,
             PilotIndex, OverflowFft, OverflowIFft, AbsCntr0_Ila, AbsCntr1_Ila,
             Magnitude0, Magnitude1, PhaseOut0, PhaseOut1, Mag0Peak, Mag1Peak,
             Phs0Peak, Phs1Peak : signal is "true";
begin

   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         PilotMag_Ila   <= to_slv(PilotMag);
         Peak1_Ila      <= to_slv(Peak1);
         Peak2_Ila      <= to_slv(Peak2);
         Threshold_Ila  <= to_slv(Threshold);
      end if;
   end process IlaProcess;

   Ila2xProcess : process(clk2X)
   begin
      if (rising_edge(clk2X)) then
         Resets2X       <= (others=>Reset);
         AbsCntr0_Ila   <= to_slv(AbsCntr0);
         AbsCntr1_Ila   <= to_slv(AbsCntr1);
      end if;
   end process Ila2XProcess;


   LatchInputs : process(clk)
   begin
      if (rising_edge(clk)) then
         Resets1X <= (others=>Reset);
         if (Resets1X(0)) then
            ReInDly        <= (others=>'0');
            ImInDly        <= (others=>'0');
            ValidInDly     <= '0';
         elsif (ce) then
            if (ValidIn) then
               ReInDly <= ReIn;
               if (SpectrumInv) then
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
         if (Resets2X(0)) then
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
         reset             => Resets1X(1),
         reset2x           => Resets2X(1),
         ce                => ce,
         ReadyIn           => FftReady,
         ValidIn           => ValidInDly,
         ReIn              => ReInDly,
         ImIn              => ImInDly,
         ReOut2x           => PackR,
         ImOut2x           => PackI,
         Start2x           => open,
         ValidOut2x        => ValidPack,
         LastOut2x         => FftTLastIn,
         ReOut1x           => ReOut,
         ImOut1x           => ImOut,
         Start1x           => open,
         ValidOut1x        => ValidOut,
         LastOut1x         => open
      );

   Fft_u : fft_1k
    port map (
      aclk                        => Clk2x,
      aresetn                     => not Resets2X(2),
      aclken                      => ce,
      s_axis_config_tvalid        => '0', -- not needed and prone to error, was ConfigTValid,
      s_axis_config_tready        => ConfigTReady(0),
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
         if (Resets2X(3)) then
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
            MultTLast      <= MultTLast(4 downto 0) & CountEq1023;
            StartIFft      <= CountEq1023;
         end if;
      end if;
   end process FftProcess;

   Templates : PilotTemplates
      PORT MAP(
         clk      => Clk2x,
         reset    => Resets2X(4),
         ce       => ce,
         Count    => Count,
         H0CntrR  => H0CntrR,
         H0CntrI  => H0CntrI,
         H1CntrR  => H1CntrR,
         H1CntrI  => H1CntrI
      );

   -- Complex multiply FFT output by H0's FFT
   H0Cntr_x_Fft : CmplxMult
      GENERIC MAP (
         IN_LEFT     => FftR'left,
         IN_RIGHT    => FftI'right,
         OUT_LEFT    => XC_Zero'left,
         OUT_BINPT   => XC_Zero'right
      )
      PORT MAP(
         clk         => Clk2x,
         ce          => ce,
         reset       => Resets2X(5),
         ReadyIn     => iFftReady(0),
         ReInA       => H0CntrR,
         ImInA       => H0CntrI,
         ReInB       => FftR,
         ImInB       => FftI,
         ValidIn     => ValidFftDly,
         StartIn     => StartIFft,
         ReOut       => XC0CntrR,
         ImOut       => XC0CntrI,
         ValidOut    => ValidMult0,
         StartOut    => open
      );

   iFftCntr0_u : fft_1k
    port map (
      aclk                        => Clk2x,
      aresetn                     => not Resets2X(6),
      aclken                      => ce,
      s_axis_config_tvalid        => ConfigTValid,
      s_axis_config_tready        => ConfigTReady(1),
      s_axis_config_tdata         => IFFT_CODE,
      s_axis_data_tvalid          => ValidMult0,
      s_axis_data_tready          => iFftReady(0),
      s_axis_data_tdata           => 6x"00" & to_slv(XC0CntrI) & 6x"00" & to_slv(XC0CntrR),
      s_axis_data_tlast           => MultTLast(5),
      m_axis_data_tvalid          => ValidIFftOut,
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
         if (Resets2X(7)) then
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
         end if;
      end if;
   end process;

   H1Cntr_x_Fft : CmplxMult
      GENERIC MAP (
         IN_LEFT     => FftR'left,
         IN_RIGHT    => FftI'right,
         OUT_LEFT    => XC_Zero'left,
         OUT_BINPT   => XC_Zero'right
      )
      PORT MAP(
         clk         => Clk2x,
         ce          => ce,
         reset       => Resets2X(8),
         ReadyIn     => iFftReady(1),
         ReInA       => H1CntrR,
         ImInA       => H1CntrI,
         ReInB       => FftR,
         ImInB       => FftI,
         ValidIn     => ValidFftDly,
         StartIn     => StartIFft,
         ReOut       => XC1CntrR,
         ImOut       => XC1CntrI,
         ValidOut    => ValidMult1,
         StartOut    => open
      );

   iFftCntr1_u : fft_1k
    port map (
      aclk                        => Clk2x,
      aresetn                     => not Resets2X(9),
      aclken                      => ce,
      s_axis_config_tvalid        => ConfigTValid,
      s_axis_config_tready        => ConfigTReady(2),
      s_axis_config_tdata         => IFFT_CODE,
      s_axis_data_tvalid          => ValidMult1,
      s_axis_data_tready          => iFftReady(1),
      s_axis_data_tdata           => 6x"00" & to_slv(XC1CntrI) & 6x"00" & to_slv(XC1CntrR),
      s_axis_data_tlast           => MultTLast(5),
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
         clk    => Clk2x,      reset    => Resets2X(10),    ce       => ce,
         ReIn   => iFftCntr0R, ImIn     => iFftCntr0I, ValidIn  => ValidIFftOut,
         ReOut  => OverAddR0,  ImOut    => OverAddI0,
         AbsOut => AbsCntr0,   ValidOut => ValidAbs,   StartIn  => '0', StartOut => open);

   Cntr1Abs : OverlapAddAbs
      GENERIC MAP(IN_WIDTH  => iFftZero'length, IN_BINPT  => iFftZero'right,
                  OUT_WIDTH => AbsZero'length,  OUT_BINPT => AbsZero'right )
      PORT MAP(
         clk    => Clk2x,      reset    => Resets2X(11),    ce       => ce,
         ReIn   => iFftCntr1R, ImIn     => iFftCntr1I, ValidIn  => ValidIFftOut,
         ReOut  => OverAddR1,  ImOut    => OverAddI1,
         AbsOut => AbsCntr1,   ValidOut => open,       StartIn  => '0', StartOut => open);

   cordic0 : vm_cordic_fast
      GENERIC MAP (
         n => OverAddR0'length
      )
      PORT MAP (
         clk   => Clk2x,
         ena   => ValidOverAdd,
         x     => to_slv(OverAddR0),
         y     => to_slv(OverAddI0),
         m     => Mag0,          -- m[n:2]
         p     => Phase0,
         enOut => ValidCordic
      );

   cordic1 : vm_cordic_fast
      GENERIC MAP (
         n => OverAddR1'length
      )
      PORT MAP (
         clk   => Clk2x,
         ena   => ValidOverAdd,
         x     => to_slv(OverAddR1),
         y     => to_slv(OverAddI1),
         m     => Mag1,
         p     => Phase1,
         enOut => open
      );

   Magnitude0 <= Mag0 when ((ValidCordic = '1') and (IndexMag < 512)) else (others=>'0');
   Magnitude1 <= Mag1 when ((ValidCordic = '1') and (IndexMag < 512)) else (others=>'0');
   PhaseOut0  <= Phase0 & PHS_ZEROS_FILL;
   PhaseOut1  <= Phase1 & PHS_ZEROS_FILL;

   MaxPeakProc : process(Clk2x)  -- find peak of this burst for H0 and H1
   begin
      if (rising_edge(Clk2x)) then
         ValidOverAdd <= ValidAbs;  -- delay ValidAbs to realign OverAdd sum outputs
         if (Resets2X(12) or not ValidCordic) then
            IndexMag <= 0;
         elsif (IndexMag < 1023) then
            IndexMag <= IndexMag + 1;
         end if;

         if (Resets2X(12) or not ValidCordic) then
            Mag0PeakFind   <= (others=>'0');
            Mag1PeakFind   <= (others=>'0');
            Phs0PeakFind   <= (others=>'0');
            Phs1PeakFind   <= (others=>'0');
         elsif (IndexMag = 512) then  -- last one
            MagPeakArray0 <= MagPeakArray0(24 downto 0) & Mag0PeakFind;
            PhsPeakArray0 <= PhsPeakArray0(24 downto 0) & Phs0PeakFind;
            MagPeakArray1 <= MagPeakArray1(24 downto 0) & Mag1PeakFind;
            PhsPeakArray1 <= PhsPeakArray1(24 downto 0) & Phs1PeakFind;
         elsif (IndexMag < 512) then
            if (Mag0 > Mag0PeakFind) then
               Mag0PeakFind   <= Mag0;
               Phs0PeakFind <= Phase0;    -- capture phase of current magnitude
            end if;
            if (Mag1 > Mag1PeakFind) then
               Mag1PeakFind   <= Mag1;
               Phs1PeakFind <= Phase1;
            end if;
         end if;

         if (Resets2X(12) or not ValidCordic) then
            Mag0ArrayFind <= (others=>'0');
            Mag1ArrayFind <= (others=>'0');
            Phs0ArrayFind <= (others=>'0');
            Phs1ArrayFind <= (others=>'0');
         elsif (IndexMag >= 514) and (IndexMag < 514 + 26) then
            if (MagPeakArray0(IndexMag - 514) > Mag0ArrayFind) then
               Mag0ArrayFind <= MagPeakArray0(IndexMag - 514);
               Phs0ArrayFind <= PhsPeakArray0(IndexMag - 514);
            end if;
            if (MagPeakArray1(IndexMag - 514) > Mag1ArrayFind) then
               Mag1ArrayFind <= MagPeakArray1(IndexMag - 514);
               Phs1ArrayFind <= PhsPeakArray1(IndexMag - 514);
            end if;
         elsif(IndexMag = 514 + 26) then
            Mag0Peak <= Mag0ArrayFind;
            Mag1Peak <= Mag1ArrayFind;
            Phs0Peak <= Phs0ArrayFind & '0';
            Phs1Peak <= Phs1ArrayFind & '0';
         end if;
      end if;
   end process;


   -- Now find peak of H0/1
   MaxProcess : process(Clk2x)
   begin
      if (rising_edge(Clk2x)) then
         if (Resets2X(12)) then
            MaxIndex     <= 0;
            Index0       <= 0;
            Index1       <= 0;
            PilotPulse   <= '0';
            Max          <= (others=>'0');
            MaxCntr      <= (others=>'0');
         elsif (ce) then
            Index1   <= Index0;
            if (ValidAbs) then
               if (AbsCntr0 > AbsCntr1) then
                  MaxCntr <= AbsCntr0;
               else
                  MaxCntr <= AbsCntr1;
               end if;
               if ((MaxCntr > Max) and (Index1 < 512)) then
                  Max      <= MaxCntr;
                  MaxIndex <= Index1;
               end if;
            else
               MaxCntr  <= (others=>'0');
               Max      <= (others=>'0');
            end if;
            if (ValidAbs) then
               if (Index1 = 513) then     -- give Max a chance to propagate to PilotMag
                  PilotPulse  <= '1';
               elsif (PilotPulse1X) then  -- send wider pulse to threshold logic at lower clock
                  PilotPulse  <= '0';
               end if;
               if (Index0 < 1023) then
                  Index0 <= Index0 + 1;
               end if;
            else
               Index0      <= 0;
            end if;
         end if;
      end if;
   end process MaxProcess;

   DetectProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (Resets1X(2)) then
            Threshold         <= to_ufixed(2.0, Threshold); -- set initial RunningTotal to typical at highest signal levels
            MagDelay          <= (others=>(others=>'0'));
            PilotMag          <= (others=>'0');
            PreviousMag       <= (others=>'0');
            PilotFound        <= '0';
            PilotPulse1x      <= '0';
            ValidAbsDly       <= '0';
            CalcThreshold     <= '0';
            StartOut          <= '0';
            PilotTime         <= '0';
            PeakPointer       <= 1;
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
            PilotTime    <= PilotPulse1x; -- to line up with StartOut
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
                     StartOut <= '1' when (PilotMag > PreviousMag) else '0';  -- prevents double starts if bell curve is falling
                  end if;
               else
                  if (BadPilot <= 127) then    -- 128 bad packets in a row = lost. Should get 25 data packets
                     BadPilot <= BadPilot + 1;
                  else
                     GoodPilot <= 0;
                     PilotFound <= '0';
                  end if;
               end if;
               MagDelay   <= MagDelay(26 downto 0) & PilotMag; -- only use last 26, but pipelining wants array of 27
               PreviousMag <= PilotMag;
            else
               StartOut <= '0';
            end if;

            ValidAbsDly  <= ValidAbs;

            if (CalcThreshold) then          -- Place threshold in center of two highest peaks
               CurrentPeak <= MagDelay(PeakPointer);
               if (PeakPointer <= PACKETS_PER_FRAME) then
                  if (CurrentPeak > Peak1) then
                     Peak1 <= CurrentPeak;   -- Found new peak, store previous in peak2
                     if (Peak1 > CurrentPeak / 2) then
                        Peak2 <= resize(Peak1 / 2, Peak2);     -- if peak spans two packets, then both values would be similar and distort threshold
                     else
                        Peak2 <= Peak1;
                     end if;
                  elsif (CurrentPeak > Peak2) then
                      if (Peak1 < CurrentPeak * 2) then
                        Peak2 <= resize(CurrentPeak / 2, Peak2);     -- if peak spans two packets, then both values would be similar and distort threshold
                     else
                        Peak2 <= CurrentPeak;
                     end if;
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

end rtl;
