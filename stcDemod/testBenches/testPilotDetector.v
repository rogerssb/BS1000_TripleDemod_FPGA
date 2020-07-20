`include "stcDefines.vh"
`timescale 1ns/100ps

module test;
    parameter CLOCK_FREQ = 186.6666667e6;
    parameter HC = 1e9/CLOCK_FREQ/2;
    parameter C = 2*HC;
    parameter CLOCK_DECIMATION = 2;

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

    integer                 fp_ifSamples;
    real                    ifSampleReal;
    initial begin
        fp_ifSamples = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/ifSamples.txt","r");
        //fp_ifSamples = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/input_r_latest.txt","r");
    end
    always @(posedge clk) begin
        if (clkEnable) begin
            if (! $feof(fp_ifSamples)) begin
                if (enableInput) begin
                    x <= $fscanf(fp_ifSamples,"%f",ifSampleReal);
                end
            end
            else begin
                enableInput <= 0;
                $display("Out of ifSamples");
            end
        end
    end
    reg     signed  [17:0]  ifSample;
    initial                 ifSample = 0;
    always @(posedge clk) begin
        if (!enableInput) begin
            ifSample <= 0;
        end
        else if (clkEnable) begin
            if (ifSampleReal >= 1.0) begin
                ifSample <= $signed(18'h1ffff);
            end
            else if (ifSampleReal <= -1.0) begin
                ifSample <= $signed(18'h20001);
            end
            else begin
                ifSample <= $rtoi((2**17)*ifSampleReal);
            end
        end
    end

    //******************************* UUT *************************************

    wire    signed  [17:0]  feReal,feImag;
    fixedFrontend fe(
        .clk(clk),
        .validin(clkEnable),
        .a2d_data(ifSample),
        .fe_real(feReal),
        .fe_imag(feImag),
        .fe_valid(feValid)
    );

    wire            [8:0]   pilotIndex;
    wire    signed  [17:0]  pilotReal,pilotImag;
    pilotDetection pd(
        .clk(clk),
        .conj_imag(1'b0),
        .validpilot(feValid),
        .realdata(feReal),
        .imagdata(feImag),
        .pilot_found(pilotFound),
        .pilot_indexes(pilotIndex),
        .pilot_pulse(pilotPulse),
        .validpilotout(pilotValid),
        .realpilotout(pilotReal),
        .imagpilotout(pilotImag),
        .pilot_mag()
    );

    wire    signed  [17:0]  psReal,psImag;
    PilotSync ps(
        .clk(clk),
        .reset(reset),
        .ce(1'b1),
        .PilotPulseIn(pilotPulse),
        .ValidIn(pilotValid),
        .IndexIn({2'b0,pilotIndex}),
        .RealIn(pilotReal),
        .ImagIn(pilotImag),
        .RealOut(psReal),
        .ImagOut(psImag),
        .StartOut(psStart),
        .ValidOut(psValid)
    );

    initial begin
        clken <= 1;

        // Wait 10 clks
        repeat (6) @ (posedge clk) ;

        reset <= 1;
        repeat (8) @ (posedge clk) ;
        reset <= 0;

        repeat (341*CLOCK_DECIMATION) @ (negedge clk) ;
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
    integer         fp_real;
    initial         fp_real = $fopen("realSamples.txt","w");
    integer         fp_imag;
    initial         fp_imag = $fopen("imagSamples.txt","w");
    integer         fp_start;
    initial         fp_start = $fopen("startSamples.txt","w");
    integer         fp_valid;
    initial         fp_valid = $fopen("validSamples.txt","w");
    always @(posedge clk) begin
        if (clkEnable) begin
            if (enableInput) begin
                sampleCount <= sampleCount + 1;
                if (sampleCount > 60000) begin
                    $fwrite(fp_real,"%9.7f\n",$itor(psReal)/(2**17));
                    $fflush(fp_real);
                    $fwrite(fp_imag,"%9.7f\n",$itor(psImag)/(2**17));
                    $fflush(fp_imag);
                    $fwrite(fp_start,"%9.7f\n",psStart ? 1.0 : 0.0);
                    $fflush(fp_start);
                    $fwrite(fp_valid,"%9.7f\n",psValid ? 1.0 : 0.0);
                    $fflush(fp_valid);
                end
            end
        end
    end

endmodule

