`timescale 1ns/1ps

// Finds the index (0-19) of the metric wih the largest number. The maxValue is also computed but is not used in the design
// If all inputs are the same the 19th (13hex) index will be picked.
// All done with 2's complement numbers
module maxMetricEvenOdd(
    clk, reset, symEn, even,
    accMetOut0 , accMetOut1 , accMetOut2 , accMetOut3 , accMetOut4 , 
    accMetOut5 , accMetOut6 , accMetOut7 , accMetOut8 , accMetOut9 , 
    accMetOut10, accMetOut11, accMetOut12, accMetOut13, accMetOut14, 
    accMetOut15, accMetOut16, accMetOut17, accMetOut18, accMetOut19,
    maxVal,
    index, symEnDly
    );
   
   parameter            size = 12;
   input                clk,reset,symEn,even;
   input [(size-1):0] accMetOut0 , accMetOut1 , accMetOut2 , accMetOut3 , 
                        accMetOut4 , accMetOut5 , accMetOut6 , accMetOut7 , 
                        accMetOut8 , accMetOut9 , accMetOut10, accMetOut11, 
                        accMetOut12, accMetOut13, accMetOut14, accMetOut15, 
                        accMetOut16, accMetOut17, accMetOut18, accMetOut19;
   output [4:0]         index; // max index (0-19)
   output [(size-1):0]  maxVal;
   output               symEnDly;
   reg [4:0]            index;                      

   wire [(size-1):0]  maxValE1_0, maxValE1_1, maxValE1_2, 
                      maxValO1_0, maxValO1_1, maxValO1_2,
                      maxValE2,
                      maxValO2;
                                    
   reg [(size-1):0]   maxVal; // the maximum value is not used in the design but it is nice for debug
      
   wire [4:0]           iE1_0; // possible value 0..3
   wire [4:0]           iE1_1; // possible value 4..7
   wire [4:0]           iE1_2; // possible value 8..9 
   wire [4:0]           iO1_0; // possible value 0..3
   wire [4:0]           iO1_1; // possible value 4..7
   wire [4:0]           iO1_2; // possible value 8..9 
   wire [4:0]           iE2, iO2;
               
   wire [(size-1):0]    maxNegative = {1'b1,{(size-1){1'b0}}};

   // Stage 1 compare. The index value comming out of is scaled to 0..19 using the parameter indesOffset, by adding 4,8,12,or 16
   comp4twosComp  #(size, 0)  compS1_0_3Even   (clk, reset, accMetOut0 , accMetOut2 , accMetOut4 , accMetOut6 , iE1_0, maxValE1_0);
   comp4twosComp  #(size, 4)  compS1_4_7Even   (clk, reset, accMetOut8 , accMetOut10, accMetOut12, accMetOut14, iE1_1, maxValE1_1);
   comp4twosComp  #(size, 8)  compS1_8_9Even   (clk, reset, accMetOut16, accMetOut18, maxNegative, maxNegative, iE1_2, maxValE1_2); 

   comp4twosComp  #(size, 0)  compS1_0_3Odd    (clk, reset, accMetOut1 , accMetOut3 , accMetOut5 , accMetOut7 , iO1_0, maxValO1_0);
   comp4twosComp  #(size, 4)  compS1_4_7Odd    (clk, reset, accMetOut9 , accMetOut11, accMetOut13, accMetOut15, iO1_1, maxValO1_1);
   comp4twosComp  #(size, 8)  compS1_8_9Odd    (clk, reset, accMetOut17, accMetOut19, maxNegative, maxNegative, iO1_2, maxValO1_2); 

   // Stage 2 compare
   comp4twosComp  #(size, 0)  compS2_0_3Even   (clk, reset, maxValE1_0 , maxValE1_1 , maxValE1_2 , maxNegative, iE2  , maxValE2  );
   comp4twosComp  #(size, 0)  compS2_0_3Odd    (clk, reset, maxValO1_0 , maxValO1_1 , maxValO1_2 , maxNegative, iO2  , maxValO2  );


    reg [1:0]   compareState;
    parameter   IDLE =      2'b00,
                STAGE1 =    2'b01,
                STAGE2 =    2'b11,
                STAGE3 =    2'b10;
    always @(posedge clk) begin
        if (reset) begin
            compareState <= IDLE;
            maxVal <= 0;
            index <= 0;
            end
        else begin
            case (compareState)
                IDLE: begin
                    if (symEn) begin
                        compareState <= STAGE1;
                        end
                    end
                STAGE1: begin
                    // During this stage the ACS inputs are flowing through the
                    // first stage of comparisons
                    compareState <= STAGE2;
                    end
                STAGE2: begin
                    // During this stage the results of the first stage comparisons
                    // are flowing through the second stage comparisons
                    compareState <= STAGE3;
                    end
                STAGE3: begin
                    compareState <= IDLE;
                    if (even) begin
                        case (iE2)
                            0: index <= {iE1_0[3:0],1'b0};
                            1: index <= {iE1_1[3:0],1'b0};
                            2: index <= {iE1_2[3:0],1'b0};
                            default: index <= {iE1_0[3:0],1'b0};
                            endcase
                        maxVal <= maxValE2;
                        end
                    else begin
                        case (iO2)
                            0: index <= {iO1_0[3:0],1'b1};
                            1: index <= {iO1_1[3:0],1'b1};
                            2: index <= {iO1_2[3:0],1'b1};
                            default: index <= {iO1_0[3:0],1'b1};
                            endcase
                        maxVal <= maxValO2;
                        end
                    end
            endcase
        end
     end

     assign symEnDly = symEn;

endmodule