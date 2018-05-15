//Matthew Skipworth
//TCES 330
//Friday Section
module HexHEXI(Hex, S);

	input [3:0] S;
	output reg [0:6] Hex;
	
	wire A, B, C, D;
	
	assign A = S[3];//assign wires to the S vector elements
	assign B = S[2];
	assign C = S[1];
	assign D = S[0];

	//logic in this section was done using www.32x8.com
	assign Hex[0] = (~A & ~B & ~C & D) | (~A & B & ~C & ~D) | (A & ~B & C & D) | (A & B & ~C & D);
	assign Hex[1] = (B & C & ~D) | (A & C & D) | (A & B & ~D) | (~A & B & ~C & D);
	assign Hex[2] = (A & B & ~D) | (A & B & C) | (~A & ~B & C & ~D); 
	assign Hex[3] = (B & C & D) | (~A & ~B & ~C & D) | (~A & B & ~C & ~D) | (A & ~B & C & ~D);
	assign Hex[4] = (~A & D) | (~B & ~C & D) | (~A & B & ~C);
	assign Hex[5] = (~A & ~B & D) | (~A & ~B & C) | (~A & C & D) | (A & B & ~C & D);
	assign Hex[6] = (~A & ~B & ~C) | (~A & B & C & D) | (A & B & ~C & ~D);
	
endmodule
/*
	hex0 = A'B'C'D + A'BC'D' + AB'CD + ABC'D
	hex1 = BCD' + ACD + ABD' + A'BC'D
	hex2 = ABD' + ABC + A'B'CD'
	hex3 = BCD + A'B'C'D + A'BC'D' + AB'CD'
	hex4 = A'D + B'C'D + A'BC'
	hex5 = A'B'D + A'B'C + A'CD + ABC'D
	hex6 = A'B'C' + A'BCD + ABC'D'
	*/
	
