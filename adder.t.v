// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder4bit();
	reg[3:0] a, b; // Set up the buses
	wire[3:0] sum;
	wire carryout, overflow;

	FullAdder4bit mut (sum, carryout, overflow, a, b);

	initial begin
		$dumpfile("fourbit_trace.vcd"); // Create a file to view waveforms
    	$dumpvars;
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
		a=4'b1111; b=4'b0000; #1000
		$display(" %b %b | %b    %b    %b | 1111 0 0", a, b , sum, carryout, overflow);
		a=4'b1111; b=4'b0001; #1000
		$display(" %b %b | %b    %b    %b | 0000 1 0", a, b , sum, carryout, overflow);
		a=4'b0111; b=4'b0001; #1000
		$display(" %b %b | %b    %b    %b | 1000 0 1", a, b , sum, carryout, overflow);
		a=4'b0001; b=4'b0111; #1000
		$display(" %b %b | %b    %b    %b | 1000 0 1", a, b , sum, carryout, overflow);
		a=4'b0110; b=4'b0110; #1000
		$display(" %b %b | %b    %b    %b | 1100 0 1", a, b , sum, carryout, overflow);
		a=4'b1001; b=4'b1001; #1000
		$display(" %b %b | %b    %b    %b | 0010 1 1", a, b , sum, carryout, overflow);
		a=4'b1010; b=4'b0101; #1000
		$display(" %b %b | %b    %b    %b | 1111 0 0", a, b , sum, carryout, overflow);
		a=4'b1000; b=4'b1000; #1000
		$display(" %b %b | %b    %b    %b | 0000 1 1", a, b , sum, carryout, overflow);
		a=4'b0001; b=4'b0001; #1000
		$display(" %b %b | %b    %b    %b | 0010 0 0", a, b , sum, carryout, overflow);
	end
endmodule
