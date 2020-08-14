`timescale 1ns / 1ps

`include "addressMap.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2020 03:55:01 PM
// Design Name: 
// Module Name: testConvEnc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define USE_pngenTop
`define  MATLAB_VECTORS

module testConvEnc(

    );
    parameter CLK_FREQ = 100e6;
    parameter HC = 1e9/CLK_FREQ/2;
    parameter C = 2*HC;    
        

        
`ifndef USE_pngenTop
    reg clk = 0;
    always #HC clk = ~clk;    

    reg [2:0] count=0;
    reg clkEn = 0;
    reg pcmBit;
    wire hold;
    wire encBit;
    wire pngenEnable;
    reg reset;
    
    initial begin
        reset = 1;
        #50
        reset = 0;
    end
    
    always@(posedge clk) begin
        if(reset) begin
            count <= 0;
        end
        else begin
            count <= count + 1;
            if(count == 7) begin
                clkEn <= 1'b1;
            end
            else begin
                clkEn <= 1'b0;
            end
        end
   end

    always@(posedge clk) begin
        if(reset) begin
            pcmBit <= 0;
        end
        else begin
            if(clkEn & ~hold) begin
                pcmBit <= ~pcmBit;
            end            
        end
    end  
             
    convEncoder uut(
        .clk(clk),
        .clkEn(clkEn),
        .reset(reset),
        .pcmBit(pcmBit),
        .hold(hold),
        .encBit(encBit)    
    );
    
`else        /*******************    USE_pngenTop    **************************/                

   
    reg clk=0;
    reg we0;
    reg we1;
    reg we2;
    reg we3;
    reg rd;
     reg reset;
    reg txRegCS;
    reg [12:0]a;
    reg [31:0]d;
    wire [31:0]dout;
    reg clken;
`ifdef USE_BUS_CLOCK
    reg  bc;
`endif
    wire nrzBit; 
    wire pnBit;  
    wire pnClk;   
    reg pngenEnable;
    wire pnClkEn;
    always #HC clk = clken^clk;
    
    /************************************************************************
                                instantiate pngenTop
    /***********************************************************************/
    pngenTop pngenTop(
        .clk(clk),					 //input               
        .clkEn(pngenEnable),     //input               
        .reset(reset),           //input 
    `ifdef USE_BUS_CLOCK              
        .busClk(bc),                 //input    
    `endif           
        .wr0(we0), 
        .wr1(we1), 
        .wr2(we2), 
        .wr3(we3),     				 //input               
        .addr(a),                   //input       [12:0]  
        .din(d),                    //input       [31:0]  
        .dout(dout),                   //output      [31:0]  
        .pnClkEn(pnClkEn),                //output  reg         
        .nrzBit(nrzBit),                 //output  reg         
        .pnBit(pnBit),                  //output              
        .pnClk(pnClk)                   //output              
    );

//    /************************************************************************
//                                instantiate viterbi
//    /***********************************************************************/
//    wire ch0VitBitEn ;
//    wire ch0VitBit   ;
//    wire ch1VitBitEn ;
//    wire ch1VitBit   ;   
//    wire   signed  [17:0]  ch0SymData = pnBit ? 32768 : -32768;
//    viterbi viterbi(
//        .clk(clk),
//        .clkEn(1'b1),
//        .reset(reset),
//        .busClk(bc),
//        .cs(1'b1),
//        .wr0(we0),.wr1(we1),.wr2(we2),.wr3(we3),
//        .addr(a),
//        .din(d),
//        .dout(dout),
//        .bitsyncMode(`BS_MODE_IND_CH),
//        .ch0SymEn(pnClkEn),
//        .ch0SymData(ch0SymData),
//        .ch1SymEn(1'b0),
//        .ch1SymData(1'b0),
//        .ch0BitEnOut(ch0VitBitEn),
//        .ch0BitOut(ch0VitBit),
//        .ch1BitEnOut(ch1VitBitEn),
//        .ch1BitOut(ch1VitBit)
//        );


`ifdef MATLAB_VECTORS
/******************************************************************************
                          Vector data for Matlab Analysis
******************************************************************************/
integer outfile;
integer outfile2;
integer vectorCount;
integer outfile3;
integer vectorCount2;
reg testBits;
initial begin
    outfile = $fopen("convEnc.dat");
    outfile2 = $fopen("nrzBits.dat");
    outfile3 = $fopen("pnBits.dat");
    vectorCount = 0;
    vectorCount2 = 0;
    end
always @(negedge clk) begin
    if (testBits & (~pngenTop.conv_enc.hold & pngenTop.conv_enc.clkEn)) begin
        $fwrite(outfile,"%d %d %d\n", vectorCount, pngenTop.conv_enc.encData[0], pngenTop.conv_enc.encData[1]);
        $fwrite(outfile2,"%d %d\n", vectorCount,pngenTop.nrzBit);
        vectorCount <= vectorCount + 1;
        if (vectorCount == 4096) begin
            $fclose(outfile);
            $stop;
            end
        end
    end

always @(posedge clk) begin
    if (testBits &  pnClkEn) begin
        $fwrite(outfile3,"%d %d\n", vectorCount2, pnBit);
        vectorCount2 <= vectorCount2 + 1;
        end
    end
`endif

        
    /******************************************************************************
                                    uP Read/Write Functions
    ******************************************************************************/
    
    function [12:0] createAddress;
        input [12:0] addrA;
        input [12:0] addrB;
        
        integer i;
        reg [12:0]finalAddress;
    
        begin
        for (i = 0; i < 13; i = i+1) begin
            if (addrA[i] === 1'bx) begin
                finalAddress[i] = addrB[i];
                end
            else if (addrB[i] === 1'bx) begin
                finalAddress[i] = addrA[i];
                end
            else begin
                finalAddress[i] = addrA[i] | addrB[i];
                end
            end
        createAddress = finalAddress;
        end
    endfunction
    
    
`ifdef USE_BUS_CLOCK
    
    task write16;
      input [12:0]addr;
      input [15:0]data;
      begin
    
        a = addr;
        rd = 0;
        bc = 1;
        if (addr[1]) begin
            d[31:16] = data;
            #20 ;
                bc = 0;
                we2 = 1; we3 = 1;
            #20 ;
                bc = 1;
            #20 ;
                bc = 0;
                we2 = 0; we3 = 0; 
            end
        else begin
            d[15:0] = data;
            #20 ;
                bc = 0;
                we0 = 1; we1 = 1;
            #20 ;
                bc = 1;
            #20 ;
                bc = 0;
                we0 = 0; we1 = 0; 
            end
        #20 ;
            bc = 1;  
            d = 32'hz;
        #20 ;
            bc = 0;
        #20 ;
      end
    endtask
    
    task write32;
      input [12:0]addr;
      input [31:0]data;
      begin
        a = addr;
        d = data;
        rd = 0;
    
             bc = 1;
        #20  ;
             bc = 0;
             we0 = 1; we1 = 1; we2 = 1; we3 = 1;
        #20  ;
             bc = 1;
        #20  ;
             bc = 0;
             we0 = 0; we1 = 0; we2 = 0; we3 = 0; 
        #20  ;
             bc = 1;
             d = 32'hz;
        #20  ;
             bc = 0;
        #20  ;
      end
    endtask
    
`else  // USE_BUS_CLOCK
    
    task write16;
      input [12:0]addr;
      input [15:0]data;
      begin
    
        a = addr;
        rd = 0;
        if (addr[1]) begin
            d[31:16] = data;
            #100 we2 = 1; we3 = 1;
            #100 we2 = 0; we3 = 0; 
            end
        else begin
            d[15:0] = data;
            #100 we0 = 1; we1 = 1;
            #100 we0 = 0; we1 = 0; 
            end
        #100  
        d = 32'hz;
        #200;
      end
    endtask
    
    task write32;
      input [12:0]addr;
      input [31:0]data;
      begin
        a = addr;
        d = data;
        rd = 0;
        #100 we0 = 1; we1 = 1; we2 = 1; we3 = 1;
        #100 we0 = 0; we1 = 0; we2 = 0; we3 = 0; 
        #100
        d = 32'hz;
        #200;
      end
    endtask
    
`endif // USE_BUS_CLOCK
    
    
    task read32;
      input [12:0]addr;
      begin
        a = addr;
        rd = 0;
        #100 rd = 1;
        #100 rd = 0;
        #200;
      end
    endtask
    
    parameter PMODE = {1'b0,1'b0,4'b0,2'b01,1'b0,3'b0,4'b0};  //{16'b0,injectError,inject1E3Errors,4'b0,fecMode,pcmInvert,3'b0,pcmMode};
    parameter POLY = {1'b0,1'b0,1'b0,5'd11,24'h00500};               //{pnPolyMode, pnRestart, 1'b0, pnPolyLength, pnPolyTaps};
    parameter POLYRESTART = 32'h4000_0000;
    parameter PNRATE = 32'h4000_0000;//(40e6/CLK_FREQ)*(4294967295);
    initial begin
        reset = 0;
        rd = 0;
        we0 = 0; we1 = 0; we2 = 0; we3 = 0; 
        d = 32'hz;
        txRegCS = 0;
        pngenEnable = 0;
        `ifdef USE_BUS_CLOCK    
        bc = 0;
        `endif
        // Turn on the clock
        clken=1;
        `ifdef MATLAB_VECTORS
        testBits = 0;
        `endif
        #(10*C) ;
        reset = 1;
        #(10*C) ;
        reset = 0;
        #(10*C) ;
        write32(createAddress(`PNGEN_SPACE, `PNGEN_RATE),PNRATE);
        write16(createAddress(`PNGEN_SPACE, `PNGEN_PCM_MODE), PMODE); 
        write32(createAddress(`PNGEN_SPACE, `PNGEN_POLY), POLY);                            //{pnPolyMode, pnRestart, 1'b0, pnPolyLength, pnPolyTaps};
        #(2*C);
        write32(createAddress(`PNGEN_SPACE, `PNGEN_POLY), POLY | POLYRESTART);
        #(2*C);
        write32(createAddress(`PNGEN_SPACE, `PNGEN_POLY), POLY);                         
//        #(2*C);
//        write32(createAddress(`VITERBISPACE, `VIT_INVERSE_MEAN),32'h00018e39);     //exp, mantiassa
//        #(2*C);
//        write16(createAddress(`VITERBISPACE, `VIT_BER_TEST_LENGTH),16'd8);
        #(20*C)
        pngenEnable = 1;
        #(22*4*C)
        `ifdef MATLAB_VECTORS
        testBits = 1;
        `endif
    end

`endif
endmodule
