`timescale 1ns / 1ps

`include "addressMap.v"
`define USE_pngenTop

module ldpc_encoder_tb(

    );
    parameter CLK_FREQ = 100e6;
    parameter HC = 1e9/CLK_FREQ/2;
    parameter C = 2*HC;    
    parameter [63:0] ASM_A = 64'hFCB88938D8D76A4F;
    parameter [63:0] ASM_An = 64'h034776C7272895B0;
    parameter [255:0] asm = {ASM_A, ASM_A, ASM_An, ASM_A};
        
    /// clock ///
    reg clk =0;
    always #HC clk = ~clk;        
    reg [1:0] clkEnCnt =0;
    wire clkEn;
    reg reset;
    wire hold;
    reg pcmBit;
    wire encBit;
    
    integer bouts;
    reg asmFound;
        
    /// encoder parameters ///
    wire [1:0]  rate            = `PNGEN_LDPC_R2_3;
    wire [1:0]  randomizer      = `PNGEN_LDPC_RND_OFF; //`PNGEN_LDPC_RND_OFF  ;
    wire        blocksize       = `PNGEN_LDPC_L1024;     
    wire [8:0]  asmSize         = blocksize == `PNGEN_LDPC_L4096 ? 255 : 63;
    wire [12:0] sysBitsLimit    = blocksize == `PNGEN_LDPC_L4096 ? 4095 : 1023;
    reg [14:0]  cb1024, cb4096;
    wire [14:0] codeblockLimit  = blocksize == `PNGEN_LDPC_L4096 ? cb4096 : cb1024;
    always@(*) begin
        case (rate)
        `PNGEN_LDPC_R1_2 : begin cb1024 <= 2048; cb4096 <= 8192  ; end
        `PNGEN_LDPC_R2_3 : begin cb1024 <= 1536; cb4096 <= 6144 ; end
      //`PNGEN_LDPC_R3_4 : begin cb1024 <=  ; cb4096 <=  ; end
        `PNGEN_LDPC_R4_5 : begin cb1024 <= 1280; cb4096 <= 5120 ; end
        endcase    
    end
 
    /// asm word detector ///
    reg [255:0] sr;
    wire [255:0] srData = {sr[254:0],encBit};
    wire asmSync64 = srData[63:0] == asm[63:0] ? 1'b1 : 1'b0;
    wire asmSync256 = srData[255:0] == asm[255:0] ? 1'b1 : 1'b0;
    wire asm_sync =  blocksize == `PNGEN_LDPC_L4096 ? asmSync256 : asmSync64;    

    /***************************
        CCSDS Derandomizer
   ****************************/
    wire ccsdsEn = asmFound;
    wire ccsdsReset = ~asmFound;
    wire ccsdsDataIn = encBit;
    reg [7:0] cSr;
    wire ccsDataOut = cSr[7]^ccsdsDataIn;
    //              x1     x4    x6      x8            
    wire cSrData = cSr[7]^cSr[4]^cSr[2]^cSr[0]; 
    always@(posedge clk)
    begin
        if(ccsdsReset)
            cSr <= 8'b11111111;
        else if(ccsdsEn & clkEn)
            cSr <= {cSr[6:0],cSrData};        
    end
    
    /***************************
        IRIG Derandomizer
   ****************************/
    wire irigEn;
    reg [14:0] iSr;
    wire irigDataOut = iSr[14]^iSr[13]^encBit; 
    always@(posedge clk)
    begin
        if(reset)
            iSr <= 15'h01;
        else if(clkEn) begin
            if(irigEn)
                iSr <= {iSr[13:0],encBit};
        end
    end    
        
    
`ifdef USE_pngenTop   // USE_pngenTop ////////////////////////////////////////////////////////////////

    reg we0;
    reg we1;
    reg we2;
    reg we3;
    reg rd;

    reg txRegCS;
    reg [12:0]a;
    reg [31:0]d;
    wire [31:0]dout;
`ifdef USE_BUS_CLOCK
    reg  bc;
`endif
    wire nrzBit; 

    wire pnClk;   
    reg pngenEnable;
    wire pnClkEn;
    
    assign hold = pngenTop.pause; 
     /************************************************************************
                                 instantiate pngenTop
     /***********************************************************************/
     pngenTop pngenTop(
         .clk(clk),                     //input               
         .clkEn(pngenEnable),     //input               
         .reset(reset),           //input 
     `ifdef USE_BUS_CLOCK              
         .busClk(bc),                 //input    
     `endif           
         .wr0(we0), 
         .wr1(we1), 
         .wr2(we2), 
         .wr3(we3),                      //input               
         .addr(a),                   //input       [12:0]  
         .din(d),                    //input       [31:0]  
         .dout(dout),                   //output      [31:0]  
         .pnClkEn(pnClkEn),                //output  reg         
         .nrzBit(nrzBit),                 //output  reg         
         .pnBit(encBit),                  //output              
         .pnClk(pnClk)                   //output              
     );

    assign clkEn = pnClkEn;
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
    
    wire [15:0] PMODE = {1'b0,1'b0,randomizer,blocksize,1'b0,`PNGEN_FEC_LDPC,1'b0,rate,1'b0,4'b0};  //{16'b0,injectError,inject1E3Errors,3'b0,g2inv,fecMode,pcmInvert,ldpcRate,1'b0,pcmMode};
    parameter POLY = {1'b0,1'b0,1'b0,5'd11,24'h00500};                      //{pnPolyMode, pnRestart, 1'b0, pnPolyLength, pnPolyTaps};
    parameter POLYRESTART = 32'h4000_0000;
    parameter PNRATE = 32'h4000_0000;//(40e6/CLK_FREQ)*(4294967295);
    
`ifdef SAVE_ENCBITS
    integer outfile;
    integer vectorCount=0;   
    reg write;

    always @(posedge clk) begin
        if(clkEn) begin
            if(write) begin
                $fwrite(outfile,"%d %d\n", vectorCount, encBit);
                vectorCount = vectorCount + 1;
            end
        end
    end
 `endif      
 
    initial begin
 `ifdef SAVE_ENCBITS   
        outfile = $fopen("pnBits.dat");
        write = 1'b0;
`endif
        reset = 0;
        rd = 0;
        we0 = 0; we1 = 0; we2 = 0; we3 = 0; 
        d = 32'hz;
        txRegCS = 0;
        pngenEnable = 0;
    `ifdef USE_BUS_CLOCK    
        bc = 0;
    `endif
    
        #(10*C) ;
        reset = 1;
        #(10*C) ;
        reset = 0;

        #10
        write32(createAddress(`PNGEN_SPACE, `PNGEN_RATE),PNRATE);
        write16(createAddress(`PNGEN_SPACE, `PNGEN_PCM_MODE), PMODE); 
        write32(createAddress(`PNGEN_SPACE, `PNGEN_POLY), POLY);                            //{pnPolyMode, pnRestart, 1'b0, pnPolyLength, pnPolyTaps};
        #(2*C);
        write32(createAddress(`PNGEN_SPACE, `PNGEN_POLY), POLY | POLYRESTART);
        #(2*C);
        write32(createAddress(`PNGEN_SPACE, `PNGEN_POLY), POLY);                         
        #(20*C);
        pngenEnable = 1;
        #(1354*C*4*3)
        pngenEnable = 0;
        #(10000*C*4)
        pngenEnable = 1;
`ifdef SAVE_ENCBITS        
        #(3*C);
        write = 1;
`endif
    end
        
`else // ! USE_pngenTop ////////////////////////////////////////////////////////////////

    always @(posedge clk)
        clkEnCnt <= clkEnCnt+1;
    assign clkEn = clkEnCnt == 2'b11 ? 1'b1:1'b0;

     /************************************************************************
                                 instantiate ldpc_encoder
     /***********************************************************************/
    ldpc_encoder uut(
        .clk(clk),
        .clkEn(clkEn),
        .reset(reset),
        .pcmBit(pcmBit),
        .hold(hold),
        .encBit(encBit),
        .rate(rate),
        .blocksize(blocksize),
        .randomize(randomizer)//(`PNGEN_LDPC_RND_OFF)    
    );
    


    /***************************
        generate input bits
   ****************************/
    integer bits;
    always @(posedge clk) begin
        if(reset) begin
            bits <= 0 + 1;
            pcmBit <=uncoded_data[0];
        end
        else if(clkEn) begin
            if(~hold) begin
                if(bits >= sysBitsLimit)
                    bits <= 0;
                else
                    bits <= bits + 1;
                pcmBit <= uncoded_data[bits];
            end
        end
    end
    
`endif   // USE_pngenTop ////////////////////////////////////////////////////////////////
    
    /***************************
       reset
    ****************************/
    initial begin
        reset = 1;
        #50
        reset = 0;
    end
    
    /// input data ///
    reg [0:0] uncoded_data [0:8192];  
    reg [0:0] coded_data [0:8192];
    initial begin
        #4
        $readmemb("./txword.txt", uncoded_data, 0, codeblockLimit-1);
    end

    /***************************
        detect ASM frame start 
        write CodeBlock to ouput file
   ****************************/
    assign irigEn = ((bouts <= sysBitsLimit) && (asmFound==1'b1)) ? 1'b1 : 1'b0;
    integer i;
    integer extra;
    reg firstASMfound;
    always @(posedge clk) begin
        if(reset) begin
            bouts <= 0;
            sr <= 256'h0;
            asmFound <= 1'b0;
            extra = 0;
            firstASMfound = 0;
        end
        else if(clkEn) begin
            sr <= srData;
            if(asmFound) begin
                if(bouts <= codeblockLimit-1) begin
                    coded_data[bouts] =  (randomizer == `PNGEN_LDPC_RND_CCSDS) ? ccsDataOut 
                                        :(randomizer == `PNGEN_LDPC_RND_IRIG) ? irigDataOut : encBit ;
                    bouts <= bouts + 1;
                end
                if(bouts >= codeblockLimit-1) begin
                    $writememb("./mem_file_out.dat", coded_data, 0, codeblockLimit-1);                   
                    $stop; 
                    bouts <=0;  
                    asmFound <=0; 
                    for ( i=0; i<8192 ;i=i+1 )
                        coded_data[i] <= 1'b0 ;
                end
                extra = 0;
            end
            else begin
                if(asm_sync) begin
                    asmFound <= 1'b1;
                    firstASMfound <= 1'b1;
                end
                if(extra>asmSize && firstASMfound)
                    $stop;
                extra <= extra + 1;
            end
            ;
        end
    end


endmodule