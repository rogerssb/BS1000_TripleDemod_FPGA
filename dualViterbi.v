`timescale 1ns/10ps

`include "addressMap.v"

module dualViterbi(
    input                       clk,clkEn,reset,
    input                       wr0,wr1,wr2,wr3,
    input               [12:0]  addr,
    input               [31:0]  din,
    output              [31:0]  dout,
    input               [4:0]   demodMode,
    input               [1:0]   decoderSource,
    input                       symEn,
    input       signed  [17:0]  iSymData,
    input       signed  [17:0]  qSymData,
    input               [3:0]   dac0Select,
    input               [3:0]   dac1Select,
    input               [3:0]   dac2Select,
    output                      bitEnOut,
    output                      iBitOut,
    output                      qBitOut,
    output  reg                 vitError,
    `ifdef SIMULATE
    output  reg                 dac0ClkEn,
    output  reg         [17:0]  dac0Output,
    output  reg                 dac1ClkEn,
    output  reg         [17:0]  dac1Output,
    output  reg                 dac2ClkEn,
    output  reg         [17:0]  dac2Output
    `else
    output  reg                 dac0ClkEn,
    output  reg signed  [17:0]  dac0Output,
    output  reg                 dac1ClkEn,
    output  reg signed  [17:0]  dac1Output,
    output  reg                 dac2ClkEn,
    output  reg signed  [17:0]  dac2Output
    `endif
    );

    `define VITERBI_SYMEN_DELAY 19
    //`define HARD_DECISIONS

    reg viterbiSpace;
    always @* begin
        casex(addr)
            `VITERBISPACE:  viterbiSpace = 1;
            default:        viterbiSpace = 0;
        endcase
    end

    wire    [15:0]  invMeanMantissa;
    wire    [2:0]   invMeanExponent;
    reg             inSync;
    reg     [2:0]   syncState;
    viterbiRegs vregs(
        .cs(viterbiSpace),
        .wr0(wr0), .wr1(wr1), .wr2(wr2), .wr3(wr3),
        .addr(addr),
        .dataIn(din),
        .dataOut(dout),
        .inSync(inSync),
        .syncState(syncState),
        .inverseMeanMantissa(invMeanMantissa),
        .inverseMeanExponent(invMeanExponent)
    );

    // Create a signal to indicate when a G1/G2 pair of symbols is available.
    reg             codeEn;
    wire            softEn = (clkEn & symEn);
    wire            vitEn = (softEn & codeEn);
    always @(posedge clk) begin
        if (reset) begin
            codeEn <= 0;
        end
        else begin
            case (demodMode)
                `MODE_QPSK: begin
                    codeEn <= 1;
                end
                `MODE_OQPSK: begin
                    if (decoderSource == `DEC_MUX_SEL_VITERBI) begin
                        if (softEn) begin
                            codeEn <= ~codeEn;
                        end
                    end
                    else begin
                        codeEn <= 1;
                    end
                end
                default: begin
                    if (softEn) begin
                        codeEn <= ~codeEn;
                    end
                end
            endcase
        end
    end

    // Reclock the viterbi inputs to meet timing
    reg                     softEnReg;
    reg                     codeEnReg;
    reg                     vitEnReg;
    reg     signed  [17:0]  iSymDataReg;
    reg     signed  [17:0]  qSymDataReg;
    always @(posedge clk) begin
        softEnReg <= softEn;
        codeEnReg <= codeEn;
        vitEnReg <= vitEn;
        iSymDataReg <= iSymData;
        qSymDataReg <= qSymData;
    end

    `ifdef HARD_DECISIONS
    reg     [2:0]   iSoft,qSoft;
    always @(posedge clk) begin
        if (softEnReg) begin
            if (iSymDataReg[17]) begin
                iSoft <= 3'h2;
            end
            else begin
                iSoft <= 3'h5;
            end
            if (qSymDataReg[17]) begin
                qSoft <= 3'h2;
            end
            else begin
                qSoft <= 3'h5;
            end
        end
    end
    `else
    // Soft Decision Mapper
    wire    [2:0]   iSoft;
    softDecisionMapper iMap(
        .clk(clk),
        .clkEn(softEnReg),
        .reset(reset),
        .inverseMeanMantissa(invMeanMantissa),
        .inverseMeanExponent(invMeanExponent),
        .dIn(iSymDataReg),
        .dOut(iSoft)
    );
    wire    [2:0]   qSoft;
    softDecisionMapper qMap(
        .clk(clk),
        .clkEn(softEnReg),
        .reset(reset),
        .inverseMeanMantissa(invMeanMantissa),
        .inverseMeanExponent(invMeanExponent),
        .dIn(qSymDataReg),
        .dOut(qSoft)
    );
    `endif

    // Delayed versions of the soft values used for OQPSK
    reg     [2:0]   iSoftDelay0,qSoftDelay0;
    reg     [2:0]   iSoftDelay1,qSoftDelay1;
    always @(posedge clk) begin
        if (softEnReg) begin
            iSoftDelay0 <= iSoft;
            qSoftDelay0 <= qSoft;
            iSoftDelay1 <= iSoftDelay0;
            qSoftDelay1 <= qSoftDelay0;
        end
    end

    `ifdef SIMULATE
    real iSymReal;
    always @* iSymReal = $itor(iSymData)/(2**17);
    real qSymReal;
    always @* qSymReal = $itor(qSymData)/(2**17);
    `endif

    // G1/G2 synchronization
    reg     [2:0]   i_g1,i_g2;
    reg     [2:0]   q_g1,q_g2;
    reg             outOfSync;
    reg     [1:0]   singleRailState;
    parameter   G1G2 =      2'b00,
                G2G1 =      2'b01,
                G1G2_ =     2'b11,
                G2_G1 =     2'b10;
    reg     [2:0]   bpskState;
    reg     [2:0]   qpskState;
    reg     [2:0]   oqpskState;
    parameter   P0_G1G2 =       3'b000,
                P0_G2G1 =       3'b001,     P270_G1G2 =     3'b001,
                P90_G1G2 =      3'b011,     P180_G2G1 =     3'b011,
                P90_G2G1 =      3'b010,     P180_G1G2 =     3'b010,
                P0_G1G2_ =      3'b110,
                P0_G2_G1 =      3'b111,     P270_G1G2_ =    3'b111,
                P90_G1G2_ =     3'b101,     P180_G2_G1 =    3'b101,
                P90_G2_G1 =     3'b100,     P180_G1G2_ =    3'b100;

    always @(posedge clk) begin
        if (reset) begin
            singleRailState <= G1G2;
            bpskState <= P0_G1G2;
            qpskState <= P0_G1G2;
            oqpskState <= P0_G1G2;
        end
        else if (softEnReg) begin
            case (demodMode)
                `MODE_OQPSK: begin
                    `define OQPSK_LWK
                    `ifdef OQPSK_LWK
                    if (decoderSource == `DEC_MUX_SEL_VITERBI) begin
                        syncState <= oqpskState;
                        if (outOfSync & codeEnReg) begin
                            case (oqpskState)
                                P0_G1G2:    oqpskState <= P0_G2G1;
                                P0_G2G1:    oqpskState <= P90_G1G2;
                                P90_G1G2:   oqpskState <= P90_G2G1;
                                P90_G2G1:   oqpskState <= P0_G1G2_;
                                P0_G1G2_:   oqpskState <= P0_G2_G1;
                                P0_G2_G1:   oqpskState <= P90_G1G2_;
                                P90_G1G2_:  oqpskState <= P90_G2_G1;
                                P90_G2_G1:  oqpskState <= P0_G1G2;
                                default:    oqpskState <= P0_G1G2;
                            endcase
                        end
                        case (oqpskState)
                            P0_G1G2: begin
                                if (codeEnReg) begin
                                    i_g1 <= iSoftDelay0;
                                    i_g2 <= iSoft;
                                    q_g1 <= qSoftDelay0;
                                    q_g2 <= qSoft;
                                end
                            end
                            P0_G2G1: begin
                                if (!codeEnReg) begin
                                    i_g1 <= iSoftDelay0;
                                    i_g2 <= iSoft;
                                    q_g1 <= qSoftDelay0;
                                    q_g2 <= qSoft;
                                end
                            end
                            P90_G1G2: begin
                                if (codeEnReg) begin
                                    i_g1 <= qSoftDelay1;
                                    i_g2 <= qSoftDelay0;
                                    q_g1 <= ~iSoftDelay0;
                                    q_g2 <= ~iSoft;
                                end
                            end
                            P90_G2G1: begin
                                if (!codeEnReg) begin
                                    i_g1 <= qSoftDelay1;
                                    i_g2 <= qSoftDelay0;
                                    q_g1 <= ~iSoftDelay0;
                                    q_g2 <= ~iSoft;
                                end
                            end
                            P0_G1G2_: begin
                                if (codeEnReg) begin
                                    i_g1 <= iSoftDelay0;
                                    i_g2 <= ~iSoft;
                                    q_g1 <= qSoftDelay0;
                                    q_g2 <= ~qSoft;
                                end
                            end
                            P0_G2_G1: begin
                                if (!codeEnReg) begin
                                    i_g1 <= iSoftDelay0;
                                    i_g2 <= ~iSoft;
                                    q_g1 <= qSoftDelay0;
                                    q_g2 <= ~qSoft;
                                end
                            end
                            P90_G1G2_: begin
                                if (codeEnReg) begin
                                    i_g1 <= qSoftDelay1;
                                    i_g2 <= ~qSoftDelay0;
                                    q_g1 <= ~iSoftDelay0;
                                    q_g2 <= iSoft;
                                end
                            end
                            P90_G2_G1: begin
                                if (!codeEnReg) begin
                                    i_g1 <= qSoftDelay1;
                                    i_g2 <= ~qSoftDelay0;
                                    q_g1 <= ~iSoftDelay0;
                                    q_g2 <= iSoft;
                                end
                            end
                            default: begin
                                i_g1 <= iSoftDelay0;
                                i_g2 <= iSoft;
                                q_g1 <= qSoftDelay0;
                                q_g2 <= qSoft;
                            end
                        endcase
                    end
                    `else //OQPSK_LWK
                    if (decoderSource == `DEC_MUX_SEL_VITERBI) begin
                        syncState <= oqpskState;
                        if (outOfSync & codeEnReg) begin
                            case (oqpskState)
                                P0_G1G2:    oqpskState <= P90_G1G2;
                                P90_G1G2:   oqpskState <= P180_G1G2;
                                P180_G1G2:  oqpskState <= P270_G1G2;
                                P270_G1G2:  oqpskState <= P0_G1G2_;
                                P0_G1G2_:   oqpskState <= P90_G1G2_;
                                P90_G1G2_:  oqpskState <= P180_G1G2_;
                                P180_G1G2_: oqpskState <= P270_G1G2_;
                                P270_G1G2_: oqpskState <= P0_G1G2;
                                default:    oqpskState <= P0_G1G2;
                            endcase
                        end
                        case (oqpskState)
                            P0_G1G2: begin
                                i_g1 <= iSoftDelay0;
                                i_g2 <= iSoft;
                                q_g1 <= qSoftDelay0;
                                q_g2 <= qSoft;
                            end
                            P90_G1G2: begin
                                i_g1 <= qSoftDelay1;
                                i_g2 <= qSoftDelay0;
                                q_g1 <= ~iSoftDelay0;
                                q_g2 <= ~iSoft;
                            end
                            P180_G1G2: begin
                                i_g1 <= ~iSoftDelay0;
                                i_g2 <= ~iSoft;
                                q_g1 <= ~qSoftDelay0;
                                q_g2 <= ~qSoft;
                            end
                            P270_G1G2: begin
                                i_g1 <= ~qSoftDelay1;
                                i_g2 <= ~qSoftDelay0;
                                q_g1 <= iSoftDelay0;
                                q_g2 <= iSoft;
                            end
                            P0_G1G2_: begin
                                i_g1 <= iSoftDelay0;
                                i_g2 <= ~iSoft;
                                q_g1 <= qSoftDelay0;
                                q_g2 <= ~qSoft;
                            end
                            P90_G1G2_: begin
                                i_g1 <= qSoftDelay1;
                                i_g2 <= ~qSoftDelay0;
                                q_g1 <= ~iSoftDelay0;
                                q_g2 <= iSoft;
                            end
                            P180_G1G2_: begin
                                i_g1 <= ~iSoftDelay0;
                                i_g2 <= iSoft;
                                q_g1 <= ~qSoftDelay0;
                                q_g2 <= qSoft;
                            end
                            P270_G1G2_: begin
                                i_g1 <= ~qSoftDelay1;
                                i_g2 <=  qSoftDelay0;
                                q_g1 <=  iSoftDelay0;
                                q_g2 <= ~iSoft;
                            end
                            default: begin
                                i_g1 <= iSoftDelay0;
                                i_g2 <= iSoft;
                                q_g1 <= qSoftDelay0;
                                q_g2 <= qSoft;
                            end
                        endcase
                    end
                    `endif //OQPSK_LWK
                    else begin
                        syncState <= oqpskState;
                        if (outOfSync) begin
                            case (oqpskState)
                                P0_G1G2:    oqpskState <= P90_G1G2;
                                P90_G1G2:   oqpskState <= P180_G1G2;
                                P180_G1G2:  oqpskState <= P270_G1G2;
                                P270_G1G2:  oqpskState <= P0_G1G2_;
                                P0_G1G2_:   oqpskState <= P90_G1G2_;
                                P90_G1G2_:  oqpskState <= P180_G1G2_;
                                P180_G1G2_: oqpskState <= P270_G1G2_;
                                P270_G1G2_: oqpskState <= P0_G1G2;
                                default:    oqpskState <= P0_G1G2;
                            endcase
                        end
                        case (oqpskState)
                            P0_G1G2: begin
                                i_g1 <= iSoft;
                                i_g2 <= qSoft;
                            end
                            P90_G1G2: begin
                                i_g1 <= qSoftDelay0;
                                i_g2 <= ~iSoft;
                            end
                            P180_G1G2: begin
                                i_g1 <= ~iSoft;
                                i_g2 <= ~qSoft;
                            end
                            P270_G1G2: begin
                                i_g1 <= ~qSoftDelay0;
                                i_g2 <= iSoft;
                            end
                            P0_G1G2_: begin
                                i_g1 <= iSoft;
                                i_g2 <= ~qSoft;
                            end
                            P90_G1G2_: begin
                                i_g1 <= qSoftDelay0;
                                i_g2 <= iSoft;
                            end
                            P180_G1G2_: begin
                                i_g1 <= ~iSoft;
                                i_g2 <= qSoft;
                            end
                            P270_G1G2_: begin
                                i_g1 <= ~qSoftDelay0;
                                i_g2 <= ~iSoft;
                            end
                            default: begin
                                i_g1 <= iSoft;
                                i_g2 <= qSoft;
                            end
                        endcase
                     end
                 end
                 /*
                 Eight possible states based on 4 phase states and G2 inversion.
                 */
                 `MODE_QPSK: begin
                    syncState <= qpskState;
                    if (outOfSync) begin
                        case (qpskState)
                            P0_G1G2:    qpskState <= P90_G1G2;
                            P90_G1G2:   qpskState <= P180_G1G2;
                            P180_G1G2:  qpskState <= P270_G1G2;
                            P270_G1G2:  qpskState <= P0_G1G2_;
                            P0_G1G2_:   qpskState <= P90_G1G2_;
                            P90_G1G2_:  qpskState <= P180_G1G2_;
                            P180_G1G2_: qpskState <= P270_G1G2_;
                            P270_G1G2_: qpskState <= P0_G1G2;
                            default:    qpskState <= P0_G1G2;
                        endcase
                    end
                    case (qpskState)
                        P0_G1G2: begin
                            i_g1 <= iSoft;
                            i_g2 <= qSoft;
                        end
                        P90_G1G2: begin
                            i_g1 <= qSoft;
                            i_g2 <= ~iSoft;
                        end
                        P180_G1G2: begin
                            i_g1 <= ~iSoft;
                            i_g2 <= ~qSoft;
                        end
                        P270_G1G2: begin
                            i_g1 <= ~qSoft;
                            i_g2 <= iSoft;
                        end
                        P0_G1G2_: begin
                            i_g1 <= iSoft;
                            i_g2 <= ~qSoft;
                        end
                        P90_G1G2_: begin
                            i_g1 <= qSoft;
                            i_g2 <= iSoft;
                        end
                        P180_G1G2_: begin
                            i_g1 <= ~iSoft;
                            i_g2 <= qSoft;
                        end
                        P270_G1G2_: begin
                            i_g1 <= ~qSoft;
                            i_g2 <= ~iSoft;
                        end
                        default: begin
                            i_g1 <= iSoft;
                            i_g2 <= qSoft;
                        end
                    endcase
                 end
                 /*
                 Eight possible states based on whether codeEn is lined up with
                 G1 or G2, whether or not G2 was inverted, and the phase
                 ambiguity of BPSK. This assumes G1 is always transmitted first
                 */
                 `MODE_BPSK: begin
                    syncState <= bpskState;
                    if (outOfSync & codeEnReg) begin
                        case (bpskState)
                            P0_G1G2:    bpskState <= P0_G2G1;
                            P0_G2G1:    bpskState <= P180_G1G2;
                            P180_G1G2:  bpskState <= P180_G2G1;
                            P180_G2G1:  bpskState <= P0_G1G2_;
                            P0_G1G2_:   bpskState <= P0_G2_G1;
                            P0_G2_G1:   bpskState <= P180_G1G2_;
                            P180_G1G2_: bpskState <= P180_G2_G1;
                            P180_G2_G1: bpskState <= P0_G1G2;
                            default:    bpskState <= P0_G1G2;
                        endcase
                    end
                    case (bpskState)
                        P0_G1G2: begin
                            if (codeEnReg) begin
                                i_g1 <= iSoftDelay0;
                                i_g2 <= iSoft;
                            end
                        end
                        P0_G2G1: begin
                            if (!codeEnReg) begin
                                i_g1 <= iSoftDelay0;
                                i_g2 <= iSoft;
                            end
                        end
                        P0_G1G2_: begin
                            if (codeEnReg) begin
                                i_g1 <= iSoftDelay0;
                                i_g2 <= ~iSoft;
                            end
                        end
                        P0_G2_G1: begin
                            if (!codeEnReg) begin
                                i_g1 <= iSoftDelay0;
                                i_g2 <= ~iSoft;
                            end
                        end
                        P180_G1G2: begin
                            if (codeEnReg) begin
                                i_g1 <= ~iSoftDelay0;
                                i_g2 <= ~iSoft;
                            end
                        end
                        P180_G2G1: begin
                            if (!codeEnReg) begin
                                i_g1 <= ~iSoftDelay0;
                                i_g2 <= ~iSoft;
                            end
                        end
                        P180_G1G2_: begin
                            if (codeEnReg) begin
                                i_g1 <= ~iSoftDelay0;
                                i_g2 <= iSoft;
                            end
                        end
                        P180_G2_G1: begin
                            if (!codeEnReg) begin
                                i_g1 <= ~iSoftDelay0;
                                i_g2 <= iSoft;
                            end
                        end
                        default: begin
                            if (codeEnReg) begin
                                i_g1 <= iSoftDelay0;
                                i_g2 <= iSoft;
                            end
                        end
                    endcase
                 end
                 /*
                 FM/PM Modulations:
                 Four possible states based on whether codeEn lines up with G1
                 or G2 and whether or not G2 was inverted. This assumes G1 is
                 always transmitted first.
                 */
                 default: begin
                    syncState <= {1'b0,singleRailState};
                    if (outOfSync) begin
                        case (singleRailState)
                            G1G2: begin
                                singleRailState <= G2G1;
                            end
                            G2G1: begin
                                singleRailState <= G1G2_;
                            end
                            G1G2_: begin
                                singleRailState <= G2_G1;
                            end
                            G2_G1: begin
                                singleRailState <= G1G2;
                            end
                            default: begin
                                singleRailState <= G1G2;
                            end
                        endcase
                    end
                    else begin
                        case (singleRailState)
                            G1G2: begin
                                if (codeEnReg) begin
                                    i_g1 <= iSoft;
                                end
                                else begin
                                    i_g2 <= iSoft;
                                end
                            end
                            G2G1: begin
                                if (codeEnReg) begin
                                    i_g1 <= iSoftDelay0;
                                    i_g2 <= iSoft;
                                end
                            end
                            G1G2_: begin
                                if (codeEnReg) begin
                                    i_g1 <= iSoft;
                                end
                                else begin
                                    i_g2 <= ~iSoft;
                                end
                            end
                            G2_G1: begin
                                if (codeEnReg) begin
                                    i_g1 <= iSoftDelay0;
                                    i_g2 <= ~iSoft;
                                end
                            end
                            default: begin
                                if (codeEnReg) begin
                                    i_g1 <= iSoft;
                                end
                                else begin
                                    i_g2 <= iSoft;
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

    `ifdef HARD_DECISIONS

    wire    [15:0]  berCount;
    xilinxViterbiHardV7p0 xilViterbi(
        .clk(clk),
        .ce(vitEnReg),
        `ifdef SIMULATE
        .sclr(reset | outOfSync | vitReset),
        `else
        .sclr(reset | outOfSync),
        `endif
        .data_in0(i_g1[2]),
        .data_in1(i_g2[2]),
        .rdy(viterbiBitEn),
        .data_out(bitOut),
        .ber_done(berDone),
        .ber(berCount)
    );

    `else //HARD_DECISIONS

    wire    [15:0]  berCountI;
    xilinxViterbiV7p0 vitI(
        .clk(clk),
        .ce(vitEnReg),
        `ifdef SIMULATE
        .sclr(reset | outOfSync | vitReset),
        `else
        .sclr(reset | outOfSync),
        `endif
        .data_in0(i_g1),
        .data_in1(i_g2),
        .rdy(viterbiBitEn),
        .data_out(iBitOut),
        .norm(),
        .ber_done(berDone),
        .ber(berCountI)
    );
    wire    [15:0]  berCountQ;
    xilinxViterbiV7p0 vitQ(
        .clk(clk),
        .ce(vitEnReg),
        `ifdef SIMULATE
        .sclr(reset | outOfSync | vitReset),
        `else
        .sclr(reset | outOfSync),
        `endif
        .data_in0(q_g1),
        .data_in1(q_g2),
        .rdy(qRdy),
        .data_out(qBitOut),
        .norm(),
        .ber_done(),
        .ber(berCountQ)
    );

    `endif //HARD_DECISIONS

    // Output bit enable
    assign bitEnOut = vitEnReg;


    // Sync Detect
    `define USE_BER
    `ifdef USE_BER
    wire            [15:0]  berCount = berCountI + berCountQ;
    reg     signed  [15:0]  sprtAccum;
    `ifdef SIMULATE
    `define SPRT_SYNC_LIMIT     16'd64
    `define SPRT_START_VALUE    16'd32
    `else
    `define SPRT_SYNC_LIMIT     16'd256
    `define SPRT_START_VALUE    16'd128
    `endif
    always @(posedge clk) begin
        if (reset) begin
            outOfSync <= 1'b0;
            inSync <= 1'b0;
            sprtAccum <= `SPRT_START_VALUE;
        end
        else if (clkEn) begin
            if (bitEnOut & viterbiBitEn) begin
                if (berDone) begin
                    // Were there errors?
                    if (berCount != 0) begin
                        // Yes. Has sprt reached zero?
                        if (sprtAccum >= berCount) begin
                            // No. Decrement sprt
                            sprtAccum <= sprtAccum - berCount;
                        end
                        else begin
                            // Yes. Declare out of sync
                            sprtAccum <= `SPRT_START_VALUE;
                            outOfSync <= 1'b1;
                            inSync <= 1'b0;
                        end
                    end
                    else begin
                        // No. Has sprt reached upper limit?
                        if (sprtAccum < (`SPRT_SYNC_LIMIT-8)) begin
                            // No. increment sprt
                            sprtAccum <= sprtAccum + 8;
                        end
                        else begin
                            // Yes. Declare sync
                            sprtAccum <= `SPRT_SYNC_LIMIT;
                            inSync <= 1'b1;
                        end
                    end
                end
                else begin
                    outOfSync <= 1'b0;
                end
            end
            else if (bitEnOut) begin
                outOfSync <= 1'b0;
            end
        end
    end
    `else // USE_BER
    reg             [14:0]  normDiffCount;
    reg             [15:0]  normDiff;
    wire    signed  [15:0]  syncError = ($signed({1'b0,normDiffCount}) - $signed(syncThreshold));
    reg     signed  [15:0]  sprtAccum;
    wire            [16:0]  sprtSum  = {sprtAccum[15],sprtAccum} + {syncError[15],syncError};
    `define SPRT_SYNC_LIMIT     16'd32
    `define SPRT_START_VALUE    16'd16
    always @(posedge clk) begin
        if (reset) begin
            outOfSync <= 1'b0;
            inSync <= 1'b0;
            sprtAccum <= 0;
            normDiffCount <= 0;
        end
        else if (clkEn) begin
            if (bitEnOut) begin
                // Count the bits between NORM outputs
                if (norm) begin
                    normDiff <= normDiffCount + 1;
                    normDiffCount <= 0;
                end
                else if (normDiffCount < 16'h7fff) begin
                    normDiffCount <= normDiffCount + 1;
                end
                // Run a SPRT test
                if (norm) begin
                    // Is sum < 0?
                    if (sprtSum[16] && syncError[15]) begin
                        // Yes, Limit the sum and show we're out of sync
                        sprtAccum <= `SPRT_START_VALUE;
                        outOfSync <= 1'b1;
                        inSync <= 1'b0;
                    end
                    // Is sum > sprt limit?
                    else if (sprtSum > `SPRT_SYNC_LIMIT) begin
                        // Yes. Limit the sum and show we're in sync
                        sprtAccum <= `SPRT_SYNC_LIMIT;
                        inSync <= 1'b1;
                    end
                    else begin
                        sprtAccum <= sprtSum;
                    end
                end
            end
            else if (symEn) begin
                outOfSync <= 1'b0;
            end
        end
    end
    `endif  // USE_BER


    // DAC Output Mux
    always @(posedge clk) begin
        case (dac0Select)
            `DAC_VIT_I: begin
                dac0Output <= iSymData;
                dac0ClkEn <= symEn;
            end
            `DAC_VIT_Q: begin
                dac0Output <= qSymData;
                dac0ClkEn <= symEn;
            end
            `DAC_VIT_ISOFT: begin
                dac0Output <= {i_g1,15'b0};
                dac0ClkEn <= softEnReg;
            end
            `DAC_VIT_QSOFT: begin
                dac0Output <= {q_g1,15'b0};
                dac0ClkEn <= softEnReg;
            end
            `DAC_VIT_IBIT: begin
                dac0Output <= {1'b0,iBitOut,16'b0};
                dac0ClkEn <= bitEnOut;
            end
            `DAC_VIT_QBIT: begin
                dac0Output <= {1'b0,qBitOut,16'b0};
                dac0ClkEn <= bitEnOut;
            end
            default: begin
                dac0Output <= {1'b0,syncState,14'h0};
                dac0ClkEn <= vitEnReg;
            end
        endcase
        case (dac1Select)
            `DAC_VIT_I: begin
                dac1Output <= iSymData;
                dac1ClkEn <= symEn;
            end
            `DAC_VIT_Q: begin
                dac1Output <= qSymData;
                dac1ClkEn <= symEn;
            end
            `DAC_VIT_ISOFT: begin
                dac1Output <= {i_g2,15'b0};
                dac1ClkEn <= softEnReg;
            end
            `DAC_VIT_QSOFT: begin
                dac1Output <= {q_g2,15'b0};
                dac1ClkEn <= softEnReg;
            end
            `DAC_VIT_IBIT: begin
                dac1Output <= {1'b0,iBitOut,16'b0};
                dac1ClkEn <= bitEnOut;
            end
            `DAC_VIT_QBIT: begin
                dac1Output <= {1'b0,qBitOut,16'b0};
                dac1ClkEn <= bitEnOut;
            end
            default: begin
                dac1Output <= {1'b0,sprtAccum[8:0],8'h0};
                dac1ClkEn <= vitEnReg;
            end
        endcase
        case (dac2Select)
            `DAC_VIT_I: begin
                dac2Output <= iSymData;
                dac2ClkEn <= symEn;
            end
            `DAC_VIT_Q: begin
                dac2Output <= qSymData;
                dac2ClkEn <= symEn;
            end
            `DAC_VIT_ISOFT: begin
                dac2Output <= {i_g1,15'b0};
                dac2ClkEn <= softEnReg;
            end
            `DAC_VIT_QSOFT: begin
                dac2Output <= {i_g2,15'b0};
                dac2ClkEn <= softEnReg;
            end
            `DAC_VIT_IBIT: begin
                dac2Output <= {1'b0,iBitOut,16'b0};
                dac2ClkEn <= bitEnOut;
            end
            `DAC_VIT_QBIT: begin
                dac2Output <= {1'b0,qBitOut,16'b0};
                dac2ClkEn <= bitEnOut;
            end
            default: begin
                dac2Output <= {1'b0,berCount[3:0],13'h0};
                dac2ClkEn <= vitEnReg;
            end
        endcase
    end
endmodule

