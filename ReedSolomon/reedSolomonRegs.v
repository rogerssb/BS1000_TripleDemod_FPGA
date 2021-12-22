//                                 31        24     23        12    11          4   3             1    0
// Reed Solomon Control Register   FailCnt[7:0]     ErrCnt[11:0]    FrameCnt[7:0]   Interleave[2:0]    R_Index
// The RS Decoder can do either (255,223) or (255,239) by setting R_Index to 1 or 0
// Interleave can be 1 to 5
// FailCnt and ErrCnt will accumulate errors until read, which resets them to 0
// FrameCnt keeps track of the number of frames between reads so WERs can be calculated

`timescale 1ns/10ps
`ifndef RS_CONTROL
`define RS_CONTROL         5'b0_00xx
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
    output  reg [3:0]   control = 4'b0010
);
     reg    [7:0]   failCnt, frameCnt;
     reg    [11:0]  errCnt;
     reg            csDly;

     always @(posedge rsClk) begin
        csDly <= cs;
        if (!cs && csDly) begin
            failCnt     <= 0;
            frameCnt    <= 0;
            errCnt      <= 0;
        end
        else if (tlast) begin
            if (fail) begin
                failCnt <= failCnt + 1;
            end
            frameCnt <= frameCnt + 1;
            errCnt   <= errCnt + errors;
        end
     end

    always @(posedge busClk) begin
        if (cs && wr0) begin
            casex (addr)
                `RS_CONTROL:         control  <= dataIn[3:0];
                default: ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `RS_CONTROL:        dataOut = {failCnt, errCnt, frameCnt, control};
                default:            dataOut = 32'b0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end


endmodule

