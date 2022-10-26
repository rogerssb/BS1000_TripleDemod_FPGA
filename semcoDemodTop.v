`timescale 1ns/100ps
`include "addressMap.v"

module semcoDemodTop (

    `ifdef R6100

    input               spiClk,
    input               spiCSn,
    input               spiDataIn,
    inout               spiDataOut,

    `else   //R6100

    // Flexbus connections
    input               fbClk,
    input               fb_ale,
    input               fb_csn,
    input               fb_oen,
    input               fb_wrn,
    input       [15:0]  fb_addr,
    inout       [15:0]  fb_data,

    `endif //R6100

    // ADC Inputs
    input       [13:0]  adc0,
    input               adc0_overflow,
    output              adc01_powerDown,
    `ifdef R6100
    input               adc0Clk,
    `else // R6100
    input               sysClk,
    `endif // R6100

    // DAC configuration interface
    output              dac_rst,
    output              dac_sclk,
    output              dac_sdio,
    output              dac0_nCs,
    output              dac1_nCs,
    `ifndef R6100
    output              dac2_nCs,
    `endif

    // DAC datapath interface
    output              dac0_clk,
    output  reg [13:0]  dac0_d,
    output              dac1_clk,
    output  reg [13:0]  dac1_d,
    `ifndef R6100
    output              dac2_clk,
    output  reg [13:0]  dac2_d,
    `endif

    // Clock and data outputs
    output              ch0ClkOut,ch0DataOut,
    output              ch1ClkOut,ch1DataOut,
    output              ch2ClkOut,ch2DataOut,
    output              ch3ClkOut,ch3DataOut,

    `ifdef R6100

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

    // Video Switch Select Lines
    output      [1:0]   video0InSelect,
    output reg  [1:0]   video0OutSelect,
    output      [1:0]   video1InSelect,
    output reg  [1:0]   video1OutSelect,

    `else   //R6100

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
    output              pll2_PWDn,

    `endif //R6100

    `ifdef ADD_SPI_GATEWAY
    //output              spiFlashCK, //Output through the STARTUPE2 primitive
    output              spiFlashCSn,
    output              spiFlashMOSI,
    input               spiFlashMISO,
    `endif

    // Lock indicators
    output              lockLed0n, lockLed1n,


    `ifdef R6100

    `ifdef ADD_BITSYNC
    // Bitsync ADC
    input       [13:0]  bsAdc,
    input               bsAdc_overflow,
    output              bsAdc_powerDown,

    // Input Impedance and Topology controls
    output              bsHighImpedance,
    output              bsSingleEnded,

    // Gain and Offset DAC interfaces
    output              bsDacSELn,
    output              bsDacSCLK, bsDacMOSI,
    `endif  //ADD_BITSYNC

    `ifdef DQM_USE_CHIP_TO_CHIP
    input       [1:0]   demodSlot,

    output  reg         toNext_CLK,
    output  reg         toNext_FS,
    output  reg         toNext_DATA,

    input               fromNext_CLK,
    input               fromNext_FS,
    input               fromNext_DATA,

    input               fromPrev_CLK,
    input               fromPrev_FS,
    input               fromPrev_DATA,

    output  reg         toPrev_CLK,
    output  reg         toPrev_FS,
    output  reg         toPrev_DATA,
    `endif //DQM_USE_CHIP_TO_CHIP


    // SDI Output
    output              sdiOut,
    output              DQMOut

    `else   //R6100

    // SDI Output
    output              sdiOut

    `endif //R6100

);

    parameter VER_NUMBER = 16'd747;


//******************************************************************************
//                          Clock Distribution
//******************************************************************************
    `ifdef R6100
    systemClock systemClock (
        .clk_in1(adc0Clk),
        .clk_out1(clk),
        .locked(clkLocked)
    );


    `define ADD_FRANKS_KLUDGE
    `ifdef ADD_FRANKS_KLUDGE
    reg spiClk0,spiClk1;
    always @(posedge clk) begin
        spiClk0 <= spiClk;
        spiClk1 <= spiClk0;
    end
    BUFG spiBufg(
        .I(spiClk1),
        .O(busClk)
    );

    `else //ADD_FRANKS_KLUDGE

    BUFG spiBufg(
        .I(spiClk),
        .O(busClk)
    );
    `endif //ADD_FRANKS_KLUDGE

    `else //R6100
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
    `endif //R6100



    `ifdef R6100
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

    `else //R6100

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

    `endif //R6100

    `ifdef ADD_SPI_GATEWAY
    /******************************************************************************
                               SPI Flash Interface
    ******************************************************************************/
    reg spiGatewaySpace;
    always @* begin
        casex(addr)
            `SPIGW_SPACE:   spiGatewaySpace = cs;
            default:        spiGatewaySpace = 0;
        endcase
    end
    wire            [31:0]  spiGatewayDout;
    spiGateway spiGw(
        .clk(clk),
        .reset(reset),
        .busClk(busClk),
        .cs(spiGatewaySpace),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(spiGatewayDout),
        .spiClk(spiFlashCK),
        .spiCS(spiFlashCS),
        .spiDataIn(spiFlashMISO),
        .spiDataOut(spiFlashMOSI)
    );
    assign spiFlashCSn = ~spiFlashCS;

    STARTUPE2 startupe2(
        .CFGCLK(),
        .CFGMCLK(),
        .EOS(),
        .PREQ(),
        .CLK(1'b0),
        .GSR(1'b0),
        .GTS(1'b0),
        .KEYCLEARB(1'b0),
        .PACK(1'b0),
        .USRCCLKO(spiFlashCK),
        .USRCCLKTS(1'b0),
        .USRDONEO(1'b1),
        .USRDONETS(1'b0)
    );
    `endif



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
            `SEMCO_TOP_SPACE:       semcoTopSpace = cs;
            default:                semcoTopSpace = 0;
        endcase
    end

    wire    [31:0]  boot_addr;
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
        .fpgaType(`FPGA_TYPE),
        .reset(reset),
        .reboot(reboot),
        .rebootAddress(boot_addr),
        .dac0InputSelect(),
        .dac1InputSelect(),
        .dac2InputSelect(),
        .ch0MuxSelect(),
        .ch1MuxSelect(),
        .pngenEnable(pngenEnable),
        .framerEnable(framerEnable)
    );

`ifdef ADD_MULTIBOOT
//******************************************************************************
//                           Multiboot Controller
//******************************************************************************

    multibootK7 multiboot(
        .clk(clk),
        .pulse(reboot),
        .addr(boot_addr),
        .reset(reset)
    );

`endif //ADD_MULTIBOOT

//******************************************************************************
//                          Legacy Demod
//******************************************************************************

    reg primaryDemodSpace;
    always @* begin
        casex(addr)
            `PRIDEMODSPACE: primaryDemodSpace = cs;
            default:        primaryDemodSpace = 0;
        endcase
    end

    `ifdef ADD_SUBCARRIER
    wire    signed  [17:0]  iScPath,qScPath;
    `endif
    wire    signed  [17:0]  iDemodSymData;
    wire    signed  [17:0]  qDemodSymData;
    wire    signed  [17:0]  iTrellis,qTrellis;
    wire            [12:0]  mag;
    `ifdef ADD_LDPC
    wire    signed  [17:0]  iLdpc,qLdpc;
    `endif
    wire    signed  [3:0]   demodDac0Select,demodDac1Select,demodDac2Select;
    wire    signed  [17:0]  demodDac0Data,demodDac1Data,demodDac2Data;
    wire            [4:0]   demodMode;
    wire asyncMode = ( (demodMode == `MODE_AQPSK)
                    || (demodMode == `MODE_AUQPSK)
                    );
    wire pcmTrellisMode = (demodMode == `MODE_PCMTRELLIS);
    wire soqTrellisMode = (demodMode == `MODE_SOQPSK);
    wire multihMode = (demodMode == `MODE_MULTIH);
    wire    signed  [17:0]  iDemodEye,qDemodEye;
    wire            [4:0]   demodEyeOffset;
    wire            [31:0]  demodDout;
    demod demod(
        .clk(clk), .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(primaryDemodSpace),
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
        .iBitEn(iDemodBitEn),
        .iBit(iDemodBit),
        .qSym2xEn(qDemodSym2xEn),
        .qSymEn(qDemodSymEn),
        .qSymClk(qDemodSymClk),
        .qSymData(qDemodSymData),
        .qBitEn(qDemodBitEn),
        .qBit(qDemodBit),
        .auSymClk(auDemodSymClk),
        .auBit(auDemodBit),
        .timingLock(demodTimingLock),
        .carrierLock(demodCarrierLock),
        .trellisSymEn(trellisSymEn),
        .iTrellis(iTrellis),
        .qTrellis(qTrellis),
        .legacyBit(legacyBit),
        `ifdef ADD_LDPC
        .iLdpcSymEn(iLdpcSymEn),.qLdpcSymEn(qLdpcSymEn),
        .iLdpc(iLdpc),
        .qLdpc(qLdpc),
        `endif
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
        .mag(mag),
        .magClkEn(magClkEn),
        `ifdef ADD_SUBCARRIER
        .enableScPath(enableScPath),
        .iBBOut(iScPath), .qBBOut(qScPath),
        .bbClkEnOut(scPathClkEn),
        `endif
        `ifdef ADD_DESPREADER
        output                  iEpoch,qEpoch,
        `endif
        .sdiSymEn(demodSdiSymEn),
        .eyeSync(demodEyeClkEn),
        .iEye(iDemodEye),   .qEye(qDemodEye),
        .eyeOffset(demodEyeOffset)
    );

`ifdef ADD_SUBCARRIER
//******************************************************************************
//                           Subcarrier Demod IF Path
//******************************************************************************

    reg scIfpathSpace;
    always @* begin
        casex(addr)
            `SCIFPATHSPACE: scIfpathSpace = cs;
            default:        scIfpathSpace = 0;
        endcase
    end

    wire signed [17:0]  scDemodOut;
    wire        [31:0]  scPathDout;
    scIfPath scIfPath(
        .clk(clk), .reset(reset),
        .busClk(busClk),
        .cs(scIfpathSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(scPathDout),
        .bbClkEn(scPathClkEn),
        .iBB(iScPath), .qBB(qScPath),
        .demodMode(demodMode),
        .scDemodOut(scDemodOut),
        .scClkEn(scClkEn)
    );

    `define ADD_SCINTERP
    `ifdef ADD_SCINTERP
    wire        [31:0]  scInterpDout;
    wire signed [17:0]  scInterpDataOut;
    scInterpolate #(.RegSpace(`SCINTERPSPACE)) scInterp(
        .clk(clk), .reset(reset), .clkEn(scClkEn),
        .busClk(busClk),
        .cs(scIfpathSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(scInterpDout),
        .dataIn(scDemodOut),
        .clkEnOut(),
        .dataOut(scInterpDataOut)
        );
    `endif //ADD_SCINTERP

    reg         [31:0]  scIfPathDout;
    always @* begin
        casex(addr)
            `SCIFPATHSPACE: begin
                casex (addr)
                    `SCINTERPSPACE: begin
                        scIfPathDout = scInterpDout;
                    end
                    default: begin
                        scIfPathDout = scPathDout;
                    end
                endcase
            end
            default: begin
                scIfPathDout = 32'hxxxx;
            end
        endcase
    end
//******************************************************************************
//                         Subcarrier Demod/Bitsync
//******************************************************************************

    reg scDemodSpace;
    always @* begin
        casex(addr)
            `SCDEMODSPACE:  scDemodSpace = cs;
            default:        scDemodSpace = 0;
        endcase
    end

    reg                     scSymEn;
    reg     signed  [17:0]  iScIn,qScIn;
    always @(posedge clk) begin
        scSymEn <= trellisSymEn;
        iScIn <= iTrellis;
        qScIn <= qTrellis;
    end


    wire    [31:0]  scDemodDout;
    wire    [17:0]  sc_dac0Data;
    wire    [17:0]  sc_dac1Data;
    wire    [17:0]  sc_dac2Data;
    wire            sc_iBit;
    wire            sc_iSym2xEn;
    wire            sc_iSymEn;
    wire            sc_qBit;

    scDemod scDemod(
        .clk(clk),
        .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(scDemodSpace),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(scDemodDout),
        .iRx(scInterpDataOut),
        .qRx(18'h0),
        .bbClkEn(scSymEn),
        .iBB(iScIn),
        .qBB(qScIn),
        .dac0Select(),
        .dac1Select(),
        .dac2Select(),
        .dac0Data(sc_dac0Data),
        .dac0Sync(sc_dac0ClkEn),
        .dac1Data(sc_dac1Data),
        .dac1Sync(sc_dac1ClkEn),
        .dac2Data(sc_dac2Data),
        .dac2Sync(sc_dac2ClkEn),
        .iSym2xEn(sc_iSym2xEn),
        .iSymEn(sc_iSymEn),
        .iSymClk(),
        .iSymData(),
        .iBitEn(),
        .iBit(sc_iBit),
        .qSym2xEn(),
        .qSymEn(),
        .qSymClk(),
        .qSymData(),
        .qBitEn(),
        .qBit(sc_qBit),
        .auSymClk(),
        .auBit(),
        .timingLock(),
        .carrierLock(),
        .trellisSymEn(),
        .iTrellis(),
        .qTrellis(),
        .demodMode(),
        .mag(),
        .magClkEn(),
        .enableScPath(),
        .iBBOut(),
        .qBBOut(),
        .bbClkEnOut(),
        .sdiSymEn(),
        .eyeSync(),
        .iEye(),
        .qEye(),
        .eyeOffset()
    );

`endif //ADD_SUBCARRIER


`ifdef ADD_BITSYNC
//******************************************************************************
//                    Standalone Single Channel Bitsync
//******************************************************************************
    reg             [13:0]  bsAdcReg;
    reg     signed  [17:0]  bsAdcIn;
    reg             [1:0]   bsAdcOverflowSR;
    wire                    bsAdcOverflow = bsAdcOverflowSR[1];
    always @(posedge clk) begin
        bsAdcReg <= bsAdc;
        bsAdcIn <= $signed({~bsAdcReg[13],bsAdcReg[12:0],4'b0});
        bsAdcOverflowSR <= {bsAdcOverflowSR[0],bsAdc_overflow};
    end

    wire    signed  [17:0]  sbsSymData;
    wire    signed  [17:0]  sbsDac0Data;
    wire    signed  [17:0]  sbsDac1Data;
    wire    signed  [17:0]  sbsDac2Data;
    wire    signed  [17:0]  sbsInputGain;
    wire    signed  [17:0]  sbsDcOffset;
    wire            [31:0]  sbsDout;
    singleBitsyncTop sbs(
        .clk(clk), .clkEn(1'b1), .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(sbsDout),
        .rx(bsAdcIn),
        .rxSaturated(bsAdcOverflow),
        .rotation(2'b00),
        .lock(sbsLock),
        .sym2xEn(sbsSym2xEn),
        .symEn(sbsSymEn),
        .symData(sbsSymData),
        .symClk(sbsSymClk),
        .bitOutput(sbsBit),
        .dac0ClkEn(sbsDac0ClkEn),
        .dac0Data(sbsDac0Data),
        .dac1ClkEn(sbsDac1ClkEn),
        .dac1Data(sbsDac1Data),
        .dac2ClkEn(sbsDac2ClkEn),
        .dac2Data(sbsDac2Data),
        .highImpedance(bsHighImpedance),
        .singleEnded(bsSingleEnded),
        .gain(sbsInputGain),
        .dcOffset(sbsDcOffset)
    );

    //------------------------- AGC/DC Offset DAC Interfaces -------------------
    mcp48xxInterface dacInterface (
        .clk(clk),
        .clkEn0(sbsSymEn),
        .clkEn1(1'b0),
        .reset(reset),
        .dac0GainSelA(1'b1),
        .dac0GainSelB(1'b1),
        .dac0ValueA(sbsInputGain[17:6]),
        .dac0ValueB(sbsDcOffset[17:6]),
        .dac1GainSelA(1'b0),
        .dac1GainSelB(1'b0),
        .dac1ValueA(12'b0),
        .dac1ValueB(12'b0),
        .SCK(bsDacSCLK),
        .SDI(bsDacMOSI),
        .CS0n(bsDacSELn),
        .CS1n()
    );



`endif //ADD_BITSYNC


`ifdef ADD_VITERBI
/******************************************************************************
                            Viterbi Decoders
******************************************************************************/
/*
    The viterbi was originally used in the bitsync bert card so there's a value
    called bitsyncMode that doesn't exist in the legacy demod. We re-create it
    here from demodMode so we don't have two versions of viterbi to support.
*/

    reg         [1:0]   bitsyncMode;
    always @* begin
        case (demodMode)
            `MODE_QPSK:   bitsyncMode = `BS_MODE_DUAL_CH;
            `MODE_OQPSK:  bitsyncMode = `BS_MODE_OFFSET_CH;
            default:      bitsyncMode = `BS_MODE_IND_CH;
        endcase
    end

    wire    [31:0]  vitDout;
    wire    [4:0]   viterbiMode;
    viterbi viterbi(
        .clk(clk),
        .clkEn(1'b1),
        .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(vitDout),
        .bitsyncMode(bitsyncMode),
        .viterbiMode(viterbiMode),
        .ch0SymEn(iDemodSymEn),
        .ch0SymData(iDemodSymData),
        .ch1SymEn(qDemodSymEn),
        .ch1SymData(qDemodSymData),
        .ch0BitEnOut(ch0VitBitEn),
        .ch0BitOut(ch0VitBit),
        .ch1BitEnOut(ch1VitBitEn),
        .ch1BitOut(ch1VitBit)
        );
    reg                 ch0VitSym2xEn;
    reg                 ch1VitSym2xEn;
    always @* begin
        if (viterbiMode[4]) begin
            case (viterbiMode[2:0])
                `VIT_MODE_DUAL_CH,
                `VIT_MODE_OFFSET_CH: begin
                    ch0VitSym2xEn = iDemodSym2xEn;
                    ch1VitSym2xEn = iDemodSym2xEn;
                end
                default: begin
                    ch0VitSym2xEn = iDemodSymEn;
                    ch1VitSym2xEn = qDemodSymEn;
                end
            endcase
        end
        else begin
            case (bitsyncMode)
                `BS_MODE_DUAL_CH,
                `BS_MODE_OFFSET_CH: begin
                    ch0VitSym2xEn = iDemodSym2xEn;
                    ch1VitSym2xEn = iDemodSym2xEn;
                end
                default: begin
                    ch0VitSym2xEn = iDemodSymEn;
                    ch1VitSym2xEn = qDemodSymEn;
                end
            endcase
        end
    end
`endif //ADD_VITERBI


`ifdef ADD_TRELLIS
//******************************************************************************
//                        PCMFM Trellis Decoder
//******************************************************************************

    reg                     pcmSymEn;
    reg                     pcmSym2xEn;
    reg     signed  [17:0]  iPcmIn,qPcmIn;
    always @(posedge clk) begin
        pcmSymEn <= trellisSymEn & pcmTrellisMode;
        pcmSym2xEn <= iDemodSym2xEn & pcmTrellisMode;
        iPcmIn <= iTrellis;
        qPcmIn <= qTrellis;
    end

    wire            [17:0]  pcmDac0Data;
    wire            [17:0]  pcmDac1Data;
    wire            [17:0]  pcmDac2Data;
    wire            [31:0]  trellisDout;
    trellis pcmTrellis(
        .clk(clk), .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(trellisDout),
        .symEn(pcmSymEn),
        .sym2xEn(pcmSym2xEn),
        .iIn(iPcmIn),.qIn(qPcmIn),
        `ifdef NEW_FM_TIMING
        .legacyBit(legacyBit),
        `else
        .legacyBit(iDemodBit),
        `endif
        .dac0Select(demodDac0Select),
        .dac1Select(demodDac1Select),
        .dac2Select(demodDac2Select),
        .dac0ClkEn(pcmDac0ClkEn),
        .dac0Data(pcmDac0Data),
        .dac1ClkEn(pcmDac1ClkEn),
        .dac1Data(pcmDac1Data),
        .dac2ClkEn(pcmDac2ClkEn),
        .dac2Data(pcmDac2Data),
        .decision(pcmTrellisBit),
        .symEnOut(pcmTrellisSymEnOut),
        .sym2xEnOut(pcmTrellisSym2xEnOut),
        .oneOrZeroPredecessor()
    );
`endif //ADD_TRELLIS

`ifdef ADD_SOQPSK
    wire            [17:0]  soqDac0Data;
    wire            [17:0]  soqDac1Data;
    wire            [17:0]  soqDac2Data;
    wire            [31:0]  soqTrellisDout;
    trellisSoqpsk soqTrellis(
        .clk(clk), .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(soqTrellisDout),
        .symEn(trellisSymEn),
        .sym2xEn(iDemodSym2xEn),
        .iIn(iTrellis),
        .qIn(qTrellis),
        .dac0Select(demodDac0Select),
        .dac1Select(demodDac1Select),
        .dac2Select(demodDac2Select),
        .dac0Sync(soqDac0ClkEn),
        .dac0Data(soqDac0Data),
        .dac1Sync(soqDac1ClkEn),
        .dac1Data(soqDac1Data),
        .dac2Sync(soqDac2ClkEn),
        .dac2Data(soqDac2Data),
        .decision(soqTrellisBit),
        .ternarySymEnOut(soqTrellisSymEn),
        .ternarySym2xEnOut(soqTrellisSym2xEn)
    );

`endif


`ifdef ADD_MULTIH
//******************************************************************************
//                          Multih Trellis Decoder
//******************************************************************************
    wire    [1:0]   multihBit;
    wire    [17:0]  multih0Out,multih1Out,multih2Out;
    wire    [31:0]  multihDout;
    trellisMultiH multih (
        .clk(clk),
        .reset(reset),
        `ifdef ADD_SUPERBAUD_TED
        .symEnEvenIn(trellisSymEnEven & multihMode),
        `else
        .symEnEvenIn(trellisSymEnEven & multihMode),
        `endif
        .symEnIn(trellisSymEn & multihMode),
        .sym2xEnIn(iDemodSym2xEn & multihMode),
        .iIn(iTrellis),
        .qIn(qTrellis),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(multihDout),
        .dac0Select(demodDac0Select),
        .dac1Select(demodDac1Select),
        .dac2Select(demodDac2Select),
        .dac0ClkEn(multih0ClkEn),
        .dac0Data(multih0Out),
        .dac1ClkEn(multih1ClkEn),
        .dac1Data(multih1Out),
        .dac2ClkEn(multih2ClkEn),
        .dac2Data(multih2Out),
        `ifndef EMBED_MULTIH_CARRIER_LOOP
        .phaseError(),
        .phaseErrorEn(),
        .phaseErrorValid(),
        `else
        .multihCarrierLock(multihCarrierLock),
        `endif
        .symEnOut(multihSymEnOut),
        .sym2xEnOut(multihSym2xEnOut),
        .decision(multihBit)
    );

    //`define BYPASS_MULTIH_DECODER
    `ifdef BYPASS_MULTIH_DECODER
    reg multihDataOut;
    reg multihClkOut;
    always @(posedge clk) begin
        if (multihSym2xEnOut) begin
            multihClkOut <= 1;
            if (multihSymEnOut) begin
                multihDataOut <= multihBit[1];
            end
            else begin
                multihDataOut <= multihBit[0];
            end
        end
        else begin
            multihClkOut <= 0;
        end
    end
    `endif

    `ifndef EMBED_MULTIH_CARRIER_LOOP
    wire multihCarrierLock = 1'b1;
    `endif

    wire    timingLock = demodTimingLock;
    wire    carrierLock = multihMode ? multihCarrierLock : demodCarrierLock;
`else //ADD_MULTIH

    wire    timingLock = demodTimingLock;
    wire    carrierLock = demodCarrierLock;

`endif //ADD_MULTIH

`ifdef ADD_LDPC
//******************************************************************************
//                              LDPC Decoder
//******************************************************************************
    wire            [17:0]  ldpcDac0Data;
    wire            [17:0]  ldpcDac1Data;
    wire            [17:0]  ldpcDac2Data;
    wire            [31:0]  ldpcDout;
    ldpc #(.LDPCBITS(7)) ldpc(
        .clk(clk), .clkEn(iDemodSym2xEn), .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(ldpcDout),
        .iSymEn(iLdpcSymEn),
        .iSymData(iLdpc),
        .qSymEn(qLdpcSymEn),
        .qSymData(qLdpc),
        .dac0Select(demodDac0Select),
        .dac1Select(demodDac1Select),
        .dac2Select(demodDac2Select),
        .dac0ClkEn(ldpcDac0ClkEn),
        .dac0Data(ldpcDac0Data),
        .dac1ClkEn(ldpcDac1ClkEn),
        .dac1Data(ldpcDac1Data),
        .dac2ClkEn(ldpcDac2ClkEn),
        .dac2Data(ldpcDac2Data),
        .ldpcBitEnOut(ldpcBitEnOut),
        .ldpcBitOut(ldpcBitOut)
    );
`endif


`ifdef ADD_FRAMER
//******************************************************************************
//                        QPSK/OQPSK Ambiguity Removal
//******************************************************************************

    wire    [1:0]   rotation;
    reg             iRotBit,qRotBit,qDemodBitDelay;
    always @(posedge clk) begin
        case (demodMode)
            `MODE_QPSK: begin
                if (iDemodBitEn) begin
                    case (rotation)
                        0: begin
                            iRotBit <= iDemodBit;
                            qRotBit <= qDemodBit;
                        end
                        1: begin
                            iRotBit <= qDemodBit;
                            qRotBit <= ~iDemodBit;
                        end
                        2: begin
                            iRotBit <= ~iDemodBit;
                            qRotBit <= ~qDemodBit;
                        end
                        3: begin
                            iRotBit <= ~qDemodBit;
                            qRotBit <= iDemodBit;
                        end
                    endcase
                end
            end
            `MODE_SOQPSK,
            `MODE_OQPSK: begin
                if (iDemodBitEn) begin
                    qDemodBitDelay <= qDemodBit;
                    case (rotation)
                        0: begin
                            iRotBit <= iDemodBit;
                            qRotBit <= qDemodBit;
                        end
                        1: begin
                            iRotBit <= qDemodBitDelay;
                            qRotBit <= ~iDemodBit;
                        end
                        2: begin
                            iRotBit <= ~iDemodBit;
                            qRotBit <= ~qDemodBit;
                        end
                        3: begin
                            iRotBit <= ~qDemodBitDelay;
                            qRotBit <= iDemodBit;
                        end
                    endcase
                end
            end
            default: begin
                if (iDemodBitEn) begin
                    iRotBit <= iDemodBit;
                end
                if (qDemodBitEn) begin
                    qRotBit <= qDemodBit;
                end
            end
        endcase
    end
`endif //ADD_FRAMER


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

    wire        [2:0]   dualSrcSelect;
    reg                 dualCh0Input;
    reg                 dualCh1Input;
    reg                 dualSymEn;
    reg                 dualSym2xEn;
    always @(posedge clk) begin
        case (dualSrcSelect)
            `ifdef ADD_SUBCARRIER
            `DEC_SRC_SC0: begin
                dualCh0Input <= sc_iBit;
                dualCh1Input <= sc_qBit;
                dualSymEn <= sc_iSymEn;
                dualSym2xEn <= sc_iSym2xEn;
            end
            `endif
            `ifdef ADD_VITERBI
            `DEC_SRC_VITERBI: begin
                dualCh0Input <= ch0VitBit;
                dualCh1Input <= (viterbiMode[3]) ? ch1VitBit : ch0VitBit;
                dualSymEn <= ch0VitBitEn;
                dualSym2xEn <= ch0VitSym2xEn;
            end
            `endif //ADD_VITERBI
            default: begin
                `ifdef ADD_TRELLIS
                if (pcmTrellisMode) begin
                    dualCh0Input <= pcmTrellisBit;
                    dualCh1Input <= pcmTrellisBit;
                    dualSymEn <= pcmTrellisSymEnOut;
                    dualSym2xEn <= pcmTrellisSym2xEnOut;
                end
                `ifdef ADD_MULTIH
                else if (multihMode) begin
                    dualCh0Input <= multihBit[0];
                    dualCh1Input <= multihBit[1];
                    dualSymEn <= multihSymEnOut;
                    dualSym2xEn <= multihSym2xEnOut;
                end
                `endif
                else begin
                    `ifdef ADD_FRAMER
                    dualCh0Input <= iRotBit;
                    dualCh1Input <= qRotBit;
                    dualSymEn <= iDemodBitEn;
                    dualSym2xEn <= iDemodSym2xEn;
                    `else //ADD_FRAMER
                    dualCh0Input <= iDemodBit;
                    dualCh1Input <= qDemodBit;
                    dualSymEn <= iDemodBitEn;
                    dualSym2xEn <= iDemodSym2xEn;
                    `endif //ADD_FRAMER
                end

                `else //ADD_TRELLIS

                `ifdef ADD_MULTIH

                if (multihMode) begin
                    dualCh0Input <= multihBit[0];
                    dualCh1Input <= multihBit[1];
                    dualSymEn <= multihSymEnOut;
                    dualSym2xEn <= multihSym2xEnOut;
                end
                else begin
                    `ifdef ADD_FRAMER
                    dualCh0Input <= iRotBit;
                    dualCh1Input <= qRotBit;
                    dualSymEn <= iDemodBitEn;
                    dualSym2xEn <= iDemodSym2xEn;
                    `else //ADD_FRAMER
                    dualCh0Input <= iDemodBit;
                    dualCh1Input <= qDemodBit;
                    dualSymEn <= iDemodBitEn;
                    dualSym2xEn <= iDemodSym2xEn;
                    `endif //ADD_FRAMER
                end

                `else // ADD_MULTIH

                `ifdef ADD_FRAMER
                dualCh0Input <= iRotBit;
                dualCh1Input <= qRotBit;
                dualSymEn <= iDemodBitEn;
                dualSym2xEn <= iDemodSym2xEn;
                `else //ADD_FRAMER
                dualCh0Input <= iDemodBit;
                dualCh1Input <= qDemodBit;
                dualSymEn <= iDemodBitEn;
                dualSym2xEn <= iDemodSym2xEn;
                `endif //ADD_FRAMER

                `endif //ADD_MULTIH

                `endif //ADD_TRELLIS
            end
        endcase
    end

    wire    [31:0]  dualDecDout;
    decoder dualDecoder
    (
        .clk(clk),
        .reset(reset),
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
        .fifo_reset(),
        .clkPhase(),
        .symb_clk(dualPcmSymClk),
        .inputSelect(dualSrcSelect)
    );

    reg ch1DecoderSpace;
    always @* begin
        casex(addr)
            `CH1_DECODERSPACE:      ch1DecoderSpace = cs;
            default:                ch1DecoderSpace = 0;
        endcase
    end

    wire        [2:0]   pcmSrcSelect;
    reg                 ch1DecInput;
    reg                 ch1DecSymEn;
    reg                 ch1DecSym2xEn;
    always @(posedge clk) begin
        case (pcmSrcSelect)
            `ifdef ADD_SUBCARRIER
            `DEC_SRC_SC0: begin
                ch1DecInput <= sc_iBit;
                ch1DecSymEn <= sc_iSymEn;
                ch1DecSym2xEn <= sc_iSym2xEn;
            end
            `endif
            `ifdef ADD_BITSYNC
            `DEC_SRC_SBS: begin
                ch1DecInput <= sbsBit;
                ch1DecSymEn <= sbsSymEn;
                ch1DecSym2xEn <= sbsSym2xEn;
            end
            `endif
            `ifdef ADD_LDPC
            `DEC_SRC_LDPC: begin
                ch1DecInput <= ldpcBitOut;
                ch1DecSymEn <= ldpcBitEnOut;
                ch1DecSym2xEn <= 1'b1;
            end
            `endif
            `ifdef ADD_VITERBI
            `DEC_SRC_VITERBI: begin
                ch1DecInput <= ch1VitBit;
                ch1DecSymEn <= ch1VitBitEn;
                ch1DecSym2xEn <= ch1VitSym2xEn;
            end
            `endif //ADD_VITERBI
            default: begin
                ch1DecInput <= qDemodBit;
                ch1DecSymEn <= qDemodBitEn;
                ch1DecSym2xEn <= qDemodSym2xEn;
            end
        endcase
    end


    wire    [31:0]  ch1DecDout;
    pcmDecoder dec1 (
        .clk(clk),
        .reset(reset),
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
        .fifo_reset(),
        .clkPhase(),
        .symb_clk(ch1PcmSymClk),
        .inputSelect(pcmSrcSelect)
    );


`ifdef ADD_RS_DEC

//******************************************************************************
//                              Reed Solomon Decoder
//******************************************************************************

    wire    [3:0]   rsDecSourceSelect;
    reg             rsDecClkEn;
    reg             rsDecDataIn;
    always @* begin
        casex (rsDecSourceSelect)
            `RS_DEC_SRC_LEGACY_I: begin
                `ifdef ADD_FRAMER
                rsDecClkEn = iDemodBitEn;
                rsDecDataIn = iRotBit;
                `else
                rsDecClkEn = iDemodBitEn;
                rsDecDataIn = iDemodBit;
                `endif
            end
            `RS_DEC_SRC_LEGACY_Q: begin
                `ifdef ADD_FRAMER
                rsDecClkEn = qDemodBitEn;
                rsDecDataIn = qRotBit;
                `else
                rsDecClkEn = qDemodBitEn;
                rsDecDataIn = qDemodBit;
                `endif
            end
            `ifdef ADD_TRELLIS
            `RS_DEC_SRC_PCMTRELLIS: begin
                rsDecClkEn = pcmTrellisSymEnOut;
                rsDecDataIn = pcmTrellisBit;
            end
            `endif
            `ifdef ADD_LDPC
            `RS_DEC_SRC_LDPC: begin
                rsDecClkEn = ldpcBitEnOut;
                rsDecDataIn = ldpcBitOut;
            end
            `endif
            `RS_DEC_SRC_DEC0_CH0: begin
                rsDecClkEn = dualPcmClkEn;
                rsDecDataIn = dualDataI;
            end
            `RS_DEC_SRC_DEC0_CH1: begin
                rsDecClkEn = dualPcmClkEn;
                rsDecDataIn = dualDataQ;
            end
            `RS_DEC_SRC_DEC1_CH0: begin
                rsDecClkEn = ch1PcmClkEn;
                rsDecDataIn = ch1PcmData;
            end
            //`RS_DEC_SRC_DEC1_CH1:
            //`RS_DEC_SRC_DEC2_CH0:
            //`RS_DEC_SRC_DEC2_CH1:
            //`RS_DEC_SRC_DEC3_CH0:
            //`RS_DEC_SRC_DEC3_CH1:
            default:   begin
                rsDecClkEn = iDemodBitEn;
                rsDecDataIn = iDemodBit;
            end
        endcase
    end
    reg rsDecSpace;
    always @* begin
        casex(addr)
            `RS_DEC_SPACE:      rsDecSpace = cs;
            default:           rsDecSpace = 0;
        endcase
    end

    wire            [17:0]  rsDecDac0Data;
    wire            [17:0]  rsDecDac1Data;
    wire            [17:0]  rsDecDac2Data;
    wire            [31:0]  rsDecDout;
    wire                    rsDecDac0ClkEn, rsDecDac1ClkEn, rsDecDac2ClkEn, rsDecBitEnOut, rsDecBitOut;

    RS_DecoderTop RS_Dec(
        .clk(clk), .ce(1'b1), .reset(reset),
        .busClk(busClk),
        .cs(rsDecSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(rsDecDout),
        .sourceSelect(rsDecSourceSelect),
        .bitEn(rsDecClkEn),
        .bitData(rsDecDataIn),
        .dac0Select(demodDac0Select),
        .dac1Select(demodDac1Select),
        .dac2Select(demodDac2Select),
        .dac0ClkEn(rsDecDac0ClkEn),
        .dac0Data(rsDecDac0Data),
        .dac1ClkEn(rsDecDac1ClkEn),
        .dac1Data(rsDecDac1Data),
        .dac2ClkEn(rsDecDac2ClkEn),
        .dac2Data(rsDecDac2Data),
        .rsDecBitEnOut(rsDecBitEnOut),
        .rsDecBitOut(rsDecBitOut)
    );

`endif   // RS_Dec


`ifdef ADD_BERT
//******************************************************************************
//                            Bit Error Rate Tester
//******************************************************************************

    reg bertSpace;
    always @* begin
        casex(addr)
            `BERT_SPACE:            bertSpace = cs;
            default:                bertSpace = 0;
            endcase
        end

    wire    [3:0]   bertSourceSelect;
    reg             bertClkEn;
    reg             bertDataIn;
    always @* begin
        casex (bertSourceSelect)
            `BERT_SRC_LEGACY_I: begin
                `ifdef ADD_FRAMER
                bertClkEn = iDemodBitEn;
                bertDataIn = iRotBit;
                `else
                bertClkEn = iDemodBitEn;
                bertDataIn = iDemodBit;
                `endif
            end
            `BERT_SRC_LEGACY_Q: begin
                `ifdef ADD_FRAMER
                bertClkEn = qDemodBitEn;
                bertDataIn = qRotBit;
                `else
                bertClkEn = qDemodBitEn;
                bertDataIn = qDemodBit;
                `endif
            end
            `ifdef ADD_TRELLIS
            `BERT_SRC_PCMTRELLIS: begin
                bertClkEn = pcmTrellisSymEnOut;
                bertDataIn = pcmTrellisBit;
            end
            `endif
            `ifdef ADD_SOQPSK
            `BERT_SRC_SOQTRELLIS: begin
                bertClkEn = soqTrellisSymEn;
                bertDataIn = soqTrellisBit;
            end
            `endif
            `ifdef ADD_LDPC
            `BERT_SRC_LDPC: begin
                bertClkEn = ldpcBitEnOut;
                bertDataIn = ldpcBitOut;
            end
            `elsif ADD_RS_DEC
            `BERT_SRC_RS_DEC: begin
                bertClkEn  = rsDecBitEnOut;
                bertDataIn = rsDecBitOut;
            end
            `endif
            `BERT_SRC_DEC0_CH0: begin
                bertClkEn = dualPcmClkEn;
                bertDataIn = dualDataI;
            end
            `BERT_SRC_DEC0_CH1: begin
                bertClkEn = dualPcmClkEn;
                bertDataIn = dualDataQ;
            end
            `BERT_SRC_DEC1_CH0: begin
                bertClkEn = ch1PcmClkEn;
                bertDataIn = ch1PcmData;
            end
            //`BERT_SRC_DEC1_CH1:
            //`BERT_SRC_DEC2_CH0:
            //`BERT_SRC_DEC2_CH1:
            //`BERT_SRC_DEC3_CH0:
            //`BERT_SRC_DEC3_CH1:
            default:   begin
                bertClkEn = iDemodBitEn;
                bertDataIn = iDemodBit;
            end
        endcase
    end

    wire    [31:0]  bertDout;
    bert_top bert(
        .reset(reset),
        .busClk(busClk),
        .cs(bertSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(bertDout),
        .clk(clk),
        .enable(bertClkEn),
        .data(bertDataIn),
        .inputSourceSelect(bertSourceSelect)
    );
`endif //ADD_BERT

`ifdef ADD_FRAMER
//******************************************************************************
//                               Framer
//******************************************************************************

    wire    [3:0]   framerSourceSelect;
    reg             framerClkEn;
    reg             framerDataIn;
    always @* begin
        casex (framerSourceSelect)
            `FRAMER_SRC_LEGACY_I: begin
                framerClkEn = iDemodBitEn;
                framerDataIn = iRotBit;
            end
            `FRAMER_SRC_LEGACY_Q: begin
                framerClkEn = qDemodBitEn;
                framerDataIn = qRotBit;
            end
            `ifdef ADD_TRELLIS
            `FRAMER_SRC_PCMTRELLIS: begin
                framerClkEn = pcmTrellisSymEnOut;
                framerDataIn = pcmTrellisBit;
            end
            `endif
            `ifdef ADD_SOQPSK
            `FRAMER_SRC_SOQTRELLIS: begin
                framerClkEn = soqTrellisSymEn;
                framerDataIn = soqTrellisBit;
            end
            `endif
            `ifdef ADD_LDPC
            `FRAMER_SRC_LDPC: begin
                framerClkEn = ldpcBitEnOut;
                framerDataIn = ldpcBitOut;
            end
             `elsif ADD_RS_DEC
            `FRAMER_SRC_RS_DEC: begin
                framerClkEn  = rsDecBitEnOut;
                framerDataIn = rsDecBitOut;
            end
            `endif
            `FRAMER_SRC_DEC0_CH0: begin
                framerClkEn = dualPcmClkEn;
                framerDataIn = dualDataI;
            end
            `FRAMER_SRC_DEC0_CH1: begin
                framerClkEn = dualPcmClkEn;
                framerDataIn = dualDataQ;
            end
            `FRAMER_SRC_DEC1_CH0: begin
                framerClkEn = ch1PcmClkEn;
                framerDataIn = ch1PcmData;
            end
            //`FRAMER_SRC_DEC1_CH1:
            //`FRAMER_SRC_DEC2_CH0:
            //`FRAMER_SRC_DEC2_CH1:
            //`FRAMER_SRC_DEC3_CH0:
            //`FRAMER_SRC_DEC3_CH1:
            default:   begin
                framerClkEn = iDemodBitEn;
                framerDataIn = iDemodBit;
            end
        endcase
    end

    wire    [1:0]   framerRotation;
    wire    [31:0]  framerDout;
    framerTop framer(
        .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(framerDout),
        .clk(clk),
        .clkEn(framerClkEn),
        .dataBitIn(framerDataIn),
        .rotation(framerRotation),
        .inputSourceSelect(framerSourceSelect),
        .framesyncPulse(),
        .framedBitOut(),
        .framesync()
    );

    assign rotation = framerEnable ? framerRotation : 2'b0;
`endif //ADD_FRAMER



`ifdef ADD_DQM
/******************************************************************************
                                    DQM
******************************************************************************/
    wire    [3:0]   dqmSourceSelect;
    reg             dqmBitEnIn;
    reg             dqmBitIn;
    always @(posedge clk) begin
        casex (dqmSourceSelect)
            `ifdef ADD_TRELLIS
            `DQM_SRC_PCMTRELLIS: begin
                dqmBitEnIn <= pcmTrellisSymEnOut;
                dqmBitIn <= pcmTrellisBit;
            end
            `endif
            `ifdef ADD_SOQPSK
            `DQM_SRC_SOQTRELLIS: begin
                dqmBitEnIn <= soqTrellisSymEn;
                dqmBitIn <= soqTrellisBit;
            end
            `endif
            `DQM_SRC_DEC0_CH0: begin
                dqmBitEnIn <= dualPcmClkEn;
                dqmBitIn <= dualDataI;
            end
            default: begin
                dqmBitEnIn <= dualPcmClkEn;
                dqmBitIn <= dualDataI;
            end
        endcase
    end

    wire    signed      [33:0]          ch0MseSum;
    wire    signed      [`DQM_LOG_BITS-1:0]  ch0Log10MSE;
    wire    signed      [33:0]          ch1MseSum;
    wire    signed      [`DQM_LOG_BITS-1:0]  ch1Log10MSE;

    `ifdef DQM_USE_CHIP_TO_CHIP
    // Chip to Chip serial bus routing
    wire                [2:0]           dqmCombinerMode;
    reg                                 ch0SCLK;
    reg                                 ch0SFS;
    reg                                 ch0SDATA;
    reg                                 ch1SCLK;
    reg                                 ch1SFS;
    reg                                 ch1SDATA;
    always @* begin
        case (dqmCombinerMode)
            `DQM_CMB_MODE_DISABLED: begin
                toPrev_CLK =    mseMCLK;
                toPrev_FS =     mseMFS;
                toPrev_DATA =   mseMDATA;

                toNext_CLK =    mseMCLK;
                toNext_FS =     mseMFS;
                toNext_DATA =   mseMDATA;

                ch0SCLK = 0;
                ch0SFS = 0;
                ch0SDATA = 0;

                ch1SCLK = 0;
                ch1SFS = 0;
                ch1SDATA = 0;
            end
            default: begin
                toPrev_CLK = 0;
                toPrev_FS = 0;
                toPrev_DATA = 0;

                toNext_CLK = 0;
                toNext_FS = 0;
                toNext_DATA = 0;

                ch0SCLK =   fromNext_CLK;
                ch0SFS =    fromNext_FS;
                ch0SDATA =  fromNext_DATA;

                ch1SCLK =   fromPrev_CLK;
                ch1SFS =    fromPrev_FS;
                ch1SDATA =  fromPrev_DATA;
            end
        endcase
    end

    wire    signed  [33:0]          mseSum;
    wire    signed  [`DQM_LOG_BITS-1:0]  log10MSE;
    dqmChip2Chip c2c (
        .clk(clk),
        .reset(reset),
        .combinerStartOfFrame(),
        .dqmStartOfFrame(),
        .mseSum(mseSum),
        .log10MseSum(log10MSE),
        .mseMCLK(mseMCLK),
        .mseMFS(mseMFS),
        .mseMDATA(mseMDATA),
        .ch0SCLK(ch0SCLK),
        .ch0SFS(ch0SFS),
        .ch0SDATA(ch0SDATA),
        .ch0MseSum(ch0MseSum),
        .ch0Log10MseSum(ch0Log10MSE),
        .ch1SCLK(ch1SCLK),
        .ch1SFS(ch1SFS),
        .ch1SDATA(ch1SDATA),
        .ch1MseSum(ch1MseSum),
        .ch1Log10MseSum(ch1Log10MSE)
    );
    `endif  //DQM_USE_CHIP_TO_CHIP

    wire    [31:0]  dqmDout;
    dqm dqm(
        .clk(clk),
        .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(dqmDout),
        .combinerStartOfFrame(),
        .ch0MseSum(ch0MseSum),
        .ch0Log10MSE(ch0Log10MSE),
        .ch1MseSum(ch1MseSum),
        .ch1Log10MSE(ch1Log10MSE),
        .bitClkEn(dqmBitEnIn),
        .payloadBit(dqmBitIn),
        .magClkEn(magClkEn),
        .mag(mag),
        .sourceSelect(dqmSourceSelect),
        .combinerMode(dqmCombinerMode),
        .dqmStartOfFrame(),
        .mseSum(mseSum),
        .log10MseSum(log10MSE),
        .dqmBitEn(dqmBitEn),
        .dqmBit(dqmBit)
    );
`endif //ADD_DQM


`ifdef ADD_PN_GEN

//******************************************************************************
//                               PN Generator
//******************************************************************************
    wire    [31:0]  pngenDout;
    pngenTop pngen(
        .clk(clk),
        .clkEn(pngenEnable),
        .reset(reset),
        .busClk(busClk),
        // TODO, needed CS to prevent early writes with garbage only on triple demod
        .wr0(cs & wr0), .wr1(cs & wr1), .wr2(cs & wr2), .wr3(cs & wr3),
        .addr(addr),
        .din(dataIn),
        .dout(pngenDout),
        .pnClkEn(pnClkEn),
        .nrzBit(pnNrzBit),
        .pnBit(pnBit),
        .pnClk(pnClk)
    );

 `endif
//******************************************************************************
//                       Clock/Data Jitter Reduction
//******************************************************************************

    `ifdef R6100


    `else //R6100

    // SPI interface to the PLLs
    wire    [31:0]  pllDout;
    ics307Interface #(.SysclkDivider(4)) pllIntfc (
        .reset(reset),
        .busClk(busClk),
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

    `endif //R6100

    //----------------------- Channel 0 Jitter Attenuation --------------------

    wire    [3:0]   cAndD0SourceSelect;
    reg             cAndD0ClkEn;
    reg     [2:0]   cAndD0DataIn;
    always @* begin
        casex (cAndD0SourceSelect)
            `CandD_SRC_LEGACY_I: begin
                `ifdef ADD_FRAMER
                cAndD0ClkEn = iDemodBitEn;
                cAndD0DataIn = {iRotBit,qRotBit,1'b0};
                `else
                cAndD0ClkEn = iDemodBitEn;
                cAndD0DataIn = {iDemodBit,qDemodBit,1'b0};
                `endif
            end
            `CandD_SRC_LEGACY_Q: begin
                `ifdef ADD_FRAMER
                cAndD0ClkEn = qDemodBitEn;
                cAndD0DataIn = {qRotBit,1'b0,1'b0};
                `else
                cAndD0ClkEn = qDemodBitEn;
                cAndD0DataIn = {qDemodBit,1'b0,1'b0};
                `endif
            end
            `ifdef ADD_TRELLIS
            `CandD_SRC_PCMTRELLIS: begin
                cAndD0ClkEn = pcmTrellisSymEnOut;
                cAndD0DataIn = {pcmTrellisBit,pcmTrellisBit,1'b0};
            end
            `endif
            `ifdef ADD_SOQPSK
            `CandD_SRC_SOQTRELLIS: begin
                cAndD0ClkEn = soqTrellisSymEn;
                cAndD0DataIn = {soqTrellisBit,soqTrellisBit,1'b0};
            end
            `endif
            //`CandD_SRC_STC:
            `ifdef ADD_PN_GEN
            `CandD_SRC_PNGEN: begin
                cAndD0ClkEn = pnClkEn;
                cAndD0DataIn = {pnBit,2'b0};
            end
            `endif
            `ifdef ADD_LDPC
            `CandD_SRC_LDPC: begin
                cAndD0ClkEn = ldpcBitEnOut;
                cAndD0DataIn = {ldpcBitOut,2'b0};
            end
            `endif
            `ifdef ADD_DQM
            `CandD_SRC_DQM: begin
                cAndD0ClkEn = dqmBitEn;
                cAndD0DataIn = {dqmBit,2'b0};
            end
            `endif
            `CandD_SRC_DEC0_CH0: begin
                cAndD0ClkEn = dualPcmClkEn;
                cAndD0DataIn = {dualDataI,dualDataQ,1'b0};
            end
            `CandD_SRC_DEC0_CH1: begin
                cAndD0ClkEn = dualPcmClkEn;
                cAndD0DataIn = {dualDataQ,dualDataI,1'b0};
            end
            `CandD_SRC_DEC1_CH0: begin
                cAndD0ClkEn = ch1PcmClkEn;
                cAndD0DataIn = {ch1PcmData,1'b0,1'b0};
            end
            `ifdef ADD_RS_DEC
            `CandD_SRC_RS_DEC: begin
                cAndD0ClkEn = rsDecBitEnOut;
                cAndD0DataIn = {rsDecBitOut,2'b0};
            end
            `endif
            //`CandD_SRC_DEC1_CH1:
            //`CandD_SRC_DEC2_CH0:
            //`CandD_SRC_DEC2_CH1:
            //`CandD_SRC_DEC3_CH0:
            default:   begin
                cAndD0ClkEn = iDemodBitEn;
                cAndD0DataIn = {iDemodBit,qDemodBit,1'b0};
            end
        endcase
    end

    wire    [2:0]   cAndD0DataOut;
    wire    [31:0]  cAndD0Dout;
    clkAndDataOutput #(.RegSpace(`CandD0SPACE)) cAndD0 (
        .clk(clk), .reset(reset),
        .busClk(busClk),
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
    //`define BYPASS_CANDD0
    `ifdef BYPASS_CANDD0
    assign ch0ClkOut = cAndD0ClkEn;
    assign ch0DataOut = cAndD0DataIn[2];
    assign ch2ClkOut = cAndD0ClkEn;
    assign ch2DataOut = cAndD0DataIn[2];
    `else
    assign ch0ClkOut = cAndD0ClkOut;
    assign ch0DataOut = cAndD0DataOut[2];
    assign ch2ClkOut = cAndD0ClkOut;
    assign ch2DataOut = cAndD0DataOut[2];
    `endif

    //----------------------- Channel 1 Jitter Attenuation --------------------

    wire    [3:0]   cAndD1SourceSelect;
    reg             cAndD1ClkEn;
    reg     [2:0]   cAndD1DataIn;
    always @* begin
        casex (cAndD1SourceSelect)
            `CandD_SRC_LEGACY_I: begin
                `ifdef ADD_FRAMER
                cAndD1ClkEn = iDemodBitEn;
                cAndD1DataIn = {iRotBit,qRotBit,1'b0};
                `else
                cAndD1ClkEn = iDemodBitEn;
                cAndD1DataIn = {iDemodBit,qDemodBit,1'b0};
                `endif
            end
            `CandD_SRC_LEGACY_Q: begin
                `ifdef ADD_FRAMER
                cAndD1ClkEn = qDemodBitEn;
                cAndD1DataIn = {qRotBit,1'b0,1'b0};
                `else
                cAndD1ClkEn = qDemodBitEn;
                cAndD1DataIn = {qDemodBit,1'b0,1'b0};
                `endif
            end
            `ifdef ADD_TRELLIS
            `CandD_SRC_PCMTRELLIS: begin
                cAndD1ClkEn = pcmTrellisSymEnOut;
                cAndD1DataIn = {pcmTrellisBit,pcmTrellisBit,1'b0};
            end
            `endif
            `ifdef ADD_SOQPSK
            `CandD_SRC_SOQTRELLIS: begin
                cAndD1ClkEn = soqTrellisSymEn;
                cAndD1DataIn = {soqTrellisBit,soqTrellisBit,1'b0};
            end
            `endif
            //`CandD_SRC_STC:
           `ifdef ADD_PN_GEN
            `CandD_SRC_PNGEN: begin
                cAndD1ClkEn = pnClkEn;
                cAndD1DataIn = {pnBit,2'b0};
            end
            `endif
            `ifdef ADD_LDPC
            `CandD_SRC_LDPC: begin
                cAndD1ClkEn = ldpcBitEnOut;
                cAndD1DataIn = {ldpcBitOut,2'b0};
            end
            `endif
            `ifdef ADD_DQM
            `CandD_SRC_DQM: begin
                cAndD1ClkEn = dqmBitEn;
                cAndD1DataIn = {dqmBit,2'b0};
            end
            `endif
            `CandD_SRC_DEC0_CH0: begin
                cAndD1ClkEn = dualPcmClkEn;
                cAndD1DataIn = {dualDataI,dualDataQ,1'b0};
            end
            `CandD_SRC_DEC0_CH1: begin
                cAndD1ClkEn = dualPcmClkEn;
                cAndD1DataIn = {dualDataQ,dualDataI,1'b0};
            end
            `CandD_SRC_DEC1_CH0: begin
                cAndD1ClkEn = ch1PcmClkEn;
                cAndD1DataIn = {ch1PcmData,1'b0,1'b0};
            end
            `ifdef ADD_RS_DEC
            `CandD_SRC_RS_DEC: begin
                cAndD1ClkEn = rsDecBitEnOut;
                cAndD1DataIn = {rsDecBitOut,2'b0};
            end
            `endif
            //`CandD_SRC_DEC1_CH1:
            //`CandD_SRC_DEC2_CH0:
            //`CandD_SRC_DEC2_CH1:
            //`CandD_SRC_DEC3_CH0:
            default:   begin
                cAndD1ClkEn = iDemodBitEn;
                cAndD1DataIn = {iDemodBit,qDemodBit,1'b0};
            end
        endcase
    end

    `ifdef BYPASS_MULTIH_DECODER
    wire    [31:0]  cAndD1Dout = 32'h0;
    assign ch1DataOut = multihDataOut;
    assign ch1ClkOut = multihClkOut;
    assign ch3DataOut = multihDataOut;
    assign ch3ClkOut = multihClkOut;
    `else
    wire    [2:0]   cAndD1DataOut;
    wire    [31:0]  cAndD1Dout;
    clkAndDataOutput #(.RegSpace(`CandD1SPACE)) cAndD1 (
        .clk(clk), .reset(reset),
        .busClk(busClk),
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
    //`define BYPASS_CANDD1
    `ifdef TEST_LDPC
    assign ch1DataOut = ldpcBitOut;
    assign ch1ClkOut = ldpcBitEnOut;
    assign ch3ClkOut = cAndD1ClkOut;
    assign ch3DataOut = cAndD1DataOut[2];
    `elsif BYPASS_CANDD1
    assign ch1ClkOut = cAndD1ClkEn;
    assign ch1DataOut = cAndD1DataIn[2];
    assign ch3ClkOut = cAndD1ClkEn;
    assign ch3DataOut = cAndD1DataIn[2];
    `else
    assign ch1ClkOut = cAndD1ClkOut;
    assign ch1DataOut = cAndD1DataOut[2];
    assign ch3ClkOut = cAndD1ClkOut;
    assign ch3DataOut = cAndD1DataOut[2];
    `endif //TEST_LDPC
    `endif //BYPASS_MULTIH_DECODER

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
            `ifdef ADD_SUBCARRIER
            `DAC_SRC_IFPATH: begin
                interp0DataIn <= scInterpDataOut;
                interp0ClkEn <= 1'b1;
            end
            `DAC_SRC_SCDEMOD0: begin
                interp0DataIn <= sc_dac0Data;
                interp0ClkEn <= sc_dac0ClkEn;
            end
            `endif
            `ifdef ADD_TRELLIS
            `DAC_SRC_FMTRELLIS: begin
                interp0DataIn <= pcmDac0Data;
                interp0ClkEn <= pcmDac0ClkEn;
            end
            `endif
            `ifdef ADD_SOQPSK
            `DAC_SRC_SOQTRELLIS: begin
                interp0DataIn <= soqDac0Data;
                interp0ClkEn <= soqDac0ClkEn;
            end
            `endif
            `ifdef ADD_MULTIH
            `DAC_SRC_MULTIHTRELLIS: begin
                interp0DataIn <= multih0Out;
                interp0ClkEn <= multih0ClkEn;
            end
            `endif
            `ifdef ADD_LDPC
            `DAC_SRC_LDPC: begin
                interp0DataIn <= ldpcDac0Data;
                interp0ClkEn <= ldpcDac0ClkEn;
            end
            `endif
            `ifdef ADD_BITSYNC
            `DAC_SRC_SBS: begin
                interp0DataIn <= sbsDac0Data;
                interp0ClkEn <= sbsDac0ClkEn;
            end
            `endif
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
        .cs(cs),
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
        `ifdef ADD_SUBCARRIER
        if (dac0Source == `DAC_SRC_IFPATH) begin
            dac0_d[12:0] <= scInterpDataOut[16:4];
            dac0_d[13] <= ~scInterpDataOut[17];
        end
        else begin
            dac0_d[12:0] <= interp0DataOut[16:4];
            dac0_d[13] <= ~interp0DataOut[17];
        end
        `else
        dac0_d[12:0] <= interp0DataOut[16:4];
        dac0_d[13] <= ~interp0DataOut[17];
        `endif
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
            `ifdef ADD_SUBCARRIER
            `DAC_SRC_SCDEMOD0: begin
                interp1DataIn <= sc_dac1Data;
                interp1ClkEn <= sc_dac1ClkEn;
            end
            `endif
            `ifdef ADD_TRELLIS
            `DAC_SRC_FMTRELLIS: begin
                interp1DataIn <= pcmDac1Data;
                interp1ClkEn <= pcmDac1ClkEn;
            end
            `endif
            `ifdef ADD_SOQPSK
            `DAC_SRC_SOQTRELLIS: begin
                interp1DataIn <= soqDac1Data;
                interp1ClkEn <= soqDac1ClkEn;
            end
            `endif
            `ifdef ADD_MULTIH
            `DAC_SRC_MULTIHTRELLIS: begin
                interp1DataIn <= multih1Out;
                interp1ClkEn <= multih1ClkEn;
            end
            `endif
            `ifdef ADD_LDPC
            `DAC_SRC_LDPC: begin
                interp1DataIn <= ldpcDac1Data;
                interp1ClkEn <= ldpcDac1ClkEn;
            end
            `endif
            `ifdef ADD_BITSYNC
            `DAC_SRC_SBS: begin
                interp1DataIn <= sbsDac1Data;
                interp1ClkEn <= sbsDac1ClkEn;
            end
            `endif
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
        .cs(cs),
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
        `ifdef ADD_SUBCARRIER
        if (dac1Source == `DAC_SRC_IFPATH) begin
            dac1_d[12:0] <= scInterpDataOut[16:4];
            dac1_d[13] <= ~scInterpDataOut[17];
        end
        else begin
            dac1_d[12:0] <= interp1DataOut[16:4];
            dac1_d[13] <= ~interp1DataOut[17];
        end
        `else
        dac1_d[12:0] <= interp1DataOut[16:4];
        dac1_d[13] <= ~interp1DataOut[17];
        `endif
    end
    `endif

    `ifndef R6100
    reg     [17:0]  interp2DataIn;
    reg             interp2ClkEn;
    wire    [3:0]   dac2Source;
    always @(posedge clk) begin
        case (dac2Source)
            `DAC_SRC_DEMOD: begin
                interp2DataIn <= demodDac2Data;
                interp2ClkEn <= demodDac2ClkEn;
            end
            `ifdef ADD_SUBCARRIER
            `DAC_SRC_SCDEMOD0: begin
                interp2DataIn <= sc_dac2Data;
                interp2ClkEn <= sc_dac2ClkEn;
            end
            `endif
            `ifdef ADD_TRELLIS
            `DAC_SRC_FMTRELLIS: begin
                interp2DataIn <= pcmDac2Data;
                interp2ClkEn <= pcmDac2ClkEn;
            end
            `endif
            `ifdef ADD_SOQPSK
            `DAC_SRC_SOQTRELLIS: begin
                interp2DataIn <= soqDac2Data;
                interp2ClkEn <= soqDac2ClkEn;
            end
            `endif
            `ifdef ADD_MULTIH
            `DAC_SRC_MULTIHTRELLIS: begin
                interp2DataIn <= multih2Out;
                interp2ClkEn <= multih2ClkEn;
            end
            `endif
            `ifdef ADD_LDPC
            `DAC_SRC_LDPC: begin
                interp2DataIn <= ldpcDac2Data;
                interp2ClkEn <= ldpcDac2ClkEn;
            end
            `endif
            `ifdef ADD_BITSYNC
            `DAC_SRC_SBS: begin
                interp2DataIn <= sbsDac2Data;
                interp2ClkEn <= sbsDac2ClkEn;
            end
            `endif
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
        .cs(cs),
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
        `ifdef ADD_SUBCARRIER
        if (dac2Source == `DAC_SRC_IFPATH) begin
            dac2_d[12:0] <= scInterpDataOut[16:4];
            dac2_d[13] <= ~scInterpDataOut[17];
        end
        else begin
            dac2_d[12:0] <= interp2DataOut[16:4];
            dac2_d[13] <= ~interp2DataOut[17];
        end
        `else
        dac2_d[12:0] <= interp2DataOut[16:4];
        dac2_d[13] <= ~interp2DataOut[17];
        `endif
    end
    `endif  //TEST_DACS

    `endif //not R6100


    assign dac0_clk = clk;
    assign dac1_clk = clk;
    `ifndef R6100
    assign dac2_clk = clk;
    `endif

//******************************************************************************
//                        SDI Output Interface
//******************************************************************************

wire    [31:0]  sdiDout;
sdi sdi(
    .clk(clk),
    .reset(reset),
    .busClk(busClk),
    .cs(cs),
    .wr0(wr0),
    .wr1(wr1),
    .wr2(wr2),
    .wr3(wr3),
    .addr(addr),
    .dataIn(dataIn),
    .dataOut(sdiDout),
    .iSymEn(iDemodBitEn),
    .iSymData(iTrellis),
    .qSymEn(qDemodBitEn),
    .qSymData(qTrellis),
    .eyeSync(demodEyeClkEn),
    .iEye(iDemodEye),.qEye(qDemodEye),
    .eyeOffset(demodEyeOffset),
    .bitsyncLock(timingLock), .demodLock(carrierLock),
    `ifdef ADD_DESPREADER
    .iEpoch(iEpoch), .qEpoch(qEpoch),
    `endif
    .sdiOut(sdiOut)
    );

//******************************************************************************
//                               Output Assignments
//******************************************************************************

    assign adc01_powerDown = 1'b0;
    `ifdef ADD_BITSYNC
    assign bsAdc_powerDown = 1'b0;
    `endif

    assign dac_rst = 1'b1;
    assign dac_sclk = 1'b0;
    assign dac0_nCs = 1'b0;
    assign dac1_nCs = 1'b0;
    assign dac2_nCs = 1'b0;
    assign dac_sdio = 1'b0;

    assign lockLed0n = !timingLock;
    assign lockLed1n = !carrierLock;

    `ifdef R6100

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

    wire    [1:0]   vid0Select;
    wire    [1:0]   vid1Select;
    wire    [31:0]  vsDout;
    vidSwitchRegs vsregs(
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .din(dataIn),
        .dout(vsDout),
        .vid0Select(vid0Select),
        .vid1Select(vid1Select),
        .vid2Select(),
        .vid3Select()
    );

    assign video0InSelect = vid0Select;
    assign video1InSelect = vid1Select;

    //This is to fix an error on the board layout
    always @* begin
        case (vid0Select)
            2'b00: begin
                video0OutSelect = 2'b00;
            end
            2'b01: begin
                video0OutSelect = 2'b10;
            end
            2'b10: begin
                video0OutSelect = 2'b01;
            end
            2'b11: begin
                video0OutSelect = 2'b11;
            end
        endcase
    end
    always @* begin
        case (vid1Select)
            2'b00: begin
                video1OutSelect = 2'b00;
            end
            2'b01: begin
                video1OutSelect = 2'b10;
            end
            2'b10: begin
                video1OutSelect = 2'b01;
            end
            2'b11: begin
                video1OutSelect = 2'b11;
            end
        endcase
    end

    `endif //R6100


    `ifdef ADD_SPECTRAL_SWEEP
    //******************************************************************************
    //                          Spectral Sweep Card
    //******************************************************************************
    wire [31:0] sscDout;
    ssc ssc(
        .atod(adc0In[17:4]),
        .clk(clk),
        .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(addr),
        .dataIn(dataIn),
        .dataOut(sscDout),
        .uartOut(DQMOut)
        );
    `endif  //ADD_SPECTRAL_SWEEP


    `ifdef R6100

    //******************************************************************************
    //                           Processor Read Data Mux
    //******************************************************************************
    always @* begin
        casex(addr)
            `SEMCO_TOP_SPACE:   rd_mux = semcoTopDout;

            `ifdef ADD_SPI_GATEWAY
            `SPIGW_SPACE:       rd_mux = spiGatewayDout;
            `endif

            `ifdef ADD_LDPC
            `LDPCSPACE:         rd_mux = ldpcDout;
            `endif

            `ifdef ADD_RS_DEC
            `RS_DEC_SPACE:      rd_mux = rsDecDout;
            `endif

            `ifdef ADD_DQM
            `DQMLUTSPACE,
            `DQMSPACE:          rd_mux = dqmDout;
            `endif

            `ifdef ADD_BERT
            `BERT_SPACE:        rd_mux = bertDout;
            `endif

            `ifdef ADD_PN_GEN
             `PNGEN_SPACE:      rd_mux = pngenDout;
            `endif

            `ifdef ADD_FRAMER
            `FRAMER_SPACE:      rd_mux = framerDout;
            `endif

            `PRIDEMODSPACE :       rd_mux = demodDout;

            `ifdef ADD_MULTIH
            `MULTIH_SPACE,
            `MULTIHLFSPACE:     rd_mux = multihDout;
            `endif //ADD_MULTIH

            `ifdef ADD_TRELLIS

            `ifdef ADD_SOQPSK
            `TRELLIS_SPACE,
            `TRELLISLFSPACE:    rd_mux = pcmTrellisMode ? trellisDout : soqTrellisDout;
            `else
            `TRELLIS_SPACE,
            `TRELLISLFSPACE:    rd_mux = trellisDout;
            `endif

            `endif //ADD_TRELLIS

            `UARTSPACE,
            `SDISPACE:          rd_mux = sdiDout;

            `ifdef ADD_SUBCARRIER
            `SCIFPATHSPACE:     rd_mux = scIfPathDout;
            `SCDEMODSPACE:      rd_mux = scDemodDout;
            `endif

            `VIDFIR0SPACE,
            `INTERP0SPACE:      rd_mux = interp0Dout;

            `VIDFIR1SPACE,
            `INTERP1SPACE:      rd_mux = interp1Dout;

            `ifdef ADD_VITERBI
            `VITERBISPACE:      rd_mux = vitDout;
            `endif

            `DUAL_DECODERSPACE: rd_mux = dualDecDout;

            `CH1_DECODERSPACE:  rd_mux = ch1DecDout;

            `CandD0SPACE:       rd_mux = cAndD0Dout;
            `CandD1SPACE:       rd_mux = cAndD1Dout;

            `VIDSWITCHSPACE:    rd_mux = vsDout;

            `ifdef ADD_SPECTRAL_SWEEP
            `SSCSPACE:          rd_mux = sscDout;
            `endif

            `ifdef ADD_BITSYNC
            `SBS_TOP_SPACE,
            `SBS_DFSPACE,
            `SBS_DFFIRSPACE,
            `SBS_RESAMPSPACE,
            `SBS_BITSYNCSPACE,
            `SBS_AGCSPACE:      rd_mux = sbsDout;
            `endif

             default :          rd_mux = 32'hxxxx;
        endcase
    end

    `else //R6100

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
            `ifdef ADD_SPI_GATEWAY
            `SPIGW_SPACE:       begin
                if (addr[1]) begin
                    rd_mux = spiGatewayDout[31:16];
                end
                else begin
                    rd_mux = spiGatewayDout[15:0];
                end
            end
            `endif

            `ifdef ADD_LDPC
            `LDPCSPACE:         begin
                if (addr[1]) begin
                    rd_mux = ldpcDout[31:16];
                end
                else begin
                    rd_mux = ldpcDout[15:0];
                end
            end
            `endif

            `ifdef ADD_RS_DEC
            `RS_DEC_SPACE:         begin
                if (addr[1]) begin
                    rd_mux = rsDecDout[31:16];
                end
                else begin
                    rd_mux = rsDecDout[15:0];
                end
            end
            `endif

            `ifdef ADD_DQM
            `DQMLUTSPACE,
            `DQMSPACE:         begin
                if (addr[1]) begin
                    rd_mux = dqmDout[31:16];
                end
                else begin
                    rd_mux = dqmDout[15:0];
                end
            end
            `endif

            `ifdef ADD_BERT
            `BERT_SPACE:        begin
                if (addr[1]) begin
                    rd_mux = bertDout[31:16];
                end
                else begin
                    rd_mux = bertDout[15:0];
                end
            end
            `endif

            `ifdef ADD_FRAMER
            `FRAMER_SPACE:        begin
                if (addr[1]) begin
                    rd_mux = framerDout[31:16];
                end
                else begin
                    rd_mux = framerDout[15:0];
                end
            end
            `endif

            `ifdef ADD_PN_GEN
             `PNGEN_SPACE:      begin
                if (addr[1]) begin
                    rd_mux = pngenDout[31:16];
                end
                else begin
                    rd_mux = pngenDout[15:0];
                end
            end
            `endif

            `PRIDEMODSPACE: begin
                if (addr[1]) begin
                    rd_mux = demodDout[31:16];
                end
                else begin
                    rd_mux = demodDout[15:0];
                end
            end
            `ifdef ADD_MULTIH
            `MULTIH_SPACE,
            `MULTIHLFSPACE: begin
                if (addr[1]) begin
                    rd_mux = multihDout[31:16];
                end
                else begin
                    rd_mux = multihDout[15:0];
                end
            end
            `endif //ADD_MULTIH

            `ifdef ADD_TRELLIS

            `ifdef ADD_SOQPSK
            `TRELLIS_SPACE,
            `TRELLISLFSPACE: begin
                if (addr[1]) begin
                    rd_mux = pcmTrellisMode ? trellisDout[31:16] : soqTrellisDout[31:16];
                end
                else begin
                    rd_mux = pcmTrellisMode ? trellisDout[15:0] : soqTrellisDout[15:0];
                end
            end
            `else
            `TRELLIS_SPACE,
            `TRELLISLFSPACE: begin
                if (addr[1]) begin
                    rd_mux = trellisDout[31:16];
                end
                else begin
                    rd_mux = trellisDout[15:0];
                end
            end
            `endif //ADD_SOQPSK

            `endif //ADD_TRELLIS

            `UARTSPACE,
            `SDISPACE: begin
                if (addr[1]) begin
                    rd_mux = sdiDout[31:16];
                end
                else begin
                    rd_mux = sdiDout[15:0];
                end
            end
            `ifdef ADD_SUBCARRIER
            `SCCIFPATHSPACE: begin
                if (addr[1]) begin
                    rd_mux = scIfPathDout[31:16];
                end
                else begin
                    rd_mux = scIfPathDout[15:0];
                end
            end
            `SCDEMODSPACE: begin
                if (addr[1]) begin
                    rd_mux = scDemodDout[31:16];
                end
                else begin
                    rd_mux = scDemodDout[15:0];
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

            `ifdef ADD_VITERBI
            `VITERBISPACE: begin
                if (addr[1]) begin
                    rd_mux = vitDout[31:16];
                    end
                else begin
                    rd_mux = vitDout[15:0];
                    end
                end
            `endif

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

            `ifdef ADD_BITSYNC
            `SBS_TOP_SPACE,
            `SBS_DFSPACE,
            `SBS_DFFIRSPACE,
            `SBS_RESAMPSPACE,
            `SBS_BITSYNCSPACE,
            `SBS_AGCSPACE: begin
                if (addr[1]) begin
                    rd_mux = sbsDout[31:16];
                end
                else begin
                    rd_mux = sbsDout[15:0];
                end
            end
            `endif

             default : rd_mux = 16'hxxxx;
            endcase
         end

    assign fb_data = (cs & rd) ? rd_mux : 16'hzzzz;

    `endif //R6100


endmodule

