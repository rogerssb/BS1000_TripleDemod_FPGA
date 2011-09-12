module mux_4x1x14(A,B,C,D,Y,SEL,CLK);

input   [13:0]  A,B,C,D;
input           CLK;
output  [13:0]  Y;
input   [1:0]   SEL;

reg		[13:0]	y,Y;

always @ (SEL or A or B or C or D)
	begin
	case (SEL)
		0: y <= A;
		1: y <= B;
		2: y <= C;
		3: y <= D;
	endcase
	end

always @ (posedge CLK)
	begin
	Y <= y;
	end

endmodule