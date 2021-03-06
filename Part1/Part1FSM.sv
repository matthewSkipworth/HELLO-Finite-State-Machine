//Matthew Skipworth
//TCES330, Friday Section

module Part1FSM(Clock, Reset, W, Z, y);
//...define input and output ports
//...define signals
    
	input logic Clock, Reset, W;
	output logic Z = 0;
	logic [3:0] CurrentState, NextState;
	logic Enable;
	logic ClearN;
	output logic [3:0] y = 0;
	logic [2:0] t;
	
	assign t[0] = Enable & y[0];
	assign t[1] = t[0] & y[1];
	assign t[2] = t[1] & y[2];
	
	//assign ClearN = 1;
	
	localparam  A = 4'h0,
				B = 4'h1,
				C = 4'h2,
				D = 4'h3,
				E = 4'h4,
				F = 4'h5,
				G = 4'h6,
				H = 4'h7,
				I = 4'h8;
				
							
	always_comb begin
		case(CurrentState)
		A: if (!W) NextState = B;
			else NextState = F;
		B: if (!W) NextState = C;
			else NextState = F;
		C: if (!W) NextState = D;
			else NextState = F;
		D: if (!W) NextState = E;
			else NextState = F;
		E: if (!W) NextState = E;
			else NextState = F;
		F: if (!W) NextState = B;
			else NextState = G;
		G: if (!W) NextState = B;
			else NextState = H;
		H: if (!W) NextState = B;
			else NextState = I;
		I: if (!W) NextState = B;
			else NextState = I;	
			default: NextState = 4'h0; //A
		endcase
	end //state_table
	
	
//module TestTFF( T, Clk, ClrN, Q/*, QN*/ );
	always_ff @(posedge Clock) begin
	
		if (Reset) begin
			CurrentState <= A;
			//Enable <= 0;
			Z <= 0;
			ClearN <= 0;
		end else begin
			CurrentState <= NextState;
		//	if (y < 8) begin Enable <= 1; end
			ClearN <= 1;
			if ((CurrentState == I) || (CurrentState ==  E)) begin
				Z <= 1; //LEDG is on
			end else Z <= 0;
		end
		y = CurrentState;
	end // state_FFS		
		 //assignments for output z and the LEDS
endmodule
	
module 	Part1FSM_testbench;

	logic Clock, Reset, W, Z, y;
	
	integer i;
	
	Part1FSM dut(Clock, Reset, W, Z, y);
	
	initial begin
		//Reset = 1;
		//#10;
		Reset = 0;
		W = 0;
		//#10;
		for (int i = 0; i < 20; i++)begin
			Clock = 0;
			#10
			//$monitor(Z);
			Clock = 1; 
			#10
			$monitor(Z);
		end
		Reset = 1;
		//#10;
		Reset = 0;
		W = 1;
		//#10
		for (i = 0; i < 20; i++)begin
			Clock = 0;
			#10
			//$monitor(Z);
			Clock = 1; 
			#10
			$monitor(Z);
		end
		Reset = 1;
		W = 0;
	//	#10;
		for (i = 0; i < 20; i++)begin
			Clock = 0;
			#10
			//$monitor(Z);
			Clock = 1; 
			#10
			$monitor(Z);
		end
		Reset = 1;
		W = 1;
	//	#10;
		for (i = 0; i < 20; i++)begin
			Clock = 0;
			#10
			//$monitor(Z);
			Clock = 1; 
			#10
			$monitor(Z);
		end
		/*Reset = 0;
		W = 0;
		for (i = 0; i < 3; i++) begin
			Clock = 0;
			#10;
			Clock = 0;
			#10;
		end 
		Clock = 1;
		#2;
		W = 1;
		#8;
		Clock = 0;
		#10;
		Clock = 1;
		#2;
		W = 0;
		#8;
		
		for(i = 0; i < 4; i++) begin
			Clock = 0;
			#10;
			Clock = 1;
			#10;
		end
		*/
	end	
endmodule	