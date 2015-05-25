`timescale 1ns/1ps

module iqMagEst( 
    clk, reset, syncIn,
    iIn_0,qIn_0,
    iIn_1,qIn_1,
    decision
    );

input           clk,reset,syncIn;
input   [17:0]  iIn_0,qIn_0;
input   [17:0]  iIn_1,qIn_1;
output          decision;

reg             decision;
reg     [36:0]  magEst_0, magEst_1;
wire    [35:0]  iSquare_0, qSquare_0;
wire    [35:0]  iSquare_1, qSquare_1;
   
reg [17:0]iInBuf0,iInBuf1,qInBuf0,qInBuf1;

always @(posedge clk)begin
  if(syncIn)begin
    iInBuf0 <= iIn_0;
    iInBuf1 <= iIn_1;
    qInBuf0 <= qIn_0;
    qInBuf1 <= qIn_1;
    end
  end


mpy18x18 mpy_i_0(
    .clk(clk), 
    .sclr(reset),
    .a(iInBuf0), 
    .b(iInBuf0), 
    .p(iSquare_0)
    );

mpy18x18 mpy_q_0(
    .clk(clk), 
    .sclr(reset),
    .a(qInBuf0), 
    .b(qInBuf0), 
    .p(qSquare_0)
    );


mpy18x18 mpy_i_1(
    .clk(clk), 
    .sclr(reset),
    .a(iInBuf1), 
    .b(iInBuf1), 
    .p(iSquare_1)
    );

mpy18x18 mpy_q_1(
    .clk(clk), 
    .sclr(reset),
    .a(qInBuf1), 
    .b(qInBuf1), 
    .p(qSquare_1)
    )
;
   
wire [36:0]  sum_0 = {1'b0, iSquare_0} + {1'b0, qSquare_0}; // adding i^2 + q^2 (the square of any number is alwas pos. so we don't need to sign extend.)
wire [36:0]  sum_1 = {1'b0, iSquare_1} + {1'b0, qSquare_1};

  always @(posedge clk)
     if (reset) begin
          magEst_0 <= 0;
          magEst_1 <= 0;
     end
     else if (syncIn) begin
          magEst_0 <= sum_0;
          magEst_1 <= sum_1;
          if (magEst_0 >= magEst_1) begin
             decision <= 0;
          end
          else begin
             decision <= 1;
          end
     end


`ifdef SIMULATE

integer file;
initial file = $fopen("iqMagEst.dat") ;

   always @(posedge clk)begin
        if(syncIn)begin
           $fdisplay(file, "%d\t%d\t%d\t%d\t%d\t%d\t%b", $signed(iIn_0), $signed(qIn_0), $signed(iIn_1), $signed(qIn_1), sum_0, sum_1, decision);
        end
   end
`endif   


      
endmodule
