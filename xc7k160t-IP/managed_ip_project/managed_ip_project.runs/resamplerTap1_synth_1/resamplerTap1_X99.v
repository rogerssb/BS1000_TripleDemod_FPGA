// Jagadeesh Vasudevamurthy resamplerTap1_X99.v
// Please do not remove the header
// Char array passed is as follows
//--------------------------------------
//0:00000 111111110111100010
//1:00001 111111110110111011
//2:00010 111111110110011001
//3:00011 111111110101111100
//4:00100 111111110101100101
//5:00101 111111110101010111
//6:00110 111111110101010011
//7:00111 111111110101011001
//8:01000 111111110101101100
//9:01001 111111110110001101
//10:01010 111111110110111101
//11:01011 111111110111111101
//12:01100 111111111001001111
//13:01101 111111111010110010
//14:01110 111111111100101001
//15:01111 111111111110110011
//16:10000 000000000001010001
//17:10001 000000000100000011
//18:10010 000000000111001000
//19:10011 000000001010011111
//20:10100 000000001110001000
//21:10101 000000010010000001
//22:10110 000000010110000111
//23:10111 000000011010011001
//24:11000 000000011110110100
//25:11001 000000100011010100
//26:11010 000000100111110111
//27:11011 000000101100010111
//28:11100 000000110000110001
//29:11101 000000110101000000
//30:11110 000000111000111110
//31:11111 000000111100100111
// default NOT given
// Parallel mux
//--------------------------------------
// PLA starts now
module resamplerTap1_X99(a,o);
	input[4:0]  a;
	output reg[17:0]  o;
	always @(a)
	begin
		case(a)
			5'b00000: o = 18'b111111110111100010;
			5'b00001: o = 18'b111111110110111011;
			5'b00010: o = 18'b111111110110011001;
			5'b00011: o = 18'b111111110101111100;
			5'b00100: o = 18'b111111110101100101;
			5'b00101: o = 18'b111111110101010111;
			5'b00110: o = 18'b111111110101010011;
			5'b00111: o = 18'b111111110101011001;
			5'b01000: o = 18'b111111110101101100;
			5'b01001: o = 18'b111111110110001101;
			5'b01010: o = 18'b111111110110111101;
			5'b01011: o = 18'b111111110111111101;
			5'b01100: o = 18'b111111111001001111;
			5'b01101: o = 18'b111111111010110010;
			5'b01110: o = 18'b111111111100101001;
			5'b01111: o = 18'b111111111110110011;
			5'b10000: o = 18'b000000000001010001;
			5'b10001: o = 18'b000000000100000011;
			5'b10010: o = 18'b000000000111001000;
			5'b10011: o = 18'b000000001010011111;
			5'b10100: o = 18'b000000001110001000;
			5'b10101: o = 18'b000000010010000001;
			5'b10110: o = 18'b000000010110000111;
			5'b10111: o = 18'b000000011010011001;
			5'b11000: o = 18'b000000011110110100;
			5'b11001: o = 18'b000000100011010100;
			5'b11010: o = 18'b000000100111110111;
			5'b11011: o = 18'b000000101100010111;
			5'b11100: o = 18'b000000110000110001;
			5'b11101: o = 18'b000000110101000000;
			5'b11110: o = 18'b000000111000111110;
			5'b11111: o = 18'b000000111100100111;
// defaults of ALL_0 and ALL_X are never routine to input pla. ALL_X,ALL_1 are expanded by me. Output never has default
//			 Parallel mux
		endcase
	end
endmodule
