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

//`define BYPASS_LOOP
//`define USE_FRACTIONAL_DELAY
//`define USE_AVERAGE_ERROR

module multihCarrierLoop(
    clk,reset,
    symEnEven,symEn,sym2xEn,
    iIn,qIn,
    multihLOS,
    phaseError,
    phaseErrorEn,
    phaseErrorValid,
    `ifdef USE_BUS_CLOCK
    busClk,
    `endif
    cs,
    wr0,wr1,wr2,wr3,
    addr,
    din,dout,
    dac0Select,dac1Select,dac2Select,
    dac0ClkEn,
    dac0Data,
    dac0En,
    dac1ClkEn,
    dac1Data,
    dac1En,
    dac2ClkEn,
    dac2Data,
    dac2En,
    demodLock,
    iOut,qOut,
    symEnEvenOut,
    symEnOut,
    sym2xEnOut
    );

input           clk,reset;
input           symEnEven,symEn,sym2xEn;
input   [17:0]  iIn,qIn;
input           multihLOS;
input   [7:0]   phaseError;
input           phaseErrorEn;
input           phaseErrorValid;
`ifdef USE_BUS_CLOCK
input           busClk;
`endif
input cs;
input wr0,wr1,wr2,wr3;
input [12:0]addr;
input [31:0]din;
output [31:0]dout;
input   [3:0]   dac0Select,dac1Select,dac2Select;
output          dac0ClkEn;
output  [17:0]  dac0Data;
output          dac0En;
output          dac1ClkEn;
output  [17:0]  dac1Data;
output          dac1En;
output          dac2ClkEn;
output  [17:0]  dac2Data;
output          dac2En;
output          demodLock;
output  [17:0]  iOut,qOut;
output          symEnEvenOut;
output          symEnOut;
output          sym2xEnOut;

wire    [31:0]  carrierFreqOffset;

/***************************** Control Registers ******************************/

reg trellisSpace;
always @* begin
    casex(addr)
        `MULTIHLFSPACE:     trellisSpace = cs;
        default:            trellisSpace = 0;
        endcase
    end
wire    [31:0]  dout;
wire    [4:0]   leadExp;
wire    [4:0]   lagExp;
wire    [31:0]  limit;
wire    [31:0]  loopOffset;
wire    [15:0]  lockCount;
reg             demodLock;
wire    [11:0]   syncThreshold;
wire    [39:0]  lagAccum;
wire    [2:0]   averageSelect;
wire    [1:0]   acqTrackControl;
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
    `ifdef USE_BUS_CLOCK
    .busClk(busClk),
    `endif
    .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
    .lagAccum(lagAccum[39:8]),
    .dataIn(din),
    .dataOut(dout),
    .lockStatus(demodLock),
    .invertError(invertError),
    .zeroError(zeroError),
    .ctrl2(),
    .clearAccum(clearAccum),
    .ctrl4(),
    .acqTrkControl(acqTrackControl),
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
    .syncThreshold(syncThreshold),
    .leadMan1(),
    .leadExp1(),
    .lagMan1(),
    .lagExp1(),
    .loopData1()
    );


`ifdef USE_AVERAGE_ERROR
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
`else
/**************************** Adjust Error ************************************/
wire            loopFilterEn = phaseErrorEn;
reg     [7:0]   loopError;
wire    [7:0]   negPhaseError = ~phaseError + 1;
always @(posedge clk) begin
    if (loopFilterEn) begin
        if (zeroError) begin
            loopError <= 0;
            end
        else if (invertError) begin
            loopError <= negPhaseError;
            end
        else begin
            loopError <= phaseError;
            end
        end
    end
`endif

/***************************** Loop Filter ************************************/

// Instantiate the lead/lag filter gain path

    // NOTE: The acqTrackControl tells how much to divide the loopwidth by. The choices are
    // zero, 1/2, 1/4, and 1/8. This is accomplished by subtracting the acqTrackControl
    // value from the lead exponent.
    wire    [5:0]   leadSum = {1'b0,leadExp} - {4'b0,acqTrackControl};
    reg     [4:0]   leadGainReg;
    always @(posedge clk) begin
        if (demodLock) begin
            // Did the difference overflow?
            if (leadSum[5]) begin
                // Yes. Limit to the minimum.
                leadGainReg <= 1;
            end
            else begin
                leadGainReg <= leadSum[4:0];
            end
        end
        else begin
            leadGainReg <= leadExp;
        end
    end


wire    [39:0]  leadError;
leadGain leadGain (
    .clk(clk), .clkEn(loopFilterEn), .reset(reset),
    .error(loopError),
    .leadExp(leadGainReg),
    .leadError(leadError)
    );

    // NOTE: The acqTrackControl tells how much to divide the loopwidth by. The choices are
    // zero, 1/2, 1/4, and 1/8. In the loop filter calculations, the lag term is
    // proportional to the square of the loopwidth. That's why the acqTrackControl
    // is shifted left one bit in this calculation.
    wire            [5:0]   lagSum = {1'b0,lagExp} - {3'b0,acqTrackControl,1'b0};
    reg             [4:0]   lagGainReg;
    reg     signed  [39:0]  lagError;
    always @(posedge clk) begin
        // If no signal present, freeze the lag accumulator
        if (multihLOS) begin
            lagGainReg <= 0;
        end
        // Set lag gain
        else if (demodLock) begin
            // Did the difference overflow?
            if (lagSum[5]) begin
                // Yes. Limit to the minimum.
                lagGainReg <= 1;
            end
            else begin
                lagGainReg <= lagSum[4:0];
            end
        end
        else begin
            lagGainReg <= lagExp;
        end
    end

lagGain lagGain (
    .clk(clk), .clkEn(loopFilterEn), .reset(reset),
    .error(loopError),
    .lagExp(lagGainReg),
    .limit(limit),
    .sweepEnable(1'b0),
    .sweepRateMag(32'b0),
    .clearAccum(clearAccum),
    .carrierInSync(demodLock),
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
reg             symbolSlip;
reg             symbolSlipped;
reg             errorValid;
reg     [7:0]   absModeError;
reg     [15:0]  lockCounter;
wire    [16:0]  lockPlus = {1'b0,lockCounter} + 17'h00001;
wire    [16:0]  lockMinus = {1'b0,lockCounter} + 17'h1ffff;
always @(posedge clk) begin
    if (reset) begin
        lockCounter <= 0;
        demodLock <= 1;
        end
    else if (symbolSlipped) begin
        symbolSlip <= 0;
        end
    else if (phaseErrorEn) begin
        errorValid <= phaseErrorValid;
        absModeError <= phaseError[7] ? -phaseError : phaseError;
        if (errorValid) begin
            if (absModeError > syncThreshold[7:0]) begin
                if (lockCounter == (16'hffff - lockCount)) begin
                    `ifndef ADD_SUPERBAUD_TED
                    // Declare out of lock condition. If we were previously out of lock,
                    // slip a symbol.
                    if (!demodLock) begin
                        symbolSlip <= 1;
                        end
                    `endif
                    demodLock <= 0;
                    lockCounter <= 0;
                    end
                else begin
                    lockCounter <= lockMinus[15:0];
                    end
                end
            else begin
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
reg     [31:0]  newOffset;
reg     [31:0]  savedOffset;
reg             offsetSaved;
always @(posedge clk) begin
    if (reset) begin
        newOffset <= 0;
        end
    else if (carrierFreqEn & sym2xEn) begin
        newOffset <= carrierFreqOffset;
        offsetSaved <= 0;
        end
    else if (carrierFreqEn & !sym2xEn) begin
        savedOffset <= carrierFreqOffset;
        offsetSaved <= 1;
        end
    else if (!carrierFreqEn & sym2xEn & offsetSaved) begin
        newOffset <= savedOffset;
        offsetSaved <= 0;
        end
    end

wire ddsReset = reset;

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
  .s_axis_phase_tdata(newOffset),
  .s_axis_phase_tvalid(1'b1)
);
`else //USE_VIVADO_CORES
wire [17:0]bReal,bImag;
dds dds(
  .clk(clk),
  .sclr(ddsReset),
  .ce(sym2xEn),
  .we(1'b1),
  .data(newOffset), // Bus [31 : 0]
  .cosine(bReal), // Bus [17 : 0]
  .sine(bImag)); // Bus [17 : 0]
`endif //USE_VIVADO_CORES

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
reg [1:0] symEnEvenSr;
reg [1:0] symEnSr;
reg [1:0] sym2xEnSr;
always @(posedge clk) begin
    if (reset) begin
        symEnEvenSr <= 0;
        symEnSr <= 0;
        sym2xEnSr <= 0;
        end
    else begin
        symEnEvenSr <= {symEnEvenSr[0:0], symEnEven};
        symEnSr <= {symEnSr[0:0], symEn};
        sym2xEnSr <= {sym2xEnSr[0:0], sym2xEn};
        end
    end

// Create a symbol slip state machine
reg     [17:0]  slipI,slipQ;
reg             symEnEvenOut;
reg             symEnOut, sym2xEnOut;
always @(posedge clk) begin
    if (reset) begin
        symbolSlipped <= 0;
        end
    else begin
        // Reclock the inputs
        slipI <= iMpy;
        slipQ <= qMpy;
        sym2xEnOut <= sym2xEnSr[1];

        // Create a gated version of symEn.
        if (symEnSr[1] && symbolSlip) begin
            symEnOut <= 0;
            symbolSlipped <= 1;
            end
        else begin
            symEnOut <= symEnSr[1];
            symbolSlipped <= 0;
            end
        end
        `ifdef ADD_SUPERBAUD_TED
        symEnEvenOut <= symEnEvenSr[1];
        `else
        if (symEnOut) begin
            symEnEvenOut <= ~symEnEvenOut;
        end
        `endif
    end

assign iOut = slipI;
assign qOut = slipQ;


    `ifdef ADD_FM_DISC
    wire    signed  [11:0]   phase;
    vm_cordic cordic(
        .clk(clk),
        .ena(sym2xEnOut),
        .x(iOut[17:4]),.y(qOut[17:4]),
        //.ena(sym2xEn),
        //.x(iIn[17:4]),.y(qIn[17:4]),
        .m(),
        .p(phase)
        );
    reg     signed  [11:0]  freqOut;
    reg     signed  [11:0]  prevPhase;
    wire    signed  [11:0]  phaseDiff = phase - prevPhase;
    always @(posedge clk) begin
        if (sym2xEnOut) begin
        //if (sym2xEn) begin
            if (phaseDiff == 12'h800) begin
                freqOut <= 0;
            end
            else begin
            freqOut <= phaseDiff;
            end
            prevPhase <= phase;
        end
    end

    wire    signed  [17:0]  freq = $signed({freqOut,6'b0});
    `endif //ADD_FM_DISC




`ifdef SIMULATE
real iOutReal;
always @(iOut) iOutReal = (iOut[17] ? iOut - 272144.0 : iOut)/131072.0;
real iInReal;
always @(iIn) iInReal = (iIn[17] ? iIn - 272144.0 : iIn)/131072.0;
`endif

//******************************************************************************
//                               DAC Output Mux
//******************************************************************************

reg             dac0ClkEn;
reg     [17:0]  dac0Data;
reg             dac0En;
reg             dac1ClkEn;
reg     [17:0]  dac1Data;
reg             dac1En;
reg             dac2ClkEn;
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
                dac0ClkEn <= sym2xEn;
                dac0En <= 1;
                end
            `DAC_Q: begin
                dac0Data <= qOut;
                dac0ClkEn <= sym2xEnOut;
                dac0En <= 1;
                end
            `ifdef ADD_FM_DISC
            `DAC_FREQ: begin
                dac0Data <= freq;
                dac0ClkEn <= sym2xEnOut;
                //dac0Data <= freq;
                //dac0ClkEn <= sym2xEn;
                //dac0Data <= {1'b0,sym2xEnOut,16'b0};
                //dac0ClkEn <= 1;
                dac0En <= 1;
                end
            `endif
            `DAC_PHERROR: begin
                dac0Data <= {absModeError,10'b0};
                dac0ClkEn <= 1;
                dac0En <= 1;
                end
            `DAC_FREQERROR: begin
                dac0Data <= lagAccum[39:22];
                dac0ClkEn <= loopFilterEn;
                dac0En <= 1;
                end
            `DAC_FREQLOCK: begin
                dac0Data <= {lockCounter,2'b0};
                dac0ClkEn <= 1;
                dac0En <= 1;
                end
            default: begin
                dac0Data <= {phaseError,10'b0};
                dac0ClkEn <= 1;
                dac0En <= 0;
                end
            endcase

        case (dac1Select)
            `DAC_I: begin
                dac1Data <= iOut;
                dac1ClkEn <= sym2xEnOut;
                dac1En <= 1;
                end
            `DAC_Q: begin
                dac1Data <= qIn;
                dac1ClkEn <= sym2xEn;
                dac1En <= 1;
                end
            `ifdef ADD_FM_DISC
            `DAC_FREQ: begin
                dac1Data <= {1'b0,symEnOut,16'b0};
                //dac1Data <= {1'b0,symEn,16'b0};
                dac1ClkEn <= 1;
                dac1En <= 1;
                end
            `endif
            `DAC_PHERROR: begin
                dac1Data <= {phaseError,10'b0};
                dac1ClkEn <= 1;
                dac1En <= 1;
                end
            `DAC_FREQLOCK: begin
                dac1Data <= {1'b0,symbolSlip,16'b0};
                dac1ClkEn <= 1;
                dac1En <= 1;
                end
            default: begin
                dac1Data <= {phaseError,10'b0};
                dac1ClkEn <= 1;
                dac1En <= 0;
                end
            endcase

        case (dac2Select)
            `DAC_I: begin
                dac2Data <= iIn;
                dac2ClkEn <= sym2xEn;
                dac2En <= 1;
                end
            `DAC_Q: begin
                dac2Data <= qIn;
                dac2ClkEn <= sym2xEn;
                dac2En <= 1;
                end
            `ifdef ADD_FM_DISC
            `DAC_FREQ: begin
                dac2Data <= {1'b0,symEnEvenOut,16'b0};
                //dac2Data <= {1'b0,symEnEven,16'b0};
                dac2ClkEn <= 1;
                dac2En <= 1;
                end
            `endif
            `DAC_PHERROR: begin
                if (loopFilterEn) begin
                   dac2Data <= {loopError,10'b0};
                   end
                dac2ClkEn <= loopFilterEn;
                dac2En <= 1;
                end
            `DAC_FREQLOCK: begin
                dac2Data <= {1'b0,errorValid,16'b0};
                dac2ClkEn <= 1;
                dac2En <= 1;
                end
            default: begin
                dac2Data <= {loopError,10'b0};
                dac2ClkEn <= loopFilterEn;
                dac2En <= 0;
                end
            endcase
        end
    end



endmodule
