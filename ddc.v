`timescale 1ns / 10 ps
`include ".\addressMap.v"


module ddc( 
    clk, reset,
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    ddcFreqOffset,
    leadFreq,
    offsetEn,
    nbAgcGain,
    bbClkEn,
    iBB, qBB,
    iIn, qIn, 
    iLagOut, qLagOut,
    lagClkEn,
    syncOut,
    iOut, qOut
    );

input           clk;
input           reset;
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [31:0]  ddcFreqOffset;
input   [31:0]  leadFreq;
input           offsetEn;
input   [20:0]  nbAgcGain;
input           bbClkEn;
input   [17:0]  iBB;
input   [17:0]  qBB;
input   [17:0]  iIn;
input   [17:0]  qIn;
output  [17:0]  iLagOut;
output  [17:0]  qLagOut;
output          lagClkEn;
output          syncOut;
output  [17:0]  iOut;
output  [17:0]  qOut;


// Microprocessor interface
reg ddcSpace;
reg ddcFirSpace;
always @* begin
    casex(addr)
        `DDCSPACE: begin
            ddcSpace    = 1;
            ddcFirSpace = 0;
            end
        `DDCFIRSPACE: begin
            ddcSpace    = 0;
            ddcFirSpace = 1;
            end
        default:   begin
            ddcSpace    = 0;
            ddcFirSpace = 0;
            end
        endcase
    end

wire    [31:0]  ddcCenterFreq;
wire    [7:0]   adcDecimation;
wire    [31:0]  ddcDout;
ddcRegs micro(
    .addr(addr),
    .dataIn(din),
    .dataOut(ddcDout),
    .cs(ddcSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .bypassCic(bypassCic),
    .bypassHb(bypassHb),
    `ifdef USE_DDC_FIR
    .bypassFir(bypassFir),
    `endif
    .enableBasebandInputs(enableBasebandInputs),
    .ddcCenterFreq(ddcCenterFreq),
    .adcDecimation(adcDecimation)
    );


// Create the LO frequency
reg [31:0] ddcFreq;
reg [31:0] newOffset;
always @(posedge clk) begin
    if (reset) begin
        newOffset <= 0;
        end
    else if (offsetEn) begin
        newOffset <= ddcFreqOffset;
        end
    //ddcFreq <= ddcFreqOffset - ddcCenterFreq;
    ddcFreq <= newOffset - ddcCenterFreq;
    end


// LO Generator
wire    [17:0]iDds;
wire    [17:0]qDds;
dds dds ( 
    .sclr(reset), 
    .clk(clk), 
    .ce(1'b1),
    .we(1'b1), 
    .data(ddcFreq), 
    .sine(qDds), 
    .cosine(iDds)
    );
`ifdef SIMULATE
real iDdsReal;
real qDdsReal;
always @(iDds) iDdsReal = ((iDds > 131071.0) ? (iDds - 262144.0) : iDds)/131072.0;
always @(qDds) qDdsReal = ((qDds > 131071.0) ? (qDds - 262144.0) : qDds)/131072.0;

`endif


// Complex Multiplier
wire [17:0]iMix;
wire [17:0]qMix;
cmpy18 mixer( .clk(clk),
              .reset(reset),
              .aReal(iIn),
              .aImag(qIn),
              .bReal(iDds),
              .bImag(qDds),
              .pReal(iMix),
              .pImag(qMix)
              );
`ifdef SIMULATE
real iMixReal;
real qMixReal;
always @(iMix) iMixReal = ((iMix > 131071.0) ? (iMix - 262144.0) : iMix)/131072.0;
always @(qMix) qMixReal = ((qMix > 131071.0) ? (qMix - 262144.0) : qMix)/131072.0;
`endif


// First Halfband Filters
wire [17:0]iHb0,qHb0;
`ifdef SIMULATE
reg hbReset;
halfbandDecimate hb0( 
    .clk(clk), .reset(hbReset), .sync(1'b1),
`else
halfbandDecimate hb0( 
    .clk(clk), .reset(reset), .sync(1'b1),
`endif
    .iIn(iMix),.qIn(qMix),
    .iOut(iHb0),.qOut(qHb0),
    .syncOut(hb0SyncOut)
    );

`ifdef SIMULATE
real iHb0Real;
real qHb0Real;
always @(iHb0) iHb0Real = ((iHb0 > 131071.0) ? (iHb0 - 262144.0) : iHb0)/131072.0;
always @(qHb0) qHb0Real = ((qHb0 > 131071.0) ? (qHb0 - 262144.0) : qHb0)/131072.0;
`endif

assign iLagOut = iHb0;
assign qLagOut = qHb0;
assign lagClkEn = hb0SyncOut;

// Programmable Clock Decimation. Depends on external SAW filters for this to 
// work without aliasing
reg     [7:0]   adcDecimationCount;
reg             adcClkEn;
always @(posedge clk) begin
    if (reset) begin
        adcDecimationCount <= 0;
        end
    else if (hb0SyncOut) begin
        if (adcDecimationCount == 0) begin
            adcDecimationCount <= adcDecimation;
            adcClkEn <= 1;
            end
        else begin
            adcDecimationCount <= adcDecimationCount - 1;
            adcClkEn <= 0;
            end
        end
    end


// If bypassing the CIC decimator, force its clock enable off to save power
reg     [17:0]  iCicIn,qCicIn;
reg             cicClockEn;
always @(posedge clk) begin      
    if (bypassCic) begin
        cicClockEn <= 0;
        iCicIn <= 0;
        qCicIn <= 0;
        end
    else begin
        `define ADD_BB
        `ifdef ADD_BB
        cicClockEn <= (enableBasebandInputs ? bbClkEn : hb0SyncOut) & adcClkEn;
        iCicIn <= (enableBasebandInputs ? iBB : iHb0);
        qCicIn <= (enableBasebandInputs ? qBB : qHb0);
        `else
        cicClockEn <= hb0SyncOut & adcClkEn;
        iCicIn <= iHb0;
        qCicIn <= qHb0;
        `endif
        end
    end

// CIC Decimator
wire [47:0]iCic,qCic;
wire cicSyncOut;
wire [31:0]cicDout;
`ifdef SIMULATE
reg cicReset;
dualDecimator #(.RegSpace(`CICDECSPACE)) cic( 
    .clk(clk), .reset(cicReset), .sync(cicClockEn),
`else
dualDecimator #(.RegSpace(`CICDECSPACE)) cic( 
    .clk(clk), .reset(reset), .sync(cicClockEn),
`endif
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(cicDout),
    .inI(iCicIn),.inQ(qCicIn),
    .outI(iCic),.outQ(qCic),
    .syncOut(cicSyncOut)
    );

reg     [47:0]  iAgcIn,qAgcIn;
reg             agcSync;
always @(posedge clk) begin
    if (bypassCic) begin
        `ifdef ADD_BB
        iAgcIn <=   enableBasebandInputs ? {iBB,30'h0} : {iHb0,30'h0};
        qAgcIn <=   enableBasebandInputs ? {qBB,30'h0} : {qHb0,30'h0};
        agcSync <= (enableBasebandInputs ? bbClkEn : hb0SyncOut) & adcClkEn;
        `else
        iAgcIn <=  {iHb0,30'h0};
        qAgcIn <=  {qHb0,30'h0};
        agcSync <= hb0SyncOut & adcClkEn;
        `endif
        end
    else begin
        iAgcIn <= iCic;
        qAgcIn <= qCic;
        agcSync <= cicSyncOut;
        end
    end

wire    [17:0]  iAgc,qAgc;
variableGain gainI(
    .clk(clk), .clkEn(agcSync),
    .exponent(nbAgcGain[20:16]), .mantissa(nbAgcGain[15:0]),
    .din(iAgcIn),
    .dout(iAgc)
    );
variableGain gainQ(
    .clk(clk), .clkEn(agcSync),
    .exponent(nbAgcGain[20:16]), .mantissa(nbAgcGain[15:0]),
    .din(qAgcIn),
    .dout(qAgc)
    );

`ifdef SIMULATE
real iAgcReal;
real qAgcReal;
always @(iAgc) iAgcReal = ((iAgc > 131071.0) ? (iAgc - 262144.0) : iAgc)/131072.0;
always @(qAgc) qAgcReal = ((qAgc > 131071.0) ? (qAgc - 262144.0) : qAgc)/131072.0;
`endif

// CIC Compensation
wire    [17:0]  iComp,qComp;
`ifdef DDC_CIC_COMP_USE_MPY
cicCompMpy cicCompI(
`else
cicComp cicCompI(
`endif
    .clk(clk), 
    .reset(reset),
    .sync(agcSync), 
    .compIn(iAgc),
    .compOut(iComp)
    );
`ifdef DDC_CIC_COMP_USE_MPY
cicCompMpy cicCompQ(
`else
cicComp cicCompQ(
`endif
    .clk(clk), 
    .reset(reset),
    .sync(agcSync), 
    .compIn(qAgc),
    .compOut(qComp)
    );
`ifdef SIMULATE
real iCompReal;
real qCompReal;
always @(iComp) iCompReal = ((iComp > 131071.0) ? (iComp - 262144.0) : iComp)/131072.0;
always @(qComp) qCompReal = ((qComp > 131071.0) ? (qComp - 262144.0) : qComp)/131072.0;
`endif
wire    [17:0]  iMux = bypassCic ? iAgc : iComp;
wire    [17:0]  qMux = bypassCic ? qAgc : qComp;


// If bypassing the second halfband, force its clock enable off to save power
reg     [17:0]  iHbIn,qHbIn;
reg             hbClockEn;
always @(posedge clk) begin      
    if (bypassHb) begin
        hbClockEn <= 0;
        iHbIn <= 0;
        qHbIn <= 0;
        end
    else begin
        hbClockEn <= agcSync;
        iHbIn <= iMux;
        qHbIn <= qMux;
        end
    end

// Second Halfband Filter
wire [17:0]iHb,qHb;
halfbandDecimate hb( 
`ifdef SIMULATE
    .clk(clk), .reset(cicReset), .sync(hbClockEn),
`else
    .clk(clk), .reset(reset), .sync(hbClockEn),
`endif
    .iIn(iHbIn),.qIn(qHbIn),
    .iOut(iHb),.qOut(qHb),
    .syncOut(hbSyncOut)
    );

`ifdef SIMULATE
real iHbReal;
real qHbReal;
always @(iHb) iHbReal = ((iHb > 131071.0) ? (iHb - 262144.0) : iHb)/131072.0;
always @(qHb) qHbReal = ((qHb > 131071.0) ? (qHb - 262144.0) : qHb)/131072.0;
`endif

`ifdef USE_DDC_FIR
reg     [17:0]  iFirIn;
reg     [17:0]  qFirIn;
reg             firClockEn;
always @(posedge clk) begin
    if (bypassFir) begin
        firClockEn <= 0;
        iFirIn <= 0;
        qFirIn <= 0;
        end
    else begin
        if (bypassHb) begin
            firClockEn <= agcSync;
            iFirIn <= iMux;
            qFirIn <= qMux;
            end
        else begin
            firClockEn <= hbSyncOut;
            iFirIn <= iHb;
            qFirIn <= qHb;
            end
        end
    end

wire    [31:0]  ddcFirDout;
wire    [17:0]  iFir,qFir;
dualFir dualFir ( 
    .clk(clk), .reset(reset), .syncIn(firClockEn),
    .cs(ddcFirSpace), 
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(ddcFirDout),
    .iIn(iFirIn),.qIn(qFirIn),
    .iOut(iFir),.qOut(qFir)
    );

reg     [17:0]  iLeadIn,qLeadIn;
reg             syncOut;
always @(posedge clk) begin
    if (bypassFir) begin
        if (bypassHb) begin
            syncOut <= agcSync;
            iLeadIn <= iMux;
            qLeadIn <= qMux;
            end
        else begin
            syncOut <= hbSyncOut;
            iLeadIn <= iHb;
            qLeadIn <= qHb;
            end
        end
    else begin
        iLeadIn <= iFir;
        qLeadIn <= qFir;
        syncOut <= firClockEn;
        end
    end
`else
reg     [17:0]  iLeadIn;
reg     [17:0]  qLeadIn;
reg             syncOut;
always @(posedge clk) begin
    if (bypassHb) begin
        iLeadIn <= iMux;
        qLeadIn <= qMux;
        syncOut <= agcSync;
        end
    else begin
        iLeadIn <= iHb;
        qLeadIn <= qHb;
        syncOut <= hbSyncOut;
        end
    end

`endif

// Create the LO frequency
reg [31:0] newLead;
always @(posedge clk) begin
    if (reset) begin
        newLead <= 0;
        end
    else if (offsetEn) begin
        newLead <= leadFreq;
        end
    end

// Lead Complex Mixer
wire    [17:0]iLeadDds;
wire    [17:0]qLeadDds;
dds leadDds ( 
    .sclr(reset), 
    .clk(clk), 
    .ce(1'b1),
    .we(1'b1), 
    //.data(leadFreq), 
    .data(newLead), 
    .sine(qLeadDds), 
    .cosine(iLeadDds)
    );
`ifdef SIMULATE
real iLeadDdsReal;
real qLeadDdsReal;
always @(iLeadDds) iLeadDdsReal = ((iLeadDds > 131071.0) ? (iLeadDds - 262144.0) : iLeadDds)/131072.0;
always @(qLeadDds) qLeadDdsReal = ((qLeadDds > 131071.0) ? (qLeadDds - 262144.0) : qLeadDds)/131072.0;

`endif


// Complex Multiplier
wire    [17:0]  iLead,qLead;
cmpy18 leadMixer( 
    .clk(clk),
    .reset(reset),
    .aReal(iLeadIn),
    .aImag(qLeadIn),
    .bReal(iLeadDds),
    .bImag(qLeadDds),
    .pReal(iLead),
    .pImag(qLead)
    );

reg     [17:0]  iLeadOut,qLeadOut;
reg     [17:0]  iOut,qOut;
always @(posedge clk) begin
    if (syncOut) begin
        iLeadOut <= iLead;
        qLeadOut <= qLead;
        if (enableBasebandInputs) begin
            iOut <= iLeadIn;
            qOut <= qLeadIn;
            end
        else begin
            iOut <= iLeadOut;
            qOut <= qLeadOut;
            end
        end
    end

`ifdef SIMULATE
real iOutReal;
real qOutReal;
always @(iOut) iOutReal = ((iOut > 131071.0) ? (iOut - 262144.0) : iOut)/131072.0;
always @(qOut) qOutReal = ((qOut > 131071.0) ? (qOut - 262144.0) : qOut)/131072.0;
`endif


`ifdef USE_DDC_FIR
reg [31:0]dout;
always @* begin
    casex (addr)
        `DDCSPACE:          dout = ddcDout;
        `DDCFIRSPACE:       dout = ddcFirDout;
        `CICDECSPACE:       dout = cicDout;    
        default:            dout = 32'bx;
        endcase
    end
`else
reg [31:0]dout;
always @* begin
    casex (addr)
        `DDCSPACE:          dout = ddcDout;
        `CICDECSPACE:       dout = cicDout;    
        default:            dout = 32'bx;
        endcase
    end
`endif

endmodule
                     
