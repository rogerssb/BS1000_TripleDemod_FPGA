`timescale 1ns / 10 ps

module soqpskMod( 
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
    soqpskModFreq
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
output [31:0]soqpskModFreq;

// Register interface
wire [31:0]carrierFreq;
wire [17:0]deviation;
wire [15:0]bitrateDiv;
wire [4:0]cicShift;
soqpskModRegs regs  (
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
    else if (bitrateCount == 0) begin
        bitrateCount <= bitrateDiv;
        modClkOut <= ~modClkOut;
        modSampleEn <= 1;
        end
    else begin
        modSampleEn <= 0;
        bitrateCount <= bitrateCount - 1;
        end
    end

// Select the modulator bit clock;
wire modClk = modClkOut;

// Do the IRIG standard differential encoding
reg iBit,qBit;
always @(posedge clk) begin
    if (reset) begin
        iBit <= 0;
        qBit <= 0;
        end
    else if (modSampleEn) begin
        if (modClkOut) begin
            iBit <= modData ^ !qBit;
            end
        else begin
            qBit <= modData ^ iBit;
            end
        end
    end

// Do the dibit to ternary encoding
reg     [2:0]   bitSR;
reg     [2:0]   modValue;
always @(posedge clk) begin
    if (reset) begin
        end
    else if (modSampleEn) begin
        if (modClkOut) begin
            bitSR <= {bitSR[1:0],qBit}
            end
        else begin
            bitSR <= {bitSR[1:0],iBit}
            end
        case (bitSR)
            3'b000: modValue <= 3'b000;
            3'b001: begin
                if (modClkOut) begin
                    modValue <= 3'b110;
                    end
                else begin
                    modValue <= 3'b010;
                    end
                end
            3'b010: modValue <= 3'b000;
            3'b011: begin
                if (modClkOut) begin
                    modValue <= 3'b010;
                    end
                else begin
                    modValue <= 3'b110;
                    end
                end
            3'b100: begin
                if (modClkOut) begin
                    modValue <= 3'b010;
                    end
                else begin
                    modValue <= 3'b110;
                    end
                end
            3'b101: modValue <= 3'b000;
            3'b110: begin
                if (modClkOut) begin
                    modValue <= 3'b110;
                    end
                else begin
                    modValue <= 3'b010;
                    end
                end
            3'b111: modValue <= 3'b000;
            endcase
        end
    end


// Run the samples through the shaping filter
wire [17:0]shapingFirOut;
soqpskFir modFir(
    .clk(clk), 
    .nd(modSampleEn),
    .rfd(),
    .rdy(shapedReady),
    .din(modValue),
    .dout(shapingFirOut)
    );

`ifdef SIMULATE
real shapedReal;
always @(shapingFirOut) shapedReal = ((shapingFirOut > 131071.0) ? (shapingFirOut - 262144.0) : shapingFirOut)/131072.0;
`endif

// CIC Interpolation Filter
wire [33:0]cicOut;
cicInterpolate interpolate(
    .clk(clk), .reset(reset), .clkEn(shapedReady),
    .dIn({shapingFirOut[10:0],7'b0}),
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
real interpReal;
always @(devInput) interpReal = (devInput[17] ? (devInput - 262144.0) : devInput)/131072.0;
`endif

wire [35:0]devValue;
mpy18x18 devScaler (
    .sclr(1'b0),
    .clk(clk),
    .a(devInput),
    .b(deviation),
    .p(devValue)
    );
wire [31:0]modFreq = devValue[34:3];

assign soqpskModFreq = modFreq + carrierFreq;

endmodule
