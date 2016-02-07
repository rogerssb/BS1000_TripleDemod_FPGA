/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include ".\addressMap.v"


module decimatingFilter( 
    clk, reset, clkEn,
    `ifdef USE_BUS_CLOCK
    busClk,
    `endif
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    nbAgcGain,
    rx,
    clkEnOut,
    dfOut
    );

parameter RegSpace = `CH0_DFSPACE,
          FirSpace = `CH0_DFFIRSPACE;

input           clk;
input           reset;
input           clkEn;
`ifdef USE_BUS_CLOCK
input           busClk;
`endif
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [20:0]  nbAgcGain;
input   [17:0]  rx;
output          clkEnOut;
output  [17:0]  dfOut;


// Microprocessor interface
reg dfSpace;
always @* begin
    casex(addr)
        RegSpace:   dfSpace    = 1;
        default:    dfSpace    = 0;
        endcase
    end

wire    [5:0]   cicShift;
wire    [14:0]  cicDecimation;
wire    [31:0]  dfDout;
dfRegs micro(
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .addr(addr),
    .dataIn(din),
    .dataOut(dfDout),
    .cs(dfSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .bypassHb0(bypassHb0),
    .bypassCic(bypassCic),
    .bypassHb1(bypassHb1),
    .bypassFir(bypassFir),
    .cicShift(cicShift),
    .cicDecimation(cicDecimation)
    );

// If bypassing HB0, force its clock enable off to save power
reg     [17:0]  hb0In;
reg             hb0ClkEn;
always @(posedge clk) begin
    if (bypassHb0) begin
        hb0In <= 0;
        hb0ClkEn <= 0;
        end
    else begin
        hb0In <= rx;
        hb0ClkEn <= clkEn;
        end
    end

// First Halfband Filters
wire    [17:0]  hb0Out;
`ifdef SIMULATE
reg dfReset;
halfbandDecimate hb0( 
    .clk(clk), .reset(dfReset), .sync(hb0ClkEn),
`else
halfbandDecimate hb0( 
    .clk(clk), .reset(reset), .sync(hb0ClkEn),
`endif
    .din(hb0In),
    .dout(hb0Out),
    .syncOut(hb0ClkEnOut)
    );

`ifdef SIMULATE
real hb0Real;
always @* hb0Real = $itor($signed(hb0Out))/(2**17);
`endif

// If bypassing the CIC decimator, force its clock enable off to save power
reg     [17:0]  cicIn;
reg             cicClkEn;
always @(posedge clk) begin      
    if (bypassCic) begin
        cicClkEn <= 0;
        cicIn <= 0;
        end
    else begin
        if (bypassHb0) begin
            cicClkEn <= clkEn;
            cicIn <= rx;
            end
        else begin
            cicClkEn <= hb0ClkEnOut;
            cicIn <= hb0Out;
            end
        end
    end

// CIC Decimator
wire    [47:0]  cicOut;
wire    [31:0]  cicDout;
`ifdef SIMULATE
cicDecimator cic( 
    .clk(clk), .reset(dfReset), .sync(cicClkEn),
`else
cicDecimator cic( 
    .clk(clk), .reset(reset), .sync(cicClkEn),
`endif
    .gainShift(cicShift),
    .decimation(cicDecimation),
    .in(cicIn),
    .out(cicOut),
    .syncOut(cicClkEnOut)
    );

// AGC Stage
reg     [47:0]  agcIn;
reg             agcClkEn;
always @(posedge clk) begin
    casex ({bypassCic,bypassHb0})
        2'b0x: begin
            agcIn <=        cicOut;
            agcClkEn <=     cicClkEnOut;
            end
        2'b10: begin
            agcIn <=        {hb0Out,30'h0};
            agcClkEn <=     hb0ClkEnOut;
            end
        default: begin
            agcIn <=        {rx,30'h0};
            agcClkEn <=     clkEn;
            end
        endcase
    end

wire    [17:0]  agcOut;
variableGain gain(
    .clk(clk), .clkEn(agcClkEn), .reset(1'b0),
    .exponent(nbAgcGain[20:16]), .mantissa(nbAgcGain[15:0]),
    .din(agcIn),
    .dout(agcOut)
    );

`ifdef SIMULATE
real agcReal;
always @(agcOut) agcReal = $itor($signed(agcOut))/(2**17);
`endif

// CIC Compensation
wire    [17:0]  compOut;
`ifdef DF_CIC_COMP_USE_MPY
cicCompMpy cicCompMpy(
`else
cicComp cicComp(
`endif
    .clk(clk), 
    .reset(reset),
    .sync(agcClkEn), 
    .compIn(agcOut),
    .compOut(compOut)
    );
`ifdef SIMULATE
real compReal;
always @(compOut) compReal = $itor($signed(compOut))/(2**17);
`endif

// If bypassing the second halfband, force its clock enable off to save power
reg     [17:0]  hb1In;
reg             hb1ClkEn;
always @(posedge clk) begin      
    casex ({bypassHb1, bypassCic, bypassHb0})
        3'b1xx: begin
            hb1In <= 0;
            hb1ClkEn <= 0;
            end
        3'b00x: begin
            hb1In <= compOut;
            hb1ClkEn <= agcClkEn;
            end
        default: begin
            hb1In <= agcOut;
            hb1ClkEn <= agcClkEn;
            end
        endcase
    end

// Second Halfband Filter
wire    [17:0]  hb1Out;
halfbandDecimate hb1( 
`ifdef SIMULATE
    .clk(clk), .reset(dfReset), .sync(hb1ClkEn),
`else
    .clk(clk), .reset(reset), .sync(hb1ClkEn),
`endif
    .din(hb1In),
    .dout(hb1Out),
    .syncOut(hb1ClkEnOut)
    );

`ifdef SIMULATE
real hb1Real;
always @(hb1Out) hb1Real = $itor($signed(hb1Out))/(2**17);
`endif

reg     [17:0]  firIn;
reg             firClkEn;
always @(posedge clk) begin
    if (bypassFir) begin
        firClkEn <= 0;
        firIn <= 0;
        end
    else begin
        if (bypassHb1) begin
            firClkEn <= agcClkEn;
            firIn <= agcOut;
            end
        else begin
            firClkEn <= hb1ClkEnOut;
            firIn <= hb1Out;
            end
        end
    end

reg firSpace;
always @* begin
    casex(addr)
        FirSpace:   firSpace    = 1;
        default:    firSpace    = 0;
        endcase
    end

wire    [17:0]  firOut;
wire    [31:0]  firDout;
videoFir videoFir( 
    .clk(clk), .reset(reset), .clkEn(firClkEn),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(firSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(firDout),
    .videoIn(firIn),
    .videoOut(firOut)
    );


reg     [17:0]  dfOut;
reg             clkEnOut;
always @(posedge clk) begin
    casex ({bypassFir, bypassHb1})
        2'b0x: begin
            dfOut <= firOut;
            clkEnOut <= firClkEn;
            end
        2'b10: begin
            dfOut <= hb1Out;
            clkEnOut <= hb1ClkEnOut;
            end
        default: begin
            dfOut <= agcOut;
            clkEnOut <= agcClkEn;
            end
        endcase
    end
`ifdef SIMULATE
real dfOutReal;
always @* dfOutReal = $itor($signed(dfOut))/(2**17);
`endif


reg [31:0]dout;
always @* begin
    casex (addr)
        RegSpace:   dout = dfDout;
        FirSpace:   dout = firDout;
        default:    dout = 32'bx;
        endcase
    end

endmodule
                     
