`timescale 1ns/10ps

`include "addressMap.v"

module viterbi(
    input                   clk,clkEn,reset,
    input                   busClk,
    input                   cs,
    input                   wr0,wr1,wr2,wr3,
    input           [12:0]  addr,
    input           [31:0]  din,
    output          [31:0]  dout,
    input           [1:0]   bitsyncMode,    // not used
    input                   ch0SymEn,
    input   signed  [17:0]  ch0SymData,
    input                   ch1SymEn,
    input   signed  [17:0]  ch1SymData,
    output          [4:0]   viterbiMode,
    output                  ch0BitEnOut,
    output                  ch0BitOut,
    output                  ch1BitEnOut,
    output                  ch1BitOut
    );

    `define VITERBI_SYMEN_DELAY 19

    reg viterbiSpace;
    always @* begin
        casex(addr)
            `VITERBISPACE:  viterbiSpace = cs;
            default:        viterbiSpace = 0;
        endcase
    end

    wire    [15:0]  invMeanMantissa;
    wire    [2:0]   invMeanExponent;
    wire    [15:0]  berTestLength;
 (* MARK_DEBUG="true" *)    reg             ch0InSync;
 (* MARK_DEBUG="true" *)    reg             ch1InSync;
 (* MARK_DEBUG="true" *)    reg     [3:0]   ch0SyncState;
 (* MARK_DEBUG="true" *)    reg     [3:0]   ch1SyncState;
    viterbiRegs vregs(
        .busClk(busClk),
        .cs(viterbiSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(din),
        .dataOut(dout),
        .ch0InSync(ch0InSync),
        .ch1InSync(ch1InSync),
        .ch0SyncState(ch0SyncState),
        .ch1SyncState(ch1SyncState),
        .viterbiMode(viterbiMode),
        .inverseMeanMantissa(invMeanMantissa),
        .inverseMeanExponent(invMeanExponent),
        .berTestLength(berTestLength)
    );

    // Create a signal to indicate when a G1/G2 pair of symbols is available.
 (* MARK_DEBUG="true" *)    reg             ch0CodeEn;
 (* MARK_DEBUG="true" *)    wire            ch0SoftEn = (clkEn & ch0SymEn);
 (* MARK_DEBUG="true" *)    wire            ch0VitEn = (ch0SoftEn & ch0CodeEn);
 (* MARK_DEBUG="true" *)    reg             ch1CodeEn;
 (* MARK_DEBUG="true" *)    wire            ch1SoftEn = (clkEn & ch1SymEn);
 (* MARK_DEBUG="true" *)    wire            ch1VitEn = (ch1SoftEn & ch1CodeEn);
    always @(posedge clk) begin
        if (reset) begin
            ch0CodeEn <= 0;
            ch1CodeEn <= 0;
        end
        else begin
            case (viterbiMode[2:0])
                `VIT_MODE_DUAL_CH,
                `VIT_MODE_OFFSET_CH: begin
                    ch0CodeEn <= 1;
                    ch1CodeEn <= 1;
                end
                default: begin
                    if (ch0SoftEn) begin
                        ch0CodeEn <= ~ch0CodeEn;
                    end
                    if (ch1SoftEn) begin
                        ch1CodeEn <= ~ch1CodeEn;
                    end
                end
            endcase
        end
    end

    // Soft Decision Mapper
    wire    [2:0]   ch0Soft;
    softDecisionMapper ch0Map(
        .clk(clk),
        .clkEn(ch0SoftEn),
        .reset(reset),
        .inverseMeanMantissa(invMeanMantissa),
        .inverseMeanExponent(invMeanExponent),
        .dIn(ch0SymData),
        .dOut(ch0Soft)
    );
    wire    [2:0]   ch1Soft;
    softDecisionMapper ch1Map(
        .clk(clk),
        .clkEn(ch1SoftEn),
        .reset(reset),
        .inverseMeanMantissa(invMeanMantissa),
        .inverseMeanExponent(invMeanExponent),
        .dIn(ch1SymData),
        .dOut(ch1Soft)
    );

    // Delayed versions of the soft values used for OQPSK
    reg     [2:0]   ch0SoftDelay0,ch1SoftDelay0;
    reg     [2:0]   ch0SoftDelay1,ch1SoftDelay1;
    always @(posedge clk) begin
        if (ch0SoftEn) begin
            ch0SoftDelay0 <= ch0Soft;
            ch0SoftDelay1 <= ch0SoftDelay0;
        end
        if (ch1SoftEn) begin
            ch1SoftDelay0 <= ch1Soft;
            ch1SoftDelay1 <= ch1SoftDelay0;
        end
    end

    `ifdef SIMULATE
    real ch0SymReal;
    always @* ch0SymReal = $itor(ch0SymData)/(2**17);
    real ch1SymReal;
    always @* ch1SymReal = $itor(ch1SymData)/(2**17);
    `endif

    // G1/G2 synchronization
    reg     [2:0]   ch0G1,ch0G2;
    reg     [2:0]   ch1G1,ch1G2;
 (* MARK_DEBUG="true" *)    reg             ch0OutOfSync;
 (* MARK_DEBUG="true" *)    reg             ch1OutOfSync;
 (* MARK_DEBUG="true" *)    reg     [3:0]   ch0BpskState;
 (* MARK_DEBUG="true" *)    reg     [3:0]   ch1BpskState;
 (* MARK_DEBUG="true" *)    reg     [3:0]   qpskState;
 (* MARK_DEBUG="true" *)    reg     [3:0]   oqpskState;
  parameter     P0_G1G2 =       4'b0000,
                P0_G2G1 =       4'b0001,     P90_G1G2 =      4'b1001,   // FZ I made the states 4 bits
                P180_G1G2 =     4'b0011,     P90_G2G1 =      4'b1011,   // to prevent the second column
                P180_G2G1 =     4'b0010,     P270_G1G2 =     4'b1010,   // sharing values with the first
                P0_G1G2n =      4'b0110,                                // since the new mode uses both columns
                P0_G2nG1 =      4'b0111,     P90_G1G2n =     4'b1111,
                P180_G1G2n =    4'b0101,     P90_G2nG1 =     4'b1101,
                P180_G2nG1 =    4'b0100,     P270_G1G2n =    4'b1100;


    always @(posedge clk) begin
        if (reset) begin
            ch0BpskState <= P0_G1G2;
            ch1BpskState <= P0_G1G2;
            qpskState <= P0_G1G2;
            oqpskState <= P0_G1G2;
        end
        else begin
            case (viterbiMode[2:0])
                // New mode
                `VIT_MODE_OFFSET_INTLV: begin      // Dual viterbi OQPSK
                    if (ch0SoftEn) begin
                        ch0SyncState <= oqpskState;
                        ch1SyncState <= oqpskState;
                        if (ch0OutOfSync & ch0CodeEn) begin        // 0, 1, 9, B, 6, 7, F, D, 0
                            case (oqpskState)
                                P0_G1G2:    oqpskState <= P0_G2G1;
                                P0_G2G1:    oqpskState <= P90_G1G2;
                                P90_G1G2:   oqpskState <= P90_G2G1;
                                P90_G2G1:   oqpskState <= P0_G1G2n;
                                P0_G1G2n:   oqpskState <= P0_G2nG1;
                                P0_G2nG1:   oqpskState <= P90_G1G2n;
                                P90_G1G2n:  oqpskState <= P90_G2nG1;
                                P90_G2nG1:  oqpskState <= P0_G1G2;
                                default:    oqpskState <= P0_G1G2;
                            endcase
                        end
                        case (oqpskState)
                            P0_G1G2: begin
                                 if (ch0CodeEn) begin
                                    ch0G1 <= ch0SoftDelay0;
                                    ch0G2 <= ch0Soft;
                                    ch1G1 <= ch1SoftDelay0;
                                    ch1G2 <= ch1Soft;
                                end
                            end
                            P0_G2G1: begin
                                if (!ch0CodeEn) begin
                                    ch0G1 <= ch0SoftDelay0;
                                    ch0G2 <= ch0Soft;
                                    ch1G1 <= ch1SoftDelay0;
                                    ch1G2 <= ch1Soft;
                                end
                            end
                            P90_G1G2: begin
                                if (ch0CodeEn) begin
                                    ch0G1 <= ch1SoftDelay1;
                                    ch0G2 <= ch1SoftDelay0;
                                    ch1G1 <= ~ch0SoftDelay0;
                                    ch1G2 <= ~ch0Soft;
                                end
                            end
                            P90_G2G1: begin
                                if (!ch0CodeEn) begin
                                    ch0G1 <= ch1SoftDelay1;
                                    ch0G2 <= ch1SoftDelay0;
                                    ch1G1 <= ~ch0SoftDelay0;
                                    ch1G2 <= ~ch0Soft;
                                end
                            end
                            P0_G1G2n: begin
                                if (ch0CodeEn) begin
                                    ch0G1 <= ch0SoftDelay0;
                                    ch0G2 <= ~ch0Soft;
                                    ch1G1 <= ch1SoftDelay0;
                                    ch1G2 <= ~ch1Soft;
                                end
                            end
                            P0_G2nG1: begin
                                if (!ch0CodeEn) begin
                                    ch0G1 <= ch0SoftDelay0;
                                    ch0G2 <= ~ch0Soft;
                                    ch1G1 <= ch1SoftDelay0;
                                    ch1G2 <= ~ch1Soft;
                                end
                            end
                            P90_G1G2n: begin
                                if (ch0CodeEn) begin
                                    ch0G1 <= ch1SoftDelay1;
                                    ch0G2 <= ~ch1SoftDelay0;
                                    ch1G1 <= ~ch0SoftDelay0;
                                    ch1G2 <= ch0Soft;
                                end
                            end
                            P90_G2nG1: begin
                                if (!ch0CodeEn) begin
                                    ch0G1 <= ch1SoftDelay1;
                                    ch0G2 <= ~ch1SoftDelay0;
                                    ch1G1 <= ~ch0SoftDelay0;
                                    ch1G2 <= ch0Soft;
                                end
                            end
                            default: begin
                                ch0G1 <= ch0SoftDelay0;
                                ch0G2 <= ch0Soft;
                                ch1G1 <= ch1SoftDelay0;
                                ch1G2 <= ch1Soft;
                            end
                        endcase
                    end
                end
                // End of new Interleave Mode


                `VIT_MODE_OFFSET_CH: begin      // OQPSK
                    if (ch0SoftEn) begin
                        ch0SyncState <= oqpskState;
                        ch1SyncState <= oqpskState;
                        if (ch0OutOfSync) begin
                            case (oqpskState)           // 0, 9, 3, A, 6, F, 5, C, 0
                                P0_G1G2:    oqpskState <= P90_G1G2;
                                P90_G1G2:   oqpskState <= P180_G1G2;
                                P180_G1G2:  oqpskState <= P270_G1G2;
                                P270_G1G2:  oqpskState <= P0_G1G2n;
                                P0_G1G2n:   oqpskState <= P90_G1G2n;
                                P90_G1G2n:  oqpskState <= P180_G1G2n;
                                P180_G1G2n: oqpskState <= P270_G1G2n;
                                P270_G1G2n: oqpskState <= P0_G1G2;
                                default:    oqpskState <= P0_G1G2;
                            endcase
                        end
                        case (oqpskState)
                            P0_G1G2: begin
                                ch0G1 <= ch0Soft;
                                ch0G2 <= ch1Soft;
                            end
                            P90_G1G2: begin
                                ch0G1 <= ch1SoftDelay0;
                                ch0G2 <= ~ch0Soft;
                            end
                            P180_G1G2: begin
                                ch0G1 <= ~ch0Soft;
                                ch0G2 <= ~ch1Soft;
                            end
                            P270_G1G2: begin
                                ch0G1 <= ~ch1SoftDelay0;
                                ch0G2 <= ch0Soft;
                            end
                            P0_G1G2n: begin
                                ch0G1 <= ch0Soft;
                                ch0G2 <= ~ch1Soft;
                            end
                            P90_G1G2n: begin
                                ch0G1 <= ch1SoftDelay0;
                                ch0G2 <= ch0Soft;
                            end
                            P180_G1G2n: begin
                                ch0G1 <= ~ch0Soft;
                                ch0G2 <= ch1Soft;
                            end
                            P270_G1G2n: begin
                                ch0G1 <= ~ch1SoftDelay0;
                                ch0G2 <= ~ch0Soft;
                            end
                            default: begin
                                ch0G1 <= ch0Soft;
                                ch0G2 <= ch1Soft;
                            end
                        endcase
                    end
                end
                /*
                Eight possible states based on 4 phase states and G2 inversion.
                */
                `VIT_MODE_DUAL_CH: begin        // QPSK
                    if (ch0SoftEn) begin
                        ch0SyncState <= qpskState;
                        ch1SyncState <= qpskState;
                        if (ch0OutOfSync) begin
                            case (qpskState)            // 0, 9, 3, A, 6, F, 5, C, 0
                                P0_G1G2:    qpskState <= P90_G1G2;
                                P90_G1G2:   qpskState <= P180_G1G2;
                                P180_G1G2:  qpskState <= P270_G1G2;
                                P270_G1G2:  qpskState <= P0_G1G2n;
                                P0_G1G2n:   qpskState <= P90_G1G2n;
                                P90_G1G2n:  qpskState <= P180_G1G2n;
                                P180_G1G2n: qpskState <= P270_G1G2n;
                                P270_G1G2n: qpskState <= P0_G1G2;
                                default:    qpskState <= P0_G1G2;
                            endcase
                        end
                        case (qpskState)
                            P0_G1G2: begin
                                ch0G1 <= ch0Soft;
                                ch0G2 <= ch1Soft;
                            end
                            P90_G1G2: begin
                                ch0G1 <= ch1Soft;
                                ch0G2 <= ~ch0Soft;
                            end
                            P180_G1G2: begin
                                ch0G1 <= ~ch0Soft;
                                ch0G2 <= ~ch1Soft;
                            end
                            P270_G1G2: begin
                                ch0G1 <= ~ch1Soft;
                                ch0G2 <= ch0Soft;
                            end
                            P0_G1G2n: begin
                                ch0G1 <= ch0Soft;
                                ch0G2 <= ~ch1Soft;
                            end
                            P90_G1G2n: begin
                                ch0G1 <= ch1Soft;
                                ch0G2 <= ch0Soft;
                            end
                            P180_G1G2n: begin
                                ch0G1 <= ~ch0Soft;
                                ch0G2 <= ch1Soft;
                            end
                            P270_G1G2n: begin
                                ch0G1 <= ~ch1Soft;
                                ch0G2 <= ~ch0Soft;
                            end
                            default: begin
                                ch0G1 <= ch0Soft;
                                ch0G2 <= ch1Soft;
                            end
                        endcase
                    end
                end
                /*
                Eight possible states based on whether ch0CodeEn is lined up with
                G1 or G2, whether or not G2 was inverted, and the phase
                ambiguity of BPSK. This assumes G1 is always transmitted first
                */
                //`VIT_MODE_SINGLE_CH,
                //`VIT_MODE_IND_CH,
                default: begin
                    if (ch0SoftEn) begin
                        ch0SyncState <= ch0BpskState;
                        if (ch0OutOfSync & ch0CodeEn) begin
                            case (ch0BpskState)             // 0, 1, 3, 2, 6, 7, 5, 4, 0
                                P0_G1G2:    ch0BpskState <= P0_G2G1;
                                P0_G2G1:    ch0BpskState <= P180_G1G2;
                                P180_G1G2:  ch0BpskState <= P180_G2G1;
                                P180_G2G1:  ch0BpskState <= P0_G1G2n;
                                P0_G1G2n:   ch0BpskState <= P0_G2nG1;
                                P0_G2nG1:   ch0BpskState <= P180_G1G2n;
                                P180_G1G2n: ch0BpskState <= P180_G2nG1;
                                P180_G2nG1: ch0BpskState <= P0_G1G2;
                                default:    ch0BpskState <= P0_G1G2;
                            endcase
                        end
                        case (ch0BpskState)
                            P0_G1G2: begin
                                if (ch0CodeEn) begin
                                    ch0G1 <= ch0SoftDelay0;
                                    ch0G2 <= ch0Soft;
                                end
                            end
                            P0_G2G1: begin
                                if (!ch0CodeEn) begin
                                    ch0G1 <= ch0SoftDelay0;
                                    ch0G2 <= ch0Soft;
                                end
                            end
                            P0_G1G2n: begin
                                if (ch0CodeEn) begin
                                    ch0G1 <= ch0SoftDelay0;
                                    ch0G2 <= ~ch0Soft;
                                end
                            end
                            P0_G2nG1: begin
                                if (!ch0CodeEn) begin
                                    ch0G1 <= ch0SoftDelay0;
                                    ch0G2 <= ~ch0Soft;
                                end
                            end
                            P180_G1G2: begin
                                if (ch0CodeEn) begin
                                    ch0G1 <= ~ch0SoftDelay0;
                                    ch0G2 <= ~ch0Soft;
                                end
                            end
                            P180_G2G1: begin
                                if (!ch0CodeEn) begin
                                    ch0G1 <= ~ch0SoftDelay0;
                                    ch0G2 <= ~ch0Soft;
                                end
                            end
                            P180_G1G2n: begin
                                if (ch0CodeEn) begin
                                    ch0G1 <= ~ch0SoftDelay0;
                                    ch0G2 <= ch0Soft;
                                end
                            end
                            P180_G2nG1: begin
                                if (!ch0CodeEn) begin
                                    ch0G1 <= ~ch0SoftDelay0;
                                    ch0G2 <= ch0Soft;
                                end
                            end
                            default: begin
                                if (ch0CodeEn) begin
                                    ch0G1 <= ch0SoftDelay0;
                                    ch0G2 <= ch0Soft;
                                end
                            end
                        endcase
                    end
                    if (ch1SoftEn) begin
                        ch1SyncState <= ch1BpskState;
                        if (ch1OutOfSync & ch1CodeEn) begin
                            case (ch1BpskState)            // 0, 1, 3, 2, 6, 7, 5, 4, 0
                                P0_G1G2:    ch1BpskState <= P0_G2G1;
                                P0_G2G1:    ch1BpskState <= P180_G1G2;
                                P180_G1G2:  ch1BpskState <= P180_G2G1;
                                P180_G2G1:  ch1BpskState <= P0_G1G2n;
                                P0_G1G2n:   ch1BpskState <= P0_G2nG1;
                                P0_G2nG1:   ch1BpskState <= P180_G1G2n;
                                P180_G1G2n: ch1BpskState <= P180_G2nG1;
                                P180_G2nG1: ch1BpskState <= P0_G1G2;
                                default:    ch1BpskState <= P0_G1G2;
                            endcase
                        end
                        case (ch1BpskState)
                            P0_G1G2: begin
                                if (ch1CodeEn) begin
                                    ch1G1 <= ch1SoftDelay0;
                                    ch1G2 <= ch1Soft;
                                end
                            end
                            P0_G2G1: begin
                                if (!ch1CodeEn) begin
                                    ch1G1 <= ch1SoftDelay0;
                                    ch1G2 <= ch1Soft;
                                end
                            end
                            P0_G1G2n: begin
                                if (ch1CodeEn) begin
                                    ch1G1 <= ch1SoftDelay0;
                                    ch1G2 <= ~ch1Soft;
                                end
                            end
                            P0_G2nG1: begin
                                if (!ch1CodeEn) begin
                                    ch1G1 <= ch1SoftDelay0;
                                    ch1G2 <= ~ch1Soft;
                                end
                            end
                            P180_G1G2: begin
                                if (ch1CodeEn) begin
                                    ch1G1 <= ~ch1SoftDelay0;
                                    ch1G2 <= ~ch1Soft;
                                end
                            end
                            P180_G2G1: begin
                                if (!ch1CodeEn) begin
                                    ch1G1 <= ~ch1SoftDelay0;
                                    ch1G2 <= ~ch1Soft;
                                end
                            end
                            P180_G1G2n: begin
                                if (ch1CodeEn) begin
                                    ch1G1 <= ~ch1SoftDelay0;
                                    ch1G2 <= ch1Soft;
                                end
                            end
                            P180_G2nG1: begin
                                if (!ch1CodeEn) begin
                                    ch1G1 <= ~ch1SoftDelay0;
                                    ch1G2 <= ch1Soft;
                                end
                            end
                            default: begin
                                if (ch1CodeEn) begin
                                    ch1G1 <= ch1SoftDelay0;
                                    ch1G2 <= ch1Soft;
                                end
                            end
                        endcase
                    end
                end
            endcase
        end
    end

    // Viterbi Decoder
    `ifdef SIMULATE
    reg             vitReset;
    initial         vitReset = 0;
    `endif

 (* MARK_DEBUG="true" *)     wire    [15:0]  ch0BerCount, berCount;
    wire    [7:0]   ch0DataVector;
    assign          ch0BitOut = ch0DataVector[0];
    xilinxViterbi9p1 ch0Decoder(
        .aclk(clk),
        `ifdef SIMULATE
        .aresetn(!(reset | ch0OutOfSync | vitReset)),
        `else
        .aresetn(!(reset | ch0OutOfSync)),
        `endif
        .s_axis_data_tvalid(ch0VitEn),
        .s_axis_data_tdata({5'b0,ch0G2,5'b0,ch0G1}),
        .s_axis_data_tready(),
        .s_axis_dstat_tvalid(ch0VitEn),
        .s_axis_dstat_tdata(berTestLength),
        .m_axis_data_tvalid(ch0VitRdy),
        .m_axis_data_tdata(ch0DataVector),
        .m_axis_dstat_tvalid(ch0BerDone),
        .m_axis_dstat_tdata(ch0BerCount)
    );
 (* MARK_DEBUG="true" *)    wire    [15:0]  ch1BerCount;
    wire    [7:0]   ch1DataVector;
    assign          ch1BitOut = ch1DataVector[0];
    xilinxViterbi9p1 ch1Decoder(
        .aclk(clk),
        `ifdef SIMULATE
        .aresetn(!(reset | ch1OutOfSync | vitReset)),
        `else
        .aresetn(!(reset | ch1OutOfSync)),
        `endif
        .s_axis_data_tvalid(ch1VitEn),
        .s_axis_data_tdata({5'b0,ch1G2,5'b0,ch1G1}),
        .s_axis_data_tready(),
        .s_axis_dstat_tvalid(ch1VitEn),
        .s_axis_dstat_tdata(berTestLength),
        .m_axis_data_tvalid(ch1VitRdy),
        .m_axis_data_tdata(ch1DataVector),
        .m_axis_dstat_tvalid(ch1BerDone),
        .m_axis_dstat_tdata(ch1BerCount)
    );


    // Output bit enables
    assign ch0BitEnOut = ch0VitEn;
    assign ch1BitEnOut = ch1VitEn;

    // Dual OQPSK viterbi mode should check both BER counts, FZ
     assign  berCount = (viterbiMode[2:0] == `VIT_MODE_OFFSET_INTLV) ? ch0BerCount + ch1BerCount : ch0BerCount;
     wire    clr0OutOfSync = (viterbiMode[2:0] == `VIT_MODE_DUAL_CH) || (viterbiMode[2:0] == `VIT_MODE_OFFSET_CH) ? ch0SoftEn : ch0SoftEn & ch0CodeEn;
     wire    clr1OutOfSync = (viterbiMode[2:0] == `VIT_MODE_DUAL_CH) || (viterbiMode[2:0] == `VIT_MODE_OFFSET_CH) ? ch1SoftEn : ch1SoftEn & ch1CodeEn;

    // Ch0 Sync Detect
    reg     signed  [15:0]  ch0SprtAccum;
    `define SPRT_SYNC_LIMIT     16'd128
    `define SPRT_START_VALUE    16'd64
    always @(posedge clk) begin
        if (reset) begin
            ch0OutOfSync <= 1'b0;
            ch0InSync <= 1'b0;
            ch0SprtAccum <= `SPRT_START_VALUE;
        end
        else if (clkEn) begin
            if (ch0BitEnOut & ch0VitRdy) begin
                if (ch0BerDone) begin
                    // Were there errors?
                    if (berCount != 0) begin
                        // Yes. Has sprt reached zero?
                        if (ch0SprtAccum >= berCount) begin
                            // No. Decrement sprt
                            ch0SprtAccum <= ch0SprtAccum - berCount;
                        end
                        else begin
                            // Yes. Declare out of sync
                            ch0SprtAccum <= `SPRT_START_VALUE;
                            ch0OutOfSync <= 1'b1;
                            ch0InSync <= 1'b0;
                        end
                    end
                    else begin
                        // No. Has sprt reached upper limit?
                        if (ch0SprtAccum < (`SPRT_SYNC_LIMIT-8)) begin
                            // No. increment sprt
                            ch0SprtAccum <= ch0SprtAccum + 8;
                        end
                        else begin
                            // Yes. Declare sync
                            ch0SprtAccum <= `SPRT_SYNC_LIMIT;
                            ch0InSync <= 1'b1;
                        end
                    end
                end
                else begin
                    ch0OutOfSync <= 1'b0;
                end
            end
            else if (clr0OutOfSync) begin       // was ch0BitEnOut but was high for two oqpskState increments
                ch0OutOfSync <= 1'b0;
            end
        end
    end

    // Ch1 Sync Detect
    reg     signed  [15:0]  ch1SprtAccum;
    always @(posedge clk) begin
        if (reset) begin
            ch1OutOfSync <= 1'b0;
            ch1InSync <= 1'b0;
            ch1SprtAccum <= `SPRT_START_VALUE;
        end
        // Are the channels independent?
        else if ( (viterbiMode[2:0] == `VIT_MODE_DUAL_CH) || (viterbiMode[2:0] == `VIT_MODE_OFFSET_INTLV)
               || (viterbiMode[2:0] == `VIT_MODE_OFFSET_CH) ) begin
            // No. Use the ch0 values to set ch1 state.
            if (clkEn) begin
                if (ch0BitEnOut & ch0VitRdy) begin
                    if (ch0BerDone) begin
                        // Were there errors?
                        if (berCount != 0) begin
                            // Yes. Has sprt reached zero?
                            if (ch0SprtAccum >= berCount) begin
                                // No.
                            end
                            else begin
                                // Yes. Declare out of sync
                                ch1OutOfSync <= 1'b1;
                                ch1InSync <= 1'b0;
                            end
                        end
                        else begin
                            // No. Has sprt reached upper limit?
                            if (ch0SprtAccum < (`SPRT_SYNC_LIMIT-8)) begin
                                // No.
                            end
                            else begin
                                // Yes. Declare sync
                                ch1InSync <= 1'b1;
                            end
                        end
                    end
                    else begin
                        ch1OutOfSync <= 1'b0;
                    end
                end
                else if (clr0OutOfSync) begin
                    ch1OutOfSync <= 1'b0;
                end
            end
        end
        // Independent channels. Process ch1 state.
        else if (clkEn) begin
            if (ch1BitEnOut & ch1VitRdy) begin
                if (ch1BerDone) begin
                    // Were there errors?
                    if (ch1BerCount != 0) begin
                        // Yes. Has sprt reached zero?
                        if (ch1SprtAccum >= ch1BerCount) begin
                            // No. Decrement sprt
                            ch1SprtAccum <= ch1SprtAccum - ch1BerCount;
                        end
                        else begin
                            // Yes. Declare out of sync
                            ch1SprtAccum <= `SPRT_START_VALUE;
                            ch1OutOfSync <= 1'b1;
                            ch1InSync <= 1'b0;
                        end
                    end
                    else begin
                        // No. Has sprt reached upper limit?
                        if (ch1SprtAccum < (`SPRT_SYNC_LIMIT-8)) begin
                            // No. increment sprt
                            ch1SprtAccum <= ch1SprtAccum + 8;
                        end
                        else begin
                            // Yes. Declare sync
                            ch1SprtAccum <= `SPRT_SYNC_LIMIT;
                            ch1InSync <= 1'b1;
                        end
                    end
                end
                else begin
                    ch1OutOfSync <= 1'b0;
                end
            end
            else if (clr1OutOfSync) begin
                ch1OutOfSync <= 1'b0;
            end
        end
    end

endmodule

