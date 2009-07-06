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
           
module trellisCarrierLoop(clk,reset,symEn,sym2xEn,
  iIn,qIn,
  phaseError,
  symEn_phErr,
  wr0,wr1,wr2,wr3,
  addr,
  din,dout,
  iOut,qOut,
  symEnDly,
  sym2xEnDly
  );

input clk,reset,symEn,sym2xEn;
input [17:0]iIn,qIn;
input   [7:0]   phaseError;
input symEn_phErr;
input wr0,wr1,wr2,wr3;
input [11:0]addr;
input [31:0]din;
output [31:0]dout;
output [17:0]iOut,qOut;
output symEnDly;
output sym2xEnDly;

wire[31:0]carrierFreqOffset;

/***************************** Control Registers ******************************/

reg trellisSpace;
always @(addr) begin
    casex(addr)
        `TRELLIS_SPACE: trellisSpace <= 1;
        default:        trellisSpace <= 0;
        endcase
    end
wire    [31:0]  dout;
wire    [4:0]   leadExp;
wire    [4:0]   lagExp;
wire    [31:0]  limit;
wire    [31:0]  loopOffset;
wire    [15:0]  lockCount;
wire    [7:0]   syncThreshold;
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
    .syncThreshold(syncThreshold)
    );


//wire loopFilterEn = symEn;
wire loopFilterEn = symEn_phErr;

/**************************** Adjust Error ************************************/
reg     [7:0]   loopError;
wire    [7:0]   negPhaseError = ~phaseError + 1;
reg             carrierLock;
//wire            breakLoop = (zeroError || (sweepEnable && !carrierLock && highFreqOffset));
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
        if (absPhaseError > syncThreshold) begin
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

cmpy18 cmpy18(clk,reset,iIn,qIn,bReal,bImag,iOut,qOut);

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

assign symEnDly = symEnSr[3];
assign sym2xEnDly = sym2xEnSr[3];

`ifdef SIMULATE
real iOutReal;
always @(iOut) iOutReal = (iOut[17] ? iOut - 272144.0 : iOut)/131072.0;
real iInReal;
always @(iIn) iInReal = (iIn[17] ? iIn - 272144.0 : iIn)/131072.0;
`endif

endmodule
