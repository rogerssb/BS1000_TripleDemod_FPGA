`include "defines.v"
`timescale 1ns/100ps


`define ADD_TRELLIS_DETECTOR


module test;
    parameter CLOCK_FREQ = 186.6666667e6;
    parameter HC = 1e9/CLOCK_FREQ/2;
    parameter C = 2*HC;
    parameter CLOCK_DECIMATION = 1;

    reg     reset;
    initial reset = 0;

    // Create the clocks
    reg     clk;
    initial clk = 1;
    reg     clken;
    always #HC clk = clk^clken;
    `define CLOCK_PERIOD   (C*1e-9)


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

    integer                 fp_sampleReal,fp_sampleImag,fp_start,fp_valid;
    real                    sampleReal,sampleImag,sampleStart,sampleValid;
    initial begin
        fp_sampleReal = $fopen("c:/modem/telemetry/stcDemod/test_data/Brik1_out_r_0.txt","r");
        fp_sampleImag = $fopen("c:/modem/telemetry/stcDemod/test_data/Brik1_out_i_0.txt","r");
        fp_start =      $fopen("c:/modem/telemetry/stcDemod/test_data/Brik1_out_s_0.txt","r");
        fp_valid =      $fopen("c:/modem/telemetry/stcDemod/test_data/Brik1_out_v_0.txt","r");
    end
    always @(posedge clk) begin
        if (clkEnable) begin
            if (! $feof(fp_sampleReal)) begin
                if (enableInput) begin
                    x <= $fscanf(fp_sampleReal,"%f",sampleReal);
                end
            end
            else begin
                enableInput <= 0;
                $display("Out of real samples");
            end
            if (! $feof(fp_sampleImag)) begin
                if (enableInput) begin
                    x <= $fscanf(fp_sampleImag,"%f",sampleImag);
                end
            end
            else begin
                enableInput <= 0;
                $display("Out of imaginary samples");
            end
            if (! $feof(fp_start)) begin
                if (enableInput) begin
                    x <= $fscanf(fp_start,"%f",sampleStart);
                end
            end
            else begin
                enableInput <= 0;
                $display("Out of start samples");
            end
            if (! $feof(fp_valid)) begin
                if (enableInput) begin
                    x <= $fscanf(fp_valid,"%f",sampleValid);
                end
            end
            else begin
                enableInput <= 0;
                $display("Out of valid samples");
            end
        end
    end
    reg     signed  [17:0]  inputSampleReal,inputSampleImag;
    initial                 inputSampleReal = 0;
    initial                 inputSampleImag = 0;
    reg                     inputStart,inputValid;
    always @(posedge clk) begin
        if (!enableInput) begin
            inputSampleReal <= 0; 
        end
        else if (clkEnable) begin
            if (sampleReal >= 1.0) begin
                inputSampleReal <= $signed(18'h1ffff);
            end
            else if (sampleReal <= -1.0) begin
                inputSampleReal <= $signed(18'h20001);
            end
            else begin
                inputSampleReal <= $rtoi((2**17)*sampleReal);
            end
        end
        if (!enableInput) begin
            inputSampleImag <= 0; 
        end
        else if (clkEnable) begin
            if (sampleImag >= 1.0) begin
                inputSampleImag <= $signed(18'h1ffff);
            end
            else if (sampleImag <= -1.0) begin
                inputSampleImag <= $signed(18'h20001);
            end
            else begin
                inputSampleImag <= $rtoi((2**17)*sampleImag);
            end
        end
        if (!enableInput) begin
            inputStart <= 0; 
        end
        else if (clkEnable) begin
            if (sampleStart > 0.0) begin
                inputStart <= 1;
            end
            else begin
                inputStart <= 0;
            end
        end
        if (!enableInput) begin
            inputValid <= 0; 
        end
        else if (clkEnable) begin
            if (sampleValid > 0.0) begin
                inputValid <= 1;
            end
            else begin
                inputValid <= 0;
            end
        end
    end

    //******************************* UUT *************************************

    //----------------------- Detection Filter --------------------------------
    wire            [39:0]  dfReal_tdata;
    wire    signed  [17:0]  dfRealOutput = dfReal_tdata[37:20];
    detectionFilter dfReal(
        .aclk(clk), 
        .aclken(clkEnable), 
        .aresetn(!reset), 
        .s_axis_data_tvalid(inputValid), 
        .s_axis_data_tready(), 
        .s_axis_data_tdata({6'b0,inputSampleReal}), 
        .m_axis_data_tvalid(dfValid), 
        .m_axis_data_tdata(dfReal_tdata)
    );
    wire            [39:0]  dfImag_tdata;
    wire    signed  [17:0]  dfImagOutput = dfImag_tdata[37:20];
    detectionFilter dfImag(
        .aclk(clk), 
        .aclken(clkEnable), 
        .aresetn(!reset), 
        .s_axis_data_tvalid(inputValid), 
        .s_axis_data_tready(), 
        .s_axis_data_tdata({6'b0,inputSampleImag}), 
        .m_axis_data_tvalid(), 
        .m_axis_data_tdata(dfImag_tdata)
    );

    //------------------------- Start Pulse Alignment -------------------------
    /*
    The start pulse coming from the pilot detector falls between 512 sample 
    bursts. It indicates that the first sample of the next burst is a specific
    sample relative to the start of the pilot samples. This sample's index is 
    defined by START_OFFSET. The alignment module does three things:

    1) It creates an interpolate signal that is aligned with the first sample 
        of the block of 4 samples that define a bit period. This signal is used
        by the interpolate blocks.
    2) It buffers the sample burst and places idle time between the samples
        to keep from over-running the trellis detector.
    3) It creates a valid signal timed to be true starting with the last bit of
        the pilot and staying true for the duration of the frame.
    */
    wire    signed  [17:0]  faReal,faImag;
    frameAlignment #(
        .START_OFFSET(0), 
        .CLKS_PER_OUTPUT(4)) 
    fa(
        .clk(clk),
        .clkEn(clkEnable),
        .reset(reset),
        .start(inputStart),
        .valid(dfValid),
        .dinReal(dfRealOutput),
        .dinImag(dfImagOutput),
        .clkEnOut(faClkEn),
        .interpolate(interpolate),
        .doutReal(faReal),
        .doutImag(faImag)
    );


    //-------------------------- Estimators -----------------------------------

    `define USE_FIXED_ESTIMATES
    `ifdef USE_FIXED_ESTIMATES
    wire    signed  [17:0]  h0EstReal,h0EstImag;
    assign                  h0EstReal = 18'h10000;  // 1.0 + j0.0
    assign                  h0EstImag = 18'h00000;  
    wire    signed  [17:0]  h1EstReal,h1EstImag;
    assign                  h1EstReal = 18'h10000;  // 1.0 + j0.0
    assign                  h1EstImag = 18'h00000;
    wire    signed  [5:0]   deltaTauEst;
    assign                  deltaTauEst = 6'h00;
    wire            [17:0]  ch0Mu,ch1Mu;
    assign                  ch0Mu = 18'h00000;
    assign                  ch1Mu = 18'h00000;
    `else
    `endif

    //------------------------- Interpolators ---------------------------------

    wire    signed      [17:0]  sample0r;
    interpolator ch0r(
        .clk(clk),
        .clkEn(1'b1),
        .reset(reset),
        .interpolate(faClkEn & interpolate),
        .mu(ch0Mu),
        .inputEn(faClkEn),
        .din(faReal),
        .outputEn(interpOutEn),
        .dout(sample0r)
    );
    wire    signed      [17:0]  sample0i;
    interpolator ch0i(
        .clk(clk),
        .clkEn(1'b1),
        .reset(reset),
        .interpolate(faClkEn & interpolate),
        .mu(ch0Mu),
        .inputEn(faClkEn),
        .din(faImag),
        .outputEn(),
        .dout(sample0i)
    );

    wire    signed      [17:0]  sample1r;
    interpolator ch1r(
        .clk(clk),
        .clkEn(1'b1),
        .reset(reset),
        .interpolate(faClkEn & interpolate),
        .mu(ch1Mu),
        .inputEn(faClkEn),
        .din(faReal),
        .outputEn(),
        .dout(sample1r)
    );
    wire    signed      [17:0]  sample1i;
    interpolator ch1i(
        .clk(clk),
        .clkEn(1'b1),
        .reset(reset),
        .interpolate(faClkEn & interpolate),
        .mu(ch1Mu),
        .inputEn(faClkEn),
        .din(faImag),
        .outputEn(),
        .dout(sample1i)
    );

    `ifdef ADD_TRELLIS_DETECTOR
    //------------------------- Trellis Detector ------------------------------

    wire                [3:0]   tdBits;
    trellisDetector td(
        .clk(clk), 
        .clkEn(1'b1),
        .reset(reset),
        .sampleEn(interpOutEn),
        .startFrame(inputStart),
        .in0Real(sample0r), .in0Imag(sample0i), 
        .in1Real(sample1r), .in1Imag(sample1i),
        .deltaTauEst(deltaTauEst),
        .h0EstReal(h0EstReal), .h0EstImag(h0EstImag), 
        .h1EstReal(h1EstReal), .h1EstImag(h1EstImag),
        .finalMetricOutputEn(),
        .finalMetric(),
        .outputEn(tdOutEn),
        .outputBits(tdBits)
    );
    `endif




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

