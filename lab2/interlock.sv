// This is the control module for the interlock 
// Input:
//	clk_i: the clock that this module runs on
//	rst_i: the signal that reset the whole system
//	arrive_i: the signal that indicates a bathysphere coming
//	depart_i: the signal that indicates a bathysphere leaving
// 	pressur_i: the signal that indicates the current pressure level
// Output:
//	inner_o: the signal that controls inner door	0:open 1:close
//	outer_o: the signal that controls outer door	0:open 1:close


module interlock
	(input	wire		clk_i
	,input	wire		rst_i
	,input	wire		arrive_i
	,input	wire		depart_i
	,input	wire		pressure_i
	,output	wire		inner_o
	,output wire		outer_o
	)
	
	

	

endmodule
