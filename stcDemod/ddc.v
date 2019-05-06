/******************************************************************************
Copyright 2008-2016 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include "addressMap.v"


module ddc
    #(parameter RegSpace = `ADDR_BITS'h0,
    )
( 
    input                               clk, 
    input                               reset,
    input                               clkEn,
    input                               wr0,wr1,wr2,wr3,
    input           [`ADDR_BITS-1:0]    addr,
    input           [31:0]              din,
    output          [31:0]              dout,
    input           [20:0]              nbAgcGain,
    input   signed  [17:0]              iIn, qIn, 
    output                              clkEnOut,
    output  reg signed  [17:0]          iOut, qOut
);

    // Microprocessor interface
    reg ddcSpace;
    always @* begin
        casex(addr)
            RegSpace:   ddcSpace    = 1;
            default:    ddcSpace    = 0;
            endcase
        end

    wire    signed  [31:0]  ddcCenterFreq;
    wire            [31:0]  ddcDout;
    ddcRegs micro(
        .addr(addr),
        .dataIn(din),
        .dataOut(ddcDout),
        .cs(ddcSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .bypassHb0(bypassHb0),
        .bypassCic(bypassCic),
        .bypassHb1(bypassHb1),
        .bypassFir(bypassFir),
        .ddcCenterFreq(ddcCenterFreq)
    );


    // LO Generator
    wire    signed  [17:0]  iDds,qDds;
    dds dds ( 
        .sclr(reset), 
        .clk(clk), 
        .ce(clkEn),
        .we(1'b1), 
        .data(ddcCenterFreq), 
        .sine(qDds), 
        .cosine(iDds)
    );

    // Complex Multiplier
    wire signed [17:0]  iMix;
    wire signed [17:0]  qMix;
    cmpy18 mixer( 
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .aReal(iIn),
        .aImag(qIn),
        .bReal(iDds),
        .bImag(qDds),
        .pReal(iMix),
        .pImag(qMix)
    );


    //---------------------------- Halfband Filter ---------------------------

    // If bypassing the HBF, force its clock enable off to save power
    reg     signed  [17:0]  iHb0In,qHb0In;
    reg                     hb0ClkEnIn;
    always @(posedge clk) begin      
        if (bypassHb0) begin
            bh0ClkEnIn <= 0;
            iHb0In <= 0;
            qHb0In <= 0;
        end
        else begin
            hb0ClkEnIn <= clkEn;
            iHb0In <= iMix;
            qHb0In <= qMix;
        end
    end


    `ifdef SIMULATE
    reg                 hb0SimReset;
    wire                hb0Reset = (reset || hb0SimReset);
    `else
    wire                hb0Reset = reset;
    `endif
    wire signed [17:0]  iHb0,qHb0;
    halfbandFilter hb0( 
        .clk(clk), 
        .reset(hb0Reset), 
        .clkEn(hb0ClkEnIn),
        .interpolate(hb0Interpolate),
        .iIn(iHb0In),.qIn(qHb0In),
        .iOut(iHb0),.qOut(qHb0),
        .clkEnOut(hb0ClkEn)
    );


    //---------------------------- CIC Decimator ------------------------------

    // If bypassing the CIC decimator, force its clock enable off to save power
    reg     signed  [17:0]  iCicIn,qCicIn;
    reg                     cicClkEnIn;
    always @(posedge clk) begin      
        if (bypassCic) begin
            cicClkEnIn <= 0;
            iCicIn <= 0;
            qCicIn <= 0;
        end
        else if (bypassHb0) begin
            cicClkEnIn <= clkEn;
            iCicIn <= iMix;
            qCicIn <= qMix;
        end
        else begin
            cicClkEnIn <= hb0ClkEn;
            iCicIn <= iHb0;
            qCicIn <= qHb0;
        end
    end

    `ifdef SIMULATE
    reg                 cicSimReset;
    wire                cicReset = (reset || cicSimReset);
    `else
    wire                cicReset = reset;
    `endif
    wire signed [47:0]  iCic,qCic;
    wire        [31:0]  cicDout;
    dualDecimator #(.RegSpace(`CICDECSPACE)) cic( 
        .clk(clk), .reset(cicReset), .sync(cicClkEnIn),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(cicDout),
        .inI(iCicIn),.inQ(qCicIn),
        .outI(iCic),.outQ(qCic),
        .syncOut(cicClkEn)
    );


    //------------------------------- AGC Gain --------------------------------

    reg     [47:0]  iAgcIn,qAgcIn;
    reg             agcClkEnIn;
    always @(posedge clk) begin
        if (!bypassCic) begin
            iAgcIn <= iCic;
            qAgcIn <= qCic;
            agcClkEnIn <= cicClkEn;
        end
        else if (!bypassHb0) begin
            iAgcIn <=  {iHb0,30'h0};
            qAgcIn <=  {qHb0,30'h0};
            agcClkEnIn <= hb0ClkEn;
        end
        else begin
            iAgcIn <= {iMix,30'h0};
            qAgcIn <= {qMix,30'h0};
            agcClkEnIn <= clkEn;
        end
    end

    wire    signed  [17:0]  iAgc,qAgc;
    variableGain gainI(
        .clk(clk), .clkEn(agcClkEnIn),
        .exponent(nbAgcGain[20:16]), .mantissa(nbAgcGain[15:0]),
        .din(iAgcIn),
        .dout(iAgc)
    );
    variableGain gainQ(
        .clk(clk), .clkEn(agcClkEnIn),
        .exponent(nbAgcGain[20:16]), .mantissa(nbAgcGain[15:0]),
        .din(qAgcIn),
        .dout(qAgc)
    );

    // CIC Compensation
    wire    signed  [17:0]  iCompOut,qCompOut;
    cicCompensation cicCompI(
        .clk(clk), 
        .reset(reset),
        .sync(agcClkEnIn), 
        .compIn(iAgc),
        .compOut(iCompOut)
    );
    cicCompensation cicCompQ(
        .clk(clk), 
        .reset(reset),
        .sync(agcClkEnIn), 
        .compIn(qAgc),
        .compOut(qCompOut)
    );
    wire    signed  [17:0]  iComp = bypassCic ? iAgc : iCompOut;
    wire    signed  [17:0]  qComp = bypassCic ? qAgc : qCompOut;


    //---------------------------- Halfband Filter ---------------------------


    // If bypassing the second halfband, force its clock enable off to save power
    reg     [17:0]  iHb1In,qHb1In;
    reg             hb1ClkEnIn;
    always @(posedge clk) begin      
        if (bypassHb1) begin
            hb1ClkEnIn <= 0;
            iHb1In <= 0;
            qHb1In <= 0;
        end
        else begin
            hb1ClkEnIn <= agcClkEnIn;
            iHb1In <= iComp;
            qHb1In <= qComp;
        end
    end

    // Second Halfband Filter
    `ifdef SIMULATE
    wire                    hb1Reset = cicReset;
    `else
    wire                    hb1Reset = reset;
    `endif
    wire    signed  [17:0]  iHb1,qHb1;
    halfbandFilter hb1( 
        .clk(clk), 
        .reset(hb1Reset), 
        .clkEn(hb1ClkEnIn),
        .iIn(iHb1In),.qIn(qHb1In),
        .iOut(iHb1),.qOut(qHb1),
        .clkEnOut(hb1ClkEn)
        );

    //------------------------- Programmable FIR Filter ----------------------

    reg     signed  [17:0]  iFirIn;
    reg     signed  [17:0]  qFirIn;
    reg                     firClkEnIn;
    always @(posedge clk) begin
        if (bypassFir) begin
            firClkEnIn <= 0;
            iFirIn <= 0;
            qFirIn <= 0;
        end
        else begin
            if (bypassHb1) begin
                firClkEnIn <= agcClkEnIn;
                iFirIn <= iMux;
                qFirIn <= qMux;
            end
            else begin
                firClkEnIn <= hb1ClkEn;
                iFirIn <= iHb1;
                qFirIn <= qHb1;
            end
        end
    end

    wire            [31:0]  ddcFirDout;
    wire    signed  [17:0]  iFir,qFir;
    dualFir #(.RegSpace(`DDCFIRSPACE)) dualFir ( 
        .clk(clk), 
        .reset(reset), 
        .clkEn(firClkEnIn),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(ddcFirDout),
        .iIn(iFirIn),.qIn(qFirIn),
        .iOut(iFir),.qOut(qFir)
    );


    //---------------------------- Final Output -------------------------------

    always @(posedge clk) begin
        if (!bypassFir) begin
            clkEnOut <= firClkEnIn;
            iOut <= iFir;
            qOut <= qFir;
        end
        else if (!bypassHb1) begin
            clkEnOut <= hb1ClkEn;
            iOut <= iHb1;
            qOut <= qHb1;
        end
        else if (!bypassCic) begin
            clkEnOut <= agcClkEnIn;
            iOut <= iComp;
            qOut <= qComp;
        end
        else begin
            clkEnOut <= agcClkEnIn;
            iOut <= iAgc;
            qOut <= qAgc;
        end
    end

    //---------------------------- uP Output Mux ------------------------------

    reg [31:0]dout;
    always @* begin
        casex (addr)
            `DDCSPACE:          dout = ddcDout;
            `DDCFIRSPACE:       dout = ddcFirDout;
            `CICDECSPACE:       dout = cicDout;    
            default:            dout = 32'bx;
        endcase
    end

endmodule
                     
