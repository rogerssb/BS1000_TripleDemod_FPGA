`include "./addressMap.v"
`timescale 1ns / 10 ps

module mcp48xxInterface #(parameter SysclkDivider = 6)
(
    input                   clk,
    input                   clkEn0,
    input                   clkEn1,
    input                   reset,
    input                   dac0GainSelA,
    input                   dac0GainSelB,
    input           [11:0]  dac0ValueA,
    input           [11:0]  dac0ValueB,
    input                   dac1GainSelA,
    input                   dac1GainSelB,
    input           [11:0]  dac1ValueA,
    input           [11:0]  dac1ValueB,
    output  reg             SCK,
    output                  SDI,
    output  reg             CS0n,
    output  reg             CS1n
);


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
    parameter WAIT0 =       4'b0000,
              START0 =      4'b0001,
              SHIFT_A0 =    4'b0011,
              OUTPUT_A0 =   4'b0010,
              SHIFT_B0 =    4'b0110,
              OUTPUT_B0 =   4'b0111,
              WAIT1 =       4'b0101,
              START1 =      4'b0100,
              SHIFT_A1 =    4'b1100,
              OUTPUT_A1 =   4'b1101,
              SHIFT_B1 =    4'b1111,
              OUTPUT_B1 =   4'b1110;
    integer         bitcount;
    reg     [15:0]  dacAInit,dacBInit,sr;
    reg             ch0Pending;
    reg     [15:0]  pendingCh0DacAInit,pendingCh0DacBInit;
    reg             ch1Pending;
    reg     [15:0]  pendingCh1DacAInit,pendingCh1DacBInit;
    always @(posedge clk) begin
        if (reset) begin
            spiState <= WAIT0;
            CS0n <= 1;
            CS1n <= 1;
            sckEnable <= 0;
            ch0Pending <= 0;
            ch1Pending <= 0;
        end
        else begin
            casex (spiState)
                // Wait for clkEn0
                WAIT0: begin
                    if (clkEn0) begin
                        spiState <= START0;
                        dacAInit <= {1'b0,1'b0,dac0GainSelA,1'b1,dac0ValueA};
                        dacBInit <= {1'b1,1'b0,dac0GainSelB,1'b1,dac0ValueB};
                        ch0Pending <= 0;
                    end
                    else if (ch0Pending) begin
                        spiState <= START0;
                        dacAInit <= pendingCh0DacAInit;
                        dacBInit <= pendingCh0DacBInit;
                        ch0Pending <= 0;
                    end
                    else if (clkEn1) begin
                        spiState <= START1;
                        dacAInit <= {1'b0,1'b0,dac1GainSelA,1'b1,dac1ValueA};
                        dacBInit <= {1'b1,1'b0,dac1GainSelB,1'b1,dac1ValueB};
                        ch1Pending <= 0;
                    end
                end
                START0: begin
                    if (clkEn1) begin
                        pendingCh1DacAInit <= {1'b0,1'b0,dac1GainSelA,1'b1,dac1ValueA};
                        pendingCh1DacBInit <= {1'b1,1'b0,dac1GainSelB,1'b1,dac1ValueB};
                        ch1Pending <= 1;
                    end
                    if (negEdgeSCK) begin
                        spiState <= SHIFT_A0;
                        CS0n <= 0;
                        sr <= dacAInit;
                        sckEnable <= 1;
                        bitcount <= 15;
                    end
                end
                SHIFT_A0: begin
                    if (clkEn1) begin
                        pendingCh1DacAInit <= {1'b0,1'b0,dac1GainSelA,1'b1,dac1ValueA};
                        pendingCh1DacBInit <= {1'b1,1'b0,dac1GainSelB,1'b1,dac1ValueB};
                        ch1Pending <= 1;
                    end
                    if (negEdgeSCK) begin
                        sr <= {sr[14:0],1'b0};
                        if (bitcount == 0) begin
                            spiState <= OUTPUT_A0;
                            CS0n <= 1;
                            sckEnable <= 0;
                        end
                        else begin
                            bitcount <= bitcount - 1;
                        end
                    end
                end
                OUTPUT_A0: begin
                    if (clkEn1) begin
                        pendingCh1DacAInit <= {1'b0,1'b0,dac1GainSelA,1'b1,dac1ValueA};
                        pendingCh1DacBInit <= {1'b1,1'b0,dac1GainSelB,1'b1,dac1ValueB};
                        ch1Pending <= 1;
                    end
                    if (negEdgeSCK) begin
                        spiState <= SHIFT_B0;
                        CS0n <= 0;
                        sr <= dacBInit;
                        sckEnable <= 1;
                        bitcount <= 15;
                    end
                end
                SHIFT_B0: begin
                    if (clkEn1) begin
                        pendingCh1DacAInit <= {1'b0,1'b0,dac1GainSelA,1'b1,dac1ValueA};
                        pendingCh1DacBInit <= {1'b1,1'b0,dac1GainSelB,1'b1,dac1ValueB};
                        ch1Pending <= 1;
                    end
                    if (negEdgeSCK) begin
                        sr <= {sr[14:0],1'b0};
                        if (bitcount == 0) begin
                            spiState <= OUTPUT_B0;
                            CS0n <= 1;
                            sckEnable <= 0;
                        end
                        else begin
                            bitcount <= bitcount - 1;
                        end
                    end
                end
                OUTPUT_B0: begin
                    if (clkEn1) begin
                        pendingCh1DacAInit <= {1'b0,1'b0,dac1GainSelA,1'b1,dac1ValueA};
                        pendingCh1DacBInit <= {1'b1,1'b0,dac1GainSelB,1'b1,dac1ValueB};
                        ch1Pending <= 1;
                    end
                    if (negEdgeSCK) begin
                        spiState <= WAIT1;
                    end
                end
                WAIT1: begin
                    if (clkEn1) begin
                        spiState <= START1;
                        dacAInit <= {1'b0,1'b0,dac1GainSelA,1'b1,dac1ValueA};
                        dacBInit <= {1'b1,1'b0,dac1GainSelB,1'b1,dac1ValueB};
                        ch1Pending <= 0;
                    end
                    else if (ch1Pending) begin
                        spiState <= START1;
                        dacAInit <= pendingCh1DacAInit;
                        dacBInit <= pendingCh1DacBInit;
                        ch1Pending <= 0;
                    end
                    else if (clkEn0) begin
                        spiState <= START0;
                        dacAInit <= {1'b0,1'b0,dac0GainSelA,1'b1,dac0ValueA};
                        dacBInit <= {1'b1,1'b0,dac0GainSelB,1'b1,dac0ValueB};
                        ch0Pending <= 0;
                    end
                end
                START1: begin
                    if (clkEn0) begin
                        pendingCh0DacAInit <= {1'b0,1'b0,dac0GainSelA,1'b1,dac0ValueA};
                        pendingCh0DacBInit <= {1'b1,1'b0,dac0GainSelB,1'b1,dac0ValueB};
                        ch0Pending <= 1;
                    end
                    if (negEdgeSCK) begin
                        spiState <= SHIFT_A1;
                        CS1n <= 0;
                        sr <= dacAInit;
                        sckEnable <= 1;
                        bitcount <= 15;
                    end
                end
                SHIFT_A1: begin
                    if (clkEn0) begin
                        pendingCh0DacAInit <= {1'b0,1'b0,dac0GainSelA,1'b1,dac0ValueA};
                        pendingCh0DacBInit <= {1'b1,1'b0,dac0GainSelB,1'b1,dac0ValueB};
                        ch0Pending <= 1;
                    end
                    if (negEdgeSCK) begin
                        sr <= {sr[14:0],1'b0};
                        if (bitcount == 0) begin
                            spiState <= OUTPUT_A1;
                            CS1n <= 1;
                            sckEnable <= 0;
                        end
                        else begin
                            bitcount <= bitcount - 1;
                        end
                    end
                end
                OUTPUT_A1: begin
                    if (clkEn0) begin
                        pendingCh0DacAInit <= {1'b0,1'b0,dac0GainSelA,1'b1,dac0ValueA};
                        pendingCh0DacBInit <= {1'b1,1'b0,dac0GainSelB,1'b1,dac0ValueB};
                        ch0Pending <= 1;
                    end
                    if (negEdgeSCK) begin
                        spiState <= SHIFT_B1;
                        CS1n <= 0;
                        sr <= dacBInit;
                        sckEnable <= 1;
                        bitcount <= 15;
                    end
                end
                SHIFT_B1: begin
                    if (clkEn0) begin
                        pendingCh0DacAInit <= {1'b0,1'b0,dac0GainSelA,1'b1,dac0ValueA};
                        pendingCh0DacBInit <= {1'b1,1'b0,dac0GainSelB,1'b1,dac0ValueB};
                        ch0Pending <= 1;
                    end
                    if (negEdgeSCK) begin
                        sr <= {sr[14:0],1'b0};
                        if (bitcount == 0) begin
                            spiState <= OUTPUT_B1;
                            CS1n <= 1;
                            sckEnable <= 0;
                        end
                        else begin
                            bitcount <= bitcount - 1;
                        end
                    end
                end
                OUTPUT_B1: begin
                    if (clkEn0) begin
                        pendingCh0DacAInit <= {1'b0,1'b0,dac0GainSelA,1'b1,dac0ValueA};
                        pendingCh0DacBInit <= {1'b1,1'b0,dac0GainSelB,1'b1,dac0ValueB};
                        ch0Pending <= 1;
                    end
                    if (negEdgeSCK) begin
                        spiState <= WAIT0;
                    end
                end
                default: begin
                    spiState <= WAIT0;
                    CS0n <= 1;
                    CS1n <= 1;
                    sckEnable <= 0;
                end
            endcase
        end
    end

    assign SDI = sr[15];

endmodule


`ifdef TEST_MODULE


`endif
