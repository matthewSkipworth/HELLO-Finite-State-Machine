//Matthew Skipworth
//Friday Session, Due: 20 April 2018

//This module describes a 3 bit wide 8 to 1 multplexor.
module Mux_3w_8_to_1(S, A, B, C, D, E, F, G, H, M);
//input/output assignments.
	input [2:0] S, A, B, C, D, E, F, G, H; 
	output reg [2:0] M;
//instantiation of 8 to 1 mux modules.
	Mux_8_to_1 G1(S, A[0], B[0], C[0], D[0], E[0], F[0], G[0], H[0], M[0]);
	Mux_8_to_1 G2(S, A[1], B[1], C[1], D[1], E[1], F[1], G[1], H[1], M[1]);
	Mux_8_to_1 G3(S, A[2], B[2], C[2], D[2], E[2], F[2], G[2], H[2], M[2]);

endmodule

//testbench code borrowed from canvas help session files.

module Mux_3w_8_to_1_testbench;
	localparam TESTN = 3;
	logic [2:0] S; // mux select line
	logic [TESTN-1:0] A, B, C, D, E, F, G, H; // mux inputs
	logic [TESTN-1:0] M; // mux output

Mux_3w_8_to_1 /*#(.N(TESTN))*/ DUT( S, A, B, C, D, E, F, G, H, M );

integer unsigned I, RX, RA, RB, RC, RD, RE, RF, RG, RH;
initial begin
	RX = $urandom( 111 ); // set the seed (assignment for compiler)
	for (I=0; I<9; I++ ) begin
		RA = $urandom(); // random number
		A = RA[TESTN-1:0];
		RB = $urandom();
		B = RB[TESTN-1:0];
		RC = $urandom(); // random number
		C = RC[TESTN-1:0];
		RD = $urandom();
		D = RD[TESTN-1:0];
		RE = $urandom(); // random number
		E = RE[TESTN-1:0];
		RF = $urandom();
		F = RF[TESTN-1:0];
		RG = $urandom(); // random number
		G = RG[TESTN-1:0];
		RH = $urandom();
		H = RH[TESTN-1:0];
		S[0] = 0;
		S[1] = 0;
		S[2] = 0;
		#5;
		assert( M == A );
		#10;
		S[0] = 1;
		S[1] = 0;
		S[2] = 0;
		#10;
		assert( M == B );
		S[0] = 0;
		S[1] = 1;
		S[2] = 0;
		#10;
		assert( M == C );
		#10;
		S[0] = 1;
		S[1] = 1;	
		S[2] = 0;
		#10;
		assert( M == D );
		#10;
		S[0] = 0;
		S[1] = 0;
		S[2] = 1;
		assert( M == E );
		#10;
		S[0] = 1;
		S[1] = 0;	
		S[2] = 1;
		#10;
		assert( M == F );
		#10;
		S[0] = 0;
		S[1] = 1;
		S[2] = 1;
		assert( M == G );
		#10;	
		S[0] = 1;
		S[1] = 1;	
		S[2] = 1;
		#10;
		assert( M == H );
		#10;
		end
		$stop;
	end
	
	initial begin
	$display( " I A B C D E F G H S M" );
	$monitor( "%d %4b %4b %4b %4b %4b %4b %4b %4b %b %4b", I, A, B, C, D, E, F, G, H, S, M );
	end
	
endmodule