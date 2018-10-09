/******************************************************************************
Copyright 2008-2016 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc.
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/100ps
module cma(
    input                   clk,
    input                   clkEn,
    input                   reset,
    input                   wtReset,
    input           [2:0]   stepExpo,
    input           [15:0]  refLevel,
    input   signed  [17:0]  iIn,
    input   signed  [17:0]  qIn,
    output                  weightOverflow,
    output  signed  [17:0]  iOut,
    output  signed  [17:0]  qOut
);

parameter pipeDelay = 5;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function signed [17:0]  limitAdd2;
    input signed    [18:0]  in;
    if (in[18] && !in[17]) begin
        limitAdd2 = 18'h20001;
        `ifdef SIMULATE
        $display ("mag or error limited");
        `endif
        end
    else if (!in[18] && in[17]) begin
        limitAdd2 = 18'h1ffff;
        `ifdef SIMULATE
        $display ("mag or error limited");
        `endif
        end
    else limitAdd2 = $signed(in[17:0]);
endfunction


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Input Sample Shift register
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg [17:0]iSR[33:0],qSR[33:0];
always @(posedge clk) begin
    if (reset) begin
        iSR[0] <= 0;  qSR[0] <= 0;  iSR[1] <= 0;  qSR[1] <= 0;
        iSR[2] <= 0;  qSR[2] <= 0;  iSR[3] <= 0;  qSR[3] <= 0;
        iSR[4] <= 0;  qSR[4] <= 0;  iSR[5] <= 0;  qSR[5] <= 0;
        iSR[6] <= 0;  qSR[6] <= 0;  iSR[7] <= 0;  qSR[7] <= 0;
        iSR[8] <= 0;  qSR[8] <= 0;  iSR[9] <= 0;  qSR[9] <= 0;
        iSR[10] <= 0; qSR[10] <= 0; iSR[11] <= 0; qSR[11] <= 0;
        iSR[12] <= 0; qSR[12] <= 0; iSR[13] <= 0; qSR[13] <= 0;
        iSR[14] <= 0; qSR[14] <= 0; iSR[15] <= 0; qSR[15] <= 0;
        iSR[16] <= 0; qSR[16] <= 0; iSR[17] <= 0; qSR[17] <= 0;
        iSR[18] <= 0; qSR[18] <= 0; iSR[19] <= 0; qSR[19] <= 0;
        iSR[20] <= 0; qSR[20] <= 0; iSR[21] <= 0; qSR[21] <= 0;
        iSR[22] <= 0; qSR[22] <= 0; iSR[23] <= 0; qSR[23] <= 0;
        iSR[24] <= 0; qSR[24] <= 0; iSR[25] <= 0; qSR[25] <= 0;
        iSR[26] <= 0; qSR[26] <= 0; iSR[27] <= 0; qSR[27] <= 0;
        iSR[28] <= 0; qSR[28] <= 0; iSR[29] <= 0; qSR[29] <= 0;
        iSR[30] <= 0; qSR[30] <= 0; iSR[31] <= 0; qSR[31] <= 0;
        iSR[32] <= 0; qSR[32] <= 0; iSR[33] <= 0; qSR[33] <= 0;
        end
    else if (clkEn) begin
        iSR[0] <= iIn;  qSR[0] <= qIn;
        iSR[1] <= iSR[0];   qSR[1] <= qSR[0];   iSR[2] <= iSR[1];   qSR[2] <= qSR[1];
        iSR[3] <= iSR[2];   qSR[3] <= qSR[2];   iSR[4] <= iSR[3];   qSR[4] <= qSR[3];
        iSR[5] <= iSR[4];   qSR[5] <= qSR[4];   iSR[6] <= iSR[5];   qSR[6] <= qSR[5];
        iSR[7] <= iSR[6];   qSR[7] <= qSR[6];   iSR[8] <= iSR[7];   qSR[8] <= qSR[7];
        iSR[9] <= iSR[8];   qSR[9] <= qSR[8];   iSR[10] <= iSR[9];  qSR[10] <= qSR[9];
        iSR[11] <= iSR[10]; qSR[11] <= qSR[10]; iSR[12] <= iSR[11]; qSR[12] <= qSR[11];
        iSR[13] <= iSR[12]; qSR[13] <= qSR[12]; iSR[14] <= iSR[13]; qSR[14] <= qSR[13];
        iSR[15] <= iSR[14]; qSR[15] <= qSR[14]; iSR[16] <= iSR[15]; qSR[16] <= qSR[15];
        iSR[17] <= iSR[16]; qSR[17] <= qSR[16]; iSR[18] <= iSR[17]; qSR[18] <= qSR[17];
        iSR[19] <= iSR[18]; qSR[19] <= qSR[18]; iSR[20] <= iSR[19]; qSR[20] <= qSR[19];
        iSR[21] <= iSR[20]; qSR[21] <= qSR[20]; iSR[22] <= iSR[21]; qSR[22] <= qSR[21];
        iSR[23] <= iSR[22]; qSR[23] <= qSR[22]; iSR[24] <= iSR[23]; qSR[24] <= qSR[23];
        iSR[25] <= iSR[24]; qSR[25] <= qSR[24]; iSR[26] <= iSR[25]; qSR[26] <= qSR[25];
        iSR[27] <= iSR[26]; qSR[27] <= qSR[26]; iSR[28] <= iSR[27]; qSR[28] <= qSR[27];
        iSR[29] <= iSR[28]; qSR[29] <= qSR[28]; iSR[30] <= iSR[29]; qSR[30] <= qSR[29];
        iSR[31] <= iSR[30]; qSR[31] <= qSR[30]; iSR[32] <= iSR[31]; qSR[32] <= qSR[31];
                iSR[33] <= iSR[32]; qSR[33] <= qSR[32];
        end
    end
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Taps
// One pipeline delay
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire        [15 : 0]    wtOvf;
reg signed  [17 : 0]    iError,qError;
wire signed [17 : 0]    iTap0,iTap1,iTap2,iTap3,iTap4,iTap5,iTap6,iTap7,iTap8,iTap9,iTap10,iTap11,iTap12,iTap13,iTap14,iTap15,iTap16,iTap17,iTap18,iTap19,iTap20,iTap21,iTap22,iTap23,iTap24,iTap25,iTap26,iTap27,iTap28,iTap29;
wire signed [17 : 0]    qTap0,qTap1,qTap2,qTap3,qTap4,qTap5,qTap6,qTap7,qTap8,qTap9,qTap10,qTap11,qTap12,qTap13,qTap14,qTap15,qTap16,qTap17,qTap18,qTap19,qTap20,qTap21,qTap22,qTap23,qTap24,qTap25,qTap26,qTap27,qTap28,qTap29;

reg [2:0]updateCount;
always @(posedge clk) begin
    if (reset) begin
        updateCount <= pipeDelay;
        end
    else if (clkEn) begin
        if (updateCount == 3'h0) begin
            updateCount <= pipeDelay;
            end
        else begin
            updateCount <= updateCount - 3'h1;
            end
        end
    end

reg wtUpdate;
always @ (posedge clk) begin
          if (reset) wtUpdate <= 0;
          else if (clkEn) begin
        wtUpdate <= updateCount == 3'b0;
        end
    end

cmaTap #(18'h00000) tap0(.iIn(iSR[0]),   .qIn(qSR[0]),  .iInDelay(iSR[0+pipeDelay]),  .qInDelay(qSR[0+pipeDelay]),  .iOut(iTap0),  .qOut(qTap0),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[0]));
cmaTap #(18'h00000) tap1(.iIn(iSR[1]),   .qIn(qSR[1]),  .iInDelay(iSR[1+pipeDelay]),  .qInDelay(qSR[1+pipeDelay]),  .iOut(iTap1),  .qOut(qTap1),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[1]));
cmaTap #(18'h00000) tap2(.iIn(iSR[2]),   .qIn(qSR[2]),  .iInDelay(iSR[2+pipeDelay]),  .qInDelay(qSR[2+pipeDelay]),  .iOut(iTap2),  .qOut(qTap2),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[2]));
cmaTap #(18'h00000) tap3(.iIn(iSR[3]),   .qIn(qSR[3]),  .iInDelay(iSR[3+pipeDelay]),  .qInDelay(qSR[3+pipeDelay]),  .iOut(iTap3),  .qOut(qTap3),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[3]));
cmaTap #(18'h00000) tap4(.iIn(iSR[4]),   .qIn(qSR[4]),  .iInDelay(iSR[4+pipeDelay]),  .qInDelay(qSR[4+pipeDelay]),  .iOut(iTap4),  .qOut(qTap4),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[4]));
cmaTap #(18'h00000) tap5(.iIn(iSR[5]),   .qIn(qSR[5]),  .iInDelay(iSR[5+pipeDelay]),  .qInDelay(qSR[5+pipeDelay]),  .iOut(iTap5),  .qOut(qTap5),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[5]));
cmaTap #(18'h00000) tap6(.iIn(iSR[6]),   .qIn(qSR[6]),  .iInDelay(iSR[6+pipeDelay]),  .qInDelay(qSR[6+pipeDelay]),  .iOut(iTap6),  .qOut(qTap6),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[6]));
cmaTap #(18'h1ffff) tap7(.iIn(iSR[7]),   .qIn(qSR[7]),  .iInDelay(iSR[7+pipeDelay]),  .qInDelay(qSR[7+pipeDelay]),  .iOut(iTap7),  .qOut(qTap7),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[7]));
cmaTap #(18'h00000) tap8(.iIn(iSR[8]),   .qIn(qSR[8]),  .iInDelay(iSR[8+pipeDelay]),  .qInDelay(qSR[8+pipeDelay]),  .iOut(iTap8),  .qOut(qTap8),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[8]));
cmaTap #(18'h00000) tap9(.iIn(iSR[9]),   .qIn(qSR[9]),  .iInDelay(iSR[9+pipeDelay]),  .qInDelay(qSR[9+pipeDelay]),  .iOut(iTap9),  .qOut(qTap9),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[9]));
cmaTap #(18'h00000) tap10(.iIn(iSR[10]), .qIn(qSR[10]), .iInDelay(iSR[10+pipeDelay]), .qInDelay(qSR[10+pipeDelay]), .iOut(iTap10), .qOut(qTap10), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[10]));
cmaTap #(18'h00000) tap11(.iIn(iSR[11]), .qIn(qSR[11]), .iInDelay(iSR[11+pipeDelay]), .qInDelay(qSR[11+pipeDelay]), .iOut(iTap11), .qOut(qTap11), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[11]));
cmaTap #(18'h00000) tap12(.iIn(iSR[12]), .qIn(qSR[12]), .iInDelay(iSR[12+pipeDelay]), .qInDelay(qSR[12+pipeDelay]), .iOut(iTap12), .qOut(qTap12), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[12]));
cmaTap #(18'h00000) tap13(.iIn(iSR[13]), .qIn(qSR[13]), .iInDelay(iSR[13+pipeDelay]), .qInDelay(qSR[13+pipeDelay]), .iOut(iTap13), .qOut(qTap13), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[13]));
cmaTap #(18'h00000) tap14(.iIn(iSR[14]), .qIn(qSR[14]), .iInDelay(iSR[14+pipeDelay]), .qInDelay(qSR[14+pipeDelay]), .iOut(iTap14), .qOut(qTap14), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[14]));
cmaTap #(18'h00000) tap15(.iIn(iSR[15]), .qIn(qSR[15]), .iInDelay(iSR[15+pipeDelay]), .qInDelay(qSR[15+pipeDelay]), .iOut(iTap15), .qOut(qTap15), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[15]));

assign weightOverflow = wtOvf[ 0] | wtOvf[ 1] | wtOvf[ 2] | wtOvf[ 3]
                      | wtOvf[ 4] | wtOvf[ 5] | wtOvf[ 6] | wtOvf[ 7]
                      | wtOvf[ 8] | wtOvf[ 9] | wtOvf[10] | wtOvf[11]
                      //| wtOvf[12] | wtOvf[13] | wtOvf[14] | wtOvf[15];
                      | wtOvf[12] | wtOvf[13] | wtOvf[14];

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire    signed  [17:0] iSum;
cmaSum iTapSum (
    .CK(clk),
    .EN(clkEn),
    .RS(reset),
    .t0(iTap0),.t1(iTap1),.t2(iTap2),.t3(iTap3),
    .t4(iTap4),.t5(iTap5),.t6(iTap6),.t7(iTap7),
    .t8(iTap8),.t9(iTap9),.t10(iTap10),.t11(iTap11),
    //.t12(iTap12),.t13(iTap13),.t14(iTap14),.t15(iTap15),
    .t12(iTap12),.t13(iTap13),.t14(iTap14),.t15(18'h0),
    .S(),.qS(iSum)
);

wire    signed  [17:0] qSum;
cmaSum qTapSum (
    .CK(clk),
    .EN(clkEn),
    .RS(reset),
    .t0(qTap0),.t1(qTap1),.t2(qTap2),.t3(qTap3),
    .t4(qTap4),.t5(qTap5),.t6(qTap6),.t7(qTap7),
    .t8(qTap8),.t9(qTap9),.t10(qTap10),.t11(qTap11),
    //.t12(qTap12),.t13(qTap13),.t14(qTap14),.t15(qTap15),
    .t12(qTap12),.t13(qTap13),.t14(qTap14),.t15(18'h0),
    .S(),.qS(qSum)
);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Magnitude
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire signed [35:0]  iSumSqr = $signed(iSum) * $signed(iSum);
wire signed [35:0]  qSumSqr = $signed(qSum) * $signed(qSum);
wire signed [17:0]  mag = limitAdd2(iSumSqr[34:16] + qSumSqr[34:16]);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Error
// One pipeline delay
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire signed [17:0] diff = limitAdd2($signed({2'b0,refLevel[15:0],1'b0}) - $signed({1'b0,mag}));

reg [17:0] diff_reg,iSum_reg,qSum_reg;
always @ (posedge clk) begin
    if (reset) begin
        diff_reg <= 18'h0;
        iSum_reg <= 18'h0;
        qSum_reg <= 18'h0;
        end
    else if (clkEn) begin
        diff_reg <= diff;
        iSum_reg <= iSum;
        qSum_reg <= qSum;
        end
    end
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// XST is processing these next two lines in a way that produces registered
// outputs and necessitating the ucf file entry
// TIMEGRP "cmaGrp_6" = FFS(demod/cma/Mmult_iErrMult* ) FFS(demod/cma/Mmult_qErrMult*);
// Also, the diff, isum and qsum reg names above are not being preserved so
// these may be absorbed into the Mmult as well.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire signed [35:0]iErrMult = $signed(iSum_reg) * $signed(diff_reg);
wire signed [35:0]qErrMult = $signed(qSum_reg) * $signed(diff_reg);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Scaling
// stepExpo is treated as signed 2's complement
// One pipeline delay
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg [17:0]iErrStep,qErrStep;
reg iSign,qSign;
always @* begin
    iSign = iErrMult[34];
    qSign = qErrMult[34];
    case (stepExpo)
        3'b011: begin // 8.0
            casex ({iSign,iErrMult[34:31]})
                5'b11111,
                5'b00000: iErrStep = {iSign,iErrMult[30:14]};
                default:    if (iSign) begin
                                iErrStep = 18'h20001;
                            end
                            else begin
                                iErrStep = 18'h1ffff;
                            end

            endcase
            casex ({qSign,qErrMult[34:31]})
                5'b11111,
                5'b00000: qErrStep = {qSign,qErrMult[30:14]};
                default:    if (qSign) begin
                                qErrStep = 18'h20001;
                            end
                            else begin
                                qErrStep = 18'h1ffff;
                            end

            endcase
            end
        3'b010: begin // 4.0
            casex ({iSign,iErrMult[34:32]})
                4'b1111,
                4'b0000: iErrStep = {iSign,iErrMult[31:15]};
                default:    if (iSign) begin
                                iErrStep = 18'h20001;
                            end
                            else begin
                                iErrStep = 18'h1ffff;
                            end

            endcase
            casex ({qSign,qErrMult[34:32]})
                4'b1111,
                4'b0000: qErrStep = {qSign,qErrMult[31:15]};
                default:    if (qSign) begin
                                qErrStep = 18'h20001;
                            end
                            else begin
                                qErrStep = 18'h1ffff;
                            end

            endcase
            end
        3'b001: begin // 2.0
            casex ({iSign,iErrMult[34:33]})
                3'b111,
                3'b000: iErrStep = {iSign,iErrMult[32:16]};
                default:    if (iSign) begin
                                iErrStep = 18'h20001;
                            end
                            else begin
                                iErrStep = 18'h1ffff;
                            end

            endcase
            casex ({qSign,qErrMult[34:33]})
                3'b111,
                3'b000: qErrStep = {qSign,qErrMult[32:16]};
                default:    if (qSign) begin
                                qErrStep = 18'h20001;
                            end
                            else begin
                                qErrStep = 18'h1ffff;
                            end

            endcase
            end
        3'b000: begin // 1.0
            casex ({iSign,iErrMult[34]})
                2'b11,
                2'b00: iErrStep = {iSign,iErrMult[33:17]};
                default:    if (iSign) begin
                                iErrStep = 18'h20001;
                            end
                            else begin
                                iErrStep = 18'h1ffff;
                            end

            endcase
            casex ({qSign,qErrMult[34]})
                2'b11,
                2'b00: qErrStep = {qSign,qErrMult[33:17]};
                default:    if (qSign) begin
                                qErrStep = 18'h20001;
                            end
                            else begin
                                qErrStep = 18'h1ffff;
                            end

            endcase
                end
        3'b111: begin // 0.5
            iErrStep = {{1{iSign}},iErrMult[34:18]};
            qErrStep = {{1{qSign}},qErrMult[34:18]};
            end
        3'b110: begin // 0.25
            iErrStep = {{2{iSign}},iErrMult[34:19]};
            qErrStep = {{2{qSign}},qErrMult[34:19]};
            end
        3'b101: begin // 0.125
            iErrStep = {{3{iSign}},iErrMult[34:20]};
            qErrStep = {{3{qSign}},qErrMult[34:20]};
            end
        3'b100: begin // 0.0625
            iErrStep = {{4{iSign}},iErrMult[34:21]};
            qErrStep = {{4{qSign}},qErrMult[34:21]};
            end
            endcase
    end

always @(posedge clk) begin
    if (reset) begin
        iError <= 18'h0;
        qError <= 18'h0;
        end
    else if (clkEn) begin
        iError <= iErrStep;
        qError <= qErrStep;
        end
    end

assign  iOut = iSum;
assign  qOut = qSum;

`ifdef SIMULATE
real iCmaReal,qCmaReal;
always @* iCmaReal = $itor(iOut)/(2**17);
always @* qCmaReal = $itor(qOut)/(2**17);
`endif

endmodule


`ifdef TEST_CMA_MODULE

module test;

    reg reset,clk;

    // Create the clocks
    parameter decimation = 10;
    parameter HC = 5;
    parameter C = 2*HC;
    reg clken;
    always #HC clk = clk^clken;

    reg clkEn;
    reg [7:0]clkEnCount;
    always @(posedge clk) begin
        if (clkEnCount == 0) begin
            clkEnCount <= decimation-1;
            clkEn <= 1;
        end
        else begin
            clkEnCount <= clkEnCount - 1;
            clkEn <= 0;
        end
    end

    // Create an impulse to drive the filter with
    integer bitCount;
    reg     signed  [17:0]  iIn;
    wire    signed  [17:0]  qIn = 18'h38000;
    always @(posedge clk) begin
        if (clkEn) begin
            if (bitCount == 5) begin
                bitCount <= 0;
            end
            else begin
                bitCount <= bitCount + 1;
            end
            if (bitCount == 0) begin
                iIn <= 18'h10000;
            end
            else begin
                iIn <= 18'h0;
            end
        end
    end

reg     signed  [2:0]   stepSize;
cma cma(
    .clk(clk),
    .clkEn(clkEn),
    .reset(reset),
    .wtReset(wtReset),
    .stepExpo(stepSize),
    .refLevel(16'h8000),
    .iIn(iIn),
    .qIn(qIn),
    .iOut(),
    .qOut()
);

initial begin
    reset = 0;
    clkEn = 1;
    clkEnCount = 0;
    clk = 0;
    bitCount = 0;
    stepSize = 0;

    // Turn on the clock
    clken=1;
    #(10*C) ;

    reset = 1;
    #(2*C) ;
    reset = 0;

    #(256*C*decimation) ;

    $stop;

    end

endmodule


`endif
