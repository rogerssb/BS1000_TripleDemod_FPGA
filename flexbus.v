// adapts flexbus to legacy interface
//
// K64P144M120SF5RM.pdf
//
// 31.4.9.1
// multiplexed 32-bit address and 16-bit data (BLS = 0)
// the upper 16 address bits are represented by FB_CS1
// the lower 16 address bits are on FB_AD16 - FB_AD1
// the 16 data bits are on FB_AD31 - FB_AD16

// Figure 31-31. Single Word-Read Transfer
// Figure 31-32. Single Word-Write Transfer

module flexbus(
    fb_clk,
    fb_ale,
    fb_csn,
    fb_wrn,
    fb_ad,
    cs,
    wr0,
    wr1,
    wr2,
    wr3,
    addr,
    dataIn
);

input           fb_clk;
input           fb_ale;
input           fb_csn;
input           fb_wrn;
input   [31:0]  fb_ad;
output          cs;
output          wr0;
output          wr1;
output          wr2;
output          wr3;
output  [12:1]  addr;
output  [31:0]  dataIn;

reg [12:1] addr;
always @ (posedge fb_clk) begin
	if (fb_ale) begin
		addr <= fb_ad[12:1];
		end
	end

reg     [31:0]  dataIn;
always @(posedge fb_clk) begin
    if (!fb_csn) begin
        dataIn <= {fb_ad[31:16], fb_ad[31:16]};
        end
    end

reg cs;
reg rd;
reg wr0,wr1,wr2,wr3;
always @(posedge fb_clk) begin
    cs <= !fb_csn;
    if (!fb_csn && !fb_wrn) begin
        wr0 <= !fb_ad[1];
        wr1 <= !fb_ad[1];
        wr2 <=  fb_ad[1];
        wr3 <=  fb_ad[1];
        end
    else begin
        wr0 <= 0;
        wr1 <= 0;
        wr2 <= 0;
        wr3 <= 0;
        end
    end


/*
reg [2:0] fb_wr_delay;
always @ (posedge fb_clk) begin
	if (fb_ale && !fb_wr) begin
		fb_wr_delay <= 3'b001;
		nWr <= 1'b0;
		end
	else begin
		fb_wr_delay <= {fb_wr_delay[1:0], 1'b0};
		nWr <= !(|fb_wr_delay[0]); // add vector bits to extend pulse
		end
	end
*/

endmodule
