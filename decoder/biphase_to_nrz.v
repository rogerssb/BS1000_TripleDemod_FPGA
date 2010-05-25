//------------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Biphase to NRZ Converter
// Created      February 19, 2009
//------------------------------------------------------------------------------
// 1.0      Feb 19, 2009    Initial coding
// 1.0      May 24, 2010    Got it working and added the in-line comments
// 1.0      May 25, 2010    Reduced the data width from 3 bits to 1
//
//------------------------------------------------------------------------------

`timescale 1 ns /10 ps

module biphase_to_nrz
    (
    rs,
    clk,
    symb_clk_en,
    biphase_en,
    biphase,
    symb_i,
    nrz_i
    ) ;

parameter       COUNT_BITS = 8 ;
parameter       COUNT_MAX = (( 1 << COUNT_BITS) - 1 ) ;
parameter       COUNT_INIT = ( 1 << (COUNT_BITS - 1 )) ;

input           rs, clk, symb_clk_en, biphase ;
input           symb_i ;

output                      biphase_en ;
output                      nrz_i ;

reg                         nrz_i ;
reg     [(COUNT_BITS-1):0]  count ;
reg                         selector ;
reg                         latch_symb_i ;

wire                        biphase_en ;
wire                        reset = rs ;

always @ ( posedge clk )
    begin
    if ( symb_clk_en )
        begin
        latch_symb_i <= symb_i ;
        end
    end

// Manchester encoding introduces two symbols per bit. A symbol is valid
// whenever input symb_clk_en is asserted. The two symbols are defined such
// that, if the uncoded bit is a 1, then the first symbol must be a logic 0 and
// the second symbol must be a logic 1. For an uncoded 0 bit the requirement is
// that the first symbol must be a logic 1 and the second symbol a logic 0.
// Therefore, there is always a level transition coded for each raw bit. Where
// this transition occurs is refered to as the bit midpoint. There is always a
// transition at the midpoint. There may or may not be a level transition at the
// bit endpoints and these endpoint transitions are considered irrelevant. The
// task of decoding requires locating this midpoint and this is built upon the
// transition requirement just described.

// To begin, we want to evaluate the incoming data stream by selecting a pair of
// symbols. We may select two symbols about the midpoint or we may select two
// symbols about an endpoint. We don't care which two. We simply need a pair as
// a starting point. This block provides a bit that toggles on each symbol clock
// enable and it is used to establish which symbol pair we start with. Since we
// don't care which of the two symbols we start with, the selector bit's initial
// state is irrelevant.

always @ ( posedge clk or posedge reset )
    begin
    if ( reset )
        begin
        selector <= 0 ;
        end
    else if ( symb_clk_en )
        begin
        selector <= !selector ;
        end
    end

// To identify the midpoint symbol, we start by looking at the symbol pair
// chosen by the selector bit. An up/down counter is decremented when the two
// symbols selected by the selector bit match. The up/down counter is
// incremented when the two symbols not selected by the selector bit match.
// Since the symbols of one of these pairs will never match, the counter will
// eventually saturate at one or the other end of its counting range. This is
// why the initial state of the selector bit was irrelevant. The counter's
// saturation count will always help us in identifying the midpoint symbol.

always @ ( posedge clk or posedge reset )
    begin
    if ( reset )
        begin
        count <= COUNT_INIT ;
        end
    else if ( symb_clk_en )
        begin
        if ( selector )
            begin
            // do the symbols match when selector is a logic high?
            // if so, decrement the counter
            if ( symb_i == latch_symb_i )
                begin
                if ( count > 8'd0 )
                    begin
                    count <= count - 1 ;
                    end
                end
            end
        else
            begin
            // or do they match when selector is a logic low?
            // if so, increment the counter
            if ( symb_i == latch_symb_i )
                begin
                if ( count < COUNT_MAX )
                    begin
                    count <= count + 1 ;
                    end
                end
            end
        end
    end

// The up/down counter will always eventually saturate. If symbol matches were
// found when the selector was a logic high, the counter will saturate at zero.
// In this case, we want to further process using the other symbol pair, that
// is, when the selector is at a logic low. The xor logic function is used to
// correctly set the state of biphase_en to the correct symb_i and latch_symb_i
// pair.

assign   biphase_en = ( biphase ) ? !(count[7] ^ selector) : 1'b1 ;

// As it works out in the simulation when biphase_en is a logic low, the correct
// state for nrz_i is the state of symb_i. If biphase decoding is disabled,
// nrz_i always follows symb_i.

always @ ( posedge clk or posedge reset )
    begin
    if ( reset )
        begin
        nrz_i <= 0 ;
        end
    else if ( symb_clk_en )
		begin
        if ( biphase_en )
            begin
            // right here is the one biphase_en delay incurred by this module
            nrz_i <= symb_i ;
            end
        end
	end

endmodule
