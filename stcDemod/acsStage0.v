`timescale 1ns/1ps

module acsStage0(
    input                   clk,clkEn,reset,
    input                   startFrame,
    input                   startBlock,
    input   signed  [17:0]  in0Real,in0Imag,
    input           [17:0]  accMetricIn,
    input                   stageSetupComplete,
    input                   setupOutputValid,
    input   signed  [17:0]  setupReal,setupImag,
    output                  metricRequest,
    output                  metricOutEn,
    output          [17:0]  accMetricOut,
    output                  startNextStage
);

    // Registers to save the setup results in
    reg             [3:0]   wrAddr;
    reg     signed  [17:0]  table0r[0:15];
    reg     signed  [17:0]  table0i[0:15];
    always @(posedge clk) begin
        if (clkEn && startFrame) begin
            if (startFrame) begin
                wrAddr <= 0;
            end
        end
        else begin
            if (setupOutputValid) begin
                table0r[wrAddr] <= setupReal;
                table0i[wrAddr] <= setupImag;
                wrAddr <= wrAddr + 1;
            end
        end
    end

    // Count through the 16 states.
    reg             [3:0]   metricAddr;
    reg                     startStage;
    reg                     metricInEn;
    always @(posedge clk) begin

        if (reset) begin
            metricAddr <= 0;
        end
        else if (metricInEn && (metricAddr > 0)) begin
            metricAddr <= metricAddr + 1;
        end
        else if (startStage) begin
            metricAddr <= 1;
        end

        if (clkEn && startBlock) begin
            startStage <= 1;
        end
        else begin
            startStage <= 0;
        end

        if (reset) begin
            metricInEn <= 0;
        end
        else begin
            metricInEn <= (metricAddr > 0) || startStage;
        end
    end
    assign                  metricRequest = metricInEn;
    assign                  startNextStage = (metricAddr == 1);

    // Stage 0 ACS Unit

    // Registers to hold the current block's input samples
    reg     signed  [17:0]  s0Real,s0Imag;
    always @(posedge clk) begin
        if (clkEn && startBlock) begin
            s0Real <= in0Real;
            s0Imag <= in0Imag;
        end
    end

    acsOp acs0(
        .clk(clk), .reset(startFrame | reset),
        .y8Real(table0r[metricAddr]),  .y8Imag(table0i[metricAddr]),
        .sReal(s0Real),                 .sImag(s0Imag),
        .accMetricInEn(metricInEn),
        .accMetricIn(accMetricIn),
        .accMetricOutEn(metricOutEn),
        .accMetricOut(accMetricOut)
    );


endmodule
