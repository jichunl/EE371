module DFlipFlop
	(input 	wire	clk_i
	,input	wire	rst_i 
	,input 	wire	D_i
	,output	reg	q_o
	,output wire	qBar_o
	);
	
	not n1 (qBar_o, q_o);
	
	always@(negedge rst_i or posedge clk_i) begin
		if (!rst_i) begin
			q_o = 1'b0;
		end else begin
			q_o = D_i;
		end
	end
endmodule	
