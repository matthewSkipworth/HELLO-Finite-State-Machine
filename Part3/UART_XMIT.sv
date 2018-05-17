module UART_XMIT(TxData, XMitGo, Clock, Reset, TxOut, TxEmpty);

	input [7:0] TxData;
	input XMitGo, Clock, Reset;

	output TxOut, TxEmpty;

	//read in new data and save (register) when XMitGo is true.
	//add the Start Bit and Stop Bit and transmit the entire data frame (TxOut)
	//set TxEmpty when it's ready to accept new data.
	
endmodule
