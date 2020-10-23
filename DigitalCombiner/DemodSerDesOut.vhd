/*----------------------------------------------------------------------------------
   Company: SEMCO
   Engineer: FZ

   Create Date: 03/20/2018 07:14:20 PM
   Design Name:
   Module Name: SerDes - arch
   Project Name: Digital Combiner
   Target Devices: 7k160
   Tool Versions:  2017.4
   Description:
      Only the Combiner FPGA needs data from the other channels.
      The Ch1/Ch2 FPGAs will send IF and AGC data to the Prev or Next ports as required
      and 0's to the other.

      Ch1 is ID 00, Ch2 is 01 and Cmb is 10

      Take the incoming 8 bit data, do 8b:10b conversion, pass it to the 10:1 output
      serdes, then convert to LVDS. No delay is required since the other end aligns the data.

   Revision:
   Revision 0.01 - File Created
   Additional Comments:

----------------------------------------------------------------------------------*/

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.Semco_pkg.all;

entity DemodSerDesOut is
   Generic (
      PORTS    : natural := 5
   );
   Port (
      Clk,
      Reset,
      Active            : in std_logic;
      TxData            : in SLV8_ARRAY(PORTS-1 downto 0);
      DataOut_p,
      DataOut_n         : out STD_LOGIC_VECTOR(PORTS-1 downto 0);
      RefClkOut_p,
      RefClkOut_n       : out std_logic
   );
end DemodSerDesOut;

architecture rtl of DemodSerDesOut is

   component enc_8b10b is
      port (
         RESET,                                       -- Global asynchronous reset (AH)
         CLK      : in  std_logic;                    -- Master synchronous receive byte clock
         DataIn   : in  std_logic_vector(7 downto 0); -- input (MS..LS)
         KI       : in std_logic;	                  -- Control (K) character input
         DataOut  : out std_logic_vector(9 downto 0)	-- Encoded out (LS..MS)
      );
   end component enc_8b10b;

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
      port (
         clk_in1,
         reset     : in     std_logic;
         clk_5x,
         clk_1x,
         locked    : out    std_logic
      );
   end component pll_933_over_2;

   component SerDes5x10to1Out
      port (
         -- Clock and reset signals
         clk_in                  : in    std_logic;                    -- Fast clock from PLL/MMCM
         clk_div_in              : in    std_logic;                    -- Slow clock from PLL/MMCM
         clk_reset               : in    std_logic;                    -- Reset signal for Clock circuit
         io_reset                : in    std_logic;                    -- Reset signal for IO circuit
         -- From the device then out to the system
         data_out_from_device    : in    std_logic_vector(50-1 downto 0);
         data_out_to_pins_p      : out   std_logic_vector(5-1 downto 0);
         data_out_to_pins_n      : out   std_logic_vector(5-1 downto 0);
         clk_to_pins_p           : out std_logic;
         clk_to_pins_n           : out std_logic
      );
   end component SerDes5x10to1Out;

   signal   SyncRst           : std_logic_vector(5 downto 0) := (others=>'1');
   signal   TxDataDly,
            Tx1, Tx2          : SLV8_ARRAY(PORTS-1 downto 0);
   signal   TenB_Out,
            ChTenB            : vector_of_slvs(PORTS-1 downto 0)(9 downto 0);
   signal   SerDesIn          : std_logic_vector(PORTS*10-1 downto 0);
   signal   Clk5x,
            Clk1x,
            Lock466M, KO,
            SRst              : std_logic;
   signal   Diff              : SLV8;

signal DataOut : std_logic_vector(7 downto 0); --debug

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of Reset, SyncRst, TxData, TenB_Out, ChTenB, Diff, Lock466M, DataOut, KO : signal is "TRUE";

begin

   Pll466_u : Pll_933_over_2
      port map (
         -- Clock in ports
         clk_in1  => Clk,
        -- Status and control signals
         reset    => Reset,
         locked   => Lock466M,
        -- Clock out ports
         clk_1x  => Clk1x,
         clk_5x  => Clk5x
    );

   RstClk : process(Clk1x, Reset)
   begin
      if (Reset) then
         SyncRst  <= (others=>'1');
         SRst     <= '1';
      elsif (rising_edge(Clk1x)) then
         TxDataDly   <= TxData;
         Tx1 <= TxDataDly;
         Tx2 <= Tx1;
         Diff <= Tx2(1) xor DataOut;
         if (Lock466M) then
            SyncRst  <= SyncRst(SyncRst'left-1 downto 0) & '0';
            SRst     <= SyncRst(SyncRst'left);
         end if;

         for x in 0 to PORTS-1 loop
            for bits in 0 to 9 loop
               SerDesIn(bits*5 + x) <= ChTenb(x)(bits);
            end loop;
         end loop;

      end if;
   end process RstClk;

   Encode : for n in 0 to PORTS-1 generate
      -- outputs aren't delayed
      Ch_8b10b : enc_8b10b
         port map(
            RESET       => SRst,       -- Global asynchronous reset (active high)
            CLK         => Clk1x,     -- Master synchronous send byte clock
            KI          => '0',        -- Control (K) input(active high)
            DataIn      => TxDataDly(n),
            DataOut     => TenB_Out(n)
        );

         ChTenB(n) <= 10x"000" when not Active else std_logic_vector(to_unsigned(n, 10)); --"1010101010"; --TenB_Out(n);
   end generate;



   SerDes5x10Out : SerDes5x10to1Out
      port map (
         clk_in                => Clk5x,
         clk_div_in            => Clk1x,
         clk_reset             => Srst,
         io_reset              => Srst,
         data_out_from_device  => SerDesIn,
         data_out_to_pins_p    => DataOut_p,
         data_out_to_pins_n    => DataOut_n,
         clk_to_pins_p         => RefClkOut_p,
         clk_to_pins_n         => RefClkOut_n
      );

   Ch_10b8b : dec_8b10b
       port map(
         RESET       => SRst,       -- Global asynchronous reset (AH)
         CLK         => Clk1x,     -- Master synchronous receive byte clock
         DataIn      => TenB_Out(1),  -- Encoded input (LS..MS)
         KO          => KO,      -- Control (K) character indicator (AH)
         DataOut     => DataOut  -- Decoded out (MS..LS)
          );

end rtl;
