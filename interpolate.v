`timescale 1ns / 10 ps
`include ".\addressMap.v"

module interpolate(
    clk, reset, clkEn,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    dataIn,
    dataOut,
    clkEnOut
    );

parameter RegSpace = `INTERP0SPACE;
parameter FirRegSpace = `VIDFIR0SPACE;

input           clk;
input           reset;
input           clkEn;
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [17:0]  dataIn;
output  [17:0]  dataOut;
output          clkEnOut;

// Chip select decodes
reg interpCS;
always @* begin
    casex (addr)
        RegSpace: begin
            interpCS = 1;
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
            firCS = 1;
            end
        default: begin
            firCS = 0;
            end
        endcase
    end

// Register interface
wire    [17:0]  testValue;
wire    [17:0]  mantissa;
wire    [4:0]   exponent;
wire    [31:0]  interpDout;
interpRegs regs  (
    .cs(interpCS),
    .addr(addr),
    .dataIn(din),
    .dataOut(interpDout),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .bypass(bypass),
    .test(test),
    .invert(invert),
    .bypassEQ(bypassEQ),
    .testValue(testValue),
    .exponent(exponent),
    .mantissa(mantissa)
    );

reg     [17:0]  invertIn;
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
wire    [17:0]  firOut;
wire    [31:0]  firDout;
videoFir videoFir( 
    .clk(clk), 
    .reset(reset), 
    .clkEn(clkEn),
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
wire    [17:0]  cicCompOut;
cicComp cicComp(
    .clk(clk),
    .reset(reset),
    .sync(clkEn),
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
always @(cicCompOut) compReal = ((cicCompOut > 131071.0) ? (cicCompOut - 262144.0) : cicCompOut)/131072.0;
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
wire [47:0]cicOut;
cicInterpolate cicInterpolate(
    .clk(clk), .reset(reset | cicReset), .clkEn(clkEn),
    .dIn(cicIn),
    .dOut(cicOut)
    );
wire [17:0]exponentAdjusted;
shift48to18 cicGainAdjust(
    .clk(clk), .clkEn(1'b1),
    .shift(exponent),
    .dIn(cicOut),
    .dOut(exponentAdjusted)
    );

wire [35:0]scaledValue;
mpy18x18 mantissaScaler (
    .sclr(cicReset),
    .clk(clk),
    .a(exponentAdjusted),
    .b(mantissa),
    .p(scaledValue)
    );

wire [29:0] invSincOut;
invSinc invSinc
  (
   .clk(clk),
   .nd(1'b1),
   .rfd(),
   .rdy(),
   .din(scaledValue[33:18]), // Bus [15 : 0]
   .dout(invSincOut)); // Bus [24 : 0]


reg     [17:0]  dataOut;
wire    [1:0]   bypassMode = {bypassEQ,bypass};
always @(posedge clk) begin
    if (test) begin
        dataOut <= testValue;
        end
    else begin
        case (bypassMode)
            2'b00: begin
                dataOut <= invSincOut[24:7];
                end
            2'b01: begin
                if (clkEn) begin
                    dataOut <= firOut;
                    end
                end
            2'b10: begin
                dataOut <= scaledValue[33:16];
                end
            2'b11: begin
                if (clkEn) begin
                    dataOut <= invertIn;
                    end
                end
            endcase
        end
    end

`ifdef SIMULATE
real expAdjReal;
real interpReal;
always @(exponentAdjusted) expAdjReal = (exponentAdjusted[17] ? (exponentAdjusted - 262144.0) : exponentAdjusted)/131072.0;
always @(dataOut) interpReal = (dataOut[17] ? (dataOut - 262144.0) : dataOut)/131072.0;
`endif

assign  clkEnOut = bypass ? clkEn : 1'b1;

reg [31:0]dout;
always @* begin
    casex (addr)
        RegSpace :          dout = interpDout;
        FirRegSpace:        dout = firDout;
        default:            dout = 32'bx;
        endcase
    end

endmodule
