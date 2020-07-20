/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "./addressMap.v"
`timescale 1ns / 10 ps

module scIfPath(
    clk, reset,
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    bbClkEn,
    iBB, qBB,
    demodMode,
    scDemodOut,
    scClkEn
    );

input           clk;
input           reset;
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input           bbClkEn;
input   [17:0]  iBB;
input   [17:0]  qBB;
input   [4:0]   demodMode;
output  [17:0]  scDemodOut;
output          scClkEn;


/******************************************************************************
                                Downconverter
******************************************************************************/
wire    [17:0]  iDdc,qDdc;
wire    [20:0]  nbAgcGain;
wire    [31:0]  leadFreq;
wire    [31:0]  ddcDout;
scDdc scDdc(
    .clk(clk), .reset(reset),
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
channelAGC #(.RegSpace(`SCAGCSPACE)) scChannelAGC(
    .clk(clk), .reset(reset), .syncIn(ddcClkEn),
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
wire    [11:0]   scPhase;
wire    [11:0]   scFreq;
wire    [11:0]   negScFreq = ~scFreq + 1;
wire    [17:0]   scFM = {negScFreq,6'h0};
fmDemodWithCE scDemod(
    .clk(clk), .reset(reset), 
    .sync(ddcClkEn),
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
carrierLoop #(.RegSpace(`SCCARRIERSPACE)) scCarrierLoop(
    .clk(clk), .reset(reset),
    .resampSync(),
    .ddcSync(ddcClkEn),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(carrierLoopDout),
    .demodMode(demodMode),
    .phase(phase),
    .freq(freq),
    .highFreqOffset(),
    .offsetError(),
    .offsetErrorEn(),
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
reg     [17:0]  scDemodOut;
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
reg [31:0]dout;
always @* begin
    casex (addr)
        `SCAGCSPACE:        dout = agcDout;
        `SCCICDECSPACE,
        `SCDDCFIRSPACE,
        `SCDDCSPACE:        dout = ddcDout;
        `SCCARRIERSPACE:    dout = carrierLoopDout;
        default:            dout = 32'bx;
        endcase
    end



endmodule

