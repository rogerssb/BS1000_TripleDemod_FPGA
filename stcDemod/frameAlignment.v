`timescale 1ns/100ps
`include "stcDefines.vh"

// 10-25-19 Modified sofAddress offset from 8 to 7. Could go to 6
// 11-16-19 Changed offset to vio variable to optimize against real time noise.
// 12/18/19 Changed buffer from circular to zero based. Each frame starts at zero. Reading starts at end of pilot minus preload of 12 plus m_ndx's.
//          Add depth register so read never reaches within 5 of write to avoid possible overflow if m_ndx is large positive. When SOF is detected, write goes
//          back to zero, but read continues till all samples read. Added sample counter.
// 9/3/20   Modulo 13312 math wasn't checking underflow. fifoOutputValid wasn't waiting for data, just SOF

module frameAlignment
//    #(parameter CLKS_PER_OUTPUT = 2)
    (
    input                   clk,
                            clkEn,
                            reset,
                            startOfFrame,       // start of frame, not start of trellis activty
                            estimatesDone,     // Estimates are complete, start Trellis process
                            TwoClksPerTrellis,  // either 4 or 2 clocks per trellis input
                            valid,
    input   signed  [17:0]  dinReal,
                            dinImag,
    input   signed  [3:0]   m_ndx0,
                            m_ndx1,
    output                  clkEnOut,
    output  reg             interpolate,
                            myStartOfTrellis,
    output  signed  [17:0]  doutReal0,
                            doutImag0,
                            doutReal1,
                            doutImag1
);


    //------------------------------ Sample Counter ---------------------------

(* MARK_DEBUG="true" *)    reg             [14:0]  wrAddr, rdAddr;
(* MARK_DEBUG="true" *)    reg  signed     [14:0]  depth;
    wire   signed   [15:0]  rdAddr0, rdAddr1, rdAddr0Tmp, rdAddr1Tmp;
    reg                     sofDetected, lastSamplesAvailable;
    reg                     outputState, lastSample;
    reg             [14:0]   sampleCount;
    `define   SOF_ADDRESS `PILOT_SAMPLES_PER_FRAME - 10  // since new frame starts writing at 0, frame data starts at known offset
    always @(posedge clk) begin
        if (reset) begin
            myStartOfTrellis <= 0;
            sofDetected      <= 0;
            lastSamplesAvailable <= 0;
        end
        else if (clkEn) begin
            if (startOfFrame) begin
                sofDetected <= 1;
            end
            else if (myStartOfTrellis) begin
                sofDetected <= 0;
            end

            if (lastSample) begin
                lastSamplesAvailable <= 0;
            end
            else if ((wrAddr == 20) && (sampleCount > 2000)) begin
                lastSamplesAvailable <= 1;
            end

            myStartOfTrellis <= (estimatesDone & sofDetected);
        end
    end

    //------------------------- Sample buffer holds entire frame of data -----------------------------------
    // Packet starts writing at address 0 when StartOfFrame is detected. The useful user data starts 512 samples later.
    // This forces the packet to always start at 0 up to 13312ish then the next packet will start at the bottom
    // The read address then starts at SOF_ADDRESS samples later

    wire                    fifoWrEn = (clkEn && valid);
    reg                     fifoRdEn;
    wire    [35:0]          fifoRdData0, fifoRdData1;

    always @(posedge clk) begin
        if (reset) begin
            rdAddr <= 0;
            wrAddr <= 0;
        end
        else if (clkEn) begin
            if (startOfFrame) begin     // start each frame at 0, read starts at sofAddress.
                wrAddr <= 0;
            end
            else if (fifoWrEn) begin
                wrAddr <= wrAddr + 1;
            end

            if (myStartOfTrellis) begin
                rdAddr <= `SOF_ADDRESS;  // skip the pilot data at first sync
            end
            else if (fifoRdEn) begin
                rdAddr <= (rdAddr < 13311) ? rdAddr + 1 : 0;   // wrap read address back around to find final data at start of next packet.
            end
        end
    end

    assign  rdAddr0Tmp = {1'b0, rdAddr} + {{12{m_ndx0[3]}}, m_ndx0};   // sign extend to add signed offset
    assign  rdAddr1Tmp = {1'b0, rdAddr} + {{12{m_ndx1[3]}}, m_ndx1};
    assign  rdAddr0    = (rdAddr0Tmp > 13311) ? rdAddr0Tmp - 13312 : ((rdAddr0Tmp < 0) ? rdAddr0Tmp + 13312 : rdAddr0Tmp);    // wrap read address within 0 to 13311 range
    assign  rdAddr1    = (rdAddr1Tmp > 13311) ? rdAddr1Tmp - 13312 : ((rdAddr1Tmp < 0) ? rdAddr1Tmp + 13312 : rdAddr1Tmp);


    RAM_2Reads_1WriteVerWrap #(
      .DATA_WIDTH  (36),
      .ADDR_WIDTH  (15),
      .LATENCY     (1) )
    fifoRealImag(
        .clk(clk),
        .ce(clkEn),
        .reset(reset),
        .WrEn(fifoWrEn),
        .WrAddr(wrAddr),
        .RdAddrA(rdAddr0[14:0]),        // only use the unsigned part of rdAddr
        .RdAddrB(rdAddr1[14:0]),
        .WrData({dinReal, dinImag}),
        .RdOutA(fifoRdData0),
        .RdOutB(fifoRdData1)
    );
    wire    fifoOutputValid = ((interpolate == 1) || (depth > 5) || (lastSamplesAvailable == 1));  // allow enough room for worst case, don't leave interpolate hanging. When next startOfFrame wrAddr goes to 0, so keep reading to end of current data section
    assign  doutReal0       = fifoRdData0[35:18];
    assign  doutImag0       = fifoRdData0[17:0];
    assign  doutReal1       = fifoRdData1[35:18];
    assign  doutImag1       = fifoRdData1[17:0];
    wire            [3:0]   clksPerOutput = (TwoClksPerTrellis) ? 2 : 4;

    //-------------------------- Output State Machine -------------------------

        `define WAIT_VALID          1'b0
        `define WAIT_DECIMATION     1'b1
    reg             [2:0]   decimationCount;
    reg             [1:0]   outputCount;
    reg             [8:0]   trellisInitCnt;
    always @(posedge clk) begin
        if (reset || lastSample) begin
            outputState <= `WAIT_VALID;
            decimationCount <= clksPerOutput - 1; //CLKS_PER_OUTPUT-1;
            fifoRdEn        <= 0;
            outputCount     <= 0;
            sampleCount     <= 0;
            lastSample      <= 0;   // synchronous clear, so no race condition on lastSample clearing itself
            interpolate     <= 0;
            trellisInitCnt  <= 130; // inactive state
        end
        else if (clkEn) begin
            depth <= wrAddr - rdAddr;

            if (myStartOfTrellis) begin
                trellisInitCnt  <= 128;
                sampleCount     <= 0;
            end
            else if ((trellisInitCnt < 130) && (trellisInitCnt > 0)) begin
                trellisInitCnt <= trellisInitCnt - 1;
            end

            case (outputState)
                `WAIT_VALID:  begin
                    if ((fifoOutputValid == 1) && (trellisInitCnt == 0)) begin
                        fifoRdEn    <= 1;
                        if (clksPerOutput > 1) begin
                            decimationCount <= decimationCount - 1;
                            outputState     <= `WAIT_DECIMATION;
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
                        decimationCount <= clksPerOutput-1; //CLKS_PER_OUTPUT-1;
                        outputState <= `WAIT_VALID;
                    end
                end
                default: begin
                    outputState     <= `WAIT_VALID;
                    decimationCount <= clksPerOutput-1; //CLKS_PER_OUTPUT-1;
                    fifoRdEn        <= 0;
                end
            endcase

            if (clkEnOut) begin
                outputCount <= outputCount + 1;
                interpolate <= (outputCount == 2'b10);
            end

            if (clkEnOut && interpolate) begin  // increment every 4 samples
                sampleCount <= sampleCount + 1;
                if (sampleCount == 3205) begin
                    lastSample <= 1'b1;
                end
            else
                lastSample <= 1'b0;
            end
        end
    end
    assign  clkEnOut = (fifoRdEn);

endmodule
