`timescale 1ns/1ps

module acsStage0and1(
    input                   clk,clkEn,reset,
    input                   startFrame,
    input                   startBlock,
    input   signed  [17:0]  in0Real,in0Imag,
    input   signed  [17:0]  in1Real,in1Imag,
    input           [17:0]  accMetricIn,
    input                   stage0SetupComplete,
    input                   setup0OutputValid,
    input   signed  [17:0]  setup0Real,setup0Imag,
    input                   stage1SetupComplete,
    input                   setup1OutputValid,
    input   signed  [17:0]  setup1Real,setup1Imag,
    output                  metricRequest,
    output                  metricOutEn,
    output          [17:0]  accMetricOut
);

    // Registers to save the setup results in
    reg             [3:0]   wrAddr0;
    reg     signed  [17:0]  table0r[0:15];
    reg     signed  [17:0]  table0i[0:15];
    reg             [3:0]   wrAddr1;
    reg     signed  [17:0]  table1r[0:15];
    reg     signed  [17:0]  table1i[0:15];
    always @(posedge clk) begin
        if (clkEn && startFrame) begin
            if (startFrame) begin
                wrAddr0 <= 0;
                wrAddr1 <= 0;
            end
        end
        else begin
            if (setup0OutputValid) begin
                table0r[wrAddr0] <= setup0Real;
                table0i[wrAddr0] <= setup0Imag;
                wrAddr0 <= wrAddr0 + 1;
            end
            if (setup1OutputValid) begin
                table1r[wrAddr1] <= setup1Real;
                table1i[wrAddr1] <= setup1Imag;
                wrAddr1 <= wrAddr1 + 1;
            end
        end
    end

    // Count through the 16 states of the two stages.
    reg             [3:0]   metricAddr0;
    reg             [3:0]   metricEnSR;
    always @(posedge clk) begin
        if (clkEn && startBlock) begin
            metricAddr0 <= 0;
            metricEnSR <= {metricEnSR[2:0],1'b1};
        end
        else if (metricAddr0 < 15) begin
            metricAddr0 <= metricAddr0 + 1;
            metricEnSR <= {metricEnSR[2:0],1'b1};
        end
        else begin
            metricEnSR <= {metricEnSR[2:0],1'b0};
        end
    end
    wire                    metricInEn = metricEnSR[0];
    assign                  metricRequest = metricEnSR[0];

    // Stage 0 ACS Unit

    // Registers to hold the current block's input samples
    reg     signed  [17:0]  s0Real,s0Imag;
    always @(posedge clk) begin
        if (clkEn && startBlock) begin
            s0Real <= in0Real;
            s0Imag <= in0Imag;
        end
    end

    wire            [17:0]  stage0Metric;
    acsOp acs0(
        .clk(clk), .reset(startFrame),
        .y8Real(table0r[metricAddr0]),  .y8Imag(table0i[metricAddr0]),
        .sReal(s0Real),                 .sImag(s0Imag),
        .accMetricInEn(metricInEn),
        .accMetricIn(accMetricIn),
        .accMetricOutEn(stage0OutputEn),
        .accMetricOut(stage0Metric)
    );


    // Stage 1 ACS Unit
    reg             [3:0]   metricAddr1;
    always @(posedge clk) begin
        if (reset) begin
            metricAddr1 <= 15;
        end
        else if (stage0OutputEn) begin
            metricAddr1 <= metricAddr1 + 1;
        end
        else if (clkEn && startBlock) begin
            metricAddr1 <= 0;
        end
    end

    // Registers to hold the current block's input samples
    reg     signed  [17:0]  s1Real,s1Imag;
    always @(posedge clk) begin
        if (clkEn && startBlock) begin
            s1Real <= in1Real;
            s1Imag <= in1Imag;
        end
    end

    wire            [17:0]  stage1Metric;
    acsOp acs1(
        .clk(clk), .reset(startFrame),
        .y8Real(table1r[metricAddr1]),  .y8Imag(table1i[metricAddr1]),
        .sReal(s1Real),                 .sImag(s1Imag),
        .accMetricInEn(stage0OutputEn),
        .accMetricIn(stage0Metric),
        .accMetricOutEn(stage1OutputEn),
        .accMetricOut(stage1Metric)
    );
    
    assign metricOutEn = stage1OutputEn;
    assign accMetricOut = stage1Metric;

endmodule
