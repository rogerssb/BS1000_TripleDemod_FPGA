-------------------------------------------------------------------------------
--                   PROPRIETARY NOTICE
-------------------------------------------------------------------------------
-- (c) Copyright 2014 Semco All rights reserved.
--
-- This file contains Semco proprietary information. It is the
-- property of Semco and shall not be used, disclosed to others or
-- reproduced without the express written consent of Semco,
-- including, but without limitation, it is not to be used in the creation,
-- manufacture, development, or derivation of any designs, or configuration.
--
-------------------------------------------------------------------------------
--
-- Company:     Semco
--
-- Module Name: FreqEst_tb.vhd
-- Description:
--
-- Dependencies: Top level module
--
-------------------------------------------------------------------------------
--                                DETAILS
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
--                                HISTORY
-------------------------------------------------------------------------------
-- 4/17/15 Initial release FZ
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.Semco_pkg.all;
use work.fixed_pkg.all;

entity FreqEst_tb is
end FreqEst_tb;

architecture rtl of FreqEst_tb is

  -- Define Components

   COMPONENT FrequencyEstimator IS
      GENERIC(
         FFT_LENGTH  : positive := 4096;
         NDX         : positive := 32
      );
   PORT(
      clk,
      reset          : IN  std_logic;
      ce             : IN  std_logic;
      Variables      : IN  RecordType;
      Rr,
      Ri             : IN  FLOAT_16_LP;
      Tau0Est,
      Tau1Est,
      H0EstR,
      H0EstI,
      H1EstR,
      H1EstI         : IN STC_Parm;
      StartIn,
      ValidIn        : IN  std_logic;
      Freq           : OUT FLOAT_128K;
      AcqTrack       : OUT AcqTrack_t;
      Done           : OUT std_logic
      );
   END COMPONENT FrequencyEstimator;

   COMPONENT FrequencyEstimatorDFT IS
         GENERIC(
            NDX         : positive := 32
         );
      PORT(
         clk,
         reset,
         ce             : IN  std_logic;
         Variables      : IN  RecordType;
         StartIn,
         ValidIn        : IN  std_logic;
         Rr,
         Ri             : IN  FLOAT_1_LP;
         Tau0Est,
         Tau1Est,
         H0EstR,
         H0EstI,
         H1EstR,
         H1EstI         : IN  STC_Parm;
         Freq           : OUT FLOAT_128K;
         AcqTrack       : OUT AcqTrack_t;
         Done           : OUT std_logic
      );
   END COMPONENT FrequencyEstimatorDFT;

   COMPONENT ReadGoldRef IS
      GENERIC (
         FILE_NAME         : string := "../test_data/file.txt";
         NUM_VALUES        : natural := 1;         -- number of values per line
         DATA_TYPE         : GoldDataType := Bools; -- data type, std_logic 0/1, hex int/uint or double
         OUT_WIDTH         : natural := 32;        -- total width of each value
         OUT_BINPT         : integer := -31        -- number of fraction bits if any. If none, set to 0
      );
      PORT(
         clk               : IN  std_logic;
         reset             : IN  std_logic;
         ce                : IN  std_logic;
         OutputData        : OUT vector_of_slvs(0 to NUM_VALUES-1)(OUT_WIDTH-1 downto 0);
         Done              : OUT std_logic
      );
   END COMPONENT ReadGoldRef;

-------------------------------------------------------------------------------
--                       CONSTANT DEFINITIONS
-------------------------------------------------------------------------------

   CONSTANT sqrt2over2           : real := sqrt(2.0)/2.0;

   signal   reset                : std_logic := '1';
   signal   clk                  : std_logic := '1';
   signal   ce                   : std_logic := '1';

   SIGNAL   StartIn,
            FirstStart,
            FirstTime,
            ValidIn           : std_logic := '0';
  SIGNAL    AcqTrack          : AcqTrack_t;
  SIGNAL    r_r,
            r_i               : FLOAT_1_LP;
  SIGNAL    tau_0_est,
            tau_1_est,
            h0_est_r,
            h0_est_i,
            h1_est_r,
            h1_est_i          : STC_Parm;
   SIGNAL   Freq,
            FreqDFT           : FLOAT_128K;
   SIGNAL   Dones             : UINT8 := (others=>'1');
   SIGNAL   VarsReadR,
            VarsReadI         : vector_of_slvs(0 to 0)(FLOAT_1_LP'length-1 downto 0);
   signal   PacketCount       : natural range 0 to 15000 := 0;
   signal   DoneDelay         : std_logic_vector(20 downto 0);
   SIGNAL   Variables         : RecordType := c_RecordType;

BEGIN

   process begin
      wait for 500 ps;
      clk <= not clk;
   end process;

   reset_process : process begin
      wait for 6 ns;
      reset <= '0';
   end process reset_process;

   reg_process : process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            PacketCount <= 0;
            FirstStart <= '0';
            FirstTime <= '1';
            ValidIn <= '0';
            DoneDelay <= (others=>'0');
         else
            DoneDelay <= DoneDelay(19 downto 0) & Dones(0);
            if (FirstTime) then
               FirstStart <= '1';
               FirstTime <= '0';
            else
               FirstStart <= '0';
            end if;
            if (StartIn) then
               ValidIn <= '1';
            elsif (PacketCount = 511) then
               ValidIn <= '0';
            end if;
            if (ValidIn) then
               if (PacketCount = 511) then
                  PacketCount <= 0;
               else
                  PacketCount <= PacketCount + 1;
               end if;
            end if;
         end if;
      end if;
   end process reg_process;

   RealData : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC\pilot_buf_10000_r.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => FLOAT_1_LP'length,
      OUT_BINPT         => FLOAT_1_LP'right
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => ValidIn or FirstStart,
      OutputData        => VarsReadR,
      Done              => Dones(7)
   );

   ImagData : ReadGoldRef
   GENERIC MAP(
      FILE_NAME         => "C:\Semco\STCinfo\RealTimeC\SpaceTimeCodeInC\SpaceTimeCodeInC\pilot_buf_10000_i.txt",
      NUM_VALUES        => 1,
      DATA_TYPE         => SFix,
      OUT_WIDTH         => FLOAT_1_LP'length,
      OUT_BINPT         => FLOAT_1_LP'right
   )
   PORT MAP(
      clk               => clk,
      reset             => reset,
      ce                => ValidIn or FirstStart,
      OutputData        => VarsReadI,
      Done              => Dones(6)
   );

   StartIn <= FirstStart or (not DoneDelay(20) and DoneDelay(19));

   r_r         <= to_sfixed(VarsReadR(0), r_r);
   r_i         <= to_sfixed(VarsReadI(0), r_i);
   tau_0_est   <= to_sfixed(0.0, tau_0_est);
   tau_1_est   <= to_sfixed(0.0, tau_1_est);
   h0_est_r    <= to_sfixed(0.3905, h0_est_r);
   h0_est_i    <= to_sfixed(0.6517, h0_est_i);
   h1_est_r    <= to_sfixed(0.1080, h1_est_r);
   h1_est_i    <= to_sfixed(0.1525, h1_est_i);

   Freq_u : FrequencyEstimator
      GENERIC map(
         FFT_LENGTH  => 4096,
         NDX         => 32
      )
   PORT map(
      clk            => clk,
      reset          => reset,
      ce             => ce,
      Variables      => Variables,
      Rr             => r_r,
      Ri             => r_i,
      Tau0Est        => tau_0_est,
      Tau1Est        => tau_1_est,
      H0EstR         => h0_est_r,
      H0EstI         => h0_est_i,
      H1EstR         => h1_est_r,
      H1EstI         => h1_est_i,
      StartIn        => StartIn,
      ValidIn        => '1',
      Freq           => Freq,
      AcqTrack       => AcqTrack,
      Done           => Dones(0)
   );

   FreqDFT_u : FrequencyEstimatorDFT
      GENERIC MAP(
         NDX         => 32
      )
   PORT MAP (
      clk             => clk,
      reset           => reset,
      ce              => ce,
      Variables       => Variables,
      StartIn         => StartIn,
      ValidIn         => '1',
      Rr              => r_r,
      Ri              => r_i,
      Tau0Est         => tau_0_est,
      Tau1Est         => tau_1_est,
      H0EstR          => h0_est_r,
      H0EstI          => h0_est_i,
      H1EstR          => h1_est_r,
      H1EstI          => h1_est_i,
      Freq            => FreqDFT,
      AcqTrack        => open,
      Done            => Dones(1)
   );

end rtl;

