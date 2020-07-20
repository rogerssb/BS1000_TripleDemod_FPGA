
function [23:0] mirror_taps;
  input [23:0] A;
	input [4:0] L;

  reg [23:0] B;
  integer i;

  begin
    for (i=0;i<24;i=i+1) begin
      B[23-i] = A[i];
    end
    mirror_taps = L == 5'd8  ? {16'b0, B[16], B[23:17]} : (
                  L == 5'd10 ? {14'b0, B[14], B[23:15]} : (
                  L == 5'd12 ? {12'b0, B[12], B[23:13]} : (
                  L == 5'd16 ? {8'b0,  B[8],  B[23:9]}  : (
                  L == 5'd24 ? {       B[0],  B[23:1]}  : 24'h0))));
  end
endfunction