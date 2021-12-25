/*  Per CCSDS 131.0-B-3 the managed parameters for Reed Solomon consists of:
    Error Correction Capability (E symbols)     8, 16 yielding RS(255,239) and RS(255,223)
    Interleaving Depths                         1,2, 3, 4, 5, 8
    Virtual Fill Length (Q symbols)             Integer 0 to 222

                                    15:8        7:4                 0:0
    Reed Solomon Control Register   Fill[7:0]   Interleave[3:0]     R_Index

                                    31:24           23:16           15:0
    Reed Solomon Status Register    FailCnt[7:0]    FrameCnt[7:0]   ErrCnt[15:0]
    The RS Decoder can do either (255,223) or (255,239) by setting R_Index to 1 or 0
    FailCnt and ErrCnt will accumulate errors until read, which resets them to 0
    FrameCnt keeps track of the number of frames between reads so WERs can be calculated
*/
`timescale 1ns/10ps
`ifndef RS_CONTROL
`define RS_CONTROL         5'b0_00xx
`define RS_STATUS          5'b0_01xx
`define RS_ASM_CONTROL     5'b0_10xx
`endif

module reedSolomonRegs(
    input               rsClk,      // used for frame tracking
    input               busClk,
    input       [4:0]   addr,
    input       [31:0]  dataIn,
    output  reg [31:0]  dataOut,
    input               cs,
    input               wr0, wr1, wr2, wr3,
    input       [7:0]   errors,
    input               fail, tlast,
    output  reg [31:0]  ASM_Control,
    output  reg [15:0]  control = 16'h0010
);
     reg    [7:0]   failCnt, frameCnt;
     reg    [15:0]  errCnt;
     reg            csDly;

     always @(posedge rsClk) begin
        csDly <= cs;
        if (!cs && csDly) begin
            failCnt     <= 0;
            frameCnt    <= 0;
            errCnt      <= 0;
        end
        else if (tlast) begin
            if ((fail == 1'b1) && (failCnt < 255)) begin // saturate the counters to prevent overflow
                failCnt <= failCnt + 1;
            end
            if (frameCnt < 255) begin
                frameCnt <= frameCnt + 1;
            end
            if (errCnt < 6) begin
                errCnt   <= errCnt + errors;
            end
        end
     end

    always @(posedge busClk) begin
        if (cs && wr0) begin
            casex (addr)
                `RS_CONTROL:         control[7:0]       <= dataIn[7:0];
                `RS_ASM_CONTROL:     ASM_Control[7:0]   <= dataIn[7:0];
                default: ;
            endcase
        end

        if (cs && wr1) begin
            casex (addr)
                `RS_CONTROL:         control[15:8]      <= dataIn[15:8];
                `RS_ASM_CONTROL:     ASM_Control[15:8]  <= dataIn[15:8];
                default: ;
            endcase
        end

        if (cs && wr2) begin
            casex (addr)
                `RS_ASM_CONTROL:     ASM_Control[23:16] <= dataIn[23:16];
                default: ;
            endcase
        end

        if (cs && wr3) begin
            casex (addr)
                `RS_ASM_CONTROL:     ASM_Control[31:24] <= dataIn[31:24];
                default: ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `RS_CONTROL:        dataOut = {16'b0, control};
                `RS_STATUS:         dataOut = {failCnt, frameCnt, errCnt};
                `RS_ASM_CONTROL:    dataOut = ASM_Control;
                default:            dataOut = 32'b0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end


endmodule

