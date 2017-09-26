// Adder circuit
// an adder is a type of snake!

`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module adder
(
    input a, 
    input b, 
    input carryin,
    output structsum, Cout
);

	wire AxorB;
	wire AandB;
	wire CAxorB;	

// Calculate sum
	`XOR xorgate1(AxorB, a, b);
	`XOR xorgate2(structsum, AxorB, carryin);

// Calculate carryout
	`AND andgate1(AandB, a, b);
	`AND andgate2(CAxorB, carryin, AxorB);
	`OR orgate1(Cout, AandB, CAxorB);	

endmodule

module FullAdder4bit
(
	output[3:0] sum,
	output carryout,
	output overflow,
	input[3:0] a,
	input[3:0] b   
);
 
	wire cout0; // carryout from first summation
	wire cout1; // carryout from second summation
	wire cout2; // carryout from third summation

// Full four bit adder is four adders in a row, where the carryout of the first is the carryin of the next
	adder gate0(a[0], b[0], 0, sum[0], cout0);
	adder gate1(a[1], b[1], cout0, sum[1], cout1);
	adder gate2(a[2], b[2], cout1, sum[2], cout2);
	adder gate3(a[3], b[3], cout2, sum[3], carryout);

// Overflow happens when the carryin to the most significant place is not equal to the carryout from that place
	`XOR xorgate(overflow, cout2, carryout);

endmodule

module forTesting();
//FullAdder4bit adder(.sum(res0), .carryout(cout), .overflow(ovf), .a(opA), .b(opB));
endmodule

