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

Module Name: TurboDecodr.vhd
Description: Top level of Turbo code processing. Runs in three loops.
   First loop captures the raw data and calculates the PCI A/B data and
   defines the eCA/B data based on the Rate.
   The second loop sends the stored data to the SovaMex in A mode. The
   calculated EuOA data is multplied by 3/4 and stored in Ram in interleaved
   mode.
   The third loop calculates EuOB with the SovaMex in B mode and again the
   calculated data is multiplied by 3/4 and stored.
   The B data is then fed back to the A mode

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
Library UNISIM;
use UNISIM.vcomponents.all;
Library xpm;
use xpm.vcomponents.all;
use work.fixed_pkg.all;
USE work.Semco_pkg.ALL;

ENTITY TurboDecoder IS
      GENERIC(
         FILE_LOC    : string := "./";
         DATA_WIDTH  : positive := 8
      );
   PORT(
      Clk,                             -- 93.3MHz Clock. I divide this by three for internal processing
      Reset,
      ch0En,
      ch1En          : IN  std_logic;  -- Valid data is active.
      Ch0Data,
      Ch1Data        : IN  std_logic_vector(DATA_WIDTH-1 downto 0);  -- soft decision bit sync output
      Iterations     : IN  std_logic_vector(3 downto 0);  -- usually 10, upto 15
      BitSyncMode    : IN  std_logic_vector(1 downto 0);  -- 00 single, 01 individual, 10 QPSK, 11 OQPSK
      Rate,                                               -- (2, 3, 4 or 6) skip 5
      Frame          : IN  std_logic_vector(2 downto 0);  -- 1784*(1,2,4 or 5) skip 3
      ClkPerBit      : IN  std_logic_vector(15 downto 0); -- Data spreading count. Slightly less than 93.3/BR out
      AsmFrameParm   : IN  std_logic_vector(31 downto 0); -- ASM Frame Sync Parameters FlyWheel(4:0), Verifies(4:0), OOL_BET(4:0), IL_BET(4:0), BitSlips(1:0)
      IterationCntr  : OUT std_logic_vector(3 downto 0);  -- test point, Current Iteration
      DataOut        : OUT std_logic_vector(SfixSova'length-1 downto 0); -- test point, soft data output
      Magnitude      : OUT std_logic_vector(SfixSova'length downto 0); -- test point, signal magnitude
      uHat,                                               -- test point, Bit Out per iteration. used to see progress
      SyncOut,                                            -- test point, one cycle end of iteration
      ValidOut,                                           -- test point, uHat valid
      BitOut,                                             -- actual data output
      BitClk,                                             -- spread 50% duty cycle gated clock output
      BitOutEn      : OUT std_logic                       -- bit en spread over ClkPerBit time
   );
END TurboDecoder;


ARCHITECTURE rtl OF TurboDecoder IS

   Component TurboASM IS
      GENERIC(
         DATA_WIDTH  : positive := 8
      );
      PORT (
         Clk,
         Reset,
         Valid0,
         Valid1         : IN  std_logic;
         Data0,               -- Data0 is first in SOQPSK mode but both show together
         Data1          : IN  std_logic_vector(DATA_WIDTH-1 downto 0);  -- soft decision bit sync output
         Frame,
         Rate           : IN  std_logic_vector(2 downto 0);
         ModMode,               -- 00 = BPSK, 01 = dual independent, ignore as 00, 10 = QPSK, 11 = SOQPSK
         BitSlips       : IN  std_logic_vector(1 downto 0);
         IL_BET,                                             -- In Lock Bit Error Threshold. Allowed number of invalid bits
         OOL_BET,                                            -- Out of Lock Bit Error Threshold.
         Verifies,                                           -- number of valid frames before lock declared
         FlyWheels      : IN  std_logic_vector(4 downto 0);  -- number of invalid frames before lock lossed
         SyncOut,
         InvertOdd,
         InvertEven,
         ValidOut       : OUT std_logic;
         DataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)  -- soft decision invert corrected data
   );   END Component TurboASM;

   Component TurboFE IS
      GENERIC(
         DATA_WIDTH  : positive := 8
      );
      PORT(
         Clk,
         ce,
         SyncIn,
         ValidIn        : IN  std_logic;
         Rate           : IN  integer range 0 to 6;
         DataIn         : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
         PCIA           : OUT SFIX_PCI_ARRAY(0 to 15);
         PCIB           : OUT SFIX_PCI_ARRAY(0 to 3);
         eCA,
         eCB            : OUT UINT4_ARRAY(0 to 31);
         ValidOut       : OUT std_logic
      );
   END COMPONENT TurboFE;

   COMPONENT IT_DT IS
      GENERIC(
            FILE_LOC    : string := ""
         );
      PORT(
         Clk,
         ce,
         Reset          : IN  std_logic;
         IT_Addr,
         DT_Addr        : IN  natural range 0 to 8924;
         Frame          : IN  natural range 0 to 5;  -- 1784*(1,2,4 or 5) skip 3
         IT_Data,
         DT_Data        : OUT natural range 0 to 8919
      );
   END COMPONENT IT_DT;

   COMPONENT SovaMex is
      Port (
         Clk,
         ce,
         Reset,
         ValidIn     : IN std_logic;
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
   END COMPONENT SovaMex;

   -- constants
   constant FRAME_SIZE  : int_array(0 to 5) := (1784, 1*1784, 2*1784, 3*1784, 4*1784, 5*1784);
   constant ZERO_PACK_LAST_4 : integer := 4;
   constant FIFO_RST_CNT : integer := 40;
   constant PCIA_RIGHT : integer := SfixPci'length*16-1;
   constant PCIB_RIGHT : integer := SfixPci'length*4-1;

   type EuORam_t  is array (0 to 8924) of SfixSova;
   type MagRam_t  is array (0 to 8924) of sfixed(Magnitude'left downto Magnitude'right);
   type PciaRam_t is array (0 to 8924) of STD_LOGIC_VECTOR(0 to PCIA_RIGHT);
   type PcibRam_t is array (0 to 8924) of STD_LOGIC_VECTOR(0 to PCIB_RIGHT);
   type BitRam_t  is array (0 to 8924) of STD_LOGIC_VECTOR(0 to 0);

   -- Signals
   SIGNAL   DivBy3Cntr,
            Frame_u,
            Rate_u         : natural range 0 to 6 := 0;
   SIGNAL   Iterations_u,
            IterationCntr_u : unsigned(3 downto 0);
   SIGNAL   NextFrame      : std_logic := '1';
   SIGNAL   FifoOut        : std_logic_vector(DATA_WIDTH downto 0);
   SIGNAL   DataAsm,
            FifoData       : std_logic_vector(DATA_WIDTH-1 downto 0);
   SIGNAL   FifoRdCount    : std_logic_vector(14 downto 0);
   SIGNAL   FrameCntr,
            PciaCntr,
            SovaIndexA,
            SovaIndexB,
            SovaIndexAB,
            DT_Addr,
            DT_AddrDly,
            IT_Addr,
            OutCntr        : integer range 0 to FRAME_SIZE(5) + 4;
   signal   ClkOutCnt      : integer range 0 to 255;
   SIGNAL   BitCntr        : natural range 0 to 65535;
   SIGNAL   SovaIndex      : STD_LOGIC_VECTOR(13 downto 0);
   SIGNAL   SovaReset,
            DivBy3,
            DivBy3In,
            Div31By2,
            Empty,
            FifoReadEn,
            FifoValid,
            FifoSyncIn,
            ValidAsm,
            SyncAsm,
            ValidFE,
            PreValidOut0,
            PreValidOut1,
            uHatB,
            BitSync,
            SyncOut31,
            SyncOutDly,
            ValidOut31,
            ValidOutDly,
            FrameFull,
            SovaActiveA,
            SovaActiveB,
            SovaReadyA,
            SovaReadyB,
            SovaReady,
            SovaValidOut,
            SovaValidOutA,
            SovaValidOutB  : std_logic;
   signal   InputDly       : vector_of_slvs(FIFO_RST_CNT-1 downto 0)(DATA_WIDTH downto 0) := (others=>(others=>'0'));
   signal   ValidDly       : std_logic_vector(FIFO_RST_CNT-1 downto 0) := (others=>'0');
   signal   PCIA           : SFIX_PCI_ARRAY(0 to 15);
   signal   PCIB           : SFIX_PCI_ARRAY(0 to 3);
   signal   PCI,
            PCIA_Read      : STD_LOGIC_VECTOR(0 to SfixPci'length*16-1);
   signal   PCIB_Read      : STD_LOGIC_VECTOR(0 to SfixPci'length*4-1);
   signal   PCIA_Ram       : PciaRam_t;
   signal   PCIB_Ram       : PcibRam_t;
   signal   eC             : STD_LOGIC_VECTOR(32*4-1 downto 0);
   signal   eCA,
            eCB            : UINT4_ARRAY(0 to 31);
   signal   EuIA_Ram,
            EuIB_Ram       : EuORam_t;
-- synthesis translate_off
   signal   MagRam         : MagRam_t;
-- synthesis translate_on
   signal   Mag            : STD_LOGIC_VECTOR(Magnitude'length-1 downto 0);
   signal   uHatRam,
            BitRam         : BitRam_t;
   signal   EuI,
            EuIA,
            EuOA,
            EuOB,
            EuIBReg,
            EuIAReg        : SfixSova;
   signal   EuO            : STD_LOGIC_VECTOR(SfixSova'length-1 downto 0);
   signal   OutFifoCnt     : STD_LOGIC_VECTOR(13 downto 0);
   signal   IT_Data,
            DT_Data        : natural range 0 to 8919;
   signal   uHatRamSlv,
            BitOutSlv      : std_logic_vector(0 to 0);
   signal   FrameLast      : integer range FRAME_SIZE(1) - 1 to FRAME_SIZE(5) + 4;

   signal   PCI01      : STD_LOGIC_VECTOR(0 to SfixPci'length*2-1);
   signal   EuI_Slv        : STD_LOGIC_VECTOR(SfixSova'length-1 downto 0);
   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of Ch0Data, ch0En, BitOut, BitOutEn, PCI01,
             SovaReady, SovaActiveA, SovaActiveB, EuI_Slv, EuO, SovaValidOut, uHatB : signal is "true";

BEGIN
EuI_Slv <= to_slv(EuI);
PCI01   <= PCI(0 to sfixPci'length*2-1);

   Rate_u    <= to_integer(unsigned(Rate));
   Frame_u   <= to_integer(unsigned(Frame));
   FrameLast <= FRAME_SIZE(Frame_u) - 1 + ZERO_PACK_LAST_4;
   Iterations_u <= unsigned(Iterations);
   IterationCntr  <= std_logic_vector(IterationCntr_u);

   DivBy3Proc : process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            DivBy3Cntr <= 0;
         elsif(DivBy3Cntr < 2) then
            DivBy3Cntr  <= DivBy3Cntr + 1;
            DivBy3In    <= '0';
         else
            DivBy3Cntr <= 0;
            DivBy3In   <= '1';
         end if;
      end if;
   end process DivBy3Proc;

   DivBy3Buf : bufg
      PORT MAP(
         i => DivBy3In,
         o => DivBy3
   );

   ASM : TurboASM
      GENERIC MAP (
         DATA_WIDTH  => DATA_WIDTH
      )
      PORT MAP(
         Clk         => Clk,  -- Clk93
         Reset       => Reset,
         Valid0      => ch0En,
         Valid1      => ch1En,
         Data0       => ch0Data,
         Data1       => ch1Data,
         Rate        => Rate,
         Frame       => Frame,
         ModMode     => BitSyncMode,
         BitSlips    => AsmFrameParm(1 downto 0),     -- 2x"2",
         IL_BET      => AsmFrameParm(6 downto 2),     -- 5x"08",
         OOL_BET     => AsmFrameParm(11 downto 7),    -- 5x"10",
         Verifies    => AsmFrameParm(16 downto 12),   -- 5x"03",
         FlyWheels   => AsmFrameParm(21 downto 17),   -- 5x"08",
         SyncOut     => SyncAsm,
         InvertOdd   => open,
         InvertEven  => open,
         ValidOut    => ValidAsm,
         DataOut     => DataAsm
      );

   FifoDelayProc : process(Clk) -- Clk93
   begin
      if (rising_edge(Clk)) then
         InputDly <= InputDly(InputDly'left-1 downto 0) & (DataAsm & SyncAsm);
         ValidDly <= ValidDly(ValidDly'left-1 downto 0) & (ValidAsm or SyncAsm);
      end if;
   end process FifoDelayProc;

   Fifo_A : xpm_fifo_sync  -- other ports are available but use defaults
   generic map (

      FIFO_WRITE_DEPTH         => 32768,         --positive integer
      WRITE_DATA_WIDTH         => DATA_WIDTH+1,     --positive integer
      WR_DATA_COUNT_WIDTH      => 15,               --positive integer
      READ_MODE                => "fwft",           --string; "std" or "fwft";
      FIFO_READ_LATENCY        => 0,                --positive integer;
      READ_DATA_WIDTH          => DATA_WIDTH+1,     --positive integer
      RD_DATA_COUNT_WIDTH      => 15,               --positive integer
      WAKEUP_TIME              => 0                 --positive integer; 0 or 2;
   )
   port map (
      rst              => Reset,
      wr_clk           => Clk, --Clk93,
      wr_en            => ValidDly(ValidDly'left),
      din              => InputDly(InputDly'left),
      rd_en            => FifoValid,
      dout             => FifoOut,
      empty            => Empty,
      rd_data_count    => FifoRdCount,
      sleep            => '0',
      injectsbiterr    => '0',
      injectdbiterr    => '0'
   );

   FifoData   <= FifoOut(DATA_WIDTH downto 1);
   FIfoSyncIn <= FifoOut(0);

   DivBy2Proc : process(Clk)   -- Clk31,  Give FIFO time to propagate when not empty
   begin
      if (rising_edge(Clk)) then
         if (DivBy3) then
            if (or(FifoRdCount)) then
               Div31By2 <= not Div31By2;
            else
               Div31By2 <= '1';
            end if;
         end if;
      end if;
   end process DivBy2Proc;

   FrontEnd : TurboFE
      GENERIC MAP(
         DATA_WIDTH  => DATA_WIDTH
      )
      PORT MAP(
         Clk         => Clk, -- Clk31,
         ce          => '1',
         SyncIn      => FifoSyncIn or NextFrame,
         ValidIn     => FifoValid and not FifoSyncIn,
         Rate        => to_integer(unsigned(Rate)),
         DataIn      => FifoData,
         PCIA        => PCIA,
         PCIB        => PCIB,
         eCA         => eCA,
         eCB         => eCB,
         ValidOut    => ValidFE
      );

   IT_DT_Data : IT_DT
      GENERIC MAP(
         FILE_LOC    => FILE_LOC
      )
      PORT MAP(
         Clk      => Clk, -- Clk31,
         ce       => DivBy3 and FrameFull,
         Reset    => NextFrame,
         IT_Addr  => IT_Addr,
         DT_Addr  => DT_Addr,
         Frame    => Frame_u,
         IT_Data  => IT_Data,
         DT_Data  => DT_Data
   );

   FifoReadEnProcess : process(Clk)
   begin
      if (rising_edge(Clk)) then
         if (Reset) then
            FifoReadEn     <= '1';
         elsif ((FifoSyncIn and not FrameFull) or NextFrame) then   -- if SyncIn and not busy, or continue NextFrame
            FifoReadEn     <= '1';
         elsif (FifoSyncIn and FrameFull) then
            FifoReadEn <= '0';        -- if Sync and not ready, stop reading till this frame is processed
         end if;
      end if;
   end process FifoReadEnProcess;

   FrameProcess : process(Clk) -- Clk31
      variable PCIA_Concat : std_logic_vector(SfixPci'length*16-1 downto 0);
      variable PCIB_Concat : std_logic_vector(SfixPci'length*4 -1 downto 0);
   begin
      if (rising_edge(Clk)) then
         if (Reset or (FifoSyncIn and not FrameFull) or NextFrame) then   -- if SyncIn and not busy, or continue NextFrame
            FrameCntr      <= 0;
            PciaCntr       <= 0;
            IT_Addr        <= 0;
            DT_Addr        <= 0;
            Magnitude      <= (others=>'0');
            IterationCntr_u  <= "0000";
            NextFrame      <= '0';
            BitSync        <= '0';
            FrameFull      <= '0';
            SovaActiveA    <= '0';
            SovaActiveB    <= '0';
            ValidOut31     <= '0';
            SyncOut31      <= '0';
            PreValidOut0   <= '0';
            PreValidOut1   <= '0';
         elsif (DivBy3) then
            if (ValidFE and not FrameFull) then  -- ignore trailing data
               for n in 0 to 15 loop
                  PCIA_Concat(SfixPci'length*(n+1)-1 downto SfixPci'length*n) := to_slv(PCIA(15-n));
               end loop;
               PCIA_Ram(FrameCntr) <= PCIA_Concat;
               for n in 0 to 3 loop
                  PCIB_Concat(SfixPci'length*(n+1)-1 downto SfixPci'length*n) := to_slv(PCIB(3-n));
               end loop;
               PCIB_Ram(FrameCntr) <= PCIB_Concat;

               if (FrameCntr = FrameLast + 1) then
                  FrameFull   <= '1';
                  SovaActiveA <= '1';
               else
                  FrameCntr <= FrameCntr + 1;
               end if;
            end if;

            if (SovaIndexAB = FrameLast - 4) then
               PciaCntr <= 0; -- preset for next iteration
            elsif (SovaIndexAB = FrameLast) then
               if (SovaActiveA) then     -- done first loop, run second
                  if (IterationCntr_u = Iterations_u) then -- Iterations - 1, we're done
                     SovaActiveA <= '0';
                     SovaActiveB <= '0';
                     NextFrame   <= '1';  -- setting NextFrame resets most system values
                     FrameFull   <= '0';
                  else
                     SovaActiveA <= '0';
                     SovaActiveB <= '1';
                  end if;
                  SyncOut31  <= '1';
               else  -- if SovaActiveB               -- next iteration
                  SovaActiveA  <= '1';
                  SovaActiveB  <= '0';
                  IterationCntr_u <= IterationCntr_u + 1;
                  PreValidOut0 <= '1';
                  SyncOut31 <= '0';
               end if;
            elsif (FrameFull and SovaReady) then
               PciaCntr <= PciaCntr + 1;
               SyncOut31 <= '0';
            end if;

            if (SovaActiveB or not FrameFull) then
               DT_Addr <= 0;
            elsif ((SovaReadyA = '1') and (SovaActiveA = '1') and (DT_Addr < FrameLast)) then
               DT_Addr <= DT_Addr + 1;
               if (DT_Addr < FRAME_SIZE(Frame_u) - 1) then
                  PreValidOut0 <= '1';
               end if;
            else
               PreValidOut0 <= '0';
            end if;

            PreValidOut1 <= PreValidOut0;    -- allow ram read of DT data
            ValidOut31   <= PreValidOut1;
            DT_AddrDly   <= DT_Addr;

            if (DT_Addr < FRAME_SIZE(Frame_u)) then
               EuIAReg   <= EuIA_Ram(DT_Data);
               uHat      <= uHatRam(DT_Data)(0);
-- synthesis translate_off
               Magnitude <= to_slv(MagRam(DT_Data));
-- synthesis translate_on
               if (IterationCntr_u = Iterations_u) then   -- only latch the last iteration data
-- done below     BitRam(DT_AddrDly) <= uHat;
                  if (DT_AddrDly = 10) then
                     BitSync <= '1';
                  else
                     BitSync <= '0';
                  end if;
               end if;
            else
               EuIAReg <= (others=>'0');  -- pack zeros on last four inputs
            end if;

            if (SovaActiveA) then
               IT_Addr <= 0;
            elsif ((SovaReadyB = '1') and (SovaActiveB = '1') and (IT_Addr < FrameLast)) then
               IT_Addr <= IT_Addr + 1;
            end if;

            if (IT_Addr < FRAME_SIZE(Frame_u)) then
               EuIBReg <= EuIB_Ram(IT_Data);
            else
               EuIBReg <= (others=>'0');  -- pack zeros on last four inputs
            end if;

            PCIA_Read <= PCIA_Ram(PciaCntr);
            PCIB_Read <= PCIB_Ram(PciaCntr);

            if (SovaValidOutA) then    -- multiply by .75 for next iteration. can't saturate so turn off checks
               EuIB_Ram(SovaIndexA) <= resize(EuOA/2 + EuOA/4, EuOA, fixed_wrap, fixed_truncate);  -- times 3/4
            elsif (SovaValidOutB) then
               EuIA_Ram(SovaIndexB) <= resize(EuOB/2 + EuOB/4, EuOB, fixed_wrap, fixed_truncate);  -- times 3/4
               uHatRam(SovaIndexB)(0) <= uHatB;
-- synthesis translate_off
               MagRam(SovaIndexB) <= to_sfixed(Mag, MagRam(0));
-- synthesis translate_on
            end if;

         end if;
      end if;
   end process FrameProcess;

   -- Sova is called twice per iterations, first with PCIA/EuIA data then PCIB/EuIB
   EuIA <= to_sfixed(0, EuIA) when (IterationCntr_u = 0) else EuIAReg;    -- zero for first iteration
   EuI          <= EuIA when SovaActiveA else EuIBReg;
   PCI(0 to PCIB_RIGHT)  <= PCIA_Read(0 to PCIB_RIGHT) when SovaActiveA else PCIB_Read;   -- mux PCIA(0 to 15) or PCIB(0 to 3), zero others
   PCI(PCIB_RIGHT+1 to PCIA_RIGHT) <= PCIA_Read(PCIB_RIGHT+1 to PCIA_RIGHT) when SovaActiveA else (others=>'0');
   SovaReadyA   <= SovaReady when SovaActiveA else '0';
   SovaReadyB   <= SovaReady when SovaActiveB else '0';
   SovaIndexA   <= to_integer(unsigned(SovaIndex)) when SovaActiveA else 0;
   SovaIndexB   <= to_integer(unsigned(SovaIndex)) when SovaActiveB else 0;
   SovaIndexAB  <= to_integer(unsigned(SovaIndex));
   SovaValidOutA  <= SovaValidOut when SovaActiveA else '0';
   SovaValidOutB  <= SovaValidOut when SovaActiveB else '0';
   EuOA         <= to_sfixed(EuO, EuOA);
   EuOB         <= to_sfixed(EuO, EuOB);
   SovaReset   <= '1' when (DivBy3 = '1') and ( (SovaIndexAB = FrameLast) or (NextFrame = '1')) else '0';

   process(all)
   begin
      for n in eCA'range loop
         eC((n+1)*4-1 downto n*4) <= std_logic_vector(eCA(n)) when SovaActiveA else std_logic_vector(eCB(n));
      end loop;
   end process;

-- SovaMex(E_uI_A, P_CI_A, 1, sS, sE, eR, eCA, TbLen, Frame, Rate);
   Sova : SovaMex
      Port Map (
         Clk      => Clk,
         ce       => DivBy3,
         Reset    => Reset or SovaReset,
         ValidIn  => SovaActiveA or SovaActiveB,
         EuI      => to_slv(EuI),                  -- EuIA,
         PCI      => PCI,                          -- PCIA_Read,
         peC      => eC,                           -- eCA,
         Frame    => Frame,
         InReady  => SovaReady,                    -- SovaReadyA,
         IndexOut => SovaIndex,                    -- SovaIndexA,
         ValidOut => SovaValidOut,                 -- SovaValidOutA,
         uHat     => uHatB,
         EuO      => EuO,                           -- EuOA
         Magnitude=> Mag
   );

   Clk93Proc : process(Clk)   -- Clk93
   begin
      if (rising_edge(Clk)) then

         FifoValid <= not Empty and FifoReadEn and Div31By2 and DivBy3;
         BitOut <= BitRam(OutCntr)(0);

         if (DT_Addr < FRAME_SIZE(Frame_u)) then
            if (IterationCntr_u = Iterations_u) then   -- only latch the last iteration data
               BitRam(DT_AddrDly)(0) <= uHat;
            end if;
         end if;

         if (Reset) then
            ValidOutDly <= '0';
            SyncOutDly  <= '0';
         else
            ValidOutDly <= ValidOut31;
            SyncOutDly  <= SyncOut31;
         end if;

         if (Reset) then
            OutCntr  <= FrameLast;
            BitOutEn <= '0';
            BitCntr  <= 0;
         elsif ((BitSync = '1') and (BitCntr = 0)) then
            OutCntr  <= 0;
            BitOutEn <= '1';
            BitCntr  <= to_integer(unsigned(ClkPerBit));
         elsif (BitCntr > 0) then
            BitCntr  <= BitCntr - 1;
            BitOutEn <= '0';
         else        -- when done, BitCntr and OutCntr will be zero with BitOutEn = '0'
            if (OutCntr < FRAME_SIZE(Frame_u) - 1) then
               BitCntr <= to_integer(unsigned(ClkPerBit));
               OutCntr  <= OutCntr + 1;
               BitOutEn <= '1';
            else
               BitOutEn <= '0';
            end if;
         end if;

         if (BitOutEn) then
            ClkOutCnt  <= to_integer(unsigned(ClkPerBit)) / 2;
            BitClk     <= '0';
         elsif (ClkOutCnt > 0) then
            ClkOutCnt <= ClkOutCnt - 1;
         else
            BitClk <= '1';
         end if;
      end if;
   end process Clk93Proc;

   DataOut  <= to_slv(EuIAReg);
   SyncOut  <= SyncOut31 and not SyncOutDly;   -- resync outputs to main input clock
   ValidOut <= ValidOut31 and not ValidOutDly;

END rtl;
