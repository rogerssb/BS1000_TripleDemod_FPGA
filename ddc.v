`timescale 1ns / 10 ps
`include ".\addressMap.v"

`define USE_DDC_FIR

module ddc( clk, reset, syncIn, 
            wr0,wr1,wr2,wr3,
            addr,
            din,
            dout,
            ddcFreqOffset,
            leadFreq,
            offsetEn,
            nbAgcGain,
            syncOut,
            iIn, qIn, 
            iOut, qOut);

input           clk;
input           reset;
input           syncIn;
input           wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [31:0]  ddcFreqOffset;
input   [31:0]  leadFreq;
input           offsetEn;
input   [20:0]  nbAgcGain;
output          syncOut;
input   [17:0]  iIn;
input   [17:0]  qIn;
output  [17:0]  iOut;
output  [17:0]  qOut;


// Microprocessor interface
reg ddcSpace;
reg ddcFirSpace;
always @(addr) begin
    casex(addr)
        `DDCSPACE:      ddcSpace <= 1;
        `DDCFIRSPACE:   ddcFirSpace <= 1;
        default:   begin
                        ddcSpace <= 0;
                        ddcFirSpace <= 0;
            end
        endcase
    end

wire [31:0]ddcCenterFreq;
wire [31:0]ddcDout;
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
    .ddcCenterFreq(ddcCenterFreq)
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
    ddcFreq <= ddcFreqOffset - ddcCenterFreq;
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
    .clk(clk), .reset(hbReset), .sync(syncIn),
`else
halfbandDecimate hb0( 
    .clk(clk), .reset(reset), .sync(syncIn),
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
        cicClockEn <= hb0SyncOut;
        iCicIn <= iHb0;
        qCicIn <= qHb0;
        end
    end

// CIC Decimator
wire [47:0]iCic,qCic;
wire cicSyncOut;
wire [31:0]cicDout;
`ifdef SIMULATE
reg cicReset;
dualDecimator cic( 
    .clk(clk), .reset(cicReset), .sync(cicClockEn),
`else
dualDecimator cic( 
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
        iAgcIn <= {iHb0,30'h0};
        qAgcIn <= {qHb0,30'h0};
        agcSync <= hb0SyncOut;
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
cicComp cicCompI(
    .clk(clk), 
    .reset(reset),
    .sync(agcSync), 
    .compIn(iAgc),
    .compOut(iComp)
    );
cicComp cicCompQ(
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
    .iIn(iHb),.qIn(qHb),
    .iOut(iFir),.qOut(qFir)
    );

reg     [17:0]  iBB,qBB;
reg             syncOut;
always @(posedge clk) begin
    if (bypassFir) begin
        iBB <= iHb;
        qBB <= qHb;
        syncOut <= hbSyncOut;
        if (bypassHb) begin
            syncOut <= agcSync;
            iBB <= iMux;
            qBB <= qMux;
            end
        else begin
            syncOut <= hbSyncOut;
            iBB <= iHb;
            qBB <= qHb;
            end
        end
    else begin
        iBB <= iFir;
        qBB <= qFir;
        syncOut <= firClockEn;
        end
    end
`else
reg     [17:0]  iBB;
reg     [17:0]  qBB;
reg             syncOut;
always @(posedge clk) begin
    if (bypassHb) begin
        iBB <= iMux;
        qBB <= qMux;
        syncOut <= agcSync;
        end
    else begin
        iBB <= iHb;
        qBB <= qHb;
        syncOut <= hbSyncOut;
        end
    end

`endif

// Lead Complex Mixer
wire    [17:0]iLeadDds;
wire    [17:0]qLeadDds;
dds leadDds ( 
    .sclr(reset), 
    .clk(clk), 
    .ce(1'b1),
    .we(1'b1), 
    .data(leadFreq), 
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
    .aReal(iBB),
    .aImag(qBB),
    .bReal(iLeadDds),
    .bImag(qLeadDds),
    .pReal(iLead),
    .pImag(qLead)
    );

reg     [17:0]  iOut,qOut;
always @(posedge clk) begin
    if (syncOut) begin
        iOut <= iLead;
        qOut <= qLead;
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
always @(addr or cicDout or ddcDout or ddcFirDout) begin
    casex (addr)
        `DDCSPACE:          dout <= ddcDout;
        `DDCFIRSPACE:       dout <= ddcFirDout;
        `CICDECSPACE:       dout <= cicDout;    
        default:            dout <= 32'bx;
        endcase
    end
`else
reg [31:0]dout;
always @(addr or cicDout or ddcDout) begin
    casex (addr)
        `DDCSPACE:          dout <= ddcDout;
        `CICDECSPACE:       dout <= cicDout;    
        default:            dout <= 32'bx;
        endcase
    end
`endif

endmodule
                     
