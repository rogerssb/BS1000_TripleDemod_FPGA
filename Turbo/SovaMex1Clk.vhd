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

Module Name: SovaMex.vhd
Description: Does all rates with PCIAs to 16

ARGUMENTS :


Dependencies:

Note, code marked --** is done in block rams, code is there to show functionality

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------
-- bTerm is always 1, so pAM(0) = METRIC_HEADSTART initially;

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

ENTITY SovaMex1 is
      Port (
         Clk,
         CE,
         Reset,
         ValidIn     : IN  std_logic;
         EuI         : IN  STD_LOGIC_VECTOR(SfixSova'length-1 downto 0);
         PCI         : IN  STD_LOGIC_VECTOR(0 to SfixPci'length*16-1);
         peC         : IN  STD_LOGIC_VECTOR(32*4-1 downto 0);
         Frame       : IN  STD_LOGIC_VECTOR(2 downto 0);
         IndexOut    : OUT STD_LOGIC_VECTOR(13 downto 0);
         InReady,
         uHat,
         ValidOut    : OUT std_logic;
         EuO         : OUT STD_LOGIC_VECTOR(SfixSova'length-1 downto 0);
         Magnitude   : OUT STD_LOGIC_VECTOR(SfixSova'length downto 0)
   );
   END SovaMex1;

ARCHITECTURE rtl OF SovaMex1 IS

   -- constants
	constant psS             : UINT4_ARRAY(0 to 31) := (x"0",x"0",x"1",x"1",x"2",x"2",x"3",x"3",x"4",x"4",x"5",x"5",x"6",x"6",x"7",x"7",
                                                      x"8",x"8",x"9",x"9",x"A",x"A",x"B",x"B",x"C",x"C",x"D",x"D",x"E",x"E",x"F",x"F");
	constant psE             : UINT4_ARRAY(0 to 31) := (x"0",x"1",x"2",x"3",x"4",x"5",x"6",x"7",x"9",x"8",x"B",x"A",x"D",x"C",x"F",x"E",
                                                      x"1",x"0",x"3",x"2",x"5",x"4",x"7",x"6",x"8",x"9",x"A",x"B",x"C",x"D",x"E",x"F");
	constant peR             : UINT5_ARRAY(0 to 31) := (5x"00",5x"03",5x"04",5x"07",5x"08",5x"0B",5x"0C",5x"0F",5x"12",5x"11",5x"16",
                                                      5x"15",5x"1A",5x"19",5x"1E",5x"1D",5x"02",5x"01",5x"06",5x"05",5x"0A",5x"09",
                                                      5x"0E",5x"0D",5x"10",5x"13",5x"14",5x"17",5x"18",5x"1B",5x"1C",5x"1F");
   constant nTbLen      : natural := 32;
   constant nTbLenPlus1 : natural := nTbLen + 1;
   constant Mu          : natural := 2;      -- Hardcoded for single binary input
   constant MC          : natural := 16;    -- =nP_CI_M;
   constant Ne          : natural := 32;     -- =nsS_M;
   constant Ns          : natural := Ne/Mu;
   constant pXLuLeft    : natural := SfixSova'left;
   constant pXLuRight   : integer := SfixSova'right;
   constant pXM_Left    : natural := SfixSova'left;
   constant pXM_Right   : integer := SfixSova'right;
   constant METRIC_HEADSTART : integer :=  16;   -- was 1024 but goes to zero quickly
   constant MAX_ALLOWABLE_METRIC : integer := 0;
   constant FRAME_SIZE  : int_array(0 to 5) := (0, 1*1784, 2*1784, 3*1784, 4*1784, 5*1784);
   constant ZERO_PACK_LAST_4 : integer := 4;

   subtype  pXM_t     is sfixed(pXM_Left downto pXM_Right);
   type     PXM_ARRAY is array (natural range <>) of pXM_t;
   subtype  pXLu_t    is sfixed(pXLuLeft downto pXLuRight);
   type     pXLuARRAY is array (natural range <>) of pXLu_t;
   type     PXLU_MAT   is array (natural range <>) of PXLuARRAY;
   type     mode_t    is (IDLE, FORWARD, /*ENDINGS,*/ REVERSE, HALTING);
   type  pRLu_Mat is array (0 to Ne-1, 0 to nTbLen-1) of pXLu_t;
   type  pALu_Mat is array (0 to Ns-1, 0 to nTbLenPlus1-1) of pXLu_t;

   -- Signals
   signal   Mode           : mode_t := IDLE;
   signal   FrameLast      : integer range FRAME_SIZE(0) - 1 to FRAME_SIZE(5) + 3;
   signal   GlobSeOffset   : natural range 0 to Ne+1;
   signal   nGlobal_sE     : natural range 0 to Ns-1;
   signal   t,
            tDelayDly,
            IndexOut_u,
            tDelay         : natural range 0 to FRAME_SIZE(5) + 4 + 32;
   signal   Frame_u        : natural range 0 to 5;

   -- ///////////////////////////////////////////////////////////////////////////
   -- / Allocate the arrays that will be used in the algorithm
   -- ////////////////////////////////////////////////////////
	-- List of Abbreviations/Notations
	-- AM    = accumulative metric, each state has one
	-- ALu   = accumulative u reliability buffer, each state has one buffer
	-- Au    = accumulative u survivor info buffer, each state has one buffer
	-- RM    = right-side metric (as in right side of trellis), one per edge
	-- RLu   = right-side u reliability buffer, each metric has one buffer
	-- Ru    = right-side u survivor info buffer, each metric has one buffer
	-- E_uO  = soft output for u, this is the magnitude of the LLR
	-- u_hat = hard output for u, this contains the sign information of the LLR
	signal   pAM            : PXM_ARRAY(0 to Ns-1);                      -- double(Ns);
	signal   pRM            : PXM_ARRAY(0 to Ne-1);                      -- double(Ne);
   signal   pRLu           : pRLu_Mat;           -- double(Ne*nTbLen);
   signal   pALu           : PALu_Mat;             -- double(Ne*nTbLen);
   signal   pAu            : vector_of_slvs(0 to Ns-1)(0 to nTbLenPlus1-1);   --    int(Ns*nTbLenPlus1);
	signal   pRu            : vector_of_slvs(0 to Ne-1)(0 to nTbLen-1);        --    int(Ne*nTbLen);
   signal   dGlobalMax,
            dGlobalMin,
            MaxMax,
            MinMin         : pXM_t; --dDeltaDly is one clock behind pRM's
   signal   EuI_Dly        : SFIX_SOVA_ARRAY(nTbLen downto 0);
   signal   EuIsf          : SfixSova;
   signal   PCIsf          : SFIX_PCI_ARRAY(0 to 15);
   signal   pECu           : UINT4_ARRAY(0 to 31);

BEGIN

   FrameLast <= FRAME_SIZE(Frame_u) - 1 + ZERO_PACK_LAST_4;

   tDelay   <= t - nTbLen when (t >= nTbLen) else 0;

   EuIsf    <= to_sfixed(EuI, EuIsf);
   IndexOut <= STD_LOGIC_VECTOR(to_unsigned(IndexOut_u, 14));
   Frame_u  <= to_integer(unsigned(Frame));
   InReady  <= ValidIn when (t < FrameLast) else '0';

   process(all)
   begin
      for n in PCIsf'range loop
         PCIsf(n) <= to_sfixed(PCI(n*PCIsf(n)'length to (n+1)*PCIsf(n)'length-1), PCIsf(n));
      end loop;
      for n in pECu'range loop
         pECu(n) <= unsigned(peC((n+1)*4-1 downto n*4));
      end loop;
   end process;

   ClkProcess : process(Clk)
      variable sE_v,
               nGlobal_sE_v,
               nOffAu_v       : natural range 0 to Ns-1;
      variable nOffRu_v,
               eR_v,
               eR_0_v,
               eR_1_v,
               nMinEr_v,
               nMaxEr_v,
               eL_v           : natural range 0 to Ne-1;
      variable dDelta_v       : pXLu_t;
	   variable pAM_v          : PXM_ARRAY(0 to Ns-1);
	   variable pRM_v          : PXM_ARRAY(0 to Ne-1);
      variable pRLu_v         : pRLu_Mat;
      variable pALu_v         : PALu_Mat;
      variable pAu_v          : vector_of_slvs(0 to Ns-1)(0 to nTbLenPlus1-1);
	   variable pRu_v          : vector_of_slvs(0 to Ne-1)(0 to nTbLen-1);
      variable dThis_P_uI_v,
               dGlobalMax_v,
               dGlobalMin_v,
               MaxMax_v,
               MinMin_v,
               dMinRM_v,
               dMaxRM_v       : pXM_t; --dDeltaDly is one clock behind pRM's
      variable UpdatedL_v     : pXLuARRAY(0 to nTbLenPlus1-1);
      variable u_hat_v        : std_logic;
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            Mode        <= IDLE;
            ValidOut    <= '0';
            uHat        <= '0';
            t           <= 0;
            IndexOut_u  <= 0;
            EuO         <= (others=>'0');
            MaxMax      <= (others=>'0');
            MinMin      <= (others=>'0');
            EuI_Dly     <= (others=>(others=>'0'));
            pAM(0)      <= to_sfixed(METRIC_HEADSTART, pAM(0));   -- pAM(0) = 16;
            GlobSeOffset <= 0;
            dGlobalMax  <= (others=>'0');
            dGlobalMin  <= (others=>'0');
            pAM(1 to Ns-1) <= (others=>(others=>'0'));
            pRM         <= (others=>(others=>'0'));
            pRLu        <= (others=>(others=>(others=>'0')));
            pRu         <= (others=>(others=>'0'));
            pALu        <= (others=>(others=>(others=>'0')));
            pAu         <= (others=>(others=>'0'));
         elsif (CE) then
            tDelayDly <= tDelay;
            case (Mode) is
            when IDLE =>
               ValidOut     <= '0';
               GlobSeOffset <= 0;
               IndexOut_u   <= 0;
               if (ValidIn) then
                  Mode        <= FORWARD;
               end if;
            -- for(t=0;t<nNumTimeSteps;++t)
            when(FORWARD) =>     -- Note, once beyond Idle mode, data is always expected to be valid
               pRM_v          := pRM;
               pAM_v          := pAM;
               pAu_v          := pAu;
               pALu_v         := pALu;
               pRu_v          := pRu;
               pRLu_v         := pRLu;
               MaxMax_v       := MaxMax;
               MinMin_v       := MinMin;
               dGlobalMax_v   := dGlobalMax;
               dGlobalMin_v   := dGlobalMin;

               dThis_P_uI_v   := resize(-EuIsf / 2, dThis_P_uI_v, fixed_wrap, fixed_truncate);     -- dThis_P_uI = -pL_uI(t)/2.0;
               -- Forward Recursion
               -- Grab the single value of L_uI for this time step and "unpackage" it,
               -- which entails applying the proper +/- sign and dividing by 2 (after
               -- which it becomes a symbol-based log probability). Because the info
               -- bits for each edge alternate between 0 and 1, we start dThis_P_uI
               -- with a minus sign and flip its sign after each use. The MC symbol-
               -- based log probabilities currently pointed to by pThis_P_CI are ready
               -- for use.
               -- Loop through the edges in eL order. We will access everything in eL
               -- order and store all the results in eR order in the Merging (M)
               -- vectors.
               for eL_v in 0 to Ne - 1 loop
                     -- Grab the eR associated with this eL
                  eR_v := to_integer(peR(eL_v));

                  -- do all 32 moves at once
                  nOffRu_v := eR_v;                  -- nOffRu = eR*nTbLen;
                  nOffAu_v := to_integer(psS(eL_v)); -- nOffAu = psS(eL)*nTbLenPlus1;

                     -- This is a copy AND a shift at the same time, because the
                     -- accumulative (A) buffers have one more traceback entry than the
                     -- right (R) have.
                     -- Compute the merging metric
                  pRM_v(eR_v)    := resize(pAM_v(to_integer(psS(eL_v))) + PCIsf(to_integer(peCu(eL_v))) + dThis_P_uI_v - dGlobalMin_v, pRM_v(0)); --pRM(eR) = pAM(psS(eL)) + pThis_P_CI(peC(eL)) + dThis_P_uI;
                  for i in 1 to 32 loop
                     pRLu_v(nOffRu_v, i-1) := pALu_v(nOffAu_v, i);   --memcpy(pRLu + nOffRu, pALu + nOffAu + 1, nTbLen*sizeof(pRLu(0)));
                  end loop;
                  pRu_v(nOffRu_v)  := pAu_v(nOffAu_v)(1 to 32);      --memcpy(pRu  + nOffRu, pAu  + nOffAu + 1, nTbLen*sizeof(pRu(0)));

                  dThis_P_uI_v   := resize(-dThis_P_uI_v, dThis_P_uI_v, fixed_wrap, fixed_truncate); -- Flip the sign of dThis_P_uI
               end loop;

               -- Initialize the global max/min with valid data
               dGlobalMax_v  := pRM_v(0);
               dGlobalMin_v  := pRM_v(0);
               nGlobal_sE_v  := 0;
               -- ENDINGS

		      -- Loop through the ending states (sE) and determine the local min and max paths
		         for sE_v in 0 to Ns - 1 loop
               --{
                  -- For any sE, the two edges merging into it have eR's that are
                  -- consecutive numbers: the edge associated with 0 is the first one
                  -- and the edge associated with 1 is the second one.
                  eR_0_v := 2*sE_v;
                  eR_1_v := eR_0_v + 1;

                  -- Determine which of the two right (merging) metrics is the largest
                  -- and save the max/min values, plus the indexes of the max/min.
                  if( pRM_v(eR_0_v) < pRM_v(eR_1_v) ) then
                      dMinRM_v  := pRM_v(eR_0_v);
                      nMinEr_v  := eR_0_v;
                      dMaxRM_v  := pRM_v(eR_1_v);
                      nMaxEr_v  := eR_1_v;
                      u_hat_v   := '1';
                  else
                      dMinRM_v  := pRM_v(eR_1_v);
                      nMinEr_v  := eR_1_v;
                      dMaxRM_v  := pRM_v(eR_0_v);
                      nMaxEr_v  := eR_0_v;
                      u_hat_v   := '0';
                  end if;
                -- Check if our local max exceeds the current global max
                  if (dGlobalMax_v < dMaxRM_v) then
                     dGlobalMax_v := dMaxRM_v;
                     if (MaxMax_v < dMaxRM_v) then
                        MaxMax_v := dMaxRM_v;       -- used to check dynamic range to insure enough bits
                     end if;
                     nGlobal_sE_v := sE_v;
                  end if;
                  -- Check if our local min is below the current global min
                  if (dGlobalMin_v > dMinRM_v) then
                  -- We just need the value of the global min, we don't need to
                  -- know its index.
                      dGlobalMin_v := dMinRM_v;
                      if (MinMin_v > dMinRM_v) then
                        MinMin_v := dMinRM_v;
                      end if;
                  end if;
                  -- For the new value of the AM at the ending state, save the right
                  -- (merging) metric with the local max value
                  pAM_v(sE_v) := dMaxRM_v;

                  -- Compute the difference between the local max and min
                  dDelta_v := resize(dMaxRM_v - dMinRM_v, dDelta_v, fixed_wrap, fixed_truncate);
                  -- Using the terminology of (1), we call the max path "Path1" and
                  -- the min path "Path2."

               -- Loop back along Path1 and Path2, compare their u data, and update
               -- the reliability info accordingly. If their u's are different, use
                  -- (1, Eq. (7)) to update L. If their u's are the same, use
                  -- (1, Eq. (8)) to make the update.
                  -- pPath1    = pRu  + nMaxEr*nTbLen;
                  -- pPath1L   = pRLu + nMaxEr*nTbLen;
                  -- pPath2    = pRu  + nMinEr*nTbLen;
                  -- pPath2L   = pRLu + nMinEr*nTbLen;
                  -- pUpdatedL = pALu + sE*nTbLenPlus1;
                  for j in 0 to nTbLen - 1 loop
                     if(pRu_v(nMaxEr_v)(j) /= pRu_v(nMinEr_v)(j)) then  -- if(pPath1[j] != pPath2[j])
                        -- Case A: u^1 != u^2     (1, Eq. (7))
                        pALu_v(sE_v, j) := minimum(dDelta_v, pRLu_v(nMaxEr_v, j)); -- pUpdatedL[j] = MIN(dDelta,pPath1L[j]);
                     else
                        -- Case B: u^1 == u^2     (1, Eq. (8))
                        pALu_v(sE_v, j) := minimum(resize(dDelta_v + pRLu_v(nMinEr_v, j), pALu_v(0, 0)), pRLu_v(nMaxEr_v, j)); -- pUpdatedL[j] = MIN(dDelta + pPath2L[j], pPath1L[j]);
                     end if;
                  end loop;

                  -- The newest reliability entry is simply set to dDelta
                  -- for(j=j;j<nTbLenPlus1;++j)
                  -- {
                     pALu_v(sE_v, nTbLenPlus1-1) := resize(dDelta_v, pALu_v(0, 0));
                  -- }

                  -- Copy the hard values from the local survivor and set the newest
                     -- entry to the max edge's info bit, u_hat.
                  pAu_v(sE_v)(0 to nTbLen-1) := pRu_v(nMaxEr_v); --memcpy(pAu + sE*nTbLenPlus1, pPath1, nTbLen*sizeof(pAu(0)));
                  pAu_v(sE_v)(nTbLenPlus1-1) := u_hat_v;
               end loop;
 --              Mode        <= REVERSE;
               MaxMax      <= MaxMax_v;
               MinMin      <= MinMin_v;
               pAM         <= pAM_v;
               pRM         <= pRM_v;
               pRu         <= pRu_v;
               pRLu        <= pRLu_v;
               pALu        <= pALu_v;
               pAu         <= pAu_v;
               dGlobalMax  <= dGlobalMax_v;
               dGlobalMin  <= dGlobalMin_v;
               nGlobal_sE  <= nGlobal_sE_v;

               EuI_Dly     <= EuI_Dly(nTbLen - 1 downto 0) & EuIsf;

               -- out is ±(ALu) - EuI depending on hat
               EuO      <= to_slv(resize(pALu(nGlobal_sE, 0) - EuI_Dly(nTbLen), EuIsf, fixed_wrap, fixed_truncate))
                  when (pAu(nGlobal_sE)(0)) else
                  to_slv(resize(-pALu(nGlobal_sE, 0) - EuI_Dly(nTbLen), EuIsf, fixed_wrap, fixed_truncate));

               Magnitude<= to_slv(resize(pALu(nGlobal_sE, 0), SfixSova'left+1, SfixSova'right));
               uHat     <= pAu(nGlobal_sE)(0);
               IndexOut_u <= tDelayDly;
               ValidOut <= '1' when (t > nTbLen) else '0';  -- use t to get first index of 0
               t        <= t + 1;
               if (t = FrameLast) then
 --                 GlobSeOffset <= 1;
                  Mode         <= REVERSE;
               end if;
           when REVERSE =>
               -- out is ±(ALu) - EuI depending on hat
               EuO      <= to_slv(resize(pALu(0, GlobSeOffset) - EuI_Dly(nTbLen), EuIsf, fixed_wrap, fixed_truncate))
                  when (pAu(0)(GlobSeOffset) = '1') else
                  to_slv(resize(-pALu(0, GlobSeOffset) - EuI_Dly(nTbLen), EuIsf, fixed_wrap, fixed_truncate));

               Magnitude    <= to_slv(resize(pALu(0, GlobSeOffset), SfixSova'left+1, SfixSova'right));
               uHat         <= pAu(0)(GlobSeOffset);
               GlobSeOffset <= GlobSeOffset + 1;
               EuI_Dly      <= EuI_Dly(nTbLen - 1 downto 0) & EuIsf;
               IndexOut_u   <= tDelayDly;
               ValidOut     <= '1' when (tDelay < FrameLast - 2) else '0';
               t            <= t + 1;
               if ( tDelayDly = FrameLast) then
                  Mode <= HALTING; -- delay one clock to settle
               end if;
            when HALTING =>
               Mode <= IDLE;
               IndexOut_u <= 0;
            end case;
         end if;
      end if;
   end process ClkProcess;

END rtl;
