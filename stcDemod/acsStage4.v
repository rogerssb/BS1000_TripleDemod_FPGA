`timescale 1ns/1ps

module acsStage4(
    input                   clk,clkEn,reset,
    input                   positiveTau,
    input                   startFrame,
    input                   startBlock,
    input                   startStage,
    input   signed  [17:0]  in0Real,in0Imag,
    input                   accMetricInEn,
    input           [17:0]  accMetricIn_00,
    input           [17:0]  accMetricIn_01,
    input           [17:0]  accMetricIn_10,
    input           [17:0]  accMetricIn_11,
    input                   setupComplete,
    input                   setupOutputValid,
    input   signed  [17:0]  setupReal,setupImag,
    input                   flipTracebackPingPong,
    input           [6:0]   winner5,
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
    output  reg     [3:0]   detectedBits
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
    wire    signed  [17:0]  table4r_000,table4i_000;
    wire    signed  [17:0]  table4r_001,table4i_001;
    twoPortDistMem128x18 dpRam4r_00x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddr00x),
        .d(setupReal),
        .dpra(addr000),
        .dpo(table4r_000),
        .spo(table4r_001)
    );
    twoPortDistMem128x18 dpRam4i_00x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddr00x),
        .d(setupImag),
        .dpra(addr000),
        .dpo(table4i_000),
        .spo(table4i_001)
    );
    wire            [6:0]   addr010;
    wire            [6:0]   addr011;
    wire            [6:0]   spoAddr01x = setupOutputValid ? wrAddr : addr011;
    wire    signed  [17:0]  table4r_010,table4i_010;
    wire    signed  [17:0]  table4r_011,table4i_011;
    twoPortDistMem128x18 dpRam4r_01x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddr01x),
        .d(setupReal),
        .dpra(addr010),
        .dpo(table4r_010),
        .spo(table4r_011)
    );
    twoPortDistMem128x18 dpRam4i_01x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddr01x),
        .d(setupImag),
        .dpra(addr010),
        .dpo(table4i_010),
        .spo(table4i_011)
    );
    wire            [6:0]   addr100;
    wire            [6:0]   addr101;
    wire            [6:0]   spoAddr10x = setupOutputValid ? wrAddr : addr101;
    wire    signed  [17:0]  table4r_100,table4i_100;
    wire    signed  [17:0]  table4r_101,table4i_101;
    twoPortDistMem128x18 dpRam4r_10x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddr10x),
        .d(setupReal),
        .dpra(addr100),
        .dpo(table4r_100),
        .spo(table4r_101)
    );
    twoPortDistMem128x18 dpRam4i_10x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddr10x),
        .d(setupImag),
        .dpra(addr100),
        .dpo(table4i_100),
        .spo(table4i_101)
    );
    wire            [6:0]   addr110;
    wire            [6:0]   addr111;
    wire            [6:0]   spoAddr11x = setupOutputValid ? wrAddr : addr111;
    wire    signed  [17:0]  table4r_110,table4i_110;
    wire    signed  [17:0]  table4r_111,table4i_111;
    twoPortDistMem128x18 dpRam4r_11x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddr11x),
        .d(setupReal),
        .dpra(addr110),
        .dpo(table4r_110),
        .spo(table4r_111)
    );
    twoPortDistMem128x18 dpRam4i_11x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddr11x),
        .d(setupImag),
        .dpra(addr110),
        .dpo(table4i_110),
        .spo(table4i_111)
    );

    `define PER_TABLE_ADDRESS
    `ifdef PER_TABLE_ADDRESS

    // Count through the 16 states of the 8 acs units to generate 128 outputs.
    reg             [3:0]   metricAddr[0:7];
    reg                     startStageDly;
    integer                 k;
    always @(posedge clk) begin
        startStageDly <= startStage;
        for (k = 0; k < 8; k = k + 1) begin
            if (reset) begin
                metricAddr[k] <= 0;
            end
            else if (accMetricInEn && (metricAddr[k] > 0)) begin
                metricAddr[k] <= metricAddr[k] + 1;
            end
            else if (startStageDly) begin
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

    `endif //PER_TABLE_ADDRESS

    // Registers to hold the current block's input samples
    reg     signed  [17:0]  s0Real,s0Imag;
    always @(posedge clk) begin
        if (clkEn && startBlock) begin
            s0Real <= in0Real;
            s0Imag <= in0Imag;
        end
    end

    // Stage 4 ACS Units
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
        .y8Real(table4r_000),    .y8Imag(table4i_000),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_00),
        .accMetricOutEn(tmpMetricOutEn),
        .accMetricOut(accMetricTmp_000)
    );
    acsOp acs001(
        .clk(clk), .reset(startFrame),
        .y8Real(table4r_001),    .y8Imag(table4i_001),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(positiveTau ? accMetricIn_01 : accMetricIn_00),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_001)
    );
    acsOp acs010(
        .clk(clk), .reset(startFrame),
        .y8Real(table4r_010),    .y8Imag(table4i_010),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(positiveTau ? accMetricIn_00 : accMetricIn_01),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_010)
    );
    acsOp acs011(
        .clk(clk), .reset(startFrame),
        .y8Real(table4r_011),    .y8Imag(table4i_011),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_01),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_011)
    );
    acsOp acs100(
        .clk(clk), .reset(startFrame),
        .y8Real(table4r_100),    .y8Imag(table4i_100),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_10),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_100)
    );
    acsOp acs101(
        .clk(clk), .reset(startFrame),
        .y8Real(table4r_101),    .y8Imag(table4i_101),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(positiveTau ? accMetricIn_11 : accMetricIn_10),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_101)
    );
    acsOp acs110(
        .clk(clk), .reset(startFrame),
        .y8Real(table4r_110),    .y8Imag(table4i_110),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(positiveTau ? accMetricIn_10 : accMetricIn_11),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_110)
    );
    acsOp acs111(
        .clk(clk), .reset(startFrame),
        .y8Real(table4r_111),    .y8Imag(table4i_111),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_11),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_111)
    );

    // Create a delay line for comparing best paths
    // When tau is positive, we compare paths 16 states apart. When tau is
    // negative, 64 states apart. Since states are presented 8 at a time, the
    // delay is 2 clocks for positive tau and 8 clocks for negative tau.
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
    wire            [17:0]  path0Metric_000 =   positiveTau ? delayed_000[1] : delayed_000[7];
    wire            [17:0]  path0Metric_001 =   positiveTau ? delayed_001[1] : delayed_001[7];
    wire            [17:0]  path0Metric_010 =   positiveTau ? delayed_010[1] : delayed_010[7];
    wire            [17:0]  path0Metric_011 =   positiveTau ? delayed_011[1] : delayed_011[7];
    wire            [17:0]  path0Metric_100 =   positiveTau ? delayed_100[1] : delayed_100[7];
    wire            [17:0]  path0Metric_101 =   positiveTau ? delayed_101[1] : delayed_101[7];
    wire            [17:0]  path0Metric_110 =   positiveTau ? delayed_110[1] : delayed_110[7];
    wire            [17:0]  path0Metric_111 =   positiveTau ? delayed_111[1] : delayed_111[7];
    wire            [17:0]  path1Metric_000 =   accMetricTmp_000;
    wire            [17:0]  path1Metric_001 =   accMetricTmp_001;
    wire            [17:0]  path1Metric_010 =   accMetricTmp_010;
    wire            [17:0]  path1Metric_011 =   accMetricTmp_011;
    wire            [17:0]  path1Metric_100 =   accMetricTmp_100;
    wire            [17:0]  path1Metric_101 =   accMetricTmp_101;
    wire            [17:0]  path1Metric_110 =   accMetricTmp_110;
    wire            [17:0]  path1Metric_111 =   accMetricTmp_111;

    // Create a signal to control when path comparisons are made since only 64
    // of the 128 ACS outputs are used. Which 64 depends on the sign of tau.
    // Each comparison is used as an output twice to create a total of 128. Fifos
    // are used as temporary storage and input and output state machines control
    // the write and read operations.
    reg             [6:0]   fifoWriteCounter;
    reg             [7:0]   delayedEnSR;
    wire                    delayedEn =     positiveTau ? delayedEnSR[1] : delayedEnSR[7];
    wire                    fifoWriteEn =   delayedEn &&
                                        (   positiveTau ? !fifoWriteCounter[4]
                                                        : !fifoWriteCounter[6]);
    wire                    compareEn = fifoWriteEn;
    assign                  startNextStage = fifoWriteEn && (fifoWriteCounter == 0);
    always @(posedge clk) begin
        if (reset) begin
            fifoWriteCounter <= 0;
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
    reg             [6:0]   winningIndex_0000;
    reg             [6:0]   winningIndex_0001;
    reg             [6:0]   winningIndex_0010;
    reg             [6:0]   winningIndex_0011;
    reg             [6:0]   winningIndex_0100;
    reg             [6:0]   winningIndex_0101;
    reg             [6:0]   winningIndex_0110;
    reg             [6:0]   winningIndex_0111;
    reg             [6:0]   winningIndex_1000;
    reg             [6:0]   winningIndex_1001;
    reg             [6:0]   winningIndex_1010;
    reg             [6:0]   winningIndex_1011;
    reg             [6:0]   winningIndex_1100;
    reg             [6:0]   winningIndex_1101;
    reg             [6:0]   winningIndex_1110;
    reg             [6:0]   winningIndex_1111;
    always @* begin
        if (positiveTau) begin
            if (path1Metric_000 < path0Metric_000) begin
                smallestMetric_000 = path1Metric_000;   // Choose the 1 path
                winningIndex_0000 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b000};
                winningIndex_0001 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b000};
            end
            else begin
                smallestMetric_000 = path0Metric_000;  // Choose the 0 path
                winningIndex_0000 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b000};
                winningIndex_0001 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b000};
            end
            if (path1Metric_001 < path0Metric_001) begin
                smallestMetric_001 = path1Metric_001;   // Choose the 1 path
                winningIndex_0010 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b001};
                winningIndex_0011 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b001};
            end
            else begin
                smallestMetric_001 = path0Metric_001;  // Choose the 0 path
                winningIndex_0010 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b001};
                winningIndex_0011 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b001};
            end
            if (path1Metric_010 < path0Metric_010) begin
                smallestMetric_010 = path1Metric_010;   // Choose the 1 path
                winningIndex_0100 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b010};
                winningIndex_0101 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b010};
            end
            else begin
                smallestMetric_010 = path0Metric_010;  // Choose the 0 path
                winningIndex_0100 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b010};
                winningIndex_0101 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b010};
            end
            if (path1Metric_011 < path0Metric_011) begin
                smallestMetric_011 = path1Metric_011;   // Choose the 1 path
                winningIndex_0110 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b011};
                winningIndex_0111 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b011};
            end
            else begin
                smallestMetric_011 = path0Metric_011;  // Choose the 0 path
                winningIndex_0110 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b011};
                winningIndex_0111 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b011};
            end
            if (path1Metric_100 < path0Metric_100) begin
                smallestMetric_100 = path1Metric_100;   // Choose the 1 path
                winningIndex_1000 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b100};
                winningIndex_1001 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b100};
            end
            else begin
                smallestMetric_100 = path0Metric_100;  // Choose the 0 path
                winningIndex_1000 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b100};
                winningIndex_1001 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b100};
            end
            if (path1Metric_101 < path0Metric_101) begin
                smallestMetric_101 = path1Metric_101;   // Choose the 1 path
                winningIndex_1010 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b101};
                winningIndex_1011 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b101};
            end
            else begin
                smallestMetric_101 = path0Metric_101;  // Choose the 0 path
                winningIndex_1010 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b101};
                winningIndex_1011 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b101};
            end
            if (path1Metric_110 < path0Metric_110) begin
                smallestMetric_110 = path1Metric_110;   // Choose the 1 path
                winningIndex_1100 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b110};
                winningIndex_1101 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b110};
            end
            else begin
                smallestMetric_110 = path0Metric_110;  // Choose the 0 path
                winningIndex_1100 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b110};
                winningIndex_1101 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b110};
            end
            if (path1Metric_111 < path0Metric_111) begin
                smallestMetric_111 = path1Metric_111;   // Choose the 1 path
                winningIndex_1110 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b111};
                winningIndex_1111 = {fifoWriteCounter[6:5],1'b1,fifoWriteCounter[3],3'b111};
            end
            else begin
                smallestMetric_111 = path0Metric_111;  // Choose the 0 path
                winningIndex_1110 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b111};
                winningIndex_1111 = {fifoWriteCounter[6:5],1'b0,fifoWriteCounter[3],3'b111};
            end
        end
        else begin
            if (path1Metric_000 < path0Metric_000) begin
                smallestMetric_000 = path1Metric_000;   // Choose the 1 path
                winningIndex_0000 = {1'b1,fifoWriteCounter[5:3],3'b000};
                winningIndex_0100 = {1'b1,fifoWriteCounter[5:3],3'b000};
            end
            else begin
                smallestMetric_000 = path0Metric_000;  // Choose the 0 path
                winningIndex_0000 = {1'b0,fifoWriteCounter[5:3],3'b000};
                winningIndex_0100 = {1'b0,fifoWriteCounter[5:3],3'b000};
            end
            if (path1Metric_001 < path0Metric_001) begin
                smallestMetric_001 = path1Metric_001;   // Choose the 1 path
                winningIndex_0001 = {1'b1,fifoWriteCounter[5:3],3'b001};
                winningIndex_0101 = {1'b1,fifoWriteCounter[5:3],3'b001};
            end
            else begin
                smallestMetric_001 = path0Metric_001;  // Choose the 0 path
                winningIndex_0001 = {1'b0,fifoWriteCounter[5:3],3'b001};
                winningIndex_0101 = {1'b0,fifoWriteCounter[5:3],3'b001};
            end
            if (path1Metric_010 < path0Metric_010) begin
                smallestMetric_010 = path1Metric_010;   // Choose the 1 path
                winningIndex_0010 = {1'b1,fifoWriteCounter[5:3],3'b010};
                winningIndex_0110 = {1'b1,fifoWriteCounter[5:3],3'b010};
            end
            else begin
                smallestMetric_010 = path0Metric_010;  // Choose the 0 path
                winningIndex_0010 = {1'b0,fifoWriteCounter[5:3],3'b010};
                winningIndex_0110 = {1'b0,fifoWriteCounter[5:3],3'b010};
            end
            if (path1Metric_011 < path0Metric_011) begin
                smallestMetric_011 = path1Metric_011;   // Choose the 1 path
                winningIndex_0011 = {1'b1,fifoWriteCounter[5:3],3'b011};
                winningIndex_0111 = {1'b1,fifoWriteCounter[5:3],3'b011};
            end
            else begin
                smallestMetric_011 = path0Metric_011;  // Choose the 0 path
                winningIndex_0011 = {1'b0,fifoWriteCounter[5:3],3'b011};
                winningIndex_0111 = {1'b0,fifoWriteCounter[5:3],3'b011};
            end
            if (path1Metric_100 < path0Metric_100) begin
                smallestMetric_100 = path1Metric_100;   // Choose the 1 path
                winningIndex_1000 = {1'b1,fifoWriteCounter[5:3],3'b100};
                winningIndex_1100 = {1'b1,fifoWriteCounter[5:3],3'b100};
            end
            else begin
                smallestMetric_100 = path0Metric_100;  // Choose the 0 path
                winningIndex_1000 = {1'b0,fifoWriteCounter[5:3],3'b100};
                winningIndex_1100 = {1'b0,fifoWriteCounter[5:3],3'b100};
            end
            if (path1Metric_101 < path0Metric_101) begin
                smallestMetric_101 = path1Metric_101;   // Choose the 1 path
                winningIndex_1001 = {1'b1,fifoWriteCounter[5:3],3'b101};
                winningIndex_1101 = {1'b1,fifoWriteCounter[5:3],3'b101};
            end
            else begin
                smallestMetric_101 = path0Metric_101;  // Choose the 0 path
                winningIndex_1001 = {1'b0,fifoWriteCounter[5:3],3'b101};
                winningIndex_1101 = {1'b0,fifoWriteCounter[5:3],3'b101};
            end
            if (path1Metric_110 < path0Metric_110) begin
                smallestMetric_110 = path1Metric_110;   // Choose the 1 path
                winningIndex_1010 = {1'b1,fifoWriteCounter[5:3],3'b110};
                winningIndex_1110 = {1'b1,fifoWriteCounter[5:3],3'b110};
            end
            else begin
                smallestMetric_110 = path0Metric_110;  // Choose the 0 path
                winningIndex_1010 = {1'b0,fifoWriteCounter[5:3],3'b110};
                winningIndex_1110 = {1'b0,fifoWriteCounter[5:3],3'b110};
            end
            if (path1Metric_111 < path0Metric_111) begin
                smallestMetric_111 = path1Metric_111;   // Choose the 1 path
                winningIndex_1011 = {1'b1,fifoWriteCounter[5:3],3'b111};
                winningIndex_1111 = {1'b1,fifoWriteCounter[5:3],3'b111};
            end
            else begin
                smallestMetric_111 = path0Metric_111;  // Choose the 0 path
                winningIndex_1011 = {1'b0,fifoWriteCounter[5:3],3'b111};
                winningIndex_1111 = {1'b0,fifoWriteCounter[5:3],3'b111};
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

    // Stage 4 is odd in that winning paths are used as outputs twice. Duplicating fifos
    // takes care of this for the accumulated metric output but we need to do something else
    // for the traceback. Here, we will double the width of the traceback memory
    wire            [63:0]  tbBits;
    twoPortDistMem64x16 tbRam4(
        .clk(clk),
        .we(fifoWriteEn),
        .a({ppAddrBit,tbWrAddr}),
        .d({winningIndex_1111[6:3],winningIndex_1110[6:3],winningIndex_1101[6:3],winningIndex_1100[6:3],
            winningIndex_1011[6:3],winningIndex_1010[6:3],winningIndex_1001[6:3],winningIndex_1000[6:3],
            winningIndex_0111[6:3],winningIndex_0110[6:3],winningIndex_0101[6:3],winningIndex_0100[6:3],
            winningIndex_0011[6:3],winningIndex_0010[6:3],winningIndex_0001[6:3],winningIndex_0000[6:3]}
            ),
        .dpra({~ppAddrBit,winner5[6:4]}),
        .qdpo_clk(clk),
        .dpo(tbBits)
    );

    always @* begin
        case (winner5[3:0])
            0:  detectedBits = tbBits[ 3: 0];
            1:  detectedBits = tbBits[ 7: 4];
            2:  detectedBits = tbBits[11: 8];
            3:  detectedBits = tbBits[15:12];
            4:  detectedBits = tbBits[19:16];
            5:  detectedBits = tbBits[23:20];
            6:  detectedBits = tbBits[27:24];
            7:  detectedBits = tbBits[31:28];
            8:  detectedBits = tbBits[35:32];
            9:  detectedBits = tbBits[39:36];
           10:  detectedBits = tbBits[43:40];
           11:  detectedBits = tbBits[47:44];
           12:  detectedBits = tbBits[51:48];
           13:  detectedBits = tbBits[55:52];
           14:  detectedBits = tbBits[59:56];
           15:  detectedBits = tbBits[63:60];
        endcase
    end

    // Instantiate the fifos
    wire                    fifo0ReadEn,fifo1ReadEn;
    wire            [17:0]  accMetric0_000,accMetric1_000;
    acsFifo #(.LOG2DEPTH(3)) fifo0_000(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_000),
        .rd_en(fifo0ReadEn),
        .dout(accMetric0_000),
        .full(),
        .empty(fifo0Empty)
    );
    acsFifo #(.LOG2DEPTH(3)) fifo1_000(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_100),
        .rd_en(fifo1ReadEn),
        .dout(accMetric1_000),
        .full(),
        .empty(fifo1Empty)
    );
    wire            [17:0]  accMetric0_001,accMetric1_001;
    acsFifo #(.LOG2DEPTH(3)) fifo0_001(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_000 : smallestMetric_001),
        .rd_en(fifo0ReadEn),
        .dout(accMetric0_001),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(3)) fifo1_001(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_100 : smallestMetric_101),
        .rd_en(fifo1ReadEn),
        .dout(accMetric1_001),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric0_010,accMetric1_010;
    acsFifo #(.LOG2DEPTH(3)) fifo0_010(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_001 : smallestMetric_010),
        .rd_en(fifo0ReadEn),
        .dout(accMetric0_010),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(3)) fifo1_010(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_101 : smallestMetric_110),
        .rd_en(fifo1ReadEn),
        .dout(accMetric1_010),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric0_011,accMetric1_011;
    acsFifo #(.LOG2DEPTH(3)) fifo0_011(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_001 : smallestMetric_011),
        .rd_en(fifo0ReadEn),
        .dout(accMetric0_011),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(3)) fifo1_011(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_101 : smallestMetric_111),
        .rd_en(fifo1ReadEn),
        .dout(accMetric1_011),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric0_100,accMetric1_100;
    acsFifo #(.LOG2DEPTH(3)) fifo0_100(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_010 : smallestMetric_000),
        .rd_en(fifo0ReadEn),
        .dout(accMetric0_100),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(3)) fifo1_100(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_110 : smallestMetric_100),
        .rd_en(fifo1ReadEn),
        .dout(accMetric1_100),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric0_101,accMetric1_101;
    acsFifo #(.LOG2DEPTH(3)) fifo0_101(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_010 : smallestMetric_001),
        .rd_en(fifo0ReadEn),
        .dout(accMetric0_101),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(3)) fifo1_101(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_110 : smallestMetric_101),
        .rd_en(fifo1ReadEn),
        .dout(accMetric1_101),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric0_110,accMetric1_110;
    acsFifo #(.LOG2DEPTH(3)) fifo0_110(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_011 : smallestMetric_010),
        .rd_en(fifo0ReadEn),
        .dout(accMetric0_110),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(3)) fifo1_110(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_111 : smallestMetric_110),
        .rd_en(fifo1ReadEn),
        .dout(accMetric1_110),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric0_111,accMetric1_111;
    acsFifo #(.LOG2DEPTH(3)) fifo0_111(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_011 : smallestMetric_011),
        .rd_en(fifo0ReadEn),
        .dout(accMetric0_111),
        .full(),
        .empty()
    );
    acsFifo #(.LOG2DEPTH(3)) fifo1_111(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(positiveTau ? smallestMetric_111 : smallestMetric_111),
        .rd_en(fifo1ReadEn),
        .dout(accMetric1_111),
        .full(),
        .empty()
    );

    reg             [3:0]   fifoReadCounter;
    assign                  fifo0ReadEn = !fifoReadCounter[0] && !fifo0Empty;
    assign                  fifo1ReadEn =  fifoReadCounter[0] && !fifo1Empty;
    assign                  metricOutEn = !fifo0Empty || (fifoReadCounter != 0);
    always @(posedge clk) begin
        if (reset) begin
            fifoReadCounter <= 0;
        end
        else if (fifoReadCounter != 0) begin
            fifoReadCounter <= fifoReadCounter + 1;
        end
        else if (!fifo0Empty) begin
            fifoReadCounter <= fifoReadCounter + 1;
        end
        else begin
            fifoReadCounter <= 0;
        end
    end

    always @* begin
        if (fifo0ReadEn) begin
            accMetric_000 = accMetric0_000;
            accMetric_001 = accMetric0_001;
            accMetric_010 = accMetric0_010;
            accMetric_011 = accMetric0_011;
            accMetric_100 = accMetric0_100;
            accMetric_101 = accMetric0_101;
            accMetric_110 = accMetric0_110;
            accMetric_111 = accMetric0_111;
        end
        else begin
            accMetric_000 = accMetric1_000;
            accMetric_001 = accMetric1_001;
            accMetric_010 = accMetric1_010;
            accMetric_011 = accMetric1_011;
            accMetric_100 = accMetric1_100;
            accMetric_101 = accMetric1_101;
            accMetric_110 = accMetric1_110;
            accMetric_111 = accMetric1_111;
        end
    end

endmodule
