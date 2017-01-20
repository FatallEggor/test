module cpu (
	input wire sw0,
	
	input wire clk,
	input wire reset,

	output wire led0,
	output wire led1,
	output wire led2,
	output wire led3,
	output wire led4,
	output wire led5,
	output wire led6,
	output wire led7
	);
	
	wire [10:0] instr;
	wire[7:0]  A, B, C, bus, out_R3, out_R4;
	wire[10:0]c_s;
	
	instr_gen i_gen(.sw0(sw0), .clk(clk), .reset(reset), .instr(instr));

	contr c_uut(.clk(clk), .instr(instr), .contr_s(c_s));
	
	regist1 #(.INIT(8'b0),.SIZE(8)) R1(.clk(clk), .write(c_s[5]), .reset(reset), .in(bus), .out(A));	
	regist1 #(.INIT(8'b0),.SIZE(8)) R2(.clk(clk), .write(c_s[4]), .reset(reset), .in(bus), .out(B));
	
	regist1 #(.INIT(8'b01010101),.SIZE(8)) R3(.clk(clk), .write(c_s[3]), .reset(reset), .in(bus), .out(out_R3));
	tristate #(.SIZE(8)) trist_R3 (.in(out_R3), .control(c_s[2]), .out(bus));
	
	regist1 #(.INIT(8'b00101010),.SIZE(8)) R4(.clk(clk), .write(c_s[1]), .reset(reset), .in(bus), .out(out_R4));
	tristate #(.SIZE(8)) trist_R4 (.in(out_R4), .control(c_s[0]), .out(bus));
	
	alu alu_uut(.A(A), .B(B), .C(C), .mode(c_s[10:7]));
	tristate #(.SIZE(8)) trist_alu (.in(C), .control(c_s[6]), .out(bus));
	
	assign{led7, led6, led5, led4, led3, led2, led1, led0} = bus; 

endmodule
