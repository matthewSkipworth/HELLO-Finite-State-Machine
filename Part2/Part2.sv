//Matthew Skipworth
//TCES330, Friday Section

//Part2 top level module.
module Part2(SW, HEX0, LEDR, KEY);
	
		input [2:0] SW;
		output [2:0] LEDR;
		input [0:0] KEY;
		output [0:6] HEX0;
		
		assign LEDR = SW;
		
		logic [3:0] a_four_bit_wire;

		//module Mod_Ten_Counter(w1, w0, Reset, Clock, z);
		
		Mod_Ten_Counter SirCountsAlot(SW[2], SW[1], SW[0], KEY, a_four_bit_wire);
		
		HexHEXI HexDecoder(HEX0, a_four_bit_wire);
		
endmodule