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
   sym2xEn,
   symEnEven,
   sel0 , sel1 , sel2 , sel3 , sel4 , sel5 , sel6 , sel7 , 
   sel8 , sel9 , sel10, sel11, sel12, sel13, sel14, sel15, 
   sel16, sel17, sel18, sel19, sel20, sel21, sel22, sel23, 
   sel24, sel25, sel26, sel27, sel28, sel29, sel30, sel31, 
   sel32, sel33, sel34, sel35, sel36, sel37, sel38, sel39, 
   sel40, sel41, sel42, sel43, sel44, sel45, sel46, sel47, 
   sel48, sel49, sel50, sel51, sel52, sel53, sel54, sel55, 
   sel56, sel57, sel58, sel59, sel60, sel61, sel62, sel63,
   symEnOut,
   sym2xEnOut,
   index,
   decision
   );
   
   parameter          TB_DEPTH = 8;
   input              clk,reset,symEn, sym2xEn;
   input              symEnEven;
   input [1:0]        sel0 , sel1 , sel2 , sel3 , sel4 , sel5 , sel6 , sel7 , 
                      sel8 , sel9 , sel10, sel11, sel12, sel13, sel14, sel15, 
                      sel16, sel17, sel18, sel19, sel20, sel21, sel22, sel23, 
                      sel24, sel25, sel26, sel27, sel28, sel29, sel30, sel31, 
                      sel32, sel33, sel34, sel35, sel36, sel37, sel38, sel39, 
                      sel40, sel41, sel42, sel43, sel44, sel45, sel46, sel47, 
                      sel48, sel49, sel50, sel51, sel52, sel53, sel54, sel55, 
                      sel56, sel57, sel58, sel59, sel60, sel61, sel62, sel63; // 64 induvidual decision.
   input [5:0]        index; // pointer to the state which has the maximum metric (one of the 64 states)
   output             symEnOut, sym2xEnOut;
   output [1:0]       decision;

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

           tbt3_0 <= 0;  tbt3_1 <= 0;  tbt3_2 <= 0;  tbt3_3 <= 0;  tbt3_4 <= 0;  tbt3_5 <= 0;  tbt3_6 <= 0;  tbt3_7 <= 0; 
           tbt3_8 <= 0;  tbt3_9 <= 0;  tbt3_10 <= 0; tbt3_11 <= 0; tbt3_12 <= 0; tbt3_13 <= 0; tbt3_14 <= 0; tbt3_15 <= 0;
           tbt3_16 <= 0; tbt3_17 <= 0; tbt3_18 <= 0; tbt3_19 <= 0; tbt3_20 <= 0; tbt3_21 <= 0; tbt3_22 <= 0; tbt3_23 <= 0;
           tbt3_24 <= 0; tbt3_25 <= 0; tbt3_26 <= 0; tbt3_27 <= 0; tbt3_28 <= 0; tbt3_29 <= 0; tbt3_30 <= 0; tbt3_31 <= 0;
           tbt3_32 <= 0; tbt3_33 <= 0; tbt3_34 <= 0; tbt3_35 <= 0; tbt3_36 <= 0; tbt3_37 <= 0; tbt3_38 <= 0; tbt3_39 <= 0;
           tbt3_40 <= 0; tbt3_41 <= 0; tbt3_42 <= 0; tbt3_43 <= 0; tbt3_44 <= 0; tbt3_45 <= 0; tbt3_46 <= 0; tbt3_47 <= 0;
           tbt3_48 <= 0; tbt3_49 <= 0; tbt3_50 <= 0; tbt3_51 <= 0; tbt3_52 <= 0; tbt3_53 <= 0; tbt3_54 <= 0; tbt3_55 <= 0;
           tbt3_56 <= 0; tbt3_57 <= 0; tbt3_58 <= 0; tbt3_59 <= 0; tbt3_60 <= 0; tbt3_61 <= 0; tbt3_62 <= 0; tbt3_63 <= 0;

           tbt4_0 <= 0;  tbt4_1 <= 0;  tbt4_2 <= 0;  tbt4_3 <= 0;  tbt4_4 <= 0;  tbt4_5 <= 0;  tbt4_6 <= 0;  tbt4_7 <= 0; 
           tbt4_8 <= 0;  tbt4_9 <= 0;  tbt4_10 <= 0; tbt4_11 <= 0; tbt4_12 <= 0; tbt4_13 <= 0; tbt4_14 <= 0; tbt4_15 <= 0;
           tbt4_16 <= 0; tbt4_17 <= 0; tbt4_18 <= 0; tbt4_19 <= 0; tbt4_20 <= 0; tbt4_21 <= 0; tbt4_22 <= 0; tbt4_23 <= 0;
           tbt4_24 <= 0; tbt4_25 <= 0; tbt4_26 <= 0; tbt4_27 <= 0; tbt4_28 <= 0; tbt4_29 <= 0; tbt4_30 <= 0; tbt4_31 <= 0;
           tbt4_32 <= 0; tbt4_33 <= 0; tbt4_34 <= 0; tbt4_35 <= 0; tbt4_36 <= 0; tbt4_37 <= 0; tbt4_38 <= 0; tbt4_39 <= 0;
           tbt4_40 <= 0; tbt4_41 <= 0; tbt4_42 <= 0; tbt4_43 <= 0; tbt4_44 <= 0; tbt4_45 <= 0; tbt4_46 <= 0; tbt4_47 <= 0;
           tbt4_48 <= 0; tbt4_49 <= 0; tbt4_50 <= 0; tbt4_51 <= 0; tbt4_52 <= 0; tbt4_53 <= 0; tbt4_54 <= 0; tbt4_55 <= 0;
           tbt4_56 <= 0; tbt4_57 <= 0; tbt4_58 <= 0; tbt4_59 <= 0; tbt4_60 <= 0; tbt4_61 <= 0; tbt4_62 <= 0; tbt4_63 <= 0;

           tbt5_0 <= 0;  tbt5_1 <= 0;  tbt5_2 <= 0;  tbt5_3 <= 0;  tbt5_4 <= 0;  tbt5_5 <= 0;  tbt5_6 <= 0;  tbt5_7 <= 0; 
           tbt5_8 <= 0;  tbt5_9 <= 0;  tbt5_10 <= 0; tbt5_11 <= 0; tbt5_12 <= 0; tbt5_13 <= 0; tbt5_14 <= 0; tbt5_15 <= 0;
           tbt5_16 <= 0; tbt5_17 <= 0; tbt5_18 <= 0; tbt5_19 <= 0; tbt5_20 <= 0; tbt5_21 <= 0; tbt5_22 <= 0; tbt5_23 <= 0;
           tbt5_24 <= 0; tbt5_25 <= 0; tbt5_26 <= 0; tbt5_27 <= 0; tbt5_28 <= 0; tbt5_29 <= 0; tbt5_30 <= 0; tbt5_31 <= 0;
           tbt5_32 <= 0; tbt5_33 <= 0; tbt5_34 <= 0; tbt5_35 <= 0; tbt5_36 <= 0; tbt5_37 <= 0; tbt5_38 <= 0; tbt5_39 <= 0;
           tbt5_40 <= 0; tbt5_41 <= 0; tbt5_42 <= 0; tbt5_43 <= 0; tbt5_44 <= 0; tbt5_45 <= 0; tbt5_46 <= 0; tbt5_47 <= 0;
           tbt5_48 <= 0; tbt5_49 <= 0; tbt5_50 <= 0; tbt5_51 <= 0; tbt5_52 <= 0; tbt5_53 <= 0; tbt5_54 <= 0; tbt5_55 <= 0;
           tbt5_56 <= 0; tbt5_57 <= 0; tbt5_58 <= 0; tbt5_59 <= 0; tbt5_60 <= 0; tbt5_61 <= 0; tbt5_62 <= 0; tbt5_63 <= 0;

           tbt6_0 <= 0;  tbt6_1 <= 0;  tbt6_2 <= 0;  tbt6_3 <= 0;  tbt6_4 <= 0;  tbt6_5 <= 0;  tbt6_6 <= 0;  tbt6_7 <= 0; 
           tbt6_8 <= 0;  tbt6_9 <= 0;  tbt6_10 <= 0; tbt6_11 <= 0; tbt6_12 <= 0; tbt6_13 <= 0; tbt6_14 <= 0; tbt6_15 <= 0;
           tbt6_16 <= 0; tbt6_17 <= 0; tbt6_18 <= 0; tbt6_19 <= 0; tbt6_20 <= 0; tbt6_21 <= 0; tbt6_22 <= 0; tbt6_23 <= 0;
           tbt6_24 <= 0; tbt6_25 <= 0; tbt6_26 <= 0; tbt6_27 <= 0; tbt6_28 <= 0; tbt6_29 <= 0; tbt6_30 <= 0; tbt6_31 <= 0;
           tbt6_32 <= 0; tbt6_33 <= 0; tbt6_34 <= 0; tbt6_35 <= 0; tbt6_36 <= 0; tbt6_37 <= 0; tbt6_38 <= 0; tbt6_39 <= 0;
           tbt6_40 <= 0; tbt6_41 <= 0; tbt6_42 <= 0; tbt6_43 <= 0; tbt6_44 <= 0; tbt6_45 <= 0; tbt6_46 <= 0; tbt6_47 <= 0;
           tbt6_48 <= 0; tbt6_49 <= 0; tbt6_50 <= 0; tbt6_51 <= 0; tbt6_52 <= 0; tbt6_53 <= 0; tbt6_54 <= 0; tbt6_55 <= 0;
           tbt6_56 <= 0; tbt6_57 <= 0; tbt6_58 <= 0; tbt6_59 <= 0; tbt6_60 <= 0; tbt6_61 <= 0; tbt6_62 <= 0; tbt6_63 <= 0;

           tbt7_0 <= 0;  tbt7_1 <= 0;  tbt7_2 <= 0;  tbt7_3 <= 0;  tbt7_4 <= 0;  tbt7_5 <= 0;  tbt7_6 <= 0;  tbt7_7 <= 0; 
           tbt7_8 <= 0;  tbt7_9 <= 0;  tbt7_10 <= 0; tbt7_11 <= 0; tbt7_12 <= 0; tbt7_13 <= 0; tbt7_14 <= 0; tbt7_15 <= 0;
           tbt7_16 <= 0; tbt7_17 <= 0; tbt7_18 <= 0; tbt7_19 <= 0; tbt7_20 <= 0; tbt7_21 <= 0; tbt7_22 <= 0; tbt7_23 <= 0;
           tbt7_24 <= 0; tbt7_25 <= 0; tbt7_26 <= 0; tbt7_27 <= 0; tbt7_28 <= 0; tbt7_29 <= 0; tbt7_30 <= 0; tbt7_31 <= 0;
           tbt7_32 <= 0; tbt7_33 <= 0; tbt7_34 <= 0; tbt7_35 <= 0; tbt7_36 <= 0; tbt7_37 <= 0; tbt7_38 <= 0; tbt7_39 <= 0;
           tbt7_40 <= 0; tbt7_41 <= 0; tbt7_42 <= 0; tbt7_43 <= 0; tbt7_44 <= 0; tbt7_45 <= 0; tbt7_46 <= 0; tbt7_47 <= 0;
           tbt7_48 <= 0; tbt7_49 <= 0; tbt7_50 <= 0; tbt7_51 <= 0; tbt7_52 <= 0; tbt7_53 <= 0; tbt7_54 <= 0; tbt7_55 <= 0;
           tbt7_56 <= 0; tbt7_57 <= 0; tbt7_58 <= 0; tbt7_59 <= 0; tbt7_60 <= 0; tbt7_61 <= 0; tbt7_62 <= 0; tbt7_63 <= 0;
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


   reg symEnEvenToggle;   // indicates the 45/54 interval
     always @(posedge clk)
     if (reset) begin
        symEnEvenToggle <= 0;
     end
     else if (symEnEven && symEn) begin
        symEnEvenToggle <= symEnEven;
     end
     else begin
        symEnEvenToggle <= ~symEnEvenToggle;
     end



   // shift, used to shift the nState when the new symEn happen
   reg                shift;
   always @(posedge clk)
     begin
        if (reset) begin
           shift <= 0;
        end
        else if (!symEnEven && symEn) begin
           shift <= 1;
        end
        else begin
           shift <= 0;
        end
     end
   

   // state Machine counter
   reg [4:0]          stateCnt;
   always @(posedge clk)
     begin
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


   reg [5:0]     nState4shift, nState5shift, nState6shift, nState7shift, nState8shift;
   always @(shift or outputCnt or nState3 or nState4)
     if (shift && (outputCnt==4)) begin //have to shift the state outputs due to a new set of acs decisions are latched in on the new symEn 
        nState4shift  <= nState3;
     end
     else begin // normal mode
        nState4shift <= nState4 ;
     end

   always @(shift or outputCnt or nState4 or nState5)
     if (shift && (outputCnt==5)) begin //have to shift the state outputs due to a new set of acs decisions are latched in on the new symEn 
        nState5shift  <= nState4;
     end
     else begin // normal mode
        nState5shift <= nState5 ;
     end
   
   always @(shift or outputCnt or nState5 or nState6)
     if (shift && (outputCnt==6)) begin //have to shift the state outputs due to a new set of acs decisions are latched in on the new symEn 
        nState6shift  <= nState5;
     end
     else begin // normal mode
        nState6shift <= nState6 ;
     end
   
   always @(shift or outputCnt or nState6 or nState7)
     if (shift && (outputCnt==7)) begin //have to shift the state outputs due to a new set of acs decisions are latched in on the new symEn 
        nState7shift  <= nState6;
     end
     else begin // normal mode
        nState7shift <= nState7 ;
     end
   
   always @(shift or outputCnt or nState7 or nState8)
     if (shift && (outputCnt==8)) begin //have to shift the state outputs due to a new set of acs decisions are latched in on the new symEn 
        nState8shift  <= nState7;
     end
     else begin // normal mode
        nState8shift <= nState8 ;
     end
   
      
   
   wire [5:0] nState0, nState1, nState2, nState3, nState4, nState5, nState6, nState7, nState8;

   tbMux tbMux0 (.clk(clk), .reset(reset), .ce(), .symEnEvenToggle(symEnEvenToggle),  .cState(index       ), .tbt0  (sel0   ), .tbt1  (sel1   ), .tbt2  (sel2   ), .tbt3  (sel3   ), .tbt4  (sel4   ), .tbt5  (sel5   ), .tbt6  (sel6   ), .tbt7  (sel7   ), .tbt8  (sel8   ), .tbt9  (sel9   ), .tbt10 (sel10  ), .tbt11 (sel11  ), .tbt12 (sel12  ), .tbt13 (sel13  ), .tbt14 (sel14  ), .tbt15 (sel15  ), .tbt16 (sel16  ), .tbt17 (sel17  ), .tbt18 (sel18  ), .tbt19 (sel19  ), .tbt20 (sel20  ), .tbt21 (sel21  ), .tbt22 (sel22  ), .tbt23 (sel23  ), .tbt24 (sel24  ), .tbt25 (sel25  ), .tbt26 (sel26  ), .tbt27 (sel27  ), .tbt28 (sel28  ), .tbt29 (sel29  ), .tbt30 (sel30  ), .tbt31 (sel31  ), .tbt32 (sel32  ), .tbt33 (sel33  ), .tbt34 (sel34  ), .tbt35 (sel35  ), .tbt36 (sel36  ), .tbt37 (sel37  ), .tbt38 (sel38  ), .tbt39 (sel39  ), .tbt40 (sel40  ), .tbt41 (sel41  ), .tbt42 (sel42  ), .tbt43 (sel43  ), .tbt44 (sel44  ), .tbt45 (sel45  ), .tbt46 (sel46  ), .tbt47 (sel47  ), .tbt48 (sel48  ), .tbt49 (sel49  ), .tbt50 (sel50  ), .tbt51 (sel51  ), .tbt52 (sel52  ), .tbt53 (sel53  ), .tbt54 (sel54  ), .tbt55 (sel55  ), .tbt56 (sel56  ), .tbt57 (sel57  ), .tbt58 (sel58  ), .tbt59 (sel59  ), .tbt60 (sel60  ), .tbt61 (sel61  ), .tbt62 (sel62  ), .tbt63 (sel63  ),   .nState(nState0) );
   tbMux tbMux1 (.clk(clk), .reset(reset), .ce(), .symEnEvenToggle(symEnEvenToggle),  .cState(nState0     ), .tbt0  (tbt0_0 ), .tbt1  (tbt0_1 ), .tbt2  (tbt0_2 ), .tbt3  (tbt0_3 ), .tbt4  (tbt0_4 ), .tbt5  (tbt0_5 ), .tbt6  (tbt0_6 ), .tbt7  (tbt0_7 ), .tbt8  (tbt0_8 ), .tbt9  (tbt0_9 ), .tbt10 (tbt0_10), .tbt11 (tbt0_11), .tbt12 (tbt0_12), .tbt13 (tbt0_13), .tbt14 (tbt0_14), .tbt15 (tbt0_15), .tbt16 (tbt0_16), .tbt17 (tbt0_17), .tbt18 (tbt0_18), .tbt19 (tbt0_19), .tbt20 (tbt0_20), .tbt21 (tbt0_21), .tbt22 (tbt0_22), .tbt23 (tbt0_23), .tbt24 (tbt0_24), .tbt25 (tbt0_25), .tbt26 (tbt0_26), .tbt27 (tbt0_27), .tbt28 (tbt0_28), .tbt29 (tbt0_29), .tbt30 (tbt0_30), .tbt31 (tbt0_31), .tbt32 (tbt0_32), .tbt33 (tbt0_33), .tbt34 (tbt0_34), .tbt35 (tbt0_35), .tbt36 (tbt0_36), .tbt37 (tbt0_37), .tbt38 (tbt0_38), .tbt39 (tbt0_39), .tbt40 (tbt0_40), .tbt41 (tbt0_41), .tbt42 (tbt0_42), .tbt43 (tbt0_43), .tbt44 (tbt0_44), .tbt45 (tbt0_45), .tbt46 (tbt0_46), .tbt47 (tbt0_47), .tbt48 (tbt0_48), .tbt49 (tbt0_49), .tbt50 (tbt0_50), .tbt51 (tbt0_51), .tbt52 (tbt0_52), .tbt53 (tbt0_53), .tbt54 (tbt0_54), .tbt55 (tbt0_55), .tbt56 (tbt0_56), .tbt57 (tbt0_57), .tbt58 (tbt0_58), .tbt59 (tbt0_59), .tbt60 (tbt0_60), .tbt61 (tbt0_61), .tbt62 (tbt0_62), .tbt63 (tbt0_63),   .nState(nState1) );
   tbMux tbMux2 (.clk(clk), .reset(reset), .ce(), .symEnEvenToggle(symEnEvenToggle),  .cState(nState1     ), .tbt0  (tbt1_0 ), .tbt1  (tbt1_1 ), .tbt2  (tbt1_2 ), .tbt3  (tbt1_3 ), .tbt4  (tbt1_4 ), .tbt5  (tbt1_5 ), .tbt6  (tbt1_6 ), .tbt7  (tbt1_7 ), .tbt8  (tbt1_8 ), .tbt9  (tbt1_9 ), .tbt10 (tbt1_10), .tbt11 (tbt1_11), .tbt12 (tbt1_12), .tbt13 (tbt1_13), .tbt14 (tbt1_14), .tbt15 (tbt1_15), .tbt16 (tbt1_16), .tbt17 (tbt1_17), .tbt18 (tbt1_18), .tbt19 (tbt1_19), .tbt20 (tbt1_20), .tbt21 (tbt1_21), .tbt22 (tbt1_22), .tbt23 (tbt1_23), .tbt24 (tbt1_24), .tbt25 (tbt1_25), .tbt26 (tbt1_26), .tbt27 (tbt1_27), .tbt28 (tbt1_28), .tbt29 (tbt1_29), .tbt30 (tbt1_30), .tbt31 (tbt1_31), .tbt32 (tbt1_32), .tbt33 (tbt1_33), .tbt34 (tbt1_34), .tbt35 (tbt1_35), .tbt36 (tbt1_36), .tbt37 (tbt1_37), .tbt38 (tbt1_38), .tbt39 (tbt1_39), .tbt40 (tbt1_40), .tbt41 (tbt1_41), .tbt42 (tbt1_42), .tbt43 (tbt1_43), .tbt44 (tbt1_44), .tbt45 (tbt1_45), .tbt46 (tbt1_46), .tbt47 (tbt1_47), .tbt48 (tbt1_48), .tbt49 (tbt1_49), .tbt50 (tbt1_50), .tbt51 (tbt1_51), .tbt52 (tbt1_52), .tbt53 (tbt1_53), .tbt54 (tbt1_54), .tbt55 (tbt1_55), .tbt56 (tbt1_56), .tbt57 (tbt1_57), .tbt58 (tbt1_58), .tbt59 (tbt1_59), .tbt60 (tbt1_60), .tbt61 (tbt1_61), .tbt62 (tbt1_62), .tbt63 (tbt1_63),   .nState(nState2) );
   tbMux tbMux3 (.clk(clk), .reset(reset), .ce(), .symEnEvenToggle(symEnEvenToggle),  .cState(nState2     ), .tbt0  (tbt2_0 ), .tbt1  (tbt2_1 ), .tbt2  (tbt2_2 ), .tbt3  (tbt2_3 ), .tbt4  (tbt2_4 ), .tbt5  (tbt2_5 ), .tbt6  (tbt2_6 ), .tbt7  (tbt2_7 ), .tbt8  (tbt2_8 ), .tbt9  (tbt2_9 ), .tbt10 (tbt2_10), .tbt11 (tbt2_11), .tbt12 (tbt2_12), .tbt13 (tbt2_13), .tbt14 (tbt2_14), .tbt15 (tbt2_15), .tbt16 (tbt2_16), .tbt17 (tbt2_17), .tbt18 (tbt2_18), .tbt19 (tbt2_19), .tbt20 (tbt2_20), .tbt21 (tbt2_21), .tbt22 (tbt2_22), .tbt23 (tbt2_23), .tbt24 (tbt2_24), .tbt25 (tbt2_25), .tbt26 (tbt2_26), .tbt27 (tbt2_27), .tbt28 (tbt2_28), .tbt29 (tbt2_29), .tbt30 (tbt2_30), .tbt31 (tbt2_31), .tbt32 (tbt2_32), .tbt33 (tbt2_33), .tbt34 (tbt2_34), .tbt35 (tbt2_35), .tbt36 (tbt2_36), .tbt37 (tbt2_37), .tbt38 (tbt2_38), .tbt39 (tbt2_39), .tbt40 (tbt2_40), .tbt41 (tbt2_41), .tbt42 (tbt2_42), .tbt43 (tbt2_43), .tbt44 (tbt2_44), .tbt45 (tbt2_45), .tbt46 (tbt2_46), .tbt47 (tbt2_47), .tbt48 (tbt2_48), .tbt49 (tbt2_49), .tbt50 (tbt2_50), .tbt51 (tbt2_51), .tbt52 (tbt2_52), .tbt53 (tbt2_53), .tbt54 (tbt2_54), .tbt55 (tbt2_55), .tbt56 (tbt2_56), .tbt57 (tbt2_57), .tbt58 (tbt2_58), .tbt59 (tbt2_59), .tbt60 (tbt2_60), .tbt61 (tbt2_61), .tbt62 (tbt2_62), .tbt63 (tbt2_63),   .nState(nState3) );
   tbMux tbMux4 (.clk(clk), .reset(reset), .ce(), .symEnEvenToggle(symEnEvenToggle),  .cState(nState3     ), .tbt0  (tbt3_0 ), .tbt1  (tbt3_1 ), .tbt2  (tbt3_2 ), .tbt3  (tbt3_3 ), .tbt4  (tbt3_4 ), .tbt5  (tbt3_5 ), .tbt6  (tbt3_6 ), .tbt7  (tbt3_7 ), .tbt8  (tbt3_8 ), .tbt9  (tbt3_9 ), .tbt10 (tbt3_10), .tbt11 (tbt3_11), .tbt12 (tbt3_12), .tbt13 (tbt3_13), .tbt14 (tbt3_14), .tbt15 (tbt3_15), .tbt16 (tbt3_16), .tbt17 (tbt3_17), .tbt18 (tbt3_18), .tbt19 (tbt3_19), .tbt20 (tbt3_20), .tbt21 (tbt3_21), .tbt22 (tbt3_22), .tbt23 (tbt3_23), .tbt24 (tbt3_24), .tbt25 (tbt3_25), .tbt26 (tbt3_26), .tbt27 (tbt3_27), .tbt28 (tbt3_28), .tbt29 (tbt3_29), .tbt30 (tbt3_30), .tbt31 (tbt3_31), .tbt32 (tbt3_32), .tbt33 (tbt3_33), .tbt34 (tbt3_34), .tbt35 (tbt3_35), .tbt36 (tbt3_36), .tbt37 (tbt3_37), .tbt38 (tbt3_38), .tbt39 (tbt3_39), .tbt40 (tbt3_40), .tbt41 (tbt3_41), .tbt42 (tbt3_42), .tbt43 (tbt3_43), .tbt44 (tbt3_44), .tbt45 (tbt3_45), .tbt46 (tbt3_46), .tbt47 (tbt3_47), .tbt48 (tbt3_48), .tbt49 (tbt3_49), .tbt50 (tbt3_50), .tbt51 (tbt3_51), .tbt52 (tbt3_52), .tbt53 (tbt3_53), .tbt54 (tbt3_54), .tbt55 (tbt3_55), .tbt56 (tbt3_56), .tbt57 (tbt3_57), .tbt58 (tbt3_58), .tbt59 (tbt3_59), .tbt60 (tbt3_60), .tbt61 (tbt3_61), .tbt62 (tbt3_62), .tbt63 (tbt3_63),   .nState(nState4) );
   tbMux tbMux5 (.clk(clk), .reset(reset), .ce(), .symEnEvenToggle(symEnEvenToggle),  .cState(nState4shift), .tbt0  (tbt4_0 ), .tbt1  (tbt4_1 ), .tbt2  (tbt4_2 ), .tbt3  (tbt4_3 ), .tbt4  (tbt4_4 ), .tbt5  (tbt4_5 ), .tbt6  (tbt4_6 ), .tbt7  (tbt4_7 ), .tbt8  (tbt4_8 ), .tbt9  (tbt4_9 ), .tbt10 (tbt4_10), .tbt11 (tbt4_11), .tbt12 (tbt4_12), .tbt13 (tbt4_13), .tbt14 (tbt4_14), .tbt15 (tbt4_15), .tbt16 (tbt4_16), .tbt17 (tbt4_17), .tbt18 (tbt4_18), .tbt19 (tbt4_19), .tbt20 (tbt4_20), .tbt21 (tbt4_21), .tbt22 (tbt4_22), .tbt23 (tbt4_23), .tbt24 (tbt4_24), .tbt25 (tbt4_25), .tbt26 (tbt4_26), .tbt27 (tbt4_27), .tbt28 (tbt4_28), .tbt29 (tbt4_29), .tbt30 (tbt4_30), .tbt31 (tbt4_31), .tbt32 (tbt4_32), .tbt33 (tbt4_33), .tbt34 (tbt4_34), .tbt35 (tbt4_35), .tbt36 (tbt4_36), .tbt37 (tbt4_37), .tbt38 (tbt4_38), .tbt39 (tbt4_39), .tbt40 (tbt4_40), .tbt41 (tbt4_41), .tbt42 (tbt4_42), .tbt43 (tbt4_43), .tbt44 (tbt4_44), .tbt45 (tbt4_45), .tbt46 (tbt4_46), .tbt47 (tbt4_47), .tbt48 (tbt4_48), .tbt49 (tbt4_49), .tbt50 (tbt4_50), .tbt51 (tbt4_51), .tbt52 (tbt4_52), .tbt53 (tbt4_53), .tbt54 (tbt4_54), .tbt55 (tbt4_55), .tbt56 (tbt4_56), .tbt57 (tbt4_57), .tbt58 (tbt4_58), .tbt59 (tbt4_59), .tbt60 (tbt4_60), .tbt61 (tbt4_61), .tbt62 (tbt4_62), .tbt63 (tbt4_63),   .nState(nState5) );
   tbMux tbMux6 (.clk(clk), .reset(reset), .ce(), .symEnEvenToggle(symEnEvenToggle),  .cState(nState5shift), .tbt0  (tbt5_0 ), .tbt1  (tbt5_1 ), .tbt2  (tbt5_2 ), .tbt3  (tbt5_3 ), .tbt4  (tbt5_4 ), .tbt5  (tbt5_5 ), .tbt6  (tbt5_6 ), .tbt7  (tbt5_7 ), .tbt8  (tbt5_8 ), .tbt9  (tbt5_9 ), .tbt10 (tbt5_10), .tbt11 (tbt5_11), .tbt12 (tbt5_12), .tbt13 (tbt5_13), .tbt14 (tbt5_14), .tbt15 (tbt5_15), .tbt16 (tbt5_16), .tbt17 (tbt5_17), .tbt18 (tbt5_18), .tbt19 (tbt5_19), .tbt20 (tbt5_20), .tbt21 (tbt5_21), .tbt22 (tbt5_22), .tbt23 (tbt5_23), .tbt24 (tbt5_24), .tbt25 (tbt5_25), .tbt26 (tbt5_26), .tbt27 (tbt5_27), .tbt28 (tbt5_28), .tbt29 (tbt5_29), .tbt30 (tbt5_30), .tbt31 (tbt5_31), .tbt32 (tbt5_32), .tbt33 (tbt5_33), .tbt34 (tbt5_34), .tbt35 (tbt5_35), .tbt36 (tbt5_36), .tbt37 (tbt5_37), .tbt38 (tbt5_38), .tbt39 (tbt5_39), .tbt40 (tbt5_40), .tbt41 (tbt5_41), .tbt42 (tbt5_42), .tbt43 (tbt5_43), .tbt44 (tbt5_44), .tbt45 (tbt5_45), .tbt46 (tbt5_46), .tbt47 (tbt5_47), .tbt48 (tbt5_48), .tbt49 (tbt5_49), .tbt50 (tbt5_50), .tbt51 (tbt5_51), .tbt52 (tbt5_52), .tbt53 (tbt5_53), .tbt54 (tbt5_54), .tbt55 (tbt5_55), .tbt56 (tbt5_56), .tbt57 (tbt5_57), .tbt58 (tbt5_58), .tbt59 (tbt5_59), .tbt60 (tbt5_60), .tbt61 (tbt5_61), .tbt62 (tbt5_62), .tbt63 (tbt5_63),   .nState(nState6) );
   tbMux tbMux7 (.clk(clk), .reset(reset), .ce(), .symEnEvenToggle(symEnEvenToggle),  .cState(nState6shift), .tbt0  (tbt6_0 ), .tbt1  (tbt6_1 ), .tbt2  (tbt6_2 ), .tbt3  (tbt6_3 ), .tbt4  (tbt6_4 ), .tbt5  (tbt6_5 ), .tbt6  (tbt6_6 ), .tbt7  (tbt6_7 ), .tbt8  (tbt6_8 ), .tbt9  (tbt6_9 ), .tbt10 (tbt6_10), .tbt11 (tbt6_11), .tbt12 (tbt6_12), .tbt13 (tbt6_13), .tbt14 (tbt6_14), .tbt15 (tbt6_15), .tbt16 (tbt6_16), .tbt17 (tbt6_17), .tbt18 (tbt6_18), .tbt19 (tbt6_19), .tbt20 (tbt6_20), .tbt21 (tbt6_21), .tbt22 (tbt6_22), .tbt23 (tbt6_23), .tbt24 (tbt6_24), .tbt25 (tbt6_25), .tbt26 (tbt6_26), .tbt27 (tbt6_27), .tbt28 (tbt6_28), .tbt29 (tbt6_29), .tbt30 (tbt6_30), .tbt31 (tbt6_31), .tbt32 (tbt6_32), .tbt33 (tbt6_33), .tbt34 (tbt6_34), .tbt35 (tbt6_35), .tbt36 (tbt6_36), .tbt37 (tbt6_37), .tbt38 (tbt6_38), .tbt39 (tbt6_39), .tbt40 (tbt6_40), .tbt41 (tbt6_41), .tbt42 (tbt6_42), .tbt43 (tbt6_43), .tbt44 (tbt6_44), .tbt45 (tbt6_45), .tbt46 (tbt6_46), .tbt47 (tbt6_47), .tbt48 (tbt6_48), .tbt49 (tbt6_49), .tbt50 (tbt6_50), .tbt51 (tbt6_51), .tbt52 (tbt6_52), .tbt53 (tbt6_53), .tbt54 (tbt6_54), .tbt55 (tbt6_55), .tbt56 (tbt6_56), .tbt57 (tbt6_57), .tbt58 (tbt6_58), .tbt59 (tbt6_59), .tbt60 (tbt6_60), .tbt61 (tbt6_61), .tbt62 (tbt6_62), .tbt63 (tbt6_63),   .nState(nState7) );
   tbMux tbMux8 (.clk(clk), .reset(reset), .ce(), .symEnEvenToggle(symEnEvenToggle),  .cState(nState7shift), .tbt0  (tbt7_0 ), .tbt1  (tbt7_1 ), .tbt2  (tbt7_2 ), .tbt3  (tbt7_3 ), .tbt4  (tbt7_4 ), .tbt5  (tbt7_5 ), .tbt6  (tbt7_6 ), .tbt7  (tbt7_7 ), .tbt8  (tbt7_8 ), .tbt9  (tbt7_9 ), .tbt10 (tbt7_10), .tbt11 (tbt7_11), .tbt12 (tbt7_12), .tbt13 (tbt7_13), .tbt14 (tbt7_14), .tbt15 (tbt7_15), .tbt16 (tbt7_16), .tbt17 (tbt7_17), .tbt18 (tbt7_18), .tbt19 (tbt7_19), .tbt20 (tbt7_20), .tbt21 (tbt7_21), .tbt22 (tbt7_22), .tbt23 (tbt7_23), .tbt24 (tbt7_24), .tbt25 (tbt7_25), .tbt26 (tbt7_26), .tbt27 (tbt7_27), .tbt28 (tbt7_28), .tbt29 (tbt7_29), .tbt30 (tbt7_30), .tbt31 (tbt7_31), .tbt32 (tbt7_32), .tbt33 (tbt7_33), .tbt34 (tbt7_34), .tbt35 (tbt7_35), .tbt36 (tbt7_36), .tbt37 (tbt7_37), .tbt38 (tbt7_38), .tbt39 (tbt7_39), .tbt40 (tbt7_40), .tbt41 (tbt7_41), .tbt42 (tbt7_42), .tbt43 (tbt7_43), .tbt44 (tbt7_44), .tbt45 (tbt7_45), .tbt46 (tbt7_46), .tbt47 (tbt7_47), .tbt48 (tbt7_48), .tbt49 (tbt7_49), .tbt50 (tbt7_50), .tbt51 (tbt7_51), .tbt52 (tbt7_52), .tbt53 (tbt7_53), .tbt54 (tbt7_54), .tbt55 (tbt7_55), .tbt56 (tbt7_56), .tbt57 (tbt7_57), .tbt58 (tbt7_58), .tbt59 (tbt7_59), .tbt60 (tbt7_60), .tbt61 (tbt7_61), .tbt62 (tbt7_62), .tbt63 (tbt7_63),   .nState(nState8) );
                                                                                              
   // Two decision gets computed every second symEn. The two decisions gets shited into a 2 bit shift register then shifted out on every symEn.
   // outputCnt count from 0 to 8
   // stateCnt counts counts from 0 to 8 too but skips one number when a second symEn happens during faster symbol rate. 
   // These two countes lets us pick the right two decisions  
   reg [5:0]  indexTb, first, second;
   always @(posedge clk) begin
      if (reset) begin
         first <= 0;
         second <= 0;
      end
      else begin
         // Latching the first decision
         if (outputCnt == 6) begin  
            // case when a second symEn has happend (during fast symbol rate)
            if (stateCnt == 7) begin
               second <= nState6shift;            
            end
            else if (stateCnt == 6) begin
               second <= nState5;            
            end
         end
         // Latching the second decision
         else if (outputCnt == 7) begin
            if (stateCnt >= 8) begin
               first <= nState7shift;
            end
            else if (stateCnt == 7) begin  
               first <= nState6;
            end
         end
      end
   end
        


   reg [7:0] symEnSr;
   reg [7:0] sym2xEnSr;
   always @(posedge clk) begin
      if (reset) begin
         symEnSr <= 0;
         sym2xEnSr <= 0;
      end
      else begin
         symEnSr <= {symEnSr[6:0], symEn};
         sym2xEnSr <= {sym2xEnSr[6:0], sym2xEn};
      end
   end
   wire symEnOut = symEnSr[6];
   wire sym2xEnOut = sym2xEnSr[6];


   reg [7:0] symEnEvenSr;
   always @(posedge clk) begin
      if (reset) begin
         symEnEvenSr <= 0;
      end
      else begin
         symEnEvenSr <= {symEnEvenSr[6:0], symEnEven};
      end
   end
   wire symEnEvenOut = symEnEvenSr[6];

   
         
   // Final decision output 
   always @(posedge clk) begin
      if (reset) begin
         indexTb <= 0;
      end
      else if (symEnOut) begin  
         if (!symEnEvenOut) begin
            indexTb <= first;
         end
         else begin
            indexTb <= second;
         end
      end 
   end

   wire [1:0] decision = indexTb[1:0];
 


`ifdef SIMULATE
   reg [5:0]  indexSr [14:0];
   always @(posedge clk) begin
      if (symEn) begin
           indexSr[0] <= index;
           indexSr[1] <= indexSr[0];
           indexSr[2] <= indexSr[1];
           indexSr[3] <= indexSr[2];
           indexSr[4] <= indexSr[3];
           indexSr[5] <= indexSr[4];
           indexSr[6] <= indexSr[5];
           indexSr[7] <= indexSr[6];
      end
      indexSr[8]  <= indexSr[7];
      indexSr[9]  <= indexSr[8];
      indexSr[10] <= indexSr[9];
      indexSr[11] <= indexSr[10];
      indexSr[12] <= indexSr[11];
      indexSr[13] <= indexSr[12];
      indexSr[14] <= indexSr[13];
   end
   

   always @(posedge clk) begin
      if (symEnOut) begin
         if ( (indexSr[14] == indexTb) && (indexSr[14][1:0] == decision))
           $display("\t%d\t%d", indexTb, decision);
         else
           $display("\t%d\t%d\tError\t%d\t%d", indexTb, decision, indexSr[14], indexSr[14][1:0]);
         //$display("\t%d\t%d\t%d\t%d\t\t%d", indexSr[9], indexTb, indexSr[9][1:0], decision,  nState0[1:0]);
      end
   end
`endif


         
endmodule // traceBackMultiH

 
