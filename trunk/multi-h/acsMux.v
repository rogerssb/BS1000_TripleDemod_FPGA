`timescale 1ns/1ps
module acsMux (
    symEnEven,
    accMet_45_0, accMet_45_1, accMet_45_2, accMet_45_3, 
    accMet_54_0, accMet_54_1, accMet_54_2, accMet_54_3, 
    accMuxOut0,accMuxOut1,accMuxOut2,accMuxOut3
    );
parameter             ACS_BITS = 8;

input                   symEnEven;
input   [ACS_BITS-1:0]  accMet_45_0, accMet_45_1, accMet_45_2, accMet_45_3, 
                        accMet_54_0, accMet_54_1, accMet_54_2, accMet_54_3;
output  [ACS_BITS-1:0]  accMuxOut0,accMuxOut1,accMuxOut2,accMuxOut3;     

// Two 8to4 input muxes on the accumulated metric inputs. 
reg [ACS_BITS-1:0]    accMuxOut0, accMuxOut1, accMuxOut2, accMuxOut3;
always @(symEnEven or 
        accMet_45_0 or accMet_54_0 or
        accMet_45_1 or accMet_54_1 or 
        accMet_45_2 or accMet_54_2 or 
        accMet_45_3 or accMet_54_3)
    begin
    //if (symEnEvenMux) begin 
    if (~symEnEven) begin 
        accMuxOut0 <= accMet_54_0;
        accMuxOut1 <= accMet_54_1;
        accMuxOut2 <= accMet_54_2;
        accMuxOut3 <= accMet_54_3;
        end
    else begin
        accMuxOut0 <= accMet_45_0;
        accMuxOut1 <= accMet_45_1;
        accMuxOut2 <= accMet_45_2;
        accMuxOut3 <= accMet_45_3;
        end
    end
   
endmodule
