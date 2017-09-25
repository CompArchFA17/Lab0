// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder4bit();
	reg[3:0] a, b;
	wire[3:0] sum;
	wire carryout, overflow;

	FullAdder4bit mut (sum, carryout, overflow, a, b);

	initial begin
		$display("    A    B |    S Cout Over | Expected");
		a=4'b0000; b=4'b0000; #1000
		$display(" %b %b | %b    %b    %b | 0000 0 0", a, b , sum, carryout, overflow);
		a=4'b0101; b=4'b0011; #1000
		$display(" %b %b | %b    %b    %b | 1000 0 1", a, b , sum, carryout, overflow);
		a=4'b1001; b=4'b1110; #1000
		$display(" %b %b | %b    %b    %b | 0111 1 1", a, b , sum, carryout, overflow);
		a=4'b0101; b=4'b0010; #1000
		$display(" %b %b | %b    %b    %b | 0111 0 0", a, b , sum, carryout, overflow);
		a=4'b1101; b=4'b1011; #1000
		$display(" %b %b | %b    %b    %b | 1000 1 0", a, b , sum, carryout, overflow);
		a=4'b1111; b=4'b1111; #1000
		$display(" %b %b | %b    %b    %b | 1110 1 0", a, b , sum, carryout, overflow);
		a=4'b1001; b=4'b0110; #1000
		$display(" %b %b | %b    %b    %b | 1111 0 0", a, b , sum, carryout, overflow);
	end
endmodule
