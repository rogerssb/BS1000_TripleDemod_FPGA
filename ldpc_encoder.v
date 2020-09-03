`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2020 11:14:43 AM
// Design Name: 
// Module Name: ldpc
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
`include "addressMap.v"

module ldpc_encoder(
    input          clk,
	input          clkEn,
	input          reset,
	input          pcmBit,
	output reg	   hold,
	output reg	   encBit,
	input  [1:0]   rate,
	input          blocksize,
	input  [1:0]   randomize
    );
 
    /// CCSDS Randomizer
    wire ccsdsEn;
    wire ccsdsReset;
    wire ccsdsDataIn;
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
    
    /// IRIG Randomizer
    wire irigEn = clkEn & ~hold;
    reg [14:0] iSr;
    wire pcmBitIrigEnc = iSr[14]^iSr[13]^pcmBit; 
    always@(posedge clk)
    begin
        if(reset)
            iSr <= 15'h01;
        else if(clkEn) begin
            if(irigEn)
                iSr <= {iSr[13:0],pcmBitIrigEnc};
        end
    end    
    
    /// ASM 
    parameter [63:0] ASM_A = 64'hFCB88938D8D76A4F;
    parameter [63:0] ASM_An = 64'h034776C7272895B0;
    parameter [255:0] ASM_LOAD = {ASM_A, ASM_A, ASM_An, ASM_A};
    reg [255:0] asm_sr;
  
    reg [14:0] count;
    
    /// ldpc encoder signals
    reg data_in;       
    reg ldpc_data_in_valid;    
    wire ldpc_data_out;       
    wire ldpc_data_out_valid;     
    reg ldpc_encode;        
    reg ldpc_sync;          
    wire ldpc_block_sys_in;  
    wire ldpc_block_par_in;  
    wire ldpc_block_end_in;  
    wire ldpc_block_sys_out; 
    wire ldpc_block_par_out; 
    wire ldpc_block_end_out; 
   
    
    /// LDPC State Machine  
    parameter STATE_ASM = 2'b00;
    parameter STATE_CODEBLOCK = 2'b01;
    parameter STATE_PARITY = 2'b10;
//    parameter STATE_4 = 2'b11;
    
    reg [1:0] state = STATE_ASM;
    
    wire [8:0] asmCntLimit = blocksize == `PNGEN_LDPC_L4096 ? 255 : 63;
    wire [14:0] sysBitsLimit = blocksize == `PNGEN_LDPC_L4096 ? 4095 : 1023;
    reg [14:0] cb1024, cb4096;
    wire [14:0] codeblockLimit = blocksize == `PNGEN_LDPC_L4096 ? cb4096 : cb1024;
    always@(*) begin
        case (rate)
        `PNGEN_LDPC_R1_2 : begin cb1024 <= 2048; cb4096 <= 8192  ; end
        `PNGEN_LDPC_R2_3 : begin cb1024 <= 1536; cb4096 <= 6144 ; end
      //`PNGEN_LDPC_R3_4 : begin cb1024 <=  ; cb4096 <=  ; end
        `PNGEN_LDPC_R4_5 : begin cb1024 <= 1280; cb4096 <= 5120 ; end
        endcase    
    end
    
    always @(posedge clk) begin
        if (reset) begin
            state <= STATE_ASM;
            count <= 0;
            asm_sr <= ASM_LOAD;
        end
        else if(clkEn)
            case (state)
            STATE_ASM : begin
//                if(count == 0)
//                    ldpc_sync <= 1'b1;
//                else
//                    ldpc_sync <= 1'b0;
                    
//                if (count == asmCntLimit -1) begin          //start feeding encoder 1 clk cycle early before the end of ASM header due to the encoder's registerd output is delay of 1 clock 
//                    hold <= 1'b0;
//                    ldpc_data_in_valid <= 1'b1;
//                    count <= count + 1;
//                end    
//                else if (count == asmCntLimit) begin
//                    state <= STATE_CODEBLOCK;
//                    count <= 1;                    
//                    encBit <= randomize == `PNGEN_LDPC_RND_CCSDS ? ccsDataOut :ldpc_data_out;
////                    asm_sr <= ASM_LOAD;
//                end
//                else begin
//                    count <= count + 1;
//                    hold <= 1'b1;
//                    encBit <= asm_sr[255];
//                    asm_sr <= {asm_sr[254:0],1'b0};
//                end
                if (count == asmCntLimit) begin
                    state <= STATE_CODEBLOCK;
                    count <= 0;
                    asm_sr <= ASM_LOAD;
                end
                else begin
                    count <= count + 1;            
                    asm_sr <= {asm_sr[254:0],1'b0};
                end    
            end
            STATE_CODEBLOCK : begin                     
                if(count == sysBitsLimit) begin
                    state <= STATE_PARITY;         
                end
                count <= count + 1;
            end
            STATE_PARITY : begin
                if(count == codeblockLimit-1) begin
                    state <= STATE_ASM;
                    count <= 0;                   
                end
                else begin
                    count <= count + 1;
                end
            end
            default : begin  // Fault Recovery
                state <= STATE_ASM;
                count <= 0;
                asm_sr <= ASM_LOAD;
            end
        endcase
    end

    reg asmDoneDly;
    always@(posedge clk) begin
        if(reset)
            asmDoneDly <= 1'b0;
        else begin
            if(clkEn)
                asmDoneDly <= (state != STATE_ASM) ? 1'b1 : 1'b0;
        end
    end
            
//    assign data_in = (randomize == `PNGEN_LDPC_RND_IRIG) ? pcmBitIrigEnc : pcmBit;
    always @(*) encBit <= (randomize == `PNGEN_LDPC_RND_CCSDS && asmDoneDly) ? ccsDataOut : ldpc_data_out;            
    always @(*) data_in <= (state == STATE_ASM) ? asm_sr[255] :  (randomize == `PNGEN_LDPC_RND_IRIG) ? pcmBitIrigEnc : pcmBit;
    always @(*) ldpc_sync <= (state == STATE_ASM && count == 0 && ~reset) ? 1'b1 : 1'b0;
    always @(*) hold <= (state == STATE_CODEBLOCK) ? 1'b0 : 1'b1;
    always @(*) ldpc_encode <= (state == STATE_PARITY) ? 1'b1 : 1'b0;
    always @(*) ldpc_data_in_valid <= (state == STATE_CODEBLOCK) ? 1'b1 :1'b0;
    
    assign ccsdsEn = (randomize == `PNGEN_LDPC_RND_CCSDS && asmDoneDly) ? 1'b1 : 1'b0;
    assign ccsdsReset = (!asmDoneDly) ? 1'b1 : 1'b0;
    assign ccsdsDataIn = ldpc_data_out;
           
    ldpc_encoder_wrapper ldpcEncoderWrapper(
        .rate           (rate          ),
        .blocksize      (blocksize     ),
        .reset          (reset         ),
        .clk            (clk           ),
        .clkEn          (clkEn         ),  
        .data_in        (data_in       ),
        .data_in_valid  (ldpc_data_in_valid ),
        .data_out       (ldpc_data_out      ),
        .data_out_valid (ldpc_data_out_valid),
        .encode         (ldpc_encode        ),
        .sync           (ldpc_sync          ),
        .block_sys_in   (ldpc_block_sys_in  ),
        .block_par_in   (ldpc_block_par_in  ),
        .block_end_in   (ldpc_block_end_in  ),
        .block_sys_out  (ldpc_block_sys_out ),
        .block_par_out  (ldpc_block_par_out ),
        .block_end_out  (ldpc_block_end_out )
        );        
endmodule
