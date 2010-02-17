//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Trace Back for multiH
// Created      18 Jan 10
//-----------------------------------------------------------------------------
// 1.0      AMJ initial coding
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module traceBackMultiH
  (
   clk, 
   reset, 
   symEn,
   symEnEven,
   decTbtIn,
   sel0 , sel1 , sel2 , sel3 , sel4 , sel5 , sel6 , sel7 , 
   sel8 , sel9 , sel10, sel11, sel12, sel13, sel14, sel15, 
   sel16, sel17, sel18, sel19, sel20, sel21, sel22, sel23, 
   sel24, sel25, sel26, sel27, sel28, sel29, sel30, sel31, 
   sel32, sel33, sel34, sel35, sel36, sel37, sel38, sel39, 
   sel40, sel41, sel42, sel43, sel44, sel45, sel46, sel47, 
   sel48, sel49, sel50, sel51, sel52, sel53, sel54, sel55, 
   sel56, sel57, sel58, sel59, sel60, sel61, sel62, sel63,
   index,
   decision
   );
   
   parameter          size = 8;
   parameter          TB_DEPTH = 8;
   input              clk,reset,symEn;
   input              symEnEven;
   input [1:0]        decTbtIn;
   input [1:0]        sel0 , sel1 , sel2 , sel3 , sel4 , sel5 , sel6 , sel7 , 
                      sel8 , sel9 , sel10, sel11, sel12, sel13, sel14, sel15, 
                      sel16, sel17, sel18, sel19, sel20, sel21, sel22, sel23, 
                      sel24, sel25, sel26, sel27, sel28, sel29, sel30, sel31, 
                      sel32, sel33, sel34, sel35, sel36, sel37, sel38, sel39, 
                      sel40, sel41, sel42, sel43, sel44, sel45, sel46, sel47, 
                      sel48, sel49, sel50, sel51, sel52, sel53, sel54, sel55, 
                      sel56, sel57, sel58, sel59, sel60, sel61, sel62, sel63; // 64 induvidual decision.
   input [5:0]        index; // pointer to the state which has the maximum metric (one of the 64 states)
   output [1:0]       decision;
   reg [1:0]          decisionTmp;
   reg [1:0]          decision;


   reg [1:0]          tbt0_0,  tbt0_1,  tbt0_2,  tbt0_3,  tbt0_4,  tbt0_5,  tbt0_6,  tbt0_7, 
                      tbt0_8,  tbt0_9,  tbt0_10, tbt0_11, tbt0_12, tbt0_13, tbt0_14, tbt0_15,
                      tbt0_16, tbt0_17, tbt0_18, tbt0_19, tbt0_20, tbt0_21, tbt0_22, tbt0_23,
                      tbt0_24, tbt0_25, tbt0_26, tbt0_27, tbt0_28, tbt0_29, tbt0_30, tbt0_31,
                      tbt0_32, tbt0_33, tbt0_34, tbt0_35, tbt0_36, tbt0_37, tbt0_38, tbt0_39,
                      tbt0_40, tbt0_41, tbt0_42, tbt0_43, tbt0_44, tbt0_45, tbt0_46, tbt0_47,
                      tbt0_48, tbt0_49, tbt0_50, tbt0_51, tbt0_52, tbt0_53, tbt0_54, tbt0_55,
                      tbt0_56, tbt0_57, tbt0_58, tbt0_59, tbt0_60, tbt0_61, tbt0_62, tbt0_63;
   reg [1:0]          tbt1_0,  tbt1_1,  tbt1_2,  tbt1_3,  tbt1_4,  tbt1_5,  tbt1_6,  tbt1_7, 
                      tbt1_8,  tbt1_9,  tbt1_10, tbt1_11, tbt1_12, tbt1_13, tbt1_14, tbt1_15,
                      tbt1_16, tbt1_17, tbt1_18, tbt1_19, tbt1_20, tbt1_21, tbt1_22, tbt1_23,
                      tbt1_24, tbt1_25, tbt1_26, tbt1_27, tbt1_28, tbt1_29, tbt1_30, tbt1_31,
                      tbt1_32, tbt1_33, tbt1_34, tbt1_35, tbt1_36, tbt1_37, tbt1_38, tbt1_39,
                      tbt1_40, tbt1_41, tbt1_42, tbt1_43, tbt1_44, tbt1_45, tbt1_46, tbt1_47,
                      tbt1_48, tbt1_49, tbt1_50, tbt1_51, tbt1_52, tbt1_53, tbt1_54, tbt1_55,
                      tbt1_56, tbt1_57, tbt1_58, tbt1_59, tbt1_60, tbt1_61, tbt1_62, tbt1_63;
   reg [1:0]          tbt2_0,  tbt2_1,  tbt2_2,  tbt2_3,  tbt2_4,  tbt2_5,  tbt2_6,  tbt2_7, 
                      tbt2_8,  tbt2_9,  tbt2_10, tbt2_11, tbt2_12, tbt2_13, tbt2_14, tbt2_15,
                      tbt2_16, tbt2_17, tbt2_18, tbt2_19, tbt2_20, tbt2_21, tbt2_22, tbt2_23,
                      tbt2_24, tbt2_25, tbt2_26, tbt2_27, tbt2_28, tbt2_29, tbt2_30, tbt2_31,
                      tbt2_32, tbt2_33, tbt2_34, tbt2_35, tbt2_36, tbt2_37, tbt2_38, tbt2_39,
                      tbt2_40, tbt2_41, tbt2_42, tbt2_43, tbt2_44, tbt2_45, tbt2_46, tbt2_47,
                      tbt2_48, tbt2_49, tbt2_50, tbt2_51, tbt2_52, tbt2_53, tbt2_54, tbt2_55,
                      tbt2_56, tbt2_57, tbt2_58, tbt2_59, tbt2_60, tbt2_61, tbt2_62, tbt2_63;
   reg [1:0]          tbt3_0,  tbt3_1,  tbt3_2,  tbt3_3,  tbt3_4,  tbt3_5,  tbt3_6,  tbt3_7, 
                      tbt3_8,  tbt3_9,  tbt3_10, tbt3_11, tbt3_12, tbt3_13, tbt3_14, tbt3_15,
                      tbt3_16, tbt3_17, tbt3_18, tbt3_19, tbt3_20, tbt3_21, tbt3_22, tbt3_23,
                      tbt3_24, tbt3_25, tbt3_26, tbt3_27, tbt3_28, tbt3_29, tbt3_30, tbt3_31,
                      tbt3_32, tbt3_33, tbt3_34, tbt3_35, tbt3_36, tbt3_37, tbt3_38, tbt3_39,
                      tbt3_40, tbt3_41, tbt3_42, tbt3_43, tbt3_44, tbt3_45, tbt3_46, tbt3_47,
                      tbt3_48, tbt3_49, tbt3_50, tbt3_51, tbt3_52, tbt3_53, tbt3_54, tbt3_55,
                      tbt3_56, tbt3_57, tbt3_58, tbt3_59, tbt3_60, tbt3_61, tbt3_62, tbt3_63;
   reg [1:0]          tbt4_0,  tbt4_1,  tbt4_2,  tbt4_3,  tbt4_4,  tbt4_5,  tbt4_6,  tbt4_7, 
                      tbt4_8,  tbt4_9,  tbt4_10, tbt4_11, tbt4_12, tbt4_13, tbt4_14, tbt4_15,
                      tbt4_16, tbt4_17, tbt4_18, tbt4_19, tbt4_20, tbt4_21, tbt4_22, tbt4_23,
                      tbt4_24, tbt4_25, tbt4_26, tbt4_27, tbt4_28, tbt4_29, tbt4_30, tbt4_31,
                      tbt4_32, tbt4_33, tbt4_34, tbt4_35, tbt4_36, tbt4_37, tbt4_38, tbt4_39,
                      tbt4_40, tbt4_41, tbt4_42, tbt4_43, tbt4_44, tbt4_45, tbt4_46, tbt4_47,
                      tbt4_48, tbt4_49, tbt4_50, tbt4_51, tbt4_52, tbt4_53, tbt4_54, tbt4_55,
                      tbt4_56, tbt4_57, tbt4_58, tbt4_59, tbt4_60, tbt4_61, tbt4_62, tbt4_63;
   reg [1:0]          tbt5_0,  tbt5_1,  tbt5_2,  tbt5_3,  tbt5_4,  tbt5_5,  tbt5_6,  tbt5_7, 
                      tbt5_8,  tbt5_9,  tbt5_10, tbt5_11, tbt5_12, tbt5_13, tbt5_14, tbt5_15,
                      tbt5_16, tbt5_17, tbt5_18, tbt5_19, tbt5_20, tbt5_21, tbt5_22, tbt5_23,
                      tbt5_24, tbt5_25, tbt5_26, tbt5_27, tbt5_28, tbt5_29, tbt5_30, tbt5_31,
                      tbt5_32, tbt5_33, tbt5_34, tbt5_35, tbt5_36, tbt5_37, tbt5_38, tbt5_39,
                      tbt5_40, tbt5_41, tbt5_42, tbt5_43, tbt5_44, tbt5_45, tbt5_46, tbt5_47,
                      tbt5_48, tbt5_49, tbt5_50, tbt5_51, tbt5_52, tbt5_53, tbt5_54, tbt5_55,
                      tbt5_56, tbt5_57, tbt5_58, tbt5_59, tbt5_60, tbt5_61, tbt5_62, tbt5_63;
   reg [1:0]          tbt6_0,  tbt6_1,  tbt6_2,  tbt6_3,  tbt6_4,  tbt6_5,  tbt6_6,  tbt6_7, 
                      tbt6_8,  tbt6_9,  tbt6_10, tbt6_11, tbt6_12, tbt6_13, tbt6_14, tbt6_15,
                      tbt6_16, tbt6_17, tbt6_18, tbt6_19, tbt6_20, tbt6_21, tbt6_22, tbt6_23,
                      tbt6_24, tbt6_25, tbt6_26, tbt6_27, tbt6_28, tbt6_29, tbt6_30, tbt6_31,
                      tbt6_32, tbt6_33, tbt6_34, tbt6_35, tbt6_36, tbt6_37, tbt6_38, tbt6_39,
                      tbt6_40, tbt6_41, tbt6_42, tbt6_43, tbt6_44, tbt6_45, tbt6_46, tbt6_47,
                      tbt6_48, tbt6_49, tbt6_50, tbt6_51, tbt6_52, tbt6_53, tbt6_54, tbt6_55,
                      tbt6_56, tbt6_57, tbt6_58, tbt6_59, tbt6_60, tbt6_61, tbt6_62, tbt6_63;
   reg [1:0]          tbt7_0,  tbt7_1,  tbt7_2,  tbt7_3,  tbt7_4,  tbt7_5,  tbt7_6,  tbt7_7, 
                      tbt7_8,  tbt7_9,  tbt7_10, tbt7_11, tbt7_12, tbt7_13, tbt7_14, tbt7_15,
                      tbt7_16, tbt7_17, tbt7_18, tbt7_19, tbt7_20, tbt7_21, tbt7_22, tbt7_23,
                      tbt7_24, tbt7_25, tbt7_26, tbt7_27, tbt7_28, tbt7_29, tbt7_30, tbt7_31,
                      tbt7_32, tbt7_33, tbt7_34, tbt7_35, tbt7_36, tbt7_37, tbt7_38, tbt7_39,
                      tbt7_40, tbt7_41, tbt7_42, tbt7_43, tbt7_44, tbt7_45, tbt7_46, tbt7_47,
                      tbt7_48, tbt7_49, tbt7_50, tbt7_51, tbt7_52, tbt7_53, tbt7_54, tbt7_55,
                      tbt7_56, tbt7_57, tbt7_58, tbt7_59, tbt7_60, tbt7_61, tbt7_62, tbt7_63; 
   

   // state Machine counter
   reg [4:0] stateCnt;
   always @(posedge clk)
     begin
        //if (reset || symEn) begin
        if (reset) begin
           stateCnt <= 0;
        end
        else if (symEnEven && symEn) begin
           stateCnt <= 0;
        end
        else begin
           if (stateCnt < TB_DEPTH)
             if (!symEnEven && symEn) begin // bump up the counter twice when mid symEn shows up. 
                stateCnt <= stateCnt+2;
             end
             else begin // normally, increment enver clock 
                stateCnt <= stateCnt+1;
             end
           else begin // stay in the state
             stateCnt <= stateCnt;
           end
        end
     end
   // 3bits x 64 states trace-back shift-register
   always @(posedge clk)
     begin
        if (reset) begin
           //reset the whole traceback table to all zeroes
           tbt0_0 <= 0;  tbt0_1 <= 0;  tbt0_2 <= 0;  tbt0_3 <= 0;  tbt0_4 <= 0;  tbt0_5 <= 0;  tbt0_6 <= 0;  tbt0_7 <= 0; 
           tbt0_8 <= 0;  tbt0_9 <= 0;  tbt0_10 <= 0; tbt0_11 <= 0; tbt0_12 <= 0; tbt0_13 <= 0; tbt0_14 <= 0; tbt0_15 <= 0;
           tbt0_16 <= 0; tbt0_17 <= 0; tbt0_18 <= 0; tbt0_19 <= 0; tbt0_20 <= 0; tbt0_21 <= 0; tbt0_22 <= 0; tbt0_23 <= 0;
           tbt0_24 <= 0; tbt0_25 <= 0; tbt0_26 <= 0; tbt0_27 <= 0; tbt0_28 <= 0; tbt0_29 <= 0; tbt0_30 <= 0; tbt0_31 <= 0;
           tbt0_32 <= 0; tbt0_33 <= 0; tbt0_34 <= 0; tbt0_35 <= 0; tbt0_36 <= 0; tbt0_37 <= 0; tbt0_38 <= 0; tbt0_39 <= 0;
           tbt0_40 <= 0; tbt0_41 <= 0; tbt0_42 <= 0; tbt0_43 <= 0; tbt0_44 <= 0; tbt0_45 <= 0; tbt0_46 <= 0; tbt0_47 <= 0;
           tbt0_48 <= 0; tbt0_49 <= 0; tbt0_50 <= 0; tbt0_51 <= 0; tbt0_52 <= 0; tbt0_53 <= 0; tbt0_54 <= 0; tbt0_55 <= 0;
           tbt0_56 <= 0; tbt0_57 <= 0; tbt0_58 <= 0; tbt0_59 <= 0; tbt0_60 <= 0; tbt0_61 <= 0; tbt0_62 <= 0; tbt0_63 <= 0;

           tbt1_0 <= 0;  tbt1_1 <= 0;  tbt1_2 <= 0;  tbt1_3 <= 0;  tbt1_4 <= 0;  tbt1_5 <= 0;  tbt1_6 <= 0;  tbt1_7 <= 0; 
           tbt1_8 <= 0;  tbt1_9 <= 0;  tbt1_10 <= 0; tbt1_11 <= 0; tbt1_12 <= 0; tbt1_13 <= 0; tbt1_14 <= 0; tbt1_15 <= 0;
           tbt1_16 <= 0; tbt1_17 <= 0; tbt1_18 <= 0; tbt1_19 <= 0; tbt1_20 <= 0; tbt1_21 <= 0; tbt1_22 <= 0; tbt1_23 <= 0;
           tbt1_24 <= 0; tbt1_25 <= 0; tbt1_26 <= 0; tbt1_27 <= 0; tbt1_28 <= 0; tbt1_29 <= 0; tbt1_30 <= 0; tbt1_31 <= 0;
           tbt1_32 <= 0; tbt1_33 <= 0; tbt1_34 <= 0; tbt1_35 <= 0; tbt1_36 <= 0; tbt1_37 <= 0; tbt1_38 <= 0; tbt1_39 <= 0;
           tbt1_40 <= 0; tbt1_41 <= 0; tbt1_42 <= 0; tbt1_43 <= 0; tbt1_44 <= 0; tbt1_45 <= 0; tbt1_46 <= 0; tbt1_47 <= 0;
           tbt1_48 <= 0; tbt1_49 <= 0; tbt1_50 <= 0; tbt1_51 <= 0; tbt1_52 <= 0; tbt1_53 <= 0; tbt1_54 <= 0; tbt1_55 <= 0;
           tbt1_56 <= 0; tbt1_57 <= 0; tbt1_58 <= 0; tbt1_59 <= 0; tbt1_60 <= 0; tbt1_61 <= 0; tbt1_62 <= 0; tbt1_63 <= 0;

           tbt2_0 <= 0;  tbt2_1 <= 0;  tbt2_2 <= 0;  tbt2_3 <= 0;  tbt2_4 <= 0;  tbt2_5 <= 0;  tbt2_6 <= 0;  tbt2_7 <= 0; 
           tbt2_8 <= 0;  tbt2_9 <= 0;  tbt2_10 <= 0; tbt2_11 <= 0; tbt2_12 <= 0; tbt2_13 <= 0; tbt2_14 <= 0; tbt2_15 <= 0;
           tbt2_16 <= 0; tbt2_17 <= 0; tbt2_18 <= 0; tbt2_19 <= 0; tbt2_20 <= 0; tbt2_21 <= 0; tbt2_22 <= 0; tbt2_23 <= 0;
           tbt2_24 <= 0; tbt2_25 <= 0; tbt2_26 <= 0; tbt2_27 <= 0; tbt2_28 <= 0; tbt2_29 <= 0; tbt2_30 <= 0; tbt2_31 <= 0;
           tbt2_32 <= 0; tbt2_33 <= 0; tbt2_34 <= 0; tbt2_35 <= 0; tbt2_36 <= 0; tbt2_37 <= 0; tbt2_38 <= 0; tbt2_39 <= 0;
           tbt2_40 <= 0; tbt2_41 <= 0; tbt2_42 <= 0; tbt2_43 <= 0; tbt2_44 <= 0; tbt2_45 <= 0; tbt2_46 <= 0; tbt2_47 <= 0;
           tbt2_48 <= 0; tbt2_49 <= 0; tbt2_50 <= 0; tbt2_51 <= 0; tbt2_52 <= 0; tbt2_53 <= 0; tbt2_54 <= 0; tbt2_55 <= 0;
           tbt2_56 <= 0; tbt2_57 <= 0; tbt2_58 <= 0; tbt2_59 <= 0; tbt2_60 <= 0; tbt2_61 <= 0; tbt2_62 <= 0; tbt2_63 <= 0;
        end 
        else begin
           if (symEn) begin
              //depth=1           depth=2               depth=3               depth=4               depth=5               depth=6               depth=7               depth=8            
              tbt0_0  <= sel0 ;   tbt1_0  <= tbt0_0 ;   tbt2_0  <= tbt1_0 ;   tbt3_0  <= tbt2_0 ;   tbt4_0  <= tbt3_0 ;   tbt5_0  <= tbt4_0 ;   tbt6_0  <= tbt5_0 ;   tbt7_0  <= tbt6_0 ;
              tbt0_1  <= sel1 ;   tbt1_1  <= tbt0_1 ;   tbt2_1  <= tbt1_1 ;   tbt3_1  <= tbt2_1 ;   tbt4_1  <= tbt3_1 ;   tbt5_1  <= tbt4_1 ;   tbt6_1  <= tbt5_1 ;   tbt7_1  <= tbt6_1 ;
              tbt0_2  <= sel2 ;   tbt1_2  <= tbt0_2 ;   tbt2_2  <= tbt1_2 ;   tbt3_2  <= tbt2_2 ;   tbt4_2  <= tbt3_2 ;   tbt5_2  <= tbt4_2 ;   tbt6_2  <= tbt5_2 ;   tbt7_2  <= tbt6_2 ;
              tbt0_3  <= sel3 ;   tbt1_3  <= tbt0_3 ;   tbt2_3  <= tbt1_3 ;   tbt3_3  <= tbt2_3 ;   tbt4_3  <= tbt3_3 ;   tbt5_3  <= tbt4_3 ;   tbt6_3  <= tbt5_3 ;   tbt7_3  <= tbt6_3 ;
              tbt0_4  <= sel4 ;   tbt1_4  <= tbt0_4 ;   tbt2_4  <= tbt1_4 ;   tbt3_4  <= tbt2_4 ;   tbt4_4  <= tbt3_4 ;   tbt5_4  <= tbt4_4 ;   tbt6_4  <= tbt5_4 ;   tbt7_4  <= tbt6_4 ;
              tbt0_5  <= sel5 ;   tbt1_5  <= tbt0_5 ;   tbt2_5  <= tbt1_5 ;   tbt3_5  <= tbt2_5 ;   tbt4_5  <= tbt3_5 ;   tbt5_5  <= tbt4_5 ;   tbt6_5  <= tbt5_5 ;   tbt7_5  <= tbt6_5 ;
              tbt0_6  <= sel6 ;   tbt1_6  <= tbt0_6 ;   tbt2_6  <= tbt1_6 ;   tbt3_6  <= tbt2_6 ;   tbt4_6  <= tbt3_6 ;   tbt5_6  <= tbt4_6 ;   tbt6_6  <= tbt5_6 ;   tbt7_6  <= tbt6_6 ;
              tbt0_7  <= sel7 ;   tbt1_7  <= tbt0_7 ;   tbt2_7  <= tbt1_7 ;   tbt3_7  <= tbt2_7 ;   tbt4_7  <= tbt3_7 ;   tbt5_7  <= tbt4_7 ;   tbt6_7  <= tbt5_7 ;   tbt7_7  <= tbt6_7 ;
              tbt0_8  <= sel8 ;   tbt1_8  <= tbt0_8 ;   tbt2_8  <= tbt1_8 ;   tbt3_8  <= tbt2_8 ;   tbt4_8  <= tbt3_8 ;   tbt5_8  <= tbt4_8 ;   tbt6_8  <= tbt5_8 ;   tbt7_8  <= tbt6_8 ;
              tbt0_9  <= sel9 ;   tbt1_9  <= tbt0_9 ;   tbt2_9  <= tbt1_9 ;   tbt3_9  <= tbt2_9 ;   tbt4_9  <= tbt3_9 ;   tbt5_9  <= tbt4_9 ;   tbt6_9  <= tbt5_9 ;   tbt7_9  <= tbt6_9 ;
              tbt0_10 <= sel10;   tbt1_10 <= tbt0_10;   tbt2_10 <= tbt1_10;   tbt3_10 <= tbt2_10;   tbt4_10 <= tbt3_10;   tbt5_10 <= tbt4_10;   tbt6_10 <= tbt5_10;   tbt7_10 <= tbt6_10;
              tbt0_11 <= sel11;   tbt1_11 <= tbt0_11;   tbt2_11 <= tbt1_11;   tbt3_11 <= tbt2_11;   tbt4_11 <= tbt3_11;   tbt5_11 <= tbt4_11;   tbt6_11 <= tbt5_11;   tbt7_11 <= tbt6_11;
              tbt0_12 <= sel12;   tbt1_12 <= tbt0_12;   tbt2_12 <= tbt1_12;   tbt3_12 <= tbt2_12;   tbt4_12 <= tbt3_12;   tbt5_12 <= tbt4_12;   tbt6_12 <= tbt5_12;   tbt7_12 <= tbt6_12;
              tbt0_13 <= sel13;   tbt1_13 <= tbt0_13;   tbt2_13 <= tbt1_13;   tbt3_13 <= tbt2_13;   tbt4_13 <= tbt3_13;   tbt5_13 <= tbt4_13;   tbt6_13 <= tbt5_13;   tbt7_13 <= tbt6_13;
              tbt0_14 <= sel14;   tbt1_14 <= tbt0_14;   tbt2_14 <= tbt1_14;   tbt3_14 <= tbt2_14;   tbt4_14 <= tbt3_14;   tbt5_14 <= tbt4_14;   tbt6_14 <= tbt5_14;   tbt7_14 <= tbt6_14;
              tbt0_15 <= sel15;   tbt1_15 <= tbt0_15;   tbt2_15 <= tbt1_15;   tbt3_15 <= tbt2_15;   tbt4_15 <= tbt3_15;   tbt5_15 <= tbt4_15;   tbt6_15 <= tbt5_15;   tbt7_15 <= tbt6_15;
              tbt0_16 <= sel16;   tbt1_16 <= tbt0_16;   tbt2_16 <= tbt1_16;   tbt3_16 <= tbt2_16;   tbt4_16 <= tbt3_16;   tbt5_16 <= tbt4_16;   tbt6_16 <= tbt5_16;   tbt7_16 <= tbt6_16;
              tbt0_17 <= sel17;   tbt1_17 <= tbt0_17;   tbt2_17 <= tbt1_17;   tbt3_17 <= tbt2_17;   tbt4_17 <= tbt3_17;   tbt5_17 <= tbt4_17;   tbt6_17 <= tbt5_17;   tbt7_17 <= tbt6_17;
              tbt0_18 <= sel18;   tbt1_18 <= tbt0_18;   tbt2_18 <= tbt1_18;   tbt3_18 <= tbt2_18;   tbt4_18 <= tbt3_18;   tbt5_18 <= tbt4_18;   tbt6_18 <= tbt5_18;   tbt7_18 <= tbt6_18;
              tbt0_19 <= sel19;   tbt1_19 <= tbt0_19;   tbt2_19 <= tbt1_19;   tbt3_19 <= tbt2_19;   tbt4_19 <= tbt3_19;   tbt5_19 <= tbt4_19;   tbt6_19 <= tbt5_19;   tbt7_19 <= tbt6_19;
              tbt0_20 <= sel20;   tbt1_20 <= tbt0_20;   tbt2_20 <= tbt1_20;   tbt3_20 <= tbt2_20;   tbt4_20 <= tbt3_20;   tbt5_20 <= tbt4_20;   tbt6_20 <= tbt5_20;   tbt7_20 <= tbt6_20;
              tbt0_21 <= sel21;   tbt1_21 <= tbt0_21;   tbt2_21 <= tbt1_21;   tbt3_21 <= tbt2_21;   tbt4_21 <= tbt3_21;   tbt5_21 <= tbt4_21;   tbt6_21 <= tbt5_21;   tbt7_21 <= tbt6_21;
              tbt0_22 <= sel22;   tbt1_22 <= tbt0_22;   tbt2_22 <= tbt1_22;   tbt3_22 <= tbt2_22;   tbt4_22 <= tbt3_22;   tbt5_22 <= tbt4_22;   tbt6_22 <= tbt5_22;   tbt7_22 <= tbt6_22;
              tbt0_23 <= sel23;   tbt1_23 <= tbt0_23;   tbt2_23 <= tbt1_23;   tbt3_23 <= tbt2_23;   tbt4_23 <= tbt3_23;   tbt5_23 <= tbt4_23;   tbt6_23 <= tbt5_23;   tbt7_23 <= tbt6_23;
              tbt0_24 <= sel24;   tbt1_24 <= tbt0_24;   tbt2_24 <= tbt1_24;   tbt3_24 <= tbt2_24;   tbt4_24 <= tbt3_24;   tbt5_24 <= tbt4_24;   tbt6_24 <= tbt5_24;   tbt7_24 <= tbt6_24;
              tbt0_25 <= sel25;   tbt1_25 <= tbt0_25;   tbt2_25 <= tbt1_25;   tbt3_25 <= tbt2_25;   tbt4_25 <= tbt3_25;   tbt5_25 <= tbt4_25;   tbt6_25 <= tbt5_25;   tbt7_25 <= tbt6_25;
              tbt0_26 <= sel26;   tbt1_26 <= tbt0_26;   tbt2_26 <= tbt1_26;   tbt3_26 <= tbt2_26;   tbt4_26 <= tbt3_26;   tbt5_26 <= tbt4_26;   tbt6_26 <= tbt5_26;   tbt7_26 <= tbt6_26;
              tbt0_27 <= sel27;   tbt1_27 <= tbt0_27;   tbt2_27 <= tbt1_27;   tbt3_27 <= tbt2_27;   tbt4_27 <= tbt3_27;   tbt5_27 <= tbt4_27;   tbt6_27 <= tbt5_27;   tbt7_27 <= tbt6_27;
              tbt0_28 <= sel28;   tbt1_28 <= tbt0_28;   tbt2_28 <= tbt1_28;   tbt3_28 <= tbt2_28;   tbt4_28 <= tbt3_28;   tbt5_28 <= tbt4_28;   tbt6_28 <= tbt5_28;   tbt7_28 <= tbt6_28;
              tbt0_29 <= sel29;   tbt1_29 <= tbt0_29;   tbt2_29 <= tbt1_29;   tbt3_29 <= tbt2_29;   tbt4_29 <= tbt3_29;   tbt5_29 <= tbt4_29;   tbt6_29 <= tbt5_29;   tbt7_29 <= tbt6_29;
              tbt0_30 <= sel30;   tbt1_30 <= tbt0_30;   tbt2_30 <= tbt1_30;   tbt3_30 <= tbt2_30;   tbt4_30 <= tbt3_30;   tbt5_30 <= tbt4_30;   tbt6_30 <= tbt5_30;   tbt7_30 <= tbt6_30;
              tbt0_31 <= sel31;   tbt1_31 <= tbt0_31;   tbt2_31 <= tbt1_31;   tbt3_31 <= tbt2_31;   tbt4_31 <= tbt3_31;   tbt5_31 <= tbt4_31;   tbt6_31 <= tbt5_31;   tbt7_31 <= tbt6_31;
              tbt0_32 <= sel32;   tbt1_32 <= tbt0_32;   tbt2_32 <= tbt1_32;   tbt3_32 <= tbt2_32;   tbt4_32 <= tbt3_32;   tbt5_32 <= tbt4_32;   tbt6_32 <= tbt5_32;   tbt7_32 <= tbt6_32;
              tbt0_33 <= sel33;   tbt1_33 <= tbt0_33;   tbt2_33 <= tbt1_33;   tbt3_33 <= tbt2_33;   tbt4_33 <= tbt3_33;   tbt5_33 <= tbt4_33;   tbt6_33 <= tbt5_33;   tbt7_33 <= tbt6_33;
              tbt0_34 <= sel34;   tbt1_34 <= tbt0_34;   tbt2_34 <= tbt1_34;   tbt3_34 <= tbt2_34;   tbt4_34 <= tbt3_34;   tbt5_34 <= tbt4_34;   tbt6_34 <= tbt5_34;   tbt7_34 <= tbt6_34;
              tbt0_35 <= sel35;   tbt1_35 <= tbt0_35;   tbt2_35 <= tbt1_35;   tbt3_35 <= tbt2_35;   tbt4_35 <= tbt3_35;   tbt5_35 <= tbt4_35;   tbt6_35 <= tbt5_35;   tbt7_35 <= tbt6_35;
              tbt0_36 <= sel36;   tbt1_36 <= tbt0_36;   tbt2_36 <= tbt1_36;   tbt3_36 <= tbt2_36;   tbt4_36 <= tbt3_36;   tbt5_36 <= tbt4_36;   tbt6_36 <= tbt5_36;   tbt7_36 <= tbt6_36;
              tbt0_37 <= sel37;   tbt1_37 <= tbt0_37;   tbt2_37 <= tbt1_37;   tbt3_37 <= tbt2_37;   tbt4_37 <= tbt3_37;   tbt5_37 <= tbt4_37;   tbt6_37 <= tbt5_37;   tbt7_37 <= tbt6_37;
              tbt0_38 <= sel38;   tbt1_38 <= tbt0_38;   tbt2_38 <= tbt1_38;   tbt3_38 <= tbt2_38;   tbt4_38 <= tbt3_38;   tbt5_38 <= tbt4_38;   tbt6_38 <= tbt5_38;   tbt7_38 <= tbt6_38;
              tbt0_39 <= sel39;   tbt1_39 <= tbt0_39;   tbt2_39 <= tbt1_39;   tbt3_39 <= tbt2_39;   tbt4_39 <= tbt3_39;   tbt5_39 <= tbt4_39;   tbt6_39 <= tbt5_39;   tbt7_39 <= tbt6_39;
              tbt0_40 <= sel40;   tbt1_40 <= tbt0_40;   tbt2_40 <= tbt1_40;   tbt3_40 <= tbt2_40;   tbt4_40 <= tbt3_40;   tbt5_40 <= tbt4_40;   tbt6_40 <= tbt5_40;   tbt7_40 <= tbt6_40;
              tbt0_41 <= sel41;   tbt1_41 <= tbt0_41;   tbt2_41 <= tbt1_41;   tbt3_41 <= tbt2_41;   tbt4_41 <= tbt3_41;   tbt5_41 <= tbt4_41;   tbt6_41 <= tbt5_41;   tbt7_41 <= tbt6_41;
              tbt0_42 <= sel42;   tbt1_42 <= tbt0_42;   tbt2_42 <= tbt1_42;   tbt3_42 <= tbt2_42;   tbt4_42 <= tbt3_42;   tbt5_42 <= tbt4_42;   tbt6_42 <= tbt5_42;   tbt7_42 <= tbt6_42;
              tbt0_43 <= sel43;   tbt1_43 <= tbt0_43;   tbt2_43 <= tbt1_43;   tbt3_43 <= tbt2_43;   tbt4_43 <= tbt3_43;   tbt5_43 <= tbt4_43;   tbt6_43 <= tbt5_43;   tbt7_43 <= tbt6_43;
              tbt0_44 <= sel44;   tbt1_44 <= tbt0_44;   tbt2_44 <= tbt1_44;   tbt3_44 <= tbt2_44;   tbt4_44 <= tbt3_44;   tbt5_44 <= tbt4_44;   tbt6_44 <= tbt5_44;   tbt7_44 <= tbt6_44;
              tbt0_45 <= sel45;   tbt1_45 <= tbt0_45;   tbt2_45 <= tbt1_45;   tbt3_45 <= tbt2_45;   tbt4_45 <= tbt3_45;   tbt5_45 <= tbt4_45;   tbt6_45 <= tbt5_45;   tbt7_45 <= tbt6_45;
              tbt0_46 <= sel46;   tbt1_46 <= tbt0_46;   tbt2_46 <= tbt1_46;   tbt3_46 <= tbt2_46;   tbt4_46 <= tbt3_46;   tbt5_46 <= tbt4_46;   tbt6_46 <= tbt5_46;   tbt7_46 <= tbt6_46;
              tbt0_47 <= sel47;   tbt1_47 <= tbt0_47;   tbt2_47 <= tbt1_47;   tbt3_47 <= tbt2_47;   tbt4_47 <= tbt3_47;   tbt5_47 <= tbt4_47;   tbt6_47 <= tbt5_47;   tbt7_47 <= tbt6_47;
              tbt0_48 <= sel48;   tbt1_48 <= tbt0_48;   tbt2_48 <= tbt1_48;   tbt3_48 <= tbt2_48;   tbt4_48 <= tbt3_48;   tbt5_48 <= tbt4_48;   tbt6_48 <= tbt5_48;   tbt7_48 <= tbt6_48;
              tbt0_49 <= sel49;   tbt1_49 <= tbt0_49;   tbt2_49 <= tbt1_49;   tbt3_49 <= tbt2_49;   tbt4_49 <= tbt3_49;   tbt5_49 <= tbt4_49;   tbt6_49 <= tbt5_49;   tbt7_49 <= tbt6_49;
              tbt0_50 <= sel50;   tbt1_50 <= tbt0_50;   tbt2_50 <= tbt1_50;   tbt3_50 <= tbt2_50;   tbt4_50 <= tbt3_50;   tbt5_50 <= tbt4_50;   tbt6_50 <= tbt5_50;   tbt7_50 <= tbt6_50;
              tbt0_51 <= sel51;   tbt1_51 <= tbt0_51;   tbt2_51 <= tbt1_51;   tbt3_51 <= tbt2_51;   tbt4_51 <= tbt3_51;   tbt5_51 <= tbt4_51;   tbt6_51 <= tbt5_51;   tbt7_51 <= tbt6_51;
              tbt0_52 <= sel52;   tbt1_52 <= tbt0_52;   tbt2_52 <= tbt1_52;   tbt3_52 <= tbt2_52;   tbt4_52 <= tbt3_52;   tbt5_52 <= tbt4_52;   tbt6_52 <= tbt5_52;   tbt7_52 <= tbt6_52;
              tbt0_53 <= sel53;   tbt1_53 <= tbt0_53;   tbt2_53 <= tbt1_53;   tbt3_53 <= tbt2_53;   tbt4_53 <= tbt3_53;   tbt5_53 <= tbt4_53;   tbt6_53 <= tbt5_53;   tbt7_53 <= tbt6_53;
              tbt0_54 <= sel54;   tbt1_54 <= tbt0_54;   tbt2_54 <= tbt1_54;   tbt3_54 <= tbt2_54;   tbt4_54 <= tbt3_54;   tbt5_54 <= tbt4_54;   tbt6_54 <= tbt5_54;   tbt7_54 <= tbt6_54;
              tbt0_55 <= sel55;   tbt1_55 <= tbt0_55;   tbt2_55 <= tbt1_55;   tbt3_55 <= tbt2_55;   tbt4_55 <= tbt3_55;   tbt5_55 <= tbt4_55;   tbt6_55 <= tbt5_55;   tbt7_55 <= tbt6_55;
              tbt0_56 <= sel56;   tbt1_56 <= tbt0_56;   tbt2_56 <= tbt1_56;   tbt3_56 <= tbt2_56;   tbt4_56 <= tbt3_56;   tbt5_56 <= tbt4_56;   tbt6_56 <= tbt5_56;   tbt7_56 <= tbt6_56;
              tbt0_57 <= sel57;   tbt1_57 <= tbt0_57;   tbt2_57 <= tbt1_57;   tbt3_57 <= tbt2_57;   tbt4_57 <= tbt3_57;   tbt5_57 <= tbt4_57;   tbt6_57 <= tbt5_57;   tbt7_57 <= tbt6_57;
              tbt0_58 <= sel58;   tbt1_58 <= tbt0_58;   tbt2_58 <= tbt1_58;   tbt3_58 <= tbt2_58;   tbt4_58 <= tbt3_58;   tbt5_58 <= tbt4_58;   tbt6_58 <= tbt5_58;   tbt7_58 <= tbt6_58;
              tbt0_59 <= sel59;   tbt1_59 <= tbt0_59;   tbt2_59 <= tbt1_59;   tbt3_59 <= tbt2_59;   tbt4_59 <= tbt3_59;   tbt5_59 <= tbt4_59;   tbt6_59 <= tbt5_59;   tbt7_59 <= tbt6_59;
              tbt0_60 <= sel60;   tbt1_60 <= tbt0_60;   tbt2_60 <= tbt1_60;   tbt3_60 <= tbt2_60;   tbt4_60 <= tbt3_60;   tbt5_60 <= tbt4_60;   tbt6_60 <= tbt5_60;   tbt7_60 <= tbt6_60;
              tbt0_61 <= sel61;   tbt1_61 <= tbt0_61;   tbt2_61 <= tbt1_61;   tbt3_61 <= tbt2_61;   tbt4_61 <= tbt3_61;   tbt5_61 <= tbt4_61;   tbt6_61 <= tbt5_61;   tbt7_61 <= tbt6_61;
              tbt0_62 <= sel62;   tbt1_62 <= tbt0_62;   tbt2_62 <= tbt1_62;   tbt3_62 <= tbt2_62;   tbt4_62 <= tbt3_62;   tbt5_62 <= tbt4_62;   tbt6_62 <= tbt5_62;   tbt7_62 <= tbt6_62;
              tbt0_63 <= sel63;   tbt1_63 <= tbt0_63;   tbt2_63 <= tbt1_63;   tbt3_63 <= tbt2_63;   tbt4_63 <= tbt3_63;   tbt5_63 <= tbt4_63;   tbt6_63 <= tbt5_63;   tbt7_63 <= tbt6_63;
           end
        end 
     end


   reg symEnEvenToggle;
     always @(posedge clk)
     if (reset) begin
        symEnEvenToggle <= 0;
     end
//     else if (symEn) begin
     else if (symEnEven && symEn) begin
        symEnEvenToggle <= symEnEven;
     end
     else begin
        symEnEvenToggle <= ~symEnEvenToggle;
     end
   
   // Latching the next state 
   reg [5:0]          cState;
   reg [5:0]          nState;
   always @(posedge clk)
     if (reset) begin
        cState <= 0;
     end
     else if (symEnEven && symEn) begin
        cState <= index;
     end
     else begin
        cState <= nState;
     end
        

   always @(symEnEvenToggle or cState[5:2] or decisionTmp)
     begin
        nState[1:0] <= decisionTmp;
        if (symEnEvenToggle) begin
           //nState[5:2] <= cState[5:2]-5*decisionTmp;
           case (decisionTmp) // lookup table implementation of above
             0 : begin nState[5:2] <= cState[5:2]; end 
             1 : begin nState[5:2] <= cState[5:2]-5; end 
             2 : begin nState[5:2] <= cState[5:2]-10; end 
             3 : begin nState[5:2] <= cState[5:2]-15; end
           endcase
        end
        else begin
           //nState[5:2] <= cState[5:2]-4*decisionTmp;
           case (decisionTmp) // lookup table implementation of above
             0 : begin nState[5:2] <= cState[5:2]; end 
             1 : begin nState[5:2] <= cState[5:2]-4; end 
             2 : begin nState[5:2] <= cState[5:2]-8; end 
             3 : begin nState[5:2] <= cState[5:2]-12; end
           endcase
        end
     end 

`define LWK
`ifdef LWK
   reg [1:0]d0 , d1 , d2 , d3 , d4 , d5 , d6 ,  d7 , 
            d8 , d9 , d10, d11, d12, d13, d14,  d15, 
            d16, d17, d18, d19, d20, d21, d22,  d23, 
            d24, d25, d26, d27, d28, d29, d30,  d31, 
            d32, d33, d34, d35, d36, d37, d38,  d39, 
            d40, d41, d42, d43, d44, d45, d46,  d47, 
            d48, d49, d50, d51, d52, d53, d54,  d55, 
            d56, d57, d58, d59, d60, d61, d62,  d63; 
   always @(stateCnt or
            tbt0_0  or tbt0_1  or tbt0_2  or tbt0_3  or tbt0_4  or tbt0_5  or tbt0_6  or tbt0_7  or 
            tbt0_8  or tbt0_9  or tbt0_10 or tbt0_11 or tbt0_12 or tbt0_13 or tbt0_14 or tbt0_15 or 
            tbt0_16 or tbt0_17 or tbt0_18 or tbt0_19 or tbt0_20 or tbt0_21 or tbt0_22 or tbt0_23 or 
            tbt0_24 or tbt0_25 or tbt0_26 or tbt0_27 or tbt0_28 or tbt0_29 or tbt0_30 or tbt0_31 or 
            tbt0_32 or tbt0_33 or tbt0_34 or tbt0_35 or tbt0_36 or tbt0_37 or tbt0_38 or tbt0_39 or 
            tbt0_40 or tbt0_41 or tbt0_42 or tbt0_43 or tbt0_44 or tbt0_45 or tbt0_46 or tbt0_47 or 
            tbt0_48 or tbt0_49 or tbt0_50 or tbt0_51 or tbt0_52 or tbt0_53 or tbt0_54 or tbt0_55 or 
            tbt0_56 or tbt0_57 or tbt0_58 or tbt0_59 or tbt0_60 or tbt0_61 or tbt0_62 or tbt0_63 or 
            tbt1_0  or tbt1_1  or tbt1_2  or tbt1_3  or tbt1_4  or tbt1_5  or tbt1_6  or tbt1_7  or 
            tbt1_8  or tbt1_9  or tbt1_10 or tbt1_11 or tbt1_12 or tbt1_13 or tbt1_14 or tbt1_15 or 
            tbt1_16 or tbt1_17 or tbt1_18 or tbt1_19 or tbt1_20 or tbt1_21 or tbt1_22 or tbt1_23 or 
            tbt1_24 or tbt1_25 or tbt1_26 or tbt1_27 or tbt1_28 or tbt1_29 or tbt1_30 or tbt1_31 or 
            tbt1_32 or tbt1_33 or tbt1_34 or tbt1_35 or tbt1_36 or tbt1_37 or tbt1_38 or tbt1_39 or 
            tbt1_40 or tbt1_41 or tbt1_42 or tbt1_43 or tbt1_44 or tbt1_45 or tbt1_46 or tbt1_47 or 
            tbt1_48 or tbt1_49 or tbt1_50 or tbt1_51 or tbt1_52 or tbt1_53 or tbt1_54 or tbt1_55 or 
            tbt1_56 or tbt1_57 or tbt1_58 or tbt1_59 or tbt1_60 or tbt1_61 or tbt1_62 or tbt1_63 or
            tbt2_0  or tbt2_1  or tbt2_2  or tbt2_3  or tbt2_4  or tbt2_5  or tbt2_6  or tbt2_7  or 
            tbt2_8  or tbt2_9  or tbt2_10 or tbt2_11 or tbt2_12 or tbt2_13 or tbt2_14 or tbt2_15 or 
            tbt2_16 or tbt2_17 or tbt2_18 or tbt2_19 or tbt2_20 or tbt2_21 or tbt2_22 or tbt2_23 or 
            tbt2_24 or tbt2_25 or tbt2_26 or tbt2_27 or tbt2_28 or tbt2_29 or tbt2_30 or tbt2_31 or 
            tbt2_32 or tbt2_33 or tbt2_34 or tbt2_35 or tbt2_36 or tbt2_37 or tbt2_38 or tbt2_39 or 
            tbt2_40 or tbt2_41 or tbt2_42 or tbt2_43 or tbt2_44 or tbt2_45 or tbt2_46 or tbt2_47 or 
            tbt2_48 or tbt2_49 or tbt2_50 or tbt2_51 or tbt2_52 or tbt2_53 or tbt2_54 or tbt2_55 or 
            tbt2_56 or tbt2_57 or tbt2_58 or tbt2_59 or tbt2_60 or tbt2_61 or tbt2_62 or tbt2_63 or
            tbt3_0  or tbt3_1  or tbt3_2  or tbt3_3  or tbt3_4  or tbt3_5  or tbt3_6  or tbt3_7  or 
            tbt3_8  or tbt3_9  or tbt3_10 or tbt3_11 or tbt3_12 or tbt3_13 or tbt3_14 or tbt3_15 or 
            tbt3_16 or tbt3_17 or tbt3_18 or tbt3_19 or tbt3_20 or tbt3_21 or tbt3_22 or tbt3_23 or 
            tbt3_24 or tbt3_25 or tbt3_26 or tbt3_27 or tbt3_28 or tbt3_29 or tbt3_30 or tbt3_31 or 
            tbt3_32 or tbt3_33 or tbt3_34 or tbt3_35 or tbt3_36 or tbt3_37 or tbt3_38 or tbt3_39 or 
            tbt3_40 or tbt3_41 or tbt3_42 or tbt3_43 or tbt3_44 or tbt3_45 or tbt3_46 or tbt3_47 or 
            tbt3_48 or tbt3_49 or tbt3_50 or tbt3_51 or tbt3_52 or tbt3_53 or tbt3_54 or tbt3_55 or 
            tbt3_56 or tbt3_57 or tbt3_58 or tbt3_59 or tbt3_60 or tbt3_61 or tbt3_62 or tbt3_63 or 
            tbt4_0  or tbt4_1  or tbt4_2  or tbt4_3  or tbt4_4  or tbt4_5  or tbt4_6  or tbt4_7  or 
            tbt4_8  or tbt4_9  or tbt4_10 or tbt4_11 or tbt4_12 or tbt4_13 or tbt4_14 or tbt4_15 or 
            tbt4_16 or tbt4_17 or tbt4_18 or tbt4_19 or tbt4_20 or tbt4_21 or tbt4_22 or tbt4_23 or 
            tbt4_24 or tbt4_25 or tbt4_26 or tbt4_27 or tbt4_28 or tbt4_29 or tbt4_30 or tbt4_31 or 
            tbt4_32 or tbt4_33 or tbt4_34 or tbt4_35 or tbt4_36 or tbt4_37 or tbt4_38 or tbt4_39 or 
            tbt4_40 or tbt4_41 or tbt4_42 or tbt4_43 or tbt4_44 or tbt4_45 or tbt4_46 or tbt4_47 or 
            tbt4_48 or tbt4_49 or tbt4_50 or tbt4_51 or tbt4_52 or tbt4_53 or tbt4_54 or tbt4_55 or 
            tbt4_56 or tbt4_57 or tbt4_58 or tbt4_59 or tbt4_60 or tbt4_61 or tbt4_62 or tbt4_63 or
            tbt5_0  or tbt5_1  or tbt5_2  or tbt5_3  or tbt5_4  or tbt5_5  or tbt5_6  or tbt5_7  or 
            tbt5_8  or tbt5_9  or tbt5_10 or tbt5_11 or tbt5_12 or tbt5_13 or tbt5_14 or tbt5_15 or 
            tbt5_16 or tbt5_17 or tbt5_18 or tbt5_19 or tbt5_20 or tbt5_21 or tbt5_22 or tbt5_23 or 
            tbt5_24 or tbt5_25 or tbt5_26 or tbt5_27 or tbt5_28 or tbt5_29 or tbt5_30 or tbt5_31 or 
            tbt5_32 or tbt5_33 or tbt5_34 or tbt5_35 or tbt5_36 or tbt5_37 or tbt5_38 or tbt5_39 or 
            tbt5_40 or tbt5_41 or tbt5_42 or tbt5_43 or tbt5_44 or tbt5_45 or tbt5_46 or tbt5_47 or 
            tbt5_48 or tbt5_49 or tbt5_50 or tbt5_51 or tbt5_52 or tbt5_53 or tbt5_54 or tbt5_55 or 
            tbt5_56 or tbt5_57 or tbt5_58 or tbt5_59 or tbt5_60 or tbt5_61 or tbt5_62 or tbt5_63 or
            tbt6_0  or tbt6_1  or tbt6_2  or tbt6_3  or tbt6_4  or tbt6_5  or tbt6_6  or tbt6_7  or 
            tbt6_8  or tbt6_9  or tbt6_10 or tbt6_11 or tbt6_12 or tbt6_13 or tbt6_14 or tbt6_15 or 
            tbt6_16 or tbt6_17 or tbt6_18 or tbt6_19 or tbt6_20 or tbt6_21 or tbt6_22 or tbt6_23 or 
            tbt6_24 or tbt6_25 or tbt6_26 or tbt6_27 or tbt6_28 or tbt6_29 or tbt6_30 or tbt6_31 or 
            tbt6_32 or tbt6_33 or tbt6_34 or tbt6_35 or tbt6_36 or tbt6_37 or tbt6_38 or tbt6_39 or 
            tbt6_40 or tbt6_41 or tbt6_42 or tbt6_43 or tbt6_44 or tbt6_45 or tbt6_46 or tbt6_47 or 
            tbt6_48 or tbt6_49 or tbt6_50 or tbt6_51 or tbt6_52 or tbt6_53 or tbt6_54 or tbt6_55 or 
            tbt6_56 or tbt6_57 or tbt6_58 or tbt6_59 or tbt6_60 or tbt6_61 or tbt6_62 or tbt6_63 or 
            tbt7_0  or tbt7_1  or tbt7_2  or tbt7_3  or tbt7_4  or tbt7_5  or tbt7_6  or tbt7_7  or 
            tbt7_8  or tbt7_9  or tbt7_10 or tbt7_11 or tbt7_12 or tbt7_13 or tbt7_14 or tbt7_15 or 
            tbt7_16 or tbt7_17 or tbt7_18 or tbt7_19 or tbt7_20 or tbt7_21 or tbt7_22 or tbt7_23 or 
            tbt7_24 or tbt7_25 or tbt7_26 or tbt7_27 or tbt7_28 or tbt7_29 or tbt7_30 or tbt7_31 or 
            tbt7_32 or tbt7_33 or tbt7_34 or tbt7_35 or tbt7_36 or tbt7_37 or tbt7_38 or tbt7_39 or 
            tbt7_40 or tbt7_41 or tbt7_42 or tbt7_43 or tbt7_44 or tbt7_45 or tbt7_46 or tbt7_47 or 
            tbt7_48 or tbt7_49 or tbt7_50 or tbt7_51 or tbt7_52 or tbt7_53 or tbt7_54 or tbt7_55 or 
            tbt7_56 or tbt7_57 or tbt7_58 or tbt7_59 or tbt7_60 or tbt7_61 or tbt7_62 or tbt7_63) begin
    case (stateCnt)
        0:  begin
            d0  <= 2'bxx;  d1  <= 2'bxx;  d2  <= 2'bxx;  d3  <= 2'bxx;
            d4  <= 2'bxx;  d5  <= 2'bxx;  d6  <= 2'bxx;  d7  <= 2'bxx;
            d8  <= 2'bxx;  d9  <= 2'bxx;  d10 <= 2'bxx;  d11 <= 2'bxx;
            d12 <= 2'bxx;  d13 <= 2'bxx;  d14 <= 2'bxx;  d15 <= 2'bxx;
            d16 <= 2'bxx;  d17 <= 2'bxx;  d18 <= 2'bxx;  d19 <= 2'bxx;
            d20 <= 2'bxx;  d21 <= 2'bxx;  d22 <= 2'bxx;  d23 <= 2'bxx;
            d24 <= 2'bxx;  d25 <= 2'bxx;  d26 <= 2'bxx;  d27 <= 2'bxx;
            d28 <= 2'bxx;  d29 <= 2'bxx;  d30 <= 2'bxx;  d31 <= 2'bxx;
            d32 <= 2'bxx;  d33 <= 2'bxx;  d34 <= 2'bxx;  d35 <= 2'bxx;
            d36 <= 2'bxx;  d37 <= 2'bxx;  d38 <= 2'bxx;  d39 <= 2'bxx;
            d40 <= 2'bxx;  d41 <= 2'bxx;  d42 <= 2'bxx;  d43 <= 2'bxx;
            d44 <= 2'bxx;  d45 <= 2'bxx;  d46 <= 2'bxx;  d47 <= 2'bxx;
            d48 <= 2'bxx;  d49 <= 2'bxx;  d50 <= 2'bxx;  d51 <= 2'bxx;
            d52 <= 2'bxx;  d53 <= 2'bxx;  d54 <= 2'bxx;  d55 <= 2'bxx;
            d56 <= 2'bxx;  d57 <= 2'bxx;  d58 <= 2'bxx;  d59 <= 2'bxx;
            d60 <= 2'bxx;  d61 <= 2'bxx;  d62 <= 2'bxx;  d63 <= 2'bxx;
            end
        1:  begin
            d0  <= tbt0_0 ;  d1  <= tbt0_1 ;  d2  <= tbt0_2 ;  d3  <= tbt0_3 ;
            d4  <= tbt0_4 ;  d5  <= tbt0_5 ;  d6  <= tbt0_6 ;  d7  <= tbt0_7 ;
            d8  <= tbt0_8 ;  d9  <= tbt0_9 ;  d10 <= tbt0_10;  d11 <= tbt0_11;
            d12 <= tbt0_12;  d13 <= tbt0_13;  d14 <= tbt0_14;  d15 <= tbt0_15;
            d16 <= tbt0_16;  d17 <= tbt0_17;  d18 <= tbt0_18;  d19 <= tbt0_19;
            d20 <= tbt0_20;  d21 <= tbt0_21;  d22 <= tbt0_22;  d23 <= tbt0_23;
            d24 <= tbt0_24;  d25 <= tbt0_25;  d26 <= tbt0_26;  d27 <= tbt0_27;
            d28 <= tbt0_28;  d29 <= tbt0_29;  d30 <= tbt0_30;  d31 <= tbt0_31;
            d32 <= tbt0_32;  d33 <= tbt0_33;  d34 <= tbt0_34;  d35 <= tbt0_35;
            d36 <= tbt0_36;  d37 <= tbt0_37;  d38 <= tbt0_38;  d39 <= tbt0_39;
            d40 <= tbt0_40;  d41 <= tbt0_41;  d42 <= tbt0_42;  d43 <= tbt0_43;
            d44 <= tbt0_44;  d45 <= tbt0_45;  d46 <= tbt0_46;  d47 <= tbt0_47;
            d48 <= tbt0_48;  d49 <= tbt0_49;  d50 <= tbt0_50;  d51 <= tbt0_51;
            d52 <= tbt0_52;  d53 <= tbt0_53;  d54 <= tbt0_54;  d55 <= tbt0_55;
            d56 <= tbt0_56;  d57 <= tbt0_57;  d58 <= tbt0_58;  d59 <= tbt0_59;
            d60 <= tbt0_60;  d61 <= tbt0_61;  d62 <= tbt0_62;  d63 <= tbt0_63;
            end
        2:  begin
            d0  <= tbt1_0 ;  d1  <= tbt1_1 ;  d2  <= tbt1_2 ;  d3  <= tbt1_3 ;
            d4  <= tbt1_4 ;  d5  <= tbt1_5 ;  d6  <= tbt1_6 ;  d7  <= tbt1_7 ;
            d8  <= tbt1_8 ;  d9  <= tbt1_9 ;  d10 <= tbt1_10;  d11 <= tbt1_11;
            d12 <= tbt1_12;  d13 <= tbt1_13;  d14 <= tbt1_14;  d15 <= tbt1_15;
            d16 <= tbt1_16;  d17 <= tbt1_17;  d18 <= tbt1_18;  d19 <= tbt1_19;
            d20 <= tbt1_20;  d21 <= tbt1_21;  d22 <= tbt1_22;  d23 <= tbt1_23;
            d24 <= tbt1_24;  d25 <= tbt1_25;  d26 <= tbt1_26;  d27 <= tbt1_27;
            d28 <= tbt1_28;  d29 <= tbt1_29;  d30 <= tbt1_30;  d31 <= tbt1_31;
            d32 <= tbt1_32;  d33 <= tbt1_33;  d34 <= tbt1_34;  d35 <= tbt1_35;
            d36 <= tbt1_36;  d37 <= tbt1_37;  d38 <= tbt1_38;  d39 <= tbt1_39;
            d40 <= tbt1_40;  d41 <= tbt1_41;  d42 <= tbt1_42;  d43 <= tbt1_43;
            d44 <= tbt1_44;  d45 <= tbt1_45;  d46 <= tbt1_46;  d47 <= tbt1_47;
            d48 <= tbt1_48;  d49 <= tbt1_49;  d50 <= tbt1_50;  d51 <= tbt1_51;
            d52 <= tbt1_52;  d53 <= tbt1_53;  d54 <= tbt1_54;  d55 <= tbt1_55;
            d56 <= tbt1_56;  d57 <= tbt1_57;  d58 <= tbt1_58;  d59 <= tbt1_59;
            d60 <= tbt1_60;  d61 <= tbt1_61;  d62 <= tbt1_62;  d63 <= tbt1_63;
            end
        3:  begin
            d0  <= tbt2_0 ;  d1  <= tbt2_1 ;  d2  <= tbt2_2 ;  d3  <= tbt2_3 ;
            d4  <= tbt2_4 ;  d5  <= tbt2_5 ;  d6  <= tbt2_6 ;  d7  <= tbt2_7 ;
            d8  <= tbt2_8 ;  d9  <= tbt2_9 ;  d10 <= tbt2_10;  d11 <= tbt2_11;
            d12 <= tbt2_12;  d13 <= tbt2_13;  d14 <= tbt2_14;  d15 <= tbt2_15;
            d16 <= tbt2_16;  d17 <= tbt2_17;  d18 <= tbt2_18;  d19 <= tbt2_19;
            d20 <= tbt2_20;  d21 <= tbt2_21;  d22 <= tbt2_22;  d23 <= tbt2_23;
            d24 <= tbt2_24;  d25 <= tbt2_25;  d26 <= tbt2_26;  d27 <= tbt2_27;
            d28 <= tbt2_28;  d29 <= tbt2_29;  d30 <= tbt2_30;  d31 <= tbt2_31;
            d32 <= tbt2_32;  d33 <= tbt2_33;  d34 <= tbt2_34;  d35 <= tbt2_35;
            d36 <= tbt2_36;  d37 <= tbt2_37;  d38 <= tbt2_38;  d39 <= tbt2_39;
            d40 <= tbt2_40;  d41 <= tbt2_41;  d42 <= tbt2_42;  d43 <= tbt2_43;
            d44 <= tbt2_44;  d45 <= tbt2_45;  d46 <= tbt2_46;  d47 <= tbt2_47;
            d48 <= tbt2_48;  d49 <= tbt2_49;  d50 <= tbt2_50;  d51 <= tbt2_51;
            d52 <= tbt2_52;  d53 <= tbt2_53;  d54 <= tbt2_54;  d55 <= tbt2_55;
            d56 <= tbt2_56;  d57 <= tbt2_57;  d58 <= tbt2_58;  d59 <= tbt2_59;
            d60 <= tbt2_60;  d61 <= tbt2_61;  d62 <= tbt2_62;  d63 <= tbt2_63;
            end
        4:  begin
            d0  <= tbt3_0 ;  d1  <= tbt3_1 ;  d2  <= tbt3_2 ;  d3  <= tbt3_3 ;
            d4  <= tbt3_4 ;  d5  <= tbt3_5 ;  d6  <= tbt3_6 ;  d7  <= tbt3_7 ;
            d8  <= tbt3_8 ;  d9  <= tbt3_9 ;  d10 <= tbt3_10;  d11 <= tbt3_11;
            d12 <= tbt3_12;  d13 <= tbt3_13;  d14 <= tbt3_14;  d15 <= tbt3_15;
            d16 <= tbt3_16;  d17 <= tbt3_17;  d18 <= tbt3_18;  d19 <= tbt3_19;
            d20 <= tbt3_20;  d21 <= tbt3_21;  d22 <= tbt3_22;  d23 <= tbt3_23;
            d24 <= tbt3_24;  d25 <= tbt3_25;  d26 <= tbt3_26;  d27 <= tbt3_27;
            d28 <= tbt3_28;  d29 <= tbt3_29;  d30 <= tbt3_30;  d31 <= tbt3_31;
            d32 <= tbt3_32;  d33 <= tbt3_33;  d34 <= tbt3_34;  d35 <= tbt3_35;
            d36 <= tbt3_36;  d37 <= tbt3_37;  d38 <= tbt3_38;  d39 <= tbt3_39;
            d40 <= tbt3_40;  d41 <= tbt3_41;  d42 <= tbt3_42;  d43 <= tbt3_43;
            d44 <= tbt3_44;  d45 <= tbt3_45;  d46 <= tbt3_46;  d47 <= tbt3_47;
            d48 <= tbt3_48;  d49 <= tbt3_49;  d50 <= tbt3_50;  d51 <= tbt3_51;
            d52 <= tbt3_52;  d53 <= tbt3_53;  d54 <= tbt3_54;  d55 <= tbt3_55;
            d56 <= tbt3_56;  d57 <= tbt3_57;  d58 <= tbt3_58;  d59 <= tbt3_59;
            d60 <= tbt3_60;  d61 <= tbt3_61;  d62 <= tbt3_62;  d63 <= tbt3_63;
            end                                                           
        5:  begin                                                         
            d0  <= tbt4_0 ;  d1  <= tbt4_1 ;  d2  <= tbt4_2 ;  d3  <= tbt4_3 ;
            d4  <= tbt4_4 ;  d5  <= tbt4_5 ;  d6  <= tbt4_6 ;  d7  <= tbt4_7 ;
            d8  <= tbt4_8 ;  d9  <= tbt4_9 ;  d10 <= tbt4_10;  d11 <= tbt4_11;
            d12 <= tbt4_12;  d13 <= tbt4_13;  d14 <= tbt4_14;  d15 <= tbt4_15;
            d16 <= tbt4_16;  d17 <= tbt4_17;  d18 <= tbt4_18;  d19 <= tbt4_19;
            d20 <= tbt4_20;  d21 <= tbt4_21;  d22 <= tbt4_22;  d23 <= tbt4_23;
            d24 <= tbt4_24;  d25 <= tbt4_25;  d26 <= tbt4_26;  d27 <= tbt4_27;
            d28 <= tbt4_28;  d29 <= tbt4_29;  d30 <= tbt4_30;  d31 <= tbt4_31;
            d32 <= tbt4_32;  d33 <= tbt4_33;  d34 <= tbt4_34;  d35 <= tbt4_35;
            d36 <= tbt4_36;  d37 <= tbt4_37;  d38 <= tbt4_38;  d39 <= tbt4_39;
            d40 <= tbt4_40;  d41 <= tbt4_41;  d42 <= tbt4_42;  d43 <= tbt4_43;
            d44 <= tbt4_44;  d45 <= tbt4_45;  d46 <= tbt4_46;  d47 <= tbt4_47;
            d48 <= tbt4_48;  d49 <= tbt4_49;  d50 <= tbt4_50;  d51 <= tbt4_51;
            d52 <= tbt4_52;  d53 <= tbt4_53;  d54 <= tbt4_54;  d55 <= tbt4_55;
            d56 <= tbt4_56;  d57 <= tbt4_57;  d58 <= tbt4_58;  d59 <= tbt4_59;
            d60 <= tbt4_60;  d61 <= tbt4_61;  d62 <= tbt4_62;  d63 <= tbt4_63;
            end                                                           
        6:  begin                                                         
            d0  <= tbt5_0 ;  d1  <= tbt5_1 ;  d2  <= tbt5_2 ;  d3  <= tbt5_3 ;
            d4  <= tbt5_4 ;  d5  <= tbt5_5 ;  d6  <= tbt5_6 ;  d7  <= tbt5_7 ;
            d8  <= tbt5_8 ;  d9  <= tbt5_9 ;  d10 <= tbt5_10;  d11 <= tbt5_11;
            d12 <= tbt5_12;  d13 <= tbt5_13;  d14 <= tbt5_14;  d15 <= tbt5_15;
            d16 <= tbt5_16;  d17 <= tbt5_17;  d18 <= tbt5_18;  d19 <= tbt5_19;
            d20 <= tbt5_20;  d21 <= tbt5_21;  d22 <= tbt5_22;  d23 <= tbt5_23;
            d24 <= tbt5_24;  d25 <= tbt5_25;  d26 <= tbt5_26;  d27 <= tbt5_27;
            d28 <= tbt5_28;  d29 <= tbt5_29;  d30 <= tbt5_30;  d31 <= tbt5_31;
            d32 <= tbt5_32;  d33 <= tbt5_33;  d34 <= tbt5_34;  d35 <= tbt5_35;
            d36 <= tbt5_36;  d37 <= tbt5_37;  d38 <= tbt5_38;  d39 <= tbt5_39;
            d40 <= tbt5_40;  d41 <= tbt5_41;  d42 <= tbt5_42;  d43 <= tbt5_43;
            d44 <= tbt5_44;  d45 <= tbt5_45;  d46 <= tbt5_46;  d47 <= tbt5_47;
            d48 <= tbt5_48;  d49 <= tbt5_49;  d50 <= tbt5_50;  d51 <= tbt5_51;
            d52 <= tbt5_52;  d53 <= tbt5_53;  d54 <= tbt5_54;  d55 <= tbt5_55;
            d56 <= tbt5_56;  d57 <= tbt5_57;  d58 <= tbt5_58;  d59 <= tbt5_59;
            d60 <= tbt5_60;  d61 <= tbt5_61;  d62 <= tbt5_62;  d63 <= tbt5_63;
            end                                                           
        7:  begin                                                         
            d0  <= tbt6_0 ;  d1  <= tbt6_1 ;  d2  <= tbt6_2 ;  d3  <= tbt6_3 ;
            d4  <= tbt6_4 ;  d5  <= tbt6_5 ;  d6  <= tbt6_6 ;  d7  <= tbt6_7 ;
            d8  <= tbt6_8 ;  d9  <= tbt6_9 ;  d10 <= tbt6_10;  d11 <= tbt6_11;
            d12 <= tbt6_12;  d13 <= tbt6_13;  d14 <= tbt6_14;  d15 <= tbt6_15;
            d16 <= tbt6_16;  d17 <= tbt6_17;  d18 <= tbt6_18;  d19 <= tbt6_19;
            d20 <= tbt6_20;  d21 <= tbt6_21;  d22 <= tbt6_22;  d23 <= tbt6_23;
            d24 <= tbt6_24;  d25 <= tbt6_25;  d26 <= tbt6_26;  d27 <= tbt6_27;
            d28 <= tbt6_28;  d29 <= tbt6_29;  d30 <= tbt6_30;  d31 <= tbt6_31;
            d32 <= tbt6_32;  d33 <= tbt6_33;  d34 <= tbt6_34;  d35 <= tbt6_35;
            d36 <= tbt6_36;  d37 <= tbt6_37;  d38 <= tbt6_38;  d39 <= tbt6_39;
            d40 <= tbt6_40;  d41 <= tbt6_41;  d42 <= tbt6_42;  d43 <= tbt6_43;
            d44 <= tbt6_44;  d45 <= tbt6_45;  d46 <= tbt6_46;  d47 <= tbt6_47;
            d48 <= tbt6_48;  d49 <= tbt6_49;  d50 <= tbt6_50;  d51 <= tbt6_51;
            d52 <= tbt6_52;  d53 <= tbt6_53;  d54 <= tbt6_54;  d55 <= tbt6_55;
            d56 <= tbt6_56;  d57 <= tbt6_57;  d58 <= tbt6_58;  d59 <= tbt6_59;
            d60 <= tbt6_60;  d61 <= tbt6_61;  d62 <= tbt6_62;  d63 <= tbt6_63;
            end                                                           
        8:  begin                                                         
            d0  <= tbt7_0 ;  d1  <= tbt7_1 ;  d2  <= tbt7_2 ;  d3  <= tbt7_3 ;
            d4  <= tbt7_4 ;  d5  <= tbt7_5 ;  d6  <= tbt7_6 ;  d7  <= tbt7_7 ;
            d8  <= tbt7_8 ;  d9  <= tbt7_9 ;  d10 <= tbt7_10;  d11 <= tbt7_11;
            d12 <= tbt7_12;  d13 <= tbt7_13;  d14 <= tbt7_14;  d15 <= tbt7_15;
            d16 <= tbt7_16;  d17 <= tbt7_17;  d18 <= tbt7_18;  d19 <= tbt7_19;
            d20 <= tbt7_20;  d21 <= tbt7_21;  d22 <= tbt7_22;  d23 <= tbt7_23;
            d24 <= tbt7_24;  d25 <= tbt7_25;  d26 <= tbt7_26;  d27 <= tbt7_27;
            d28 <= tbt7_28;  d29 <= tbt7_29;  d30 <= tbt7_30;  d31 <= tbt7_31;
            d32 <= tbt7_32;  d33 <= tbt7_33;  d34 <= tbt7_34;  d35 <= tbt7_35;
            d36 <= tbt7_36;  d37 <= tbt7_37;  d38 <= tbt7_38;  d39 <= tbt7_39;
            d40 <= tbt7_40;  d41 <= tbt7_41;  d42 <= tbt7_42;  d43 <= tbt7_43;
            d44 <= tbt7_44;  d45 <= tbt7_45;  d46 <= tbt7_46;  d47 <= tbt7_47;
            d48 <= tbt7_48;  d49 <= tbt7_49;  d50 <= tbt7_50;  d51 <= tbt7_51;
            d52 <= tbt7_52;  d53 <= tbt7_53;  d54 <= tbt7_54;  d55 <= tbt7_55;
            d56 <= tbt7_56;  d57 <= tbt7_57;  d58 <= tbt7_58;  d59 <= tbt7_59;
            d60 <= tbt7_60;  d61 <= tbt7_61;  d62 <= tbt7_62;  d63 <= tbt7_63;
            end        
        endcase
    end


always @(stateCnt or cState or decTbtIn or 
    d0  or d1  or d2  or d3  or d4  or d5  or d6  or  d7  or 
    d8  or d9  or d10 or d11 or d12 or d13 or d14 or  d15 or 
    d16 or d17 or d18 or d19 or d20 or d21 or d22 or  d23 or 
    d24 or d25 or d26 or d27 or d28 or d29 or d30 or  d31 or 
    d32 or d33 or d34 or d35 or d36 or d37 or d38 or  d39 or 
    d40 or d41 or d42 or d43 or d44 or d45 or d46 or  d47 or 
    d48 or d49 or d50 or d51 or d52 or d53 or d54 or  d55 or 
    d56 or d57 or d58 or d59 or d60 or d61 or d62 or  d63 or 
    ) begin
    if (stateCnt == 0) begin
        decisionTmp <= decTbtIn;
        end
    else begin
        case (cState)
            0 : begin decisionTmp <= d0 ;end
            1 : begin decisionTmp <= d1 ;end
            2 : begin decisionTmp <= d2 ;end
            3 : begin decisionTmp <= d3 ;end
            4 : begin decisionTmp <= d4 ;end
            5 : begin decisionTmp <= d5 ;end
            6 : begin decisionTmp <= d6 ;end
            7 : begin decisionTmp <= d7 ;end
            8 : begin decisionTmp <= d8 ;end
            9 : begin decisionTmp <= d9 ;end
            10: begin decisionTmp <= d10;end
            11: begin decisionTmp <= d11;end
            12: begin decisionTmp <= d12;end
            13: begin decisionTmp <= d13;end
            14: begin decisionTmp <= d14;end
            15: begin decisionTmp <= d15;end
            16: begin decisionTmp <= d16;end
            17: begin decisionTmp <= d17;end
            18: begin decisionTmp <= d18;end
            19: begin decisionTmp <= d19;end
            20: begin decisionTmp <= d20;end
            21: begin decisionTmp <= d21;end
            22: begin decisionTmp <= d22;end
            23: begin decisionTmp <= d23;end
            24: begin decisionTmp <= d24;end
            25: begin decisionTmp <= d25;end
            26: begin decisionTmp <= d26;end
            27: begin decisionTmp <= d27;end
            28: begin decisionTmp <= d28;end
            29: begin decisionTmp <= d29;end
            30: begin decisionTmp <= d30;end
            31: begin decisionTmp <= d31;end
            32: begin decisionTmp <= d32;end
            33: begin decisionTmp <= d33;end
            34: begin decisionTmp <= d34;end
            35: begin decisionTmp <= d35;end
            36: begin decisionTmp <= d36;end
            37: begin decisionTmp <= d37;end
            38: begin decisionTmp <= d38;end
            39: begin decisionTmp <= d39;end
            40: begin decisionTmp <= d40;end
            41: begin decisionTmp <= d41;end
            42: begin decisionTmp <= d42;end
            43: begin decisionTmp <= d43;end
            44: begin decisionTmp <= d44;end
            45: begin decisionTmp <= d45;end
            46: begin decisionTmp <= d46;end
            47: begin decisionTmp <= d47;end
            48: begin decisionTmp <= d48;end
            49: begin decisionTmp <= d49;end
            50: begin decisionTmp <= d50;end
            51: begin decisionTmp <= d51;end
            52: begin decisionTmp <= d52;end
            53: begin decisionTmp <= d53;end
            54: begin decisionTmp <= d54;end
            55: begin decisionTmp <= d55;end
            56: begin decisionTmp <= d56;end
            57: begin decisionTmp <= d57;end
            58: begin decisionTmp <= d58;end
            59: begin decisionTmp <= d59;end
            60: begin decisionTmp <= d60;end
            61: begin decisionTmp <= d61;end
            62: begin decisionTmp <= d62;end
            63: begin decisionTmp <= d63;end
            endcase
        end
   end
`else
   reg [1:0] d1, d2, d3, d4, d5, d6 ,d7 ,d8;
   always @(cState or
            tbt0_0  or tbt0_1  or tbt0_2  or tbt0_3  or tbt0_4  or tbt0_5  or tbt0_6  or tbt0_7  or 
            tbt0_8  or tbt0_9  or tbt0_10 or tbt0_11 or tbt0_12 or tbt0_13 or tbt0_14 or tbt0_15 or 
            tbt0_16 or tbt0_17 or tbt0_18 or tbt0_19 or tbt0_20 or tbt0_21 or tbt0_22 or tbt0_23 or 
            tbt0_24 or tbt0_25 or tbt0_26 or tbt0_27 or tbt0_28 or tbt0_29 or tbt0_30 or tbt0_31 or 
            tbt0_32 or tbt0_33 or tbt0_34 or tbt0_35 or tbt0_36 or tbt0_37 or tbt0_38 or tbt0_39 or 
            tbt0_40 or tbt0_41 or tbt0_42 or tbt0_43 or tbt0_44 or tbt0_45 or tbt0_46 or tbt0_47 or 
            tbt0_48 or tbt0_49 or tbt0_50 or tbt0_51 or tbt0_52 or tbt0_53 or tbt0_54 or tbt0_55 or 
            tbt0_56 or tbt0_57 or tbt0_58 or tbt0_59 or tbt0_60 or tbt0_61 or tbt0_62 or tbt0_63 or 
            tbt1_0  or tbt1_1  or tbt1_2  or tbt1_3  or tbt1_4  or tbt1_5  or tbt1_6  or tbt1_7  or 
            tbt1_8  or tbt1_9  or tbt1_10 or tbt1_11 or tbt1_12 or tbt1_13 or tbt1_14 or tbt1_15 or 
            tbt1_16 or tbt1_17 or tbt1_18 or tbt1_19 or tbt1_20 or tbt1_21 or tbt1_22 or tbt1_23 or 
            tbt1_24 or tbt1_25 or tbt1_26 or tbt1_27 or tbt1_28 or tbt1_29 or tbt1_30 or tbt1_31 or 
            tbt1_32 or tbt1_33 or tbt1_34 or tbt1_35 or tbt1_36 or tbt1_37 or tbt1_38 or tbt1_39 or 
            tbt1_40 or tbt1_41 or tbt1_42 or tbt1_43 or tbt1_44 or tbt1_45 or tbt1_46 or tbt1_47 or 
            tbt1_48 or tbt1_49 or tbt1_50 or tbt1_51 or tbt1_52 or tbt1_53 or tbt1_54 or tbt1_55 or 
            tbt1_56 or tbt1_57 or tbt1_58 or tbt1_59 or tbt1_60 or tbt1_61 or tbt1_62 or tbt1_63 or
            tbt2_0  or tbt2_1  or tbt2_2  or tbt2_3  or tbt2_4  or tbt2_5  or tbt2_6  or tbt2_7  or 
            tbt2_8  or tbt2_9  or tbt2_10 or tbt2_11 or tbt2_12 or tbt2_13 or tbt2_14 or tbt2_15 or 
            tbt2_16 or tbt2_17 or tbt2_18 or tbt2_19 or tbt2_20 or tbt2_21 or tbt2_22 or tbt2_23 or 
            tbt2_24 or tbt2_25 or tbt2_26 or tbt2_27 or tbt2_28 or tbt2_29 or tbt2_30 or tbt2_31 or 
            tbt2_32 or tbt2_33 or tbt2_34 or tbt2_35 or tbt2_36 or tbt2_37 or tbt2_38 or tbt2_39 or 
            tbt2_40 or tbt2_41 or tbt2_42 or tbt2_43 or tbt2_44 or tbt2_45 or tbt2_46 or tbt2_47 or 
            tbt2_48 or tbt2_49 or tbt2_50 or tbt2_51 or tbt2_52 or tbt2_53 or tbt2_54 or tbt2_55 or 
            tbt2_56 or tbt2_57 or tbt2_58 or tbt2_59 or tbt2_60 or tbt2_61 or tbt2_62 or tbt2_63 or
            tbt3_0  or tbt3_1  or tbt3_2  or tbt3_3  or tbt3_4  or tbt3_5  or tbt3_6  or tbt3_7  or 
            tbt3_8  or tbt3_9  or tbt3_10 or tbt3_11 or tbt3_12 or tbt3_13 or tbt3_14 or tbt3_15 or 
            tbt3_16 or tbt3_17 or tbt3_18 or tbt3_19 or tbt3_20 or tbt3_21 or tbt3_22 or tbt3_23 or 
            tbt3_24 or tbt3_25 or tbt3_26 or tbt3_27 or tbt3_28 or tbt3_29 or tbt3_30 or tbt3_31 or 
            tbt3_32 or tbt3_33 or tbt3_34 or tbt3_35 or tbt3_36 or tbt3_37 or tbt3_38 or tbt3_39 or 
            tbt3_40 or tbt3_41 or tbt3_42 or tbt3_43 or tbt3_44 or tbt3_45 or tbt3_46 or tbt3_47 or 
            tbt3_48 or tbt3_49 or tbt3_50 or tbt3_51 or tbt3_52 or tbt3_53 or tbt3_54 or tbt3_55 or 
            tbt3_56 or tbt3_57 or tbt3_58 or tbt3_59 or tbt3_60 or tbt3_61 or tbt3_62 or tbt3_63 or 
            tbt4_0  or tbt4_1  or tbt4_2  or tbt4_3  or tbt4_4  or tbt4_5  or tbt4_6  or tbt4_7  or 
            tbt4_8  or tbt4_9  or tbt4_10 or tbt4_11 or tbt4_12 or tbt4_13 or tbt4_14 or tbt4_15 or 
            tbt4_16 or tbt4_17 or tbt4_18 or tbt4_19 or tbt4_20 or tbt4_21 or tbt4_22 or tbt4_23 or 
            tbt4_24 or tbt4_25 or tbt4_26 or tbt4_27 or tbt4_28 or tbt4_29 or tbt4_30 or tbt4_31 or 
            tbt4_32 or tbt4_33 or tbt4_34 or tbt4_35 or tbt4_36 or tbt4_37 or tbt4_38 or tbt4_39 or 
            tbt4_40 or tbt4_41 or tbt4_42 or tbt4_43 or tbt4_44 or tbt4_45 or tbt4_46 or tbt4_47 or 
            tbt4_48 or tbt4_49 or tbt4_50 or tbt4_51 or tbt4_52 or tbt4_53 or tbt4_54 or tbt4_55 or 
            tbt4_56 or tbt4_57 or tbt4_58 or tbt4_59 or tbt4_60 or tbt4_61 or tbt4_62 or tbt4_63 or
            tbt5_0  or tbt5_1  or tbt5_2  or tbt5_3  or tbt5_4  or tbt5_5  or tbt5_6  or tbt5_7  or 
            tbt5_8  or tbt5_9  or tbt5_10 or tbt5_11 or tbt5_12 or tbt5_13 or tbt5_14 or tbt5_15 or 
            tbt5_16 or tbt5_17 or tbt5_18 or tbt5_19 or tbt5_20 or tbt5_21 or tbt5_22 or tbt5_23 or 
            tbt5_24 or tbt5_25 or tbt5_26 or tbt5_27 or tbt5_28 or tbt5_29 or tbt5_30 or tbt5_31 or 
            tbt5_32 or tbt5_33 or tbt5_34 or tbt5_35 or tbt5_36 or tbt5_37 or tbt5_38 or tbt5_39 or 
            tbt5_40 or tbt5_41 or tbt5_42 or tbt5_43 or tbt5_44 or tbt5_45 or tbt5_46 or tbt5_47 or 
            tbt5_48 or tbt5_49 or tbt5_50 or tbt5_51 or tbt5_52 or tbt5_53 or tbt5_54 or tbt5_55 or 
            tbt5_56 or tbt5_57 or tbt5_58 or tbt5_59 or tbt5_60 or tbt5_61 or tbt5_62 or tbt5_63 or
            tbt6_0  or tbt6_1  or tbt6_2  or tbt6_3  or tbt6_4  or tbt6_5  or tbt6_6  or tbt6_7  or 
            tbt6_8  or tbt6_9  or tbt6_10 or tbt6_11 or tbt6_12 or tbt6_13 or tbt6_14 or tbt6_15 or 
            tbt6_16 or tbt6_17 or tbt6_18 or tbt6_19 or tbt6_20 or tbt6_21 or tbt6_22 or tbt6_23 or 
            tbt6_24 or tbt6_25 or tbt6_26 or tbt6_27 or tbt6_28 or tbt6_29 or tbt6_30 or tbt6_31 or 
            tbt6_32 or tbt6_33 or tbt6_34 or tbt6_35 or tbt6_36 or tbt6_37 or tbt6_38 or tbt6_39 or 
            tbt6_40 or tbt6_41 or tbt6_42 or tbt6_43 or tbt6_44 or tbt6_45 or tbt6_46 or tbt6_47 or 
            tbt6_48 or tbt6_49 or tbt6_50 or tbt6_51 or tbt6_52 or tbt6_53 or tbt6_54 or tbt6_55 or 
            tbt6_56 or tbt6_57 or tbt6_58 or tbt6_59 or tbt6_60 or tbt6_61 or tbt6_62 or tbt6_63 or 
            tbt7_0  or tbt7_1  or tbt7_2  or tbt7_3  or tbt7_4  or tbt7_5  or tbt7_6  or tbt7_7  or 
            tbt7_8  or tbt7_9  or tbt7_10 or tbt7_11 or tbt7_12 or tbt7_13 or tbt7_14 or tbt7_15 or 
            tbt7_16 or tbt7_17 or tbt7_18 or tbt7_19 or tbt7_20 or tbt7_21 or tbt7_22 or tbt7_23 or 
            tbt7_24 or tbt7_25 or tbt7_26 or tbt7_27 or tbt7_28 or tbt7_29 or tbt7_30 or tbt7_31 or 
            tbt7_32 or tbt7_33 or tbt7_34 or tbt7_35 or tbt7_36 or tbt7_37 or tbt7_38 or tbt7_39 or 
            tbt7_40 or tbt7_41 or tbt7_42 or tbt7_43 or tbt7_44 or tbt7_45 or tbt7_46 or tbt7_47 or 
            tbt7_48 or tbt7_49 or tbt7_50 or tbt7_51 or tbt7_52 or tbt7_53 or tbt7_54 or tbt7_55 or 
            tbt7_56 or tbt7_57 or tbt7_58 or tbt7_59 or tbt7_60 or tbt7_61 or tbt7_62 or tbt7_63)
            /* -----\/----- EXCLUDED -----\/-----
            tbt8_0  or tbt8_1  or tbt8_2  or tbt8_3  or tbt8_4  or tbt8_5  or tbt8_6  or tbt8_7  or 
            tbt8_8  or tbt8_9  or tbt8_10 or tbt8_11 or tbt8_12 or tbt8_13 or tbt8_14 or tbt8_15 or 
            tbt8_16 or tbt8_17 or tbt8_18 or tbt8_19 or tbt8_20 or tbt8_21 or tbt8_22 or tbt8_23 or 
            tbt8_24 or tbt8_25 or tbt8_26 or tbt8_27 or tbt8_28 or tbt8_29 or tbt8_30 or tbt8_31 or 
            tbt8_32 or tbt8_33 or tbt8_34 or tbt8_35 or tbt8_36 or tbt8_37 or tbt8_38 or tbt8_39 or 
            tbt8_40 or tbt8_41 or tbt8_42 or tbt8_43 or tbt8_44 or tbt8_45 or tbt8_46 or tbt8_47 or 
            tbt8_48 or tbt8_49 or tbt8_50 or tbt8_51 or tbt8_52 or tbt8_53 or tbt8_54 or tbt8_55 or 
            tbt8_56 or tbt8_57 or tbt8_58 or tbt8_59 or tbt8_60 or tbt8_61 or tbt8_62 or tbt8_63)            
             -----/\----- EXCLUDED -----/\----- */
     case (cState)
       0 : begin d1 <= tbt0_0 ;  d2 <= tbt1_0;  d3 <= tbt2_0;  d4 <= tbt3_0;    d5 <= tbt4_0;    d6 <= tbt5_0;   d7 <= tbt6_0;    d8 <= tbt7_0;    /*d9 <= tbt8_0;  */ end
       1 : begin d1 <= tbt0_1 ;  d2 <= tbt1_1;  d3 <= tbt2_1;  d4 <= tbt3_1;    d5 <= tbt4_1;    d6 <= tbt5_1;   d7 <= tbt6_1;    d8 <= tbt7_1;    /*d9 <= tbt8_1;  */ end
       2 : begin d1 <= tbt0_2 ;  d2 <= tbt1_2;  d3 <= tbt2_2;  d4 <= tbt3_2;    d5 <= tbt4_2;    d6 <= tbt5_2;   d7 <= tbt6_2;    d8 <= tbt7_2;    /*d9 <= tbt8_2;  */ end
       3 : begin d1 <= tbt0_3 ;  d2 <= tbt1_3;  d3 <= tbt2_3;  d4 <= tbt3_3;    d5 <= tbt4_3;    d6 <= tbt5_3;   d7 <= tbt6_3;    d8 <= tbt7_3;    /*d9 <= tbt8_3;  */ end
       4 : begin d1 <= tbt0_4 ;  d2 <= tbt1_4;  d3 <= tbt2_4;  d4 <= tbt3_4;    d5 <= tbt4_4;    d6 <= tbt5_4;   d7 <= tbt6_4;    d8 <= tbt7_4;    /*d9 <= tbt8_4;  */ end
       5 : begin d1 <= tbt0_5 ;  d2 <= tbt1_5;  d3 <= tbt2_5;  d4 <= tbt3_5;    d5 <= tbt4_5;    d6 <= tbt5_5;   d7 <= tbt6_5;    d8 <= tbt7_5;    /*d9 <= tbt8_5;  */ end
       6 : begin d1 <= tbt0_6 ;  d2 <= tbt1_6;  d3 <= tbt2_6;  d4 <= tbt3_6;    d5 <= tbt4_6;    d6 <= tbt5_6;   d7 <= tbt6_6;    d8 <= tbt7_6;    /*d9 <= tbt8_6;  */ end
       7 : begin d1 <= tbt0_7 ;  d2 <= tbt1_7;  d3 <= tbt2_7;  d4 <= tbt3_7;    d5 <= tbt4_7;    d6 <= tbt5_7;   d7 <= tbt6_7;    d8 <= tbt7_7;    /*d9 <= tbt8_7;  */ end
       8 : begin d1 <= tbt0_8 ;  d2 <= tbt1_8;  d3 <= tbt2_8;  d4 <= tbt3_8;    d5 <= tbt4_8;    d6 <= tbt5_8;   d7 <= tbt6_8;    d8 <= tbt7_8;    /*d9 <= tbt8_8;  */ end
       9 : begin d1 <= tbt0_9 ;  d2 <= tbt1_9;  d3 <= tbt2_9;  d4 <= tbt3_9;    d5 <= tbt4_9;    d6 <= tbt5_9;   d7 <= tbt6_9;    d8 <= tbt7_9;    /*d9 <= tbt8_9;  */ end
       10: begin d1 <= tbt0_10;  d2 <= tbt1_10; d3 <= tbt2_10; d4 <= tbt3_10;   d5 <= tbt4_10;   d6 <= tbt5_10;  d7 <= tbt6_10;   d8 <= tbt7_10;   /*d9 <= tbt8_10; */ end
       11: begin d1 <= tbt0_11;  d2 <= tbt1_11; d3 <= tbt2_11; d4 <= tbt3_11;   d5 <= tbt4_11;   d6 <= tbt5_11;  d7 <= tbt6_11;   d8 <= tbt7_11;   /*d9 <= tbt8_11; */ end
       12: begin d1 <= tbt0_12;  d2 <= tbt1_12; d3 <= tbt2_12; d4 <= tbt3_12;   d5 <= tbt4_12;   d6 <= tbt5_12;  d7 <= tbt6_12;   d8 <= tbt7_12;   /*d9 <= tbt8_12; */ end
       13: begin d1 <= tbt0_13;  d2 <= tbt1_13; d3 <= tbt2_13; d4 <= tbt3_13;   d5 <= tbt4_13;   d6 <= tbt5_13;  d7 <= tbt6_13;   d8 <= tbt7_13;   /*d9 <= tbt8_13; */ end
       14: begin d1 <= tbt0_14;  d2 <= tbt1_14; d3 <= tbt2_14; d4 <= tbt3_14;   d5 <= tbt4_14;   d6 <= tbt5_14;  d7 <= tbt6_14;   d8 <= tbt7_14;   /*d9 <= tbt8_14; */ end
       15: begin d1 <= tbt0_15;  d2 <= tbt1_15; d3 <= tbt2_15; d4 <= tbt3_15;   d5 <= tbt4_15;   d6 <= tbt5_15;  d7 <= tbt6_15;   d8 <= tbt7_15;   /*d9 <= tbt8_15; */ end
       16: begin d1 <= tbt0_16;  d2 <= tbt1_16; d3 <= tbt2_16; d4 <= tbt3_16;   d5 <= tbt4_16;   d6 <= tbt5_16;  d7 <= tbt6_16;   d8 <= tbt7_16;   /*d9 <= tbt8_16; */ end
       17: begin d1 <= tbt0_17;  d2 <= tbt1_17; d3 <= tbt2_17; d4 <= tbt3_17;   d5 <= tbt4_17;   d6 <= tbt5_17;  d7 <= tbt6_17;   d8 <= tbt7_17;   /*d9 <= tbt8_17; */ end
       18: begin d1 <= tbt0_18;  d2 <= tbt1_18; d3 <= tbt2_18; d4 <= tbt3_18;   d5 <= tbt4_18;   d6 <= tbt5_18;  d7 <= tbt6_18;   d8 <= tbt7_18;   /*d9 <= tbt8_18; */ end
       19: begin d1 <= tbt0_19;  d2 <= tbt1_19; d3 <= tbt2_19; d4 <= tbt3_19;   d5 <= tbt4_19;   d6 <= tbt5_19;  d7 <= tbt6_19;   d8 <= tbt7_19;   /*d9 <= tbt8_19; */ end
       20: begin d1 <= tbt0_20;  d2 <= tbt1_20; d3 <= tbt2_20; d4 <= tbt3_20;   d5 <= tbt4_20;   d6 <= tbt5_20;  d7 <= tbt6_20;   d8 <= tbt7_20;   /*d9 <= tbt8_20; */ end
       21: begin d1 <= tbt0_21;  d2 <= tbt1_21; d3 <= tbt2_21; d4 <= tbt3_21;   d5 <= tbt4_21;   d6 <= tbt5_21;  d7 <= tbt6_21;   d8 <= tbt7_21;   /*d9 <= tbt8_21; */ end
       22: begin d1 <= tbt0_22;  d2 <= tbt1_22; d3 <= tbt2_22; d4 <= tbt3_22;   d5 <= tbt4_22;   d6 <= tbt5_22;  d7 <= tbt6_22;   d8 <= tbt7_22;   /*d9 <= tbt8_22; */ end
       23: begin d1 <= tbt0_23;  d2 <= tbt1_23; d3 <= tbt2_23; d4 <= tbt3_23;   d5 <= tbt4_23;   d6 <= tbt5_23;  d7 <= tbt6_23;   d8 <= tbt7_23;   /*d9 <= tbt8_23; */ end
       24: begin d1 <= tbt0_24;  d2 <= tbt1_24; d3 <= tbt2_24; d4 <= tbt3_24;   d5 <= tbt4_24;   d6 <= tbt5_24;  d7 <= tbt6_24;   d8 <= tbt7_24;   /*d9 <= tbt8_24; */ end
       25: begin d1 <= tbt0_25;  d2 <= tbt1_25; d3 <= tbt2_25; d4 <= tbt3_25;   d5 <= tbt4_25;   d6 <= tbt5_25;  d7 <= tbt6_25;   d8 <= tbt7_25;   /*d9 <= tbt8_25; */ end
       26: begin d1 <= tbt0_26;  d2 <= tbt1_26; d3 <= tbt2_26; d4 <= tbt3_26;   d5 <= tbt4_26;   d6 <= tbt5_26;  d7 <= tbt6_26;   d8 <= tbt7_26;   /*d9 <= tbt8_26; */ end
       27: begin d1 <= tbt0_27;  d2 <= tbt1_27; d3 <= tbt2_27; d4 <= tbt3_27;   d5 <= tbt4_27;   d6 <= tbt5_27;  d7 <= tbt6_27;   d8 <= tbt7_27;   /*d9 <= tbt8_27; */ end
       28: begin d1 <= tbt0_28;  d2 <= tbt1_28; d3 <= tbt2_28; d4 <= tbt3_28;   d5 <= tbt4_28;   d6 <= tbt5_28;  d7 <= tbt6_28;   d8 <= tbt7_28;   /*d9 <= tbt8_28; */ end
       29: begin d1 <= tbt0_29;  d2 <= tbt1_29; d3 <= tbt2_29; d4 <= tbt3_29;   d5 <= tbt4_29;   d6 <= tbt5_29;  d7 <= tbt6_29;   d8 <= tbt7_29;   /*d9 <= tbt8_29; */ end
       30: begin d1 <= tbt0_30;  d2 <= tbt1_30; d3 <= tbt2_30; d4 <= tbt3_30;   d5 <= tbt4_30;   d6 <= tbt5_30;  d7 <= tbt6_30;   d8 <= tbt7_30;   /*d9 <= tbt8_30; */ end
       31: begin d1 <= tbt0_31;  d2 <= tbt1_31; d3 <= tbt2_31; d4 <= tbt3_31;   d5 <= tbt4_31;   d6 <= tbt5_31;  d7 <= tbt6_31;   d8 <= tbt7_31;   /*d9 <= tbt8_31; */ end
       32: begin d1 <= tbt0_32;  d2 <= tbt1_32; d3 <= tbt2_32; d4 <= tbt3_32;   d5 <= tbt4_32;   d6 <= tbt5_32;  d7 <= tbt6_32;   d8 <= tbt7_32;   /*d9 <= tbt8_32; */ end
       33: begin d1 <= tbt0_33;  d2 <= tbt1_33; d3 <= tbt2_33; d4 <= tbt3_33;   d5 <= tbt4_33;   d6 <= tbt5_33;  d7 <= tbt6_33;   d8 <= tbt7_33;   /*d9 <= tbt8_33; */ end
       34: begin d1 <= tbt0_34;  d2 <= tbt1_34; d3 <= tbt2_34; d4 <= tbt3_34;   d5 <= tbt4_34;   d6 <= tbt5_34;  d7 <= tbt6_34;   d8 <= tbt7_34;   /*d9 <= tbt8_34; */ end
       35: begin d1 <= tbt0_35;  d2 <= tbt1_35; d3 <= tbt2_35; d4 <= tbt3_35;   d5 <= tbt4_35;   d6 <= tbt5_35;  d7 <= tbt6_35;   d8 <= tbt7_35;   /*d9 <= tbt8_35; */ end
       36: begin d1 <= tbt0_36;  d2 <= tbt1_36; d3 <= tbt2_36; d4 <= tbt3_36;   d5 <= tbt4_36;   d6 <= tbt5_36;  d7 <= tbt6_36;   d8 <= tbt7_36;   /*d9 <= tbt8_36; */ end
       37: begin d1 <= tbt0_37;  d2 <= tbt1_37; d3 <= tbt2_37; d4 <= tbt3_37;   d5 <= tbt4_37;   d6 <= tbt5_37;  d7 <= tbt6_37;   d8 <= tbt7_37;   /*d9 <= tbt8_37; */ end
       38: begin d1 <= tbt0_38;  d2 <= tbt1_38; d3 <= tbt2_38; d4 <= tbt3_38;   d5 <= tbt4_38;   d6 <= tbt5_38;  d7 <= tbt6_38;   d8 <= tbt7_38;   /*d9 <= tbt8_38; */ end
       39: begin d1 <= tbt0_39;  d2 <= tbt1_39; d3 <= tbt2_39; d4 <= tbt3_39;   d5 <= tbt4_39;   d6 <= tbt5_39;  d7 <= tbt6_39;   d8 <= tbt7_39;   /*d9 <= tbt8_39; */ end
       40: begin d1 <= tbt0_40;  d2 <= tbt1_40; d3 <= tbt2_40; d4 <= tbt3_40;   d5 <= tbt4_40;   d6 <= tbt5_40;  d7 <= tbt6_40;   d8 <= tbt7_40;   /*d9 <= tbt8_40; */ end
       41: begin d1 <= tbt0_41;  d2 <= tbt1_41; d3 <= tbt2_41; d4 <= tbt3_41;   d5 <= tbt4_41;   d6 <= tbt5_41;  d7 <= tbt6_41;   d8 <= tbt7_41;   /*d9 <= tbt8_41; */ end
       42: begin d1 <= tbt0_42;  d2 <= tbt1_42; d3 <= tbt2_42; d4 <= tbt3_42;   d5 <= tbt4_42;   d6 <= tbt5_42;  d7 <= tbt6_42;   d8 <= tbt7_42;   /*d9 <= tbt8_42; */ end
       43: begin d1 <= tbt0_43;  d2 <= tbt1_43; d3 <= tbt2_43; d4 <= tbt3_43;   d5 <= tbt4_43;   d6 <= tbt5_43;  d7 <= tbt6_43;   d8 <= tbt7_43;   /*d9 <= tbt8_43; */ end
       44: begin d1 <= tbt0_44;  d2 <= tbt1_44; d3 <= tbt2_44; d4 <= tbt3_44;   d5 <= tbt4_44;   d6 <= tbt5_44;  d7 <= tbt6_44;   d8 <= tbt7_44;   /*d9 <= tbt8_44; */ end
       45: begin d1 <= tbt0_45;  d2 <= tbt1_45; d3 <= tbt2_45; d4 <= tbt3_45;   d5 <= tbt4_45;   d6 <= tbt5_45;  d7 <= tbt6_45;   d8 <= tbt7_45;   /*d9 <= tbt8_45; */ end
       46: begin d1 <= tbt0_46;  d2 <= tbt1_46; d3 <= tbt2_46; d4 <= tbt3_46;   d5 <= tbt4_46;   d6 <= tbt5_46;  d7 <= tbt6_46;   d8 <= tbt7_46;   /*d9 <= tbt8_46; */ end
       47: begin d1 <= tbt0_47;  d2 <= tbt1_47; d3 <= tbt2_47; d4 <= tbt3_47;   d5 <= tbt4_47;   d6 <= tbt5_47;  d7 <= tbt6_47;   d8 <= tbt7_47;   /*d9 <= tbt8_47; */ end
       48: begin d1 <= tbt0_48;  d2 <= tbt1_48; d3 <= tbt2_48; d4 <= tbt3_48;   d5 <= tbt4_48;   d6 <= tbt5_48;  d7 <= tbt6_48;   d8 <= tbt7_48;   /*d9 <= tbt8_48; */ end
       49: begin d1 <= tbt0_49;  d2 <= tbt1_49; d3 <= tbt2_49; d4 <= tbt3_49;   d5 <= tbt4_49;   d6 <= tbt5_49;  d7 <= tbt6_49;   d8 <= tbt7_49;   /*d9 <= tbt8_49; */ end
       50: begin d1 <= tbt0_50;  d2 <= tbt1_50; d3 <= tbt2_50; d4 <= tbt3_50;   d5 <= tbt4_50;   d6 <= tbt5_50;  d7 <= tbt6_50;   d8 <= tbt7_50;   /*d9 <= tbt8_50; */ end
       51: begin d1 <= tbt0_51;  d2 <= tbt1_51; d3 <= tbt2_51; d4 <= tbt3_51;   d5 <= tbt4_51;   d6 <= tbt5_51;  d7 <= tbt6_51;   d8 <= tbt7_51;   /*d9 <= tbt8_51; */ end
       52: begin d1 <= tbt0_52;  d2 <= tbt1_52; d3 <= tbt2_52; d4 <= tbt3_52;   d5 <= tbt4_52;   d6 <= tbt5_52;  d7 <= tbt6_52;   d8 <= tbt7_52;   /*d9 <= tbt8_52; */ end
       53: begin d1 <= tbt0_53;  d2 <= tbt1_53; d3 <= tbt2_53; d4 <= tbt3_53;   d5 <= tbt4_53;   d6 <= tbt5_53;  d7 <= tbt6_53;   d8 <= tbt7_53;   /*d9 <= tbt8_53; */ end
       54: begin d1 <= tbt0_54;  d2 <= tbt1_54; d3 <= tbt2_54; d4 <= tbt3_54;   d5 <= tbt4_54;   d6 <= tbt5_54;  d7 <= tbt6_54;   d8 <= tbt7_54;   /*d9 <= tbt8_54; */ end
       55: begin d1 <= tbt0_55;  d2 <= tbt1_55; d3 <= tbt2_55; d4 <= tbt3_55;   d5 <= tbt4_55;   d6 <= tbt5_55;  d7 <= tbt6_55;   d8 <= tbt7_55;   /*d9 <= tbt8_55; */ end
       56: begin d1 <= tbt0_56;  d2 <= tbt1_56; d3 <= tbt2_56; d4 <= tbt3_56;   d5 <= tbt4_56;   d6 <= tbt5_56;  d7 <= tbt6_56;   d8 <= tbt7_56;   /*d9 <= tbt8_56; */ end
       57: begin d1 <= tbt0_57;  d2 <= tbt1_57; d3 <= tbt2_57; d4 <= tbt3_57;   d5 <= tbt4_57;   d6 <= tbt5_57;  d7 <= tbt6_57;   d8 <= tbt7_57;   /*d9 <= tbt8_57; */ end
       58: begin d1 <= tbt0_58;  d2 <= tbt1_58; d3 <= tbt2_58; d4 <= tbt3_58;   d5 <= tbt4_58;   d6 <= tbt5_58;  d7 <= tbt6_58;   d8 <= tbt7_58;   /*d9 <= tbt8_58; */ end
       59: begin d1 <= tbt0_59;  d2 <= tbt1_59; d3 <= tbt2_59; d4 <= tbt3_59;   d5 <= tbt4_59;   d6 <= tbt5_59;  d7 <= tbt6_59;   d8 <= tbt7_59;   /*d9 <= tbt8_59; */ end
       60: begin d1 <= tbt0_60;  d2 <= tbt1_60; d3 <= tbt2_60; d4 <= tbt3_60;   d5 <= tbt4_60;   d6 <= tbt5_60;  d7 <= tbt6_60;   d8 <= tbt7_60;   /*d9 <= tbt8_60; */ end
       61: begin d1 <= tbt0_61;  d2 <= tbt1_61; d3 <= tbt2_61; d4 <= tbt3_61;   d5 <= tbt4_61;   d6 <= tbt5_61;  d7 <= tbt6_61;   d8 <= tbt7_61;   /*d9 <= tbt8_61; */ end
       62: begin d1 <= tbt0_62;  d2 <= tbt1_62; d3 <= tbt2_62; d4 <= tbt3_62;   d5 <= tbt4_62;   d6 <= tbt5_62;  d7 <= tbt6_62;   d8 <= tbt7_62;   /*d9 <= tbt8_62; */ end
       63: begin d1 <= tbt0_63;  d2 <= tbt1_63; d3 <= tbt2_63; d4 <= tbt3_63;   d5 <= tbt4_63;   d6 <= tbt5_63;  d7 <= tbt6_63;   d8 <= tbt7_63;   /*d9 <= tbt8_63; */ end
     endcase


   // final mux for the decision out of the trace back 
   always @(stateCnt or decTbtIn or d1 or d2 or d3 or d4 or d5 or d6 or d7 or d8)
     case (stateCnt) //State count, counts to the traceback depth of 4, init at symEn 
       0: begin decisionTmp <= decTbtIn; end
       1: begin decisionTmp <= d1; end
       2: begin decisionTmp <= d2; end
       3: begin decisionTmp <= d3; end
       4: begin decisionTmp <= d4; end
       5: begin decisionTmp <= d5; end
       6: begin decisionTmp <= d6; end
       7: begin decisionTmp <= d7; end
       8: begin decisionTmp <= d8; end
       default : decisionTmp <= d8;
     endcase
`endif   

   // Just a counter the keeps track of when to output the final decision
   reg [3:0] outputCnt;
   always @(posedge clk)
     begin
        if (reset) begin
           outputCnt <= 0;
        end
        else if (symEnEven && symEn) begin
           outputCnt <= 0;
        end
        else begin
           if (outputCnt < TB_DEPTH)
             outputCnt <= outputCnt+1;
        end
     end

   // Two decision gets computed every symEn. The two decisions gets shited into a 2 bit shift register then shifted out every symEn.
   reg [1:0]  decSr0, decSr1;
   always @(posedge clk) begin
      if (reset) begin
         decSr0 <= 0;
         decSr1 <= 0;
      end
      else if ((outputCnt == 6) || (outputCnt == 7)) begin  
         decSr0 <= decisionTmp;
         decSr1 <= decSr0;
      end
   end

         
   // Final decision output 
   always @(posedge clk) begin
      if (reset) begin
         decision <= 1'b0;
      end
      else if (symEn) begin  
         if (symEnEven) begin
            decision <= decSr0;
         end
         else begin
            decision <= decSr1;
         end
      end 
   end
   
         
endmodule // traceBackMultiH
