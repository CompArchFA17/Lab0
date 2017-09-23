`define AND and #50
`define XOR xor #50
`define OR or #50
`define BUF buf #50

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
    reg a0, b0, carryin0;
    wire carryout0;
    FullAdder1bit adder0 (sum[0], carryout0, a0, b0, carryin0);

    reg a1, b1;
    wire carryout1;
    FullAdder1bit adder1 (sum[1], carryout1, a1, b1, carryout0);

    reg a2, b2;
    wire carryout2;
    FullAdder1bit adder2 (sum[2], carryout2, a2, b2, carryout1);

    reg a3, b3;
    FullAdder1bit adder3 (sum[3], carryout, a3, b3, carryout2);

    `BUF buffer(overflow, carryout);
    
    initial begin
    a0 = a[0]; b0 = b[0]; carryin0 = 0;
    a1 = a[1]; b1 = b[1];
    a2 = a[2]; b2 = b[2];
    a3 = a[3]; b3 = b[3];
    end 
endmodule