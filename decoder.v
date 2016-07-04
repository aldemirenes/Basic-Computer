`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:16:32 06/29/2016 
// Design Name: 
// Module Name:    decoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module decoder(
    input code[3:0],
	 output out[15:0]
    );
	 always@*
	 begin
		reg state[15:0];
		case(code)
			4'h0 : state <= 16'h0001;
			4'h1 : state <= 16'h0002;
			4'h2 : state <= 16'h0004;
			4'h3 : state <= 16'h0008;
			4'h4 : state <= 16'h0010;
			4'h5 : state <= 16'h0020;
			4'h6 : state <= 16'h0040;
			4'h7 : state <= 16'h0080;
			4'h8 : state <= 16'h0100;
			4'h9 : state <= 16'h0200;
			4'ha : state <= 16'h0400;
			4'hb : state <= 16'h0800;
			4'hc : state <= 16'h1000;
			4'hd : state <= 16'h2000;
			4'he : state <= 16'h4000;
			4'hf : state <= 16'h8000;
		endcase
		assign out = state;
	end	

endmodule
