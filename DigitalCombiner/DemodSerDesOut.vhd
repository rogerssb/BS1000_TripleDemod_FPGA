/*----------------------------------------------------------------------------------
   Company: SEMCO
   Engineer: FZ

   Create Date: 03/20/2018 07:14:20 PM
   Design Name:
   Module Name: SerDes - arch
   Project Name: Digital Combiner
   Target Devices: 7k160
   Tool Versions:  2017.2
   Description:
      Only the Combiner FPGA needs data from the other channels.
      The Ch1/Ch2 FPGAs will send IF and AGC data to the Prev or Next ports as required
      and 0's to the other.

      There are 5 byte wide data channels and are split up as:
      Ch0   RawRF[7:0]
      Ch1   00 & RawRF[13:8]
      Ch2   AGC[15:8]
      Ch3   AGC[7:0]
      Ch4   DQM & Misc

      Ch1 is ID 00, Ch2 is 01 and Cmb is 10

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
      Clk93M,
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

   component SerDesPll
      port (
         clk_in1,
         reset             : in     std_logic;
         clk_Nx,
         clk_1x,
         input_clk_stopped,
         locked            : out    std_logic
      );
   end component;

   component SerDes5x8to1Out
      port (
         -- Clock and reset signals
         clk_in                  : in    std_logic;                    -- Fast clock from PLL/MMCM
         clk_div_in              : in    std_logic;                    -- Slow clock from PLL/MMCM
         clk_reset               : in    std_logic;                    -- Reset signal for Clock circuit
         io_reset                : in    std_logic;                    -- Reset signal for IO circuit
         -- From the device then out to the system
         data_out_from_device    : in    std_logic_vector(40-1 downto 0);
         data_out_to_pins_p      : out   std_logic_vector(5-1 downto 0);
         data_out_to_pins_n      : out   std_logic_vector(5-1 downto 0);
         clk_to_pins_p           : out std_logic;
         clk_to_pins_n           : out std_logic
      );
   end component SerDes5x8to1Out;

   signal   SyncRst           : std_logic_vector(5 downto 0) := (others=>'1');
   signal   TxDataDly         : SLV8_ARRAY(PORTS-1 downto 0);
   signal   SerDesIn          : std_logic_vector(PORTS*8-1 downto 0);
   signal   ClkNx,
            Clk1x,
            LockPll,
            ClkStoppedXn,
            SRst              : std_logic;

            -- debug signals
   signal   RefClkOutP,
            RefClkOutN        : std_logic;
   signal   Offset, Count     : natural range 0 to 255 := 19;
   signal   DataOutp,
            DataOutn          : STD_LOGIC_VECTOR(PORTS-1 downto 0);

--   attribute MARK_DEBUG : string;
--   attribute MARK_DEBUG of Reset, SyncRst, TxData, LockPll : signal is "TRUE";

begin

   Pll466_u : SerDesPll
      port map (
         clk_in1  => Clk93M,
         reset    => Reset,
         locked   => LockPll,
         input_clk_stopped => ClkStoppedXn,
         clk_1x  => Clk1x,
         clk_Nx  => ClkNx
    );

   RstClk : process(Clk1x, Reset)
   begin
      if (Reset or ClkStoppedXn) then
         SyncRst  <= (others=>'1');
         SRst     <= '1';
      elsif (rising_edge(Clk1x)) then
         TxDataDly   <= TxData;
         if (LockPll) then
            SyncRst  <= SyncRst(SyncRst'left-1 downto 0) & not Active;
            SRst     <= SyncRst(SyncRst'left);
 --           if (Count = 63) then
 --              Count <= 0;
 ----              Offset <= Offset - 1 when (Offset > 0) else 63;
 --           else
 --              Count <= Count + 1;
 --           end if;
         end if;

         for x in 0 to PORTS-1 loop
            for bits in 0 to 7 loop
               SerDesIn(bits*5 + x) <= TxDataDly(x)(bits);
            end loop;
         end loop;

      end if;
   end process RstClk;

   SerDes5x10Out : SerDes5x8to1Out
      port map (
         clk_in                => ClkNx,
         clk_div_in            => Clk1x,
         clk_reset             => Srst,
         io_reset              => Srst,
         data_out_from_device  => SerDesIn,
         data_out_to_pins_p    => DataOutp,
         data_out_to_pins_n    => DataOutn,
         clk_to_pins_p         => RefClkOutP,
         clk_to_pins_n         => RefClkOutN
      );


      RefClkOut_p <= transport RefClkOutP  after offset * 300 ps;
      RefClkOut_n <= transport RefClkOutN  after offset * 300 ps;
      DataOut_p   <= transport DataOutP    after offset * 300 ps;
      DataOut_n   <= transport DataOutN    after offset * 300 ps;

end rtl;
