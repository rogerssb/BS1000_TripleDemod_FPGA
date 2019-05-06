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

   Module Name: DFT_Search.vhd
   Description: Performs a find-grained search for the maximum magnitude squared frequency
response around the candidate FFT output bin. The intent is to emulate an FFT
64 times larger. The smaller FFT is good enough to locate possible bins where the
max is located. Then dft_search() is called to search around those bins to find
the true max.
	The routine computes three DFTs. One at the center defined by IndexIn, and Index ± IndexOffset.
The largest result becomes the new center and the Offset is halved. This iterates for 12 DFT
cycles. The largest final results are passed back as IndexOut and Magnitude and should be the
closest picket of the spectrum fence.

   ARGUMENTS:
		IndexIn			:	Fraction bin number of the original FFT output around which to search.
      IndexOffset    :  IndexOffset is set 1/4 of the picket fence spacing DELTA_F_IND, 19.6923 at 10Mbps.
      x_r, x_i			:  The complex input sequence.
      Start          :
		Length			:	Length of x_r, x_i.
		N     			:	Length of the FFT.
		Magnitude   	:	The output of the final maximum magnitude squared frequency response.
		IndexIn			:	The fractional bin index corresponding to Magnitude
		Magnitude		:	Magnitude squared frequency response at x1.
      Done           :  results are ready

   Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------
   Do initial search of ±6 bins around IndexIn.
   Then do fractional bin search around BinSrch result. Note the calling routine will
   repeat the data for 12 iterations of this search.
----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
9-6-16 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY DFT_Search IS
      GENERIC(
         N           : integer := 4096;
         NDX         : integer := 832
      );
   PORT(
      clk            : IN  std_logic;
      reset          : IN  std_logic;
      ce             : IN  std_logic;
      X_r,
      X_i            : IN  FLOAT_1_HP;
      IndexIn        : IN  sfixed(12 downto -19);
      IndexOffset    : IN  FLOAT_64_HP;
      Start,
      NextCycle      : IN  std_logic;
      Magnitude      : OUT FLOAT_1K;
      IndexOut       : OUT sfixed(12 downto -19);
      Done           : OUT std_logic
   );
END DFT_Search;


ARCHITECTURE rtl OF DFT_Search IS

   COMPONENT DFT IS
      GENERIC(
         N           : integer := 4096;
         NDX         : integer := 832
      );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         X_r,
         X_i            : IN  FLOAT_1_HP;
         IndexIn        : IN  sfixed(12 downto -19);
         StartIn        : IN  std_logic;
         Magnitude      : OUT FLOAT_1K;
         Done           : OUT std_logic
      );
   END COMPONENT DFT;

   type  ModeType is (Idle, BinSearch, Pipeline);

   CONSTANT LAST_ONE    : FLOAT_64_HP := (FLOAT_ZERO_64_HP'right => '1', others=>'0');

   -- Signals
   SIGNAL   Mode        : ModeType;
   SIGNAL   DoneDft     : std_logic;
   SIGNAL   MaxIndex,
            MaxIndexAB,
            DftIndexA,
            DftIndexB,
            DftIndexC   : sfixed(12 downto -19);
   SIGNAL   Offset      : FLOAT_64_HP;
   SIGNAL   MagDftA,
            MagDftB,
            MagDftC,
            LargestAB,
            Largest     : FLOAT_1K;

/*   -- TODO, delete ILAs
   signal   MaxIndex_Ila,
            DftIndexA_Ila,
            DftIndexB_Ila,
            DftIndexC_Ila  : sfixed(19+12 downto 19-19);
   SIGNAL   MagDftA_Ila,
            MagDftB_Ila,
            MagDftC_Ila,
            Largest_Ila    : sfixed(14+10 downto 14-14); --FLOAT_1K;

   attribute mark_debug : string;
   attribute mark_debug of MaxIndex_Ila      : signal is "true";
   attribute mark_debug of DftIndexA_Ila     : signal is "true";
   attribute mark_debug of DftIndexB_Ila     : signal is "true";
   attribute mark_debug of DftIndexC_Ila     : signal is "true";
   attribute mark_debug of MagDftA_Ila       : signal is "true";
   attribute mark_debug of MagDftB_Ila       : signal is "true";
   attribute mark_debug of MagDftC_Ila       : signal is "true";
   attribute mark_debug of Largest_Ila       : signal is "true";
*/
BEGIN
/*
   IlaProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         MaxIndex_Ila   <= MaxIndex;
         DftIndexA_Ila  <= DftIndexA;
         DftIndexB_Ila  <= DftIndexB;
         DftIndexC_Ila  <= DftIndexC;
         MagDftA_Ila    <= MagDftA;
         MagDftB_Ila    <= MagDftB;
         MagDftC_Ila    <= MagDftC;
         Largest_Ila    <= Largest;
      end if;
   end process IlaProcess;
*/
   Delay_process : process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            Mode        <= Idle;
            Done        <= '0';
            MaxIndex    <= (others=>'0');
            MaxIndexAB  <= (others=>'0');
            LargestAB   <= (others=>'0');
            Offset      <= (others=>'0');
            Largest     <= (others=>'0');
            Magnitude   <= (others=>'0');
            IndexOut    <= (others=>'0');
         elsif ce = '1' then
            case (Mode) is
            when Idle =>
              if (Start) then
                  Mode     <= BinSearch;
                  Done     <= '0';  -- only clear Done on start of routine, not on cycles
                  Largest  <= (others=>'0');
                  Offset   <= IndexOffset;
               end if;
               MaxIndex <= IndexIn;
            when BinSearch =>
               if (DoneDft) then
                  if (MagDftA > MagDftB) then
                     LargestAB  <= MagDftA;
                     MaxIndexAB <= DftIndexA;
                  else
                     LargestAB  <= MagDftB;
                     MaxIndexAB <= DftIndexB;
                  end if;
                  if (MagDftC > Largest) then
                     Largest   <= MagDftC;
                     MaxIndex  <= DftIndexC;
                  end if;
                  Mode <= Pipeline;
               end if;
            when Pipeline =>
               if (Offset = LAST_ONE) then -- down to last bit
                  if (LargestAB > Largest) then
                     Magnitude <= LargestAB;
                     IndexOut  <= MaxIndexAB;
                  else
                     Magnitude <= Largest;
                     IndexOut  <= MaxIndex;
                  end if;
                  Done <= '1';
                  Mode <= Idle;
               else
                  if (LargestAB > Largest) then
                     Largest  <= LargestAB;
                     MaxIndex <= MaxIndexAB;
                  end if;
                  Offset    <= resize(Offset / 2, Offset);
                  Mode      <= BinSearch;
               end if;
            end case;
         end if;
      end if;
   end process Delay_process;

   DftIndexA <= resize(MaxIndex + Offset, DftIndexA);
   DftIndexB <= MaxIndex;
   DftIndexC <= resize(MaxIndex - Offset, DftIndexC);

   DFTA_u : DFT
      GENERIC MAP(
         N        => N,
         NDX      => NDX
         )
      PORT MAP(
         clk         => clk,
         reset       => reset,
         ce          => ce,
         X_r         => X_r,
         X_i         => X_i,           -- data is repeated from calling routine
         IndexIn     => DftIndexA,
         StartIn     => NextCycle,
         Magnitude   => MagDfta,
         Done        => DoneDft
      );

   DFTB_u : DFT
      GENERIC MAP(
         N        => N,
         NDX      => NDX
         )
      PORT MAP(
         clk         => clk,
         reset       => reset,
         ce          => ce,
         X_r         => X_r,
         X_i         => X_i,
         IndexIn     => DftIndexB,
         StartIn     => NextCycle,
         Magnitude   => MagDftB,
         Done        => open
      );

   DFTC_u : DFT
      GENERIC MAP(
         N        => N,
         NDX      => NDX
         )
      PORT MAP(
         clk         => clk,
         reset       => reset,
         ce          => ce,
         X_r         => X_r,
         X_i         => X_i,
         IndexIn     => DftIndexC,
         StartIn     => NextCycle,
         Magnitude   => MagDftC,
         Done        => open
      );

END rtl;
