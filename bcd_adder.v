module bcd_adder(
	input [3:0] X,		//BCD digit X
	input [3:0] Y, 	//BCD digit Y
	input cin, 			//carry-in
	output [3:0] S0, 	//BCD sum digit 
	output [3:0] S1, 	//BCD sum digit 
	output error 		//flag for check invalid BCD inputs
);
	wire [3:0] binary_sum;	//4-bit binary sum
	wire carry_out;			//Carry-out from binary addition
	wire adjust;				//Adjustment flag for BCD correction
	
	// Instantiate the 4-bit binary adder
	binary_adder_4bit adder (
	.X(X),					//First 4-bit number
	.Y(Y), 					//Second 4-bit number
	.cin(cin),				//Carry-in
	.sum(binary_sum),		//4-bit sum
	.cout(carry_out)		//carry-out
);
	 // Adjust flag: If binary sum > 9 or carry-out is 1, adjustment is needed
    assign adjust = (binary_sum > 4'd9) || carry_out;
	 
	 // Compute BCD digits S1 and S0
    assign S0 = adjust ? (binary_sum - 4'd10) : binary_sum; // Adjust if sum > 9
    assign S1 = adjust ? 4'd1 : 4'd0;                      // Carry to S1 if adjusted
	 
	 // Error detection: X or Y > 9 (invalid BCD input)
    assign error = (X > 4'd9) || (Y > 4'd9);
endmodule 