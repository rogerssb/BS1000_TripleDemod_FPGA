/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "./addressMap.v"
`timescale 1ns / 10 ps

module scIfPath(
    input                       clk, reset,
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output  reg         [31:0]  dout,
    input                       bbClkEn,
    input       signed  [17:0]  iBB,
    input       signed  [17:0]  qBB,
    input               [4:0]   demodMode,
    output  reg signed  [17:0]  scDemodOut,
    output                      scClkEn
);

/******************************************************************************
                                Downconverter
******************************************************************************/
    wire    signed  [17:0]  iDdc,qDdc;
    wire            [20:0]  nbAgcGain;
    wire    signed  [31:0]  leadFreq;
    wire            [31:0]  ddcDout;
    scDdc scDdc(
        .clk(clk), .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(ddcDout),
        .scFreq(leadFreq),
        .offsetEn(offsetEn),
        .nbAgcGain(nbAgcGain),
        .bbClkEn(bbClkEn),
        .iBB(iBB), .qBB(qBB),
        .iOut(iDdc), .qOut(qDdc),
        .syncOut(ddcClkEn)
    );

/******************************************************************************
                            Narrowband Channel AGC
******************************************************************************/
    wire    [31:0]  agcDout;
    channelAGC #(.RegSpace(`CHAGCSPACE)) scChannelAGC(
        .clk(clk), .reset(reset), .clkEn(ddcClkEn),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(agcDout),
        .iIn(iDdc),.qIn(qDdc),
        .agcGain(nbAgcGain)
    );

/******************************************************************************
                           Phase/Freq/Mag Detector
******************************************************************************/
    wire    signed  [11:0]   scPhase;
    wire    signed  [11:0]   scFreq;
    wire    signed  [11:0]   negScFreq = $signed(~scFreq + 1);
    wire    signed  [17:0]   scFM = $signed({negScFreq,6'h0});
    fmDemodWithCE scDemod(
        .clk(clk), .reset(reset),
        .clkEn(ddcClkEn),
        .iFm(iDdc),.qFm(qDdc),
        .demodMode(demodMode),
        .phase(scPhase),
        .phaseError(),
        .freq(scFreq),
        .freqError(),
        .mag()
    );

/******************************************************************************
                             AFC/Sweep/Costas Loop
******************************************************************************/
    wire    [31:0]  carrierLoopDout;
    carrierLoop #(.RegSpace(`CARRIERSPACE)) scCarrierLoop(
        .clk(clk), .reset(reset),
        .resampClkEn(1'b0),
        .ddcClkEn(ddcClkEn),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(carrierLoopDout),
        .demodMode(demodMode),
        .phase(scPhase),
        .freq(scFreq),
        .highFreqOffset(1'b0),
        .offsetError(12'b0),
        .offsetErrorEn(1'b0),
        .carrierFreqOffset(),
        .carrierLeadFreq(leadFreq),
        .carrierFreqEn(offsetEn),
        .loopError(),
        .carrierLock(),
        .lockCounter()
    );

/******************************************************************************
                              Output Mux
******************************************************************************/
    always @(posedge clk) begin
        if (ddcClkEn) begin
            casex (demodMode)
                `MODE_FM,
                `MODE_2FSK,
                `MODE_PCMTRELLIS:
                    scDemodOut <= scFM;
                `MODE_MULTIH,
                `MODE_PM,
                `MODE_BPSK,
                `MODE_QPSK,
                `MODE_OQPSK,
                `MODE_AQPSK,
                `MODE_SOQPSK,
                `MODE_AUQPSK,
                `MODE_UQPSK:
                    scDemodOut <= {scPhase,6'b0};

                default:
                    scDemodOut <= scFM;
            endcase
        end
    end
    assign scClkEn = ddcClkEn;

/******************************************************************************
                                uP dout mux
******************************************************************************/
    always @* begin
        casex (addr)
            `CHAGCSPACE:        dout = agcDout;
            `CICDECSPACE,
            `DDCFIRSPACE,
            `DDCSPACE:          dout = ddcDout;
            `CARRIERSPACE:      dout = carrierLoopDout;
            default:            dout = 32'bx;
        endcase
    end



endmodule

