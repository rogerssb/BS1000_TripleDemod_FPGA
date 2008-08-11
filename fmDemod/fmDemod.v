`timescale 1ns / 10 ps

module fmDemod( clk, reset, sync,
                iFm,qFm,
                phase,
                freq,
                mag);

input clk;
input reset;
input sync;
input [17:0]iFm;
input [17:0]qFm;
output [7:0]phase;
output [7:0]freq;
output [8:0]mag;

`ifdef SIMULATE
real iFmReal = ((iFm > 131071.0) ? (iFm - 262144.0) : iFm)/131072.0;
real qFmReal = ((qFm > 131071.0) ? (qFm - 262144.0) : qFm)/131072.0;
`endif


// CORDIC
`ifdef COREGEN
cordic18x12 cordic( .clk        (clk),
                    .ce         (sync),
                    .x_in       (iFm),
                    .y_in       (qFm),
                    .rdy        (cordicSync),
                    .x_out      (mag),
                    .phase_out  (phase)
                  );
`else
vm_cordic cordic(.clk(clk),
                 .ena(sync),
                 .x(iFm[17:8]),.y(qFm[17:8]),
                 .m(mag),
                 .p(phase)
                 );
/*
cordic cordic (.clk(clk),
               .ena(sync),
               .Iin(iFm[17:8]), .Qin(qFm[17:8]),
               .magn(mag),
               .phase(phase)
               );
*/
`endif


// FM = derivative approximation based on phase difference

reg [7:0]freq;
reg [7:0]prevPhase;
wire [7:0]phaseDiff = phase - prevPhase;
always @(posedge clk) begin
    if (sync) begin
        // Drop the top two bits to create modulus.
        freq <= phaseDiff;
        prevPhase <= phase;
        end
    end


`ifdef SIMULATE
real magReal   = mag/512.0;
real phaseReal = ((phase > 127.0) ? (phase - 256.0) : phase)/128.0;
real freqReal = ((freq > 127.0) ? (freq - 256.0) : freq)/128.0; 
`endif

endmodule
