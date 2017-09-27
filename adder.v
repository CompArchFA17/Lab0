// Adder circuit
// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define NAND nand #50



module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule



// define XOR gate from primatives
// No delay is necessary since primatives already contain delay
module XOR
(
    output out,
    input in,
    input in1
);

wire nA;
wire nB;
wire AnB;
wire BnA;
`NOT(nA,in);
`NOT(nB,in1);
`AND(AnB,in,nB);
`AND(BnA,nA,in1);
`OR(out,AnB,BnA);
endmodule



module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire BCin;
    wire ACin;
    wire AB;

    wire BxorCin;

    `AND(BCin,b,carryin);
    `AND(ACin,a,carryin);
    `AND(AB, a, b);
    `OR(carryout,BCin,ACin,AB);

   XOR xor0(BxorCin,b,carryin);
   XOR xor1(sum,a,BxorCin);

endmodule


module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
    wire C0;
    wire C1;
    wire C2;
    wire carryout;
    wire carryin = 0;

    structuralFullAdder adder0(sum[0],C0,a[0],b[0],carryin);
    structuralFullAdder adder1(sum[1],C1,a[1],b[1],C0);
    structuralFullAdder adder2(sum[2],C2,a[2],b[2],C1);
    structuralFullAdder adder3(sum[3],carryout,a[3],b[3],C2);
    `NAND(overflow,carryout,C2);

endmodule