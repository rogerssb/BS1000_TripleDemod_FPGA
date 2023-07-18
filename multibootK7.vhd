/*
   This program boots into an extended IDLE state waiting for the ICAPE2 to initialize.
   It then reads the ID_CODE register from the FPGAs brain. This is output to the user.
   For a 7k325 it should be 0x051, for the 7k160 is should be 0x04C. If neither, another
   read is started till successful.
   If the user read a valid idCode from the module, they can then setup the Warm Boot
   Start Address and send a pulse to reboot the FPGA from the new boot address.
*/

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

ENTITY multibootK7_FZ IS
   PORT(
      clk,
      reset,
      pulse       : IN  std_logic;
      addr        : IN  std_logic_vector(31 downto 0);
      idCode      : OUT std_logic_vector(8 downto 0)
   );
END multibootK7_FZ;


ARCHITECTURE rtl OF multibootK7_FZ IS


   type states is (IDLE, WR_LOW, DUMMY, SYNC, NOOP, IDCODE_RD, CS_HI,
                   RD_STATE, WBSTAR_WR, BOOT_ADDR, CMD, IPROG, DESYNC);
   TYPE vector_of_states   IS ARRAY (NATURAL RANGE <>) OF states;

   constant    LAST_WORD   : natural := 31;
   constant    READ        : std_logic_vector(13 downto 0) := 3b"001" & 2b"01" & 9b"0";
   constant    WRITE       : std_logic_vector(13 downto 0) := 3b"001" & 2b"10" & 9b"0";
   constant    NOP         : std_logic_vector(31 downto 0) := 32x"2000_0000";
   constant    CMD_ADDR    : std_logic_vector(6  downto 0) := 5b"00100" & 2b"00";
   constant    IDCODE_ADDR : std_logic_vector(6  downto 0) := 5b"01100" & 2b"00";
   constant    WBSTAR_ADDR : std_logic_vector(6  downto 0) := 5b"10000" & 2b"00";
   constant    DESYNC_CMD  : std_logic_vector(31 downto 0) := 32x"d";
   constant    IPROG_CMD   : std_logic_vector(31 downto 0) := 32x"0000_000F";
   constant    IDCODE_CNT  : natural := 14;

   signal    packets       : vector_of_states(0 to LAST_WORD) := (
      IDLE, WR_LOW, DUMMY, SYNC, NOOP, IDCODE_RD, NOOP, NOOP, CS_HI,                -- 8 Write IDCODE read command
      IDLE, RD_STATE, RD_STATE, RD_STATE, RD_STATE, IDLE, IDLE,                     -- 15 Read IDCODE, UG470 pg 129
      WR_LOW, CMD, RD_STATE, CS_HI, IDLE,                                           -- 20 ABORT
      WR_LOW, DUMMY, SYNC, NOOP, WBSTAR_WR, BOOT_ADDR, CMD, IPROG, NOOP, CS_HI, IDLE -- 31 Reboot to BootAddr, UG470 pg 146
      );

   signal   state       : states;
   signal   o, i,
            d,
            iCapeOut    : std_logic_vector(31 downto 0);
   signal   stop,
            cnt         : natural range 0 to 255;
   signal   rdWr_n,
            cs_n        : std_logic;

   attribute MARK_DEBUG : string;
   attribute MARK_DEBUG of state, d, iCapeOut, cnt, rdWr_n, cs_n, idCode : signal is "TRUE";


begin


   iCapeOut <=     -- byte reverse iCape2 output
          o(24) & o(25) & o(26) &  o(27) & o(28) & o(29) & o(30) & o(31) &
          o(16) & o(17) & o(18) &  o(19) & o(20) & o(21) & o(22) & o(23) &
          o( 8) & o( 9) & o(10) &  o(11) & o(12) & o(13) & o(14) & o(15) &
          o( 0) & o( 1) & o( 2) &  o( 3) & o( 4) & o( 5) & o( 6) & o( 7);

   cnt_process : process (clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            stop     <= 255;
            cnt      <= LAST_WORD + 1;
         elsif (pulse) then
            cnt   <= 16;      -- send an abort in case the idCode is still trying
            stop  <= 31;
         elsif (cnt < stop) then
            cnt <= cnt + 1;
         elsif ((idCode = 9x"000") or (idCode = 9x"1FF")) then
            cnt   <= 0;
            stop  <= 20;
         end if;
      end if;
   end process;


   state <= packets(cnt) when (cnt <= LAST_WORD) else IDLE;

   process_states : process(clk)
   begin
      if (rising_edge(clk)) then
         if (reset) then
            d       <= 32x"FFFF_FFFF";
            rdWr_n  <= '1';
            cs_n    <= '1';
            idCode  <= 9x"1FF";
         else
            case(state) is
               when IDLE =>
                   rdWr_n  <= '1';
                   cs_n    <= '1';
                   d       <= 32x"FFFF_FFFF";
               when WR_LOW =>
                   rdWr_n  <= '0';
                   cs_n    <= '1';
                   d       <= 32x"FFFF_FFFF";
               when DUMMY =>
                   rdWr_n  <= '0';
                   cs_n    <= '0';
                   d       <= 32x"FFFF_FFFF";
               when SYNC =>
                   rdWr_n  <= '0';
                   cs_n    <= '0';
                   d       <= 32x"aa99_5566";
               when NOOP =>
                   rdWr_n  <= '0';
                   cs_n    <= '0';
                   d       <= NOP;
               when IDCODE_RD =>
                   rdWr_n  <= '0';
                   cs_n    <= '0';
                   d       <= (READ & IDCODE_ADDR & 11x"1");
               when WBSTAR_WR =>
                   rdWr_n  <= '0';
                   cs_n    <= '0';
                   d       <= (WRITE & WBSTAR_ADDR & 11x"1");
               when BOOT_ADDR =>
                  rdWr_n  <= '0';
                  cs_n    <= '0';
                  d <= 8x"0" & addr(31 downto 8);
               when CMD =>
                   rdWr_n  <= '0';
                   cs_n    <= '0';
                   d       <= (WRITE & CMD_ADDR & 11x"1");
               when IPROG =>
                   rdWr_n  <= '0';
                   cs_n    <= '0';
                   d       <= IPROG_CMD;
               when DESYNC =>
                   rdWr_n  <= '0';
                   cs_n    <= '0';
                   d       <= DESYNC_CMD;
               when CS_HI =>
                   rdWr_n  <= '0';
                   cs_n    <= '1';
                   d       <= 32x"FFFF_FFFF";
               when RD_STATE =>
                   rdWr_n  <= '1';
                   cs_n    <= '0';
                   d       <= 32x"FFFF_FFFF";
               when others =>
                   rdWr_n  <= '1';
                   cs_n    <= '1';
                   d       <= 32x"FFFF_FFFF";
            end case;

            -- Bit reverse the bytes
            if (cnt = IDCODE_CNT) then
                  idCode <= iCapeOut(20 downto 12);
            end if;
         end if;
      end if;
   end process;

   i <= d(24) & d(25) & d(26) & d(27) & d(28) & d(29) & d(30) & d(31) &
      d(16) & d(17) & d(18) & d(19) & d(20) & d(21) & d(22) & d(23) &
      d( 8) & d( 9) & d(10) & d(11) & d(12) & d(13) & d(14) & d(15) &
      d( 0) & d( 1) & d( 2) & d( 3) & d( 4) & d( 5) & d( 6) & d( 7);

   icape : ICAPE2
      port map (
         CLK   => clk,
         CSIB  => cs_n,
         I     => i,
         O     => o,
         RDWRB => rdWr_n
    );


end rtl;