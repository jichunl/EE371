// This is the top-level module for the johnson counter

// `include "johnson_down_counter.sv"

module DE1_SoC
	(input	logic		CLOCK_50
	,input	logic [9:0]	SW
	,input	logic [3:0]	KEY
	,output	logic [6:0]	HEX0
	,output logic [6:0]	HEX1
	,output logic [6:0]	HEX2
	,output logic [6:0]	HEX3
	,output logic [6:0]	HEX4
	,output logic [6:0]	HEX5
	,output	logic [9:0]	LEDR
	);

	logic [31:0]	clk_r;
	clock_divider 
		clk_div (CLOCK_50
			,clk_r
			);		

	parameter which_clock = 25;
	logic reset;
	logic [3:0]	q;
	johnson_down_counter
		jd_cntr (.clk_i(clk_r[which_clock])
			,.rst_i(reset)
			,.q_o(q)
			);

	assign reset = SW[0];
	assign LEDR = q;
endmodule

module clock_divider
	(input 	logic 		clock_i
	,output logic	[31:0]	divided_clocks_o;
	)
	
	initial
		divided_clocks_o <= 0;

	always_ff @(posedge clock_i)
		divided_clocks_o <= divided_clocks_o + 1;
endmodule

module johnson_down_counter
	(input	wire		clk_i
	,input	wire		rst_i
	,output wire	[3:0]	q_o
	);

	reg [3:0] state_r;

	assign q_o = state_r;

	always @(posedge clk_i or negedge rst_i) begin
		if (~rst_i) begin
			state_r <= 4'b1111;
		end else begin
			case (state_r)
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

module johnson_testbench();
	logic clk_i;
	logic rst_i;
	logic [3:0] q_o;
	
	johnson_down_counter dut (.*);

	parameter CLOCK_PERIOD = 100;
	initial begin
		clk_i <= 0;
		forever #(CLOCK_PERIOD/2) clk_i <= ~clk_i;
	end
	
	initial begin
				@(posedge clk_i);
		rst_i <= 1;	@(posedge clk_i);
				@(posedge clk_i);
		rst_i <= 0;	@(posedge clk_i);
				@(posedge clk_i);
		rst_i <= 1;	@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
				@(posedge clk_i);
		$stop;
	end
endmodule
