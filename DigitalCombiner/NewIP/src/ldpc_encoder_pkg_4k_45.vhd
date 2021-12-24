--  Module : ldpc_encoder_pkg.vhd
--
--  Description :
--    This package defines constants and types used by the low-density parity
--  check (LDPC) encoder.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ldpc_encoder_pkg_4k_45 is

  -- constants
  constant C_ASM_LENGTH : natural := 256;     -- attached sync marker length
  constant C_LC_k       : natural := 4096;    -- k = information block size
  constant C_UC_K       : natural := 8;       -- rate = K/(K+2)

                                              -- n = code block size
  constant C_LC_n       : natural := (C_LC_k * (C_UC_K + 2)) / C_UC_K;
                                              -- M = submatrix size
  constant C_UC_M       : natural := C_LC_k / C_UC_K;
                                              -- m = circulant size
  constant C_LC_m       : natural := C_UC_M / 4;

  constant C_SHIFT_REGS : natural := 2 * C_UC_M / C_LC_m;
  constant C_CIRC_ROWS  : natural := C_LC_k / C_LC_m;

  --subtype asm_t is std_logic_vector(0 to C_ASM_LENGTH - 1);

  -- hard-coded attached sync marker for length = 256
  --constant C_ASM : asm_t :=
  --(
  --  x"FCB88938D8D76A4F_FCB88938D8D76A4F_034776C7272895B0_FCB88938D8D76A4F"
  --);

  subtype circulant_row_t is std_logic_vector(0 to C_SHIFT_REGS * C_LC_m - 1);
  type circulant_matrix_t is array (0 to C_CIRC_ROWS - 1) of circulant_row_t;

  -- hard-coded generator matrix for (n, k) = (5120, 4096) code
  constant C_G : circulant_matrix_t :=
  (
     "0100011100111011110001010011001110100001001011000011010110010110111101100100001001100111001111010000110110111111000100010100001000000111100110100011100001101000111000011010011011110101010101101111000011011111001111011100101001000100100100111010111001010100101011100100110001010000111100010010101011101111011011101110110111101010100110111011001100000110000001011111010010100010010011001011000010110010101101001011100100000011010100110011000110101011111101010011110111100100011101010010111001111110110110101011111111100111111000001000111011110011111000100010111011100111111011111110011001000101111010011110010110010101000001111010001000000110010100101110010010100010110000000110001001110000101100101101000110100100000110000001001101001011110000001101010110000110011110000000101010000100111001010011001100000011111101000000100100101101101101000111000001010110101011010011110000001000010001111010110100101101111011110111001110000001001110110001011100010000000111100111100110100011101001011000101001111110100100011100010011100010",
	 "0110011001111010101010000001010101100001000000100011010011011011101000001111111110101001010100011100101010111011100010111010011110100011001001110001011001000010111001001011110011011101001001001111100011011000100110111101011110000011001100010111101010111011110011000110010011111010100101011111000001101010111001000101110001111110001110001001001101011101011110001011111101011111100000000101000100001100111010011010101111000110000101010110111100000000100010110011000101111100011110011110000000010010001010110000100100111100101100001001111000100000000000010110101001011111100100111110001000000111110000010100010011101000100010011111001110111001101011100110000110000101111001000011010001011100010110010111000111100000001110101101010010011001111011111000010100001101001100111111101010001011001110010010110011100111100010110101011100010010001010010000110010110010111101010001100011110011111000001100110001000010100111000011100111110000100100010101111010110110000011001010000001010100010110110110101010110010100101100111000101001001",
	 "1111111010011111111101101100001001101000100110001100101110010010011011111001101111001101000100101001101010100101001000001000001100111111110000010101100111011011010110001011011001001101001110011100101100100111100001000111010000110100111100010111011111100010111000000100000011010111000100110110010111011001011010100001110101010100111111010010000000000101000111010011101001010000111001111110100010101100011100110110101101101101001010111011010101000110100011111011111101101000110111011111010101111000100111000010111101001001010101001110010000010101001111001111111100001111010100101111100011111000111101011011001001000011101000000011111000101011100110011010000111011101110100100011001000000100110100010000001111100011001000110001010110001110000011111110111001110110011100110100001111000010101000000111000001000110101110100001101101000011000001111011101001101100111011000111110101110100000011001111111011001011010011100001000100111111100101001100011011001010101001000110010100101110111111011000011001111011010000111101000110011001",
	 "0000100000011110011101111001101111110000000111110011010011001001011100110011011110100011101010111100100001101001100001100100010010011100100111100111100101000001010101011110001001110101010001110010100000111100000110101011001001110000011010100011100010001101111110111001110111111101000110010100011100110001111011000010101011101001100111101010011010110110010000011011001100001001101000100010010110001101010001011010000110111011111010101111111111000111100001111110011000010010100010011010010101001010001001000111001111111101111100111110100101101100011101100111100111101001011110011001000100011100010010111110011001011010001100110011001001010000000101111000001001011001111110000100011010101010100101010101011101111100001011101100010001001000111011100111000010010100001000111010011000011011111001111100110011101101000000110100001010010110010111001010001000110100101011110000001010010001010010010001011011100000010001011011001111000101100001010111000101001111001001110010110101000000110010000000100001011010111001011110100011110100",
	 "0111111110110011010100101011001001101110010101000100101111011100000110001101011101101011001100100011110000111100111000011011101110000100001000011001011001111110111000001000101001101111011100011001101101100111010111110000011011110001001111111111000001011011011001110010110000101001110111000101101110000000111000011000111000101111010011000100001011010000111101101101010111010110110101000111110111100000011100101111011100111010100000000001010110000110001010100010011101011011001011001110101000101111111111000001110000101000010010111000011110101011101000100010001101100010110110011000100101010010010001000010101110111101111110111111010010100011001010110111100110001011110011010101110110001100000010110000001010111011111001011101111001001010100101100101011010011111100110010100000010011110011100101111010000010011100001011001010111111000101100111100000101000000011101001011110110001110001100111110000000111011000001111000001110000011010110001011101110101110011000110001110010000010010110001101011010110000011111010010111000011100",
	 "0100000000110001010010011010000111001000100011100100110101001000100100111111111001110001100110110010011000111000101101111111111110011000100001101111001111101001000011111100000000011000011010011001111100111011001110010001100000111111001000100001100111011100111101011011000011010011101010100100010100010010001001011000011001111001000100111111111110001111111110010111100110111011111000000111100101011101111111001011110011001001100000100001000011000000001010001111110100100001001110000000111010111101110110101011111100001011101111100000110110010001111110100101000001001101110001001101110010001000010010001010111010100000000000010101011101111111010100010110010100111110011101010101111101101100101101001111011101011010110011100011010001111110110010001001100100110000010011010001110100001110111000100011100111011000101001101100001011100010111010100001001111010100110011111011001100111001010011111100101010111111011100000111111000111010110011011000100000101011100100011111110111011101010001001010011111101010000011010001111100111101",
	 "0001010011101011001110000110101001011010010001010010010010011000001101101000001010011001001100110101001111111000110101110110111011111001100001010000010100110100110100101111101101001111000110011111011110000111100010010111010000110101110001011110101100001111101101101000000010000100000011111000110100110100101000001001100101011011101000001010100101001110001100001001101010010001100101000110110001100110110010101010000001010110011110111111111111010110000010011011011001001000010010111100110101000111011101110000001010110110001010100100000001010011101001101001000101100111000110010110100100111101010100000110000010001110110000011101011100010111001000111100001110001110011011110110010010010110001111101110100000110110101011011100011010111011111100111001111101001100110100011010010000001001010001111100000101101010111010101101010000111111011000100001010001010111101111011011011101100110101000010101011111011101011000010001100010101100111101010000001100110101011011010000101100110100011110011000001010001100001010010110000000010110",
     "1010101010110001000001100001111011001001111110100110101110100010000111101000000111010111111000100010110100111010011111101101001011111001000000101011011011000011001101100010010110001111010110110110101101010100011000101000101011001001011000010001011011011110010110010110100011100011000101100111101110110001111000100010000101110001010010110000111101001011001110111001110101111110000010101111000100100011011101000011011000010101010110011101000011110000111000001100011111111100110010010101100110110001101010011101100011000001000000111011011101111001101100111010011101101001101010101000110110010101010100010110000011100100101110011111100110110111001000110001101100101000111000001011011101001001000011001000111010111000100000111111001010011010111101101100110001001111000100101010011111010001111110100011001011111000001010101010111100010010100011111011110001101010110001010011010100110010101010111000100100010111101011000000011000111001001011001101101011000110100000011000000101111101001011110101010001110101000000010110001010010110",
	 "0100001101001101100001100001001011110010011100010110100110100100100111101101001001000100001110010011101110000111110110110101111010110110011011011000000001101010010110101001101011011111010001101101100000111100011111011100111111011011010010110111001011001010101001111000111000001100011001000011000001111000100001011100011011100110011111001000011100001011110100100001111011000100001100010001000110110111100110110000101110110000101110010111011111011001011110010010010100110101110000010110101010100111110110011000001010110101100101111111110101100000100110000010101110001100010000101101000000011001001110010000111011111010000101001011001111010101110001010111111111110101110011111010000111000100001110001010110001010111011001111000001010100101101101001000101101111000101010101010111000100111100011101001010111011010000001001000111101110010000010110111110110110101111110110110010010001000001010000111101110001001001111000111111001111110100011011100101101101110010111101101010111011011100000011001110110001001000000011011001100101100",
	 "1011011110111010100010010000011011111100001110101110101011011110001000100010010101001000011100101110110010101001100100010001011101110100111100111001010000000100111110100010011101111001111101001100010101011101011001001001111001011010011010101010011000101000010010100001111110001001000100001110101111110111011011110010111101001110001111101111011010000110001001100110110011101011101110001000001101100011101001010111110011110001001101110111110001101000010000011001101111101111111001101100100001001000111111101101101010001111000101000001000101010100101111111010100010001101001100010100010001101110111100110110011111101101100101100101111110011000000100100100001010110011111110000100000001000010011011101001100000000001000010111000010010101001010101110000100100000011100100001001110011101001111000001011011000011001111001100001110001001010010010000001111100011101110101000100001101100000101111001010110000001001001110001010111001010001000110110010101101000111101001000010111101011111010110011111101111110101010001111101100110010001",
	 "1000010110110110100011111111110000000111101000110010101001001001010111011001101001110000100011111010111011001101001011000100000101101001110011111101111111111101001000011101011010110010110011110011111110010001110011110101100000100000100000100011101110000011011111010110001001000000011000000101000010010000100011001000001011000010000111001111001100101011100001100010000101100110111100101000001010101111001011011111100011100110110010101101101101011101000001000011111110111111100001100011101011001110011001011001100101110000000000001001011111101110010111111101110111011000001001010100011010001100010101000100100110000101110010011000001111001110011010011110111000000001011110000010100010001010100011100001101000010010000000001001111010111111001011100100001110000010110111100010101110001101010110011101111001100011000110011001000110101110000110110110011111000111000001111000011010110100001110111110001010000110000011111100001100110101010011001001111111100100001001010011111010111111001100000111110100011100011001000011111000100010",
     "1001000001010011001100001101011101101011000101100011010000000001001000001011101100111001100110100000100000000110000111001011111010011101010101110110010111001110100110010011110101110000100100101010100000010101000011011110010001101101011011001010100000010000111000000011010100110100110101001101101000101011011001101010000010111111001010101110111100111011100000110011111000011000110111110110110000011100000011011001111010101011000111100010011011111101001001001000000111110110101110110110101010110110011101001100011011011001100010111101100011010011111111000000111000000101010101110011010100101100111101010010111011101010011001010100101010010010000011011111100011010100101100001111110101000001101011010011111011100101010001110001000110011100001001000100011011111000010000000100110000011111010001011000110100011110001011110100101101110000110110010000001000111111000011011111110000000110111011111110100100100100001101001001110001011101100111011110001010110000010010001101110001110100110100111110100010001000000001000011010100100110",
     "1110100001100100111001011110111000000000001011101011001110110100110000110001101010001101001110110011111000100010110100101100011010110011110001000001001101100101010000100010001101111111100011100011110001110101101010100010001010001010101100011011001011110101010000111101111100100000110111110100000001111110101011001000000011001010111100100010111111011101101011011101010110000110110010011001010000010100001000011001111111111000000001110100001001100101001001010011000110101100010111001100000011100101001010000110011000011010011010001110011010111100010111001010011111111100101000111000011000111001011011010000111101010110101000101110011110100011110110011110110000100101101110001101111010100000100011101101101101101010100111100110110011111111111011000111101100010101110000011100110101001000000101110110010010000000101100101110000011111110110100110100100100010100001010111110100110001000100000000100001110011010011100001011101011011000100110110101001110100100010001100001001100000001110111110110110000010111011000111110101101100111",
     "0101110010011011000011111000010100101000011101011101010010110000011011101111101001111111111101000001100001110001000001011001001001101111011111000000011100010010000010000011001101000001111101101010100101111111001110011000101000100111010100100100001111011100001111010000010001101101100110110000101100001011011010101011001111111110101110011001111101110010101001110000101110101111001101010101000011110111101101001000010011000010010100110000101111101111011000110101001101111011011010001110101111011100111100000001110001100111001011101000101100011101110110010101011001000011000100000011011000110000001011111000010101010111110010111011010011100000110010011100101011010010000001101010101100001010110110001000110001100101010111100000111101010010110001110000101011101110101000011111111101111110110010010111111110010100001110011100100111010100110011010111000101001000011111110001000000000110010111011110000001010011001000110011100101100001011111010111000001101010111011111010010100001010001000111011100100001011010101111001011110001100",
	 "1011011111100000110010011010010111110011111011110110011010111001101010111010010010010001010100000001010001001111110010111110111100101100100111100110001111011100000110001011111010001010110111011010000011111101011111100111111010001111011111111100010111111110010111000101010111000110000011100001010011000011110101111010110001001101000000001101100111110110110010000010011111100001111011000100111001000000110101010111111000010111010000000000100010011101101100010010010010000111000001111101000110010101110000000011100001000101000000001010110110010111011011011101001100100001111001100001001100110001000100111101001001000100011100010001001100110000000000100110000000110111100111010000101000100000110100010000101010001001100100000001100100010101011101100011000100000000011111010100110111110111010000011010100000001000011010010100101010011001010101101110010010010011101101000110011010001011011001111111110111111000100101000100001011001010101110101010001000100110001011000011100110000001011100011101011000101110100100111000010100000100",
	 "1100110011111000101001001110000100111101011001010101110101010101100100011101110001000000110100101100011001100000011111001110111100110101001111100101001110011010000000100000101100001100011000001000111110000100001110101000010101011011101010011011011110101110110011010011000111001100110010111001001110001000111111101100110111101011111011100001110011001111010000101001010000111110011101111001110010100011100111100110010011011000101011001001111000100011111100010101101000001100101101001100011100111010110010111000000000111011111100001111000011011010100101010111011010010010001111011001010100001000100110010111100100001000000110101100101001110111001101011001101100001001000001110010010110110110001000100111100011110000000011010000001000100010110010101101010011000000111111110100101010111010001010010000010101101101010101011100010110101010110110011001000010101010000100001010100110100001101010011011001000100111101000001001011101010000100000100110011010000010110000010101011110111101011111001101001000010111100011111101110010010110",
	 "1010111111000011000001110110101011111000101011111011100000101011010001011111111010001111001001100010100011110100100010011111000100101100111110101001010101100110001110101001011010100011000011111011001110000011000111110111010101101101100111100110011001101010000000010001111011100010010011110110110001011110111000101000001111000011111011100000100110100001110101011111101011110001101110010111101101001001110010110111101110010100111011011110101100100000011100100010000110101001010000110110111000011111111111011111010101011101001101100011000000101110111010111101110101110100101011010010011100010101100011110100110110011101111100001111101001101110010010010111000000010101100101011001101100110011001111100111100110001000010111111011111000100010101110011011011100100111000001111110001100110000111011101010110101010010000010110011000110111010110100011010010111011100010101011110111101010100000110010011101011010110110000010001001011111000100101100111011111100010011110100010011011110001110111000110001011100000100011011111010010011100",
	 "0010110111110101101100000010100100011110011000011001101000011000110110000000001001010000001000001000011000000011011111000100011001110011000011010010000010101110100100110110010010100110101011010000100100001011011110001001110110001010101001101100011011001100111010100100011101101010010110000101010100000011111010010000101111001010101011011001010000111101110100110000111000011011110011000001110101011100001000110110111011010000000111101001111001011100100011101001010011101001011011111010011100100101001010101011111100111110101100101101101110000100111110110100100000110111111010100101000101010011110010101000001001011101000100011111100001101011010101110100111001100011110010010010110111010000111001110101101011011000110111011111111100101011001101111100110010010111110010010101111010000011001010011001111001100000110001000100001010010011101111110000100000100100110001100010111010110111100110000000110001010110011110001011100001010010000000000010100000110100111010110010110101100011000011101010110001010011011011111111101101111000",
	 "1001101001000001111100000100100011000001110001101000000110000111011100110100101111111011100100010110111011000011101111111010111101001011001000111011110110100001000101100010101100110000110010110111101011101010100111110000001110111110101111001111010110010111110001100101010001100000101111111010111110011100100010010001001101100000100011111001100010001000111001110011100011110100101000010000000101111010111011100100011100001111110010100110000011111001011100010001111010011011111001011110101110011000111001111100100101001110111010001000011010011010010110011110110111111000101111011101010100101100010110110101001110001000101100110101001001001001100011101011000011010010010110110100001110010010011100111100101001100101010001011110100000101110011010011101100001100111011111000101101100100011100110010001101001010011000001000001111010100100101100100111011001000000010111000001010101101010100111011110010110101001000010001000100110111100011101000101001100001010010111111000011111001100111100000010010011100101100100011110000110001111",
     "0010001001110011010111100001111001110010000010101000101100111100001010011010100000001111001101101001011011010110111100010101011111110110100011101101001011110010001110001001110101011101001011001101110001011001110101110000011001001001010111011000000101011111110100001110111000100101101101110011001000011000110101010111000101110101011100100011100001111011111110100000001110100111110000101010000001110001011110110010011101110110001111111110001000100011101111011010001111101011000011011010111110111110111100100111011010011101101110111000001000110101110100010001001010011000101111101110001010001011001110010111011100101110110110010001101000110101100100101101111001101111111011010010111101100111011001101110000000011101101110100001100010000001010100111101111010100010000001010100100010010011000011101001101000100001100001110011111001100010100001100011110010100001010111010110110110110000010110001101100101100001101000101001000010001000111111100011100110000011110100001110000101101001100111101111000010101010111110100101111111010001",
     "1010011100110000000001010110100100000000100110001000100010010011100000100010010100101000011100111110011000100111110101101111101101111000011000101101111010001010001111010000111100011010100100111000011110010110001111110011100010101000001011100100011100000011011110001011101010111001001001010010111011100111001011111011000011000111100110001100011111000110100001001011011011100111100010011011011101001000000011011001011100010010101111111010011100101101000100100010111100100100001101100111010010101101100010000111111111101100000110000101000111101011100000001010001101110001001100111011011010001111000011110111000010011101101100110010111000000101101010000000100111001011001101100011100001000001010011111101011011100001010101101000001000011011110110101100001001010110111000001011011101010011010000101011011011001111111101111110110101000010100001010010000110101011010010001010010011000101010111010110011011001001101010110000010001111101011110011010010010000100001010001001110010000010000011101000111110101101110110000111001001010001",
     "1010011010011100000000100101001001010110010001001111010000011101000000110001100101111110111100100110000100010010110101100000011000111101111101110001101011010000010000010000000000110101101011100001101011100111101100001010101100110001000010110110100101100111110001001111100000101110001100011011010011011001101101001001000111101111100011100100100110010010111111011011101001100001101100001011011010110011011001111100110111101000110111100000110010101110001000101000011101011111011001000001001010001000111001110011001101011100000101000010101010011100011111000010111000100101100110111101001110001101011001100001000101111110100111101000011000011100110100100111101111111000010111101000111011101110000110010010000010110101011111010000110001100010101101010001001011100010110101100110100010110100010100000000001101000000101101111011100100101110110111010000010110100100010011010011011010101100000101100101000101001110011101111100010010101011111010010010111111100001011101001011010111011001111101111001000001110000011010000101001010001000",
     "1010001000101011001010100110110010011010011101011101011110100110111011101010010110100000110111111000101001001001010100001110001000100100110001001000001100000001001000111111101011100001111010110110111010110000101011001001110000101101100011000101000010001110000110111011100110011101011001111000010111101011110011001101110110011100110101101010010100001100111101010011110011001010000000000000011000100100111000110110111111010000100000010111111100101110000110011000001101000000000010011000111001100000110111111011111110100100111010111001001011011101010010000000100001010101100101001100011011110111010101011100010101100011111100110101000000100000000001001011110111111111100110100010001100001001110001101110011001110011110011100000100011011001010010100100010110111011110001001000101110001110110001000011100100000110110000101000100001101001101011010100111001000001111110110001010001111010011101101001011010001010101101100110111010011011011010001111101000000000101111101111100100001101001111100000011110001101000011000110111111111100",
	 "1000100110100111100111101001110011110000101111101001000010100011110110000110001100000101101101100100100100011010010010011011100100100010001010100010011110100110100000100011011001110110010110101011001100101101010000011011000111100000011000010110110010000011100110011001001100010110011010001110010101111110101101100011011110001100100011110100111011010001110000100111101111101101110100110011010100010110011010000100011011010000110001100111001110111001101010001101001000011000010011000001100100000001010000110011101001001101011101101000101001011110000000010000100110110101110010111100000110011000100001101001001100110100110110000001110001000011001011000110101001001000110011000100011111111101001000011111100101100000100000010000011111111111100000001111111000110111101010100100110111010011101001110011100101010110001100001011111001001011011001001111011101110110110001011111110001101011001011000011000101001101110000010110101100011110001010110010101001111111011011100000111010011111110110101110001110110110000011111000111110101010",
     "1100111110100111100101001111010010011111101001011010000011011000100010111011001100011101100011111100101001111110101010001011101110100111101011100111111011101000101001101000010110000000111000111110100100100010111110011110000100110011010110011011001010000100100100011111011100101010111010001111001011010110101111110111100000110000101000011111100000111011001111001101101111010100011000111100111010010101110000001110110000011111011000001001001101110000110101111110011110010001110010000111000000100010100111000001111001110001111011110011111111011111011000001110001010000111100001000111100010010011010011011011001010000101110111101100100111011100000011101001010111000001000000110000000010001011011010111100110111010010110110101111100001011100101011100111001100100010000100001000001100100110111011101000001111000001111110111010010101101111110111010001010110110010110111011011001100011111111001111111001000111011101000001011101101000011111110000011110001100111101111011010000111110110101011101110010001101010111011110100111001100010",
     "0101011001010000100000110111100000001100101010001001101011001010101001110000110011001111101101001010100010001000101011100011010100010010000100001111101011010000111011001001011000000010110011001000110010010110101100001010100001101101001110011001011010100011110000001011000001111111110111011010011100110100010101001100001001010010100101011111011100101011110101010000000001001110100000001010110011001111100101110011111111000011000000100110000111001001100100000101001001011010101000001100101110100000000001101011110110011111000001111001111100001001101001000000010111110111111110000111101011011001100001000010100100001001011011110010101001111110111010111000110010011011000100111011100001001100000001101110010000101000010000111010010001110110100010011010100111000101001010001101101010101010000110100001011101011111010110011000110111001111110110111010110101000010011011001010010000111010110101000111100100011011101001111000001100100110111001110101111100111000111010110110111011010000100110100100010100110000001110100110010000100101",
     "0100100011110100001000000011001110110111101110011010000001010001010010011101110010000011100111001001000000101001000111101001100010011011001011001110101111100101000010100111110000101100001001100100111111000110111001111101011001110100000001100011010110001001111101011011011011011110101011101011111101110010000100000110101110101001111001100110011101100101011001001100000101110001001101000110110101011001010101000101010110001101001000110101000110010001010100001010101011111000100011010111000000001000111001100011010000011111101010010110001011111011101010111000011001001010010111111000011001111100100111010110110011110100111000001000011110101010010111010111101010100110011101001011101001001011000111011000110011010111101011101001000110000110111100011101001110110010001110110000010001111111000100010010011110010001111011101001011110110110001111111011011110110101100011111111001110111001010011101001010110010011101111100011100110100110001101100101110001100110101110000111011110101101001100010110100101100101101001110010111101011011",
     "0001101101011000111110001000111001001001110000000000110111000110101100110101100001010101101111111111001000101000101000001000100001011100100011101101010001111011011000011110111011000110011010110101000000000100111110110110111001100101110010111110110011110011011101110111100010011001100110001111111010000000100100100101111000000010001101111111010101110000111000000100110001011111010110111110110101100111011101100110000111101011011111111100001110000010010110101011010111010101110110010110100011000000100000001000110000101011110110111000001010001011000110010101100100111111010000010110011100011011100011010000110101000001110111110001001101101100110010110100011101010101001111001001101100111111000011101010000000010110110011000001010101010100110000110101111001101010011111011001011101011000011111111110101010010001110100100000100110001110000100100110111010100111001111001100011110000110010110001010011010101101111000011001011100010001001000001000000110000110110010101001010111000111010000010111101000010101011010010000110001000101",
     "1011111010011100000101101001110110001000100100110011100111011001011001010100110010010111011010101000010111001111110110011111011101000111110001000001010010001110001110110100011100010010110110101010001110111010110100011010110101110001100001110011110100111010000111001101011000110000110000110100001011000101111010111011100100011000001110101101111010011011111011110010100101001110100011100111000000010100110000000111011110100101111110010110111101110101101111100101011001101100100001100110100101100100110100000001110011100111001010101100010000111010001101011010110100100001011001100111001011101011101100110010010110011011011101111111100110111011000110001101101010001011000010010001100101001111101000011111000011101000011101101010000010000000110010011101011010100011100111111000000010011011000101101000101000111101100010001110100011101001001111011001100101011100111001010010001100101100001011011100001011000111110011111010010001001010001101100011111101100010100010100110011010001101010001101100001110011000110010101111100101101111",
     "1101010101111101101110110010010010101110001001111010110010100001011100010110111110001110101000011011100010101010000100001000011001111011011101111001011011110100101010000110111100011111110101010100110001110101011101101010110100000001110001101000100101010011111001110101101111100111100110010000001001000100100000100011011010001111000001101001011001011000111101111010101010101111101100001001011101011111001110101111011110010101111001111000110100100101010110000111000111000111000110110100111101001011011101111111011001100101110011011001110000110101100110111011001010101000001011010101001101010011111000000000011100010110011010111101110101000001001011000101010001000111001100010100110110110000001001111011000100001011000100110000000001110001101011010000001110011000110100011101111000011001101111000111101001101011101111001111011010100000111111110000001000011010101010111111000100101001001000001010010101011000101110101110110101001000010010101111100010011110001010011101010011011011110000010111000011001110111100011101001101101001",
     "0100110000110011000010110010110100010001111000010101101101011100101100111000000101011110000010010110000001010011001110001010011001110101111000111101000110100011010101000001111000001110001010000100111101100101010101101101011010001101001111001000101010011110111001011011101100111011001010010111110110110110001011001101001010010000011111110000100110011001011010010110011110100000111101001111111100110011101011101110111000101100100010100100101001010010111111001100111101011100001110011101001101010101110000111001110001011111111001011111000010011010101110100110101111001100111000000010101001110011010000000001111001011111100001111110101011000010110101110101011100000010111101001111010101110110011100001101111110100111000010110001110000000000001011110101001000111110111010100110110011100001110011100010111000000101110101000010000011001011100001100111111011000000000101100110101110001110010100111010100110011101111110011000000000011010000111000011001100000101100011011101000100010110101000001010111001110010011110001011101110111001",
     "0100110011110000101100001100011110010010110111011000111111011011001111101100111010101110011011110010101101111111011001100011110100010000011010100001110000101001011011100100011111000001010011000001010010011000101100000100010111010101011111011110111110110101100101101000111101101101100011000111100100000010011000111100001101010011110011110011000001111110111110010000110000011111001000010110011011100110101101100011001011110110011000010100111001011000001001100111111011110000100101101100001101110111000110001010001100111101010001101110010111010001000011101001100100111110101101101101111110000001010100011000111110001000010111101101101000011011011011111111010100011000111111010100100010111011100011101001110111011011111011010100101011000000111101001111010111101011100010011011110011000110010011010010000110100110010111011011001101111001101010111110001011100100110111000010000111110001000010011111111100101110110000001100111001111011010111010100000010010111001111010001001111101100111101110001001110110000000111000110111100010000"
   );
  
  -- functions


end ldpc_encoder_pkg_4k_45;