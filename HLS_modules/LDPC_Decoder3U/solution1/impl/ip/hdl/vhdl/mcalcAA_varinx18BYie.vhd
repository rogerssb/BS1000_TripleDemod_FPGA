-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.3
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity mcalcAA_varinx18BYie_rom is 
    generic(
             dwidth     : integer := 26; 
             awidth     : integer := 9; 
             mem_size    : integer := 512
    ); 
    port (
          addr0      : in std_logic_vector(awidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(dwidth-1 downto 0);
          addr1      : in std_logic_vector(awidth-1 downto 0); 
          ce1       : in std_logic; 
          q1         : out std_logic_vector(dwidth-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of mcalcAA_varinx18BYie_rom is 

signal addr0_tmp : std_logic_vector(awidth-1 downto 0); 
signal addr1_tmp : std_logic_vector(awidth-1 downto 0); 
type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
signal mem : mem_array := (
    0 => "00100000000000000111111110", 1 => "00100001000000001111111111", 
    2 => "00100010000000010110000000", 3 => "00100011000000011110000001", 
    4 => "00100100000000100110000010", 5 => "00100101000000101110000011", 
    6 => "00100110000000110110000100", 7 => "00100111000000111110000101", 
    8 => "00101000000001000110000110", 9 => "00101001000001001110000111", 
    10 => "00101010000001010110001000", 11 => "00101011000001011110001001", 
    12 => "00101100000001100110001010", 13 => "00101101000001101110001011", 
    14 => "00101110000001110110001100", 15 => "00101111000001111110001101", 
    16 => "00110000000010000110001110", 17 => "00110001000010001110001111", 
    18 => "00110010000010010110010000", 19 => "00110011000010011110010001", 
    20 => "00110100000010100110010010", 21 => "00110101000010101110010011", 
    22 => "00110110000010110110010100", 23 => "00110111000010111110010101", 
    24 => "00111000000011000110010110", 25 => "00111001000011001110010111", 
    26 => "00111010000011010110011000", 27 => "00111011000011011110011001", 
    28 => "00111100000011100110011010", 29 => "00111101000011101110011011", 
    30 => "00111110000011110110011100", 31 => "00111111000011111110011101", 
    32 => "01000000000100000110011110", 33 => "01000001000100001110011111", 
    34 => "01000010000100010110100000", 35 => "01000011000100011110100001", 
    36 => "01000100000100100110100010", 37 => "01000101000100101110100011", 
    38 => "01000110000100110110100100", 39 => "01000111000100111110100101", 
    40 => "01001000000101000110100110", 41 => "01001001000101001110100111", 
    42 => "01001010000101010110101000", 43 => "01001011000101011110101001", 
    44 => "01001100000101100110101010", 45 => "01001101000101101110101011", 
    46 => "01001110000101110110101100", 47 => "01001111000101111110101101", 
    48 => "01010000000110000110101110", 49 => "01010001000110001110101111", 
    50 => "01010010000110010110110000", 51 => "01010011000110011110110001", 
    52 => "01010100000110100110110010", 53 => "01010101000110101110110011", 
    54 => "01010110000110110110110100", 55 => "01010111000110111110110101", 
    56 => "01011000000111000110110110", 57 => "01011001000111001110110111", 
    58 => "01011010000111010110111000", 59 => "01011011000111011110111001", 
    60 => "01011100000111100110111010", 61 => "01011101000111101110111011", 
    62 => "01011110000111110110111100", 63 => "01011111000111111110111101", 
    64 => "01100000001000000110111110", 65 => "01100001001000001110111111", 
    66 => "01100010001000010111000000", 67 => "01100011001000011111000001", 
    68 => "01100100001000100111000010", 69 => "01100101001000101111000011", 
    70 => "01100110001000110111000100", 71 => "01100111001000111111000101", 
    72 => "01101000001001000111000110", 73 => "01101001001001001111000111", 
    74 => "01101010001001010111001000", 75 => "01101011001001011111001001", 
    76 => "01101100001001100111001010", 77 => "01101101001001101111001011", 
    78 => "01101110001001110111001100", 79 => "01101111001001111111001101", 
    80 => "01110000001010000111001110", 81 => "01110001001010001111001111", 
    82 => "01110010001010010111010000", 83 => "01110011001010011111010001", 
    84 => "01110100001010100111010010", 85 => "01110101001010101111010011", 
    86 => "01110110001010110111010100", 87 => "01110111001010111111010101", 
    88 => "01111000001011000111010110", 89 => "01111001001011001111010111", 
    90 => "01111010001011010111011000", 91 => "01111011001011011111011001", 
    92 => "01111100001011100111011010", 93 => "01111101001011101111011011", 
    94 => "01111110001011110111011100", 95 => "01111111001011111111011101", 
    96 => "00000000001100000111011110", 97 => "00000001001100001111011111", 
    98 => "00000010001100010111100000", 99 => "00000011001100011111100001", 
    100 => "00000100001100100111100010", 101 => "00000101001100101111100011", 
    102 => "00000110001100110111100100", 103 => "00000111001100111111100101", 
    104 => "00001000001101000111100110", 105 => "00001001001101001111100111", 
    106 => "00001010001101010111101000", 107 => "00001011001101011111101001", 
    108 => "00001100001101100111101010", 109 => "00001101001101101111101011", 
    110 => "00001110001101110111101100", 111 => "00001111001101111111101101", 
    112 => "00010000001110000111101110", 113 => "00010001001110001111101111", 
    114 => "00010010001110010111110000", 115 => "00010011001110011111110001", 
    116 => "00010100001110100111110010", 117 => "00010101001110101111110011", 
    118 => "00010110001110110111110100", 119 => "00010111001110111111110101", 
    120 => "00011000001111000111110110", 121 => "00011001001111001111110111", 
    122 => "00011010001111010111111000", 123 => "00011011001111011111111001", 
    124 => "00011100001111100111111010", 125 => "00011101001111101111111011", 
    126 => "00011110001111110111111100", 127 => "00011111001111111111111101", 
    128 => "10011111010000000110011110", 129 => "10100000010000001110011111", 
    130 => "10100001010000010110100000", 131 => "10100010010000011110100001", 
    132 => "10100011010000100110100010", 133 => "10100100010000101110100011", 
    134 => "10100101010000110110100100", 135 => "10100110010000111110100101", 
    136 => "10100111010001000110100110", 137 => "10101000010001001110100111", 
    138 => "10101001010001010110101000", 139 => "10101010010001011110101001", 
    140 => "10101011010001100110101010", 141 => "10101100010001101110101011", 
    142 => "10101101010001110110101100", 143 => "10101110010001111110101101", 
    144 => "10101111010010000110101110", 145 => "10110000010010001110101111", 
    146 => "10110001010010010110110000", 147 => "10110010010010011110110001", 
    148 => "10110011010010100110110010", 149 => "10110100010010101110110011", 
    150 => "10110101010010110110110100", 151 => "10110110010010111110110101", 
    152 => "10110111010011000110110110", 153 => "10111000010011001110110111", 
    154 => "10111001010011010110111000", 155 => "10111010010011011110111001", 
    156 => "10111011010011100110111010", 157 => "10111100010011101110111011", 
    158 => "10111101010011110110111100", 159 => "10111110010011111110111101", 
    160 => "10111111010100000110111110", 161 => "11000000010100001110111111", 
    162 => "11000001010100010111000000", 163 => "11000010010100011111000001", 
    164 => "11000011010100100111000010", 165 => "11000100010100101111000011", 
    166 => "11000101010100110111000100", 167 => "11000110010100111111000101", 
    168 => "11000111010101000111000110", 169 => "11001000010101001111000111", 
    170 => "11001001010101010111001000", 171 => "11001010010101011111001001", 
    172 => "11001011010101100111001010", 173 => "11001100010101101111001011", 
    174 => "11001101010101110111001100", 175 => "11001110010101111111001101", 
    176 => "11001111010110000111001110", 177 => "11010000010110001111001111", 
    178 => "11010001010110010111010000", 179 => "11010010010110011111010001", 
    180 => "11010011010110100111010010", 181 => "11010100010110101111010011", 
    182 => "11010101010110110111010100", 183 => "11010110010110111111010101", 
    184 => "11010111010111000111010110", 185 => "11011000010111001111010111", 
    186 => "11011001010111010111011000", 187 => "11011010010111011111011001", 
    188 => "11011011010111100111011010", 189 => "11011100010111101111011011", 
    190 => "11011101010111110111011100", 191 => "11011110010111111111011101", 
    192 => "11011111011000000111011110", 193 => "11100000011000001111011111", 
    194 => "11100001011000010111100000", 195 => "11100010011000011111100001", 
    196 => "11100011011000100111100010", 197 => "11100100011000101111100011", 
    198 => "11100101011000110111100100", 199 => "11100110011000111111100101", 
    200 => "11100111011001000111100110", 201 => "11101000011001001111100111", 
    202 => "11101001011001010111101000", 203 => "11101010011001011111101001", 
    204 => "11101011011001100111101010", 205 => "11101100011001101111101011", 
    206 => "11101101011001110111101100", 207 => "11101110011001111111101101", 
    208 => "11101111011010000111101110", 209 => "11110000011010001111101111", 
    210 => "11110001011010010111110000", 211 => "11110010011010011111110001", 
    212 => "11110011011010100111110010", 213 => "11110100011010101111110011", 
    214 => "11110101011010110111110100", 215 => "11110110011010111111110101", 
    216 => "11110111011011000111110110", 217 => "11111000011011001111110111", 
    218 => "11111001011011010111111000", 219 => "11111010011011011111111001", 
    220 => "11111011011011100111111010", 221 => "11111100011011101111111011", 
    222 => "11111101011011110111111100", 223 => "11111110011011111111111101", 
    224 => "11111111011100000111111110", 225 => "10000000011100001111111111", 
    226 => "10000001011100010110000000", 227 => "10000010011100011110000001", 
    228 => "10000011011100100110000010", 229 => "10000100011100101110000011", 
    230 => "10000101011100110110000100", 231 => "10000110011100111110000101", 
    232 => "10000111011101000110000110", 233 => "10001000011101001110000111", 
    234 => "10001001011101010110001000", 235 => "10001010011101011110001001", 
    236 => "10001011011101100110001010", 237 => "10001100011101101110001011", 
    238 => "10001101011101110110001100", 239 => "10001110011101111110001101", 
    240 => "10001111011110000110001110", 241 => "10010000011110001110001111", 
    242 => "10010001011110010110010000", 243 => "10010010011110011110010001", 
    244 => "10010011011110100110010010", 245 => "10010100011110101110010011", 
    246 => "10010101011110110110010100", 247 => "10010110011110111110010101", 
    248 => "10010111011111000110010110", 249 => "10011000011111001110010111", 
    250 => "10011001011111010110011000", 251 => "10011010011111011110011001", 
    252 => "10011011011111100110011010", 253 => "10011100011111101110011011", 
    254 => "10011101011111110110011100", 255 => "10011110011111111110011101", 
    256 => "00101010100000000111011100", 257 => "00101011100000001111011101", 
    258 => "00101100100000010111011110", 259 => "00101101100000011111011111", 
    260 => "00101110100000100111100000", 261 => "00101111100000101111100001", 
    262 => "00110000100000110111100010", 263 => "00110001100000111111100011", 
    264 => "00110010100001000111100100", 265 => "00110011100001001111100101", 
    266 => "00110100100001010111100110", 267 => "00110101100001011111100111", 
    268 => "00110110100001100111101000", 269 => "00110111100001101111101001", 
    270 => "00111000100001110111101010", 271 => "00111001100001111111101011", 
    272 => "00111010100010000111101100", 273 => "00111011100010001111101101", 
    274 => "00111100100010010111101110", 275 => "00111101100010011111101111", 
    276 => "00111110100010100111110000", 277 => "00111111100010101111110001", 
    278 => "01000000100010110111110010", 279 => "01000001100010111111110011", 
    280 => "01000010100011000111110100", 281 => "01000011100011001111110101", 
    282 => "01000100100011010111110110", 283 => "01000101100011011111110111", 
    284 => "01000110100011100111111000", 285 => "01000111100011101111111001", 
    286 => "01001000100011110111111010", 287 => "01001001100011111111111011", 
    288 => "01001010100100000111111100", 289 => "01001011100100001111111101", 
    290 => "01001100100100010111111110", 291 => "01001101100100011111111111", 
    292 => "01001110100100100110000000", 293 => "01001111100100101110000001", 
    294 => "01010000100100110110000010", 295 => "01010001100100111110000011", 
    296 => "01010010100101000110000100", 297 => "01010011100101001110000101", 
    298 => "01010100100101010110000110", 299 => "01010101100101011110000111", 
    300 => "01010110100101100110001000", 301 => "01010111100101101110001001", 
    302 => "01011000100101110110001010", 303 => "01011001100101111110001011", 
    304 => "01011010100110000110001100", 305 => "01011011100110001110001101", 
    306 => "01011100100110010110001110", 307 => "01011101100110011110001111", 
    308 => "01011110100110100110010000", 309 => "01011111100110101110010001", 
    310 => "01100000100110110110010010", 311 => "01100001100110111110010011", 
    312 => "01100010100111000110010100", 313 => "01100011100111001110010101", 
    314 => "01100100100111010110010110", 315 => "01100101100111011110010111", 
    316 => "01100110100111100110011000", 317 => "01100111100111101110011001", 
    318 => "01101000100111110110011010", 319 => "01101001100111111110011011", 
    320 => "01101010101000000110011100", 321 => "01101011101000001110011101", 
    322 => "01101100101000010110011110", 323 => "01101101101000011110011111", 
    324 => "01101110101000100110100000", 325 => "01101111101000101110100001", 
    326 => "01110000101000110110100010", 327 => "01110001101000111110100011", 
    328 => "01110010101001000110100100", 329 => "01110011101001001110100101", 
    330 => "01110100101001010110100110", 331 => "01110101101001011110100111", 
    332 => "01110110101001100110101000", 333 => "01110111101001101110101001", 
    334 => "01111000101001110110101010", 335 => "01111001101001111110101011", 
    336 => "01111010101010000110101100", 337 => "01111011101010001110101101", 
    338 => "01111100101010010110101110", 339 => "01111101101010011110101111", 
    340 => "01111110101010100110110000", 341 => "01111111101010101110110001", 
    342 => "00000000101010110110110010", 343 => "00000001101010111110110011", 
    344 => "00000010101011000110110100", 345 => "00000011101011001110110101", 
    346 => "00000100101011010110110110", 347 => "00000101101011011110110111", 
    348 => "00000110101011100110111000", 349 => "00000111101011101110111001", 
    350 => "00001000101011110110111010", 351 => "00001001101011111110111011", 
    352 => "00001010101100000110111100", 353 => "00001011101100001110111101", 
    354 => "00001100101100010110111110", 355 => "00001101101100011110111111", 
    356 => "00001110101100100111000000", 357 => "00001111101100101111000001", 
    358 => "00010000101100110111000010", 359 => "00010001101100111111000011", 
    360 => "00010010101101000111000100", 361 => "00010011101101001111000101", 
    362 => "00010100101101010111000110", 363 => "00010101101101011111000111", 
    364 => "00010110101101100111001000", 365 => "00010111101101101111001001", 
    366 => "00011000101101110111001010", 367 => "00011001101101111111001011", 
    368 => "00011010101110000111001100", 369 => "00011011101110001111001101", 
    370 => "00011100101110010111001110", 371 => "00011101101110011111001111", 
    372 => "00011110101110100111010000", 373 => "00011111101110101111010001", 
    374 => "00100000101110110111010010", 375 => "00100001101110111111010011", 
    376 => "00100010101111000111010100", 377 => "00100011101111001111010101", 
    378 => "00100100101111010111010110", 379 => "00100101101111011111010111", 
    380 => "00100110101111100111011000", 381 => "00100111101111101111011001", 
    382 => "00101000101111110111011010", 383 => "00101001101111111111011011", 
    384 => "01110100110000000100111110", 385 => "01110101110000001100111111", 
    386 => "01110110110000010101000000", 387 => "01110111110000011101000001", 
    388 => "01111000110000100101000010", 389 => "01111001110000101101000011", 
    390 => "01111010110000110101000100", 391 => "01111011110000111101000101", 
    392 => "01111100110001000101000110", 393 => "01111101110001001101000111", 
    394 => "01111110110001010101001000", 395 => "01111111110001011101001001", 
    396 => "00000000110001100101001010", 397 => "00000001110001101101001011", 
    398 => "00000010110001110101001100", 399 => "00000011110001111101001101", 
    400 => "00000100110010000101001110", 401 => "00000101110010001101001111", 
    402 => "00000110110010010101010000", 403 => "00000111110010011101010001", 
    404 => "00001000110010100101010010", 405 => "00001001110010101101010011", 
    406 => "00001010110010110101010100", 407 => "00001011110010111101010101", 
    408 => "00001100110011000101010110", 409 => "00001101110011001101010111", 
    410 => "00001110110011010101011000", 411 => "00001111110011011101011001", 
    412 => "00010000110011100101011010", 413 => "00010001110011101101011011", 
    414 => "00010010110011110101011100", 415 => "00010011110011111101011101", 
    416 => "00010100110100000101011110", 417 => "00010101110100001101011111", 
    418 => "00010110110100010101100000", 419 => "00010111110100011101100001", 
    420 => "00011000110100100101100010", 421 => "00011001110100101101100011", 
    422 => "00011010110100110101100100", 423 => "00011011110100111101100101", 
    424 => "00011100110101000101100110", 425 => "00011101110101001101100111", 
    426 => "00011110110101010101101000", 427 => "00011111110101011101101001", 
    428 => "00100000110101100101101010", 429 => "00100001110101101101101011", 
    430 => "00100010110101110101101100", 431 => "00100011110101111101101101", 
    432 => "00100100110110000101101110", 433 => "00100101110110001101101111", 
    434 => "00100110110110010101110000", 435 => "00100111110110011101110001", 
    436 => "00101000110110100101110010", 437 => "00101001110110101101110011", 
    438 => "00101010110110110101110100", 439 => "00101011110110111101110101", 
    440 => "00101100110111000101110110", 441 => "00101101110111001101110111", 
    442 => "00101110110111010101111000", 443 => "00101111110111011101111001", 
    444 => "00110000110111100101111010", 445 => "00110001110111101101111011", 
    446 => "00110010110111110101111100", 447 => "00110011110111111101111101", 
    448 => "00110100111000000101111110", 449 => "00110101111000001101111111", 
    450 => "00110110111000010100000000", 451 => "00110111111000011100000001", 
    452 => "00111000111000100100000010", 453 => "00111001111000101100000011", 
    454 => "00111010111000110100000100", 455 => "00111011111000111100000101", 
    456 => "00111100111001000100000110", 457 => "00111101111001001100000111", 
    458 => "00111110111001010100001000", 459 => "00111111111001011100001001", 
    460 => "01000000111001100100001010", 461 => "01000001111001101100001011", 
    462 => "01000010111001110100001100", 463 => "01000011111001111100001101", 
    464 => "01000100111010000100001110", 465 => "01000101111010001100001111", 
    466 => "01000110111010010100010000", 467 => "01000111111010011100010001", 
    468 => "01001000111010100100010010", 469 => "01001001111010101100010011", 
    470 => "01001010111010110100010100", 471 => "01001011111010111100010101", 
    472 => "01001100111011000100010110", 473 => "01001101111011001100010111", 
    474 => "01001110111011010100011000", 475 => "01001111111011011100011001", 
    476 => "01010000111011100100011010", 477 => "01010001111011101100011011", 
    478 => "01010010111011110100011100", 479 => "01010011111011111100011101", 
    480 => "01010100111100000100011110", 481 => "01010101111100001100011111", 
    482 => "01010110111100010100100000", 483 => "01010111111100011100100001", 
    484 => "01011000111100100100100010", 485 => "01011001111100101100100011", 
    486 => "01011010111100110100100100", 487 => "01011011111100111100100101", 
    488 => "01011100111101000100100110", 489 => "01011101111101001100100111", 
    490 => "01011110111101010100101000", 491 => "01011111111101011100101001", 
    492 => "01100000111101100100101010", 493 => "01100001111101101100101011", 
    494 => "01100010111101110100101100", 495 => "01100011111101111100101101", 
    496 => "01100100111110000100101110", 497 => "01100101111110001100101111", 
    498 => "01100110111110010100110000", 499 => "01100111111110011100110001", 
    500 => "01101000111110100100110010", 501 => "01101001111110101100110011", 
    502 => "01101010111110110100110100", 503 => "01101011111110111100110101", 
    504 => "01101100111111000100110110", 505 => "01101101111111001100110111", 
    506 => "01101110111111010100111000", 507 => "01101111111111011100111001", 
    508 => "01110000111111100100111010", 509 => "01110001111111101100111011", 
    510 => "01110010111111110100111100", 511 => "01110011111111111100111101" );


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

memory_access_guard_1: process (addr1) 
begin
      addr1_tmp <= addr1;
--synthesis translate_off
      if (CONV_INTEGER(addr1) > mem_size-1) then
           addr1_tmp <= (others => '0');
      else 
           addr1_tmp <= addr1;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
        if (ce1 = '1') then 
            q1 <= mem(CONV_INTEGER(addr1_tmp)); 
        end if;
    end if;
end process;

end rtl;


Library IEEE;
use IEEE.std_logic_1164.all;

entity mcalcAA_varinx18BYie is
    generic (
        DataWidth : INTEGER := 26;
        AddressRange : INTEGER := 512;
        AddressWidth : INTEGER := 9);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address1 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of mcalcAA_varinx18BYie is
    component mcalcAA_varinx18BYie_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR;
            addr1 : IN STD_LOGIC_VECTOR;
            ce1 : IN STD_LOGIC;
            q1 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    mcalcAA_varinx18BYie_rom_U :  component mcalcAA_varinx18BYie_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0,
        addr1 => address1,
        ce1 => ce1,
        q1 => q1);

end architecture;


