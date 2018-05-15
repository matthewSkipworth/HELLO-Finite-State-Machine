//Matthew Skipworth
//TCES330, Friday Section

//Part 4 top level module. Part 4 is basically part 3 except that this 
//module utilizes the DE2-115's CLOCK_50 system clock instead of the KEY
//pulse.
module Part4(CLOCK_50, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);

	input CLOCK_50;
	input [0:0] KEY;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

	logic outclock;
	logic[23:0] Q;
	logic[2:0] Out;
	
	KHzCLock clock1(CLOCK_50, outclock);

	
	Part3FSM FSM1(outclock, KEY, Out);
	
	Four_Bit_Register R0(Out, outclock, KEY, Q[2:0]);
	Four_Bit_Register R1(Q[2:0], outclock, KEY, Q[5:3]);
	Four_Bit_Register R2(Q[5:3], outclock, KEY, Q[8:6]);
	Four_Bit_Register R3(Q[8:6], outclock, KEY, Q[11:9]);
	Four_Bit_Register R4(Q[11:9], outclock, KEY, Q[14:12]);
	Four_Bit_Register R5(Q[14:12], outclock, KEY, Q[17:15]);
	Four_Bit_Register R6(Q[17:15], outclock, KEY, Q[20:18]);
	Four_Bit_Register R7(Q[20:18], outclock, KEY, Q[23:21]);
	
	
	New_Hex_HELO H0(HEX0, Q[2:0]);
	New_Hex_HELO H1(HEX1, Q[5:3]);
	New_Hex_HELO H2(HEX2, Q[8:6]);
	New_Hex_HELO H3(HEX3, Q[11:9]);
	New_Hex_HELO H4(HEX4, Q[14:12]);
	New_Hex_HELO H5(HEX5, Q[17:15]);
	New_Hex_HELO H6(HEX6, Q[20:18]);
	New_Hex_HELO H7(HEX7, Q[23:21]);


endmodule