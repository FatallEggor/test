`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Project Name: CPU
// Additional Comments: just a simple ALU without any optimisation.
//
//////////////////////////////////////////////////////////////////////////////////
module alu(
    input wire [3:0] mode,
    input wire [31:0] A,
    input wire [31:0] B,
    output reg [31:0] C
    );
	 
localparam //functions
	 N = 8,
	 //logical
	 nulls = 4'b0000,
	 ones = 4'b0001,
	 no_f = 4'b0010,
	 not_f = 4'b0011,
	 xor_f = 4'b0100,
	 xnor_f = 4'b0101,
	 //arithmetic
	 incr_f = 4'b1000,
	 decr_f = 4'b1001,
	 compl_f = 4'b1010,
	 add_f = 4'b1011,
	 subtr_f = 4'b1100;
	 
	 
	 
	 always @ *
	 begin
		case(mode)
		nulls:
			C = {N{1'b0}};
			
		ones:
			C = {N{1'b1}};
			
		not_f:
			C = ~A;
			
		xor_f:
			C = A ^ B;
			
		xnor_f:
			C = ~(A ^ B);
		
		incr_f:
			C = A + 1;
			
		decr_f:
			C = A - 1;
			
		compl_f:
			C = -A;
		
		subtr_f:
			C = A - B;
			
		add_f:
			C = A + B;
			
		default:
			C = A;
			
		endcase
		
	 end


endmodule
