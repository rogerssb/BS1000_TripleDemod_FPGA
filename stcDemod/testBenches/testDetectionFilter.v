`include "defines.v"
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



    //**************************** Startup ************************************
    initial begin
        clken <= 1;

        // Wait 10 clks
        repeat (6) @ (posedge clk) ;

        reset <= 1;
        repeat (8) @ (posedge clk) ;
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
        if (clkEnable) begin
            sampleCount <= sampleCount + 1;
        end
    end

endmodule

