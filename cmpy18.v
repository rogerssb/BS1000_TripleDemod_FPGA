module cmpy18(clk,reset,aReal,aImag,bReal,bImag,pReal,pImag);

input clk;
input reset;
input [17:0]aReal;
input [17:0]aImag;
input [17:0]bReal;
input [17:0]bImag;
output [17:0]pReal;
output [17:0]pImag;

// Complex Multiplier
//RxR
wire [35:0]productRxR;
mpy18x18 mpyRxR(.clk(clk), 
                .sclr(reset),
                .a(aReal), 
                .b(bReal), 
                .p(productRxR)
                );

//IxI
wire [35:0]productIxI;
mpy18x18 mpyIxI(.clk(clk), 
                .sclr(reset),
                .a(aImag), 
                .b(bImag), 
                .p(productIxI)
                );

//RxI
wire [35:0]productRxI;
mpy18x18 mpyRxI(.clk(clk), 
                .sclr(reset),
                .a(aReal), 
                .b(bImag), 
                .p(productRxI)
                );

//IxR
wire [35:0]productIxR;
mpy18x18 mpyIxR(.clk(clk), 
                .sclr(reset),
                .a(aImag), 
                .b(bReal), 
                .p(productIxR)
                );

wire [35:0]realSum = {productRxR[34],productRxR[34:0]} - {productIxI[34],productIxI[34:0]};
wire [35:0]imagSum = {productRxI[34],productRxI[34:0]} + {productIxR[34],productIxR[34:0]};
reg [17:0]pReal;
reg [17:0]pImag;
always @(posedge clk) begin
    pReal <= realSum[35:18];
    pImag <= imagSum[35:18];
    end

endmodule
