`define AND and #50
`define XOR xor #50
`define OR or #50

module FullAdder1bit
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire cout1;
    wire cout2;
    wire sumAB;

    `XOR AxorB(sumAB, a, b);
    `XOR sumABxorCin(sum, sumAB, carryin);

    `AND AandB(cout1, a, b);
    `AND sumABandCin(cout2, sumAB, carryin);

    `OR orcarries(carryout, cout1, cout2);
endmodule

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
    wire carryout0;
    FullAdder1bit adder0 (sum[0], carryout0, a[0], b[0], 1'b0);

    wire carryout1;
    FullAdder1bit adder1 (sum[1], carryout1, a[1], b[1], carryout0);

    wire carryout2;
    FullAdder1bit adder2 (sum[2], carryout2, a[2], b[2], carryout1);

    FullAdder1bit adder3 (sum[3], carryout, a[3], b[3], carryout2);

    `XOR oveflowdetection(overflow, carryout, carryout2);

endmodule