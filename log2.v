/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns/1ps
`include "./addressMap.v"

module log2( 
    input               clk, reset, clkEn,
    input       [15:0]  linear,
    output  reg [7:0]   log
);

    always @(posedge clk) begin
        if (clkEn) begin
            casex (linear)
                16'b1xxx_xxxx_xxxx_xxxx: begin
                    log <= {4'b1111,linear[14:11]};
                    end
                16'b01xx_xxxx_xxxx_xxxx: begin
                    log <= {4'b1110,linear[13:10]};
                    end
                16'b001x_xxxx_xxxx_xxxx: begin
                    log <= {4'b1101,linear[12: 9]};
                    end
                16'b0001_xxxx_xxxx_xxxx: begin
                    log <= {4'b1100,linear[11: 8]};
                    end
                16'b0000_1xxx_xxxx_xxxx: begin
                    log <= {4'b1011,linear[10: 7]};
                    end
                16'b0000_01xx_xxxx_xxxx: begin
                    log <= {4'b1010,linear[ 9: 6]};
                    end
                16'b0000_001x_xxxx_xxxx: begin
                    log <= {4'b1001,linear[ 8: 5]};
                    end
                16'b0000_0001_xxxx_xxxx: begin
                    log <= {4'b1000,linear[ 7: 4]};
                    end
                16'b0000_0000_1xxx_xxxx: begin
                    log <= {4'b0111,linear[ 6: 3]};
                    end
                16'b0000_0000_01xx_xxxx: begin
                    log <= {4'b0110,linear[ 5: 2]};
                    end
                16'b0000_0000_001x_xxxx: begin
                    log <= {4'b0101,linear[ 4: 1]};
                    end
                16'b0000_0000_0001_xxxx: begin
                    log <= {4'b0100,linear[ 3: 0]};
                    end
                16'b0000_0000_0000_1xxx: begin
                    log <= {4'b0011,linear[ 2: 0],1'b1};
                    end
                16'b0000_0000_0000_01xx: begin
                    log <= {4'b0010,linear[ 1: 0],2'b10};
                    end
                16'b0000_0000_0000_001x: begin
                    log <= {4'b0001,linear[ 0: 0],3'b100};
                    end
                default: begin
                    log <= {4'b0000,4'b1000};
                    end
            endcase
        end
    end

    `ifdef SIMULATE
    real logReal;
    always @* logReal = $itor(log)/(2**8);
    `endif

endmodule
