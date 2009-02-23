`timescale 1ns/1ps
`include ".\addressMap.v"

module carrierLoop(
    clk, reset, 
    ddcSync,
    resampSync,
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    demodMode,
    phase,
    freq,
    offsetError,
    offsetErrorEn,
    carrierFreqOffset,
    carrierFreqEn
    );

input           clk;
input           reset;
input           ddcSync;
input           resampSync;
input           wr0,wr1,wr2,wr3;
input   [11:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
input   [2:0]   demodMode;
input   [7:0]   phase;
input   [7:0]   freq;
input   [7:0]   offsetError;
input           offsetErrorEn;
output  [31:0]  carrierFreqOffset;
output          carrierFreqEn;


/***************************** Control Registers ******************************/

reg freqLoopSpace;
always @(addr) begin
    casex(addr)
        `CARRIERSPACE:  freqLoopSpace <= 1;
        default:        freqLoopSpace <= 0;
        endcase
    end
wire    [31:0]  dout;
wire    [4:0]   leadExp;
wire    [4:0]   lagExp;
wire    [31:0]  limit;
wire    [31:0]  loopOffset;
wire    [31:0]  sweepOffsetMag;
loopRegs loopRegs(
    .cs(freqLoopSpace),
    .addr(addr),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .dataIn(din),
    .dataOut(dout),
    .invertError(invertError),
    .zeroError(zeroError),
    .ctrl2(sweepEnable),
    .leadMan(),
    .leadExp(leadExp),
    .lagMan(),
    .lagExp(lagExp),
    .limit(limit),
    .loopData(sweepOffsetMag)
    );


/************************ Error Signal Source *********************************/

// Determine the source of the error signal
reg     [7:0]   modeError;
reg             modeErrorEn;
reg             sync;
always @(demodMode or offsetError or offsetErrorEn or phase or freq or ddcSync or resampSync) begin
    case (demodMode)
        `MODE_AM: begin
            sync <= ddcSync;
            modeError <= 0;
            modeErrorEn <= 1'b1;
            end
        `MODE_PM: begin
            sync <= ddcSync;
            modeError <= phase;
            modeErrorEn <= 1'b1;
            end
        `MODE_FM: begin
            sync <= ddcSync;
            modeError <= freq;
            modeErrorEn <= 1'b1;
            end
        `MODE_2FSK: begin
            sync <= resampSync;
            modeError <= offsetError;
            modeErrorEn <= offsetErrorEn;
            end
        `MODE_BPSK: begin
            sync <= ddcSync;
            modeError <= {phase[6:0],1'b0} - 8'h40;
            modeErrorEn <= 1'b1;
            end
        `MODE_QPSK,
        `MODE_OQPSK: begin
            sync <= ddcSync;
            modeError <= {phase[5:0],2'b0} - 8'h20;
            modeErrorEn <= 1'b1;
            end
        default: begin
            sync <= 1'b1;
            modeError <= 0;
            modeErrorEn <= 1'b1;
            end
        endcase
    end


wire loopFilterEn = sync & modeErrorEn;

/**************************** Adjust Error ************************************/
reg [7:0]loopError;
always @(posedge clk) begin 
    if (zeroError) begin
        loopError <= 8'h0;
        end
    else if (invertError) begin
        loopError <= ~modeError + 1;
        end
    else begin
        loopError <= modeError;
        end
    end


/***************************** Loop Filter ************************************/

// Instantiate the lead/lag filter gain path
wire    [31:0]  leadError;
leadGain leadGain (
    .clk(clk), .clkEn(loopFilterEn), .reset(reset), 
    .error(loopError),
    .leadExp(leadExp),
    .leadError(leadError)
    );

wire            carrierLock;
wire    [31:0]  lagAccum;
lagGain lagGain (
    .clk(clk), .clkEn(loopFilterEn), .reset(reset), 
    .error(loopError),
    .lagExp(lagExp),
    .limit(limit),
    .sweepOffsetMag(sweepOffsetMag),
    .carrierInSync(carrierLock),
    .lagAccum(lagAccum)
    );


// Final filter output
reg [31:0]filterSum;
always @(posedge clk) begin
    if (reset) begin
        filterSum <= 0;
        end
    else if (loopFilterEn) begin
        filterSum <= lagAccum + leadError;
        end
    end

/******************************* Lock Detector ********************************/
assign carrierLock = 1;


// Final Outputs
assign carrierFreqOffset = filterSum;
assign carrierFreqEn = loopFilterEn;

`ifdef SIMULATE
real carrierOffsetReal = ((carrierFreqOffset > 2147483647.0) ? carrierFreqOffset-4294967296.0 : carrierFreqOffset)/2147483648.0;
`endif


endmodule
