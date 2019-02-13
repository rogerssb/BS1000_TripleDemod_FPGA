`timescale 1ns/100ps
`include "addressMap.v"

    //`define ROTATE_90
    `define FIXED_CODEWORD

    `ifdef FIXED_CODEWORD
        `ifdef ROTATE_90
        `define TEST_DATA_Q "c:/modem/vivado/testData/ldpcTestPattern_I_1024_4_5.txt"
        `define TEST_DATA_I "c:/modem/vivado/testData/ldpcTestPattern_Q_1024_4_5.txt"
        `else
        `define TEST_DATA_I "c:/modem/vivado/testData/ldpcTestPattern_I_1024_4_5.txt"
        `define TEST_DATA_Q "c:/modem/vivado/testData/ldpcTestPattern_Q_1024_4_5.txt"
        `endif
    `else //FIXED_CODEWORD
        `ifdef ROTATE_90
        `define TEST_DATA_Q "c:/modem/vivado/testData/ldpcTestWaveform_I_1024_4_5.txt"
        `define TEST_DATA_I "c:/modem/vivado/testData/ldpcTestWaveform_Q_1024_4_5.txt"
        `else
        `define TEST_DATA_I "c:/modem/vivado/testData/ldpcTestWaveform_I_1024_4_5.txt"
        `define TEST_DATA_Q "c:/modem/vivado/testData/ldpcTestWaveform_Q_1024_4_5.txt"
        `endif
    `endif //FIXED_CODEWORD

module test;
    parameter CLOCK_FREQ = 93.333333e6;
    parameter HC = 1e9/CLOCK_FREQ/2;
    parameter C = 2*HC;
    parameter CLOCK_DECIMATION = 64;

    reg     reset;
    initial reset = 0;

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
    reg     iSelect;
    `ifdef FIXED_CODEWORD
        `ifdef ROTATE_90
        initial iSelect = 1;
        `else
        initial iSelect = 0;
        `endif
    `else //FIXED_CODEWORD
        `ifdef ROTATE_90
        initial iSelect = 0;
        `else
        initial iSelect = 1;
        `endif
    `endif //FIXED_CODEWORD
    reg     iSymEn,qSymEn;
    integer clkCount;
    initial clkCount = 0;
    always @(posedge clk) begin
        if (clkCount == CLOCK_DECIMATION-1) begin
            clkCount <= 0;
            clkEnable <= 1;
            if (iSelect) begin
                iSymEn <= 1;
            end
            else begin
                qSymEn <= 1;
            end
            iSelect <= ~iSelect;
        end
        else begin
            clkCount <= clkCount + 1;
            clkEnable <= 0;
            iSymEn <= 0;
            qSymEn <= 0;
        end
    end

    //*********************** File Input Test Vectors *************************
    reg     enableInput;        // Used to start and stop input vectors
    initial enableInput = 0;

    integer         x;          // Used as a dummy for fileio return values.

    integer                 fp_IBB;
    integer                 fp_QBB;
    real                    iSampleFloat;
    real                    qSampleFloat;
    `ifdef LDPC_TEST
    parameter               ifSamplesPerBit = 128;
    `else
    parameter               ifSamplesPerBit = 32;
    `endif
    `define CLOCKS_PER_BIT  (ifSamplesPerBit*CLOCK_DECIMATION)
    initial begin
        fp_IBB = $fopen(`TEST_DATA_I,"r");
        fp_QBB = $fopen(`TEST_DATA_Q,"r");
    end
    always @(posedge clk) begin
        if (clkEnable) begin
            if (! $feof(fp_IBB)) begin
                if (enableInput) begin
                    x <= $fscanf(fp_IBB,"%f",iSampleFloat);
                end
            end
            else begin
                //enableInput <= 0;
                $display("Out of if samples");
                $rewind(fp_IBB);
                #1 x <= $fscanf(fp_IBB,"%f",iSampleFloat);
            end
            if (! $feof(fp_QBB)) begin
                if (enableInput) begin
                    x <= $fscanf(fp_QBB,"%f",qSampleFloat);
                end
            end
            else begin
                //enableInput <= 0;
                $display("Out of if samples");
                $rewind(fp_QBB);
                #1 x <= $fscanf(fp_QBB,"%f",qSampleFloat);
            end
        end
    end
    reg     signed  [17:0]  iSample;
    initial                 iSample = 0;
    always @(posedge clk) begin
        if (!enableInput) begin
            iSample <= 0;
        end
        else if (clkEnable) begin
            if (iSampleFloat >= 1.0) begin
                iSample <= $signed(18'h1ffff);
            end
            else if (iSampleFloat <= -1.0) begin
                iSample <= $signed(18'h20001);
            end
            else begin
                iSample <= $rtoi((2**17)*iSampleFloat);
            end
        end
    end
    reg     signed  [17:0]  qSample;
    initial                 qSample = 0;
    always @(posedge clk) begin
        if (!enableInput) begin
            qSample <= 0;
        end
        `ifdef ROTATE_90
        else if (clkEnable) begin
            if (qSampleFloat >= 1.0) begin
                qSample <= $signed(18'h20001);
            end
            else if (qSampleFloat <= -1.0) begin
                qSample <= $signed(18'h1ffff);
            end
            else begin
                qSample <= $rtoi(-(2**17)*qSampleFloat);
            end
        end
        `else
        else if (clkEnable) begin
            if (qSampleFloat >= 1.0) begin
                qSample <= $signed(18'h1ffff);
            end
            else if (qSampleFloat <= -1.0) begin
                qSample <= $signed(18'h20001);
            end
            else begin
                qSample <= $rtoi((2**17)*qSampleFloat);
            end
        end
        `endif
    end



    //************************** uP Interface *********************************
    `ifdef TRIPLE_DEMOD
        `include "upSpiTasks.v"
    `else
        `include "upBusTasks.v"
    `endif

    initial begin

        // Wait for the input samples to start
        while (!enableInput) begin
            @ (posedge clk) ;
        end

        // Set for inverse of 0.45 which is a smidge less than the AGC setpoint of 0.5 to
        // account for shaping filter losses.
        //write32(createAddress(`LDPCSPACE, `LDPC_INVERSE_MEAN), 32'h00018e39);
        //write32(createAddress(`LDPCSPACE, `LDPC_INVERSE_MEAN), 32'h00028000);
        //write32(createAddress(`LDPCSPACE, `LDPC_INVERSE_MEAN), 32'h00048000);
        write32(createAddress(`LDPCSPACE, `LDPC_INVERSE_MEAN), 32'h00008000);
        write32(createAddress(`LDPCSPACE, `LDPC_OUTPUT_CLK_DIV),32'd70);
        write32(createAddress(`LDPCSPACE, `LDPC_DLL_CENTER_FREQ),32'd51130563);
        write16(createAddress(`LDPCSPACE, `LDPC_DLL_GAINS),16'h0018);
        write16(createAddress(`LDPCSPACE, `LDPC_DLL_FDBK_DIV),16'd1);
        write32(createAddress(`LDPCSPACE, `LDPC_CONTROL),{1'b0,4'b0,11'd62,
                                                          10'b0,`LDPC_DERAND_NONE,`LDPC_CODE_LENGTH_1024,1'b0,`LDPC_RATE_4_5});
        // Wait 2 bit periods
        repeat (2*`CLOCKS_PER_BIT) @ (posedge clk) ;

        // Set the run bit
        write32(createAddress(`LDPCSPACE, `LDPC_CONTROL),{1'b1,4'b0,11'd62,
                                                          10'b0,`LDPC_DERAND_NONE,`LDPC_CODE_LENGTH_1024,1'b0,`LDPC_RATE_4_5});
        // Run the demod
        repeat (200000*`CLOCKS_PER_BIT) @ (posedge clk) ;

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
    ldpc #(.LDPCBITS(7)) ldpc(
        .clk(clk), .clkEn(clkEnable), .reset(reset),
        .busClk(busClk),
        .cs(cs),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(a),
        .din(d),
        .dout(),
        .iSymEn(iSymEn),
        .iSymData(iSample),
        .qSymEn(qSymEn),
        .qSymData(qSample),
        .ldpcBitEnOut(),
        .ldpcBitOut()
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
