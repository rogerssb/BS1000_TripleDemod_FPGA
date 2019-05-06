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

Module Name: TestPieces.vhd
Description:
   Top level netlist and clock generation.

ARGUMENTS :


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
9-6-16 Initial release FZ
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.math_real.all;
library std;
use std.textio.all;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY TestPieces IS
   PORT(
      adc_dco_p,
      adc_dco_n         : IN  std_logic;
      Blink             : OUT std_logic   -- I'm alive Blinking LED
   );
END TestPieces;


ARCHITECTURE rtl OF TestPieces IS

-- TODO remove component
   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;      -- only used to scale file readings
         ADDR_WIDTH  : natural   := 9;
         FILE_IS_SLV : boolean   := true;    -- nonSLV files are not synthesizable
         LATENCY     : positive  := 1;
         RAM_TYPE    : string    := "block"  -- or "distributed"
      );
      PORT(
         clk,
         ce,
         reset,
         WrEn           : IN  std_logic;
         WrAddr,
         RdAddrA,
         RdAddrB        : IN  natural range 0 to 2**ADDR_WIDTH-1;
         WrData         : In  std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
         RdOutA,
         RdOutB         : OUT std_logic_vector(DATA_WIDTH-1 DOWNTO 0)
      );
   END COMPONENT RAM_2Reads_1Write;

   COMPONENT Decimate512By64 IS
     PORT(
         clk,
         ce,
         reset,
         StartIn        : IN  std_logic;
         X_In           : IN  FLOAT_16_HP;
         Y_Out          : OUT FLOAT_ARRAY_16_HP(0 to 7);
         Done           : OUT std_logic
      );
   END COMPONENT Decimate512By64;

   COMPONENT DFT_Search IS
      GENERIC(
         NDX         : integer := 32
      );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         X_r,
         X_i            : IN  FLOAT_16_LP;
         IndexIn        : IN  sfixed(12 downto -19);
         IndexOffset    : IN  FLOAT_1K;
         Start,
         NextCycle      : IN  std_logic;
         Magnitude      : OUT FLOAT_1K;
         IndexOut       : OUT sfixed(12 downto -19);
         Done           : OUT std_logic
      );
   END COMPONENT DFT_Search;

   COMPONENT DFT IS
         GENERIC(
            NDX         : integer := 32   -- Only calculate non-zero samples
         );
      PORT(
         clk            : IN  std_logic;
         reset          : IN  std_logic;
         ce             : IN  std_logic;
         X_r,
         X_i            : IN  FLOAT_16_HP;
         IndexIn        : IN  sfixed(12 downto -19);
         StartIn        : IN  std_logic;
         Magnitude      : OUT FLOAT_1K;
         Done           : OUT std_logic
      );
   END COMPONENT DFT;

   COMPONENT vio_0
      PORT (
         clk : IN STD_LOGIC;
         probe_out0 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out1 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out2 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out3 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out4 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out5 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         probe_out6 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
         probe_out7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         probe_out8 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
      );
   END COMPONENT vio_0;

   type DFT_Mode_t is (Idle, ScanDFT);
  -- Signals
   SIGNAL   VIO_Bits          : std_logic_vector(7 downto 0);
   SIGNAL   PilotSyncOffset   : std_logic_vector(11 downto 0);
   SIGNAL   ce,
            clk,
            reset,
            ValidIn,
            DFT_Start,
            DoneDec64         : std_logic;
   SIGNAL   DFT_Mode          : DFT_Mode_t;
   SIGNAL   DFT_Index         : sfixed(12 downto -19);
   SIGNAL   FreqResolution,
            OneOverFreqRes,
            OneOverFreqAmb,
            IndexP125K,
            IndexN125K,
            TSample           : std_logic_vector(17 downto 0);
   signal   LedFlash          : unsigned(27 downto 0);
   signal   Float16HP         : FLOAT_16_HP;
   SIGNAL   PilotTempDown3R   : FLOAT_ARRAY_16_HP(0 to 7);
   SIGNAL   StartRead,
            ResetBrik2,
            ValidRead         : std_logic;
   SIGNAL   VarsReal,
            VarsImag          : std_logic_vector(17 downto 0);
   SIGNAL   DFT_ValueOut      : FLOAT_1K;
   SIGNAL   PacketCount,
            SampleCount,
            DFT_Count,
            PromAddr          : natural;
   SIGNAL   Dones             : uint8slv := x"00";
   SIGNAL   DFT_InputsR       : FLOAT_ARRAY_16_HP(0 to 31) := (
                  to_sfixed( 0.000000, FLOAT_ZERO_16_HP), to_sfixed(-0.000006, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.003577, FLOAT_ZERO_16_HP), to_sfixed( 0.011317, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.354227, FLOAT_ZERO_16_HP), to_sfixed(-0.607417, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.697905, FLOAT_ZERO_16_HP), to_sfixed(-0.599427, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.342725, FLOAT_ZERO_16_HP), to_sfixed(-0.566244, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.520279, FLOAT_ZERO_16_HP), to_sfixed(-0.409998, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.254544, FLOAT_ZERO_16_HP), to_sfixed(-0.469275, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.361163, FLOAT_ZERO_16_HP), to_sfixed(-0.137486, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.108244, FLOAT_ZERO_16_HP), to_sfixed( 0.233191, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.227510, FLOAT_ZERO_16_HP), to_sfixed( 0.174891, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.275008, FLOAT_ZERO_16_HP), to_sfixed( 0.300126, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.475990, FLOAT_ZERO_16_HP), to_sfixed( 0.515043, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.411119, FLOAT_ZERO_16_HP), to_sfixed( 0.709910, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.660273, FLOAT_ZERO_16_HP), to_sfixed( 0.517637, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.423571, FLOAT_ZERO_16_HP), to_sfixed( 0.653630, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.653832, FLOAT_ZERO_16_HP), to_sfixed( 0.453273, FLOAT_ZERO_16_HP) );
   SIGNAL   DFT_InputsI       : FLOAT_ARRAY_16_HP(0 to 31) := (
                  to_sfixed( 0.000000, FLOAT_ZERO_16_HP), to_sfixed( 0.000000, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.001734, FLOAT_ZERO_16_HP), to_sfixed( 0.006664, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.158219, FLOAT_ZERO_16_HP), to_sfixed( 0.301652, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.153948, FLOAT_ZERO_16_HP), to_sfixed(-0.049169, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.228874, FLOAT_ZERO_16_HP), to_sfixed(-0.428584, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.407292, FLOAT_ZERO_16_HP), to_sfixed(-0.316401, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.371230, FLOAT_ZERO_16_HP), to_sfixed(-0.466944, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.616842, FLOAT_ZERO_16_HP), to_sfixed(-0.585524, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.398699, FLOAT_ZERO_16_HP), to_sfixed(-0.670836, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.620304, FLOAT_ZERO_16_HP), to_sfixed(-0.487433, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.356330, FLOAT_ZERO_16_HP), to_sfixed(-0.590097, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.533457, FLOAT_ZERO_16_HP), to_sfixed(-0.310167, FLOAT_ZERO_16_HP),
                  to_sfixed(-0.013238, FLOAT_ZERO_16_HP), to_sfixed( 0.016191, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.025780, FLOAT_ZERO_16_HP), to_sfixed( 0.016625, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.152168, FLOAT_ZERO_16_HP), to_sfixed( 0.104293, FLOAT_ZERO_16_HP),
                  to_sfixed( 0.289015, FLOAT_ZERO_16_HP), to_sfixed( 0.394803, FLOAT_ZERO_16_HP) );

   attribute mark_debug : string;
   attribute mark_debug of VarsReal          : signal is "true";
   attribute mark_debug of StartRead   : signal is "true";
   attribute mark_debug of ValidRead   : signal is "true";
   attribute mark_debug of PilotTempDown3R : signal is "true";
   attribute mark_debug of PromAddr          : signal is "true";
   attribute mark_debug of SampleCount       : signal is "true";
   attribute mark_debug of PacketCount       : signal is "true";

BEGIN

   IBUFDS_inst : IBUFDS
   generic map (
      DQS_BIAS => "FALSE"  -- (FALSE, TRUE)
   )
   port map (
      I  => adc_dco_p,  -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
      IB => adc_dco_n,  -- 1-bit input: Diff_n buffer input (connect directly to top-level port)
      O  => clk     -- 1-bit output: Buffer output
   );

   reset <= VIO_Bits(7);
   ce <= '1';     -- no need to strobe ce at this point.
   Blink <= LedFlash(LedFlash'left);

   ValidProcess : process(clk) is
   begin
      if(rising_edge(clk)) then
         if (reset) then
            ValidIn <= '0';
         else
         end if;
      end if;
   end process ValidProcess;
   VIO_u : vio_0
      PORT MAP (
         clk => clk,
         probe_out0 => FreqResolution,
         probe_out1 => OneOverFreqRes,
         probe_out2 => OneOverFreqAmb,
         probe_out3 => IndexP125K,
         probe_out4 => IndexN125K,
         probe_out5 => TSample,
         probe_out6 => PilotSyncOffset,
         probe_out7 => VIO_Bits,
         probe_out8 => open
   );

   DFT_Process: process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            DFT_Count <= 0;
            DFT_Start <= '0';
            DFT_Index <= to_sfixed(2110.05, DFT_Index);
         else
            case (DFT_Mode) is
               when Idle =>
                  DFT_Start <= '1';
                  DFT_Mode <= ScanDFT;
               when ScanDFT =>
                  DFT_Start <= '0';
                  if (Dones(3)) then
                     DFT_Mode <= Idle;
                  elsif (DFT_Count < 31) then
                     DFT_Count <= DFT_Count + 1;
                  end if;
            end case;
         end if;
      end if;
   end process DFT_Process;

      DFT_u : DFT
         GENERIC MAP(
            NDX         => 32
         )
      PORT MAP (
         clk         => clk,
         reset       => reset,
         ce          => ce,
         X_r         => DFT_InputsR(DFT_Count),
         X_i         => DFT_InputsI(DFT_Count),
         IndexIn     => DFT_Index,
         StartIn     => DFT_Start,
         Magnitude   => DFT_ValueOut,  -- 28.8267
         Done        => Dones(3)
      );

   Dec64A_R : Decimate512By64
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => ResetBrik2,
         StartIn     => StartRead,
         X_In        => Float16HP,
         Y_Out       => PilotTempDown3R,  -- -0.305773, -0.44234, 0.369719, 0.173316, 0.217724, 0.163155, 0.328447, -0.0130386
         Done        => DoneDec64
      );


   ReadReal_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Users\frank.ziegler\Documents\GitHub\stcDemod/simData/PilotsOnly+1000_5%_R.slv",
         FILE_IS_SLV => true,
         DATA_WIDTH  => 18,
         BINPT       => -17,
         ADDR_WIDTH  => 12,
         LATENCY     => 1,
         RAM_TYPE    => "distributed"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => PromAddr,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => VarsReal,
         RdOutB      => open
      );

   ReadImag_u : RAM_2Reads_1Write
      GENERIC MAP(
         FILENAME    => "C:\Users\frank.ziegler\Documents\GitHub\stcDemod/simData/PilotsOnly+1000_5%_I.slv",
         FILE_IS_SLV => true,
         DATA_WIDTH  => 18,
         BINPT       => -17,
         ADDR_WIDTH  => 12,
         LATENCY     => 1,
         RAM_TYPE    => "distributed"
      )
      PORT MAP(
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => '0',
         WrAddr      => 0,
         RdAddrA     => PromAddr,
         RdAddrB     => 0,
         WrData      => (others=>'0'),
         RdOutA      => VarsImag,
         RdOutB      => open
      );

   StartProcess : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            PacketCount <= 0;
            SampleCount <= 12600;
            PromAddr    <= 0;
            StartRead   <= '0';
            ValidRead   <= '0';
            ResetBrik2  <= '0';
            LedFlash    <= (others=>'0');
         elsif (ce) then
            LedFlash <= LedFlash + 1;
            Float16HP <= to_sfixed(VarsReal & 7x"0", Float16HP);
            if (SampleCount < 512) and (PromAddr < 4095) then
               PromAddr <= PromAddr + 1;
            elsif (PromAddr = 4095) then  -- last frame, restart
               PacketCount <= 0;
               PromAddr    <= 0;
            end if;
            if (SampleCount < 12700) then -- wait long enough to process Freq Est
               SampleCount <= SampleCount + 1;
            else
               SampleCount <= 0;
               PacketCount <= PacketCount + 1;
            end if;
            StartRead <= '1' when (SampleCount = 12650) else '0';
            ValidRead <= '1' when (SampleCount < 520) else '0';   -- Time needs three more samples to fill buffer, emulates non-pilot packets of overflow
            ResetBrik2 <= '1' when (SampleCount >= 12625) and (SampleCount < 12630) and (PacketCount = 0) else '0';
         end if;
      end if;
   end process StartProcess;

END rtl;
