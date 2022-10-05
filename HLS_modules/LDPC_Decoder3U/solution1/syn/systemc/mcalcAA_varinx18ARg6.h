// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __mcalcAA_varinx18ARg6_H__
#define __mcalcAA_varinx18ARg6_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct mcalcAA_varinx18ARg6_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 27;
  static const unsigned AddressRange = 512;
  static const unsigned AddressWidth = 9;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in <sc_lv<AddressWidth> > address1;
sc_core::sc_in <sc_logic> ce1;
sc_core::sc_out <sc_lv<DataWidth> > q1;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(mcalcAA_varinx18ARg6_ram) {
        ram[0] = "0b100101010010000001001010110";
        ram[1] = "0b100101011010000010001010111";
        ram[2] = "0b100101100010000011001011000";
        ram[3] = "0b100101101010000100001011001";
        ram[4] = "0b100101110010000101001011010";
        ram[5] = "0b100101111010000110001011011";
        ram[6] = "0b100110000010000111001011100";
        ram[7] = "0b100110001010001000001011101";
        ram[8] = "0b100110010010001001001011110";
        ram[9] = "0b100110011010001010001011111";
        ram[10] = "0b100110100010001011001100000";
        ram[11] = "0b100110101010001100001100001";
        ram[12] = "0b100110110010001101001100010";
        ram[13] = "0b100110111010001110001100011";
        ram[14] = "0b100111000010001111001100100";
        ram[15] = "0b100111001010010000001100101";
        ram[16] = "0b100111010010010001001100110";
        ram[17] = "0b100111011010010010001100111";
        ram[18] = "0b100111100010010011001101000";
        ram[19] = "0b100111101010010100001101001";
        ram[20] = "0b100111110010010101001101010";
        ram[21] = "0b100111111010010110001101011";
        ram[22] = "0b101000000010010111001101100";
        ram[23] = "0b101000001010011000001101101";
        ram[24] = "0b101000010010011001001101110";
        ram[25] = "0b101000011010011010001101111";
        ram[26] = "0b101000100010011011001110000";
        ram[27] = "0b101000101010011100001110001";
        ram[28] = "0b101000110010011101001110010";
        ram[29] = "0b101000111010011110001110011";
        ram[30] = "0b101001000010011111001110100";
        ram[31] = "0b101001001010100000001110101";
        ram[32] = "0b101001010010100001001110110";
        ram[33] = "0b101001011010100010001110111";
        ram[34] = "0b101001100010100011001111000";
        ram[35] = "0b101001101010100100001111001";
        ram[36] = "0b101001110010100101001111010";
        ram[37] = "0b101001111010100110001111011";
        ram[38] = "0b101010000010100111001111100";
        ram[39] = "0b101010001010101000001111101";
        ram[40] = "0b101010010010101001001111110";
        ram[41] = "0b101010011010101010001111111";
        ram[42] = "0b101010100010101011000000000";
        ram[43] = "0b101010101010101100000000001";
        ram[44] = "0b101010110010101101000000010";
        ram[45] = "0b101010111010101110000000011";
        ram[46] = "0b101011000010101111000000100";
        ram[47] = "0b101011001010110000000000101";
        ram[48] = "0b101011010010110001000000110";
        ram[49] = "0b101011011010110010000000111";
        ram[50] = "0b101011100010110011000001000";
        ram[51] = "0b101011101010110100000001001";
        ram[52] = "0b101011110010110101000001010";
        ram[53] = "0b101011111010110110000001011";
        ram[54] = "0b101100000010110111000001100";
        ram[55] = "0b101100001010111000000001101";
        ram[56] = "0b101100010010111001000001110";
        ram[57] = "0b101100011010111010000001111";
        ram[58] = "0b101100100010111011000010000";
        ram[59] = "0b101100101010111100000010001";
        ram[60] = "0b101100110010111101000010010";
        ram[61] = "0b101100111010111110000010011";
        ram[62] = "0b101101000010111111000010100";
        ram[63] = "0b101101001011000000000010101";
        ram[64] = "0b101101010011000001000010110";
        ram[65] = "0b101101011011000010000010111";
        ram[66] = "0b101101100011000011000011000";
        ram[67] = "0b101101101011000100000011001";
        ram[68] = "0b101101110011000101000011010";
        ram[69] = "0b101101111011000110000011011";
        ram[70] = "0b101110000011000111000011100";
        ram[71] = "0b101110001011001000000011101";
        ram[72] = "0b101110010011001001000011110";
        ram[73] = "0b101110011011001010000011111";
        ram[74] = "0b101110100011001011000100000";
        ram[75] = "0b101110101011001100000100001";
        ram[76] = "0b101110110011001101000100010";
        ram[77] = "0b101110111011001110000100011";
        ram[78] = "0b101111000011001111000100100";
        ram[79] = "0b101111001011010000000100101";
        ram[80] = "0b101111010011010001000100110";
        ram[81] = "0b101111011011010010000100111";
        ram[82] = "0b101111100011010011000101000";
        ram[83] = "0b101111101011010100000101001";
        ram[84] = "0b101111110011010101000101010";
        ram[85] = "0b101111111011010110000101011";
        ram[86] = "0b100000000011010111000101100";
        ram[87] = "0b100000001011011000000101101";
        ram[88] = "0b100000010011011001000101110";
        ram[89] = "0b100000011011011010000101111";
        ram[90] = "0b100000100011011011000110000";
        ram[91] = "0b100000101011011100000110001";
        ram[92] = "0b100000110011011101000110010";
        ram[93] = "0b100000111011011110000110011";
        ram[94] = "0b100001000011011111000110100";
        ram[95] = "0b100001001011100000000110101";
        ram[96] = "0b100001010011100001000110110";
        ram[97] = "0b100001011011100010000110111";
        ram[98] = "0b100001100011100011000111000";
        ram[99] = "0b100001101011100100000111001";
        ram[100] = "0b100001110011100101000111010";
        ram[101] = "0b100001111011100110000111011";
        ram[102] = "0b100010000011100111000111100";
        ram[103] = "0b100010001011101000000111101";
        ram[104] = "0b100010010011101001000111110";
        ram[105] = "0b100010011011101010000111111";
        ram[106] = "0b100010100011101011001000000";
        ram[107] = "0b100010101011101100001000001";
        ram[108] = "0b100010110011101101001000010";
        ram[109] = "0b100010111011101110001000011";
        ram[110] = "0b100011000011101111001000100";
        ram[111] = "0b100011001011110000001000101";
        ram[112] = "0b100011010011110001001000110";
        ram[113] = "0b100011011011110010001000111";
        ram[114] = "0b100011100011110011001001000";
        ram[115] = "0b100011101011110100001001001";
        ram[116] = "0b100011110011110101001001010";
        ram[117] = "0b100011111011110110001001011";
        ram[118] = "0b100100000011110111001001100";
        ram[119] = "0b100100001011111000001001101";
        ram[120] = "0b100100010011111001001001110";
        ram[121] = "0b100100011011111010001001111";
        ram[122] = "0b100100100011111011001010000";
        ram[123] = "0b100100101011111100001010001";
        ram[124] = "0b100100110011111101001010010";
        ram[125] = "0b100100111011111110001010011";
        ram[126] = "0b100101000011111111001010100";
        ram[127] = "0b100101001010000000001010101";
        ram[128] = "0b111101100100110110010111000";
        ram[129] = "0b111101101100110111010111001";
        ram[130] = "0b111101110100111000010111010";
        ram[131] = "0b111101111100111001010111011";
        ram[132] = "0b111110000100111010010111100";
        ram[133] = "0b111110001100111011010111101";
        ram[134] = "0b111110010100111100010111110";
        ram[135] = "0b111110011100111101010111111";
        ram[136] = "0b111110100100111110011000000";
        ram[137] = "0b111110101100111111011000001";
        ram[138] = "0b111110110101000000011000010";
        ram[139] = "0b111110111101000001011000011";
        ram[140] = "0b111111000101000010011000100";
        ram[141] = "0b111111001101000011011000101";
        ram[142] = "0b111111010101000100011000110";
        ram[143] = "0b111111011101000101011000111";
        ram[144] = "0b111111100101000110011001000";
        ram[145] = "0b111111101101000111011001001";
        ram[146] = "0b111111110101001000011001010";
        ram[147] = "0b111111111101001001011001011";
        ram[148] = "0b110000000101001010011001100";
        ram[149] = "0b110000001101001011011001101";
        ram[150] = "0b110000010101001100011001110";
        ram[151] = "0b110000011101001101011001111";
        ram[152] = "0b110000100101001110011010000";
        ram[153] = "0b110000101101001111011010001";
        ram[154] = "0b110000110101010000011010010";
        ram[155] = "0b110000111101010001011010011";
        ram[156] = "0b110001000101010010011010100";
        ram[157] = "0b110001001101010011011010101";
        ram[158] = "0b110001010101010100011010110";
        ram[159] = "0b110001011101010101011010111";
        ram[160] = "0b110001100101010110011011000";
        ram[161] = "0b110001101101010111011011001";
        ram[162] = "0b110001110101011000011011010";
        ram[163] = "0b110001111101011001011011011";
        ram[164] = "0b110010000101011010011011100";
        ram[165] = "0b110010001101011011011011101";
        ram[166] = "0b110010010101011100011011110";
        ram[167] = "0b110010011101011101011011111";
        ram[168] = "0b110010100101011110011100000";
        ram[169] = "0b110010101101011111011100001";
        ram[170] = "0b110010110101100000011100010";
        ram[171] = "0b110010111101100001011100011";
        ram[172] = "0b110011000101100010011100100";
        ram[173] = "0b110011001101100011011100101";
        ram[174] = "0b110011010101100100011100110";
        ram[175] = "0b110011011101100101011100111";
        ram[176] = "0b110011100101100110011101000";
        ram[177] = "0b110011101101100111011101001";
        ram[178] = "0b110011110101101000011101010";
        ram[179] = "0b110011111101101001011101011";
        ram[180] = "0b110100000101101010011101100";
        ram[181] = "0b110100001101101011011101101";
        ram[182] = "0b110100010101101100011101110";
        ram[183] = "0b110100011101101101011101111";
        ram[184] = "0b110100100101101110011110000";
        ram[185] = "0b110100101101101111011110001";
        ram[186] = "0b110100110101110000011110010";
        ram[187] = "0b110100111101110001011110011";
        ram[188] = "0b110101000101110010011110100";
        ram[189] = "0b110101001101110011011110101";
        ram[190] = "0b110101010101110100011110110";
        ram[191] = "0b110101011101110101011110111";
        ram[192] = "0b110101100101110110011111000";
        ram[193] = "0b110101101101110111011111001";
        ram[194] = "0b110101110101111000011111010";
        ram[195] = "0b110101111101111001011111011";
        ram[196] = "0b110110000101111010011111100";
        ram[197] = "0b110110001101111011011111101";
        ram[198] = "0b110110010101111100011111110";
        ram[199] = "0b110110011101111101011111111";
        ram[200] = "0b110110100101111110010000000";
        ram[201] = "0b110110101101111111010000001";
        ram[202] = "0b110110110100000000010000010";
        ram[203] = "0b110110111100000001010000011";
        ram[204] = "0b110111000100000010010000100";
        ram[205] = "0b110111001100000011010000101";
        ram[206] = "0b110111010100000100010000110";
        ram[207] = "0b110111011100000101010000111";
        ram[208] = "0b110111100100000110010001000";
        ram[209] = "0b110111101100000111010001001";
        ram[210] = "0b110111110100001000010001010";
        ram[211] = "0b110111111100001001010001011";
        ram[212] = "0b111000000100001010010001100";
        ram[213] = "0b111000001100001011010001101";
        ram[214] = "0b111000010100001100010001110";
        ram[215] = "0b111000011100001101010001111";
        ram[216] = "0b111000100100001110010010000";
        ram[217] = "0b111000101100001111010010001";
        ram[218] = "0b111000110100010000010010010";
        ram[219] = "0b111000111100010001010010011";
        ram[220] = "0b111001000100010010010010100";
        ram[221] = "0b111001001100010011010010101";
        ram[222] = "0b111001010100010100010010110";
        ram[223] = "0b111001011100010101010010111";
        ram[224] = "0b111001100100010110010011000";
        ram[225] = "0b111001101100010111010011001";
        ram[226] = "0b111001110100011000010011010";
        ram[227] = "0b111001111100011001010011011";
        ram[228] = "0b111010000100011010010011100";
        ram[229] = "0b111010001100011011010011101";
        ram[230] = "0b111010010100011100010011110";
        ram[231] = "0b111010011100011101010011111";
        ram[232] = "0b111010100100011110010100000";
        ram[233] = "0b111010101100011111010100001";
        ram[234] = "0b111010110100100000010100010";
        ram[235] = "0b111010111100100001010100011";
        ram[236] = "0b111011000100100010010100100";
        ram[237] = "0b111011001100100011010100101";
        ram[238] = "0b111011010100100100010100110";
        ram[239] = "0b111011011100100101010100111";
        ram[240] = "0b111011100100100110010101000";
        ram[241] = "0b111011101100100111010101001";
        ram[242] = "0b111011110100101000010101010";
        ram[243] = "0b111011111100101001010101011";
        ram[244] = "0b111100000100101010010101100";
        ram[245] = "0b111100001100101011010101101";
        ram[246] = "0b111100010100101100010101110";
        ram[247] = "0b111100011100101101010101111";
        ram[248] = "0b111100100100101110010110000";
        ram[249] = "0b111100101100101111010110001";
        ram[250] = "0b111100110100110000010110010";
        ram[251] = "0b111100111100110001010110011";
        ram[252] = "0b111101000100110010010110100";
        ram[253] = "0b111101001100110011010110101";
        ram[254] = "0b111101010100110100010110110";
        ram[255] = "0b111101011100110101010110111";
        ram[256] = "0b110011000100111010000011001";
        ram[257] = "0b110011001100111011000011010";
        ram[258] = "0b110011010100111100000011011";
        ram[259] = "0b110011011100111101000011100";
        ram[260] = "0b110011100100111110000011101";
        ram[261] = "0b110011101100111111000011110";
        ram[262] = "0b110011110101000000000011111";
        ram[263] = "0b110011111101000001000100000";
        ram[264] = "0b110100000101000010000100001";
        ram[265] = "0b110100001101000011000100010";
        ram[266] = "0b110100010101000100000100011";
        ram[267] = "0b110100011101000101000100100";
        ram[268] = "0b110100100101000110000100101";
        ram[269] = "0b110100101101000111000100110";
        ram[270] = "0b110100110101001000000100111";
        ram[271] = "0b110100111101001001000101000";
        ram[272] = "0b110101000101001010000101001";
        ram[273] = "0b110101001101001011000101010";
        ram[274] = "0b110101010101001100000101011";
        ram[275] = "0b110101011101001101000101100";
        ram[276] = "0b110101100101001110000101101";
        ram[277] = "0b110101101101001111000101110";
        ram[278] = "0b110101110101010000000101111";
        ram[279] = "0b110101111101010001000110000";
        ram[280] = "0b110110000101010010000110001";
        ram[281] = "0b110110001101010011000110010";
        ram[282] = "0b110110010101010100000110011";
        ram[283] = "0b110110011101010101000110100";
        ram[284] = "0b110110100101010110000110101";
        ram[285] = "0b110110101101010111000110110";
        ram[286] = "0b110110110101011000000110111";
        ram[287] = "0b110110111101011001000111000";
        ram[288] = "0b110111000101011010000111001";
        ram[289] = "0b110111001101011011000111010";
        ram[290] = "0b110111010101011100000111011";
        ram[291] = "0b110111011101011101000111100";
        ram[292] = "0b110111100101011110000111101";
        ram[293] = "0b110111101101011111000111110";
        ram[294] = "0b110111110101100000000111111";
        ram[295] = "0b110111111101100001001000000";
        ram[296] = "0b111000000101100010001000001";
        ram[297] = "0b111000001101100011001000010";
        ram[298] = "0b111000010101100100001000011";
        ram[299] = "0b111000011101100101001000100";
        ram[300] = "0b111000100101100110001000101";
        ram[301] = "0b111000101101100111001000110";
        ram[302] = "0b111000110101101000001000111";
        ram[303] = "0b111000111101101001001001000";
        ram[304] = "0b111001000101101010001001001";
        ram[305] = "0b111001001101101011001001010";
        ram[306] = "0b111001010101101100001001011";
        ram[307] = "0b111001011101101101001001100";
        ram[308] = "0b111001100101101110001001101";
        ram[309] = "0b111001101101101111001001110";
        ram[310] = "0b111001110101110000001001111";
        ram[311] = "0b111001111101110001001010000";
        ram[312] = "0b111010000101110010001010001";
        ram[313] = "0b111010001101110011001010010";
        ram[314] = "0b111010010101110100001010011";
        ram[315] = "0b111010011101110101001010100";
        ram[316] = "0b111010100101110110001010101";
        ram[317] = "0b111010101101110111001010110";
        ram[318] = "0b111010110101111000001010111";
        ram[319] = "0b111010111101111001001011000";
        ram[320] = "0b111011000101111010001011001";
        ram[321] = "0b111011001101111011001011010";
        ram[322] = "0b111011010101111100001011011";
        ram[323] = "0b111011011101111101001011100";
        ram[324] = "0b111011100101111110001011101";
        ram[325] = "0b111011101101111111001011110";
        ram[326] = "0b111011110100000000001011111";
        ram[327] = "0b111011111100000001001100000";
        ram[328] = "0b111100000100000010001100001";
        ram[329] = "0b111100001100000011001100010";
        ram[330] = "0b111100010100000100001100011";
        ram[331] = "0b111100011100000101001100100";
        ram[332] = "0b111100100100000110001100101";
        ram[333] = "0b111100101100000111001100110";
        ram[334] = "0b111100110100001000001100111";
        ram[335] = "0b111100111100001001001101000";
        ram[336] = "0b111101000100001010001101001";
        ram[337] = "0b111101001100001011001101010";
        ram[338] = "0b111101010100001100001101011";
        ram[339] = "0b111101011100001101001101100";
        ram[340] = "0b111101100100001110001101101";
        ram[341] = "0b111101101100001111001101110";
        ram[342] = "0b111101110100010000001101111";
        ram[343] = "0b111101111100010001001110000";
        ram[344] = "0b111110000100010010001110001";
        ram[345] = "0b111110001100010011001110010";
        ram[346] = "0b111110010100010100001110011";
        ram[347] = "0b111110011100010101001110100";
        ram[348] = "0b111110100100010110001110101";
        ram[349] = "0b111110101100010111001110110";
        ram[350] = "0b111110110100011000001110111";
        ram[351] = "0b111110111100011001001111000";
        ram[352] = "0b111111000100011010001111001";
        ram[353] = "0b111111001100011011001111010";
        ram[354] = "0b111111010100011100001111011";
        ram[355] = "0b111111011100011101001111100";
        ram[356] = "0b111111100100011110001111101";
        ram[357] = "0b111111101100011111001111110";
        ram[358] = "0b111111110100100000001111111";
        ram[359] = "0b111111111100100001000000000";
        ram[360] = "0b110000000100100010000000001";
        ram[361] = "0b110000001100100011000000010";
        ram[362] = "0b110000010100100100000000011";
        ram[363] = "0b110000011100100101000000100";
        ram[364] = "0b110000100100100110000000101";
        ram[365] = "0b110000101100100111000000110";
        ram[366] = "0b110000110100101000000000111";
        ram[367] = "0b110000111100101001000001000";
        ram[368] = "0b110001000100101010000001001";
        ram[369] = "0b110001001100101011000001010";
        ram[370] = "0b110001010100101100000001011";
        ram[371] = "0b110001011100101101000001100";
        ram[372] = "0b110001100100101110000001101";
        ram[373] = "0b110001101100101111000001110";
        ram[374] = "0b110001110100110000000001111";
        ram[375] = "0b110001111100110001000010000";
        ram[376] = "0b110010000100110010000010001";
        ram[377] = "0b110010001100110011000010010";
        ram[378] = "0b110010010100110100000010011";
        ram[379] = "0b110010011100110101000010100";
        ram[380] = "0b110010100100110110000010101";
        ram[381] = "0b110010101100110111000010110";
        ram[382] = "0b110010110100111000000010111";
        ram[383] = "0b110010111100111001000011000";
        ram[384] = "0b111111111010010111001100010";
        ram[385] = "0b110000000010011000001100011";
        ram[386] = "0b110000001010011001001100100";
        ram[387] = "0b110000010010011010001100101";
        ram[388] = "0b110000011010011011001100110";
        ram[389] = "0b110000100010011100001100111";
        ram[390] = "0b110000101010011101001101000";
        ram[391] = "0b110000110010011110001101001";
        ram[392] = "0b110000111010011111001101010";
        ram[393] = "0b110001000010100000001101011";
        ram[394] = "0b110001001010100001001101100";
        ram[395] = "0b110001010010100010001101101";
        ram[396] = "0b110001011010100011001101110";
        ram[397] = "0b110001100010100100001101111";
        ram[398] = "0b110001101010100101001110000";
        ram[399] = "0b110001110010100110001110001";
        ram[400] = "0b110001111010100111001110010";
        ram[401] = "0b110010000010101000001110011";
        ram[402] = "0b110010001010101001001110100";
        ram[403] = "0b110010010010101010001110101";
        ram[404] = "0b110010011010101011001110110";
        ram[405] = "0b110010100010101100001110111";
        ram[406] = "0b110010101010101101001111000";
        ram[407] = "0b110010110010101110001111001";
        ram[408] = "0b110010111010101111001111010";
        ram[409] = "0b110011000010110000001111011";
        ram[410] = "0b110011001010110001001111100";
        ram[411] = "0b110011010010110010001111101";
        ram[412] = "0b110011011010110011001111110";
        ram[413] = "0b110011100010110100001111111";
        ram[414] = "0b110011101010110101000000000";
        ram[415] = "0b110011110010110110000000001";
        ram[416] = "0b110011111010110111000000010";
        ram[417] = "0b110100000010111000000000011";
        ram[418] = "0b110100001010111001000000100";
        ram[419] = "0b110100010010111010000000101";
        ram[420] = "0b110100011010111011000000110";
        ram[421] = "0b110100100010111100000000111";
        ram[422] = "0b110100101010111101000001000";
        ram[423] = "0b110100110010111110000001001";
        ram[424] = "0b110100111010111111000001010";
        ram[425] = "0b110101000011000000000001011";
        ram[426] = "0b110101001011000001000001100";
        ram[427] = "0b110101010011000010000001101";
        ram[428] = "0b110101011011000011000001110";
        ram[429] = "0b110101100011000100000001111";
        ram[430] = "0b110101101011000101000010000";
        ram[431] = "0b110101110011000110000010001";
        ram[432] = "0b110101111011000111000010010";
        ram[433] = "0b110110000011001000000010011";
        ram[434] = "0b110110001011001001000010100";
        ram[435] = "0b110110010011001010000010101";
        ram[436] = "0b110110011011001011000010110";
        ram[437] = "0b110110100011001100000010111";
        ram[438] = "0b110110101011001101000011000";
        ram[439] = "0b110110110011001110000011001";
        ram[440] = "0b110110111011001111000011010";
        ram[441] = "0b110111000011010000000011011";
        ram[442] = "0b110111001011010001000011100";
        ram[443] = "0b110111010011010010000011101";
        ram[444] = "0b110111011011010011000011110";
        ram[445] = "0b110111100011010100000011111";
        ram[446] = "0b110111101011010101000100000";
        ram[447] = "0b110111110011010110000100001";
        ram[448] = "0b110111111011010111000100010";
        ram[449] = "0b111000000011011000000100011";
        ram[450] = "0b111000001011011001000100100";
        ram[451] = "0b111000010011011010000100101";
        ram[452] = "0b111000011011011011000100110";
        ram[453] = "0b111000100011011100000100111";
        ram[454] = "0b111000101011011101000101000";
        ram[455] = "0b111000110011011110000101001";
        ram[456] = "0b111000111011011111000101010";
        ram[457] = "0b111001000011100000000101011";
        ram[458] = "0b111001001011100001000101100";
        ram[459] = "0b111001010011100010000101101";
        ram[460] = "0b111001011011100011000101110";
        ram[461] = "0b111001100011100100000101111";
        ram[462] = "0b111001101011100101000110000";
        ram[463] = "0b111001110011100110000110001";
        ram[464] = "0b111001111011100111000110010";
        ram[465] = "0b111010000011101000000110011";
        ram[466] = "0b111010001011101001000110100";
        ram[467] = "0b111010010011101010000110101";
        ram[468] = "0b111010011011101011000110110";
        ram[469] = "0b111010100011101100000110111";
        ram[470] = "0b111010101011101101000111000";
        ram[471] = "0b111010110011101110000111001";
        ram[472] = "0b111010111011101111000111010";
        ram[473] = "0b111011000011110000000111011";
        ram[474] = "0b111011001011110001000111100";
        ram[475] = "0b111011010011110010000111101";
        ram[476] = "0b111011011011110011000111110";
        ram[477] = "0b111011100011110100000111111";
        ram[478] = "0b111011101011110101001000000";
        ram[479] = "0b111011110011110110001000001";
        ram[480] = "0b111011111011110111001000010";
        ram[481] = "0b111100000011111000001000011";
        ram[482] = "0b111100001011111001001000100";
        ram[483] = "0b111100010011111010001000101";
        ram[484] = "0b111100011011111011001000110";
        ram[485] = "0b111100100011111100001000111";
        ram[486] = "0b111100101011111101001001000";
        ram[487] = "0b111100110011111110001001001";
        ram[488] = "0b111100111011111111001001010";
        ram[489] = "0b111101000010000000001001011";
        ram[490] = "0b111101001010000001001001100";
        ram[491] = "0b111101010010000010001001101";
        ram[492] = "0b111101011010000011001001110";
        ram[493] = "0b111101100010000100001001111";
        ram[494] = "0b111101101010000101001010000";
        ram[495] = "0b111101110010000110001010001";
        ram[496] = "0b111101111010000111001010010";
        ram[497] = "0b111110000010001000001010011";
        ram[498] = "0b111110001010001001001010100";
        ram[499] = "0b111110010010001010001010101";
        ram[500] = "0b111110011010001011001010110";
        ram[501] = "0b111110100010001100001010111";
        ram[502] = "0b111110101010001101001011000";
        ram[503] = "0b111110110010001110001011001";
        ram[504] = "0b111110111010001111001011010";
        ram[505] = "0b111111000010010000001011011";
        ram[506] = "0b111111001010010001001011100";
        ram[507] = "0b111111010010010010001011101";
        ram[508] = "0b111111011010010011001011110";
        ram[509] = "0b111111100010010100001011111";
        ram[510] = "0b111111101010010101001100000";
        ram[511] = "0b111111110010010110001100001";


SC_METHOD(prc_write_0);
  sensitive<<clk.pos();


SC_METHOD(prc_write_1);
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


void prc_write_1()
{
    if (ce1.read() == sc_dt::Log_1) 
    {
            if(address1.read().is_01() && address1.read().to_uint()<AddressRange)
              q1 = ram[address1.read().to_uint()];
            else
              q1 = sc_lv<DataWidth>();
    }
}


}; //endmodule


SC_MODULE(mcalcAA_varinx18ARg6) {


static const unsigned DataWidth = 27;
static const unsigned AddressRange = 512;
static const unsigned AddressWidth = 9;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in <sc_lv<AddressWidth> > address1;
sc_core::sc_in<sc_logic> ce1;
sc_core::sc_out <sc_lv<DataWidth> > q1;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


mcalcAA_varinx18ARg6_ram* meminst;


SC_CTOR(mcalcAA_varinx18ARg6) {
meminst = new mcalcAA_varinx18ARg6_ram("mcalcAA_varinx18ARg6_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->address1(address1);
meminst->ce1(ce1);
meminst->q1(q1);

meminst->reset(reset);
meminst->clk(clk);
}
~mcalcAA_varinx18ARg6() {
    delete meminst;
}


};//endmodule
#endif
