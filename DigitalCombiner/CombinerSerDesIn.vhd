/*----------------------------------------------------------------------------------
   Company: SEMCO
   Engineer: FZ

   Create Date: 03/20/2018 07:14:20 PM
   Design Name:
   Module Name: CombinerSerDesIn - arch
   Project Name: Digital Combiner
   Target Devices: 7k160
   Tool Versions:  2017.4
   Description:
      Convert incoming LVDS data from demod channels to internal serdes streams,
      delay the incoming SerDes Data to optimize timing then pass it to the 10:1 iserdes.
      Convert the 10 bit 10b:8b output data to 8 bit and pass it along to the combiner module.

      Only the Combiner FPGA needs data from the other channels so the two bits of data back to the
      other channels will be used to align/synchronize the Combiner.
      The Ch1/Ch2 FPGAs will send IF,AGC and DQM data to the Combiner as required.
      The Combiner uses DataIn[1:0] for IF, 3:2 for AGC and 4 for DQM, however this module only
      recovers the data then passes it out.

      The demod channels will send one of three non-zero values as the Combiner locks
      the streams depending on the Command value:
         00 for DelayAdjust mode, Transmit 1 0 pattern to align center of bit
         01 for AlignData mode, Transmit valid K symbols while Comb bit slips till valid
         10 for Data mode, Transmit IF/AGC data.
      The upper layer VHDL will send 0's to the other demod to demod channel to save power.

   Revision:
   Revision 0.01 - File Created
   Additional Comments:

-----------------------------------------------------------------------------------*/


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.Semco_pkg.all;

entity CombinerSerDesIn is
   Generic (
      PORTS    : natural := 5
   );
   Port (
      Clk,
      Reset            : in  std_logic;
      DataIn_p,
      DataIn_n          : in  STD_LOGIC_VECTOR(PORTS-1 downto 0);
      Command           : out std_logic_vector(1 downto 0);
      DataOut           : out SLV8_ARRAY(PORTS-1 downto 0)
   );
end CombinerSerDesIn;

architecture rtl of CombinerSerDesIn is

   component dec_8b10b is
      port(
         RESET,                                       -- Global asynchronous reset (AH)
         CLK      : in  std_logic ;                   -- Master synchronous receive byte clock
         DataIn   : in  std_logic_vector(9 downto 0); -- Encoded input (LS..MS)
         KO       : out std_logic ;	                  -- Control (K) character indicator (AH)
         DataOut  : out std_logic_vector(7 downto 0)	-- Decoded out (MS..LS)
      );
   end component dec_8b10b;

   component pll_933_over_2
      port
       (
        clk_in1,
        reset     : in     std_logic;
        clk_5x,
        clk_1x,
        locked    : out    std_logic
       );
   end component;

   component Clk199m999
      port (
         reset             : in     std_logic;
         Clk93m3           : in     std_logic;
         locked            : out    std_logic;
         Clk_199m999       : out    std_logic
      );
   end component;

   component SerDes5x10to1In
      port
       (
        -- From the system into the device
        data_in_from_pins_p     : in    std_logic_vector(5-1 downto 0);
        data_in_from_pins_n     : in    std_logic_vector(5-1 downto 0);
        data_in_to_device       : out   std_logic_vector(50-1 downto 0);

      -- Input, Output delay control signals
        in_delay_reset          : in    std_logic;                    -- Active high synchronous reset for input delay
        in_delay_data_ce        : in    std_logic_vector(5 -1 downto 0);                    -- Enable signal for delay
        in_delay_data_inc       : in    std_logic_vector(5 -1 downto 0);                    -- Delay increment (high), decrement (low) signal
        in_delay_tap_in         : in    std_logic_vector(5*5 -1 downto 0); -- Dynamically loadable delay tap value for input delay
        in_delay_tap_out        : out   std_logic_vector(5*5 -1 downto 0); -- Delay tap value for monitoring input delay
        delay_locked            : out   std_logic;                    -- Locked signal from IDELAYCTRL
        ref_clock               : in    std_logic;                    -- Reference Clock for IDELAYCTRL. Has to come from BUFG.
        bitslip                 : in    std_logic_vector(5-1 downto 0);                    -- Bitslip module is enabled in NETWORKING mode
                                                                      -- User should tie it to '0' if not needed

      -- Clock and reset signals
        clk_in                  : in    std_logic;                    -- Fast clock from PLL/MMCM
        clk_div_in              : in    std_logic;                    -- Slow clock from PLL/MMCM
        io_reset                : in    std_logic                     -- Reset signal for IO circuit
     );
   end component;

    COMPONENT vio_0
      PORT (
         clk : IN STD_LOGIC;
         probe_out0 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
         probe_out1 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
         probe_out2 : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
         probe_out3 : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
         probe_out4 : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
         probe_out5 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         probe_out6 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
         probe_out7 : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
         probe_out8 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
      );
   END COMPONENT;

   constant DELAY_ADJUST      : std_logic_vector(1 downto 0) := "00";
   constant ALIGN_DATA        : std_logic_vector(1 downto 0) := "01";
   constant DATA_MODE         : std_logic_vector(1 downto 0) := "10";

   signal   SyncRst           : std_logic_vector(15 downto 0) := (others=>'1');
   signal   ChBitSlip,
            KO                : std_logic_vector(PORTS-1 downto 0);
   signal   Clk466M,
            Clk93M,
            Lock466M,
            Clk_199m999,
            TapLoad,
            DelayLocked,
            Lock199m999,
            SRst              : std_logic;
   signal   ChTenB            : vector_of_slvs(PORTS-1 downto 0)(9 downto 0);
   signal   ChOut             : std_logic_vector (49 downto 0);
   signal   Count             : unsigned(6 downto 0);
   signal   Taps              : std_logic_vector(5*5 - 1 downto 0);
   signal   ProbeOut2,
            ProbeOut2Dly      : std_logic_vector(5 downto 0) := "000000";

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of ChOut, ChBitSlip, DataOut, Lock466M, Lock199m999, Command : signal is "TRUE";

begin
/*
   Vio0 : vio_0
      PORT MAP (
         clk => clk,
         probe_out0 => open,
         probe_out1 => open,
         probe_out2 => ProbeOut2,
         probe_out3 => open,
         probe_out4 => open,
         probe_out5 => open,
         probe_out6 => open,
         probe_out7 => open,
         probe_out8 => open
   );
*/
   Taps <= ProbeOut2(4 downto 0) & ProbeOut2(4 downto 0) & ProbeOut2(4 downto 0) & ProbeOut2(4 downto 0) & ProbeOut2(4 downto 0);

   Pll466_u : Pll_933_over_2
      port map (
         -- Clock in ports
         clk_in1  => Clk,
        -- Status and control signals
         reset    => Reset,
         locked   => Lock466M,
        -- Clock out ports
         clk_1x  => Clk93M,
         clk_5x  => Clk466M
    );

   RstClk : process(Clk93M)
   begin
      if (rising_edge(Clk93M)) then
         if (Reset) then
               SyncRst     <= (others=>'1');
               SRst        <= '1';
               Count       <= (others=>'0');
               TapLoad     <= '0';
               ProbeOut2Dly <= (others=>'0');
               Command     <= DELAY_ADJUST;
         elsif (Lock466M) then
            SyncRst  <= SyncRst(SyncRst'left-1 downto 0) & not Lock199m999;
            SRst     <= SyncRst(SyncRst'left);
            Count    <= Count + 1;
            if (Command = DELAY_ADJUST) and (Count = 0) then
               ProbeOut2 <= std_logic_vector(unsigned(ProbeOut2) + 1);
            end if;
            ProbeOut2Dly <= ProbeOut2;
            TapLoad <= '1' when (ProbeOut2 /= ProbeOut2Dly) else '0';
            if (Command = DELAY_ADJUST) and (ChOut = 50x"2AAAAAAAAAAAA") then
               Command <= ALIGN_DATA;
            end if;
         end if;
      end if;
   end process RstClk;

   Pll200 : Clk199m999
      port map(
         reset       => Reset,
         Clk93m3     => Clk93m,
         locked      => Lock199m999,
         Clk_199m999 => Clk_199m999
      );

   SerDes5x10In : SerDes5x10to1In
       port map
      (
         clk_in               => Clk466M,
         clk_div_in           => Clk93M,
         io_reset             => SRst,
         ref_clock            => Clk_199m999,

         data_in_from_pins_p  => DataIn_p,
         data_in_from_pins_n  => DataIn_n,
         in_delay_reset       => TapLoad,
         in_delay_data_ce     => 5x"0",
         in_delay_data_inc    => 5x"1",
         in_delay_tap_in      => Taps,
         in_delay_tap_out     => open,
         bitslip              => ChBitSlip,
         data_in_to_device    => ChOut,
         delay_locked         => DelayLocked
      );

   Diff : for n in 0 to PORTS-1 generate
   begin
         Ch_10b8b : dec_8b10b
             port map(
               RESET       => SRst,       -- Global asynchronous reset (AH)
               CLK         => Clk93M,     -- Master synchronous receive byte clock
               DataIn      => ChOut(n*10+9 downto n*10),  -- Encoded input (LS..MS)
               KO          => KO(n),      -- Control (K) character indicator (AH)
               DataOut     => DataOut(n)  -- Decoded out (MS..LS)
                );
   end generate;

   ChBitSlip   <= (others=>'0');

   ChTenB(4) <= ChOut(49 downto 40);
   ChTenB(3) <= ChOut(39 downto 30);
   ChTenB(2) <= ChOut(29 downto 20);
   ChTenB(1) <= ChOut(19 downto 10);
   ChTenB(0) <= ChOut(09 downto 00);

end rtl;
