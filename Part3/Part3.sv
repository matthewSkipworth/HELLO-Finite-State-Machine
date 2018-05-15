//Matthew Skipworth
//TCES330, Friday Section

//Part3 top level module.
module Part3(KEY, SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	input [0:0] KEY;
	input [0:0] SW;
	
	output logic [0:6]  HEX0 = 7'b1111111, 
						HEX1 = 7'b1111111, 
						HEX2 = 7'b1111111, 
						HEX3 = 7'b1111111, 
						HEX4 = 7'b1111111, 
						HEX5 = 7'b1111111, 
						HEX6 = 7'b1111111, 
						HEX7 = 7'b1111111;
	
	logic[23:0] Q;
	logic[2:0] Out;
	
	Part3FSM FSM1(KEY, SW, Out);
	
	Four_Bit_Register R0(Out, KEY, SW, Q[2:0]);
	Four_Bit_Register R1(Q[2:0], KEY, SW, Q[5:3]);
	Four_Bit_Register R2(Q[5:3], KEY, SW, Q[8:6]);
	Four_Bit_Register R3(Q[8:6], KEY, SW, Q[11:9]);
	Four_Bit_Register R4(Q[11:9], KEY, SW, Q[14:12]);
	Four_Bit_Register R5(Q[14:12], KEY, SW, Q[17:15]);
	Four_Bit_Register R6(Q[17:15], KEY, SW, Q[20:18]);
	Four_Bit_Register R7(Q[20:18], KEY, SW, Q[23:21]);
	
	
	New_Hex_HELO H0(HEX0, Q[2:0]);
	New_Hex_HELO H1(HEX1, Q[5:3]);
	New_Hex_HELO H2(HEX2, Q[8:6]);
	New_Hex_HELO H3(HEX3, Q[11:9]);
	New_Hex_HELO H4(HEX4, Q[14:12]);
	New_Hex_HELO H5(HEX5, Q[17:15]);
	New_Hex_HELO H6(HEX6, Q[20:18]);
	New_Hex_HELO H7(HEX7, Q[23:21]);
	
endmodule	