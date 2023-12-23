/*----------------------------------------------------------------------------------
   Company: SEMCO
   Engineer: FZ

   Create Date: 03/20/2018 07:14:20 PM
   Design Name:
   Module Name: CombinerSerDesIn - arch
   Project Name: Digital Combiner
   Target Devices: 7k325
   Tool Versions:  2016.4
   Description:
      Convert incoming LVDS data from demod channels to internal serdes streams,

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
      ClkIn1,
      ClkIn2,
      Clk93r3,
      Reset             : in  std_logic;
      DataIn1,
      DataIn2           : in  STD_LOGIC_VECTOR(PORTS-2 downto 0);
      DataOut10,
      DataOut11,
      DataOut12,
      DataOut13,
      DataOut14,
      DataOut20,
      DataOut21,
      DataOut22,
      DataOut23,
      DataOut24         : out SLV8
   );
end CombinerSerDesIn;

architecture rtl of CombinerSerDesIn is

   component SerDes6x8to1In
      port
       (
        -- From the system into the device
        data_in_from_pins       : in    std_logic_vector(6-1 downto 0);
        data_in_to_device       : out   std_logic_vector(48-1 downto 0);

      -- Input, Output delay control signals
        delay_locked            : out   std_logic;                         -- Locked signal from IDELAYCTRL
        ref_clock               : in    std_logic;                         -- Reference Clock for IDELAYCTRL. Has to come from BUFG.
        bitslip                 : in    std_logic_vector(6-1 downto 0);    -- Bitslip module is enabled in NETWORKING mode
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
         Clk93r3           : in     std_logic;
         locked            : out    std_logic;
         Clk200M           : out    std_logic
      );
   end component;

   component SerDesPll
      port (
         Clk93r3,
         reset             : in     std_logic;
         clk_Nx,
         clk_1x,
         locked            : out    std_logic
      );
   end component;


   constant CLOCK             : natural := PORTS-1;   -- the last port is the 93MHz clock from the demod used for phase alignment

   signal   SyncRst           : SLV16 := (others=>'1');
   signal   ChBitSlip1,
            ChBitSlip2        : std_logic_vector(PORTS-1 downto 0);
   signal   ClkX1,
            ClkNx,
            Clk200M,
            DelayLocked1,
            DelayLocked2,
            LockedXn,
            Lock200           : std_logic;
   signal   Demux1,
            Demux2,
            PrevOut1,
            Prevout2,
            Error1,
            Error2:            SLV8_ARRAY(PORTS-1 downto 0);
   signal   ChOut1,
            ChOut2            : std_logic_vector ((PORTS*8)-1 downto 0);
   signal   Count,
            Slips1,
            Slips2            : UINT4 := x"0";

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of Error1, Error2 : signal is "TRUE";

begin

   Pll200 : Clk200
      port map(
         Clk93r3           => Clk93r3,
         reset             => Reset,
         locked            => Lock200,
         Clk200M           => Clk200M
      );

   PllXn_u : SerDesPll
      port map (
         Clk93r3           => Clk93r3,
         reset             => Reset,
         locked            => LockedXn,
         clk_1x            => ClkX1,
         clk_Nx            => ClkNx
    );

   SyncRstProcess : process(ClkX1)
   begin
      if (rising_edge(ClkX1)) then
         if (Lock200 and LockedXn and not Reset) then
            SyncRst <= SyncRst(14 downto 0) & '0' ;
         else
            SyncRst <= (others=>'1');
         end if;
      end if;
   end process SyncRstProcess;

   SerDesIn1 : SerDes6x8to1In
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
            if ((ch = 3) or (ch = 4) or (ch = 5)) then
               for bits in 0 to 7 loop
                  Demux1(ch)(bits) <= not (ChOut1(ch+(bits*6)) );
               end loop;
            else
               for bits in 0 to 7 loop
                  Demux1(ch)(bits) <= ChOut1(ch+(bits*6));
               end loop;
            end if;
         end loop;

         for ch in 0 to PORTS-1 loop
            if ((ch = 3) or (ch = 4) or (ch = 5)) then
               for bits in 0 to 7 loop
                  Demux2(ch)(bits) <= not(ChOut2(ch+(bits*6)) );
               end loop;
            else
               for bits in 0 to 7 loop
                  Demux2(ch)(bits) <= ChOut2(ch+(bits*6));
               end loop;
            end if;
         end loop;

         Count <= Count + 1;

         if (Count = 15) then
            if (Demux1(CLOCK) = x"0F") then
               ChBitSlip1  <= (others=>'0');
               Slips1      <= x"0";
            else
               if (Slips1 = 15) then
                  ChBitSlip1 <= (others=>'1');
               end if;
               Slips1 <= Slips1 + 1;
            end if;

            if (Demux2(CLOCK) = x"0F") then
               ChBitSlip2  <= (others=>'0');
               Slips2      <= x"0";
            else
               if (Slips2 = 15) then
                  ChBitSlip2 <= (others=>'1');
               end if;
               Slips2 <= Slips2 + 1;
            end if;
         else
            ChBitSlip1  <= (others=>'0');
            ChBitSlip2  <= (others=>'0');
         end if;
      end if;
   end process;


   OutProcess : process(Clk93r3)
   begin
      if (rising_edge(Clk93r3)) then
         DataOut10 <= Demux1(0);
         DataOut11 <= Demux1(1);
         DataOut12 <= Demux1(2);
         DataOut13 <= Demux1(3);
         DataOut14 <= Demux1(4);

         DataOut20 <= Demux2(0);
         DataOut21 <= Demux2(1);
         DataOut22 <= Demux2(2);
         DataOut23 <= Demux2(3);
         DataOut24 <= Demux2(4);

         PrevOut1(0) <=  DataOut10;
         PrevOut1(1) <=  DataOut11;
         PrevOut1(2) <=  DataOut12;
         PrevOut1(3) <=  DataOut13;
         PrevOut1(4) <=  DataOut14;
         PrevOut2(0) <=  DataOut20;
         PrevOut2(1) <=  DataOut21;
         PrevOut2(2) <=  DataOut22;
         PrevOut2(3) <=  DataOut23;
         PrevOut2(4) <=  DataOut24;

         Error1(0)   <= DataOut10 xor std_logic_vector(unsigned(PrevOut1(0)) + x"11");
         Error1(1)   <= DataOut11 xor std_logic_vector(unsigned(PrevOut1(1)) + x"11");
         Error1(2)   <= DataOut12 xor std_logic_vector(unsigned(PrevOut1(2)) + x"11");
         Error1(3)   <= DataOut13 xor std_logic_vector(unsigned(PrevOut1(3)) + x"11");
         Error1(4)   <= DataOut14 xor std_logic_vector(unsigned(PrevOut1(4)) + x"11");
         Error2(0)   <= DataOut20 xor std_logic_vector(unsigned(PrevOut2(0)) + x"11");
         Error2(1)   <= DataOut21 xor std_logic_vector(unsigned(PrevOut2(1)) + x"11");
         Error2(2)   <= DataOut22 xor std_logic_vector(unsigned(PrevOut2(2)) + x"11");
         Error2(3)   <= DataOut23 xor std_logic_vector(unsigned(PrevOut2(3)) + x"11");
         Error2(4)   <= DataOut24 xor std_logic_vector(unsigned(PrevOut2(4)) + x"11");
      end if;
   end process;


end rtl;
