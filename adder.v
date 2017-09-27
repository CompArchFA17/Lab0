// Adder circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define XOR xor #50
`define NOT not #50

module behavioralFullAdder // remainder from HW2
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

module structuralFullAdder // Full Adder using XOR gates
(
    output sum, // Single bit inputs and outputs
    output carryout,
    input a, 
    input b, 
    input carryin
);

    wire ab; // Calculate the sum
    `XOR aXORb(ab, a, b);
    `XOR abXORc(sum, ab, carryin);

    wire aAndb, oneAndC; // Calculate the carryout (if it exists)
    `AND aANDb(aAndb, a, b);
    `AND aXORbANDc(oneAndC, ab, carryin);
    `OR aorborc(carryout, aAndb, oneAndC);
    
endmodule

module FullAdder4bit
(
  output[3:0] sum, // 2's complement sum of a and b
  output carryout, // Carry out of the summation of a and b
  output overflow, // True if calc resulted in overflow
  input[3:0] a,    // First operand in 2's complement format
  input[3:0] b     // Second operand in 2's complement format
);
    wire carry0, carry1, carry2; // The only additional wires connect the FullAdder components, carryout to carryin.

    structuralFullAdder add0 (sum[0], carry0, a[0], b[0], 0); // First adder will not have a carry in.
    structuralFullAdder add1 (sum[1], carry1, a[1], b[1], carry0);
    structuralFullAdder add2 (sum[2], carry2, a[2], b[2], carry1);
    structuralFullAdder add3 (sum[3], carryout, a[3], b[3], carry2); // Final adder has the last carryout 
    `XOR overflowCheck(overflow, carry2, carryout); // Returns 1 if there is overflow by comparing carryin and carryout of last adder
endmodule
