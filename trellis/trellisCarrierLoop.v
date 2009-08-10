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
`define USE_LEGACY
           
module trellisCarrierLoop(clk,reset,symEn,sym2xEn,
  iIn,qIn,
  legacyBit,
  phaseError,
  symEn_phErr,
  wr0,wr1,wr2,wr3,
  addr,
  din,dout,
  iOut,qOut,
  symEnDly,
  sym2xEnDly,
  freq,
  lockCounter
  );

input clk,reset,symEn,sym2xEn;
input [17:0]iIn,qIn;
input legacyBit;
input   [7:0]   phaseError;
input symEn_phErr;
input wr0,wr1,wr2,wr3;
input [11:0]addr;
input [31:0]din;
output [31:0]dout;
output [17:0]iOut,qOut;
output symEnDly;
output sym2xEnDly;
output  [11:0]freq;
output  [15:0]  lockCounter;

wire[31:0]carrierFreqOffset;

/***************************** Control Registers ******************************/

reg trellisSpace;
always @(addr) begin
    casex(addr)
        `TRELLISLFSPACE:    trellisSpace <= 1;
        default:            trellisSpace <= 0;
        endcase
    end
wire    [31:0]  dout;
wire    [4:0]   leadExp;
wire    [4:0]   lagExp;
wire    [31:0]  limit;
wire    [31:0]  loopData;
wire    [15:0]  lockCount;
wire    [11:0]   syncThreshold;
wire    [39:0]  lagAccum;
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
    .lockCount(lockCount),
    .syncThreshold(syncThreshold),
    .loopData(loopData)
    );


wire loopFilterEn = symEn_phErr;

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
reg [31:0] newOffset;
always @(posedge clk) begin
    if (reset) begin
        newOffset <= 0;
        end
    else if (carrierFreqEn) begin
        newOffset <= carrierFreqOffset;
        end
    end
reg [31:0] deviationCorrection;
reg [31:0] devCorrection;
reg prevLegacyBit;
always @(posedge clk) begin
    if (sym2xEn) begin
        prevLegacyBit <= legacyBit;
        if (legacyBit & prevLegacyBit) begin
            devCorrection <= loopData;
            end
        else if (!legacyBit & !prevLegacyBit) begin
            devCorrection <= -loopData;
            end
        else begin
            devCorrection <= 0;
            end
        deviationCorrection <= devCorrection;
        end
    end
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
wire    [17:0]  iInput = iIns[28];
wire    [17:0]  qInput = qIns[28];
//wire    [17:0]  iInput = iIns[23];
//wire    [17:0]  qInput = qIns[23];
`else
wire    [17:0]  iInput = iIn;
wire    [17:0]  qInput = qIn;
`endif

wire [17:0]bReal,bImag;
wire    [17:0]  iMpy,qMpy;
dds dds(
  .clk(clk),
  .sclr(ddsReset),
  .ce(sym2xEn),
  .we(1'b1),
  .data(ddsFreq), // Bus [31 : 0]
  .cosine(bReal), // Bus [17 : 0] 
  .sine(bImag)); // Bus [17 : 0] 

cmpy18Sat cmpy18Sat(clk,reset,iInput,qInput,bReal,bImag,iMpy,qMpy);

reg [4:0] symEnSr;
reg [4:0] sym2xEnSr;
`ifdef USE_LEGACY
reg [17:0]  iOut,qOut;
`endif
always @(posedge clk) begin
    if (reset) begin
        symEnSr <= 0;
        sym2xEnSr <= 0;
        end
    else begin
        symEnSr <= {symEnSr[2:0], symEn};
        sym2xEnSr <= {sym2xEnSr[2:0], sym2xEn};
        end
    `ifdef USE_LEGACY
    if (sym2xEnDly) begin
        iOut <= iMpy;
        qOut <= qMpy;
        end
    `endif
    end
`ifdef USE_LEGACY
`else
assign iOut = iMpy;
assign qOut = qMpy;
`endif

assign symEnDly = symEnSr[3];
assign sym2xEnDly = sym2xEnSr[3];

wire    [11:0]   freq;
fmDemod fmDemod( 
    .clk(clk), .reset(reset), .sync(sym2xEnDly),
    .iFm(iOut),.qFm(qOut),
    .demodMode(`MODE_2FSK),
    .freq(freq)
    );

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
