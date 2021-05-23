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
-------------------------------------------------------------
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Semco_pkg.ALL;

ENTITY AD9957 IS
   PORT(
      clk,
      reset,
      DdsMiso        : IN  std_logic;
      DdsMosi,
      DdsCS_n,
      DdsClk,
      IO_Reset,
      DdsReset,
      DdsUpdate      : OUT std_logic
   );
END AD9957;


ARCHITECTURE rtl OF AD9957 IS

   constant BITS_9957      : INT_ARRAY( 0 to 31) := (
                              32, 32, 32, 32,
                              32, 48, 48, 0,
                              0, 32, 32, 0,
                              0, 0, 64, 64,
                              64, 64, 64, 64,
                              64, 64, 32, 0,
                              16, 16, 0 , 0,
                              0, 0, 0, 0);
   --        SendString(ADDR_SET & "CREG00_0020_0002]")    ' Enable SDO for serial output, clear CCI, enable Inverse Sinc
   constant CREG00      : std_logic_vector(0 to 39) := (x"0000600002");
   --        SendString(ADDR_SET & "RREG00]")            ' verify write by reading back
   --        SendString(ADDR_SET & "CREG01_0040_2800]")    ' set PDClk rate control for DDR data
   constant CREG01      : std_logic_vector(0 to 39) := (x"0100002800");
   --        SendString(ADDR_SET & "RREG01]")
   --        If (DivRefBy2 = 2) Then
   --            SendString(ADDR_SET & "CREG02_1F3F_4000]")    ' enable refclk div and PLL, VCO sel = 5, ChargePump = 7
   --        Else
   --            SendString(ADDR_SET & "CREG02_1F3F_C000]")    ' disable refclk div and PLL, VCO sel = 5, ChargePump = 7
   --        End If
   constant CREG02      : std_logic_vector(0 to 39) := (x"020B3F4100");
   --        SendString(ADDR_SET & "RREG02]")
   --        SendString(ADDR_SET & "CREG03_0000_0060]")    ' set max amplitude
   constant CREG03      : std_logic_vector(0 to 39) := (x"0300007F60");
   --        SendString(ADDR_SET & "RREG03]")
   --        SendString(ADDR_SET & "CREG09_0000_00FC]")    ' set max amplitude
   constant CREG09      : std_logic_vector(0 to 39) := (x"09000000FC");
   --        SendString(ADDR_SET & "RREG09]")
   --        SendString(ADDR_SET & "CREG0A_0000_0000]")    ' disable multichip sync
   constant CREG0A      : std_logic_vector(0 to 39) := (x"0A00000000");
   --        SendString(ADDR_SET & "RREG0A]")
   --        Dim Fc As Decimal = 70000000
   --        Dim FTW As UInt32 = (Fc / SysClk) * (2 ^ 32)
   --        Dim FTWstr, InterpStr As String
   --        FTWstr = FTW.ToString("X8")
   --        InterpStr = Interp * 4.ToString("X1")   ' shift left 2 bits
   --        SendString(ADDR_SET & "CREG0E0" & InterpStr & "B50000" & FTWstr & "]")  ' set scale to 1.414 to avoid overflows
   --        SendString(ADDR_SET & "RREG0E]")
   constant CREG0E      : std_logic_vector(0 to 71) := (x"0E20B500001800000E");
   constant NUM_REGS    : integer := 7;

   type     mode_t      is (IDLE, PROC, SEND_DATA);

   signal   Mode        : mode_t;
   signal   Command     : integer range 0 to NUM_REGS-1;
--   signal   ShiftMiso   : STD_LOGIC_VECTOR(4 DOWNTO 0);
--   signal   Addr9957    : integer range 0 to 31 := 0;
   signal   Count9957   : integer range 0 to 72 := 0;
   signal   Shift9957   : std_logic_vector(0 to 71);
   signal   IO_Update   : STD_LOGIC_VECTOR(2 DOWNTO 0);
/*
   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of Mode, Shift9957, Count9957,
         DdsCS_n, DdsClk, DdsMosi, DdsMiso, IO_Update, IO_Reset, Command : signal is "TRUE";
*/
BEGIN


   Uart_process: process (clk)
      variable Addr9957_v : integer range 0 to 31;
   begin
      if (rising_edge(clk)) then
         if (reset = '1') then
            Shift9957      <= (others=>'0');
            Mode           <= PROC;
            DdsCS_n        <= '1';
            DdsClk         <= '0';
            IO_Update      <= "000";
            IO_Reset       <= '1';
            Command        <= 0;
            Count9957      <= 0;
   --            ShiftMiso      <= "00001";
   --            CountMiso      <= 1;
         else
            if (Mode = PROC) then
               case (Command) is
               when 0 =>
                  Mode        <= SEND_DATA;
                  Count9957   <= CREG00'length;
                  Shift9957(0 to CREG00'length-1) <= CREG00;
               when 1 =>
                  Mode        <= SEND_DATA;
                  Count9957   <= CREG01'length;
                  Shift9957(0 to CREG01'length-1) <= CREG01;
               when 2 =>
                  Mode        <= SEND_DATA;
                  Count9957   <= CREG02'length;
                  Shift9957(0 to CREG02'length-1) <= CREG02;
               when 3 =>
                  Mode        <= SEND_DATA;
                  Count9957   <= CREG03'length;
                  Shift9957(0 to CREG03'length-1) <= CREG03;
               when 4 =>
                  Mode        <= SEND_DATA;
                  Count9957   <= CREG09'length;
                  Shift9957(0 to CREG09'length-1) <= CREG09;
               when 5 =>
                  Mode        <= SEND_DATA;
                  Count9957   <= CREG0A'length;
                  Shift9957(0 to CREG0A'length-1) <= CREG0A;
               when 6 =>
                  Mode        <= SEND_DATA;
                  Count9957   <= CREG0E'length;
                  Shift9957(0 to CREG0E'length-1) <= CREG0E;
/*
               -- Read status commands
               when "RREG" => -- Read AD9957, AA, EOT, AA is hex address. Byte Count is pulled from address of BITS_9957 array
                  Mode        <= GET_BYTES;
                  CountMiso   <= 6;
                  ShiftMiso   <= "00001";
                  TxBuffer    <= (others=>TERM);
                  Addr9957_v  := CharToInt(RxBuffer(DATA_STRT)) * 16 + CharToInt(RxBuffer(DATA_STRT+1));
                  Addr9957    <= Addr9957_v;
                  Count9957   <= BITS_9957(Addr9957_v) + 8; -- add instruction bits
                  Shift9957   <= "100" & std_logic_vector(to_unsigned(Addr9957_v, 5)) & 64x"00";
                  SubMode     <= READ;
               */
               when others =>
                  Mode             <= IDLE;
               end case;
            end if;


            if (Count9957 > 0) then    -- used for read and write DDS 9957 when Count > 0
               if (DdsCS_n and not IO_Reset) then
                  IO_Reset <= '1';
               elsif (IO_Reset) then
                  IO_Reset <= '0';
                  DdsCS_n  <= '0';
               end if;
               if (not DdsCS_n) then
                  if (not DdsClk) then     -- CS is low and Clk is low, set high
                     DdsClk <= '1';
                  else
                     DdsClk <= '0';
                     Shift9957   <= Shift9957(1 to 71) & '0'; -- send command to DDS
                     Count9957   <= Count9957 - 1;
   --                     if (Count9957 <= BITS_9957(Addr9957)) then
   --                        if (ShiftMiso(4) = '1') and (SubMode = READ) then
   --                           ShiftMiso <= "0001" & DdsMiso;
   --                              TxBuffer(CountMiso) <= ToHexChar(ShiftMiso(3 downto 0));
   --                              CountMiso <= CountMiso + 1;
   --                        else
   --                           ShiftMiso   <= ShiftMiso(3 downto 0) & DdsMiso;  -- set clock low and shift left one bit. Read DDS while at it
   --                        end if;
   --                     end if;
                   end if;
               end if;
            else
               if (not DdsCS_n) then
                  IO_Update <= "111";
                  DdsCS_n <= '1';
               else
                  IO_Update <= IO_Update(1 downto 0) & '0';
                  if (IO_Update = "100") then
                     Mode    <= PROC;
                     if (Command < NUM_REGS-1) then
                        Command <= Command + 1;
                     else
                        Command <= 0;  -- loop repeatedly
                     end if;
                  end if;
               end if;

               if (IO_Reset) then
                  IO_Reset <= '0';
               end if;
            end if;

         end if;
      end if;
   end process Uart_process;

   DdsMosi     <= Shift9957(0);
   DdsUpdate   <= IO_Update(2);
   DdsReset    <= reset;

END rtl;
