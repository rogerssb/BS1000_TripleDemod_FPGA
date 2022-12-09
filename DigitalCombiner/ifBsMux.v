`timescale 1ns/100ps
`include "addressMap.v"

module ifBsMux (
    inout       [40:1]  SideCar,

    input       [17:0]  DdsData,

    input               DdsIO_Reset,
    input               DdsIO_Update,
    input               DdsReset,
    input               DdsCS_n,
    input               DdsSClk,
    input               DdsMosi,
    input               IF_BS_n,

    input               bsAdc_powerDown,

    // Input Impedance and Topology controls
    input               bsHighImpedance,
    input               bsSingleEnded,

    // Gain and Offset DAC interfaces
    input               bsDacSELn,
    input               bsDacSCLK,
    input               bsDacMOSI,

    output              DdsMiso,
    output              SideCarClk,
    output              DdsSyncClk,

    // Bitsync ADC
    output      [13:0]  bsAdc,
    output              bsAdc_overflow
    );

    assign SideCar[2]  = IF_BS_n;
    assign SideCar[4]  = IF_BS_n ? DdsData[17]  : 1'bz;
    assign SideCar[6]  = IF_BS_n ? DdsData[16]  : 1'bz;
    assign SideCar[8]  = IF_BS_n ? DdsData[15]  : 1'bz;
    assign SideCar[10] = IF_BS_n ? DdsData[14]  : 1'bz;
    assign SideCar[12] = IF_BS_n ? DdsData[13]  : 1'bz;
    assign SideCar[14] = IF_BS_n ? DdsData[12]  : 1'bz;
    assign SideCar[16] = IF_BS_n ? DdsData[11]  : 1'bz;
    assign SideCar[18] = IF_BS_n ? DdsData[10]  : 1'bz;
    assign SideCar[20] = IF_BS_n ? DdsData[9]   : 1'bz;
    assign SideCar[22] = IF_BS_n ? DdsData[8]   : 1'bz;
    assign SideCar[24] = IF_BS_n ? DdsData[7]   : 1'bz;
    assign SideCar[26] = IF_BS_n ? DdsData[6]   : 1'bz;
    assign SideCar[28] = IF_BS_n ? DdsData[5]   : 1'bz;
    assign SideCar[30] = IF_BS_n ? DdsData[4]   : 1'bz;
    assign SideCar[34] = IF_BS_n ? DdsData[3]   : 1'bz;
    assign SideCar[36] = IF_BS_n ? DdsData[2]   : 1'bz;
    assign SideCar[38] = IF_BS_n ? DdsData[1]   : 1'bz;
    assign SideCar[40] = IF_BS_n ? DdsData[0]   : bsHighImpedance;

    assign SideCar[11] = IF_BS_n ? DdsIO_Reset  : bsAdc_powerDown;
    assign SideCar[15] = IF_BS_n ? 1'b1         : 1'bz;             // TxEnable
    assign SideCar[19] = IF_BS_n ? DdsIO_Update : 1'bz;
    assign SideCar[21] = IF_BS_n ? DdsReset     : 1'bz;
    assign SideCar[23] = IF_BS_n ? DdsCS_n      : bsDacSELn;
    assign SideCar[25] = IF_BS_n ? DdsSClk      : bsDacSCLK;
    assign SideCar[27] = IF_BS_n ? DdsMosi      : bsDacMOSI;
    assign SideCar[29] = IF_BS_n ? 1'bz         : bsSingleEnded;

    assign bsAdc[13] = !IF_BS_n ? SideCar[4]  : 1'b0;
    assign bsAdc[12] = !IF_BS_n ? SideCar[6]  : 1'b0;
    assign bsAdc[11] = !IF_BS_n ? SideCar[8]  : 1'b0;
    assign bsAdc[10] = !IF_BS_n ? SideCar[10] : 1'b0;
    assign bsAdc[9]  = !IF_BS_n ? SideCar[12] : 1'b0;
    assign bsAdc[8]  = !IF_BS_n ? SideCar[14] : 1'b0;
    assign bsAdc[7]  = !IF_BS_n ? SideCar[16] : 1'b0;
    assign bsAdc[6]  = !IF_BS_n ? SideCar[18] : 1'b0;
    assign bsAdc[5]  = !IF_BS_n ? SideCar[20] : 1'b0;
    assign bsAdc[4]  = !IF_BS_n ? SideCar[22] : 1'b0;
    assign bsAdc[3]  = !IF_BS_n ? SideCar[24] : 1'b0;
    assign bsAdc[2]  = !IF_BS_n ? SideCar[26] : 1'b0;
    assign bsAdc[1]  = !IF_BS_n ? SideCar[28] : 1'b0;
    assign bsAdc[0]  = !IF_BS_n ? SideCar[30] : 1'b0;

    assign DdsMiso = SideCar[29];
    assign bsAdc_overflow = 1'b0;   // this signal isn't connected in bs/combiner board
    assign SideCarClk = SideCar[32];
    assign DdsSyncClk = !IF_BS_n ? SideCar[17] : 1'b0;

endmodule