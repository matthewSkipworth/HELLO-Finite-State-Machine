//Matthew Skipworth
//TCES330, Friday Section

//Part3FSM module
module Part3FSM(Clock, Reset, Out);
	
	input Clock, Reset;
	output logic [2:0] Out = 3'b111;
	
	logic [2:0] currentState = 3'b111, nextState = 3'b111;
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
		case(counter)
		
		0: nextState = H;
		1: nextState = E;
		2: nextState = L;
		3: nextState = L;
		4: nextState = O;
		5: nextState = Blank;
		6: nextState = Blank;
		7: nextState = Blank;
		
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
				currentState <= nextState; 
				counter <= counter + 1;
				Out <= currentState;
			end else begin
				counter <= 0;
				currentState <= nextState;
			end
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
	