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
    input               fb_clk,
    input               fb_ale,
    input               fb_csn,
    input               fb_wrn,
    input       [31:0]  fb_ad,
    output  reg         cs,
    output  reg         wr0,
    output  reg         wr1,
    output  reg         wr2,
    output  reg         wr3,
    output  reg [12:1]  addr,
    output  reg [31:0]  dataIn
);

    always @ (posedge fb_clk) begin
	    if (fb_ale) begin
		    addr <= fb_ad[12:1];
	    end
    end

    always @(posedge fb_clk) begin
        if (!fb_csn) begin
            dataIn <= {fb_ad[31:16], fb_ad[31:16]};
        end
    end

    reg wr;
    always @(posedge fb_clk) begin
        cs <= !fb_csn;
        wr <= !fb_wrn;
        if (cs && wr) begin
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

endmodule
