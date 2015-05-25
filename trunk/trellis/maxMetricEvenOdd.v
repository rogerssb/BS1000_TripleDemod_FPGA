`timescale 1ns/1ps

`define ADD_INDEX_DELTA

// Finds the index (0-19) of the metric wih the largest number. The maxValue is 
// also computed but is not used in the design. If all inputs are the same the 
// 19th (13hex) index will be picked. All done with 2's complement numbers

// LWK - This version limits the choice of max metric so that in every other symbol
// it either comes from an even state or an odd state. This has the effect of forcing
// indexDelta to always be odd.

module maxMetricEvenOdd(
    clk, reset, symEn, even,
    accMetOut0 , accMetOut1 , accMetOut2 , accMetOut3 , accMetOut4 , 
    accMetOut5 , accMetOut6 , accMetOut7 , accMetOut8 , accMetOut9 , 
    accMetOut10, accMetOut11, accMetOut12, accMetOut13, accMetOut14, 
    accMetOut15, accMetOut16, accMetOut17, accMetOut18, accMetOut19,
    maxVal,
    index,
    indexDelta,
    symEnDly
    );
   
   parameter            size = 12;
   input                clk,reset,symEn,even;
   input [(size-1):0] accMetOut0 , accMetOut1 , accMetOut2 , accMetOut3 , 
                        accMetOut4 , accMetOut5 , accMetOut6 , accMetOut7 , 
                        accMetOut8 , accMetOut9 , accMetOut10, accMetOut11, 
                        accMetOut12, accMetOut13, accMetOut14, accMetOut15, 
                        accMetOut16, accMetOut17, accMetOut18, accMetOut19;
   output [4:0]         index; // max index (0-19)
   output [4:0]         indexDelta; // max index (0-19)
   output [(size-1):0]  maxVal;
   output               symEnDly;
   reg [4:0]            index;
   reg [4:0]            indexDelta;   

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


    reg     [1:0]   compareState;
    reg     [4:0]   prevIndex;
    wire    [5:0]   indexDiff = {1'b0,index} - {1'b0,prevIndex};
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
                        prevIndex <= index;
                        `ifdef ADD_INDEX_DELTA
                        case (indexDiff) 
                            0 : indexDelta <= 0;                            
                            1 : indexDelta <= 1;                            
                            2 : indexDelta <= 2;                            
                            3 : indexDelta <= 3;                            
                            4 : indexDelta <= 4;                            
                            5 : indexDelta <= 5;                            
                            6 : indexDelta <= 6;                            
                            7 : indexDelta <= 7;                            
                            8 : indexDelta <= 8;                            
                            9 : indexDelta <= 9;                            
                            10: indexDelta <= -10;                            
                            11: indexDelta <= -9;                            
                            12: indexDelta <= -8;                            
                            13: indexDelta <= -7;                            
                            14: indexDelta <= -6;                            
                            15: indexDelta <= -5;                            
                            16: indexDelta <= -4;                            
                            17: indexDelta <= -3;                            
                            18: indexDelta <= -2;                            
                            19: indexDelta <= -1;                            
                            20: indexDelta <= 0;                            
                            21: indexDelta <= 0;                            
                            22: indexDelta <= 0;                            
                            23: indexDelta <= 0;                            
                            24: indexDelta <= 0;                            
                            25: indexDelta <= 0;                            
                            26: indexDelta <= 0;                            
                            27: indexDelta <= 0;                            
                            28: indexDelta <= 0;                            
                            29: indexDelta <= 0;                            
                            30: indexDelta <= 0;                            
                            31: indexDelta <= 0;                            
                            32: indexDelta <= 0;                            
                            33: indexDelta <= 0;                            
                            34: indexDelta <= 0;                            
                            35: indexDelta <= 0;                            
                            36: indexDelta <= 0;                            
                            37: indexDelta <= 0;                            
                            38: indexDelta <= 0;                            
                            39: indexDelta <= 0;                            
                            40: indexDelta <= 0;                            
                            41: indexDelta <= 0;                            
                            42: indexDelta <= 0;                            
                            43: indexDelta <= 0;                            
                            44: indexDelta <= 0;                            
                            45: indexDelta <= 1;                            
                            46: indexDelta <= 2;                            
                            47: indexDelta <= 3;                            
                            48: indexDelta <= 4;                            
                            49: indexDelta <= 5;                            
                            50: indexDelta <= 6;                            
                            51: indexDelta <= 7;                            
                            52: indexDelta <= 8;                            
                            53: indexDelta <= 9;                            
                            54: indexDelta <= -10;                            
                            55: indexDelta <= -9;                            
                            56: indexDelta <= -8;                            
                            57: indexDelta <= -7;                            
                            58: indexDelta <= -6;                            
                            59: indexDelta <= -5;                            
                            60: indexDelta <= -4;                            
                            61: indexDelta <= -3;                            
                            62: indexDelta <= -2;                            
                            63: indexDelta <= -1;                            
                            endcase
                        `else
                        indexDelta <= 0;
                        `endif
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