`timescale 1ns/1ps

module acsStage2(
    input                   clk,clkEn,reset,
    input                   startFrame,
    input                   startBlock,
    input                   startStage,
    input   signed  [17:0]  in0Real,in0Imag,
    input                   accMetricInEn,
    input           [17:0]  accMetricIn,
    input                   setupComplete,
    input                   setupOutputValid,
    input   signed  [17:0]  setupReal,setupImag,
    output                  metricOutEn,
    output          [17:0]  accMetricEvenOut,
    output          [17:0]  accMetricOddOut,
    output                  startNextStage
);

    // Ram write address
    reg             [4:0]   wrAddr;
    always @(posedge clk) begin
        if (clkEn && startFrame) begin
            wrAddr <= 0;
        end
        else begin
            if (setupOutputValid) begin
                wrAddr <= wrAddr + 1;
            end
        end
    end

    // 2 port rams to save the setup results in
    wire            [4:0]   evenAddr;
    wire            [4:0]   oddAddr;
    wire            [4:0]   spoAddr = setupOutputValid ? wrAddr : oddAddr;
    wire    signed  [17:0]  tableEven2r,tableEven2i;
    wire    signed  [17:0]  tableOdd2r,tableOdd2i;
    twoPortDistMem32x18 dpRam2r(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr), 
        .d(setupReal), 
        .dpra(evenAddr), 
        .dpo(tableEven2r),
        .spo(tableOdd2r)
    );
    twoPortDistMem32x18 dpRam2i(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr), 
        .d(setupImag), 
        .dpra(evenAddr), 
        .dpo(tableEven2i),
        .spo(tableOdd2i)
    );

    // Count through the 16 states of the 2 acs units to generate 32 outputs. 
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
    assign                  evenAddr =  {metricAddr,1'b0};
    assign                  oddAddr =   {metricAddr,1'b1};

    // Registers to hold the current block's input samples
    reg     signed  [17:0]  s0Real,s0Imag;
    always @(posedge clk) begin
        if (clkEn && startBlock) begin
            s0Real <= in0Real;
            s0Imag <= in0Imag;
        end
    end

    // Stage 2 ACS Units
    acsOp acsEven(
        .clk(clk), .reset(startFrame),
        .y8Real(tableEven2r),   .y8Imag(tableEven2i),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn),
        .accMetricOutEn(metricOutEn),
        .accMetricOut(accMetricEvenOut)
    );
    acsOp acsOdd(
        .clk(clk), .reset(startFrame),
        .y8Real(tableOdd2r),    .y8Imag(tableOdd2i),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn),
        .accMetricOutEn(),
        .accMetricOut(accMetricOddOut)
    );
    

endmodule
