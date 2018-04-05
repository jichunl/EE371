// The 4-bit ripple down counter

`include "DFilpFlop.v"

module ripple_down_counter 
	(input 	wire		clk_i 
	,input 	wire		reset_i
	,output reg	[3:0] 	Q_o
	);

	wire 	rst_inv_r;
	
	not u1 (rst_inv_r, reset_i);
	
	
endmodule
