`timescale 1ns/100ps
`include "addressMap.v"

`define FM_TEST
//`define SOQPSK_TEST
//`define LDPC_TEST
//`define AQPSK_TEST

`define ENABLE_AGC
//`define TEST_CMA

`ifdef FM_TEST
    `define TEST_DATA "c:/modem/vivado/testData/pcmfmTestData.txt"
`elsif SOQPSK_TEST
    `define TEST_DATA "c:/modem/vivado/testData/soqpskTestData.txt"
`elsif LDPC_TEST
    `define TEST_DATA "c:/modem/vivado/testData/ldpcWaveform_1024_4_5.txt"
    //`define TEST_DATA "c:/modem/vivado/testData/ldpcSyncWaveform.txt"
`elsif AQPSK_TEST
    `define TEST_DATA "c:/modem/vivado/testData/soqpskTestData.txt"
`endif

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

    //*********************** File Input Test Vectors *************************
    reg     enableInput;        // Used to start and stop input vectors
    initial enableInput = 0;

    integer         x;          // Used as a dummy for fileio return values.

    integer                 fp_if;
    real                    ifSampleFloat;
    `ifdef LDPC_TEST
    parameter               ifSamplesPerBit = 128;
    `else
    parameter               ifSamplesPerBit = 32;
    `endif
    `define CLOCKS_PER_BIT  (ifSamplesPerBit*CLOCK_DECIMATION)
    initial begin
        fp_if = $fopen(`TEST_DATA,"r");
    end
    always @(posedge clk) begin
        if (clkEnable) begin
            if (! $feof(fp_if)) begin
                if (enableInput) begin
                    x <= $fscanf(fp_if,"%f",ifSampleFloat);
                end
            end
            else begin
                //enableInput <= 0;
                $display("Out of if samples");
                $rewind(fp_if);
                #1 x <= $fscanf(fp_if,"%f",ifSampleFloat);
            end
        end
    end
    real                    ifSampleScaled;
    real                    sampleScaleFactor;
    initial                 sampleScaleFactor = 0.5;
    reg     signed  [17:0]  ifSample;
    initial                 ifSample = 0;
    always @(posedge clk) begin
        if (!enableInput) begin
            ifSample <= 0;
        end
        else if (clkEnable) begin
            ifSampleScaled <= ifSampleFloat * sampleScaleFactor;
            if (ifSampleScaled >= 1.0) begin
                ifSample <= $signed(18'h1ffff);
            end
            else if (ifSampleScaled <= -1.0) begin
                ifSample <= $signed(18'h20001);
            end
            else begin
                ifSample <= $rtoi((2**17)*ifSampleScaled);
            end
        end
    end



    //************************** uP Interface *********************************
    `ifdef TRIPLE_DEMOD
        `include "upSpiTasks.v"
    `else
        `include "upBusTasks.v"
    `endif

    real bitrateBps;
    initial bitrateBps = (`SAMPLE_FREQ/ifSamplesPerBit);

    //------------------------- Carrier Settings ------------------------------
    real carrierFreqHz;
    initial carrierFreqHz = 23333333.3;
    reg signed  [31:0]  carrierFreq;
    always @(carrierFreqHz) carrierFreq = $rtoi(carrierFreqHz * `SAMPLE_PERIOD * (2.0**32));

    real carrierOffsetFreqHz;
    initial carrierOffsetFreqHz = 1.0;
    reg signed  [31:0]  carrierOffsetFreq;
    always @* carrierOffsetFreq = $rtoi(carrierOffsetFreqHz * `SAMPLE_PERIOD * (2.0**32));

    real carrierLimitHz;
    initial carrierLimitHz = 60000.0;
    reg signed  [31:0]  carrierLimit;
    always @(carrierLimitHz) carrierLimit = $rtoi(carrierLimitHz * `SAMPLE_PERIOD * (2.0**32));

    reg         [31:0]  sweepRate;
    initial sweepRate = 32'h00000000;

    //------------------------------ DDC Settings -----------------------------
    `define NEW_DDC_SETTINGS
    `ifdef NEW_DDC_SETTINGS
    parameter samplesPerSymbol = 2;
    integer minDdcSamplesPerSymbol;
    always @* begin
        `ifdef SOQPSK_TEST
        minDdcSamplesPerSymbol = $rtoi(2.0*ifSamplesPerBit/samplesPerSymbol + 0.5);
        `else
        minDdcSamplesPerSymbol = $rtoi(ifSamplesPerBit/samplesPerSymbol + 0.5);
        `endif
    end

    real resamplerFreqSps;
    always @(bitrateBps) begin
        `ifdef SOQPSK_TEST
        resamplerFreqSps = bitrateBps;
        `else
        resamplerFreqSps = 2.0*bitrateBps;
        `endif
    end

    real    ddcOutputFreq;
    real    cicDecimationReal;
    integer cicDecimation;
    integer ddcControl;
    always @* begin
        $display("Bitrate = %f:\n", bitrateBps);
        if (ifSamplesPerBit < 5) begin
            $display("ERROR - bitrate too low\n");
            $stop;
        end
        else if (minDdcSamplesPerSymbol <= 4) begin
            cicDecimation = 1;
            ddcControl = 7;
            $display("\tCIC bypassed\n");
            $display("\tHB  bypassed\n");
            ddcOutputFreq = (`SAMPLE_FREQ/2);
        end
        else if (minDdcSamplesPerSymbol <= 6) begin
            cicDecimation = 1;
            ddcControl = 5;
            $display("\tCIC bypassed\n");
            $display("\tHB  enabled\n");
            ddcOutputFreq = (`SAMPLE_FREQ/4);
        end
        else if (minDdcSamplesPerSymbol <= 8) begin
            cicDecimation = 3;
            ddcControl = 6;
            $display("\tCIC decimate by %d\n",cicDecimation);
            $display("\tHB  bypassed\n");
            ddcOutputFreq = (`SAMPLE_FREQ/6);
        end
        else begin
            cicDecimationReal = `SAMPLE_FREQ/8.0/resamplerFreqSps;
            cicDecimation = $rtoi(`SAMPLE_FREQ/8.0/resamplerFreqSps);
            ddcControl = 4;
            $display("\tCIC decimate by %d\n",cicDecimation);
            $display("\tHB  enabled\n");
            ddcOutputFreq = (`SAMPLE_FREQ/4/cicDecimation);
        end
    end

    `else //NEW_DDC_SETTINGS

    real resamplerFreqSps;
    always @(bitrateBps) resamplerFreqSps = 2.0*bitrateBps;
    real    ddcOutputFreq;
    real    cicDecimationReal;
    integer cicDecimation;
    integer ddcControl;
    always @* begin
        $display("Bitrate = %f:\n", bitrateBps);
        if (ifSamplesPerBit < 5) begin
            $display("ERROR - bitrate too low\n");
            $stop;
        end
        else if (ifSamplesPerBit <= 8) begin
            cicDecimation = 1;
            ddcControl = 7;
            $display("\tCIC bypassed\n");
            $display("\tHB  bypassed\n");
            ddcOutputFreq = (`SAMPLE_FREQ/2);
        end
        else if (ifSamplesPerBit <= 12) begin
            cicDecimation = 1;
            ddcControl = 5;
            $display("\tCIC bypassed\n");
            $display("\tHB  enabled\n");
            ddcOutputFreq = (`SAMPLE_FREQ/4);
        end
        else if (ifSamplesPerBit <= 16) begin
            cicDecimation = 3;
            ddcControl = 6;
            $display("\tCIC decimate by %d\n",cicDecimation);
            $display("\tHB  bypassed\n");
            ddcOutputFreq = (`SAMPLE_FREQ/6);
        end
        else begin
            cicDecimationReal = `SAMPLE_FREQ/8.0/resamplerFreqSps;
            cicDecimation = $rtoi(`SAMPLE_FREQ/8.0/resamplerFreqSps);
            ddcControl = 4;
            $display("\tCIC decimate by %d\n",cicDecimation);
            $display("\tHB  enabled\n");
            ddcOutputFreq = (`SAMPLE_FREQ/4/cicDecimation);
        end
    end

    `endif // NEW_DDC_SETTINGS

    //cic->exponent = ceil3Log2(cicDecimation);
    real cicExponent;
    always @* cicExponent = 3.0*$ceil($ln(cicDecimationReal)/$ln(2.0));
    integer cicShift;
    always @(cicExponent) cicShift = $rtoi(cicExponent);

    //---------------------------- Resampler Settings -------------------------

    real resamplerFreqNorm;
    initial resamplerFreqNorm = resamplerFreqSps/(ddcOutputFreq)*(2.0**32);
    integer resamplerFreqInt;
    initial resamplerFreqInt = $rtoi((resamplerFreqNorm >= (2.0**31)) ? (resamplerFreqNorm - (2.0**32))
                                                                      : resamplerFreqNorm);
    integer resamplerLimitInt;
    always @(resamplerFreqSps) begin
      resamplerLimitInt = $rtoi(0.001*resamplerFreqSps/`SAMPLE_FREQ * (2.0**32));
    end

    initial begin

        // Wait for the input samples to start
        while (!enableInput) begin
            @ (posedge clk) ;
        end

        // Init the mode
        `ifdef FM_TEST
        write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{16'bx,13'bx,`MODE_2FSK});
        `elsif SOQPSK_TEST
        write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{16'bx,13'bx,`MODE_OQPSK});
        `elsif LDPC_TEST
        write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{16'bx,13'bx,`MODE_OQPSK});
        `elsif AQPSK_TEST
        write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{16'bx,13'bx,`MODE_AQPSK});
        `endif

        // Init the sample rate loop filters
        write32(createAddress(`RESAMPSPACE,`RESAMPLER_RATE),resamplerFreqInt);
        write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),1);    // Zero the error
        `ifdef FM_TEST
        write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a0010);
        `elsif SOQPSK_TEST
        write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a0010);
        `elsif LDPC_TEST
        write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a0010);
        `elsif AQPSK_TEST
        write32(createAddress(`BITSYNCAUSPACE,`LF_CONTROL),1);    // Zero the error
        write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a0010);
        write32(createAddress(`BITSYNCAUSPACE,`LF_LEAD_LAG),32'h001a0010);
        write32(createAddress(`BITSYNCAUSPACE,`LF_LEAD_LAG),32'h001a0010);
        `endif
        write32(createAddress(`BITSYNCSPACE,`LF_LIMIT), resamplerLimitInt);

        // Init the carrier loop filters
        `ifdef FM_TEST
        // Setup for AFC
        write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),1);    // Zero the error
        write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h00000012);
        write32(createAddress(`CARRIERSPACE,`CLF_ULIMIT),  carrierLimit);
        write32(createAddress(`CARRIERSPACE,`CLF_LLIMIT), -carrierLimit);
        write32(createAddress(`CARRIERSPACE,`CLF_LOOPDATA), sweepRate);
        `elsif SOQPSK_TEST
        write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),1);    // Zero the error
        write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h18180808);
        write32(createAddress(`CARRIERSPACE,`CLF_ULIMIT),  carrierLimit);
        write32(createAddress(`CARRIERSPACE,`CLF_LLIMIT), -carrierLimit);
        write32(createAddress(`CARRIERSPACE,`CLF_LOOPDATA), sweepRate);
        `elsif LDPC_TEST
        write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),1);    // Zero the error
        write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h18180808);
        write32(createAddress(`CARRIERSPACE,`CLF_ULIMIT),  carrierLimit);
        write32(createAddress(`CARRIERSPACE,`CLF_LLIMIT), -carrierLimit);
        write32(createAddress(`CARRIERSPACE,`CLF_LOOPDATA), sweepRate);
        `elsif AQPSK_TEST
        write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),1);    // Zero the error
        write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h18180808);
        write32(createAddress(`CARRIERSPACE,`CLF_ULIMIT),  carrierLimit);
        write32(createAddress(`CARRIERSPACE,`CLF_LLIMIT), -carrierLimit);
        write32(createAddress(`CARRIERSPACE,`CLF_LOOPDATA), sweepRate);
        `endif

        `ifdef TRELLIS
        // Init the trellis carrier loop
        write32(createAddress(`TRELLISLFSPACE,`LF_CONTROL),13);    // Forces the lag acc and the error term to be zero
        write32(createAddress(`TRELLISLFSPACE,`LF_LEAD_LAG),32'h0015_0005);
        write32(createAddress(`TRELLISLFSPACE,`LF_LIMIT),32'h0100_0000);
        //write32(createAddress(`TRELLISLFSPACE,`LF_LOOPDATA0),32'h0333_3333);
        //write32(createAddress(`TRELLISLFSPACE,`LF_LOOPDATA0),32'h0666_6666);
        write32(createAddress(`TRELLISLFSPACE,`LF_LOOPDATA0),32'h0100_0000);
        write32(createAddress(`TRELLISLFSPACE,`LF_LOOPDATA1),32'hff00_0000);

        write32(createAddress(`TRELLIS_SPACE,`TRELLIS_DECAY),217);
        `endif

        // Init the downcoverter register set
        //`define USE_0p1_FIR
        `ifdef USE_0p1_FIR
        ddcControl = ddcControl & ~32'h00000004;
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_0),-46);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_1),-228);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_2),-428);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_3),-87);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_4),1487);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_5),4302);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_6),7178);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_7),8409);
        `endif
        write32(createAddress(`DDCSPACE,`DDC_CONTROL),ddcControl);
        write32(createAddress(`DDCSPACE,`DDC_CENTER_FREQ), carrierFreq);
        write32(createAddress(`DDCSPACE,`DDC_DECIMATION), 0);



        // Init the cicResampler register set
        write32(createAddress(`CICDECSPACE,`CIC_DECIMATION),cicDecimation-1);
        write32(createAddress(`CICDECSPACE,`CIC_SHIFT), cicShift);

        // Init the channel agc loop filter
        write32(createAddress(`CHAGCSPACE,`ALF_CONTROL),1);                 // Zero the error
        write32(createAddress(`CHAGCSPACE,`ALF_SETPOINT),32'h000000e0);     // AGC Setpoint
        write32(createAddress(`CHAGCSPACE,`ALF_GAINS),32'h00180018);        // AGC Loop Gain
        write32(createAddress(`CHAGCSPACE,`ALF_ULIMIT),32'h4fffffff);       // AGC Upper limit
        write32(createAddress(`CHAGCSPACE,`ALF_LLIMIT),32'h00000000);       // AGC Lower limit

        // Set the DAC interpolator gains
        write32(createAddress(`DEMODSPACE, `DEMOD_DACSELECT), {12'h0,`DAC_MAG,
                                                               4'h0,`DAC_Q,
                                                               4'h0,`DAC_I});
        write16(createAddress(`INTERP0SPACE, `INTERP_CONTROL),16'h8);
        write16(createAddress(`INTERP0SPACE, `INTERP_GAIN_MANTISSA),16'hffff);
        write16(createAddress(`INTERP0SPACE, `INTERP_GAIN_EXPONENT),16'h10);
        write16(createAddress(`INTERP0SPACE, `INTERP_CIC_EXPONENT), 16'd6);
        write32(createAddress(`INTERP0SPACE, `INTERP_CIC_MANTISSA), 32'h00012000);
        write16(createAddress(`INTERP1SPACE, `INTERP_CONTROL),16'h8);
        write16(createAddress(`INTERP1SPACE, `INTERP_GAIN_MANTISSA),16'hffff);
        write16(createAddress(`INTERP1SPACE, `INTERP_GAIN_EXPONENT),16'h10);
        write16(createAddress(`INTERP1SPACE, `INTERP_CIC_EXPONENT), 16'd6);
        write32(createAddress(`INTERP1SPACE, `INTERP_CIC_MANTISSA), 32'h00012000);
        write16(createAddress(`INTERP2SPACE, `INTERP_CONTROL),16'h9);
        write16(createAddress(`INTERP2SPACE, `INTERP_GAIN_MANTISSA),16'hffff);
        write16(createAddress(`INTERP2SPACE, `INTERP_GAIN_EXPONENT),16'h10);
        write16(createAddress(`INTERP2SPACE, `INTERP_CIC_EXPONENT), 16'd8);
        write32(createAddress(`INTERP2SPACE, `INTERP_CIC_MANTISSA), 32'h00012000);

        `ifdef ADD_LDPC
        // Set for inverse of 0.45 which is a smidge less than the AGC setpoint of 0.5 to
        // account for shaping filter losses.
        //write32(createAddress(`LDPCSPACE, `LDPC_INVERSE_MEAN), 32'h00018e39);
        write32(createAddress(`LDPCSPACE, `LDPC_INVERSE_MEAN), 32'h00028000);
        //write32(createAddress(`LDPCSPACE, `LDPC_INVERSE_MEAN), 32'h00048000);
        //write32(createAddress(`LDPCSPACE, `LDPC_INVERSE_MEAN), 32'h0000d200);
        write32(createAddress(`LDPCSPACE, `LDPC_CONTROL),{1'b0,4'b0,11'd62,
                                                          10'b0,`LDPC_DERAND_NONE,`LDPC_CODE_LENGTH_1024,1'b0,`LDPC_RATE_4_5});
        `endif

        `ifdef ADD_DQM
        // MSE Estimator
        write16(createAddress(`DQMSPACE, `DQM_LOG10MSE_OFFSET),-16'sd250);
        write32(createAddress(`DQMSPACE, `DQM_MSE_CONTROL),{16'd255,16'd23253});
        write16(createAddress(`DQMSPACE, `DQM_CLKS_PER_BIT),15);
        write16(createAddress(`DQMSPACE, `DQM_PAYLOAD_SIZE),127);
        //read16(createAddress(`DQMSPACE,  `DQM_CLKS_PER_BIT));
        `endif

        `ifdef TEST_CMA
        write32(createAddress(`EQUALIZERSPACE, `EQ_STEP_SIZE),32'h0000_0000);
        write32(createAddress(`EQUALIZERSPACE, `EQ_CMA_REFERENCE),32'h0000_199a);
        write32(createAddress(`EQUALIZERSPACE, `EQ_CONTROL),32'h0000_0002);
        `else
        write32(createAddress(`EQUALIZERSPACE, `EQ_CONTROL),32'h0000_0000);
        `endif

        write32(createAddress(`UARTSPACE,`UART_BAUD_DIV),32'h0000000f);

        reset = 1;
        repeat (2) @ (posedge clk) ;
        reset = 0;
        demod.ddc.hbReset = 0;
        demod.ddc.cicReset = 0;

        // Wait 10 bit periods
        repeat (10*`CLOCKS_PER_BIT) @ (posedge clk) ;

        // Force the carrier frequency to load. We have to do this because
        // the load is normally not done in FSK mode until you get symbol
        // enables from the bitsync
        demod.ddc.ddcFreq = -carrierFreq;

        // Create a reset to clear the nco accumulator
        reset = 1;
        repeat (2) @ (posedge clk) ;
        reset = 0;

        // Wait 2.0 bit periods
        repeat (2*`CLOCKS_PER_BIT) @ (posedge clk) ;

        `ifdef ADD_LDPC
        // Set the run bit
        write32(createAddress(`LDPCSPACE, `LDPC_CONTROL),{1'b1,4'b0,11'd62,
                                                          10'b0,`LDPC_DERAND_NONE,`LDPC_CODE_LENGTH_1024,1'b0,`LDPC_RATE_4_5});
        `endif

        // Create a reset to clear the halfband
        demod.ddc.hbReset = 1;
        repeat (2) @ (posedge clk) ;
        demod.ddc.hbReset = 0;

        // Wait 4 bit periods
        repeat (4*`CLOCKS_PER_BIT) @ (posedge clk) ;

        // Create a reset to clear the cic resampler
        demod.ddc.cicReset = 1;
        repeat (2) @ (posedge clk) ;
        demod.ddc.cicReset = 0;

        // Wait 14 bit periods
        repeat (14*`CLOCKS_PER_BIT) @ (posedge clk) ;

        // Create a reset to clear the interpolators
        interpReset = 1;
        repeat (2*`CLOCKS_PER_BIT) @ (posedge clk) ;
        interpReset = 0;

        // Enable the sample rate loop without 2 sample summer
        write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),32'h0000_0000);
        `ifdef AQPSK_TEST
        write32(createAddress(`BITSYNCAUSPACE,`LF_CONTROL),32'h0000_0000);
        `endif


        // Wait 5 bit periods
        repeat (5*`CLOCKS_PER_BIT) @ (posedge clk) ;

        /*
        `ifdef ADD_DQM
        // Clear the BEP estimate
        bepEstimate.sum = 0;
        bepEstimate.count = 1;
        `endif
        */

        `ifdef TRELLIS
        // Create a reset to clear the accumulator in the trellis
        `ifndef IQ_MAG
        trellis.viterbi_top.simReset = 1;
        trellisReset = 1;
        #(2*bitrateSamplesInt*C) ;
        trellis.viterbi_top.simReset = 0;
        trellisReset = 0;
        #(10*bitrateSamplesInt*C) ;
        trellis.viterbi_top.simReset = 1;
        trellisReset = 1;
        #(2*bitrateSamplesInt*C) ;
        trellis.viterbi_top.simReset = 0;
        trellisReset = 0;
        #(30*bitrateSamplesInt*C) ;
        trellis.viterbi_top.simReset = 1;
        trellisReset = 1;
        #(2*bitrateSamplesInt*C) ;
        trellis.viterbi_top.simReset = 0;
        trellisReset = 0;
        `endif
        `endif

        // Enable the trellis carrier loop
        repeat (5*`CLOCKS_PER_BIT) @ (posedge clk) ;
        //write32(createAddress(`TRELLISLFSPACE,`LF_CONTROL),6);

        `ifdef ENABLE_AGC
        // Enable the AGC loop
        write32(createAddress(`CHAGCSPACE,`ALF_CONTROL),0);
        `endif

        `ifdef SOQPSK_TEST
        write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),2);
        `endif

        `ifdef TEST_CMA
        // Wait for some data to pass thru
        repeat (50*`CLOCKS_PER_BIT) @ (posedge clk) ;
        // Enable the equalizer
        write32(createAddress(`EQUALIZERSPACE, `EQ_CONTROL),32'h0000_0001);
        `endif

        // Wait for some data to pass thru
        repeat (50*`CLOCKS_PER_BIT) @ (posedge clk) ;
        `ifdef TRELLIS
        // Turn on the trellis carrier loop
        write32(createAddress(`TRELLIS_SPACE,`LF_CONTROL),32'h0);
        `endif

        // Enable the SDI in eye pattern mode
        write32(createAddress(`SDISPACE,`SDI_CONTROL),32'h00000081);
        repeat (50*`CLOCKS_PER_BIT) @ (posedge clk) ;
        read32(createAddress(`SDISPACE,`SDI_CONTROL));

        // Run the demod
        repeat (200000*`CLOCKS_PER_BIT) @ (posedge clk) ;

        `ifdef MATLAB_VECTORS
        $fclose(outfile);
        `endif
        $stop;

    end


    //******************************* UUT *************************************
    `ifdef TRIPLE_DEMOD
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


    `ifdef LDPC_TEST
    wire    signed  [17:0]  iLdpc,qLdpc;
    `endif
    wire    [12:0]  mag;
    wire    [17:0]  dac0Out,dac1Out,dac2Out, iSymData, qSymData, sdiDataI, sdiDataQ;
    wire    [17:0]  iEye,qEye;
    wire    [31:0]  dout;
    demod demod(
        .clk(clk), .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(a),
        .din(d),
        .dout(dout),
        .iRx(ifSample), .qRx(18'h0),
        .dac0Sync(dac0Sync),
        .dac0Data(dac0Out),
        .dac1Sync(dac1Sync),
        .dac1Data(dac1Out),
        .dac2Sync(dac2Sync),
        .dac2Data(dac2Out),
        .iSymEn(iSymEn),
        .iSym2xEn(sym2xEn),
        .iSymData(sdiDataI),
        .iBit(demodBit),
        .qSymEn(qSymEn),
        .qSymData(sdiDataQ),
        .sdiSymEn(sdiSymEn),
        .trellisSymEn(trellisSymEn),
        .iTrellis(iSymData),
        .qTrellis(qSymData),
        .mag(mag),
        .magClkEn(magClkEn),
        `ifdef LDPC_TEST
        .iLdpcSymEn(iLdpcSymEn),.qLdpcSymEn(qLdpcSymEn),
        .iLdpc(iLdpc),
        .qLdpc(qLdpc),
        `endif
        .eyeSync(eyeClkEn),
        .iEye(iEye), .qEye(qEye),
        .eyeOffset()
    );

    wire    [31:0]  dac0Dout;
    wire    [17:0]  dac0Data;
    interpolate #(.RegSpace(`INTERP0SPACE), .FirRegSpace(`VIDFIR0SPACE)) dac0Interp(
        .clk(clk), .reset(interpReset), .clkEn(dac0Sync),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(a),
        .din(d),
        .dout(dac0Dout),
        .dataIn(dac0Out),
        .dataOut(dac0Data)
        );

    wire    [31:0]  dac1Dout;
    wire    [17:0]  dac1Data;
    interpolate #(.RegSpace(`INTERP1SPACE), .FirRegSpace(`VIDFIR1SPACE)) dac1Interp(
        .clk(clk), .reset(interpReset), .clkEn(dac1Sync),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(a),
        .din(d),
        .dout(dac1Dout),
        .dataIn(dac1Out),
        .dataOut(dac1Data)
        );

    wire    [31:0]  dac2Dout;
    wire    [17:0]  dac2Data;
    interpolate #(.RegSpace(`INTERP2SPACE), .FirRegSpace(`VIDFIR2SPACE)) dac2Interp(
        .clk(clk), .reset(interpReset), .clkEn(dac2Sync),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(a),
        .din(d),
        .dout(dac2Dout),
        .dataIn(dac2Out),
        .dataOut(dac2Data)
        );

    `ifdef LDPC_TEST
    ldpc #(.LDPCBITS(7)) ldpc(
        .clk(clk), .clkEn(sym2xEn), .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(a),
        .din(d),
        .dout(),
        .iSymEn(iLdpcSymEn),
        .iSymData(iLdpc),
        .qSymEn(qLdpcSymEn),
        .qSymData(qLdpc),
        .ldpcBitEnOut(),
        .ldpcBitOut()
    );
    `endif

    sdi sdi(
        .clk(clk),
        .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(a),
        .dataIn(d),
        .dataOut(),
        .iSymEn(iSymEn),
        .iSymData(sdiDataI),
        .qSymEn(iSymEn),
        .qSymData(sdiDataQ),
        .eyeSync(),
        .iEye(), .qEye(),
        .eyeOffset(),
        .bitsyncLock(), .demodLock(),
        .sdiOut()
    );

`ifdef ADD_DQM
/******************************************************************************
                                    DQM
******************************************************************************/
    wire    [3:0]   dqmSourceSelect;
    reg             dqmBitEnIn;
    reg             dqmBitIn;
    always @(posedge clk) begin
        casex (dqmSourceSelect)
            `DQM_SRC_DEC0_CH0: begin
                dqmBitEnIn <= iSymEn;
                dqmBitIn <= demodBit;
            end
            default: begin
                dqmBitEnIn <= iSymEn;
                dqmBitIn <= demodBit;
            end
        endcase
    end



    wire    [31:0]  dqmDout;
    dqm dqm(
        .clk(clk),
        .reset(reset),
        .addr(a),
        .din(d),
        .dout(),
        .cs(cs),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .bitClkEn(dqmBitEnIn),
        .payloadBit(dqmBitIn),
        .magClkEn(magClkEn),
        .mag(mag),
        .sourceSelect(dqmSourceSelect),
        .dqmBitEn(dqmBitEn),
        .dqmBit(dqmBit)
    );

`endif //ADD_DQM






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

