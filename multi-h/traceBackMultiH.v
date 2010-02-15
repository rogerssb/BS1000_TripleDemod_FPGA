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
   
   reg [8:0] symEnSr;
   //reg [8:0] sym2xEnSr;
   always @(posedge clk) begin
      if (reset) begin
         symEnSr <= 0;
         //sym2xEnSr <= 0;
      end
      else begin
         symEnSr <= {symEnSr[7:0], symEn};
         //sym2xEnSr <= {sym2xEnSr[7:0], sym2xEn};
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
              tbt0_0  <= sel0 ;     
              tbt0_1  <= sel1 ;     
              tbt0_2  <= sel2 ;     
              tbt0_3  <= sel3 ;     
              tbt0_4  <= sel4 ;     
              tbt0_5  <= sel5 ;     
              tbt0_6  <= sel6 ;     
              tbt0_7  <= sel7 ;     
              tbt0_8  <= sel8 ;     
              tbt0_9  <= sel9 ;     
              tbt0_10 <= sel10;     
              tbt0_11 <= sel11;     
              tbt0_12 <= sel12;     
              tbt0_13 <= sel13;     
              tbt0_14 <= sel14;     
              tbt0_15 <= sel15;     
              tbt0_16 <= sel16;     
              tbt0_17 <= sel17;     
              tbt0_18 <= sel18;     
              tbt0_19 <= sel19;     
              tbt0_20 <= sel20;     
              tbt0_21 <= sel21;     
              tbt0_22 <= sel22;     
              tbt0_23 <= sel23;     
              tbt0_24 <= sel24;     
              tbt0_25 <= sel25;     
              tbt0_26 <= sel26;     
              tbt0_27 <= sel27;     
              tbt0_28 <= sel28;     
              tbt0_29 <= sel29;     
              tbt0_30 <= sel30;     
              tbt0_31 <= sel31;     
              tbt0_32 <= sel32;     
              tbt0_33 <= sel33;     
              tbt0_34 <= sel34;     
              tbt0_35 <= sel35;     
              tbt0_36 <= sel36;     
              tbt0_37 <= sel37;     
              tbt0_38 <= sel38;     
              tbt0_39 <= sel39;     
              tbt0_40 <= sel40;     
              tbt0_41 <= sel41;     
              tbt0_42 <= sel42;     
              tbt0_43 <= sel43;     
              tbt0_44 <= sel44;     
              tbt0_45 <= sel45;     
              tbt0_46 <= sel46;     
              tbt0_47 <= sel47;     
              tbt0_48 <= sel48;     
              tbt0_49 <= sel49;     
              tbt0_50 <= sel50;     
              tbt0_51 <= sel51;     
              tbt0_52 <= sel52;     
              tbt0_53 <= sel53;     
              tbt0_54 <= sel54;     
              tbt0_55 <= sel55;     
              tbt0_56 <= sel56;     
              tbt0_57 <= sel57;     
              tbt0_58 <= sel58;     
              tbt0_59 <= sel59;     
              tbt0_60 <= sel60;     
              tbt0_61 <= sel61;     
              tbt0_62 <= sel62;     
              tbt0_63 <= sel63;     
           //end

           //else if (symEnSr[0]) begin
              tbt1_0  <= tbt0_0 ;
              tbt1_1  <= tbt0_1 ;
              tbt1_2  <= tbt0_2 ;
              tbt1_3  <= tbt0_3 ;
              tbt1_4  <= tbt0_4 ;
              tbt1_5  <= tbt0_5 ;
              tbt1_6  <= tbt0_6 ;
              tbt1_7  <= tbt0_7 ;
              tbt1_8  <= tbt0_8 ;
              tbt1_9  <= tbt0_9 ;
              tbt1_10 <= tbt0_10;
              tbt1_11 <= tbt0_11;
              tbt1_12 <= tbt0_12;
              tbt1_13 <= tbt0_13;
              tbt1_14 <= tbt0_14;
              tbt1_15 <= tbt0_15;
              tbt1_16 <= tbt0_16;
              tbt1_17 <= tbt0_17;
              tbt1_18 <= tbt0_18;
              tbt1_19 <= tbt0_19;
              tbt1_20 <= tbt0_20;
              tbt1_21 <= tbt0_21;
              tbt1_22 <= tbt0_22;
              tbt1_23 <= tbt0_23;
              tbt1_24 <= tbt0_24;
              tbt1_25 <= tbt0_25;
              tbt1_26 <= tbt0_26;
              tbt1_27 <= tbt0_27;
              tbt1_28 <= tbt0_28;
              tbt1_29 <= tbt0_29;
              tbt1_30 <= tbt0_30;
              tbt1_31 <= tbt0_31;
              tbt1_32 <= tbt0_32;
              tbt1_33 <= tbt0_33;
              tbt1_34 <= tbt0_34;
              tbt1_35 <= tbt0_35;
              tbt1_36 <= tbt0_36;
              tbt1_37 <= tbt0_37;
              tbt1_38 <= tbt0_38;
              tbt1_39 <= tbt0_39;
              tbt1_40 <= tbt0_40;
              tbt1_41 <= tbt0_41;
              tbt1_42 <= tbt0_42;
              tbt1_43 <= tbt0_43;
              tbt1_44 <= tbt0_44;
              tbt1_45 <= tbt0_45;
              tbt1_46 <= tbt0_46;
              tbt1_47 <= tbt0_47;
              tbt1_48 <= tbt0_48;
              tbt1_49 <= tbt0_49;
              tbt1_50 <= tbt0_50;
              tbt1_51 <= tbt0_51;
              tbt1_52 <= tbt0_52;
              tbt1_53 <= tbt0_53;
              tbt1_54 <= tbt0_54;
              tbt1_55 <= tbt0_55;
              tbt1_56 <= tbt0_56;
              tbt1_57 <= tbt0_57;
              tbt1_58 <= tbt0_58;
              tbt1_59 <= tbt0_59;
              tbt1_60 <= tbt0_60;
              tbt1_61 <= tbt0_61;
              tbt1_62 <= tbt0_62;
              tbt1_63 <= tbt0_63;
           //end
           
           //else if (symEn) begin
              tbt2_0  <= tbt1_0 ;
              tbt2_1  <= tbt1_1 ;
              tbt2_2  <= tbt1_2 ;
              tbt2_3  <= tbt1_3 ;
              tbt2_4  <= tbt1_4 ;
              tbt2_5  <= tbt1_5 ;
              tbt2_6  <= tbt1_6 ;
              tbt2_7  <= tbt1_7 ;
              tbt2_8  <= tbt1_8 ;
              tbt2_9  <= tbt1_9 ;
              tbt2_10 <= tbt1_10;
              tbt2_11 <= tbt1_11;
              tbt2_12 <= tbt1_12;
              tbt2_13 <= tbt1_13;
              tbt2_14 <= tbt1_14;
              tbt2_15 <= tbt1_15;
              tbt2_16 <= tbt1_16;
              tbt2_17 <= tbt1_17;
              tbt2_18 <= tbt1_18;
              tbt2_19 <= tbt1_19;
              tbt2_20 <= tbt1_20;
              tbt2_21 <= tbt1_21;
              tbt2_22 <= tbt1_22;
              tbt2_23 <= tbt1_23;
              tbt2_24 <= tbt1_24;
              tbt2_25 <= tbt1_25;
              tbt2_26 <= tbt1_26;
              tbt2_27 <= tbt1_27;
              tbt2_28 <= tbt1_28;
              tbt2_29 <= tbt1_29;
              tbt2_30 <= tbt1_30;
              tbt2_31 <= tbt1_31;
              tbt2_32 <= tbt1_32;
              tbt2_33 <= tbt1_33;
              tbt2_34 <= tbt1_34;
              tbt2_35 <= tbt1_35;
              tbt2_36 <= tbt1_36;
              tbt2_37 <= tbt1_37;
              tbt2_38 <= tbt1_38;
              tbt2_39 <= tbt1_39;
              tbt2_40 <= tbt1_40;
              tbt2_41 <= tbt1_41;
              tbt2_42 <= tbt1_42;
              tbt2_43 <= tbt1_43;
              tbt2_44 <= tbt1_44;
              tbt2_45 <= tbt1_45;
              tbt2_46 <= tbt1_46;
              tbt2_47 <= tbt1_47;
              tbt2_48 <= tbt1_48;
              tbt2_49 <= tbt1_49;
              tbt2_50 <= tbt1_50;
              tbt2_51 <= tbt1_51;
              tbt2_52 <= tbt1_52;
              tbt2_53 <= tbt1_53;
              tbt2_54 <= tbt1_54;
              tbt2_55 <= tbt1_55;
              tbt2_56 <= tbt1_56;
              tbt2_57 <= tbt1_57;
              tbt2_58 <= tbt1_58;
              tbt2_59 <= tbt1_59;
              tbt2_60 <= tbt1_60;
              tbt2_61 <= tbt1_61;
              tbt2_62 <= tbt1_62;
              tbt2_63 <= tbt1_63;
           end
           //else if (symEnSr[2]) begin
           //end
           
        end 
     end


   reg symEnEvenToggle;
     always @(posedge clk)
     if (reset) begin
        symEnEvenToggle <= 0;
     end
     else if (symEn) begin
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
     else if (symEn) begin
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

   reg [1:0] d1, d2, d3;
/* -----\/----- EXCLUDED -----\/-----
   // mux out the decision after each state. This used to be a clocked process
   always @(cState or
            sel0  or sel1  or sel2  or sel3  or sel4  or sel5  or sel6  or sel7  or 
            sel8  or sel9  or sel10 or sel11 or sel12 or sel13 or sel14 or sel15 or 
            sel16 or sel17 or sel18 or sel19 or sel20 or sel21 or sel22 or sel23 or 
            sel24 or sel25 or sel26 or sel27 or sel28 or sel29 or sel30 or sel31 or 
            sel32 or sel33 or sel34 or sel35 or sel36 or sel37 or sel38 or sel39 or 
            sel40 or sel41 or sel42 or sel43 or sel44 or sel45 or sel46 or sel47 or 
            sel48 or sel49 or sel50 or sel51 or sel52 or sel53 or sel54 or sel55 or 
            sel56 or sel57 or sel58 or sel59 or sel60 or sel61 or sel62 or sel63)
     case (cState)
       0 : begin d0 <= sel0 ; end
       1 : begin d0 <= sel1 ; end
       2 : begin d0 <= sel2 ; end
       3 : begin d0 <= sel3 ; end
       4 : begin d0 <= sel4 ; end
       5 : begin d0 <= sel5 ; end
       6 : begin d0 <= sel6 ; end
       7 : begin d0 <= sel7 ; end
       8 : begin d0 <= sel8 ; end
       9 : begin d0 <= sel9 ; end
       10: begin d0 <= sel10; end
       11: begin d0 <= sel11; end
       12: begin d0 <= sel12; end
       13: begin d0 <= sel13; end
       14: begin d0 <= sel14; end
       15: begin d0 <= sel15; end
       16: begin d0 <= sel16; end
       17: begin d0 <= sel17; end
       18: begin d0 <= sel18; end
       19: begin d0 <= sel19; end
       20: begin d0 <= sel20; end
       21: begin d0 <= sel21; end
       22: begin d0 <= sel22; end
       23: begin d0 <= sel23; end
       24: begin d0 <= sel24; end
       25: begin d0 <= sel25; end
       26: begin d0 <= sel26; end
       27: begin d0 <= sel27; end
       28: begin d0 <= sel28; end
       29: begin d0 <= sel29; end
       30: begin d0 <= sel30; end
       31: begin d0 <= sel31; end
       32: begin d0 <= sel32; end
       33: begin d0 <= sel33; end
       34: begin d0 <= sel34; end
       35: begin d0 <= sel35; end
       36: begin d0 <= sel36; end
       37: begin d0 <= sel37; end
       38: begin d0 <= sel38; end
       39: begin d0 <= sel39; end
       40: begin d0 <= sel40; end
       41: begin d0 <= sel41; end
       42: begin d0 <= sel42; end
       43: begin d0 <= sel43; end
       44: begin d0 <= sel44; end
       45: begin d0 <= sel45; end
       46: begin d0 <= sel46; end
       47: begin d0 <= sel47; end
       48: begin d0 <= sel48; end
       49: begin d0 <= sel49; end
       50: begin d0 <= sel50; end
       51: begin d0 <= sel51; end
       52: begin d0 <= sel52; end
       53: begin d0 <= sel53; end
       54: begin d0 <= sel54; end
       55: begin d0 <= sel55; end
       56: begin d0 <= sel56; end
       57: begin d0 <= sel57; end
       58: begin d0 <= sel58; end
       59: begin d0 <= sel59; end
       60: begin d0 <= sel60; end
       61: begin d0 <= sel61; end
       62: begin d0 <= sel62; end
       63: begin d0 <= sel63; end
     endcase
 -----/\----- EXCLUDED -----/\----- */


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
            tbt2_56 or tbt2_57 or tbt2_58 or tbt2_59 or tbt2_60 or tbt2_61 or tbt2_62 or tbt2_63 )
     case (cState)
       0 : begin d1 <= tbt0_0 ;  d2 <= tbt1_0;  d3 <= tbt2_0;  end
       1 : begin d1 <= tbt0_1 ;  d2 <= tbt1_1;  d3 <= tbt2_1;  end
       2 : begin d1 <= tbt0_2 ;  d2 <= tbt1_2;  d3 <= tbt2_2;  end
       3 : begin d1 <= tbt0_3 ;  d2 <= tbt1_3;  d3 <= tbt2_3;  end
       4 : begin d1 <= tbt0_4 ;  d2 <= tbt1_4;  d3 <= tbt2_4;  end
       5 : begin d1 <= tbt0_5 ;  d2 <= tbt1_5;  d3 <= tbt2_5;  end
       6 : begin d1 <= tbt0_6 ;  d2 <= tbt1_6;  d3 <= tbt2_6;  end
       7 : begin d1 <= tbt0_7 ;  d2 <= tbt1_7;  d3 <= tbt2_7;  end
       8 : begin d1 <= tbt0_8 ;  d2 <= tbt1_8;  d3 <= tbt2_8;  end
       9 : begin d1 <= tbt0_9 ;  d2 <= tbt1_9;  d3 <= tbt2_9;  end
       10: begin d1 <= tbt0_10;  d2 <= tbt1_10; d3 <= tbt2_10; end
       11: begin d1 <= tbt0_11;  d2 <= tbt1_11; d3 <= tbt2_11; end
       12: begin d1 <= tbt0_12;  d2 <= tbt1_12; d3 <= tbt2_12; end
       13: begin d1 <= tbt0_13;  d2 <= tbt1_13; d3 <= tbt2_13; end
       14: begin d1 <= tbt0_14;  d2 <= tbt1_14; d3 <= tbt2_14; end
       15: begin d1 <= tbt0_15;  d2 <= tbt1_15; d3 <= tbt2_15; end
       16: begin d1 <= tbt0_16;  d2 <= tbt1_16; d3 <= tbt2_16; end
       17: begin d1 <= tbt0_17;  d2 <= tbt1_17; d3 <= tbt2_17; end
       18: begin d1 <= tbt0_18;  d2 <= tbt1_18; d3 <= tbt2_18; end
       19: begin d1 <= tbt0_19;  d2 <= tbt1_19; d3 <= tbt2_19; end
       20: begin d1 <= tbt0_20;  d2 <= tbt1_20; d3 <= tbt2_20; end
       21: begin d1 <= tbt0_21;  d2 <= tbt1_21; d3 <= tbt2_21; end
       22: begin d1 <= tbt0_22;  d2 <= tbt1_22; d3 <= tbt2_22; end
       23: begin d1 <= tbt0_23;  d2 <= tbt1_23; d3 <= tbt2_23; end
       24: begin d1 <= tbt0_24;  d2 <= tbt1_24; d3 <= tbt2_24; end
       25: begin d1 <= tbt0_25;  d2 <= tbt1_25; d3 <= tbt2_25; end
       26: begin d1 <= tbt0_26;  d2 <= tbt1_26; d3 <= tbt2_26; end
       27: begin d1 <= tbt0_27;  d2 <= tbt1_27; d3 <= tbt2_27; end
       28: begin d1 <= tbt0_28;  d2 <= tbt1_28; d3 <= tbt2_28; end
       29: begin d1 <= tbt0_29;  d2 <= tbt1_29; d3 <= tbt2_29; end
       30: begin d1 <= tbt0_30;  d2 <= tbt1_30; d3 <= tbt2_30; end
       31: begin d1 <= tbt0_31;  d2 <= tbt1_31; d3 <= tbt2_31; end
       32: begin d1 <= tbt0_32;  d2 <= tbt1_32; d3 <= tbt2_32; end
       33: begin d1 <= tbt0_33;  d2 <= tbt1_33; d3 <= tbt2_33; end
       34: begin d1 <= tbt0_34;  d2 <= tbt1_34; d3 <= tbt2_34; end
       35: begin d1 <= tbt0_35;  d2 <= tbt1_35; d3 <= tbt2_35; end
       36: begin d1 <= tbt0_36;  d2 <= tbt1_36; d3 <= tbt2_36; end
       37: begin d1 <= tbt0_37;  d2 <= tbt1_37; d3 <= tbt2_37; end
       38: begin d1 <= tbt0_38;  d2 <= tbt1_38; d3 <= tbt2_38; end
       39: begin d1 <= tbt0_39;  d2 <= tbt1_39; d3 <= tbt2_39; end
       40: begin d1 <= tbt0_40;  d2 <= tbt1_40; d3 <= tbt2_40; end
       41: begin d1 <= tbt0_41;  d2 <= tbt1_41; d3 <= tbt2_41; end
       42: begin d1 <= tbt0_42;  d2 <= tbt1_42; d3 <= tbt2_42; end
       43: begin d1 <= tbt0_43;  d2 <= tbt1_43; d3 <= tbt2_43; end
       44: begin d1 <= tbt0_44;  d2 <= tbt1_44; d3 <= tbt2_44; end
       45: begin d1 <= tbt0_45;  d2 <= tbt1_45; d3 <= tbt2_45; end
       46: begin d1 <= tbt0_46;  d2 <= tbt1_46; d3 <= tbt2_46; end
       47: begin d1 <= tbt0_47;  d2 <= tbt1_47; d3 <= tbt2_47; end
       48: begin d1 <= tbt0_48;  d2 <= tbt1_48; d3 <= tbt2_48; end
       49: begin d1 <= tbt0_49;  d2 <= tbt1_49; d3 <= tbt2_49; end
       50: begin d1 <= tbt0_50;  d2 <= tbt1_50; d3 <= tbt2_50; end
       51: begin d1 <= tbt0_51;  d2 <= tbt1_51; d3 <= tbt2_51; end
       52: begin d1 <= tbt0_52;  d2 <= tbt1_52; d3 <= tbt2_52; end
       53: begin d1 <= tbt0_53;  d2 <= tbt1_53; d3 <= tbt2_53; end
       54: begin d1 <= tbt0_54;  d2 <= tbt1_54; d3 <= tbt2_54; end
       55: begin d1 <= tbt0_55;  d2 <= tbt1_55; d3 <= tbt2_55; end
       56: begin d1 <= tbt0_56;  d2 <= tbt1_56; d3 <= tbt2_56; end
       57: begin d1 <= tbt0_57;  d2 <= tbt1_57; d3 <= tbt2_57; end
       58: begin d1 <= tbt0_58;  d2 <= tbt1_58; d3 <= tbt2_58; end
       59: begin d1 <= tbt0_59;  d2 <= tbt1_59; d3 <= tbt2_59; end
       60: begin d1 <= tbt0_60;  d2 <= tbt1_60; d3 <= tbt2_60; end
       61: begin d1 <= tbt0_61;  d2 <= tbt1_61; d3 <= tbt2_61; end
       62: begin d1 <= tbt0_62;  d2 <= tbt1_62; d3 <= tbt2_62; end
       63: begin d1 <= tbt0_63;  d2 <= tbt1_63; d3 <= tbt2_63; end
     endcase



   // final mux for the decision out of the trace back 
   always @(stateCnt or decTbtIn or d1 or d2 or d3)
     case (stateCnt) //State count, counts to the traceback depth of 4, init at symEn 
       0: begin decisionTmp <= decTbtIn; end
       1: begin decisionTmp <= d1; end
       2: begin decisionTmp <= d2; end
       3: begin decisionTmp <= d3; end
       default : decisionTmp <= d3;
     endcase
   

   // Final decision output 
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
         
   // just for debug, showes the decision in each of the traceback stages
   reg [1:0] decisionTmp_s0, decisionTmp_s1, decisionTmp_s2, decisionTmp_s3, decisionTmp_s4;
   always @(posedge clk) begin
      case (stateCnt)
        0: begin decisionTmp_s0 <= decisionTmp; end
        1: begin decisionTmp_s1 <= decisionTmp; end
        2: begin decisionTmp_s2 <= decisionTmp; end
        3: begin decisionTmp_s3 <= decisionTmp; end
        default: decisionTmp_s4 <= decisionTmp;
      endcase
   end


         
endmodule
