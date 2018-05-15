module HexHELO(Hex, C);
	input [2:0] C;
	output reg [0:6] Hex;
	
	/*or (Hex[0], ~C[0], C[2]);//assign Hex[0] = ~C[0];
	or(Hex[1], C[2], or(Hex[1], and(Hex[1], ~C[1], C[0]), and(Hex[1], C[1], ~C[0])));//assign Hex[1] = C[0] xor C[1];
	xor(Hex[2], C[2], or(Hex[2], and(Hex[2], ~C[1], C[0]), and(Hex[2], C[1], ~C[0])));//assign Hex[2] = C[0] xor C[1];
	or(Hex[3], C[2], and(Hex[3], ~C[1], ~C[0]));//assign Hex[3] = C[0] nor C[1];
	assign Hex[4] = C[2];
	assign Hex[5] = C[2];
	or(Hex[6], C[1], C[2]);*/
	assign Hex[0] = ~C[0] | C[2];
	assign Hex[1] = C[2] | ~C[1] & C[0] | C[1] & ~C[0];
	assign Hex[2] = C[2] | ~C[1] & C[0] | C[1] & ~C[0];
	assign Hex[3] = C[2] | ~C[1] & ~C[0];
	assign Hex[4] = C[2];
	assign Hex[5] = C[2];
	assign Hex[6] = C[1] | C[2];
	
	
	/*
	assign Hex[0] = 7b'1001000;
	assign Hex[1] = 7b'0110000;
	assign Hex[2] = 7b'1110001;
	assign Hex[3] = 7b'0000001;
	*/
	//wire A, B, C, D; 
	/*
	assign A = ~C[0] & ~C[1] & ~C[2]; //= Hex[0];
	assign B = ~C[0] & ~C[1] & C[2]; //= Hex[1];
	assign C = ~C[0] & C[1] & ~C[2]; //= Hex[2];
	assign D = ~C[0] & C[1] & C[2]; //= Hex[0];
	
	always @(C or Hex) 
	begin
		if (~C[0] & ~C[1] & ~C[2]) 
			Hex = 7b'1001000;
		else if (~C[0] & ~C[1] & C[2]) 
			Hex = 7b'0110000;
		else if (~C[0] & C[1] & ~C[2]) 
			Hex = 7b'1110001;
		else if (~C[0] & C[1] & C[2]) 
			Hex = 7b'0000001;
		else 
			Hex = 7b'1111111;
		
	end
	*/
endmodule	