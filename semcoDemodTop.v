`timescale 1ns/100ps
`include "addressMap.v"

module semcoDemodTop (

    `ifdef TRIPLE_DEMOD

    input               spiClk,
    input               spiCSn,
    input               spiDataIn,
    inout               spiDataOut,

    `else   //TRIPLE_DEMOD

    // Flexbus connections
    input               fbClk,
    input               fb_ale,
    input               fb_csn,
    input               fb_oen,
    input               fb_wrn,
    input       [15:0]  fb_addr,
    inout       [15:0]  fb_data,

    `endif //TRIPLE_DEMOD

    // ADC Inputs
    input       [13:0]  adc0,
    input               adc0_overflow,
    output              adc01_powerDown,
    `ifdef TRIPLE_DEMOD
    input               adc0Clock,
    `else // TRIPLE_DEMOD
    input               sysClk,
    `endif // TRIPLE_DEMOD

    // DAC configuration interface
    output              dac_rst,
    output              dac_sclk,
    output              dac_sdio,
    output              dac0_nCs,
    output              dac1_nCs,
    `ifndef TRIPLE_DEMOD
    output              dac2_nCs,
    `endif

    // DAC datapath interface
    output              dac0_clk,
    output  reg [13:0]  dac0_d,
    output              dac1_clk,
    output  reg [13:0]  dac1_d,
    `ifndef TRIPLE_DEMOD
    output              dac2_clk,
    output  reg [13:0]  dac2_d,
    `endif

    // Clock and data outputs
    output              ch0ClkOut,ch0DataOut,
    output              ch1ClkOut,ch1DataOut,

    // Lock indicators
    output              lockLed0n, lockLed1n,

    // SDI Output
    output              sdiOut,
    `ifdef TRIPLE_DEMOD

    // PLL Interface Signals
    output              pll0_REF,
    input               pll0_OUT1,
    output              pll1_REF,
    input               pll1_OUT1,

    // AM ADC Interface
    input               amAdcDataIn,
    output              amAdcClk,
    output              amAdcCSn,

    // AM DAC Interface
    output              amDacDataOut,
    output              amDacClk,
    output              amDacCSn,

    // Video Switch SPI Interface
    output              switch0SpiClk,
    output              switch0SpiDout,
    output              switch0SpiCS0n,
    output              switch0SpiCS1n,
    output              switch1SpiClk,
    output              switch1SpiDout,
    output              switch1SpiCS0n,
    output              switch1SpiCS1n

    `else   //TRIPLE_DEMOD

    // PLL Interface Signals
    output              pll_SCK,
    output              pll_SDI,
    output              pll0_CS,
    output              pll0_REF,
    input               pll0_OUT1,
    output              pll0_PWDn,
    output              pll1_CS,
    output              pll1_REF,
    input               pll1_OUT1,
    output              pll1_PWDn,
    output              pll2_CS,
    output              pll2_REF,
    input               pll2_OUT1,
    output              pll2_PWDn

    `endif //TRIPLE_DEMOD

);

    parameter VER_NUMBER = 16'd454;


//******************************************************************************
//                          Clock Distribution
//******************************************************************************
    `ifdef TRIPLE_DEMOD
    systemClock systemClock (
        .clk_in1(adc0Clock),
        .clk_out1(clk),
        .locked(clkLocked)
     );

    BUFG spiBufg(
        .I(spiClk),
    //    .O(spiBufgClk)
        .O(busClk)
    );
    //spiBusClock spiBusClock (
    //    .clk_in1(spiBufgClk),
    //    .clk_out1(busClk),
    //    .locked(spiClkLocked)
    //);

    `else //TRIPLE_DEMOD
    systemClock systemClock (
        .clk_in1(sysClk),
        .clk_out1(clk),
        .locked(clkLocked)
     );

    flexbusClock flexbusClock (
        .clk_in1(fbClk),
        .clk_out1(busClk),
        .locked(fbClkLocked)
    );
    `endif //TRIPLE_DEMOD



    `ifdef TRIPLE_DEMOD
    /******************************************************************************
                                 SPI Config Interface
    ******************************************************************************/
    wire    [12:0]  addr;
    wire    [31:0]  dataIn;
    reg     [31:0]  rd_mux;
    spiBusInterface spi(
        .clk(clk),
        .reset(reset),
        .spiClk(busClk),
        .spiCS(!spiCSn),
        .spiDataIn(spiDataIn),
        .spiDataOut(spiOut),
        .spiDataOE(spiDataOE),
        .cs(cs),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(rd_mux)
    );
    assign spiDataOut = spiDataOE ? spiOut : 1'bz;

    `else //TRIPLE_DEMOD

    /******************************************************************************
                                 Bus Interface
    ******************************************************************************/
    wire    [12:0]  addr;
    wire    [31:0]  dataIn;
    flexbus flexbus(
        .fb_clk(busClk),
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

    `endif //TRIPLE_DEMOD

//******************************************************************************
//                           Reclock ADC Inputs
//******************************************************************************
    reg             [13:0]  adc0Reg;
    reg     signed  [17:0]  adc0In;
    always @(posedge clk) begin
        adc0Reg <= adc0;
        adc0In <= $signed({~adc0Reg[13],adc0Reg[12:0],4'b0});
    end



//******************************************************************************
//                             Top Level Registers
//******************************************************************************

    reg semcoTopSpace;
    always @* begin
        casex(addr)
            `SEMCO_TOP_SPACE:       semcoTopSpace = 1;
            default:                semcoTopSpace = 0;
        endcase
    end

    wire    [23:0]  boot_addr;
    wire    [2:0]   dac0InputSelect;
    wire    [2:0]   dac1InputSelect;
    wire    [2:0]   dac2InputSelect;
    wire    [3:0]   ch0MuxSelect;
    wire    [3:0]   ch1MuxSelect;
    wire    [31:0]  semcoTopDout;
    semcoTopRegs topRegs(
        .busClk(busClk),
        .cs(semcoTopSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(semcoTopDout),
        .clk(clk),
        .versionNumber(VER_NUMBER),
        .reset(reset),
        .reboot(reboot),
        .rebootAddress(boot_addr),
        .dac0InputSelect(dac0InputSelect),
        .dac1InputSelect(dac1InputSelect),
        .dac2InputSelect(dac2InputSelect),
        .ch0MuxSelect(),
        .ch1MuxSelect()
    );


//******************************************************************************
//                          Legacy Demod
//******************************************************************************

    wire    signed  [17:0]  iDemodSymData;
    wire    signed  [17:0]  qDemodSymData;
    wire    signed  [17:0]  iTrellis,qTrellis;
    wire    signed  [3:0]   demodDac0Select,demodDac1Select,demodDac2Select;
    wire    signed  [17:0]  demodDac0Data,demodDac1Data,demodDac2Data;
    wire    signed  [4:0]   demodMode;
    wire asyncMode = ( (demodMode == `MODE_AQPSK)
                    || (demodMode == `MODE_AUQPSK)
                    );
    wire    signed  [17:0]  iDemodEye,qDemodEye;
    wire            [4:0]   demodEyeOffset;
    wire            [31:0]  demodDout;
    demod demod(
        .clk(clk), .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(demodDout),
        .iRx(adc0In), .qRx(18'h0),
        .bbClkEn(1'b0),
        .iBB(18'h0), .qBB(18'h0),
        .iSym2xEn(iDemodSym2xEn),
        .iSymEn(iDemodSymEn),
        .iSymData(iDemodSymData),
        .iSymClk(iDemodSymClk),
        .iBit(iDemodBit),
        .qSym2xEn(qDemodSym2xEn),
        .qSymEn(qDemodSymEn),
        .qSymClk(qDemodSymClk),
        .qSymData(qDemodSymData),
        .qBit(qDemodBit),
        .auSymClk(auDemodSymClk),
        .auBit(auDemodBit),
        .timingLock(demodTimingLock),
        .carrierLock(demodCarrierLock),
        .trellisSymEn(trellisSymEn),
        .iTrellis(iTrellis),
        .qTrellis(qTrellis),
        `ifdef ADD_SUPERBAUD_TED
        .multihSymEnEven(trellisSymEnEven),
        `endif
        .dac0Select(demodDac0Select),
        .dac1Select(demodDac1Select),
        .dac2Select(demodDac2Select),
        .dac0Sync(demodDac0ClkEn),
        .dac0Data(demodDac0Data),
        .dac1Sync(demodDac1ClkEn),
        .dac1Data(demodDac1Data),
        .dac2Sync(demodDac2ClkEn),
        .dac2Data(demodDac2Data),
        .demodMode(demodMode),
        `ifdef ADD_SCPATH
        output                  enableScPath,
        output  signed  [17:0]  iBBOut, qBBOut,
        output                  bbClkEnOut,
        `endif
        `ifdef ADD_DESPREADER
        output                  iEpoch,qEpoch,
        `endif
        .sdiSymEn(demodSdiSymEn),
        .eyeSync(demodEyeClkEn),
        .iEye(iDemodEye),   .qEye(qDemodEye),
        .eyeOffset(demodEyeOffset)
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

    reg                 dualCh0Input;
    reg                 dualCh1Input;
    reg                 dualSymEn;
    reg                 dualSym2xEn;
    reg                 dualSymClk;
    always @(posedge clk) begin
        dualCh0Input <= iDemodBit;
        dualCh1Input <= qDemodBit;
        dualSymEn <= iDemodSymEn;
        dualSym2xEn <= iDemodSym2xEn;
        dualSymClk <= iDemodSymClk;
    end

    wire    [31:0]  dualDecDout;
    decoder dualDecoder
    (
        .clk(clk),
        .rs(reset),
        .en(dualDecoderSpace),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
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
        .fifo_rs(),
        .clkPhase(),
        .bypass_fifo(),
        .symb_clk(dualPcmSymClk),
        .inputSelect(dualDecInputSelect)
    );

    reg ch1DecoderSpace;
    always @* begin
        casex(addr)
            `CH1_DECODERSPACE:      ch1DecoderSpace = 1;
            default:                ch1DecoderSpace = 0;
        endcase
    end

    reg                 ch1DecInput;
    reg                 ch1DecSymEn;
    reg                 ch1DecSym2xEn;
    reg                 ch1DecSymClk;
    always @(posedge clk) begin
        ch1DecInput <= qDemodBit;
        ch1DecSymEn <= qDemodSymEn;
        ch1DecSym2xEn <= qDemodSym2xEn;
        ch1DecSymClk <= qDemodSymClk;
    end


    wire    [31:0]  ch1DecDout;
    pcmDecoder dec1 (
        .clk(clk),
        .rs(reset),
        .busClk(busClk),
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
        .fifo_rs(),
        .clkPhase(),
        .bypass_fifo(),
        .symb_clk(ch1PcmSymClk),
        .inputSelect(ch1DecInputSelect)
    );



//******************************************************************************
//                       Clock/Data Jitter Reduction
//******************************************************************************

    `ifdef TRIPLE_DEMOD


    `else //TRIPLE_DEMOD

    // SPI interface to the PLLs
    wire    [31:0]  pllDout;
    ics307Interface #(.SysclkDivider(4)) pllIntfc (
        .reset(reset),
        .busClk(busClk),
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
        .pll2Reset(pll2Reset)
    );

    `endif //TRIPLE_DEMOD

    //----------------------- Channel 0 Jitter Attenuation --------------------

    wire    [3:0]   cAndD0SourceSelect;
    reg             cAndD0ClkEn;
    reg     [2:0]   cAndD0DataIn;
    always @* begin
        casex (cAndD0SourceSelect)
            `CandD_SRC_LEGACY_I: begin
                cAndD0ClkEn = iDemodSymEn;
                cAndD0DataIn = {iDemodBit,qDemodBit,1'b0};
            end
            `CandD_SRC_LEGACY_Q: begin
                cAndD0ClkEn = qDemodSymEn;
                cAndD0DataIn = {qDemodBit,1'b0,1'b0};
            end
            //`CandD_SRC_PCMTRELLIS:
            //`CandD_SRC_MULTIH:
            //`CandD_SRC_STC:
            //`CandD_SRC_PNGEN:
            `CandD_SRC_DEC0_CH0: begin
                cAndD0ClkEn = dualPcmClkEn;
                cAndD0DataIn = {dualDataI,dualDataQ,1'b0};
            end
            `CandD_SRC_DEC0_CH1: begin
                cAndD0ClkEn = ch1PcmClkEn;
                cAndD0DataIn = {ch1PcmData,1'b0,1'b0};
            end
            //`CandD_SRC_DEC1_CH0: begin
            //    cAndD0ClkEn = ch1PcmClkEn;
            //    cAndD0DataIn = {dualDataQ,dualDataI,1'b0};
            //end
            //`CandD_SRC_DEC1_CH1:
            //`CandD_SRC_DEC2_CH0:
            //`CandD_SRC_DEC2_CH1:
            //`CandD_SRC_DEC3_CH0:
            //`CandD_SRC_DEC3_CH1:
            default:   begin
                cAndD0ClkEn = iDemodSymEn;
                cAndD0DataIn = {iDemodBit,qDemodBit,1'b0};
            end
        endcase
    end

    wire    [2:0]   cAndD0DataOut;
    wire    [31:0]  cAndD0Dout;
    clkAndDataOutput #(.RegSpace(`CandD0SPACE)) cAndD0 (
        .clk(clk), .reset(reset),
        .busClk(busClk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(cAndD0Dout),
        .clkEnIn(cAndD0ClkEn),
        .dataIn(cAndD0DataIn),
        .pllOutputClk(pll0_OUT1),
        .sourceSelect(cAndD0SourceSelect),
        .pllReferenceClk(pll0_REF),
        .outputClk(ch0ClkOut),
        .outputData(cAndD0DataOut)
    );
    assign ch0DataOut = cAndD0DataOut[2];

    //----------------------- Channel 1 Jitter Attenuation --------------------

    wire    [3:0]   cAndD1SourceSelect;
    reg             cAndD1ClkEn;
    reg     [2:0]   cAndD1DataIn;
    always @* begin
        casex (cAndD1SourceSelect)
            `CandD_SRC_LEGACY_I: begin
                cAndD1ClkEn = iDemodSymEn;
                cAndD1DataIn = {iDemodBit,qDemodBit,1'b0};
            end
            `CandD_SRC_LEGACY_Q: begin
                cAndD1ClkEn = qDemodSymEn;
                cAndD1DataIn = {qDemodBit,1'b0,1'b0};
            end
            //`CandD_SRC_PCMTRELLIS:
            //`CandD_SRC_MULTIH:
            //`CandD_SRC_STC:
            //`CandD_SRC_PNGEN:
            `CandD_SRC_DEC0_CH0: begin
                cAndD1ClkEn = dualPcmClkEn;
                cAndD1DataIn = {dualDataI,dualDataQ,1'b0};
            end
            `CandD_SRC_DEC0_CH1: begin
                cAndD1ClkEn = ch1PcmClkEn;
                cAndD1DataIn = {ch1PcmData,1'b0,1'b0};
            end
            //`CandD_SRC_DEC1_CH0: begin
            //    cAndD1ClkEn = ch1PcmClkEn;
            //    cAndD1DataIn = {dualDataQ,dualDataI,1'b0};
            //end
            //`CandD_SRC_DEC1_CH1:
            //`CandD_SRC_DEC2_CH0:
            //`CandD_SRC_DEC2_CH1:
            //`CandD_SRC_DEC3_CH0:
            //`CandD_SRC_DEC3_CH1:
            default:   begin
                cAndD1ClkEn = iDemodSymEn;
                cAndD1DataIn = {iDemodBit,qDemodBit,1'b0};
            end
        endcase
    end

    wire    [2:0]   cAndD1DataOut;
    wire    [31:0]  cAndD1Dout;
    clkAndDataOutput #(.RegSpace(`CandD1SPACE)) cAndD1 (
        .clk(clk), .reset(reset),
        .busClk(busClk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(cAndD1Dout),
        .clkEnIn(cAndD1ClkEn),
        .dataIn(cAndD1DataIn),
        .pllOutputClk(pll1_OUT1),
        .sourceSelect(cAndD1SourceSelect),
        .pllReferenceClk(pll1_REF),
        .outputClk(ch1ClkOut),
        .outputData(cAndD1DataOut)
    );
    assign ch1DataOut = cAndD1DataOut[2];

    assign          pll2_REF = 1'b0;
    assign          pll2_Data = 1'b0;
    assign          pll2_Clk = 1'b0;



//******************************************************************************
//                              Interpolators
//******************************************************************************
    reg     [17:0]  interp0DataIn;
    reg             interp0ClkEn;
    wire    [3:0]   dac0Source;
    always @(posedge clk) begin
        case (dac0Source)
            `DAC_SRC_DEMOD: begin
                interp0DataIn <= demodDac0Data;
                interp0ClkEn <= demodDac0ClkEn;
            end
            default: begin
                interp0DataIn <= demodDac0Data;
                interp0ClkEn <= demodDac0ClkEn;
            end
        endcase
    end
    wire    [31:0]  interp0Dout;
    wire    [17:0]  interp0DataOut;
    interpolate #(.RegSpace(`INTERP0SPACE), .FirRegSpace(`VIDFIR0SPACE)) dac0Interp(
        .clk(clk), .reset(reset), .clkEn(interp0ClkEn),
        .busClk(busClk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp0Dout),
        .dataIn(interp0DataIn),
        .dacSource(dac0Source),
        .clkEnOut(),
        .dataOut(interp0DataOut)
        );
    //`define TEST_DACS
    `ifdef TEST_DACS
    always @(posedge clk) begin
        //dac0_d <= adc0Reg;
        dac0_d[12:0] <= interp0DataIn[16:4];
        dac0_d[13] <= ~interp0DataIn[17];
    end
    `else
    always @(posedge clk) begin
        dac0_d[12:0] <= interp0DataOut[16:4];
        dac0_d[13] <= ~interp0DataOut[17];
    end
    `endif

    reg     [17:0]  interp1DataIn;
    reg             interp1ClkEn;
    wire    [3:0]   dac1Source;
    always @(posedge clk) begin
        case (dac1Source)
            `DAC_SRC_DEMOD: begin
                interp1DataIn <= demodDac1Data;
                interp1ClkEn <= demodDac1ClkEn;
            end
            default: begin
                interp1DataIn <= demodDac1Data;
                interp1ClkEn <= demodDac1ClkEn;
            end
        endcase
    end
    wire    [31:0]  interp1Dout;
    wire    [17:0]  interp1DataOut;
    interpolate #(.RegSpace(`INTERP1SPACE), .FirRegSpace(`VIDFIR1SPACE)) dac1Interp(
        .clk(clk), .reset(reset), .clkEn(interp1ClkEn),
        .busClk(busClk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp1Dout),
        .dataIn(interp1DataIn),
        .dacSource(dac1Source),
        .clkEnOut(),
        .dataOut(interp1DataOut)
        );
    `ifdef TEST_DACS
    always @(posedge clk) begin
        //dac1_d <= adc0Reg;
        dac1_d[12:0] <= interp0DataIn[16:4];
        dac1_d[13] <= ~interp0DataIn[17];
    end
    `else
    always @(posedge clk) begin
        dac1_d[12:0] <= interp1DataOut[16:4];
        dac1_d[13] <= ~interp1DataOut[17];
    end
    `endif

    `ifndef TRIPLE_DEMOD
    reg     [17:0]  interp2DataIn;
    reg             interp2ClkEn;
    wire    [3:0]   dac2Source;
    always @(posedge clk) begin
        case (dac1Source)
            `DAC_SRC_DEMOD: begin
                interp2DataIn <= demodDac2Data;
                interp2ClkEn <= demodDac2ClkEn;
            end
            default: begin
                interp2DataIn <= demodDac2Data;
                interp2ClkEn <= demodDac2ClkEn;
            end
        endcase
    end
    wire    [31:0]  interp2Dout;
    wire    [17:0]  interp2DataOut;
    interpolate #(.RegSpace(`INTERP2SPACE), .FirRegSpace(`VIDFIR2SPACE)) dac2Interp(
        .clk(clk), .reset(reset), .clkEn(interp2ClkEn),
        .busClk(busClk),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(interp2Dout),
        .dataIn(interp2DataIn),
        .dacSource(dac2Source),
        .clkEnOut(),
        .dataOut(interp2DataOut)
        );
    `ifdef TEST_DACS
    always @(posedge clk) begin
        //dac2_d <= adc0Reg;
        dac2_d[12:0] <= interp2DataIn[16:4];
        dac2_d[13] <= ~interp2DataIn[17];
    end
    `else
    always @(posedge clk) begin
        dac2_d[12:0] <= interp2DataOut[16:4];
        dac2_d[13] <= ~interp2DataOut[17];
    end
    `endif  //TEST_DACS

    `endif //not TRIPLE_DEMOD


    assign dac0_clk = clk;
    assign dac1_clk = clk;
    `ifndef TRIPLE_DEMOD
    assign dac2_clk = clk;
    `endif

//******************************************************************************
//                        SDI Output Interface
//******************************************************************************

wire    [31:0]  sdiDout;
sdi sdi(
    .clk(clk),
    .reset(reset),
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr),
    .dataIn(dataIn),
    .dataOut(sdiDout),
    .iSymEn(iDemodSymEn),
    .iSymData(iTrellis),
    .qSymEn(qDemodSymEn),
    .qSymData(qTrellis),
    .eyeSync(demodEyeClkEn),
    .iEye(iDemodEye),.qEye(qDemodEye),
    .eyeOffset(demodEyeOffset),
    .bitsyncLock(demodTimingLock), .demodLock(demodCarrierLock),
    `ifdef ADD_DESPREADER
    .iEpoch(iEpoch), .qEpoch(qEpoch),
    `endif
    .sdiOut(sdiOut)
    );

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

    assign lockLed0n = !demodTimingLock;
    assign lockLed1n = !demodCarrierLock;

    `ifdef TRIPLE_DEMOD

    //******************************************************************************
    //                           AM ADC Interface
    //******************************************************************************
    wire    signed  [11:0]  amDataIn;
    ad7476Interface amAdc(
        .clk(clk),
        .reset(reset),
        .spiDin(amAdcDataIn),
        .spiClk(amAdcClk),
        .spiCSn(amAdcCSn),
        .adcData(amDataIn),
        .adcDataEn(amDataEn)
    );

    //******************************************************************************
    //                           AM DAC Interface
    //******************************************************************************
    max5352Interface amDac(
        .clk(clk),
        .reset(reset),
        .dacDataEn(amDataEn),
        .dacData(amDataIn),
        .spiDout(amDacDataOut),
        .spiClk(amDacClk),
        .spiCSn(amDacCSn)
    );

    //******************************************************************************
    //                          Video Switch Interface
    //******************************************************************************
    wire    [31:0]  vidSwitchDout;
    videoFilterSwitch #(.SysclkDivider(32)) vidSwitch (
        .clk(clk),
        .reset(reset),
        .busClk(busClk),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(vidSwitchDout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .sclk(switchSpiClk),
        .sdo(switchSpiDout),
        .cs0(sw0Cs),
        .cs1(sw1Cs)
    );
    assign switch0SpiClk =  switchSpiClk;
    assign switch0SpiDout = switchSpiDout;
    assign switch0SpiCS0n = !sw0Cs;
    assign switch0SpiCS1n = !sw1Cs;
    assign switch1SpiClk =  switchSpiClk;
    assign switch1SpiDout = switchSpiDout;
    assign switch1SpiCS0n = !sw0Cs;
    assign switch1SpiCS1n = !sw1Cs;


    `endif //TRIPLE_DEMOD


    `ifdef TRIPLE_DEMOD

    //******************************************************************************
    //                           Processor Read Data Mux
    //******************************************************************************
    always @* begin
        casex(addr)
            `SEMCO_TOP_SPACE:   rd_mux = semcoTopDout;

            `DEMODSPACE,
            `ifdef ADD_DESPREADER
            `DESPREADSPACE,
            `endif
            `DDCSPACE,
            `DDCFIRSPACE,
            `CICDECSPACE,
            `BITSYNCSPACE,
            `BITSYNCAUSPACE,
            `RESAMPSPACE,
            `CARRIERSPACE,
            `CHAGCSPACE :       rd_mux = demodDout;

            `ifdef ADD_SCPATH
            `SCDDCSPACE,
            `SCDDCFIRSPACE,
            `SCCICDECSPACE,
            `SCAGCSPACE,
            `SCCARRIERSPACE:    rd_mux = scPathDout;
            end
            `endif

            `VIDFIR0SPACE,
            `INTERP0SPACE:      rd_mux = interp0Dout;

            `VIDFIR1SPACE,
            `INTERP1SPACE:      rd_mux = interp1Dout;

            `DLL0SPACE:         rd_mux = dll0Dout;
            `DLL1SPACE:         rd_mux = dll1Dout;

            `DUAL_DECODERSPACE: rd_mux = dualDecDout;

            `CH1_DECODERSPACE:  rd_mux = ch1DecDout;

            `CandD0SPACE:       rd_mux = clkAndData0Dout;
            `CandD1SPACE:       rd_mux = clkAndData1Dout;

            `VIDSWITCHSPACE:    rd_mux = vidSwitchDout;

             default :          rd_mux = 16'hxxxx;
        endcase
    end

    `else //TRIPLE_DEMOD

    //******************************************************************************
    //                           Processor Read Data Mux
    //******************************************************************************
    reg [15:0] rd_mux;
    always @* begin
        casex(addr)
            `SEMCO_TOP_SPACE:   begin
                if (addr[1]) begin
                    rd_mux = semcoTopDout[31:16];
                end
                else begin
                    rd_mux = semcoTopDout[15:0];
                end
            end
            `DEMODSPACE,
            `ifdef ADD_DESPREADER
            `DESPREADSPACE,
            `endif
            `DDCSPACE,
            `DDCFIRSPACE,
            `CICDECSPACE,
            `BITSYNCSPACE,
            `BITSYNCAUSPACE,
            `RESAMPSPACE,
            `CARRIERSPACE,
            `CHAGCSPACE : begin
                if (addr[1]) begin
                    rd_mux = demodDout[31:16];
                end
                else begin
                    rd_mux = demodDout[15:0];
                end
            end
            `UARTSPACE,
            `SDISPACE: begin
                if (addr[1]) begin
                    rd_mux = sdiDout[31:16];
                end
                else begin
                    rd_mux = sdiDout[15:0];
                end
            end
            `ifdef ADD_SCPATH
            `SCDDCSPACE,
            `SCDDCFIRSPACE,
            `SCCICDECSPACE,
            `SCAGCSPACE,
            `SCCARRIERSPACE: begin
                if (addr[1]) begin
                    rd_mux = scPathDout[31:16];
                end
                else begin
                    rd_mux = scPathDout[15:0];
                end
            end
            `endif
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

    `endif //TRIPLE_DEMOD

endmodule

