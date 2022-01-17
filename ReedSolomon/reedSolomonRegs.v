/*  Per CCSDS 131.0-B-3 the managed parameters for Reed Solomon consists of:
    Error Correction Capability (E symbols)     8, 16 yielding RS(255,239) and RS(255,223)
    yields message length of K = 255-2*E
    Interleaving Depths I                       1,2, 3, 4, 5, 8
    Shortend Length (S symbols)                 Integer 0 to K

                                    31:16       15:12               9:8         7:0
    Reed Solomon Control Register   FrameLen    Interleave[3:0]     R_IN_MSBs   N_IN[7:0]
R_MSBs = 01 or 10. I append 0000s for 010000 or 100000 for 16 or 32
N_IN defines the total symbols per frame, usually 255 but could be shortened by Q
FrameLen needs calculated as I(255 - K + S), for normal frame, S = K so -K+S = 0. FrameLen - 255*I

                                    31:24           23:16           15:0
    Reed Solomon Status Register    FailCnt[7:0]    FrameCnt[7:0]   ErrCnt[15:0]

                                    31:29       28:24       21:16       13:8        4:0
    Attached Sync Marker (ASM)      BitSlips    IL_BET      OOL_BET     Verifies    FlyWheels
            Default
    BitSlips    3   Allowed number of clock slips between ASMs, slips can be plus or minus
    IL_BET      4   In Lock Bit Error Threshold is the number of ASM bits than can be wrong when locked
    OOL_BET     4   Out Of Lock Bit Error Threshold is the number of ASM bits than can be wrong when searching (not locked)
    Verifies    3   Number of verify frames before declaring Lock. Prevents premature locking on first n correlations above threshold
    FlyWheels   4   Number of ASM misses before reverting back to Search mode

    FailCnt and ErrCnt will accumulate errors until read, which resets them to 0
    FrameCnt keeps track of the number of frames between reads so FERs can be calculated
*/
`timescale 1ns/10ps
`ifndef RS_DEC_CONTROL
`define RS_DEC_CONTROL         5'b0_00xx
`define RS_DEC_STATUS          5'b0_01xx
`define RS_DEC_ASM_CONTROL     5'b0_10xx
`endif

module reedSolomonRegs(
    input               rsClk,      // used for frame tracking
    input               busClk,
    input               cs,
    input               wr0, wr1, wr2, wr3,
    input       [4:0]   addr,
    input       [31:0]  dataIn,
    output  reg [31:0]  dataOut,
    input       [5:0]   errors,
    input               fail, ErrorsVld,
    output      [3:0]   InterLeave,     // number of rows - 1, allows for Rows = 16.
    output      [7:0]   Cols,
    output      [2:0]   BitSlips,
    output      [4:0]   IL_BET,
                        OOL_BET,
                        Verifies,
                        FlyWheels,
    output      [15:0]  s_axis_control,
                        frameLen
);

    reg     [7:0]   failCnt, frameCnt, ErrorsDly;
    reg     [15:0]  errCnt;
    reg      [1:0]  csDly;
    reg     [31:0]  control,
                    ASM_Control = 32'h64040304;

    assign  BitSlips    = ASM_Control[31:29];
    assign  IL_BET      = ASM_Control[28:24];
    assign  OOL_BET     = ASM_Control[21:16];
    assign  Verifies    = ASM_Control[13:8];
    assign  FlyWheels   = ASM_Control[4:0];
    assign  s_axis_control = {2'b00, control[9:8], 4'b0000, control[7:0]};    // R_IN = 13:8, N_IN = 7:0
    assign  frameLen    = control[31:16];
    assign  InterLeave  = control[15:12];
    assign  Cols        = control[7:0];

    always @(posedge rsClk) begin
       csDly <= {csDly[0], cs};
       if (!csDly[0] && csDly[1]) begin     // falling edge of chip select
           failCnt     <= 0;
           frameCnt    <= 0;
           errCnt      <= 0;
       end
       else if (ErrorsVld) begin
           if ((fail == 1'b1) && (failCnt < 255)) begin // saturate the counters to prevent overflow
               failCnt <= failCnt + 1;
           end
           if (frameCnt < 255) begin
               frameCnt <= frameCnt + 1;
           end
           if (errCnt < 65000) begin    // prevent overflow
               errCnt   <= errCnt + errors;
           end
       end
    end

    always @(posedge busClk) begin
        if (cs && wr0) begin
            casex (addr)
                `RS_DEC_CONTROL:         control[7:0]       <= dataIn[7:0];
                `RS_DEC_ASM_CONTROL:     ASM_Control[7:0]   <= dataIn[7:0];
                default: ;
            endcase
        end

        if (cs && wr1) begin
            casex (addr)
                `RS_DEC_CONTROL:         control[15:8]      <= dataIn[15:8];
                `RS_DEC_ASM_CONTROL:     ASM_Control[15:8]  <= dataIn[15:8];
                default: ;
            endcase
        end

        if (cs && wr2) begin
            casex (addr)
                `RS_DEC_CONTROL:         control[23:16]     <= dataIn[23:16];
                `RS_DEC_ASM_CONTROL:     ASM_Control[23:16] <= dataIn[23:16];
                default: ;
            endcase
        end

        if (cs && wr3) begin
            casex (addr)
                `RS_DEC_CONTROL:         control[31:24]     <= dataIn[31:24];
                `RS_DEC_ASM_CONTROL:     ASM_Control[31:24] <= dataIn[31:24];
                default: ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `RS_DEC_CONTROL:        dataOut = control;
                `RS_DEC_STATUS:         dataOut = {failCnt, frameCnt, errCnt};
                `RS_DEC_ASM_CONTROL:    dataOut = ASM_Control;
                default:            dataOut = 32'b0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end


endmodule

