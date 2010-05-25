//------------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Mark/Space Decoder
// Created      February 20, 2009
//------------------------------------------------------------------------------
// 1.0                      Initial coding
// 1.0      May 25, 2010    reduced data width from 3 bits to 1
//
//------------------------------------------------------------------------------

`timescale 1ns/100ps

module mrk_spc_decode
    (
    rs,
    din,
    last_din,
    clk,
    clk_en,
    biphase_en,
    mode,
    dout
    ) ;

input             rs, clk, clk_en, biphase_en ;
input             din, last_din ;
input     [1:0]   mode ;
output            dout ;

reg               dout ;

parameter Bypass  = 2'b00 ;
parameter Invert  = 2'b01 ;
parameter Mark    = 2'b10 ;
parameter Space   = 2'b11 ;

always @ ( posedge clk or posedge rs )
    begin
    if ( rs )
        begin
        dout <= 0;
        end
    else if ( clk_en )
        begin
        if ( biphase_en )
            begin
            case ( mode )
                Bypass:
                    begin
                    dout <= din ;
                    end
                Invert:
                    begin
                    dout <= ~din ;
                    end
                Mark:
                    begin
                    dout <=  din ^ last_din ;
                    end
                Space:
                    begin
                    dout <= ~(din ^ last_din) ;
                    end
                default:
                    begin
                    dout <= din ;
                    end
            endcase
            end
        end
    end
endmodule
