//------------------------------------------------------------------------------
// Agile Data Radio
// Koos Technical Services
//------------------------------------------------------------------------------
//
//
//
//------------------------------------------------------------------------------
// author   email
// vs       verne@koostech.com
//
//------------------------------------------------------------------------------
// version  date        author  modification
// 1.0      2010-03-10  vs      created
//------------------------------------------------------------------------------

`timescale 1ns/1ps

module soqpsk_encoders_test ;

reg             clock ;
reg             enable ;
reg             data_in ;
reg     [31:0]  X ;
wire            data_out1 ;
wire    [1:0]   data_out2 ;

integer         i ;

soqpsk_differential_encoder uut1
    (
    .clock(clock),
    .enable(enable),
    .data_in(data_in),
    .data_out(data_out1)
    ) ;

wire data_out1_not = ~data_out1 ;

soqpsk_ternary_encoder uut2
    (
    .clock(clock),
    .enable(enable),
    .data_in(data_out1_not),
    .data_out(data_out2)
    ) ;


parameter   HC = 10,
            C = 2*HC;
always #HC clock = !clock ;

initial
    begin
    clock = 0 ;
    enable = 1'b1;
    data_in = 1'b0 ;
    uut1.data_out_ff = 1'b0 ;
    uut1.invert = 1'b1 ;
    uut2.sign_change = 1 ;

    // Billy's one sample per ternary symbol test data
    //X = 00000010110101101100
    //X = 20'b00000010110101101100 ;
    X = 20'b10111011101110111011 ;
    i = 20 ;
    //d = 00110000010101111011
    //alpha = 0 0 -1 -1 -1 -1 0 0 0 1 0 0 0 0 1 0 0 1 0 -1

    while (i >= 0) begin
        # (C) ;
        end

    $stop;

    end

always @ ( posedge clock )
    begin
    data_in <= X[i-1] ;
    i <= i -  1 ;
    $display ( "%h %h %h %h", data_in, data_out1, data_out1_not, data_out2 ) ;
    end

endmodule
