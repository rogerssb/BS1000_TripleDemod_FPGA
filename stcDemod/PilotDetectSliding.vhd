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

      Module Name: PilotDetectSliding.vhd

      Description: Pack the data into 512 sample packets then do an FFT. Multiply
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
   9/17/16 Initial release FZ

   Removed CorrPend, calc CorrPntr from PackCntr and PendIndex instead. Was redundant
-----------------------------------------------------------------------------*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity PilotDetectSliding is
   GENERIC
      (SIM_MODE : boolean := false
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
         SearchRange    : IN  SLV4;
         CorrPntr,                                 -- Packet buffer pointer
         RawAddr        : OUT ufixed(15 downto 0);
         ReOut,
         ImOut          : OUT FLOAT_1_18;          -- Packetized output
         Magnitude0,
         Magnitude1,
         PhaseOut0,
         PhaseOut1,                                -- Streaming Mag/Phs of iFFT
         MagPeak0,
         PhsPeak0,
         MagPeak1,
         PhsPeak1       : OUT SLV18;               -- Peak Mag/Phs of iFFT
         PilotOffset    : OUT SFixed(8 downto 0);  -- Bit Sync Loop Error
         PilotFound,
         ValidOut,                                 -- ReOut/ImOut valid
         StartOut       : OUT std_logic
      );
end PilotDetectSliding;

architecture rtl of PilotDetectSliding is

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
         ImOut          : OUT sfixed(IN_WIDTH+IN_BINPT downto IN_BINPT+1);
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
         ReIn,
         ImIn              : IN  sfixed(DATA_WIDTH-BINPT-1 downto -BINPT);
         ReOut2x,
         ImOut2x           : OUT sfixed(DATA_WIDTH-BINPT-1 downto -BINPT);
         RawAddr           : OUT ufixed(15 downto 0);
         Start2x,
         ValidData2x,
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
   CONSTANT PACKETS_PER_FRAME : positive  := 26;
   CONSTANT PHS_LATENCY    : natural := 15;
   CONSTANT START_MAX      : natural := 27;
--   CONSTANT SEARCH_RANGE   : natural := 3;   -- ±3 is range of m_ndx

   SIGNAL   AbsZero           : ufixed(6 downto -11);
   type     MAG_ARRAY  is array (natural range <>) of ufixed(AbsZero'range);

   SIGNAL   ConfigTValid,
            ConfigDone,
            OverflowFft,
            OverflowIFft,
            StartIFft,
            ValidInDly,
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
            PilotFoundPend,
            PeakPend,
            PhsCntStrt0,
            PhsCntStrt1,
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
            OverAddI1         : sfixed(5 downto -12);
   SIGNAL   Mag0,
            Mag1              : std_logic_vector(12 downto 0);
   SIGNAL   Phase0,
            Phase1            : std_logic_vector(11 downto 0);
   SIGNAL   PilotMag,
            Threshold,
            AbsCntr0,
            AbsCntr1,
            MaxCntr,
            MaxCntr0,
            MaxCntr1,
            MaxOfPckt,
            AbsPeak,
            AbsPeak0,
            AbsPeak1,
            CurrentMag0,
            MagPeak0_u,
            PhsPeak0_u,
            MagPeak1_u,
            PhsPeak1_u,
            CurrentMag1,
            CurrentPhs0,
            CurrentPhs1,
            CurrentPeak,
            Peak1,
            Peak2             : ufixed(AbsZero'range);
   SIGNAL   MagDelay,
            MagDelay0,
            MagDelay1,
            PhsDelay0,
            PhsDelay1         : MAG_ARRAY(28 downto 0);
   SIGNAL   PackR,
            PackI             : float_1_18 := float_zero_1_18;
   SIGNAL   FftR,
            FftI,
            H0CntrR,
            H0CntrI,
            H1CntrR,
            H1CntrI           : FLOAT_256_LP;
   SIGNAL   MagPeakInt0,
            PhsPeakInt0,
            MagPeakInt1,
            PhsPeakInt1       : SLV18;
   SIGNAL   Count,
            AbsIndex,
            PrevIndex,
            PendIndex,
            Index0,
            Index1            : natural range 0 to 1023;
   SIGNAL   PackCntr          : ufixed(6 downto 0);  -- upper 7 bits of 16 bit address to ram buffer
   SIGNAL   DelayData         : std_logic_vector(2*PackR'length downto 0);
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
   SIGNAL   PeakPointer,
            PhsCount0,
            PhsCount1,
            MaxCount          : natural range 0 to 28;
   SIGNAL   SampleCount       : natural range 0 to 16383;
   SIGNAL   DropCount         : natural range 0 to 7;

-- ILAs
    SIGNAL  PilotMag_Ila,
            Peak1_Ila,
            Peak2_Ila,
            AbsCntr0_Ila,
            AbsCntr1_Ila      : SLV18;

   attribute mark_debug : string;
   attribute mark_debug of PilotMag_Ila, PilotFound, Peak1_Ila, Peak2_Ila, BadPilot,
             AbsCntr0_Ila, AbsCntr1_Ila, AbsIndex, PrevIndex : signal is "true";
begin

   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         PilotMag_Ila   <= to_slv(PilotMag);
         Peak1_Ila      <= to_slv(Peak1);
         Peak2_Ila      <= to_slv(Peak2);
      end if;
   end process IlaProcess;

   Ila2xProcess : process(clk2X)
   begin
      if (rising_edge(clk2X)) then
         AbsCntr0_Ila   <= to_slv(AbsCntr0);
         AbsCntr1_Ila   <= to_slv(AbsCntr1);
      end if;
   end process Ila2XProcess;


   LatchInputs : process(clk)
   begin
      if (rising_edge(clk)) then
         if (Reset) then
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
         if (Reset2x) then
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
         reset             => Reset,
         reset2x           => Reset2X,
         ce                => ce,
         ReadyIn           => FftReady,
         ValidIn           => ValidInDly,
         ReIn              => ReInDly,
         ImIn              => ImInDly,
         RawAddr           => RawAddr,
         ReOut2x           => PackR,
         ImOut2x           => PackI,
         Start2x           => open,
         ValidOut2x        => ValidPack,
         ValidData2x       => ValidOut,
         LastOut2x         => FftTLastIn
     );

   ReOut    <= PackR;
   ImOut    <= PackI;

   Fft_u : fft_1k
    port map (
      aclk                        => Clk2x,
      aresetn                     => not Reset2X,
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
         if (Reset2X) then
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
         reset    => Reset2X,
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
         reset       => Reset2X,
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
      aresetn                     => not Reset2X,
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
         if (Reset2X) then
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
         reset       => Reset2X,
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
      aresetn                     => not Reset2X,
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
         clk    => Clk2x,      reset    => Reset2X,    ce       => ce,
         ReIn   => iFftCntr0R, ImIn     => iFftCntr0I, ValidIn  => ValidIFftOut,
         ReOut  => OverAddR0,  ImOut    => OverAddI0,
         AbsOut => AbsCntr0,   ValidOut => ValidAbs,   StartIn  => '0', StartOut => open);

   Cntr1Abs : OverlapAddAbs
      GENERIC MAP(IN_WIDTH  => iFftZero'length, IN_BINPT  => iFftZero'right,
                  OUT_WIDTH => AbsZero'length,  OUT_BINPT => AbsZero'right )
      PORT MAP(
         clk    => Clk2x,      reset    => Reset2X,    ce       => ce,
         ReIn   => iFftCntr1R, ImIn     => iFftCntr1I, ValidIn  => ValidIFftOut,
         ReOut  => OverAddR1,  ImOut    => OverAddI1,
         AbsOut => AbsCntr1,   ValidOut => open,       StartIn  => '0', StartOut => open);

   cordic0 : vm_cordic_fast
      GENERIC MAP (
         n => 14
      )
      PORT MAP (
         clk   => Clk2x,
         ena   => ValidAbs,
         x     => to_slv(OverAddR0(1 downto -12)),
         y     => to_slv(OverAddI0(1 downto -12)),
         m     => Mag0,          -- m[n:2]
         p     => Phase0,        -- p[n:3]
         enOut => ValidCordic
      );

   cordic1 : vm_cordic_fast
      GENERIC MAP (
         n => 14
      )
      PORT MAP (
         clk   => Clk2x,
         ena   => ValidAbs,
         x     => to_slv(OverAddR1(1 downto -12)),
         y     => to_slv(OverAddI1(1 downto -12)),
         m     => Mag1,
         p     => Phase1,
         enOut => open
      );

   Magnitude0 <= Mag0 & "00000" when ((ValidCordic = '1') and (Index1 <= 512)) else (others=>'0');
   Magnitude1 <= Mag1 & "00000" when ((ValidCordic = '1') and (Index1 <= 512)) else (others=>'0');
   PhaseOut0  <= Phase0 & "000000";
   PhaseOut1  <= Phase1 & "000000";


   -- Now find peak of H0/1
   MaxProcess : process(Clk2x)
      variable Index1_s,
               PrevIndex_s    : signed(9 downto 0);
      variable Index1_u,
               PrevIndex_u    : unsigned(8 downto 0);
      variable Diff_s         : signed(9 downto 0);
      variable AbsDiff_s      : signed(9 downto 0);
   begin
      if (rising_edge(Clk2x)) then
         if (Reset2X) then
            Index0       <= 0;
            Index1       <= 0;
            PrevIndex    <= 256;
            MaxCount     <= 0;
            PhsCount0    <= 0;
            PhsCount1    <= 0;
            DropCount    <= 7;
            PilotPulse   <= '0';
            PilotOffset  <= (others=>'0');
            MagPeakInt0  <= (others=>'0');
            PhsPeakInt0  <= (others=>'0');
            MagPeakInt1  <= (others=>'0');
            PhsPeakInt1  <= (others=>'0');
            AbsPeak      <= (others=>'0');
            AbsPeak0     <= (others=>'0');
            AbsPeak1     <= (others=>'0');
            MaxOfPckt    <= (others=>'0');
            MaxCntr      <= (others=>'0');
            MaxCntr0     <= (others=>'0');
            MaxCntr1     <= (others=>'0');
            PackCntr     <= (others=>'0');   -- PackCntr must be reset released with WrAddr in PilotSync
            CorrPntr     <= (others=>'0');
            StartOut     <= '0';
         elsif (ce) then
            ValidOverAdd <= ValidAbs;  -- delay ValidAbs to realign OverAdd sum outputs
            Index1   <= Index0;
            Index1_u    := to_unsigned(Index1, Index1_u);   -- these are to convert 0 to 511 to ±255
            Index1_s    := signed('0' & Index1_u);
            PrevIndex_u := to_unsigned(PrevIndex, Index1_u);
            PrevIndex_s := signed('0' & PrevIndex_u);
            Diff_s         := Index1_s - PrevIndex_s;
            AbsDiff_s      := abs(Diff_s);
            if (ValidAbs) then
               if (AbsCntr0 > AbsCntr1) then
                  MaxCntr  <= AbsCntr0;
               else
                  MaxCntr  <= AbsCntr1;
               end if;
               MaxCntr0 <= AbsCntr0;   -- just delayed to keep timing happy
               MaxCntr1 <= AbsCntr1;

               -- Find the peak of this packet regardless of H0 or H1
               if (Index1 < 512) then     -- only search first half of the ifft
                  if (MaxCntr > AbsPeak) and (MaxCntr > Threshold) then
                     AbsPeak     <= MaxCntr;
                     AbsIndex    <= Index1;
                     PeakPend    <= '1';
                     if ((AbsDiff_s <= signed('0' & SearchRange)) or (PilotFound = '0')) then
                        MaxCount    <= START_MAX;
                        PendIndex   <= Index1;
                        DropCount   <= 0;
                     elsif (MaxCount = 0) then  -- if peak is found but out of search range at end of packet, increment DropCount. If < 7, slide toward new index, else take index
                        if (DropCount < 7) then
                           DropCount <= DropCount + 1;
                           if (Index1 > PrevIndex) then
                              PendIndex <= PrevIndex + 1;
                           else
                              PendIndex <= PrevIndex - 1;
                           end if;
                        else
                           PendIndex <= Index1;
                        end if;
                     end if;
                  elsif (MaxCount > 0) then     -- past peak, start counting down
                     MaxCount <= MaxCount - 1;
                  end if;

                  if (MaxCntr > MaxOfPckt) then
                     MaxOfPckt <= MaxCntr;
                  end if;

               elsif (Index1 = 525) then     -- setup for next frame
                  PackCntr <= resize(PackCntr + 1, PackCntr);
                  if (PeakPend) then
                     StartOut  <= '1';
                     PrevIndex <= PendIndex;
                     CorrPntr  <= PackCntr & to_ufixed(PendIndex, 8, 0);
                     PeakPend  <= '0';
                  end if;
                  if (MaxCount = 0) then    -- maintain the current peak across packets
                     AbsPeak <= (others=>'0');  -- setup for next frame if not carrying over from previous
                  end if;
                  MaxOfPckt <= (others=>'0');
               end if;

               -- Find the peak of H0 only
               if (Index1 = 525) then     -- setup for next frame
                  AbsPeak0    <= (others=>'0');
                  MagDelay0   <= MagDelay0(27 downto 0) & ufixed(MagPeakInt0); -- only use last 26, but PeakPointer goes to 28
                  PhsDelay0   <= PhsDelay0(27 downto 0) & ufixed(PhsPeakInt0);
               elsif (Index1 < 512) then     -- only search first half of the ifft
                  if (MaxCntr0 > AbsPeak0) then
                     AbsPeak0     <= MaxCntr0;
                     PhsCntStrt0  <= '1';
                  else
                     PhsCntStrt0  <= '0';
                  end if;
               else
                  PhsCntStrt0 <= '0';
               end if;

               -- Find the peak of H1 only
               if (Index1 = 525) then     -- setup for next frame
                  AbsPeak1    <= (others=>'0');
                  MagDelay1   <= MagDelay1(27 downto 0) & ufixed(MagPeakInt1); -- only use last 26, but PeakPointer goes to 28
                  PhsDelay1   <= PhsDelay1(27 downto 0) & ufixed(PhsPeakInt1);
               elsif (Index1 < 512) then     -- only search first half of the ifft
                  if (MaxCntr1 > AbsPeak1) then
                     AbsPeak1     <= MaxCntr1;
                     PhsCntStrt1  <= '1';
                  else
                     PhsCntStrt1  <= '0';
                  end if;
               else
                  PhsCntStrt1 <= '0';
               end if;

               if (PhsCntStrt0) then
                  PhsCount0 <= PHS_LATENCY - 2;  -- it took a clock to set PhsCntStrt and determine MaxCntr from AbsCntrs
               elsif (PhsCount0 > 0) then     -- cordic is not ValidIn dependent, just straight latency
                  PhsCount0 <= PhsCount0 - 1;
                  if (PhsCount0 = 1) then
                     PhsPeakInt0 <= Phase0 & "000000";    -- capture phase of current max magnitude
                     MagPeakInt0 <= Mag0 & "00000";
                  end if;                       -- once calculated
               end if;

               if (PhsCntStrt1) then
                  PhsCount1 <= PHS_LATENCY - 2;  -- it took a clock to set PhsCntStrt and determine MaxCntr from AbsCntrs
               elsif (PhsCount1 > 0) then     -- cordic is not ValidIn dependent, just straight latency
                  PhsCount1 <= PhsCount1 - 1;
                  if (PhsCount1 = 1) then
                     PhsPeakInt1 <= Phase1 & "000000";    -- capture phase of current max magnitude
                     MagPeakInt1 <= Mag1 & "00000";
                  end if;
               end if;

               PilotOffset <= to_sfixed(PrevIndex - 256, PilotOffset);  -- set bit sync error to BS Loop

               if (Index1 = 523) then     -- give MaxOfPckt a chance to propagate to PilotMag
                  PilotPulse  <= '1';
               elsif (PilotPulse1X) then  -- send wider pulse to threshold logic at lower clock
                  PilotPulse  <= '0';
               end if;

               if (Index0 < 1023) then
                  Index0 <= Index0 + 1;
               end if;
            else
               Index0 <= 0;
            end if;

            if (StartOut) then     -- StartOut is only one clock wide
               StartOut <= '0';
            end if;

         end if;
      end if;
   end process MaxProcess;

   DetectProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (Reset) then
            Threshold         <= to_ufixed(0.75, Threshold); -- set initial RunningTotal to typical at highest signal levels
            MagDelay          <= (others=>(to_ufixed(0.5, MagDelay(0))));
            PilotMag          <= (others=>'0');
            PilotFound        <= '0';
            PilotFoundPend    <= '0';
            PilotPulse1x      <= '0';
            CalcThreshold     <= '0';
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
            CurrentMag0       <= (others=>'0');
            CurrentMag1       <= (others=>'0');
            CurrentPhs0       <= (others=>'0');
            CurrentPhs1       <= (others=>'0');
            MagPeak0          <= (others=>'0');
            PhsPeak0          <= (others=>'0');
            MagPeak1          <= (others=>'0');
            PhsPeak1          <= (others=>'0');
            MagPeak0_u        <= (others=>'0');
            PhsPeak0_u        <= (others=>'0');
            MagPeak1_u        <= (others=>'0');
            PhsPeak1_u        <= (others=>'0');
            Peak1             <= to_ufixed(1.0, Peak1);
            Peak2             <= to_ufixed(0.2, Peak2);
         elsif (ce) then
            PilotMag     <= MaxOfPckt;          -- Latch clock transfers
            PilotPulse1x <= PilotPulse;
            if (PilotPulse1x) then
               if (IgnoreInitial < 25) then
                  IgnoreInitial <= IgnoreInitial + 1; -- let first frame accumulate to set threshold
               else
                  CalcThreshold  <= '1';
                  PeakPointer    <= 1;          -- no need to check PilotMag(0) since Peak1 is set to PilotMag also
                  Peak1          <= PilotMag;   -- Assume first is largest
                  Peak2          <= (others=>'0');
                  CurrentPeak    <= (others=>'0');
                  CurrentMag0    <= (others=>'0');
                  CurrentMag1    <= (others=>'0');
                  CurrentPhs0    <= (others=>'0');
                  CurrentPhs1    <= (others=>'0');
                  MagPeak0_u     <= MagDelay0(0);
                  PhsPeak0_u     <= PhsDelay0(0);
                  MagPeak1_u     <= MagDelay1(0);
                  PhsPeak1_u     <= PhsDelay1(0);
               end if;
               if (PilotMag > Threshold) and (Peak1 > (Peak2 sla 1)) then  -- even at noise threshold, peaks are still 2:1
                  BadPilot <= 0;
                  if (GoodPilot < 2) then
                     GoodPilot <= GoodPilot + 1;   -- 3 good frames in a row = found
                  else
                     PilotFoundPend <= '1';        -- set PilotFound on next packet to allow StartOut to propagate when MaxCount is still counting
                     GoodPilot <= 3;
                  end if;
               else
                  if (BadPilot <= 127) then    -- 128 bad packets in a row = lost. Should get 25 "bad" data packets per frame, so 4 bad frames
                     BadPilot <= BadPilot + 1;
                  else
                     GoodPilot <= 0;
                     PilotFoundPend <= '0';
                  end if;
               end if;
               PilotFound  <= PilotFoundPend;
               MagDelay    <= MagDelay(27 downto 0) & PilotMag; -- only use last 26, but PeakPointer goes to 28

            elsif (CalcThreshold) then          -- Place threshold in center of two highest peaks
               CurrentPeak <= MagDelay(PeakPointer);
               CurrentMag0 <= MagDelay0(PeakPointer);
               CurrentMag1 <= MagDelay1(PeakPointer);
               CurrentPhs0 <= PhsDelay0(PeakPointer);
               CurrentPhs1 <= PhsDelay1(PeakPointer);

               if (PeakPointer <= PACKETS_PER_FRAME) then
                  if (CurrentPeak > Peak1) then
                     Peak1 <= CurrentPeak;   -- Found new peak, store previous in peak2
                  end if;
                  if (CurrentMag0 > MagPeak0_u) then
                     MagPeak0_u <= CurrentMag0;
                     PhsPeak0_u <= CurrentPhs0;
                  end if;
                  if (CurrentMag1 > MagPeak1_u) then
                     MagPeak1_u <= CurrentMag1;
                     PhsPeak1_u <= CurrentPhs1;
                  end if;
                  PeakPointer <= PeakPointer + 1;
               elsif (PeakPointer = PACKETS_PER_FRAME + 1) then
                  if (MagDelay(18) < MagDelay(6)) then
                     Peak2 <= MagDelay(18);     -- if peak spans two packets, then both values would be similar and distort threshold
                  else                          -- so just grab a small packet
                     Peak2 <= MagDelay(6);
                  end if;
                  MagPeak0  <= to_slv(MagPeak0_u);
                  PhsPeak0  <= to_slv(PhsPeak0_u);
                  MagPeak1  <= to_slv(MagPeak1_u);
                  PhsPeak1  <= to_slv(PhsPeak1_u);
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
