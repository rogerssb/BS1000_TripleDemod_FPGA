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

      Only the Combiner FPGA needs data from the other channels.
      The Ch1/Ch2 FPGAs will send IF,AGC and DQM data to the Combiner as required.
      The Combiner uses DataIn[1:0] for IF, 3:2 for AGC and 4 for DQM, however this module only
      recovers the data then passes it out.
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
      CHANNEL  : natural := 1;
      PORTS    : natural := 5
   );
   Port (
      ClkIn_p,
      ClkIn_n,
      Clk93M,
      Reset             : in  std_logic;
      DataIn_p,
      DataIn_n          : in  STD_LOGIC_VECTOR(PORTS-2 downto 0);
      DataOut           : out SLV8_ARRAY(PORTS-2 downto 0)
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
      generic (
         SYS_W    : integer := 6;
         DEV_W    : integer := 60
      );
      port
       (
        -- From the system into the device
        data_in_from_pins       : in    std_logic_vector(SYS_W-1 downto 0);
        data_in_to_device       : out   std_logic_vector(DEV_W-1 downto 0);

      -- Input, Output delay control signals
        delay_locked            : out   std_logic;                         -- Locked signal from IDELAYCTRL
        ref_clock               : in    std_logic;                         -- Reference Clock for IDELAYCTRL. Has to come from BUFG.
        bitslip                 : in    std_logic_vector(SYS_W-1 downto 0);    -- Bitslip module is enabled in NETWORKING mode
                                                                           -- User should tie it to '0' if not needed
      -- Clock and reset signals
        clk_div_in,                                                        -- Slow clock output
        io_reset,
        clk_in                   : in    std_logic                          -- Reset signal for IO circuit
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

   signal   SyncRst           : std_logic_vector(15 downto 0) := (others=>'1');
   signal   ChBitSlip         : std_logic_vector(PORTS-1 downto 0);
   signal   DataIn,
            KO                : std_logic_vector(PORTS-2 downto 0);
   signal   Clk_199m999,
            ClkIn,
            ClkInX1,
            ClkInX5,
            DelayLocked,
            LockedX5,
            Lock199m999,
            SRst              : std_logic;
   signal   ChTenB            : vector_of_slvs(PORTS-1 downto 0)(9 downto 0);
   signal   ChOut             : std_logic_vector ((PORTS*10)-1 downto 0);
   signal   ProbeOut2,
            ProbeOut2Dly      : std_logic_vector(5 downto 0) := "000000";

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of ChOut, ChBitSlip, DataOut, Lock199m999 : signal is "TRUE";

begin

   RstClk : process(Clk93M)
   begin
      if (rising_edge(Clk93M)) then
         if (Reset) then
            SyncRst     <= (others=>'1');
            SRst        <= '1';
            ProbeOut2Dly   <= (others=>'0');
         elsif (LockedX5) then
            SyncRst  <= SyncRst(SyncRst'left-1 downto 0) & "0";
            SRst     <= SyncRst(SyncRst'left);
            ProbeOut2Dly   <= ProbeOut2;
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

   ClkBuf : IBUFDS
      generic map (
         DIFF_TERM      => TRUE, -- Differential Termination
         IBUF_LOW_PWR   => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
         IOSTANDARD     => "LVDS")
      port map (
         I  => ClkIn_p,
         IB => ClkIn_n,
         O  => ClkIn
      );

   Pll466_u : Pll_933_over_2
      port map (
         -- Clock in ports
         clk_in1  => ClkIn,
        -- Status and control signals
         reset    => Reset,
         locked   => LockedX5,
        -- Clock out ports
         clk_1x  => ClkInX1,
         clk_5x  => ClkInX5
    );

   SerDes5x10In : SerDes5x10to1In
      generic map(
         SYS_W   => 6,
         DEV_W   => 60
      )
       port map
      (
         clk_in               => ClkInX5,
         clk_div_in           => ClkInX1,
         io_reset             => SRst,
         ref_clock            => Clk_199m999,

         data_in_from_pins    => ClkIn & DataIn(PORTS-2 downto 0),
         bitslip              => ChBitSlip,
         data_in_to_device    => ChOut,
         delay_locked         => DelayLocked
      );

   DeInterlace : process(ClkInX1)
   begin
      if (rising_edge(ClkInX1)) then
         for ch in 0 to PORTS-1 loop
            for bits in 0 to 9 loop
               ChTenB(ch)(bits) <= ChOut((54+ch)-(bits*6));
            end loop;
         end loop;
      end if;
   end process;

   Diff : for n in 0 to PORTS-2 generate
   begin
      Ch_10b8b : dec_8b10b
          port map(
            RESET       => SRst,       -- Global asynchronous reset (AH)
            CLK         => Clk93M,     -- Master synchronous receive byte clock
            DataIn      => ChTenB(n),     -- Encoded input (LS..MS)
            KO          => KO(n),      -- Control (K) character indicator (AH)
            DataOut     => DataOut(n)  -- Decoded out (MS..LS)
             );

      DataBuf : IBUFDS
         generic map (
            DIFF_TERM      => TRUE, -- Differential Termination
            IBUF_LOW_PWR   => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD     => "LVDS")
         port map (
            I  => DataIn_p(n),
            IB => DataIn_n(n),
            O  => DataIn(n)
         );

   end generate;

   ChBitSlip      <= (others=>'0');

end rtl;
