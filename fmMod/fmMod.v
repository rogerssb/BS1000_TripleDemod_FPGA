`timescale 1ns / 10 ps

`define MODE_2FSK       2'b00
`define MODE_SHAPED2FSK 2'b01
`define MODE_4FSK       2'b10
`define MODE_SHAPED4FSK 2'b11
// Define the FM memory map
`define FM_MOD_FREQ     12'hxx0
`define FM_MOD_DEV      12'hxx4
`define FM_MOD_BITRATE  12'hxx8
`define FM_MOD_CIC      12'hxxc

module fmMod( 
    clk, reset,
    cs,
    wr0, wr1, wr2, wr3,
    addr,
    din,
    dout,
    modData,
    modClkIn,
    modClkOut,
    modDataValid,
    txSelect,
    fskMode,
    fmModFreq
    );

input clk;
input reset;
input cs;
input wr0,wr1,wr2,wr3;
input [11:0]addr;
input [31:0]din;
output [31:0]dout;
input modData;
input modClkIn;
output modClkOut;
input modDataValid;
input txSelect;
input [1:0]fskMode;
output [31:0]fmModFreq;

// Register interface
wire [31:0]carrierFreq;
wire [17:0]deviation;
wire [15:0]bitrateDiv;
wire [4:0]cicShift;
fmModRegs regs  (
    .cs(cs),
    .addr(addr),
    .dataIn(din),
    .dataOut(dout),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .carrierFreq(carrierFreq),
    .deviation(deviation),
    .bitrateDiv(bitrateDiv),
    .modClkSel(modClkSel),
    .cicShift(cicShift)
    );

// Generate internal bitrate clock
reg modClkOut;
reg modSampleEn;
reg [15:0]bitrateCount;
reg [1:0]bitSR;
always @(posedge clk) begin
    if (reset) begin
        bitrateCount <= bitrateDiv;
        modClkOut <= 0;
        end
    else if (txSelect) begin
        if (bitrateCount == 0) begin
            bitrateCount <= bitrateDiv;
            modClkOut <= ~modClkOut;
            casex (fskMode)
                `MODE_2FSK,
                `MODE_SHAPED2FSK: 
                    begin
                    modSampleEn <= 1;
                    end
                `MODE_4FSK,
                `MODE_SHAPED4FSK: 
                    begin
                    if (!modClkOut) begin
                        modSampleEn <= 1;
                        end
                    end
                endcase
            end
        else begin
            modSampleEn <= 0;
            bitrateCount <= bitrateCount - 1;
            end
        end
    end

// Select the modulator bit clock;
wire modClk = modClkSel ? modClkIn : modClkOut;

// Turn bit stream into carrier deviation samples interpolated to two samples
// per bit.
reg [2:0]modValue;
reg symbolReady;
always @(posedge clk) begin
    if (!modDataValid) begin
        symbolReady <= 0;
        modValue <= 3'h0;
        end
    else begin
        casex (fskMode)
            `MODE_2FSK:
                begin
                if (modSampleEn) begin
                    if (modData) begin
                        modValue <= 3'h2;        // +1/2
                        end
                    else begin
                        modValue <= 3'h6;        // -1/2
                        end
                    end
                end
            `MODE_SHAPED2FSK: 
                begin
                if (modSampleEn) begin
                    if (modClk) begin
                        if (modData) begin
                            modValue <= 3'h2;        // +1/2
                            end
                        else begin
                            modValue <= 3'h6;        // -1/2
                            end
                        end
                    else begin
                        modValue <= 3'h0;
                        end
                    end
                end
            `MODE_4FSK:
                begin
                if (modSampleEn) begin
                    bitSR <= {bitSR[0],modData};
                    symbolReady <= !symbolReady;
                    if (symbolReady) begin
                        case (bitSR)
                            2'b00:  modValue <= 3'h1;   // +1/4
                            2'b01:  modValue <= 3'h3;   // +3/4
                            2'b10:  modValue <= 3'h7;   // -1/4
                            2'b11:  modValue <= 3'h5;   // -3/4
                            endcase
                        end
                    end
                end
            `MODE_SHAPED4FSK: 
                begin
                if (modSampleEn) begin
                    bitSR <= {bitSR[0],modData};
                    symbolReady <= !symbolReady;
                    if (symbolReady) begin
                        case (bitSR)
                            2'b00:  modValue <= 3'h1;   // +1/4
                            2'b01:  modValue <= 3'h3;   // +3/4
                            2'b10:  modValue <= 3'h7;   // -1/4
                            2'b11:  modValue <= 3'h5;   // -3/4
                            endcase
                        end
                    else begin
                        modValue <= 3'h0;
                        end
                    end
                end
            endcase
        end
    end

// Run the samples through the shaping filter
wire [17:0]shapingFirOut;
shapingFir modFir(
    .clk(clk), 
    .nd(modSampleEn),
    .rfd(),
    .rdy(shapedReady),
    .din(modValue),
    .dout(shapingFirOut)
    );
wire shaped = fskMode[0];
wire [17:0]shapedOutput = shaped ? {shapingFirOut[10:0],7'b0} : {modValue,15'b0};

`ifdef SIMULATE
real shapedReal = ((shapedOutput > 131071.0) ? (shapedOutput - 262144.0) : shapedOutput)/131072.0;
`endif

// CIC Interpolation Filter
wire [33:0]cicOut;
cicInterpolate cicInterpolate(
    .clk(clk), .reset(reset), .clkEn(shapedReady),
    .dIn(shapedOutput),
    .dOut(cicOut)
    );
wire [17:0]devInput;
shift34to18 cicGainAdjust(
    .clk(clk), .clkEn(1'b1),
    .shift(cicShift),
    .dIn(cicOut),
    .dOut(devInput)
    );

`ifdef SIMULATE
real interpReal = (devInput[17] ? (devInput - 262144.0) : devInput)/131072.0;
`endif

wire [35:0]devValue;
mpy18x18 devScaler (
    .sclr(1'b0),
    .clk(clk),
    .a(devInput),
    //.a({modValue,16'b0}),
    .b(deviation),
    .p(devValue)
    );
wire [31:0]modFreq = devValue[34:3];

assign fmModFreq = modFreq + carrierFreq;

endmodule
