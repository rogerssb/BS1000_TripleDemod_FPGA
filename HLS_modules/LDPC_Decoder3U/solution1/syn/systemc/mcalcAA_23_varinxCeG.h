// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __mcalcAA_23_varinxCeG_H__
#define __mcalcAA_23_varinxCeG_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct mcalcAA_23_varinxCeG_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 10;
  static const unsigned AddressRange = 1024;
  static const unsigned AddressWidth = 10;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(mcalcAA_23_varinxCeG_ram) {
        ram[0] = "0b0000000000";
        ram[1] = "0b0000000001";
        ram[2] = "0b0000000010";
        ram[3] = "0b0000000011";
        ram[4] = "0b0000000100";
        ram[5] = "0b0000000101";
        ram[6] = "0b0000000110";
        ram[7] = "0b0000000111";
        ram[8] = "0b0000001000";
        ram[9] = "0b0000001001";
        ram[10] = "0b0000001010";
        ram[11] = "0b0000001011";
        ram[12] = "0b0000001100";
        ram[13] = "0b0000001101";
        ram[14] = "0b0000001110";
        ram[15] = "0b0000001111";
        ram[16] = "0b0000010000";
        ram[17] = "0b0000010001";
        ram[18] = "0b0000010010";
        ram[19] = "0b0000010011";
        ram[20] = "0b0000010100";
        ram[21] = "0b0000010101";
        ram[22] = "0b0000010110";
        ram[23] = "0b0000010111";
        ram[24] = "0b0000011000";
        ram[25] = "0b0000011001";
        ram[26] = "0b0000011010";
        ram[27] = "0b0000011011";
        ram[28] = "0b0000011100";
        ram[29] = "0b0000011101";
        ram[30] = "0b0000011110";
        ram[31] = "0b0000011111";
        ram[32] = "0b0000100000";
        ram[33] = "0b0000100001";
        ram[34] = "0b0000100010";
        ram[35] = "0b0000100011";
        ram[36] = "0b0000100100";
        ram[37] = "0b0000100101";
        ram[38] = "0b0000100110";
        ram[39] = "0b0000100111";
        ram[40] = "0b0000101000";
        ram[41] = "0b0000101001";
        ram[42] = "0b0000101010";
        ram[43] = "0b0000101011";
        ram[44] = "0b0000101100";
        ram[45] = "0b0000101101";
        ram[46] = "0b0000101110";
        ram[47] = "0b0000101111";
        ram[48] = "0b0000110000";
        ram[49] = "0b0000110001";
        ram[50] = "0b0000110010";
        ram[51] = "0b0000110011";
        ram[52] = "0b0000110100";
        ram[53] = "0b0000110101";
        ram[54] = "0b0000110110";
        ram[55] = "0b0000110111";
        ram[56] = "0b0000111000";
        ram[57] = "0b0000111001";
        ram[58] = "0b0000111010";
        ram[59] = "0b0000111011";
        ram[60] = "0b0000111100";
        ram[61] = "0b0000111101";
        ram[62] = "0b0000111110";
        ram[63] = "0b0000111111";
        ram[64] = "0b0001000000";
        ram[65] = "0b0001000001";
        ram[66] = "0b0001000010";
        ram[67] = "0b0001000011";
        ram[68] = "0b0001000100";
        ram[69] = "0b0001000101";
        ram[70] = "0b0001000110";
        ram[71] = "0b0001000111";
        ram[72] = "0b0001001000";
        ram[73] = "0b0001001001";
        ram[74] = "0b0001001010";
        ram[75] = "0b0001001011";
        ram[76] = "0b0001001100";
        ram[77] = "0b0001001101";
        ram[78] = "0b0001001110";
        ram[79] = "0b0001001111";
        ram[80] = "0b0001010000";
        ram[81] = "0b0001010001";
        ram[82] = "0b0001010010";
        ram[83] = "0b0001010011";
        ram[84] = "0b0001010100";
        ram[85] = "0b0001010101";
        ram[86] = "0b0001010110";
        ram[87] = "0b0001010111";
        ram[88] = "0b0001011000";
        ram[89] = "0b0001011001";
        ram[90] = "0b0001011010";
        ram[91] = "0b0001011011";
        ram[92] = "0b0001011100";
        ram[93] = "0b0001011101";
        ram[94] = "0b0001011110";
        ram[95] = "0b0001011111";
        ram[96] = "0b0001100000";
        ram[97] = "0b0001100001";
        ram[98] = "0b0001100010";
        ram[99] = "0b0001100011";
        ram[100] = "0b0001100100";
        ram[101] = "0b0001100101";
        ram[102] = "0b0001100110";
        ram[103] = "0b0001100111";
        ram[104] = "0b0001101000";
        ram[105] = "0b0001101001";
        ram[106] = "0b0001101010";
        ram[107] = "0b0001101011";
        ram[108] = "0b0001101100";
        ram[109] = "0b0001101101";
        ram[110] = "0b0001101110";
        ram[111] = "0b0001101111";
        ram[112] = "0b0001110000";
        ram[113] = "0b0001110001";
        ram[114] = "0b0001110010";
        ram[115] = "0b0001110011";
        ram[116] = "0b0001110100";
        ram[117] = "0b0001110101";
        ram[118] = "0b0001110110";
        ram[119] = "0b0001110111";
        ram[120] = "0b0001111000";
        ram[121] = "0b0001111001";
        ram[122] = "0b0001111010";
        ram[123] = "0b0001111011";
        ram[124] = "0b0001111100";
        ram[125] = "0b0001111101";
        ram[126] = "0b0001111110";
        ram[127] = "0b0001111111";
        ram[128] = "0b0010000000";
        ram[129] = "0b0010000001";
        ram[130] = "0b0010000010";
        ram[131] = "0b0010000011";
        ram[132] = "0b0010000100";
        ram[133] = "0b0010000101";
        ram[134] = "0b0010000110";
        ram[135] = "0b0010000111";
        ram[136] = "0b0010001000";
        ram[137] = "0b0010001001";
        ram[138] = "0b0010001010";
        ram[139] = "0b0010001011";
        ram[140] = "0b0010001100";
        ram[141] = "0b0010001101";
        ram[142] = "0b0010001110";
        ram[143] = "0b0010001111";
        ram[144] = "0b0010010000";
        ram[145] = "0b0010010001";
        ram[146] = "0b0010010010";
        ram[147] = "0b0010010011";
        ram[148] = "0b0010010100";
        ram[149] = "0b0010010101";
        ram[150] = "0b0010010110";
        ram[151] = "0b0010010111";
        ram[152] = "0b0010011000";
        ram[153] = "0b0010011001";
        ram[154] = "0b0010011010";
        ram[155] = "0b0010011011";
        ram[156] = "0b0010011100";
        ram[157] = "0b0010011101";
        ram[158] = "0b0010011110";
        ram[159] = "0b0010011111";
        ram[160] = "0b0010100000";
        ram[161] = "0b0010100001";
        ram[162] = "0b0010100010";
        ram[163] = "0b0010100011";
        ram[164] = "0b0010100100";
        ram[165] = "0b0010100101";
        ram[166] = "0b0010100110";
        ram[167] = "0b0010100111";
        ram[168] = "0b0010101000";
        ram[169] = "0b0010101001";
        ram[170] = "0b0010101010";
        ram[171] = "0b0010101011";
        ram[172] = "0b0010101100";
        ram[173] = "0b0010101101";
        ram[174] = "0b0010101110";
        ram[175] = "0b0010101111";
        ram[176] = "0b0010110000";
        ram[177] = "0b0010110001";
        ram[178] = "0b0010110010";
        ram[179] = "0b0010110011";
        ram[180] = "0b0010110100";
        ram[181] = "0b0010110101";
        ram[182] = "0b0010110110";
        ram[183] = "0b0010110111";
        ram[184] = "0b0010111000";
        ram[185] = "0b0010111001";
        ram[186] = "0b0010111010";
        ram[187] = "0b0010111011";
        ram[188] = "0b0010111100";
        ram[189] = "0b0010111101";
        ram[190] = "0b0010111110";
        ram[191] = "0b0010111111";
        ram[192] = "0b0011000000";
        ram[193] = "0b0011000001";
        ram[194] = "0b0011000010";
        ram[195] = "0b0011000011";
        ram[196] = "0b0011000100";
        ram[197] = "0b0011000101";
        ram[198] = "0b0011000110";
        ram[199] = "0b0011000111";
        ram[200] = "0b0011001000";
        ram[201] = "0b0011001001";
        ram[202] = "0b0011001010";
        ram[203] = "0b0011001011";
        ram[204] = "0b0011001100";
        ram[205] = "0b0011001101";
        ram[206] = "0b0011001110";
        ram[207] = "0b0011001111";
        ram[208] = "0b0011010000";
        ram[209] = "0b0011010001";
        ram[210] = "0b0011010010";
        ram[211] = "0b0011010011";
        ram[212] = "0b0011010100";
        ram[213] = "0b0011010101";
        ram[214] = "0b0011010110";
        ram[215] = "0b0011010111";
        ram[216] = "0b0011011000";
        ram[217] = "0b0011011001";
        ram[218] = "0b0011011010";
        ram[219] = "0b0011011011";
        ram[220] = "0b0011011100";
        ram[221] = "0b0011011101";
        ram[222] = "0b0011011110";
        ram[223] = "0b0011011111";
        ram[224] = "0b0011100000";
        ram[225] = "0b0011100001";
        ram[226] = "0b0011100010";
        ram[227] = "0b0011100011";
        ram[228] = "0b0011100100";
        ram[229] = "0b0011100101";
        ram[230] = "0b0011100110";
        ram[231] = "0b0011100111";
        ram[232] = "0b0011101000";
        ram[233] = "0b0011101001";
        ram[234] = "0b0011101010";
        ram[235] = "0b0011101011";
        ram[236] = "0b0011101100";
        ram[237] = "0b0011101101";
        ram[238] = "0b0011101110";
        ram[239] = "0b0011101111";
        ram[240] = "0b0011110000";
        ram[241] = "0b0011110001";
        ram[242] = "0b0011110010";
        ram[243] = "0b0011110011";
        ram[244] = "0b0011110100";
        ram[245] = "0b0011110101";
        ram[246] = "0b0011110110";
        ram[247] = "0b0011110111";
        ram[248] = "0b0011111000";
        ram[249] = "0b0011111001";
        ram[250] = "0b0011111010";
        ram[251] = "0b0011111011";
        ram[252] = "0b0011111100";
        ram[253] = "0b0011111101";
        ram[254] = "0b0011111110";
        ram[255] = "0b0011111111";
        ram[256] = "0b0100000000";
        ram[257] = "0b0100000001";
        ram[258] = "0b0100000010";
        ram[259] = "0b0100000011";
        ram[260] = "0b0100000100";
        ram[261] = "0b0100000101";
        ram[262] = "0b0100000110";
        ram[263] = "0b0100000111";
        ram[264] = "0b0100001000";
        ram[265] = "0b0100001001";
        ram[266] = "0b0100001010";
        ram[267] = "0b0100001011";
        ram[268] = "0b0100001100";
        ram[269] = "0b0100001101";
        ram[270] = "0b0100001110";
        ram[271] = "0b0100001111";
        ram[272] = "0b0100010000";
        ram[273] = "0b0100010001";
        ram[274] = "0b0100010010";
        ram[275] = "0b0100010011";
        ram[276] = "0b0100010100";
        ram[277] = "0b0100010101";
        ram[278] = "0b0100010110";
        ram[279] = "0b0100010111";
        ram[280] = "0b0100011000";
        ram[281] = "0b0100011001";
        ram[282] = "0b0100011010";
        ram[283] = "0b0100011011";
        ram[284] = "0b0100011100";
        ram[285] = "0b0100011101";
        ram[286] = "0b0100011110";
        ram[287] = "0b0100011111";
        ram[288] = "0b0100100000";
        ram[289] = "0b0100100001";
        ram[290] = "0b0100100010";
        ram[291] = "0b0100100011";
        ram[292] = "0b0100100100";
        ram[293] = "0b0100100101";
        ram[294] = "0b0100100110";
        ram[295] = "0b0100100111";
        ram[296] = "0b0100101000";
        ram[297] = "0b0100101001";
        ram[298] = "0b0100101010";
        ram[299] = "0b0100101011";
        ram[300] = "0b0100101100";
        ram[301] = "0b0100101101";
        ram[302] = "0b0100101110";
        ram[303] = "0b0100101111";
        ram[304] = "0b0100110000";
        ram[305] = "0b0100110001";
        ram[306] = "0b0100110010";
        ram[307] = "0b0100110011";
        ram[308] = "0b0100110100";
        ram[309] = "0b0100110101";
        ram[310] = "0b0100110110";
        ram[311] = "0b0100110111";
        ram[312] = "0b0100111000";
        ram[313] = "0b0100111001";
        ram[314] = "0b0100111010";
        ram[315] = "0b0100111011";
        ram[316] = "0b0100111100";
        ram[317] = "0b0100111101";
        ram[318] = "0b0100111110";
        ram[319] = "0b0100111111";
        ram[320] = "0b0101000000";
        ram[321] = "0b0101000001";
        ram[322] = "0b0101000010";
        ram[323] = "0b0101000011";
        ram[324] = "0b0101000100";
        ram[325] = "0b0101000101";
        ram[326] = "0b0101000110";
        ram[327] = "0b0101000111";
        ram[328] = "0b0101001000";
        ram[329] = "0b0101001001";
        ram[330] = "0b0101001010";
        ram[331] = "0b0101001011";
        ram[332] = "0b0101001100";
        ram[333] = "0b0101001101";
        ram[334] = "0b0101001110";
        ram[335] = "0b0101001111";
        ram[336] = "0b0101010000";
        ram[337] = "0b0101010001";
        ram[338] = "0b0101010010";
        ram[339] = "0b0101010011";
        ram[340] = "0b0101010100";
        ram[341] = "0b0101010101";
        ram[342] = "0b0101010110";
        ram[343] = "0b0101010111";
        ram[344] = "0b0101011000";
        ram[345] = "0b0101011001";
        ram[346] = "0b0101011010";
        ram[347] = "0b0101011011";
        ram[348] = "0b0101011100";
        ram[349] = "0b0101011101";
        ram[350] = "0b0101011110";
        ram[351] = "0b0101011111";
        ram[352] = "0b0101100000";
        ram[353] = "0b0101100001";
        ram[354] = "0b0101100010";
        ram[355] = "0b0101100011";
        ram[356] = "0b0101100100";
        ram[357] = "0b0101100101";
        ram[358] = "0b0101100110";
        ram[359] = "0b0101100111";
        ram[360] = "0b0101101000";
        ram[361] = "0b0101101001";
        ram[362] = "0b0101101010";
        ram[363] = "0b0101101011";
        ram[364] = "0b0101101100";
        ram[365] = "0b0101101101";
        ram[366] = "0b0101101110";
        ram[367] = "0b0101101111";
        ram[368] = "0b0101110000";
        ram[369] = "0b0101110001";
        ram[370] = "0b0101110010";
        ram[371] = "0b0101110011";
        ram[372] = "0b0101110100";
        ram[373] = "0b0101110101";
        ram[374] = "0b0101110110";
        ram[375] = "0b0101110111";
        ram[376] = "0b0101111000";
        ram[377] = "0b0101111001";
        ram[378] = "0b0101111010";
        ram[379] = "0b0101111011";
        ram[380] = "0b0101111100";
        ram[381] = "0b0101111101";
        ram[382] = "0b0101111110";
        ram[383] = "0b0101111111";
        ram[384] = "0b0110000000";
        ram[385] = "0b0110000001";
        ram[386] = "0b0110000010";
        ram[387] = "0b0110000011";
        ram[388] = "0b0110000100";
        ram[389] = "0b0110000101";
        ram[390] = "0b0110000110";
        ram[391] = "0b0110000111";
        ram[392] = "0b0110001000";
        ram[393] = "0b0110001001";
        ram[394] = "0b0110001010";
        ram[395] = "0b0110001011";
        ram[396] = "0b0110001100";
        ram[397] = "0b0110001101";
        ram[398] = "0b0110001110";
        ram[399] = "0b0110001111";
        ram[400] = "0b0110010000";
        ram[401] = "0b0110010001";
        ram[402] = "0b0110010010";
        ram[403] = "0b0110010011";
        ram[404] = "0b0110010100";
        ram[405] = "0b0110010101";
        ram[406] = "0b0110010110";
        ram[407] = "0b0110010111";
        ram[408] = "0b0110011000";
        ram[409] = "0b0110011001";
        ram[410] = "0b0110011010";
        ram[411] = "0b0110011011";
        ram[412] = "0b0110011100";
        ram[413] = "0b0110011101";
        ram[414] = "0b0110011110";
        ram[415] = "0b0110011111";
        ram[416] = "0b0110100000";
        ram[417] = "0b0110100001";
        ram[418] = "0b0110100010";
        ram[419] = "0b0110100011";
        ram[420] = "0b0110100100";
        ram[421] = "0b0110100101";
        ram[422] = "0b0110100110";
        ram[423] = "0b0110100111";
        ram[424] = "0b0110101000";
        ram[425] = "0b0110101001";
        ram[426] = "0b0110101010";
        ram[427] = "0b0110101011";
        ram[428] = "0b0110101100";
        ram[429] = "0b0110101101";
        ram[430] = "0b0110101110";
        ram[431] = "0b0110101111";
        ram[432] = "0b0110110000";
        ram[433] = "0b0110110001";
        ram[434] = "0b0110110010";
        ram[435] = "0b0110110011";
        ram[436] = "0b0110110100";
        ram[437] = "0b0110110101";
        ram[438] = "0b0110110110";
        ram[439] = "0b0110110111";
        ram[440] = "0b0110111000";
        ram[441] = "0b0110111001";
        ram[442] = "0b0110111010";
        ram[443] = "0b0110111011";
        ram[444] = "0b0110111100";
        ram[445] = "0b0110111101";
        ram[446] = "0b0110111110";
        ram[447] = "0b0110111111";
        ram[448] = "0b0111000000";
        ram[449] = "0b0111000001";
        ram[450] = "0b0111000010";
        ram[451] = "0b0111000011";
        ram[452] = "0b0111000100";
        ram[453] = "0b0111000101";
        ram[454] = "0b0111000110";
        ram[455] = "0b0111000111";
        ram[456] = "0b0111001000";
        ram[457] = "0b0111001001";
        ram[458] = "0b0111001010";
        ram[459] = "0b0111001011";
        ram[460] = "0b0111001100";
        ram[461] = "0b0111001101";
        ram[462] = "0b0111001110";
        ram[463] = "0b0111001111";
        ram[464] = "0b0111010000";
        ram[465] = "0b0111010001";
        ram[466] = "0b0111010010";
        ram[467] = "0b0111010011";
        ram[468] = "0b0111010100";
        ram[469] = "0b0111010101";
        ram[470] = "0b0111010110";
        ram[471] = "0b0111010111";
        ram[472] = "0b0111011000";
        ram[473] = "0b0111011001";
        ram[474] = "0b0111011010";
        ram[475] = "0b0111011011";
        ram[476] = "0b0111011100";
        ram[477] = "0b0111011101";
        ram[478] = "0b0111011110";
        ram[479] = "0b0111011111";
        ram[480] = "0b0111100000";
        ram[481] = "0b0111100001";
        ram[482] = "0b0111100010";
        ram[483] = "0b0111100011";
        ram[484] = "0b0111100100";
        ram[485] = "0b0111100101";
        ram[486] = "0b0111100110";
        ram[487] = "0b0111100111";
        ram[488] = "0b0111101000";
        ram[489] = "0b0111101001";
        ram[490] = "0b0111101010";
        ram[491] = "0b0111101011";
        ram[492] = "0b0111101100";
        ram[493] = "0b0111101101";
        ram[494] = "0b0111101110";
        ram[495] = "0b0111101111";
        ram[496] = "0b0111110000";
        ram[497] = "0b0111110001";
        ram[498] = "0b0111110010";
        ram[499] = "0b0111110011";
        ram[500] = "0b0111110100";
        ram[501] = "0b0111110101";
        ram[502] = "0b0111110110";
        ram[503] = "0b0111110111";
        ram[504] = "0b0111111000";
        ram[505] = "0b0111111001";
        ram[506] = "0b0111111010";
        ram[507] = "0b0111111011";
        ram[508] = "0b0111111100";
        ram[509] = "0b0111111101";
        ram[510] = "0b0111111110";
        ram[511] = "0b0111111111";
        ram[512] = "0b1000000000";
        ram[513] = "0b1000000001";
        ram[514] = "0b1000000010";
        ram[515] = "0b1000000011";
        ram[516] = "0b1000000100";
        ram[517] = "0b1000000101";
        ram[518] = "0b1000000110";
        ram[519] = "0b1000000111";
        ram[520] = "0b1000001000";
        ram[521] = "0b1000001001";
        ram[522] = "0b1000001010";
        ram[523] = "0b1000001011";
        ram[524] = "0b1000001100";
        ram[525] = "0b1000001101";
        ram[526] = "0b1000001110";
        ram[527] = "0b1000001111";
        ram[528] = "0b1000010000";
        ram[529] = "0b1000010001";
        ram[530] = "0b1000010010";
        ram[531] = "0b1000010011";
        ram[532] = "0b1000010100";
        ram[533] = "0b1000010101";
        ram[534] = "0b1000010110";
        ram[535] = "0b1000010111";
        ram[536] = "0b1000011000";
        ram[537] = "0b1000011001";
        ram[538] = "0b1000011010";
        ram[539] = "0b1000011011";
        ram[540] = "0b1000011100";
        ram[541] = "0b1000011101";
        ram[542] = "0b1000011110";
        ram[543] = "0b1000011111";
        ram[544] = "0b1000100000";
        ram[545] = "0b1000100001";
        ram[546] = "0b1000100010";
        ram[547] = "0b1000100011";
        ram[548] = "0b1000100100";
        ram[549] = "0b1000100101";
        ram[550] = "0b1000100110";
        ram[551] = "0b1000100111";
        ram[552] = "0b1000101000";
        ram[553] = "0b1000101001";
        ram[554] = "0b1000101010";
        ram[555] = "0b1000101011";
        ram[556] = "0b1000101100";
        ram[557] = "0b1000101101";
        ram[558] = "0b1000101110";
        ram[559] = "0b1000101111";
        ram[560] = "0b1000110000";
        ram[561] = "0b1000110001";
        ram[562] = "0b1000110010";
        ram[563] = "0b1000110011";
        ram[564] = "0b1000110100";
        ram[565] = "0b1000110101";
        ram[566] = "0b1000110110";
        ram[567] = "0b1000110111";
        ram[568] = "0b1000111000";
        ram[569] = "0b1000111001";
        ram[570] = "0b1000111010";
        ram[571] = "0b1000111011";
        ram[572] = "0b1000111100";
        ram[573] = "0b1000111101";
        ram[574] = "0b1000111110";
        ram[575] = "0b1000111111";
        ram[576] = "0b1001000000";
        ram[577] = "0b1001000001";
        ram[578] = "0b1001000010";
        ram[579] = "0b1001000011";
        ram[580] = "0b1001000100";
        ram[581] = "0b1001000101";
        ram[582] = "0b1001000110";
        ram[583] = "0b1001000111";
        ram[584] = "0b1001001000";
        ram[585] = "0b1001001001";
        ram[586] = "0b1001001010";
        ram[587] = "0b1001001011";
        ram[588] = "0b1001001100";
        ram[589] = "0b1001001101";
        ram[590] = "0b1001001110";
        ram[591] = "0b1001001111";
        ram[592] = "0b1001010000";
        ram[593] = "0b1001010001";
        ram[594] = "0b1001010010";
        ram[595] = "0b1001010011";
        ram[596] = "0b1001010100";
        ram[597] = "0b1001010101";
        ram[598] = "0b1001010110";
        ram[599] = "0b1001010111";
        ram[600] = "0b1001011000";
        ram[601] = "0b1001011001";
        ram[602] = "0b1001011010";
        ram[603] = "0b1001011011";
        ram[604] = "0b1001011100";
        ram[605] = "0b1001011101";
        ram[606] = "0b1001011110";
        ram[607] = "0b1001011111";
        ram[608] = "0b1001100000";
        ram[609] = "0b1001100001";
        ram[610] = "0b1001100010";
        ram[611] = "0b1001100011";
        ram[612] = "0b1001100100";
        ram[613] = "0b1001100101";
        ram[614] = "0b1001100110";
        ram[615] = "0b1001100111";
        ram[616] = "0b1001101000";
        ram[617] = "0b1001101001";
        ram[618] = "0b1001101010";
        ram[619] = "0b1001101011";
        ram[620] = "0b1001101100";
        ram[621] = "0b1001101101";
        ram[622] = "0b1001101110";
        ram[623] = "0b1001101111";
        ram[624] = "0b1001110000";
        ram[625] = "0b1001110001";
        ram[626] = "0b1001110010";
        ram[627] = "0b1001110011";
        ram[628] = "0b1001110100";
        ram[629] = "0b1001110101";
        ram[630] = "0b1001110110";
        ram[631] = "0b1001110111";
        ram[632] = "0b1001111000";
        ram[633] = "0b1001111001";
        ram[634] = "0b1001111010";
        ram[635] = "0b1001111011";
        ram[636] = "0b1001111100";
        ram[637] = "0b1001111101";
        ram[638] = "0b1001111110";
        ram[639] = "0b1001111111";
        ram[640] = "0b1010000000";
        ram[641] = "0b1010000001";
        ram[642] = "0b1010000010";
        ram[643] = "0b1010000011";
        ram[644] = "0b1010000100";
        ram[645] = "0b1010000101";
        ram[646] = "0b1010000110";
        ram[647] = "0b1010000111";
        ram[648] = "0b1010001000";
        ram[649] = "0b1010001001";
        ram[650] = "0b1010001010";
        ram[651] = "0b1010001011";
        ram[652] = "0b1010001100";
        ram[653] = "0b1010001101";
        ram[654] = "0b1010001110";
        ram[655] = "0b1010001111";
        ram[656] = "0b1010010000";
        ram[657] = "0b1010010001";
        ram[658] = "0b1010010010";
        ram[659] = "0b1010010011";
        ram[660] = "0b1010010100";
        ram[661] = "0b1010010101";
        ram[662] = "0b1010010110";
        ram[663] = "0b1010010111";
        ram[664] = "0b1010011000";
        ram[665] = "0b1010011001";
        ram[666] = "0b1010011010";
        ram[667] = "0b1010011011";
        ram[668] = "0b1010011100";
        ram[669] = "0b1010011101";
        ram[670] = "0b1010011110";
        ram[671] = "0b1010011111";
        ram[672] = "0b1010100000";
        ram[673] = "0b1010100001";
        ram[674] = "0b1010100010";
        ram[675] = "0b1010100011";
        ram[676] = "0b1010100100";
        ram[677] = "0b1010100101";
        ram[678] = "0b1010100110";
        ram[679] = "0b1010100111";
        ram[680] = "0b1010101000";
        ram[681] = "0b1010101001";
        ram[682] = "0b1010101010";
        ram[683] = "0b1010101011";
        ram[684] = "0b1010101100";
        ram[685] = "0b1010101101";
        ram[686] = "0b1010101110";
        ram[687] = "0b1010101111";
        ram[688] = "0b1010110000";
        ram[689] = "0b1010110001";
        ram[690] = "0b1010110010";
        ram[691] = "0b1010110011";
        ram[692] = "0b1010110100";
        ram[693] = "0b1010110101";
        ram[694] = "0b1010110110";
        ram[695] = "0b1010110111";
        ram[696] = "0b1010111000";
        ram[697] = "0b1010111001";
        ram[698] = "0b1010111010";
        ram[699] = "0b1010111011";
        ram[700] = "0b1010111100";
        ram[701] = "0b1010111101";
        ram[702] = "0b1010111110";
        ram[703] = "0b1010111111";
        ram[704] = "0b1011000000";
        ram[705] = "0b1011000001";
        ram[706] = "0b1011000010";
        ram[707] = "0b1011000011";
        ram[708] = "0b1011000100";
        ram[709] = "0b1011000101";
        ram[710] = "0b1011000110";
        ram[711] = "0b1011000111";
        ram[712] = "0b1011001000";
        ram[713] = "0b1011001001";
        ram[714] = "0b1011001010";
        ram[715] = "0b1011001011";
        ram[716] = "0b1011001100";
        ram[717] = "0b1011001101";
        ram[718] = "0b1011001110";
        ram[719] = "0b1011001111";
        ram[720] = "0b1011010000";
        ram[721] = "0b1011010001";
        ram[722] = "0b1011010010";
        ram[723] = "0b1011010011";
        ram[724] = "0b1011010100";
        ram[725] = "0b1011010101";
        ram[726] = "0b1011010110";
        ram[727] = "0b1011010111";
        ram[728] = "0b1011011000";
        ram[729] = "0b1011011001";
        ram[730] = "0b1011011010";
        ram[731] = "0b1011011011";
        ram[732] = "0b1011011100";
        ram[733] = "0b1011011101";
        ram[734] = "0b1011011110";
        ram[735] = "0b1011011111";
        ram[736] = "0b1011100000";
        ram[737] = "0b1011100001";
        ram[738] = "0b1011100010";
        ram[739] = "0b1011100011";
        ram[740] = "0b1011100100";
        ram[741] = "0b1011100101";
        ram[742] = "0b1011100110";
        ram[743] = "0b1011100111";
        ram[744] = "0b1011101000";
        ram[745] = "0b1011101001";
        ram[746] = "0b1011101010";
        ram[747] = "0b1011101011";
        ram[748] = "0b1011101100";
        ram[749] = "0b1011101101";
        ram[750] = "0b1011101110";
        ram[751] = "0b1011101111";
        ram[752] = "0b1011110000";
        ram[753] = "0b1011110001";
        ram[754] = "0b1011110010";
        ram[755] = "0b1011110011";
        ram[756] = "0b1011110100";
        ram[757] = "0b1011110101";
        ram[758] = "0b1011110110";
        ram[759] = "0b1011110111";
        ram[760] = "0b1011111000";
        ram[761] = "0b1011111001";
        ram[762] = "0b1011111010";
        ram[763] = "0b1011111011";
        ram[764] = "0b1011111100";
        ram[765] = "0b1011111101";
        ram[766] = "0b1011111110";
        ram[767] = "0b1011111111";
        ram[768] = "0b1100000000";
        ram[769] = "0b1100000001";
        ram[770] = "0b1100000010";
        ram[771] = "0b1100000011";
        ram[772] = "0b1100000100";
        ram[773] = "0b1100000101";
        ram[774] = "0b1100000110";
        ram[775] = "0b1100000111";
        ram[776] = "0b1100001000";
        ram[777] = "0b1100001001";
        ram[778] = "0b1100001010";
        ram[779] = "0b1100001011";
        ram[780] = "0b1100001100";
        ram[781] = "0b1100001101";
        ram[782] = "0b1100001110";
        ram[783] = "0b1100001111";
        ram[784] = "0b1100010000";
        ram[785] = "0b1100010001";
        ram[786] = "0b1100010010";
        ram[787] = "0b1100010011";
        ram[788] = "0b1100010100";
        ram[789] = "0b1100010101";
        ram[790] = "0b1100010110";
        ram[791] = "0b1100010111";
        ram[792] = "0b1100011000";
        ram[793] = "0b1100011001";
        ram[794] = "0b1100011010";
        ram[795] = "0b1100011011";
        ram[796] = "0b1100011100";
        ram[797] = "0b1100011101";
        ram[798] = "0b1100011110";
        ram[799] = "0b1100011111";
        ram[800] = "0b1100100000";
        ram[801] = "0b1100100001";
        ram[802] = "0b1100100010";
        ram[803] = "0b1100100011";
        ram[804] = "0b1100100100";
        ram[805] = "0b1100100101";
        ram[806] = "0b1100100110";
        ram[807] = "0b1100100111";
        ram[808] = "0b1100101000";
        ram[809] = "0b1100101001";
        ram[810] = "0b1100101010";
        ram[811] = "0b1100101011";
        ram[812] = "0b1100101100";
        ram[813] = "0b1100101101";
        ram[814] = "0b1100101110";
        ram[815] = "0b1100101111";
        ram[816] = "0b1100110000";
        ram[817] = "0b1100110001";
        ram[818] = "0b1100110010";
        ram[819] = "0b1100110011";
        ram[820] = "0b1100110100";
        ram[821] = "0b1100110101";
        ram[822] = "0b1100110110";
        ram[823] = "0b1100110111";
        ram[824] = "0b1100111000";
        ram[825] = "0b1100111001";
        ram[826] = "0b1100111010";
        ram[827] = "0b1100111011";
        ram[828] = "0b1100111100";
        ram[829] = "0b1100111101";
        ram[830] = "0b1100111110";
        ram[831] = "0b1100111111";
        ram[832] = "0b1101000000";
        ram[833] = "0b1101000001";
        ram[834] = "0b1101000010";
        ram[835] = "0b1101000011";
        ram[836] = "0b1101000100";
        ram[837] = "0b1101000101";
        ram[838] = "0b1101000110";
        ram[839] = "0b1101000111";
        ram[840] = "0b1101001000";
        ram[841] = "0b1101001001";
        ram[842] = "0b1101001010";
        ram[843] = "0b1101001011";
        ram[844] = "0b1101001100";
        ram[845] = "0b1101001101";
        ram[846] = "0b1101001110";
        ram[847] = "0b1101001111";
        ram[848] = "0b1101010000";
        ram[849] = "0b1101010001";
        ram[850] = "0b1101010010";
        ram[851] = "0b1101010011";
        ram[852] = "0b1101010100";
        ram[853] = "0b1101010101";
        ram[854] = "0b1101010110";
        ram[855] = "0b1101010111";
        ram[856] = "0b1101011000";
        ram[857] = "0b1101011001";
        ram[858] = "0b1101011010";
        ram[859] = "0b1101011011";
        ram[860] = "0b1101011100";
        ram[861] = "0b1101011101";
        ram[862] = "0b1101011110";
        ram[863] = "0b1101011111";
        ram[864] = "0b1101100000";
        ram[865] = "0b1101100001";
        ram[866] = "0b1101100010";
        ram[867] = "0b1101100011";
        ram[868] = "0b1101100100";
        ram[869] = "0b1101100101";
        ram[870] = "0b1101100110";
        ram[871] = "0b1101100111";
        ram[872] = "0b1101101000";
        ram[873] = "0b1101101001";
        ram[874] = "0b1101101010";
        ram[875] = "0b1101101011";
        ram[876] = "0b1101101100";
        ram[877] = "0b1101101101";
        ram[878] = "0b1101101110";
        ram[879] = "0b1101101111";
        ram[880] = "0b1101110000";
        ram[881] = "0b1101110001";
        ram[882] = "0b1101110010";
        ram[883] = "0b1101110011";
        ram[884] = "0b1101110100";
        ram[885] = "0b1101110101";
        ram[886] = "0b1101110110";
        ram[887] = "0b1101110111";
        ram[888] = "0b1101111000";
        ram[889] = "0b1101111001";
        ram[890] = "0b1101111010";
        ram[891] = "0b1101111011";
        ram[892] = "0b1101111100";
        ram[893] = "0b1101111101";
        ram[894] = "0b1101111110";
        ram[895] = "0b1101111111";
        ram[896] = "0b1110000000";
        ram[897] = "0b1110000001";
        ram[898] = "0b1110000010";
        ram[899] = "0b1110000011";
        ram[900] = "0b1110000100";
        ram[901] = "0b1110000101";
        ram[902] = "0b1110000110";
        ram[903] = "0b1110000111";
        ram[904] = "0b1110001000";
        ram[905] = "0b1110001001";
        ram[906] = "0b1110001010";
        ram[907] = "0b1110001011";
        ram[908] = "0b1110001100";
        ram[909] = "0b1110001101";
        ram[910] = "0b1110001110";
        ram[911] = "0b1110001111";
        ram[912] = "0b1110010000";
        ram[913] = "0b1110010001";
        ram[914] = "0b1110010010";
        ram[915] = "0b1110010011";
        ram[916] = "0b1110010100";
        ram[917] = "0b1110010101";
        ram[918] = "0b1110010110";
        ram[919] = "0b1110010111";
        ram[920] = "0b1110011000";
        ram[921] = "0b1110011001";
        ram[922] = "0b1110011010";
        ram[923] = "0b1110011011";
        ram[924] = "0b1110011100";
        ram[925] = "0b1110011101";
        ram[926] = "0b1110011110";
        ram[927] = "0b1110011111";
        ram[928] = "0b1110100000";
        ram[929] = "0b1110100001";
        ram[930] = "0b1110100010";
        ram[931] = "0b1110100011";
        ram[932] = "0b1110100100";
        ram[933] = "0b1110100101";
        ram[934] = "0b1110100110";
        ram[935] = "0b1110100111";
        ram[936] = "0b1110101000";
        ram[937] = "0b1110101001";
        ram[938] = "0b1110101010";
        ram[939] = "0b1110101011";
        ram[940] = "0b1110101100";
        ram[941] = "0b1110101101";
        ram[942] = "0b1110101110";
        ram[943] = "0b1110101111";
        ram[944] = "0b1110110000";
        ram[945] = "0b1110110001";
        ram[946] = "0b1110110010";
        ram[947] = "0b1110110011";
        ram[948] = "0b1110110100";
        ram[949] = "0b1110110101";
        ram[950] = "0b1110110110";
        ram[951] = "0b1110110111";
        ram[952] = "0b1110111000";
        ram[953] = "0b1110111001";
        ram[954] = "0b1110111010";
        ram[955] = "0b1110111011";
        ram[956] = "0b1110111100";
        ram[957] = "0b1110111101";
        ram[958] = "0b1110111110";
        ram[959] = "0b1110111111";
        ram[960] = "0b1111000000";
        ram[961] = "0b1111000001";
        ram[962] = "0b1111000010";
        ram[963] = "0b1111000011";
        ram[964] = "0b1111000100";
        ram[965] = "0b1111000101";
        ram[966] = "0b1111000110";
        ram[967] = "0b1111000111";
        ram[968] = "0b1111001000";
        ram[969] = "0b1111001001";
        ram[970] = "0b1111001010";
        ram[971] = "0b1111001011";
        ram[972] = "0b1111001100";
        ram[973] = "0b1111001101";
        ram[974] = "0b1111001110";
        ram[975] = "0b1111001111";
        ram[976] = "0b1111010000";
        ram[977] = "0b1111010001";
        ram[978] = "0b1111010010";
        ram[979] = "0b1111010011";
        ram[980] = "0b1111010100";
        ram[981] = "0b1111010101";
        ram[982] = "0b1111010110";
        ram[983] = "0b1111010111";
        ram[984] = "0b1111011000";
        ram[985] = "0b1111011001";
        ram[986] = "0b1111011010";
        ram[987] = "0b1111011011";
        ram[988] = "0b1111011100";
        ram[989] = "0b1111011101";
        ram[990] = "0b1111011110";
        ram[991] = "0b1111011111";
        ram[992] = "0b1111100000";
        ram[993] = "0b1111100001";
        ram[994] = "0b1111100010";
        ram[995] = "0b1111100011";
        ram[996] = "0b1111100100";
        ram[997] = "0b1111100101";
        ram[998] = "0b1111100110";
        ram[999] = "0b1111100111";
        ram[1000] = "0b1111101000";
        ram[1001] = "0b1111101001";
        ram[1002] = "0b1111101010";
        ram[1003] = "0b1111101011";
        ram[1004] = "0b1111101100";
        ram[1005] = "0b1111101101";
        ram[1006] = "0b1111101110";
        ram[1007] = "0b1111101111";
        ram[1008] = "0b1111110000";
        ram[1009] = "0b1111110001";
        ram[1010] = "0b1111110010";
        ram[1011] = "0b1111110011";
        ram[1012] = "0b1111110100";
        ram[1013] = "0b1111110101";
        ram[1014] = "0b1111110110";
        ram[1015] = "0b1111110111";
        ram[1016] = "0b1111111000";
        ram[1017] = "0b1111111001";
        ram[1018] = "0b1111111010";
        ram[1019] = "0b1111111011";
        ram[1020] = "0b1111111100";
        ram[1021] = "0b1111111101";
        ram[1022] = "0b1111111110";
        ram[1023] = "0b1111111111";


SC_METHOD(prc_write_0);
  sensitive<<clk.pos();
   }


void prc_write_0()
{
    if (ce0.read() == sc_dt::Log_1) 
    {
            if(address0.read().is_01() && address0.read().to_uint()<AddressRange)
              q0 = ram[address0.read().to_uint()];
            else
              q0 = sc_lv<DataWidth>();
    }
}


}; //endmodule


SC_MODULE(mcalcAA_23_varinxCeG) {


static const unsigned DataWidth = 10;
static const unsigned AddressRange = 1024;
static const unsigned AddressWidth = 10;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


mcalcAA_23_varinxCeG_ram* meminst;


SC_CTOR(mcalcAA_23_varinxCeG) {
meminst = new mcalcAA_23_varinxCeG_ram("mcalcAA_23_varinxCeG_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~mcalcAA_23_varinxCeG() {
    delete meminst;
}


};//endmodule
#endif
