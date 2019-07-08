`include "stcDefines.vh"
`timescale 1ns/100ps

module trellisProcess (
    input                   clk,
                            clk2x,
                            reset,
                            frameStart,
                            inputValid,
                            estimatesDone,
    input   signed  [17:0]  dinReal,
                            dinImag,
                            h0EstRealIn,
                            h0EstImagIn,
                            h1EstRealIn,
                            h1EstImagIn,
                            ch0MuIn,
                            ch1MuIn,
    input   signed  [5:0]   deltaTauEstIn,
    output  signed  [17:0]  sample0r,
                            sample0i,
    output                  outputEn,
    output          [3:0]   outputBits
);


    //******************************* UUT *************************************

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
        .s_axis_data_tdata({6'b0, dinReal, 6'b0, dinImag}),     // input wire [47 : 0] s_axis_data_tdata
        .m_axis_data_tvalid(dfValid),                                           // output wire m_axis_data_tvalid
        .m_axis_data_tdata(df_tdata)                                            // output wire [47 : 0] m_axis_data_tdata
    );

    //-------------------------- Estimators -----------------------------------

    reg     signed  [17:0]  h0EstReal,h0EstImag;
    reg     signed  [17:0]  h1EstReal,h1EstImag;
    reg     signed  [5:0]   deltaTauEst;
    reg             [17:0]  ch0Mu,ch1Mu;
    reg             [11:0]  sampleOut;

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

    always @(posedge clk) begin
    `ifdef USE_FIXED_ESTIMATES
        h0EstReal   <= 18'h1ffff;  // 1.0 + j0.0
        h0EstImag   <= 18'h00000;
        h1EstReal   <= 18'h00000;  // 0.0 + j0.0
        h1EstImag   <= 18'h00000;
        deltaTauEst <= 6'h0;
        ch0Mu       <= 18'h0;
        ch1Mu       <= 18'h0;
    `else
        if (estimatesDone) begin
            h0EstReal   <= h0EstRealIn;
            h0EstImag   <= h0EstImagIn;
            h1EstReal   <= h1EstRealIn;
            h1EstImag   <= h1EstImagIn;
            deltaTauEst <= deltaTauEstIn;
            ch0Mu       <= ch0MuIn;
            ch1Mu       <= ch1MuIn;
        end
    `endif
    end

    frameAlignment #(
        .START_OFFSET(0),
        .CLKS_PER_OUTPUT(4))
    fa(
        .clk(clk),
        .clk2x(clk2x),
        .clkEn(clkEnable),
        .reset(reset),
        .startOfFrame(frameStart),
        .estimatesDone(estimatesDone),
        .sampleOut(sampleOut),
        .valid(dfValid),
        .dinReal(dfRealOutput),
        .dinImag(dfImagOutput),
        .clkEnOut(faClkEn),
        .interpolate(interpolate),
        .myStartOfTrellis(myStartOfTrellis),
        .doutReal(faReal),
        .doutImag(faImag)
    );

    //------------------------- Interpolators ---------------------------------

    interpolator ch0r(
        .clk(clk2x),
        .clkEn(1'b1),
        .reset(estimatesDone),
        .interpolate(faClkEn & interpolate),
        .mu(ch0Mu),
        .inputEn(faClkEn),
        .din(faReal),
        .outputEn(interpOutEn),
        .dout(sample0r)
    );

    interpolator ch0i(
        .clk(clk2x),
        .clkEn(1'b1),
        .reset(estimatesDone),
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
        .reset(estimatesDone),
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
        .reset(estimatesDone),
        .interpolate(faClkEn & interpolate),
        .mu(ch1Mu),
        .inputEn(faClkEn),
        .din(faImag),
        .outputEn(),
        .dout(sample1i)
    );

    //------------------------- Trellis Detector ------------------------------

    trellisDetector td(
        .clk(clk2x),
        .clkEn(1'b1),
        .reset(reset),
        .sampleEn(interpOutEn),
        .startFrame(estimatesDone),
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

    always @(posedge clk2x) begin
        if (myStartOfTrellis) begin
            sampleOut <= 0;
        end
        else if (tdOutEn) begin
            sampleOut <= sampleOut+ 1;
        end
    end

endmodule

