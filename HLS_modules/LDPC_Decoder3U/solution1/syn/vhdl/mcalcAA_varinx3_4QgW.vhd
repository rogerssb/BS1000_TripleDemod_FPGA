-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.4
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity mcalcAA_varinx3_4QgW_rom is 
    generic(
             dwidth     : integer := 27; 
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


architecture rtl of mcalcAA_varinx3_4QgW_rom is 

signal addr0_tmp : std_logic_vector(awidth-1 downto 0); 
signal addr1_tmp : std_logic_vector(awidth-1 downto 0); 
type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
signal mem : mem_array := (
    0 => "110010000000000000000000000", 1 => "110010001000000001000000001", 
    2 => "110010010000000010000000010", 3 => "110010011000000011000000011", 
    4 => "110010100000000100000000100", 5 => "110010101000000101000000101", 
    6 => "110010110000000110000000110", 7 => "110010111000000111000000111", 
    8 => "110011000000001000000001000", 9 => "110011001000001001000001001", 
    10 => "110011010000001010000001010", 11 => "110011011000001011000001011", 
    12 => "110011100000001100000001100", 13 => "110011101000001101000001101", 
    14 => "110011110000001110000001110", 15 => "110011111000001111000001111", 
    16 => "110100000000010000000010000", 17 => "110100001000010001000010001", 
    18 => "110100010000010010000010010", 19 => "110100011000010011000010011", 
    20 => "110100100000010100000010100", 21 => "110100101000010101000010101", 
    22 => "110100110000010110000010110", 23 => "110100111000010111000010111", 
    24 => "110101000000011000000011000", 25 => "110101001000011001000011001", 
    26 => "110101010000011010000011010", 27 => "110101011000011011000011011", 
    28 => "110101100000011100000011100", 29 => "110101101000011101000011101", 
    30 => "110101110000011110000011110", 31 => "110101111000011111000011111", 
    32 => "110110000000100000000100000", 33 => "110110001000100001000100001", 
    34 => "110110010000100010000100010", 35 => "110110011000100011000100011", 
    36 => "110110100000100100000100100", 37 => "110110101000100101000100101", 
    38 => "110110110000100110000100110", 39 => "110110111000100111000100111", 
    40 => "110111000000101000000101000", 41 => "110111001000101001000101001", 
    42 => "110111010000101010000101010", 43 => "110111011000101011000101011", 
    44 => "110111100000101100000101100", 45 => "110111101000101101000101101", 
    46 => "110111110000101110000101110", 47 => "110111111000101111000101111", 
    48 => "111000000000110000000110000", 49 => "111000001000110001000110001", 
    50 => "111000010000110010000110010", 51 => "111000011000110011000110011", 
    52 => "111000100000110100000110100", 53 => "111000101000110101000110101", 
    54 => "111000110000110110000110110", 55 => "111000111000110111000110111", 
    56 => "111001000000111000000111000", 57 => "111001001000111001000111001", 
    58 => "111001010000111010000111010", 59 => "111001011000111011000111011", 
    60 => "111001100000111100000111100", 61 => "111001101000111101000111101", 
    62 => "111001110000111110000111110", 63 => "111001111000111111000111111", 
    64 => "111010000001000000001000000", 65 => "111010001001000001001000001", 
    66 => "111010010001000010001000010", 67 => "111010011001000011001000011", 
    68 => "111010100001000100001000100", 69 => "111010101001000101001000101", 
    70 => "111010110001000110001000110", 71 => "111010111001000111001000111", 
    72 => "111011000001001000001001000", 73 => "111011001001001001001001001", 
    74 => "111011010001001010001001010", 75 => "111011011001001011001001011", 
    76 => "111011100001001100001001100", 77 => "111011101001001101001001101", 
    78 => "111011110001001110001001110", 79 => "111011111001001111001001111", 
    80 => "111100000001010000001010000", 81 => "111100001001010001001010001", 
    82 => "111100010001010010001010010", 83 => "111100011001010011001010011", 
    84 => "111100100001010100001010100", 85 => "111100101001010101001010101", 
    86 => "111100110001010110001010110", 87 => "111100111001010111001010111", 
    88 => "111101000001011000001011000", 89 => "111101001001011001001011001", 
    90 => "111101010001011010001011010", 91 => "111101011001011011001011011", 
    92 => "111101100001011100001011100", 93 => "111101101001011101001011101", 
    94 => "111101110001011110001011110", 95 => "111101111001011111001011111", 
    96 => "111110000001100000001100000", 97 => "111110001001100001001100001", 
    98 => "111110010001100010001100010", 99 => "111110011001100011001100011", 
    100 => "111110100001100100001100100", 101 => "111110101001100101001100101", 
    102 => "111110110001100110001100110", 103 => "111110111001100111001100111", 
    104 => "111111000001101000001101000", 105 => "111111001001101001001101001", 
    106 => "111111010001101010001101010", 107 => "111111011001101011001101011", 
    108 => "111111100001101100001101100", 109 => "111111101001101101001101101", 
    110 => "111111110001101110001101110", 111 => "111111111001101111001101111", 
    112 => "110000000001110000001110000", 113 => "110000001001110001001110001", 
    114 => "110000010001110010001110010", 115 => "110000011001110011001110011", 
    116 => "110000100001110100001110100", 117 => "110000101001110101001110101", 
    118 => "110000110001110110001110110", 119 => "110000111001110111001110111", 
    120 => "110001000001111000001111000", 121 => "110001001001111001001111001", 
    122 => "110001010001111010001111010", 123 => "110001011001111011001111011", 
    124 => "110001100001111100001111100", 125 => "110001101001111101001111101", 
    126 => "110001110001111110001111110", 127 => "110001111001111111001111111", 
    128 => "010000000000000000010000000", 129 => "010000001000000001010000001", 
    130 => "010000010000000010010000010", 131 => "010000011000000011010000011", 
    132 => "010000100000000100010000100", 133 => "010000101000000101010000101", 
    134 => "010000110000000110010000110", 135 => "010000111000000111010000111", 
    136 => "010001000000001000010001000", 137 => "010001001000001001010001001", 
    138 => "010001010000001010010001010", 139 => "010001011000001011010001011", 
    140 => "010001100000001100010001100", 141 => "010001101000001101010001101", 
    142 => "010001110000001110010001110", 143 => "010001111000001111010001111", 
    144 => "010010000000010000010010000", 145 => "010010001000010001010010001", 
    146 => "010010010000010010010010010", 147 => "010010011000010011010010011", 
    148 => "010010100000010100010010100", 149 => "010010101000010101010010101", 
    150 => "010010110000010110010010110", 151 => "010010111000010111010010111", 
    152 => "010011000000011000010011000", 153 => "010011001000011001010011001", 
    154 => "010011010000011010010011010", 155 => "010011011000011011010011011", 
    156 => "010011100000011100010011100", 157 => "010011101000011101010011101", 
    158 => "010011110000011110010011110", 159 => "010011111000011111010011111", 
    160 => "010100000000100000010100000", 161 => "010100001000100001010100001", 
    162 => "010100010000100010010100010", 163 => "010100011000100011010100011", 
    164 => "010100100000100100010100100", 165 => "010100101000100101010100101", 
    166 => "010100110000100110010100110", 167 => "010100111000100111010100111", 
    168 => "010101000000101000010101000", 169 => "010101001000101001010101001", 
    170 => "010101010000101010010101010", 171 => "010101011000101011010101011", 
    172 => "010101100000101100010101100", 173 => "010101101000101101010101101", 
    174 => "010101110000101110010101110", 175 => "010101111000101111010101111", 
    176 => "010110000000110000010110000", 177 => "010110001000110001010110001", 
    178 => "010110010000110010010110010", 179 => "010110011000110011010110011", 
    180 => "010110100000110100010110100", 181 => "010110101000110101010110101", 
    182 => "010110110000110110010110110", 183 => "010110111000110111010110111", 
    184 => "010111000000111000010111000", 185 => "010111001000111001010111001", 
    186 => "010111010000111010010111010", 187 => "010111011000111011010111011", 
    188 => "010111100000111100010111100", 189 => "010111101000111101010111101", 
    190 => "010111110000111110010111110", 191 => "010111111000111111010111111", 
    192 => "011000000001000000011000000", 193 => "011000001001000001011000001", 
    194 => "011000010001000010011000010", 195 => "011000011001000011011000011", 
    196 => "011000100001000100011000100", 197 => "011000101001000101011000101", 
    198 => "011000110001000110011000110", 199 => "011000111001000111011000111", 
    200 => "011001000001001000011001000", 201 => "011001001001001001011001001", 
    202 => "011001010001001010011001010", 203 => "011001011001001011011001011", 
    204 => "011001100001001100011001100", 205 => "011001101001001101011001101", 
    206 => "011001110001001110011001110", 207 => "011001111001001111011001111", 
    208 => "011010000001010000011010000", 209 => "011010001001010001011010001", 
    210 => "011010010001010010011010010", 211 => "011010011001010011011010011", 
    212 => "011010100001010100011010100", 213 => "011010101001010101011010101", 
    214 => "011010110001010110011010110", 215 => "011010111001010111011010111", 
    216 => "011011000001011000011011000", 217 => "011011001001011001011011001", 
    218 => "011011010001011010011011010", 219 => "011011011001011011011011011", 
    220 => "011011100001011100011011100", 221 => "011011101001011101011011101", 
    222 => "011011110001011110011011110", 223 => "011011111001011111011011111", 
    224 => "011100000001100000011100000", 225 => "011100001001100001011100001", 
    226 => "011100010001100010011100010", 227 => "011100011001100011011100011", 
    228 => "011100100001100100011100100", 229 => "011100101001100101011100101", 
    230 => "011100110001100110011100110", 231 => "011100111001100111011100111", 
    232 => "011101000001101000011101000", 233 => "011101001001101001011101001", 
    234 => "011101010001101010011101010", 235 => "011101011001101011011101011", 
    236 => "011101100001101100011101100", 237 => "011101101001101101011101101", 
    238 => "011101110001101110011101110", 239 => "011101111001101111011101111", 
    240 => "011110000001110000011110000", 241 => "011110001001110001011110001", 
    242 => "011110010001110010011110010", 243 => "011110011001110011011110011", 
    244 => "011110100001110100011110100", 245 => "011110101001110101011110101", 
    246 => "011110110001110110011110110", 247 => "011110111001110111011110111", 
    248 => "011111000001111000011111000", 249 => "011111001001111001011111001", 
    250 => "011111010001111010011111010", 251 => "011111011001111011011111011", 
    252 => "011111100001111100011111100", 253 => "011111101001111101011111101", 
    254 => "011111110001111110011111110", 255 => "011111111001111111011111111", 
    256 => "100000000010000000100000000", 257 => "100000001010000001100000001", 
    258 => "100000010010000010100000010", 259 => "100000011010000011100000011", 
    260 => "100000100010000100100000100", 261 => "100000101010000101100000101", 
    262 => "100000110010000110100000110", 263 => "100000111010000111100000111", 
    264 => "100001000010001000100001000", 265 => "100001001010001001100001001", 
    266 => "100001010010001010100001010", 267 => "100001011010001011100001011", 
    268 => "100001100010001100100001100", 269 => "100001101010001101100001101", 
    270 => "100001110010001110100001110", 271 => "100001111010001111100001111", 
    272 => "100010000010010000100010000", 273 => "100010001010010001100010001", 
    274 => "100010010010010010100010010", 275 => "100010011010010011100010011", 
    276 => "100010100010010100100010100", 277 => "100010101010010101100010101", 
    278 => "100010110010010110100010110", 279 => "100010111010010111100010111", 
    280 => "100011000010011000100011000", 281 => "100011001010011001100011001", 
    282 => "100011010010011010100011010", 283 => "100011011010011011100011011", 
    284 => "100011100010011100100011100", 285 => "100011101010011101100011101", 
    286 => "100011110010011110100011110", 287 => "100011111010011111100011111", 
    288 => "100100000010100000100100000", 289 => "100100001010100001100100001", 
    290 => "100100010010100010100100010", 291 => "100100011010100011100100011", 
    292 => "100100100010100100100100100", 293 => "100100101010100101100100101", 
    294 => "100100110010100110100100110", 295 => "100100111010100111100100111", 
    296 => "100101000010101000100101000", 297 => "100101001010101001100101001", 
    298 => "100101010010101010100101010", 299 => "100101011010101011100101011", 
    300 => "100101100010101100100101100", 301 => "100101101010101101100101101", 
    302 => "100101110010101110100101110", 303 => "100101111010101111100101111", 
    304 => "100110000010110000100110000", 305 => "100110001010110001100110001", 
    306 => "100110010010110010100110010", 307 => "100110011010110011100110011", 
    308 => "100110100010110100100110100", 309 => "100110101010110101100110101", 
    310 => "100110110010110110100110110", 311 => "100110111010110111100110111", 
    312 => "100111000010111000100111000", 313 => "100111001010111001100111001", 
    314 => "100111010010111010100111010", 315 => "100111011010111011100111011", 
    316 => "100111100010111100100111100", 317 => "100111101010111101100111101", 
    318 => "100111110010111110100111110", 319 => "100111111010111111100111111", 
    320 => "101000000011000000101000000", 321 => "101000001011000001101000001", 
    322 => "101000010011000010101000010", 323 => "101000011011000011101000011", 
    324 => "101000100011000100101000100", 325 => "101000101011000101101000101", 
    326 => "101000110011000110101000110", 327 => "101000111011000111101000111", 
    328 => "101001000011001000101001000", 329 => "101001001011001001101001001", 
    330 => "101001010011001010101001010", 331 => "101001011011001011101001011", 
    332 => "101001100011001100101001100", 333 => "101001101011001101101001101", 
    334 => "101001110011001110101001110", 335 => "101001111011001111101001111", 
    336 => "101010000011010000101010000", 337 => "101010001011010001101010001", 
    338 => "101010010011010010101010010", 339 => "101010011011010011101010011", 
    340 => "101010100011010100101010100", 341 => "101010101011010101101010101", 
    342 => "101010110011010110101010110", 343 => "101010111011010111101010111", 
    344 => "101011000011011000101011000", 345 => "101011001011011001101011001", 
    346 => "101011010011011010101011010", 347 => "101011011011011011101011011", 
    348 => "101011100011011100101011100", 349 => "101011101011011101101011101", 
    350 => "101011110011011110101011110", 351 => "101011111011011111101011111", 
    352 => "101100000011100000101100000", 353 => "101100001011100001101100001", 
    354 => "101100010011100010101100010", 355 => "101100011011100011101100011", 
    356 => "101100100011100100101100100", 357 => "101100101011100101101100101", 
    358 => "101100110011100110101100110", 359 => "101100111011100111101100111", 
    360 => "101101000011101000101101000", 361 => "101101001011101001101101001", 
    362 => "101101010011101010101101010", 363 => "101101011011101011101101011", 
    364 => "101101100011101100101101100", 365 => "101101101011101101101101101", 
    366 => "101101110011101110101101110", 367 => "101101111011101111101101111", 
    368 => "101110000011110000101110000", 369 => "101110001011110001101110001", 
    370 => "101110010011110010101110010", 371 => "101110011011110011101110011", 
    372 => "101110100011110100101110100", 373 => "101110101011110101101110101", 
    374 => "101110110011110110101110110", 375 => "101110111011110111101110111", 
    376 => "101111000011111000101111000", 377 => "101111001011111001101111001", 
    378 => "101111010011111010101111010", 379 => "101111011011111011101111011", 
    380 => "101111100011111100101111100", 381 => "101111101011111101101111101", 
    382 => "101111110011111110101111110", 383 => "101111111011111111101111111", 
    384 => "110000000100000000110000000", 385 => "110000001100000001110000001", 
    386 => "110000010100000010110000010", 387 => "110000011100000011110000011", 
    388 => "110000100100000100110000100", 389 => "110000101100000101110000101", 
    390 => "110000110100000110110000110", 391 => "110000111100000111110000111", 
    392 => "110001000100001000110001000", 393 => "110001001100001001110001001", 
    394 => "110001010100001010110001010", 395 => "110001011100001011110001011", 
    396 => "110001100100001100110001100", 397 => "110001101100001101110001101", 
    398 => "110001110100001110110001110", 399 => "110001111100001111110001111", 
    400 => "110010000100010000110010000", 401 => "110010001100010001110010001", 
    402 => "110010010100010010110010010", 403 => "110010011100010011110010011", 
    404 => "110010100100010100110010100", 405 => "110010101100010101110010101", 
    406 => "110010110100010110110010110", 407 => "110010111100010111110010111", 
    408 => "110011000100011000110011000", 409 => "110011001100011001110011001", 
    410 => "110011010100011010110011010", 411 => "110011011100011011110011011", 
    412 => "110011100100011100110011100", 413 => "110011101100011101110011101", 
    414 => "110011110100011110110011110", 415 => "110011111100011111110011111", 
    416 => "110100000100100000110100000", 417 => "110100001100100001110100001", 
    418 => "110100010100100010110100010", 419 => "110100011100100011110100011", 
    420 => "110100100100100100110100100", 421 => "110100101100100101110100101", 
    422 => "110100110100100110110100110", 423 => "110100111100100111110100111", 
    424 => "110101000100101000110101000", 425 => "110101001100101001110101001", 
    426 => "110101010100101010110101010", 427 => "110101011100101011110101011", 
    428 => "110101100100101100110101100", 429 => "110101101100101101110101101", 
    430 => "110101110100101110110101110", 431 => "110101111100101111110101111", 
    432 => "110110000100110000110110000", 433 => "110110001100110001110110001", 
    434 => "110110010100110010110110010", 435 => "110110011100110011110110011", 
    436 => "110110100100110100110110100", 437 => "110110101100110101110110101", 
    438 => "110110110100110110110110110", 439 => "110110111100110111110110111", 
    440 => "110111000100111000110111000", 441 => "110111001100111001110111001", 
    442 => "110111010100111010110111010", 443 => "110111011100111011110111011", 
    444 => "110111100100111100110111100", 445 => "110111101100111101110111101", 
    446 => "110111110100111110110111110", 447 => "110111111100111111110111111", 
    448 => "111000000101000000111000000", 449 => "111000001101000001111000001", 
    450 => "111000010101000010111000010", 451 => "111000011101000011111000011", 
    452 => "111000100101000100111000100", 453 => "111000101101000101111000101", 
    454 => "111000110101000110111000110", 455 => "111000111101000111111000111", 
    456 => "111001000101001000111001000", 457 => "111001001101001001111001001", 
    458 => "111001010101001010111001010", 459 => "111001011101001011111001011", 
    460 => "111001100101001100111001100", 461 => "111001101101001101111001101", 
    462 => "111001110101001110111001110", 463 => "111001111101001111111001111", 
    464 => "111010000101010000111010000", 465 => "111010001101010001111010001", 
    466 => "111010010101010010111010010", 467 => "111010011101010011111010011", 
    468 => "111010100101010100111010100", 469 => "111010101101010101111010101", 
    470 => "111010110101010110111010110", 471 => "111010111101010111111010111", 
    472 => "111011000101011000111011000", 473 => "111011001101011001111011001", 
    474 => "111011010101011010111011010", 475 => "111011011101011011111011011", 
    476 => "111011100101011100111011100", 477 => "111011101101011101111011101", 
    478 => "111011110101011110111011110", 479 => "111011111101011111111011111", 
    480 => "111100000101100000111100000", 481 => "111100001101100001111100001", 
    482 => "111100010101100010111100010", 483 => "111100011101100011111100011", 
    484 => "111100100101100100111100100", 485 => "111100101101100101111100101", 
    486 => "111100110101100110111100110", 487 => "111100111101100111111100111", 
    488 => "111101000101101000111101000", 489 => "111101001101101001111101001", 
    490 => "111101010101101010111101010", 491 => "111101011101101011111101011", 
    492 => "111101100101101100111101100", 493 => "111101101101101101111101101", 
    494 => "111101110101101110111101110", 495 => "111101111101101111111101111", 
    496 => "111110000101110000111110000", 497 => "111110001101110001111110001", 
    498 => "111110010101110010111110010", 499 => "111110011101110011111110011", 
    500 => "111110100101110100111110100", 501 => "111110101101110101111110101", 
    502 => "111110110101110110111110110", 503 => "111110111101110111111110111", 
    504 => "111111000101111000111111000", 505 => "111111001101111001111111001", 
    506 => "111111010101111010111111010", 507 => "111111011101111011111111011", 
    508 => "111111100101111100111111100", 509 => "111111101101111101111111101", 
    510 => "111111110101111110111111110", 511 => "111111111101111111111111111" );


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

entity mcalcAA_varinx3_4QgW is
    generic (
        DataWidth : INTEGER := 27;
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

architecture arch of mcalcAA_varinx3_4QgW is
    component mcalcAA_varinx3_4QgW_rom is
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
    mcalcAA_varinx3_4QgW_rom_U :  component mcalcAA_varinx3_4QgW_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0,
        addr1 => address1,
        ce1 => ce1,
        q1 => q1);

end architecture;


