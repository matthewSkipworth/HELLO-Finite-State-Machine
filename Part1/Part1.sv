//Matthew Skipworth
//TCES330, Friday Section

//Part1 top level module. 
module Part1(SW, KEY, LEDG, LEDR, HEX0);
	input [1:0] SW;
	input [0:0] KEY;
	output [1:0]LEDR;
	output [0:0]LEDG;
	output logic [0:6]HEX0;
	
	logic [3:0] some_wires;
	
	assign LEDR = SW;
	
	Part1FSM theFSM(KEY, SW[0], SW[1], LEDG, some_wires);
	
	HexHEXI hex_display(HEX0, some_wires);
	
	
endmodule	
