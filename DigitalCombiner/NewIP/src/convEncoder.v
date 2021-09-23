`timescale 1ns / 10 ps
`include "addressMap.v"
//`define USE_IP

module convEncoder(
	input 		clk,
	input		clkEn,
	input 		reset,
	input 		pcmBit,
	output 	reg	hold,
	output	reg	encBit	,
	input vitG2Inv
);
    wire resetN = ~reset;

`ifdef USE_IP
    wire tvalid = hold & clkEn;
    wire [7:0] m_axis_data_tdata;
    wire aclk = clk & clkEn;
    wire [1:0] encData = m_axis_data_tdata[1:0];
    
    convolution_1d2_k7 convEncIp (
      .aclk(aclk),                             	// input wire aclk
      .aresetn(resetN),                        	// input wire aresetn
      .s_axis_data_tdata({6'h00,pcmBit}),  	  	// input wire [7 : 0] s_axis_data_tdata
      .s_axis_data_tvalid(tvalid),  			// input wire s_axis_data_tvalid
      .s_axis_data_tready(s_axis_data_tready),  // output wire s_axis_data_tready
      .m_axis_data_tdata(m_axis_data_tdata),   	// output wire [7 : 0] m_axis_data_tdata
      .m_axis_data_tvalid(m_axis_data_tvalid),  // output wire m_axis_data_tvalid
      .m_axis_data_tready(1'b1)  				// input wire m_axis_data_tready
    );
`else
    wire [6:0] convCode0 = 7'b1001111;//7'o171;  // 7'b1111001;
    wire [6:0] convCode1 = 7'b1101101;//7'o133;  // 7'b1011011;
    reg [6:0] sr;
    wire [1:0] encData = {^(convCode1&sr), ^(convCode0&sr)};
    

    always@(posedge clk) begin
        if(reset)
            sr <= 7'b0000000;
        else if(clkEn & hold) begin
            sr <= {sr[6:0], pcmBit};
        end
    end
`endif
    
    always @(posedge clk) begin
        if(reset) begin
            hold<=1'b0;
        end
        else if(clkEn) begin
            hold <= ~hold;        
        end
    end    

    always @(posedge clk) begin
        if(reset) begin
            encBit <= 2'b00;
        end
        else if(clkEn) begin
            if(hold) begin
                encBit <= encData[1]^vitG2Inv;
            end
            else begin
                encBit <= encData[0];
            end
        end
end
    

endmodule		