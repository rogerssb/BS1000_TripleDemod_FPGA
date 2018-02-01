`include "./addressMap.v"
`timescale 1ns/100ps

`define ENABLE_AGC
//`define ADD_NOISE
//`define BER_TEST
//`define MATLAB_VECTORS

`ifdef BER_TEST
!control .savsim=1
!mkeep (test
!mexclude (test(rxRadio
!mexclude (test(txRadio
`endif

module test;

reg reset,clk,we0,we1,we2,we3,rd;
reg sync;
reg [12:0]a;
reg [31:0]d;
wire [31:0]dout;

// Create the clocks
parameter SAMPLE_FREQ = 93.333333e6;
//parameter SAMPLE_FREQ = 10e6;
parameter HC = 1e9/SAMPLE_FREQ/2;
parameter C = 2*HC;
reg clken;
always #HC clk = clk^clken;
`define SAMPLE_PERIOD   (C*1e-9)
`define TWO_POW_32      4294967296.0
`define TWO_POW_31      2147483648.0
`define TWO_POW_17      131072.0

parameter modSampleDecimation = 2;
parameter modCicShift = 2;          // log2(modSampleDecimation^2)
parameter ddcDecimation = 2;

real carrierFreqHz;
real carrierFreqNorm;
initial begin
  carrierFreqHz = 0.0;
  carrierFreqNorm = carrierFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
end
integer carrierFreqInt;
initial begin
  carrierFreqInt = carrierFreqNorm;
end
wire [31:0] carrierFreq = carrierFreqInt;

real carrierOffsetFreqHz;
real carrierOffsetFreqNorm;
integer carrierOffsetFreqInt;
initial begin
  carrierOffsetFreqHz = 0.0;
  carrierOffsetFreqNorm = carrierOffsetFreqHz * `SAMPLE_PERIOD * `TWO_POW_32;
  carrierOffsetFreqInt = carrierOffsetFreqNorm;
end
wire [31:0] carrierOffsetFreq = carrierOffsetFreqInt;

real carrierLimitHz;
real carrierLimitNorm;
integer carrierLimitInt;
initial begin
  carrierLimitHz = 60000.0;
  carrierLimitNorm = carrierLimitHz * `SAMPLE_PERIOD * `TWO_POW_32;
  carrierLimitInt = carrierLimitNorm;
end
wire [31:0] carrierLimit = carrierLimitInt;

wire [31:0] sweepRate = 32'h00000000;

real bitrateBps;
initial bitrateBps = SAMPLE_FREQ/modSampleDecimation/2.0;
real bitrateSamples;
initial bitrateSamples = 1/bitrateBps/`SAMPLE_PERIOD/2.0;
integer bitrateSamplesInt;
initial bitrateSamplesInt = bitrateSamples;
wire [15:0]bitrateDivider = bitrateSamplesInt - 1;

// value = 2^ceiling(log2(R*R))/(R*R), where R = interpolation rate of the FM
// modulator
real interpolationGain;
initial interpolationGain = 1.28;

real deviationHz;
real deviationNorm;
integer deviationInt;
initial begin
  deviationHz = 2*0.350 * bitrateBps;
  deviationNorm = deviationHz * `SAMPLE_PERIOD * `TWO_POW_32;
  deviationInt = deviationNorm*interpolationGain;
end
wire [31:0]deviationQ31 = deviationInt;
wire [17:0]deviation = deviationQ31[31:14];

real cicDecimation;
initial cicDecimation = (ddcDecimation == 1) ? 1 :
                        (ddcDecimation == 2) ? 1 :
                        (ddcDecimation == 3) ? 3 :
                                               ddcDecimation/2;
integer cicDecimationInt;
initial cicDecimationInt = cicDecimation;

real resamplerFreqSps;
initial resamplerFreqSps = 2*bitrateBps;     // 2 samples per symbol
real resamplerFreqNorm;
initial resamplerFreqNorm = (ddcDecimation == 1) ? resamplerFreqSps/(SAMPLE_FREQ) * `TWO_POW_32 :
                            (ddcDecimation == 2) ? resamplerFreqSps/(SAMPLE_FREQ/2.0) * `TWO_POW_32 :
                            (ddcDecimation == 3) ? resamplerFreqSps/(SAMPLE_FREQ/3.0) * `TWO_POW_32 :
                                                   resamplerFreqSps/(SAMPLE_FREQ/cicDecimationInt/2.0) * `TWO_POW_32;
integer resamplerFreqInt;
initial resamplerFreqInt = (resamplerFreqNorm >= `TWO_POW_31) ? (resamplerFreqNorm - `TWO_POW_32) : resamplerFreqNorm;

real resamplerLimitNorm;
initial resamplerLimitNorm = 0.001*resamplerFreqSps/SAMPLE_FREQ * `TWO_POW_32;
integer resamplerLimitInt;
initial resamplerLimitInt = resamplerLimitNorm;

/******************************************************************************
                            Create a bit stream
******************************************************************************/

// Alternating ones and zeros
reg     [3:0]altSR;
wire    modClk;
reg     altData;
always @(negedge modClk or posedge reset) begin
    if (reset) begin
        altData <= 0;
        end
    else begin
        altData <= ~altData;
        end
    end

// Random data
parameter PN17 = 16'h008e,
          MASK17 = 16'h00ff;
reg [15:0]sr;
reg [4:0]zeroCount;
reg  randData;
always @(negedge modClk or posedge reset) begin
    if (reset) begin
        zeroCount <= 5'b0;
        sr <= MASK17;
        end
    else if (sr[0] | (zeroCount == 5'b11111))
        begin
        zeroCount <= 5'h0;
        sr <= {1'b0, sr[15:1]} ^ PN17;
        end
    else
        begin
        zeroCount <= zeroCount + 5'h1;
        sr <= sr >> 1;
        end
    randData <= sr[0];
    end

wire modData = randData;
/******************************************************************************
                            Instantiate a Modulator
******************************************************************************/
wire    [31:0]fmModFreq;
reg     fmModCS;
reg     enableTx;
initial enableTx = 0;
fmMod fmMod(
    .clk(clk), .reset(reset),
    .cs(fmModCS),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a[11:0]),
    .din(d),
    .dout(dout),
    .fskMode(2'b00),
    .txSelect(1'b1),
    .modData(modData),
    .modClkOut(modClk),
    .modDataValid(enableTx),
    .fmModFreq(fmModFreq)
    );
`define USE_BASEBAND
`ifdef USE_BASEBAND

`ifdef USE_VIVADO_CORES
wire    [47:0]  m_axis;
wire    [17:0]  iTx = m_axis[17:0];
wire    [17:0]  qTx = m_axis[41:24];
dds6p0 iqDds(
  .aclk(clk),
  .aclken(1'b1),
  .aresetn(!reset),
  .m_axis_data_tdata(m_axis),
  .m_axis_data_tvalid(),
  .s_axis_phase_tdata(fmModFreq),
  .s_axis_phase_tvalid(1'b1)
);
`else
wire    [17:0]iTx,qTx;
dds iqDds (
    .sclr(reset),
    .clk(clk),
    .ce(1'b1),
    .we(1'b1),
    .data(fmModFreq),
    .sine(qTx),
    .cosine(iTx)
    );
//assign qTx = 18'h0;
`endif //USE_VIVADO_CORES

`else //USE_BASEBAND

wire    [17:0]  iBB,qBB;
dds iqDds (
    .sclr(reset),
    .clk(clk),
    .ce(1'b1),
    .we(1'b1),
    .data(fmModFreq),
    .sine(qBB),
    .cosine(iBB)
    );
wire    [17:0]  iLO,qLO;
dds carrierDds (
    .sclr(reset),
    .clk(clk),
    .ce(1'b1),
    .we(1'b1),
    .data(carrierFreq),
    .sine(qLO),
    .cosine(iLO)
    );
wire [35:0]productI;
mpy18x18 mpyI(.clk(clk),
                .sclr(reset),
                .a(iBB),
                .b(iLO),
                .p(productI)
                );
wire [35:0]productQ;
mpy18x18 mpyQ(.clk(clk),
                .sclr(reset),
                .a(qBB),
                .b(qLO),
                .p(productQ)
                );
wire [35:0]carrierSum = productI + productQ;
reg [17:0]iTx;
wire [17:0]qTx = 18'h0;
always @(posedge clk) begin
    iTx <= carrierSum[35:18];
    end
`endif



/******************************************************************************
                            Channel Model
******************************************************************************/

real iTxReal;
always @* iTxReal = (iTx[17] ? (iTx - 262144.0) : iTx)/131072.0;
real qTxReal;
always @* qTxReal = (qTx[17] ? (qTx - 262144.0) : qTx)/131072.0;
real txScaleFactor;

wire [17:0]iSignal = 131072.0*iTxReal * txScaleFactor;
wire [17:0]qSignal = 131072.0*qTxReal * txScaleFactor;

reg  measureSNR;
initial measureSNR = 0;
wire    [17:0]iRx,qRx;
real iSignalReal;
always @* iSignalReal = (iSignal[17] ? (iSignal - 262144.0) : iSignal)/131072.0;
real qSignalReal;
always @* qSignalReal = (qSignal[17] ? (qSignal - 262144.0) : qSignal)/131072.0;
real signalMagSquared;
real noiseMagSquared;
integer txSampleCount;
reg [17:0]iNoise,qNoise;
real iNoiseReal;
always @* iNoiseReal = (iNoise[17] ? (iNoise - 262144.0) : iNoise)/131072.0;
real qNoiseReal;
always @* qNoiseReal = (qNoise[17] ? (qNoise - 262144.0) : qNoise)/131072.0;
always @(negedge clk) begin
    `ifdef ADD_NOISE
    iNoise <= $gaussPLI();
    qNoise <= $gaussPLI();
    `else
    iNoise <= 0;
    qNoise <= 0;
    `endif
    if (measureSNR) begin
        signalMagSquared <= signalMagSquared + (iSignalReal*iSignalReal + qSignalReal*qSignalReal);
        noiseMagSquared <= noiseMagSquared + (iNoiseReal*iNoiseReal + qNoiseReal*qNoiseReal);
        txSampleCount <= txSampleCount + 1;
        end
    else begin
        signalMagSquared <= 0.0;
        noiseMagSquared <= 0.0;
        txSampleCount <= 0;
        end
    end

real iChReal;
always @* iChReal = (iRx[17] ? (iRx - 262144.0) : iRx)/131072.0;
real qChReal;
always @* qChReal = (qRx[17] ? (qRx - 262144.0) : qRx)/131072.0;
assign iRx = iSignal + iNoise;
assign qRx = qSignal + qNoise;


/******************************************************************************
                      Create the clock enables
******************************************************************************/
reg             symEn, sym2xEn;
reg             symEnToggle;
integer         sym2xEnCount;
integer         sym2xEnNewCount;
always @(posedge clk) begin
    if (reset) begin
        sym2xEnNewCount <= 1;
        sym2xEnCount <= 1;
        symEnToggle <= 0;
        end
    else begin
        if (sym2xEnCount == 0) begin
            sym2xEnCount <= sym2xEnNewCount;
            if (sym2xEnNewCount == 1) begin
                sym2xEnNewCount <= 1;
                end
            else begin
                sym2xEnNewCount <= sym2xEnNewCount + 1;
                end
            sym2xEn <= 1;
            symEnToggle <= ~symEnToggle;
            if (symEnToggle == 0) begin
                symEn <= 1;
                end
            end
        else begin
            sym2xEnCount <= sym2xEnCount - 1;
            sym2xEn <= 0;
            symEn <= 0;
            end
        end
    end

/******************************************************************************
                      Instantiate the Trellis Carrier Loop
******************************************************************************/
trellisCarrierLoop tcl(
    .clk(clk),
    .reset(reset),
    .symEn(symEn),
    .sym2xEn(sym2xEn),
    .iIn(iRx),.qIn(qRx),
    .legacyBit(1'b0),
    .phaseErrorIn(),
    .symEn_phErr(),
    .wr0(we0),.wr1(we1),.wr2(we2),.wr3(we3),
    .addr(a),
    .din(d),
    .dout(),
    .iOut(),.qOut(),
    .symEnDly(),
    .sym2xEnDly(),
    .lockCounter()
    );

`ifdef MATLAB_VECTORS
/******************************************************************************
                          Vector data for Matlab Analysis
******************************************************************************/
integer outfile;
integer vectorCount;
initial begin
    outfile = $fopen("fskVectors.dat");
    vectorCount = 0;
    end
always @(negedge clk) begin
    if (testBits) begin
        $fwrite(outfile,"%f %f\n",iTxReal,qTxReal);
        vectorCount <= vectorCount + 1;
        if (vectorCount == 10239) begin
            $fclose(outfile);
            $stop;
            end
        end
    end
`endif

/******************************************************************************
                                uP Read/Write Functions
******************************************************************************/

function [12:0] createAddress;
    input [12:0] addrA;
    input [12:0] addrB;

    integer i;
    reg [12:0]finalAddress;

    begin
    for (i = 0; i < 13; i = i+1) begin
        if (addrA[i] === 1'bx) begin
            finalAddress[i] = addrB[i];
            end
        else if (addrB[i] === 1'bx) begin
            finalAddress[i] = addrA[i];
            end
        else begin
            finalAddress[i] = addrA[i] | addrB[i];
            end
        end
    createAddress = finalAddress;
    end
endfunction


task write16;
  input [12:0]addr;
  input [15:0]data;
  begin

    a = addr;
    rd = 0;
    if (addr[1]) begin
        d[31:16] = data;
        #100 we2 = 1; we3 = 1;
        #100 we2 = 0; we3 = 0;
        end
    else begin
        d[15:0] = data;
        #100 we0 = 1; we1 = 1;
        #100 we0 = 0; we1 = 0;
        end
    #100
    d = 32'hz;
    #200;
  end
endtask

task write32;
  input [12:0]addr;
  input [31:0]data;
  begin
    a = addr;
    d = data;
    rd = 0;
    #100 we0 = 1; we1 = 1; we2 = 1; we3 = 1;
    #100 we0 = 0; we1 = 0; we2 = 0; we3 = 0;
    #100
    d = 32'hz;
    #200;
  end
endtask

task read32;
  input [12:0]addr;
  begin
    a = addr;
    rd = 0;
    #100 rd = 1;
    #100 rd = 0;
    #200;
  end
endtask

initial begin

    reset = 0;
    clk = 0;
    rd = 0;
    we0 = 0; we1 = 0; we2 = 0; we3 = 0;
    d = 32'hz;
    fmModCS = 0;
    txScaleFactor = 0.707;


    // Turn on the clock
    clken=1;
    #(10*C) ;

    // Init the fm modulator
    // Init the modulator register set
    fmModCS = 1;
    write32(`FM_MOD_FREQ, carrierFreq + carrierOffsetFreq);
    write32(`FM_MOD_DEV, {14'bx,deviation});
    write32(`FM_MOD_BITRATE, {1'b0,15'bx,bitrateDivider});
    // This value is ceiling(log2(R*R)), where R = interpolation rate.
    write32(`FM_MOD_CIC,modCicShift);
    fmModCS = 0;


    write32(createAddress(`TRELLISLFSPACE,`LF_CONTROL), 32'h19);
    write32(createAddress(`TRELLISLFSPACE,`LF_LOOPDATA0), 32'h0);
    write32(createAddress(`TRELLISLFSPACE,`LF_LOOPDATA1), 32'h0);

    reset = 1;
    #(2*C) ;
    reset = 0;
    // Wait 9.5 bit periods
    #(19*bitrateSamplesInt*C) ;

    reset = 1;
    #(2*C) ;
    reset = 0;

    enableTx = 1;

    // Wait for some data to pass thru
    #(2*100*bitrateSamplesInt*C) ;
    `ifdef MATLAB_VECTORS
    $fclose(outfile);
    `endif
    $stop;

    end

endmodule

