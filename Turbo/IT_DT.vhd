/*                  PROPRIETARY NOTICE
----------------------------------------------------------------------------
(c) Copyright 2014 Semco Inc. All rights reserved.

This file contains Semco Inc. proprietary information. It is the
property of Semco Inc. and shall not be used, disclosed to others or
reproduced without the express written consent of Semco Inc.,
including, but without limitation, it is not to be used in the creation,
manufacture, development, or derivation of any designs, or configuration.

----------------------------------------------------------------------------

Company:     Semco Inc.

Module Name: IT_DT.vhd
Description: Read the Interleave and Deinterleave memories.

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
USE WORK.SEMCO_PKG.ALL;

ENTITY IT_DT IS
      GENERIC(
         FILE_LOC    : string := "TurboCodes/"
      );
   PORT(
      Clk,
      ce,
      reset          : IN  std_logic;
      IT_Addr,
      DT_Addr        : IN  natural range 0 to 8923;
      Frame          : IN  natural range 0 to 5;  -- 1784*(1,2,4 or 5) skip 3
      IT_Data,
      DT_Data        : OUT natural range 0 to 8919
   );
END IT_DT;


ARCHITECTURE rtl OF IT_DT IS

   COMPONENT ROM_Natural IS
      GENERIC(
         FILENAME    : string    := "..\file.slv";
         DATA_WIDTH  : Natural  := 18;
         DEPTH       : Natural  := 2048;
         LATENCY     : Natural  := 1;       -- 1 or 2
         MEM_TYPE    : string    := "block"  -- or "distributed"
      );
      PORT(
         clk,
         ce,
         reset          : IN  std_logic;
         AddrA,
         AddrB          : IN  integer range 0 to DEPTH-1;
         OutA,
         OutB           : OUT Natural range 0 to 2**DATA_WIDTH-1
      );
   END COMPONENT ROM_Natural;

   constant FRAME_SIZE  : int_array(0 to 5) := (0, 1*1784, 2*1784, 3*1784, 4*1784, 5*1784);

   signal   IT_1784,
            DT_1784,
            IT_Addr1,
            DT_Addr1       : natural range 0 to 1783;
   signal   IT_3568,
            DT_3568,
            IT_Addr2,
            DT_Addr2       : natural range 0 to 3567;
   signal   IT_7136,
            DT_7136,
            IT_Addr4,
            DT_Addr4       : natural range 0 to 7135;
   signal   IT_8920,
            DT_8920,
            IT_Addr5,
            DT_Addr5       : natural range 0 to 8919;

begin

   IT_Addr1 <= IT_Addr when (IT_Addr < FRAME_SIZE(1) ) else 0;
   DT_Addr1 <= DT_Addr when (DT_Addr < FRAME_SIZE(1) ) else 0;
   IT_Addr2 <= IT_Addr when (IT_Addr < FRAME_SIZE(2) ) else 0;
   DT_Addr2 <= DT_Addr when (DT_Addr < FRAME_SIZE(2) ) else 0;
   IT_Addr4 <= IT_Addr when (IT_Addr < FRAME_SIZE(4) ) else 0;
   DT_Addr4 <= DT_Addr when (DT_Addr < FRAME_SIZE(4) ) else 0;
   IT_Addr5 <= IT_Addr when (IT_Addr < FRAME_SIZE(5) ) else 0;
   DT_Addr5 <= DT_Addr when (DT_Addr < FRAME_SIZE(5) ) else 0;

   IT1784_u : ROM_Natural
      GENERIC MAP(
         FILENAME    => FILE_LOC & "IT_1784.hex",
         DATA_WIDTH  => 11,
         DEPTH       => FRAME_SIZE(1)+4,
         LATENCY     => 1,       -- 1 or 2
         MEM_TYPE    => "block"  -- or "distributed"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         AddrA       => IT_Addr1,
         AddrB       => 0,
         OutA        => IT_1784,
         OutB        => open
      );

   DT1784_u : ROM_Natural
      GENERIC MAP(
         FILENAME    => FILE_LOC & "DT_1784.hex",
         DATA_WIDTH  => 11,
         DEPTH       => FRAME_SIZE(1)+4,
         LATENCY     => 1,       -- 1 or 2
         MEM_TYPE    => "block"  -- or "distributed"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         AddrA       => DT_Addr1,
         AddrB       => 0,
         OutA        => DT_1784,
         OutB        => open
      );

   IT3568_u : ROM_Natural
      GENERIC MAP(
         FILENAME    => FILE_LOC & "IT_3568.hex",
         DATA_WIDTH  => 12,
         DEPTH       => FRAME_SIZE(2)+4,
         LATENCY     => 1,       -- 1 or 2
         MEM_TYPE    => "block"  -- or "distributed"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         AddrA       => IT_Addr2,
         AddrB       => 0,
         OutA        => IT_3568,
         OutB        => open
      );

   DT3568_u : ROM_Natural
      GENERIC MAP(
         FILENAME    => FILE_LOC & "DT_3568.hex",
         DATA_WIDTH  => 12,
         DEPTH       => FRAME_SIZE(2)+4,
         LATENCY     => 1,       -- 1 or 2
         MEM_TYPE    => "block"  -- or "distributed"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         AddrA       => DT_Addr2,
         AddrB       => 0,
         OutA        => DT_3568,
         OutB        => open
      );

   IT7136_u : ROM_Natural
      GENERIC MAP(
         FILENAME    => FILE_LOC & "IT_7136.hex",
         DATA_WIDTH  => 13,
         DEPTH       => FRAME_SIZE(4)+4,
         LATENCY     => 1,       -- 1 or 2
         MEM_TYPE    => "block"  -- or "distributed"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         AddrA       => IT_Addr4,
         AddrB       => 0,
         OutA        => IT_7136,
         OutB        => open
      );

   DT7136_u : ROM_Natural
      GENERIC MAP(
         FILENAME    => FILE_LOC & "DT_7136.hex",
         DATA_WIDTH  => 13,
         DEPTH       => FRAME_SIZE(4)+4,
         LATENCY     => 1,       -- 1 or 2
         MEM_TYPE    => "block"  -- or "distributed"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         AddrA       => DT_Addr4,
         AddrB       => 0,
         OutA        => DT_7136,
         OutB        => open
      );

   IT8920_u : ROM_Natural
      GENERIC MAP(
         FILENAME    => FILE_LOC & "IT_8920.hex",
         DATA_WIDTH  => 14,
         DEPTH       => FRAME_SIZE(5)+4,
         LATENCY     => 1,       -- 1 or 2
         MEM_TYPE    => "block"  -- or "distributed"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         AddrA       => IT_Addr5,
         AddrB       => 0,
         OutA        => IT_8920,
         OutB        => open
      );

   DT8920_u : ROM_Natural
      GENERIC MAP(
         FILENAME    => FILE_LOC & "DT_8920.hex",
         DATA_WIDTH  => 14,
         DEPTH       => FRAME_SIZE(5)+4,
         LATENCY     => 1,       -- 1 or 2
         MEM_TYPE    => "block"  -- or "distributed"
      )
      PORT MAP(
         clk         => Clk,
         ce          => ce,
         reset       => reset,
         AddrA       => DT_Addr5,
         AddrB       => 0,
         OutA        => DT_8920,
         OutB        => open
      );

   IT_Data <= IT_1784 when (Frame = 1) else IT_3568 when (Frame = 2) else IT_7136 when (Frame = 4) else IT_8920;
   DT_Data <= DT_1784 when (Frame = 1) else DT_3568 when (Frame = 2) else DT_7136 when (Frame = 4) else DT_8920;

end rtl;