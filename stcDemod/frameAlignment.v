`timescale 1ns/100ps
`include "stcDefines.vh"

module frameAlignment
    #(parameter START_OFFSET = 0,
      parameter CLKS_PER_OUTPUT = 4) (
    input                   clk,
                            clk2x,
                            clkEn,
                            reset,
                            lastSampleReset,
                            startOfFrame,       // start of frame, not start of trellis activiy
                            estimatesDone,     // Estimates are complete, start Trellis process
                            valid,
    input   signed  [17:0]  dinReal,
                            dinImag,
    output                  clkEnOut,
    output  reg             interpolate,
                            myStartOfTrellis,
                            full,
    output  signed  [17:0]  doutReal,
                            doutImag
);


    //------------------------------ Sample Counter ---------------------------

    reg             [14:0]  wrAddr, rdAddr, sofAddress;
    reg                     estimatesReady, sofDetected, frameActive;
    always @(posedge clk2x) begin
        if (reset) begin
            myStartOfTrellis <= 0;
            sofDetected      <= 0;
            estimatesReady   <= 0;
            sofAddress       <= 0;
        end
        else if (clkEn) begin
            if (estimatesDone) begin
                estimatesReady <= 1;
            end
            else if (myStartOfTrellis) begin
                estimatesReady <= 0;
            end
            if (startOfFrame) begin
                sofDetected <= 1;
                sofAddress  <= wrAddr + `PILOT_SAMPLES_PER_FRAME - 9;  // capture address of first sample of next frame. SOF goes active between packets, so wrAddr is inactive
            end
            else if (myStartOfTrellis) begin
                sofDetected <= 0;
            end
            myStartOfTrellis <= (estimatesReady & sofDetected & ~frameActive & ~myStartOfTrellis); // wait till current frame is done. Check own output for one clock cycle
        end
    end

    //------------------------- Sample FIFO -----------------------------------

    wire                    fifoWrEn = (clkEn && valid && clk);
    reg                     fifoRdEn;
    wire    [35:0]          fifoRdData;

    wire    empty = (wrAddr == rdAddr);
    always @(posedge clk2x) begin
        if (reset) begin
            rdAddr <= 0;
            wrAddr <= 0;
            full   <= 0;
        end
        else if (clkEn) begin
            if (fifoWrEn) begin
                wrAddr <= wrAddr + 1;
                full <= ((wrAddr == rdAddr - 1) && ~fifoRdEn);
            end
            if (myStartOfTrellis) begin
                rdAddr <= sofAddress;  // skip any extraneous input data at first sync
            end
            else if (fifoRdEn) begin
                rdAddr <= rdAddr + 1;
            end
        end
    end

    RAM_2Reads_1WriteVerWrap #(
      .DATA_WIDTH  (36),
      .ADDR_WIDTH  (15),
      .LATENCY     (1) )
    fifoRealImag(
        .clk(clk2x),
        .ce(clkEn),
        .reset(reset),
        .WrEn(fifoWrEn),
        .WrAddr(wrAddr),
        .RdAddrA(rdAddr),
        .RdAddrB(15'h0),
        .WrData({dinReal, dinImag}),
        .RdOutA(fifoRdData),
        .RdOutB()
    );
    wire    fifoOutputValid = ~empty;
    assign  doutReal        = fifoRdData[35:18];
    assign  doutImag        = fifoRdData[17:0];

    //-------------------------- Output State Machine -------------------------

    reg                     outputState;
        `define WAIT_VALID          1'b0
        `define WAIT_DECIMATION     1'b1
    reg             [2:0]   decimationCount;
    reg             [1:0]   outputCount;
    reg             [8:0]   trellisInitCnt;
    always @(posedge clk2x) begin
        if (reset || lastSampleReset) begin
            outputState <= `WAIT_VALID;
            decimationCount <= CLKS_PER_OUTPUT-1;
            fifoRdEn        <= 0;
            outputCount     <= 0;
            interpolate     <= 0;
            trellisInitCnt  <= 130; // inactive state
            frameActive     <= 0;
        end
        else if (clkEn) begin
            if (myStartOfTrellis) begin
                trellisInitCnt <= 128;
                frameActive    <= 1;
            end
            else if ((trellisInitCnt < 130) && (trellisInitCnt > 0)) begin
                trellisInitCnt <= trellisInitCnt - 1;
            end

            case (outputState)
                `WAIT_VALID:  begin
                    if ((fifoOutputValid == 1'b1) && (trellisInitCnt == 0)) begin
                        fifoRdEn <= 1;
                        if (CLKS_PER_OUTPUT > 1) begin
                            decimationCount <= decimationCount - 1;
                            outputState <= `WAIT_DECIMATION;
                        end
                    end
                    else begin
                        fifoRdEn <= 0;
                    end
                end
                `WAIT_DECIMATION: begin
                    fifoRdEn <= 0;
                    if (decimationCount > 0) begin
                        decimationCount <= decimationCount - 1;
                    end
                    else begin
                        decimationCount <= CLKS_PER_OUTPUT-1;
                        outputState <= `WAIT_VALID;
                    end
                end
                default: begin
                    outputState <= `WAIT_VALID;
                    decimationCount <= CLKS_PER_OUTPUT-1;
                    fifoRdEn <= 0;
                end
            endcase

            if (clkEnOut) begin
                outputCount <= outputCount + 1;
                interpolate <= (outputCount == 2'b10);
            end
        end
    end
    assign  clkEnOut = (fifoRdEn && fifoOutputValid);

endmodule
