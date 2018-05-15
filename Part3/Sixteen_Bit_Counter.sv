//Matthew Skipworth
//TCES 330, Friday Section
//Sixteen Bit Counter Module
module Sixteen_Bit_Counter(enable, clock, clearN, q);
	input enable, clock, clearN;
	output [15:0] q;
	
	logic[14:0] t;
	
	assign t[0] = enable & q[0];
	assign t[1] = t[0] & q[1];
	assign t[2] = t[1] & q[2];
	assign t[3] = t[2] & q[3];
	assign t[4] = t[3] & q[4];
	assign t[5] = t[4] & q[5];
	assign t[6] = t[5] & q[6];
	assign t[7] = t[6] & q[7];
	assign t[8] = t[7] & q[8];
	assign t[9] = t[8] & q[9];
	assign t[10] = t[9] & q[10];
	assign t[11] = t[10] & q[11];
	assign t[12] = t[11] & q[12];
	assign t[13] = t[12] & q[13];
	assign t[14] = t[13] & q[14];
	
	TestTFF T1(enable, clock, clearN, q[0]);
	TestTFF T2(t[0], clock, clearN, q[1]);
	TestTFF T3(t[1], clock, clearN, q[2]);
	TestTFF T4(t[2], clock, clearN, q[3]);
	TestTFF T5(t[3], clock, clearN, q[4]);
	TestTFF T6(t[4], clock, clearN, q[5]);
	TestTFF T7(t[5], clock, clearN, q[6]);
	TestTFF T8(t[6], clock, clearN, q[7]);
	TestTFF T9(t[7], clock, clearN, q[8]);
	TestTFF T10(t[8], clock, clearN, q[9]);
	TestTFF T11(t[9], clock, clearN, q[10]);
	TestTFF T12(t[10], clock, clearN, q[11]);
	TestTFF T13(t[11], clock, clearN, q[12]);
	TestTFF T14(t[12], clock, clearN, q[13]);
	TestTFF T15(t[13], clock, clearN, q[14]);
	TestTFF T16(t[14], clock, clearN, q[15]);
	
endmodule	
//testbench
module Sixteen_Bit_Counter_testbench;

	logic enable, clock, clearN; 
	logic [15:0] q;
	
	
	Sixteen_Bit_Counter dut(enable, clock, clearN, q);
	
	integer i;
	

	//assign enable = 1;
	//assign clearN = 1;
	initial begin;
	enable = 0;
	clearN = 0;
		for (i = 1; i < 65536; i++) begin
			clock = 0;
			#10;
			clock = 1'b1;
			#10;
			assert(q == 0);
			//$display("Q: ");
			//$monitor("%16b", q);
		end
	enable = 0;
	clearN = 1;
		for (i = 1; i < 65536; i++) begin
			clock = 0;
			#10;
			clock = 1'b1;
			#10;
			assert(q == 0);
			//$display("Q: ");
			//$monitor("%d", q);
		end
	enable = 1;
	clearN = 0;
		for (i = 1; i < 65536; i++) begin
			clock = 0;
			#10;
			clock = 1'b1;
			#10;
			assert(q == 0);
			//$display("Q: ");
			//$monitor("%d", q);
		end
	enable = 1;
	clearN = 1;
		for (i = 1; i < 65536; i++) begin
			clock = 0;
			#10;
			clock = 1'b1;
			#10;
			assert(q == i);
			//$display("Q: ");
			//$monitor("%16b", q);
		end		
	end

endmodule		