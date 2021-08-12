// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __mcalcAA_23_varinxncg_H__
#define __mcalcAA_23_varinxncg_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct mcalcAA_23_varinxncg_ram : public sc_core::sc_module {

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


   SC_CTOR(mcalcAA_23_varinxncg_ram) {
        ram[0] = "0b000000000000000000000000000000";
        ram[1] = "0b000000010000000000100000000001";
        ram[2] = "0b000000100000000001000000000010";
        ram[3] = "0b000000110000000001100000000011";
        ram[4] = "0b000001000000000010000000000100";
        ram[5] = "0b000001010000000010100000000101";
        ram[6] = "0b000001100000000011000000000110";
        ram[7] = "0b000001110000000011100000000111";
        ram[8] = "0b000010000000000100000000001000";
        ram[9] = "0b000010010000000100100000001001";
        ram[10] = "0b000010100000000101000000001010";
        ram[11] = "0b000010110000000101100000001011";
        ram[12] = "0b000011000000000110000000001100";
        ram[13] = "0b000011010000000110100000001101";
        ram[14] = "0b000011100000000111000000001110";
        ram[15] = "0b000011110000000111100000001111";
        ram[16] = "0b000100000000001000000000010000";
        ram[17] = "0b000100010000001000100000010001";
        ram[18] = "0b000100100000001001000000010010";
        ram[19] = "0b000100110000001001100000010011";
        ram[20] = "0b000101000000001010000000010100";
        ram[21] = "0b000101010000001010100000010101";
        ram[22] = "0b000101100000001011000000010110";
        ram[23] = "0b000101110000001011100000010111";
        ram[24] = "0b000110000000001100000000011000";
        ram[25] = "0b000110010000001100100000011001";
        ram[26] = "0b000110100000001101000000011010";
        ram[27] = "0b000110110000001101100000011011";
        ram[28] = "0b000111000000001110000000011100";
        ram[29] = "0b000111010000001110100000011101";
        ram[30] = "0b000111100000001111000000011110";
        ram[31] = "0b000111110000001111100000011111";
        ram[32] = "0b001000000000010000000000100000";
        ram[33] = "0b001000010000010000100000100001";
        ram[34] = "0b001000100000010001000000100010";
        ram[35] = "0b001000110000010001100000100011";
        ram[36] = "0b001001000000010010000000100100";
        ram[37] = "0b001001010000010010100000100101";
        ram[38] = "0b001001100000010011000000100110";
        ram[39] = "0b001001110000010011100000100111";
        ram[40] = "0b001010000000010100000000101000";
        ram[41] = "0b001010010000010100100000101001";
        ram[42] = "0b001010100000010101000000101010";
        ram[43] = "0b001010110000010101100000101011";
        ram[44] = "0b001011000000010110000000101100";
        ram[45] = "0b001011010000010110100000101101";
        ram[46] = "0b001011100000010111000000101110";
        ram[47] = "0b001011110000010111100000101111";
        ram[48] = "0b001100000000011000000000110000";
        ram[49] = "0b001100010000011000100000110001";
        ram[50] = "0b001100100000011001000000110010";
        ram[51] = "0b001100110000011001100000110011";
        ram[52] = "0b001101000000011010000000110100";
        ram[53] = "0b001101010000011010100000110101";
        ram[54] = "0b001101100000011011000000110110";
        ram[55] = "0b001101110000011011100000110111";
        ram[56] = "0b001110000000011100000000111000";
        ram[57] = "0b001110010000011100100000111001";
        ram[58] = "0b001110100000011101000000111010";
        ram[59] = "0b001110110000011101100000111011";
        ram[60] = "0b001111000000011110000000111100";
        ram[61] = "0b001111010000011110100000111101";
        ram[62] = "0b001111100000011111000000111110";
        ram[63] = "0b001111110000011111100000111111";
        ram[64] = "0b010000000000100000000001000000";
        ram[65] = "0b010000010000100000100001000001";
        ram[66] = "0b010000100000100001000001000010";
        ram[67] = "0b010000110000100001100001000011";
        ram[68] = "0b010001000000100010000001000100";
        ram[69] = "0b010001010000100010100001000101";
        ram[70] = "0b010001100000100011000001000110";
        ram[71] = "0b010001110000100011100001000111";
        ram[72] = "0b010010000000100100000001001000";
        ram[73] = "0b010010010000100100100001001001";
        ram[74] = "0b010010100000100101000001001010";
        ram[75] = "0b010010110000100101100001001011";
        ram[76] = "0b010011000000100110000001001100";
        ram[77] = "0b010011010000100110100001001101";
        ram[78] = "0b010011100000100111000001001110";
        ram[79] = "0b010011110000100111100001001111";
        ram[80] = "0b010100000000101000000001010000";
        ram[81] = "0b010100010000101000100001010001";
        ram[82] = "0b010100100000101001000001010010";
        ram[83] = "0b010100110000101001100001010011";
        ram[84] = "0b010101000000101010000001010100";
        ram[85] = "0b010101010000101010100001010101";
        ram[86] = "0b010101100000101011000001010110";
        ram[87] = "0b010101110000101011100001010111";
        ram[88] = "0b010110000000101100000001011000";
        ram[89] = "0b010110010000101100100001011001";
        ram[90] = "0b010110100000101101000001011010";
        ram[91] = "0b010110110000101101100001011011";
        ram[92] = "0b010111000000101110000001011100";
        ram[93] = "0b010111010000101110100001011101";
        ram[94] = "0b010111100000101111000001011110";
        ram[95] = "0b010111110000101111100001011111";
        ram[96] = "0b011000000000110000000001100000";
        ram[97] = "0b011000010000110000100001100001";
        ram[98] = "0b011000100000110001000001100010";
        ram[99] = "0b011000110000110001100001100011";
        ram[100] = "0b011001000000110010000001100100";
        ram[101] = "0b011001010000110010100001100101";
        ram[102] = "0b011001100000110011000001100110";
        ram[103] = "0b011001110000110011100001100111";
        ram[104] = "0b011010000000110100000001101000";
        ram[105] = "0b011010010000110100100001101001";
        ram[106] = "0b011010100000110101000001101010";
        ram[107] = "0b011010110000110101100001101011";
        ram[108] = "0b011011000000110110000001101100";
        ram[109] = "0b011011010000110110100001101101";
        ram[110] = "0b011011100000110111000001101110";
        ram[111] = "0b011011110000110111100001101111";
        ram[112] = "0b011100000000111000000001110000";
        ram[113] = "0b011100010000111000100001110001";
        ram[114] = "0b011100100000111001000001110010";
        ram[115] = "0b011100110000111001100001110011";
        ram[116] = "0b011101000000111010000001110100";
        ram[117] = "0b011101010000111010100001110101";
        ram[118] = "0b011101100000111011000001110110";
        ram[119] = "0b011101110000111011100001110111";
        ram[120] = "0b011110000000111100000001111000";
        ram[121] = "0b011110010000111100100001111001";
        ram[122] = "0b011110100000111101000001111010";
        ram[123] = "0b011110110000111101100001111011";
        ram[124] = "0b011111000000111110000001111100";
        ram[125] = "0b011111010000111110100001111101";
        ram[126] = "0b011111100000111111000001111110";
        ram[127] = "0b011111110000111111100001111111";
        ram[128] = "0b100000000001000000000010000000";
        ram[129] = "0b100000010001000000100010000001";
        ram[130] = "0b100000100001000001000010000010";
        ram[131] = "0b100000110001000001100010000011";
        ram[132] = "0b100001000001000010000010000100";
        ram[133] = "0b100001010001000010100010000101";
        ram[134] = "0b100001100001000011000010000110";
        ram[135] = "0b100001110001000011100010000111";
        ram[136] = "0b100010000001000100000010001000";
        ram[137] = "0b100010010001000100100010001001";
        ram[138] = "0b100010100001000101000010001010";
        ram[139] = "0b100010110001000101100010001011";
        ram[140] = "0b100011000001000110000010001100";
        ram[141] = "0b100011010001000110100010001101";
        ram[142] = "0b100011100001000111000010001110";
        ram[143] = "0b100011110001000111100010001111";
        ram[144] = "0b100100000001001000000010010000";
        ram[145] = "0b100100010001001000100010010001";
        ram[146] = "0b100100100001001001000010010010";
        ram[147] = "0b100100110001001001100010010011";
        ram[148] = "0b100101000001001010000010010100";
        ram[149] = "0b100101010001001010100010010101";
        ram[150] = "0b100101100001001011000010010110";
        ram[151] = "0b100101110001001011100010010111";
        ram[152] = "0b100110000001001100000010011000";
        ram[153] = "0b100110010001001100100010011001";
        ram[154] = "0b100110100001001101000010011010";
        ram[155] = "0b100110110001001101100010011011";
        ram[156] = "0b100111000001001110000010011100";
        ram[157] = "0b100111010001001110100010011101";
        ram[158] = "0b100111100001001111000010011110";
        ram[159] = "0b100111110001001111100010011111";
        ram[160] = "0b101000000001010000000010100000";
        ram[161] = "0b101000010001010000100010100001";
        ram[162] = "0b101000100001010001000010100010";
        ram[163] = "0b101000110001010001100010100011";
        ram[164] = "0b101001000001010010000010100100";
        ram[165] = "0b101001010001010010100010100101";
        ram[166] = "0b101001100001010011000010100110";
        ram[167] = "0b101001110001010011100010100111";
        ram[168] = "0b101010000001010100000010101000";
        ram[169] = "0b101010010001010100100010101001";
        ram[170] = "0b101010100001010101000010101010";
        ram[171] = "0b101010110001010101100010101011";
        ram[172] = "0b101011000001010110000010101100";
        ram[173] = "0b101011010001010110100010101101";
        ram[174] = "0b101011100001010111000010101110";
        ram[175] = "0b101011110001010111100010101111";
        ram[176] = "0b101100000001011000000010110000";
        ram[177] = "0b101100010001011000100010110001";
        ram[178] = "0b101100100001011001000010110010";
        ram[179] = "0b101100110001011001100010110011";
        ram[180] = "0b101101000001011010000010110100";
        ram[181] = "0b101101010001011010100010110101";
        ram[182] = "0b101101100001011011000010110110";
        ram[183] = "0b101101110001011011100010110111";
        ram[184] = "0b101110000001011100000010111000";
        ram[185] = "0b101110010001011100100010111001";
        ram[186] = "0b101110100001011101000010111010";
        ram[187] = "0b101110110001011101100010111011";
        ram[188] = "0b101111000001011110000010111100";
        ram[189] = "0b101111010001011110100010111101";
        ram[190] = "0b101111100001011111000010111110";
        ram[191] = "0b101111110001011111100010111111";
        ram[192] = "0b110000000001100000000011000000";
        ram[193] = "0b110000010001100000100011000001";
        ram[194] = "0b110000100001100001000011000010";
        ram[195] = "0b110000110001100001100011000011";
        ram[196] = "0b110001000001100010000011000100";
        ram[197] = "0b110001010001100010100011000101";
        ram[198] = "0b110001100001100011000011000110";
        ram[199] = "0b110001110001100011100011000111";
        ram[200] = "0b110010000001100100000011001000";
        ram[201] = "0b110010010001100100100011001001";
        ram[202] = "0b110010100001100101000011001010";
        ram[203] = "0b110010110001100101100011001011";
        ram[204] = "0b110011000001100110000011001100";
        ram[205] = "0b110011010001100110100011001101";
        ram[206] = "0b110011100001100111000011001110";
        ram[207] = "0b110011110001100111100011001111";
        ram[208] = "0b110100000001101000000011010000";
        ram[209] = "0b110100010001101000100011010001";
        ram[210] = "0b110100100001101001000011010010";
        ram[211] = "0b110100110001101001100011010011";
        ram[212] = "0b110101000001101010000011010100";
        ram[213] = "0b110101010001101010100011010101";
        ram[214] = "0b110101100001101011000011010110";
        ram[215] = "0b110101110001101011100011010111";
        ram[216] = "0b110110000001101100000011011000";
        ram[217] = "0b110110010001101100100011011001";
        ram[218] = "0b110110100001101101000011011010";
        ram[219] = "0b110110110001101101100011011011";
        ram[220] = "0b110111000001101110000011011100";
        ram[221] = "0b110111010001101110100011011101";
        ram[222] = "0b110111100001101111000011011110";
        ram[223] = "0b110111110001101111100011011111";
        ram[224] = "0b111000000001110000000011100000";
        ram[225] = "0b111000010001110000100011100001";
        ram[226] = "0b111000100001110001000011100010";
        ram[227] = "0b111000110001110001100011100011";
        ram[228] = "0b111001000001110010000011100100";
        ram[229] = "0b111001010001110010100011100101";
        ram[230] = "0b111001100001110011000011100110";
        ram[231] = "0b111001110001110011100011100111";
        ram[232] = "0b111010000001110100000011101000";
        ram[233] = "0b111010010001110100100011101001";
        ram[234] = "0b111010100001110101000011101010";
        ram[235] = "0b111010110001110101100011101011";
        ram[236] = "0b111011000001110110000011101100";
        ram[237] = "0b111011010001110110100011101101";
        ram[238] = "0b111011100001110111000011101110";
        ram[239] = "0b111011110001110111100011101111";
        ram[240] = "0b111100000001111000000011110000";
        ram[241] = "0b111100010001111000100011110001";
        ram[242] = "0b111100100001111001000011110010";
        ram[243] = "0b111100110001111001100011110011";
        ram[244] = "0b111101000001111010000011110100";
        ram[245] = "0b111101010001111010100011110101";
        ram[246] = "0b111101100001111011000011110110";
        ram[247] = "0b111101110001111011100011110111";
        ram[248] = "0b111110000001111100000011111000";
        ram[249] = "0b111110010001111100100011111001";
        ram[250] = "0b111110100001111101000011111010";
        ram[251] = "0b111110110001111101100011111011";
        ram[252] = "0b111111000001111110000011111100";
        ram[253] = "0b111111010001111110100011111101";
        ram[254] = "0b111111100001111111000011111110";
        ram[255] = "0b111111110001111111100011111111";


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


SC_MODULE(mcalcAA_23_varinxncg) {


static const unsigned DataWidth = 30;
static const unsigned AddressRange = 256;
static const unsigned AddressWidth = 8;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


mcalcAA_23_varinxncg_ram* meminst;


SC_CTOR(mcalcAA_23_varinxncg) {
meminst = new mcalcAA_23_varinxncg_ram("mcalcAA_23_varinxncg_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~mcalcAA_23_varinxncg() {
    delete meminst;
}


};//endmodule
#endif
