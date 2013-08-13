//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  multiboot.v                                                  Verne Stauffer
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  December 01, 2012
//  This is a rewrite of Scott Rogers' multiboot module to eliminate the
//  potential for clock glitching and to provide support for both the Spartan-3
//  and Spartan-6 families.
//
//  The maximum clock rate for the ICAP_SPARTAN6 primitive is 20 MHz.
//  The spartan6 primitive does not by itself hold its input signals in the
//  design. Therefore, I have routed the write enable and data lines to a
//  chipscope instantiation to maintain these through synthesis.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`timescale 1ns / 1ps

module multiboot
    (
    input [23:0] next_addr,
    input clk,
    input reboot
    );

`define SPARTAN3

`ifdef SPARTAN3
`define LAST_XFER_STATE 20
`endif

`ifdef SPARTAN6
`define LAST_XFER_STATE 16
`endif

reg [4 : 0] state = `LAST_XFER_STATE + 1;
always@(posedge clk) begin
    if (reboot) state <= 0;
    else if(state != `LAST_XFER_STATE + 3) state <= state + 5'd1;
    end

reg we = 1'b1;
always @ (posedge clk) begin
    if ((state >= 2) && (state <= `LAST_XFER_STATE - 1)) we <= 1'b0;
    else we <= 1'b1;
    end

`ifdef SPARTAN3
reg [7 : 0] d;
wire [7 : 0] I = {d[0],d[1],d[2],d[3],d[4],d[5],d[6],d[7]};
always @* begin
    case (state)
        3: d = 8'hAA;
        4: d = 8'h99;
        5: d = 8'h32;
        6: d = 8'h61;
        7: d = next_addr[15: 8];
        8: d = next_addr[7: 0];
        9: d = 8'h32;
        10: d = 8'h81;
        11: d = 8'h0B;
        12: d = next_addr[23:16];
        13: d = 8'h30;
        14: d = 8'hA1;
        15: d = 8'h00;
        16: d = 8'h0E;
        17: d = 8'h20;
        18: d = 8'h00;
        19: d = 8'h20;
        20: d = 8'h00;
        default: d = 8'h00;
        endcase
    end

ICAP_SPARTAN3A icap
	(
	.BUSY(),
	.O(),
	.CE(we),
	.CLK(clk),
	.I(I),
	.WRITE(we)
	);
`endif   //SPARTAN3

`ifdef SPARTAN6
reg [15 : 0] d;
wire [15 : 0] I = {d[8],d[9],d[10],d[11],d[12],d[13],d[14],d[15],d[0],d[1],d[2],d[3],d[4],d[5],d[6],d[7]};
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
	.I(I),
	.WRITE(we)
	);

wire [35 : 0] CONTROL;
chipscope_ila ila (
    .CONTROL(CONTROL), // INOUT BUS [35:0]
    .CLK(clk), // IN
    .DATA({I,I}), // IN BUS [31:0]
    .TRIG0(we) // IN BUS [0:0]
);

chipscope_icon icon (
    .CONTROL0(CONTROL) // INOUT BUS [35:0]
);



`endif //SPARTAN6

endmodule
