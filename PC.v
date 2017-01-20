
third change

// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////
module PC
#(parameter
	SIZE = 8	
)
(
	input wire clk,
	input wire incr,
	input wire reset,
	
	output wire[SIZE-1:0] out
   );
	
	reg [SIZE-1:0] r_reg = 0, r_next = 0;
	reg  incr_reg = 0, incr_next = 0;
	
	always @(posedge clk, posedge reset)
	begin
		if (reset)
			r_reg <= 0;
		else
		begin
			r_reg <= r_next;
			incr_reg <= incr_next;
		end
	end

always @ *
begin
	r_next = r_reg;
	incr_next = incr;

	if (incr)
		if (~incr_reg)
			begin
			r_next  = r_reg + 1;
			end	
end

	assign out = r_reg;
	
endmodule
