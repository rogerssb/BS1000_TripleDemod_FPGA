`timescale 1ns/1ps

module acsStage5(
    input                   clk,clkEn,reset,
    input                   positiveTau,
    input                   startFrame,
    input                   startBlock,
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
    output                  metricOutEn,
    output  reg     [17:0]  accMetric_00,
    output  reg     [17:0]  accMetric_01,
    output  reg     [17:0]  accMetric_10,
    output  reg     [17:0]  accMetric_11
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
                metricAddr[k] <= 15;
            end
            else if (accMetricInEn) begin
                metricAddr[k] <= metricAddr[k] + 1;
            end
            else if (clkEn && startBlock) begin
                metricAddr[k] <= 0;
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
    integer                 k;
    always @(posedge clk) begin
        if (reset) begin
            metricAddr <= 15;
        end
        else if (accMetricInEn) begin
            metricAddr <= metricAddr + 1;
        end
        else if (clkEn && startBlock) begin
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
    // the comparisons are staggered in two sets of 32 acs pairs. Since we want
    // to decrease the number of simultaneous outputs from 8 to 4, fifos are used
    // as temporary storage and input and output state machines control the
    // read and write operations.
    reg             [6:0]   fifoWriteCounter;
    reg             [7:0]   delayedEnSR;
    wire                    delayedEn =     positiveTau ? delayedEnSR[7] : delayedEnSR[3];
    wire                    fifoWriteEn =   delayedEn &&
                                        (   positiveTau ? !fifoWriteCounter[6]
                                                        : !fifoWriteCounter[5]);
    wire                    compareEn = fifoWriteEn;
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
    always @* begin
        if (positiveTau) begin
            if (path1Metric_000 < path0Metric_000) begin
                smallestMetric_000 = path1Metric_000;   // Choose the 1 path
            end
            else begin
                smallestMetric_000 = path0Metric_000;  // Choose the 0 path
            end
            if (path1Metric_001 < path0Metric_001) begin
                smallestMetric_001 = path1Metric_001;   // Choose the 1 path
            end
            else begin
                smallestMetric_001 = path0Metric_001;  // Choose the 0 path
            end
            if (path1Metric_010 < path0Metric_010) begin
                smallestMetric_010 = path1Metric_010;   // Choose the 1 path
            end
            else begin
                smallestMetric_010 = path0Metric_010;  // Choose the 0 path
            end
            if (path1Metric_011 < path0Metric_011) begin
                smallestMetric_011 = path1Metric_011;   // Choose the 1 path
            end
            else begin
                smallestMetric_011 = path0Metric_011;  // Choose the 0 path
            end
            if (path1Metric_100 < path0Metric_100) begin
                smallestMetric_100 = path1Metric_100;   // Choose the 1 path
            end
            else begin
                smallestMetric_100 = path0Metric_100;  // Choose the 0 path
            end
            if (path1Metric_101 < path0Metric_101) begin
                smallestMetric_101 = path1Metric_101;   // Choose the 1 path
            end
            else begin
                smallestMetric_101 = path0Metric_101;  // Choose the 0 path
            end
            if (path1Metric_110 < path0Metric_110) begin
                smallestMetric_110 = path1Metric_110;   // Choose the 1 path
            end
            else begin
                smallestMetric_110 = path0Metric_110;  // Choose the 0 path
            end
            if (path1Metric_111 < path0Metric_111) begin
                smallestMetric_111 = path1Metric_111;   // Choose the 1 path
            end
            else begin
                smallestMetric_111 = path0Metric_111;  // Choose the 0 path
            end
        end
        else begin
            if (path1Metric_000 < path0Metric_000) begin
                smallestMetric_000 = path1Metric_000;   // Choose the 1 path
            end
            else begin
                smallestMetric_000 = path0Metric_000;  // Choose the 0 path
            end
            if (path1Metric_001 < path0Metric_001) begin
                smallestMetric_001 = path1Metric_001;   // Choose the 1 path
            end
            else begin
                smallestMetric_001 = path0Metric_001;  // Choose the 0 path
            end
            if (path1Metric_010 < path0Metric_010) begin
                smallestMetric_010 = path1Metric_010;   // Choose the 1 path
            end
            else begin
                smallestMetric_010 = path0Metric_010;  // Choose the 0 path
            end
            if (path1Metric_011 < path0Metric_011) begin
                smallestMetric_011 = path1Metric_011;   // Choose the 1 path
            end
            else begin
                smallestMetric_011 = path0Metric_011;  // Choose the 0 path
            end
            if (path1Metric_100 < path0Metric_100) begin
                smallestMetric_100 = path1Metric_100;   // Choose the 1 path
            end
            else begin
                smallestMetric_100 = path0Metric_100;  // Choose the 0 path
            end
            if (path1Metric_101 < path0Metric_101) begin
                smallestMetric_101 = path1Metric_101;   // Choose the 1 path
            end
            else begin
                smallestMetric_101 = path0Metric_101;  // Choose the 0 path
            end
            if (path1Metric_110 < path0Metric_110) begin
                smallestMetric_110 = path1Metric_110;   // Choose the 1 path
            end
            else begin
                smallestMetric_110 = path0Metric_110;  // Choose the 0 path
            end
            if (path1Metric_111 < path0Metric_111) begin
                smallestMetric_111 = path1Metric_111;   // Choose the 1 path
            end
            else begin
                smallestMetric_111 = path0Metric_111;  // Choose the 0 path
            end
        end
    end

    `define USE_ACS_FIFO
    `ifdef USE_ACS_FIFO

    // Instantiate the fifos
    wire                    fifoReadEn;
    wire            [17:0]  accMetric000;
    acsFifo #(.LOG2DEPTH(3)) fifo000(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_000),
        .rd_en(fifoReadEn),
        .dout(accMetric000),
        .full(),
        .empty(fifoEmpty)
    );
    wire            [17:0]  accMetric001;
    acsFifo #(.LOG2DEPTH(3)) fifo001(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_001),
        .rd_en(fifoReadEn),
        .dout(accMetric001),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric010;
    acsFifo #(.LOG2DEPTH(3)) fifo010(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_010),
        .rd_en(fifoReadEn),
        .dout(accMetric010),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric011;
    acsFifo #(.LOG2DEPTH(3)) fifo011(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_011),
        .rd_en(fifoReadEn),
        .dout(accMetric011),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric100;
    acsFifo #(.LOG2DEPTH(3)) fifo100(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_100),
        .rd_en(fifoReadEn),
        .dout(accMetric100),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric101;
    acsFifo #(.LOG2DEPTH(3)) fifo101(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_101),
        .rd_en(fifoReadEn),
        .dout(accMetric101),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric110;
    acsFifo #(.LOG2DEPTH(3)) fifo110(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_110),
        .rd_en(fifoReadEn),
        .dout(accMetric110),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric111;
    acsFifo #(.LOG2DEPTH(3)) fifo111(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_111),
        .rd_en(fifoReadEn),
        .dout(accMetric111),
        .full(),
        .empty()
    );

    reg             [3:0]   fifoReadCounter;
    assign                  fifoReadEn = !fifoReadCounter[0] && !fifoEmpty;
    assign                  metricOutEn = !fifoEmpty || (fifoReadCounter != 0);
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

    reg             [17:0]  tmpMetric_00;
    reg             [17:0]  tmpMetric_01;
    reg             [17:0]  tmpMetric_10;
    reg             [17:0]  tmpMetric_11;
    always @(posedge clk) begin
        if (fifoReadEn) begin
            tmpMetric_00 <= accMetric100;
            tmpMetric_01 <= accMetric101;
            tmpMetric_10 <= accMetric110;
            tmpMetric_11 <= accMetric111;
        end
    end

    always @* begin
        if (fifoReadEn) begin
            accMetric_00 <= accMetric000;
            accMetric_01 <= accMetric001;
            accMetric_10 <= accMetric010;
            accMetric_11 <= accMetric011;
        end
        else begin
            accMetric_00 <= tmpMetric_00;
            accMetric_01 <= tmpMetric_01;
            accMetric_10 <= tmpMetric_10;
            accMetric_11 <= tmpMetric_11;
        end
    end



    `else //USE_ACS_FIFO

    // Instantiate the fifos
    wire                    fifoReadEn;
    wire            [17:0]  accMetric000;
    fifoDistMem32x18 fifo000(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_000),
        .rd_en(fifoReadEn),
        .dout(accMetric000),
        .full(),
        .empty(fifoEmpty),
        .wr_rst_busy(),
        .rd_rst_busy()
    );
    wire            [17:0]  accMetric001;
    fifoDistMem32x18 fifo001(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_001),
        .rd_en(fifoReadEn),
        .dout(accMetric001),
        .full(),
        .empty(),
        .wr_rst_busy(),
        .rd_rst_busy()
    );
    wire            [17:0]  accMetric010;
    fifoDistMem32x18 fifo010(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_010),
        .rd_en(fifoReadEn),
        .dout(accMetric010),
        .full(),
        .empty(),
        .wr_rst_busy(),
        .rd_rst_busy()
    );
    wire            [17:0]  accMetric011;
    fifoDistMem32x18 fifo011(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_011),
        .rd_en(fifoReadEn),
        .dout(accMetric011),
        .full(),
        .empty(),
        .wr_rst_busy(),
        .rd_rst_busy()
    );
    wire            [17:0]  accMetric100;
    fifoDistMem32x18 fifo100(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_100),
        .rd_en(fifoReadEn),
        .dout(accMetric100),
        .full(),
        .empty(),
        .wr_rst_busy(),
        .rd_rst_busy()
    );
    wire            [17:0]  accMetric101;
    fifoDistMem32x18 fifo101(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_101),
        .rd_en(fifoReadEn),
        .dout(accMetric101),
        .full(),
        .empty(),
        .wr_rst_busy(),
        .rd_rst_busy()
    );
    wire            [17:0]  accMetric110;
    fifoDistMem32x18 fifo110(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_110),
        .rd_en(fifoReadEn),
        .dout(accMetric110),
        .full(),
        .empty(),
        .wr_rst_busy(),
        .rd_rst_busy()
    );
    wire            [17:0]  accMetric111;
    fifoDistMem32x18 fifo111(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_111),
        .rd_en(fifoReadEn),
        .dout(accMetric111),
        .full(),
        .empty(),
        .wr_rst_busy(),
        .rd_rst_busy()
    );

    reg             [3:0]   fifoReadCounter;
    assign                  fifoReadEn = !fifoReadCounter[0] && !fifoEmpty;
    reg                     fifoOutputAvailable;
    reg             [1:0]   metricOutEnSR;
    always @(posedge clk) begin
        if (reset) begin
            fifoReadCounter <= 0;
            metricOutEnSR <= {metricOutEnSR[0],1'b0};
        end
        else if (fifoReadCounter != 0) begin
            fifoReadCounter <= fifoReadCounter + 1;
            metricOutEnSR <= {metricOutEnSR[0],1'b1};
        end
        else if (!fifoEmpty) begin
            fifoReadCounter <= fifoReadCounter + 1;
            metricOutEnSR <= {metricOutEnSR[0],1'b1};
        end
        else begin
            fifoReadCounter <= 0;
            metricOutEnSR <= {metricOutEnSR[0],1'b0};
        end
        fifoOutputAvailable <= fifoReadEn;
    end
    assign                  metricOutEn = metricOutEnSR[1];

    reg             [17:0]  tmpMetric_00;
    reg             [17:0]  tmpMetric_01;
    reg             [17:0]  tmpMetric_10;
    reg             [17:0]  tmpMetric_11;
    always @(posedge clk) begin
        if (fifoOutputAvailable) begin
            accMetric_00 <= accMetric000;
            accMetric_01 <= accMetric001;
            accMetric_10 <= accMetric010;
            accMetric_11 <= accMetric011;
            tmpMetric_00 <= accMetric100;
            tmpMetric_01 <= accMetric101;
            tmpMetric_10 <= accMetric110;
            tmpMetric_11 <= accMetric111;
        end
        else begin
            accMetric_00 <= tmpMetric_00;
            accMetric_01 <= tmpMetric_01;
            accMetric_10 <= tmpMetric_10;
            accMetric_11 <= tmpMetric_11;
        end
    end

    `endif //USE_ACS_FIFO

endmodule
