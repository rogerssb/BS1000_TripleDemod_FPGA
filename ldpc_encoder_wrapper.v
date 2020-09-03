`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2020 02:58:38 PM
// Design Name: 
// Module Name: ldpc_encoder_wrapper
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

module ldpc_encoder_wrapper(
	input  [1:0]    rate,
    input           blocksize,
    input           reset,
    input           clk,  
    input           clkEn,	
    input           data_in        ,
    input           data_in_valid  ,
    output  reg     data_out       ,
    output  reg     data_out_valid ,
    input           encode         ,
    input           sync           ,
    output  reg     block_sys_in   ,
    output  reg     block_par_in   ,
    output  reg     block_end_in   ,
    output  reg     block_sys_out  ,
    output  reg     block_par_out  ,
    output  reg     block_end_out  
    );
    
    wire rst_n = ~reset;
    
    
    wire sel_4k_12 = {blocksize,rate} == {`PNGEN_LDPC_L4096,`PNGEN_LDPC_R1_2} ? 1'b1 : 1'b0;
    wire sel_4k_23 = {blocksize,rate} == {`PNGEN_LDPC_L4096,`PNGEN_LDPC_R2_3} ? 1'b1 : 1'b0;
    wire sel_4k_45 = {blocksize,rate} == {`PNGEN_LDPC_L4096,`PNGEN_LDPC_R4_5} ? 1'b1 : 1'b0;
    wire sel_1k_12 = {blocksize,rate} == {`PNGEN_LDPC_L1024,`PNGEN_LDPC_R1_2} ? 1'b1 : 1'b0;
    wire sel_1k_23 = {blocksize,rate} == {`PNGEN_LDPC_L1024,`PNGEN_LDPC_R2_3} ? 1'b1 : 1'b0;
    wire sel_1k_45 = {blocksize,rate} == {`PNGEN_LDPC_L1024,`PNGEN_LDPC_R4_5} ? 1'b1 : 1'b0;
    
    wire data_out_1k_12     ;
    wire block_sys_in_1k_12 ;
    wire block_par_in_1k_12 ;
    wire block_end_in_1k_12 ;
    wire block_sys_out_1k_12;
    wire block_par_out_1k_12;
    wire block_end_out_1k_12;
    wire data_out_valid_1k_12;
    ldpc_encoder_1k_12 ldpc_1k_12
    (
        .data_in       (data_in       ), 
        .data_in_valid (data_in_valid ),
        .data_out      (data_out_1k_12      ),
        .data_out_valid(data_out_valid_1k_12 ),
        .encode        (encode       ),
        .sync          (sync         ),
        .block_sys_in  (block_sys_in_1k_12  ),
        .block_par_in  (block_par_in_1k_12  ),
        .block_end_in  (block_end_in_1k_12  ),
        .block_sys_out (block_sys_out_1k_12 ),
        .block_par_out (block_par_out_1k_12 ),
        .block_end_out (block_end_out_1k_12 ),
        .rst_n         (rst_n & sel_1k_12   ),
        .clk           (clk           ),
        .clkEn         (clkEn         ) 
    );
    
    wire data_out_1k_23     ;
    wire block_sys_in_1k_23 ;
    wire block_par_in_1k_23 ;
    wire block_end_in_1k_23 ;
    wire block_sys_out_1k_23;
    wire block_par_out_1k_23;
    wire block_end_out_1k_23;
    wire data_out_valid_1k_23;
    ldpc_encoder_1k_23 ldpc_1k_23
    (
        .data_in       (data_in       ), 
        .data_in_valid (data_in_valid ),
        .data_out      (data_out_1k_23      ),
        .data_out_valid(data_out_valid_1k_23 ),
        .encode        (encode       ),
        .sync          (sync         ),
        .block_sys_in  (block_sys_in_1k_23  ),
        .block_par_in  (block_par_in_1k_23  ),
        .block_end_in  (block_end_in_1k_23  ),
        .block_sys_out (block_sys_out_1k_23 ),
        .block_par_out (block_par_out_1k_23 ),
        .block_end_out (block_end_out_1k_23 ),
        .rst_n         (rst_n & sel_1k_23   ),
        .clk           (clk           ),
        .clkEn         (clkEn         )  
    );
    
    wire data_out_1k_45     ;
    wire block_sys_in_1k_45 ;
    wire block_par_in_1k_45 ;
    wire block_end_in_1k_45 ;
    wire block_sys_out_1k_45;
    wire block_par_out_1k_45;
    wire block_end_out_1k_45;
    wire data_out_valid_1k_45;
    ldpc_encoder_1k_45 ldpc_1k_45
    (
        .data_in       (data_in       ), 
        .data_in_valid (data_in_valid ),
        .data_out      (data_out_1k_45      ),
        .data_out_valid(data_out_valid_1k_45 ),
        .encode        (encode       ),
        .sync          (sync         ),
        .block_sys_in  (block_sys_in_1k_45  ),
        .block_par_in  (block_par_in_1k_45  ),
        .block_end_in  (block_end_in_1k_45  ),
        .block_sys_out (block_sys_out_1k_45 ),
        .block_par_out (block_par_out_1k_45 ),
        .block_end_out (block_end_out_1k_45 ),
        .rst_n         (rst_n & sel_1k_45   ),
        .clk           (clk           ),
        .clkEn         (clkEn         )  
    );  

    wire data_out_4k_12     ;
    wire block_sys_in_4k_12 ;
    wire block_par_in_4k_12 ;
    wire block_end_in_4k_12 ;
    wire block_sys_out_4k_12;
    wire block_par_out_4k_12;
    wire block_end_out_4k_12;
    wire data_out_valid_4k_12;
    ldpc_encoder_4k_12 ldpc_4k_12
    (
        .data_in       (data_in       ), 
        .data_in_valid (data_in_valid ),
        .data_out      (data_out_4k_12      ),
        .data_out_valid(data_out_valid_4k_12 ),
        .encode        (encode       ),
        .sync          (sync         ),
        .block_sys_in  (block_sys_in_4k_12  ),
        .block_par_in  (block_par_in_4k_12  ),
        .block_end_in  (block_end_in_4k_12  ),
        .block_sys_out (block_sys_out_4k_12 ),
        .block_par_out (block_par_out_4k_12 ),
        .block_end_out (block_end_out_4k_12 ),
        .rst_n         (rst_n & sel_4k_12   ),
        .clk           (clk           ),
        .clkEn         (clkEn         ) 
    );
    
    wire data_out_4k_23     ;
    wire block_sys_in_4k_23 ;
    wire block_par_in_4k_23 ;
    wire block_end_in_4k_23 ;
    wire block_sys_out_4k_23;
    wire block_par_out_4k_23;
    wire block_end_out_4k_23;
    wire data_out_valid_4k_23;
    ldpc_encoder_4k_23 ldpc_4k_23
    (
        .data_in       (data_in       ), 
        .data_in_valid (data_in_valid ),
        .data_out      (data_out_4k_23      ),
        .data_out_valid(data_out_valid_4k_23 ),
        .encode        (encode       ),
        .sync          (sync         ),
        .block_sys_in  (block_sys_in_4k_23  ),
        .block_par_in  (block_par_in_4k_23  ),
        .block_end_in  (block_end_in_4k_23  ),
        .block_sys_out (block_sys_out_4k_23 ),
        .block_par_out (block_par_out_4k_23 ),
        .block_end_out (block_end_out_4k_23 ),
        .rst_n         (rst_n & sel_4k_23   ),
        .clk           (clk           ),
        .clkEn         (clkEn         ) 
    );
    
    wire data_out_4k_45     ;
    wire block_sys_in_4k_45 ;
    wire block_par_in_4k_45 ;
    wire block_end_in_4k_45 ;
    wire block_sys_out_4k_45;
    wire block_par_out_4k_45;
    wire block_end_out_4k_45;
    wire data_out_valid_4k_45;
    ldpc_encoder_4k_45 ldpc_4k_45
    (
        .data_in       (data_in       ), 
        .data_in_valid (data_in_valid ),
        .data_out      (data_out_4k_45      ),
        .data_out_valid(data_out_valid_4k_45 ),
        .encode        (encode       ),
        .sync          (sync         ),
        .block_sys_in  (block_sys_in_4k_45  ),
        .block_par_in  (block_par_in_4k_45  ),
        .block_end_in  (block_end_in_4k_45  ),
        .block_sys_out (block_sys_out_4k_45 ),
        .block_par_out (block_par_out_4k_45 ),
        .block_end_out (block_end_out_4k_45 ),
        .rst_n         (rst_n & sel_4k_45   ),
        .clk           (clk           ),
        .clkEn         (clkEn         ) 
    ); 
    
    
    always @(*) begin 
        case ({blocksize,rate}) 
            {`PNGEN_LDPC_L4096,`PNGEN_LDPC_R1_2}: begin
                 data_out       <= data_out_4k_12;       
                 data_out_valid <= data_out_valid_4k_12; 
                 block_sys_in   <= block_sys_in_4k_12;   
                 block_par_in   <= block_par_in_4k_12;   
                 block_end_in   <= block_end_in_4k_12;   
                 block_sys_out  <= block_sys_out_4k_12;  
                 block_par_out  <= block_par_out_4k_12;  
                 block_end_out  <= block_end_out_4k_12 ; 
            end  
			{`PNGEN_LDPC_L4096,`PNGEN_LDPC_R2_3}: begin
                 data_out       <= data_out_4k_23;       
                 data_out_valid <= data_out_valid_4k_23; 
                 block_sys_in   <= block_sys_in_4k_23;   
                 block_par_in   <= block_par_in_4k_23;   
                 block_end_in   <= block_end_in_4k_23;   
                 block_sys_out  <= block_sys_out_4k_23;  
                 block_par_out  <= block_par_out_4k_23;  
                 block_end_out  <= block_end_out_4k_23;  
            end                
            {`PNGEN_LDPC_L4096,`PNGEN_LDPC_R4_5}: begin
                 data_out       <= data_out_4k_45;       
                 data_out_valid <= data_out_valid_4k_45; 
                 block_sys_in   <= block_sys_in_4k_45;   
                 block_par_in   <= block_par_in_4k_45;   
                 block_end_in   <= block_end_in_4k_45;   
                 block_sys_out  <= block_sys_out_4k_45;  
                 block_par_out  <= block_par_out_4k_45;  
                 block_end_out  <= block_end_out_4k_45;  
            end
            {`PNGEN_LDPC_L1024,`PNGEN_LDPC_R1_2}: begin
                 data_out       <= data_out_1k_12;       
                 data_out_valid <= data_out_valid_1k_12; 
                 block_sys_in   <= block_sys_in_1k_12;   
                 block_par_in   <= block_par_in_1k_12;   
                 block_end_in   <= block_end_in_1k_12;   
                 block_sys_out  <= block_sys_out_1k_12;  
                 block_par_out  <= block_par_out_1k_12;  
                 block_end_out  <= block_end_out_1k_12 ; 
            end  
            {`PNGEN_LDPC_L1024,`PNGEN_LDPC_R2_3}: begin
                 data_out       <= data_out_1k_23;       
                 data_out_valid <= data_out_valid_1k_23; 
                 block_sys_in   <= block_sys_in_1k_23;   
                 block_par_in   <= block_par_in_1k_23;   
                 block_end_in   <= block_end_in_1k_23;   
                 block_sys_out  <= block_sys_out_1k_23;  
                 block_par_out  <= block_par_out_1k_23;  
                 block_end_out  <= block_end_out_1k_23;  
            end                
            {`PNGEN_LDPC_L1024,`PNGEN_LDPC_R4_5}: begin
                 data_out       <= data_out_1k_45;       
                 data_out_valid <= data_out_valid_1k_45; 
                 block_sys_in   <= block_sys_in_1k_45;   
                 block_par_in   <= block_par_in_1k_45;   
                 block_end_in   <= block_end_in_1k_45;   
                 block_sys_out  <= block_sys_out_1k_45;  
                 block_par_out  <= block_par_out_1k_45;  
                 block_end_out  <= block_end_out_1k_45;  
            end  
 			default: begin
                 data_out       <= 1'b0; 
                 data_out_valid <= 1'b0; 
                 block_sys_in   <= 1'b0; 
                 block_par_in   <= 1'b0; 
                 block_end_in   <= 1'b0; 
                 block_sys_out  <= 1'b0; 
                 block_par_out  <= 1'b0; 
                 block_end_out  <= 1'b0;
            end                                  
        endcase
    end
       
endmodule
