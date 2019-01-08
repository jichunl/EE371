// This is the module that controls the outer port of the interlock
// Input:
//	readyLow_i: the signal indicates that the pressure difference between 
//			chamber and outer world is less than 0.1 atm
//	portSwitch_i: the input from user indicates a user operation
// Output:
//	doorState_o: the signal indicates the current state of the outer port
//		     1: open	0: closed
// Last edit on: Fri 20 Apr 2018 04:08:18 PM DST
module outer_port
	(input	wire	readyLow_i
	,input	wire	portSwitch_i
	,output wire	doorState_o
	)

	always@(*) begin
		doorState_o = readyLow_i & portSwitch;
	end
endmodule	
