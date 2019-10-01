`timescale 1ns/1ps
`include "addressMap.v"


module stcFramer
(
    input                       clk,
    input                       clkEn,
    input                       reset,
    input                       payloadBit,
    output  reg                 payloadBitEn,
    output                      stcBit0,
    output                      stcBit1
);

`define STC_PAYLOAD_BITS    3200
//`define STC_PAYLOAD_BITS    256
`define STC_PILOT_BITS      128
`define STC_PILOT0          128'ha88d_9ad4_dc40_4947_e292_023b_2b59_b115
`define STC_PILOT1          128'he3c7_7761_f070_36be_7d6c_0e0f_86ee_e3c7

    reg         [1:0]   stcState;
        `define STC_PILOT   2'b00
        `define STC_PAYLOAD 2'b01
    reg         [11:0]  bitcount;
    reg         [127:0] pilot0SR;
    reg         [127:0] pilot1SR;
    reg         [3:0]   payload0SR;
    reg         [3:0]   payload1SR;
    always @(posedge clk) begin
        if (reset) begin
            stcState <= `STC_PAYLOAD;
            bitcount <= 3;
        end
        else if (clkEn) begin
            case (stcState)
                `STC_PILOT: begin
                    if (bitcount == 0) begin
                        stcState <= `STC_PAYLOAD;
                        bitcount <= `STC_PAYLOAD_BITS - 1;
                    end
                    else begin
                        bitcount <= bitcount - 1;
                    end
                    pilot0SR <= {pilot0SR[126:0],1'b0};
                    pilot1SR <= {pilot1SR[126:0],1'b0};
                end
                `STC_PAYLOAD: begin
                    if (bitcount == 0) begin
                        stcState <= `STC_PILOT;
                        bitcount <= `STC_PILOT_BITS - 1;
                        pilot0SR <= `STC_PILOT0;
                        pilot1SR <= `STC_PILOT1;
                    end
                    else begin
                        bitcount <= bitcount - 1;
                    end
                end
            endcase
        end
    end

    reg         [1:0]   payloadBitcount;
    wire                loadPayloadSR =     (stcState == `STC_PAYLOAD) && (bitcount[1:0] == 2'b00);
    wire                shiftPayloadSR =    (stcState == `STC_PAYLOAD) && (bitcount[1:0] != 2'b00);
    reg         [3:0]   b;
    always @(posedge clk) begin
        if (reset) begin
            payloadBitEn <= 0;
            b <= 0;
            payloadBitcount <= 0;
        end
        else if (clkEn) begin
            //
            if (loadPayloadSR) begin
                payloadBitEn <= 1;
                payloadBitcount <= 3;
            end
            else if (payloadBitcount == 0) begin
                payloadBitEn <= 0;
            end
            else begin
                payloadBitcount <= payloadBitcount - 1;
            end
            // Load and shift the STC encoded payload bits
            if (loadPayloadSR) begin
                payload0SR <= {b[0],b[1],~b[2], b[3]};
                payload1SR <= {b[2],b[3], b[0],~b[1]};
            end
            else if (shiftPayloadSR) begin
                payload0SR <= {payload0SR[2:0],1'b0};
                payload1SR <= {payload1SR[2:0],1'b0};
            end
            if (payloadBitEn) begin
                b <= {payloadBit,b[3:1]};
            end
        end
    end

    assign stcBit0 = (stcState == `STC_PILOT) ? pilot0SR[127] : payload0SR[3];
    assign stcBit1 = (stcState == `STC_PILOT) ? pilot1SR[127] : payload1SR[3];

endmodule

