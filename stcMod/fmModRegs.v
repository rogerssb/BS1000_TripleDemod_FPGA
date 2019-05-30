`timescale 1ns/10ps

`include "addressMap.v"

`ifdef SILOS
module fmModRegs(
    busClk,
    cs,
    wr0, wr1, wr2, wr3,
    addr,
    dataIn,
    dataOut,
    carrierFreq,
    devMantissa,
    devExponent,
    bitrateDiv,
    modClkSel,
    cicShift
);
    input                       busClk;
    input                       cs;
    input                       wr0, wr1, wr2, wr3;
    input               [12:0]  addr;
    input               [31:0]  dataIn;
    output  reg         [31:0]  dataOut;
    output  reg signed  [31:0]  carrierFreq;
    output  reg         [17:0]  devMantissa;
    output  reg         [3:0]   devExponent;
    output  reg         [15:0]  bitrateDiv;
    output  reg                 modClkSel;
    output  reg         [4:0]   cicShift
`else
module fmModRegs(
    input                       busClk,
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  dataIn,
    output  reg         [31:0]  dataOut,
    output  reg signed  [31:0]  carrierFreq,
    output  reg         [17:0]  devMantissa,
    output  reg         [3:0]   devExponent,
    output  reg         [15:0]  bitrateDiv,
    output  reg                 modClkSel,
    output  reg         [4:0]   cicShift
);
`endif

    always @(posedge busClk) begin
        if (cs && wr0) begin
            casex (addr)
                `FM_MOD_FREQ:    carrierFreq[7:0] <= dataIn[7:0];
                `FM_MOD_DEV:     devMantissa[7:0] <= dataIn[7:0];
                `FM_MOD_BITRATE: bitrateDiv[7:0] <= dataIn[7:0];
                `FM_MOD_CIC:     cicShift[4:0] <= dataIn[4:0];
                default:  ;
            endcase
        end

        if (cs && wr1) begin
            casex (addr)
                `FM_MOD_FREQ:    carrierFreq[15:8] <= dataIn[15:8];
                `FM_MOD_DEV:     devMantissa[15:8] <= dataIn[15:8];
                `FM_MOD_BITRATE: bitrateDiv[15:8] <= dataIn[15:8];
                default:  ;
            endcase
        end

        if (cs && wr2) begin
            casex (addr)
                `FM_MOD_FREQ:    carrierFreq[23:16] <= dataIn[23:16];
                `FM_MOD_DEV:     devMantissa[17:16] <= dataIn[17:16];
                default:  ;
            endcase
        end

        if (cs && wr3) begin
            casex (addr)
                `FM_MOD_FREQ:    carrierFreq[31:24] <= dataIn[31:24];
                `FM_MOD_BITRATE: modClkSel <= dataIn[31];
                `FM_MOD_DEV:     devExponent <= dataIn[27:24];
                default:  ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `FM_MOD_FREQ:       dataOut <= carrierFreq;
                `FM_MOD_DEV:        dataOut <= {4'b0,devExponent,6'bx,devMantissa};
                `FM_MOD_BITRATE:    dataOut <= {modClkSel,15'hx,bitrateDiv};
                `FM_MOD_CIC:        dataOut <= {27'bx,cicShift};
                default:            dataOut <= 32'hx;
            endcase
        end
        else begin
            dataOut <= 32'hx;
        end
    end

endmodule
