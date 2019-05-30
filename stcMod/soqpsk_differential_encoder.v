//------------------------------------------------------------------------------
// Agile Data Radio
// Koos Technical Services
//------------------------------------------------------------------------------
// soqpsk_differential_encoder
// outputs alternating I and Q data as specified by equations (2-1) and (2-2) on
// page 5 of "Telemetry Standard RCC Document 106-09, Chapter 2, April 2009"
//------------------------------------------------------------------------------
// author   email
// vs       verne@koostech.com
//
//------------------------------------------------------------------------------
// version  date        author  modification
// 1.0      2010-03-10  vs      created
//------------------------------------------------------------------------------

`timescale 1ns/1ps

module soqpsk_differential_encoder
    (
    clock,
    reset,
    enable,
    data_in,
    data_out
    ) ;

input           clock ;
input           reset ;
input           enable ;
input           data_in ;
output          data_out ;

reg             data_out_ff ;
reg             invert ;

always @ ( posedge clock )
    begin
    if (reset) begin
        invert <= 0;
        end
    else if ( enable )
        begin
        invert <= !invert ;
        end
    end

always @ ( posedge clock )
    begin
    if (reset) begin
        data_out_ff <= 0;
        end
    else if ( enable )
        begin
        data_out_ff <= data_in ^ ( data_out_ff ^ invert ) ;
        end
    end

assign data_out = data_out_ff ;
endmodule
