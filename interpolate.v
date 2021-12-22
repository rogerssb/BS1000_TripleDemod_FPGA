/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps
`include ".\addressMap.v"

module interpolate(
    input                       clk, reset, clkEn,
    `ifdef USE_BUS_CLOCK
    input                       busClk,
    `endif
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output  reg         [31:0]  dout,
    input       signed  [17:0]  dataIn,
    output              [3:0]   dacSource,
    output      signed  [17:0]  dataOut,
    output                      clkEnOut
);

    parameter RegSpace = `INTERP0SPACE;
    parameter FirRegSpace = `VIDFIR0SPACE;

    // Chip select decodes
    reg interpCS;
    always @* begin
        casex (addr)
            RegSpace: begin
                interpCS = cs;
            end
            default: begin
                interpCS = 0;
            end
        endcase
    end
    reg firCS;
    always @* begin
        casex (addr)
            FirRegSpace: begin
                firCS = cs;
            end
            default: begin
                firCS = 0;
            end
        endcase
    end

    // Register interface
    wire    signed  [17:0]  testValue;
    wire            [17:0]  cicMantissa;
    wire            [4:0]   cicExponent;
    wire            [15:0]  gainMantissa;
    wire            [4:0]   gainExponent;
    wire            [31:0]  interpDout;
    wire            [3:0]   timeConstant;
    interpRegs regs  (
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(interpCS),
        .addr(addr),
        .dataIn(din),
        .dataOut(interpDout),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .bypass(bypass),
        .test(test),
        .invert(invert),
        .bypassEQ(bypassEQ),
        .source(dacSource),
        .testValue(testValue),
        .cicExponent(cicExponent),
        .cicMantissa(cicMantissa),
        .gainExponent(gainExponent),
        .gainMantissa(gainMantissa),
        .timeConstant(timeConstant)
    );

    reg     signed  [17:0]  invertIn;
    always @(posedge clk) begin
        if (clkEn) begin
            if (invert) begin
                invertIn <= -dataIn;
            end
            else begin
                invertIn <= dataIn;
            end
        end
    end

    // Generate reset for CIC
    reg cicReset;
    reg bp0,bp1,bp2;
    always @(posedge clk) begin
        if (clkEn) begin
            bp0 <= bypass;
            bp1 <= bp0;
            bp2 <= bp1;
            if (!bp1 && bp2) begin
                cicReset <= 1;
            end
            else begin
                cicReset <= 0;
            end
        end
    end

    // Video FIR
    wire    signed  [17:0]  firOut;
    wire            [31:0]  firDout;
    videoFir videoFir(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .cs(firCS),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .din(din),
        .dout(firDout),
        .videoIn(invertIn),
        .videoOut(firOut)
    );

    `define CIC_USE_MPYS
    `ifdef CIC_USE_MPYS
    // CIC Compensation
    wire    signed  [17:0]  cicCompOut;
    cicCompMpy cicComp(
        .clk(clk),
        .reset(reset),
        .clkEn(clkEn),
        .compIn(firOut),
        .compOut(cicCompOut)
        );
    `else
    wire    [32:0]  lutDout;
    cicCompensation cicComp(
        .rfd(),
        .rdy(),
        .nd(clkEn | reset),
        .clk(clk),
        .dout(lutDout),
        .din(firOut)
    );
    wire    [17:0]  cicCompOut = lutDout[26:9];
    `endif

    `ifdef SIMULATE
    real compReal;
    always @(cicCompOut) compReal = $itor(cicCompOut)/(2**17);
    `endif

    // CIC Interpolation Mux
    reg     [17:0]  cicIn;
    always @(posedge clk) begin
        if (clkEn) begin
            if (bypassEQ) begin
                cicIn <= invertIn;
            end
            else begin
                cicIn <= cicCompOut;
            end
        end
    end

    // CIC Interpolation Filter
    wire    signed  [47:0]  cicOut;
    cicInterpolate cicInterpolate(
        .clk(clk), .reset(reset | cicReset), .clkEn(clkEn),
        .dIn(cicIn),
        .dOut(cicOut)
    );
    wire    signed  [17:0]  exponentAdjusted;
    shift48to18 cicGainAdjust(
        .clk(clk), .clkEn(1'b1),
        .shift(cicExponent),
        .dIn(cicOut),
        .dOut(exponentAdjusted)
    );

    wire    signed  [35:0]  scaledValue;
    `ifdef USE_VIVADO_CORES
    mpy18x18PL1 mantissaScaler (
        .sclr(cicReset),
        .clk(clk),
        .a(exponentAdjusted),
        .b(cicMantissa),
        .p(scaledValue)
        );
    `else
    mpy18x18 mantissaScaler (
        .sclr(cicReset),
        .clk(clk),
        .a(exponentAdjusted),
        .b(cicMantissa),
        .p(scaledValue)
        );
    `endif

    `ifdef USE_VIVADO_CORES
    wire    signed  [31:0] invSincOut;
    invSinc invSinc(
        .aclk(clk),
        .s_axis_data_tvalid(1'b1),
        .s_axis_data_tready(),
        .s_axis_data_tdata(scaledValue[33:18]),
        .m_axis_data_tvalid(),
        .m_axis_data_tdata(invSincOut)
    );
    `else
    wire    signed  [29:0] invSincOut;
    invSinc invSinc (
       .clk(clk),
       .nd(1'b1),
       .rfd(),
       .rdy(),
       .din(scaledValue[33:18]),
       .dout(invSincOut)
    );
    `endif

    wire        [1:0]   bypassMode = {bypassEQ,bypass};
    reg signed  [17:0]  muxOut;
    always @(posedge clk) begin
        if (test) begin
            muxOut <= testValue;
        end
        else begin
            case (bypassMode)
                2'b00: begin
                    muxOut <= $signed(invSincOut[24:7]);
                end
                2'b01: begin
                    if (clkEn) begin
                        muxOut <= firOut;
                    end
                end
                2'b10: begin
                    muxOut <= $signed(scaledValue[33:16]);
                end
                2'b11: begin
                    if (clkEn) begin
                        muxOut <= invertIn;
                    end
                end
            endcase
        end
    end

    wire [17:0] vgaData;
    `define USE_VGAIN
    `ifdef USE_VGAIN
    wire    signed  [47:0]  vgInput = {{16{muxOut[17]}},muxOut,14'b0};
    variableGain videoGain(
        .clk(clk), .clkEn(1'b1),
        .exponent(gainExponent),
        .mantissa(gainMantissa),
        .din(vgInput),
        .dout(vgaData)
    );
    `else
    assign vgaData = muxOut;
    `endif


    AC_Couple #(.OFFSET(4)) ACcouple (
      .clk            (clk),
      .reset          (reset),
      .ce             (1'b1),
      .timeConstant   (timeConstant),
      .datain         (vgaData),
      .dataOut        (dataOut)
   );

    `ifdef SIMULATE
    real expAdjReal;
    always @(exponentAdjusted) expAdjReal = $itor(exponentAdjusted)/(2**17);
    real interpReal;
    always @(dataOut) interpReal = $itor(dataOut)/(2**17);
    `endif

    assign  clkEnOut = bypass ? clkEn : 1'b1;

    always @* begin
        casex (addr)
            RegSpace :          dout = interpDout;
            FirRegSpace:        dout = firDout;
            default:            dout = 32'bx;
        endcase
    end

endmodule
