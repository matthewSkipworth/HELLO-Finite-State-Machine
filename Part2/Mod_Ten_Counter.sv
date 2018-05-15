//Matthew Skipworth
//TCES330, Friday Section

//mod 10 counter module, counts up to 9 only, then returns to zero.
module Mod_Ten_Counter(w1, w0, Reset, Clock, z);
	input w1, w0, Reset, Clock;
	output logic [3:0] z = 0;
	
	logic [3:0] CurrentState, NextState;

	localparam  
			A = 4'h0,
			B = 4'h1,
			C = 4'h2,
			D = 4'h3,
			E = 4'h4,
			F = 4'h5,
			G = 4'h6,
			H = 4'h7,
			I = 4'h8,
			J = 4'h9;
	
// state table	
	always_comb begin
		case(CurrentState)
		A: if (!w1 && !w0) NextState = A;
			else if (!w1 && w0) NextState = B;
			else if (w1 && !w0) NextState = C;
			else /*if (w1 && w0)*/ NextState = J;
		B: if (!w1 && !w0) NextState = B;
			else if (!w1 && w0) NextState = C;
			else if (w1 && !w0) NextState = D;
			else /*if (w1 && w0)*/ NextState = A;
		C: if (!w1 && !w0) NextState = C;
			else if (!w1 && w0) NextState = D;
			else if (w1 && !w0) NextState = E;
			else /*if (w1 && w0)*/ NextState = B;
		D: if (!w1 && !w0) NextState = D;
			else if (!w1 && w0) NextState = E;
			else if (w1 && !w0) NextState = F;
			else /*if (w1 && w0)*/ NextState = C;
		E: if (!w1 && !w0) NextState = E;
			else if (!w1 && w0) NextState = F;
			else if (w1 && !w0) NextState = G;
			else /*if (w1 && w0)*/ NextState = D;
		F: if (!w1 && !w0) NextState = F;
			else if (!w1 && w0) NextState = G;
			else if (w1 && !w0) NextState = H;
			else /*if (w1 && w0)*/ NextState = E;
		G: if (!w1 && !w0) NextState = G;
			else if (!w1 && w0) NextState = H;
			else if (w1 && !w0) NextState = I;
			else /*if (w1 && w0)*/ NextState = F;
		H: if (!w1 && !w0) NextState = H;
			else if (!w1 && w0) NextState = I;
			else if (w1 && !w0) NextState = J;
			else /*if (w1 && w0)*/ NextState = G;
		I: if (!w1 && !w0) NextState = I;
			else if (!w1 && w0) NextState = J;
			else if (w1 && !w0) NextState = A;
			else /*if (w1 && w0)*/ NextState = H;
		J: if (!w1 && !w0) NextState = J;
			else if (!w1 && w0) NextState = A;
			else if (w1 && !w0) NextState = B;
			else /*if (w1 && w0)*/ NextState = I;	
			
			default: NextState = 4'h0; //A
		endcase
	end

	always_ff @(posedge Clock) begin
	
		if (Reset) begin
			CurrentState <= A;
			z <= 0;
		end else begin
			CurrentState <= NextState;
			z <= CurrentState;
		end
	end 

endmodule	

module Mod_Ten_Counter_testbench;

	logic w1, w0, Clock, Reset;
	logic [3:0] z = 0;
	
	integer i;
	
	Mod_Ten_Counter DeviceUnderTest(w1, w0, Reset, Clock, z);
	
	initial begin
		Reset = 0; //testing reset off.
		w1 = 0;
		w0 = 0;
		for (i = 0; i < 19; i++) begin
			Clock = 1;
			#10;
			Clock = 0;
			#10;
		end
		w1 = 0;
		w0 = 1;
		for (i = 0; i < 19; i++) begin
			Clock = 1;
			#10;
			Clock = 0;
			#10;
		end
		w1 = 1;
		w0 = 0;
		for (i = 0; i < 19; i++) begin
			Clock = 1;
			#10;
			Clock = 0;
			#10;
		end
		w1 = 1;
		w0 = 1;
		for (i = 0; i < 19; i++) begin
			Clock = 1;
			#10;
			Clock = 0;
			#10;
		end
		
		Reset = 1; //testing reset on.
		w1 = 0;
		w0 = 0;
		for (i = 0; i < 19; i++) begin
			Clock = 1;
			#10;
			Clock = 0;
			#10;
		end
		w1 = 0;
		w0 = 1;
		for (i = 0; i < 19; i++) begin
			Clock = 1;
			#10;
			Clock = 0;
			#10;
		end
		w1 = 1;
		w0 = 0;
		for (i = 0; i < 19; i++) begin
			Clock = 1;
			#10;
			Clock = 0;
			#10;
		end
		w1 = 1;
		w0 = 1;
		for (i = 0; i < 19; i++) begin
			Clock = 1;
			#10;
			Clock = 0;
			#10;
		end
	end	
endmodule	