`timescale 1ns / 10 ps
`include "addressMap.v"

module pngenRegs(
    input               busClk,
    input               wr0, wr1, wr2, wr3,
    input       [12:0]  addr,
    input       [31:0]  din,
    output  reg [31:0]  dout,
    output  reg [23:0]  pnPolyTaps,
    output  reg [4:0]   pnPolyLength,
    output  reg         pnPolyMode,
    output  reg [31:0]  pnClockRate,
    output  reg [3:0]   pcmMode,
    output  reg         pcmInvert,
    output  reg         pnRestart
);

    parameter RegSpace = `PNGEN_SPACE;

    reg pnSpace;
    always @* begin
        casex(addr)
            RegSpace:           pnSpace = 1;
            default:            pnSpace = 0;
        endcase
    end

    always @(posedge busClk) begin
        if (pnSpace && wr0) begin
            casex (addr)
                `PNGEN_POLY:    pnPolyTaps[7:0] <= din[7:0];
                `PNGEN_RATE:    pnClockRate[7:0] <= din[7:0];
                `PNGEN_PCM_MODE: begin    
                                pcmMode[3:0] <= din[3:0];
                                pcmInvert <= din[7];
                                end
                default: ;
            endcase
        end
        if (pnSpace && wr1) begin
            casex (addr)
                `PNGEN_POLY:    pnPolyTaps[15:8] <= din[15:8];
                `PNGEN_RATE:    pnClockRate[15:8] <= din[15:8];
                default: ;
            endcase
        end
        if (pnSpace && wr2) begin
            casex (addr)
                `PNGEN_POLY:    pnPolyTaps[23:16] <= din[23:16];
                `PNGEN_RATE:    pnClockRate[23:16] <= din[23:16];
                default: ;
            endcase
        end
        if (pnSpace && wr3) begin
            casex (addr)
                `PNGEN_POLY: begin
                                pnPolyLength <= din[28:24];
                                pnRestart <= din[30];
                                pnPolyMode <= din[31];
                end
                `PNGEN_RATE:    pnClockRate[31:24] <= din[31:24];
                default: ;
            endcase
        end
    end

    always @* begin
        if (pnSpace) begin
            casex (addr)
                `PNGEN_POLY:    dout = {pnPolyMode, pnRestart, 1'b0, pnPolyLength, pnPolyTaps};
                `PNGEN_RATE:    dout = pnClockRate;
                `PNGEN_PCM_MODE:dout = {24'b0,pcmInvert,3'b0,pcmMode};
                default:        dout = 32'hx;
            endcase
        end
        else begin
            dout = 32'hx;
        end
    end
    
endmodule


