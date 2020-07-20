`timescale 1ns/1ps

module acsStage6(
    input                   clk,clkEn,reset,
    input                   positiveTau,
    input                   startFrame,
    input                   startBlock,
    input   signed  [17:0]  in0Real,in0Imag,
    input                   accMetricInEn,
    input           [17:0]  accMetricIn_00,
    input           [17:0]  accMetricIn_01,
    input           [17:0]  accMetricIn_10,
    input           [17:0]  accMetricIn_11,
    input                   setupComplete,
    input                   setupOutputValid,
    input   signed  [17:0]  setupReal,setupImag,
    output                  metricOutEn,
    output  reg     [17:0]  accMetric_0,
    output  reg     [17:0]  accMetric_1
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
    wire            [5:0]   spoAddr0x = setupOutputValid ? wrAddr : addr01;
    wire    signed  [17:0]  table6r_00,table6i_00;
    wire    signed  [17:0]  table6r_01,table6i_01;
    twoPortDistMem64x18 dpRam6r_0x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddr0x),
        .d(setupReal),
        .dpra(addr00),
        .dpo(table6r_00),
        .spo(table6r_01)
    );
    twoPortDistMem64x18 dpRam6i_0x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddr0x),
        .d(setupImag),
        .dpra(addr00),
        .dpo(table6i_00),
        .spo(table6i_01)
    );
    wire            [5:0]   addr10;
    wire            [5:0]   addr11;
    wire            [5:0]   spoAddr1x = setupOutputValid ? wrAddr : addr11;
    wire    signed  [17:0]  table6r_10,table6i_10;
    wire    signed  [17:0]  table6r_11,table6i_11;
    twoPortDistMem64x18 dpRam6r_1x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddr1x),
        .d(setupReal),
        .dpra(addr10),
        .dpo(table6r_10),
        .spo(table6r_11)
    );
    twoPortDistMem64x18 dpRam6i_1x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddr1x),
        .d(setupImag),
        .dpra(addr10),
        .dpo(table6i_10),
        .spo(table6i_11)
    );

    // Count through the 16 states of the 4 acs units to generate 64 outputs.
    reg             [3:0]   metricAddr;
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
        else begin
        end
    end
    assign                  addr00 =    {metricAddr,2'b00};
    assign                  addr01 =    {metricAddr,2'b01};
    assign                  addr10 =    {metricAddr,2'b10};
    assign                  addr11 =    {metricAddr,2'b11};

    // Registers to hold the current block's input samples
    reg     signed  [17:0]  s0Real,s0Imag;
    always @(posedge clk) begin
        if (clkEn && startBlock) begin
            s0Real <= in0Real;
            s0Imag <= in0Imag;
        end
    end

    // Stage 6 ACS Units
    wire            [17:0]  accMetricTmp_00;
    wire            [17:0]  accMetricTmp_01;
    wire            [17:0]  accMetricTmp_10;
    wire            [17:0]  accMetricTmp_11;
    acsOp acs00(
        .clk(clk), .reset(startFrame),
        .y8Real(table6r_00),    .y8Imag(table6i_00),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_00),
        .accMetricOutEn(tmpMetricOutEn),
        .accMetricOut(accMetricTmp_00)
    );
    acsOp acs01(
        .clk(clk), .reset(startFrame),
        .y8Real(table6r_01),    .y8Imag(table6i_01),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_01),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_01)
    );
    acsOp acs10(
        .clk(clk), .reset(startFrame),
        .y8Real(table6r_10),    .y8Imag(table6i_10),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_10),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_10)
    );
    acsOp acs11(
        .clk(clk), .reset(startFrame),
        .y8Real(table6r_11),    .y8Imag(table6i_11),
        .sReal(s0Real),         .sImag(s0Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_11),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_11)
    );

    // Create a delay line for comparing best paths
    // When tau is positive, we compare paths 16 states apart. When tau is
    // negative, 32 states apart. Since states are presented 4 at a time, the
    // delay is 4 clocks for positive tau and 8 clocks for negative tau.
    reg             [17:0]  delayed_00[0:7];
    reg             [17:0]  delayed_01[0:7];
    reg             [17:0]  delayed_10[0:7];
    reg             [17:0]  delayed_11[0:7];
    integer                 i;
    always @(posedge clk) begin
        delayed_00[0] <= accMetricTmp_00;
        delayed_01[0] <= accMetricTmp_01;
        delayed_10[0] <= accMetricTmp_10;
        delayed_11[0] <= accMetricTmp_11;
        for (i = 0; i < 7; i = i + 1) begin
            delayed_00[i+1] <= delayed_00[i];
            delayed_01[i+1] <= delayed_01[i];
            delayed_10[i+1] <= delayed_10[i];
            delayed_11[i+1] <= delayed_11[i];
        end
    end
    wire            [17:0]  path0Metric_00 =   positiveTau ? delayed_00[3] : delayed_00[7];
    wire            [17:0]  path0Metric_01 =   positiveTau ? delayed_01[3] : delayed_01[7];
    wire            [17:0]  path0Metric_10 =   positiveTau ? delayed_10[3] : delayed_10[7];
    wire            [17:0]  path0Metric_11 =   positiveTau ? delayed_11[3] : delayed_11[7];
    wire            [17:0]  path1Metric_00 =   accMetricTmp_00;
    wire            [17:0]  path1Metric_01 =   accMetricTmp_01;
    wire            [17:0]  path1Metric_10 =   accMetricTmp_10;
    wire            [17:0]  path1Metric_11 =   accMetricTmp_11;

    // A total of 32 comparisons are made between pairs of acs outputs. When
    // tau is negative, the 32 comparisons are sequential. When tau is positive,
    // the comparisons are staggered in two sets of 16 acs pairs. Since we want
    // to decrease the number of simultaneous outputs from 4 to 2, fifos are used
    // as temporary storage and input and output state machines control the
    // read and write operations.
    reg             [3:0]   fifoWriteCounter;
    reg             [7:0]   delayedEnSR;
    wire                    delayedEn =     positiveTau ? delayedEnSR[3] : delayedEnSR[7];
    wire                    fifoWriteEn =   delayedEn &&
                                        (   positiveTau ? !fifoWriteCounter[2]
                                                        : !fifoWriteCounter[3]);
    wire                    compareEn = fifoWriteEn;
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
            fifoWriteCounter <= fifoWriteCounter + 1;
        end
    end

    // Select the best path
    reg             [17:0]  smallestMetric_00;
    reg             [17:0]  smallestMetric_01;
    reg             [17:0]  smallestMetric_10;
    reg             [17:0]  smallestMetric_11;
    always @* begin
        if (positiveTau) begin
            if (path1Metric_00 < path0Metric_00) begin
                smallestMetric_00 = path1Metric_00;   // Choose the 1 path
            end
            else begin
                smallestMetric_00 = path0Metric_00;  // Choose the 0 path
            end
            if (path1Metric_01 < path0Metric_01) begin
                smallestMetric_01 = path1Metric_01;   // Choose the 1 path
            end
            else begin
                smallestMetric_01 = path0Metric_01;  // Choose the 0 path
            end
            if (path1Metric_10 < path0Metric_10) begin
                smallestMetric_10 = path1Metric_10;   // Choose the 1 path
            end
            else begin
                smallestMetric_10 = path0Metric_10;  // Choose the 0 path
            end
            if (path1Metric_11 < path0Metric_11) begin
                smallestMetric_11 = path1Metric_11;   // Choose the 1 path
            end
            else begin
                smallestMetric_11 = path0Metric_11;  // Choose the 0 path
            end
        end
        else begin
            if (path1Metric_00 < path0Metric_00) begin
                smallestMetric_00 = path1Metric_00;   // Choose the 1 path
            end
            else begin
                smallestMetric_00 = path0Metric_00;  // Choose the 0 path
            end
            if (path1Metric_01 < path0Metric_01) begin
                smallestMetric_01 = path1Metric_01;   // Choose the 1 path
            end
            else begin
                smallestMetric_01 = path0Metric_01;  // Choose the 0 path
            end
            if (path1Metric_10 < path0Metric_10) begin
                smallestMetric_10 = path1Metric_10;   // Choose the 1 path
            end
            else begin
                smallestMetric_10 = path0Metric_10;  // Choose the 0 path
            end
            if (path1Metric_11 < path0Metric_11) begin
                smallestMetric_11 = path1Metric_11;   // Choose the 1 path
            end
            else begin
                smallestMetric_11 = path0Metric_11;  // Choose the 0 path
            end
        end
    end

    `define USE_ACS_FIFO
    `ifdef USE_ACS_FIFO

    // Instantiate the fifos
    wire                    fifoReadEn;
    wire            [17:0]  accMetric00;
    acsFifo #(.LOG2DEPTH(3)) fifo00(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_00),
        .rd_en(fifoReadEn),
        .dout(accMetric00),
        .full(),
        .empty(fifoEmpty)
    );
    wire            [17:0]  accMetric01;
    acsFifo #(.LOG2DEPTH(3)) fifo01(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_01),
        .rd_en(fifoReadEn),
        .dout(accMetric01),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric10;
    acsFifo #(.LOG2DEPTH(3)) fifo10(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_10),
        .rd_en(fifoReadEn),
        .dout(accMetric10),
        .full(),
        .empty()
    );
    wire            [17:0]  accMetric11;
    acsFifo #(.LOG2DEPTH(3)) fifo11(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_11),
        .rd_en(fifoReadEn),
        .dout(accMetric11),
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

    reg             [17:0]  tmpMetric_0;
    reg             [17:0]  tmpMetric_1;
    always @(posedge clk) begin
        if (fifoReadEn) begin
            tmpMetric_0 <= accMetric10;
            tmpMetric_1 <= accMetric11;
        end
    end

    always @* begin
        if (fifoReadEn) begin
            accMetric_0 <= accMetric00;
            accMetric_1 <= accMetric01;
        end
        else begin
            accMetric_0 <= tmpMetric_0;
            accMetric_1 <= tmpMetric_1;
        end
    end

    `else //USE_ACS_FIFO

    // Instantiate the fifos
    wire                    fifoReadEn;
    wire            [17:0]  accMetric00;
    fifoDistMem32x18 fifo00(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_00),
        .rd_en(fifoReadEn),
        .dout(accMetric00),
        .full(),
        .empty(fifoEmpty),
        .wr_rst_busy(),
        .rd_rst_busy()
    );
    wire            [17:0]  accMetric01;
    fifoDistMem32x18 fifo01(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_01),
        .rd_en(fifoReadEn),
        .dout(accMetric01),
        .full(),
        .empty(),
        .wr_rst_busy(),
        .rd_rst_busy()
    );
    wire            [17:0]  accMetric10;
    fifoDistMem32x18 fifo10(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_10),
        .rd_en(fifoReadEn),
        .dout(accMetric10),
        .full(),
        .empty(),
        .wr_rst_busy(),
        .rd_rst_busy()
    );
    wire            [17:0]  accMetric11;
    fifoDistMem32x18 fifo11(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_11),
        .rd_en(fifoReadEn),
        .dout(accMetric11),
        .full(),
        .empty(),
        .wr_rst_busy(),
        .rd_rst_busy()
    );

    reg             [3:0]   fifoReadCounter;
    assign                  fifoReadEn = !fifoReadCounter[0] && !fifoEmpty;
    reg                     fifoOutputAvailable;
    reg             [1:0]   metricOutEnSR;
    assign                  metricOutEn = metricOutEnSR[1];
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

    reg             [17:0]  tmpMetric_0;
    reg             [17:0]  tmpMetric_1;
    always @(posedge clk) begin
        if (fifoOutputAvailable) begin
            accMetric_0 <= accMetric00;
            accMetric_1 <= accMetric01;
            tmpMetric_0 <= accMetric10;
            tmpMetric_1 <= accMetric11;
        end
        else begin
            accMetric_0 <= tmpMetric_0;
            accMetric_1 <= tmpMetric_1;
        end
    end

    `endif //USE_ACS_FIFOS
endmodule
