`timescale 1ns / 10 ps
`include ".\addressMap.v"

module cicDecimator( 
    clk, reset, sync,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    inI,inQ,
    outI,outQ,
    syncOut
    );

input clk;
input reset;
input sync;
input wr0,wr1,wr2,wr3;
input [11:0]addr;
input [31:0]din;
output [31:0]dout;
input  [17:0]inI,inQ;
output [47:0]outI,outQ;
output  syncOut;


// Register interface
reg cs;
always @(addr) begin
    casex(addr)
        `CICDECSPACE:       cs = 1;
        default:            cs = 0;
        endcase
    end

wire    [4:0]   cicShift;
wire    [14:0]   cicDecimation;
cicRegs regs (
    .cs(cs),
    .addr(addr),
    .dataIn(din),
    .dataOut(dout),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .cicDecimation(cicDecimation),
    .cicShift(cicShift)
    );

// Input Shift Register
wire [47:0]shiftI;
wire [47:0]shiftQ;
shifter18to48 iShifter (
    .clk(clk), .sync(sync),
    .shift(cicShift),
    .din(inI),
    .dout(shiftI)
    );
shifter18to48 qShifter (
    .clk(clk), .sync(sync),
    .shift(cicShift),
    .din(inQ),
    .dout(shiftQ)
    );


// Three stages of integration
reg     [47:0]  accI0,accI1,accI2;
reg     [47:0]  accQ0,accQ1,accQ2;
always @(posedge clk) begin
    if (reset) begin
        accI0 <= 0;
        accI1 <= 0;
        accI2 <= 0;
        accQ0 <= 0;
        accQ1 <= 0;
        accQ2 <= 0;
        end
    else if (sync) begin
        accI0 <= accI0 + shiftI;
        accI1 <= accI1 + accI0;
        accI2 <= accI2 + accI1;
        accQ0 <= accQ0 + shiftQ;
        accQ1 <= accQ1 + accQ0;
        accQ2 <= accQ2 + accQ1;
        end
    end

`ifdef SIMULATE
wire [31:0]accI0Slice = accI0[47:16];
real accI0Real = ((accI0Slice > 2147483647.0) ? accI0Slice-4294967296.0 : accI0Slice)/2147483648.0;
wire [31:0]accI1Slice = accI1[47:16];
real accI1Real = ((accI1Slice > 2147483647.0) ? accI1Slice-4294967296.0 : accI1Slice)/2147483648.0;
wire [31:0]accI2Slice = accI2[47:16];
real accI2Real = ((accI2Slice > 2147483647.0) ? accI2Slice-4294967296.0 : accI2Slice)/2147483648.0;
`endif

// Create the decimated clock enable
reg syncOut;
reg [14:0]decCount;
always @(posedge clk) begin
    if (reset) begin
        decCount <= 1;
        end
    else if (sync) begin
        if (decCount == 0) begin
            decCount <= cicDecimation;
            syncOut <= 1;
            end
        else begin
            decCount <= decCount - 1;
            syncOut <= 0;
            end
        end
    else begin
        syncOut <= 0;
        end
    end

// 3rd order comb with a FIR structure to minimize delay
// (1 - z)^3 = 1 - 3z + 3z^2 - z^3
wire [48:0]iSlice = {accI2[47],accI2[47:0]};
wire [48:0]accIx3 = iSlice + {accI2,1'b0};
reg  [48:0]tapI0,tapI1,tapI2;
reg  [47:0]tapI3;
wire [48:0]sumI3 = tapI2 + iSlice;
wire [48:0]qSlice = {accQ2[47],accQ2[47:0]};
wire [48:0]accQx3 = qSlice + {accQ2,1'b0};
reg  [48:0]tapQ0,tapQ1,tapQ2;
reg  [47:0]tapQ3;
wire [48:0]sumQ3 = tapQ2 + qSlice;
always @(posedge clk) begin
    if (syncOut) begin
        tapI0 <= iSlice;
        tapI1 <= accIx3 - tapI0;
        tapI2 <= tapI1 - accIx3;
        tapI3 <= sumI3[47:0];
        tapQ0 <= qSlice;
        tapQ1 <= accQx3 - tapQ0;
        tapQ2 <= tapQ1 - accQx3;
        tapQ3 <= sumQ3[47:0];
        end
    end

// Final outputs
assign outI = tapI3[47:0];
assign outQ = tapQ3[47:0];

`ifdef SIMULATE
real iCicReal = ((outI[47:30] > 131071.0) ? (outI[47:30] - 262144.0) : outI[47:30])/131072.0;
real qCicReal = ((outQ[47:30] > 131071.0) ? (outQ[47:30] - 262144.0) : outQ[47:30])/131072.0;
`endif

endmodule
