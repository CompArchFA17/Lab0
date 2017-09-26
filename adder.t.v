// Lab 0 Adder testbench
`timescale 1 ns/ 1 ps
`include "adder.v"

module testFourBitAdder();


	reg [3:0] a;
	reg [3:0] b;

	wire [3:0] sum;	
	wire cout0;
	wire cout1;
	wire cout2;
	wire Cout;
	wire overflow;

	FullAdder4bit test(sum[3:0], Cout, overflow, a, b);

initial begin

	$dumpfile("FullAdder4bit.vcd");
	$dumpvars();

	$display("Testing for what?     | In0 | In1 |ExpectSum|ActSum|COut| Overflow");

// Testing different possible test cases

//Pos + Pos < 7 | 2 + 4 = 6 | 2 = 0010 | 4 = 0100 | 6 = 0110 | NO OVERFLOW
    a = 4'b0010; b = 4'b0100; #1000 
    $display("Pos + Pos < 7, No OF  | %b  | %b | 0110 | %b | %b | %b ", a, b, sum, Cout, overflow);

//Pos + Pos < 7 | 1 + 6 = 7 | 1 = 0001 | 6 = 0110 | 7 = 0111 | NO OVERFLOW
    a = 4'b0001; b = 4'b0110; #1000 
    $display("Pos + Pos < 7, No OF  | %b  | %b | 0111 | %b | %b | %b ", a, b, sum, Cout, overflow);

//Pos + Neg > 0 | 5 + -3 = 2 | 5 = 0101 | -3 = 1101 | 2 = 0010 | NO OVERFLOW
    a = 4'b0101; b = 4'b1101; #1000 
    $display("Pos + Neg > 0, No OF  | %b  | %b | 0010 | %b | %b | %b ", a, b, sum, Cout, overflow);

//Pos + Neg > 0 | 2 + -1 = 1 | 2 = 0010 | -1 = 1111 | 1 = 0001 | NO OVERFLOW
    a = 4'b0010; b = 4'b1111; #1000 
    $display("Pos + Neg > 0, No OF  | %b  | %b | 0001 | %b | %b | %b ", a, b, sum, Cout, overflow);

//Pos + Neg < 0 | -8 + 3 = -5 | -8 = 1000 | 3 = 0011 | -5 = 1011 | NO OVERFLOW
    a = 4'b1000; b = 4'b0011; #1000 
    $display("Pos + Neg < 0, No OF  | %b  | %b | 1011 | %b | %b | %b ", a, b, sum, Cout, overflow);

//Pos + Neg < 0 | -4 + 2 = -2 | -4 = 1100 | 2 = 0010 | -2 = 1110 | NO OVERFLOW
    a = 4'b1100; b = 4'b0010; #1000 
    $display("Pos + Neg < 0, No OF  | %b  | %b | 1110 | %b | %b | %b ", a, b, sum, Cout, overflow);

//Pos + Neg = 0 | -5 + 5 = 0 | -5 = 1101 | 5 = 0101 | 0 = 0000 | NO OVERFLOW
    a = 4'b1101; b = 4'b0011; #1000 
    $display("Pos + Neg = 0, No OF  | %b  | %b | 0000 | %b | %b | %b ", a, b, sum, Cout, overflow);

//Pos + Neg = 0 | -7 + 7 = 0 | -7 = 1001 | 7 = 0111 | 0 = 0000 | NO OVERFLOW
    a = 4'b1001; b = 4'b0111; #1000 
    $display("Pos + Neg = 0, No OF  | %b  | %b | 0000 | %b | %b | %b ", a, b, sum, Cout, overflow);

//Neg + Neg > -8 | -3 + -4 = -7 | -3 = 1101 | -4 = 1100 | -7 = 1001 | NO OVERFLOW
    a = 4'b1101; b = 4'b1100; #1000 
    $display("Neg + Neg > -8, No OF | %b  | %b | 1001 | %b | %b | %b ", a, b, sum, Cout, overflow);

//Neg + Neg > -8 | -2 + -6 = -8 | -2 = 1110 | -6 = 1010 | -8 = 1000 | NO OVERFLOW
    a = 4'b1110; b = 4'b1010; #1000 
    $display("Neg + Neg > -8, No OF | %b  | %b | 1000 | %b | %b | %b ", a, b, sum, Cout, overflow);

//Pos + Pos > 7 | 5 + 6 = 11 | 5 = 0101 | 6 = 0110 |  | OVERFLOW
    a = 4'b0101; b = 4'b0110; #1000 
    $display("Pos + Pos > 7, OF     | %b  | %b | XX   | %b | %b | %b ", a, b, sum, Cout, overflow);

//Pos + Pos > 7 | 2 + 7 = 9 | 2 = 0010 | 7 = 0111 |  | OVERFLOW
    a = 4'b0010; b = 4'b0111; #1000 
    $display("Pos + Pos > 7, OF     | %b  | %b | XX   | %b | %b | %b ", a, b, sum, Cout, overflow);

//Pos + Pos > 7 | 7 + 7 = 14 | 7 = 0111 | 7 = 0111 |  | OVERFLOW
    a = 4'b0111; b = 4'b0111; #1000 
    $display("Pos + Pos > 7, OF    | %b  | %b | XX   | %b | %b | %b ", a, b, sum, Cout, overflow);

//Neg + Neg < -8 | -8 + -1 = -9 | -8 = 1000 | -1 = 1111 |  | OVERFLOW
    a = 4'b1000; b = 4'b1111; #1000 
    $display("Neg + Neg < -8, OF    | %b  | %b | XX   | %b | %b | %b ", a, b, sum, Cout, overflow);

//Neg + Neg < -8 | -8 + -3 = -11 | -8 = 1000 | -3 = 1101 |  | OVERFLOW
    a = 4'b1000; b = 4'b1101; #1000 
    $display("Neg + Neg < -8, OF    | %b  | %b | XX   | %b | %b | %b ", a, b, sum, Cout, overflow);

//Neg + Neg < -8 | -5 + -4 = -9 | -5 = 1011 | -4 = 1100 |  | OVERFLOW
    a = 4'b1011; b = 4'b1100; #1000 
    $display("Neg + Neg < -8, OF    | %b  | %b | XX   | %b | %b | %b ", a, b, sum, Cout, overflow);

end

endmodule

