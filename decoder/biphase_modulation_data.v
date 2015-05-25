//------------------------------------------------------------------------------
// Project
// Koos Technical Services
//------------------------------------------------------------------------------
// File Name
// Description
//------------------------------------------------------------------------------
// author   email
// vs       verne@koostech.com
//
//------------------------------------------------------------------------------
// version  date        author  modification
// 1.0      2010-05-26  vs      created
//------------------------------------------------------------------------------
//
// creates the output file biphase_modulation_data.txt that looks like this
//
//  -0.5
//  -0.5
//  -0.5
//  -0.5
//  sync
//  0.5
//  0.5
//  0.5
//  0.5
//
// where the simulation is run long enough to generate two sync words in the
// file.  The file is then manually edited to contain the full sequence of data
// between two occurrencess of the word sync. The $fwrite line is currently set
// to four samples per biphase symbol.

`timescale 1ns/1ps

module biphase_modulation_data ;

reg             clock ;
reg             reset ;
reg     [2:0]   counter ;

integer         file ;

wire            pn_seq_out ;
wire            pn_seq_sync ;
wire            sym_enable ;
wire            pn_seq_enable ;
wire            biphase_data ;
wire            negate ;

assign          sym_enable = ( !counter[1] && counter[0] ) ? 1'b1 : 1'b0 ;
assign          pn_seq_enable = ( !counter[2] && !counter[1] && counter[0] ) ? 1'b1 : 1'b0 ;

initial
    begin
    file = $fopen( "biphase_modulation_data.txt" ) ;
    clock = 1'b0 ;
    reset = 1'b0 ;
    counter = 3'b0 ;
    #70 reset = !reset ;
    #70 reset = !reset ;
    end

pn_sequencer pn_seq
    (
    .clock      ( clock ),
    .reset      ( reset ),
    .enable     ( pn_seq_enable ),
    .out        ( pn_seq_out ),
    .sync       ( pn_seq_sync )
    ) ;

always #7 clock = !clock ;

always @ ( posedge clock )
    begin
    counter <= counter + 3'b001 ;
    end

assign negate = ( counter > 1 ) && ( counter < 6 ) ;
assign biphase_data = pn_seq_out ^ negate ;

always @ ( posedge clock )
    begin
    if ( sym_enable )
        begin
        if ( pn_seq_enable && pn_seq_sync )
            begin
            $fwrite ( file, "sync\n" ) ;
            end
        if ( biphase_data == 1'b1 )
            begin
            $fwrite ( file, "0.5\n0.5\n0.5\n0.5\n" ) ;
            end
        else
            begin
            $fwrite ( file, "-0.5\n-0.5\n-0.5\n-0.5\n" ) ;
            end
        end
    end

endmodule
