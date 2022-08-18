/*  Per CCSDS 131.0-B-3 the managed parameters for Reed Solomon consists of:
    Error Correction Capability (E symbols)     8, 16 yielding RS(255,239) and RS(255,223)
    yields message length of K = 255-2*E
    Interleaving Depths I                       1, 2, 3, 4, 5, 8
    Symbol width is fixed at 8 yielding a code length of 255, if N is less than 255 (say 150) the
    code is considered shortened. The data stream consists of only 150 bytes, incuding the check bytes.
    The IP core fills the shorted bytes with zeros

    Bit Definitions                 23:16           15:12             7:0
    Reed Solomon Control Register   blocks(N)       Interleave(I)     checks(K)

    SourceSelect    3:0
*/
`timescale 1ns/10ps
   `ifndef RS_ENC_CONTROL
        `define RS_ENC_CONTROL            13'bx_xxxx_xxx0_00xx
        `define RS_ENC_SOURCE_SELECT      13'bx_xxxx_xxx0_01xx
        `define RS_ENC_PHASE_INC          13'bx_xxxx_xxx0_10xx
   `endif

module rsEncRegs(
    input               busClk,
    input               cs,
    input               wr0, wr1, wr2, wr3,
    input       [12:0]  addr,
    input       [31:0]  dataIn,
    output  reg [31:0]  dataOut,
    output  reg [3:0]   sourceSelect,
    output      [3:0]   InterLeave,     // number of rows - 1, allows for Rows = 16.
    output      [7:0]   checks,
    output      [7:0]   blocks,
    output  reg [31:0]  phaseInc = 32'h08000000   // used for clock output generation due to adding check bits to stream
);

    reg     [31:0]  control = 32'h00ff_1010;     // default to 255 blocks, 239 symbols, 16 checks, no interleave

    assign  blocks      = control[23:16];
    assign  InterLeave  = control[15:12];
    assign  checks      = control[7:0];

    always @(posedge busClk) begin
        if (cs && wr0) begin
            casex (addr)
                `RS_ENC_CONTROL:         control[7:0]       <= dataIn[7:0];
                `RS_ENC_PHASE_INC:       phaseInc[7:0]      <= dataIn[7:0];
                `RS_ENC_SOURCE_SELECT:   sourceSelect       <= dataIn[3:0];
                default: ;
            endcase
        end

        if (cs && wr1) begin
            casex (addr)
                `RS_ENC_CONTROL:         control[15:8]      <= dataIn[15:8];
                `RS_ENC_PHASE_INC:       phaseInc[15:8]     <= dataIn[15:8];
                default: ;
            endcase
        end

        if (cs && wr2) begin
            casex (addr)
                `RS_ENC_CONTROL:         control[23:16]     <= dataIn[23:16];
                `RS_ENC_PHASE_INC:       phaseInc[23:16]    <= dataIn[23:16];
                default: ;
            endcase
        end

        if (cs && wr3) begin
            casex (addr)
                `RS_ENC_CONTROL:         control[31:24]     <= dataIn[31:24];
                `RS_ENC_PHASE_INC:       phaseInc[31:24]    <= dataIn[31:24];
                default: ;
            endcase
        end
    end

    always @* begin
        if (cs) begin
            casex (addr)
                `RS_ENC_CONTROL:        dataOut = control;
                `RS_ENC_SOURCE_SELECT:  dataOut = {28'b0, sourceSelect};
                `RS_ENC_PHASE_INC:      dataOut = phaseInc;
                default:            dataOut = 32'b0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end


endmodule

