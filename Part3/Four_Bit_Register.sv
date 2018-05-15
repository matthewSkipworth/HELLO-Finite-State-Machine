//Matthew Skipworth
//TCES330, Friday Section

//Four Bit Register module. This module instantiates 4 D flip-flop modules 
//which each register a bit. This register is a parallel in parallel out
//which simply means that the data stored in one flip-flop is independent
//of the data stored in another. Another way of saying this is that data
//is written to each flip-flop independently rather than fed into the 
//first flip-flop like a serial configuration.

module Four_Bit_Register(T, Clk, ClrN, Q);

	input [2:0] T;
	input Clk, ClrN;
	output [2:0] Q;
	
	
	D_flip_flop D0( T[0], Clk, ClrN, Q[0]/*, QN*/ );
	D_flip_flop D1( T[1], Clk, ClrN, Q[1]/*, QN*/ );
	D_flip_flop D2( T[2], Clk, ClrN, Q[2]/*, QN*/ );
	//D_flip_flop D3( T[3], Clk, ClrN, Q[3]/*, QN*/ );

endmodule

module Four_Bit_Register_testbench;

	logic [2:0] T;
	logic Clk, ClrN;
	logic [2:0] Q;
	
	integer i;
	
	Four_Bit_Register DUT(T, Clk, ClrN, Q);
	
	initial begin
		//T = 0; 
		ClrN = 0;
		for (i = 0; i < 16; i++) begin
			T = i;
			Clk = 1;
			#10;
			Clk = 0;
			#10;
			$monitor("%4b",Q);
			
		end
		//T = 0; 
		ClrN = 0;
		for (i = 0; i < 16; i++) begin
			T = i;
			Clk = 1;
			#10;
			Clk = 0;
			#10;
			$monitor("%4b",Q);
			
		end
		//T = 0; 
		ClrN = 1;
		for (i = 0; i < 16; i++) begin
			T = i;
			Clk = 1;
			#10;
			Clk = 0;
			#10;
			$monitor("%4b",Q);
			
		end
		//T = 1;
		ClrN = 1;
		for (i = 0; i < 16; i++) begin
			T = i;
			Clk = 1;
			#10;
			Clk = 0;
			#10;
			$monitor("%4b",Q);
			
			
		end
	end
endmodule