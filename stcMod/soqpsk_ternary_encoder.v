//------------------------------------------------------------------------------
// Agile Data Radio
// Koos Technical Services
//------------------------------------------------------------------------------
// soqpsk_ternary_encoder
// outputs alternating I and Q data using the equation
// alpha(i) = ((-1)^(i+1)) * (2*d(i-1) - 1) * (d(i) - d(i-2))
//------------------------------------------------------------------------------
// author   email
// vs       verne@koostech.com
//
//------------------------------------------------------------------------------
// version  date        author  modification
// 1.0      2010-03-10  vs      created
//------------------------------------------------------------------------------

`timescale 1ns/1ps

module soqpsk_ternary_encoder
    (
    clock,
    clockEnable,
    enable,
    reset,
    data_in,
    data_out,
    data_valid
    ) ;

// specify the output data width and values

parameter       data_out_width = 2 ;
parameter       data_out_zero = 2'b00 ;
parameter       data_out_pos = 2'b01 ;
parameter       data_out_neg = 2'b11 ;

input           clock ;
input           clockEnable;
input           enable ;
input           reset ;
input           data_in ;

output          data_valid;

output  [(data_out_width-1):0]  data_out ;

reg     [(data_out_width-1):0]  data_out_ff ;
reg             sign_change ;
reg     [1:0]   buffer ;
reg     [1:0]   decode ;
reg     [1:0]   decode_ff ;

// The equation is:
// alpha(i) = ((-1)^(i+1)) * (2*d(i-1) - 1) * (d(i) - d(i-2))
//
// the last two terms in the equation yield:
//  d(i)    d(i-1)      d(i-2)
//  0       0       0           0
//  0       0       1           1
//  0       1       0           0
//  0       1       1           -1
//  1       0       0           -1
//  1       0       1           0
//  1       1       0           1
//  1       1       1           0

// shift the input data into a buffer and decode an antipodal result for these
// two terms of the equation

always @ ( posedge clock ) begin
    if (clockEnable) begin
        if ( enable )
            begin
            buffer <= { data_in, buffer[1] } ;
            end
        end
    end

always @ ( data_in, buffer )
    begin
    case ({ data_in, buffer })
        3'b001, 3'b110                 : decode <= 2'b01 ;  // +1
        3'b011, 3'b100                 : decode <= 2'b11 ;  // -1
        default                        : decode <= 2'b00 ;  //  0
    endcase
    end

// generate an alternating sign for the antipodal decode
// this is the first term of the equation

always @ ( posedge clock )
    begin
    if (reset) begin
        sign_change <= 0;
        end
    else if (clockEnable) begin
        if ( enable )
            begin
            sign_change <= !sign_change ;
            end
        end
    end

reg                         data_valid;
reg  [(data_out_width-1):0] data_out ;
always @ ( posedge clock ) begin
    if (clockEnable) begin
        if ( enable )
            begin
            data_valid <= 1;
            if ( ( decode != 2'b00 ) && sign_change )
                begin
                case ({ ~decode[1], decode[0] })
                    2'b01:      data_out <= data_out_pos;
                    2'b11:      data_out <= data_out_neg;
                    default:    data_out <= data_out_zero;
                    endcase
                end
            else
                begin
                case (decode)
                    2'b01:      data_out <= data_out_pos;
                    2'b11:      data_out <= data_out_neg;
                    default:    data_out <= data_out_zero;
                    endcase
                end
            end
        else begin
            data_valid <= 0;
            end
        end
    end

endmodule
