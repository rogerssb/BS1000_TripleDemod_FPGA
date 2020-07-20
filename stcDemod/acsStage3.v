`timescale 1ns/1ps

module acsStage3(
    input                   clk,clkEn,reset,
    input                   startFrame,
    input                   startBlock,
    input                   startStage,
    input   signed  [17:0]  in1Real,in1Imag,
    input                   accMetricInEn,
    input           [17:0]  accMetricInEven,accMetricInOdd,
    input                   setupComplete,
    input                   setupOutputValid,
    input   signed  [17:0]  setupReal,setupImag,
    output                  metricOutEn,
    output          [17:0]  accMetricOut_00,
    output          [17:0]  accMetricOut_01,
    output          [17:0]  accMetricOut_10,
    output          [17:0]  accMetricOut_11,
    output                  startNextStage
);

    // Ram write address
    reg             [5:0]   wrAddr;
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
    wire            [5:0]   addr00;
    wire            [5:0]   addr01;
    wire            [5:0]   addr10;
    wire            [5:0]   addr11;
    wire            [5:0]   spoAddr0x = setupOutputValid ? wrAddr : addr01;
    wire    signed  [17:0]  table3r_00,table3i_00;
    wire    signed  [17:0]  table3r_01,table3i_01;
    twoPortDistMem64x18 dpRam3r_0x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr0x), 
        .d(setupReal), 
        .dpra(addr00), 
        .dpo(table3r_00),
        .spo(table3r_01)
    );
    twoPortDistMem64x18 dpRam3i_0x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr0x), 
        .d(setupImag), 
        .dpra(addr00), 
        .dpo(table3i_00),
        .spo(table3i_01)
    );
    wire            [5:0]   spoAddr1x = setupOutputValid ? wrAddr : addr11;
    wire    signed  [17:0]  table3r_10,table3i_10;
    wire    signed  [17:0]  table3r_11,table3i_11;
    twoPortDistMem64x18 dpRam3r_1x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr1x), 
        .d(setupReal), 
        .dpra(addr10), 
        .dpo(table3r_10),
        .spo(table3r_11)
    );
    twoPortDistMem64x18 dpRam3i_1x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr1x), 
        .d(setupImag), 
        .dpra(addr10), 
        .dpo(table3i_10),
        .spo(table3i_11)
    );

    // Count through the 16 states of the 4 acs units to generate 64 outputs. 
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
    assign                  addr00 =    {metricAddr,2'b00};
    assign                  addr01 =    {metricAddr,2'b01};
    assign                  addr10 =    {metricAddr,2'b10};
    assign                  addr11 =    {metricAddr,2'b11};

    // Registers to hold the current block's input samples
    reg     signed  [17:0]  s1Real,s1Imag;
    always @(posedge clk) begin
        if (clkEn && startBlock) begin
            s1Real <= in1Real;
            s1Imag <= in1Imag;
        end
    end

    // Stage 3 ACS Units
    acsOp acs00(
        .clk(clk), .reset(startFrame),
        .y8Real(table3r_00),    .y8Imag(table3i_00),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricInEven),
        .accMetricOutEn(metricOutEn),
        .accMetricOut(accMetricOut_00)
    );
    acsOp acs01(
        .clk(clk), .reset(startFrame),
        .y8Real(table3r_01),    .y8Imag(table3i_01),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricInEven),
        .accMetricOutEn(),
        .accMetricOut(accMetricOut_01)
    );
    acsOp acs10(
        .clk(clk), .reset(startFrame),
        .y8Real(table3r_10),    .y8Imag(table3i_10),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricInOdd),
        .accMetricOutEn(),
        .accMetricOut(accMetricOut_10)
    );
    acsOp acs11(
        .clk(clk), .reset(startFrame),
        .y8Real(table3r_11),    .y8Imag(table3i_11),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricInOdd),
        .accMetricOutEn(),
        .accMetricOut(accMetricOut_11)
    );
    

endmodule
