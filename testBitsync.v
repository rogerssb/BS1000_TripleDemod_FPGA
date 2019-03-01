`include "./addressMap.v"
`timescale 1ns/100ps

`define ENABLE_AGC
//`define ADD_FIFOS
//`define MATLAB_VECTORS
`define ADD_BERT_TEST
`define ADD_PNGEN_TEST

module test;

reg reset,clk,we0,we1,we2,we3,rd;
reg txRegCS;
reg [12:0]a;
reg [31:0]d;
wire [31:0]dout;
`ifdef USE_BUS_CLOCK
reg  bc;
initial bc = 0;
`endif

// Create the clocks
//parameter SAMPLE_FREQ = 9.333333e6;
parameter SAMPLE_FREQ = 100e6;
parameter HC = 1e9/SAMPLE_FREQ/2;
parameter C = 2*HC;
reg clken;
always #HC clk = clk^clken;
`define SAMPLE_PERIOD   (C*1e-9)
`define TWO_POW_32      4294967296.0
`define TWO_POW_31      2147483648.0
`define TWO_POW_17      131072.0

//******************************************************************************
//                        Channel 0 Generated Waveform
//******************************************************************************


/*
The NRZ test waveform is generated by creating a bit pattern by dividing down the clock
by modBitDecimation. This bit pattern is then sampled at twice this rate and input
into an interpolator to create a final sampled waveform at the full SAMPLE_FREQ.
*/
parameter modBitDecimation = 24;
// exponent = ceil(2.0*log10(modBitDecimation/2)/log10(2.0));
parameter modInterpExponent = 8;
// mantissa = 1/sqrt(2)*(2**17);
parameter modInterpMantissa = 32'h00016a0a;
parameter dfDecimation = 8;
real dfDecimationReal;
initial dfDecimationReal = $itor(dfDecimation);

real    bitrateBps;
initial bitrateBps = SAMPLE_FREQ/modBitDecimation;
real    bitrateSamples;
initial bitrateSamples = 1/bitrateBps/`SAMPLE_PERIOD/2.0;
integer bitrateSamplesInt;
initial bitrateSamplesInt = bitrateSamples;

// value = 2^ceiling(log2(R*R))/(R*R), where R = interpolation rate of the FM
// modulator
real interpolationGain = 1.77778;

reg     [31:0]  dfControl;
initial dfControl = (dfDecimation == 1) ? 32'h0000_000f :
                    (dfDecimation == 2) ? 32'h0000_000e :
                    (dfDecimation == 3) ? 32'h0000_000d :
                    (dfDecimation == 4) ? 32'h0000_000a :
                    (dfDecimation == 5) ? 32'h0000_000d :
                    (dfDecimation == 6) ? 32'h0000_000c :
                                                          32'h0000_0008;


real    cicDecimation;
initial cicDecimation = (dfDecimation == 1) ? 1 :
                        (dfDecimation == 2) ? 1 :
                        (dfDecimation == 3) ? 3 :
                        (dfDecimation == 4) ? 1 :
                        (dfDecimation == 5) ? 5 :
                        (dfDecimation == 6) ? 3 :
                                               dfDecimation/4;
integer cicDecimationInt;
initial cicDecimationInt = cicDecimation;
// cicGain = log2(cicDecimation ^ 3);

real    resamplerFreqSps;
initial resamplerFreqSps = 2.0*bitrateBps;     // 2 samples per bit
real    resamplerFreqNorm;
initial resamplerFreqNorm = resamplerFreqSps/(SAMPLE_FREQ/dfDecimationReal)*(2.0**32);
/*
real resamplerFreqNorm = (dfDecimation == 1) ? resamplerFreqSps/(SAMPLE_FREQ) * `TWO_POW_32 :
                         (dfDecimation == 2) ? resamplerFreqSps/(SAMPLE_FREQ/2.0) * `TWO_POW_32 :
                         (dfDecimation == 3) ? resamplerFreqSps/(SAMPLE_FREQ/3.0) * `TWO_POW_32 :
                                                resamplerFreqSps/(SAMPLE_FREQ/dfDecimationInt/2.0) * `TWO_POW_32;
*/
integer resamplerFreqInt;
initial resamplerFreqInt = (resamplerFreqNorm >= `TWO_POW_31) ? (resamplerFreqNorm - `TWO_POW_32) : resamplerFreqNorm;

real    resamplerLimitNorm;
initial resamplerLimitNorm = 0.001*resamplerFreqSps/SAMPLE_FREQ * `TWO_POW_32;
integer resamplerLimitInt;
initial resamplerLimitInt = resamplerLimitNorm;

//************************* Create a bit stream *******************************

// Data clock generator
reg     [31:0]  modClkCount;
wire    [31:0]  modBitDecimationReg = modBitDecimation;
wire    [31:0]  modBitDecimationDiv2 = {1'b0,modBitDecimationReg[31:1]};
reg             modClkEn;
reg             modBitEn;
always @(posedge clk) begin
    if (reset) begin
        modClkCount <= modBitDecimation - 1;
        modClkEn <= 1;
        modBitEn <= 1;
        end
    else begin
        if (modClkCount > 0) begin
            modClkCount <= modClkCount - 1;
            modBitEn <= 0;
            if (modClkCount == modBitDecimationDiv2) begin
                modClkEn <= 1;
                end
            else begin
                modClkEn <= 0;
               end
            end
        else begin
            modClkCount <= modBitDecimation - 1;
            modBitEn <= 1;
            modClkEn <= 1;
            end
        end
    end

// Alternating ones and zeros
reg     [3:0]   altSR;
reg             altData;
always @(posedge clk or posedge reset) begin
    if (reset) begin
        altData <= 0;
        end
    else if (modBitEn) begin
        altData <= ~altData;
        end
    end

// Random data
parameter PN17 = 16'h00b8,
          MASK17 = 16'h0099;
reg [15:0]sr;
reg  randData;
always @(posedge clk or posedge reset) begin
    if (reset) begin
        sr <= MASK17;
        end
    else if (modBitEn) begin
        sr <= {sr[14:0], ^(PN17 & sr)};
        randData <= sr[0];
        end
    end

reg testData;
always @(posedge clk) begin
    if (modBitEn) begin
        testData <= randData;
        end
    end

//************************ Interpolate the Data *******************************

wire    [17:0]  txData;
interpolate #(.RegSpace(`INTERP0SPACE), .FirRegSpace(`VIDFIR0SPACE)) ch0Interpolate(
    .clk(clk), .reset(reset), .clkEn(modClkEn),
    `ifdef USE_BUS_CLOCK
    .busClk(bc),
    `endif
    .cs(txRegCS),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(),
    .dataIn({testData,17'h10000}),
    .dataOut(txData),
    .clkEnOut(txSampleEn)
);

//********************** Create an AGC element ********************************

wire    [17:0]  ch0Gain;
real ch0GainReal;
always @* ch0GainReal = $itor($unsigned(ch0Gain[17:6]));
wire    [17:0]  ch1Gain;
real agcGain;
always @* agcGain = (10.0 ** (50*ch0GainReal/(2**12)/20));


//********************** Create the input to the Bitsync **********************

real txDataReal;
always @* txDataReal = $itor($signed(txData))/(2**17);
real txScaleFactor;
real txChannelReal;
always @* txChannelReal = txDataReal * txScaleFactor;
real rxAgc;
reg     [17:0]  rxInput;
always @* begin
    rxAgc = txChannelReal * agcGain;
    if (rxAgc >= 1.0) begin
        rxInput = 18'h1ffff;
    end
    else if (rxAgc <= -1.0) begin
        rxInput = 18'h20001;
    end
    else begin
        rxInput = rxAgc * (2.0**17);
    end
end

real rxInputReal;
always @* rxInputReal = $itor($signed(rxInput))/(2**17);


/******************************************************************************
                            Instantiate the Bitsync
******************************************************************************/

    wire            [17:0]  dac0Out,dac1Out,dac2Out;
    wire    signed  [17:0]  ch0SymData,ch1SymData;
    wire    signed  [17:0]  ch0Offset;
    wire    signed  [17:0]  ch1Offset;
    wire    signed  [17:0]  iEye,qEye;
    wire            [4:0]   eyeOffset;
    bitsyncTop bitsyncTop(
        .clk(clk), .clkEn(1'b1), .reset(reset),
        `ifdef USE_BUS_CLOCK
        .busClk(bc),
        `endif
        .cs(!txRegCS),
        .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
        .addr(a),
        .din(d),
        .dout(dout),
        .rx0(rxInput),
        .rx1(rxInput),
        .ch0Lock(),
        .ch0Sym2xEn(ch0Sym2xEn),
        .ch0SymEn(ch0SymEn),
        .ch0SymData(ch0SymData),
        .ch0SymClk(pll0_OUT1),
        .ch0Bit(ch0DataOut),
        .ch0Gain(ch0Gain),
        .ch0Offset(ch0Offset),
        .ch1Lock(),
        .ch1Sym2xEn(),
        .ch1SymEn(ch1SymEn),
        .ch1SymClk(),
        .ch1SymData(),
        .ch1Bit(),
        .ch1Gain(ch1Gain),
        .ch1Offset(ch1Offset),
        .ch0Dac0ClkEn(dac0ClkEn),
        .ch0Dac0Data(dac0Out),
        .ch0Dac1ClkEn(dac1ClkEn),
        .ch0Dac1Data(dac1Out),
        .ch0Dac2ClkEn(dac2ClkEn),
        .ch0Dac2Data(dac2Out),
        .eyeClkEn(eyeSync),
        .iEye(iEye),.qEye(qEye),
        .eyeOffset(eyeOffset)
    );


    wire    signed  [17:0]  negCh0SymData = -ch0SymData;
    wire            [12:0]  ch0Mag = ch0SymData[17] ? negCh0SymData[16:4] : ch0SymData[16:4];
    wire    signed  [17:0]  negCh1SymData = -ch1SymData;
    wire            [12:0]  ch1Mag = ch1SymData[17] ? negCh1SymData[16:4] : ch1SymData[16:4];
    wire            [31:0]  mseDout;
    dualMseEstimate mse (
        .clk(clk),
        .reset(reset),
        .busClk(bc),
        .cs(!txRegCS),
        .wr0(we0),.wr1(we1),.wr2(we2),.wr3(we3),
        .addr(a),
        .din(d),
        .dout(),
        .ch0MagClkEn(ch0SymEn),
        .ch0Mag(ch0Mag),
        .ch1MagClkEn(ch1SymEn),
        .ch1Mag(ch1Mag)
    );


wire    [31:0]  dac0Dout;
wire    [17:0]  dac0Data;
reg             interpReset;
interpolate #(.RegSpace(`INTERP0SPACE), .FirRegSpace(`VIDFIR0SPACE)) dac0Interp(
    .clk(clk), .reset(interpReset), .clkEn(dac0ClkEn),
    `ifdef USE_BUS_CLOCK
    .busClk(bc),
    `endif
    .cs(!txRegCS),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dac0Dout),
    .dataIn(dac0Out),
    .dataOut(dac0Data)
);
assign dac0_d = dac0Data[17:4];
assign dac0_clk = clk;

wire    [31:0]  dac1Dout;
wire    [17:0]  dac1Data;
interpolate #(.RegSpace(`INTERP1SPACE), .FirRegSpace(`VIDFIR1SPACE)) dac1Interp(
    .clk(clk), .reset(interpReset), .clkEn(dac1ClkEn),
    `ifdef USE_BUS_CLOCK
    .busClk(bc),
    `endif
    .cs(!txRegCS),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dac1Dout),
    .dataIn(dac1Out),
    .dataOut(dac1Data)
);
assign dac1_d = dac1Data[17:4];
assign dac1_clk = clk;

wire    [31:0]  dac2Dout;
wire    [17:0]  dac2Data;
interpolate #(.RegSpace(`INTERP2SPACE), .FirRegSpace(`VIDFIR2SPACE)) dac2Interp(
    .clk(clk), .reset(interpReset), .clkEn(dac2ClkEn),
    `ifdef USE_BUS_CLOCK
    .busClk(bc),
    `endif
    .cs(!txRegCS),
    .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
    .addr(a),
    .din(d),
    .dout(dac2Dout),
    .dataIn(dac2Out),
    .dataOut(dac2Data)
);
assign dac2_d = dac2Data[17:4];
assign dac2_clk = clk;

    digitalPLL dll0 (
        .clk(clk),
        .reset(reset),
        .centerFreq(32'd178956970),
        .loopGain(32'd7),
        .feedbackDivider(4),
        .referenceClkEn(ch0SymEn),
        .feedbackClkEn(),
        .dllOutputClk(),
        .filteredRefClk(),
        .phaseError()
    );


mcp48xxInterface dacInterface (
    .clk(clk),
    .clkEn0(ch0SymEn),
    .clkEn1(ch1SymEn),
    .reset(reset),
    .dac0GainSelA(1'b1),
    .dac0GainSelB(1'b1),
    .dac0ValueA(ch0Gain[17:6]),
    .dac0ValueB(ch0Offset[17:6]),
    .dac1GainSelA(1'b1),
    .dac1GainSelB(1'b1),
    .dac1ValueA(ch1Gain[17:6]),
    .dac1ValueB(ch1Offset[17:6]),
    .SCK(dacSCLK),
    .SDI(dacMOSI),
    .CS0n(ch0SELn),
    .CS1n(ch1SELn)
);

    `ifdef ADD_FIFOS
    // SPI interface to the PLLs
    wire    [31:0]  pllDout;
    ics307Interface pllIntfc (
        .reset(reset),
        .addr(a),
        .dataIn(d),
        .dataOut(pllDout),
        `ifdef USE_BUS_CLOCK
        .busClk(bc),
        `endif
        .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
        .clk(clk),
        .SCK(pll_SCK),
        .SDI(pll_SDI),
        .CS0(pll0_CS),
        .CS1(pll1_CS),
        .CS2(pll2_CS),
        .EN0(pll0_PWDn),
        .EN1(pll1_PWDn),
        .EN2(pll2_PWDn)
    );

    //`define NEW_FIFO
    `ifdef NEW_FIFO
    reg             pllReset;
    initial         pllReset = 1;

    wire    [2:0]   pll0_Symbol;
    jitterFifo pll0Fifo (
        .reset(pllReset),
        .inputClk(clk),
        .inputClkEn(ch0SymEn),
        .dataIn({ch0DataOut,2'b0}),
        .outputClk(pll0_OUT1),
        .outputClkEn(1'b1),
        .dataOut(pll0_Symbol)
    );

    `else //NEW_FIFO
    //------------- PLL0 Data FIFO --------------------
    reg             pllReset;
    initial         pllReset = 1;
    reg             pll0_ReadEnable;
    wire    [2:0]   pll0_Symbol;
    jitterFifo pll0Fifo(
        .rst(pllReset),
        .wr_clk(clk),
        .rd_clk(pll0_OUT1),
        .din({ch0DataOut,2'b0}),
        .wr_en(ch0SymEn),
        .rd_en(pll0_ReadEnable),
        .dout(pll0_Symbol),
        .full(pll0_Full),
        .empty(pll0_Empty),
        .prog_full(pll0_HalfFull)
    );
    always @(posedge pll0_OUT1) begin
        if (pllReset) begin
            pll0_ReadEnable <= 0;
        end
        else if (pll0_HalfFull) begin
            pll0_ReadEnable <= 1;
        end
    end

    `endif //NEW_FIFO
    `endif


    `ifdef ADD_BERT_TEST
    reg bertSpace;
    always @* begin
        casex(a)
            `BERT_SPACE:            bertSpace = !txRegCS;
            default:                bertSpace = 0;
            endcase
        end

    reg bertReset;
    initial bertReset = 0;
    bert_top bert(
        .busClk(bc),
        .cs(bertSpace),
        .addr(a),
        .dataIn(d),
        .dataOut(),
        .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
        .reset(reset | bertReset),
        .clk(clk),
        .enable(ch0SymEn),
        .data(ch0DataOut)
    );

    `endif

    `ifdef ADD_PNGEN_TEST
    reg pngenSpace;
    always @* begin
        casex(a)
            `PNGEN_SPACE:           pngenSpace = !txRegCS;
            default:                pngenSpace = 0;
            endcase
        end

    pngenTop pngen(
        .clk(clk),
        .clkEn(1'b1),
        .reset(reset),
        .busClk(bc),
        .wr0(we0), .wr1(we1), .wr2(we2), .wr3(we3),
        .addr(a),
        .din(d),
        .dout(),
        .pnClkEn(pnClkEn),
        .pnBit(pnBit)
    );
    `endif

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


`ifdef USE_BUS_CLOCK

task write16;
  input [12:0]addr;
  input [15:0]data;
  begin

    a = addr;
    rd = 0;
    bc = 1;
    if (addr[1]) begin
        d[31:16] = data;
        #20 ;
            bc = 0;
            we2 = 1; we3 = 1;
        #20 ;
            bc = 1;
        #20 ;
            bc = 0;
            we2 = 0; we3 = 0;
        end
    else begin
        d[15:0] = data;
        #20 ;
            bc = 0;
            we0 = 1; we1 = 1;
        #20 ;
            bc = 1;
        #20 ;
            bc = 0;
            we0 = 0; we1 = 0;
        end
    #20 ;
        bc = 1;
        d = 32'hz;
    #20 ;
        bc = 0;
    #20 ;
  end
endtask

task write32;
  input [12:0]addr;
  input [31:0]data;
  begin
    a = addr;
    d = data;
    rd = 0;

         bc = 1;
    #20  ;
         bc = 0;
         we0 = 1; we1 = 1; we2 = 1; we3 = 1;
    #20  ;
         bc = 1;
    #20  ;
         bc = 0;
         we0 = 0; we1 = 0; we2 = 0; we3 = 0;
    #20  ;
         bc = 1;
         d = 32'hz;
    #20  ;
         bc = 0;
    #20  ;
  end
endtask

`else  // USE_BUS_CLOCK

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

`endif // USE_BUS_CLOCK


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

    `ifdef ADD_NOISE
    // The 11.5 is a fudge factor (should be 12 for the 2 bit shift) for the scaling
    // down of the transmit waveform from full scale.
    // The 13.0 is to translate from SNR to EBNO which is 10log10(bitrate/bandwidth).
    $initGaussPLI(1,8.0 + 11.5 - 13.0,131072.0);
    `endif
    bitsyncTop.df0.dfReset = 1;
    bitsyncTop.df1.dfReset = 1;
    interpReset = 0;
    reset = 0;
    clk = 0;
    rd = 0;
    we0 = 0; we1 = 0; we2 = 0; we3 = 0;
    d = 32'hz;
    txRegCS = 0;
    txScaleFactor = 0.125;


    // Turn on the clock
    clken=1;
    #(10*C) ;

    // Init the Tx data generator registers
    // Init the interpolator FIR
    ch0Interpolate.videoFir.singleFirCoeffRegs.c0 = 16'h0;
    ch0Interpolate.videoFir.singleFirCoeffRegs.c1 = 16'h0;
    ch0Interpolate.videoFir.singleFirCoeffRegs.c2 = 16'h0;
    ch0Interpolate.videoFir.singleFirCoeffRegs.c3 = 16'h0;
    ch0Interpolate.videoFir.singleFirCoeffRegs.c4 = 16'h0;
    ch0Interpolate.videoFir.singleFirCoeffRegs.c5 = 16'h0;
    ch0Interpolate.videoFir.singleFirCoeffRegs.c6 = 16'h0;
    ch0Interpolate.videoFir.singleFirCoeffRegs.c7 = 16'h7fff;
    // Init the interpolator
    txRegCS = 1;
    write16(createAddress(`INTERP0SPACE, `INTERP_CONTROL),9);
    write16(createAddress(`INTERP0SPACE, `INTERP_CIC_EXPONENT), modInterpExponent);
    write32(createAddress(`INTERP0SPACE, `INTERP_CIC_MANTISSA), modInterpMantissa);
    write16(createAddress(`INTERP0SPACE, `INTERP_GAIN_MANTISSA),0);
    write16(createAddress(`INTERP0SPACE, `INTERP_GAIN_EXPONENT),16);
    // Reset to start the transmitter
    #(16*C) ;
    reset = 1;
    #(2*C) ;
    reset = 0;
    #(16*C) ;
    reset = 1;
    #(2*C) ;
    reset = 0;
    #(4*bitrateSamplesInt*C) ;
    reset = 1;
    #(2*C) ;
    reset = 0;
    write16(createAddress(`INTERP0SPACE, `INTERP_CONTROL),8);
    txRegCS = 0;

    `ifdef ADD_FIFOS
    // Init the PLLs
    write32(createAddress(`PLLSPACE,`PLL0_BITS_0to31),32'h01234567);
    write32(createAddress(`PLLSPACE,`PLL0_BITS_68to99),32'haaaa5555);
    write32(createAddress(`PLLSPACE,`PLL0_BITS_100to131),32'ha5a5a5a5);
    write16(createAddress(`PLLSPACE,`PLL0_XFER),16'h0);
    `endif

    // Init the mode
    write32(createAddress(`BITSYNC_TOP_SPACE,`BS_TOP_CONTROL),{30'bx,`BS_MODE_DUAL_CH});

    // Init the sample rate loop filters
    write32(createAddress(`CH0_RESAMPSPACE,`RESAMPLER_RATE),resamplerFreqInt);
    write32(createAddress(`CH0_BITSYNCSPACE,`LF_CONTROL),1);    // Zero the error
    write32(createAddress(`CH0_BITSYNCSPACE,`LF_LEAD_LAG),32'h001a0010);
    //write32(createAddress(`CH0_BITSYNCSPACE,`LF_LEAD_LAG),32'h0014000c);
    write32(createAddress(`CH0_BITSYNCSPACE,`LF_LIMIT), resamplerLimitInt);

    // Init the downcoverter register set
    write32(createAddress(`CH0_DFSPACE,`DF_CONTROL),dfControl);
    write32(createAddress(`CH0_DFSPACE,`DF_CIC_DECIMATION),cicDecimationInt-1);
    write32(createAddress(`CH0_DFSPACE,`DF_CIC_SHIFT), 3); // log2(cicDecimation ^ 3)
    write32(createAddress(`CH1_DFSPACE,`DF_CONTROL),dfControl);
    write32(createAddress(`CH1_DFSPACE,`DF_CIC_DECIMATION),cicDecimationInt-1);
    write32(createAddress(`CH1_DFSPACE,`DF_CIC_SHIFT), 3); // log2(cicDecimation ^ 3)

    write16(createAddress(`CH0_DFFIRSPACE,`DF_FIR_COEFF_0),16'h0123);
    write16(createAddress(`CH0_DFFIRSPACE,`DF_FIR_COEFF_1),16'h1234);
    write16(createAddress(`CH0_DFFIRSPACE,`DF_FIR_COEFF_2),16'h2345);
    write16(createAddress(`CH0_DFFIRSPACE,`DF_FIR_COEFF_3),16'h3456);
    write16(createAddress(`CH0_DFFIRSPACE,`DF_FIR_COEFF_4),16'h4567);
    write16(createAddress(`CH0_DFFIRSPACE,`DF_FIR_COEFF_5),16'h5678);
    write16(createAddress(`CH0_DFFIRSPACE,`DF_FIR_COEFF_6),16'h6789);
    write16(createAddress(`CH0_DFFIRSPACE,`DF_FIR_COEFF_7),16'h789a);

    // Init the cicResampler register set

    // Init the channel agc loop filter
    write32(createAddress(`CH0_AGCSPACE,`ALF_CONTROL),1);                 // Zero the error
    write32(createAddress(`CH0_AGCSPACE,`ALF_SETPOINT),32'h0000ffe0);     // AGC Setpoint
    write32(createAddress(`CH0_AGCSPACE,`ALF_GAINS),32'h001a001a);        // AGC Loop Gain
    write32(createAddress(`CH0_AGCSPACE,`ALF_ULIMIT),32'hff000000);       // AGC Upper limit
    write32(createAddress(`CH0_AGCSPACE,`ALF_LLIMIT),32'h00000000);       // AGC Lower limit
    bitsyncTop.pcmAgcLoop0.lf.integrator = 32'h4000_0000;
    bitsyncTop.pcmAgcLoop1.lf.integrator = 32'h4000_0000;

    // Set the DAC interpolator gains
    write32(createAddress(`BITSYNC_TOP_SPACE, `BS_TOP_CH0_CONTROL  ), {12'h0,`BS_DAC_AGC,
                                                                        4'h0,`BS_DAC_SYM,
                                                                        4'h0,`BS_DAC_DF});
    write32(createAddress(`INTERP0SPACE, `INTERP_CONTROL),0);
    write32(createAddress(`INTERP0SPACE, `INTERP_CIC_EXPONENT), 8);
    write32(createAddress(`INTERP0SPACE, `INTERP_CIC_MANTISSA), 32'h00012000);
    write32(createAddress(`INTERP1SPACE, `INTERP_CONTROL),0);
    write32(createAddress(`INTERP1SPACE, `INTERP_CIC_EXPONENT), 8);
    write32(createAddress(`INTERP1SPACE, `INTERP_CIC_MANTISSA), 32'h00012000);
    write32(createAddress(`INTERP2SPACE, `INTERP_CONTROL),0);
    write32(createAddress(`INTERP2SPACE, `INTERP_CIC_EXPONENT), 8);
    write32(createAddress(`INTERP2SPACE, `INTERP_CIC_MANTISSA), 32'h00012000);

    `ifdef ADD_BERT_TEST
    write32(createAddress(`BERT_SPACE,`BERT_POLY), 32'h080000b8);
    write16(createAddress(`BERT_SPACE,`POLARITY_THRESHOLD), 32'd64);
    write16(createAddress(`BERT_SPACE,`SLIP_LIMIT), 32'd30);
    write16(createAddress(`BERT_SPACE,`SLIP_THRESHOLD), 32'd20);
    write16(createAddress(`BERT_SPACE,`SLIP_RECOVERY), 32'd4);
    write16(createAddress(`BERT_SPACE,`SYNC_THRESHOLD), 32'd120);
    write32(createAddress(`BERT_SPACE,`SINGLE_TEST_LENGTH), 32'd5000);
    write32(createAddress(`BERT_SPACE,`TEST_CONTROL), 32'h0);
    `endif

    `ifdef ADD_PNGEN_TEST
    write32(createAddress(`PNGEN_SPACE,`PNGEN_POLY), 32'h480000b8);// PN8, restart true
    write32(createAddress(`PNGEN_SPACE,`PNGEN_RATE), 32'he0ea0ea); // 5.125 Mbps
    write16(createAddress(`PNGEN_SPACE,`PNGEN_PCM_MODE),16'h00);   // NRZ-L
    write32(createAddress(`PNGEN_SPACE,`PNGEN_POLY), 32'h080000b8);// PN8, restart false
    `endif

    write16(createAddress(`DMSE_SPACE,`DMSE_CH0_AVG_LENGTH),16'd255);
    write16(createAddress(`DMSE_SPACE,`DMSE_CH0_MEAN),16'd21627);
    write16(createAddress(`DMSE_SPACE,`DMSE_CH0_MSE_OFFSET),16'd0);


    reset = 1;
    #(2*C) ;
    reset = 0;
    bitsyncTop.df0.dfReset = 0;
    bitsyncTop.df1.dfReset = 0;

    // Wait 9.5 bit periods
    #(19*bitrateSamplesInt*C) ;

    // Create a reset to clear the halfband
    bitsyncTop.df0.dfReset = 1;
    bitsyncTop.df1.dfReset = 1;
    #(2*C) ;
    bitsyncTop.df0.dfReset = 0;
    #(1*C) ;
    bitsyncTop.df1.dfReset = 0;
    `ifdef ADD_FIFOS
    pllReset = 0;
    `endif

    // Wait
    #(4*bitrateSamplesInt*C) ;

    // Create a reset to clear the cic resampler
    bitsyncTop.df0.dfReset = 1;
    bitsyncTop.df1.dfReset = 1;
    #(2*C) ;
    bitsyncTop.df0.dfReset = 0;
    bitsyncTop.df1.dfReset = 0;

    // Wait 21 bit periods
    #(42*bitrateSamplesInt*C) ;

    // Create a reset to clear the interpolators
    interpReset = 1;
    #(2*C) ;
    interpReset = 0;

    // Enable the sample rate loop with 2 sample summer
    write32(createAddress(`CH0_BITSYNCSPACE,`LF_CONTROL),32'h00000010);

    // Wait
    #(20*bitrateSamplesInt*C) ;

    `ifdef ENABLE_AGC
    // Enable the AGC loop
    write32(createAddress(`CH0_AGCSPACE,`ALF_CONTROL),0);
    `endif

    // Wait for some data to pass thru
    write32(createAddress(`INTERP0SPACE, `INTERP_CONTROL), 32'h9);
    write32(createAddress(`INTERP0SPACE, `INTERP_CONTROL), 32'h8);
    write32(createAddress(`INTERP1SPACE, `INTERP_CONTROL), 32'h9);
    write32(createAddress(`INTERP1SPACE, `INTERP_CONTROL), 32'h8);
    write32(createAddress(`INTERP2SPACE, `INTERP_CONTROL), 32'h8);

    `ifdef ADD_BERT_TEST
    bertReset = 1;
    #(2*bitrateSamplesInt*C) ;
    bertReset = 0;

    #(2*40*bitrateSamplesInt*C) ;

    write32(createAddress(`BERT_SPACE,`TEST_CONTROL), 32'h4);
    #(2*bitrateSamplesInt*C) ;
    write32(createAddress(`BERT_SPACE,`TEST_CONTROL), 32'h0);
    `endif

    #(2*100*bitrateSamplesInt*C) ;
    `ifdef MATLAB_VECTORS
    $fclose(outfile);
    `endif
    $stop;

    end

endmodule

