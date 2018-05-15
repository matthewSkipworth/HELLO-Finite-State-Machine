//Matthew Skipworth
//TCES330, Friday Section

//Hex decoder module for parts 3 and 4.
module New_Hex_HELO(Hex, S);

	input [2:0] S;
	output logic [0:6] Hex = 3'b111;
	
	logic A, B, C;
	
	
	assign A = S[2];
	assign B = S[1];
	assign C = S[0];
	
	assign Hex[0] = C | (~A & ~B) | (A & B);
	assign Hex[1] = B | (~A & ~C) | (A & C);
	assign Hex[2] = B | (~A & ~C) | (A & C);
	assign Hex[3] = (~A & ~B) | (~B & C) | (A & B);
	assign Hex[4] = (A & C) | (A & B) | (~A & ~B & ~C);
	assign Hex[5] = (A & C) | (A & B) | (~A & ~B & ~C);
	assign Hex[6] = A | (~B & ~C) | (B & C);

endmodule


//y = C + A'B' + AB
//y = B + A'C' + AC
//y = B + A'C' + AC
//y = A'B' + B'C + AB
//y = AC + AB + A'B'C'
//y = AC + AB + A'B'C'
//y = A + B'C' + BC