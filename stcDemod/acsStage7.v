`timescale 1ns/1ps

module acsStage7(
    input                   clk,clkEn,reset,
    input                   positiveTau,
    input                   startFrame,
    input                   startBlock,
    input   signed  [17:0]  in1Real,in1Imag,
    input                   accMetricInEn,
    input           [17:0]  accMetricIn_0,
    input           [17:0]  accMetricIn_1,
    input                   setupComplete,
    input                   setupOutputValid,
    input   signed  [17:0]  setupReal,setupImag,
    output                  metricOutEn,
    output  reg     [17:0]  accMetric
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
    wire            [4:0]   addr0;
    wire            [4:0]   addr1;
    wire            [4:0]   spoAddrx = setupOutputValid ? wrAddr : addr1;
    wire    signed  [17:0]  table7r_0,table7i_0;
    wire    signed  [17:0]  table7r_1,table7i_1;
    twoPortDistMem32x18 dpRam7r_x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddrx),
        .d(setupReal),
        .dpra(addr0),
        .dpo(table7r_0),
        .spo(table7r_1)
    );
    twoPortDistMem32x18 dpRam7i_x(
        .clk(clk),
        .we(setupOutputValid),
        .a(spoAddrx),
        .d(setupImag),
        .dpra(addr0),
        .dpo(table7i_0),
        .spo(table7i_1)
    );

    // Count through the 16 states of the 2 acs units to generate 32 outputs.
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
    assign                  addr0 =    {metricAddr,1'b0};
    assign                  addr1 =    {metricAddr,1'b1};

    // Registers to hold the current block's input samples
    reg     signed  [17:0]  s1Real,s1Imag;
    always @(posedge clk) begin
        if (clkEn && startBlock) begin
            s1Real <= in1Real;
            s1Imag <= in1Imag;
        end
    end

    // Stage 7 ACS Units
    wire            [17:0]  accMetricTmp_0;
    wire            [17:0]  accMetricTmp_1;
    acsOp acs0(
        .clk(clk), .reset(startFrame),
        .y8Real(table7r_0),    .y8Imag(table7i_0),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_0),
        .accMetricOutEn(tmpMetricOutEn),
        .accMetricOut(accMetricTmp_0)
    );
    acsOp acs1(
        .clk(clk), .reset(startFrame),
        .y8Real(table7r_1),    .y8Imag(table7i_1),
        .sReal(s1Real),         .sImag(s1Imag),
        .accMetricInEn(accMetricInEn),
        .accMetricIn(accMetricIn_1),
        .accMetricOutEn(),
        .accMetricOut(accMetricTmp_1)
    );

    // Create a delay line for comparing paths 16 states apart. Since states are
    // presented 2 at a time, the delay is 8 clocks.
    reg             [17:0]  delayed_0[0:7];
    reg             [17:0]  delayed_1[0:7];
    integer                 i;
    always @(posedge clk) begin
        delayed_0[0] <= accMetricTmp_0;
        delayed_1[0] <= accMetricTmp_1;
        for (i = 0; i < 7; i = i + 1) begin
            delayed_0[i+1] <= delayed_0[i];
            delayed_1[i+1] <= delayed_1[i];
        end
    end
    wire            [17:0]  path0Metric_0 =   delayed_0[7];
    wire            [17:0]  path0Metric_1 =   delayed_1[7];
    wire            [17:0]  path1Metric_0 =   accMetricTmp_0;
    wire            [17:0]  path1Metric_1 =   accMetricTmp_1;

    // A total of 16 comparisons are made between pairs of acs outputs. The 16
    // comparisons are sequential but are presented 2 at a time. Since we want
    // to decrease the number of simultaneous outputs from 2 to 1, fifos are used
    // as temporary storage and input and output state machines control the
    // read and write operations.
    reg             [3:0]   fifoWriteCounter;
    reg             [7:0]   delayedEnSR;
    wire                    delayedEn =     delayedEnSR[7];
    wire                    fifoWriteEn =   delayedEn && !fifoWriteCounter[3];
    wire                    compareEn =     fifoWriteEn;
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
            fifoWriteCounter <= fifoWriteCounter + 1;
        end
    end

    // Select the best path
    reg             [17:0]  smallestMetric_0;
    reg             [17:0]  smallestMetric_1;
    always @* begin
        if (path1Metric_0 < path0Metric_0) begin
            smallestMetric_0 = path1Metric_0;   // Choose the 1 path
        end
        else begin
            smallestMetric_0 = path0Metric_0;  // Choose the 0 path
        end
        if (path1Metric_1 < path0Metric_1) begin
            smallestMetric_1 = path1Metric_1;   // Choose the 1 path
        end
        else begin
            smallestMetric_1 = path0Metric_1;  // Choose the 0 path
        end
    end

    `define USE_ACS_FIFO
    `ifdef USE_ACS_FIFO

    // Instantiate the fifos
    wire                    fifoReadEn;
    wire            [17:0]  accMetric0;
    acsFifo fifo0(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_0),
        .rd_en(fifoReadEn),
        .dout(accMetric0),
        .full(),
        .empty(fifoEmpty)
    );
    wire            [17:0]  accMetric1;
    acsFifo fifo1(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_1),
        .rd_en(fifoReadEn),
        .dout(accMetric1),
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

    reg             [17:0]  tmpMetric;
    always @(posedge clk) begin
        if (fifoReadEn) begin
            tmpMetric <= accMetric1;
        end
    end

    always @* begin
        if (fifoReadEn) begin
            accMetric <= accMetric0;
        end
        else begin
            accMetric <= tmpMetric;
        end
    end

    `else //USE_ACS_FIFO

    // Instantiate the fifos
    wire                    fifoReadEn;
    wire            [17:0]  accMetric0;
    fifoDistMem32x18 fifo0(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_0),
        .rd_en(fifoReadEn),
        .dout(accMetric0),
        .full(),
        .empty(fifoEmpty),
        .wr_rst_busy(),
        .rd_rst_busy()
    );
    wire            [17:0]  accMetric1;
    fifoDistMem32x18 fifo1(
        .clk(clk),
        .srst(reset),
        .wr_en(fifoWriteEn),
        .din(smallestMetric_1),
        .rd_en(fifoReadEn),
        .dout(accMetric1),
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

    reg             [17:0]  tmpMetric;
    always @(posedge clk) begin
        if (fifoOutputAvailable) begin
            accMetric <= accMetric0;
            tmpMetric <= accMetric1;
        end
        else begin
            accMetric <= tmpMetric;
        end
    end
    `endif //USE_ACS_FIFO

endmodule
