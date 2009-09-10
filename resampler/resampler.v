`timescale 1ns / 10 ps
`include "addressMap.v"

module resampler( 
    clk, reset, sync,
    resampleRate,
    resamplerFreqOffset,
    offsetEn,
    in,
    out,
    syncOut
    );

input clk;
input reset;
input sync;
input   [31:0]resampleRate;
input   [31:0]resamplerFreqOffset;
input   offsetEn;
input   [17:0]in;
output  [17:0]out;
output syncOut;

// Create the resampler rate
reg [31:0] resamplerPhaseInc;
always @(posedge clk) begin
    if (offsetEn) begin
        resamplerPhaseInc <= resampleRate + resamplerFreqOffset;
        end
    end



// Input data shift register
reg [17:0]inSR[0:8];
`ifdef SIMULATE
integer i;
`endif
always @(posedge clk) begin
    if (sync) begin
        //`ifdef SIMULATE
        //for (i = 7; i >= 0; i = i-1) begin
        //    iSR[i+1] <= iSR[i];
        //    qSR[i+1] <= qSR[i];
        //    end
        //`endif
        inSR[8] <= inSR[7];
        inSR[7] <= inSR[6];
        inSR[6] <= inSR[5];
        inSR[5] <= inSR[4];
        inSR[4] <= inSR[3];
        inSR[3] <= inSR[2];
        inSR[2] <= inSR[1];
        inSR[1] <= inSR[0];
        inSR[0] <= in;
        end
    end

// Resampler Phase Accumulator
reg     [31:0]  phase;
wire    [32:0]  phaseSum = {1'b0,phase} + {1'b0,resamplerPhaseInc};
reg             resample;
reg     [9:0]   resampleDelay;
//real            additionalClocks = (31.0 - phase[31:27]) * 32.0 / resamplerPhaseInc[31:27];
//reg     [4:0]   oldOffset;
wire    [17:0]  reciprocal;
reciprocalLut lut(.a(resamplerPhaseInc[31:27]),.spo(reciprocal));
wire    [35:0]  lutProduct;
wire    [17:0]  additionalPhase = {8'h0,~phase[31:27],5'h00};
mpy18x18 offsetMpy (
    .sclr(1'b0),
    .clk(clk),
    .a(additionalPhase),
    .b(reciprocal),
    .p(lutProduct)
    );
reg     [4:0]   newOffset;
wire    [5:0]   roundedLutProduct = lutProduct[22:17] + {5'h0,lutProduct[16]};
always @(posedge clk) begin
    if (reset) begin
        phase <= 0;
        resample <= 0;
        end
    else if (sync) begin
        phase <= phaseSum[31:0];
        if (phaseSum[32]) begin
            resample <= 1;
            //oldOffset <= additionalClocks;
            end
        else begin
            resample <= 0;
            end
        end
    else begin
        resample <= 0;
        end
    resampleDelay <= {resampleDelay[8:0],resample};
    if (resampleDelay[1]) begin
        //newOffset <= lutProduct[21:17] + {4'h0,lutProduct[16]};
        if (roundedLutProduct[5]) begin
            newOffset <= 5'h1f;
            end
        else begin
            newOffset <= roundedLutProduct[4:0];
            end
        end
    end

`define USE_NEWOFFSET
`ifdef USE_NEWOFFSET
wire    [4:0]offset = newOffset;
`else
wire    [4:0]offset = oldOffset;
`endif

`ifdef SIMULATE
integer offsetInt;
real inReal;
always @(offset) offsetInt = offset;
always @(inSR[0]) inReal = ((inSR[0] > 131071.0) ? (inSR[0] - 262144.0) : inSR[0])/131072.0;
`endif

/******************************************************************************
                                  FIR Filter
******************************************************************************/
wire    [17:0]  tap0Coef;
resamplerTap0 tap0(.a(offset),.spo(tap0Coef));
wire    [35:0]  i0Product;
mpy18x18 mpy0 (
    .sclr(1'b0),
    .clk(clk),
    .a(inSR[0]),
    .b(tap0Coef),
    .p(i0Product)
    );

wire    [17:0]  tap1Coef;
resamplerTap1 tap1(.a(offset),.spo(tap1Coef));
wire    [35:0]  i1Product;
mpy18x18 mpy1 (
    .sclr(1'b0),
    .clk(clk),
    .a(inSR[1]),
    .b(tap1Coef),
    .p(i1Product)
    );

wire    [17:0]  tap2Coef;
resamplerTap2 tap2(.a(offset),.spo(tap2Coef));
wire    [35:0]  i2Product;
mpy18x18 mpy2 (
    .sclr(1'b0),
    .clk(clk),
    .a(inSR[2]),
    .b(tap2Coef),
    .p(i2Product)
    );

wire    [17:0]  tap3Coef;
resamplerTap3 tap3(.a(offset),.spo(tap3Coef));
wire    [35:0]  i3Product;
mpy18x18 mpy3 (
    .sclr(1'b0),
    .clk(clk),
    .a(inSR[3]),
    .b(tap3Coef),
    .p(i3Product)
    );

wire    [17:0]  tap4Coef;
resamplerTap4 tap4(.a(offset),.spo(tap4Coef));
wire    [35:0]  i4Product;
mpy18x18 mpy4 (
    .sclr(1'b0),
    .clk(clk),
    .a(inSR[4]),
    .b(tap4Coef),
    .p(i4Product)
    );

wire    [17:0]  tap5Coef;
resamplerTap5 tap5(.a(offset),.spo(tap5Coef));
wire    [35:0]  i5Product;
mpy18x18 mpy5 (
    .sclr(1'b0),
    .clk(clk),
    .a(inSR[5]),
    .b(tap5Coef),
    .p(i5Product)
    );

wire    [17:0]  tap6Coef;
resamplerTap6 tap6(.a(offset),.spo(tap6Coef));
wire    [35:0]  i6Product;
mpy18x18 mpy6 (
    .sclr(1'b0),
    .clk(clk),
    .a(inSR[6]),
    .b(tap6Coef),
    .p(i6Product)
    );

wire    [17:0]  tap7Coef;
resamplerTap7 tap7(.a(offset),.spo(tap7Coef));
wire    [35:0]  i7Product;
mpy18x18 mpy7 (
    .sclr(1'b0),
    .clk(clk),
    .a(inSR[7]),
    .b(tap7Coef),
    .p(i7Product)
    );

wire    [17:0]  tap8Coef;
resamplerTap8 tap8(.a(offset),.spo(tap8Coef));
wire    [35:0]  i8Product;
mpy18x18 mpy8 (
    .sclr(1'b0),
    .clk(clk),
    .a(inSR[8]),
    .b(tap8Coef),
    .p(i8Product)
    );

reg     [35:0]  i01,i23,i45,i67,i0123,i4567;
reg     [35:0]  i8Delay1,i8Delay2,sum;
reg     [17:0]  out;
always @(posedge clk) begin
    // First pipeline sums
    i01 <= i0Product + i1Product;
    i23 <= i2Product + i3Product;
    i45 <= i4Product + i5Product;
    i67 <= i6Product + i7Product;
    i8Delay1 <= i8Product;

    // Second pipeline sums
    i0123 <= i01 + i23;
    i4567 <= i45 + i67;
    i8Delay2 <= i8Delay1;

    // Final sum
    sum <= i0123 + i4567 + i8Delay2;
    `ifdef USE_NEWOFFSET
    if (resampleDelay[8]) begin
    `else
    if (resampleDelay[5]) begin
    `endif
        // Check for overflow
        if (sum[35] && !sum[34]) begin
            out <= 18'h20001;
            end
        else if (!sum[35] && sum[34]) begin
            out <= 18'h1ffff;
            end
        else begin
            out <= sum[34:17];
           end 
        end
    end

`ifdef USE_NEWOFFSET
assign syncOut = resampleDelay[9];
`else
assign syncOut = resampleDelay[6];
`endif

`ifdef SIMULATE
real outReal;
real sumReal;
always @(out) outReal = ((out > 131071.0) ? (out - 262144.0) : out)/131072.0;
always @(sum) sumReal = (sum[35] ? (sum[35:18] - 262144.0) : sum[35:18])/131072.0;
`endif

endmodule

