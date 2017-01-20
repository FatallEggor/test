module reg_file(
	input wire clk,
	input wire we,//for write enable

	input wire [4:0] ra1,//
	input wire [4:0] ra2,//for read  addresses
	input wire [4:0] wa3,//for write address

	input wire [31:0] wd,//for write data
	output wire [31:0] rd1,// for read data
	output wire [31:0] rd2//
);

reg [31:0] rf [31:0];

always @(posedge clk)
	if (we)
		rf[wa] <= wd3;

assign rd1 = (ra1 != 0) ? rf[ra1] : 0;
assign rd2 = (ra2 != 0) ? rf[ra2] : 0;
endmodule
