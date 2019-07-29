`include "stcDefines.vh"
`timescale 1ns/100ps


`define ADD_TRELLIS_DETECTOR


module test;
    parameter CLOCK_FREQ = 186.6666667e6;
    parameter HC = 1e9/CLOCK_FREQ/4;
    parameter C = 2*HC;
    parameter CLOCK_DECIMATION = 1;

    reg     reset;
    initial reset = 0;

    // Create the clocks
    reg     clk, clk2x;
    initial clk = 1;
    initial clk2x = 1;
    reg     clken;
    always #HC clk2x = clk2x^clken;
    `define CLOCK_PERIOD   (C*1e-9)


    reg     clkEnable;
    initial clkEnable = 0;
    integer clkCount;
    initial clkCount = 0;
    always @(posedge clk2x) begin
        clk <= !clk;
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
        fp_sampleReal = $fopen("C:/Semco/STCinfo/RealTimeC/SpaceTimeCodeInC/SpaceTimeCodeInC/Iseed12345678R_0Hz_50dB_50Percent.txt","r");
        fp_sampleImag = $fopen("C:/Semco/STCinfo/RealTimeC/SpaceTimeCodeInC/SpaceTimeCodeInC/Iseed12345678I_0Hz_50dB_50Percent.txt","r");
        fp_start =      $fopen("C:/Semco/STCinfo/RealTimeC/SpaceTimeCodeInC/SpaceTimeCodeInC/Iseed12345678S_0Hz_50dB_50Percent.txt","r");
        fp_valid =      $fopen("C:/Semco/STCinfo/RealTimeC/SpaceTimeCodeInC/SpaceTimeCodeInC/Iseed12345678V_0Hz_50dB_50Percent.txt","r");
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

    `define USE_FIXED_ESTIMATES
    `ifdef USE_FIXED_ESTIMATES
    reg     signed  [17:0]  h0EstReal,h0EstImag;
    reg     signed  [17:0]  h1EstReal,h1EstImag;
    reg     signed  [5:0]   deltaTauEst;
    reg             [17:0]  ch0Mu,ch1Mu;
    `else
    `endif

    //******************************* UUT *************************************

    trellisProcess tp (
        .clk(clk),
        .clk2x(clk2x),
        .clkEnable(clkEnable),
        .reset(reset),
        .frameStart(inputStart),
        .inputValid(inputValid),
        .estimatesDone(estimatesDone),
        .dinReal(inputSampleReal),
        .dinImag(inputSampleImag),
        .h0EstRealIn(h0EstReal),
        .h0EstImagIn(h0EstImag),
        .h1EstRealIn(h1EstReal),
        .h1EstImagIn(h1EstImag),
        .ch0MuIn(ch0Mu),
        .ch1MuIn(ch1Mu),
        .deltaTauEstIn(deltaTauEst),
        .sample0r(),
        .sample0i(),
        .outputEn(),
        .interpOutEn(),
        .outputBits()
    );


    //----------------------- Detection Filter --------------------------------
    wire            [47:0]  df_tdata;
    wire    signed  [17:0]  dfRealOutput = df_tdata[17+24:24],
                            dfImagOutput = df_tdata[17:0];
    DetectionFilter df (
        .aresetn(!reset),
        .aclk(clk),
        .aclken(clkEnable),
        .s_axis_data_tvalid(inputValid),                                        // input wire s_axis_data_tvalid
        .s_axis_data_tready(),                                                  // output wire s_axis_data_tready
        .s_axis_data_tdata({6'b0, inputSampleReal, 6'b0, inputSampleImag}),     // input wire [47 : 0] s_axis_data_tdata
        .m_axis_data_tvalid(dfValid),                                           // output wire m_axis_data_tvalid
        .m_axis_data_tdata(df_tdata)                                            // output wire [47 : 0] m_axis_data_tdata
    );

    //-------------------------- Estimators -----------------------------------

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
    reg             [14:0]  sampleInFrame;
    reg             [11:0]  sampleOut;

    assign  estimatesDone = (sampleInFrame == 5600);
    wire    myStartOfTrellis;

    always @(posedge clk) begin
        if (inputStart) begin
            sampleInFrame <= 0;
//            h0EstReal   <= 18'h0;  // -0.5 + j0.0
//            h0EstImag   <= 18'h0;
//            h1EstReal   <= 18'h0;  //-0.50 + j0.0
//            h1EstImag   <= 18'h0;
//            deltaTauEst <= 6'h0;
//            ch0Mu       <= 18'h0;
//            ch1Mu       <= 18'h0;
        end
        else if (dfValid) begin
            sampleInFrame <= sampleInFrame + 1;
        end

        if (estimatesDone) begin
            h0EstReal   <= 18'h30000;  // -0.5 + j0.0
            h0EstImag   <= 18'h00000;
            h1EstReal   <= 18'h30000;  //-0.50 + j0.0
            h1EstImag   <= 18'h00000;
            deltaTauEst <= 6'h00;
            ch0Mu       <= 18'h00000;
            ch1Mu       <= 18'h00000;
        end
    end

    frameAlignment #(
        .START_OFFSET(0),
        .CLKS_PER_OUTPUT(4))
    fa(
        .clk(clk),
        .clk2x(clk2x),
        .clkEn(clkEnable),
        .reset(reset),
        .startOfFrame(inputStart),
        .estimatesDone(estimatesDone),
        .sampleOut(sampleOut),
        .valid(dfValid),
        .dinReal(dfRealOutput),
        .dinImag(dfImagOutput),
        .clkEnOut(faClkEn),
        .myStartOfTrellis(myStartOfTrellis),
        .interpolate(interpolate),
        .doutReal(faReal),
        .doutImag(faImag)
    );

    //------------------------- Interpolators ---------------------------------

    wire    signed      [17:0]  sample0r;
    interpolator ch0r(
        .clk(clk2x),
        .clkEn(1'b1),
        .reset(myStartOfTrellis),
        .interpolate(faClkEn & interpolate),
        .mu(ch0Mu),
        .inputEn(faClkEn),
        .din(faReal),
        .outputEn(interpOutEn),
        .dout(sample0r)
    );
    wire    signed      [17:0]  sample0i;
    interpolator ch0i(
        .clk(clk2x),
        .clkEn(1'b1),
        .reset(myStartOfTrellis),
        .interpolate(faClkEn & interpolate),
        .mu(ch0Mu),
        .inputEn(faClkEn),
        .din(faImag),
        .outputEn(),
        .dout(sample0i)
    );

    wire    signed      [17:0]  sample1r;
    interpolator ch1r(
        .clk(clk2x),
        .clkEn(1'b1),
        .reset(myStartOfTrellis),
        .interpolate(faClkEn & interpolate),
        .mu(ch1Mu),
        .inputEn(faClkEn),
        .din(faReal),
        .outputEn(),
        .dout(sample1r)
    );
    wire    signed      [17:0]  sample1i;
    interpolator ch1i(
        .clk(clk2x),
        .clkEn(1'b1),
        .reset(myStartOfTrellis),
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
        .clk(clk2x),
        .clkEn(1'b1),
        .reset(reset),
        .sampleEn(interpOutEn),
        .startFrame(myStartOfTrellis),
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

    always @(posedge clk2x) begin
        if (myStartOfTrellis) begin
            sampleOut <= 0;
        end
        else if (tdOutEn) begin
            sampleOut <= sampleOut+ 1;
        end
    end


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
    always @(posedge clk) begin
        if (enableInput) begin
            if (clkEnable) begin
                sampleCount <= sampleCount + 1;
            end
        end
    end

endmodule

