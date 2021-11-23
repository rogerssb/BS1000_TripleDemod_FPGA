/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include ".\addressMap.v"

`define USE_DDC_FIR

module scDdc(
    clk, reset,
    `ifdef USE_BUS_CLOCK
    busClk,
    `endif
    cs,
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    scFreq,
    offsetEn,
    nbAgcGain,
    iBB, qBB,
    bbClkEn,
    syncOut,
    iOut, qOut
    );

input           clk;
input           reset;
`ifdef USE_BUS_CLOCK
input           busClk;
`endif
input           cs;
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [31:0]  scFreq;
input           offsetEn;
input   [20:0]  nbAgcGain;
input   [17:0]  iBB;
input   [17:0]  qBB;
input           bbClkEn;
output          syncOut;
output  [17:0]  iOut;
output  [17:0]  qOut;


// Microprocessor interface
reg ddcSpace;
always @* begin
    casex(addr)
        `DDCSPACE:   ddcSpace    = cs;
        default:     ddcSpace    = 0;
        endcase
    end

wire    [31:0]  ddcCenterFreq;
wire    [7:0]   adcDecimation;
wire    [31:0]  ddcDout;
ddcRegs micro(
    .addr(addr),
    .dataIn(din),
    .dataOut(ddcDout),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
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
        cicClockEn <= bbClkEn;
        iCicIn <= iBB;
        qCicIn <= qBB;
        end
    end

// CIC Decimator
wire [47:0]iCic,qCic;
wire cicSyncOut;
wire [31:0]cicDout;
`ifdef SIMULATE
reg cicReset;
dualDecimator #(.RegSpace(`CICDECSPACE)) cic(
    .clk(clk), .reset(cicReset), .clkEn(cicClockEn),
`else
dualDecimator #(.RegSpace(`CICDECSPACE)) cic(
    .clk(clk), .reset(reset), .clkEn(cicClockEn),
`endif
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(cs),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(cicDout),
    .inI(iCicIn),.inQ(qCicIn),
    .outI(iCic),.outQ(qCic),
    .clkEnOut(cicSyncOut)
    );

reg     [47:0]  iAgcIn,qAgcIn;
reg             agcSync;
always @(posedge clk) begin
    if (bypassCic) begin
        iAgcIn <=  {iBB,30'h0};
        qAgcIn <=  {qBB,30'h0};
        agcSync <= bbClkEn;
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
    .clkEn(agcSync),
    .compIn(iAgc),
    .compOut(iComp)
    );
cicComp cicCompQ(
    .clk(clk),
    .reset(reset),
    .clkEn(agcSync),
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
dualHalfbandDecimate hb(
`ifdef SIMULATE
    .clk(clk), .reset(cicReset), .clkEn(hbClockEn),
`else
    .clk(clk), .reset(reset), .clkEn(hbClockEn),
`endif
    .iIn(iHbIn),.qIn(qHbIn),
    .iOut(iHb),.qOut(qHb),
    .clkEnOut(hbSyncOut)
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
dualFir #(.RegSpace(`DDCFIRSPACE)) dualFir (
    .clk(clk), .reset(reset), .clkEn(firClockEn),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(cs),
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
        newLead <= scFreq;
        end
    end

// Lead Complex Mixer
`ifdef USE_VIVADO_CORES
`ifdef SIMULATE
reg ddsSimReset;
initial ddsSimReset = 0;
wire ddsReset = ddsSimReset || reset;
`else
wire ddsReset = reset;
`endif
wire    [47:0]  lead_m_axis;
wire    [17:0]  qLeadDds = lead_m_axis[41:24];
wire    [17:0]  iLeadDds = lead_m_axis[17:0];
dds6p0 leadDds(
  .aclk(clk),
  .aclken(1'b1),
  .aresetn(!ddsReset),
  .m_axis_data_tdata(lead_m_axis),
  .m_axis_data_tvalid(),
  .s_axis_phase_tdata(newLead),
  .s_axis_phase_tvalid(1'b1)
);
`else
wire    [17:0]iLeadDds;
wire    [17:0]qLeadDds;
dds leadDds (
    .sclr(reset),
    .clk(clk),
    .ce(1'b1),
    .we(1'b1),
    //.data(scFreq),
    .data(newLead),
    .sine(qLeadDds),
    .cosine(iLeadDds)
    );
`endif
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
        `DDCSPACE:         dout = ddcDout;
        `DDCFIRSPACE:      dout = ddcFirDout;
        `CICDECSPACE:      dout = cicDout;
        default:            dout = 32'bx;
        endcase
    end
`else
reg [31:0]dout;
always @* begin
    casex (addr)
        `DDCSPACE:         dout = ddcDout;
        `CICDECSPACE:      dout = cicDout;
        default:            dout = 32'bx;
        endcase
    end
`endif

endmodule

