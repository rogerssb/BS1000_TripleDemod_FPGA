`timescale 1ns/1ps

module acsStage5Wide(
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
    input           [5:0]   winner6,
    output                  metricOutEn,
    output          [17:0]  accMetric_000,
    output          [17:0]  accMetric_001,
    output          [17:0]  accMetric_010,
    output          [17:0]  accMetric_011,
    output          [17:0]  accMetric_100,
    output          [17:0]  accMetric_101,
    output          [17:0]  accMetric_110,
    output          [17:0]  accMetric_111,
    output                  startNextStage,
    output   reg    [6:0]   winner5
);

    // Ram write address
    reg             [6:0]   wrAddr;
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
    wire            [6:0]   addr000;
    wire            [6:0]   addr001;
    wire            [6:0]   spoAddr00x = setupOutputValid ? wrAddr : addr001;
    wire    signed  [17:0]  table5r_000,table5i_000;
    wire    signed  [17:0]  table5r_001,table5i_001;
    twoPortDistMem128x18 dpRam5r_00x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr00x), 
        .d(setupReal), 
        .dpra(addr000), 
        .dpo(table5r_000),
        .spo(table5r_001)
    );
    twoPortDistMem128x18 dpRam5i_00x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr00x), 
        .d(setupImag), 
        .dpra(addr000), 
        .dpo(table5i_000),
        .spo(table5i_001)
    );
    wire            [6:0]   addr010;
    wire            [6:0]   addr011;
    wire            [6:0]   spoAddr01x = setupOutputValid ? wrAddr : addr011;
    wire    signed  [17:0]  table5r_010,table5i_010;
    wire    signed  [17:0]  table5r_011,table5i_011;
    twoPortDistMem128x18 dpRam5r_01x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr01x), 
        .d(setupReal), 
        .dpra(addr010), 
        .dpo(table5r_010),
        .spo(table5r_011)
    );
    twoPortDistMem128x18 dpRam5i_01x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr01x), 
        .d(setupImag), 
        .dpra(addr010), 
        .dpo(table5i_010),
        .spo(table5i_011)
    );
    wire            [6:0]   addr100;
    wire            [6:0]   addr101;
    wire            [6:0]   spoAddr10x = setupOutputValid ? wrAddr : addr101;
    wire    signed  [17:0]  table5r_100,table5i_100;
    wire    signed  [17:0]  table5r_101,table5i_101;
    twoPortDistMem128x18 dpRam5r_10x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr10x), 
        .d(setupReal), 
        .dpra(addr100), 
        .dpo(table5r_100),
        .spo(table5r_101)
    );
    twoPortDistMem128x18 dpRam5i_10x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr10x), 
        .d(setupImag), 
        .dpra(addr100), 
        .dpo(table5i_100),
        .spo(table5i_101)
    );
    wire            [6:0]   addr110;
    wire            [6:0]   addr111;
    wire            [6:0]   spoAddr11x = setupOutputValid ? wrAddr : addr111;
    wire    signed  [17:0]  table5r_110,table5i_110;
    wire    signed  [17:0]  table5r_111,table5i_111;
    twoPortDistMem128x18 dpRam5r_11x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr11x), 
        .d(setupReal), 
        .dpra(addr110), 
        .dpo(table5r_110),
        .spo(table5r_111)
    );
    twoPortDistMem128x18 dpRam5i_11x(
        .clk(clk), 
        .we(setupOutputValid), 
        .a(spoAddr11x), 
        .d(setupImag), 
        .dpra(addr110), 
        .dpo(table5i_110),
        .spo(table5i_111)
    );

    `define PER_TABLE_ADDRESS
    `ifdef PER_TABLE_ADDRESS

    // Count through the 16 states of the 8 acs units to generate 128 outputs. 
    reg             [3:0]   metricAddr[0:7];
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

    // Count through the 16 states of the 8 acs units to generate 128 outputs. 
    reg             [3:0]   metricAddr;
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


    // Stage 5 ACS Units
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
        .y8Real(table5r_000),    .y8Imag(table5i_000),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_000),
        .accMetricOutEn(tmpMetricOutEn),
        .accMetricOut(accMetricTmp_000)
    );
    acsOp acs001(
        .clk(clk), .reset(startFrame),
        .y8Real(table5r_001),    .y8Imag(table5i_001),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_001),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_001)
    );
    acsOp acs010(
        .clk(clk), .reset(startFrame),
        .y8Real(table5r_010),    .y8Imag(table5i_010),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_010),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_010)
    );
    acsOp acs011(
        .clk(clk), .reset(startFrame),
        .y8Real(table5r_011),    .y8Imag(table5i_011),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_011),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_011)
    );
    acsOp acs100(
        .clk(clk), .reset(startFrame),
        .y8Real(table5r_100),    .y8Imag(table5i_100),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_100),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_100)
    );
    acsOp acs101(
        .clk(clk), .reset(startFrame),
        .y8Real(table5r_101),    .y8Imag(table5i_101),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_101),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_101)
    );
    acsOp acs110(
        .clk(clk), .reset(startFrame),
        .y8Real(table5r_110),    .y8Imag(table5i_110),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_110),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_110)
    );
    acsOp acs111(
        .clk(clk), .reset(startFrame),
        .y8Real(table5r_111),    .y8Imag(table5i_111),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_111),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_111)
    );

    // Create a delay line for comparing best paths
    // When tau is positive, we compare paths 64 states apart. When tau is 
    // negative, 32 states apart. Since states are presented 8 at a time, the
    // delay is 8 clocks for positive tau and 4 clocks for negative tau.
    reg             [17:0]  delayed_000[0:7];
    reg             [17:0]  delayed_001[0:7];
    reg             [17:0]  delayed_010[0:7];
    reg             [17:0]  delayed_011[0:7];
    reg             [17:0]  delayed_100[0:7];
    reg             [17:0]  delayed_101[0:7];
    reg             [17:0]  delayed_110[0:7];
    reg             [17:0]  delayed_111[0:7];
    integer                 i;
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
    end
    wire            [17:0]  path0Metric_000 =   positiveTau ? delayed_000[7] : delayed_000[3];
    wire            [17:0]  path0Metric_001 =   positiveTau ? delayed_001[7] : delayed_001[3];
    wire            [17:0]  path0Metric_010 =   positiveTau ? delayed_010[7] : delayed_010[3];
    wire            [17:0]  path0Metric_011 =   positiveTau ? delayed_011[7] : delayed_011[3];
    wire            [17:0]  path0Metric_100 =   positiveTau ? delayed_100[7] : delayed_100[3];
    wire            [17:0]  path0Metric_101 =   positiveTau ? delayed_101[7] : delayed_101[3];
    wire            [17:0]  path0Metric_110 =   positiveTau ? delayed_110[7] : delayed_110[3];
    wire            [17:0]  path0Metric_111 =   positiveTau ? delayed_111[7] : delayed_111[3];
    wire            [17:0]  path1Metric_000 =   accMetricTmp_000;
    wire            [17:0]  path1Metric_001 =   accMetricTmp_001;
    wire            [17:0]  path1Metric_010 =   accMetricTmp_010;
    wire            [17:0]  path1Metric_011 =   accMetricTmp_011;
    wire            [17:0]  path1Metric_100 =   accMetricTmp_100;
    wire            [17:0]  path1Metric_101 =   accMetricTmp_101;
    wire            [17:0]  path1Metric_110 =   accMetricTmp_110;
    wire            [17:0]  path1Metric_111 =   accMetricTmp_111;

    // A total of 64 comparisons are made between pairs of acs outputs. When
    // tau is positive, the 64 comparisons are sequential. When tau is negative,
    // the comparisons are staggered in two sets of 32 acs pairs. We want to
    // take the stagger out of the negative tau case so we'll write the 
    // winning metrics into a fifo and control the read side of the fifo to 
    // remove the stagger.
    reg             [6:0]   fifoWriteCounter;
    reg             [7:0]   delayedEnSR;
    wire                    delayedEn =     positiveTau ? delayedEnSR[7] : delayedEnSR[3];
    wire                    fifoWriteEn =   delayedEn && 
                                        (   positiveTau ? !fifoWriteCounter[6]
                                                        : !fifoWriteCounter[5]);
    always @(posedge clk) begin
        if (reset) begin
            delayedEnSR <= 0;
        end
        else begin
            delayedEnSR <= {delayedEnSR[6:0],tmpMetricOutEn};
        end
        if (reset) begin
            fifoWriteCounter <= 0;
        end
        else if (!delayedEn) begin
            fifoWriteCounter <= 0;
        end
        else if (delayedEn) begin
            fifoWriteCounter <= fifoWriteCounter + 8;
        end
    end

    // Select the best path
    reg             [17:0]  smallestMetric_000;
    reg             [17:0]  smallestMetric_001;
    reg             [17:0]  smallestMetric_010;
    reg             [17:0]  smallestMetric_011;
    reg             [17:0]  smallestMetric_100;
    reg             [17:0]  smallestMetric_101;
    reg             [17:0]  smallestMetric_110;
    reg             [17:0]  smallestMetric_111;
    reg             [6:0]   winningIndex_000;
    reg             [6:0]   winningIndex_001;
    reg             [6:0]   winningIndex_010;
    reg             [6:0]   winningIndex_011;
    reg             [6:0]   winningIndex_100;
    reg             [6:0]   winningIndex_101;
    reg             [6:0]   winningIndex_110;
    reg             [6:0]   winningIndex_111;
    always @* begin
        if (positiveTau) begin
            if (path1Metric_000 < path0Metric_000) begin
                smallestMetric_000 = path1Metric_000;   // Choose the 1 path
                winningIndex_000 = {1'b1,fifoWriteCounter[5:3],3'h0};
            end
            else begin
                smallestMetric_000 = path0Metric_000;  // Choose the 0 path
                winningIndex_000 = {1'b0,fifoWriteCounter[5:3],3'h0};
            end
            if (path1Metric_001 < path0Metric_001) begin
                smallestMetric_001 = path1Metric_001;   // Choose the 1 path
                winningIndex_001 = {1'b1,fifoWriteCounter[5:3],3'h1};
            end
            else begin
                smallestMetric_001 = path0Metric_001;  // Choose the 0 path
                winningIndex_001 = {1'b0,fifoWriteCounter[5:3],3'h1};
            end
            if (path1Metric_010 < path0Metric_010) begin
                smallestMetric_010 = path1Metric_010;   // Choose the 1 path
                winningIndex_010 = {1'b1,fifoWriteCounter[5:3],3'h2};
            end
            else begin
                smallestMetric_010 = path0Metric_010;  // Choose the 0 path
                winningIndex_010 = {1'b0,fifoWriteCounter[5:3],3'h2};
            end
            if (path1Metric_011 < path0Metric_011) begin
                smallestMetric_011 = path1Metric_011;   // Choose the 1 path
                winningIndex_011 = {1'b1,fifoWriteCounter[5:3],3'h3};
            end
            else begin
                smallestMetric_011 = path0Metric_011;  // Choose the 0 path
                winningIndex_011 = {1'b0,fifoWriteCounter[5:3],3'h3};
            end
            if (path1Metric_100 < path0Metric_100) begin
                smallestMetric_100 = path1Metric_100;   // Choose the 1 path
                winningIndex_100 = {1'b1,fifoWriteCounter[5:3],3'h4};
            end
            else begin
                smallestMetric_100 = path0Metric_100;  // Choose the 0 path
                winningIndex_100 = {1'b0,fifoWriteCounter[5:3],3'h4};
            end
            if (path1Metric_101 < path0Metric_101) begin
                smallestMetric_101 = path1Metric_101;   // Choose the 1 path
                winningIndex_101 = {1'b1,fifoWriteCounter[5:3],3'h5};
            end
            else begin
                smallestMetric_101 = path0Metric_101;  // Choose the 0 path
                winningIndex_101 = {1'b0,fifoWriteCounter[5:3],3'h5};
            end
            if (path1Metric_110 < path0Metric_110) begin
                smallestMetric_110 = path1Metric_110;   // Choose the 1 path
                winningIndex_110 = {1'b1,fifoWriteCounter[5:3],3'h6};
            end
            else begin
                smallestMetric_110 = path0Metric_110;  // Choose the 0 path
                winningIndex_110 = {1'b0,fifoWriteCounter[5:3],3'h6};
            end
            if (path1Metric_111 < path0Metric_111) begin
                smallestMetric_111 = path1Metric_111;   // Choose the 1 path
                winningIndex_111 = {1'b1,fifoWriteCounter[5:3],3'h7};
            end
            else begin
                smallestMetric_111 = path0Metric_111;  // Choose the 0 path
                winningIndex_111 = {1'b0,fifoWriteCounter[5:3],3'h7};
            end
        end
        else begin
            if (path1Metric_000 < path0Metric_000) begin
                smallestMetric_000 = path1Metric_000;   // Choose the 1 path
                winningIndex_000 = {fifoWriteCounter[6],1'b1,fifoWriteCounter[4:3],3'h0};
            end
            else begin
                smallestMetric_000 = path0Metric_000;  // Choose the 0 path
                winningIndex_000 = {fifoWriteCounter[6],1'b0,fifoWriteCounter[4:3],3'h0};
            end
            if (path1Metric_001 < path0Metric_001) begin
                smallestMetric_001 = path1Metric_001;   // Choose the 1 path
                winningIndex_001 = {fifoWriteCounter[6],1'b1,fifoWriteCounter[4:3],3'h1};
            end
            else begin
                smallestMetric_001 = path0Metric_001;  // Choose the 0 path
                winningIndex_001 = {fifoWriteCounter[6],1'b0,fifoWriteCounter[4:3],3'h1};
            end
            if (path1Metric_010 < path0Metric_010) begin
                smallestMetric_010 = path1Metric_010;   // Choose the 1 path
                winningIndex_010 = {fifoWriteCounter[6],1'b1,fifoWriteCounter[4:3],3'h2};
            end
            else begin
                smallestMetric_010 = path0Metric_010;  // Choose the 0 path
                winningIndex_010 = {fifoWriteCounter[6],1'b0,fifoWriteCounter[4:3],3'h2};
            end
            if (path1Metric_011 < path0Metric_011) begin
                smallestMetric_011 = path1Metric_011;   // Choose the 1 path
                winningIndex_011 = {fifoWriteCounter[6],1'b1,fifoWriteCounter[4:3],3'h3};
            end
            else begin
                smallestMetric_011 = path0Metric_011;  // Choose the 0 path
                winningIndex_011 = {fifoWriteCounter[6],1'b0,fifoWriteCounter[4:3],3'h3};
            end
            if (path1Metric_100 < path0Metric_100) begin
                smallestMetric_100 = path1Metric_100;   // Choose the 1 path
                winningIndex_100 = {fifoWriteCounter[6],1'b1,fifoWriteCounter[4:3],3'h4};
            end
            else begin
                smallestMetric_100 = path0Metric_100;  // Choose the 0 path
                winningIndex_100 = {fifoWriteCounter[6],1'b0,fifoWriteCounter[4:3],3'h4};
            end
            if (path1Metric_101 < path0Metric_101) begin
                smallestMetric_101 = path1Metric_101;   // Choose the 1 path
                winningIndex_101 = {fifoWriteCounter[6],1'b1,fifoWriteCounter[4:3],3'h5};
            end
            else begin
                smallestMetric_101 = path0Metric_101;  // Choose the 0 path
                winningIndex_101 = {fifoWriteCounter[6],1'b0,fifoWriteCounter[4:3],3'h5};
            end
            if (path1Metric_110 < path0Metric_110) begin
                smallestMetric_110 = path1Metric_110;   // Choose the 1 path
                winningIndex_110 = {fifoWriteCounter[6],1'b1,fifoWriteCounter[4:3],3'h6};
            end
            else begin
                smallestMetric_110 = path0Metric_110;  // Choose the 0 path
                winningIndex_110 = {fifoWriteCounter[6],1'b0,fifoWriteCounter[4:3],3'h6};
            end
            if (path1Metric_111 < path0Metric_111) begin
                smallestMetric_111 = path1Metric_111;   // Choose the 1 path
                winningIndex_111 = {fifoWriteCounter[6],1'b1,fifoWriteCounter[4:3],3'h7};
            end
            else begin
                smallestMetric_111 = path0Metric_111;  // Choose the 0 path
                winningIndex_111 = {fifoWriteCounter[6],1'b0,fifoWriteCounter[4:3],3'h7};
            end
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

    reg             [2:0]   tbWrAddr;
    always @(posedge clk) begin
        if (reset) begin
            tbWrAddr <= 0;
        end
        else if (fifoWriteEn) begin
            tbWrAddr <= tbWrAddr + 1;
        end
    end

    wire            [55:0]  tbBits;
    twoPortDistMem56x16 tbRam5(
        .clk(clk), 
        .we(fifoWriteEn), 
        .a({ppAddrBit,tbWrAddr}), 
        .d({winningIndex_111,winningIndex_110,winningIndex_101,winningIndex_100,
               winningIndex_011,winningIndex_010,winningIndex_001,winningIndex_000}), 
        .dpra({~ppAddrBit,winner6[5:3]}), 
        .qdpo_clk(clk),
        .dpo(tbBits)
    );

    always @* begin
        case (winner6[2:0])
            0:  winner5 = tbBits[ 6: 0];
            1:  winner5 = tbBits[13: 7];
            2:  winner5 = tbBits[20:14];
            3:  winner5 = tbBits[27:21];
            4:  winner5 = tbBits[34:28];
            5:  winner5 = tbBits[41:35];
            6:  winner5 = tbBits[48:42];
            7:  winner5 = tbBits[55:49];
        endcase
    end

    // Instantiate the fifos
    wire                    fifoReadEn;
    acsFifo #(.LOG2DEPTH(2)) fifo000(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_000),
        .rd_en(fifoReadEn),
        .dout(accMetric_000),
        .full(),
        .empty(fifoEmpty)
    );
    acsFifo #(.LOG2DEPTH(2)) fifo001(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_001),
        .rd_en(fifoReadEn),
        .dout(accMetric_001),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(2)) fifo010(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_010),
        .rd_en(fifoReadEn),
        .dout(accMetric_010),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(2)) fifo011(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_011),
        .rd_en(fifoReadEn),
        .dout(accMetric_011),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(2)) fifo100(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_100),
        .rd_en(fifoReadEn),
        .dout(accMetric_100),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(2)) fifo101(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_101),
        .rd_en(fifoReadEn),
        .dout(accMetric_101),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(2)) fifo110(
        .clk(clk),          
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_110),
        .rd_en(fifoReadEn),
        .dout(accMetric_110),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(2)) fifo111(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_111),
        .rd_en(fifoReadEn),
        .dout(accMetric_111),
        .full(),
        .empty()
    );

    reg             [3:0]   fifoReadCounter;
    assign                  fifoReadEn = !fifoEmpty
                                      && ( positiveTau ? (fifoReadCounter < 8) 
                                                       : (fifoReadCounter >= 4)
                                         ); 
    assign                  metricOutEn = fifoReadEn;
    assign                  startNextStage = positiveTau ? (fifoWriteEn && (fifoWriteCounter == 0))
                                                         : (fifoReadCounter == 3);
    always @(posedge clk) begin
        if (reset) begin
            fifoReadCounter <= 0;
        end
        else if (fifoReadCounter != 0) begin
            fifoReadCounter <= fifoReadCounter + 1;
        end
        else if (!fifoEmpty) begin
            fifoReadCounter <= fifoReadCounter + 1;
        end
        else begin
            fifoReadCounter <= 0;
        end
    end



endmodule