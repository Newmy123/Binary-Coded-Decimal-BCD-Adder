	module lab2_part4(
	input [8:0] SW,				// Switch inputs: SW[7:4]=X, SW[3:0]=Y, SW[8]=cin
	output [9:0] LEDR,			// Red lights for carry-out and error
	output [6:0] HEX5,			// Display for X
   output [6:0] HEX3,			// Display for Y
   output [6:0] HEX1,			// Display for S1
   output [6:0] HEX0 			// Display for S0
);
	wire [3:0] X = SW[7:4];		// Input X
	wire [3:0] Y = SW[3:0]; 	// Input Y
	wire cin = SW[8];				//carry-in
	wire [3:0] S0,S1;				//BCD sum digit
	wire error;						//Error flag
	
// Instantiate the BCD adder
    bcd_adder adder (
        .X(X), 
        .Y(Y), 
        .cin(cin), 
        .S0(S0), 
        .S1(S1), 
        .error(error)
    );
	 
//connect outputs
	assign LEDR[3:0] = S0;	// Display S0 on LEDR[3:0]
	assign LEDR[4] = S1;		// Display S1 on LEDR[4]
	assign LEDR[9] = error;	// Turn on LEDR[9] for invalid BCD input error

// Display X and Y on HEX5 and HEX3
	bcd_to_7seg hex5(.BCD(X), .HEX(HEX5));
	bcd_to_7seg hex3(.BCD(Y), .HEX(HEX3));
// Display S1 and S0 on HEX1 and HEX0
	bcd_to_7seg hex1(.BCD(S1), .HEX(HEX1));
	bcd_to_7seg hex0(.BCD(S0), .HEX(HEX0));
endmodule 