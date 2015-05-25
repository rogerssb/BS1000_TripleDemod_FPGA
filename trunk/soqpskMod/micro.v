`timescale 1ns/10ps

`include "addressMap.v"

module soqpskModRegs(cs,
                     addr,
                     dataIn,
                     dataOut,
                     wr0, wr1, wr2, wr3,
                     carrierFreq,
                     deviation,
                     bitrateDiv,
                     modClkSel,
                     cicShift
                     );

input   cs;
input   [11:0]addr;
input   [31:0]dataIn;
output  [31:0]dataOut;
input   wr0,wr1,wr2,wr3;

output  [31:0] carrierFreq;
reg     [31:0] carrierFreq;

output  [17:0] deviation;
reg     [17:0] deviation;

output  [15:0] bitrateDiv;
reg     [15:0] bitrateDiv;

output  modClkSel;
reg     modClkSel;

output  [4:0]cicShift;
reg     [4:0]cicShift;

always @(negedge wr0) begin
    if (cs) begin
        casex (addr)
            `FM_MOD_FREQ:    carrierFreq[7:0] <= dataIn[7:0];
            `FM_MOD_DEV:     deviation[7:0] <= dataIn[7:0];
            `FM_MOD_BITRATE: bitrateDiv[7:0] <= dataIn[7:0];
            `FM_MOD_CIC:     cicShift[4:0] <= dataIn[4:0];
            default:  ;
            endcase
        end
    end

always @(negedge wr1) begin
    if (cs) begin
        casex (addr)
            `FM_MOD_FREQ:    carrierFreq[15:8] <= dataIn[15:8];
            `FM_MOD_DEV:     deviation[15:8] <= dataIn[15:8];
            `FM_MOD_BITRATE: bitrateDiv[15:8] <= dataIn[15:8];
            default:  ;
            endcase
        end
    end

always @(negedge wr2) begin
    if (cs) begin
        casex (addr)
            `FM_MOD_FREQ:    carrierFreq[23:16] <= dataIn[23:16];
            `FM_MOD_DEV:     deviation[17:16] <= dataIn[17:16];
            default:  ;
            endcase
        end
    end

always @(negedge wr3) begin
    if (cs) begin
        casex (addr)
            `FM_MOD_FREQ:    carrierFreq[31:24] <= dataIn[31:24];
            `FM_MOD_BITRATE: modClkSel <= dataIn[31];
            default:  ;
            endcase
        end
    end


reg [31:0]dataOut;
always @(cs or addr or
         carrierFreq or 
         deviation or
         bitrateDiv or
         modClkSel or
         cicShift) 
    begin
    if (cs) begin
        casex (addr)
            `FM_MOD_FREQ:       dataOut <= carrierFreq;
            `FM_MOD_DEV:        dataOut <= {14'bx,deviation};
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
