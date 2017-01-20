
module rom2 (
	input wire clk,
//	inout wire en,
	input wire [3:0] addr,
	output reg [10:0] data
	);

localparam 
	//op_codes
	R_type = 2'b00,
	J_tupe = 2'b01,
	I_type = 2'b10,

	//funct
	 //logical
	 nulls = 5'b0000_1,
	 ones = 5'b0001_1,
	 no_f = 5'b0010_1,
	 not_f = 5'b0011_1,
	 xor_f = 5'b0100_1,
	 xnor_f = 5'b0101_1,
	 
	 //arithmetic
	 incr_f = 5'b1000_1,
	 decr_f = 5'b1001_1,
	 compl_f = 5'b1010_1,
	 add_f = 5'b1011_1,
	 subtr_f = 5'b1100_1,

	 move_f = 5'b1101_0,	 

	 //registers
	 zero = 5'b00000,
	 
	 at = 5'b00001,
	 
	 v0 = 5'b00010,
	 v1 = 5'b00011,
	 
	 a0 = 5'b00100,
	 a1 = 5'b00101,
	 a2 = 5'b00110,
	 a3 = 5'b00111,

	 t0 = 5'b01000,
	 t1 = 5'b01001,
	 t2 = 5'b01010,
	 t3 = 5'b01011,
	 t4 = 5'b01100,
	 t5 = 5'b01101,
	 t6 = 5'b01110,
	 t7 = 5'b01111,
	
	 s0 = 5'b10000,
	 s1 = 5'b10001,
	 s2 = 5'b10010,
	 s3 = 5'b10011,
	 s4 = 5'b10100,
	 s5 = 5'b10101,
	 s6 = 5'b10110,
	 s7 = 5'b10111,
	 
	 
	 t8 = 5'b11000,
	 t9 = 5'b11001,

	 k0 = 5'b11010,
	 k1 = 5'b11011,
	 
	 gp = 5'b11100,
	 sp = 5'b11101,
	 fp = 5'b11110,
	 ra = 5'b11111;
//								  {command, from, to}
	always @(posedge clk)
	begin
		case(addr)
			4'b0000: data <= {};
			4'b0001: data <= {move_f, reg4, reg2};
			4'b0010: data <= {subtr_f, noarg, reg3};
			4'b0011: data <= {xor_f, noarg, reg4};
			4'b0100: data <= {move_f, reg3, reg1};
			4'b0101: data <= {move_f, reg4, reg2};
			4'b0110: data <= {not_f, noarg, reg4};
			4'b0111: data <= {xnor_f, noarg, reg4};
			4'b1000: data <= {move_f, reg3, reg1};
			4'b1001: data <= {move_f, reg4, reg2};
			4'b1010: data <= {incr_f, noarg, reg4}; 
			4'b1011: data <= {decr_f, noarg, reg4};
			4'b1100: data <= {move_f, reg4, reg2};
			4'b1101: data <= {move_f, reg4, reg2};
			4'b1110: data <= {move_f, reg4, reg2};
			4'b1111: data <= {move_f, reg4, reg2};

		endcase
	end

endmodule









