`include "adder1.v"
`define XOR xor #50
`define XNOR xnor #50
`define AND and #50

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
    wire carry1, carry2, carry3;
    wire finalbit, c;
    oneBitAdder first (sum[0], carry1, a[0], b[0], 0);
    oneBitAdder second (sum[1], carry2, a[1], b[1], carry1);
    oneBitAdder third (sum[2], carry3, a[2], b[2], carry2);
    oneBitAdder fourth (sum[3], carryout, a[3], b[3], carry3);
    
    wire samesign, samecarry;
    `XNOR signtest(samesign, a[3], b[3]);
    `XOR carrytest(samecarry, carryout, sum[3]);
    `AND overflowtest(overflow, samesign, samecarry);

endmodule
