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
wire    [17:0]  testValue;
wire    [17:0]  mantissa;
wire    [4:0]   exponent;
interpRegs regs  (
    .cs(cs),
    .addr(addr),
    .dataIn(din),
    .dataOut(dout),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .bypass(bypass),
    .test(test),
    .invert(invert),
    .testValue(testValue),
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



// CIC Compensation
wire    [17:0]  cicCompOut;
cicComp cicComp(
    .clk(clk), 
    .reset(reset),
    .sync(clkEn), 
    .compIn(dataIn),
    .compOut(cicCompOut)
    );

`ifdef SIMULATE
real compReal;
always @(cicCompOut) compReal = ((cicCompOut > 131071.0) ? (cicCompOut - 262144.0) : cicCompOut)/131072.0;
`endif


// CIC Interpolation Filter
wire [47:0]cicOut;
cicInterpolate cicInterpolate(
    .clk(clk), .reset(reset | cicReset), .clkEn(clkEn),
    .dIn(cicCompOut),
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

wire [24:0] invSincOut;   
invSinc invSinc 
  (
   .clk(clk),
   .nd(1'b1),
   .rfd(),
   .rdy(),
   .din(scaledValue[33:18]), // Bus [15 : 0] 
   .dout(invSincOut)); // Bus [24 : 0]
   
   
reg     [17:0]  dataOut;
always @(posedge clk) begin
    if (test) begin
        dataOut <= testValue;
        end
    else if (bypass) begin
        if (clkEn) begin
            if (invert) begin
                dataOut <= -dataIn;
                end
            else begin
                dataOut <= dataIn;
                end
            end
        end
    else begin
        if (invert) begin
            dataOut <= -invSincOut[23:6];
            end
        else begin
            dataOut <= invSincOut[23:6];
            end
        end
    end

`ifdef SIMULATE
real expAdjReal;
real interpReal;
always @(exponentAdjusted) expAdjReal = (exponentAdjusted[17] ? (exponentAdjusted - 262144.0) : exponentAdjusted)/131072.0;
always @(dataOut) interpReal = (dataOut[17] ? (dataOut - 262144.0) : dataOut)/131072.0;
`endif


endmodule
