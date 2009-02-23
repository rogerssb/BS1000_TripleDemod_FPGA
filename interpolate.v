`timescale 1ns / 10 ps

module interpolate( 
    clk, reset, clkEn,
    cs,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    dataIn,
    dataOut
    );

input clk;
input reset;
input clkEn;
input cs;
input wr0,wr1,wr2,wr3;
input   [11:0]addr;
input   [31:0]din;
output  [31:0]dout;
input   [17:0]dataIn;
output  [17:0]dataOut;

// Register interface
wire [17:0]mantissa;
wire [4:0]exponent;
interpRegs regs  (
    .cs(cs),
    .addr(addr),
    .dataIn(din),
    .dataOut(dout),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .bypass(bypass),
    .exponent(exponent),
    .mantissa(mantissa)
    );

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

// CIC Interpolation Filter
wire [47:0]cicOut;
cicInterpolate cicInterpolate(
    .clk(clk), .reset(reset | cicReset), .clkEn(clkEn),
    .dIn(dataIn),
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

reg     [17:0]  dataOut;
always @(posedge clk) begin
    if (bypass) begin
        if (clkEn) begin
            dataOut <= dataIn;
            end
        end
    else begin
        dataOut <= scaledValue[33:16];
        end
    end

`ifdef SIMULATE
real expAdjReal = (exponentAdjusted[17] ? (exponentAdjusted - 262144.0) : exponentAdjusted)/131072.0;
real interpReal = (dataOut[17] ? (dataOut - 262144.0) : dataOut)/131072.0;
`endif


endmodule
