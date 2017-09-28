// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg[3:0] a, b;
    wire[3:0] sum;
    wire carryout, overflow;

    FullAdder4bit adder (sum, carryout, overflow, a, b);

    initial begin
	$dumpfile("adder.vcd");
	$dumpvars();

	$display("|   input     ||    expected    ||     actual     |");
        $display("|  a   |  b   || sum  |cout|over|| sum  |cout|over|");
	$display("positive numbers, no overflow:");
	a=4'b0000; b=4'b0000; #1000
        $display("| %b | %b || 0000 | 0  | 0  || %b | %b  | %b  |",
		a, b, sum, carryout, overflow);
	a=4'b0010; b=4'b0001; #1000
        $display("| %b | %b || 0011 | 0  | 0  || %b | %b  | %b  |",
		a, b, sum, carryout, overflow);
	a=4'b0011; b=4'b0011; #1000
        $display("| %b | %b || 0110 | 0  | 0  || %b | %b  | %b  |",
		a, b, sum, carryout, overflow);
	$display("negative numbers, no overflow");
	a=4'b1111; b=4'b1111; #1000
        $display("| %b | %b || 1110 | 1  | 0  || %b | %b  | %b  |",
		a, b, sum, carryout, overflow);
	a=4'b1110; b=4'b1011; #1000
        $display("| %b | %b || 1001 | 1  | 0  || %b | %b  | %b  |",
		a, b, sum, carryout, overflow);
	$display("numbers with overflow");
	a=4'b0101; b=4'b0011; #1000
        $display("| %b | %b || 1000 | 0  | 1  || %b | %b  | %b  |",
		a, b, sum, carryout, overflow);
	a=4'b1011; b=4'b1100; #1000
        $display("| %b | %b || 1000 | 1  | 1  || %b | %b  | %b  |",
		a, b, sum, carryout, overflow);
	$display("positive plus negative");
	a=4'b1011; b=4'b0100; #1000
        $display("| %b | %b || 1111 | 0  | 0  || %b | %b  | %b  |",
		a, b, sum, carryout, overflow);
	a=4'b1101; b=4'b0101; #1000
        $display("| %b | %b || 0010 | 1  | 0  || %b | %b  | %b  |",
		a, b, sum, carryout, overflow);
    end
endmodule
