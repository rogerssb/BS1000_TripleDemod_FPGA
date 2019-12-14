`include "stcDefines.vh"
`timescale 1ns/100ps

module trellisProcess (
    input                   clk186,
                            ClkTD,
                            clkEnable,
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
    input   signed  [3:0]   m_ndx0,
                            m_ndx1,
    input   signed  [5:0]   deltaTauEstIn,
    output  signed  [17:0]  sample0r,
                            sample0i,
    output  reg             outputEn,
    output                  interpOutEn,
                            lastSampleReset,
                            full,
    output  reg     [3:0]   outputBits
);


    //******************************* UUT *************************************

    //----------------------- Detection Filter --------------------------------
    wire            [47:0]  df_tdata;
    wire    signed  [17:0]  dfRealOutput = df_tdata[17+24:24],
                            dfImagOutput = df_tdata[17:0];
    DetectionFilter df (
        .aresetn(!reset),
        .aclk(clk186),
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
    sample relative to the start of the pilot samples. The alignment module does three things:

    1) It creates an interpolate signal that is aligned with the first sample
        of the block of 4 samples that define a bit period. This signal is used
        by the interpolate blocks.
    2) It buffers the sample burst and places idle time between the samples
        to keep from over-running the trellis detector.
    3) It creates a valid signal timed to be true starting with the last bit of
        the pilot and staying true for the duration of the frame.
    */
    wire    signed  [17:0]  faReal0,faImag0,faReal1,faImag1;
    reg                     estimatesDoneDly, myStartOfTrellisClr;
    wire                    myStartOfTrellis;

    always @(posedge clk186) begin
        estimatesDoneDly    <= estimatesDone;
        myStartOfTrellisClr <= myStartOfTrellis;
        if (estimatesDoneDly) begin
            h0EstReal   <= h0EstRealIn;
            h0EstImag   <= h0EstImagIn;
            h1EstReal   <= h1EstRealIn;
            h1EstImag   <= h1EstImagIn;
            deltaTauEst <= deltaTauEstIn;
            ch0Mu       <= ch0MuIn;
            ch1Mu       <= ch1MuIn;
        end
    end

    integer SPARE_CODE_WORDS = 1; // first output is bogus
    assign  lastSampleReset = (sampleOut == `CODEWORDS_PER_FRAME + SPARE_CODE_WORDS);

    frameAlignment #(
        .CLKS_PER_OUTPUT(2))
    fa(
        .clk(clk186),
        .clkEn(clkEnable),
        .reset(reset),
        .startOfFrame(frameStart),
        .estimatesDone(estimatesDoneDly),
        .tdFifoFull(tdFifoFull),
        .valid(dfValid),
        .dinReal(dfRealOutput),
        .dinImag(dfImagOutput),
        .m_ndx0(m_ndx0),
        .m_ndx1(m_ndx1),
        .clkEnOut(faClkEn),
        .myStartOfTrellis(myStartOfTrellis),
        .full(full),
        .interpolate(interpolate),
        .doutReal0(faReal0),
        .doutImag0(faImag0),
        .doutReal1(faReal1),
        .doutImag1(faImag1)
    );

    //------------------------- Interpolators ---------------------------------

    interpolator ch0r(
        .clk(clk186),
        .clkEn(1'b1),
        .reset(reset || myStartOfTrellis),
        .interpolate(faClkEn & interpolate),
        .mu(ch0Mu),
        .inputEn(faClkEn),
        .din(faReal0),
        .outputEn(interpOutEn),
        .dout(sample0r)
    );

    interpolator ch0i(
        .clk(clk186),
        .clkEn(1'b1),
        .reset(reset || myStartOfTrellis),
        .interpolate(faClkEn & interpolate),
        .mu(ch0Mu),
        .inputEn(faClkEn),
        .din(faImag0),
        .outputEn(),
        .dout(sample0i)
    );

    wire    signed      [17:0]  sample1r;
    interpolator ch1r(
        .clk(clk186),
        .clkEn(1'b1),
        .reset(reset || myStartOfTrellis),
        .interpolate(faClkEn & interpolate),
        .mu(ch1Mu),
        .inputEn(faClkEn),
        .din(faReal1),
        .outputEn(),
        .dout(sample1r)
    );
    wire    signed      [17:0]  sample1i;
    interpolator ch1i(
        .clk(clk186),
        .clkEn(1'b1),
        .reset(reset || myStartOfTrellis),
        .interpolate(faClkEn & interpolate),
        .mu(ch1Mu),
        .inputEn(faClkEn),
        .din(faImag1),
        .outputEn(),
        .dout(sample1i)
    );

    wire    [72:0]  tdFifoOut;
    wire    [17:0]  tdSample0i, tdSample0r, tdSample1i, tdSample1r;
    reg             rdFifo;

    tdFifo tdFifo_u (
      .rst(reset),
      .wr_clk(clk186),
      .rd_clk(ClkTD),
      .din({myStartOfTrellis, sample1i, sample1r, sample0i, sample0r}),
      .wr_en(interpOutEn || myStartOfTrellis || myStartOfTrellisClr),
      .rd_en(rdFifo),
      .dout(tdFifoOut),
      .full(realFull),
      .empty(fifoEmpty),
      .prog_full(tdFifoFull)
    );

    assign tdSample1i = tdFifoOut[71:54];
    assign tdSample1r = tdFifoOut[53:36];
    assign tdSample0i = tdFifoOut[35:18];
    assign tdSample0r = tdFifoOut[17:0];
    wire   tdStartOfTrellis = tdFifoOut[72];

    //------------------------- Trellis Detector ------------------------------
  (* MARK_DEBUG="true" *)   wire [3:0]   tdOutputBits;
    reg  tdStartOfTrellisDly;

    trellisDetector td(
        .clk(ClkTD),
        .clkEn(1'b1),
        .reset(reset || lastSampleReset),
        .sampleEn(rdFifo && !tdStartOfTrellisDly),
        .startFrame(tdStartOfTrellis && !tdStartOfTrellisDly),  // tdStartOfTrellis is too wide
        .in0Real(tdSample0r), .in0Imag(tdSample0i),
        .in1Real(tdSample1r), .in1Imag(tdSample1i),
        .deltaTauEst(deltaTauEst),
        .h0EstReal(h0EstReal), .h0EstImag(h0EstImag),
        .h1EstReal(h1EstReal), .h1EstImag(h1EstImag),
        .finalMetricOutputEn(),
        .finalMetric(),
        .outputEn(tdOutputEn),
        .outputBits(tdOutputBits)
    );

    reg [4:0]   ClockCntr;

    always @(posedge ClkTD) begin
        if (reset) begin
            tdStartOfTrellisDly <= 0;
        end
        else if (tdStartOfTrellis) begin
            tdStartOfTrellisDly <= 1;
        end
        else if (rdFifo) begin
            tdStartOfTrellisDly <= 0;
        end

        if (reset) begin
            ClockCntr <= 0;
        end
        else if (ClockCntr < 6) begin // do a read every 7 clocks if data available. 7 x 4 samples/bit is 28 clocks per trellis cycle
            ClockCntr <= ClockCntr + 1;
            rdFifo    <= 0;
        end
        else begin
            ClockCntr <= 0;
            rdFifo    <= !fifoEmpty;
        end

        if (reset || tdStartOfTrellis || lastSampleReset) begin
            sampleOut <= 0;
        end
        else if (tdOutputEn) begin
            sampleOut <= sampleOut+ 1;
        end

        if ((sampleOut >= SPARE_CODE_WORDS) && (sampleOut < `CODEWORDS_PER_FRAME + SPARE_CODE_WORDS)) begin        // skip first trellis output
            outputEn <= tdOutputEn;
        end
        else begin
            outputEn <= 0;
        end

        if (reset) begin
            outputBits <= 0;
        end
        else if (tdOutputEn) begin
            outputBits <= tdOutputBits;
        end
    end

endmodule

