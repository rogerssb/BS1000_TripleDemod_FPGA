//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Trellis Carrier Loop
// Created      24 April 09
//-----------------------------------------------------------------------------
// 1.0      (VS)initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
`include "./addressMap.v"

//`define BYPASS_LOOP
//`define USE_FRACTIONAL_DELAY
           
module multihCarrierLoop(
    clk,reset,symEn,sym2xEn,
    iIn,qIn,
    phaseError,
    phaseErrorEn,
    phaseErrorValid,
    wr0,wr1,wr2,wr3,
    addr,
    din,dout,
    dac0Select,dac1Select,dac2Select,
    dac0Sync,
    dac0Data,
    dac0En,
    dac1Sync,
    dac1Data,
    dac1En,
    dac2Sync,
    dac2Data,
    dac2En,
    demodLock,
    iOut,qOut,
    symEnOut,
    sym2xEnOut
    );

input clk,reset,symEn,sym2xEn;
input [17:0]iIn,qIn;
input   [7:0]   phaseError;
input           phaseErrorEn;
input           phaseErrorValid;
input wr0,wr1,wr2,wr3;
input [11:0]addr;
input [31:0]din;
output [31:0]dout;
input   [3:0]   dac0Select,dac1Select,dac2Select;
output          dac0Sync;
output  [17:0]  dac0Data;
output          dac0En;
output          dac1Sync;
output  [17:0]  dac1Data;
output          dac1En;
output          dac2Sync;
output  [17:0]  dac2Data;
output          dac2En;
output          demodLock;
output  [17:0]  iOut,qOut;
output          symEnOut;
output          sym2xEnOut;

wire    [31:0]  carrierFreqOffset;

/***************************** Control Registers ******************************/

reg trellisSpace;
always @(addr) begin
    casex(addr)
        `TRELLISLFSPACE: trellisSpace <= 1;
        default:        trellisSpace <= 0;
        endcase
    end
wire    [31:0]  dout;
wire    [4:0]   leadExp;
wire    [4:0]   lagExp;
wire    [31:0]  limit;
wire    [31:0]  loopOffset;
wire    [15:0]  lockCount;
wire    [11:0]   syncThreshold;
wire    [39:0]  lagAccum;
wire    [2:0]   averageSelect;
`ifdef USE_FRACTIONAL_DELAY
wire    [12:0]  unused0;
wire    [4:0]   sampleOffset;
wire    [10:0]  unused1;
`else
wire    [28:0]  unused;
`endif
loopRegs loopRegs(
    .cs(trellisSpace),
    .addr(addr),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .lagAccum(lagAccum[39:8]),
    .dataIn(din),
    .dataOut(dout),
    .invertError(invertError),
    .zeroError(zeroError),
    .clearAccum(clearAccum),
    .leadMan(),
    .leadExp(leadExp),
    .lagMan(),
    .lagExp(lagExp),
    .limit(limit),
    `ifdef USE_FRACTIONAL_DELAY
    .loopData({unused1,sampleOffset,unused0,averageSelect}),
    `else
    .loopData({unused,averageSelect}),
    `endif
    .lockCount(lockCount),
    .syncThreshold(syncThreshold)
    );


/**************************** Average Error ***********************************/
reg     [15:0]  shiftError;
reg     [7:0]   avgCount;
always @(phaseError or averageSelect) begin
    case (averageSelect) 
        0: begin avgCount <= 0;   shiftError <= {phaseError,8'b0}; end
        1: begin avgCount <= 1;   shiftError <= {{1{phaseError[7]}},phaseError,7'b0}; end
        2: begin avgCount <= 3;   shiftError <= {{2{phaseError[7]}},phaseError,6'b0}; end
        3: begin avgCount <= 7;   shiftError <= {{3{phaseError[7]}},phaseError,5'b0}; end
        4: begin avgCount <= 15;  shiftError <= {{4{phaseError[7]}},phaseError,4'b0}; end
        5: begin avgCount <= 31;  shiftError <= {{5{phaseError[7]}},phaseError,3'b0}; end
        6: begin avgCount <= 63;  shiftError <= {{6{phaseError[7]}},phaseError,2'b0}; end
        7: begin avgCount <= 255; shiftError <= {{7{phaseError[7]}},phaseError,1'b0}; end
        endcase
    end
reg     [15:0]  errorAcc;
wire    [15:0]  posSum = errorAcc + shiftError;
wire    [15:0]  negSum = errorAcc - shiftError;
reg     [7:0]   avgCounter;
wire            terminalCount = (avgCounter == 0);
wire            loopFilterEn = phaseErrorEn & terminalCount;
reg     [7:0]   loopError;
always @(posedge clk) begin
    if (phaseErrorEn) begin
        if (terminalCount) begin
            avgCounter <= avgCount;
            loopError <= errorAcc[15:8] + errorAcc[7];
            end
        else begin
            avgCounter <= avgCounter - 1;
            end
        if (zeroError) begin
            errorAcc <= 0;
            end
        else if (invertError) begin
            if (terminalCount) begin
                errorAcc <= -shiftError;
                end
            else begin
                errorAcc <= negSum;
                end
            end
        else begin
            if (terminalCount) begin
                errorAcc <= shiftError;
                end
            else begin
                errorAcc <= posSum;
                end
            end
        end
    end


/***************************** Loop Filter ************************************/

// Instantiate the lead/lag filter gain path
wire    [39:0]  leadError;
leadGain leadGain (
    .clk(clk), .clkEn(loopFilterEn), .reset(reset), 
    .error(loopError),
    .leadExp(leadExp),
    .leadError(leadError)
    );

lagGain lagGain (
    .clk(clk), .clkEn(loopFilterEn), .reset(reset), 
    .error(loopError),
    .lagExp(lagExp),
    .limit(limit),
    .sweepEnable(1'b0),
    .clearAccum(clearAccum),
    .carrierInSync(carrierLock),
    .lagAccum(lagAccum)
    );


// Final filter output
reg [39:0]filterSum;
always @(posedge clk) begin
    if (reset) begin
        filterSum <= 0;
        end
    else if (loopFilterEn) begin
        filterSum <= lagAccum + leadError;
        end
    end

// Final Outputs
assign carrierFreqOffset = filterSum[39:8];
assign carrierFreqEn = loopFilterEn;


/******************************* Lock Detector ********************************/
reg             demodLock;
reg             symbolSlip;
reg             errorValid;
reg     [7:0]   absModeError;
reg     [15:0]  lockCounter;
wire    [16:0]  lockPlus = {1'b0,lockCounter} + 17'h00001;
wire    [16:0]  lockMinus = {1'b0,lockCounter} + 17'h1ffff;
always @(posedge clk) begin
    if (reset) begin
        lockCounter <= 0;
        demodLock <= 1;
        symbolSlip <= 0;
        end
    else if (phaseErrorEn) begin
        errorValid <= phaseErrorValid;
        absModeError <= phaseError[7] ? -phaseError : phaseError;
        if (errorValid) begin
            if (absModeError > syncThreshold[7:0]) begin
                if (lockCounter == (16'hffff - lockCount)) begin
                    // Declare out of lock condition. If we were previously out of lock,
                    // slip a symbol.
                    if (!demodLock) begin
                        symbolSlip <= 1;
                        end
                    demodLock <= 0;
                    lockCounter <= 0;
                    end
                else begin
                    lockCounter <= lockMinus[15:0];
                    symbolSlip <= 0;
                    end
                end
            else begin
                symbolSlip <= 0;
                if (lockCounter == lockCount) begin
                    demodLock <= 1;
                    lockCounter <= 0;
                    end
                else begin
                    lockCounter <= lockPlus[15:0];
                    end
                end
            end
        end
    end


`ifdef SIMULATE
real carrierOffsetReal;
real lagAccumReal; 
integer lockCounterInt;
always @(carrierFreqOffset) carrierOffsetReal = ((carrierFreqOffset > 2147483647.0) ? carrierFreqOffset-4294967296.0 : carrierFreqOffset)/2147483648.0;
always @(lagAccum) lagAccumReal = ((lagAccum[39:8] > 2147483647.0) ? lagAccum[39:8]-4294967296.0 : lagAccum[39:8])/2147483648.0; 
always @(lockCounter) lockCounterInt = lockCounter;
`endif

// Create the LO frequency
reg [31:0] newOffset;
always @(posedge clk) begin
    if (reset) begin
        newOffset <= 0;
        end
    else if (carrierFreqEn) begin
        newOffset <= carrierFreqOffset;
        end
    end

wire ddsReset = reset;


wire [17:0]bReal,bImag;
dds dds(
  .clk(clk),
  .sclr(ddsReset),
`ifdef SIMULATE
  .ce(1'b1),
`else
  .ce(sym2xEn),
`endif
  .we(1'b1),
  .data(newOffset), // Bus [31 : 0]
  .cosine(bReal), // Bus [17 : 0] 
  .sine(bImag)); // Bus [17 : 0] 

//`ifdef BYPASS_LOOP
//wire    [17:0]  iMpy,qMpy;
//cmpy18Sat cmpy18Sat(
//    .clk(clk),
//    .reset(reset),
//    .aReal(iIn),.aImag(qIn),
//    .bReal(18'h16a09),.bImag(18'h16a09),     // (1/sqrt(2)) * 131072 = 0x16a09
//    .pReal(iMpy),.pImag(qMpy));
//`else

`ifdef USE_FRACTIONAL_DELAY
wire    [17:0]  iDelay;
fractionalDelay delayI( 
    .clk(clk), .reset(reset), .sync(sym2xEn),
    .sampleOffset(sampleOffset),
    .in(iIn),
    .out(iDelay)
    );
wire    [17:0]  qDelay;
fractionalDelay delayQ( 
    .clk(clk), .reset(reset), .sync(sym2xEn),
    .sampleOffset(sampleOffset),
    .in(qIn),
    .out(qDelay)
    );
`else
reg     [17:0]  iRouteDelay0,qRouteDelay0;
reg     [17:0]  iRouteDelay1,qRouteDelay1;
always @(posedge clk) begin
    if (sym2xEn) begin
        iRouteDelay0 <= iIn;
        iRouteDelay1 <= iRouteDelay0;
        qRouteDelay0 <= qIn;
        qRouteDelay1 <= qRouteDelay0;
        end
    end
`endif

wire    [17:0]  iMpy,qMpy;
cmpy18Sat cmpy18Sat(
    .clk(clk),
    .reset(reset),
    `ifdef USE_FRACTIONAL_DELAY
    .aReal(iDelay),.aImag(qDelay),
    `else
    .aReal(iRouteDelay1),.aImag(qRouteDelay1),
    `endif
    .bReal(bReal),.bImag(bImag),
    .pReal(iMpy),.pImag(qMpy));
//`endif

// Create a new set of clock enables to account for the delay through the complex multiplier
reg [3:0] symEnSr;
reg [3:0] sym2xEnSr;
always @(posedge clk) begin
    if (reset) begin
        symEnSr <= 0;
        sym2xEnSr <= 0;
        end
    else begin
        symEnSr <= {symEnSr[2:0], symEn};
        sym2xEnSr <= {sym2xEnSr[2:0], sym2xEn};
        end
    end

// Create a symbol slip state machine
reg     [1:0]   slipSR;
wire            slip = (!slipSR[0] && symbolSlip);
//wire            slip = 1'b0;
reg     [17:0]  slipI,slipQ;
reg             symEnOut, sym2xEnOut;
always @(posedge clk) begin
    // Reclock the inputs
    slipI <= iMpy;
    slipQ <= qMpy;
    sym2xEnOut <= sym2xEnSr[3];

    // Create a gated version of symEn.
    slipSR <= {slipSR[0],symbolSlip};
    if (symEnSr[3] && slip) begin
        symEnOut <= 0;
        end
    else begin
        symEnOut <= symEnSr[3];
        end
    end

assign iOut = slipI;
assign qOut = slipQ;


`ifdef SIMULATE
real iOutReal;
always @(iOut) iOutReal = (iOut[17] ? iOut - 272144.0 : iOut)/131072.0;
real iInReal;
always @(iIn) iInReal = (iIn[17] ? iIn - 272144.0 : iIn)/131072.0;
`endif

//******************************************************************************
//                               DAC Output Mux
//******************************************************************************

reg             dac0Sync;
reg     [17:0]  dac0Data;
reg             dac0En;
reg             dac1Sync;
reg     [17:0]  dac1Data;
reg             dac1En;
reg             dac2Sync;
reg     [17:0]  dac2Data;
reg             dac2En;
always @(posedge clk) begin
    if (reset) begin
        dac0En <= 0;
        dac1En <= 0;
        dac2En <= 0;
        end
    else begin
        case (dac0Select) 
            `DAC_I: begin
                dac0Data <= iIn;
                dac0Sync <= sym2xEn;
                dac0En <= 1;
                end
            `DAC_Q: begin
                dac0Data <= qOut;
                dac0Sync <= sym2xEnOut;
                dac0En <= 1;
                end
            `DAC_PHERROR: begin
                dac0Data <= {phaseError,10'b0};
                dac0Sync <= 1;
                dac0En <= 1;
                end
            `DAC_FREQLOCK: begin
                dac0Data <= {lockCounter,2'b0};
                dac0Sync <= 1;
                dac0En <= 1;
                end
            default: begin
                dac0Data <= {phaseError,10'b0};
                dac0Sync <= 1;
                dac0En <= 0;
                end
            endcase

        case (dac1Select) 
            `DAC_I: begin
                dac1Data <= iOut;
                dac1Sync <= sym2xEnOut;
                dac1En <= 1;
                end
            `DAC_Q: begin
                dac1Data <= qIn;
                dac1Sync <= sym2xEn;
                dac1En <= 1;
                end
            `DAC_PHERROR: begin
                dac1Data <= {phaseError,10'b0};
                dac1Sync <= 1;
                dac1En <= 1;
                end
            `DAC_FREQLOCK: begin
                dac1Data <= {absModeError,10'b0};
                dac1Sync <= 1;
                dac1En <= 1;
                end
            default: begin
                dac1Data <= {phaseError,10'b0};
                dac1Sync <= 1;
                dac1En <= 0;
                end
            endcase

        case (dac2Select) 
            `DAC_I: begin
                dac2Data <= iIn;
                dac2Sync <= sym2xEn;
                dac2En <= 1;
                end
            `DAC_Q: begin
                dac2Data <= qIn;
                dac2Sync <= sym2xEn;
                dac2En <= 1;
                end
            `DAC_PHERROR: begin
                if (loopFilterEn) begin
                   dac2Data <= {loopError,10'b0};
                   end
                dac2Sync <= loopFilterEn;
                dac2En <= 1;
                end
            `DAC_FREQLOCK: begin
                dac2Data <= {1'b0,errorValid,16'b0};
                dac2Sync <= 1;
                dac2En <= 1;
                end
            default: begin
                dac2Data <= {loopError,10'b0};
                dac2Sync <= loopFilterEn;
                dac2En <= 0;
                end
            endcase
        end
    end



endmodule
