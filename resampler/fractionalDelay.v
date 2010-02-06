`timescale 1ns / 10 ps
`include "addressMap.v"

module fractionalDelay( 
    clk, reset, sync,
    sampleOffset,
    in,
    out
    );

input clk;
input reset;
input sync;
input   [4:0]   sampleOffset;
input   [17:0]  in;
output  [17:0]  out;


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

/******************************************************************************
                                  FIR Filter
******************************************************************************/
wire    [17:0]  tap0Coef;
resamplerTap0 tap0(.a(sampleOffset),.spo(tap0Coef));
wire    [35:0]  i0Product;
mpy18x18WithCe mpy0 (
    .clk(clk),
    .ce(sync),
    .a(inSR[0]),
    .b(tap0Coef),
    .p(i0Product)
    );

wire    [17:0]  tap1Coef;
resamplerTap1 tap1(.a(sampleOffset),.spo(tap1Coef));
wire    [35:0]  i1Product;
mpy18x18WithCe mpy1 (
    .clk(clk),
    .ce(sync),
    .a(inSR[1]),
    .b(tap1Coef),
    .p(i1Product)
    );

wire    [17:0]  tap2Coef;
resamplerTap2 tap2(.a(sampleOffset),.spo(tap2Coef));
wire    [35:0]  i2Product;
mpy18x18WithCe mpy2 (
    .clk(clk),
    .ce(sync),
    .a(inSR[2]),
    .b(tap2Coef),
    .p(i2Product)
    );

wire    [17:0]  tap3Coef;
resamplerTap3 tap3(.a(sampleOffset),.spo(tap3Coef));
wire    [35:0]  i3Product;
mpy18x18WithCe mpy3 (
    .clk(clk),
    .ce(sync),
    .a(inSR[3]),
    .b(tap3Coef),
    .p(i3Product)
    );

wire    [17:0]  tap4Coef;
resamplerTap4 tap4(.a(sampleOffset),.spo(tap4Coef));
wire    [35:0]  i4Product;
mpy18x18WithCe mpy4 (
    .clk(clk),
    .ce(sync),
    .a(inSR[4]),
    .b(tap4Coef),
    .p(i4Product)
    );

wire    [17:0]  tap5Coef;
resamplerTap5 tap5(.a(sampleOffset),.spo(tap5Coef));
wire    [35:0]  i5Product;
mpy18x18WithCe mpy5 (
    .clk(clk),
    .ce(sync),
    .a(inSR[5]),
    .b(tap5Coef),
    .p(i5Product)
    );

wire    [17:0]  tap6Coef;
resamplerTap6 tap6(.a(sampleOffset),.spo(tap6Coef));
wire    [35:0]  i6Product;
mpy18x18WithCe mpy6 (
    .clk(clk),
    .ce(sync),
    .a(inSR[6]),
    .b(tap6Coef),
    .p(i6Product)
    );

wire    [17:0]  tap7Coef;
resamplerTap7 tap7(.a(sampleOffset),.spo(tap7Coef));
wire    [35:0]  i7Product;
mpy18x18WithCe mpy7 (
    .clk(clk),
    .ce(sync),
    .a(inSR[7]),
    .b(tap7Coef),
    .p(i7Product)
    );

wire    [17:0]  tap8Coef;
resamplerTap8 tap8(.a(sampleOffset),.spo(tap8Coef));
wire    [35:0]  i8Product;
mpy18x18WithCe mpy8 (
    .clk(clk),
    .ce(sync),
    .a(inSR[8]),
    .b(tap8Coef),
    .p(i8Product)
    );

reg     [35:0]  i01,i23,i45,i67,i0123,i4567;
reg     [35:0]  i8Delay1,i8Delay2,sum;
reg     [17:0]  out;
always @(posedge clk) begin
    if (sync) begin
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


`ifdef SIMULATE
real outReal;
real sumReal;
always @(out) outReal = ((out > 131071.0) ? (out - 262144.0) : out)/131072.0;
always @(sum) sumReal = (sum[35] ? (sum[35:18] - 262144.0) : sum[35:18])/131072.0;
`endif

endmodule

