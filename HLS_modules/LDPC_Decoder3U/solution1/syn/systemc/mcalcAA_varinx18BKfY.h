// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __mcalcAA_varinx18BKfY_H__
#define __mcalcAA_varinx18BKfY_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct mcalcAA_varinx18BKfY_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 21;
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


   SC_CTOR(mcalcAA_varinx18BKfY_ram) {
        ram[0] = "0b101101001010010000000";
        ram[1] = "0b101101101010100000001";
        ram[2] = "0b101110001010110000010";
        ram[3] = "0b101110101011000000011";
        ram[4] = "0b101111001011010000100";
        ram[5] = "0b101111101011100000101";
        ram[6] = "0b100000001011110000110";
        ram[7] = "0b100000101100000000111";
        ram[8] = "0b100001001100010001000";
        ram[9] = "0b100001101100100001001";
        ram[10] = "0b100010001100110001010";
        ram[11] = "0b100010101101000001011";
        ram[12] = "0b100011001101010001100";
        ram[13] = "0b100011101101100001101";
        ram[14] = "0b100100001101110001110";
        ram[15] = "0b100100101110000001111";
        ram[16] = "0b100101001110010010000";
        ram[17] = "0b100101101110100010001";
        ram[18] = "0b100110001110110010010";
        ram[19] = "0b100110101111000010011";
        ram[20] = "0b100111001111010010100";
        ram[21] = "0b100111101111100010101";
        ram[22] = "0b101000001111110010110";
        ram[23] = "0b101000101000000010111";
        ram[24] = "0b101001001000010011000";
        ram[25] = "0b101001101000100011001";
        ram[26] = "0b101010001000110011010";
        ram[27] = "0b101010101001000011011";
        ram[28] = "0b101011001001010011100";
        ram[29] = "0b101011101001100011101";
        ram[30] = "0b101100001001110011110";
        ram[31] = "0b101100101010000011111";
        ram[32] = "0b101101000100010100000";
        ram[33] = "0b101101100100100100001";
        ram[34] = "0b101110000100110100010";
        ram[35] = "0b101110100101000100011";
        ram[36] = "0b101111000101010100100";
        ram[37] = "0b101111100101100100101";
        ram[38] = "0b100000000101110100110";
        ram[39] = "0b100000100110000100111";
        ram[40] = "0b100001000110010101000";
        ram[41] = "0b100001100110100101001";
        ram[42] = "0b100010000110110101010";
        ram[43] = "0b100010100111000101011";
        ram[44] = "0b100011000111010101100";
        ram[45] = "0b100011100111100101101";
        ram[46] = "0b100100000111110101110";
        ram[47] = "0b100100100000000101111";
        ram[48] = "0b100101000000010110000";
        ram[49] = "0b100101100000100110001";
        ram[50] = "0b100110000000110110010";
        ram[51] = "0b100110100001000110011";
        ram[52] = "0b100111000001010110100";
        ram[53] = "0b100111100001100110101";
        ram[54] = "0b101000000001110110110";
        ram[55] = "0b101000100010000110111";
        ram[56] = "0b101001000010010111000";
        ram[57] = "0b101001100010100111001";
        ram[58] = "0b101010000010110111010";
        ram[59] = "0b101010100011000111011";
        ram[60] = "0b101011000011010111100";
        ram[61] = "0b101011100011100111101";
        ram[62] = "0b101100000011110111110";
        ram[63] = "0b101100100100000111111";
        ram[64] = "0b010110100011111000000";
        ram[65] = "0b010111000100001000001";
        ram[66] = "0b010111100100011000010";
        ram[67] = "0b011000000100101000011";
        ram[68] = "0b011000100100111000100";
        ram[69] = "0b011001000101001000101";
        ram[70] = "0b011001100101011000110";
        ram[71] = "0b011010000101101000111";
        ram[72] = "0b011010100101111001000";
        ram[73] = "0b011011000110001001001";
        ram[74] = "0b011011100110011001010";
        ram[75] = "0b011100000110101001011";
        ram[76] = "0b011100100110111001100";
        ram[77] = "0b011101000111001001101";
        ram[78] = "0b011101100111011001110";
        ram[79] = "0b011110000111101001111";
        ram[80] = "0b011110100111111010000";
        ram[81] = "0b011111000000001010001";
        ram[82] = "0b011111100000011010010";
        ram[83] = "0b010000000000101010011";
        ram[84] = "0b010000100000111010100";
        ram[85] = "0b010001000001001010101";
        ram[86] = "0b010001100001011010110";
        ram[87] = "0b010010000001101010111";
        ram[88] = "0b010010100001111011000";
        ram[89] = "0b010011000010001011001";
        ram[90] = "0b010011100010011011010";
        ram[91] = "0b010100000010101011011";
        ram[92] = "0b010100100010111011100";
        ram[93] = "0b010101000011001011101";
        ram[94] = "0b010101100011011011110";
        ram[95] = "0b010110000011101011111";
        ram[96] = "0b010001000011011100000";
        ram[97] = "0b010001100011101100001";
        ram[98] = "0b010010000011111100010";
        ram[99] = "0b010010100100001100011";
        ram[100] = "0b010011000100011100100";
        ram[101] = "0b010011100100101100101";
        ram[102] = "0b010100000100111100110";
        ram[103] = "0b010100100101001100111";
        ram[104] = "0b010101000101011101000";
        ram[105] = "0b010101100101101101001";
        ram[106] = "0b010110000101111101010";
        ram[107] = "0b010110100110001101011";
        ram[108] = "0b010111000110011101100";
        ram[109] = "0b010111100110101101101";
        ram[110] = "0b011000000110111101110";
        ram[111] = "0b011000100111001101111";
        ram[112] = "0b011001000111011110000";
        ram[113] = "0b011001100111101110001";
        ram[114] = "0b011010000111111110010";
        ram[115] = "0b011010100000001110011";
        ram[116] = "0b011011000000011110100";
        ram[117] = "0b011011100000101110101";
        ram[118] = "0b011100000000111110110";
        ram[119] = "0b011100100001001110111";
        ram[120] = "0b011101000001011111000";
        ram[121] = "0b011101100001101111001";
        ram[122] = "0b011110000001111111010";
        ram[123] = "0b011110100010001111011";
        ram[124] = "0b011111000010011111100";
        ram[125] = "0b011111100010101111101";
        ram[126] = "0b010000000010111111110";
        ram[127] = "0b010000100011001111111";
        for (unsigned i = 128; i < 512 ; i = i + 1) {
            ram[i] = "0b000000000000000000000";
        }


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


SC_MODULE(mcalcAA_varinx18BKfY) {


static const unsigned DataWidth = 21;
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


mcalcAA_varinx18BKfY_ram* meminst;


SC_CTOR(mcalcAA_varinx18BKfY) {
meminst = new mcalcAA_varinx18BKfY_ram("mcalcAA_varinx18BKfY_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->address1(address1);
meminst->ce1(ce1);
meminst->q1(q1);

meminst->reset(reset);
meminst->clk(clk);
}
~mcalcAA_varinx18BKfY() {
    delete meminst;
}


};//endmodule
#endif
