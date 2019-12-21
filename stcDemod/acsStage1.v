`timescale 1ns/1ps

module acsStage1(
    input                   clk,clkEn,reset,
    input                   startFrame,
    input                   startBlock,
    input                   startStage,
    input   signed  [17:0]  in1Real,in1Imag,
    input                   accMetricInEn,
    input           [17:0]  accMetricIn,
    input                   stageSetupComplete,
    input                   setupOutputValid,
    input   signed  [17:0]  setupReal,setupImag,
    output                  metricOutEn,
    output          [17:0]  accMetricOut,
    output                  startNextStage
);

    // Registers to save the setup results in
    reg             [3:0]   wrAddr;
    reg     signed  [17:0]  table1r[0:15];
    reg     signed  [17:0]  table1i[0:15];
    always @(posedge clk) begin
        if (clkEn && startFrame) begin
            if (startFrame) begin
                wrAddr <= 0;
            end
        end
        else begin
            if (setupOutputValid) begin
                table1r[wrAddr] <= setupReal;
                table1i[wrAddr] <= setupImag;
                wrAddr <= wrAddr + 1;
            end
        end
    end

    // Stage 1 ACS Unit
    reg             [3:0]   metricAddr;
    always @(posedge clk) begin
        if (reset) begin
            metricAddr <= 0;
        end
        else if (accMetricInEn && (metricAddr > 0)) begin
            metricAddr <= metricAddr + 1;
        end
        else if (startStage) begin
            metricAddr <= 1;
        end
    end
    assign                  startNextStage = (metricAddr == 1);

    // Registers to hold the current block's input samples
    reg     signed  [17:0]  s1Real,s1Imag;
    always @(posedge clk) begin
        if (clkEn && startBlock) begin
            s1Real <= in1Real;
            s1Imag <= in1Imag;
        end
    end

    acsOp acs(
        .clk(clk), .reset(startFrame | reset),
        .y8Real(table1r[metricAddr]),  .y8Imag(table1i[metricAddr]),
        .sReal(s1Real),                 .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn),
        .accMetricOutEn(metricOutEn),
        .accMetricOut(accMetricOut)
    );

endmodule
