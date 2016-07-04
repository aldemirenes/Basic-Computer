`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:51:25 07/04/2016 
// Design Name: 
// Module Name:    data_unit 
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
module data_unit(
		input reset, clk, en,
	   output ac_data
    );
	 wire ar_inc, ar_ld;
	 wire [7:0] ar_idat, ar_odat;
	 wire pc_inc, pc_ld;
	 wire [7:0] pc_idat, pc_odat;
	 wire dr_inc, dr_ld;
	 wire [7:0] dr_idat, dr_odat;
	 wire ir_inc, ir_ld;
	 wire [7:0] ir_idat, ir_odat;
	 wire ac_inc, ac_ld;
	 wire [7:0] ac_idat, ac_odat;
	 
	
	
	 memory mem (.clk(clk), .ad(ar_odat), .ld(mem_ld), .idat(ac_odat), .odat(mem_dat));
	 signals sig(.reset(reset), .clk(clk), .dec_signal(dec_signal), .en(en));
	 
	 register ar(.inc(ar_inc), .idat(ar_idat), .load(ar_ld), .clr(reset), .clk(clk), .odat(ar_odat));
	 register pc(.inc(pc_inc), .idat(pc_idat), .load(pc_ld), .clr(reset), .clk(clk), .odat(pc_odat));
	 register dr(.inc(dr_inc), .idat(dr_idat), .load(dr_ld), .clr(reset), .clk(clk), .odat(dr_odat));
	 register ir(.inc(ir_inc), .idat(ir_idat), .load(ir_ld), .clr(reset), .clk(clk), .odat(ir_odat));
	 register ac(.inc(ac_inc), .idat(ac_idat), .load(ac_ld), .clr(reset), .clk(clk), .odat(ac_odat));
	 
	 alu_unit alu (.ac(ac_odat), .dr(dr_odat), .alu_code(alu_code), .ei(ei), .eo(eo), .data(data));
	 
	 decoder dec_opcode(.opcode(ir_odat[14:12]), .out(states));
	 control_unit control(.dec_signal(dec), 
								 .ar_idat(ar_idat), .pc_idat(pc_idat), .dr_idat(dr_idat), .ir_idat(ir_idat), .ac_idat(ac_idat),
								 .ar_odat(ar_odat), .pc_odat(pc_odat), .dr_odat(dr_odat), .dr_idat(dr_idat),
								 .pc_inc(pc_inc), .time_signal(dec_signal), .states(states),
								 .ctrl_alu(alu_code));

endmodule
