`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:42 11/07/2016 
// Design Name: 
// Module Name:    i_gen 
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
module instr_gen(
	input wire sw0,
	input wire clk,
	input wire reset,
	
	output wire [10:0] instr
    );
	
	wire[3:0] addr;
	wire sw;
	
	db_fsm db_fsm_ex(.clk(clk), .sw(sw0), .db(sw));
	PC #4 pc_uut(.clk(clk), .incr(sw), .reset(reset), .out(addr));
	rom2 rom_uut(.clk(clk), .data(instr), .addr(addr));

endmodule
