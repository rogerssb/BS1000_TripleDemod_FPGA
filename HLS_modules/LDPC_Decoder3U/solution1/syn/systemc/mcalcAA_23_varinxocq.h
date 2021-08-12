// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __mcalcAA_23_varinxocq_H__
#define __mcalcAA_23_varinxocq_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct mcalcAA_23_varinxocq_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 30;
  static const unsigned AddressRange = 256;
  static const unsigned AddressWidth = 8;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(mcalcAA_23_varinxocq_ram) {
        ram[0] = "0b011101000000001001000000000000";
        ram[1] = "0b011101010000001001100000000001";
        ram[2] = "0b011101100000001010000000000010";
        ram[3] = "0b011101110000001010100000000011";
        ram[4] = "0b011110000000001011000000000100";
        ram[5] = "0b011110010000001011100000000101";
        ram[6] = "0b011110100000001100000000000110";
        ram[7] = "0b011110110000001100100000000111";
        ram[8] = "0b011111000000001101000000001000";
        ram[9] = "0b011111010000001101100000001001";
        ram[10] = "0b011111100000001110000000001010";
        ram[11] = "0b011111110000001110100000001011";
        ram[12] = "0b010000000000001111000000001100";
        ram[13] = "0b010000010000001111100000001101";
        ram[14] = "0b010000100000010000000000001110";
        ram[15] = "0b010000110000010000100000001111";
        ram[16] = "0b010001000000010001000000010000";
        ram[17] = "0b010001010000010001100000010001";
        ram[18] = "0b010001100000010010000000010010";
        ram[19] = "0b010001110000010010100000010011";
        ram[20] = "0b010010000000010011000000010100";
        ram[21] = "0b010010010000010011100000010101";
        ram[22] = "0b010010100000010100000000010110";
        ram[23] = "0b010010110000010100100000010111";
        ram[24] = "0b010011000000010101000000011000";
        ram[25] = "0b010011010000010101100000011001";
        ram[26] = "0b010011100000010110000000011010";
        ram[27] = "0b010011110000010110100000011011";
        ram[28] = "0b010100000000010111000000011100";
        ram[29] = "0b010100010000010111100000011101";
        ram[30] = "0b010100100000011000000000011110";
        ram[31] = "0b010100110000011000100000011111";
        ram[32] = "0b010101000000011001000000100000";
        ram[33] = "0b010101010000011001100000100001";
        ram[34] = "0b010101100000011010000000100010";
        ram[35] = "0b010101110000011010100000100011";
        ram[36] = "0b010110000000011011000000100100";
        ram[37] = "0b010110010000011011100000100101";
        ram[38] = "0b010110100000011100000000100110";
        ram[39] = "0b010110110000011100100000100111";
        ram[40] = "0b010111000000011101000000101000";
        ram[41] = "0b010111010000011101100000101001";
        ram[42] = "0b010111100000011110000000101010";
        ram[43] = "0b010111110000011110100000101011";
        ram[44] = "0b011000000000011111000000101100";
        ram[45] = "0b011000010000011111100000101101";
        ram[46] = "0b011000100000000000000000101110";
        ram[47] = "0b011000110000000000100000101111";
        ram[48] = "0b011001000000000001000000110000";
        ram[49] = "0b011001010000000001100000110001";
        ram[50] = "0b011001100000000010000000110010";
        ram[51] = "0b011001110000000010100000110011";
        ram[52] = "0b011010000000000011000000110100";
        ram[53] = "0b011010010000000011100000110101";
        ram[54] = "0b011010100000000100000000110110";
        ram[55] = "0b011010110000000100100000110111";
        ram[56] = "0b011011000000000101000000111000";
        ram[57] = "0b011011010000000101100000111001";
        ram[58] = "0b011011100000000110000000111010";
        ram[59] = "0b011011110000000110100000111011";
        ram[60] = "0b011100000000000111000000111100";
        ram[61] = "0b011100010000000111100000111101";
        ram[62] = "0b011100100000001000000000111110";
        ram[63] = "0b011100110000001000100000111111";
        ram[64] = "0b100101010000110000000001000000";
        ram[65] = "0b100101100000110000100001000001";
        ram[66] = "0b100101110000110001000001000010";
        ram[67] = "0b100110000000110001100001000011";
        ram[68] = "0b100110010000110010000001000100";
        ram[69] = "0b100110100000110010100001000101";
        ram[70] = "0b100110110000110011000001000110";
        ram[71] = "0b100111000000110011100001000111";
        ram[72] = "0b100111010000110100000001001000";
        ram[73] = "0b100111100000110100100001001001";
        ram[74] = "0b100111110000110101000001001010";
        ram[75] = "0b101000000000110101100001001011";
        ram[76] = "0b101000010000110110000001001100";
        ram[77] = "0b101000100000110110100001001101";
        ram[78] = "0b101000110000110111000001001110";
        ram[79] = "0b101001000000110111100001001111";
        ram[80] = "0b101001010000111000000001010000";
        ram[81] = "0b101001100000111000100001010001";
        ram[82] = "0b101001110000111001000001010010";
        ram[83] = "0b101010000000111001100001010011";
        ram[84] = "0b101010010000111010000001010100";
        ram[85] = "0b101010100000111010100001010101";
        ram[86] = "0b101010110000111011000001010110";
        ram[87] = "0b101011000000111011100001010111";
        ram[88] = "0b101011010000111100000001011000";
        ram[89] = "0b101011100000111100100001011001";
        ram[90] = "0b101011110000111101000001011010";
        ram[91] = "0b101100000000111101100001011011";
        ram[92] = "0b101100010000111110000001011100";
        ram[93] = "0b101100100000111110100001011101";
        ram[94] = "0b101100110000111111000001011110";
        ram[95] = "0b101101000000111111100001011111";
        ram[96] = "0b101101010000100000000001100000";
        ram[97] = "0b101101100000100000100001100001";
        ram[98] = "0b101101110000100001000001100010";
        ram[99] = "0b101110000000100001100001100011";
        ram[100] = "0b101110010000100010000001100100";
        ram[101] = "0b101110100000100010100001100101";
        ram[102] = "0b101110110000100011000001100110";
        ram[103] = "0b101111000000100011100001100111";
        ram[104] = "0b101111010000100100000001101000";
        ram[105] = "0b101111100000100100100001101001";
        ram[106] = "0b101111110000100101000001101010";
        ram[107] = "0b100000000000100101100001101011";
        ram[108] = "0b100000010000100110000001101100";
        ram[109] = "0b100000100000100110100001101101";
        ram[110] = "0b100000110000100111000001101110";
        ram[111] = "0b100001000000100111100001101111";
        ram[112] = "0b100001010000101000000001110000";
        ram[113] = "0b100001100000101000100001110001";
        ram[114] = "0b100001110000101001000001110010";
        ram[115] = "0b100010000000101001100001110011";
        ram[116] = "0b100010010000101010000001110100";
        ram[117] = "0b100010100000101010100001110101";
        ram[118] = "0b100010110000101011000001110110";
        ram[119] = "0b100011000000101011100001110111";
        ram[120] = "0b100011010000101100000001111000";
        ram[121] = "0b100011100000101100100001111001";
        ram[122] = "0b100011110000101101000001111010";
        ram[123] = "0b100100000000101101100001111011";
        ram[124] = "0b100100010000101110000001111100";
        ram[125] = "0b100100100000101110100001111101";
        ram[126] = "0b100100110000101111000001111110";
        ram[127] = "0b100101000000101111100001111111";
        ram[128] = "0b101011100000001101100010000000";
        ram[129] = "0b101011110000001110000010000001";
        ram[130] = "0b101100000000001110100010000010";
        ram[131] = "0b101100010000001111000010000011";
        ram[132] = "0b101100100000001111100010000100";
        ram[133] = "0b101100110000010000000010000101";
        ram[134] = "0b101101000000010000100010000110";
        ram[135] = "0b101101010000010001000010000111";
        ram[136] = "0b101101100000010001100010001000";
        ram[137] = "0b101101110000010010000010001001";
        ram[138] = "0b101110000000010010100010001010";
        ram[139] = "0b101110010000010011000010001011";
        ram[140] = "0b101110100000010011100010001100";
        ram[141] = "0b101110110000010100000010001101";
        ram[142] = "0b101111000000010100100010001110";
        ram[143] = "0b101111010000010101000010001111";
        ram[144] = "0b101111100000010101100010010000";
        ram[145] = "0b101111110000010110000010010001";
        ram[146] = "0b100000000000010110100010010010";
        ram[147] = "0b100000010000010111000010010011";
        ram[148] = "0b100000100000010111100010010100";
        ram[149] = "0b100000110000011000000010010101";
        ram[150] = "0b100001000000011000100010010110";
        ram[151] = "0b100001010000011001000010010111";
        ram[152] = "0b100001100000011001100010011000";
        ram[153] = "0b100001110000011010000010011001";
        ram[154] = "0b100010000000011010100010011010";
        ram[155] = "0b100010010000011011000010011011";
        ram[156] = "0b100010100000011011100010011100";
        ram[157] = "0b100010110000011100000010011101";
        ram[158] = "0b100011000000011100100010011110";
        ram[159] = "0b100011010000011101000010011111";
        ram[160] = "0b100011100000011101100010100000";
        ram[161] = "0b100011110000011110000010100001";
        ram[162] = "0b100100000000011110100010100010";
        ram[163] = "0b100100010000011111000010100011";
        ram[164] = "0b100100100000011111100010100100";
        ram[165] = "0b100100110000000000000010100101";
        ram[166] = "0b100101000000000000100010100110";
        ram[167] = "0b100101010000000001000010100111";
        ram[168] = "0b100101100000000001100010101000";
        ram[169] = "0b100101110000000010000010101001";
        ram[170] = "0b100110000000000010100010101010";
        ram[171] = "0b100110010000000011000010101011";
        ram[172] = "0b100110100000000011100010101100";
        ram[173] = "0b100110110000000100000010101101";
        ram[174] = "0b100111000000000100100010101110";
        ram[175] = "0b100111010000000101000010101111";
        ram[176] = "0b100111100000000101100010110000";
        ram[177] = "0b100111110000000110000010110001";
        ram[178] = "0b101000000000000110100010110010";
        ram[179] = "0b101000010000000111000010110011";
        ram[180] = "0b101000100000000111100010110100";
        ram[181] = "0b101000110000001000000010110101";
        ram[182] = "0b101001000000001000100010110110";
        ram[183] = "0b101001010000001001000010110111";
        ram[184] = "0b101001100000001001100010111000";
        ram[185] = "0b101001110000001010000010111001";
        ram[186] = "0b101010000000001010100010111010";
        ram[187] = "0b101010010000001011000010111011";
        ram[188] = "0b101010100000001011100010111100";
        ram[189] = "0b101010110000001100000010111101";
        ram[190] = "0b101011000000001100100010111110";
        ram[191] = "0b101011010000001101000010111111";
        ram[192] = "0b010011000000011001100011000000";
        ram[193] = "0b010011010000011010000011000001";
        ram[194] = "0b010011100000011010100011000010";
        ram[195] = "0b010011110000011011000011000011";
        ram[196] = "0b010100000000011011100011000100";
        ram[197] = "0b010100010000011100000011000101";
        ram[198] = "0b010100100000011100100011000110";
        ram[199] = "0b010100110000011101000011000111";
        ram[200] = "0b010101000000011101100011001000";
        ram[201] = "0b010101010000011110000011001001";
        ram[202] = "0b010101100000011110100011001010";
        ram[203] = "0b010101110000011111000011001011";
        ram[204] = "0b010110000000011111100011001100";
        ram[205] = "0b010110010000000000000011001101";
        ram[206] = "0b010110100000000000100011001110";
        ram[207] = "0b010110110000000001000011001111";
        ram[208] = "0b010111000000000001100011010000";
        ram[209] = "0b010111010000000010000011010001";
        ram[210] = "0b010111100000000010100011010010";
        ram[211] = "0b010111110000000011000011010011";
        ram[212] = "0b011000000000000011100011010100";
        ram[213] = "0b011000010000000100000011010101";
        ram[214] = "0b011000100000000100100011010110";
        ram[215] = "0b011000110000000101000011010111";
        ram[216] = "0b011001000000000101100011011000";
        ram[217] = "0b011001010000000110000011011001";
        ram[218] = "0b011001100000000110100011011010";
        ram[219] = "0b011001110000000111000011011011";
        ram[220] = "0b011010000000000111100011011100";
        ram[221] = "0b011010010000001000000011011101";
        ram[222] = "0b011010100000001000100011011110";
        ram[223] = "0b011010110000001001000011011111";
        ram[224] = "0b011011000000001001100011100000";
        ram[225] = "0b011011010000001010000011100001";
        ram[226] = "0b011011100000001010100011100010";
        ram[227] = "0b011011110000001011000011100011";
        ram[228] = "0b011100000000001011100011100100";
        ram[229] = "0b011100010000001100000011100101";
        ram[230] = "0b011100100000001100100011100110";
        ram[231] = "0b011100110000001101000011100111";
        ram[232] = "0b011101000000001101100011101000";
        ram[233] = "0b011101010000001110000011101001";
        ram[234] = "0b011101100000001110100011101010";
        ram[235] = "0b011101110000001111000011101011";
        ram[236] = "0b011110000000001111100011101100";
        ram[237] = "0b011110010000010000000011101101";
        ram[238] = "0b011110100000010000100011101110";
        ram[239] = "0b011110110000010001000011101111";
        ram[240] = "0b011111000000010001100011110000";
        ram[241] = "0b011111010000010010000011110001";
        ram[242] = "0b011111100000010010100011110010";
        ram[243] = "0b011111110000010011000011110011";
        ram[244] = "0b010000000000010011100011110100";
        ram[245] = "0b010000010000010100000011110101";
        ram[246] = "0b010000100000010100100011110110";
        ram[247] = "0b010000110000010101000011110111";
        ram[248] = "0b010001000000010101100011111000";
        ram[249] = "0b010001010000010110000011111001";
        ram[250] = "0b010001100000010110100011111010";
        ram[251] = "0b010001110000010111000011111011";
        ram[252] = "0b010010000000010111100011111100";
        ram[253] = "0b010010010000011000000011111101";
        ram[254] = "0b010010100000011000100011111110";
        ram[255] = "0b010010110000011001000011111111";


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


SC_MODULE(mcalcAA_23_varinxocq) {


static const unsigned DataWidth = 30;
static const unsigned AddressRange = 256;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


mcalcAA_23_varinxocq_ram* meminst;


SC_CTOR(mcalcAA_23_varinxocq) {
meminst = new mcalcAA_23_varinxocq_ram("mcalcAA_23_varinxocq_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~mcalcAA_23_varinxocq() {
    delete meminst;
}


};//endmodule
#endif
