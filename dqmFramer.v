`timescale 1ns/1ps
`include "addressMap.v"


module dqmFramer #(parameter VERSION=4'd0)
(
    input                       clk,
    input                       reset,
    input               [15:0]  dqm,
    input               [13:0]  payloadSize,
    input                       payloadBitEn,
    input                       payloadBit,
    `ifdef DQM_USE_DPLL
    input               [31:0]  dllCenterFreq,
    `else
    input               [15:0]  clksPerBit,
    `endif
    input                       combinerInput,
    input                       combinerStartOfFrame,
    output                      dqmStartOfFrame,
    output  reg                 dqmBitEn,
    output  reg                 dqmBit
);

    // Count payload bits
    // Use the startFrame signal to build an output frame
    reg         [1:0]   payloadState;
        `define PAY_STATE_FLUSH     2'b00
        `define PAY_STATE_WRITE     2'b01
    reg         [13:0]  payloadBitCount;
    wire                startFrame = (payloadBitCount == 0);
    reg                 pingReadSelect;
    reg                 pingWriteSelect;
    reg                 pingWriteEnable;
    reg                 pongWriteEnable;
    wire                pingFifoEmpty;
    wire                pongFifoEmpty;
    always @(posedge clk) begin
        if (reset) begin
            payloadState <= `PAY_STATE_FLUSH;
            payloadBitCount <= 1;
            pingReadSelect <= 1;
            pingWriteSelect <= 0;
            pingWriteEnable <= 0;
            pongWriteEnable <= 0;
        end
        else if (payloadBitEn) begin
            case (payloadState)
                `PAY_STATE_FLUSH: begin
                    if (pingFifoEmpty && pongFifoEmpty) begin
                        payloadState <= `PAY_STATE_WRITE;
                        payloadBitCount <= payloadSize;
                        pingWriteSelect <= 0;
                        pingWriteEnable <= 1;
                        pongWriteEnable <= 0;
                        pingReadSelect <= 0;
                    end
                    else begin
                        pingWriteEnable <= 0;
                        pongWriteEnable <= 0;
                    end
                end
                `PAY_STATE_WRITE: begin
                    if (payloadBitCount == 0) begin
                        payloadBitCount <= payloadSize;
                        pingWriteSelect <= ~pingWriteSelect;
                        if (pingWriteSelect) begin
                            if (!pingFifoEmpty) begin
                                payloadState <= `PAY_STATE_FLUSH;
                            end
                            pingWriteEnable <= 1;
                            pongWriteEnable <= 0;
                            pingReadSelect <= 0;
                        end
                        else begin
                            if (!pongFifoEmpty) begin
                                payloadState <= `PAY_STATE_FLUSH;
                            end
                            pingWriteEnable <= 0;
                            pongWriteEnable <= 1;
                            pingReadSelect <= 1;
                        end
                    end
                    else begin
                        payloadBitCount <= payloadBitCount - 1;
                    end
                end
            endcase
        end
    end

    // Create a clock enable that runs slightly faster than the required bitrate
    // of the framed DQM output
    `ifdef DQM_USE_DPLL

    // Use a Digital PLL to generate the clock. We set the loop gain to zero to
    // turn it into an NCO generating a clock enable at a fixed rate.
    digitalPLL dll(
        .clk(clk),
        .reset(reset),
        .centerFreq(dllCenterFreq),
        //.loopGain(dllLoopGain),
        .loopGain(5'h0),
        .feedbackDivider(8'd1),
        .referenceClkEn(1'b0),
        .feedbackClkEn(divClkEn),
        .dllOutputClk(divClk),
        .filteredRefClk(),
        .phaseError()
    );

    `else //DQM_USE_DPLL

    reg         [15:0]  clkDivCount;
    wire                divClkEn = (clkDivCount == 0);
    always @(posedge clk) begin
        if (reset) begin
            clkDivCount <= 0;
        end
        else if (clkDivCount == 0) begin
            clkDivCount <= clksPerBit;
        end
        else begin
            clkDivCount <= clkDivCount - 1;
        end
    end

    `endif //DQM_USE_DPLL

    // Ping/Pong Fifos to buffer the dqm payload bits
    reg     pingReadEnable;
    reg     pongReadEnable;
    dqmFifo pingFifo(
        .clk(clk),
        .srst(reset),
        .din(payloadBit),
        .wr_en(payloadBitEn && pingWriteEnable),
        .rd_en(divClkEn && pingReadEnable),
        .dout(pingPayloadBit),
        .full(),
        .empty(pingFifoEmpty)
    );
    dqmFifo pongFifo(
        .clk(clk),
        .srst(reset),
        .din(payloadBit),
        .wr_en(payloadBitEn && pongWriteEnable),
        .rd_en(divClkEn && pongReadEnable),
        .dout(pongPayloadBit),
        .full(),
        .empty(pongFifoEmpty)
    );

    // Use the startFrame signal to build an output frame
    reg         [1:0]   dqmState;
        `define DQM_STATE_IDLE      2'b00
        `define DQM_STATE_WAIT      2'b01
        `define DQM_STATE_HEADER    2'b10
        `define DQM_STATE_PAYLOAD   2'b11
    reg         [15:0]  shiftCount;
    reg         [47:0]  headerSR;
    always @(posedge clk) begin
        if (reset || (payloadState == `PAY_STATE_FLUSH)) begin
            dqmState <= `DQM_STATE_IDLE;
            pingReadEnable <= 1;
            pongReadEnable <= 1;
        end
        else begin
            case (dqmState)
                `DQM_STATE_IDLE: begin
                    pingReadEnable <= 0;
                    pongReadEnable <= 0;
                    headerSR <= {`DQM_SYNC_WORD,12'b0,VERSION,dqm};
                    if (payloadBitEn && startFrame) begin
                        shiftCount <= 47;
                        if (divClkEn) begin
                            dqmState <= `DQM_STATE_HEADER;
                        end
                        else begin
                            dqmState <= `DQM_STATE_WAIT;
                        end
                    end
                end
                `DQM_STATE_WAIT: begin
                    if (divClkEn) begin
                        dqmState <= `DQM_STATE_HEADER;
                        shiftCount <= shiftCount - 1;
                        headerSR <= {headerSR[46:0],1'b0};
                    end
                end
                `DQM_STATE_HEADER: begin
                    if (divClkEn) begin
                        if (shiftCount == 0) begin
                            dqmState <= `DQM_STATE_PAYLOAD;
                            shiftCount <= payloadSize;
                            if (pingReadSelect) begin
                                pingReadEnable <= !pingFifoEmpty;
                                pongReadEnable <= 0;
                            end
                            else begin
                                pingReadEnable <= 0;
                                pongReadEnable <= !pongFifoEmpty;
                            end
                        end
                        else begin
                            shiftCount <= shiftCount - 1;
                            headerSR <= {headerSR[46:0],1'b0};
                        end
                    end
                end
                `DQM_STATE_PAYLOAD: begin
                    if (divClkEn) begin
                        if (shiftCount == 0) begin
                            dqmState <= `DQM_STATE_IDLE;
                            pingReadEnable <= 0;
                            pongReadEnable <= 0;
                        end
                        else begin
                            shiftCount <= shiftCount - 1;
                        end
                    end
                end
                default: begin
                end
            endcase
        end
    end

    always @* begin
        case (dqmState)
            `DQM_STATE_IDLE:    dqmBit <= headerSR[47];
            `DQM_STATE_WAIT:    dqmBit <= headerSR[47];
            `DQM_STATE_HEADER:  dqmBit <= headerSR[47];
            `DQM_STATE_PAYLOAD: dqmBit <= pingReadSelect ? pingPayloadBit
                                                            : pongPayloadBit;
        endcase
        case (dqmState)
            //`define DQM_USE_CLK_OUTPUT
            `ifdef DQM_USE_CLK_OUTPUT
            `DQM_STATE_IDLE:    begin
                if (divClk) begin
                    dqmBitEn <= 1'b1;
                end
            end
            `DQM_STATE_WAIT:        dqmBitEn = divClk;
            `DQM_STATE_HEADER:      dqmBitEn = divClk;
            `DQM_STATE_PAYLOAD:     dqmBitEn = divClk;
            `else
            `DQM_STATE_WAIT:        dqmBitEn = divClkEn;
            `DQM_STATE_HEADER:      dqmBitEn = divClkEn;
            `DQM_STATE_PAYLOAD:     dqmBitEn = divClkEn;
            default:                dqmBitEn = 0;
            `endif
        endcase
    end

    assign dqmStartOfFrame = startFrame;

endmodule

