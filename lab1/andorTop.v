// andorTop0.v

`include "andOr0.v"

module testBench;

	// connect the two modules
	wire [1:0] X, Y;
	wire [1:0] XandY, XorY;

	// declare and instance of the AND module
	AndOr myAndOr(XandY[1:0], XorY[1:0], X[1:0], Y[1:0]);

	// declare an instance of the test module
	
