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
   
   reg [1:0]          sel0r,  sel1r,  sel2r,  sel3r,  sel4r,  sel5r,  sel6r,  sel7r, 
                      sel8r,  sel9r,  sel10r, sel11r, sel12r, sel13r, sel14r, sel15r,
                      sel16r, sel17r, sel18r, sel19r, sel20r, sel21r, sel22r, sel23r,
                      sel24r, sel25r, sel26r, sel27r, sel28r, sel29r, sel30r, sel31r,
                      sel32r, sel33r, sel34r, sel35r, sel36r, sel37r, sel38r, sel39r,
                      sel40r, sel41r, sel42r, sel43r, sel44r, sel45r, sel46r, sel47r,
                      sel48r, sel49r, sel50r, sel51r, sel52r, sel53r, sel54r, sel55r,
                      sel56r, sel57r, sel58r, sel59r, sel60r, sel61r, sel62r, sel63r;

   // state Machine counter
   reg [2:0] stateCnt;
   always @(posedge clk)
     begin
        if (reset || symEn) begin
           stateCnt <= 0;
        end
        else begin
           if (stateCnt < 4) // stay in the state
             stateCnt <= stateCnt+1;
           else
             stateCnt <= stateCnt;
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
           if (stateCnt==3) begin  
              tbt0_0  <= sel0r ;   tbt1_0  <= tbt0_0 ;   tbt2_0  <= tbt1_0 ;
              tbt0_1  <= sel1r ;   tbt1_1  <= tbt0_1 ;   tbt2_1  <= tbt1_1 ;
              tbt0_2  <= sel2r ;   tbt1_2  <= tbt0_2 ;   tbt2_2  <= tbt1_2 ;
              tbt0_3  <= sel3r ;   tbt1_3  <= tbt0_3 ;   tbt2_3  <= tbt1_3 ;
              tbt0_4  <= sel4r ;   tbt1_4  <= tbt0_4 ;   tbt2_4  <= tbt1_4 ;
              tbt0_5  <= sel5r ;   tbt1_5  <= tbt0_5 ;   tbt2_5  <= tbt1_5 ;
              tbt0_6  <= sel6r ;   tbt1_6  <= tbt0_6 ;   tbt2_6  <= tbt1_6 ;
              tbt0_7  <= sel7r ;   tbt1_7  <= tbt0_7 ;   tbt2_7  <= tbt1_7 ;
              tbt0_8  <= sel8r ;   tbt1_8  <= tbt0_8 ;   tbt2_8  <= tbt1_8 ;
              tbt0_9  <= sel9r ;   tbt1_9  <= tbt0_9 ;   tbt2_9  <= tbt1_9 ;
              tbt0_10 <= sel10r;   tbt1_10 <= tbt0_10;   tbt2_10 <= tbt1_10;
              tbt0_11 <= sel11r;   tbt1_11 <= tbt0_11;   tbt2_11 <= tbt1_11;
              tbt0_12 <= sel12r;   tbt1_12 <= tbt0_12;   tbt2_12 <= tbt1_12;
              tbt0_13 <= sel13r;   tbt1_13 <= tbt0_13;   tbt2_13 <= tbt1_13;
              tbt0_14 <= sel14r;   tbt1_14 <= tbt0_14;   tbt2_14 <= tbt1_14;
              tbt0_15 <= sel15r;   tbt1_15 <= tbt0_15;   tbt2_15 <= tbt1_15;
              tbt0_16 <= sel16r;   tbt1_16 <= tbt0_16;   tbt2_16 <= tbt1_16;
              tbt0_17 <= sel17r;   tbt1_17 <= tbt0_17;   tbt2_17 <= tbt1_17;
              tbt0_18 <= sel18r;   tbt1_18 <= tbt0_18;   tbt2_18 <= tbt1_18;
              tbt0_19 <= sel19r;   tbt1_19 <= tbt0_19;   tbt2_19 <= tbt1_19;
              tbt0_20 <= sel20r;   tbt1_20 <= tbt0_20;   tbt2_20 <= tbt1_20;
              tbt0_21 <= sel21r;   tbt1_21 <= tbt0_21;   tbt2_21 <= tbt1_21;
              tbt0_22 <= sel22r;   tbt1_22 <= tbt0_22;   tbt2_22 <= tbt1_22;
              tbt0_23 <= sel23r;   tbt1_23 <= tbt0_23;   tbt2_23 <= tbt1_23;
              tbt0_24 <= sel24r;   tbt1_24 <= tbt0_24;   tbt2_24 <= tbt1_24;
              tbt0_25 <= sel25r;   tbt1_25 <= tbt0_25;   tbt2_25 <= tbt1_25;
              tbt0_26 <= sel26r;   tbt1_26 <= tbt0_26;   tbt2_26 <= tbt1_26;
              tbt0_27 <= sel27r;   tbt1_27 <= tbt0_27;   tbt2_27 <= tbt1_27;
              tbt0_28 <= sel28r;   tbt1_28 <= tbt0_28;   tbt2_28 <= tbt1_28;
              tbt0_29 <= sel29r;   tbt1_29 <= tbt0_29;   tbt2_29 <= tbt1_29;
              tbt0_30 <= sel30r;   tbt1_30 <= tbt0_30;   tbt2_30 <= tbt1_30;
              tbt0_31 <= sel31r;   tbt1_31 <= tbt0_31;   tbt2_31 <= tbt1_31;
              tbt0_32 <= sel32r;   tbt1_32 <= tbt0_32;   tbt2_32 <= tbt1_32;
              tbt0_33 <= sel33r;   tbt1_33 <= tbt0_33;   tbt2_33 <= tbt1_33;
              tbt0_34 <= sel34r;   tbt1_34 <= tbt0_34;   tbt2_34 <= tbt1_34;
              tbt0_35 <= sel35r;   tbt1_35 <= tbt0_35;   tbt2_35 <= tbt1_35;
              tbt0_36 <= sel36r;   tbt1_36 <= tbt0_36;   tbt2_36 <= tbt1_36;
              tbt0_37 <= sel37r;   tbt1_37 <= tbt0_37;   tbt2_37 <= tbt1_37;
              tbt0_38 <= sel38r;   tbt1_38 <= tbt0_38;   tbt2_38 <= tbt1_38;
              tbt0_39 <= sel39r;   tbt1_39 <= tbt0_39;   tbt2_39 <= tbt1_39;
              tbt0_40 <= sel40r;   tbt1_40 <= tbt0_40;   tbt2_40 <= tbt1_40;
              tbt0_41 <= sel41r;   tbt1_41 <= tbt0_41;   tbt2_41 <= tbt1_41;
              tbt0_42 <= sel42r;   tbt1_42 <= tbt0_42;   tbt2_42 <= tbt1_42;
              tbt0_43 <= sel43r;   tbt1_43 <= tbt0_43;   tbt2_43 <= tbt1_43;
              tbt0_44 <= sel44r;   tbt1_44 <= tbt0_44;   tbt2_44 <= tbt1_44;
              tbt0_45 <= sel45r;   tbt1_45 <= tbt0_45;   tbt2_45 <= tbt1_45;
              tbt0_46 <= sel46r;   tbt1_46 <= tbt0_46;   tbt2_46 <= tbt1_46;
              tbt0_47 <= sel47r;   tbt1_47 <= tbt0_47;   tbt2_47 <= tbt1_47;
              tbt0_48 <= sel48r;   tbt1_48 <= tbt0_48;   tbt2_48 <= tbt1_48;
              tbt0_49 <= sel49r;   tbt1_49 <= tbt0_49;   tbt2_49 <= tbt1_49;
              tbt0_50 <= sel50r;   tbt1_50 <= tbt0_50;   tbt2_50 <= tbt1_50;
              tbt0_51 <= sel51r;   tbt1_51 <= tbt0_51;   tbt2_51 <= tbt1_51;
              tbt0_52 <= sel52r;   tbt1_52 <= tbt0_52;   tbt2_52 <= tbt1_52;
              tbt0_53 <= sel53r;   tbt1_53 <= tbt0_53;   tbt2_53 <= tbt1_53;
              tbt0_54 <= sel54r;   tbt1_54 <= tbt0_54;   tbt2_54 <= tbt1_54;
              tbt0_55 <= sel55r;   tbt1_55 <= tbt0_55;   tbt2_55 <= tbt1_55;
              tbt0_56 <= sel56r;   tbt1_56 <= tbt0_56;   tbt2_56 <= tbt1_56;
              tbt0_57 <= sel57r;   tbt1_57 <= tbt0_57;   tbt2_57 <= tbt1_57;
              tbt0_58 <= sel58r;   tbt1_58 <= tbt0_58;   tbt2_58 <= tbt1_58;
              tbt0_59 <= sel59r;   tbt1_59 <= tbt0_59;   tbt2_59 <= tbt1_59;
              tbt0_60 <= sel60r;   tbt1_60 <= tbt0_60;   tbt2_60 <= tbt1_60;
              tbt0_61 <= sel61r;   tbt1_61 <= tbt0_61;   tbt2_61 <= tbt1_61;
              tbt0_62 <= sel62r;   tbt1_62 <= tbt0_62;   tbt2_62 <= tbt1_62;
              tbt0_63 <= sel63r;   tbt1_63 <= tbt0_63;   tbt2_63 <= tbt1_63;
           end
        end 
     end


   reg symEnEvenToggle;
     always @(posedge clk)
     if (reset) begin
        symEnEvenToggle <= 0;
     end
     //else if (stateCnt == 3) begin
     else if (stateCnt > 2) begin
        symEnEvenToggle <= symEnEven;
     end
     else begin
        symEnEvenToggle <= ~symEnEvenToggle;
     end
   
   // Latching the next state
   reg [5:0]          nState;
   reg [5:0]          nStateLatched;
   reg [5:0]          indexReg;
   always @(posedge clk)
     if (reset) begin
        nStateLatched <= 0;
     end
     else begin
        nStateLatched <= nState;
        if (symEn) begin
           indexReg <= index;
        end
     end
        

   // Updateing the current state initially with the maxMetrinc index at the symEn instance, otherwise update with the latched next state
   reg [5:0]          cState;
   always @(indexReg or nStateLatched or stateCnt)
     //if (symEn) begin
     if (stateCnt == 0) begin
        cState <= indexReg;
     end
     else begin
        cState <= nStateLatched;
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


   always @(posedge clk)
     begin
        if (reset) begin
           decisionTmp <= 0;
        end
        else if (symEn) begin
           sel0r<= sel0; 
           sel1r<= sel1; 
           sel2r<= sel2; 
           sel3r<= sel3; 
           sel4r<= sel4; 
           sel5r<= sel5; 
           sel6r<= sel6; 
           sel7r<= sel7; 
           sel8r<= sel8; 
           sel9r<= sel9; 
           sel10r<= sel10;
           sel11r<= sel11;
           sel12r<= sel12;
           sel13r<= sel13;
           sel14r<= sel14;
           sel15r<= sel15;
           sel16r<= sel16;
           sel17r<= sel17;
           sel18r<= sel18;
           sel19r<= sel19;
           sel20r<= sel20;
           sel21r<= sel21;
           sel22r<= sel22;
           sel23r<= sel23;
           sel24r<= sel24;
           sel25r<= sel25;
           sel26r<= sel26;
           sel27r<= sel27;
           sel28r<= sel28;
           sel29r<= sel29;
           sel30r<= sel30;
           sel31r<= sel31;
           sel32r<= sel32;
           sel33r<= sel33;
           sel34r<= sel34;
           sel35r<= sel35;
           sel36r<= sel36;
           sel37r<= sel37;
           sel38r<= sel38;
           sel39r<= sel39;
           sel40r<= sel40;
           sel41r<= sel41;
           sel42r<= sel42;
           sel43r<= sel43;
           sel44r<= sel44;
           sel45r<= sel45;
           sel46r<= sel46;
           sel47r<= sel47;
           sel48r<= sel48;
           sel49r<= sel49;
           sel50r<= sel50;
           sel51r<= sel51;
           sel52r<= sel52;
           sel53r<= sel53;
           sel54r<= sel54;
           sel55r<= sel55;
           sel56r<= sel56;
           sel57r<= sel57;
           sel58r<= sel58;
           sel59r<= sel59;
           sel60r<= sel60;
           sel61r<= sel61;
           sel62r<= sel62;
           sel63r<= sel63;
           //case (nState)
           case (index)
             0 : begin decisionTmp <= sel0 ; end
             1 : begin decisionTmp <= sel1 ; end
             2 : begin decisionTmp <= sel2 ; end
             3 : begin decisionTmp <= sel3 ; end
             4 : begin decisionTmp <= sel4 ; end
             5 : begin decisionTmp <= sel5 ; end
             6 : begin decisionTmp <= sel6 ; end
             7 : begin decisionTmp <= sel7 ; end
             8 : begin decisionTmp <= sel8 ; end
             9 : begin decisionTmp <= sel9 ; end
             10: begin decisionTmp <= sel10; end
             11: begin decisionTmp <= sel11; end
             12: begin decisionTmp <= sel12; end
             13: begin decisionTmp <= sel13; end
             14: begin decisionTmp <= sel14; end
             15: begin decisionTmp <= sel15; end
             16: begin decisionTmp <= sel16; end
             17: begin decisionTmp <= sel17; end
             18: begin decisionTmp <= sel18; end
             19: begin decisionTmp <= sel19; end
             20: begin decisionTmp <= sel20; end
             21: begin decisionTmp <= sel21; end
             22: begin decisionTmp <= sel22; end
             23: begin decisionTmp <= sel23; end
             24: begin decisionTmp <= sel24; end
             25: begin decisionTmp <= sel25; end
             26: begin decisionTmp <= sel26; end
             27: begin decisionTmp <= sel27; end
             28: begin decisionTmp <= sel28; end
             29: begin decisionTmp <= sel29; end
             30: begin decisionTmp <= sel30; end
             31: begin decisionTmp <= sel31; end
             32: begin decisionTmp <= sel32; end
             33: begin decisionTmp <= sel33; end
             34: begin decisionTmp <= sel34; end
             35: begin decisionTmp <= sel35; end
             36: begin decisionTmp <= sel36; end
             37: begin decisionTmp <= sel37; end
             38: begin decisionTmp <= sel38; end
             39: begin decisionTmp <= sel39; end
             40: begin decisionTmp <= sel40; end
             41: begin decisionTmp <= sel41; end
             42: begin decisionTmp <= sel42; end
             43: begin decisionTmp <= sel43; end
             44: begin decisionTmp <= sel44; end
             45: begin decisionTmp <= sel45; end
             46: begin decisionTmp <= sel46; end
             47: begin decisionTmp <= sel47; end
             48: begin decisionTmp <= sel48; end
             49: begin decisionTmp <= sel49; end
             50: begin decisionTmp <= sel50; end
             51: begin decisionTmp <= sel51; end
             52: begin decisionTmp <= sel52; end
             53: begin decisionTmp <= sel53; end
             54: begin decisionTmp <= sel54; end
             55: begin decisionTmp <= sel55; end
             56: begin decisionTmp <= sel56; end
             57: begin decisionTmp <= sel57; end
             58: begin decisionTmp <= sel58; end
             59: begin decisionTmp <= sel59; end
             60: begin decisionTmp <= sel60; end
             61: begin decisionTmp <= sel61; end
             62: begin decisionTmp <= sel62; end
             63: begin decisionTmp <= sel63; end
           endcase // case(nState)
        end // if (symEn)
        else begin
           case (stateCnt) //State count, counts to the traceback depth of 4, init at symEn 
             0: begin 
                case (nState)
                  0 : begin decisionTmp <= tbt0_0 ; end
                  1 : begin decisionTmp <= tbt0_1 ; end
                  2 : begin decisionTmp <= tbt0_2 ; end
                  3 : begin decisionTmp <= tbt0_3 ; end
                  4 : begin decisionTmp <= tbt0_4 ; end
                  5 : begin decisionTmp <= tbt0_5 ; end
                  6 : begin decisionTmp <= tbt0_6 ; end
                  7 : begin decisionTmp <= tbt0_7 ; end
                  8 : begin decisionTmp <= tbt0_8 ; end
                  9 : begin decisionTmp <= tbt0_9 ; end
                  10: begin decisionTmp <= tbt0_10; end
                  11: begin decisionTmp <= tbt0_11; end
                  12: begin decisionTmp <= tbt0_12; end
                  13: begin decisionTmp <= tbt0_13; end
                  14: begin decisionTmp <= tbt0_14; end
                  15: begin decisionTmp <= tbt0_15; end
                  16: begin decisionTmp <= tbt0_16; end
                  17: begin decisionTmp <= tbt0_17; end
                  18: begin decisionTmp <= tbt0_18; end
                  19: begin decisionTmp <= tbt0_19; end
                  20: begin decisionTmp <= tbt0_20; end
                  21: begin decisionTmp <= tbt0_21; end
                  22: begin decisionTmp <= tbt0_22; end
                  23: begin decisionTmp <= tbt0_23; end
                  24: begin decisionTmp <= tbt0_24; end
                  25: begin decisionTmp <= tbt0_25; end
                  26: begin decisionTmp <= tbt0_26; end
                  27: begin decisionTmp <= tbt0_27; end
                  28: begin decisionTmp <= tbt0_28; end
                  29: begin decisionTmp <= tbt0_29; end
                  30: begin decisionTmp <= tbt0_30; end
                  31: begin decisionTmp <= tbt0_31; end
                  32: begin decisionTmp <= tbt0_32; end
                  33: begin decisionTmp <= tbt0_33; end
                  34: begin decisionTmp <= tbt0_34; end
                  35: begin decisionTmp <= tbt0_35; end
                  36: begin decisionTmp <= tbt0_36; end
                  37: begin decisionTmp <= tbt0_37; end
                  38: begin decisionTmp <= tbt0_38; end
                  39: begin decisionTmp <= tbt0_39; end
                  40: begin decisionTmp <= tbt0_40; end
                  41: begin decisionTmp <= tbt0_41; end
                  42: begin decisionTmp <= tbt0_42; end
                  43: begin decisionTmp <= tbt0_43; end
                  44: begin decisionTmp <= tbt0_44; end
                  45: begin decisionTmp <= tbt0_45; end
                  46: begin decisionTmp <= tbt0_46; end
                  47: begin decisionTmp <= tbt0_47; end
                  48: begin decisionTmp <= tbt0_48; end
                  49: begin decisionTmp <= tbt0_49; end
                  50: begin decisionTmp <= tbt0_50; end
                  51: begin decisionTmp <= tbt0_51; end
                  52: begin decisionTmp <= tbt0_52; end
                  53: begin decisionTmp <= tbt0_53; end
                  54: begin decisionTmp <= tbt0_54; end
                  55: begin decisionTmp <= tbt0_55; end
                  56: begin decisionTmp <= tbt0_56; end
                  57: begin decisionTmp <= tbt0_57; end
                  58: begin decisionTmp <= tbt0_58; end
                  59: begin decisionTmp <= tbt0_59; end
                  60: begin decisionTmp <= tbt0_60; end
                  61: begin decisionTmp <= tbt0_61; end
                  62: begin decisionTmp <= tbt0_62; end
                  63: begin decisionTmp <= tbt0_63; end
                endcase // case(nState)
             end // case: 0
             
             1 : begin
                case (nState)
                  0 : begin decisionTmp <= tbt1_0; end
                  1 : begin decisionTmp <= tbt1_1; end
                  2 : begin decisionTmp <= tbt1_2; end
                  3 : begin decisionTmp <= tbt1_3; end
                  4 : begin decisionTmp <= tbt1_4; end
                  5 : begin decisionTmp <= tbt1_5; end
                  6 : begin decisionTmp <= tbt1_6; end
                  7 : begin decisionTmp <= tbt1_7; end
                  8 : begin decisionTmp <= tbt1_8; end
                  9 : begin decisionTmp <= tbt1_9; end
                  10: begin decisionTmp <= tbt1_10; end
                  11: begin decisionTmp <= tbt1_11; end
                  12: begin decisionTmp <= tbt1_12; end
                  13: begin decisionTmp <= tbt1_13; end
                  14: begin decisionTmp <= tbt1_14; end
                  15: begin decisionTmp <= tbt1_15; end
                  16: begin decisionTmp <= tbt1_16; end
                  17: begin decisionTmp <= tbt1_17; end
                  18: begin decisionTmp <= tbt1_18; end
                  19: begin decisionTmp <= tbt1_19; end
                  20: begin decisionTmp <= tbt1_20; end
                  21: begin decisionTmp <= tbt1_21; end
                  22: begin decisionTmp <= tbt1_22; end
                  23: begin decisionTmp <= tbt1_23; end
                  24: begin decisionTmp <= tbt1_24; end
                  25: begin decisionTmp <= tbt1_25; end
                  26: begin decisionTmp <= tbt1_26; end
                  27: begin decisionTmp <= tbt1_27; end
                  28: begin decisionTmp <= tbt1_28; end
                  29: begin decisionTmp <= tbt1_29; end
                  30: begin decisionTmp <= tbt1_30; end
                  31: begin decisionTmp <= tbt1_31; end
                  32: begin decisionTmp <= tbt1_32; end
                  33: begin decisionTmp <= tbt1_33; end
                  34: begin decisionTmp <= tbt1_34; end
                  35: begin decisionTmp <= tbt1_35; end
                  36: begin decisionTmp <= tbt1_36; end
                  37: begin decisionTmp <= tbt1_37; end
                  38: begin decisionTmp <= tbt1_38; end
                  39: begin decisionTmp <= tbt1_39; end
                  40: begin decisionTmp <= tbt1_40; end
                  41: begin decisionTmp <= tbt1_41; end
                  42: begin decisionTmp <= tbt1_42; end
                  43: begin decisionTmp <= tbt1_43; end
                  44: begin decisionTmp <= tbt1_44; end
                  45: begin decisionTmp <= tbt1_45; end
                  46: begin decisionTmp <= tbt1_46; end
                  47: begin decisionTmp <= tbt1_47; end
                  48: begin decisionTmp <= tbt1_48; end
                  49: begin decisionTmp <= tbt1_49; end
                  50: begin decisionTmp <= tbt1_50; end
                  51: begin decisionTmp <= tbt1_51; end
                  52: begin decisionTmp <= tbt1_52; end
                  53: begin decisionTmp <= tbt1_53; end
                  54: begin decisionTmp <= tbt1_54; end
                  55: begin decisionTmp <= tbt1_55; end
                  56: begin decisionTmp <= tbt1_56; end
                  57: begin decisionTmp <= tbt1_57; end
                  58: begin decisionTmp <= tbt1_58; end
                  59: begin decisionTmp <= tbt1_59; end
                  60: begin decisionTmp <= tbt1_60; end
                  61: begin decisionTmp <= tbt1_61; end
                  62: begin decisionTmp <= tbt1_62; end
                  63: begin decisionTmp <= tbt1_63; end
                endcase // case(nState)
             end // case: 1
             
             2 : begin
                case (nState)
                  0 : begin decisionTmp <= tbt2_0; end
                  1 : begin decisionTmp <= tbt2_1; end
                  2 : begin decisionTmp <= tbt2_2; end
                  3 : begin decisionTmp <= tbt2_3; end
                  4 : begin decisionTmp <= tbt2_4; end
                  5 : begin decisionTmp <= tbt2_5; end
                  6 : begin decisionTmp <= tbt2_6; end
                  7 : begin decisionTmp <= tbt2_7; end
                  8 : begin decisionTmp <= tbt2_8; end
                  9 : begin decisionTmp <= tbt2_9; end
                  10: begin decisionTmp <= tbt2_10; end
                  11: begin decisionTmp <= tbt2_11; end
                  12: begin decisionTmp <= tbt2_12; end
                  13: begin decisionTmp <= tbt2_13; end
                  14: begin decisionTmp <= tbt2_14; end
                  15: begin decisionTmp <= tbt2_15; end
                  16: begin decisionTmp <= tbt2_16; end
                  17: begin decisionTmp <= tbt2_17; end
                  18: begin decisionTmp <= tbt2_18; end
                  19: begin decisionTmp <= tbt2_19; end
                  20: begin decisionTmp <= tbt2_20; end
                  21: begin decisionTmp <= tbt2_21; end
                  22: begin decisionTmp <= tbt2_22; end
                  23: begin decisionTmp <= tbt2_23; end
                  24: begin decisionTmp <= tbt2_24; end
                  25: begin decisionTmp <= tbt2_25; end
                  26: begin decisionTmp <= tbt2_26; end
                  27: begin decisionTmp <= tbt2_27; end
                  28: begin decisionTmp <= tbt2_28; end
                  29: begin decisionTmp <= tbt2_29; end
                  30: begin decisionTmp <= tbt2_30; end
                  31: begin decisionTmp <= tbt2_31; end
                  32: begin decisionTmp <= tbt2_32; end
                  33: begin decisionTmp <= tbt2_33; end
                  34: begin decisionTmp <= tbt2_34; end
                  35: begin decisionTmp <= tbt2_35; end
                  36: begin decisionTmp <= tbt2_36; end
                  37: begin decisionTmp <= tbt2_37; end
                  38: begin decisionTmp <= tbt2_38; end
                  39: begin decisionTmp <= tbt2_39; end
                  40: begin decisionTmp <= tbt2_40; end
                  41: begin decisionTmp <= tbt2_41; end
                  42: begin decisionTmp <= tbt2_42; end
                  43: begin decisionTmp <= tbt2_43; end
                  44: begin decisionTmp <= tbt2_44; end
                  45: begin decisionTmp <= tbt2_45; end
                  46: begin decisionTmp <= tbt2_46; end
                  47: begin decisionTmp <= tbt2_47; end
                  48: begin decisionTmp <= tbt2_48; end
                  49: begin decisionTmp <= tbt2_49; end
                  50: begin decisionTmp <= tbt2_50; end
                  51: begin decisionTmp <= tbt2_51; end
                  52: begin decisionTmp <= tbt2_52; end
                  53: begin decisionTmp <= tbt2_53; end
                  54: begin decisionTmp <= tbt2_54; end
                  55: begin decisionTmp <= tbt2_55; end
                  56: begin decisionTmp <= tbt2_56; end
                  57: begin decisionTmp <= tbt2_57; end
                  58: begin decisionTmp <= tbt2_58; end
                  59: begin decisionTmp <= tbt2_59; end
                  60: begin decisionTmp <= tbt2_60; end
                  61: begin decisionTmp <= tbt2_61; end
                  62: begin decisionTmp <= tbt2_62; end
                  63: begin decisionTmp <= tbt2_63; end
                endcase // case(nState)
             end // case: 2
             default : decisionTmp <= decisionTmp;
             
           endcase // case(stateCnt)
        end // else: !if(symEn)
     end // always @ (posedge clk)

   
   always @(posedge clk) begin
      if (reset) begin
         decision <= 1'b0;
      end
      else begin
         if (stateCnt == 3) begin  
            decision <= decisionTmp;
         end
      end 
   end
         
         
reg [1:0] decisionTmp_s0, decisionTmp_s1, decisionTmp_s2, decisionTmp_s3, decisionTmp_s4;
   always @(posedge clk) begin
      case (stateCnt)
        0: begin decisionTmp_s0 <= decisionTmp; end
        1: begin decisionTmp_s1 <= decisionTmp; end
        2: begin decisionTmp_s2 <= decisionTmp; end
        3: begin decisionTmp_s3 <= decisionTmp; end
        default: decisionTmp_s4 <= decisionTmp;
      endcase // case(stateCnt)
   end


         
endmodule
