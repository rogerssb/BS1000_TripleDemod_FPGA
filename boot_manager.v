//-----------------------------------------------------------------------------
// Project      SEMCO Multi-mode Demodulator
// Design       Spartan-3 Multi-boot Manager
// Created      12 Oct 12
//
// The reboot_decode address is 24 bits. Writing the upper byte triggers a reboot_decode.
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps
`include "./addressMap.v"

module boot_manager (rst,clk,ena,wr0,wr2,addr,data) ;

input               rst,clk,ena,wr0,wr2 ;
input   [11 : 0]    addr ;
input   [15 : 0]    data ;
reg     [23 : 0]    boot_addr ;

always @(negedge wr0) begin
    if (ena) begin
        casex (addr)
            `REBOOT_ADDR:
                begin
                boot_addr[15 : 0] <= data[15 : 0] ;
                end
            default: ;
            endcase
        end
    end

reg     reboot_decode ;
always @(negedge wr2 or posedge rst) begin
    if (rst) begin
        boot_addr[23 : 16] <= 8'hx ;
        reboot_decode <= 1'b0 ;
        end
    else if (ena) begin
        casex (addr)
           `REBOOT_ADDR:
                begin
                boot_addr[23 : 16] <= data[7 : 0] ;
                reboot_decode <= 1'b1 ;
                end
            default: ;
            endcase
        end
    end

// module multiboot requires a reboot pulse
reg     [2 : 0]     sr ;
reg                 reboot ;
always @ (posedge clk) begin
    if (rst) begin
        sr <= 3'b0 ;
        reboot <= 1'b0 ;
        end
    else begin
        sr <= {sr[1 : 0], reboot_decode} ;
        reboot <= sr[2 : 1] == 2'b01 ;
        end
    end

multiboot multiboot
    (
    .next_addr(boot_addr) ,
    .clk(clk) ,
    .reboot(reboot)
    ) ;

endmodule