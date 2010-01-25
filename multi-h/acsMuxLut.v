`timescale 1ns/1ps
module acsMuxLut (
    decayFactor, 
    symEnEven,
    accMet_45_0, accMet_45_1, accMet_45_2, accMet_45_3, 
    accMet_54_0, accMet_54_1, accMet_54_2, accMet_54_3, 
    accMuxOut0,accMuxOut1,accMuxOut2,accMuxOut3
    );

parameter           ACS_BITS = 8;


input   [7:0]           decayFactor;
input                   symEnEven;
input   [ACS_BITS-1:0]  accMet_45_0, accMet_45_1, accMet_45_2, accMet_45_3, 
                        accMet_54_0, accMet_54_1, accMet_54_2, accMet_54_3;
output  [ACS_BITS-1:0]  accMuxOut0,accMuxOut1,accMuxOut2,accMuxOut3;     

// Two 8to4 input muxes on the accumulated metric inputs. 
reg [ACS_BITS-1:0]    muxOut0, muxOut1, muxOut2, muxOut3;
always @(symEnEven or 
        accMet_45_0 or accMet_54_0 or
        accMet_45_1 or accMet_54_1 or 
        accMet_45_2 or accMet_54_2 or 
        accMet_45_3 or accMet_54_3)
    begin
    //if (symEnEvenMux) begin 
    if (~symEnEven) begin 
        muxOut0 <= accMet_54_0;
        muxOut1 <= accMet_54_1;
        muxOut2 <= accMet_54_2;
        muxOut3 <= accMet_54_3;
        end
    else begin
        muxOut0 <= accMet_45_0;
        muxOut1 <= accMet_45_1;
        muxOut2 <= accMet_45_2;
        muxOut3 <= accMet_45_3;
        end
    end
   
wire    [ACS_BITS:0]  decay0Out;
decayMult10x8 decay0(
    .a(muxOut0), 
    .b(decayFactor), 
    .p(decay0Out)
    );
`ifdef LWK_MPY2
reg     [ACS_BITS-1:0]  accMuxOut0;
always @(decay0Out) begin
    if (decay0Out[ACS_BITS] & !decay0Out[ACS_BITS-1]) begin
        accMuxOut0 <= {1'b1,{ACS_BITS-2{1'b0}},1'b1};
        end
    else if (!decay0Out[ACS_BITS] & decay0Out[ACS_BITS-1]) begin
        accMuxOut0 <= {1'b0,{ACS_BITS-1{1'b1}}};
        end
    else begin
        accMuxOut0 <= decay0Out[ACS_BITS-1:0];
        end
    end
`else
assign accMuxOut0 = decay0Out[ACS_BITS:1] + decay0Out[0];
`endif

wire    [ACS_BITS:0]  decay1Out;
decayMult10x8 decay1(
    .a(muxOut1), 
    .b(decayFactor), 
    .p(decay1Out)
    );
`ifdef LWK_MPY2
reg     [ACS_BITS-1:0]  accMuxOut1;
always @(decay1Out) begin
    if (decay1Out[ACS_BITS] & !decay1Out[ACS_BITS-1]) begin
        accMuxOut1 <= {1'b1,{ACS_BITS-2{1'b0}},1'b1};
        end
    else if (!decay1Out[ACS_BITS] & decay1Out[ACS_BITS-1]) begin
        accMuxOut1 <= {1'b0,{ACS_BITS-1{1'b1}}};
        end
    else begin
        accMuxOut1 <= decay1Out[ACS_BITS-1:0];
        end
    end
`else
assign accMuxOut1 = decay1Out[ACS_BITS:1] + decay1Out[0];
`endif

wire    [ACS_BITS:0]  decay2Out;
decayMpy10x8 decay2(
    .a(muxOut2), 
    .b(decayFactor), 
    .p(decay2Out)
    );
`ifdef LWK_MPY2
reg     [ACS_BITS-1:0]  accMuxOut2;
always @(decay2Out) begin
    if (decay2Out[ACS_BITS] & !decay2Out[ACS_BITS-1]) begin
        accMuxOut2 <= {1'b1,{ACS_BITS-2{1'b0}},1'b1};
        end
    else if (!decay2Out[ACS_BITS] & decay2Out[ACS_BITS-1]) begin
        accMuxOut2 <= {1'b0,{ACS_BITS-1{1'b1}}};
        end
    else begin
        accMuxOut2 <= decay2Out[ACS_BITS-1:0];
        end
    end
`else
assign accMuxOut2 = decay2Out[ACS_BITS:1] + decay2Out[0];
`endif

wire    [ACS_BITS:0]  decay3Out;
decayMpy10x8 decay3(
    .a(muxOut3), 
    .b(decayFactor), 
    .p(decay3Out)
    );
`ifdef LWK_MPY2
reg     [ACS_BITS-1:0]  accMuxOut3;
always @(decay3Out) begin
    if (decay3Out[ACS_BITS] & !decay3Out[ACS_BITS-1]) begin
        accMuxOut3 <= {1'b1,{ACS_BITS-2{1'b0}},1'b1};
        end
    else if (!decay3Out[ACS_BITS] & decay3Out[ACS_BITS-1]) begin
        accMuxOut3 <= {1'b0,{ACS_BITS-1{1'b1}}};
        end
    else begin
        accMuxOut3 <= decay3Out[ACS_BITS-1:0];
        end
    end
`else
assign accMuxOut3 = decay3Out[ACS_BITS:1] + decay3Out[0];
`endif

endmodule

`ifdef TEST_MUX

module testMux();

reg     [7:0]   decayFactor;
acsMuxLut #(10) acsMux(
    .decayFactor(decayFactor), 
    .symEnEven(symEnEven),
    .accMet_45_0(10'h1ff), .accMet_45_1(10'h100), .accMet_45_2(10'h080), .accMet_45_3(10'h040), 
    .accMet_54_0(10'h201), .accMet_54_1(10'h300), .accMet_54_2(10'h380), .accMet_54_3(10'h3c0), 
    .accMuxOut0(),  .accMuxOut1(),  .accMuxOut2(),  .accMuxOut3()
    );


parameter hc = 10;
parameter c = 2*hc;

reg clk;
initial clk = 0;
always begin
    #hc clk = ~clk;
    end

reg [2:0] clkCount;
initial clkCount <= 0;
always @(posedge clk) begin
    clkCount <= clkCount + 1;
    end

assign symEnEven = clkCount[2];

initial begin
    decayFactor <= 0xff;

    #(128*c) ;
    decayFactor <= 0x80;

    #(128*c) ;
    $stop;

    end

endmodule

`endif


