// define gates with delays
`define AND and #50
`define OR or #50
`define XOR xor #50
`define XNOR xnor #50
// Adder circuit

module myHalfAdder(
    output sum,
    output carryout,
    input a,
    input b
);
    `XOR axorb(sum,a,b);
    `AND aandb(carryout,a,b);
endmodule

module myFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    wire s1;
    wire c1;
    wire c2;
    myHalfAdder a1(s1,c1,a,b);
    myHalfAdder a2(sum, c2, s1, carryin);
    `OR (carryout, c1, c2);
endmodule

module FullAdder4bit
(
    output[3:0] sum,  // 2's complement sum of a and b
    output carryout,  // Carry out of the summation of a and b
    output overflow,  // True if the calculation resulted in an overflow
    input[3:0] a,     // First operand in 2's complement format
    input[3:0] b      // Second operand in 2's complement format
);
    wire c0;
    wire c1;
    wire c2;
    wire w0;
    wire w1;
    myHalfAdder a0(sum[0], c0, a[0], b[0]);
    myFullAdder a1(sum[1], c1, a[1], b[1], c0);
    myFullAdder a2(sum[2], c2, a[2], b[2], c1);
    myFullAdder a3(sum[3], carryout, a[3], b[3], c2);
    `XOR(w0, sum[3], carryout);
    `XNOR(w1, a[3], b[3]);
    `AND(overflow, w0, w1);
endmodule
