// Jagadeesh Vasudevamurthy resamplerTap3_X99.v
// Please do not remove the header
// Char array passed is as follows
//--------------------------------------
//0:00000 111011101111111000
//1:00001 111011100111000001
//2:00010 111011100000101110
//3:00011 111011011101010011
//4:00100 111011011101000000
//5:00101 111011100000000111
//6:00110 111011100110111001
//7:00111 111011110001100100
//8:01000 111100000000010110
//9:01001 111100010011011011
//10:01010 111100101010111110
//11:01011 111101000111000110
//12:01100 111101100111111001
//13:01101 111110001101011011
//14:01110 111110110111101101
//15:01111 111111100110101111
//16:10000 000000011010011011
//17:10001 000001010010101100
//18:10010 000010001111010111
//19:10011 000011010000010001
//20:10100 000100010101001010
//21:10101 000101011101110010
//22:10110 000110101001110011
//23:10111 000111111000110111
//24:11000 001001001010100101
//25:11001 001010011110100010
//26:11010 001011110100010000
//27:11011 001101001011010000
//28:11100 001110100011000010
//29:11101 001111111011000100
//30:11110 010001010010110011
//31:11111 010010101001101011
// default NOT given
// Parallel mux
//--------------------------------------
// PLA starts now
module resamplerTap3_X99(a,o);
	input[4:0]  a;
	output reg[17:0]  o;
	always @(a)
	begin
		case(a)
			5'b00000: o = 18'b111011101111111000;
			5'b00001: o = 18'b111011100111000001;
			5'b00010: o = 18'b111011100000101110;
			5'b00011: o = 18'b111011011101010011;
			5'b00100: o = 18'b111011011101000000;
			5'b00101: o = 18'b111011100000000111;
			5'b00110: o = 18'b111011100110111001;
			5'b00111: o = 18'b111011110001100100;
			5'b01000: o = 18'b111100000000010110;
			5'b01001: o = 18'b111100010011011011;
			5'b01010: o = 18'b111100101010111110;
			5'b01011: o = 18'b111101000111000110;
			5'b01100: o = 18'b111101100111111001;
			5'b01101: o = 18'b111110001101011011;
			5'b01110: o = 18'b111110110111101101;
			5'b01111: o = 18'b111111100110101111;
			5'b10000: o = 18'b000000011010011011;
			5'b10001: o = 18'b000001010010101100;
			5'b10010: o = 18'b000010001111010111;
			5'b10011: o = 18'b000011010000010001;
			5'b10100: o = 18'b000100010101001010;
			5'b10101: o = 18'b000101011101110010;
			5'b10110: o = 18'b000110101001110011;
			5'b10111: o = 18'b000111111000110111;
			5'b11000: o = 18'b001001001010100101;
			5'b11001: o = 18'b001010011110100010;
			5'b11010: o = 18'b001011110100010000;
			5'b11011: o = 18'b001101001011010000;
			5'b11100: o = 18'b001110100011000010;
			5'b11101: o = 18'b001111111011000100;
			5'b11110: o = 18'b010001010010110011;
			5'b11111: o = 18'b010010101001101011;
// defaults of ALL_0 and ALL_X are never routine to input pla. ALL_X,ALL_1 are expanded by me. Output never has default
//			 Parallel mux
		endcase
	end
endmodule