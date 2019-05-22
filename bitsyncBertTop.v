`timescale 1ns/100ps
`include "addressMap.v"
`include "defines.v"

module bitsyncBertTop (
    input           sysClk,

    // Flexbus connections
    input           fbClk,
    input           fb_ale,
    input           fb_csn,
    input           fb_oen,
    input           fb_wrn,
    input   [15:0]  fb_addr,
    inout   [15:0]  fb_data,

    // ADC Inputs
    input   [13:0]  adc0,
    input           adc0_overflow,
    input   [13:0]  adc1,
    input           adc1_overflow,
    output          adc01_powerDown,

    // Clock and data inputs
    input           singleEndedClk,
    input           singleEndedData,
    input           differentialClk,
    input           differentialData,

    // DAC configuration interface
    output          dac_rst,
    output          dac_sclk,
    inout           dac_sdio,
    output          dac0_nCs,
    output          dac1_nCs,
    output          dac2_nCs,

    // DAC datapath interface
    output reg  [13:0]  dac0_d,dac1_d,dac2_d,
    output              dac0_clk,dac1_clk,dac2_clk,

    // Clock and data outputs
    output          bsClkOut,bsDataOut,
    output          fsClkOut,fsDataOut,
    output          encClkOut,encDataOut,
    output          bsDiffClkOut, bsDiffDataOut,
    output          fsDiffClkOut, fsDiffDataOut,

    // Framer Outputs
    output          framer_Sync,

    // Spare Outputs
    output          spareData,
    output          spareClock,

    // Lock indicators
    output          ch0Lockn, ch1Lockn,

    // Gain and Offset DAC interfaces
    output          ch0SELn, ch1SELn,
    output          dacSCLK, dacMOSI,

    // Input Impedance and Topology controls
    output          ch0HighImpedance,
    output          ch0SingleEnded,
    output          ch1HighImpedance,
    output          ch1SingleEnded,

    // PLL Interface Signals
    output          pll_SCK,
    output          pll_SDI,
    output          pll0_CS,
    output          pll0_REF,
    input           pll0_OUT1,
    output          pll0_PWDn,
    output          pll1_CS,
    output          pll1_REF,
    input           pll1_OUT1,
    output          pll1_PWDn,
    output          pll2_CS,
    output          pll2_REF,
    input           pll2_OUT1,
    output          pll2_PWDn

);

    parameter VER_NUMBER = 16'd517;


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
//                    Reclock Clock and Data Inputs
//******************************************************************************
clockAndDataInputSync seSync(
  .wr_clk(singleEndedClk),
  .din(singleEndedData),
  .reset(reset),
  .rd_clk(clk),
  .enable(seClkEn),
  .dout(seData)
);

clockAndDataInputSync diffSync(
  .wr_clk(differentialClk),
  .din(differentialData),
  .reset(reset),
  .rd_clk(clk),
  .enable(diffClkEn),
  .dout(diffData)
);



//******************************************************************************
//                           Reclock ADC Inputs
//******************************************************************************
    reg             [13:0]  adc0Reg,adc1Reg;
    reg     signed  [17:0]  adc0In, adc1In;
    reg             [1:0]   adc0OverflowSR,adc1OverflowSR;
    wire                    adc0Overflow = adc0OverflowSR[1];
    wire                    adc1Overflow = adc1OverflowSR[1];
    always @(posedge clk) begin
        adc0Reg <= adc0;
        adc1Reg <= adc1;
        adc0In <= $signed({~adc0Reg[13],adc0Reg[12:0],4'b0});
        adc1In <= $signed({~adc1Reg[13],adc1Reg[12:0],4'b0});
        adc0OverflowSR <= {adc0OverflowSR[0],adc0_overflow};
        adc1OverflowSR <= {adc1OverflowSR[0],adc1_overflow};
    end


//******************************************************************************
//                             Top Level Registers
//******************************************************************************
    reg bsBertTopSpace;
    always @* begin
        casex(addr)
            `BITSYNC_BERT_SPACE:    bsBertTopSpace = cs;
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
    wire    [3:0]   bertInputMuxSelect;
    wire    [3:0]   framerInputMuxSelect;
    wire    [3:0]   spareMuxSelect;
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
        .framesyncEnable(framerEnable),
        .pnGeneratorEnable(pngenEnable),
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
        .bertMuxSelect(bertInputMuxSelect),
        .framerMuxSelect(framerInputMuxSelect),
        .spareMuxSelect(spareMuxSelect)
    );


//******************************************************************************
//                          Two Channel Bitsync
//******************************************************************************
    wire    [1:0]   rotation;
    wire    [17:0]  ch0SymData, ch1SymData;
    wire    [17:0]  ch0Gain,ch0Offset;
    wire    [17:0]  ch1Gain,ch1Offset;
    wire    [17:0]  ch0Dac0Data, ch0Dac1Data, ch0Dac2Data;
    wire    [17:0]  ch1Dac0Data, ch1Dac1Data, ch1Dac2Data;
    wire    [17:0]  iEye,qEye;
    wire    [4:0]   eyeOffset;
    wire    [1:0]   bitsyncMode;
    wire            asyncMode = (bitsyncMode == `BS_MODE_IND_CH)
                             || (bitsyncMode == `BS_MODE_SINGLE_CH);
    wire    [31:0]  bsDout;
    bitsyncTop bitsyncTop(
        .clk(clk), .clkEn(bitsyncEnable), .reset(reset),
        .busClk(fb_clk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(bsDout),
        .rx0(adc0In),
        .rx0Saturated(adc0Overflow),
        .rx1(adc1In),
        .rx1Saturated(adc1Overflow),
        .rotation(rotation),
        .ch0Lock(ch0Lock),
        .ch0Sym2xEn(ch0Sym2xEn),
        .ch0SymEn(ch0SymEn),
        .ch0SymData(ch0SymData),
        .ch0SymClk(ch0SymClk),
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
        .ch1SymClk(ch1SymClk),
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
        .ch0VitBitEn(ch0VitBitEn),
        .ch0VitBit(ch0VitBit),
        .ch0VitSym2xEn(ch0VitSym2xEn),
        .ch0VitSymClk(ch0VitSymClk),
        .ch1VitBitEn(ch1VitBitEn),
        .ch1VitBit(ch1VitBit),
        .ch1VitSym2xEn(ch1VitSym2xEn),
        .ch1VitSymClk(ch1VitSymClk),
        .bitsyncMode(bitsyncMode),
        .test0(test0), .test1(test1)
    );


`ifdef ADD_MSE
/******************************************************************************
                       Mean Squared Error Estimate
*******************************************************************************/
    wire    signed  [17:0]  negCh0SymData = -ch0SymData;
    wire            [12:0]  ch0Mag = ch0SymData[17] ? negCh0SymData[16:4] : ch0SymData[16:4];
    wire    signed  [17:0]  negCh1SymData = -ch1SymData;
    wire            [12:0]  ch1Mag = ch1SymData[17] ? negCh1SymData[16:4] : ch1SymData[16:4];
    wire            [31:0]  mseDout;
    dualMseEstimate mse (
        .clk(clk),
        .reset(reset),
        .busClk(fb_clk),
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(mseDout),
        .ch0MagClkEn(ch0SymEn),
        .ch0Mag(ch0Mag),
        .ch1MagClkEn(ch1SymEn),
        .ch1Mag(ch1Mag)
    );
`endif


`ifdef ADD_TURBO
/******************************************************************************
                                Turbo Decoder
*******************************************************************************/
    wire    signed  [17:0]  turboDac0Data;
    wire    signed  [17:0]  turboDac1Data;
    wire    signed  [17:0]  turboDac2Data;
    wire            [31:0]  turboDout;
    turbo #(.TURBOBITS(5)) turbo (
        .clk(clk),
        .clkEn(ch0Sym2xEn),
        .reset(reset),
        .busClk(fb_clk),
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(turboDout),
        .bitsyncMode(bitsyncMode),
        .iSymEn(ch0SymEn),
        .iSymData(ch0SymData),
        .qSymEn(ch1SymEn),
        .qSymData(ch1SymData),
        .dac0ClkEn(turboDac0ClkEn),
        .dac0Data(turboDac0Data),
        .dac1ClkEn(turboDac1ClkEn),
        .dac1Data(turboDac1Data),
        .dac2ClkEn(turboDac2ClkEn),
        .dac2Data(turboDac2Data),
        .turboBitEnOut(turboBitEn),
        .turboBitOut(turboBit)
    );

`endif



//******************************************************************************
//                          AGC/DC Offset DAC Interfaces
//******************************************************************************
    mcp48xxInterface dacInterface (
        .clk(clk),
        .clkEn0(ch0SymEn),
        .clkEn1(asyncMode ? ch1SymEn : ch0SymEn),
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
            `DUAL_DECODERSPACE:     dualDecoderSpace = cs;
            default:                dualDecoderSpace = 0;
        endcase
    end

    wire        [1:0]   dualDecInputSelect;
    reg                 dualCh0Input;
    reg                 dualCh1Input;
    reg                 dualSymEn;
    reg                 dualSym2xEn;
    always @(posedge clk) begin
        case (dualDecInputSelect)
            `DEC_INPUT_BS: begin
                dualCh0Input <= ch0DataOut;
                dualCh1Input <= ch1DataOut;
                dualSymEn <= ch0SymEn;
                dualSym2xEn <= ch0Sym2xEn;
            end
            `DEC_INPUT_VITERBI: begin
                dualCh0Input <= ch0VitBit;
                dualCh1Input <= ch1VitBit;
                dualSymEn <= ch0VitBitEn;
                dualSym2xEn <= ch0VitSym2xEn;
            end
            `ifdef ADD_TURBO
            `DEC_INPUT_TURBO: begin
                dualCh0Input <= turboBit;
                dualCh1Input <= turboBit;
                dualSymEn <= turboBitEn;
                dualSym2xEn <= turboBitEn;
            end
            `endif
            default: begin
                dualCh0Input <= ch0DataOut;
                dualCh1Input <= ch1DataOut;
                dualSymEn <= ch0SymEn;
                dualSym2xEn <= ch0Sym2xEn;
            end
        endcase
    end

    wire    [31:0]  dualDecDout;
    wire    [1:0]   dualClkPhase;
    wire            dualClkInvert   = dualClkPhase[0];
    wire            dualClk90       = dualClkPhase[1];
    decoder dualDecoder
    (
        .clk(clk),
        .reset(reset),
        .en(dualDecoderSpace),
        `ifdef USE_BUS_CLOCK
        .busClk(fb_clk),
        `endif
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(dualDecDout),
        .symb_clk_en(dualSymEn),          // symbol rate clock enable
        .symb_clk_2x_en(dualSym2xEn),     // 2x symbol rate clock enable
        .symb_i(dualCh0Input),            // data input,
        .symb_q(dualCh1Input),            // data input,
        .dout_i(dualDataI),
        .dout_q(dualDataQ),
        .outputClkEn(dualPcmClkEn),
        .fifo_reset(),
        .clkPhase(dualClkPhase),
        .symb_clk(dualPcmSymClk),
        .inputSelect(dualDecInputSelect)
    );

    reg ch1DecoderSpace;
    always @* begin
        casex(addr)
            `CH1_DECODERSPACE:      ch1DecoderSpace = cs;
            default:                ch1DecoderSpace = 0;
        endcase
    end

    wire        [1:0]   ch1DecInputSelect;
    reg                 ch1DecInput;
    reg                 ch1DecSymEn;
    reg                 ch1DecSym2xEn;
    always @(posedge clk) begin
        case (dualDecInputSelect)
            `DEC_INPUT_BS: begin
                ch1DecInput <= ch1DataOut;
                ch1DecSymEn <= ch1SymEn;
                ch1DecSym2xEn <= ch1Sym2xEn;
            end
            `DEC_INPUT_VITERBI: begin
                ch1DecInput <= ch1VitBit;
                ch1DecSymEn <= ch1VitBitEn;
                ch1DecSym2xEn <= ch1VitSym2xEn;
            end
            `ifdef ADD_TURBO
            `DEC_INPUT_TURBO: begin
                ch1DecInput <= turboBit;
                ch1DecSymEn <= turboBitEn;
                ch1DecSym2xEn <= turboBitEn;
            end
            `endif
            default: begin
                ch1DecInput <= ch1DataOut;
                ch1DecSymEn <= ch1SymEn;
                ch1DecSym2xEn <= ch1Sym2xEn;
            end
        endcase
    end


    wire    [31:0]  ch1DecDout;
    wire    [1:0]   ch1ClkPhase;
    wire            ch1ClkInvert   = ch1ClkPhase[0];
    wire            ch1Clk90       = ch1ClkPhase[1];
    pcmDecoder dec1 (
        .clk(clk),
        .reset(reset),
        .busClk(fb_clk),
        .en(ch1DecoderSpace),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(ch1DecDout),
        .symb_clk_en(ch1DecSymEn),        // symbol rate clock enable
        .symb_clk_2x_en(ch1DecSym2xEn),   // 2x symbol rate clock enable
        .symb(ch1DecInput),               // data input,
        .data_out(ch1PcmData),            // data output
        .clkEn_out(ch1PcmClkEn),          // clk output
        .fifo_reset(),
        .clkPhase(ch1ClkPhase),
        .symb_clk(ch1PcmSymClk),
        .inputSelect(ch1DecInputSelect)
    );



//******************************************************************************
//                            Bit Error Rate Tester
//******************************************************************************
    clockAndDataMux bertMux(
        .muxSelect(bertInputMuxSelect),
        .clk0(dualSymEn),
        .clkInvert0(1'b0),
        .data0(dualCh0Input),
        .clk1(dualPcmClkEn),
        .clkInvert1(1'b0),
        .data1(dualDataI),
        .clk2(ch1DecSymEn),
        .clkInvert2(1'b0),
        .data2(ch1DecInput),
        .clk3(ch1PcmClkEn),
        .clkInvert3(1'b0),
        .data3(ch1PcmData),
        .clk4(seClkEn),
        .clkInvert4(1'b0),
        .data4(seData),
        .clk5(diffClkEn),
        .clkInvert5(1'b0),
        .data5(diffData),
        .clk6(1'b0),
        .clkInvert6(1'b0),
        .data6(1'b0),
        .clk7(1'b0),
        .clkInvert7(1'b0),
        .data7(1'b0),
        .outputClk(bertClkEn),
        .outputData(bertData)
    );

    reg bertSpace;
    always @* begin
        casex(addr)
            `BERT_SPACE:            bertSpace = cs;
            default:                bertSpace = 0;
            endcase
        end
    wire    [31:0]  bertDout;
    bert_top bert(
        .reset(reset),
        .busClk(fb_clk),
        .cs(bertSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(bertDout),
        .clk(clk),
        .enable(bertClkEn),
        .data(bertData)
    );


//******************************************************************************
//                               PN Generator
//******************************************************************************
    wire    [31:0]  pngenDout;
    pngenTop pngen(
        .clk(clk),
        .clkEn(pngenEnable),
        .reset(reset),
        .busClk(fb_clk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(pngenDout),
        .pnClkEn(pnClkEn),
        .nrzBit(pnNrzBit),
        .pnBit(pnBit),
        .pnClk(pnClk)
    );


//******************************************************************************
//                       Clock/Data Jitter Reduction
//******************************************************************************

    // SPI interface to the PLLs
    wire    [31:0]  pllDout;
    ics307Interface #(.SysclkDivider(4)) pllIntfc (
        .reset(reset),
        .busClk(fb_clk),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(pllDout),
        .cs(cs),
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
        .pll2Reset(pll2Reset)
    );

    `ifdef USE_DEMOD_CandD

    //----------------------- Channel 0 Jitter Attenuation --------------------

    wire    [3:0]   cAndD0SourceSelect;
    reg             cAndD0ClkEn;
    reg     [2:0]   cAndD0DataIn;
    always @* begin
        case (cAndD0SourceSelect)
            `ifdef ADD_TURBO
            `CandD_SRC_TURBO: begin
                cAndD0ClkEn = turboBitEn;
                cAndD0DataIn = {turboBit,2'b0};
            end
            `endif
            default: begin
                cAndD0ClkEn = dualPcmClkEn;
                cAndD0DataIn = {dualDataI,dualDataQ,1'b0};
            end
        endcase
    end

    wire    [2:0]   cAndD0DataOut;
    wire    [31:0]  cAndD0Dout;
    clkAndDataOutput #(.RegSpace(`CandD0SPACE)) cAndD0 (
        .clk(clk), .reset(reset),
        .busClk(fb_clk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(cAndD0Dout),
        .clkEnIn(cAndD0ClkEn),
        .dataIn(cAndD0DataIn),
        .pllOutputClk(pll0_OUT1),
        .sourceSelect(cAndD0SourceSelect),
        .pllReferenceClk(pll0_REF),
        .outputClk(cAndD0ClkOut),
        .outputData(cAndD0DataOut)
    );

    //----------------------- Channel 1 Jitter Attenuation --------------------

    wire    [3:0]   cAndD1SourceSelect;
    reg             cAndD1ClkEn;
    reg     [2:0]   cAndD1DataIn;
    always @* begin
        case (cAndD1SourceSelect)
            `ifdef ADD_TURBO
            `CandD_SRC_TURBO: begin
                cAndD1ClkEn = turboBitEn;
                cAndD1DataIn = {turboBit,2'b0};
            end
            `endif
            default: begin
                cAndD1ClkEn = ch1PcmClkEn;
                cAndD1DataIn = {ch1PcmData,2'b0};
            end
        endcase
    end

    wire    [2:0]   cAndD1DataOut;
    wire    [31:0]  cAndD1Dout;
    clkAndDataOutput #(.RegSpace(`CandD1SPACE)) cAndD1 (
        .clk(clk), .reset(reset),
        .busClk(fb_clk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(cAndD1Dout),
        .clkEnIn(cAndD1ClkEn),
        .dataIn(cAndD1DataIn),
        .pllOutputClk(pll1_OUT1),
        .sourceSelect(cAndD1SourceSelect),
        .pllReferenceClk(pll1_REF),
        .outputClk(cAndD1ClkOut),
        .outputData(cAndD1DataOut)
    );

    //----------------------- Channel 2 Jitter Attenuation --------------------

    wire    [3:0]   cAndD2SourceSelect;
    reg             cAndD2ClkEn;
    reg     [2:0]   cAndD2DataIn;
    always @* begin
        case (cAndD2SourceSelect)
            `ifdef ADD_TURBO
            `CandD_SRC_TURBO: begin
                cAndD2ClkEn = turboBitEn;
                cAndD2DataIn = {turboBit,2'b0};
            end
            `endif
            default: begin
                cAndD2ClkEn = pnClkEn;
                cAndD2DataIn = {pnBit,2'b0};
            end
        endcase
    end

    wire    [2:0]   cAndD2DataOut;
    wire    [31:0]  cAndD2Dout;
    clkAndDataOutput #(.RegSpace(`CandD2SPACE)) cAndD2 (
        .clk(clk), .reset(reset),
        .busClk(fb_clk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(cAndD2Dout),
        .clkEnIn(cAndD2ClkEn),
        .dataIn(cAndD2DataIn),
        .pllOutputClk(pll2_OUT1),
        .sourceSelect(cAndD2SourceSelect),
        .pllReferenceClk(pll2_REF),
        .outputClk(cAndD2ClkOut),
        .outputData(cAndD2DataOut)
    );

    //-------------------------- Final Assignments ----------------------------

    assign pll0_Data = cAndD0DataOut[2];
    assign pll0_Clk = cAndD0ClkOut;
    assign dll0_Data = cAndD0DataOut[2];
    assign dll0_Clk = cAndD0ClkOut;

    assign pll1_Data = asyncMode ? cAndD1DataOut[2] : cAndD0DataOut[1];
    assign pll1_Clk = asyncMode ? cAndD1ClkOut : cAndD0ClkOut;
    assign dll1_Data = asyncMode ? cAndD1DataOut[2] : cAndD0DataOut[1];
    assign dll1_Clk = asyncMode ? cAndD1ClkOut : cAndD0ClkOut;

    assign pll2_Data = cAndD2DataOut[2];
    assign pll2_Clk = cAndD2ClkOut;

    `else // USE_DEMOD_CandD

    wire    [7:0]   dll0PhaseError;
    wire    [31:0]  dll0Dout;
    digitalPLL #(.REG_SPACE(`DLL0SPACE)) dll0(
        .clk(clk),
        .reset(reset),
        .busClk(fb_clk),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(dll0Dout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .referenceClkEn(dualPcmClkEn),
        .dllOutputClk(dll0OutClk),
        .filteredRefClk(pll0_REF),
        .phaseError(dll0PhaseError)
    );

    wire    [7:0]   dll1PhaseError;
    wire    [31:0]  dll1Dout;
    digitalPLL #(.REG_SPACE(`DLL1SPACE)) dll1(
        .clk(clk),
        .reset(reset),
        .busClk(fb_clk),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(dll1Dout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .referenceClkEn(ch1PcmClkEn),
        .dllOutputClk(dll1OutClk),
        .filteredRefClk(pll1_REF),
        .phaseError(dll1PhaseError)
    );

    //------------- DLL Clock Dividers
    // Make a Gray-coded divider
    reg     [1:0]   dll0Divider;
    wire            dll0ReadClk = dll0Divider[0];
    wire            dll090Clk   = dll0Divider[1];
    always @(posedge dll0OutClk) begin
        case (dll0Divider)
            2'b00:      dll0Divider <= 2'b01;
            2'b01:      dll0Divider <= 2'b11;
            2'b11:      dll0Divider <= 2'b10;
            2'b10:      dll0Divider <= 2'b00;
            default:    dll0Divider <= 2'b00;
        endcase
    end
    reg     [1:0]   dll1Divider;
    wire            dll1ReadClk = dll1Divider[0];
    wire            dll190Clk   = dll1Divider[1];
    always @(posedge dll1OutClk) begin
        case (dll1Divider)
            2'b00:      dll1Divider <= 2'b01;
            2'b01:      dll1Divider <= 2'b11;
            2'b11:      dll1Divider <= 2'b10;
            2'b10:      dll1Divider <= 2'b00;
            default:    dll1Divider <= 2'b00;
        endcase
    end

    //------------- DLL0 Data FIFO --------------------
    reg             dll0_ReadEnable;
    wire    [2:0]   dll0_Symbol;
    jitterFifo dll0Fifo(
        .rst(pll0Reset),
        .wr_clk(clk),
        .rd_clk(dll0ReadClk),
        .din({dualDataI,dualDataQ,1'b0}),
        .wr_en(dualPcmClkEn),
        .rd_en(dll0_ReadEnable),
        .dout(dll0_Symbol),
        .full(dll0_Full),
        .empty(dll0_Empty),
        .prog_full(dll0_HalfFull)
    );
    always @(posedge dll0ReadClk) begin
        if (pll0Reset) begin
            dll0_ReadEnable <= 0;
        end
        else if (dll0_HalfFull) begin
            dll0_ReadEnable <= 1;
        end
    end


    //------------- DLL1 Data FIFO --------------------
    reg             dll1_ReadEnable;
    wire    [2:0]   dll1_Symbol;
    jitterFifo dll1Fifo(
        .rst(pll1Reset),
        .wr_clk(clk),
        .rd_clk(dll1ReadClk),
        .din({ch1PcmData,2'b0}),
        .wr_en(ch1PcmClkEn),
        .rd_en(dll1_ReadEnable),
        .dout(dll1_Symbol),
        .full(dll1_Full),
        .empty(dll1_Empty),
        .prog_full(dll1_HalfFull)
    );
    always @(posedge dll1ReadClk) begin
        if (pll1Reset) begin
            dll1_ReadEnable <= 0;
        end
        else if (dll1_HalfFull) begin
            dll1_ReadEnable <= 1;
        end
    end

    //-------------- DLL Outputs ----------------------
    reg             dll0_Clk, dll0_Data, dllSync_Data;
    always @(posedge dll0OutClk) begin
        dll0_Data <= dll0_Symbol[2];
        dllSync_Data <= dll0_Symbol[1];
        case (dualClkPhase)
            `DEC_CLK_PHASE_0:   dll0_Clk <= dll0ReadClk;
            `DEC_CLK_PHASE_90:  dll0_Clk <= dll090Clk;
            `DEC_CLK_PHASE_180: dll0_Clk <= !dll0ReadClk;
            `DEC_CLK_PHASE_270: dll0_Clk <= !dll090Clk;
        endcase
    end

    reg             dllAsync_Clk, dllAsync_Data;
    always @(posedge dll1OutClk) begin
        dllAsync_Data <= dll1_Symbol[2];
        case (ch1ClkPhase)
            `DEC_CLK_PHASE_0:   dllAsync_Clk <= dll1ReadClk;
            `DEC_CLK_PHASE_90:  dllAsync_Clk <= dll190Clk;
            `DEC_CLK_PHASE_180: dllAsync_Clk <= !dll1ReadClk;
            `DEC_CLK_PHASE_270: dllAsync_Clk <= !dll190Clk;
        endcase
    end
    assign          dll1_Data = asyncMode ? dllAsync_Data : dllSync_Data;
    assign          dll1_Clk = asyncMode ? dllAsync_Clk : dll0_Clk;


    //------------- PLL Reference Clocks --------------
    //assign          pll0_REF = dualPcmClkEn;
    //assign          pll1_REF = ch1SymEn;
    assign          pll2_REF = pnClkEn;

    //------------- PLL Clock Dividers
    // Make a Gray-coded divider
    reg     [1:0]   pll0Divider;
    wire            pll0ReadClk = pll0Divider[0];
    wire            pll090Clk   = pll0Divider[1];
    always @(posedge pll0_OUT1) begin
        case (pll0Divider)
            2'b00:      pll0Divider <= 2'b01;
            2'b01:      pll0Divider <= 2'b11;
            2'b11:      pll0Divider <= 2'b10;
            2'b10:      pll0Divider <= 2'b00;
            default:    pll0Divider <= 2'b00;
        endcase
    end
    reg     [1:0]   pll1Divider;
    wire            pll1ReadClk = pll1Divider[0];
    wire            pll190Clk   = pll1Divider[1];
    always @(posedge pll1_OUT1) begin
        case (pll1Divider)
            2'b00:      pll1Divider <= 2'b01;
            2'b01:      pll1Divider <= 2'b11;
            2'b11:      pll1Divider <= 2'b10;
            2'b10:      pll1Divider <= 2'b00;
            default:    pll1Divider <= 2'b00;
        endcase
    end

    //------------- PLL0 Data FIFO --------------------
    reg             pll0_ReadEnable;
    wire    [2:0]   pll0_Symbol;
    jitterFifo pll0Fifo(
        .rst(pll0Reset),
        .wr_clk(clk),
        .rd_clk(pll0ReadClk),
        .din({dualDataI,dualDataQ,1'b0}),
        .wr_en(dualPcmClkEn),
        .rd_en(pll0_ReadEnable),
        .dout(pll0_Symbol),
        .full(pll0_Full),
        .empty(pll0_Empty),
        .prog_full(pll0_HalfFull)
    );
    always @(posedge pll0ReadClk) begin
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
        .rd_clk(pll1ReadClk),
        .din({ch1PcmData,2'b0}),
        .wr_en(ch1PcmClkEn),
        .rd_en(pll1_ReadEnable),
        .dout(pll1_Symbol),
        .full(pll1_Full),
        .empty(pll1_Empty),
        .prog_full(pll1_HalfFull)
    );
    always @(posedge pll1ReadClk) begin
        if (pll1Reset) begin
            pll1_ReadEnable <= 0;
        end
        else if (pll1_HalfFull) begin
            pll1_ReadEnable <= 1;
        end
    end

    //------------- PLL2 Data FIFO --------------------
    reg             pll2_ReadEnable;
    wire    [2:0]   pll2_Symbol;
    jitterFifo pll2Fifo(
        .rst(pll2Reset),
        .wr_clk(clk),
        .rd_clk(pll2_OUT1),
        .din({pnBit,2'b0}),
        .wr_en(pnClkEn),
        .rd_en(pll2_ReadEnable),
        .dout(pll2_Symbol),
        .full(pll2_Full),
        .empty(pll2_Empty),
        .prog_full(pll2_HalfFull)
    );
    always @(posedge pll2_OUT1) begin
        if (pll2Reset) begin
            pll2_ReadEnable <= 0;
        end
        else if (pll2_HalfFull) begin
            pll2_ReadEnable <= 1;
        end
    end

    //-------------- PLL Outputs ----------------------
    reg             pll0_Clk, pll0_Data, sync_Data;
    always @(posedge pll0_OUT1) begin
        pll0_Data <= pll0_Symbol[2];
        sync_Data <= pll0_Symbol[1];
        case (dualClkPhase)
            `DEC_CLK_PHASE_0:   pll0_Clk <= pll0ReadClk;
            `DEC_CLK_PHASE_90:  pll0_Clk <= pll090Clk;
            `DEC_CLK_PHASE_180: pll0_Clk <= !pll0ReadClk;
            `DEC_CLK_PHASE_270: pll0_Clk <= !pll090Clk;
        endcase
    end

    reg             async_Clk, async_Data;
    always @(posedge pll1_OUT1) begin
        async_Data <= pll1_Symbol[2];
        case (ch1ClkPhase)
            `DEC_CLK_PHASE_0:   async_Clk <= pll1ReadClk;
            `DEC_CLK_PHASE_90:  async_Clk <= pll190Clk;
            `DEC_CLK_PHASE_180: async_Clk <= !pll1ReadClk;
            `DEC_CLK_PHASE_270: async_Clk <= !pll190Clk;
        endcase
    end
    assign          pll1_Data = asyncMode ? async_Data : sync_Data;
    assign          pll1_Clk = asyncMode ? async_Clk : pll0_Clk;

    assign          pll2_Data = pll2_Symbol[2];
    assign          pll2_Clk = pll2_OUT1;

    `endif //USE_DEMOD_CandD


//******************************************************************************
//                               Framer
//******************************************************************************
    clockAndDataMux framerMux(
        .muxSelect(framerInputMuxSelect),
        .clk0(dll0_Clk),
        .clkInvert0(1'b0),
        .data0(dll0_Data),
        .clk1(pll0_Clk),
        .clkInvert1(1'b0),
        .data1(pll0_Data),
        .clk2(dll1_Clk),
        .clkInvert2(1'b0),
        .data2(dll1_Data),
        .clk3(pll1_Clk),
        .clkInvert3(1'b0),
        .data3(pll1_Data),
        .clk4(singleEndedClk),
        .clkInvert4(1'b0),
        .data4(singleEndedData),
        .clk5(differentialClk),
        .clkInvert5(1'b0),
        .data5(differentialData),
        .clk6(1'b0),
        .clkInvert6(1'b0),
        .data6(1'b0),
        .clk7(1'b0),
        .clkInvert7(1'b0),
        .data7(1'b0),
        .outputClk(framer_Clk),
        .outputData(framerData)
    );

    wire    [1:0]   framerRotation;
    wire    [31:0]  framerDout;
    framerTop framer(
        .reset(reset),
        .busClk(fb_clk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(framerDout),
        .clk(framer_Clk),
        .clkEn(1'b1),
        .dataBitIn(framerData),
        .rotation(framerRotation),
        .framesyncPulse(framer_Sync),
        .framedBitOut(framer_Data),
        .framesync(framesync)
    );

    assign rotation = framerEnable ? framerRotation : 2'b0;





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
            /*
            `SYS_DAC_INPUT_SEL_DLL0: begin
                interp0DataIn <= {1'b0,dll0PhaseError,9'b0};
                interp0ClkEn <= 1'b1;
            end
            `SYS_DAC_INPUT_SEL_DLL1: begin
                interp0DataIn <= {1'b0,dll1PhaseError,9'b0};
                interp0ClkEn <= 1'b1;
            end
            */
            `ifdef ADD_TURBO
            `SYS_DAC_INPUT_SEL_TURBO: begin
                interp0DataIn <= turboDac0Data;
                interp0ClkEn <= turboDac0ClkEn;
            end
            `endif
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
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp0Dout),
        .dataIn(interp0DataIn),
        .dacSource(),
        .clkEnOut(),
        .dataOut(interp0DataOut)
        );
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
            `ifdef ADD_TURBO
            `SYS_DAC_INPUT_SEL_TURBO: begin
                interp1DataIn <= turboDac1Data;
                interp1ClkEn <= turboDac1ClkEn;
            end
            `endif
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
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp1Dout),
        .dataIn(interp1DataIn),
        .dacSource(),
        .clkEnOut(),
        .dataOut(interp1DataOut)
        );
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
            `ifdef ADD_TURBO
            `SYS_DAC_INPUT_SEL_TURBO: begin
                interp2DataIn <= turboDac2Data;
                interp2ClkEn <= turboDac2ClkEn;
            end
            `endif
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
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp2Dout),
        .dataIn(interp2DataIn),
        .dacSource(),
        .clkEnOut(),
        .dataOut(interp2DataOut)
        );
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

    assign dac_rst = 1'b1;
    assign dac_sclk = 1'b0;
    assign dac0_nCs = 1'b0;
    assign dac1_nCs = 1'b0;
    assign dac2_nCs = 1'b0;
    assign dac_sdio = 1'b0;


//`define TEST_OUTPUTS
`ifdef TEST_OUTPUTS

assign bsClkOut = pll0_Full;
assign bsDataOut = pll0_Reset;

`else //TEST_OUTPUTS

clockAndDataMux bsMux(
    .muxSelect(bsCoaxMuxSelect),
    .clk0(dll0_Clk),
    .clkInvert0(1'b0),
    .data0(dll0_Data),
    .clk1(pll0_Clk),
    .clkInvert1(1'b0),
    .data1(pll0_Data),
    .clk2(dll1_Clk),
    .clkInvert2(1'b0),
    .data2(dll1_Data),
    .clk3(pll1_Clk),
    .clkInvert3(1'b0),
    .data3(pll1_Data),
    .clk4(1'b0),
    .clkInvert4(1'b0),
    .data4(1'b0),
    .clk5(pnClk),
    .clkInvert5(1'b0),
    .data5(pnBit),
    .clk6(pll2_Clk),
    .clkInvert6(1'b0),
    .data6(pll2_Data),
    .clk7(framer_Clk),
    .clkInvert7(1'b0),
    .data7(framer_Data),
    .outputClk(bsClkOut),
    .outputData(bsDataOut)
);

`endif //TEST_OUTPUTS

clockAndDataMux bsDiffMux(
    .muxSelect(bsRS422MuxSelect),
    .clk0(dll0_Clk),
    .clkInvert0(1'b0),
    .data0(dll0_Data),
    .clk1(pll0_Clk),
    .clkInvert1(1'b0),
    .data1(pll0_Data),
    .clk2(dll1_Clk),
    .clkInvert2(1'b0),
    .data2(dll1_Data),
    .clk3(pll1_Clk),
    .clkInvert3(1'b0),
    .data3(pll1_Data),
    .clk4(1'b0),
    .clkInvert4(1'b0),
    .data4(1'b0),
    .clk5(pnClk),
    .clkInvert5(1'b0),
    .data5(pnBit),
    .clk6(pll2_Clk),
    .clkInvert6(1'b0),
    .data6(pll2_Data),
    .clk7(framer_Clk),
    .clkInvert7(1'b0),
    .data7(framer_Data),
    .outputClk(bsDiffClkOut),
    .outputData(bsDiffDataOut)
);

clockAndDataMux encMux(
    .muxSelect(encCoaxMuxSelect),
    .clk0(dll0_Clk),
    .clkInvert0(1'b0),
    .data0(dll0_Data),
    .clk1(pll0_Clk),
    .clkInvert1(1'b0),
    .data1(pll0_Data),
    .clk2(dll1_Clk),
    .clkInvert2(1'b0),
    .data2(dll1_Data),
    .clk3(pll1_Clk),
    .clkInvert3(1'b0),
    .data3(pll1_Data),
    .clk4(1'b0),
    .clkInvert4(1'b0),
    .data4(1'b0),
    .clk5(pnClk),
    .clkInvert5(1'b0),
    .data5(pnBit),
    .clk6(pll2_Clk),
    .clkInvert6(1'b0),
    .data6(pll2_Data),
    .clk7(framer_Clk),
    .clkInvert7(1'b0),
    .data7(framer_Data),
    .outputClk(encClkOut),
    .outputData(encDataOut)
);

clockAndDataMux fsMux(
    .muxSelect(fsMuxSelect),
    .clk0(dll0_Clk),
    .clkInvert0(1'b0),
    .data0(dll0_Data),
    .clk1(pll0_Clk),
    .clkInvert1(1'b0),
    .data1(pll0_Data),
    .clk2(dll1_Clk),
    .clkInvert2(1'b0),
    .data2(dll1_Data),
    .clk3(pll1_Clk),
    .clkInvert3(1'b0),
    .data3(pll1_Data),
    .clk4(1'b0),
    .clkInvert4(1'b0),
    .data4(1'b0),
    .clk5(pnClk),
    .clkInvert5(1'b0),
    .data5(pnBit),
    .clk6(pll2_Clk),
    .clkInvert6(1'b0),
    .data6(pll2_Data),
    .clk7(framer_Clk),
    .clkInvert7(1'b0),
    .data7(framer_Data),
    .outputClk(fsClkOut),
    .outputData(fsDataOut)
);

clockAndDataMux fsDiffMux(
    .muxSelect(fsRS422MuxSelect),
    .clk0(dll0_Clk),
    .clkInvert0(1'b0),
    .data0(dll0_Data),
    .clk1(pll0_Clk),
    .clkInvert1(1'b0),
    .data1(pll0_Data),
    .clk2(dll1_Clk),
    .clkInvert2(1'b0),
    .data2(dll1_Data),
    .clk3(pll1_Clk),
    .clkInvert3(1'b0),
    .data3(pll1_Data),
    .clk4(1'b0),
    .clkInvert4(1'b0),
    .data4(1'b0),
    .clk5(pnClk),
    .clkInvert5(1'b0),
    .data5(pnBit),
    .clk6(pll2_Clk),
    .clkInvert6(1'b0),
    .data6(pll2_Data),
    .clk7(framer_Clk),
    .clkInvert7(1'b0),
    .data7(framer_Data),
    .outputClk(fsDiffClkOut),
    .outputData(fsDiffDataOut)
);

clockAndDataMux spareMux(
    .muxSelect(spareMuxSelect),
    .clk0(dll0_Clk),
    .clkInvert0(1'b0),
    .data0(dll0_Data),
    .clk1(pll0_Clk),
    .clkInvert1(1'b0),
    .data1(pll0_Data),
    .clk2(dll1_Clk),
    .clkInvert2(1'b0),
    .data2(dll1_Data),
    .clk3(pll1_Clk),
    .clkInvert3(1'b0),
    .data3(pll1_Data),
    .clk4(1'b0),
    .clkInvert4(1'b0),
    .data4(1'b0),
    .clk5(pnClk),
    .clkInvert5(1'b0),
    .data5(pnBit),
    .clk6(pll2_Clk),
    .clkInvert6(1'b0),
    .data6(pll2_Data),
    .clk7(framer_Clk),
    .clkInvert7(1'b0),
    .data7(framer_Data),
    .outputClk(spareClock),
    .outputData(spareData)
);

assign ch0Lockn = !ch0Lock;
assign ch1Lockn = !ch1Lock;

//******************************************************************************
//                           Processor Read Data Mux
//******************************************************************************
reg [15:0] rd_mux;
always @* begin
    casex(addr)
        `ifdef ADD_MSE
        `DMSE_SPACE: begin
            if (addr[1]) begin
                rd_mux = mseDout[31:16];
            end
            else begin
                rd_mux = mseDout[15:0];
            end
        end
        `endif
        `ifdef ADD_TURBO
        `TURBOSPACE: begin
            if (addr[1]) begin
                rd_mux = turboDout[31:16];
            end
            else begin
                rd_mux = turboDout[15:0];
            end
        end
        `endif
        `BERT_SPACE: begin
            if (addr[1]) begin
                rd_mux = bertDout[31:16];
            end
            else begin
                rd_mux = bertDout[15:0];
            end
        end
        `PNGEN_SPACE: begin
            if (addr[1]) begin
                rd_mux = pngenDout[31:16];
            end
            else begin
                rd_mux = pngenDout[15:0];
            end
        end
        `FRAMER_SPACE: begin
            if (addr[1]) begin
                rd_mux = framerDout[31:16];
            end
            else begin
                rd_mux = framerDout[15:0];
            end
        end
        `BITSYNC_TOP_SPACE,
        `VITERBISPACE,
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
        `ifdef USE_DEMOD_CandD
        `CandD0SPACE: begin
            if (addr[1]) begin
                rd_mux = cAndD0Dout[31:16];
            end
            else begin
                rd_mux = cAndD0Dout[15:0];
            end
        end
        `CandD1SPACE: begin
            if (addr[1]) begin
                rd_mux = cAndD1Dout[31:16];
            end
            else begin
                rd_mux = cAndD1Dout[15:0];
            end
        end
        `CandD2SPACE: begin
            if (addr[1]) begin
                rd_mux = cAndD2Dout[31:16];
            end
            else begin
                rd_mux = cAndD2Dout[15:0];
            end
        end
        `PLL0SPACE,
        `PLL1SPACE,
        `PLL2SPACE: begin
            if (addr[1]) begin
                rd_mux = pllDout[31:16];
                end
            else begin
                rd_mux = pllDout[15:0];
                end
            end

        `else //USE_DEMOD_CandD

        `DLL0SPACE: begin
            if (addr[1]) begin
                rd_mux = dll0Dout[31:16];
                end
            else begin
                rd_mux = dll0Dout[15:0];
                end
            end
        `DLL1SPACE: begin
            if (addr[1]) begin
                rd_mux = dll1Dout[31:16];
                end
            else begin
                rd_mux = dll1Dout[15:0];
                end
            end
        `PLLSPACE: begin
            if (addr[1]) begin
                rd_mux = pllDout[31:16];
                end
            else begin
                rd_mux = pllDout[15:0];
                end
            end

        `endif //USE_DEMOD_CandD

        `DUAL_DECODERSPACE: begin
            if (addr[1]) begin
                rd_mux = dualDecDout[31:16];
                end
            else begin
                rd_mux = dualDecDout[15:0];
                end
            end
        `CH1_DECODERSPACE: begin
            if (addr[1]) begin
                rd_mux = ch1DecDout[31:16];
                end
            else begin
                rd_mux = ch1DecDout[15:0];
                end
            end
         default : rd_mux = 16'hxxxx;
        endcase
     end

assign fb_data = (cs & rd) ? rd_mux : 16'hzzzz;


endmodule

