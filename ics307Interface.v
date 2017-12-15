`include "./addressMap.v"
`timescale 1ns / 10 ps

module ics307Interface #(parameter SysclkDivider = 2)
(
    input                   reset,
    input                   busClk,
    input           [12:0]  addr,
    input           [31:0]  dataIn,
    output  reg     [31:0]  dataOut,
    input                   wr0, wr1, wr2, wr3,
    input                   clk,
    output  reg             SCK,
    output                  SDI,
    output  reg             CS0,
    output  reg             CS1,
    output  reg             CS2,
    output                  EN0,
    output                  EN1,
    output                  EN2,
    output  reg             pll0Reset,
    output  reg             pll1Reset,
    output  reg             pll2Reset
);

    reg pll0Space;
    reg pll1Space;
    reg pll2Space;
    always @* begin
        casex(addr)
            `PLL0SPACE: pll0Space = 1;
            default:    pll0Space = 0;
        endcase
        casex(addr)
            `PLL1SPACE: pll1Space = 1;
            default:    pll1Space = 0;
        endcase
        casex(addr)
            `PLL2SPACE: pll2Space = 1;
            default:    pll2Space = 0;
        endcase
    end

    reg     [31:0]  pll0Bits0to31,pll0Bits68to99,pll0Bits100to131;
    reg             pll0Enable;
    reg     [31:0]  pll1Bits0to31,pll1Bits68to99,pll1Bits100to131;
    reg             pll1Enable;
    reg     [31:0]  pll2Bits0to31,pll2Bits68to99,pll2Bits100to131;
    reg             pll2Enable;
    always @(posedge busClk) begin
        if (pll0Space && wr0) begin
            casex (addr)
                `PLL0_BITS_0to31: begin
                    pll0Bits0to31[7:0] <= dataIn[7:0];
                end
                `PLL0_BITS_68to99: begin
                    pll0Bits68to99[7:0] <= dataIn[7:0];
                end
                `PLL0_BITS_100to131: begin
                    pll0Bits100to131[7:0] <= dataIn[7:0];
                end
                `PLL0_CONTROL: begin
                    pll0Enable <= dataIn[0];
                    pll0Reset <= dataIn[2];
                end
                default: ;
            endcase
        end
        if (pll1Space && wr0) begin
            casex (addr)
                `PLL1_BITS_0to31: begin
                    pll1Bits0to31[7:0] <= dataIn[7:0];
                end
                `PLL1_BITS_68to99: begin
                    pll1Bits68to99[7:0] <= dataIn[7:0];
                end
                `PLL1_BITS_100to131: begin
                    pll1Bits100to131[7:0] <= dataIn[7:0];
                end
                `PLL1_CONTROL: begin
                    pll1Enable <= dataIn[0];
                    pll1Reset <= dataIn[2];
                end
                default: ;
            endcase
        end
        if (pll2Space && wr0) begin
            casex (addr)
                `PLL2_BITS_0to31: begin
                    pll2Bits0to31[7:0] <= dataIn[7:0];
                end
                `PLL2_BITS_68to99: begin
                    pll2Bits68to99[7:0] <= dataIn[7:0];
                end
                `PLL2_BITS_100to131: begin
                    pll2Bits100to131[7:0] <= dataIn[7:0];
                end
                `PLL2_CONTROL: begin
                    pll2Enable <= dataIn[0];
                    pll2Reset <= dataIn[2];
                end
                default: ;
            endcase
        end

        if (pll0Space && wr1) begin
            casex (addr)
                `PLL0_BITS_0to31: begin
                    pll0Bits0to31[15:8] <= dataIn[15:8];
                end
                `PLL0_BITS_68to99: begin
                    pll0Bits68to99[15:8] <= dataIn[15:8];
                end
                `PLL0_BITS_100to131: begin
                    pll0Bits100to131[15:8] <= dataIn[15:8];
                end
                default: ;
            endcase
        end
        if (pll1Space && wr1) begin
            casex (addr)
                `PLL1_BITS_0to31: begin
                    pll1Bits0to31[15:8] <= dataIn[15:8];
                end
                `PLL1_BITS_68to99: begin
                    pll1Bits68to99[15:8] <= dataIn[15:8];
                end
                `PLL1_BITS_100to131: begin
                    pll1Bits100to131[15:8] <= dataIn[15:8];
                end
                default: ;
            endcase
        end
        if (pll2Space && wr1) begin
            casex (addr)
                `PLL2_BITS_0to31: begin
                    pll2Bits0to31[15:8] <= dataIn[15:8];
                end
                `PLL2_BITS_68to99: begin
                    pll2Bits68to99[15:8] <= dataIn[15:8];
                end
                `PLL2_BITS_100to131: begin
                    pll2Bits100to131[15:8] <= dataIn[15:8];
                end
                default: ;
            endcase
        end
        if (pll0Space && wr2) begin
            casex (addr)
                `PLL0_BITS_0to31: begin
                    pll0Bits0to31[23:16] <= dataIn[23:16];
                end
                `PLL0_BITS_68to99: begin
                    pll0Bits68to99[23:16] <= dataIn[23:16];
                end
                `PLL0_BITS_100to131: begin
                    pll0Bits100to131[23:16] <= dataIn[23:16];
                end
                default: ;
            endcase
        end
        if (pll1Space && wr2) begin
            casex (addr)
                `PLL1_BITS_0to31: begin
                    pll1Bits0to31[23:16] <= dataIn[23:16];
                end
                `PLL1_BITS_68to99: begin
                    pll1Bits68to99[23:16] <= dataIn[23:16];
                end
                `PLL1_BITS_100to131: begin
                    pll1Bits100to131[23:16] <= dataIn[23:16];
                end
                default: ;
            endcase
        end
        if (pll2Space && wr2) begin
            casex (addr)
                `PLL2_BITS_0to31: begin
                    pll2Bits0to31[23:16] <= dataIn[23:16];
                end
                `PLL2_BITS_68to99: begin
                    pll2Bits68to99[23:16] <= dataIn[23:16];
                end
                `PLL2_BITS_100to131: begin
                    pll2Bits100to131[23:16] <= dataIn[23:16];
                end
                default: ;
            endcase
        end
        if (pll0Space && wr3) begin
            casex (addr)
                `PLL0_BITS_0to31: begin
                    pll0Bits0to31[31:24] <= dataIn[31:24];
                end
                `PLL0_BITS_68to99: begin
                    pll0Bits68to99[31:24] <= dataIn[31:24];
                end
                `PLL0_BITS_100to131: begin
                    pll0Bits100to131[31:24] <= dataIn[31:24];
                end
                default: ;
            endcase
        end
        if (pll1Space && wr3) begin
            casex (addr)
                `PLL1_BITS_0to31: begin
                    pll1Bits0to31[31:24] <= dataIn[31:24];
                end
                `PLL1_BITS_68to99: begin
                    pll1Bits68to99[31:24] <= dataIn[31:24];
                end
                `PLL1_BITS_100to131: begin
                    pll1Bits100to131[31:24] <= dataIn[31:24];
                end
                default: ;
            endcase
        end
        if (pll2Space && wr3) begin
            casex (addr)
                `PLL2_BITS_0to31: begin
                    pll2Bits0to31[31:24] <= dataIn[31:24];
                end
                `PLL2_BITS_68to99: begin
                    pll2Bits68to99[31:24] <= dataIn[31:24];
                end
                `PLL2_BITS_100to131: begin
                    pll2Bits100to131[31:24] <= dataIn[31:24];
                end
                default: ;
            endcase
        end
    end

    reg             xferDone;
    always @* begin
        if (pll0Space) begin
            casex (addr)
                `PLL0_BITS_0to31:       dataOut = pll0Bits0to31;
                `PLL0_BITS_68to99:      dataOut = pll0Bits68to99;
                `PLL0_BITS_100to131:    dataOut = pll0Bits100to131;
                `PLL0_CONTROL:          dataOut = {29'b0,pll0Reset,xferDone,pll0Enable};
                default:                dataOut = 32'h0;
            endcase
        end
        else if (pll1Space) begin
            casex (addr)
                `PLL1_BITS_0to31:       dataOut = pll1Bits0to31;
                `PLL1_BITS_68to99:      dataOut = pll1Bits68to99;
                `PLL1_BITS_100to131:    dataOut = pll1Bits100to131;
                `PLL1_CONTROL:          dataOut = {29'b0,pll1Reset,xferDone,pll1Enable};
                default:                dataOut = 32'h0;
            endcase
        end
        else if (pll2Space) begin
            casex (addr)
                `PLL2_BITS_0to31:       dataOut = pll2Bits0to31;
                `PLL2_BITS_68to99:      dataOut = pll2Bits68to99;
                `PLL2_BITS_100to131:    dataOut = pll2Bits100to131;
                `PLL2_CONTROL:          dataOut = {29'b0,pll2Reset,xferDone,pll2Enable};
                default:                dataOut = 32'h0;
            endcase
        end
        else begin
            dataOut = 32'hx;
        end
    end


    // Create start triggers for each PLL
    reg     startPll0, startPll1, startPll2;
    always @(posedge busClk or posedge xferDone) begin
        if (xferDone) begin
            startPll0 <= 0;
            startPll1 <= 0;
            startPll2 <= 0;
        end
        else if (pll0Space && wr3) begin
            casex (addr)
                `PLL0_XFER: begin
                    startPll0 <= 1;
                end
                default: ;
            endcase
        end
        else if (pll1Space && wr3) begin
            casex (addr)
                `PLL1_XFER: begin
                    startPll1 <= 1;
                end
                default: ;
            endcase
        end
        else if (pll2Space && wr3) begin
            casex (addr)
                `PLL2_XFER: begin
                    startPll2 <= 1;
                end
                default: ;
            endcase
        end
    end

    // Create spi clock that can be gated by the state machine
    integer         clkCount;
    reg             sckEnable;
    wire            posEdgeSCK = (clkCount == 0);
    wire            negEdgeSCK = (clkCount == SysclkDivider/2);
    always @(posedge clk) begin
        if (reset) begin
            clkCount <= SysclkDivider - 1;
        end
        else if (clkCount == 0) begin
            clkCount <= SysclkDivider - 1;
        end
        else begin
            clkCount <= clkCount - 1;
        end
        if (posEdgeSCK && sckEnable) begin
            SCK <= 1;
        end
        else if (negEdgeSCK) begin
            SCK <= 0;
        end
    end

    // Interface state machine
    reg     [3:0]   spiState;
    parameter WAIT =        2'b00,
              START =       2'b01,
              SHIFT =       2'b11,
              STROBE =      2'b10;
    integer         bitcount;
    reg     [131:0] srInit,sr;
    reg     [2:0]   startSR0,startSR1,startSR2;
    always @(posedge clk) begin
        startSR0 <= {startSR0[1:0],startPll0};
        startSR1 <= {startSR1[1:0],startPll1};
        startSR2 <= {startSR2[1:0],startPll2};
        if (reset) begin
            spiState <= WAIT;
            CS0 <= 0;
            CS1 <= 0;
            CS2 <= 0;
            sckEnable <= 0;
            xferDone <= 0;
        end
        else begin
            casex (spiState)
                // Wait for a start signal
                WAIT: begin
                    if (negEdgeSCK) begin
                        CS0 <= 0;
                        CS1 <= 0;
                        CS2 <= 0;
                    end
                    xferDone <= 0;
                    if (startSR0 == 3'b011) begin
                        spiState <= START;
                        srInit <= {
                            pll0Bits100to131,
                            pll0Bits68to99,
                            36'b0,
                            pll0Bits0to31
                        };
                    end
                    else if (startSR1 == 3'b011) begin
                        spiState <= START;
                        srInit <= {
                            pll1Bits100to131,
                            pll1Bits68to99,
                            36'b0,
                            pll1Bits0to31
                        };
                    end
                    else if (startSR2 == 3'b011) begin
                        spiState <= START;
                        srInit <= {
                            pll2Bits100to131,
                            pll2Bits68to99,
                            36'b0,
                            pll2Bits0to31
                        };
                    end
                end
                START: begin
                    if (negEdgeSCK) begin
                        spiState <= SHIFT;
                        sr <= srInit;
                        sckEnable <= 1;
                        bitcount <= 131;
                    end
                end
                SHIFT: begin
                    if (negEdgeSCK) begin
                        sr <= {sr[130:0],1'b0};
                        if (bitcount == 0) begin
                            spiState <= STROBE;
                            sckEnable <= 0;
                        end
                        else begin
                            bitcount <= bitcount - 1;
                        end
                    end
                end
                STROBE: begin
                    if (negEdgeSCK) begin
                        spiState <= WAIT;
                        CS0 <= startPll0;
                        CS1 <= startPll1;
                        CS2 <= startPll2;
                        xferDone <= 1;
                    end
                end
                default: begin
                    spiState <= WAIT;
                    CS0 <= 0;
                    CS1 <= 0;
                    CS2 <= 0;
                    sckEnable <= 0;
                    xferDone <= 1;
                end
            endcase
        end
    end

    assign SDI = sr[131];
    //assign EN0 = pll0Enable;
    //assign EN1 = pll1Enable;
    //assign EN2 = pll2Enable;
    assign EN0 = 1'b1;
    assign EN1 = 1'b1;
    assign EN2 = 1'b1;

endmodule


`ifdef TEST_MODULE


`endif
