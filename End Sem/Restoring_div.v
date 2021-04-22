// Implement the Verilog modeling for the Division Unit without directly using divide and modulo operations.
//----------------------- RESTORING DIVISION --------------------------------

`timescale 1ns/1ps

// Module to perform restoring division on two 10 bit numbers
module Restore_div(in1, in2, quo, rem); 
	input signed[9:0] in1, in2;			//in1 is Dividend and in2 is Divisor
	output signed[9:0] quo, rem;
	reg [9:0] quo = 0;   // To store quotient
	reg [9:0] rem = 0;   // To store remainder 
	reg [9:0] q, m;      // M will store divisior, Q will have the Dividend initially and quotient in the end
	reg [10:0] ac;       // AC means accumulator register and will finally have the remainder
	integer i;           // loop variable
	
	always @(*)
	begin
		q = in1;        // Initialising Q to dividend
		m = in2;        // Initialising m to divisor
		ac = 0;
		for (i = 0; i < 10; i = i+1)
		begin 
			//Left shifting the AC and Q, accordingly changing LSB of AC
			ac = {ac[8:0], q[9]};   //  The LSB will be the MSB of Q
			q[9:1] = q[8:0];        //  Left shift, leaving the LSB empty for now
			
			ac = ac - m;
			//Checking sign bit
			if (ac[9] == 1)
            // If the remainder is negative that means we need to restore, push 0 to Q
                begin 
                    q[0] = 0;
                    ac = ac + m;
                end 
            
            //  Else it means we can subtract and so we push one to Q's LSB
			else 
				q[0] = 1;
		end 

        // Finally the quotient is Q and remainder is in AC
		quo = q;
		rem = ac;
	end
	
endmodule

// Test Bench Module
module test_bench;
	reg[9:0] in1, in2;
	wire[9:0] quo, rem;
	
    // Caaling the module
	Restore_div div(in1, in2, quo, rem);
	
	initial begin
        $monitor("\n %d \t Num_1 = %b \t Num_2 = %b \t Qoutient = %b \t Remainder = %b", $time,in1, in2, quo, rem);
        #0	in1=10'b0001011110; in2=10'b0000000010;
        #10	in1=10'b0101011110; in2=10'b0010100010;
        #10	in1=10'b0001011110; in2=10'b0000100010;
        #10	in1=10'b0001011110; in2=10'b0101000010;
        #10	in1=10'b0011000110; in2=10'b0000000110;
	end 
endmodule