
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CombinerWrap IS
   PORT(
      ch1Adc17                : IN std_logic_vector(17 downto 0);
      ch2Adc17                : IN std_logic_vector(17 downto 0);
      ch1Agc                  : IN std_logic_vector(11 downto 0);
      ch2Agc                  : IN std_logic_vector(11 downto 0);
      addr                    : IN std_logic_vector( 4 downto 0);
      dataIn                  : IN std_logic_vector(31 downto 0);
      reset,
      adc0Clk,
      cs,
      wr0, wr1, wr2, wr3      : IN std_logic;
      combinerIF,
      maxImagout, maxRealout, minImagout, imagout, realout,
      minRealout, gainOutMax, gainOutMin, phase_detect,
      ch1RealPre, ch1ImagPre, ch2RealPre, ch2ImagPre        : OUT std_logic_vector(17 downto 0);
      RealLock, ImagLock                                    : OUT std_logic_vector(12 downto 0);
      nco_control_out                                       : OUT std_logic_vector(21 downto 0);
      combinerDout                                          : OUT std_logic_vector(31 downto 0);
      lag_out                                               : OUT std_logic_vector(31 downto 0)
   );
END CombinerWrap;


ARCHITECTURE rtl OF CombinerWrap IS

   COMPONENT CombinerTop_0
      PORT(
         ch1Adc,
         ch2Adc,
         ch1RealIn,
         ch1ImagIn,
         ch2RealIn,
         ch2ImagIn               : IN std_logic_vector(17 downto 0);
         ch1Agc,
         ch2Agc                  : IN std_logic_vector(11 downto 0);
         addr                    : IN std_logic_vector(4 downto 0);
         dataIn                  : IN std_logic_vector(31 downto 0);
         reset,
         clk,












,
         clkOver2,
         busClk,
         ComplexOrIF_n,
         cs,
         wr0, wr1, wr2, wr3      : IN std_logic;
         ifOut,
         maxImagout, maxRealout,
         minImagout, minRealout,
         imagout, realout,
         gainOutMax, gainOutMin,
         phase_detect            : OUT std_logic_vector(17 downto 0);
         RealLock, ImagLock      : OUT std_logic_vector(12 downto 0);
         nco_control_out         : OUT std_logic_vector(21 downto 0);
         combinerDout            : OUT std_logic_vector(31 downto 0);
         lag_out,
         dataOut                 : OUT std_logic_vector(31 downto 0);
         locked,
         agc1_gt_agc2,
         RealXord, ImagXord,
         ifBS_n,
         combinerEn      : std_logic
     );
   END COMPONENT;

BEGIN

   Combiner : CombinerTop_0
      PORT MAP(
         ch1Adc            => ch1Adc,
         ch2Adc            => ch2Adc,
         ch1Agc            => ch1Agc,
         ch2Agc            => ch2Agc,
         addr              => addr,
         dataIn            => dataIn,
         reset             => reset,
         cs                => cs,
         wr0               => wr0,
         wr1               => wr1,
         wr2               => wr2,
         wr3               => wr3,
         ch1RealIn         => ch1RealIn,
         ch1ImagIn         => ch1ImagIn,
         ch2RealIn         => ch2RealIn,
         ch2ImagIn         => ch2ImagIn,
         combinerIF        => combinerIF,
         maxImagout        => maxImagout,
         maxRealout        => maxRealout,
         minImagout        => minImagout,
         imagout           => imagout,
         realout           => realout,
         minRealout        => minRealout,
         gainOutMax        => gainOutMax,
         gainOutMin        => gainOutMin,
         phase_detect      => phase_detect,
         RealLock          => RealLock,
         ImagLock          => ImagLock,
         nco_control_out   => nco_control_out,
         combinerDout      => combinerDout,
         lag_out           => lag_out
     );

END rtl;

