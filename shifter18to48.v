/******************************************************************************
Copyright 2008-2015 Koos Technical Services, Inc. All Rights Reserved

This source code is the Intellectual Property of Koos Technical Services,Inc. 
(KTS) and is provided under a License Agreement which protects KTS' ownership and
derivative rights in exchange for negotiated compensation.
******************************************************************************/

`timescale 1ns / 10 ps

module shifter18to48(clk,sync,shift,din,dout);

input   clk;
input   sync;
input   [5:0]shift;
input   [17:0]din;
output  [47:0]dout;


reg [47:0]outBits;
always @(posedge clk) begin
    if (sync) begin
        case (shift)
            0: begin
                outBits <= {din,30'b0};
                end
            1: begin
                outBits <= {din[17],din,29'b0};
                end
            2:  begin
                outBits <= {{ 2{din[17]}},din,28'b0};
                end
            3:  begin
                outBits <= {{ 3{din[17]}},din,27'b0};
                end
            4:  begin
                outBits <= {{ 4{din[17]}},din,26'b0};
                end
            5:  begin
                outBits <= {{ 5{din[17]}},din,25'b0};
                end
            6:  begin
                outBits <= {{ 6{din[17]}},din,24'b0};
                end
            7:  begin
                outBits <= {{ 7{din[17]}},din,23'b0};
                end
            8:  begin
                outBits <= {{ 8{din[17]}},din,22'b0};
                end
            9:  begin
                outBits <= {{ 9{din[17]}},din,21'b0};
                end
            10: begin
                outBits <= {{10{din[17]}},din,20'b0};
                end
            11: begin
                outBits <= {{11{din[17]}},din,19'b0};
                end
            12: begin
                outBits <= {{12{din[17]}},din,18'b0};
                end            
            13: begin          
                outBits <= {{13{din[17]}},din,17'b0};
                end            
            14: begin          
                outBits <= {{14{din[17]}},din,16'b0};
                end            
            15: begin          
                outBits <= {{15{din[17]}},din,15'b0};
                end            
            16: begin          
                outBits <= {{16{din[17]}},din,14'b0};
                end            
            17: begin          
                outBits <= {{17{din[17]}},din,13'b0};
                end            
            18: begin          
                outBits <= {{18{din[17]}},din,12'b0};
                end            
            19: begin          
                outBits <= {{19{din[17]}},din,11'b0};
                end            
            20: begin          
                outBits <= {{20{din[17]}},din,10'b0};
                end            
            21: begin          
                outBits <= {{21{din[17]}},din,9'b0};
                end            
            22: begin          
                outBits <= {{22{din[17]}},din,8'b0};
                end
            23: begin
                outBits <= {{23{din[17]}},din,7'b0};
                end
            24: begin
                outBits <= {{24{din[17]}},din,6'b0};
                end
            25: begin
                outBits <= {{25{din[17]}},din,5'b0};
                end
            26: begin
                outBits <= {{26{din[17]}},din,4'b0};
                end
            27: begin
                outBits <= {{27{din[17]}},din,3'b0};
                end
            28: begin
                outBits <= {{28{din[17]}},din,2'b0};
                end
            29: begin
                outBits <= {{29{din[17]}},din,1'b0};
                end
            30: begin
                outBits <= {{30{din[17]}},din};
                end
            31: begin
                outBits <= {{31{din[17]}},din[17:1]};
                end
            32: begin
                outBits <= {{32{din[17]}},din[17:2]};
                end
            33: begin
                outBits <= {{33{din[17]}},din[17:3]};
                end
            34: begin
                outBits <= {{34{din[17]}},din[17:4]};
                end
            35: begin
                outBits <= {{35{din[17]}},din[17:5]};
                end
            default: begin
                outBits <= {{36{din[17]}},din[17:6]};
                end
            endcase
        end
    end

assign dout = outBits;
endmodule
