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
      PORTS    : natural := 6
   );
   Port (
      ClkIn1_p,
      ClkIn1_n,
      ClkIn2_p,
      ClkIn2_n,
      Clk93M,
      Reset             : in  std_logic;
      DataIn1_p,
      DataIn1_n,
      DataIn2_p,
      DataIn2_n         : in  STD_LOGIC_VECTOR(PORTS-2 downto 0);
      DataOut1,
      DataOut2          : out SLV8_ARRAY(PORTS-2 downto 0)
   );
end CombinerSerDesIn;

architecture rtl of CombinerSerDesIn is

   component SerDes6x8to1In
      generic (
         SYS_W    : integer := 6;
         DEV_W    : integer := SYS_W*8
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

   component Clk200
      port (
         reset             : in     std_logic;
         Clk93m3           : in     std_logic;
         locked            : out    std_logic;
         input_clk_stopped : out    std_logic;
         Clk200M           : out    std_logic
      );
   end component;

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

   constant CLOCK             : natural := PORTS-1;

   signal   SyncRst           : SLV16 := (others=>'1');
   signal   ChBitSlip1,
            ChBitSlip2        : std_logic_vector(PORTS-1 downto 0);
   signal   DataIn1,
            DataIn2           : std_logic_vector(PORTS-2 downto 0);
   signal   ClkIn1,
            ClkIn2,
            ClkX1,
            ClkNx,
            Clk200M,
            ClkStopped200,
            ClkStoppedXn,
            ResetPll,
            DelayLocked1,
            DelayLocked2,
            LockedXn,
            Lock200           : std_logic;
   signal   Demux1,
            Demux2            : SLV8_ARRAY(PORTS-1 downto 0);
   signal   ChOut1,
            ChOut2            : std_logic_vector ((PORTS*8)-1 downto 0);
   signal   Count             : UINT8 := x"00";

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of
            Demux1, Demux2, Count, LockedXn, Lock200, ChBitSlip1, ChBitSlip2,
            ClkStopped200, ClkStoppedXn, ResetPll, DelayLocked1, DelayLocked2 : signal is "TRUE";

begin

   Diff : for n in 0 to PORTS-2 generate
   begin
      DataBuf1 : IBUFDS
         generic map (
            DIFF_TERM      => TRUE, -- Differential Termination
            IBUF_LOW_PWR   => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD     => "LVDS")
         port map (
            I  => DataIn1_p(n),
            IB => DataIn1_n(n),
            O  => DataIn1(n)
         );

      DataBuf2 : IBUFDS
         generic map (
            DIFF_TERM      => TRUE, -- Differential Termination
            IBUF_LOW_PWR   => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
            IOSTANDARD     => "LVDS")
         port map (
            I  => DataIn2_p(n),
            IB => DataIn2_n(n),
            O  => DataIn2(n)
         );
   end generate;

   ClkBuf1 : IBUFDS
      generic map (
         DIFF_TERM      => TRUE, -- Differential Termination
         IBUF_LOW_PWR   => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
         IOSTANDARD     => "LVDS")
      port map (
         I  => ClkIn1_p,
         IB => ClkIn1_n,
         O  => ClkIn1
      );

   ClkBuf2 : IBUFDS
      generic map (
         DIFF_TERM      => TRUE, -- Differential Termination
         IBUF_LOW_PWR   => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
         IOSTANDARD     => "LVDS")
      port map (
         I  => ClkIn2_p,
         IB => ClkIn2_n,
         O  => ClkIn2
      );

   ResetPll <= ClkStopped200 or ClkStoppedXn or Reset;

   Pll200 : Clk200
      port map(
         Clk93m3           => Clk93M,
         reset             => ResetPll,
         locked            => Lock200,
         input_clk_stopped => ClkStopped200,
         Clk200M           => Clk200M
      );

   PllXn_u : SerDesPll
      port map (
         clk_in1           => Clk93M,
         reset             => ResetPll,
         locked            => LockedXn,
         input_clk_stopped => ClkStoppedXn,
         clk_1x            => ClkX1,
         clk_Nx            => ClkNx
    );

   SyncRstProcess : process(Clk93M)
   begin
      if (rising_edge(Clk93M)) then
         if (Lock200 and LockedXn and not Reset) then
            SyncRst <= SyncRst(14 downto 0) & '0' ;
         else
            SyncRst <= (others=>'1');
         end if;
      end if;
   end process SyncRstProcess;

   SerDesIn1 : SerDes6x8to1In
      generic map(
         SYS_W   => 6,
         DEV_W   => 48
      )
       port map
      (
         clk_in               => ClkNx,
         clk_div_in           => ClkX1,
         io_reset             => SyncRst(SyncRst'left),
         ref_clock            => Clk200M,

         data_in_from_pins    => ClkIn1 & DataIn1(PORTS-2 downto 0),
         bitslip              => ChBitSlip1,
         data_in_to_device    => ChOut1,
         delay_locked         => DelayLocked1
      );

   SerDesIn2 : SerDes6x8to1In
      generic map(
         SYS_W   => 6,
         DEV_W   => 48
      )
       port map
      (
         clk_in               => ClkNx,
         clk_div_in           => ClkX1,
         io_reset             => SyncRst(SyncRst'left),
         ref_clock            => Clk200M,

         data_in_from_pins    => ClkIn2 & DataIn2(PORTS-2 downto 0),
         bitslip              => ChBitSlip2,
         data_in_to_device    => ChOut2,
         delay_locked         => DelayLocked2
      );

   DeInterlace1 : process(ClkX1)
   begin
      if (rising_edge(ClkX1)) then
         for ch in 0 to PORTS-1 loop
            if ((ch = 3) or (ch = 4) or (ch = 5)) then   -- some traces got crossed in routing the PCB
               for bits in 0 to 7 loop
                  Demux1(ch)(bits) <= not (ChOut1((42+ch)-((7-bits)*6)) );
               end loop;
            else
               for bits in 0 to 7 loop
                  Demux1(ch)(bits) <= ChOut1((42+ch)-((7-bits)*6));
               end loop;
            end if;
         end loop;

         if (Count < 15) then
            Count <= Count + 1;
         else
            Count <= x"00";
         end if;

         if ((Demux1(CLOCK) = x"0F") or (Count < 15)) then  -- Clock 1 is inverted
            ChBitSlip1 <= (others=>'0');
         else
            ChBitSlip1 <= (others=>'1');
         end if;

      end if;
   end process;

   DataOut1   <= Demux1(4 downto 0);

   DeInterlace2 : process(ClkX1)
   begin
      if (rising_edge(ClkX1)) then
         for ch in 0 to PORTS-1 loop
            if ((ch = 0) or (ch = 3) or (ch = 4)) then
               for bits in 0 to 7 loop
                  Demux2(ch)(bits) <= not( ChOut2((42+ch)-((7-bits)*6)));
               end loop;
            else
               for bits in 0 to 7 loop
                  Demux2(ch)(bits) <= ChOut2((42+ch)-((7-bits)*6));
               end loop;
            end if;
         end loop;

         if ((Demux2(CLOCK) = x"0F") or (Count < 15)) then
            ChBitSlip2 <= (others=>'0');
         else
            ChBitSlip2 <= (others=>'1');
         end if;

      end if;
   end process;

   DataOut2   <= Demux2(4 downto 0);

end rtl;
