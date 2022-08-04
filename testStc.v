`timescale 1ns/100ps
`include "addressMap.v"

module test;
    parameter CLOCK_FREQ = 93.333333e6;
    parameter HC = 1e9/CLOCK_FREQ/2;
    parameter C = 2*HC;
    parameter CLOCK_DECIMATION = 1;

    reg     reset;
    initial reset = 0;

    reg     interpReset;
    initial interpReset = 0;

    // Create the clocks
    reg     clk;
    initial clk = 1;
    reg     clken;
    always #HC clk = clk^clken;
    `define CLOCK_PERIOD    (C*1e-9)
    `define SAMPLE_FREQ     (CLOCK_FREQ/CLOCK_DECIMATION)
    `define SAMPLE_PERIOD   (`CLOCK_PERIOD*CLOCK_DECIMATION)


    reg     clkEnable;
    initial clkEnable = 0;
    integer clkCount;
    initial clkCount = 0;
    always @(posedge clk) begin
        if (clkCount == CLOCK_DECIMATION-1) begin
            clkCount <= 0;
            clkEnable <= 1;
        end
        else begin
            clkCount <= clkCount + 1;
            clkEnable <= 0;
        end
    end


    //************************** uP Interface *********************************
    `ifdef R6100
        `include "upSpiTasks.v"
    `else
        `include "upBusTasks.v"
    `endif

    //************************** Test Settings ********************************

    `define SOQPSK_NORM_DEV (0.5)
    parameter modSampleDecimation = 4;
    `define CLOCKS_PER_BIT  (2*modSampleDecimation*CLOCK_DECIMATION)

    real bitrateBps;
    initial bitrateBps = (`SAMPLE_FREQ/(2*modSampleDecimation));

    /*
    To keep the CIC interpolator in the modulator from overflowing, we shift the
    input by ceil(log2(CLOCKS_PER_BIT^2)).
    */
    parameter modCicShift = $clog2(`CLOCKS_PER_BIT*`CLOCKS_PER_BIT);

    // interpolationGain is the amount of gain going through the CIC interpolator
    // value = 2^ceiling(log2(R*R))/(R*R), where R = interpolation rate of the FM modulator
    real    interpolationGain;
    initial interpolationGain = (2.0**modCicShift)/(`CLOCKS_PER_BIT*`CLOCKS_PER_BIT);

    /*
    Since the gain adjustment of the modCicShift is a power of two, an additional gain
    adjustment must be made to keep the interpolator unity gain. This adjustment amount is

    devScaleFactor = 2.0 * normDev/modSampleDecimation * interpolationGain * pow(2.0,18),

    where normDev is the deviation as a fraction of the symbol rate.
    */
    real    devScaleFactor;
    initial devScaleFactor = 2.0*`SOQPSK_NORM_DEV/modSampleDecimation * interpolationGain * (2.0**18);

    /*
    Encode devScaleFactor as an exponent and mantissa
    */
    real    devExponent;
    initial devExponent = 0;
    real    devMantissa;
    initial devMantissa = 1.0;

    wire    [3:0]   devExponentField = $rtoi(devExponent);
    wire    [17:0]  devMantissaField = 18'h1ffff;
    wire    [31:0]  devSoqpsk = {4'b0,devExponentField,6'b0,devMantissaField};


    wire [15:0]modSampleDivider = modSampleDecimation - 1;

    /* Calculations for the modulator deviation settings
    normDev is the deviation as a fraction of the symbol rate.
    interpolationGain is the amount of gain going through the CIC shifter.
    devScaleFactor is the remaining

    interpolationGain = pow(2.0,ceil(log10((double)cp->d*cp->d)/log10(2.0)))/(cp->d*cp->d);

    double devScaleFactor;
    double log2DevScaleFactor;
    cyg_int32 devExponent;

    devScaleFactor = 2.0 * normDev/cp->b * interpolationGain * pow(2.0,18.0);
    if (devScaleFactor == 0.0) {
        devExponent = 0;
        }
    else {
        log2DevScaleFactor = log10(devScaleFactor)/log10(2.0);
        devExponent = 17 - ceil(log2DevScaleFactor);
        devScaleFactor *= pow(2.0,devExponent);
        }
    devValue = round(devScaleFactor);
    // Did it overflow to exactly 1.0 and become -1.0?
    if (devValue == 0x20000) {
        devValue = 0x1ffff | (devExponent << 24);
    }
    else {
        devValue |= (devExponent << 24);
    }
    */

    //------------------------- Carrier Settings ------------------------------
    real carrierFreqHz;
    //initial carrierFreqHz = 23333333.3;
    initial carrierFreqHz = 0.0;
    reg signed  [31:0]  carrierFreq;
    always @(posedge clk) carrierFreq <= $rtoi(carrierFreqHz * `SAMPLE_PERIOD * (2.0**32));

    real carrierOffsetFreqHz;
    initial carrierOffsetFreqHz = 0.0;
    reg signed  [31:0]  carrierOffsetFreq;
    always @(posedge clk) carrierOffsetFreq <= $rtoi(carrierOffsetFreqHz * `SAMPLE_PERIOD * (2.0**32));


    //*************************** Test Sequence *******************************
    reg                     enableInput;
    initial                 enableInput = 0;

    reg                     modDataValid;
    initial                 modDataValid = 0;

    reg                     txEnable;
    initial                 txEnable = 0;

    initial begin

        // Wait for the input samples to start
        while (!enableInput) begin
            @ (posedge clk) ;
        end

        // Initialize the PN Generator

        // Initialize the SOQPSK Modulator

        write32(createAddress(`FMMODSPACE,`FM_MOD_FREQ), carrierFreq+carrierOffsetFreq);
        write32(createAddress(`FMMODSPACE,`FM_MOD_DEV), devSoqpsk);
        write32(createAddress(`FMMODSPACE,`FM_MOD_BITRATE), {1'b0,15'bx,modSampleDivider});
        // This value is ceiling(log2(R*R)), where R = interpolation rate.
        write32(createAddress(`FMMODSPACE,`FM_MOD_CIC),modCicShift);

        reset = 1;
        repeat (2) @ (posedge clk) ;
        reset = 0;

        // Wait 2 bit periods
        repeat (2*`CLOCKS_PER_BIT) @ (posedge clk) ;
        modDataValid = 1;
        txEnable <= 1;

        // Wait 14 bit periods
        repeat (14*`CLOCKS_PER_BIT) @ (posedge clk) ;

        // Create a reset to clear the interpolators
        interpReset = 1;
        repeat (2*`CLOCKS_PER_BIT) @ (posedge clk) ;
        interpReset = 0;

        // Wait 5 bit periods
        repeat (5*`CLOCKS_PER_BIT) @ (posedge clk) ;

        // Run the modulator
        repeat (200000*`CLOCKS_PER_BIT) @ (posedge clk) ;

        `ifdef MATLAB_VECTORS
        $fclose(outfile);
        `endif
        $stop;

    end


    //******************************* UUT *************************************
    `ifdef R6100
    spiBusInterface spi(
        .clk(clk),
        .reset(reset),
        .spiClk(busClk),
        .spiCS(spiCS),
        .spiDataIn(spiDataIn),
        .spiDataOut(),
        .spiDataOE(spiDataOE),
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(a),
        .dataIn(d),
        .dataOut()
    );
    `endif

    // PN Generator
    `define POLY_PN2047             24'h000500
    `define POLY_PN2047_LENGTH      5'd11
    reg             [23:0]  pnPolyTaps;
    initial                 pnPolyTaps = `POLY_PN2047;
    reg             [4:0]   pnPolyLength;
    initial                 pnPolyLength = `POLY_PN2047_LENGTH;
    `include "bert/bert_functions.v"
    wire [23:0] poly = pnPolyTaps;
    bert_lfsr pn_lfsr (
        .poly(poly),
        .poly_length(pnPolyLength),
        .reset(reset),
        .clock(clk),
        .enable(pnBitEn && posEdgeModClkEn),
        .reload(1'b0),
        .load_data(24'b0),
        .data(),
        .serial(pnBit)
    );

    stcFramer stcf (
        .clk(clk),
        .clkEn(posEdgeModClkEn),
        .reset(reset),
        .payloadBit(pnBit),
        .payloadBitEn(pnBitEn),
        .stcBit0(stcBit0),
        .stcBit1(stcBit1)
    );


    wire    signed  [31:0]  fmModFreq0;
    wire    signed  [31:0]  fmModFreq1;
    stcMod stcMod(
        .clk(clk),
        .clkEn(1'b1),
        .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(a),
        .din(d),
        .dout(),
        .modData0(stcBit0),
        .modData1(stcBit1),
        .modDataValid(modDataValid),
        .txEnable(txEnable),
        .posEdgeModClkEn(posEdgeModClkEn),
        .modWaveform0(),
        .modWaveform1(),
        .fmModFreq0(fmModFreq0),
        .fmModFreq1(fmModFreq1)
    );




    //**************************** Startup ************************************
    initial begin
        clken <= 1;

        // Wait 10 clks
        repeat (6) @ (posedge clk) ;

        reset <= 1;
        repeat (4) @ (posedge clk) ;
        reset <= 0;
        repeat (4) @ (posedge clk) ;
        reset <= 1;
        repeat (12) @ (posedge clk) ;
        reset <= 0;

        @ (negedge clk) ;
        enableInput <= 1;

        @ (posedge clk) ;
        while (enableInput) begin
            @ (posedge clk) ;
        end

        $stop;

    end

    integer         sampleCount;
    initial         sampleCount = 0;
    wire    [31:0]  sampleCountWire = sampleCount;
    always @(posedge clk) begin
        if (enableInput) begin
            if (clkEnable) begin
                sampleCount <= sampleCount + 1;
            end
        end
    end

endmodule

