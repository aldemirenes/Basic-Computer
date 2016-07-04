`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:51:40 07/04/2016 
// Design Name: 
// Module Name:    alu_unit 
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
module alu_unit( input[15:0] ac, dr, 
					  input[3:0] code,
					  input ei,
					  output eo, 
					  output[15:0] data
					 );
					 
			if (code == 4'b0011)
				assign eo = ac[0];
			else if (code == 4'b0011)
				assign eo = ac[15];
			else if (code == 4'b0100)
				assign eo = ac[0];
			
			always@*
			begin
				case(code)
					4'b0000: data <= ac + dr;
					4'b0001: data <= ac & dr;
					4'b0010: data <= ~ac;
					4'b0011: data <= {{ei}, {ac[15:1]}};
					4'b0100: data <= {{ac[14:0]},{ei}};
					4'b0101: data <= 0;
				endcase
			end
endmodule
