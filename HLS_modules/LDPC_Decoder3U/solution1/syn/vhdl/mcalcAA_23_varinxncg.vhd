-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.4
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity mcalcAA_23_varinxncg_rom is 
    generic(
             dwidth     : integer := 30; 
             awidth     : integer := 8; 
             mem_size    : integer := 256
    ); 
    port (
          addr0      : in std_logic_vector(awidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(dwidth-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of mcalcAA_23_varinxncg_rom is 

signal addr0_tmp : std_logic_vector(awidth-1 downto 0); 
type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
signal mem : mem_array := (
    0 => "000000000000000000000000000000", 1 => "000000010000000000100000000001", 
    2 => "000000100000000001000000000010", 3 => "000000110000000001100000000011", 
    4 => "000001000000000010000000000100", 5 => "000001010000000010100000000101", 
    6 => "000001100000000011000000000110", 7 => "000001110000000011100000000111", 
    8 => "000010000000000100000000001000", 9 => "000010010000000100100000001001", 
    10 => "000010100000000101000000001010", 11 => "000010110000000101100000001011", 
    12 => "000011000000000110000000001100", 13 => "000011010000000110100000001101", 
    14 => "000011100000000111000000001110", 15 => "000011110000000111100000001111", 
    16 => "000100000000001000000000010000", 17 => "000100010000001000100000010001", 
    18 => "000100100000001001000000010010", 19 => "000100110000001001100000010011", 
    20 => "000101000000001010000000010100", 21 => "000101010000001010100000010101", 
    22 => "000101100000001011000000010110", 23 => "000101110000001011100000010111", 
    24 => "000110000000001100000000011000", 25 => "000110010000001100100000011001", 
    26 => "000110100000001101000000011010", 27 => "000110110000001101100000011011", 
    28 => "000111000000001110000000011100", 29 => "000111010000001110100000011101", 
    30 => "000111100000001111000000011110", 31 => "000111110000001111100000011111", 
    32 => "001000000000010000000000100000", 33 => "001000010000010000100000100001", 
    34 => "001000100000010001000000100010", 35 => "001000110000010001100000100011", 
    36 => "001001000000010010000000100100", 37 => "001001010000010010100000100101", 
    38 => "001001100000010011000000100110", 39 => "001001110000010011100000100111", 
    40 => "001010000000010100000000101000", 41 => "001010010000010100100000101001", 
    42 => "001010100000010101000000101010", 43 => "001010110000010101100000101011", 
    44 => "001011000000010110000000101100", 45 => "001011010000010110100000101101", 
    46 => "001011100000010111000000101110", 47 => "001011110000010111100000101111", 
    48 => "001100000000011000000000110000", 49 => "001100010000011000100000110001", 
    50 => "001100100000011001000000110010", 51 => "001100110000011001100000110011", 
    52 => "001101000000011010000000110100", 53 => "001101010000011010100000110101", 
    54 => "001101100000011011000000110110", 55 => "001101110000011011100000110111", 
    56 => "001110000000011100000000111000", 57 => "001110010000011100100000111001", 
    58 => "001110100000011101000000111010", 59 => "001110110000011101100000111011", 
    60 => "001111000000011110000000111100", 61 => "001111010000011110100000111101", 
    62 => "001111100000011111000000111110", 63 => "001111110000011111100000111111", 
    64 => "010000000000100000000001000000", 65 => "010000010000100000100001000001", 
    66 => "010000100000100001000001000010", 67 => "010000110000100001100001000011", 
    68 => "010001000000100010000001000100", 69 => "010001010000100010100001000101", 
    70 => "010001100000100011000001000110", 71 => "010001110000100011100001000111", 
    72 => "010010000000100100000001001000", 73 => "010010010000100100100001001001", 
    74 => "010010100000100101000001001010", 75 => "010010110000100101100001001011", 
    76 => "010011000000100110000001001100", 77 => "010011010000100110100001001101", 
    78 => "010011100000100111000001001110", 79 => "010011110000100111100001001111", 
    80 => "010100000000101000000001010000", 81 => "010100010000101000100001010001", 
    82 => "010100100000101001000001010010", 83 => "010100110000101001100001010011", 
    84 => "010101000000101010000001010100", 85 => "010101010000101010100001010101", 
    86 => "010101100000101011000001010110", 87 => "010101110000101011100001010111", 
    88 => "010110000000101100000001011000", 89 => "010110010000101100100001011001", 
    90 => "010110100000101101000001011010", 91 => "010110110000101101100001011011", 
    92 => "010111000000101110000001011100", 93 => "010111010000101110100001011101", 
    94 => "010111100000101111000001011110", 95 => "010111110000101111100001011111", 
    96 => "011000000000110000000001100000", 97 => "011000010000110000100001100001", 
    98 => "011000100000110001000001100010", 99 => "011000110000110001100001100011", 
    100 => "011001000000110010000001100100", 101 => "011001010000110010100001100101", 
    102 => "011001100000110011000001100110", 103 => "011001110000110011100001100111", 
    104 => "011010000000110100000001101000", 105 => "011010010000110100100001101001", 
    106 => "011010100000110101000001101010", 107 => "011010110000110101100001101011", 
    108 => "011011000000110110000001101100", 109 => "011011010000110110100001101101", 
    110 => "011011100000110111000001101110", 111 => "011011110000110111100001101111", 
    112 => "011100000000111000000001110000", 113 => "011100010000111000100001110001", 
    114 => "011100100000111001000001110010", 115 => "011100110000111001100001110011", 
    116 => "011101000000111010000001110100", 117 => "011101010000111010100001110101", 
    118 => "011101100000111011000001110110", 119 => "011101110000111011100001110111", 
    120 => "011110000000111100000001111000", 121 => "011110010000111100100001111001", 
    122 => "011110100000111101000001111010", 123 => "011110110000111101100001111011", 
    124 => "011111000000111110000001111100", 125 => "011111010000111110100001111101", 
    126 => "011111100000111111000001111110", 127 => "011111110000111111100001111111", 
    128 => "100000000001000000000010000000", 129 => "100000010001000000100010000001", 
    130 => "100000100001000001000010000010", 131 => "100000110001000001100010000011", 
    132 => "100001000001000010000010000100", 133 => "100001010001000010100010000101", 
    134 => "100001100001000011000010000110", 135 => "100001110001000011100010000111", 
    136 => "100010000001000100000010001000", 137 => "100010010001000100100010001001", 
    138 => "100010100001000101000010001010", 139 => "100010110001000101100010001011", 
    140 => "100011000001000110000010001100", 141 => "100011010001000110100010001101", 
    142 => "100011100001000111000010001110", 143 => "100011110001000111100010001111", 
    144 => "100100000001001000000010010000", 145 => "100100010001001000100010010001", 
    146 => "100100100001001001000010010010", 147 => "100100110001001001100010010011", 
    148 => "100101000001001010000010010100", 149 => "100101010001001010100010010101", 
    150 => "100101100001001011000010010110", 151 => "100101110001001011100010010111", 
    152 => "100110000001001100000010011000", 153 => "100110010001001100100010011001", 
    154 => "100110100001001101000010011010", 155 => "100110110001001101100010011011", 
    156 => "100111000001001110000010011100", 157 => "100111010001001110100010011101", 
    158 => "100111100001001111000010011110", 159 => "100111110001001111100010011111", 
    160 => "101000000001010000000010100000", 161 => "101000010001010000100010100001", 
    162 => "101000100001010001000010100010", 163 => "101000110001010001100010100011", 
    164 => "101001000001010010000010100100", 165 => "101001010001010010100010100101", 
    166 => "101001100001010011000010100110", 167 => "101001110001010011100010100111", 
    168 => "101010000001010100000010101000", 169 => "101010010001010100100010101001", 
    170 => "101010100001010101000010101010", 171 => "101010110001010101100010101011", 
    172 => "101011000001010110000010101100", 173 => "101011010001010110100010101101", 
    174 => "101011100001010111000010101110", 175 => "101011110001010111100010101111", 
    176 => "101100000001011000000010110000", 177 => "101100010001011000100010110001", 
    178 => "101100100001011001000010110010", 179 => "101100110001011001100010110011", 
    180 => "101101000001011010000010110100", 181 => "101101010001011010100010110101", 
    182 => "101101100001011011000010110110", 183 => "101101110001011011100010110111", 
    184 => "101110000001011100000010111000", 185 => "101110010001011100100010111001", 
    186 => "101110100001011101000010111010", 187 => "101110110001011101100010111011", 
    188 => "101111000001011110000010111100", 189 => "101111010001011110100010111101", 
    190 => "101111100001011111000010111110", 191 => "101111110001011111100010111111", 
    192 => "110000000001100000000011000000", 193 => "110000010001100000100011000001", 
    194 => "110000100001100001000011000010", 195 => "110000110001100001100011000011", 
    196 => "110001000001100010000011000100", 197 => "110001010001100010100011000101", 
    198 => "110001100001100011000011000110", 199 => "110001110001100011100011000111", 
    200 => "110010000001100100000011001000", 201 => "110010010001100100100011001001", 
    202 => "110010100001100101000011001010", 203 => "110010110001100101100011001011", 
    204 => "110011000001100110000011001100", 205 => "110011010001100110100011001101", 
    206 => "110011100001100111000011001110", 207 => "110011110001100111100011001111", 
    208 => "110100000001101000000011010000", 209 => "110100010001101000100011010001", 
    210 => "110100100001101001000011010010", 211 => "110100110001101001100011010011", 
    212 => "110101000001101010000011010100", 213 => "110101010001101010100011010101", 
    214 => "110101100001101011000011010110", 215 => "110101110001101011100011010111", 
    216 => "110110000001101100000011011000", 217 => "110110010001101100100011011001", 
    218 => "110110100001101101000011011010", 219 => "110110110001101101100011011011", 
    220 => "110111000001101110000011011100", 221 => "110111010001101110100011011101", 
    222 => "110111100001101111000011011110", 223 => "110111110001101111100011011111", 
    224 => "111000000001110000000011100000", 225 => "111000010001110000100011100001", 
    226 => "111000100001110001000011100010", 227 => "111000110001110001100011100011", 
    228 => "111001000001110010000011100100", 229 => "111001010001110010100011100101", 
    230 => "111001100001110011000011100110", 231 => "111001110001110011100011100111", 
    232 => "111010000001110100000011101000", 233 => "111010010001110100100011101001", 
    234 => "111010100001110101000011101010", 235 => "111010110001110101100011101011", 
    236 => "111011000001110110000011101100", 237 => "111011010001110110100011101101", 
    238 => "111011100001110111000011101110", 239 => "111011110001110111100011101111", 
    240 => "111100000001111000000011110000", 241 => "111100010001111000100011110001", 
    242 => "111100100001111001000011110010", 243 => "111100110001111001100011110011", 
    244 => "111101000001111010000011110100", 245 => "111101010001111010100011110101", 
    246 => "111101100001111011000011110110", 247 => "111101110001111011100011110111", 
    248 => "111110000001111100000011111000", 249 => "111110010001111100100011111001", 
    250 => "111110100001111101000011111010", 251 => "111110110001111101100011111011", 
    252 => "111111000001111110000011111100", 253 => "111111010001111110100011111101", 
    254 => "111111100001111111000011111110", 255 => "111111110001111111100011111111" );


attribute EQUIVALENT_REGISTER_REMOVAL : string;
begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;


Library IEEE;
use IEEE.std_logic_1164.all;

entity mcalcAA_23_varinxncg is
    generic (
        DataWidth : INTEGER := 30;
        AddressRange : INTEGER := 256;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of mcalcAA_23_varinxncg is
    component mcalcAA_23_varinxncg_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    mcalcAA_23_varinxncg_rom_U :  component mcalcAA_23_varinxncg_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


