module binary_adder_4bit (
	input [3:0] X,	//First 4-bit number
	input [3:0]	Y, //Second 4-bit number
	input cin,		//Carry-in
	output [3:0] sum,		//4-bit sum
	output cout		//carry-out
);
	wire	c1,c2,c3;	//internal carry signals
	
	
	//full adder instances for each bit
	full_adder FA0 (.a(X[0]), .b(Y[0]), .cin(cin), .sum(sum[0]), .cout(c1));
	full_adder FA1 (.a(X[1]), .b(Y[1]), .cin(c1), .sum(sum[1]), .cout(c2));
	full_adder FA2 (.a(X[2]), .b(Y[2]), .cin(c2), .sum(sum[2]), .cout(c3));
	full_adder FA3 (.a(X[3]), .b(Y[3]), .cin(c3), .sum(sum[3]), .cout(cout));
	
endmodule 
