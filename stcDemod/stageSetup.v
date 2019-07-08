`include "stcDefines.vh"
`timescale 1ns/100ps
/*
*******************************************************************************
stageSetup
*******************************************************************************
    Inputs:
        clk - system clock.
        reset - synchronous clear
        clkEn - clock enable used for all inputs
        start - indicates the start of a new frame. This is used to indicate
            a new set of input samples and parameter estimates are available for
            processing
        positiveTau - boolean flag indicating the delta tau estimate was positive
        tauIndex - 5-bit unsigned integer indicating 1/32 fractions of a bit
            interval.
        h0EstReal,h0EstIMag - complex valued input representing the estimate of
            the channel 0 gain. Encoded as a signed 18 bit, Q17 fractional number pair.
            There is a new estimate available with each startFrame.
        h1EstReal,h1EstIMag - complex valued input representing the estimate of
            the channel 1 gain. Encoded as a signed 18 bit, Q17 fractional number pair.
            There is a new estimate available with each startFrame.
    Outputs:
        stageSetupComplete - boolean flag indicating the setup is complete
        stageOutputValid - boolean flag that indicates a new setup value is valid
            on the ref outputs
        refReal, refImag - complex valued output representing a single stage setup
            value. Encoded as a signed 18 bit, Q2.16 fractional number pair. There
            is a new output on each clk edge when stageOutputValid is true.


    Notes:
        1) This module is parameterized by STAGE which has valid values of 0 to 7
            corresponding to the 8 possible stages.
*/
module stageSetup (
    input                   clk,
    input                   reset,
    input                   clkEn,
    input                   start,
    input                   positiveTau,
    input           [4:0]   tauIndex,
    input   signed  [17:0]  h0EstReal, h0EstImag, h1EstReal, h1EstImag,
    output  reg             stageSetupComplete,
    output                  stageOutputValid,
    output  signed  [17:0]  refReal,refImag
);
    parameter   STAGE = 0;

    function [9:0]  samp0_romAddr(
        input   [2:0]       stage,
        input               positiveTau,
        input   [4:0]       tauIndex,
        input   [5:0]       revTauIndex,
        input   [6:0]       inputBits
    );
    begin:f0

        reg     [3:0]       msbs;
        reg     [5:0]       lsbs;
        if (positiveTau) begin
            case (stage)
                0:      msbs = { inputBits[3], inputBits[2],~inputBits[1], inputBits[0]};
                1:      msbs = { inputBits[2],~inputBits[1], inputBits[0],         1'b0};
                2:      msbs = { inputBits[3],~inputBits[2], inputBits[1], inputBits[0]};
                3:      msbs = {~inputBits[3], inputBits[2], inputBits[1],         1'b0};
                4:      msbs = {~inputBits[4], inputBits[3], inputBits[2], inputBits[1]};
                5:      msbs = { inputBits[4], inputBits[3], inputBits[2],~inputBits[1]};
                6:      msbs = { inputBits[4], inputBits[3], inputBits[2],~inputBits[1]};
                7:      msbs = { inputBits[3], inputBits[2],~inputBits[1], inputBits[0]};
                default:msbs = 4'b0;
            endcase
            case (stage)
                0:      lsbs = {1'b0,tauIndex};
                1:      lsbs = 6'h0;
                2:      lsbs = {1'b0,tauIndex};
                3:      lsbs = 6'h0;
                4:      lsbs = {1'b0,tauIndex};
                5:      lsbs = 6'h0;
                6:      lsbs = {1'b0,tauIndex};
                7:      lsbs = 6'h0;
                default:lsbs = 6'h0;
            endcase
            // 33*msbs + lsbs
            samp0_romAddr = {1'b0,msbs,5'b0} + {6'b0,msbs} + {4'b0,lsbs};
        end
        else begin
            case (stage)
                0:      msbs = { inputBits[3], inputBits[2],~inputBits[1], inputBits[0]};
                1:      msbs = { inputBits[3], inputBits[2],~inputBits[1], inputBits[0]};
                2:      msbs = { inputBits[3],~inputBits[2], inputBits[1],         1'b0};
                3:      msbs = { inputBits[4],~inputBits[3], inputBits[2], inputBits[1]};
                4:      msbs = {~inputBits[4], inputBits[3], inputBits[2],         1'b0};
                5:      msbs = {~inputBits[5], inputBits[4], inputBits[3], inputBits[2]};
                6:      msbs = { inputBits[4], inputBits[3], inputBits[2],~inputBits[1]};
                7:      msbs = { inputBits[4], inputBits[3], inputBits[2],~inputBits[1]};
                default:msbs = 4'b0;
            endcase
            case (stage)
                0:      lsbs = 6'h0;
                1:      lsbs = revTauIndex;
                2:      lsbs = 6'h0;
                3:      lsbs = revTauIndex;
                4:      lsbs = 6'h0;
                5:      lsbs = revTauIndex;
                6:      lsbs = 6'h0;
                7:      lsbs = revTauIndex;
                default:lsbs = 6'h0;
            endcase
            // 33*msbs + lsbs
            samp0_romAddr = {1'b0,msbs,5'b0} + {6'b0,msbs} + {4'b0,lsbs};
        end
    end
    endfunction

    function [9:0]  samp1_romAddr(
        input   [2:0]       stage,
        input               positiveTau,
        input   [4:0]       tauIndex,
        input   [5:0]       revTauIndex,
        input   [6:0]       inputBits
    );
    begin:f1

        reg     [3:0]       msbs;
        reg     [5:0]       lsbs;
        if (positiveTau) begin
            case (stage)
                0:      msbs = { inputBits[1], inputBits[0], inputBits[3],~inputBits[2]};
                1:      msbs = { inputBits[1], inputBits[0], inputBits[3],~inputBits[2]};
                2:      msbs = { inputBits[1], inputBits[4],~inputBits[3],         1'b0};
                3:      msbs = { inputBits[2], inputBits[5],~inputBits[4], inputBits[0]};
                4:      msbs = { inputBits[6],~inputBits[5], inputBits[0],         1'b0};
                5:      msbs = { inputBits[6],~inputBits[5], inputBits[1], inputBits[0]};
                6:      msbs = {~inputBits[5], inputBits[1], inputBits[0], inputBits[3]};
                7:      msbs = {~inputBits[4], inputBits[1], inputBits[0], inputBits[3]};
                default:msbs = 4'b0;
            endcase
            case (stage)
                0:      lsbs = 6'h0;
                1:      lsbs = revTauIndex;
                2:      lsbs = 6'h0;
                3:      lsbs = revTauIndex;
                4:      lsbs = 6'h0;
                5:      lsbs = revTauIndex;
                6:      lsbs = 6'h0;
                7:      lsbs = revTauIndex;
                default:lsbs = 6'h0;
            endcase
            // 33*msbs + lsbs
            samp1_romAddr = {1'b0,msbs,5'b0} + {6'b0,msbs} + {4'b0,lsbs};
        end
        else begin
            case (stage)
                0:      msbs = { inputBits[1], inputBits[0], inputBits[3],~inputBits[2]};
                1:      msbs = { inputBits[0], inputBits[3],~inputBits[2],         1'b0};
                2:      msbs = { inputBits[1], inputBits[4],~inputBits[3], inputBits[0]};
                3:      msbs = { inputBits[5],~inputBits[4], inputBits[0],         1'b0};
                4:      msbs = { inputBits[6],~inputBits[5], inputBits[1], inputBits[0]};
                5:      msbs = {~inputBits[6], inputBits[1], inputBits[0], inputBits[3]};
                6:      msbs = {~inputBits[5], inputBits[1], inputBits[0], inputBits[3]};
                7:      msbs = { inputBits[1], inputBits[0], inputBits[3], inputBits[2]};
                default:msbs = 4'b0;
            endcase
            case (stage)
                0:      lsbs = {1'b0,tauIndex};
                1:      lsbs = 6'h0;
                2:      lsbs = {1'b0,tauIndex};
                3:      lsbs = 6'h0;
                4:      lsbs = {1'b0,tauIndex};
                5:      lsbs = 6'h0;
                6:      lsbs = {1'b0,tauIndex};
                7:      lsbs = 6'h0;
                default:lsbs = 6'h0;
            endcase
            // 33*msbs + lsbs
            samp1_romAddr = {1'b0,msbs,5'b0} + {6'b0,msbs} + {4'b0,lsbs};
        end
    end
    endfunction


    // Create the address MSBs for the y8 LUTs
    wire    [7:0]   numIterations;
    reg     [6:0]   iterCounter;
    wire    [5:0]   revTauIndex = (6'h20 - {1'b0,tauIndex});
    wire    [9:0]   samp0Addr = samp0_romAddr(STAGE,positiveTau,tauIndex,revTauIndex,iterCounter);
    wire    [9:0]   samp1Addr = samp1_romAddr(STAGE,positiveTau,tauIndex,revTauIndex,iterCounter);
    reg             romAddrValid,romDataValid;
    always @(posedge clk) begin
        if (start && clkEn) begin
            iterCounter <= 0;
            romAddrValid <= 1;
            stageSetupComplete <= 0;
        end
        else if (iterCounter < numIterations-1) begin
            iterCounter <= iterCounter + 1;
        end
        else begin
            romAddrValid <= 0;
            stageSetupComplete <= 1;
        end
        romDataValid <= romAddrValid;
    end

    // Instantiate the y8 lookup tables based on the stage
    wire    signed  [17:0]  samp0Real,samp0Imag;
    wire    signed  [17:0]  samp1Real,samp1Imag;
    generate
        case (STAGE)
            0:  begin
                assign                  numIterations = 16;
                y8_IImag_QReal real_real_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0Real),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1Real)
                );
                y8_IReal_QImag imag_imag_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0Imag),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1Imag)
                );
            end
            1:  begin
                assign                  numIterations = 16;
                wire    signed  [17:0]  samp0PosReal,samp0PosImag;
                wire    signed  [17:0]  samp1PosReal,samp1PosImag;
                y8_IReal_QImag pos_real_imag_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0PosReal),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1PosImag)
                );
                y8_IImag_QReal pos_imag_real_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0PosImag),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1PosReal)
                );
                wire    signed  [17:0]  samp0NegReal,samp0NegImag;
                wire    signed  [17:0]  samp1NegReal,samp1NegImag;
                y8_IReal_QImag neg_imag_real_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0NegImag),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1NegReal)
                );
                y8_IImag_QReal neg_real_imag_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0NegReal),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1NegImag)
                );
                assign samp0Real = positiveTau ? samp0PosReal : samp0NegReal;
                assign samp0Imag = positiveTau ? samp0PosImag : samp0NegImag;
                assign samp1Real = positiveTau ? samp1PosReal : samp1NegReal;
                assign samp1Imag = positiveTau ? samp1PosImag : samp1NegImag;
            end
            2:  begin
                assign                  numIterations = 32;
                y8_IReal_QImag real_real_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0Real),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1Real)
                );
                y8_IImag_QReal imag_imag_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0Imag),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1Imag)
                );
            end
            3:  begin
                assign                  numIterations = 64;
                wire    signed  [17:0]  samp0PosReal,samp0PosImag;
                wire    signed  [17:0]  samp1PosReal,samp1PosImag;
                y8_IImag_QReal pos_real_imag_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0PosReal),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1PosImag)
                );
                y8_IReal_QImag pos_imag_real_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0PosImag),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1PosReal)
                );
                wire    signed  [17:0]  samp0NegReal,samp0NegImag;
                wire    signed  [17:0]  samp1NegReal,samp1NegImag;
                y8_IImag_QReal neg_imag_real_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0NegImag),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1NegReal)
                );
                y8_IReal_QImag neg_real_imag_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0NegReal),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1NegImag)
                );
                assign samp0Real = positiveTau ? samp0PosReal : samp0NegReal;
                assign samp0Imag = positiveTau ? samp0PosImag : samp0NegImag;
                assign samp1Real = positiveTau ? samp1PosReal : samp1NegReal;
                assign samp1Imag = positiveTau ? samp1PosImag : samp1NegImag;
            end
            4:  begin
                assign                  numIterations = 128;
                y8_IImag_QReal real_real_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0Real),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1Real)
                );
                y8_IReal_QImag imag_imag_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0Imag),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1Imag)
                );
            end
            5:  begin
                assign                  numIterations = 128;
                wire    signed  [17:0]  samp0PosReal,samp0PosImag;
                wire    signed  [17:0]  samp1PosReal,samp1PosImag;
                y8_IReal_QImag pos_real_imag_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0PosReal),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1PosImag)
                );
                y8_IImag_QReal pos_imag_real_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0PosImag),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1PosReal)
                );
                wire    signed  [17:0]  samp0NegReal,samp0NegImag;
                wire    signed  [17:0]  samp1NegReal,samp1NegImag;
                y8_IReal_QImag neg_imag_real_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0NegImag),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1NegReal)
                );
                y8_IImag_QReal neg_real_imag_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0NegReal),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1NegImag)
                );
                assign samp0Real = positiveTau ? samp0PosReal : samp0NegReal;
                assign samp0Imag = positiveTau ? samp0PosImag : samp0NegImag;
                assign samp1Real = positiveTau ? samp1PosReal : samp1NegReal;
                assign samp1Imag = positiveTau ? samp1PosImag : samp1NegImag;
            end
            6:  begin
                assign                  numIterations = 64;
                y8_IReal_QImag real_real_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0Real),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1Real)
                );
                y8_IImag_QReal imag_imag_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0Imag),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1Imag)
                );
            end
            7:  begin
                assign                  numIterations = 32;
                wire    signed  [17:0]  samp0PosReal,samp0PosImag;
                wire    signed  [17:0]  samp1PosReal,samp1PosImag;
                y8_IImag_QReal pos_real_imag_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0PosReal),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1PosImag)
                );
                y8_IReal_QImag pos_imag_real_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0PosImag),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1PosReal)
                );
                wire    signed  [17:0]  samp0NegReal,samp0NegImag;
                wire    signed  [17:0]  samp1NegReal,samp1NegImag;
                y8_IImag_QReal neg_imag_real_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0NegImag),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1NegReal)
                );
                y8_IReal_QImag neg_real_imag_LUT(
                    .clka(clk),
                    .ena(1'b1),
                    .addra(samp0Addr),
                    .douta(samp0NegReal),
                    .clkb(clk),
                    .enb(1'b1),
                    .addrb(samp1Addr),
                    .doutb(samp1NegImag)
                );
                assign samp0Real = positiveTau ? samp0PosReal : samp0NegReal;
                assign samp0Imag = positiveTau ? samp0PosImag : samp0NegImag;
                assign samp1Real = positiveTau ? samp1PosReal : samp1NegReal;
                assign samp1Imag = positiveTau ? samp1PosImag : samp1NegImag;
            end
        endcase
    endgenerate

    // The equation we're implementing is (s0 * h0) + (s1 * h1), where the sig's
    // and h's are complex. Here goes...

    // Calculate the final output
    wire    signed  [36:0]  temp0Real,temp0Imag;
    wire            [2:0]   waste00,waste01;
    wire                    temp0Valid;
    cmpy18x18 cmpy0(
        .aclk(clk),
        .s_axis_a_tvalid(romDataValid),
        .s_axis_a_tdata({6'bx,samp0Imag,6'bx,samp0Real}),
        .s_axis_b_tvalid(romDataValid),
        .s_axis_b_tdata({6'bx,h0EstImag,6'bx,h0EstReal}),
        .m_axis_dout_tvalid(temp0Valid),
        .m_axis_dout_tdata({waste01,temp0Imag,waste00,temp0Real})
    );
    wire    signed  [36:0]  temp1Real,temp1Imag;
    wire            [2:0]   waste10,waste11;
    wire                    temp1Valid;
    cmpy18x18 cmpy1(
        .aclk(clk),
        .s_axis_a_tvalid(romDataValid),
        .s_axis_a_tdata({6'bx,samp1Imag,6'bx,samp1Real}),
        .s_axis_b_tvalid(romDataValid),
        .s_axis_b_tdata({6'bx,h1EstImag,6'bx,h1EstReal}),
        .m_axis_dout_tvalid(temp1Valid),
        .m_axis_dout_tdata({waste11,temp1Imag,waste10,temp1Real})
    );
    reg     signed  [37:0]  sumReal,sumImag;
    reg                     sumValid;
    reg     signed  [17:0]  satSumReal,satSumImag;
    reg                     refValid;
    always @(posedge clk) begin
        // Complex sum
        sumReal <= temp0Real + temp1Real;
        sumImag <= temp0Imag + temp1Imag;
        sumValid <= temp0Valid;
        // Test for saturation
        if (sumReal[37] && (sumReal[36:34] != 3'b111)) begin
            satSumReal <= 18'h20001;
        end
        else if (!sumReal[37] && (sumReal[36:34] != 3'b000)) begin
            satSumReal <= 18'h1ffff;
        end
        else begin
            satSumReal <= sumReal[34:17];
        end
        if (sumImag[37] && (sumImag[36:34] != 3'b111)) begin
            satSumImag <= 18'h20001;
        end
        else if (!sumImag[37] && (sumImag[36:34] != 3'b000)) begin
            satSumImag <= 18'h1ffff;
        end
        else begin
            satSumImag <= sumImag[34:17];
        end
        refValid <= sumValid;
    end
    assign stageOutputValid = refValid;
    assign refReal = satSumReal;
    assign refImag = satSumImag;

endmodule
