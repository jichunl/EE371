// This is a 4-bit synchronous Johnson down counter

module johnson_down_counter
	(input	wire		clk_i
	,input	wire		rst_i
	,output	wire	[3:0] 	q_o
	);
	
	reg [3:0] state_r;
	
	assign q_o = state_r;

	always @(posedge clk_i or negedge rst_i) begin
		if (~rst_i) begin
			state_r <= 4'b1000;
		end else begin
			case(state_r)
				4'b1000: state_r <= 4'b1100;
				4'b1100: state_r <= 4'b1110;
				4'b1110: state_r <= 4'b1111;
				4'b1111: state_r <= 4'b0111;
				4'b0111: state_r <= 4'b0011;
				4'b0011: state_r <= 4'b0001;
				4'b0001: state_r <= 4'b0000;
				4'b0000: state_r <= 4'b1000;
				default: state_r <= 4'bx;
			endcase	
		end
	end
endmodule
