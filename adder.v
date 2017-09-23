// 4 Bit Adder

// define gates with delays
`define XOR xor #50
`define AND and #50
`define OR or #50
`define NOT not #50
`define XNOR xnor #50

module FullAdder1bit
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    wire aandb, aorb;
    wire s, _carryin;
    wire outputIfCarryin, outputIf_Carryin;
    `XOR(s, a, b);
    `XOR(sum, s, carryin);
    `AND(aandb, a, b);
    `OR(aorb, a, b);
    `NOT(_carryin, carryin);
    `AND(outputIfCarryin, aandb, _carryin);
    `AND(outputIf_Carryin, aorb, carryin);
    `OR(carryout, outputIfCarryin, outputIf_Carryin);
endmodule

module HalfAdder
(
    output sum,
    output carryout,
    input a,
    input b
);
    FullAdder1bit adder (sum, carryout, a, b, 0);
endmodule

module FullAdder4bit
(
    output[3:0] sum,  // 2's complement sum of a and b
    output carryout,  // Carry out of the summation of a and b
    output overflow,  // True if the calculation resulted in an overflow
    input[3:0] a,     // First operand in 2's complement format
    input[3:0] b      // Second operand in 2's complement format
);
    wire Cout0, Cout1, Cout2;
    HalfAdder ha0 (sum[0], Cout0, a[0], b[0]);
    FullAdder1bit fa1 (sum[1], Cout1, a[1], b[1], Cout0);
    FullAdder1bit fa2 (sum[2], Cout2, a[2], b[2], Cout1);
    FullAdder1bit fa3 (sum[3], carryout, a[3], b[3], Cout2);
    `XNOR computeOverflow (overflow, sum[3], carryout);

endmodule
