`timescale 1ns/1ps

module acsStage7Wide(
    input                   clk,clkEn,reset,
    input                   positiveTau,
    input                   startFrame,
    input                   startBlock,
    input                   startStage,
    input   signed  [17:0]  in1Real,in1Imag,
    input                   accMetricInEn,
    input           [17:0]  accMetricIn_000,
    input           [17:0]  accMetricIn_001,
    input           [17:0]  accMetricIn_010,
    input           [17:0]  accMetricIn_011,
    input           [17:0]  accMetricIn_100,
    input           [17:0]  accMetricIn_101,
    input           [17:0]  accMetricIn_110,
    input           [17:0]  accMetricIn_111,
    input                   setupComplete,
    input                   setupOutputValid,
    input   signed  [17:0]  setupReal,setupImag,
    input                   flipTracebackPingPong,
    input           [3:0]   minIndex,
    output                  metricOutEn,
    output  reg     [17:0]  accMetric_000,
    output  reg     [17:0]  accMetric_001,
    output  reg     [17:0]  accMetric_010,
    output  reg     [17:0]  accMetric_011,
    output  reg     [17:0]  accMetric_100,
    output  reg     [17:0]  accMetric_101,
    output  reg     [17:0]  accMetric_110,
    output  reg     [17:0]  accMetric_111,
    output                  startNextStage,
    output  reg     [4:0]   winner7
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
    wire            [4:0]   addr000;
    wire            [4:0]   addr001;
    wire            [4:0]   spoAddr00x = setupOutputValid ? wrAddr : addr001;
    wire    signed  [17:0]  table7r_000,table7i_000;
    wire    signed  [17:0]  table7r_001,table7i_001;
    twoPortDistMem32x18 dpRam7r_00x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr00x), 
        .d(setupReal), 
        .dpra(addr000), 
        .dpo(table7r_000),
        .spo(table7r_001)
    );
    twoPortDistMem32x18 dpRam7i_00x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr00x), 
        .d(setupImag), 
        .dpra(addr000), 
        .dpo(table7i_000),
        .spo(table7i_001)
    );
    wire            [4:0]   addr010;
    wire            [4:0]   addr011;
    wire            [4:0]   spoAddr01x = setupOutputValid ? wrAddr : addr011;
    wire    signed  [17:0]  table7r_010,table7i_010;
    wire    signed  [17:0]  table7r_011,table7i_011;
    twoPortDistMem32x18 dpRam7r_01x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr01x), 
        .d(setupReal), 
        .dpra(addr010), 
        .dpo(table7r_010),
        .spo(table7r_011)
    );
    twoPortDistMem32x18 dpRam7i_01x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr01x), 
        .d(setupImag), 
        .dpra(addr010), 
        .dpo(table7i_010),
        .spo(table7i_011)
    );
    wire            [4:0]   addr100;
    wire            [4:0]   addr101;
    wire            [4:0]   spoAddr10x = setupOutputValid ? wrAddr : addr101;
    wire    signed  [17:0]  table7r_100,table7i_100;
    wire    signed  [17:0]  table7r_101,table7i_101;
    twoPortDistMem32x18 dpRam7r_10x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr10x), 
        .d(setupReal), 
        .dpra(addr100), 
        .dpo(table7r_100),
        .spo(table7r_101)
    );
    twoPortDistMem32x18 dpRam7i_10x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr10x), 
        .d(setupImag), 
        .dpra(addr100), 
        .dpo(table7i_100),
        .spo(table7i_101)
    );
    wire            [4:0]   addr110;
    wire            [4:0]   addr111;
    wire            [4:0]   spoAddr11x = setupOutputValid ? wrAddr : addr111;
    wire    signed  [17:0]  table7r_110,table7i_110;
    wire    signed  [17:0]  table7r_111,table7i_111;
    twoPortDistMem32x18 dpRam7r_11x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr11x), 
        .d(setupReal), 
        .dpra(addr110), 
        .dpo(table7r_110),
        .spo(table7r_111)
    );
    twoPortDistMem32x18 dpRam7i_11x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr11x), 
        .d(setupImag), 
        .dpra(addr110), 
        .dpo(table7i_110),
        .spo(table7i_111)
    );

    `define PER_TABLE_ADDRESS
    `ifdef PER_TABLE_ADDRESS
    // Count through the 4 states of the 8 acs units to generate 32 outputs. 
    reg             [1:0]   metricAddr[0:7];
    integer                 k;
    always @(posedge clk) begin
        for (k = 0; k < 8; k = k + 1) begin
            if (reset) begin
                metricAddr[k] <= 0;
            end
            else if (accMetricInEn && (metricAddr[k] > 0)) begin
                metricAddr[k] <= metricAddr[k] + 1;
            end
            else if (startStage) begin
                metricAddr[k] <= 1;
            end
        end
    end
    assign                  addr000 =    {metricAddr[0],3'b000};
    assign                  addr001 =    {metricAddr[1],3'b001};
    assign                  addr010 =    {metricAddr[2],3'b010};
    assign                  addr011 =    {metricAddr[3],3'b011};
    assign                  addr100 =    {metricAddr[4],3'b100};
    assign                  addr101 =    {metricAddr[5],3'b101};
    assign                  addr110 =    {metricAddr[6],3'b110};
    assign                  addr111 =    {metricAddr[7],3'b111};

    `else //PER_TABLE_ADDRESS
    // Count through the 4 states of the 8 acs units to generate 32 outputs. 
    reg             [1:0]   metricAddr;
    always @(posedge clk) begin
        if (reset) begin
            metricAddr <= 0;
        end
        else if (accMetricInEn && (metricAddr > 0)) begin
            metricAddr <= metricAddr + 1;
        end
        else if (startStage) begin
            metricAddr <= 0;
        end
    end
    assign                  addr000 =    {metricAddr,3'b000};
    assign                  addr001 =    {metricAddr,3'b001};
    assign                  addr010 =    {metricAddr,3'b010};
    assign                  addr011 =    {metricAddr,3'b011};
    assign                  addr100 =    {metricAddr,3'b100};
    assign                  addr101 =    {metricAddr,3'b101};
    assign                  addr110 =    {metricAddr,3'b110};
    assign                  addr111 =    {metricAddr,3'b111};
    `endif


    // Registers to hold the current block's input samples
    reg     signed  [17:0]  s1Real,s1Imag;
    always @(posedge clk) begin
        if (clkEn && startBlock) begin
            s1Real <= in1Real;
            s1Imag <= in1Imag;
        end
    end

    // Stage 7 ACS Units
    wire            [17:0]  accMetricTmp_000;
    wire            [17:0]  accMetricTmp_001;
    wire            [17:0]  accMetricTmp_010;
    wire            [17:0]  accMetricTmp_011;
    wire            [17:0]  accMetricTmp_100;
    wire            [17:0]  accMetricTmp_101;
    wire            [17:0]  accMetricTmp_110;
    wire            [17:0]  accMetricTmp_111;
    acsOp acs000(
        .clk(clk), .reset(startFrame),
        .y8Real(table7r_000),    .y8Imag(table7i_000),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_000),
        .accMetricOutEn(tmpMetricOutEn),
        .accMetricOut(accMetricTmp_000)
    );
    acsOp acs001(
        .clk(clk), .reset(startFrame),
        .y8Real(table7r_001),    .y8Imag(table7i_001),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_001),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_001)
    );
    acsOp acs010(
        .clk(clk), .reset(startFrame),
        .y8Real(table7r_010),    .y8Imag(table7i_010),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_010),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_010)
    );
    acsOp acs011(
        .clk(clk), .reset(startFrame),
        .y8Real(table7r_011),    .y8Imag(table7i_011),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_011),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_011)
    );
    acsOp acs100(
        .clk(clk), .reset(startFrame),
        .y8Real(table7r_100),    .y8Imag(table7i_100),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_100),
        .accMetricOutEn(tmpMetricOutEn),
        .accMetricOut(accMetricTmp_100)
    );
    acsOp acs101(
        .clk(clk), .reset(startFrame),
        .y8Real(table7r_101),    .y8Imag(table7i_101),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_101),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_101)
    );
    acsOp acs110(
        .clk(clk), .reset(startFrame),
        .y8Real(table7r_110),    .y8Imag(table7i_110),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_110),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_110)
    );
    acsOp acs111(
        .clk(clk), .reset(startFrame),
        .y8Real(table7r_111),    .y8Imag(table7i_111),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_111),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_111)
    );

    // Create a delay line for comparing paths that are 16 states apart. 
    // Since states are presented 8 at a time, the delay is 2 clocks.
    reg             [17:0]  delayed_000[0:7];
    reg             [17:0]  delayed_001[0:7];
    reg             [17:0]  delayed_010[0:7];
    reg             [17:0]  delayed_011[0:7];
    reg             [17:0]  delayed_100[0:7];
    reg             [17:0]  delayed_101[0:7];
    reg             [17:0]  delayed_110[0:7];
    reg             [17:0]  delayed_111[0:7];
    integer                 i;
    reg             [1:0]   delayEnSR;
    always @(posedge clk) begin
        delayed_000[0] <= accMetricTmp_000;
        delayed_001[0] <= accMetricTmp_001;
        delayed_010[0] <= accMetricTmp_010;
        delayed_011[0] <= accMetricTmp_011;
        delayed_100[0] <= accMetricTmp_100;
        delayed_101[0] <= accMetricTmp_101;
        delayed_110[0] <= accMetricTmp_110;
        delayed_111[0] <= accMetricTmp_111;
        for (i = 0; i < 7; i = i + 1) begin
            delayed_000[i+1] <= delayed_000[i];
            delayed_001[i+1] <= delayed_001[i];
            delayed_010[i+1] <= delayed_010[i];
            delayed_011[i+1] <= delayed_011[i];
            delayed_100[i+1] <= delayed_100[i];
            delayed_101[i+1] <= delayed_101[i];
            delayed_110[i+1] <= delayed_110[i];
            delayed_111[i+1] <= delayed_111[i];
        end
        delayEnSR <= {delayEnSR[0],tmpMetricOutEn};
    end
    wire            [17:0]  path0Metric_000 =   delayed_000[1];
    wire            [17:0]  path0Metric_001 =   delayed_001[1];
    wire            [17:0]  path0Metric_010 =   delayed_010[1];
    wire            [17:0]  path0Metric_011 =   delayed_011[1];
    wire            [17:0]  path0Metric_100 =   delayed_100[1];
    wire            [17:0]  path0Metric_101 =   delayed_101[1];
    wire            [17:0]  path0Metric_110 =   delayed_110[1];
    wire            [17:0]  path0Metric_111 =   delayed_111[1];
    wire            [17:0]  path1Metric_000 =   accMetricTmp_000;
    wire            [17:0]  path1Metric_001 =   accMetricTmp_001;
    wire            [17:0]  path1Metric_010 =   accMetricTmp_010;
    wire            [17:0]  path1Metric_011 =   accMetricTmp_011;
    wire            [17:0]  path1Metric_100 =   accMetricTmp_100;
    wire            [17:0]  path1Metric_101 =   accMetricTmp_101;
    wire            [17:0]  path1Metric_110 =   accMetricTmp_110;
    wire            [17:0]  path1Metric_111 =   accMetricTmp_111;

    // A total of 16 comparisons are made between pairs of acs outputs. The 16 
    // comparisons are sequential but are presented 8 at a time. 
    reg             [1:0]   outputCounter;
    reg             [1:0]   delayedEnSR;
    wire                    delayedEn =     delayedEnSR[1];
    assign                  metricOutEn =   delayedEn && !outputCounter[1];
    assign                  startNextStage = (delayedEnSR[0] && !delayedEnSR[1]);
    always @(posedge clk) begin
        if (reset) begin
            delayedEnSR <= 0;
        end
        else begin
            delayedEnSR <= {delayedEnSR[0],tmpMetricOutEn};
        end
        if (reset) begin
            outputCounter <= 0;
        end
        else if (!delayedEn) begin
            outputCounter <= 0;
        end
        else if (delayedEn) begin
            outputCounter <= outputCounter + 1;
        end
    end

    // Select the best path
    reg             [4:0]   winningIndex_000;
    reg             [4:0]   winningIndex_001;
    reg             [4:0]   winningIndex_010;
    reg             [4:0]   winningIndex_011;
    reg             [4:0]   winningIndex_100;
    reg             [4:0]   winningIndex_101;
    reg             [4:0]   winningIndex_110;
    reg             [4:0]   winningIndex_111;
    always @* begin
        if (path1Metric_000 < path0Metric_000) begin
            accMetric_000 = path1Metric_000;   // Choose the 1 path
            winningIndex_000 = {1'b1,outputCounter[0],3'h0};
        end
        else begin
            accMetric_000 = path0Metric_000;  // Choose the 0 path
            winningIndex_000 = {1'b0,outputCounter[0],3'h0};
        end
        if (path1Metric_001 < path0Metric_001) begin
            accMetric_001 = path1Metric_001;   // Choose the 1 path
            winningIndex_001 = {1'b1,outputCounter[0],3'h1};
        end
        else begin
            accMetric_001 = path0Metric_001;  // Choose the 0 path
            winningIndex_001 = {1'b0,outputCounter[0],3'h1};
        end
        if (path1Metric_010 < path0Metric_010) begin
            accMetric_010 = path1Metric_010;   // Choose the 1 path
            winningIndex_010 = {1'b1,outputCounter[0],3'h2};
        end
        else begin
            accMetric_010 = path0Metric_010;  // Choose the 0 path
            winningIndex_010 = {1'b0,outputCounter[0],3'h2};
        end
        if (path1Metric_011 < path0Metric_011) begin
            accMetric_011 = path1Metric_011;   // Choose the 1 path
            winningIndex_011 = {1'b1,outputCounter[0],3'h3};
        end
        else begin
            accMetric_011 = path0Metric_011;  // Choose the 0 path
            winningIndex_011 = {1'b0,outputCounter[0],3'h3};
        end
        if (path1Metric_100 < path0Metric_100) begin
            accMetric_100 = path1Metric_100;   // Choose the 1 path
            winningIndex_100 = {1'b1,outputCounter[0],3'h4};
        end
        else begin
            accMetric_100 = path0Metric_100;  // Choose the 0 path
            winningIndex_100 = {1'b0,outputCounter[0],3'h4};
        end
        if (path1Metric_101 < path0Metric_101) begin
            accMetric_101 = path1Metric_101;   // Choose the 1 path
            winningIndex_101 = {1'b1,outputCounter[0],3'h5};
        end
        else begin
            accMetric_101 = path0Metric_101;  // Choose the 0 path
            winningIndex_101 = {1'b0,outputCounter[0],3'h5};
        end
        if (path1Metric_110 < path0Metric_110) begin
            accMetric_110 = path1Metric_110;   // Choose the 1 path
            winningIndex_110 = {1'b1,outputCounter[0],3'h6};
        end
        else begin
            accMetric_110 = path0Metric_110;  // Choose the 0 path
            winningIndex_110 = {1'b0,outputCounter[0],3'h6};
        end
        if (path1Metric_111 < path0Metric_111) begin
            accMetric_111 = path1Metric_111;   // Choose the 1 path
            winningIndex_111 = {1'b1,outputCounter[0],3'h7};
        end
        else begin
            accMetric_111 = path0Metric_111;  // Choose the 0 path
            winningIndex_111 = {1'b0,outputCounter[0],3'h7};
        end
    end

    // Instantiate the traceback ping-pong memory
    reg                     ppAddrBit;
    always @(posedge clk) begin
        if (reset) begin
            ppAddrBit <= 0;
        end
        else if (flipTracebackPingPong) begin
            ppAddrBit <= ~ppAddrBit;
        end
    end

    reg                     tbWrAddr;
    always @(posedge clk) begin
        if (reset) begin
            tbWrAddr <= 0;
        end
        else if (metricOutEn) begin
            tbWrAddr <= tbWrAddr + 1;
        end
    end

    wire            [39:0]  tbBits;
    twoPortBlkMem40x4 tbRam7(
        .clka(clk), 
        .wea(metricOutEn), 
        .addra({ppAddrBit,tbWrAddr}), 
        .dina({winningIndex_111,winningIndex_110,winningIndex_101,winningIndex_100,
               winningIndex_011,winningIndex_010,winningIndex_001,winningIndex_000}), 
        .clkb(clk),
        .addrb({~ppAddrBit,minIndex[3]}), 
        .doutb(tbBits)
    );

    always @* begin
        case (minIndex[2:0])
            0:  winner7 = tbBits[ 4: 0];
            1:  winner7 = tbBits[ 9: 5];
            2:  winner7 = tbBits[14:10];
            3:  winner7 = tbBits[19:15];
            4:  winner7 = tbBits[24:20];
            5:  winner7 = tbBits[29:25];
            6:  winner7 = tbBits[34:30];
            7:  winner7 = tbBits[39:35];
        endcase
    end

endmodule
