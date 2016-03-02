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
    output  signed  [17:0]  iOut,       
    output  signed  [17:0]  qOut
); 

`define NUM_TAPS_16

parameter pipeDelay = 5;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function [17:0]limitAdd2;
    input [18:0]in;
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
    else limitAdd2 = in[17:0];
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

tap #(18'h00000) tap0(.iIn(iSR[0]),   .qIn(qSR[0]),  .iInDelay(iSR[0+pipeDelay]),  .qInDelay(qSR[0+pipeDelay]),  .iOut(iTap0),  .qOut(qTap0),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[0]));
tap #(18'h00000) tap1(.iIn(iSR[1]),   .qIn(qSR[1]),  .iInDelay(iSR[1+pipeDelay]),  .qInDelay(qSR[1+pipeDelay]),  .iOut(iTap1),  .qOut(qTap1),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[1]));
tap #(18'h1FFFF) tap2(.iIn(iSR[2]),   .qIn(qSR[2]),  .iInDelay(iSR[2+pipeDelay]),  .qInDelay(qSR[2+pipeDelay]),  .iOut(iTap2),  .qOut(qTap2),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[2]));
tap #(18'h00000) tap3(.iIn(iSR[3]),   .qIn(qSR[3]),  .iInDelay(iSR[3+pipeDelay]),  .qInDelay(qSR[3+pipeDelay]),  .iOut(iTap3),  .qOut(qTap3),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[3]));
tap #(18'h00000) tap4(.iIn(iSR[4]),   .qIn(qSR[4]),  .iInDelay(iSR[4+pipeDelay]),  .qInDelay(qSR[4+pipeDelay]),  .iOut(iTap4),  .qOut(qTap4),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[4]));
tap #(18'h00000) tap5(.iIn(iSR[5]),   .qIn(qSR[5]),  .iInDelay(iSR[5+pipeDelay]),  .qInDelay(qSR[5+pipeDelay]),  .iOut(iTap5),  .qOut(qTap5),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[5]));
tap #(18'h00000) tap6(.iIn(iSR[6]),   .qIn(qSR[6]),  .iInDelay(iSR[6+pipeDelay]),  .qInDelay(qSR[6+pipeDelay]),  .iOut(iTap6),  .qOut(qTap6),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[6]));
tap #(18'h00000) tap7(.iIn(iSR[7]),   .qIn(qSR[7]),  .iInDelay(iSR[7+pipeDelay]),  .qInDelay(qSR[7+pipeDelay]),  .iOut(iTap7),  .qOut(qTap7),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[7]));
tap #(18'h00000) tap8(.iIn(iSR[8]),   .qIn(qSR[8]),  .iInDelay(iSR[8+pipeDelay]),  .qInDelay(qSR[8+pipeDelay]),  .iOut(iTap8),  .qOut(qTap8),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[8]));
tap #(18'h00000) tap9(.iIn(iSR[9]),   .qIn(qSR[9]),  .iInDelay(iSR[9+pipeDelay]),  .qInDelay(qSR[9+pipeDelay]),  .iOut(iTap9),  .qOut(qTap9),  .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[9]));
tap #(18'h00000) tap10(.iIn(iSR[10]), .qIn(qSR[10]), .iInDelay(iSR[10+pipeDelay]), .qInDelay(qSR[10+pipeDelay]), .iOut(iTap10), .qOut(qTap10), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[10]));
tap #(18'h00000) tap11(.iIn(iSR[11]), .qIn(qSR[11]), .iInDelay(iSR[11+pipeDelay]), .qInDelay(qSR[11+pipeDelay]), .iOut(iTap11), .qOut(qTap11), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[11]));
tap #(18'h00000) tap12(.iIn(iSR[12]), .qIn(qSR[12]), .iInDelay(iSR[12+pipeDelay]), .qInDelay(qSR[12+pipeDelay]), .iOut(iTap12), .qOut(qTap12), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[12]));
tap #(18'h00000) tap13(.iIn(iSR[13]), .qIn(qSR[13]), .iInDelay(iSR[13+pipeDelay]), .qInDelay(qSR[13+pipeDelay]), .iOut(iTap13), .qOut(qTap13), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[13]));
tap #(18'h00000) tap14(.iIn(iSR[14]), .qIn(qSR[14]), .iInDelay(iSR[14+pipeDelay]), .qInDelay(qSR[14+pipeDelay]), .iOut(iTap14), .qOut(qTap14), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[14]));
tap #(18'h00000) tap15(.iIn(iSR[15]), .qIn(qSR[15]), .iInDelay(iSR[15+pipeDelay]), .qInDelay(qSR[15+pipeDelay]), .iOut(iTap15), .qOut(qTap15), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[15]));
`ifndef NUM_TAPS_16
tap #(18'h00000) tap16(.iIn(iSR[16]), .qIn(qSR[16]), .iInDelay(iSR[16+pipeDelay]), .qInDelay(qSR[16+pipeDelay]), .iOut(iTap16), .qOut(qTap16), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[16]));
tap #(18'h00000) tap17(.iIn(iSR[17]), .qIn(qSR[17]), .iInDelay(iSR[17+pipeDelay]), .qInDelay(qSR[17+pipeDelay]), .iOut(iTap17), .qOut(qTap17), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[17]));
`ifndef NUM_TAPS_18
tap #(18'h00000) tap18(.iIn(iSR[18]), .qIn(qSR[18]), .iInDelay(iSR[18+pipeDelay]), .qInDelay(qSR[18+pipeDelay]), .iOut(iTap18), .qOut(qTap18), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[18]));
tap #(18'h00000) tap19(.iIn(iSR[19]), .qIn(qSR[19]), .iInDelay(iSR[19+pipeDelay]), .qInDelay(qSR[19+pipeDelay]), .iOut(iTap19), .qOut(qTap19), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[19]));
`ifndef NUM_TAPS_20
tap #(18'h00000) tap20(.iIn(iSR[20]), .qIn(qSR[20]), .iInDelay(iSR[20+pipeDelay]), .qInDelay(qSR[20+pipeDelay]), .iOut(iTap20), .qOut(qTap20), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[20]));
tap #(18'h00000) tap21(.iIn(iSR[21]), .qIn(qSR[21]), .iInDelay(iSR[21+pipeDelay]), .qInDelay(qSR[21+pipeDelay]), .iOut(iTap21), .qOut(qTap21), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[21]));
`ifndef NUM_TAPS_22
tap #(18'h00000) tap22(.iIn(iSR[22]), .qIn(qSR[22]), .iInDelay(iSR[22+pipeDelay]), .qInDelay(qSR[22+pipeDelay]), .iOut(iTap22), .qOut(qTap22), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[22]));
tap #(18'h00000) tap23(.iIn(iSR[23]), .qIn(qSR[23]), .iInDelay(iSR[23+pipeDelay]), .qInDelay(qSR[23+pipeDelay]), .iOut(iTap23), .qOut(qTap23), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[23]));
`ifndef NUM_TAPS_24
tap #(18'h00000) tap24(.iIn(iSR[24]), .qIn(qSR[24]), .iInDelay(iSR[24+pipeDelay]), .qInDelay(qSR[24+pipeDelay]), .iOut(iTap24), .qOut(qTap24), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[24]));
tap #(18'h00000) tap25(.iIn(iSR[25]), .qIn(qSR[25]), .iInDelay(iSR[25+pipeDelay]), .qInDelay(qSR[25+pipeDelay]), .iOut(iTap25), .qOut(qTap25), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[25]));
`ifndef NUM_TAPS_26
tap #(18'h00000) tap26(.iIn(iSR[26]), .qIn(qSR[26]), .iInDelay(iSR[26+pipeDelay]), .qInDelay(qSR[26+pipeDelay]), .iOut(iTap26), .qOut(qTap26), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[26]));
tap #(18'h00000) tap27(.iIn(iSR[27]), .qIn(qSR[27]), .iInDelay(iSR[27+pipeDelay]), .qInDelay(qSR[27+pipeDelay]), .iOut(iTap27), .qOut(qTap27), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[27]));
`ifndef NUM_TAPS_28
tap #(18'h00000) tap28(.iIn(iSR[28]), .qIn(qSR[28]), .iInDelay(iSR[28+pipeDelay]), .qInDelay(qSR[28+pipeDelay]), .iOut(iTap28), .qOut(qTap28), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[28]));
tap #(18'h00000) tap29(.iIn(iSR[29]), .qIn(qSR[29]), .iInDelay(iSR[29+pipeDelay]), .qInDelay(qSR[29+pipeDelay]), .iOut(iTap29), .qOut(qTap29), .clk(clk), .clkEn(clkEn), .reset(reset), .wtUpdate(wtUpdate), .wtReset(wtReset), .iError(iError), .qError(qError), .wtOvf(wtOvf[29]));
`endif //NUM_TAPS_28
`endif //NUM_TAPS_26
`endif //NUM_TAPS_24
`endif //NUM_TAPS_22
`endif //NUM_TAPS_20
`endif //NUM_TAPS_18
`endif //NUM_TAPS_16
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Tap Output Summations
// Two pipeline delays
// these ifdefs support changing the number of summer inputs but it
// assumes unconnected inputs are forced to zero which appears to be the case
// with both the Aldec simulator and ISE 13.4
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire    signed  [17:0] iSum;
sum iTapSum (.t0(iTap0),.t1(iTap1),.t2(iTap2),.t3(iTap3),.t4(iTap4),.t5(iTap5),.t6(iTap6),.t7(iTap7),.t8(iTap8),.t9(iTap9),.t10(iTap10),.t11(iTap11),.t12(iTap12),.t13(iTap13),.t14(iTap14),.t15(iTap15)
`ifndef NUM_TAPS_16
    ,.t16(iTap16),.t17(iTap17)
`ifndef NUM_TAPS_18
    ,.t18(iTap18),.t19(iTap19)
`ifndef NUM_TAPS_20
    ,.t20(iTap20),.t21(iTap21)
`ifndef NUM_TAPS_22
    ,.t22(iTap22),.t23(iTap23)
`ifndef NUM_TAPS_24
    ,.t24(iTap24),.t25(iTap25)
`ifndef NUM_TAPS_26
    ,.t26(iTap26),.t27(iTap27)
`ifndef NUM_TAPS_28
    ,.t28(iTap28),.t29(iTap29)
`endif // NUM_TAPS_28
`endif // NUM_TAPS_26
`endif // NUM_TAPS_24
`endif // NUM_TAPS_22
`endif // NUM_TAPS_20
`endif // NUM_TAPS_18
`endif // NUM_TAPS_16
    ,.t30(18'h0),.t31(18'h0),.S(),.qS(iSum),.CK(clk),.EN(clkEn),.RS(reset));

wire    signed  [17:0] qSum;
sum qTapSum (.t0(qTap0),.t1(qTap1),.t2(qTap2),.t3(qTap3),.t4(qTap4),.t5(qTap5),.t6(qTap6),.t7(qTap7),.t8(qTap8),.t9(qTap9),.t10(qTap10),.t11(qTap11),.t12(qTap12),.t13(qTap13),.t14(qTap14),.t15(qTap15)
`ifndef NUM_TAPS_16
    ,.t16(qTap16),.t17(qTap17)
`ifndef NUM_TAPS_18
    ,.t18(qTap18),.t19(qTap19)
`ifndef NUM_TAPS_20
    ,.t20(qTap20),.t21(qTap21)
`ifndef NUM_TAPS_22
    ,.t22(qTap22),.t23(qTap23)
`ifndef NUM_TAPS_24
    ,.t24(qTap24),.t25(qTap25)
`ifndef NUM_TAPS_26
    ,.t26(qTap26),.t27(qTap27)
`ifndef NUM_TAPS_28
    ,.t28(qTap28),.t29(qTap29)
`endif // NUM_TAPS_28
`endif // NUM_TAPS_26
`endif // NUM_TAPS_24
`endif // NUM_TAPS_22
`endif // NUM_TAPS_20
`endif // NUM_TAPS_18
`endif // NUM_TAPS_16
    ,.t30(18'h0),.t31(18'h0),.S(),.qS(qSum),.CK(clk),.EN(clkEn),.RS(reset));

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Magnitude
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire [35:0]iSumSqr = $signed(iSum) * $signed(iSum);
wire [35:0]qSumSqr = $signed(qSum) * $signed(qSum);
wire [17:0]mag = limitAdd2(iSumSqr[35:17] + qSumSqr[35:17]);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Error
// One pipeline delay
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire [17:0] diff = limitAdd2({{3{refLevel[15]}},refLevel[15:0]} - {mag[17],mag});

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
wire [35:0]iErrMult = $signed(iSum_reg) * $signed(diff_reg);
wire [35:0]qErrMult = $signed(qSum_reg) * $signed(diff_reg);
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
            iErrStep = {iSign,iErrMult[30:14]};
            qErrStep = {qSign,qErrMult[30:14]};
            end
        3'b010: begin // 4.0
            iErrStep = {iSign,iErrMult[31:15]};
            qErrStep = {qSign,qErrMult[31:15]};
            end
        3'b001: begin // 2.0
            iErrStep = {iSign,iErrMult[32:16]};
            qErrStep = {qSign,qErrMult[32:16]};
            end
        3'b000: begin // 1.0
            iErrStep = {iSign,iErrMult[33:17]};
            qErrStep = {qSign,qErrMult[33:17]};
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


`ifdef TEST_MODULE

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
    wire    signed  [17:0]  qIn = 18'h0;
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
