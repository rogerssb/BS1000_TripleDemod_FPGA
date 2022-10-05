// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __mcalcAA_23_varinxrcU_H__
#define __mcalcAA_23_varinxrcU_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct mcalcAA_23_varinxrcU_ram : public sc_core::sc_module {

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


   SC_CTOR(mcalcAA_23_varinxrcU_ram) {
        ram[0] = "0b100010110000000000000011111110";
        ram[1] = "0b100011000000000000100011111111";
        ram[2] = "0b100011010000000001000011000000";
        ram[3] = "0b100011100000000001100011000001";
        ram[4] = "0b100011110000000010000011000010";
        ram[5] = "0b100100000000000010100011000011";
        ram[6] = "0b100100010000000011000011000100";
        ram[7] = "0b100100100000000011100011000101";
        ram[8] = "0b100100110000000100000011000110";
        ram[9] = "0b100101000000000100100011000111";
        ram[10] = "0b100101010000000101000011001000";
        ram[11] = "0b100101100000000101100011001001";
        ram[12] = "0b100101110000000110000011001010";
        ram[13] = "0b100110000000000110100011001011";
        ram[14] = "0b100110010000000111000011001100";
        ram[15] = "0b100110100000000111100011001101";
        ram[16] = "0b100110110000001000000011001110";
        ram[17] = "0b100111000000001000100011001111";
        ram[18] = "0b100111010000001001000011010000";
        ram[19] = "0b100111100000001001100011010001";
        ram[20] = "0b100111110000001010000011010010";
        ram[21] = "0b101000000000001010100011010011";
        ram[22] = "0b101000010000001011000011010100";
        ram[23] = "0b101000100000001011100011010101";
        ram[24] = "0b101000110000001100000011010110";
        ram[25] = "0b101001000000001100100011010111";
        ram[26] = "0b101001010000001101000011011000";
        ram[27] = "0b101001100000001101100011011001";
        ram[28] = "0b101001110000001110000011011010";
        ram[29] = "0b101010000000001110100011011011";
        ram[30] = "0b101010010000001111000011011100";
        ram[31] = "0b101010100000001111100011011101";
        ram[32] = "0b101010110000010000000011011110";
        ram[33] = "0b101011000000010000100011011111";
        ram[34] = "0b101011010000010001000011100000";
        ram[35] = "0b101011100000010001100011100001";
        ram[36] = "0b101011110000010010000011100010";
        ram[37] = "0b101100000000010010100011100011";
        ram[38] = "0b101100010000010011000011100100";
        ram[39] = "0b101100100000010011100011100101";
        ram[40] = "0b101100110000010100000011100110";
        ram[41] = "0b101101000000010100100011100111";
        ram[42] = "0b101101010000010101000011101000";
        ram[43] = "0b101101100000010101100011101001";
        ram[44] = "0b101101110000010110000011101010";
        ram[45] = "0b101110000000010110100011101011";
        ram[46] = "0b101110010000010111000011101100";
        ram[47] = "0b101110100000010111100011101101";
        ram[48] = "0b101110110000011000000011101110";
        ram[49] = "0b101111000000011000100011101111";
        ram[50] = "0b101111010000011001000011110000";
        ram[51] = "0b101111100000011001100011110001";
        ram[52] = "0b101111110000011010000011110010";
        ram[53] = "0b100000000000011010100011110011";
        ram[54] = "0b100000010000011011000011110100";
        ram[55] = "0b100000100000011011100011110101";
        ram[56] = "0b100000110000011100000011110110";
        ram[57] = "0b100001000000011100100011110111";
        ram[58] = "0b100001010000011101000011111000";
        ram[59] = "0b100001100000011101100011111001";
        ram[60] = "0b100001110000011110000011111010";
        ram[61] = "0b100010000000011110100011111011";
        ram[62] = "0b100010010000011111000011111100";
        ram[63] = "0b100010100000011111100011111101";
        ram[64] = "0b000111010000100000000011110000";
        ram[65] = "0b000111100000100000100011110001";
        ram[66] = "0b000111110000100001000011110010";
        ram[67] = "0b001000000000100001100011110011";
        ram[68] = "0b001000010000100010000011110100";
        ram[69] = "0b001000100000100010100011110101";
        ram[70] = "0b001000110000100011000011110110";
        ram[71] = "0b001001000000100011100011110111";
        ram[72] = "0b001001010000100100000011111000";
        ram[73] = "0b001001100000100100100011111001";
        ram[74] = "0b001001110000100101000011111010";
        ram[75] = "0b001010000000100101100011111011";
        ram[76] = "0b001010010000100110000011111100";
        ram[77] = "0b001010100000100110100011111101";
        ram[78] = "0b001010110000100111000011111110";
        ram[79] = "0b001011000000100111100011111111";
        ram[80] = "0b001011010000101000000011000000";
        ram[81] = "0b001011100000101000100011000001";
        ram[82] = "0b001011110000101001000011000010";
        ram[83] = "0b001100000000101001100011000011";
        ram[84] = "0b001100010000101010000011000100";
        ram[85] = "0b001100100000101010100011000101";
        ram[86] = "0b001100110000101011000011000110";
        ram[87] = "0b001101000000101011100011000111";
        ram[88] = "0b001101010000101100000011001000";
        ram[89] = "0b001101100000101100100011001001";
        ram[90] = "0b001101110000101101000011001010";
        ram[91] = "0b001110000000101101100011001011";
        ram[92] = "0b001110010000101110000011001100";
        ram[93] = "0b001110100000101110100011001101";
        ram[94] = "0b001110110000101111000011001110";
        ram[95] = "0b001111000000101111100011001111";
        ram[96] = "0b001111010000110000000011010000";
        ram[97] = "0b001111100000110000100011010001";
        ram[98] = "0b001111110000110001000011010010";
        ram[99] = "0b000000000000110001100011010011";
        ram[100] = "0b000000010000110010000011010100";
        ram[101] = "0b000000100000110010100011010101";
        ram[102] = "0b000000110000110011000011010110";
        ram[103] = "0b000001000000110011100011010111";
        ram[104] = "0b000001010000110100000011011000";
        ram[105] = "0b000001100000110100100011011001";
        ram[106] = "0b000001110000110101000011011010";
        ram[107] = "0b000010000000110101100011011011";
        ram[108] = "0b000010010000110110000011011100";
        ram[109] = "0b000010100000110110100011011101";
        ram[110] = "0b000010110000110111000011011110";
        ram[111] = "0b000011000000110111100011011111";
        ram[112] = "0b000011010000111000000011100000";
        ram[113] = "0b000011100000111000100011100001";
        ram[114] = "0b000011110000111001000011100010";
        ram[115] = "0b000100000000111001100011100011";
        ram[116] = "0b000100010000111010000011100100";
        ram[117] = "0b000100100000111010100011100101";
        ram[118] = "0b000100110000111011000011100110";
        ram[119] = "0b000101000000111011100011100111";
        ram[120] = "0b000101010000111100000011101000";
        ram[121] = "0b000101100000111100100011101001";
        ram[122] = "0b000101110000111101000011101010";
        ram[123] = "0b000110000000111101100011101011";
        ram[124] = "0b000110010000111110000011101100";
        ram[125] = "0b000110100000111110100011101101";
        ram[126] = "0b000110110000111111000011101110";
        ram[127] = "0b000111000000111111100011101111";
        ram[128] = "0b001100000001000000000010001010";
        ram[129] = "0b001100010001000000100010001011";
        ram[130] = "0b001100100001000001000010001100";
        ram[131] = "0b001100110001000001100010001101";
        ram[132] = "0b001101000001000010000010001110";
        ram[133] = "0b001101010001000010100010001111";
        ram[134] = "0b001101100001000011000010010000";
        ram[135] = "0b001101110001000011100010010001";
        ram[136] = "0b001110000001000100000010010010";
        ram[137] = "0b001110010001000100100010010011";
        ram[138] = "0b001110100001000101000010010100";
        ram[139] = "0b001110110001000101100010010101";
        ram[140] = "0b001111000001000110000010010110";
        ram[141] = "0b001111010001000110100010010111";
        ram[142] = "0b001111100001000111000010011000";
        ram[143] = "0b001111110001000111100010011001";
        ram[144] = "0b000000000001001000000010011010";
        ram[145] = "0b000000010001001000100010011011";
        ram[146] = "0b000000100001001001000010011100";
        ram[147] = "0b000000110001001001100010011101";
        ram[148] = "0b000001000001001010000010011110";
        ram[149] = "0b000001010001001010100010011111";
        ram[150] = "0b000001100001001011000010100000";
        ram[151] = "0b000001110001001011100010100001";
        ram[152] = "0b000010000001001100000010100010";
        ram[153] = "0b000010010001001100100010100011";
        ram[154] = "0b000010100001001101000010100100";
        ram[155] = "0b000010110001001101100010100101";
        ram[156] = "0b000011000001001110000010100110";
        ram[157] = "0b000011010001001110100010100111";
        ram[158] = "0b000011100001001111000010101000";
        ram[159] = "0b000011110001001111100010101001";
        ram[160] = "0b000100000001010000000010101010";
        ram[161] = "0b000100010001010000100010101011";
        ram[162] = "0b000100100001010001000010101100";
        ram[163] = "0b000100110001010001100010101101";
        ram[164] = "0b000101000001010010000010101110";
        ram[165] = "0b000101010001010010100010101111";
        ram[166] = "0b000101100001010011000010110000";
        ram[167] = "0b000101110001010011100010110001";
        ram[168] = "0b000110000001010100000010110010";
        ram[169] = "0b000110010001010100100010110011";
        ram[170] = "0b000110100001010101000010110100";
        ram[171] = "0b000110110001010101100010110101";
        ram[172] = "0b000111000001010110000010110110";
        ram[173] = "0b000111010001010110100010110111";
        ram[174] = "0b000111100001010111000010111000";
        ram[175] = "0b000111110001010111100010111001";
        ram[176] = "0b001000000001011000000010111010";
        ram[177] = "0b001000010001011000100010111011";
        ram[178] = "0b001000100001011001000010111100";
        ram[179] = "0b001000110001011001100010111101";
        ram[180] = "0b001001000001011010000010111110";
        ram[181] = "0b001001010001011010100010111111";
        ram[182] = "0b001001100001011011000010000000";
        ram[183] = "0b001001110001011011100010000001";
        ram[184] = "0b001010000001011100000010000010";
        ram[185] = "0b001010010001011100100010000011";
        ram[186] = "0b001010100001011101000010000100";
        ram[187] = "0b001010110001011101100010000101";
        ram[188] = "0b001011000001011110000010000110";
        ram[189] = "0b001011010001011110100010000111";
        ram[190] = "0b001011100001011111000010001000";
        ram[191] = "0b001011110001011111100010001001";
        ram[192] = "0b010011110001100000000011010111";
        ram[193] = "0b010100000001100000100011011000";
        ram[194] = "0b010100010001100001000011011001";
        ram[195] = "0b010100100001100001100011011010";
        ram[196] = "0b010100110001100010000011011011";
        ram[197] = "0b010101000001100010100011011100";
        ram[198] = "0b010101010001100011000011011101";
        ram[199] = "0b010101100001100011100011011110";
        ram[200] = "0b010101110001100100000011011111";
        ram[201] = "0b010110000001100100100011100000";
        ram[202] = "0b010110010001100101000011100001";
        ram[203] = "0b010110100001100101100011100010";
        ram[204] = "0b010110110001100110000011100011";
        ram[205] = "0b010111000001100110100011100100";
        ram[206] = "0b010111010001100111000011100101";
        ram[207] = "0b010111100001100111100011100110";
        ram[208] = "0b010111110001101000000011100111";
        ram[209] = "0b011000000001101000100011101000";
        ram[210] = "0b011000010001101001000011101001";
        ram[211] = "0b011000100001101001100011101010";
        ram[212] = "0b011000110001101010000011101011";
        ram[213] = "0b011001000001101010100011101100";
        ram[214] = "0b011001010001101011000011101101";
        ram[215] = "0b011001100001101011100011101110";
        ram[216] = "0b011001110001101100000011101111";
        ram[217] = "0b011010000001101100100011110000";
        ram[218] = "0b011010010001101101000011110001";
        ram[219] = "0b011010100001101101100011110010";
        ram[220] = "0b011010110001101110000011110011";
        ram[221] = "0b011011000001101110100011110100";
        ram[222] = "0b011011010001101111000011110101";
        ram[223] = "0b011011100001101111100011110110";
        ram[224] = "0b011011110001110000000011110111";
        ram[225] = "0b011100000001110000100011111000";
        ram[226] = "0b011100010001110001000011111001";
        ram[227] = "0b011100100001110001100011111010";
        ram[228] = "0b011100110001110010000011111011";
        ram[229] = "0b011101000001110010100011111100";
        ram[230] = "0b011101010001110011000011111101";
        ram[231] = "0b011101100001110011100011111110";
        ram[232] = "0b011101110001110100000011111111";
        ram[233] = "0b011110000001110100100011000000";
        ram[234] = "0b011110010001110101000011000001";
        ram[235] = "0b011110100001110101100011000010";
        ram[236] = "0b011110110001110110000011000011";
        ram[237] = "0b011111000001110110100011000100";
        ram[238] = "0b011111010001110111000011000101";
        ram[239] = "0b011111100001110111100011000110";
        ram[240] = "0b011111110001111000000011000111";
        ram[241] = "0b010000000001111000100011001000";
        ram[242] = "0b010000010001111001000011001001";
        ram[243] = "0b010000100001111001100011001010";
        ram[244] = "0b010000110001111010000011001011";
        ram[245] = "0b010001000001111010100011001100";
        ram[246] = "0b010001010001111011000011001101";
        ram[247] = "0b010001100001111011100011001110";
        ram[248] = "0b010001110001111100000011001111";
        ram[249] = "0b010010000001111100100011010000";
        ram[250] = "0b010010010001111101000011010001";
        ram[251] = "0b010010100001111101100011010010";
        ram[252] = "0b010010110001111110000011010011";
        ram[253] = "0b010011000001111110100011010100";
        ram[254] = "0b010011010001111111000011010101";
        ram[255] = "0b010011100001111111100011010110";


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


SC_MODULE(mcalcAA_23_varinxrcU) {


static const unsigned DataWidth = 30;
static const unsigned AddressRange = 256;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


mcalcAA_23_varinxrcU_ram* meminst;


SC_CTOR(mcalcAA_23_varinxrcU) {
meminst = new mcalcAA_23_varinxrcU_ram("mcalcAA_23_varinxrcU_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~mcalcAA_23_varinxrcU() {
    delete meminst;
}


};//endmodule
#endif
