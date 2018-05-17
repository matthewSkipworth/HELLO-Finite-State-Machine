//Matthew Skipworth
//TCES330, Friday Section

//Part3FSM module
module Part3FSM(Clock, Reset, Out);
	
	input Clock, Reset;
	output logic [2:0] Out = 3'b111;
	
	logic [2:0] currentState, nextState;
	logic enable, q, counter_reset;
	
	logic [3:0] counter;
	
	localparam  Blank = 3'b000,
				H = 3'b001,
				E = 3'b010,
				L = 3'b011,
				O = 3'b100;
			 /*H = 3'b000,
				E = 3'b001,
				L = 3'b010,
				O = 3'b011; */
				
	always_comb begin
		case(currentState)
		
		//Blank: nextState = H;
		H: nextState = E;
		E: nextState = L;
		   //counter = 0;
		L: 
			if (counter != 3) nextState = O;
			else nextState = L;
			
		O: nextState = Blank;
			//counter = 0;
		Blank: 
			if (counter !=0 ) nextState = Blank;
			else nextState = H;
		
		default: nextState = Blank;
		
		endcase
	end
	
	always_ff @(posedge Clock)begin
		if (!Reset) begin
			currentState <= Blank;
			Out <= Blank;
			counter <= 0;
		end else begin
			if (counter < 7) begin
				//if ( (currentState == E) || (currentState == O) || counter == 7)begin 
					//counter <= 0;
		//		currentState <= nextState;
		//	end else begin
				currentState <= nextState;
			   //end else begin
				counter <= counter + 1;
			//	Out <= currentState;
			end else begin
				counter <= 0;
				currentState <= nextState;
				//Out <= currentState;
			end
			Out <= currentState;
		end
	end
		
endmodule

module Part3FSM_testbench;

	logic Clock, Reset;
	logic [2:0] Out = 0;
	
	integer j;
	
	Part3FSM DUT(Clock, Reset, Out);
	
	initial begin
		Reset = 0;
		
		for (j = 0; j < 16; j++) begin
			Clock = 1;
			#10;
			Clock = 0;
			#10;
			$monitor("%4b", Out);
		end
	end
endmodule
	