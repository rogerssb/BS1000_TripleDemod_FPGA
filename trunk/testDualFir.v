                                      //-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       DDC FIR
// Created      may 2010
//-----------------------------------------------------------------------------
// 1.0      (amj)Initial coding
//
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module testDualFir;

    reg [17:0]  dinFir;
//    ddcFir UUT (
//            .clk        (clk      ),
//            .reset      (reset    ),
//            .syncIn     (symEnR   ),
//            .wr0        (), 
//            .wr1        (),
//            .wr2        (),
//            .wr3        (),
//            .addr       (),
//            .din        (),
//            .dout       (),
//            .in         (dinFir),
//            .out        ()
//            );

     dualFir UUT (
            .clk        (clk      ),
            .reset      (reset    ),
            .syncIn     (symEnR   ),
            .wr0        (), 
            .wr1        (),
            .wr2        (),
            .wr3        (),
            .addr       (),
            .din        (),
            .dout       (),
            .iIn        (dinFir),
            .qIn        (dinFir+1000),
            .iOut       (),
            .qOut       ()
    
            );


   
reg clk,reset;
reg clkDiv2;
reg [79:0]din;
reg symEn,sym2xEn;

initial clk = 0;
initial clkDiv2 = 0;
initial reset = 0;
    
    
always #4 clk = !clk; 
always @(posedge clk) clkDiv2 = !clkDiv2; 
	


reg [79:0] readMem[4095:0];
reg [11:0] index;  // using 4096 samples in this sim  

initial begin
    cntEna = 0;
    #250 cntEna = 1;
    end

reg [4:0]cnt; initial cnt = 20;
reg cntEna;




reg simBit;
reg [1:0] simMaxIndex;
	
always @(posedge clk)begin
   // #1;
   //if(cnt == 17) cnt <= 0;
   if(cnt == 10) cnt <= 0;
   else if(cntEna) cnt <= cnt +1;	  
   case(cnt)
     //0,8: begin 
     0,4: begin
        symEn <= 1;
        sym2xEn <= 1;
        din <= readMem[index];
	    //if (index >= 79) begin index <= 0; end // reading in 4*20 samples then wrap around. 20 comes from the # trellis states 
        if (index >= 20000) begin index <= 0; end // reading in 4*20 samples then wrap around. 20 comes from the # trellis states
	else begin 
	   index <= index +1;
	end
     end
     //4,13: begin	
     2,6: begin
        symEn <= 0;
        sym2xEn <= 1;
        // below is for 2 samp per symbol
        //din <= readMem[index];  
	//if (index >= 20000) begin index <= 0; end // reading in 4*20 samples then wrap around. 20 comes from the # trellis states
	//else begin index <= index +1; end
     end
     default: begin
        symEn <= 0;
        sym2xEn <= 0;
        //din <= 0;
     end
   endcase
end
	
   reg         symEnR;
   always @(posedge clk)
     begin
        symEnR <= symEn;
        if (symEnR)begin
           dinFir <= din[17:0];
        end
     end	
  
  
  
//`define DDC_FIR

reg doOnce;
initial begin
   doOnce = 0;
   #100 reset = !reset;
   #100 reset = !reset;
   index = 0;
   
//`ifdef DDC_FIR
//   $readmemh("c:/projects/semco/svn_checkout_folder2/ddcFirTestVector.hex", readMem);
//`endif
   
   #300 reset = !reset; // release the accumulation reset when valid data out of the rotators
   #100 reset = !reset;
   doOnce = 1;
   
end

   // getting a impulse responce out of the FIR
   always @(posedge clk) begin
      if (reset) begin
         dinFir <= 0;
         doOnce <= 0;
      end 
      else if(symEnR) begin
         if (doOnce) begin
            doOnce <= 0;
            dinFir <= { 1'b0, {17{1'b1}} };   //18'h064; 
            //dinFir <= { 2'b00, {16{1'b1}} };   // step of +0.5; 
         end
         else begin
            dinFir <= 18'h0;
         end
      end
   end
   
    
    


 
endmodule