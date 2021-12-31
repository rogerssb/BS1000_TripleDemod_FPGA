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

Module Name: interLeave.vhd
Description: On reset and validIn pack data into a WIDTH x DEPTH array in 0 to WIDTH-1
   then 0 to DEPTH-1 order to be read out in 0 to DEPTH-1 by 0 to WIDTH-1 order
   when Pack is high to interleave the data. If Pack is low, then deinterleave
   by writing in DEPTH then WIDTH order.
   To allow reading while writing there will be two arrays to ping-pong.
   The maximum interleave depth is set at 16

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

ENTITY interLeave IS
      GENERIC(
         DATA_WIDTH  : positive := 8;
         MAX_WIDTH   : positive := 255;
         MAX_DEPTH   : positive := 8
      );
   PORT(
      clk,
      reset,
      ce,
      validIn,       -- dataIn is valid
      pack           : IN  std_logic;     -- pack or unpack
      WidthSlv       : IN  std_logic_vector (7 downto 0);
      DepthSlv       : IN  std_logic_vector (3 downto 0);
      dataIn         : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
      readyOut       : OUT std_logic;     -- buffer is full and can be read
      dataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
   );
END interLeave;


ARCHITECTURE rtl OF interLeave IS

   COMPONENT RAM_2Reads_1Write IS
      GENERIC(
         FILENAME    : string    := "";      -- Filename is absolute for Vivado and Modelsim to find
         DATA_WIDTH  : positive  := 32;
         BINPT       : integer   := -20;      -- only used to scale file readings. Watch the sign
         ADDR_WIDTH  : natural   := 9;
         FILE_IS_SLV : boolean   := false;    -- nonSLV files are not synthesizable, SLVs are 32 bit hex
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

   constant ADDR_WIDTH           : natural := WidthSlv'left + DepthSlv'left + 1;

   SIGNAL   WidthCntrRd,
            WidthCntrWr          : natural range 0 to MAX_WIDTH-1;
   signal   DepthCntrRd,
            DepthCntrWr          : natural range 0 to MAX_DEPTH-1;
   signal   Ping,
            PingDly,
            validInDly0,
            validInDly1          : std_logic;
   signal   Width                : unsigned(7 downto 0);
   signal   Depth                : unsigned(DepthSlv'range);
   signal   DataOut0,
            DataOut1             : std_logic_vector(DATA_WIDTH-1 DOWNTO 0);
   signal   readyDly             : std_logic_vector(2 DOWNTO 0);
   signal   WrAddr,
            RdAddr               : natural range 0 to 2**ADDR_WIDTH - 1;

BEGIN

   Width <= unsigned(WidthSlv);
   Depth <= unsigned(DepthSlv);
   validInDly0 <= validIn and Ping;
   validInDly1 <= validIn and not Ping;

  InterLeaveProcess: process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            readyDly    <= "000";
            PingDly     <= '0';
            readyOut    <= '0';
         else
            readyDly    <= readyDly(1 downto 0) & validIn;
            PingDly     <= Ping;
            readyOut    <= readyDly(2);
         end if;

         if (reset) then
            WidthCntrRd <= 0;
            WidthCntrWr <= 0;
            DepthCntrRd <= 0;
            DepthCntrWr <= 0;
            Ping        <= '0';
         elsif (ce and validIn) then      -- use validIn to enable the outputs since they're both the same rate
            if (PingDly) then             -- buffer actions. read one while writing the other
               dataOut <= DataOut1;
           else
               dataOut <= DataOut0;
           end if;

            if (pack) then    -- Count Width by Depth
               -- Write Routine
               if (WidthCntrWr < Width-1) then
                  WidthCntrWr <= WidthCntrWr + 1;
               else
                  WidthCntrWr <= 0;
                  if (DepthCntrWr < Depth - 1) then
                     DepthCntrWr <= DepthCntrWr + 1;
                  else
                     WidthCntrRd <= 0;    -- buffer is full, ping and sync all counters
                     WidthCntrWr <= 0;
                     DepthCntrRd <= 0;
                     DepthCntrWr <= 0;
                     Ping <= not Ping;
                  end if;
               end if;

               -- read routine
               if (DepthCntrRd < Depth - 1) then
                  DepthCntrRd <= DepthCntrRd + 1;
               else
                  DepthCntrRd <= 0;
                  if (WidthCntrRd < Width-1) then
                     WidthCntrRd <= WidthCntrRd + 1;
                  else
                     WidthCntrRd <= 0;
                  end if;
               end if;
            else     -- unpack
               -- Write Routine, Count Depth by width
               if (DepthCntrWr < Depth - 1) then
                  DepthCntrWr <= DepthCntrWr + 1;
               else
                  DepthCntrWr <= 0;
                  if (WidthCntrWr < Width-1) then
                     WidthCntrWr <= WidthCntrWr + 1;
                  else
                     WidthCntrRd <= 0;    -- buffer is full, ping and sync all counters
                     WidthCntrWr <= 0;
                     DepthCntrRd <= 0;
                     DepthCntrWr <= 0;
                     Ping <= not Ping;
                  end if;
               end if;

               -- read routine
               if (WidthCntrRd < Width - 1) then
                  WidthCntrRd <= WidthCntrRd + 1;
               else
                  WidthCntrRd <= 0;
                  if (DepthCntrRd < Depth-1) then
                     DepthCntrRd <= DepthCntrRd + 1;
                  else
                     DepthCntrRd <= 0;
                  end if;
               end if;
            end if;
        end if;
      end if;
   end process InterleaveProcess;

   WrAddr <= (DepthCntrWr * 256) + WidthCntrWr;
   RdAddr <= (DepthCntrRd * 256) + WidthCntrRd;

   Buffer0 : RAM_2Reads_1Write
      GENERIC MAP (
         DATA_WIDTH  => DATA_WIDTH,
         ADDR_WIDTH  => ADDR_WIDTH
      )
      PORT MAP (
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => validInDly0,
         WrAddr      => WrAddr,
         RdAddrA     => RdAddr,
         RdAddrB     => 0,
         WrData      => dataIn,
         RdOutA      => DataOut0,
         RdOutB      => open
      );

   Buffer1 : RAM_2Reads_1Write
      GENERIC MAP (
         DATA_WIDTH  => DATA_WIDTH,
         ADDR_WIDTH  => ADDR_WIDTH
      )
      PORT MAP (
         clk         => clk,
         ce          => ce,
         reset       => reset,
         WrEn        => validInDly1,
         WrAddr      => WrAddr,
         RdAddrA     => RdAddr,
         RdAddrB     => 0,
         WrData      => dataIn,
         RdOutA      => DataOut1,
         RdOutB      => open
      );

END rtl;

