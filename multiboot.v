`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		SEMCO
// Engineer: 		Scott Rogers
//
// Create Date:    11:08:12 08/30/2011
// Design Name:
// Module Name:    multiboot
// Project Name:
// Target Devices:
// Tool versions:
// Description: 	Interface to the Spartan-3A ICAP to reload new configuration at specified address.
//                Does not override the boot mode settings defined by the M[2:0] and VS[2:0] pins
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module multiboot
(
    input [23:0] next_addr,		//configuration's PROM address
    input clk,							//clock source for state-machine and ICAP write cycles
    input reboot						//single pulse (L-H-L) to start FSM, its period must at least the period of clk
);

	wire ce;
	wire [7:0] idata;
	wire write;
	reg  icap_ce;
	reg  [7:0] icap_data;

  wire icap_clk;

	ICAP_SPARTAN3A icap
	(

			.BUSY(),		   	// Busy output
			.O(),         		// 8-bit data output
			.CE(ce),       	// Clock enable input
			.CLK(icap_clk),  	// Clock input
			.I(idata),        // 8-bit data input
			.WRITE(write)  	// Write input
	);


   reg [4:0] state = 21;

   always@(posedge clk)
	begin
      if (reboot)
         state <= 0;
		else
			if(state == 23)
				state <=state;
			else
				state <= state + 1;
	end

	//Give two extra clock pulse before and after writting instructions to the ICAP
	always @*
	begin
		case (state)
       3: {icap_ce, icap_data} = {1'b0, 8'hAA};         			// sync H
       4: {icap_ce, icap_data} = {1'b0, 8'h99};         			// sync L
       5: {icap_ce, icap_data} = {1'b0, 8'h32};         			// gen1 H
       6: {icap_ce, icap_data} = {1'b0, 8'h61};         			// gen1 L
       7: {icap_ce, icap_data} = {1'b0, next_addr[15: 8]}; 		// user addr
       8: {icap_ce, icap_data} = {1'b0, next_addr[ 7: 0]}; 		// user addr
       9: {icap_ce, icap_data} = {1'b0, 8'h32};         			// gen2 H
      10: {icap_ce, icap_data} = {1'b0, 8'h81};         			// gen2 L
      11: {icap_ce, icap_data} = {1'b0, 8'h0B};						// user addr
      12: {icap_ce, icap_data} = {1'b0, next_addr[23:16]}; 		// user addr
      13: {icap_ce, icap_data} = {1'b0, 8'h30};			         // cmd H
      14: {icap_ce, icap_data} = {1'b0, 8'hA1};			         // cmd L
      15: {icap_ce, icap_data} = {1'b0, 8'h00};			         // reboot H
      16: {icap_ce, icap_data} = {1'b0, 8'h0E};			         // reboot L
      17: {icap_ce, icap_data} = {1'b0, 8'h20};				      // no op H
      18: {icap_ce, icap_data} = {1'b0, 8'h00};			         // no op L
      19: {icap_ce, icap_data} = {1'b0, 8'h20};				      // no op H
      20: {icap_ce, icap_data} = {1'b0, 8'h00};			         // no op L
		default: {icap_ce, icap_data} = {1'b1, 8'h00}; 			   // idle
	 endcase
	end

	assign ce = icap_ce; // active low
	assign idata[0] = icap_data[7]; // icap data port is LSB first, D[0:7], so swap bit order
	assign idata[1] = icap_data[6]; //
	assign idata[2] = icap_data[5]; //
	assign idata[3] = icap_data[4]; //
	assign idata[4] = icap_data[3]; //
	assign idata[5] = icap_data[2]; //
	assign idata[6] = icap_data[1]; //
	assign idata[7] = icap_data[0]; //
	assign write = icap_ce;//1'b0; // active low

	wire iclk_en = (state<23 && state>0);
	assign icap_clk = iclk_en ? clk:1'b0;

endmodule
