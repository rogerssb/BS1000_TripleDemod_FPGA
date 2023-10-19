`timescale 1ns / 10 ps
`include "addressMap.v"

module framerRegs(
    input                       busClk,
    input                       cs,
    input                       wr0, wr1, wr2, wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output reg          [31:0]  dout,
    input                       framesync,
    input               [1:0]   syncState,
    input                       invertData,
    output reg          [4:0]   bitsPerWord,
    output reg          [15:0]  wordsPerFrame,
    output reg          [31:0]  syncwordMask,
    output reg          [31:0]  syncword,
    output      signed  [6:0]   syncThreshold,
    output reg          [3:0]   inputSourceSelect
`ifdef BITSYNC_BERT
    /// Will confilct with DMSE_SPACE and since not using at this time we'll just comment out
    ///  may use in the future 
    // ,
    // input               [31:0]  lockCount, unLockCount,
    // input               [15:0]  DqmSmooth, DqmRaw, DqmMax, DqmMin,
    // output reg          [3:0]   inputSourceSelect = 3'b111,
    // output reg                  framerCountsReset
`endif

);

    parameter RegSpace = `FRAMER_SPACE;

    reg signed  [6:0]   syncThreshold_reg;
    assign              syncThreshold = syncThreshold_reg;

    reg framerSpace;
    always @* begin
        casex(addr)
            RegSpace:           framerSpace = cs;
            default:            framerSpace = 0;
        endcase
    end

    always @(posedge busClk) begin
        if (framerSpace && wr0) begin
            casex (addr)
                `FRAMER_CONTROL:        bitsPerWord <= din[4:0];
                `FRAMER_SYNCWORD:       syncword[7:0] <= din[7:0];
                `FRAMER_SYNCWORD_MASK:  syncwordMask[7:0] <= din[7:0];
                `FRAMER_SOURCE_SELECT:  inputSourceSelect <= din[3:0];/// at this time we'll just comment out    
`ifdef BITSYNC_BERT                
                
                //`FRAMER_LOCK_COUNTS:    framerCountsReset <= din[0];/// at this time we'll just comment out    
`endif
                default: ;
            endcase
        end
        if (framerSpace && wr1) begin
            casex (addr)
                `FRAMER_CONTROL:        syncThreshold_reg <= din[14:8];
                `FRAMER_SYNCWORD:       syncword[15:8] <= din[15:8];
                `FRAMER_SYNCWORD_MASK:  syncwordMask[15:8] <= din[15:8];
                default: ;
            endcase
        end
        if (framerSpace && wr2) begin
            casex (addr)
                `FRAMER_CONTROL:        wordsPerFrame[7:0] <= din[23:16];
                `FRAMER_SYNCWORD:       syncword[23:16] <= din[23:16];
                `FRAMER_SYNCWORD_MASK:  syncwordMask[23:16] <= din[23:16];
                default: ;
            endcase
        end
        if (framerSpace && wr3) begin
            casex (addr)
                `FRAMER_CONTROL:        wordsPerFrame[15:8] <= din[31:24];
                `FRAMER_SYNCWORD:       syncword[31:24] <= din[31:24];
                `FRAMER_SYNCWORD_MASK:  syncwordMask[31:24] <= din[31:24];
                default: ;
            endcase
        end
    end

    always @* begin
        if (framerSpace) begin
            casex (addr)
                `FRAMER_CONTROL:        dout = {wordsPerFrame,1'b0,syncThreshold,3'b0,bitsPerWord};
                `FRAMER_SYNCWORD:       dout = syncword;
                `FRAMER_SYNCWORD_MASK:  dout = syncwordMask;
                `FRAMER_STATUS:         dout = {23'b0,invertData,2'b0,syncState,3'b0,framesync};
                `FRAMER_SOURCE_SELECT:  dout = {28'b0,inputSourceSelect};
`ifdef BITSYNC_BERT
                //`FRAMER_LOCK_COUNTS:    dout = lockCount;
                //`FRAMER_UNLOCK_COUNTS:  dout = unLockCount;
                //`FRAMER_DQM:            dout = {DqmSmooth, DqmRaw};
                //`FRAMER_MAX_MIN_DQM:    dout = {DqmMax, DqmMin};               
`endif
                default:                dout = 32'hx;
            endcase
        end
        else begin
            dout = 32'hx;
        end
    end

endmodule


