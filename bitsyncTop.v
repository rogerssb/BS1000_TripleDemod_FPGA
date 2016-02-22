/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`include "./addressMap.v"
`timescale 1ns / 10 ps

module bitsyncTop(
    clk, clkEn, reset,
    `ifdef USE_BUS_CLOCK
    busClk,
    `endif
    wr0,wr1,wr2,wr3,
    addr,
    din,
    dout,
    rx0, 
    rx1,
    ch0Lock,
    ch0Sym2xEn,
    ch0SymEn,
    ch0SymData,
    ch0SymClk,
    ch0Bit,
    ch0Dac0ClkEn,
    ch0Dac0Data,
    ch0Dac1ClkEn,
    ch0Dac1Data,
    ch0Dac2ClkEn,
    ch0Dac2Data,
    ch0HighImpedance,
    ch0SingleEnded,
    ch0Gain,
    ch0Offset,
    ch1Lock,
    ch1Sym2xEn,
    ch1SymEn,
    ch1SymClk,
    ch1SymData,
    ch1Bit,
    ch1Dac0ClkEn,
    ch1Dac0Data,
    ch1Dac1ClkEn,
    ch1Dac1Data,
    ch1Dac2ClkEn,
    ch1Dac2Data,
    ch1HighImpedance,
    ch1SingleEnded,
    ch1Gain,
    ch1Offset,
    eyeClkEn,
    iEye,qEye,
    eyeOffset
    );


input                   clk;
input                   clkEn;
input                   reset;
`ifdef USE_BUS_CLOCK
input                   busClk;
`endif
input                   wr0,wr1,wr2,wr3;
input           [12:0]  addr;
input           [31:0]  din;
output          [31:0]  dout;
input           [17:0]  rx0;
input           [17:0]  rx1;
output                  ch0Lock;
output                  ch0Sym2xEn;
output                  ch0SymEn;
output                  ch0SymClk;
output                  ch0Bit;
output          [17:0]  ch0SymData;
output                  ch1Lock;
output                  ch1Sym2xEn;
output                  ch1SymEn;
output                  ch1SymClk;
output                  ch1Bit;
output          [17:0]  ch1SymData;
output                  ch0Dac0ClkEn;
output          [17:0]  ch0Dac0Data;
output                  ch0Dac1ClkEn;
output          [17:0]  ch0Dac1Data;
output                  ch0Dac2ClkEn;
output          [17:0]  ch0Dac2Data;
output                  ch0HighImpedance;
output                  ch0SingleEnded;
output          [17:0]  ch0Gain;
output  signed  [17:0]  ch0Offset;
output                  ch1Dac0ClkEn;
output          [17:0]  ch1Dac0Data;
output                  ch1Dac1ClkEn;
output          [17:0]  ch1Dac1Data;
output                  ch1Dac2ClkEn;
output          [17:0]  ch1Dac2Data;
output                  ch1HighImpedance;
output                  ch1SingleEnded;
output          [17:0]  ch1Gain;
output  signed  [17:0]  ch1Offset;
output                  eyeClkEn;
output          [17:0]  iEye,qEye;
output          [4:0]   eyeOffset;


/******************************************************************************
                                Global Registers
******************************************************************************/
// Microprocessor interface
reg bitsyncTopSpace;
always @* begin
    casex(addr)
        `BITSYNC_TOP_SPACE: bitsyncTopSpace = 1;
        default:            bitsyncTopSpace = 0;
        endcase
    end
wire    [1:0]   bitsyncMode;
wire    [3:0]   ch0Dac0Select, ch0Dac1Select, ch0Dac2Select;
wire    [3:0]   ch1Dac0Select, ch1Dac1Select, ch1Dac2Select;
wire    [4:0]   ch0DCGain,ch1DCGain;
wire    [31:0]  bitsyncTopDout;
bitsyncTopRegs bitsyncTopRegs(
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .addr(addr),
    .dataIn(din),
    .dataOut(bitsyncTopDout),
    .cs(bitsyncTopSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .ch0BitsyncLock(ch0Lock),
    .ch1BitsyncLock(ch1Lock),
    .bitsyncMode(bitsyncMode),
    .ch0Dac0Select(ch0Dac0Select),
    .ch0Dac1Select(ch0Dac1Select),
    .ch0Dac2Select(ch0Dac2Select),
    .ch0DCRemovalEnable(ch0DCRemovalEnable),
    .ch0HighImpedance(ch0HighImpedance),
    .ch0SingleEnded(ch0SingleEnded),
    .ch0DCGain(ch0DCGain),
    .ch1Dac0Select(ch1Dac0Select),
    .ch1Dac1Select(ch1Dac1Select),
    .ch1Dac2Select(ch1Dac2Select),
    .ch1DCRemovalEnable(ch1DCRemovalEnable),
    .ch1HighImpedance(ch1HighImpedance),
    .ch1SingleEnded(ch1SingleEnded),
    .ch1DCGain(ch1DCGain)
    );

wire    asyncMode = (bitsyncMode == `MODE_IND_CH)
                 || (bitsyncMode == `MODE_SINGLE_CH);

/******************************************************************************
                          DC Offset Removal Loop Filter
******************************************************************************/
wire    [33:0]  ch0DCIn = {rx0,16'h0};
wire    [39:0]  ch0DC;
dcLoopFilter ch0DcLoop(
    .clk(clk), .clkEn(ch0DCRemovalEnable), .reset(reset),
    .error(ch0DCIn),
    .lagExp(ch0DCGain),
    //.limit(32'h07ffffff),
    .limit(32'h3fffffff),
    .clearAccum(!ch0DCRemovalEnable),
    .lagAccum(ch0DC)
    );
assign ch0Offset = $signed(ch0DC[39:22]);

wire    [33:0]  ch1DCIn = {rx1,16'h0};
wire    [39:0]  ch1DC;
dcLoopFilter ch1DcLoop(
    .clk(clk), .clkEn(ch1DCRemovalEnable), .reset(reset),
    .error(ch1DCIn),
    .lagExp(ch1DCGain),
    //.limit(32'h07ffffff),
    .limit(32'h3fffffff),
    .clearAccum(!ch1DCRemovalEnable),
    .lagAccum(ch1DC)
    );
assign ch1Offset = $signed(ch1DC[39:22]);

`ifdef SIMULATE
real ch0DCReal;
always @* ch0DCReal = $itor(ch0Offset)/(2**17);
`endif


/******************************************************************************
                          Decimating Filters
******************************************************************************/
wire    [17:0]  df0Out;
wire    [31:0]  df0Dout;
decimatingFilter #(.RegSpace(`CH0_DFSPACE), .FirSpace(`CH0_DFFIRSPACE)) df0(
    .clk(clk), .clkEn(clkEn), .reset(reset),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(df0Dout),
    .rx(rx0),
    .clkEnOut(df0ClkEn),
    .dfOut(df0Out)
    );

wire    [17:0]  df1Out;
wire    [31:0]  df1Dout;
decimatingFilter #(.RegSpace(`CH1_DFSPACE), .FirSpace(`CH1_DFFIRSPACE)) df1(
    .clk(clk), .clkEn(clkEn), .reset(reset),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .wr0(wr0) , .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(df1Dout),
    .rx(rx1),
    .clkEnOut(df1ClkEn),
    .dfOut(df1Out)
    );


/******************************************************************************
                                  Resamplers
******************************************************************************/
reg ch0ResampSpace;
always @* begin
    casex(addr)
        `CH0_RESAMPSPACE:   ch0ResampSpace = 1;
        default:            ch0ResampSpace = 0;
        endcase
    end
wire    [31:0]  ch0ResampleRate;
wire    [31:0]  ch0ResampDout;
resamplerRegs ch0ResampRegs(
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .addr(addr),
    .dataIn(din),
    .dataOut(ch0ResampDout),
    .cs(ch0ResampSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .resampleRate(ch0ResampleRate)
     );

wire    [31:0]  ch0ResamplerFreqOffset;
wire    [17:0]  resamp0Out;
resampler ch0Resamp( 
    .clk(clk), .reset(reset), 
    .resetPhase(resetPhase),
    .sync(df0ClkEn),
    .resampleRate(ch0ResampleRate),
    .resamplerFreqOffset(ch0ResamplerFreqOffset),
    .offsetEn(1'b1),
    .in(df0Out),
    .out(resamp0Out),
    .syncOut(resamp0ClkEn),
    .sampleOffset(eyeOffset)
    );

reg ch1ResampSpace;
always @* begin
    casex(addr)
        `CH0_RESAMPSPACE:   ch1ResampSpace = 1;
        default:            ch1ResampSpace = 0;
        endcase
    end
wire    [31:0]  ch1ResampleRate;
wire    [31:0]  ch1ResampDout;
resamplerRegs ch1ResampRegs(
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .addr(addr),
    .dataIn(din),
    .dataOut(ch1ResampDout),
    .cs(ch1ResampSpace),
    .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
    .resampleRate(ch1ResampleRate)
     );

wire    [31:0]  asyncResamplerFreqOffset;
wire    [31:0]  ch1ResamplerRate =       asyncMode ? ch1ResampleRate : ch0ResampleRate;
wire    [31:0]  ch1ResamplerFreqOffset = asyncMode ? asyncResamplerFreqOffset : ch0ResamplerFreqOffset;
wire    [17:0]  resamp1Out;
resampler ch1Resamp( 
    .clk(clk), .reset(reset), 
    .resetPhase(resetPhase),
    .sync(df1ClkEn),
    .resampleRate(ch1ResamplerRate),
    .resamplerFreqOffset(ch1ResamplerFreqOffset),
    .offsetEn(1'b1),
    .in(df1Out),
    .out(resamp1Out),
    .syncOut(resamp1ClkEn),
    .sampleOffset()
    );

// If in synchronous mode, force the sample phases to be equal
assign resetPhase = (resamp0ClkEn ^ resamp1ClkEn) && !asyncMode;

/******************************************************************************
                     Timing Error Detectors and Loop Filters
******************************************************************************/

// This dual channel detector/loop is always used for ch0 and is used for both
// channels in synchronous modes
wire    [17:0]  ch0SymData,ch1SymData;
wire    [17:0]  bsError;
wire    [15:0]  ch0LockCounter;
wire    [15:0]  ch1LockCounter;
wire    [31:0]  bitsyncDout;
dualBitsync dualBitsync(
    .sampleClk(clk), .reset(reset),
    .ch0ClkEn(resamp0ClkEn),
    .ch1ClkEn(resamp1ClkEn),
    .bitsyncMode(bitsyncMode),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(bitsyncDout),
    .ch0(resamp0Out), 
    .ch1(resamp1Out),
    .ch0Sym2xEn(ch0Sym2xEn),
    .ch0SymEn(ch0SymEn),
    .ch0SymClk(ch0SymClk),
    .ch0SymData(ch0SymData),
    .ch0BitData(ch0Bit),
    .ch1Sym2xEn(ch1Sym2xEn),
    .ch1SymEn(ch1SymEn),
    .ch1SymClk(ch1SymClk),
    .ch1SymData(ch1SymData),
    .ch1BitData(ch1Bit),
    .ch0SampleFreq(ch0ResamplerFreqOffset),
    .ch1SampleFreq(asyncResamplerFreqOffset),
    .ch0BitsyncLock(ch0Lock),
    .ch0LockCounter(ch0LockCounter),
    .ch1BitsyncLock(ch1Lock),
    .ch1LockCounter(ch1LockCounter),
    .bsError(bsError), .bsErrorEn(bsErrorEn)
    );


assign eyeClkEn = resamp0ClkEn;
assign iEye = resamp0Out;
assign qEye = resamp1Out;

/******************************************************************************
                               AGC Loop Filters
******************************************************************************/

wire    [31:0]  agc0Dout;
pcmAgcLoop #(.RegSpace(`CH0_AGCSPACE)) pcmAgcLoop0(
    .clk(clk), .reset(reset), .clkEn(ch0SymEn),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(agc0Dout),
    .rx(ch0SymData),
    .agcGain(ch0Gain)
);

wire    [31:0]  agc1Dout;
pcmAgcLoop #(.RegSpace(`CH1_AGCSPACE)) pcmAgcLoop1(
    .clk(clk), .reset(reset), .clkEn(ch1SymEn),
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .addr(addr),
    .din(din),
    .dout(agc1Dout),
    .rx(ch1SymData),
    .agcGain(ch1Gain)
);

/******************************************************************************
                               DAC Output Mux
******************************************************************************/

reg             ch0Dac0ClkEn;
reg     [17:0]  ch0Dac0Data;
reg             ch0Dac1ClkEn;
reg     [17:0]  ch0Dac1Data;
reg             ch0Dac2ClkEn;
reg     [17:0]  ch0Dac2Data;
reg             ch1Dac0ClkEn;
reg     [17:0]  ch1Dac0Data;
reg             ch1Dac1ClkEn;
reg     [17:0]  ch1Dac1Data;
reg             ch1Dac2ClkEn;
reg     [17:0]  ch1Dac2Data;
always @(posedge clk) begin
    case (ch0Dac0Select)
        `BS_DAC_DF: begin
            ch0Dac0Data <= df0Out;
            ch0Dac0ClkEn <= df0ClkEn;
            end
        `BS_DAC_SYM: begin
            ch0Dac0Data <= ch0SymData;
            ch0Dac0ClkEn <= ch0Sym2xEn;
            end
        `BS_DAC_AGC: begin
            ch0Dac0Data <= ch0Gain;
            ch0Dac0ClkEn <= ch0SymEn;
            end
        `BS_DAC_LOCK: begin
            ch0Dac0Data <= {ch0LockCounter,2'b0};
            ch0Dac0ClkEn <= 1'b1;
            end
        default: begin
            ch0Dac0Data <= df0Out;
            ch0Dac0ClkEn <= df0ClkEn;
            end
        endcase

    case (ch0Dac1Select)
        `BS_DAC_DF: begin
            ch0Dac1Data <= df0Out;
            ch0Dac1ClkEn <= df0ClkEn;
            end
        `BS_DAC_SYM: begin
            ch0Dac1Data <= ch0SymData;
            ch0Dac1ClkEn <= ch0Sym2xEn;
            end
        `BS_DAC_AGC: begin
            ch0Dac1Data <= ch0Gain;
            ch0Dac1ClkEn <= ch0SymEn;
            end
        `BS_DAC_LOCK: begin
            ch0Dac1Data <= {ch0LockCounter,2'b0};
            ch0Dac1ClkEn <= 1'b1;
            end
        default: begin
            ch0Dac1Data <= df0Out;
            ch0Dac1ClkEn <= df0ClkEn;
            end
        endcase

    case (ch0Dac2Select)
        `BS_DAC_DF: begin
            ch0Dac2Data <= df0Out;
            ch0Dac2ClkEn <= df0ClkEn;
            end
        `BS_DAC_SYM: begin
            ch0Dac2Data <= ch0SymData;
            ch0Dac2ClkEn <= ch0Sym2xEn;
            end
        `BS_DAC_AGC: begin
            ch0Dac2Data <= ch0Gain;
            ch0Dac2ClkEn <= ch0SymEn;
            end
        `BS_DAC_LOCK: begin
            ch0Dac2Data <= {ch0LockCounter,2'b0};
            ch0Dac2ClkEn <= 1'b1;
            end
        default: begin
            ch0Dac2Data <= df0Out;
            ch0Dac2ClkEn <= df0ClkEn;
            end
        endcase



    case (ch1Dac0Select)
        `BS_DAC_DF: begin
            ch1Dac0Data <= df1Out;
            ch1Dac0ClkEn <= df1ClkEn;
            end
        `BS_DAC_SYM: begin
            ch1Dac0Data <= ch1SymData;
            ch1Dac0ClkEn <= ch1Sym2xEn;
            end
        `BS_DAC_AGC: begin
            ch1Dac0Data <= ch1Gain;
            ch1Dac0ClkEn <= ch1SymEn;
            end
        `BS_DAC_LOCK: begin
            ch1Dac0Data <= {ch1LockCounter,2'b0};
            ch1Dac0ClkEn <= 1'b1;
            end
        default: begin
            ch1Dac0Data <= df1Out;
            ch1Dac0ClkEn <= df1ClkEn;
            end
        endcase
    case (ch1Dac1Select)
        `BS_DAC_DF: begin
            ch1Dac1Data <= df1Out;
            ch1Dac1ClkEn <= df1ClkEn;
            end
        `BS_DAC_SYM: begin
            ch1Dac1Data <= ch1SymData;
            ch1Dac1ClkEn <= ch1Sym2xEn;
            end
        `BS_DAC_AGC: begin
            ch1Dac1Data <= ch1Gain;
            ch1Dac1ClkEn <= ch1SymEn;
            end
        `BS_DAC_LOCK: begin
            ch1Dac1Data <= {ch1LockCounter,2'b0};
            ch1Dac1ClkEn <= 1'b1;
            end
        default: begin
            ch1Dac1Data <= df1Out;
            ch1Dac1ClkEn <= df1ClkEn;
            end
        endcase
    case (ch1Dac2Select)
        `BS_DAC_DF: begin
            ch1Dac2Data <= df1Out;
            ch1Dac2ClkEn <= df1ClkEn;
            end
        `BS_DAC_SYM: begin
            ch1Dac2Data <= ch1SymData;
            ch1Dac2ClkEn <= ch1Sym2xEn;
            end
        `BS_DAC_AGC: begin
            ch1Dac2Data <= ch1Gain;
            ch1Dac2ClkEn <= ch1SymEn;
            end
        `BS_DAC_LOCK: begin
            ch1Dac2Data <= {ch1LockCounter,2'b0};
            ch1Dac2ClkEn <= 1'b1;
            end
        default: begin
            ch1Dac2Data <= df1Out;
            ch1Dac2ClkEn <= df1ClkEn;
            end
        endcase

    end

/******************************************************************************
                                uP dout mux
******************************************************************************/
reg [31:0]dout;
always @* begin
    casex (addr)
        `BITSYNC_TOP_SPACE: dout = bitsyncTopDout;
        `CH0_DFSPACE,
        `CH0_DFFIRSPACE:    dout = df0Dout;
        `CH0_RESAMPSPACE:   dout = ch0ResampDout;
        `CH1_DFSPACE,
        `CH1_DFFIRSPACE:    dout = df1Dout;
        `CH1_RESAMPSPACE:   dout = ch1ResampDout;
        `CH0_BITSYNCSPACE,
        `CH1_BITSYNCSPACE:  dout = bitsyncDout;
        `CH0_AGCSPACE:      dout = agc0Dout;
        `CH1_AGCSPACE:      dout = agc1Dout;
        default:            dout = 32'bx;
        endcase
    end



endmodule
