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
`include "addressMap.v"
`define USE_LEGACY
//`define USE_SR
//`define USE_MPY_FM_DISC

module trellisCarrierLoop(
    clk,reset,
    symEn,
    sym2xEn,
    iIn,qIn,
    legacyBit,
    phaseErrorIn,
    symEn_phErr,
    `ifdef USE_BUS_CLOCK
    busClk,
    `endif
    cs,
    wr0,wr1,wr2,wr3,
    addr,
    din,dout,
    iOut,qOut,
    symEnDly,
    sym2xEnDly,
    dac0Output,
    dac1Output,
    lockCounter
    );

input           clk,reset;
input           symEn,sym2xEn;
input   [17:0]  iIn,qIn;
input           legacyBit;
input   [7:0]   phaseErrorIn;
input           symEn_phErr;
`ifdef USE_BUS_CLOCK
input           busClk;
`endif
input           cs;
input           wr0,wr1,wr2,wr3;
input   [12:0]  addr;
input   [31:0]  din;
output  [31:0]  dout;
output  [17:0]  iOut,qOut;
output          symEnDly;
output          sym2xEnDly;
output  [11:0]  dac0Output;
output  [11:0]  dac1Output;
output  [15:0]  lockCounter;

wire    [31:0]  carrierFreqOffset;

/***************************** Control Registers ******************************/

reg trellisSpace;
always @* begin
    casex(addr)
        `TRELLISLFSPACE:    trellisSpace = cs;
        default:            trellisSpace = 0;
        endcase
    end
wire    [31:0]  dout;
wire    [4:0]   leadExp;
wire    [4:0]   lagExp;
wire    [31:0]  limit;
wire    [4:0]   afcGain;
wire    [31:0]  posDevCorrection;
wire    [31:0]  negDevCorrection;
wire    [15:0]  lockCount;
wire    [11:0]   syncThreshold;
wire    [39:0]  lagAccum;
wire    [39:0]  afcAccum;
`ifdef INTERNAL_ADAPT
reg     [31:0]  posDevAccum,negDevAccum;
`endif
`ifdef USE_SR
wire    [7:0]   leadMan;
wire    [2:0]   srIndex = leadMan[2:0];
`endif
loopRegs loopRegs(
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .cs(trellisSpace),
    .addr(addr),
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .lagAccum(lagAccum[39:8]),
    .dataIn(din),
    .dataOut(dout),
    .lockStatus(1'b0),
    .invertError(invertError),
    .zeroError(zeroError),
    .ctrl2(clearAFC),
    .clearAccum(clearAccum),
    .ctrl4(manualDeviation),
    `ifdef USE_SR
    .leadMan(leadMan),
    `else
    .leadMan(),
    `endif
    .leadExp(leadExp),
    .lagMan(),
    .lagExp(lagExp),
    .limit(limit),
    .lockCount(lockCount),
    .syncThreshold(syncThreshold),
    .loopData(posDevCorrection),
    `ifdef INTERNAL_ADAPT
    .loopDataRead(posDevAccum),
    .loopData1Read(negDevAccum),
    `endif
    .leadMan1(),
    .leadExp1(),
    .lagMan1(),
    .lagExp1(afcGain),
    .loopData1(negDevCorrection)
    );


//`define USE_PHASE_FIFO
`ifdef USE_PHASE_FIFO
/**************************** Phase Error FIFO ********************************/

wire    [7:0]   phaseError;
phaseFifo phaseFifo(
        .clk(clk),
        .reset(reset),
        .enIn(symEn_phErr),
        .enOut(symEn),
        .din(phaseErrorIn),
        .dout(phaseError)
        );
wire loopFilterEn = symEn;

`else

wire    [7:0]   phaseError = phaseErrorIn;
wire            loopFilterEn = symEn_phErr;

`endif


/**************************** Adjust Error ************************************/
reg     [7:0]   loopError;
wire    [7:0]   negPhaseError = ~phaseError + 1;
reg             carrierLock;
wire            breakLoop = zeroError;
always @(posedge clk) begin
    if (loopFilterEn) begin
        if (breakLoop) begin
            loopError <= 8'h0;
            end
        else if (invertError) begin
            loopError <= negPhaseError;
            end
        else begin
            loopError <= phaseError;
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
    .sweepRateMag(32'b0),
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

/******************************* Lock Detector ********************************/
wire    [7:0]   absPhaseError = phaseError[7] ? negPhaseError : phaseError;
reg     [15:0]  lockCounter;
wire    [16:0]  lockPlus = {1'b0,lockCounter} + 17'h00001;
wire    [16:0]  lockMinus = {1'b0,lockCounter} + 17'h1ffff;
always @(posedge clk) begin
    if (reset) begin
        lockCounter <= 0;
        carrierLock <= 0;
        end
    else if (loopFilterEn) begin
        if (absPhaseError > syncThreshold[7:0]) begin
            if (lockMinus[16]) begin
                carrierLock <= 0;
                lockCounter <= lockCount;
                end
            else begin
                lockCounter <= lockMinus[15:0];
                end
            end
        else begin
            if (lockPlus[16]) begin
                carrierLock <= 1;
                lockCounter <= lockCount;
                end
            else begin
                lockCounter <= lockPlus[15:0];
                end
            end
        end
    end


// Final Outputs
assign carrierFreqOffset = filterSum[39:8];
assign carrierFreqEn = loopFilterEn;

`ifdef SIMULATE
real carrierOffsetReal;
real lagAccumReal;
integer lockCounterInt;
always @(carrierFreqOffset) carrierOffsetReal = ((carrierFreqOffset > 2147483647.0) ? carrierFreqOffset-4294967296.0 : carrierFreqOffset)/2147483648.0;
always @(lagAccum) lagAccumReal = ((lagAccum[39:8] > 2147483647.0) ? lagAccum[39:8]-4294967296.0 : lagAccum[39:8])/2147483648.0;
always @(lockCounter) lockCounterInt = lockCounter;
`endif

`ifndef S_CURVE_TESTING
// Create the LO frequency
reg     [31:0]  newOffset;
wire    [31:0]  afcOffset;
always @(posedge clk) begin
    if (reset) begin
        newOffset <= 0;
        end
    else if (carrierFreqEn) begin
        newOffset <= carrierFreqOffset + afcOffset;
        //newOffset <= carrierFreqOffset;
        end
    end


`ifdef INTERNAL_ADAPT

// Mod index of 0.7 corresponds to an index delta of 7
`define PCMFM_DELTA  7
`define MAX_POS_DEVIATION   32'h0d000000
`define MIN_POS_DEVIATION   32'hf3000000
`define MAX_NEG_DEVIATION   32'h0d000000
`define MIN_NEG_DEVIATION   32'hf3000000

wire    [4:0]   posDeltaError = `PCMFM_DELTA - indexDelta;
wire    [4:0]   negDeltaError = indexDelta - `PCMFM_DELTA;
always @(posedge clk) begin
    if (symEn_index) begin
        // Negative Delta?
        if (indexDelta[4]) begin
            if ( (negDeltaError[4] & negDevAccum[31])
              && (negDevAccum <= `MIN_NEG_DEVIATION)) begin
                negDevAccum <= `MIN_NEG_DEVIATION;
                end
            else if ( (!negDeltaError[4] & !negDevAccum[31])
                   && (negDevAccum >= `MAX_NEG_DEVIATION)) begin
                negDevAccum <= `MAX_NEG_DEVIATION;
                end
            else begin
                negDevAccum <= negDevAccum + {{16{negDeltaError[4]}},negDeltaError,11'b0};
                end
            end
        else begin
            if ( (posDeltaError[4] & posDevAccum[31])
              && (posDevAccum <= `MIN_POS_DEVIATION)) begin
                posDevAccum <= `MIN_POS_DEVIATION;
                end
            else if ( (!posDeltaError[4] & !posDevAccum[31])
                   && (posDevAccum >= `MAX_POS_DEVIATION)) begin
                posDevAccum <= `MAX_POS_DEVIATION;
                end
            else begin
                posDevAccum <= posDevAccum + {{16{posDeltaError[4]}},posDeltaError,11'b0};
                end
            end
        end
    end

reg     [31:0]  deviationCorrection;
reg     [31:0]  devCorrection;
reg             prevLegacyBit;
always @(posedge clk) begin
    if (sym2xEn) begin
        prevLegacyBit <= legacyBit;
        if (legacyBit & prevLegacyBit) begin
            if (manualDeviation) begin
                devCorrection <= posDevCorrection;
                end
            else begin
                devCorrection <= posDevAccum;
                end
            end
        else if (!legacyBit & !prevLegacyBit) begin
            if (manualDeviation) begin
                devCorrection <= negDevCorrection;
                end
            else begin
                devCorrection <= negDevAccum;
                end
            end
        else begin
            devCorrection <= 0;
            end
        deviationCorrection <= devCorrection;
        end
    end

`else   //INTERNAL_ADAPT

reg [31:0] deviationCorrection;
reg [31:0] devCorrection;
reg prevLegacyBit;
always @(posedge clk) begin
    if (sym2xEn) begin
        prevLegacyBit <= legacyBit;
        if (legacyBit & prevLegacyBit) begin
            devCorrection <= posDevCorrection;
            end
        else if (!legacyBit & !prevLegacyBit) begin
            `ifdef SYM_DEVIATION
            devCorrection <= -posDevCorrection;
            `else
            devCorrection <= negDevCorrection;
            `endif
            end
        else begin
            devCorrection <= 0;
            end
        deviationCorrection <= devCorrection;
        end
    end

`endif //INTERNAL_ADAPT

wire [31:0] ddsFreq = newOffset + deviationCorrection;

wire ddsReset = reset;

`else

// s-curve testing
reg resetWithPhaseOffset=0;
reg [31:0] newOffset;
reg set;
always @(posedge clk) begin
   if (reset) begin
      resetWithPhaseOffset <= 1;
      newOffset <= 32'h00000000;
      set <= 0;
   end
   else begin
      resetWithPhaseOffset <= 0; // release the reset
          //newOffset <= 32'h60000000; //do a one time write of 4000_0000 to rotate pi/2  (i.e. set the initial phase)
      newOffset <= 32'h00000000; //do a one time write of 4000_0000 to rotate pi/2  (i.e. set the initial phase)
          set <= 1;
      if (set) begin
         //newOffset <= 32'h01000000; // this value will change the constate freq out of the dds
                 newOffset <= 32'h00000000; // this value will change the constate freq out of the dds
      end
   end
end

wire ddsReset = resetWithPhaseOffset;
`endif

`ifdef USE_LEGACY
// Delay the input samples to line up with the legacy demod's detected bit
reg     [17:0]  iIns[32:0];
reg     [17:0]  qIns[32:0];
always @(posedge clk) begin
    if (sym2xEn) begin
        iIns[ 0] <= iIn;
        iIns[ 1] <= iIns[ 0];
        iIns[ 2] <= iIns[ 1];
        iIns[ 3] <= iIns[ 2];
        iIns[ 4] <= iIns[ 3];
        iIns[ 5] <= iIns[ 4];
        iIns[ 6] <= iIns[ 5];
        iIns[ 7] <= iIns[ 6];
        iIns[ 8] <= iIns[ 7];
        iIns[ 9] <= iIns[ 8];
        iIns[10] <= iIns[ 9];
        iIns[11] <= iIns[10];
        iIns[12] <= iIns[11];
        iIns[13] <= iIns[12];
        iIns[14] <= iIns[13];
        iIns[15] <= iIns[14];
        iIns[16] <= iIns[15];
        iIns[17] <= iIns[16];
        iIns[18] <= iIns[17];
        iIns[19] <= iIns[18];
        iIns[20] <= iIns[19];
        iIns[21] <= iIns[20];
        iIns[22] <= iIns[21];
        iIns[23] <= iIns[22];
        iIns[24] <= iIns[23];
        iIns[25] <= iIns[24];
        iIns[26] <= iIns[25];
        iIns[27] <= iIns[26];
        iIns[28] <= iIns[27];
        iIns[29] <= iIns[28];
        iIns[30] <= iIns[29];
        iIns[31] <= iIns[30];
        iIns[32] <= iIns[31];
        qIns[ 0] <= qIn;
        qIns[ 1] <= qIns[ 0];
        qIns[ 2] <= qIns[ 1];
        qIns[ 3] <= qIns[ 2];
        qIns[ 4] <= qIns[ 3];
        qIns[ 5] <= qIns[ 4];
        qIns[ 6] <= qIns[ 5];
        qIns[ 7] <= qIns[ 6];
        qIns[ 8] <= qIns[ 7];
        qIns[ 9] <= qIns[ 8];
        qIns[10] <= qIns[ 9];
        qIns[11] <= qIns[10];
        qIns[12] <= qIns[11];
        qIns[13] <= qIns[12];
        qIns[14] <= qIns[13];
        qIns[15] <= qIns[14];
        qIns[16] <= qIns[15];
        qIns[17] <= qIns[16];
        qIns[18] <= qIns[17];
        qIns[19] <= qIns[18];
        qIns[20] <= qIns[19];
        qIns[21] <= qIns[20];
        qIns[22] <= qIns[21];
        qIns[23] <= qIns[22];
        qIns[24] <= qIns[23];
        qIns[25] <= qIns[24];
        qIns[26] <= qIns[25];
        qIns[27] <= qIns[26];
        qIns[28] <= qIns[27];
        qIns[29] <= qIns[28];
        qIns[30] <= qIns[29];
        qIns[31] <= qIns[30];
        qIns[32] <= qIns[31];
        end
    end
//wire    [17:0]  iInput = iIns[31];
//wire    [17:0]  qInput = qIns[31];
`ifdef USE_SR
    reg     [17:0] iInput,qInput;
    always @* begin
        case (srIndex)
            0: iInput = iIns[20];
            1: iInput = iIns[21];
            2: iInput = iIns[22];
            3: iInput = iIns[23];
            4: iInput = iIns[24];
            5: iInput = iIns[25];
            6: iInput = iIns[26];
            7: iInput = iIns[27];
        endcase
        case (srIndex)
            0: qInput = qIns[20];
            1: qInput = qIns[21];
            2: qInput = qIns[22];
            3: qInput = qIns[23];
            4: qInput = qIns[24];
            5: qInput = qIns[25];
            6: qInput = qIns[26];
            7: qInput = qIns[27];
        endcase
    end
`else
    wire    [17:0]  iInput = iIns[27];
    wire    [17:0]  qInput = qIns[27];
    //wire    [17:0]  iInput = iIns[28];
    //wire    [17:0]  qInput = qIns[28];
`endif

`else
wire    [17:0]  iInput = iIn;
wire    [17:0]  qInput = qIn;
`endif

`ifdef USE_VIVADO_CORES
wire    [47:0]  m_axis;
wire    [17:0]  bImag = m_axis[41:24];
wire    [17:0]  bReal = m_axis[17:0];
dds6p0 dds(
  .aclk(clk),
  .aclken(sym2xEn),
  .aresetn(!ddsReset),
  .m_axis_data_tdata(m_axis),
  .m_axis_data_tvalid(),
  .s_axis_phase_tdata(ddsFreq),
  .s_axis_phase_tvalid(1'b1)
);
`else //USE_VIVADO_CORES
wire [17:0]bReal,bImag;
dds dds(
  .clk(clk),
  .sclr(ddsReset),
  .ce(sym2xEn),
  .we(1'b1),
  .data(ddsFreq), // Bus [31 : 0]
  .cosine(bReal), // Bus [17 : 0]
  .sine(bImag)); // Bus [17 : 0]
`endif //USE_VIVADO_CORES

`ifdef SIMULATE
wire    [11:0]  signalFreq;
fmDemodWithCE signalDemod(
    .clk(clk), .reset(reset), .sync(sym2xEn),
    .iFm(iInput),.qFm(qInput),
    .demodMode(`MODE_2FSK),
    .freq(signalFreq)
    );
assign dac0Output = signalFreq;

wire    [11:0]  corrFreq;
fmDemodWithCE corrDemod(
    .clk(clk), .reset(reset), .sync(sym2xEn),
    .iFm(bReal),.qFm(bImag),
    .demodMode(`MODE_2FSK),
    .freq(corrFreq)
    );
assign dac1Output = corrFreq;
real            signalFreqReal;
always @* signalFreqReal = $itor($signed(signalFreq))/(2**11);
real            corrFreqReal;
always @* corrFreqReal = $itor($signed(corrFreq))/(2**11);
`endif

wire    [17:0]  iMpy,qMpy;
cmpy18Sat cmpy18Sat(
    .clk(clk),
    .reset(reset),
    .aReal(iInput),
    .aImag(qInput),
    .bReal(bReal),
    .bImag(bImag),
    .pReal(iMpy),
    .pImag(qMpy)
);

reg [7:0] symEnSr;
reg [7:0] sym2xEnSr;
`ifdef USE_LEGACY
reg [17:0]  iMpy0,qMpy0;
reg [17:0]  iMpy1,qMpy1;
`endif
always @(posedge clk) begin
    `ifdef SIMULATE
        begin
    `else
    if (reset) begin
        symEnSr <= 0;
        sym2xEnSr <= 0;
        end
    else begin
    `endif
        symEnSr <= {symEnSr[6:0], symEn};
        sym2xEnSr <= {sym2xEnSr[6:0], sym2xEn};
        end
    `ifdef USE_LEGACY
    if (sym2xEnDly) begin
        iMpy0 <= iMpy;
        qMpy0 <= qMpy;
        iMpy1 <= iMpy0;
        qMpy1 <= qMpy0;
        end
    `endif
    end
`ifdef USE_LEGACY
//assign iOut = iMpy1;
//assign qOut = qMpy1;
assign iOut = iMpy0;
assign qOut = qMpy0;
//assign iOut = iMpy;
//assign qOut = qMpy;
`else
assign iOut = iMpy;
assign qOut = qMpy;
`endif

assign symEnDly = symEnSr[3];
assign sym2xEnDly = sym2xEnSr[3];
//assign symEnDly = symEnSr[4];
//assign sym2xEnDly = sym2xEnSr[4];


`ifdef USE_MPY_FM_DISC

wire    [35:0]  term1,term2;
mpy18x18WithCe mult1(
    .clk(clk),
    .ce(sym2xEnDly),
    .a(qMpy1),
    .b(iMpy0),
    .p(term1)
    );
mpy18x18WithCe mult2(
    .clk(clk),
    .ce(sym2xEnDly),
    .a(iMpy1),
    .b(qMpy0),
    .p(term2)
    );

wire    [35:0]  diff = term2 - term1;
//wire    [11:0]  freq = diff[34:23];
reg     [11:0]  freq;
always @(posedge clk) begin
    if (sym2xEnDly) begin
        freq <= diff[34:23] + diff[22];
        end
    end
assign dac0Output = freq;

`else   //USE_MPY_FM_DISC

wire    [11:0]   phase;
vm_cordic cordic(
    .clk(clk),
    .ena(sym2xEnDly),
    .x(iOut[17:4]),.y(qOut[17:4]),
    .m(),
    .p(phase)
    );
reg     [11:0]  freq;
reg     [11:0]  prevPhase;
wire    [11:0]  phaseDiff = phase - prevPhase;
reg             polarityFlag;
`ifdef SIMULATE
initial polarityFlag = 1;
`endif
always @(posedge clk) begin
    if (sym2xEnDly) begin
        if (phaseDiff == 12'h800) begin
            polarityFlag <= ~polarityFlag;
            if (polarityFlag) begin
                freq <= 12'h801;
                end
            else begin
                freq <= 12'h7ff;
                end
            end
        else begin
            freq <= phaseDiff;
            end
        prevPhase <= phase;
        end
    end
//assign dac0Output = freq;
assign dac0Output = deviationCorrection[31:20];
`endif //USE_MPY_FM_DISC

`define USE_MIDSAMPLES
`ifdef USE_MIDSAMPLES
// Extract an AFC control signal
reg     [11:0]  prevMidSample;
reg     [11:0]  afcError;
reg             prevSign;
reg             transition;
always @(posedge clk) begin
    if (sym2xEnDly) begin
        `ifdef USE_MPY_FM_DISC
        if (!symEnDly) begin
        `else
        if (symEnDly) begin
        `endif
            if (prevSign != freq[11]) begin
                transition <= 1;
                end
            else begin
                transition <= 0;
                end
            prevSign <= freq[11];
            end
        else begin
            if (transition) begin
                afcError <= prevMidSample;
                end
            else begin
                afcError <= 0;
                end
            `ifdef USE_MPY_FM_DISC
            prevMidSample <= -freq;
            `else
            prevMidSample <= -freq;
            `endif
            end
        end
    end
`else
wire    [11:0]  afcError = -freq;
`endif
assign dac1Output = afcError;

// AFC Loop Filter
lagGain12 afcLoopFilter (
    .clk(clk),
    .clkEn(symEnDly),
    .reset(reset),
    .error(afcError),
    .lagExp(afcGain),
    .upperLimit(32'h0d000000),
    .lowerLimit(32'hf3000000),
    .sweepEnable(1'b0),
    .sweepRateMag(32'h0),
    .carrierInSync(1'b1),
    .clearAccum(clearAFC),
    .acqTrackControl(2'h0),
    .track(1'b1),
    .lagAccum(afcAccum)
    );
assign afcOffset = afcAccum[39:8] + afcAccum[7];
//assign afcOffset = afcAccum[39:8];

`ifdef SIMULATE
real iOutReal;
always @(iOut) iOutReal = (iOut[17] ? iOut - 272144.0 : iOut)/131072.0;
real iInReal;
always @(iInput) iInReal = (iInput[17] ? iInput - 272144.0 : iInput)/131072.0;
real qInReal;
always @(qInput) qInReal = (qInput[17] ? qInput - 272144.0 : qInput)/131072.0;

real freqReal;
always @(freq) freqReal = (freq[11] ? freq - 4096.0 : freq)/2048.0;

`endif

endmodule
