/*-----------------------------------------------------------------------------
                   PROPRIETARY NOTICE
-----------------------------------------------------------------------------
 (c) Copyright 2014 Semco Inc. All rights reserved.

 This file contains Semco Inc. proprietary information. It is the
 property of Semco Inc. and shall not be used, disclosed to others or
 reproduced without the express written consent of Semco Inc.,
 including, but without limitation, it is not to be used in the creation,
 manufacture, development, or derivation of any designs, or configuration.

-----------------------------------------------------------------------------

 Company:     Semco Inc.

 Module Name: DFT.vhd
 Description: Discrete Fourier Transform takes the four complex pilot templates
 after decimation by 64, spreading them across 832 zero filled samples and does
 a frequency translation by the peak of the calculated FFT of the input.

 Dependencies:
   SinCosLut
-----------------------------------------------------------------------------
                                DETAILS
-----------------------------------------------------------------------------
Since only 32 samples are non-zero the routine jumps over the zeroes between to
save time. Otherwise the accumulated process in Frequency Estimate would exceed
the frame time. The SinCos is now just a lookup table and the phase input is
calculated in this routine. The 4 bursts of 8 samples are at 200, 408, 616 and
824. Having calculated the phase increment, the phase into the SinCosLut starts
200 * PhaseInc, increments 8 times to 207 then jumps the phase 201*PhaseInc to 408, etc
-----------------------------------------------------------------------------
                                HISTORY
-----------------------------------------------------------------------------
 9-30-16 Initial release FZ
 -------------------------------------------------------------
*/
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.math_real.ALL;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY DFT IS
      GENERIC(
         N           : integer := 4096;
         NDX         : integer := 32   -- Only calculate non-zero samples
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
END DFT;


ARCHITECTURE rtl OF DFT IS

   COMPONENT SinCosLut
     PORT (
       aclk,
       aclken,
       aresetn,
       s_axis_phase_tvalid : IN STD_LOGIC;
       s_axis_phase_tdata  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       m_axis_data_tvalid  : OUT STD_LOGIC;
       m_axis_data_tdata   : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
     );
   END COMPONENT SinCosLut;

   CONSTANT SIN_COS_LATENCY   : positive := 10;
   CONSTANT LOG2_N            : positive := log2(N);
   CONSTANT PHASE_OFFSETA     : sfixed(1 downto 0) := to_sfixed(-1.0, 1, 0);
   CONSTANT PHASE_OFFSETB     : sfixed(2 downto -12) := (to_sfixed(2, 2, -12) sra LOG2_N);
   CONSTANT PHASE_JUMP123     : INT16f := to_sfixed(201, ZERO16sf);
   CONSTANT PHASE_JUMP0       : INT16f := to_sfixed(200, ZERO16sf);

  -- Signals
   SIGNAL   W_r,
            W_i               : sfixed(0 downto -17);
   SIGNAL   PhaseInc,
            PhaseJump,
            PhaseAcc          : sfixed(0 downto -31);
   SIGNAL   DelayX_r,
            DelayX_i          : FLOAT_ARRAY_1_HP(SIN_COS_LATENCY-1 downto 0);
   SIGNAL   DelayXr,
            DelayXi,
            WrXr, WrXi,
            WiXr, WiXi        : FLOAT_1_HP;
   SIGNAL   IndexInDly        : sfixed(12 downto -19);
   SIGNAL   XRay_r,
            XRay_i            : FLOAT_1K;
   SIGNAL   MagRe,
            MagIm             : FLOAT_1K;
   SIGNAL   IndexCount        : integer range 0 to NDX+8;
   SIGNAL   PhaseCount        : integer range 0 to 7;
   SIGNAL   tvalid,
            DDS_Reset_n,
            PhaseActive,
            InternalStart     : std_logic;
   SIGNAL   DelayStart        : std_logic_vector(SIN_COS_LATENCY-1 downto 0);
   SIGNAL   tdata             : std_logic_vector(47 downto 0) := (others => '0');

BEGIN

 /*
 dft(double x1,
		 const double *x_r, const double *x_i, const int ndx, const int N,
		 double *y)
{
	double w_r,w_i;
	double wm_r,wm_i;
	double tmp_r, tmp_i;
	double xray_r, xray_i;
	const double ts = R/FS;
	double freq;
	int j;

	// compute DFTs of each point around center
	freq = FS*(x1 - N/2+1)/(R*N);
	wm_r = cos(MATH_PI * 2 * ts * freq);
   wm_i = -sin(MATH_PI_2*ts*freq);
	// initialize the phasor
	w_r = 1.0; w_i = 0.0;
	// initialize the accumulator
	xray_r = 0.0; xray_i = 0.0;
	for(j=0; j<Length; j++)
	{
		complex_mult_double(w_r,w_i,x_r[j],x_i[j],&tmp_r,&tmp_i);
		xray_r += tmp_r; xray_i += tmp_i;

		// rotate the phasor
		complex_mult_double(w_r,w_i,wm_r,wm_i,&w_r,&w_i);
	}
	// compute the magnitude squared of the complex result, store in *y
	complex_abs2_double(xray_r,xray_i,y);
*/

   process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            XRay_r      <= (others=>'0');
            XRay_i      <= (others=>'0');
            DelayX_r    <= (others=>(others=>'0'));
            DelayX_i    <= (others=>(others=>'0'));
            Magnitude   <= (others=>'0');
            MagRe       <= (others=>'0');
            MagIm       <= (others=>'0');
            W_r         <= (others=>'0');
            W_i         <= (others=>'0');
            DelayStart  <= (others=>'0');
            IndexInDly  <= (others=>'0');
            PhaseInc    <= (others=>'0');
            PhaseAcc    <= (others=>'0');
            PhaseJump   <= (others=>'0');
            PhaseActive <= '0';
            PhaseCount  <= 0;
            WrXr        <= (others=>'0');
            WrXi        <= (others=>'0');
            WiXr        <= (others=>'0');
            WiXi        <= (others=>'0');
            IndexCount  <= NDX+8;
            Done        <= '0';
         else
            W_r <= to_sfixed(tdata(17 downto 0) , W_r);
            W_i <= to_sfixed(tdata(41 downto 24), W_i);
            DelayX_r <= DelayX_r(SIN_COS_LATENCY-2 downto 0) & X_r;
            DelayX_i <= DelayX_i(SIN_COS_LATENCY-2 downto 0) & X_i;
            DelayStart <= DelayStart(SIN_COS_LATENCY-2 downto 0) & StartIn;
            IndexInDly <= IndexIn;
            -- get DDS cranked up to remove latency
            -- Freq <= FS * (IndexIn - N/2 + 1) / (R * N);
            -- Wm_r <= to_sfixed( cos(MATH_PI * 2.0 * TS * Freq), Wm_r);
            -- Wm_i <= to_sfixed(-sin(MATH_PI * 2.0 * TS * Freq), Wm_i);
            -- Convert from radians to binary = 1.0/(pi)
            -- Freq*TS is the phase advance per clock. TS = R/FS, so Freq*Ts cancels the FS and the R terms,
            -- leaving Phase <= 2 * (IndexIn - N/2 + 1) / N;
            -- Break into partial fractions gives: Phase <= 2*IndexIn/N - 2*N/2*N + 2/N; 2N/2N is 1.
            -- Therefore Phase <= 2*IndexIn/N - 1 + 2/N;
            -- N = 4096, so x/N is just a shift right by 12 which Vivado can detect.
            -- The actual value fed to the DDS. Since desired SIN is negative, make phaseInc negative
            PhaseInc <= resize(( (-2*IndexInDly) sra LOG2_N) - PHASE_OFFSETA - PHASE_OFFSETB, PhaseInc);
            if (DelayStart(1) or PhaseActive) then -- Phase takes 6 clocks to calculate, so start early
               if (IndexCount = NDX-5) then
                  PhaseActive <= '0';
               else
                  PhaseActive <= '1';
               end if;

               if (PhaseCount = 0) then
                  PhaseJump <= resize(PhaseInc * PHASE_JUMP123, PhaseJump);
               end if;

               if (DelayStart(1)) then
                  PhaseAcc <= resize(PhaseInc * PHASE_JUMP0, PhaseAcc);
               elsif (PhaseCount = 7) then
                  PhaseAcc <= resize(PhaseAcc + PhaseJump, PhaseAcc);
               else
                  PhaseAcc <= resize(PhaseAcc + PhaseInc, PhaseAcc);
               end if;

               if (DelayStart(1)) then
                  PhaseCount <= 0;
               elsif (PhaseCount = 7) then
                  PhaseCount <= 0;
               else
                  PhaseCount <= PhaseCount + 1;
               end if;
            end if;
            if (InternalStart) then
               XRay_r <= (others=>'0');
               XRay_i <= (others=>'0');
               WrXr   <= (others=>'0');
               WrXi   <= (others=>'0');
               WiXr   <= (others=>'0');
               WiXi   <= (others=>'0');
               IndexCount <= 0;
            elsif (IndexCount < NDX+2) then
               WrXr <= resize(W_r * DelayXr, WrXr);
               WrXi <= resize(W_r * DelayXi, WrXi);
               WiXr <= resize(W_i * DelayXr, WiXr);
               WiXi <= resize(W_i * DelayXi, WiXi);
               XRay_r <= resize(XRay_r + WrXr - WiXi, XRay_r);--, fixed_saturate, fixed_round);
               XRay_i <= resize(XRay_i + WrXi + WiXr, XRay_i);--, fixed_saturate, fixed_round);
               -- compute Mag squared of the complex result
               MagRe <= resize(XRay_r * XRay_r, MagRe);
               MagIm <= resize(XRay_i * XRay_i, MagIm);
               IndexCount <= IndexCount + 1;
            elsif (IndexCount = NDX+2) then
               IndexCount <= IndexCount + 1; -- Allow two clocks for MagRe/Im to settle
            elsif (IndexCount = NDX+3) then
               Done      <= '1';
               Magnitude <= resize(MagRe + MagIm, Magnitude);
               IndexCount <= IndexCount + 1;
            else
               Done <= '0';
            end if;
         end if;
      end if;
   end process;

   InternalStart <= DelayStart(SIN_COS_LATENCY-2);
   DelayXr <= DelayX_r(SIN_COS_LATENCY-1);
   DelayXi <= DelayX_i(SIN_COS_LATENCY-1);
   DDS_Reset_n <= not (DelayStart(0) or StartIn);

   SinCos_u : SinCosLut
     PORT MAP(
       aclk                   => clk,
       aclken                 => ce,
       aresetn                => DDS_Reset_n,
       s_axis_phase_tvalid    => '1',
       s_axis_phase_tdata     => to_slv(PhaseAcc(0 downto -15)),
       m_axis_data_tvalid     => tvalid,
       m_axis_data_tdata      => tdata
     );

END rtl;

