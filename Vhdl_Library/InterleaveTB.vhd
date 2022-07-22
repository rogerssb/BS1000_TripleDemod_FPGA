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

Module Name: InterLeave.vhd
Description:   Fill a 2D array of Dimension Rows x Cols bytes according to Pack
input.
   If Pack, fill across by Cols then down one Row. Read by Rows, then Cols.
   If unPack, fill by Rows then Cols. Read by Cols then Rows

   Passing data through both processes should recreate the original stream.

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

ENTITY InterleaveTB IS
END InterleaveTB;


ARCHITECTURE rtl OF InterleaveTB IS

   COMPONENT InterLeave IS
      GENERIC(
         DATA_WIDTH  : positive := 8;
         MAX_COLS    : positive := 255;
         MAX_ROWS    : positive := 5
      );
      PORT(
         clk,
         reset,
         ce,
         validIn,       -- dataIn is valid
         pack           : IN  std_logic;     -- pack or unpack
         ColsSlv        : IN  std_logic_vector (7 downto 0);
         RowsSlv        : IN  std_logic_vector (3 downto 0);
         dataIn         : IN  std_logic_vector(DATA_WIDTH-1 downto 0);
         readyOut       : OUT std_logic;     -- buffer is full and can be read
         dataOut        : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
      );
   END COMPONENT InterLeave;

  -- Signals
   signal   clk,
            validIn,
            packReady,
            unPackRdy      : std_logic := '0';
   signal   reset          : std_logic := '1';
   signal   dataIn         : unsigned(7 downto 0) := 8x"00";
   signal   dataOut,
            UnPacked       : std_logic_vector(7 downto 0);
   signal   Delay          : unsigned(2 downto 0) := "000";
   signal   Cols           : std_logic_vector(7 downto 0) := x"FF";
   signal   Rows           : std_logic_vector(3 downto 0) := "0000";

BEGIN

   process begin
      wait for 10 ns;   -- run at 46MHz rate
         clk <= not clk;
   end process;

   process begin
      Rows <= std_logic_vector(unsigned(Rows) + 1);
      wait until rising_edge(clk);
      reset <= '1';
      wait until rising_edge(clk);
      reset <= '0';
      wait for 1500 us;
   end process;

  Test_process: process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            validIn <= '0';
            Delay <= "000";
            dataIn <= x"00";
         else
            if (Delay = 3) then
               Delay <= "000";
               validIn <= '1';
            else
            Delay <= Delay + 1;
            validIn <= '0';
            end if;
            if (validIn) then
               if (dataIn = x"C0") then
                  dataIn <= x"00";
               else
                  dataIn  <= dataIn + 1;
               end if;
            end if;
         end if;
      end if;
   end process Test_process;

   PackIt : interLeave
         GENERIC  MAP(
            DATA_WIDTH  => 8,
            MAX_Cols    => 255,
            MAX_Rows    => 8
         )
         PORT MAP(
            clk         => clk,
            reset       => reset,
            ce          => '1',
            validIn     => validIn,
            pack        => '1',
            RowsSlv     => Rows,
            ColsSlv     => Cols,
            dataIn      => std_logic_vector(dataIn),
            readyOut    => packReady,
            dataOut     => dataOut
         );

   UnPackIt : interLeave
         GENERIC  MAP(
            DATA_WIDTH  => 8,
            MAX_Cols   => 255,
            MAX_Rows   => 8
         )
         PORT MAP(
            clk         => clk,
            reset       => reset,
            ce          => '1',
            validIn     => packReady,
            pack        => '0',
            RowsSlv     => Rows,
            ColsSlv     => Cols,
            dataIn      => std_logic_vector(dataOut),
            readyOut    => unPackRdy,
            dataOut     => unPacked
         );

END rtl;
