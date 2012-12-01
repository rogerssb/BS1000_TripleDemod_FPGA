//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  multiboot.v                                                  Verne Stauffer
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  December 01, 2012
//  This is a rewrite of Scott Rogers' multiboot module. It has been revised in
//  order to prevent clock and write strobe glitching. The module has also been
//  expanded to accomodate both Spartan-3 and Spartan-6 devices.
//
//  The maximum clock rate for the ICAP_SPARTAN6 primitive is 20 MHz.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`timescale 1ns / 1ps

module multiboot
    (
    input [23:0] next_addr,
    input clk,
    input reboot
    );

`ifdef SPARTAN3
`define LAST_XFER_STATE 20
`endif

`ifdef SPARTAN6
`define LAST_XFER_STATE 16
`endif

reg [4 : 0] state = `LAST_XFER_STATE + 1;
reg [15 : 0] d;
wire [15 : 0] I = {d[8],d[9],d[10],d[11],d[12],d[13],d[14],d[15],d[0],d[1],d[2],d[3],d[4],d[5],d[6],d[7]};

always@(posedge clk) begin
    if (reboot) state <= 0;
    else if(state != `LAST_XFER_STATE + 3) state <= state + 5'd1;
    end

// don't want this to glitch so make it synchronous
reg we = 1'b1;
always @ (posedge clk) begin
    if ((state >= 2) && (state <= `LAST_XFER_STATE - 1)) we <= 1'b0;
    else we <= 1'b1;
    end

`ifdef SPARTAN3

always @* begin
    case (state)
        3: d = 16'h00AA;
        4: d = 16'h0099;
        5: d = 16'h0032;
        6: d = 16'h0061;
        7: d = {8'h00,next_addr[15: 8]};
        8: d = {8'h00,next_addr[7: 0]};
        9: d = 16'h0032;
        10: d = 16'h0081;
        11: d = 16'h000B;
        12: d = {8'h00,next_addr[23:16]};
        13: d = 16'h0030;
        14: d = 16'h00A1;
        15: d = 16'h0000;
        16: d = 16'h000E;
        17: d = 16'h0020;
        18: d = 16'h0000;
        19: d = 16'h0020;
        20: d = 16'h0000;
        default: d = 16'h0000;
        endcase
    end

ICAP_SPARTAN3A icap
	(
	.BUSY(),
	.O(),
	.CE(we),
	.CLK(clk),
	.I(I[7 : 0]),
	.WRITE(we)
	);

`endif   //SPARTAN3

`ifdef SPARTAN6

always @* begin
    case (state)
        3: d = 16'hFFFF;
        4: d = 16'hAA99;
        5: d = 16'h5566;
        6: d = 16'h3261;
        7: d = next_addr[15: 0];
        8: d = 16'h3281;
        9: d = {8'h0B,next_addr[23 : 16]};
        10: d = 16'h32A1;
        11: d = 16'h0000;
        12: d = 16'h32C1;
        13: d = 16'h0B00;
        14: d = 16'h30A1;
        15: d = 16'h000E;
        16: d = 16'h2000;
        default: d = 16'h00;
        endcase
    end

ICAP_SPARTAN6 icap
	(
	.BUSY(),
	.O(),
	.CE(we),
	.CLK(clk),
	.I(I[15 : 0]),
	.WRITE(we)
	);

`endif //SPARTAN6

endmodule
