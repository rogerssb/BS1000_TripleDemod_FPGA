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
    input               [15:0]  clksPerBit,
    output                      dqmStartOfFrame,
    output  reg                 dqmBitEn,
    output  reg                 dqmBit
);

    // Count payload bits
    reg         [13:0]  payloadBitCount;
    wire                startFrame = (payloadBitCount == 0);
    reg                 pingWriteSelect;
    reg                 pingWriteEnable;
    reg                 pongWriteEnable;
    always @(posedge clk) begin
        if (reset) begin
            payloadBitCount <= 1;
            pingWriteSelect <= 0;
            pingWriteEnable <= 0;
            pongWriteEnable <= 0;
        end
        else if (payloadBitEn) begin
            if (payloadBitCount == 0) begin
                payloadBitCount <= payloadSize;
                pingWriteSelect <= ~pingWriteSelect;
                if (pingWriteSelect) begin
                    pingWriteEnable <= 1;
                    pongWriteEnable <= 0;
                end
                else begin
                    pingWriteEnable <= 0;
                    pongWriteEnable <= 1;
                end
            end
            else begin
                payloadBitCount <= payloadBitCount - 1;
            end
        end
    end

    // Creat a clock enable that runs slightly faster than the required bitrate
    // of the framed DQM output
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
    reg                 pingReadSelect;
    always @(posedge clk) begin
        if (reset) begin
            dqmState <= `DQM_STATE_IDLE;
            pingReadSelect <= 1;
            pingReadEnable <= 0;
            pongReadEnable <= 0;
        end
        else begin
            case (dqmState)
                `DQM_STATE_IDLE: begin
                    if (payloadBitEn && startFrame) begin
                        headerSR <= {`DQM_SYNC_WORD,12'b0,VERSION,dqm};
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
                            pingReadSelect <= !pingReadSelect;
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
            `DQM_STATE_WAIT:        dqmBitEn = divClkEn;
            `DQM_STATE_HEADER:      dqmBitEn = divClkEn;
            `DQM_STATE_PAYLOAD:     dqmBitEn = divClkEn;
            default:                dqmBitEn = 0;
        endcase
    end

    assign dqmStartOfFrame = startFrame;

endmodule

