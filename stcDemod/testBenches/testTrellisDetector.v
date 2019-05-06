`include "defines.v"
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

    //*********************** File Input Test Vectors *************************
    reg     enableInput;        // Used to start and stop input vectors
    initial enableInput = 0;

    integer         x;          // Used as a dummy for fileio return values.

    integer                 fp_tau;
    initial begin
        fp_tau = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/delta_tau_est.txt","r");
    end
    real                    tauReal;
    reg     signed  [5:0]   tau;
    always @(posedge startFrame) begin
        if (! $feof(fp_tau)) begin
            if (enableInput) begin
                x <= $fscanf(fp_tau,"%f",tauReal);
            end
        end
        else begin
            enableInput <= 0;
            $display("Out of tau");
        end
    end
    always @(negedge clk) begin
        if (clkEnable) begin
            if (startFrame) begin
                tau <= $rtoi((2**5)*tauReal);
            end
        end
    end

    integer         fp_h0r,fp_h0i;
    integer         fp_h1r,fp_h1i;
    initial begin
        fp_h0r = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/h_0_r.txt","r");
        fp_h0i = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/h_0_i.txt","r");
        fp_h1r = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/h_1_r.txt","r");
        fp_h1i = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/h_1_i.txt","r");
    end
    real            h0rReal,h0iReal;
    real            h1rReal,h1iReal;
    always @(posedge startFrame) begin
        if (! $feof(fp_h0r)) begin
            if (enableInput) begin
                x = $fscanf(fp_h0r,"%f",h0rReal);
            end
        end
        else begin
            enableInput <= 0;
            $display("Out of h0r");
        end
        if (! $feof(fp_h0i)) begin
            if (enableInput) begin
                x = $fscanf(fp_h0i,"%f",h0iReal);
            end
        end
        else begin
            enableInput <= 0;
            $display("Out of h0i");
        end
        if (! $feof(fp_h1r)) begin
            if (enableInput) begin
                x = $fscanf(fp_h1r,"%f",h1rReal);
            end
        end
        else begin
            enableInput <= 0;
            $display("Out of h1r");
        end
        if (! $feof(fp_h1i)) begin
            if (enableInput) begin
                x = $fscanf(fp_h1i,"%f",h1iReal);
            end
        end
        else begin
            enableInput <= 0;
            $display("Out of h1i");
        end
    end
    reg     signed  [17:0]  h0r,h0i,h1r,h1i;
    always @(negedge clk) begin
        if (clkEnable) begin
            if (startFrame) begin
                h0r = $rtoi((2**16)*h0rReal);
                h0i = $rtoi((2**16)*h0iReal);
                h1r = $rtoi((2**16)*h1rReal);
                h1i = $rtoi((2**16)*h1iReal);
            end
        end
    end

    integer fp_s0r,fp_s0i;
    integer fp_s1r,fp_s1i;
    initial begin
        fp_s0r = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/signal_0_r.txt","r");
        fp_s0i = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/signal_0_i.txt","r");
        fp_s1r = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/signal_1_r.txt","r");
        fp_s1i = $fopen("c:/modem/telemetry/stcDemod/cLanguageSim/signal_1_i.txt","r");
    end
    real                    s0rReal,s0iReal;
    real                    s1rReal,s1iReal;
    reg                     sampleEn;
    always @(posedge startFrame or negedge sampleEn) begin
        if (! $feof(fp_s0r)) begin
            if (enableInput) begin
                x = $fscanf(fp_s0r,"%f",s0rReal);
            end
        end
        else begin
            enableInput <= 0;
            $display("Out of s0r");
        end
        if (! $feof(fp_s0i)) begin
            if (enableInput) begin
                x = $fscanf(fp_s0i,"%f",s0iReal);
            end
        end
        else begin
            enableInput <= 0;
            $display("Out of s0i");
        end
        if (! $feof(fp_s1r)) begin
            if (enableInput) begin
                x = $fscanf(fp_s1r,"%f",s1rReal);
            end
        end
        else begin
            enableInput <= 0;
            $display("Out of s1r");
        end
        if (! $feof(fp_s1i)) begin
            if (enableInput) begin
                x = $fscanf(fp_s1i,"%f",s1iReal);
            end
        end
        else begin
            enableInput <= 0;
            $display("Out of s1i");
        end
    end
    reg     signed  [17:0]  s0r,s0i,s1r,s1i;
    always @(negedge clk) begin
        if (clkEnable) begin
            if (sampleEn) begin
                s0r = $rtoi((2**16)*s0rReal);
                s0i = $rtoi((2**16)*s0iReal);
                s1r = $rtoi((2**16)*s1rReal);
                s1i = $rtoi((2**16)*s1iReal);
            end
        end
    end

    always @(posedge clk) begin
        if (clkEnable) begin
            if (startFrame) begin
                $display("\ttau = %f/0x%02x h0r = %f/0x%05x h0i = %f/0x%05x h1r = %f/0x%05x h1i = %f/0x%05x",
                    tauReal,tau,
                    h0rReal,h0r,h0iReal,h0i,
                    h1rReal,h1r,h1iReal,h1i
                );
            end
        end
    end

    //******************************* UUT *************************************

    trellisDetector uut(
        .clk(clk), .clkEn(clkEnable),
        .reset(reset),
        .sampleEn(sampleEn),
        .startFrame(startFrame),
        .in0Real(s0r), .in0Imag(s0i), 
        .in1Real(s1r), .in1Imag(s1i),
        .deltaTauEst(tau),
        .h0EstReal(h0r), .h0EstImag(h0i), 
        .h1EstReal(h1r), .h1EstImag(h1i)
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
                sampleCount <= `SAMPLES_PER_FRAME;
            end
            else if (sampleCount < `SAMPLES_PER_FRAME-1) begin
                sampleCount <= sampleCount + 1;
            end
            else begin
                sampleCount <= 0;
            end
            startFrame <= (sampleCount == 0);
            if (sampleCount >= (`PILOT_BITS_PER_FRAME * `SAMPLES_PER_BIT - 8)) begin
                sampleEn <= (sampleCountWire[1] && sampleCountWire[0]);
            end
            else begin
                sampleEn <= 0;
            end
        end
    end

endmodule

