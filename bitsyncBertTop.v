`timescale 1ns/100ps
`include "addressMap.v"
`include "defines.v"

module bitsyncBertTop (
    sysClk,
    fbClk,
    fb_ale,
    fb_csn,
    fb_oen,
    fb_wrn,
    fb_addr,
    fb_data,
    adc0, adc0_overflow,
    adc1, adc1_overflow,
    adc01_powerDown,
    dac_rst,
    dac_sclk,
    dac_sdio,
    dac0_nCs,
    dac1_nCs,
    dac2_nCs,
    dac0_d,dac1_d,dac2_d,
    dac0_clk,dac1_clk,dac2_clk,
    bsClkOut,bsDataOut,
    encClkOut,encDataOut,
    fsClkOut,fsDataOut,
    bsDiffClkOut, bsDiffDataOut,
    fsDiffClkOut, fsDiffDataOut,
    ch0Lockn, ch1Lockn,
    dacSCLK, dacMOSI, 
    ch0SELn,
    ch1SELn,
    ch0HighImpedance,
    ch0SingleEnded,
    ch1HighImpedance,
    ch1SingleEnded,
    pll_SCK,
    pll_SDI,
    pll0_CS,
    pll0_REF,
    pll0_OUT1,
    pll0_PWDn,
    pll1_CS,
    pll1_REF,
    pll1_OUT1,
    pll1_PWDn,
    pll2_CS,
    pll2_REF,
    pll2_OUT1,
    pll2_PWDn
    );

input           sysClk;

// Flexbus connections
input           fbClk;
input           fb_ale;
input           fb_csn;
input           fb_oen;
input           fb_wrn;
input   [15:0]  fb_addr;
inout   [15:0]  fb_data;

// ADC Inputs
input   [13:0]  adc0;
input           adc0_overflow;
input   [13:0]  adc1;
input           adc1_overflow;
output          adc01_powerDown;

// DAC configuration interface
output          dac_rst;
output          dac_sclk;
inout           dac_sdio;
output          dac0_nCs;
output          dac1_nCs;
output          dac2_nCs;

// DAC datapath interface
output  [13:0]  dac0_d,dac1_d,dac2_d;
output          dac0_clk,dac1_clk,dac2_clk;

// Clock and data outputs
output          bsClkOut,bsDataOut;
output          fsClkOut,fsDataOut;
output          encClkOut,encDataOut;
output          bsDiffClkOut, bsDiffDataOut;
output          fsDiffClkOut, fsDiffDataOut;

// Lock indicators
output          ch0Lockn, ch1Lockn;

// Gain and Offset DAC interfaces
output          ch0SELn, ch1SELn;
output          dacSCLK, dacMOSI;

// Input Impedance and Topology controls
output          ch0HighImpedance;
output          ch0SingleEnded;
output          ch1HighImpedance;
output          ch1SingleEnded;

// PLL Interface Signals
output          pll_SCK;
output          pll_SDI;
output          pll0_CS;
output          pll0_REF;
input           pll0_OUT1;
output          pll0_PWDn;
output          pll1_CS;
output          pll1_REF;
input           pll1_OUT1;
output          pll1_PWDn;
output          pll2_CS;
output          pll2_REF;
input           pll2_OUT1;
output          pll2_PWDn;

parameter VER_NUMBER = 16'd422;


//******************************************************************************
//                          Clock Distribution
//******************************************************************************
systemClock systemClock (
    .clk_in1(sysClk),
    .clk_out1(clk),
    .locked(clkLocked)
 );

flexbusClock flexbusClock (
    .clk_in1(fbClk),
    .clk_out1(fb_clk),
    .locked(fbClkLocked)
);



/******************************************************************************
                             Bus Interface
******************************************************************************/
wire    [12:0]  addr;
wire    [31:0]  dataIn;
flexbus flexbus(
    .fb_clk(fb_clk),
    .fb_ale(fb_ale),
    .fb_csn(fb_csn),
    .fb_wrn(fb_wrn),
    .fb_ad({fb_data,fb_addr}),
    .cs(cs),
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr[12:1]),
    .dataIn(dataIn)
);
assign  addr[0] = 1'b0;
wire    rd = !fb_oen;

//******************************************************************************
//                             Reclock Inputs
//******************************************************************************
reg             [13:0]  adc0Reg,adc1Reg;
reg     signed  [17:0]  adc0In, adc1In;
always @(posedge clk) begin
    adc0Reg <= adc0;
    adc1Reg <= adc1;
    adc0In <= $signed({~adc0Reg[13],adc0Reg[12:0],4'b0});
    adc1In <= $signed({~adc1Reg[13],adc1Reg[12:0],4'b0});
end



//******************************************************************************
//                             Top Level Registers
//******************************************************************************
reg bsBertTopSpace;
always @* begin
    casex(addr)
        `BITSYNC_BERT_SPACE:    bsBertTopSpace = 1;
        default:                bsBertTopSpace = 0;
        endcase
    end
wire    [23:0]  boot_addr;
wire    [2:0]   dac0InputSelect;
wire    [2:0]   dac1InputSelect;
wire    [2:0]   dac2InputSelect;
wire    [3:0]   bsCoaxMuxSelect;
wire    [3:0]   bsRS422MuxSelect;
wire    [3:0]   fsMuxSelect;
wire    [3:0]   fsRS422MuxSelect;
wire    [3:0]   encCoaxMuxSelect;
wire    [3:0]   bertMuxSelect;
wire    [31:0]  bsBertDout;
bitsyncBertRegs topRegs(
    .busClk(fb_clk),
    .cs(bsBertTopSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .dataIn(dataIn),
    .dataOut(bsBertDout),
    .clk(clk),
    .versionNumber(VER_NUMBER),
    .bitsyncEnable(bitsyncEnable),
    .bertEnable(bertEnable),
    .framesyncEnable(),
    .pnGeneratorEnable(),
    .reset(reset),
    .reboot(reboot),
    .rebootAddress(boot_addr),
    .dac0InputSelect(dac0InputSelect),
    .dac1InputSelect(dac1InputSelect),
    .dac2InputSelect(dac2InputSelect),
    .bsCoaxMuxSelect(bsCoaxMuxSelect),
    .bsRS422MuxSelect(bsRS422MuxSelect),
    .fsMuxSelect(fsMuxSelect),
    .fsRS422MuxSelect(fsRS422MuxSelect),
    .encCoaxMuxSelect(encCoaxMuxSelect),
    .bertMuxSelect(bertMuxSelect)
);


//******************************************************************************
//                          Two Channel Bitsync
//******************************************************************************
wire    [17:0]  ch0SymData, ch1SymData;
wire    [17:0]  ch0Gain,ch0Offset;
wire    [17:0]  ch1Gain,ch1Offset;
wire    [17:0]  ch0Dac0Data, ch0Dac1Data, ch0Dac2Data;
wire    [17:0]  ch1Dac0Data, ch1Dac1Data, ch1Dac2Data;
wire    [17:0]  iEye,qEye;
wire    [4:0]   eyeOffset;
wire    [31:0]  bsDout;
bitsyncTop bitsyncTop(
    .clk(clk), .clkEn(bitsyncEnable), .reset(reset),
    .busClk(fb_clk),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(bsDout),
    .rx0(adc0In), 
    .rx1(adc1In),
    .ch0Lock(ch0Lock),
    .ch0Sym2xEn(ch0Sym2xEn),
    .ch0SymEn(ch0SymEn),
    .ch0SymData(ch0SymData),
    .ch0SymClk(ch0ClkOut),
    .ch0Bit(ch0DataOut),
    .ch0Dac0ClkEn(ch0Dac0ClkEn),
    .ch0Dac0Data(ch0Dac0Data),
    .ch0Dac1ClkEn(ch0Dac1ClkEn),
    .ch0Dac1Data(ch0Dac1Data),
    .ch0Dac2ClkEn(ch0Dac2ClkEn),
    .ch0Dac2Data(ch0Dac2Data),
    .ch0HighImpedance(ch0HighImpedance),
    .ch0SingleEnded(ch0SingleEnded),
    .ch0Gain(ch0Gain),
    .ch0Offset(ch0Offset),
    .ch1Lock(ch1Lock),
    .ch1Sym2xEn(ch1Sym2xEn),
    .ch1SymEn(ch1SymEn),
    .ch1SymData(ch1SymData),
    .ch1SymClk(ch1ClkOut),
    .ch1Bit(ch1DataOut),
    .ch1Dac0ClkEn(ch1Dac0ClkEn),
    .ch1Dac0Data(ch1Dac0Data),
    .ch1Dac1ClkEn(ch1Dac1ClkEn),
    .ch1Dac1Data(ch1Dac1Data),
    .ch1Dac2ClkEn(ch1Dac2ClkEn),
    .ch1Dac2Data(ch1Dac2Data),
    .ch1HighImpedance(ch1HighImpedance),
    .ch1SingleEnded(ch1SingleEnded),
    .ch1Gain(ch1Gain),
    .ch1Offset(ch1Offset),
    .eyeClkEn(eyeClkEn),
    .iEye(iEye),.qEye(qEye),
    .eyeOffset(eyeOffset),
    .asyncMode(asyncMode),
    .test0(test0), .test1(test1)
    );

//******************************************************************************
//                          AGC/DC Offset DAC Interfaces
//******************************************************************************
mcp48xxInterface dacInterface (
    .clk(clk),
    .clkEn0(ch0SymEn),
    .clkEn1(ch1SymEn),
    .reset(reset),
    .dac0GainSelA(1'b1),
    .dac0GainSelB(1'b1),
    .dac0ValueA(ch0Gain[17:6]),
    .dac0ValueB(ch0Offset[17:6]),
    .dac1GainSelA(1'b1),
    .dac1GainSelB(1'b1),
    .dac1ValueA(ch1Gain[17:6]),
    .dac1ValueB(ch1Offset[17:6]),
    .SCK(dacSCLK),
    .SDI(dacMOSI),
    .CS0n(ch0SELn),
    .CS1n(ch1SELn)
);



//******************************************************************************
//                                PCM Decoders
//******************************************************************************
    reg dualDecoderSpace;
    always @* begin
        casex(addr)
            `DUAL_DECODERSPACE:     dualDecoderSpace = 1;
            default:                dualDecoderSpace = 0;
        endcase
    end

    wire    [15:0]  dualDecDout;
    decoder dualDecoder
    (
        .clk(clk),
        .rs(reset),
        .en(dualDecoderSpace),
        `ifdef USE_BUS_CLOCK
        .busClk(fb_clk),
        `endif
        .wr0(wr0),
        .wr1(wr1),
        .addr(addr),
        .din(dataIn[15:0]),
        .dout(dualDecDout),
        .symb_clk_en(ch0SymEn),           // symbol rate clock enable
        .symb_clk_2x_en(ch0Sym2xEn),      // 2x symbol rate clock enable
        .symb_i(ch0DataOut),              // data input,
        .symb_q(ch1DataOut),              // data input,
        .dout_i(dualDataI),
        .dout_q(dualDataQ),
        .cout(dualPcmClkEn),
        .fifo_rs(),
        .clk_inv(dualClkInvert),
        .bypass_fifo(),
        .symb_clk(dualPcmSymClk)
    );

    reg ch1DecoderSpace;
    always @* begin
        casex(addr)
            `CH1_DECODERSPACE:      ch1DecoderSpace = 1;
            default:                ch1DecoderSpace = 0;
            endcase
        end
    wire    [15:0]  ch1DecDout;
    pcmDecoder dec1 (
        .clk(clk),
        .rs(reset),
        .busClk(fb_clk),
        .en(ch1DecoderSpace),
        .wr0(wr0),
        .wr1(wr1),
        .addr(addr),
        .din(dataIn[15:0]),
        .dout(ch1DecDout),
        .symb_clk_en(ch1SymEn),           // symbol rate clock enable
        .symb_clk_2x_en(ch1Sym2xEn),      // 2x symbol rate clock enable
        .symb(ch1DataOut),                // data input,
        .data_out(ch1PcmData),            // data output
        .clkEn_out(ch1PcmClkEn),          // clk output
        .fifo_rs(),
        .clk_inv(ch1ClkInvert),
        .bypass_fifo(),
        .symb_clk(ch1PcmSymClk)
    );






//******************************************************************************
//                       Clock/Data Jitter Reduction
//******************************************************************************

    // SPI interface to the PLLs
    wire    [31:0]  pllDout;
    ics307Interface pllIntfc (
        .reset(reset),
        .busClk(fb_clk),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(pllDout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .clk(clk),
        .SCK(pll_SCK),
        .SDI(pll_SDI),
        .CS0(pll0_CS),
        .CS1(pll1_CS),
        .CS2(pll2_CS),
        .EN0(pll0_PWDn),
        .EN1(pll1_PWDn),
        .EN2(pll2_PWDn),
        .pll0Reset(pll0Reset),
        .pll1Reset(pll1Reset),
        .pll2Reset()
    );

    //------------- PLL Reference Clocks --------------
    assign          pll0_REF = ch0SymEn;
    assign          pll1_REF = ch1SymEn;
    assign          pll2_REF = ch0ClkOut;

    //`define NEW_FIFO
    `ifdef NEW_FIFO
    wire    [2:0]   pll0_Symbol;
    jitterFifo pll0Fifo (
        .reset(reset),
        .inputClk(clk),
        .inputClkEn(dualPcmClkEn),
        .dataIn({dualDataI,dualDataQ,1'b0}),
        .outputClk(pll0_OUT1),
        .outputClkEn(1'b1),
        .dataOut(pll0_Symbol)
    );

    wire    [2:0]   pll1_Symbol;
    jitterFifo pll1Fifo (
        .reset(reset),
        .inputClk(clk),
        .inputClkEn(ch1PcmClkEn),
        .dataIn({ch1PcmData,2'b0}),
        .outputClk(pll1_OUT1),
        .outputClkEn(1'b1),
        .dataOut(pll1_Symbol)
    );

    `else //NEW_FIFO

    //------------- PLL0 Data FIFO --------------------
    reg             pll0_ReadEnable;
    wire    [2:0]   pll0_Symbol;
    jitterFifo pll0Fifo(
        .rst(pll0Reset),
        .wr_clk(clk),
        .rd_clk(pll0_OUT1),
        .din({dualDataI,dualDataQ,1'b0}),
        .wr_en(dualPcmClkEn),
        .rd_en(pll0_ReadEnable),
        .dout(pll0_Symbol),
        .full(pll0_Full),
        .empty(pll0_Empty),
        .prog_full(pll0_HalfFull)
    );
    always @(posedge pll0_OUT1) begin
        if (pll0Reset) begin
            pll0_ReadEnable <= 0;
        end
        else if (pll0_HalfFull) begin
            pll0_ReadEnable <= 1;
        end
    end


    //------------- PLL1 Data FIFO --------------------
    reg             pll1_ReadEnable;
    wire    [2:0]   pll1_Symbol;
    jitterFifo pll1Fifo(
        .rst(pll1Reset),
        .wr_clk(clk),
        .rd_clk(pll1_OUT1),
        .din({ch1PcmData,2'b0}),
        .wr_en(ch1PcmClkEn),
        .rd_en(pll1_ReadEnable),
        .dout(pll1_Symbol),
        .full(pll1_Full),
        .empty(pll1_Empty),
        .prog_full(pll1_HalfFull)
    );
    always @(posedge pll1_OUT1) begin
        if (pll1Reset) begin
            pll1_ReadEnable <= 0;
        end
        else if (pll1_HalfFull) begin
            pll1_ReadEnable <= 1;
        end
    end

    `endif //NEW_FIFO

    //-------------- PLL Outputs ----------------------
    assign          pll0_Data = pll0_Symbol[2];
    assign          pll1_Data = asyncMode ? pll1_Symbol[2] : pll0_Symbol[1];
    assign          pll0_Clk = pll0_OUT1;
    assign          pll1_Clk = asyncMode ? pll1_OUT1 : pll0_OUT1;







`ifdef ADD_BERT
//******************************************************************************
//                          Bit Error Rate Tester
//******************************************************************************

bsBertOutputMux bsMux(
    .muxSelect(bertMuxSelect),
    .ch0BitsyncClk(ch0ClkOut),
    .ch0BitsyncData(ch0DataOut),
    .ch0DecoderClk(),
    .ch0DecoderData(),
    .ch1BitsyncClk(ch1ClkOut),
    .ch1BitsyncData(ch1DataOut),
    .ch1DecoderClk(),
    .ch1DecoderData(),
    .dualBitsyncClk(ch0ClkOut),
    .dualBitsyncData(ch0DataOut),
    .dualDecoderClk(),
    .dualDecoderData(),
    .pngenClk(),
    .pngenData(),
    .framesyncClk(),
    .framesyncData(),
    .outputClk(bertClkIn),
    .outputData(bertDataIn)
);

reg bertSpace;
always @* begin
    casex(addr)
        `BERT_SPACE:        bertSpace = 1;
        default:            bertSpace = 0;
        endcase
    end
wire    [31:0]  bertDout;
bert bert_top (
    .reset(reset),
    .enable(bertEnable),
    .busClk(fb_clk),
    .cs(bertSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .dataIn(dataIn),
    .dataOut(bertDout),
    .clock(bertClkIn),
    .data(bertDataIn),
    );

`endif


//******************************************************************************
//                              Interpolators
//******************************************************************************
reg     [17:0]  interp0DataIn;
reg             interp0ClkEn;
always @(posedge clk) begin
    case (dac0InputSelect)
        `SYS_DAC_INPUT_SEL_CH0: begin
            interp0DataIn <= ch0Dac0Data;
            interp0ClkEn <= ch0Dac0ClkEn;
        end
        `SYS_DAC_INPUT_SEL_CH1: begin
            interp0DataIn <= ch1Dac0Data;
            interp0ClkEn <= ch1Dac0ClkEn;
        end
        default: begin
            interp0DataIn <= ch0Dac0Data;
            interp0ClkEn <= ch0Dac0ClkEn;
        end
    endcase
end
wire    [31:0]  interp0Dout;
wire    [17:0]  interp0DataOut;
interpolate #(.RegSpace(`INTERP0SPACE), .FirRegSpace(`VIDFIR0SPACE)) dac0Interp(
    .clk(clk), .reset(reset), .clkEn(interp0ClkEn),
    .busClk(fb_clk),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(interp0Dout),
    .dataIn(interp0DataIn),
    .dataOut(interp0DataOut)
    );
reg     [13:0]  dac0_d;
always @(posedge clk) begin
    dac0_d[12:0] <= interp0DataOut[16:4];
    dac0_d[13] <= ~interp0DataOut[17];
end

reg     [17:0]  interp1DataIn;
reg             interp1ClkEn;
always @(posedge clk) begin
    case (dac1InputSelect)
        `SYS_DAC_INPUT_SEL_CH0: begin
            interp1DataIn <= ch0Dac1Data;
            interp1ClkEn <= ch0Dac1ClkEn;
        end
        `SYS_DAC_INPUT_SEL_CH1: begin
            interp1DataIn <= ch1Dac1Data;
            interp1ClkEn <= ch1Dac1ClkEn;
        end
        default: begin
            interp1DataIn <= ch0Dac1Data;
            interp1ClkEn <= ch0Dac1ClkEn;
        end
    endcase
end
wire    [31:0]  interp1Dout;
wire    [17:0]  interp1DataOut;
interpolate #(.RegSpace(`INTERP1SPACE), .FirRegSpace(`VIDFIR1SPACE)) dac1Interp(
    .clk(clk), .reset(reset), .clkEn(interp1ClkEn),
    .busClk(fb_clk),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(interp1Dout),
    .dataIn(interp1DataIn),
    .dataOut(interp1DataOut)
    );
reg     [13:0]  dac1_d;
always @(posedge clk) begin
    dac1_d[12:0] <= interp1DataOut[16:4];
    dac1_d[13] <= ~interp1DataOut[17];
end

reg     [17:0]  interp2DataIn;
reg             interp2ClkEn;
always @(posedge clk) begin
    case (dac2InputSelect)
        `SYS_DAC_INPUT_SEL_CH0: begin
            interp2DataIn <= ch0Dac2Data;
            interp2ClkEn <= ch0Dac2ClkEn;
        end
        `SYS_DAC_INPUT_SEL_CH1: begin
            interp2DataIn <= ch1Dac2Data;
            interp2ClkEn <= ch1Dac2ClkEn;
        end
        default: begin
            interp2DataIn <= ch0Dac2Data;
            interp2ClkEn <= ch0Dac2ClkEn;
        end
    endcase
end
wire    [31:0]  interp2Dout;
wire    [17:0]  interp2DataOut;
interpolate #(.RegSpace(`INTERP2SPACE), .FirRegSpace(`VIDFIR2SPACE)) dac2Interp(
    .clk(clk), .reset(reset), .clkEn(interp2ClkEn),
    .busClk(fb_clk),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(dataIn),
    .dout(interp2Dout),
    .dataIn(interp2DataIn),
    .dataOut(interp2DataOut)
    );
reg     [13:0]  dac2_d;
always @(posedge clk) begin
    dac2_d[12:0] <= interp2DataOut[16:4];
    dac2_d[13] <= ~interp2DataOut[17];
end


assign dac0_clk = clk;
assign dac1_clk = clk;
assign dac2_clk = clk;

//******************************************************************************
//                               Output Assignments
//******************************************************************************

assign adc01_powerDown = 1'b0;

assign dac_rst = 1'b0;
assign dac_sclk = 1'b0;
assign dac0_nCs = 1'b1;
assign dac1_nCs = 1'b1;
assign dac2_nCs = 1'b1;
assign dac_sdio = 1'b0;

//`define TEST_OUTPUTS
`ifdef TEST_OUTPUTS

assign bsClkOut = pll0_Full;
assign bsDataOut = pll0_Reset;

`else //TEST_OUTPUTS

clockAndDataMux bsMux(
    .muxSelect(bsCoaxMuxSelect),
    .clk0(ch0ClkOut),
    .data0(ch0DataOut),
    .clk1(pll0_Clk),
    .data1(pll0_Data),
    .clk2(ch1ClkOut),
    .data2(ch1DataOut),
    .clk3(pll1_Clk),
    .data3(pll1_Data),
    .clk4(ch0ClkOut),
    .data4(ch0DataOut),
    .clk5(pll0_Clk),
    .data5(pll0_Data),
    .clk6(),
    .data6(),
    .clk7(),
    .data7(),
    .outputClk(bsClkOut),
    .outputData(bsDataOut)
);

`endif //TEST_OUTPUTS

clockAndDataMux bsDiffMux(
    .muxSelect(bsRS422MuxSelect),
    .clk0(ch0ClkOut),
    .data0(ch0DataOut),
    .clk1(pll0_Clk),
    .data1(pll0_Data),
    .clk2(ch1ClkOut),
    .data2(ch1DataOut),
    .clk3(pll1_Clk),
    .data3(pll1_Data),
    .clk4(ch0ClkOut),
    .data4(ch0DataOut),
    .clk5(pll0_Clk),
    .data5(pll0_Data),
    .clk6(),
    .data6(),
    .clk7(),
    .data7(),
    .outputClk(bsDiffClkOut),
    .outputData(bsDiffDataOut)
);

clockAndDataMux encMux(
    .muxSelect(encCoaxMuxSelect),
    .clk0(ch0ClkOut),
    .data0(ch0DataOut),
    .clk1(pll0_Clk),
    .data1(pll0_Data),
    .clk2(ch1ClkOut),
    .data2(ch1DataOut),
    .clk3(pll1_Clk),
    .data3(pll1_Data),
    .clk4(ch0ClkOut),
    .data4(ch0DataOut),
    .clk5(pll0_Clk),
    .data5(pll0_Data),
    .clk6(),
    .data6(),
    .clk7(),
    .data7(),
    .outputClk(encClkOut),
    .outputData(encDataOut)
);

clockAndDataMux fsMux(
    .muxSelect(fsMuxSelect),
    .clk0(ch0ClkOut),
    .data0(ch0DataOut),
    .clk1(pll0_Clk),
    .data1(pll0_Data),
    .clk2(ch1ClkOut),
    .data2(ch1DataOut),
    .clk3(pll1_Clk),
    .data3(pll1_Data),
    .clk4(ch0ClkOut),
    .data4(ch0DataOut),
    .clk5(pll0_Clk),
    .data5(pll0_Data),
    .clk6(),
    .data6(),
    .clk7(),
    .data7(),
    .outputClk(fsClkOut),
    .outputData(fsDataOut)
);

clockAndDataMux fsDiffMux(
    .muxSelect(fsRS422MuxSelect),
    .clk0(ch0ClkOut),
    .data0(ch0DataOut),
    .clk1(pll0_Clk),
    .data1(pll0_Data),
    .clk2(ch1ClkOut),
    .data2(ch1DataOut),
    .clk3(pll1_Clk),
    .data3(pll1_Data),
    .clk4(ch0ClkOut),
    .data4(ch0DataOut),
    .clk5(pll0_Clk),
    .data5(pll0_Data),
    .clk6(),
    .data6(),
    .clk7(),
    .data7(),
    .outputClk(fsDiffClkOut),
    .outputData(fsDiffDataOut)
);

assign ch0Lockn = !ch0Lock;
assign ch1Lockn = !ch1Lock;

//******************************************************************************
//                           Processor Read Data Mux
//******************************************************************************
reg [15:0] rd_mux;
always @* begin
    casex(addr)
        `BITSYNC_TOP_SPACE, 
        `CH0_DFSPACE,       
        `CH0_DFFIRSPACE,    
        `CH0_RESAMPSPACE,
        `CH0_BITSYNCSPACE,  
        `CH0_AGCSPACE,      
        `CH1_DFSPACE,       
        `CH1_DFFIRSPACE,    
        `CH1_RESAMPSPACE,
        `CH1_BITSYNCSPACE,  
        `CH1_AGCSPACE: begin
            if (addr[1]) begin
                rd_mux = bsDout[31:16];
            end
            else begin
                rd_mux = bsDout[15:0];
            end
        end
        `BITSYNC_BERT_SPACE : begin
            if (addr[1]) begin
                rd_mux = bsBertDout[31:16];
                end
            else begin
                rd_mux = bsBertDout[15:0];
                end
            end
        `VIDFIR0SPACE,
        `INTERP0SPACE: begin
            if (addr[1]) begin
                rd_mux = interp0Dout[31:16];
                end
            else begin
                rd_mux = interp0Dout[15:0];
                end
            end
         `VIDFIR1SPACE,
         `INTERP1SPACE: begin
            if (addr[1]) begin
                rd_mux = interp1Dout[31:16];
                end
            else begin
                rd_mux = interp1Dout[15:0];
                end
            end
         `VIDFIR2SPACE,
         `INTERP2SPACE: begin
            if (addr[1]) begin
                rd_mux = interp2Dout[31:16];
                end
            else begin
                rd_mux = interp2Dout[15:0];
                end
            end
        `ifdef ADD_BERT
        `BERT_SPACE: begin
            if (addr[1]) begin
                rd_mux = bertDout[31:16];
                end
            else begin
                rd_mux = bertDout[15:0];
                end
            end
        `endif
        `PLLSPACE: begin
            if (addr[1]) begin
                rd_mux = pllDout[31:16];
                end
            else begin
                rd_mux = pllDout[15:0];
                end
            end
        `DUAL_DECODERSPACE: begin
            rd_mux = dualDecDout;
            end
        `CH1_DECODERSPACE: begin
            rd_mux = ch1DecDout;
            end
         default : rd_mux = 16'hxxxx;
        endcase
     end

assign fb_data = (cs & rd) ? rd_mux : 16'hzzzz;


endmodule

