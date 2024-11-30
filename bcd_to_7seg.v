module bcd_to_7seg(
	input [3:0] BCD,			//4bit input
	output [6:0] HEX	//7 segment display output
);

    assign HEX[0] = (~BCD[3] & ~BCD[2] & ~BCD[1] & BCD[0]) | //1
		    (~BCD[3] & BCD[2] & ~BCD[1] & ~BCD[0]);  //4
	

    assign HEX[1] = (~BCD[3] & BCD[2] & ~BCD[1] & BCD[0]) |  //5
		    (~BCD[3] & BCD[2] & BCD[1] & ~BCD[0]);   //6
	
	

    assign HEX[2] = (~BCD[3] & ~BCD[2] & BCD[1] & ~BCD[0]);  //2


    assign HEX[3] = (~BCD[3] & ~BCD[2] & ~BCD[1] & BCD[0]) | //1
		    (~BCD[3] & BCD[2] & ~BCD[1] & ~BCD[0]) | //4
		    (~BCD[3] & BCD[2] & BCD[1] & BCD[0]);    //7


    assign HEX[4] = (~BCD[3] & ~BCD[2] & ~BCD[1] & BCD[0]) | //1
		    (~BCD[3] & BCD[2] & ~BCD[1] & ~BCD[0]) | //4	
		    (~BCD[3] & BCD[2] & ~BCD[1] & BCD[0])  | //5
		    (~BCD[3] & BCD[2] & BCD[1] & BCD[0])   | //7
		    (~BCD[3] & ~BCD[2] & BCD[1] & BCD[0])  | //3
		    (BCD[3] & ~BCD[2] & ~BCD[1] & BCD[0]);   //9
	
		     
    assign HEX[5] = (~BCD[3] & ~BCD[2] & ~BCD[1] & BCD[0]) | //1
		    (~BCD[3] & ~BCD[2] & BCD[1] & ~BCD[0]) | //2
		    (~BCD[3] & ~BCD[2] & BCD[1] & BCD[0])  | //3
		    (~BCD[3] & BCD[2] & BCD[1] & BCD[0]); //7


    assign HEX[6] = (~BCD[3] & ~BCD[2] & ~BCD[1] & BCD[0]) | //1
		    (~BCD[3] & ~BCD[2] & ~BCD[1] & ~BCD[0]) | //0
		    (~BCD[3] & BCD[2] & BCD[1] & BCD[0]);    //7
endmodule
