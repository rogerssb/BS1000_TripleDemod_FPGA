`include "stcDefines.vh"
`timescale 1ns/100ps

module test;

    reg     reset;
    initial reset = 0;
    reg     clk;
    initial clk = 0;

    // Create the clocks
    parameter CLOCK_FREQ = 186.6666667e6;
    parameter HC = 1e9/CLOCK_FREQ/2;
    parameter C = 2*HC;
    reg clken;
    always #HC clk = clk^clken;
    `define CLOCK_PERIOD   (C*1e-9)

    parameter CLOCK_DECIMATION = 4;

    reg     clkEnable;
    integer clkCount;
    always @(posedge clk) begin
        if (reset) begin
            clkCount <= 0;
            clkEnable <= 1;
        end
        else if (clkCount == CLOCK_DECIMATION-1) begin
            clkCount <= 0;
            clkEnable <= 1;
        end
        else begin
            clkCount <= clkCount + 1;
            clkEnable <= 0;
        end
    end

    reg     startFrame;         // Used to start a frame
    initial startFrame = 0;

    reg     sampleEn;           // Used to enable a sample input
    initial sampleEn = 0;

    reg     interpolate;        // Used to start an interpolation
    initial interpolate = 0;

    //*********************** File Input Test Vectors *************************
    reg     enableInput;        // Used to start and stop input vectors
    initial enableInput = 0;

    integer         x;          // Used as a dummy for fileio return values.

    integer                 fp_mu;
    initial begin
        fp_mu = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/mu.txt","r");
    end
    real                    muReal;
    reg             [17:0]  mu;
    always @(posedge startFrame) begin
        if (! $feof(fp_mu)) begin
            if (enableInput) begin
                x <= $fscanf(fp_mu,"%f",muReal);
            end
        end
        else begin
            enableInput <= 0;
            $display("Out of mu");
        end
    end
    always @(negedge clk) begin
        if (clkEnable) begin
            if (startFrame) begin
                mu <= $rtoi((2**18)*muReal);
            end
        end
    end

    integer fp_s0r,fp_s0i;
    integer fp_s1r,fp_s1i;
    initial begin
        fp_s0r = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/sig_0_r.txt","r");
    end
    real                    s0rReal,s0iReal;
    real                    s1rReal,s1iReal;
    always @(posedge clk) begin
        if (clkEnable) begin
            if (startFrame || sampleEn) begin
                if (! $feof(fp_s0r)) begin
                    if (enableInput) begin
                        x = $fscanf(fp_s0r,"%f",s0rReal);
                    end
                end
                else begin
                    enableInput <= 0;
                    $display("Out of s0r");
                end
            end
        end
    end
    reg     signed  [17:0]  s0r,s0i,s1r,s1i;
    always @(negedge clk) begin
        if (clkEnable) begin
            if (sampleEn) begin
                s0r = $rtoi((2**15)*s0rReal);
            end
        end
    end

    always @(posedge clk) begin
        if (clkEnable) begin
            if (startFrame) begin
                $display("\tmu = %f/0x%02x",
                    muReal,mu
                );
            end
        end
    end

    //******************************* UUT *************************************

    wire    signed      [17:0]  sample0r;
    interpolator uut(
        .clk(clk),
        .clkEn(clkEnable),
        .reset(reset),
        .interpolate(interpolate),
        .mu(mu),
        .inputEn(sampleEn),
        .din(s0r),
        .outputEn(outputEn),
        .dout(sample0r)
    );

    initial begin
        clken <= 1;

        // Wait 10 clks
        repeat (10) @ (posedge clk) ;

        reset <= 1;
        repeat (10) @ (posedge clk) ;
        reset <= 0;

        enableInput <= 1;
        @ (posedge clk) ;
        while (enableInput) begin
            @ (posedge clk) ;
        end

        $stop;

    end

    integer         sampleCount;
    wire    [31:0]  sampleCountWire = sampleCount;
    always @(posedge clk) begin
        if (clkEnable) begin
            if (!enableInput) begin
                startFrame <= 0;
                sampleEn <= 0;
                sampleCount <= `PILOT_BITS_PER_FRAME*`SAMPLES_PER_BIT - 256;
            end
            else if (sampleCount < `SAMPLES_PER_FRAME-1) begin
                sampleCount <= sampleCount + 1;
            end
            else begin
                sampleCount <= 0;
            end

            startFrame <= (sampleCount == `PILOT_BITS_PER_FRAME*`SAMPLES_PER_BIT - 128);

            if (sampleCount >= (`PILOT_BITS_PER_FRAME*`SAMPLES_PER_BIT - 4)) begin
                sampleEn <= 1;
            end
            else begin
                sampleEn <= 0;
            end

            if (sampleCount >= (`PILOT_BITS_PER_FRAME*`SAMPLES_PER_BIT - 4)) begin
                interpolate <= (sampleCountWire[1] && sampleCountWire[0]);
            end
            else begin
                interpolate <= 0;
            end

        end
    end

endmodule

