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

Module Name: UartControl.vhd
Description: Read and write the uart control port then set variables as required.

ARGUMENTS : Incoming Messages are in form
   Command Write:    STX Addr(0 to 3) WrCommand(0 to 1) Value(0 to n) EOT
   Status Read:      STX Addr(0 to 3) RdCommand(0 to 1) EOT


Dependencies:

----------------------------------------------------------------------------
                               DETAILS
----------------------------------------------------------------------------

----------------------------------------------------------------------------
                               HISTORY
----------------------------------------------------------------------------
9-6-16 Initial release FZ
--------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
USE work.Semco_pkg.ALL;

ENTITY UartControl IS
   GENERIC (
      REVISION_NUM   : string := "0000";
      FIRMWARE_VER   : string := "0000";
      OUTPUT_PAIRS   : positive := 16;
      IN_WIDTH       : positive := 5
   );
   PORT(
      clk,
      reset,
      Rxd            : IN  std_logic;
      Txd,
      TxEn,
      NotBusy        : OUT std_logic;
      Selects        : OUT VECTOR_OF_SLVS(OUTPUT_PAIRS-1 downto 0)(IN_WIDTH-1 downto 0)
   );
END UartControl;


ARCHITECTURE rtl OF UartControl IS

   COMPONENT UartLite93Mhz
      PORT (
         s_axi_aclk     : IN  STD_LOGIC;
         s_axi_aresetn  : IN  STD_LOGIC;
         s_axi_awaddr   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axi_awvalid  : IN  STD_LOGIC;
         s_axi_awready  : OUT STD_LOGIC;
         s_axi_wdata    : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axi_wstrb    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axi_wvalid   : IN  STD_LOGIC;
         s_axi_wready   : OUT STD_LOGIC;
         s_axi_bresp    : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         s_axi_bvalid   : OUT STD_LOGIC;
         s_axi_bready   : IN  STD_LOGIC;
         s_axi_araddr   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
         s_axi_arvalid  : IN  STD_LOGIC;
         s_axi_arready  : OUT STD_LOGIC;
         s_axi_rdata    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axi_rresp    : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
         s_axi_rvalid   : OUT STD_LOGIC;
         s_axi_rready   : IN  STD_LOGIC;
         interrupt      : OUT STD_LOGIC;
         Rx             : IN  STD_LOGIC;
         Tx             : OUT STD_LOGIC
      );
   END COMPONENT;


   constant WIDTH          : integer := 18;
   constant RX_FIFO        : STD_LOGIC_VECTOR(3 DOWNTO 0) := x"0";  -- Receive FIFO Register
   constant TX_FIFO        : STD_LOGIC_VECTOR(3 DOWNTO 0) := x"4";  -- Transmit FIFO Register
   constant SR             : STD_LOGIC_VECTOR(3 DOWNTO 0) := x"8";  -- Status Register
   constant CR             : STD_LOGIC_VECTOR(3 DOWNTO 0) := x"C";  -- Control Register
   constant RXFIFO_VALID   : integer := 0;
   constant RXFIFO_FULL    : integer := 1;
   constant TXFIFO_EMPTY   : integer := 2;
   constant TXFIFO_FULL    : integer := 3;
   constant TERM           : character :='T'; --character'val(0);
   constant ACK            : character :='A'; --character'val(6);
   constant NAK            : character :='N'; --character'val(21);
   constant STX            : character :='S'; --character'val(2);
   constant EOT            : character :='E'; --character'val(4);
   constant ADDR_LEN       : integer := 4;
   constant COMM_LEN       : integer := 4;
   constant DATA_STRT      : integer := ADDR_LEN + COMM_LEN + 2;
   constant MY_ADDR        : string(1 to ADDR_LEN) := "0123";


   type     mode_t      is (IDLE, PROC, GET_DEC, GET_HEX);
   type     subMode_t   is (XPNT, ATTN, BAND_TRIM, HEX29, ERROR_RATE, SUB_FREQ, DEC18, READ, WRITE, CDCE, CEES, CEER, REES, REER);
   type     spimodes_t  is (IDLE, SHIFT);
   type     Mode5587_t  is (IDLE, SETTLE, CONVERT, PULSE_LOW, PULSE_HIGH);

   signal   Mode        : mode_t;
   signal   SubMode     : subMode_t;
   signal   Clk62Div    : unsigned(4 downto 0) := "00000";  -- div by 32 for 500nS period
   signal   CrossPointer : integer range 0 to 15;
   signal   MyInt       : integer;
   signal   TxEnCount   : integer range 0 to 31;
   signal   RxBuffer    : string(1 to 31);
   signal   RxCommand   : string(1 to COMM_LEN);
   signal   BytesReceived : integer;-- range 0 to 8;
   signal   TxBuffer    : string(1 to 31);
   signal   TxPointer,
            RxPointer   : integer range 1 to 31 := 1;
   signal   rDataStr,
            RxBuffOfR,
            TxData      : character;
   signal   eFuse       : SLV32;
   signal   MyHex       : SLV64;
   signal   WrPending,
            RdPending   : STD_LOGIC;

   signal   araddr      : STD_LOGIC_VECTOR(3 DOWNTO 0);   -- IN
   signal   awaddr      : STD_LOGIC_VECTOR(3 DOWNTO 0);   -- IN
   signal   wdata       : STD_LOGIC_VECTOR(31 DOWNTO 0);  -- IN
   signal   wstrb       : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111"; -- IN, byte write enables
   signal   awvalid     : STD_LOGIC;                      -- IN
   signal   wvalid      : STD_LOGIC;                      -- IN
   signal   bready      : STD_LOGIC := '0';               -- IN
   signal   arvalid     : STD_LOGIC;                      -- IN
   signal   rready      : STD_LOGIC;                      -- IN
   signal   awready     : STD_LOGIC;                      -- OUT
   signal   wready      : STD_LOGIC;                      -- OUT
   signal   bresp       : STD_LOGIC_VECTOR(1 DOWNTO 0);   -- OUT
   signal   bvalid      : STD_LOGIC;                      -- OUT
   signal   arready     : STD_LOGIC;                      -- OUT
   signal   rdata       : STD_LOGIC_VECTOR(31 DOWNTO 0);  -- OUT
   signal   rresp       : STD_LOGIC_VECTOR(1 DOWNTO 0);   -- OUT
   signal   rvalid      : STD_LOGIC;                      -- OUT
   signal   interrupt   : std_logic;

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of MyInt, MyHex, Mode, SubMode,
   RxBuffer, RxCommand: signal is "TRUE";

BEGIN

   RxBuffOfR <= RxBuffer(RxPointer);
   RxCommand   <= RxBuffer(ADDR_LEN + 2 to DATA_STRT-1);
   rDataStr    <= character'val(to_integer(unsigned(rdata(7 downto 0))));  -- capture LSB of rData
   wdata       <= 24x"000000" & std_logic_vector(to_unsigned(character'pos(TxData),8));
   BytesReceived <= (RxPointer - (DATA_STRT + 2)) / 2;
   NotBusy       <= '1' when (Mode = IDLE) else '0';

   Uart_process: process (clk)
      variable AttnLeft : integer range 0 to 255;
      variable SynthFreq : UINT32;     -- SynthFreq is a BCD value for doing decimal subtraction
      variable Addr9957_v : integer range 0 to 31;
   begin
      if (rising_edge(clk)) then
         if (reset) then
            RxPointer      <= 1;
            RxBuffer(1 to 15) <= STX & MY_ADDR & "CXPT0521" & EOT & TERM;  -- set crosspoint output 5 to input 21. All decimals
            RxBuffer(16 to 31) <= (others=>TERM);
            TxBuffer(1)    <= TERM;       -- set first char of Tx to NULL TERM to disable TX
            TxEnCount      <= 31;
            TxPointer      <= 1;
            MyInt          <= 0;
            MyHex          <= (others=>'0');
            araddr         <= SR;
            awaddr         <= TX_FIFO;    -- only write to Tx Fifo
            arvalid        <= '0';
            rready         <= '0';
            awvalid        <= '0';
            wvalid         <= '0';
            WrPending      <= '0';
            RdPending      <= '0';
            Mode           <= PROC;
            Selects        <= (5x"00", 5x"01", 5x"02", 5x"03", 5x"04", 5x"05", 5x"06", 5x"07", 5x"08", 5x"09", 5x"0A", 5x"0B", 5x"0C", 5x"0D", 5x"0E", 5x"0F");
         else
            if (Mode = PROC) then
               MyHex       <= (others=>'0');
               MyInt       <= 0;
               case (RxCommand) is
               when "CXPT" =>    -- Set CrossPoint    Format AADD where AA is the output and DD is the desired input
                  SubMode        <= XPNT;
                  CrossPointer   <= CharToInt(RxBuffer(DATA_STRT)) * 10 + CharToInt(RxBuffer(DATA_STRT+1));
                  RxPointer      <= DATA_STRT+2;
                  Mode  <= GET_DEC;
               -- Read status commands
--               when "RXPT" =>    -- Read crosspoint select  Format is AA where AA is the output address
--                  TxBuffer(1 to 19) <= STX & MY_ADDR & RxBuffer(DATA_STRT to DATA_STRT + 5) &  & EOT & ACK & TERM;
--                  RxPointer <= 1;
--                  Mode      <= IDLE;
               when "RPNM" =>    -- Card Name
                  TxBuffer(1 to 19) <= STX & MY_ADDR & "RPNMgPatMas" & EOT & ACK & TERM;
                  RxPointer <= 1;
                  Mode      <= IDLE;
               when "RRNM" =>      -- Revision number
                  TxBuffer(1 to 16) <= STX & MY_ADDR & "RRNM" & REVISION_NUM & EOT & ACK & TERM;
                  RxPointer <= 1;
                  Mode      <= IDLE;
               when "RSRN" =>
                  TxBuffer(1 to 18) <= STX & MY_ADDR & "RSRN" & to_hex_string(EFuse(31 downto 8)) & EOT & ACK & TERM;
                  RxPointer <= 1;
                  Mode      <= IDLE;
               when "RNME" =>      -- Firmware Name
                  TxBuffer(1 to 16) <= STX & MY_ADDR & "RNME" & "gPat" & EOT & ACK & TERM;
                  RxPointer <= 1;
                  Mode      <= IDLE;
               when "RVER" =>      -- Revision number
                  TxBuffer(1 to 16) <= STX & MY_ADDR & "RVER" & FIRMWARE_VER & EOT & ACK & TERM;
                  RxPointer <= 1;
                  Mode      <= IDLE;

               when others =>
                  TxBuffer(1 to 2) <= NAK & TERM;
                  Mode             <= IDLE;
               end case;
            elsif (Mode = GET_DEC) then
               if (RxBuffer(RxPointer) /= EOT) and (RxPointer < 31) then
                  MyInt <= MyInt * 10 + CharToInt(RxBuffer(RxPointer)); -- Char'pos gives ascii offset of 0, which is x'30 or 48
                  if (RxBuffer(RxPointer) >= '0') and (RxBuffer(RxPointer) <= 'F') then
                     MyHex <= MyHex(59 downto 0) & CharToSlv(RxBuffer(RxPointer), 4);
                  else
                     Mode <= IDLE;
                     RxPointer <= 1;
                     TxBuffer(1 to 2) <= NAK & TERM;
                  end if;
                  RxPointer <= RxPointer + 1;
               else
                  Mode <= IDLE;
                  RxPointer <= 1;
                  case (SubMode) is
                  when XPNT =>
                     if (CrossPointer < OUTPUT_PAIRS and MyInt <= 24) then
                        Selects(CrossPointer) <= std_logic_vector(to_unsigned(MyInt, IN_WIDTH));
                        TxBuffer(1 to 2) <= ACK & TERM;
                     else
                        TxBuffer(1 to 2) <= NAK & TERM;
                     end if;
                  when others =>
                  end case;
               end if;
            end if;

            if (arvalid and arready) then -- ready to read?
               arvalid  <= '0';
               rready   <= '1';
            else
               RdPending <= '1';
            end if;

            if (WrPending) then
               TxData    <= TxBuffer(TxPointer);
               TxEn      <= '1';
               TxEnCount <= 31;
               if (TxBuffer(TxPointer + 1) = TERM) then  -- if end of message
                  TxPointer <= 1;
                  TxBuffer(1) <= TERM; -- disable Tx
               else
                  TxPointer   <= TxPointer + 1;
               end if;
               awvalid     <= '1';
               wvalid      <= '1';
               bready      <= '1';
               WrPending   <= '0';
            elsif (RdPending) then
               arvalid     <= '1';  -- initiate first read
               RdPending   <= '0';
            end if ;

            if (rready and rvalid) then
               rready <= '0';
               if (araddr = RX_FIFO) then          -- if reading Rx fifo, then must be full
                  RxBuffer(RxPointer)  <= rDataStr;
                  araddr               <= SR;
                  arvalid <= '1';
                  if (rDataStr = EOT) then   -- if end of text, verify address, else reset
                     if (RxBuffer(1 to 5) = STX & MY_ADDR) then
                        Mode        <= PROC;
                        MyInt       <= 0;
                     else
                        RxPointer   <= 1;
                     end if;
                  elsif (rDataStr = STX) then
                     RxBuffer(1) <= STX;
                     RxPointer <= 2;   -- start over regardless of previous activity
                 else
                     RxPointer <= RxPointer + 1;
                  end if;
               elsif  ((araddr = SR) and (rdata(RXFIFO_VALID) = '1') and (bready = '0')) then    -- Rx Fifo has data
                  araddr <= RX_FIFO;
                  arvalid <= '1';
               elsif ((araddr = SR) and (rdata(TXFIFO_FULL) = '0') and (TxBuffer(1) /= TERM)) and (awvalid = '0') and (wvalid = '0') then
                  -- awaddr is always pointing to Txfifo
                  if (TxBuffer(TxPointer) /= TERM) then
                     WrPending <= '1';
                  end if;
               elsif ((araddr = SR) and (rdata(TXFIFO_EMPTY) = '1') and (TxEn = '1')) then
                  if (TxEnCount > 0) then
                     TxEnCount <= TxEnCount - 1;
                  else
                     TxEnCount <= 31;
                     TxEn <= '0';
                  end if;
               end if;
            end if;

            if (awvalid and awready) then       -- if Write is active, terminate on WrReady (ack)
               awvalid <= '0';
            end if;

            if (wvalid and wready) then  -- wait for ready to terminate current write
               wvalid <= '0';
            end if;

            if (bvalid and bready) then
               bready <= '0';
            end if;

         end if;
      end if;
   end process Uart_process;

   Uart : UartLite93Mhz
   PORT MAP (
      s_axi_aclk     => clk,           -- IN
      s_axi_aresetn  => not reset,     -- IN
      interrupt      => interrupt,     -- OUT
      s_axi_awaddr   => awaddr,        -- IN
      s_axi_awvalid  => awvalid,       -- IN
      s_axi_awready  => awready,       -- OUT
      s_axi_wdata    => wdata,         -- IN
      s_axi_wstrb    => wstrb,         -- IN
      s_axi_wvalid   => wvalid,        -- IN
      s_axi_wready   => wready,        -- OUT
      s_axi_bresp    => bresp,         -- OUT
      s_axi_bvalid   => bvalid,        -- OUT
      s_axi_bready   => bready,        -- IN
      s_axi_araddr   => araddr,        -- IN
      s_axi_arvalid  => arvalid,       -- IN
      s_axi_arready  => arready,       -- OUT
      s_axi_rdata    => rdata,         -- OUT
      s_axi_rresp    => rresp,         -- OUT
      s_axi_rvalid   => rvalid,        -- OUT
      s_axi_rready   => rready,        -- IN
      Rx             => Rxd,           -- IN
      Tx             => Txd            -- OUT
   );

   EFUSE_USR_inst : EFUSE_USR
      generic map (
         SIM_EFUSE_VALUE => x"00123400"  -- "1.01" Value of the 32-bit non-volatile value used in simulation
      )
      port map (
         EFUSEUSR => EFuse  -- 32-bit output: User eFUSE register value output
   );

END rtl;

/*
S0123CXPT0000ET
S0123CXPT0101ET
S0123CXPT0202ET
S0123CXPT0303ET
S0123CXPT0404ET
S0123CXPT0505ET
S0123CXPT0606ET
S0123CXPT0707ET
S0123CXPT0808ET
S0123CXPT0909ET
S0123CXPT1010ET
S0123CXPT1111ET
S0123CXPT1212ET
S0123CXPT1313ET
S0123CXPT1414ET
S0123CXPT1515ET
S0123CXPT1616ET
*/