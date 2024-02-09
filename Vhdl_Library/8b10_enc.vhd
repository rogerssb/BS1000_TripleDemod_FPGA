-------------------------------------------------------------------------------
--
-- Title	: 8b/10b Encoder
-- Design	: 8-bit to 10-bit Encoder
-- Project	: 8000 - 8b10b_encdec
-- Author	: Ken Boyette
-- Company	: Critia Computer, Inc.
--
-------------------------------------------------------------------------------
--
-- File			: 8b10b_enc.vhd
-- Version		: 1.0
-- Generated	: 09.15.2006
-- By			: Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description :
--	This module provides 8-bit to 10-bit encoding.
--	It accepts 8-bit parallel data input and generates 10-bit encoded data
--	output in accordance with the 8b/10b standard.  This coding method was
--	described in the 1983 IBM publication "A DC-Balanced, Partitioned-Block,
--	8B/10B Transmission Code" by A.X. Widmer and P.A. Franaszek and was granted
--	a U.S. Patent #4,486,739 in 1984 which has now expired.
--
--		The parallel 8-bit Binary input represent 256 possible values, called
--		characters.
--		The bits are identified as:
--			HI, GI, FI, EI, DI, CI, BI, AI (Most Significant to Least)
--		The	output is a 10-bit encoded character whose bits are identified as:
--			AO, BO, CO, DO, EO, IO, FO, GO, HO, JO (Least Significant to Most)
--		An additional 12 output characters, K, are defined for command and
--		synchronization use.
--		KI, is used to indicate that the input is for a special character.
--		All inputs and outputs are synchronous with an externally supplied
--		byte rate clock BYTECLK.
--		The encoded output is valid one clock after the input.
--		There is a reset input, RESET, to reset the logic.  The next rising
--		BYTECLK after RESET is deasserted latches valid input data.
--
--		Note: This VHDL structure closely follows the discrete logic defined
--		in the original article and the subsequent patent.
--		The Figures referenced are those in the patent.
-------------------------------------------------------------------------------
--		This program is licensed under the GPL.
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity enc_8b10b is
    port(
		RESET,                           	-- Global asynchronous reset (active high)
		CLK,                        	      -- Master synchronous send byte clock
		KI          : in std_logic ;			-- Control (K) input(active high)
      DataIn      : in std_logic_vector(7 downto 0);
      DataOut     : out std_logic_vector(9 downto 0)
	    );
end enc_8b10b;

architecture behavioral of enc_8b10b is

-- Signals to tie things together
	signal   L40, L04, L13, L31, L22,                           -- Figure 3 Signals
            S, FNEG,                           -- Figure 4 Signals
            NAO, NBO, NCO, NDO, NEO, NIO,                      -- Figure 7 Signals
            NFO, NGO, NHO, NJO, SINT,                          -- Figure 8

            AI, BI, CI, DI, EI, FI, GI, HI,                    -- Unencoded input data
	         JO, HO, GO, FO, IO, EO, DO, CO, BO, AO : std_logic; -- Encoded out

begin

   AI <= DataIn(0);
   BI <= DataIn(1);
   CI <= DataIn(2);
   DI <= DataIn(3);
   EI <= DataIn(4);
   FI <= DataIn(5);
   GI <= DataIn(6);
   HI <= DataIn(7);

   DataOut(9) <= JO;
   DataOut(8) <= HO;
   DataOut(7) <= GO;
   DataOut(6) <= FO;
   DataOut(5) <= IO;
   DataOut(4) <= EO;
   DataOut(3) <= DO;
   DataOut(2) <= CO;
   DataOut(1) <= BO;
   DataOut(0) <= AO;

		--
	-- 5b Input Function (Reference: Figure 3)
	--
	-- Four 1's
	L40 <= 	AI and BI and CI and DI ;					-- 1,1,1,1
	-- Four 0's
	L04 <= 	not AI and not BI and not CI and not DI ;	-- 0,0,0,0
	-- One 1 and three 0's
	L13 <=	(not AI and not BI and not CI and DI)		-- 0,0,0,1
			or (not AI and not BI and CI and not DI)	-- 0,0,1,0
			or (not AI and BI and not CI and not DI)	-- 0,1,0,0
			or (AI and not BI and not CI and not DI) ;	-- 1,0,0,0
	-- Three 1's and one 0
	L31 <=	(AI and BI and CI and not DI)			-- 1,1,1,0
			or (AI and BI and not CI and DI)		-- 1,1,0,1
			or (AI and not BI and CI and DI)		-- 1,0,1,1
			or (not AI and BI and CI and DI) ;		-- 0,1,1,1
	-- Two 1's and two 0's
	L22 <=	(not AI and not BI and CI and DI)		-- 0,0,1,1
			or (not AI and BI and CI and not DI)	-- 0,1,1,0
			or (AI and BI and not CI and not DI)	-- 1,1,0,0
			or (AI and not BI and not CI and DI)	-- 1,0,0,1
			or (not AI and BI and not CI and DI)	-- 0,1,0,1
			or (AI and not BI and CI and not DI) ;	-- 1,0,1,0
	--
    -- 3b Input Function (Reference: Figure 4)
	--
   S <= (L31 and DI and not EI);
	-- Intermediate term for "FI is Not Equal to GI"
	FNEG	<=  FI xor GI ;
	--
	-- 5b/6b Encoder - Figure 7
	--
	-- Logic for non-complimented (Normal) A,B,C,D,E,I outputs
	NAO <= AI ;
	NBO <= L04
		or (BI and not L40) ;
	NCO <= CI
		or L04
		or (L13 and DI and EI) ;
	NDO <= (DI and not L40) ;
	NEO <= (EI and not (L13 and DI and EI))
		or (L13 and not EI) ;
	NIO <= (L22 and not EI)
		or (L04 and EI)
		or (L13 and not DI and EI)
		or (L40 and EI)
		or (L22 and KI) ;
	--
	-- 3b/4b Encoder - Figure 8
	--
	-- Logic for the non-complimented F,G,H,J outputs
	SINT <= (S and FI and GI and HI)
		or (KI and FI and GI and HI) ;
	NFO <= (FI and not SINT) ;
	NGO <= GI
		or (not FI and not GI and not HI) ;
	NHO <= HI ;
	NJO <= SINT
		or (FNEG and not HI) ;

	ENCLATCH: process (RESET, CLK)
	begin
		if RESET = '1' then
			AO <= '0' ;
			BO <= '0' ;
			CO <= '0' ;
			DO <= '0' ;
			EO <= '0' ;
			FO <= '0' ;
			GO <= '0' ;
			HO <= '0' ;
			JO <= '0' ;
			IO <= '0' ;
		elsif rising_edge(CLK) then
			AO <= NAO ;	-- Least significant bit 0
			BO <= NBO ;
			CO <= NCO ;
			DO <= NDO ;
			EO <= NEO ;
			FO <= NFO ;	-- Least significant bit 7
			GO <= NGO ;
			HO <= NHO ;
			IO <= NIO ;	-- Most significant bit 6
			JO <= NJO ;	-- Most significant bit 10
		end if;
	end process ENCLATCH;

end behavioral;

