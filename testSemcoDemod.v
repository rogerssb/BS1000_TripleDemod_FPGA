`timescale 1ns/100ps
`include "addressMap.v"

//`define FM_TEST
`define SOQPSK_TEST
//`define SOQTRELLIS_TEST
//`define LDPC_TEST
//`define AQPSK_TEST
//`define QPSK_VIT_TEST

`define ENABLE_AGC
//`define TEST_CMA

`ifdef SOQPSK_TEST
    `define SOQPSK_ENABLED
`endif

`ifdef SOQTRELLIS_TEST
    `define SOQPSK_ENABLED
`endif


`ifdef VM_SIM
    `ifdef FM_TEST
        `define TEST_DATA "y:/vivado/testData/pcmfmTestData.txt"
    `elsif SOQPSK_ENABLED
        `define TEST_DATA "y:/vivado/testData/soqpskTestData.txt"
    `elsif LDPC_TEST
        `define TEST_DATA "y:/vivado/testData/ldpcWaveform_1024_4_5.txt"
        //`define TEST_DATA "y:/vivado/testData/ldpcSyncWaveform.txt"
    `elsif AQPSK_TEST
        `define TEST_DATA "y:/vivado/testData/soqpskTestData.txt"
    `elsif QPSK_VIT_TEST
        `define TEST_DATA "c:/semco/qpsk/qpsk_2047_R1_2_K7_G2Inverted.txt"
    `endif

`else //VM_SIM

    `ifdef FM_TEST
        `define TEST_DATA "c:/modem/vivado/testData/pcmfmTestData.txt"
        //`define TEST_DATA "c:/modem/vivado/testData/pcmfmTestData_3sps.txt"
    `elsif SOQPSK_ENABLED
        `define TEST_DATA "c:/modem/vivado/testData/soqpskTestData.txt"
    `elsif LDPC_TEST
        `define TEST_DATA "c:/modem/vivado/testData/ldpcWaveform_1024_4_5.txt"
        //`define TEST_DATA "c:/modem/vivado/testData/ldpcSyncWaveform.txt"
    `elsif AQPSK_TEST
        `define TEST_DATA "c:/modem/vivado/testData/soqpskTestData.txt"
    `elsif QPSK_VIT_TEST
        `define TEST_DATA "c:/semco/qpsk/qpsk_2047_R1_2_K7_G2Inverted.txt"
    `endif

`endif //VM_SIM

module test;
    parameter CLOCK_FREQ = 93.333333e6;
    parameter HC = 1e9/CLOCK_FREQ/2;
    parameter C = 2*HC;
    parameter CLOCK_DECIMATION = 1;

    /*
    Instantiate the global internals for the FPGA library
    */
    glbl glbl();

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
    `elsif SOQPSK_ENABLED
    parameter               ifSamplesPerBit = 16;
    `else
    parameter               ifSamplesPerBit = 32;
    //parameter               ifSamplesPerBit = 3;
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
                enableInput <= 0;
                $display("Out of if samples");
                $rewind(fp_if);
                #1 x <= $fscanf(fp_if,"%f",ifSampleFloat);
            end
        end
    end
    real                    ifSampleScaled;
    real                    sampleScaleFactor;
    initial                 sampleScaleFactor = 1.0;
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

    //************************ PN Sequence for Comparison *********************
    `ifdef SOQTRELLIS_TEST
    reg     enableBERT;
    initial enableBERT = 0;
    `elsif SOQPSK_TEST
    reg     enableBERT;
    initial enableBERT = 0;
    `endif
    parameter PN8 = 16'h008e,
              MASK8 = 16'h00ff;

    parameter PN6 = 16'b0000_0000_00110000,
              MASK6 = 16'h003f;

    reg [15:0]sr;
    reg [4:0]zeroCount;
    reg [63:0]  randDataSR;
    reg  randData;
    integer pnBitcount;
    always @(posedge clk) begin
        if (reset) begin
            pnBitcount <= ifSamplesPerBit - 1;
            zeroCount <= 5'b0;
            sr <= MASK6;
        end
        else if (pnBitcount > 0) begin
            pnBitcount <= pnBitcount - 1;
        end
        else begin
            pnBitcount <= ifSamplesPerBit - 1;
            if (sr[0] | (zeroCount == 5'b11111))
                begin
                zeroCount <= 5'h0;
                sr <= {1'b0, sr[15:1]} ^ PN6;
            end
            else
                begin
                zeroCount <= zeroCount + 5'h1;
                sr <= sr >> 1;
            end
            randDataSR <= {randDataSR[62:0],~sr[0]};
            `ifdef SOQPSK_TEST
            randData <= randDataSR[58];
            `elsif SOQTRELLIS_TEST
            randData <= randDataSR[37];
            `endif
        end
    end



    //************************** uP Interface *********************************
    reg     testPoint;
    initial testPoint = 0;

    `ifdef R6100
        `include "upSpiTasks.v"
    `else
        `include "upBusTasks.v"
    `endif

    real bitrateBps;
    initial bitrateBps = (`SAMPLE_FREQ/ifSamplesPerBit);

    //------------------------- DQM Settings ----------------------------------
    parameter DQM_payloadSize = 128;
    real dqmBitrateBps;
    initial dqmBitrateBps = bitrateBps*(DQM_payloadSize + 49)/DQM_payloadSize;
    reg signed  [31:0]  dqmDllFrequency;
    always @* dqmDllFrequency = $rtoi(dqmBitrateBps * `SAMPLE_PERIOD * (2.0**32));

    //------------------------- Carrier Settings ------------------------------
    real carrierFreqHz;
    initial carrierFreqHz = 23333333.3;
    reg signed  [31:0]  carrierFreq;
    always @(carrierFreqHz) carrierFreq = $rtoi(carrierFreqHz * `SAMPLE_PERIOD * (2.0**32));

    real carrierOffsetFreqHz;
    initial carrierOffsetFreqHz = 25000.0;
    reg signed  [31:0]  carrierOffsetFreq;
    always @* carrierOffsetFreq = $rtoi(carrierOffsetFreqHz * `SAMPLE_PERIOD * (2.0**32));

    real carrierLimitHz;
    initial carrierLimitHz = 25000.0;
    reg signed  [31:0]  carrierLimit;
    always @(carrierLimitHz) carrierLimit = $rtoi(carrierLimitHz * `SAMPLE_PERIOD * (2.0**32));

    reg         [31:0]  sweepRate;
    initial sweepRate = 32'h00010000;

    //------------------------------ DDC Settings -----------------------------
    `define NEW_DDC_SETTINGS
    `ifdef NEW_DDC_SETTINGS
    parameter decimatedSamplesPerSymbol = 2;
    integer minDdcSamplesPerSymbol;
    initial begin
        `ifdef SOQPSK_ENABLED
        minDdcSamplesPerSymbol = $rtoi(ifSamplesPerBit*2/decimatedSamplesPerSymbol + 0.5);
        `else
        minDdcSamplesPerSymbol = $rtoi(ifSamplesPerBit/decimatedSamplesPerSymbol + 0.5);
        `endif
    end

    real resamplerFreqSps;
    always @(bitrateBps) begin
        `ifdef SOQPSK_ENABLED
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
        if (ifSamplesPerBit < 2) begin
            $display("ERROR - bitrate too high\n");
            $stop;
        end
        else if (minDdcSamplesPerSymbol <= 3) begin
            cicDecimation = 1;
            ddcControl = 23;
            $display("\tHB0 bypassed\n");
            $display("\tCIC bypassed\n");
            $display("\tHB  bypassed\n");
            ddcOutputFreq = (`SAMPLE_FREQ);
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
    always @* resamplerFreqNorm = resamplerFreqSps/(ddcOutputFreq)*(2.0**32);
    integer resamplerFreqInt;
    always @* resamplerFreqInt = $rtoi((resamplerFreqNorm >= (2.0**31)) ? (resamplerFreqNorm - (2.0**32))
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
        `elsif SOQTRELLIS_TEST
        write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{16'bx,13'bx,`MODE_SOQPSK});
        `elsif LDPC_TEST
        write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{16'bx,13'bx,`MODE_OQPSK});
        `elsif AQPSK_TEST
        write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{16'bx,13'bx,`MODE_AQPSK});
        `elsif QPSK_VIT_TEST
        write32(createAddress(`DEMODSPACE,`DEMOD_CONTROL),{16'bx,13'bx,`MODE_QPSK});
        `endif

        // Init the sample rate loop filters
        write32(createAddress(`RESAMPSPACE,`RESAMPLER_RATE),resamplerFreqInt);
        write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),1);    // Zero the error
        `ifdef FM_TEST
        write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a0010);
        `elsif SOQPSK_ENABLED
        write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a0010);
        `elsif LDPC_TEST
        write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a0010);
        `elsif AQPSK_TEST
        write32(createAddress(`BITSYNCAUSPACE,`LF_CONTROL),1);    // Zero the error
        write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a0010);
        write32(createAddress(`BITSYNCAUSPACE,`LF_LEAD_LAG),32'h001a0010);
        write32(createAddress(`BITSYNCAUSPACE,`LF_LEAD_LAG),32'h001a0010);
        `elsif QPSK_VIT_TEST
        write32(createAddress(`BITSYNCSPACE,`LF_LEAD_LAG),32'h001a0010);
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
        `elsif SOQPSK_ENABLED
        write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),1);    // Zero the error
        `ifdef CLF_SOQPSK_USE_RESAMP_PHASE
        write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h16160808);
        `else
        write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h18180a0a);
        `endif
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
        `elsif QPSK_VIT_TEST
        write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),1);    // Zero the error
        write32(createAddress(`CARRIERSPACE,`CLF_LEAD_LAG),32'h14140606);
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
        //`define USE_0p3_FIR
        //`define USE_0p4_FIR
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
        `elsif USE_0p3_FIR
        ddcControl = ddcControl & ~32'h00000004;
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_0), 32);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_1),-22);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_2),-393);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_3), 978);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_4),-136);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_5),-3582);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_6), 8689);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_7), 21634);
        `elsif USE_0p4_FIR
        ddcControl = ddcControl & ~32'h00000004;
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_0),-113);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_1),-76);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_2), 617);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_3),-1551);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_4), 2765);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_5),-3998);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_6), 4921);
        write16(createAddress(`DDCFIRSPACE,`DDC_FIR_COEFF_7), 27637);
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
        `ifdef DQM_USE_DPLL
        write32(createAddress(`DQMSPACE, `DQM_DLL_FREQUENCY),dqmDllFrequency);
        `else
        write16(createAddress(`DQMSPACE, `DQM_CLKS_PER_BIT),22);
        `endif
        write16(createAddress(`DQMSPACE, `DQM_PAYLOAD_SIZE),(DQM_payloadSize-1));
        `endif

        `ifdef TEST_CMA
        write32(createAddress(`EQUALIZERSPACE, `EQ_STEP_SIZE),32'h0000_0000);
        write32(createAddress(`EQUALIZERSPACE, `EQ_CMA_REFERENCE),32'h0000_199a);
        write32(createAddress(`EQUALIZERSPACE, `EQ_CONTROL),32'h0000_0002);
        `else
        write32(createAddress(`EQUALIZERSPACE, `EQ_CONTROL),32'h0000_0000);
        `endif

        write32(createAddress(`UARTSPACE,`UART_BAUD_DIV),32'h0000000f);

        `ifdef QPSK_VIT_TEST
        // Set for inverse of 0.45 which is a smidge less than the AGC setpoint of 0.5 to
        // account for shaping filter losses.
        write32(createAddress(`VITERBISPACE, `VIT_INVERSE_MEAN), 32'h00018e39);
        write32(createAddress(`VITERBISPACE, `VIT_BER_TEST_LENGTH), 32'd8);
        `endif

        write32(createAddress(`DUAL_DECODERSPACE, `DEC_CONTROL),32'h40);

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

        // Enable the sample rate loop
        `ifdef SOQTRELLIS_TEST
        // With the 2 sample summer
        write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),32'h0000_0010);
        `elsif AQPSK_TEST
        // Without the 2 sample summer
        write32(createAddress(`BITSYNCAUSPACE,`LF_CONTROL),32'h0000_0000);
        `else
        // Without the 2 sample summer
        write32(createAddress(`BITSYNCSPACE,`LF_CONTROL),32'h0000_0000);
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

        `ifdef SOQPSK_ENABLED
        `ifdef CLF_SOQPSK_USE_RESAMP_PHASE
        write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),2);
        `else
        // Enable carrier loop with sweep
        //write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),6);
        write32(createAddress(`CARRIERSPACE,`CLF_CONTROL),2);
        `endif
        //demod.carrierLoop.lagGain.lagAccum = carrierOffsetFreq;
        `endif

        `ifdef QPSK_VIT_TEST
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

        `ifdef SOQTRELLIS_TEST
        soqTrellis.soqpskViterbi.simReset = 1;
        repeat (2*`CLOCKS_PER_BIT) @ (posedge clk) ;
        soqTrellis.soqpskViterbi.simReset = 0;

        repeat (20*`CLOCKS_PER_BIT) @ (posedge clk) ;
        enableBERT = 1;
        `endif

        `ifdef QPSK_VIT_TEST
        viterbi.vitReset = 1;
        repeat (2*`CLOCKS_PER_BIT) @ (posedge clk) ;
        viterbi.vitReset = 0;
        `endif

        // Enable the SDI in eye pattern mode
        write32(createAddress(`SDISPACE,`SDI_CONTROL),32'h00000081);
        repeat (50*`CLOCKS_PER_BIT) @ (posedge clk) ;
        read32(createAddress(`SDISPACE,`SDI_CONTROL));

        // Run the demod
        repeat (300*`CLOCKS_PER_BIT) @ (posedge clk) ;
        // Force a phase shift
        testPoint = 1;
        demod.ddc.newOffset = 32'h2000_0000;
        repeat (1) @ (posedge clk) ;
        demod.ddc.newOffset = 0;

        // Run the demod
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


    `ifdef LDPC_TEST
    wire    signed  [17:0]  iLdpc,qLdpc;
    `endif
    wire    [12:0]  mag;
    wire    signed  [4:0]   demodMode;
    wire    [17:0]  dac0Out,dac1Out,dac2Out, iSymData, qSymData, sdiDataI, sdiDataQ;
    wire    signed  [17:0]  iTrellis,qTrellis;
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
        .iSymData(iSymData),
        .iBitEn(iBitEn),
        .iBit(iBit),
        .qSymEn(qSymEn),
        .qSym2xEn(qSym2xEn),
        .qSymData(qSymData),
        .qBit(qBit),
        .sdiSymEn(sdiSymEn),
        .trellisSymEn(trellisSymEn),
        .iTrellis(iTrellis),
        .qTrellis(qTrellis),
        .mag(mag),
        .magClkEn(magClkEn),
        .demodMode(demodMode),
        `ifdef LDPC_TEST
        .iLdpcSymEn(iLdpcSymEn),.qLdpcSymEn(qLdpcSymEn),
        .iLdpc(iLdpc),
        .qLdpc(qLdpc),
        `endif
        .eyeSync(eyeClkEn),
        .iEye(iEye), .qEye(qEye),
        .eyeOffset()
    );

    `ifdef SOQTRELLIS_TEST
    trellisSoqpsk soqTrellis(
        .clk(clk), .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(a),
        .din(d),
        .dout(),
        .symEn(trellisSymEn),
        .sym2xEn(sym2xEn),
        .iIn(iTrellis),
        .qIn(qTrellis),
        .dac0Select(),
        .dac1Select(),
        .dac2Select(),
        .dac0Sync(),
        .dac0Data(),
        .dac1Sync(),
        .dac1Data(),
        .dac2Sync(),
        .dac2Data(),
        .decision(soqTrellisBit),
        .ternarySymEnOut(soqTrellisBitEn),
        .ternarySym2xEnOut()
    );

    integer bitError;
    always @(posedge clk) begin
        if (!enableBERT) begin
            bitError <= 0;
        end
        else if (soqTrellisBitEn) begin
            if (soqTrellisBit != randData) begin
                bitError <= bitError + 1;
            end
        end
    end
    `endif  //SOQTRELLIS_TEST

    reg dualDecoderSpace;
    always @* begin
        casex(a)
            `DUAL_DECODERSPACE:     dualDecoderSpace = cs;
            default:                dualDecoderSpace = 0;
        endcase
    end
    wire    [31:0]  dualDecDout;
    decoder dualDecoder
    (
        .clk(clk),
        .reset(reset),
        .en(dualDecoderSpace),
        `ifdef USE_BUS_CLOCK
        .busClk(busClk),
        `endif
        .wr0(wr0),
        .wr1(wr1),
        .wr2(wr2),
        .wr3(wr3),
        .addr(a),
        .din(d),
        .dout(dualDecDout),
        .symb_clk_en(iBitEn),          // symbol rate clock enable
        .symb_clk_2x_en(sym2xEn),     // 2x symbol rate clock enable
        .symb_i(iBit),            // data input,
        .symb_q(qBit),            // data input,
        .dout_i(dualDataI),
        .dout_q(dualDataQ),
        .outputClkEn(dualPcmClkEn),
        .fifo_reset(),
        .clkPhase(),
        .symb_clk(dualPcmSymClk),
        .inputSelect()
    );

    `ifdef SOQPSK_TEST
    integer bitError;
    integer bitCount;
    always @(posedge clk) begin
        if (!enableBERT) begin
            bitError <= 0;
        end
        else if (dualPcmClkEn) begin
            bitCount <= bitCount + 1;
            if (dualDataI != randData) begin
                bitError <= bitError + 1;
            end
        end
    end
    `endif

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

    `ifdef QPSK_VIT_TEST
    reg         [1:0]   bitsyncMode;
    always @* begin
        case (demodMode)
            `MODE_QPSK:   bitsyncMode = `BS_MODE_DUAL_CH;
            `MODE_OQPSK:  bitsyncMode = `BS_MODE_OFFSET_CH;
            default:      bitsyncMode = `BS_MODE_IND_CH;
        endcase
    end

    wire    [31:0]  vitDout;
    viterbi viterbi(
        .clk(clk),
        .clkEn(1'b1),
        .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0),.wr1(wr1),.wr2(wr2),.wr3(wr3),
        .addr(a),
        .din(d),
        .dout(vitDout),
        .bitsyncMode(bitsyncMode),
        .ch0SymEn(iSymEn),
        .ch0SymData(iSymData),
        .ch1SymEn(qSymEn),
        .ch1SymData(qSymData),
        .ch0BitEnOut(ch0VitBitEn),
        .ch0BitOut(ch0VitBit),
        .ch1BitEnOut(ch1VitBitEn),
        .ch1BitOut(ch1VitBit)
        );
    reg                 ch0VitSym2xEn;
    reg                 ch1VitSym2xEn;
    always @* begin
        case (bitsyncMode)
            `BS_MODE_DUAL_CH,
            `BS_MODE_OFFSET_CH: begin
                ch0VitSym2xEn = sym2xEn;
                ch1VitSym2xEn = qSym2xEn;
            end
            default: begin
                ch0VitSym2xEn = iSymEn;
                ch1VitSym2xEn = qSymEn;
            end
        endcase
    end
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
        .iSymEn(iBitEn),
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
                dqmBitEnIn <= iBitEn;
                dqmBitIn <= iBit;
            end
            default: begin
                dqmBitEnIn <= iBitEn;
                dqmBitIn <= iBit;
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

        `ifdef QPSK_VIT_TEST
        viterbi.vitReset = 0;
        `endif

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

