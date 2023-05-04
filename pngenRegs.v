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
    output  reg         pnRestart,
    output  reg         inject1E3Errors,
    output  reg         injectError,
    output  reg [1:0]   fecMode,
    output  reg         vitG2Inv,
    output  reg [1:0]   ldpcRate,
    output  reg         ldpcBlockSize,
    output  reg [1:0]   ldpcRandomize,
    output  reg         rsParity32,
    output  reg         rsASMEnable,
    output  reg [31:0]  rsEncoderASM
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
                                ldpcRate <= din[6:5];
                                pcmInvert <= din[7];
                                end
                `PNGEN_RS_ASM:  rsEncoderASM[7:0] <= din[7:0];
                default: ;
            endcase
        end
        if (pnSpace && wr1) begin
            casex (addr)
                `PNGEN_POLY:    pnPolyTaps[15:8] <= din[15:8];
                `PNGEN_RATE:    pnClockRate[15:8] <= din[15:8];
                `PNGEN_PCM_MODE: begin
                                fecMode <= din[9:8];
                                vitG2Inv <= din[10];
                                ldpcBlockSize <= din[11];
                                ldpcRandomize <= din[13:12];
                                inject1E3Errors <= din[14];
                                injectError <= din[15];
                                end
                `PNGEN_RS_ASM:  rsEncoderASM[15:8] <= din[15:8];
                default: ;
            endcase
        end
        if (pnSpace && wr2) begin
            casex (addr)
                `PNGEN_POLY:    pnPolyTaps[23:16] <= din[23:16];
                `PNGEN_RATE:    pnClockRate[23:16] <= din[23:16];
                `PNGEN_RS_ASM:  rsEncoderASM[23:16] <= din[23:16];
                `PNGEN_PCM_MODE:begin
                                rsParity32 <= din[16];
                                rsASMEnable <= din[17];
                                end
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
                `PNGEN_RS_ASM:  rsEncoderASM[31:24] <= din[31:24];
                default: ;
            endcase
        end
    end

    always @* begin
        if (pnSpace) begin
            casex (addr)
                `PNGEN_POLY:    dout = {pnPolyMode, pnRestart, 1'b0, pnPolyLength, pnPolyTaps};
                `PNGEN_RATE:    dout = pnClockRate;
                `PNGEN_PCM_MODE:dout = {12'b0,
                                        2'b0,rsASMEnable,rsParity32,
                                        injectError,inject1E3Errors,ldpcRandomize,
                                        ldpcBlockSize,vitG2Inv,fecMode,
                                        pcmInvert,ldpcRate,1'b0,
                                        pcmMode
                                        };
                `PNGEN_RS_ASM:  dout = rsEncoderASM;
                default:        dout = 32'hx;
            endcase
        end
        else begin
            dout = 32'hx;
        end
    end

endmodule


